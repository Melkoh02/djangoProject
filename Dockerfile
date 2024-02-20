# Use the official Python 3.10 image from Docker Hub
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install Poetry
RUN pip install poetry

# Copy the project files into the container
COPY pyproject.toml poetry.lock* /code/

# Configure Poetry and install dependencies
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

# Copy the rest of the project
COPY . /code/