FROM	alpine:3.12

RUN		apk update && apk add influxdb

EXPOSE	8086

CMD		/usr/sbin/influxd run -config /etc/influxdb.conf