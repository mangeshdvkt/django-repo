FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Prevent Python from writing pyc files
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# Run gunicorn server
CMD ["gunicorn", "deployDj.wsgi:application", "--bind", "0.0.0.0:8000"]