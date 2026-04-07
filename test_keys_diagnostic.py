
import requests
import json

AI_KEYS = [
    "AIzaSyDcjF_0JVM93Fh_fMEAoUqsmmjPUE2TLw8",
    "AIzaSyD8AOP0iMXvkNc2ZQXSs6AuFAA6-o0xIyI",
    "AIzaSyCuvx2QRo5UAr5VZ2eqTQuiJUWSD7-vz2w",
    "AIzaSyCBFXHOzYLnjQq4s8RdwyKIRbvbine6JYM",
    "AIzaSyAV6LCwGVRX4W3VvA6pnlCXXO1Cn8gr3Qo"
]

models_to_try = [
    "models/gemini-1.5-flash", 
    "models/gemini-1.5-flash-8b",
    "models/gemini-2.0-flash"
]

def test_keys():
    for i, key in enumerate(AI_KEYS):
        print(f"\n--- Testing Key {i+1} ---")
        for model in models_to_try:
            url = f"https://generativelanguage.googleapis.com/v1beta/{model}:generateContent?key={key}"
            headers = {'Content-Type': 'application/json'}
            payload = {"contents": [{"parts": [{"text": "Say hello"}]}]}
            try:
                response = requests.post(url, headers=headers, json=payload, timeout=10)
                print(f"Model {model}: Status {response.status_code}")
                if response.status_code != 200:
                    print(f"Error: {response.text}")
                else:
                    print(f"Success!")
                    break 
            except Exception as e:
                print(f"Exception for {model}: {e}")

if __name__ == "__main__":
    test_keys()
