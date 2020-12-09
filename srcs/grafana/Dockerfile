FROM 		        alpine:latest

RUN 		        apk update
RUN 		        apk add --no-cache openrc
RUN 		        mkdir -p /test
RUN 		        mkdir -p /dash
RUN			apk update

WORKDIR 	        /test

RUN			wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz
RUN			tar -zxvf grafana-6.7.2.linux-amd64.tar.gz
RUN			apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

WORKDIR 	        /test/grafana-6.7.2
COPY                    ./srcs/custom.ini               ./conf/
COPY                    ./srcs/datasources.yaml         ./conf/provisioning/datasources
COPY                    ./srcs/dashboards.yaml          ./conf/provisioning/dashboards
COPY                    ./srcs/dashboard.json           /dash

CMD                     ./bin/grafana-server
EXPOSE 		        8086
