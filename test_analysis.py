import requests
import os

def test_analyze_resume():
    url = "http://localhost:5000/analyze_resume"
    
    # Create a dummy text file if needed, but the endpoint expects .pdf or .docx
    # For testing, we might need a real small PDF or DOCX
    # Let's try to send a request without a file first to see if the server is up
    try:
        response = requests.post(url)
        print(f"Status Code (No file): {response.status_code}")
        print(f"Response: {response.json()}")
    except Exception as e:
        print(f"Connection error: {e}")

    # If we have a resume file in the uploads, let's try to use it
    # But wait, the endpoint extracts text and sends to AI.
    
if __name__ == "__main__":
    test_analyze_resume()
