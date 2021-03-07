FROM	alpine:3.12

RUN		apk update
RUN		apk add openrc openssl vsftpd --no-cache

# openssl
RUN		openssl req -newkey rsa:2048 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" \
		-keyout /etc/ssl/certs/localhost.key \
		-out /etc/ssl/certs/localhost.crt

COPY	./srcs/vsftpd.conf ./root/
COPY	./srcs/setup.sh ./root/

EXPOSE	20 21 10090

CMD		sh ./root/setup.sh