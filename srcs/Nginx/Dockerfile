FROM alpine:latest
RUN apk update
RUN apk add --no-cache nginx openrc
RUN openrc default
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN rc-update add nginx default
CMD service nginx start 
EXPOSE 80 443
