FROM node:16
# allow/specify environment variables
ENV REACT_APP_WEB_API=https://unicornapi.harrisonhomenetwork.co.uk

# set working directory
WORKDIR /app

# copy everything we care about across
COPY package*.json ./
COPY . .

# install modules
RUN npm install

# start development server
# TODO: we want to run nginx and have it serve a production/build
EXPOSE 3000
CMD ["npm", "start"]