FROM  node:current-alpine3.14
LABEL NAME="DockerImage for teste Junto Seguros"
WORKDIR /usr/src/app

COPY package.json ./
COPY server.js .

RUN npm install

EXPOSE 8080
CMD [ "node", "server.js" ]
