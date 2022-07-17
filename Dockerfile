FROM python:3.10-alpine3.16

ENV PYTHONUNBUFFERED 1

RUN mkdir /opt/code && mkdir /opt/configs

WORKDIR /opt/app

COPY app/ /opt/app

COPY requirements.txt /opt/configs/

RUN apk update && apk add --no-cache gcc libffi-dev zlib-dev && pip3 install -r /opt/configs/requirements.txt

RUN apk del gcc libffi-dev zlib-dev

EXPOSE 5000

VOLUME ["/opt/app", "/opt/configs/"]

ENTRYPOINT [ "python", "main.py" ]
