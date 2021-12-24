FROM debian:buster

RUN apt-get update \
	&& apt -y install nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled
COPY ./tools/entrypoint.sh /

ENTRYPOINT ["sh", "entrypoint.sh"]