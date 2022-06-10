FROM python:3.10.5-alpine3.16

LABEL maintainer="trydocker@gmail.com"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /requirements.txt

COPY ./app /app

WORKDIR /app

EXPOSE 8000

RUN python -m venv /venv && \
    /venv/bin/pip install -upgrade pip &&\
    /venv/bin/pip install -r requirements.txt && \
    adduser --disabled-pasword --no-create-home user

ENV PATH="/venv/bin:$PATH"

USER user