FROM node:${NODE_VERSION}-alpine

RUN npm i -g yarn

RUN mkdir -p /app

WORKDIR /app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV

ONBUILD COPY package.json /usr/src/app/
ONBUILD COPY yarn.lock /usr/src/app/

ONBUILD RUN yarn install && yarn cache clean

ONBUILD COPY . /usr/src/app

CMD [ "yarn", "start" ]