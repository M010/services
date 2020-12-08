openrc default
service mariadb setup
service mariadb start
mysql < create_wordpress_db.sql
mysql wordpress < wp.sql
sleep infinity
wait
