FROM node:16

WORKDIR /app

# copy everything we care about across
COPY package*.json ./
COPY . .

RUN npm install

EXPOSE 3000
CMD ["npm", "start"]