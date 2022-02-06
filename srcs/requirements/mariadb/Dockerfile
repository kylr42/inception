FROM debian:buster

RUN apt-get update \
    && apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/entrypoint.sh /

ENTRYPOINT [ "sh", "entrypoint.sh" ]

CMD [ "mysqld_safe" ]
