# build environment
FROM node:16 as build
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
ENV REACT_APP_WEB_API=https://unicornapi.harrisonhomenetwork.co.uk

COPY package.json ./
COPY package-lock.json ./

RUN npm ci --silent
RUN npm install react-scripts@3.4.4 -g --silent

COPY . ./
RUN npm run build

# production environment
FROM nginx:stable-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]