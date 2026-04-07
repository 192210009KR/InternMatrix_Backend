import requests
import json
import os

def test_chat():
    url = "http://localhost:5000/chat"
    payload = {"message": "Hello, are you working?"}
    try:
        response = requests.post(url, json=payload, timeout=30)
        print(f"Chat Status: {response.status_code}")
        try:
            print(f"Chat Response: {response.json()}")
        except:
            print(f"Chat Response (Raw): {response.text}")
    except Exception as e:
        print(f"Chat Exception: {e}")

def test_analyze():
    url = "http://localhost:5000/analyze_resume"
    file_path = r"c:\Internmatrix_Backend\uploads\resumes\user_1_kondareddy_resume.pdf"
    if not os.path.exists(file_path):
        print(f"Error: File not found at {file_path}")
        return

    try:
        with open(file_path, 'rb') as f:
            files = {'file': (os.path.basename(file_path), f, 'application/pdf')}
            response = requests.post(url, files=files, timeout=60)
            print(f"Analyze Status: {response.status_code}")
            try:
                print(f"Analyze Response: {response.json()}")
            except:
                print(f"Analyze Response (Raw): {response.text}")
    except Exception as e:
        print(f"Analyze Exception: {e}")

if __name__ == "__main__":
    print("Testing Chat...")
    test_chat()
    print("\nTesting Analysis...")
    test_analyze()
