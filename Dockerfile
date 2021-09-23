FROM node:14
LABEL NAME="DockerImage for teste Junto Seguros"
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install

COPY . .
EXPOSE 8080
CMD [ "node", "server.js" ]