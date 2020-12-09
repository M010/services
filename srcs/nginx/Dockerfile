FROM 		alpine:latest
RUN 		apk update
RUN 		apk add --no-cache nginx openrc openssl openssh 


ARG 		SITE=nginx
ARG		SITE_DIR=/var/www/$SITE
RUN 		mkdir -p $SITE_DIR 
RUN             mkdir -p        /run/nginx/
RUN                     echo -e "123\n123\n" | adduser user_ssh


COPY 		./srcs/hello.html		/var/www/nginx/hello.html

#GET SSL
RUN		mkdir /etc/nginx/ssl
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
			-out /etc/nginx/ssl/cert.pem -keyout /etc/nginx/ssl/key.key \
			-subj "/C=RF/ST=Msk/L=Moscow/O=21sch/OU=sbashir/CN=nginx-rout"

#nginx.config
COPY		./srcs/nginx_conf /etc/nginx/conf.d/$SITE.conf
RUN		rm -rf /etc/nginx/conf.d/default*
COPY            ./srcs/start.sh . 

ENTRYPOINT      ["sh", "/start.sh"]	
EXPOSE 		80 443 22
