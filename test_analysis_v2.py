import requests
import os

def test_analyze_resume():
    url = "http://localhost:5000/analyze_resume"
    file_path = r"c:\Internmatrix_Backend\uploads\resumes\user_1_kondareddy_resume.pdf"
    
    if not os.path.exists(file_path):
        print(f"Error: File not found at {file_path}")
        return

    print(f"Testing analyze_resume with file: {file_path}")
    
    try:
        with open(file_path, 'rb') as f:
            files = {'file': (os.path.basename(file_path), f, 'application/pdf')}
            response = requests.post(url, files=files, timeout=60)
            
            print(f"Status Code: {response.status_code}")
            try:
                print(f"Response Body: {response.json()}")
            except:
                print(f"Response Body (Raw): {response.text}")
                
    except Exception as e:
        print(f"Error during request: {e}")

if __name__ == "__main__":
    test_analyze_resume()
