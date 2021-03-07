mkdir -p /www /run/nginx
chmod -R 777 /www
chown -R nginx /www
mv phpmyadmin /www/

php-fpm7
nginx -g "daemon off;"