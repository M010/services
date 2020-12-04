FROM alpine:latest

#ARGS

#COPY FROM SRC
COPY		./srcs/set_up.sh /cnf/
#APT-GET utils 
RUN		apk add --no-cache nginx openrc
#                                        php7.3-fpm php7.3-common			\
#					php7.3-mysql php7.3-gmp			\
#					php7.3-curl php7.3-intl			\
#					php7.3-mbstring php7.3-xmlrpc		\
#					php7.3-gd php7.3-xml php7.3-cli		\ 
##					hp7.3-zip php7.3-soap php7.3-imap
#RUN             apk add                 lighttpd php7-common php7-iconv php7-json php7-gd       \
#                                        php7-curl php7-xml php7-mysqli php7-imap php7-cgi       \
#                                        fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc      \
#                                        php7-posix php7-mcrypt php7-gettext php7-ldap           \
#                                        php7-ctype php7-dom
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
COPY            ./srcs/config.inc.php /var/www/html

#CLEAN
RUN		rm -rf /tmp/*

ENTRYPOINT      ["sh", "/cnf/set_up.sh"]
EXPOSE 		5000
