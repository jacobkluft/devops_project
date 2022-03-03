# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

EXPOSE 5000

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /suv_reviews
COPY . /suv_reviews

# Creates a non-root user with an explicit UID and adds permission to access the /suv_reviews folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /suv_reviews
USER appuser


CMD [ "python3", "-m" , "flask", "run", "--host=127.0.0.1"]