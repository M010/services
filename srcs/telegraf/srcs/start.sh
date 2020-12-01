##
cd /srcs
nginx -g "daemon off;" &
cd /srcs/influxdb-1.8.3-1
./influxd &
./influx -execute 'create database telegraf'
./influx -execute "create user telegraf with password 'hakase-ndlr'"

