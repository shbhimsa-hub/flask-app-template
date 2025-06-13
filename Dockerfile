# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose Flask default port
EXPOSE 5050

# Set environment variables
ENV FLASK_APP=app:create_app
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development

# Start the Flask app
#CMD ["flask", "run"]
#CMD ["python", "-m", "flask", "run"]
CMD ["python", "-m", "flask", "run"]
