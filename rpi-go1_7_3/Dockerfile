# This needs to be changed 
FROM resin/rpi-raspbian:wheezy
MAINTAINER Chris Guest <chris.guest@magentys.io>

RUN apt-get update

RUN mkdir -p /work/src/github.com

# Should just copy the local binary across
RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-armv6l.tar.gz
RUN sudo tar -C /usr/local -xzf go1.7.3.linux-armv6l.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

#ENV GOROOT=$HOME/go
#ENV PATH=$PATH:$GOROOT/bin
ENV GOPATH=$HOME/work

COPY ./hello.go /work/src/github.com/hello.go

RUN /usr/local/go/bin/go install github.com/hello
WORKDIR /work

CMD ["./bin/hello"]
