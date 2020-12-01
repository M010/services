FROM 		alpine:latest
RUN 		apk update

RUN 		mkdir /srcs

WORKDIR /srcs
RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN 		tar xfz telegraf-1.16.2_linux_amd64.tar.gz
RUN			rm *tar.gz
WORKDIR 	/srcs/telegraf-1.16.2

COPY 	 	./srcs/telegraf.conf  ./etc/telegraf
RUN 	 	ln -s $(pwd)/etc/telegraf  /etc/telegraf
RUN 	 	ln -s $(pwd)/usr/bin/telegraf  /bin/telegraf
RUN			apk add --no-cache libc6-compat

ENTRYPOINT 	["telegraf"]
