FROM python:3.8-slim-buster

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN apt-get update && apt-get -y install nginx

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["mlflow", "server", "-h", "0.0.0.0"]

EXPOSE 5000
