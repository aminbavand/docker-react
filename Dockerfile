#docker file for production environment
FROM node:alpine

WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- all the stuff
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#we don't need to start nginx, it will automatically start