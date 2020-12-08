FROM    alpine:latest

RUN     apk add --no-cache  mysql mysql-client openrc 

RUN     openrc default
COPY            ./srcs/start.sh /
COPY            ./srcs/my.cnf /etc/my.cnf
COPY            ./srcs/create_wordpress_db.sql /create_wordpress_db.sql

ENTRYPOINT ["sh", "/start.sh"]
