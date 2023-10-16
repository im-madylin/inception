FROM alpine:3.17

RUN apk add nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

# CMD nginx -g 'daemon off;'

CMD [ "/bin/sh" ]
