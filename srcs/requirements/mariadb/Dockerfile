FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-server mariadb-client vim

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./tools/setting.sh /setting.sh
RUN chmod +x /setting.sh

ENTRYPOINT [ "sh", "/setting.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]