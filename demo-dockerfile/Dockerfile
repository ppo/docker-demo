# Python 3.6.3 on Alpine 3.6
# Dockerfile: https://github.com/docker-library/python/blob/master/3.6/alpine3.6/Dockerfile
# Usage: https://hub.docker.com/r/library/python/
FROM python:3.6.3-alpine3.6


# Ensure that Python outputs everything that's printed inside the application rather than buffering it.
ENV PYTHONUNBUFFERED 1


# Set the working directory according to Python image recommandations.
WORKDIR /usr/src/app

# Copy the build artifacts of this service.
COPY build/ ./

# Install dependencies.
RUN pip install -r requirements.txt


# Start this service.
ENTRYPOINT ["python", "app.py"]
