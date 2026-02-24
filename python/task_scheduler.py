import schedule
import time
import logging

logging.basicConfig(
    filename="scheduler.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def job():
    try:
        logging.info("Automated task running...")
        
        #Other task logic
    except Exception as e:
        logging.error(f"Error en la tarea: {e}")

schedule.every().hour.do(job)

try:
    logging.info("Scheduler iniciado...")
    while True:
        schedule.run_pending()
        time.sleep(1)
except KeyboardInterrupt:
    logging.info("Scheduler detenido por el usuario.")