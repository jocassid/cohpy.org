FROM python:3.14.2-alpine3.23

LABEL description="The Code for the cohpy.org website (just the python code, not the webserver or database)"

# Create the app directory
RUN mkdir /app && apk update && apk add postgresql18-dev

# Set the working directory inside the container
WORKDIR /app

# Set environment variables
# Prevents Python from writing pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1

# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

ENV DJANGO_SETTINGS_MODULE=config.settings.dev_lite

# Upgrade pip
RUN pip install --upgrade pip

COPY requirements.txt /app/

# run this command to install all dependencies
RUN pip install --no-cache-dir -r requirements.txt

COPY cohpy /app/

# Expose the Django port
EXPOSE 8000

# Run Django’s development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]