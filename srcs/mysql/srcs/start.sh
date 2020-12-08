openrc default
service mariadb setup
service mariadb start
mysql < create_wordpress_db.sql
#mysql -u        root --skip-password -e "CREATE DATABASE wordpress;"
#mysql -u        root --skip-password -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" &2>/dev/null
#mysql -u        root --skip-password -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('admin');FLUSH PRIVILEGES;" &2> /dev/null 
sleep infinity
wait
