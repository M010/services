FROM 		alpine:latest

RUN 		apk update && apk add --no-cache vsftpd openssl

COPY 		./srcs/vsftpd.conf		/etc/vsftpd/vsftpd.conf
COPY 		./srcs/vsftpd.sh		/vsftpd.sh

#RUN		mkdir /etc/ftps/ssl
#RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#			-out /etc/ftps/ssl/ftp.pem -keyout /etc/ftps/ssl/ftp.key \
#			-subj "/C=RF/ST=Msk/L=Moscow/O=21sch/OU=sbashir/CN=FTPS"
RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048	\
				-keyout /etc/ssl/private/vsftpd.pem				\ 
				-out /etc/ssl/private/vsftpd.pem				\	
				-subj "/C=RF/ST=Msk/L=Moscow/O=21sch/OU=sbashir/CN=FTPS"

RUN 		echo -e "sbashir\nsbashir\n" | adduser sbashir

RUN echo test_fr > test_file_root
RUN echo test_file > /home/sbashir/test_file

CMD				["vsftpd", "/etc/vsftpd/vsftpd.conf"]
EXPOSE 	20	21 21000 
