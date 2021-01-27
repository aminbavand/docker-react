#docker file for production environment
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- all the stuff
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#we don't need to start nginx, it will automatically start