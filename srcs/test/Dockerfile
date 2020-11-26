FROM 		alpine:latest
#TODO DELETE NGINX!
RUN 		apk update
RUN 		apk add --no-cache nginx openrc openssl
RUN 		mkdir /test/
RUN 		mkdir -p /run/nginx
WORKDIR /test
RUN			wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN 		tar xf telegraf-1.16.2_linux_amd64.tar.gz
#RUN		cp influxdb-2.0.2_linux_amd64/{influx,influxd} /usr/local/bin/
RUN			wget https://dl.influxdata.com/influxdb/releases/influxdb-2.0.2_linux_amd64.tar.gz
RUN			tar xf influxdb-2.0.2_linux_amd64.tar.gz
#RUN		cp influxdb-2.0.2_linux_amd64/{influx,influxd} /bin/
CMD			nginx -g "daemon off;"
EXPOSE 		80 443 8086
