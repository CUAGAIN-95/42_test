FROM	alpine:3.12

RUN		apk update
RUN		apk add --no-cache grafana --repository http://dl-3.alpinelinux.org/alpine/edge/community/

COPY	./srcs/grafana.ini /etc/
COPY	srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY 	./srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY	./srcs/all_dashboards.json /usr/share/grafana/public/dashboards/


EXPOSE	3000

CMD		/usr/sbin/grafana-server --config=/etc/grafana.ini --homepath=/usr/share/grafana
