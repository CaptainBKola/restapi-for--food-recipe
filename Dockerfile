# base image  
FROM python:3.9-alpine:latest

# setup environment variable  
ENV PYTHONUNBUFFERED 1 

# copy requirements.txt in local machine file to container
COPY ./requirements.txt /folder/requirements.txt

#copy app directory in local machine to container
COPY ./my-django-app /my-django-app

# switch to container working directory
WORKDIR /app

EXPOSE 8000


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip &&\
    /py/bin/pip install -r /folder/requirements.txt &&\
    rm -rf /folder &&\
    adduser \
        --disabled-password\
        --no-create-home \
        app-user
ENV PATH = "py/bin:$PATH"

USER app-user
 