FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-server mariadb-client && \
    apt-get -y install vim

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# RUN rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


COPY ./tools/setting.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setting.sh

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "bash", "/usr/local/bin/setting.sh" ]