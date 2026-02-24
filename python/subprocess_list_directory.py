import subprocess
import platform
import os
import logging
import sys

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def list_files(directory: str):

    if not os.path.isdir(directory):
        logging.error("El directorio no existe o no es válido.")
        return

    if platform.system() == "Windows":
        command = ["cmd", "/c", "dir", directory]  # cmd /c dir carpeta
    else:
        command = ["ls", directory]

    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        logging.error("Error al ejecutar el comando.")
        logging.error(e.stderr)
    except Exception as e:
        logging.error(f"Error inesperado: {e}")

# Ejemplo de uso
# python script.py <ruta_del_directorio>