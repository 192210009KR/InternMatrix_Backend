import requests
import json

AI_KEYS = [
    "AIzaSyDcjF_0JVM93Fh_fMEAoUqsmmjPUE2TLw8",
    "AIzaSyD8AOP0iMXvkNc2ZQXSs6AuFAA6-o0xIyI",
    "AIzaSyCuvx2QRo5UAr5VZ2eqTQuiJUWSD7-vz2w",
    "AIzaSyCBFXHOzYLnjQq4s8RdwyKIRbvbine6JYM",
    "AIzaSyAV6LCwGVRX4W3VvA6pnlCXXO1Cn8gr3Qo"
]

def test_v1_api():
    for i, key in enumerate(AI_KEYS):
        # Trying v1 instead of v1beta
        url = f"https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key={key}"
        headers = {'Content-Type': 'application/json'}
        payload = {"contents": [{"parts": [{"text": "hi"}]}]}
        
        try:
            response = requests.post(url, headers=headers, json=payload, timeout=30)
            print(f"Key {i+1} (v1): Status {response.status_code}")
            if response.status_code == 200:
                print(f"  Result: SUCCESS!")
                return
            elif response.status_code == 429:
                print(f"  Result: QUOTA EXHAUSTED")
            else:
                print(f"  Result: FAILED {response.text[:100]}")
        except Exception as e:
            print(f"Key {i+1} (v1): EXCEPTION {e}")

if __name__ == "__main__":
    test_v1_api()
