FROM 		alpine:latest

VOLUME [ "/sys/fs/cgroup" ]
RUN 		apk update
RUN 		apk add --no-cache vsftpd openrc openssl pure-ftpd
#RUN 		apk add --no-cache pure-ftpd@testing
RUN 		openrc default

RUN			rc-update add vsftpd default 
RUN			rc-service vsftpd restart
#RUN			rc-service vsftpd restart

#ARG 		SITE=nginx
#ARG			SITE_DIR=/var/www/$SITE
#RUN 		mkdir -p $SITE_DIR 
#COPY 		./srcs/hello.html		/var/www/nginx/hello.html
##GET SSL
#RUN		mkdir /etc/nginx/ssl
#RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#			-out /etc/nginx/ssl/ftp.pem -keyout /etc/nginx/ssl/ftp.key \
#			-subj "/C=RF/ST=Msk/L=Moscow/O=21sch/OU=sbashir/CN=FTPS"
#
##nginx.config
#COPY		./srcs/nginx_conf /etc/nginx/conf.d/$SITE.conf
#RUN			rm -rf /etc/nginx/conf.d/default*
#
##RUN rc-update add nginx default
#CMD			service nginx start 
CMD sh
EXPOSE 		21

