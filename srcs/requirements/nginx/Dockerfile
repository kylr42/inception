FROM debian:buster

LABEL name="Jimbo Siona"
LABEL email="<jsiona@student.21-school.ru>"

RUN apt update && apt upgrade -y
RUN apt-get -y install nginx openssl 

COPY ./conf/default /etc/nginx/sites-enabled
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]