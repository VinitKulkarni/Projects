# Use official Python image as a base image
FROM python:3.9-slim

LABEL MAINTAINER="VINIT KULKARNI"

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt (we will create it in the next step)
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose port 5000 to be accessed from outside the container
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
