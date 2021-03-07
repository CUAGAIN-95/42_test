FROM	alpine:3.12

# copy files
COPY	./srcs/setup.sh /root/
COPY	./srcs/index.html /root/
COPY	./srcs/nginx.conf /root/

# base download
RUN 	apk update && \
		apk add openrc nginx openssl --no-cache

# openssl
RUN		openssl req -newkey rsa:2048 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" \
		-keyout /etc/ssl/certs/localhost.key \
		-out /etc/ssl/certs/localhost.crt

EXPOSE	80 443

CMD		sh /root/setup.sh