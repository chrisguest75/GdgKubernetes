FROM hypriot/rpi-node
#FROM node
MAINTAINER Chris Guest

RUN npm install

EXPOSE 8080

RUN mkdir /work

COPY ./server.js /work/server.js

WORKDIR /work

CMD ["node", "server.js"]
