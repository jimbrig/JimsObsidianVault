# Ensure you have installed the "google" library using the following command:
# pip install google

from googlesearch import search


def extract_redirect_urls(query):
    search_results = search(query, num_results=10, lang="en", stop=10, pause=2.0)

    for url in search_results:
        print(url)

if __name__ == "__main__":
    search_query = "Python"
    extract_redirect_urls(search_query)
