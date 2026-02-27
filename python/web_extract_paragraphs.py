import requests
from bs4 import BeautifulSoup
from typing import List


URL = "https://www.mypage.com/article/12345"

def fetch_html(url: str, timeout: int = 10) -> str:
    headers = {
        "User-Agent": "Mozilla/5.0 (compatible; WebScraper/1.0)"
    }
    try:
        response = requests.get(url, headers=headers, timeout=timeout)
        response.raise_for_status() 
        return response.text

    except requests.exceptions.RequestException as e:
        raise RuntimeError(f"Error al obtener la página: {e}") from e


def extract_paragraphs(html: str) -> List[str]:
    soup = BeautifulSoup(html, "html.parser")
    content = soup.find("div", class_="article--viewer_content")

    if not content:
        return []

    return [
        p.get_text(strip=True)
        for p in content.find_all("p")
        if p.get_text(strip=True)
    ]


def main():
    try:
        html = fetch_html(URL)
        paragraphs = extract_paragraphs(html)

        if paragraphs:
            for p in paragraphs:
                print(p)
        else:
            print("No se encontró contenido del artículo.")

    except Exception as e:
        print(f"[ERROR] {e}")


if __name__ == "__main__":
    main()