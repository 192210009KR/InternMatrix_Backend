import requests
import json

def test_gov_search():
    search_term = "IT"
    url = f"http://10.225.202.159:5000/get_government_internships?search={search_term}"
    
    try:
        response = requests.get(url, timeout=30)
        print(f"Status Code: {response.status_code}")
        if response.status_code == 200:
            internships = response.json()
            print(f"Found {len(internships)} government internships for '{search_term}'.")
            if internships:
                print("Top 3 results:")
                for i, intern in enumerate(internships[:3]):
                    print(f"{i+1}. {intern.get('title')} (Score: {intern.get('search_score')})")
                    print(f"   Link: {intern.get('official_link')}")
        else:
            print(f"Error: {response.text}")
    except Exception as e:
        print(f"Exception: {e}")

if __name__ == "__main__":
    test_gov_search()
