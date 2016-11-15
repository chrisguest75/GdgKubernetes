FROM python:2.7
#FROM hypriot/rpi-python:2.7
MAINTAINER Chris Guest <chris.guest@magentys.io>

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade

RUN  apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /workbench

COPY FakeData/main.py /workbench
COPY FakeData/requirements.txt /workbench

RUN pip install virtualenv
RUN virtualenv /workbench/venv
RUN . /workbench/venv/bin/activate && pip install -r /workbench/requirements.txt && deactivate

ENV DBNAME myMeasures
ENV MEASURENAME myMeasurement
ENV CONTAINERNAME container
ENV DBURL 192.168.0.36
ENV DBPORT 8086
ENV DBUSER admin
ENV DBPASS admin

WORKDIR /workbench
#CMD 'bash'
RUN . /workbench/venv/bin/activate
CMD ["python", "main.py"]
