# Use the official Python base image
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .

# Install required Python packages
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/
# Expose the default Taipy port
EXPOSE 5000

# Run the application
CMD ["gunicorn", "--bind", "0.0.0:5000", "app:app"]