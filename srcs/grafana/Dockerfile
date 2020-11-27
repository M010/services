FROM 		alpine:latest
RUN 		apk update
RUN 		apk add --no-cache nginx openrc openssl vim
RUN 		mkdir -p /run/nginx
RUN 		mkdir -p /test
RUN			apk update
WORKDIR 	/test
RUN			wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz
RUN			tar -zxvf grafana-6.7.2.linux-amd64.tar.gz
RUN			apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
WORKDIR 	/test/grafana-6.7.2
#CMD			nginx -g "daemon off;"	
CMD ./bin/grafana-server
#grafana
EXPOSE 		80 443 8086
