# Use a base image with rasterio support
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies required for rasterio
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    libgdal-dev \
    gdal-bin \
    libexpat1 \
    libexpat1-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the default port
EXPOSE 8000

# Run the Flask app
CMD ["python", "app.py"]
