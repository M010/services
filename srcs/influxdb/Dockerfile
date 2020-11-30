FROM 		alpine:latest
#TODO DELETE NGINX!
RUN 		apk update
RUN 		apk add --no-cache nginx openrc openssl
RUN 		mkdir -p /run/nginx

RUN 		mkdir /srcs
COPY 		./srcs/start.sh /srcs
RUN 		chmod  777 ./srcs/start.sh

WORKDIR /srcs
RUN			wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz
RUN  		tar xfz influxdb-1.8.3-static_linux_amd64.tar.gz

RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN 		tar xfz telegraf-1.16.2_linux_amd64.tar.gz
RUN			rm *tar.gz
WORKDIR 	/srcs/influxdb-1.8.3-1
#RUN 		./influxd &
#RUN 		./influx -execute 'create database telegraf'
#RUN		./influx -execute "create user telegraf with password 'hakase-ndlr'"

WORKDIR 	/srcs/telegraf-1.16.2
#make config

RUN 	 	ln -s $(pwd)/etc/telegraf  /etc/telegraf
RUN 	 	ln -s $(pwd)/usr/bin/telegraf  /bin/telegraf
COPY 	 	./srcs/telegraf.conf  /etc/telegraf

#RUN		cp influxdb-2.0.2_linux_amd64/{influx,influxd} /usr/local/bin/
#CMD		nginx -g "daemon off;"
WORKDIR 	/srcs 
RUN			apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
CMD 		./start.sh
EXPOSE 		80 443 8086
