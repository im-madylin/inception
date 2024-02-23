FROM alpine:3.17

RUN apk update
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
