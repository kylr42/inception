FROM debian:buster

RUN apt-get update && apt upgrade -y \
	&& apt-get -y install nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled
COPY ./tools/entrypoint.sh /

# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["sh", "entrypoint.sh"]