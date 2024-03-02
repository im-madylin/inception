FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-client php7.4-fpm php-mysql curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin && \
    ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli

RUN mkdir -p /var/www/html/wordpress && \
    mkdir -p /run/php && \
    usermod -G www-data -a www-data && \
    chown -R www-data:www-data /var/www/

WORKDIR /var/www/html/wordpress

RUN rm -f /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/setting.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setting.sh

WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT [ "bash", "/usr/local/bin/setting.sh" ]