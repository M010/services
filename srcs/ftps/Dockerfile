FROM 		alpine:latest

#VOLUME [ "/sys/fs/cgroup" ]
RUN 		apk update
RUN 		apk add --no-cache vsftpd 
#openrc
#RUN 		openrc default

#RUN			rc-update add vsftpd default 
#RUN			rc-service vsftpd restart

COPY 		./srcs/vsftpd.conf		/etc/vsftpd/vsftpd.conf
COPY 		./srcs/vsftpd.sh		/vsftpd.sh

#RUN		mkdir /etc/nginx/ssl
#RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#			-out /etc/nginx/ssl/ftp.pem -keyout /etc/nginx/ssl/ftp.key \
#			-subj "/C=RF/ST=Msk/L=Moscow/O=21sch/OU=sbashir/CN=FTPS"
 
#ARG  			FTP_USER=ftp_usr
#RUN 			addgroup -g 433 -S $FTP_USER
#RUN 			adduser -u 431 -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false  $FTP_USER
RUN 			echo -e "123\n123\n" | adduser moh

RUN echo test_fr > test_file_root
RUN echo test_file > /home/moh/test_file
#CMD 			vsftpd /etc/vsftpd/vsftpd.conf
CMD 			/vsftpd.sh 
#/etc/vsftpd/vsftpd.conf

EXPOSE 	20	21 21000 

