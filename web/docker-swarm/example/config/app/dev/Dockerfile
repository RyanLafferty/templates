FROM ubuntu:18.04
LABEL maintainer="RyanLafferty"

RUN apt-get update && apt-get install -y gnupg curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | /bin/bash && apt-get install -y nodejs

WORKDIR /app
COPY ./app/package.json ./
RUN npm install

ADD ./app .

EXPOSE 8080
CMD ["npm", "start"]