import requests
import json
import os
import pickle
import math
from config import Config

class SimpleRAGManager:
    """A pure-Python RAG manager that doesn't require FAISS or Numpy."""
    def __init__(self, index_path="internships_vectors.pkl"):
        self.index_path = index_path
        self.data = [] # List of {embedding: [...], metadata: {...}}
        self.load_index()

    def get_embedding(self, text):
        """Generate embedding using Gemini API"""
        keys = Config.AI_KEYS
        key = keys[0] # Use the first available key
        url = f"https://generativelanguage.googleapis.com/v1beta/models/text-embedding-004:embedContent?key={key}"
        
        try:
            payload = {
                "model": "models/text-embedding-004",
                "content": {"parts": [{"text": text}]}
            }
            response = requests.post(url, json=payload, timeout=15)
            if response.status_code == 200:
                return response.json()['embedding']['values']
            else:
                print(f"DEBUG: Embedding failed: {response.status_code} - {response.text}")
                return None
        except Exception as e:
            print(f"DEBUG: Embedding error: {e}")
            return None

    def cosine_similarity(self, v1, v2):
        """Calculate cosine similarity between two vectors."""
        dot_product = sum(a * b for a, b in zip(v1, v2))
        magnitude_v1 = math.sqrt(sum(a * a for a in v1))
        magnitude_v2 = math.sqrt(sum(a * a for a in v2))
        if magnitude_v1 == 0 or magnitude_v2 == 0:
            return 0
        return dot_product / (magnitude_v1 * magnitude_v2)

    def add_to_index(self, text, metadata):
        """Add a single item to the index"""
        embedding = self.get_embedding(text)
        if embedding is None:
            return False
            
        self.data.append({
            "embedding": embedding,
            "metadata": metadata
        })
        self.save_index()
        return True

    def search(self, query_text, top_k=5):
        """Search the index using cosine similarity"""
        if not self.data:
            return []
            
        query_embedding = self.get_embedding(query_text)
        if query_embedding is None:
            return []
            
        scored_results = []
        for item in self.data:
            score = self.cosine_similarity(query_embedding, item['embedding'])
            scored_results.append({
                "metadata": item['metadata'],
                "score": score
            })
            
        # Sort by score descending
        scored_results.sort(key=lambda x: x['score'], reverse=True)
        return scored_results[:top_k]

    def save_index(self):
        """Save vector data to disk"""
        with open(self.index_path, 'wb') as f:
            pickle.dump(self.data, f)

    def load_index(self):
        """Load vector data from disk"""
        if os.path.exists(self.index_path):
            try:
                with open(self.index_path, 'rb') as f:
                    self.data = pickle.load(f)
            except Exception as e:
                print(f"DEBUG: Failed to load index: {e}")
                self.data = []

# Global singleton
rag_manager = SimpleRAGManager()
