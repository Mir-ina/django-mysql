# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:rc-alpine

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
#ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
#ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN apk add --no-cache build-base && apk add --no-cache mariadb-connector-c-dev && pip install --no-cache-dir -r requirements.txt && apk del build-base

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# File wsgi.py was not found in subfolder: 'python-django'. Please enter the Python path to wsgi file.
CMD ["sh"]
