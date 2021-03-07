FROM	alpine:3.12

RUN		apk update && \
		apk add openrc nginx
RUN		apk add --no-cache php7-common php7-session php7-fpm php7-mbstring php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN 	wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz -C /usr/share/ && \
    	rm latest.tar.gz && \
    	ln -s /usr/share/wordpress/ /var/www/wordpress

COPY	./srcs/setup.sh /root/
COPY	./srcs/wp-config.php /var/www/wordpress
COPY	./srcs/nginx.conf /etc/nginx/nginx.conf

RUN		chown -R nginx:nginx /var/www/wordpress && \
		chmod -R 777 /var/www/wordpress
RUN		chown -R nginx:nginx /var/www && \
		chmod -R 777 /var/www

EXPOSE	5050

CMD		sh /root/setup.sh