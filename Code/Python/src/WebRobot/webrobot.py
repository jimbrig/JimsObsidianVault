import time

from selenium import webdriver
from selenium.webdriver.common.keys import Keys


def web_robot():
    # Initialize the Chrome web driver
    bot = webdriver.Chrome("chromedriver.exe")

    # Open Google's homepage
    bot.get('http://www.google.com')

    # Locate the search input field and enter the desired search query
    search = bot.find_element_by_name('q')
    search.send_keys("@Python")

    # Perform the search by hitting the Enter key
    search.send_keys(Keys.RETURN)

    # Wait for the results to load (you can adjust the sleep duration as needed)
    time.sleep(5)

    # Close the web driver
    bot.quit()

if __name__ == "__main__":
    web_robot()
