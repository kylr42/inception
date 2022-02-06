FROM debian:buster

RUN apt-get update \
	&& apt -y install nginx openssl

COPY ./tools/entrypoint.sh /
COPY ./conf/default /etc/nginx/sites-enabled

ENTRYPOINT ["sh", "entrypoint.sh"]