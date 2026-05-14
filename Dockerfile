FROM node:14-alpine AS build-stage
LABEL maintainer="mail@zveronline.ru"

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps
RUN npx grunt

FROM nginx:alpine AS production-stage
LABEL maintainer="mail@zveronline.ru"

COPY --from=build-stage /app/dist /srv/web
ADD conf/default.conf /etc/nginx/conf.d/