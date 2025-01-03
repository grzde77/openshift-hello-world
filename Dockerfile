# Use an official Python 3.9 image (Alpine-based is smaller)
FROM python:3.9

# Create a working directory inside the container
WORKDIR /usr/src/app

# Copy only requirements first, to leverage Docker layer caching
COPY requirements.txt ./

# Install required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Expose port 8080 (OpenShift convention)
EXPOSE 8080

# Set the default command to run your Flask app
CMD ["python", "app.py"]
