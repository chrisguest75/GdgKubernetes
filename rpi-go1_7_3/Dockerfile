FROM hypriot/rpi-node
MAINTAINER Chris Guest

RUN mkdir /work
RUN mkdir /work/src
RUN mkdir /work/src/github.com
RUN mkdir /work/src/github.com/user

RUN apt-get update
RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-armv6l.tar.gz
RUN sudo tar -C /usr/local -xzf go1.7.3.linux-armv6l.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
ENV GOROOT=$HOME/go
ENV PATH=$PATH:$GOROOT/bin
ENV GOPATH=$HOME/work

COPY ./hello.go /work/src/github.com/user/hello.go

RUN go install github.com/user/hello
WORKDIR /work

CMD ["./bin/hello"]
