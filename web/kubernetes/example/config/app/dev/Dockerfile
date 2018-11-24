FROM ubuntu:18.04
LABEL maintainer="RyanLafferty"

# Install deps
RUN apt-get update && apt-get install -y curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_9.x | /bin/bash && apt-get install -y nodejs

# Define working directory
WORKDIR /app

# Install app deps
COPY ./app/package.json ./
RUN npm install
RUN npm install nodemon -g

# Copy app
COPY ./app/app.js .

# Start app
EXPOSE 8080
CMD ["nodemon", "start"]