FROM	alpine:3.12

RUN		apk update
RUN		apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf

COPY	srcs/telegraf.conf /etc/
COPY	srcs/setup.sh /root/

RUN		chmod +x /root/setup.sh

CMD		sh /root/setup.sh

