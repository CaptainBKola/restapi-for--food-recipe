# base image  
FROM python:3.9-alpine3.13

# setup environment variable  
ENV PYTHONUNBUFFERED 1 

# copy requirements.txt in local machine file to container
COPY ./requirements.txt /temp/requirements.txt

#copy app directory in local machine to container
COPY ./recipe-app /recipe-app

# switch to container working directory
WORKDIR /recipe-app

EXPOSE 8000


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip &&\
    /py/bin/pip install -r /temp/requirements.txt &&\
    rm -rf /temp &&\
    adduser \
        --disabled-password\
        --no-create-home \
        my-app-user

ENV PATH = "py/bin:$PATH"

USER my-app-user
 