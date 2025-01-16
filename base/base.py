from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class base:
    def __init__(self):
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        self.driver = webdriver.Chrome(options=chrome_options)

    def set_driver(self, driver):
        self.driver = driver

    def find_element(self, locator):
        wait = WebDriverWait(self.driver, 10)
        return wait.until(EC.presence_of_element_located(locator))  

    def find_All_element(self, locator):
        return self.driver.find_elements(locator)
    
        
    def calculation_of_total_amount(self,data, qty):
        return  data * qty

    def get_text_element(self,iframe_locator,locator):
        try:
            wait = WebDriverWait(self.driver, 10)
            iframe = wait.until(EC.presence_of_element_located((By.XPATH, iframe_locator)))
            self.driver.switch_to.frame(iframe)
            element = wait.until(EC.presence_of_element_located((By.XPATH, locator)))
            text = element.text.strip()
            self.driver.switch_to.default_content()
            return text
        except Exception as e:
            print(f"Error switching to iframe or finding element: {e}")
            self.driver.switch_to.default_content()
            raise  