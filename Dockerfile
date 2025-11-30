# Use Python 3.11 (ADK requires 3.10+)
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy requirements and install dependencies
# We install google-adk explicitly in case it's missing from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir google-adk

# Copy the application code
COPY . .

# Cloud Run injects the PORT environment variable (default 8080)
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Start the ADK Web UI
# --host 0.0.0.0 is crucial for Cloud Run to receive traffic
# --port $PORT ensures it listens on the port Cloud Run expects
CMD ["sh", "-c", "adk web --host 0.0.0.0 --port $PORT ."]
