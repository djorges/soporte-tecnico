from pathlib import Path

def create_file(file_name: str, content: str) -> None:
    try:
        path = Path(file_name)

        path.parent.mkdir(parents=True, exist_ok=True)

        path.write_text(content, encoding="utf-8")

        print(f"[OK] Archivo '{file_name}' creado correctamente.")

    except Exception as e:
        print(f"[ERROR] No se pudo crear el archivo: {e}")


if __name__ == "__main__":
    FILE_NAME = "automated_file.txt"
    TEXT = "Hello! This is an automated file with text."
    create_file(FILE_NAME, TEXT)