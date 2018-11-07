FROM ubuntu:18.04
LABEL maintainer="RyanLafferty"

RUN apt-get update && apt-get install -y curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_9.x | /bin/bash && apt-get install -y nodejs

# TODO - antipattern - update
WORKDIR /app
COPY ./app/package.json ./
RUN npm install
RUN npm install nodemon -g

# TODO - antipattern - update
ADD ./app .

EXPOSE 8080
CMD ["nodemon", "start"]