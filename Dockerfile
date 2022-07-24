FROM python:3.10.5-alpine3.16

EXPOSE 5000

ENV PYTHONUNBUFFERED 1

ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /usr/src/code

COPY app/ .

RUN apk update && apk add --no-cache gcc libffi-dev zlib-dev && \ 
    pip3 install -r requirements.txt && \
    apk del gcc libffi-dev zlib-dev

VOLUME ["/usr/src/code"]

CMD ["python", "main.py"]
