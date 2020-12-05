FROM            alpine:latest

ARG             WORD_DIR=/var/www/html

RUN				mkdir -p        /var/www/html
RUN				mkdir -p        /run/nginx/

RUN				apk update && apk upgrade
RUN				apk add  --no-cache nginx openrc supervisor         \
                                    php7 php7-fpm php7-mysqli       \
                                    php7-zlib php7-curl             \
                                    php7-mbstring php7-json         \ 
                                    php7-session

RUN             wget                    https://wordpress.org/latest.tar.gz
RUN             tar -xzf                latest.tar.gz
RUN             mv wordpress 			$WORD_DIR
COPY            ./srcs/wp-config.php    $WORD_DIR/.
COPY            ./srcs/nginx_conf   	/etc/nginx/conf.d/default.conf

COPY            ./srcs/start.sh /cnf/

RUN             rm                      latest.tar.gz
ENTRYPOINT      ["sh",  "/cnf/start.sh"]
EXPOSE          80
