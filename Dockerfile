FROM python:3.7

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y sudo vim && apt-get upgrade -y

COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip -r /requirements.txt

RUN mkdir /task_4
WORKDIR /task_4
COPY ./task_4 /task_4

RUN adduser --disabled-password --gecos '' python
RUN adduser python sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER python
