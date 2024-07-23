import requests

def check_application_status(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            print(f"The application is up (status code: {response.status_code})")
        else:
            print(f"The application is down (status code: {response.status_code})")
    except requests.ConnectionError:
        print("The application is down (Connection Error)")

if __name__ == "__main__":
    application_url = "http://your-application-url.com"  # Replace with your application URL
    check_application_status(application_url)
