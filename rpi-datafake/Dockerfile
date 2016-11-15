# This needs to be changed 
FROM hypriot/rpi-python
#FROM resin/rpi-raspbian:wheezy
MAINTAINER Chris Guest <chris.guest@magentys.io>

RUN apt-get update

RUN mkdir -p /work

COPY ./FakeData /work/FakeData

WORKDIR /work/FakeData

CMD ["python", "main.py"]
