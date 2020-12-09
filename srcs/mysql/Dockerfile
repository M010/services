FROM    alpine:latest

RUN     apk add --no-cache mysql mysql-client openrc 

COPY            ./srcs/start.sh /
COPY            ./srcs/wp.sql /
COPY            ./srcs/my.cnf /etc/my.cnf
COPY            ./srcs/create_wordpress_db.sql /create_wordpress_db.sql

ENTRYPOINT ["sh", "/start.sh"]
