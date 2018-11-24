FROM ubuntu:18.04
LABEL maintainer="RyanLafferty"

# Install deps
RUN apt-get update && apt-get install -y gnupg curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | /bin/bash && apt-get install -y nodejs

# Define working directory
WORKDIR /app

# Install app deps
COPY ./app/package.json ./
RUN npm install

# Copy app
COPY ./app/app.js .

# Start app
EXPOSE 8080
CMD ["npm", "start"]