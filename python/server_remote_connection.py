from fabric import Connection, task

server_address = "your_server_address"
server_username = "your_username"
server_password = "your_password"

@task
def uptime(c):
   with Connection(server_address, user=server_username, connect_kwargs={"password": server_password}) as conn:
       result = conn.run("uptime")
       print(result.stdout)

@task
def disk_space(c):
   with Connection(server_address, user=server_username, connect_kwargs={"password": server_password}) as conn:
       result = conn.run("df -h")
       print(result.stdout)

@task
def list_processes(c):
   with Connection(server_address, user=server_username, connect_kwargs={"password": server_password}) as conn:
       result = conn.run("ps aux")
       print(result.stdout)

@task
def deploy(c):
   print("Deploying application...")

@task
def custom_task(c):
   print("Executing custom task...")


# To run a specific task, use the command: fab <task_name>
# fab uptime
# fab disk_space
# fab list_processes