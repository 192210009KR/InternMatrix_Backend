import requests

def test_ncs_api(hostname):
    url = f"https://{hostname}/api/v1/job-posts/search?page=0&size=20"
    payload = {
        "sortBy": "RELEVANCE",
        "functionalAreas": ["Education", "Tutors and Teacher Aides"]
    }
    headers = {
        "Content-Type": "application/json",
        "Origin": f"https://{hostname}",
        "Referer": f"https://{hostname}/job-listing?functionalAreas=Education,Tutors%20and%20Teacher%20Aides",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
        "Accept": "application/json, text/plain, */*"
    }
    try:
        print(f"Testing {url}...")
        response = requests.post(url, json=payload, headers=headers, timeout=10)
        print(f"Status Code: {response.status_code}")
        if response.status_code == 200:
            print("Success!")
            # print(response.json())
        else:
            print(f"Error: {response.text[:200]}")
    except Exception as e:
        print(f"Failed: {e}")

if __name__ == "__main__":
    test_ncs_api("www.ncs.gov.in")
    print("-" * 20)
    test_ncs_api("betacloud.ncs.gov.in")
