FROM node:lts AS build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

FROM nginx:alpine AS runtime

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 8080
