# Python 3.6.3 on Debian 9 Stretch Slim
# Dockerfile: https://github.com/docker-library/python/blob/master/3.6/stretch/slim/Dockerfile
# Usage: https://hub.docker.com/r/library/python/
FROM python:3.6.3-slim-stretch


# Ensure that Python outputs everything that's printed inside the application rather than buffering it.
ENV PYTHONUNBUFFERED 1


# Set the working directory according to Python image recommandations.
WORKDIR /usr/src/app

# Copy the build artifacts of this service.
COPY build/ ./

# Install dependencies.
RUN pip install -r requirements.txt

# Copy our shell scripts.
COPY bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh


# Start this service.
ENTRYPOINT ["entrypoint.sh"]
