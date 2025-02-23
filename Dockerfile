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