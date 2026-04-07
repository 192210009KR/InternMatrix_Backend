import requests
import json

def test_recommendations():
    # We need a user_id that exists in the DB. Let's try user_id=1
    user_id = 1
    url = f"http://localhost:5000/get_recommended_internships?user_id={user_id}"
    
    try:
        response = requests.get(url, timeout=30)
        print(f"Status Code: {response.status_code}")
        if response.status_code == 200:
            recommendations = response.json()
            print(f"Found {len(recommendations)} recommended internships.")
            if recommendations:
                print("First recommendation:")
                print(f"  Title: {recommendations[0].get('title')}")
                print(f"  Company: {recommendations[0].get('company')}")
                print(f"  Match Score: {recommendations[0].get('match_score')}")
        else:
            print(f"Error: {response.text}")
    except Exception as e:
        print(f"Exception: {e}")

if __name__ == "__main__":
    test_recommendations()
