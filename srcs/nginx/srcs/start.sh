#!/bin/sh

openrc default
service sshd start
service nginx start
while sleep 1; do
  ps aux |grep sshd |grep -q -v grep
  SSHD_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  NGINX_STATUS=$?
  if [ $SSHD_STATUS -ne 0 -o $NGINX_STATUS -ne 0 ]; then
    ps -a
    echo "One of the processes has already exited."
    exit 1
  fi
done

