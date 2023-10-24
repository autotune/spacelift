import requests
from bs4 import BeautifulSoup

# Search query
query = "site:boards.greenhouse.io DevOps Engineer"

# Send GET request to Bing
response = requests.get(f"https://www.google.com/search?q={query}")

# Parse the HTML content of the page with BeautifulSoup
soup = BeautifulSoup(response.text, 'html.parser')

# Find all search results
results = soup.find_all('li', class_='b_algo')

print(results)

# Iterate over each result
for result in results:
    # Get the title and link of the result
    title = result.find('h2').text
    link = result.find('a')['href']

    # Print the title and link if it contains "DevOps Engineer"
    if "DevOps Engineer" in title:
        print(f"Job Title: {title}")
        print(f"Link: {link}\n")
