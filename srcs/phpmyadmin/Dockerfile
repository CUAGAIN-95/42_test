FROM	alpine:3.12

RUN		apk update
RUN		apk add openrc
RUN		apk add nginx 
RUN		apk add --no-cache php7-common php7-session php7-fpm php7-mbstring php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
		tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
		rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.2-all-languages phpmyadmin

COPY	./srcs/config.inc.php /phpmyadmin
COPY	./srcs/setup.sh /root/

COPY	./srcs/nginx.conf /etc/nginx

EXPOSE	5000
CMD		sh ./root/setup.sh