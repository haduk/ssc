# Use the official lightweight Python image as the base image
FROM python:3.9-slim as builder

# Set the working directory
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies in a virtual environment
RUN python -m venv /opt/venv

# Copy the requirements.txt file and install dependencies
COPY requirements.txt .
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Use a new minimal base image for the final stage
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the virtual environment from the builder stage
COPY --from=builder /opt/venv /opt/venv

# Copy the application code
COPY app.py .

# Ensure the virtual environment is used
ENV PATH="/opt/venv/bin:$PATH"

# Create a non-root user and switch to it
RUN useradd -m myuser
USER myuser

# Expose the application port
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
