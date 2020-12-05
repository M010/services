FROM            alpine: latest

ARG             WORD_DIR=/var/www/html
RUN		apk update && apk upgrade
RUN		apk add  --no-cache nginx openrc supervisor         \
                                    php7 php7-fpm php7-mysqli       \
                                    php7-zlib php7-curl             \
                                    php7-mbstring php7-json         \ 
                                    php7-session
RUN             wget                    https://wordpress.org/latest.tar.gz
RUN             tar -xzf                latest.tar.gz
RUN             mv wordpress            $WORD_DIR
COPY            ./srcs/wp-config.php    $WORD_DIR
COPY            ./srcs/set_up.sh /cnf/
RUN             rm                      latest.tar.gz
ENTRYPOINT      ["sh",  "/cnf/set_up.sh"]
EXPOSE          80
