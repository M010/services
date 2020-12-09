FROM alpine:latest

#COPY FROM SRC
RUN		mkdir -p        /var/www/html
RUN		mkdir -p        /run/nginx/	

WORKDIR		/tmp

#phpmyadmin download
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		mv phpMyAdmin*es/* /var/www/html/
#CLEAN
RUN		rm -rf /tmp/*

WORKDIR		/
#APK add utils
RUN		apk add --no-cache nginx openrc php7 php7-fpm php7-mysqli \ 
		                    php7-zlib php7-curl php7-mbstring \
		                    php7-json php7-session

#NGINX config
COPY		./srcs/nginx_conf /etc/nginx/conf.d/default.conf
COPY		./srcs/start.sh /

ENTRYPOINT      ["sh", "/start.sh"]
EXPOSE 		5000
