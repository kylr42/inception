FROM debian:buster

RUN apt-get update \
    && apt install -y mariadb-server

COPY ./conf/createdb.sql /
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN service mysql start && mysql < createdb.sql
RUN rm -f createdb.sql

CMD /usr/bin/mysqld_safe