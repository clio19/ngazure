FROM node:alpine AS my-app-build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=my-app-build /app/dist/ngazure /usr/share/nginx/html
EXPOSE 80


# FROM node:lts-alpine as angular
# ENV NODE_ENV=production
# WORKDIR /app
# COPY package.json ./app
# RUN npm install
# COPY . .
# RUN npm run build -- --prod

# FROM nginx:alpine
# VOLUME /var/cache/nginx
# COPY --from=angular app/dist/request-http /usr/share/nginx/html
# COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

# docker build -t ngazure
# docker run -p 8081:80 ngazure
