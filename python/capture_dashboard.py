from playwright.sync_api import sync_playwright

def capture_dashboard():
   with sync_playwright() as p:
       browser = p.chromium.launch(headless=True)
       page = browser.new_page()

       page.goto("https://client-dashboard.com/login")
       page.fill("#email", "client@example.com")
       page.fill("#password", "secret")
       page.click("button[type=submit]")
       page.wait_for_selector(".summary")

       page.screenshot(path="dashboard.png")
       browser.close()

capture_dashboard()