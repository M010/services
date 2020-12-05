FROM alpine:latest

#ARGS

#COPY FROM SRC
COPY		./srcs/start.sh /cnf/

#APT-GET utils 
RUN		apk add --no-cache nginx openrc
RUN		apk add php7 php7-fpm php7-mysqli \ 
		php7-zlib php7-curl php7-mbstring \
		php7-json php7-session

RUN		mkdir -p        /var/www/html
RUN		mkdir -p        /run/nginx/	

#NGINX config
COPY		./srcs/nginx_conf /etc/nginx/conf.d/default.conf
#RUN		ln -s /etc/nginx/sites-available/$SITE /etc/nginx/sites-enabled/$SITE
#RUN		rm -rf /etc/nginx/sites-enabled/default

WORKDIR		/tmp

#phpmyadmin
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN		mv phpMyAdmin*es/* /var/www/html/
#COPY            ./srcs/config.inc.php /var/www/html

#CLEAN
RUN		rm -rf /tmp/*

ENTRYPOINT      ["sh", "/cnf/start.sh"]
EXPOSE 		5000
