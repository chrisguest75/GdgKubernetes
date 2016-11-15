# This needs to be changed 
FROM hypriot/rpi-node
#FROM resin/rpi-raspbian:wheezy
MAINTAINER Chris Guest <chris.guest@magentys.io>

RUN apt-get update

RUN mkdir -p /work/src/github.com/hello

ENV LOCALGOVERSION=1.7.3
ENV BINARY=go$LOCALGOVERSION.linux-armv6l.tar.gz
# Should just copy the local binary across
RUN wget https://storage.googleapis.com/golang/$BINARY
RUN sudo tar -C /usr/local -xzf $BINARY
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=$HOME/work

COPY ./hello.go /work/src/github.com/hello/hello.go

RUN go install github.com/hello
WORKDIR /work

CMD ["./bin/hello"]
