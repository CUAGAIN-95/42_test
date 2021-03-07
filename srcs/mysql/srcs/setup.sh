mv /root/my.cnf /etc/
mv /root/mariadb-server.cnf /etc/my.cnf.d/

# openrc boot
# rc-update add mariadb
# /etc/init.d/mariadb setup
# rc-service mariadb start

mysql_install_db --user=root --datadir=/var/lib/mysql

mysqld --user=root --bootstrap < wp_databases.sql

mysqld_safe --user=root --datadir=/var/lib/mysql

# sleep infinity && wait