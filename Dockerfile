FROM nginx:alpine
LABEL maintainer="mail@zveronline.ru"

ADD conf/default.conf /etc/nginx/conf.d/
COPY . /srv/web