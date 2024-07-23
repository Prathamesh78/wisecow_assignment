# Application Health Checker

This repository contains a Python script to check the uptime of a web application. The script determines whether the application is functioning correctly by sending an HTTP request and checking the response status code.

## Prerequisites

- Python 3.x
- `pip` for Python 3

## Installation

1. **Install Dependencies**

   ```bash
   pip3 install requests
   ```

2. **Run the Script**

   ```bash
   python3 check_application_status.py
   ```

# Script Details

The script performs the following actions:

1. **Sends an HTTP GET request** to the specified URL.
2. **Checks the HTTP status code** of the response:
   - **200**: Application is 'up'.
     ![image](https://github.com/user-attachments/assets/66534e64-b91c-47b3-9124-2c64ea678f30)

   - **Any other status code**: Application is 'down'.
     ![image](https://github.com/user-attachments/assets/10856ece-1b9a-44b4-af8f-8e42fe6eda09)

3. **Handles connection errors gracefully**.
