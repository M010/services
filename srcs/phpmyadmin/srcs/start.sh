openrc          default
service   	php-fpm7	start
service         nginx		start

while sleep 1; do
  ps aux |grep php-fpm7 |grep -q -v grep
  PHP_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  NGINX_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PHP_STATUS -ne 0 -o $NGINX_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done
