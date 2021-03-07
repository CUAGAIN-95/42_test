openrc boot && touch /run/openrc/softlevel 
adduser -D -g 'www' www

mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mkdir -p /run/nginx

mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
mv /root/nginx.conf /etc/nginx/nginx.conf
mv /root/index.html /www/index.html

nginx -g 'daemon off;'