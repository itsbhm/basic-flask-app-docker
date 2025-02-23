# Dockerized Flask Application

## Overview
This project is a simple Flask application that is containerized using Docker. The application provides a basic welcome message and a health check endpoint.

## Project Structure
```
/basic-flask-app-docker
│-- app.py
│-- run.py
│-- requirements.txt
│-- Dockerfile
```
- **app.py**: Defines the Flask application with two routes.
- **run.py**: Runs the Flask application on port 80.
- **requirements.txt**: Lists the dependencies required for the application.
- **Dockerfile**: Contains instructions for building the Docker image.

---

## Flask Application Details

### app.py
```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello Developers, Welcome to Dockerized Flask App!'

@app.route('/health')
def health():
    return 'Server is up and running'
```
This application has two endpoints:
- `/` - Returns a welcome message.
- `/health` - Returns a health status message.

### run.py
```python
from app import app

app.run(debug=True, host='0.0.0.0', port=8080)
```
This script starts the Flask application on **host 0.0.0.0** to make it accessible externally and binds it to port **8080**.

---

## Docker Configuration

### Dockerfile
```dockerfile
# Use the official slim Python 3.13.2 image as the base image
FROM python:3.13.2-slim

# Set the working directory in the container
WORKDIR /app

# Copy all files from the current directory to the container's working directory
COPY . .

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install dependencies listed in requirements.txt without caching to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# Set Python as the default command for the container
ENTRYPOINT ["python"]

# Specify the script to run when the container starts
CMD ["run.py"]
```

### Explanation:
1. `FROM python:3.13.2-slim` - Uses a lightweight Python 3.13.2 base image.
2. `WORKDIR /app` - Sets the working directory inside the container to `/app`.
3. `COPY . .` - Copies all application files into the container.
4. `RUN pip install --upgrade pip` - Upgrades `pip` inside the container.
5. `RUN pip install --no-cache-dir -r requirements.txt` - Installs dependencies efficiently.
6. `ENTRYPOINT ["python"]` - Specifies Python as the entrypoint.
7. `CMD ["run.py"]` - Runs `run.py` when the container starts.

---

## Docker Commands

### 1. Build the Docker Image
```sh
docker build -t basic-flask-app .
```
- `docker build` - Creates a Docker image.
- `-t basic-flask-app` - Tags the image with the name `basic-flask-app`.
- `.` - Refers to the current directory containing the Dockerfile.

### 2. Run the Docker Container
```sh
docker run -p 80:8080 basic-flask-app
```
- `docker run` - Runs a container from an image.
- `-p 80:8080` - Maps port **80** on the host to port **8080** inside the container.
- `basic-flask-app` - Specifies the image to run.

### 3. Run the Container in Detached Mode
```sh
docker run -d -p 80:8080 basic-flask-app
```
- `-d` - Runs the container in the background (detached mode).

### 4. Check Running Containers
```sh
docker ps
```
- Lists all running containers along with their container IDs.

### 5. View Container Logs
```sh
docker logs <CONTAINER_ID>
```
- Displays logs from the running container.

### 6. Attach to a Running Container
```sh
docker attach <CONTAINER_ID>
```
- Connects to the container’s running process.

### 7. Stop a Running Container
```sh
docker stop <CONTAINER_ID>
```
- Stops a running container gracefully.

### 8. Start a Stopped Container
```sh
docker start <CONTAINER_ID>
```
- Restarts a previously stopped container.

---

## Testing the Flask Application
Once the container is running, open your browser or use **curl** to test:

### Test the main route
```sh
curl http://localhost:80/
```
Expected response:
```
Hello Developers, Welcome to Dockerized Flask App!
```

### Test the health check route
```sh
curl http://localhost:80/health
```
Expected response:
```
Server is up and running
```

---

## License
This project is licensed under the **MIT License**. See the [LICENSE](./LICENSE) file for details.

---

## Conclusion
This guide provides a complete overview of how to build, run, and manage a Dockerized Flask application. You now have a fully functional, containerized Flask app running on Docker. 🎉

