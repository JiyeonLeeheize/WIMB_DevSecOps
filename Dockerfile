FROM node:lts

WORKDIR /app

COPY ./code/package*.json ./
RUN npm install

COPY ./code/ .

EXPOSE 80
CMD ["node", "main.js"]