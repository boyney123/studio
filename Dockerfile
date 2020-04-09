FROM node:12

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# set default node environment
ENV NODE_ENV production

COPY . /usr/src/app

# Install app dependencies
RUN npm install

EXPOSE 5000

RUN npm install -g forever

CMD forever -c "npm start" ./