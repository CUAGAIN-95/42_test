FROM	alpine:3.12

# base download
RUN		apk update && \
		apk add --no-cache mysql mysql-client openrc

# copy files
COPY	./srcs/setup.sh ./root/
COPY	./srcs/my.cnf ./root/
COPY	./srcs/mariadb-server.cnf ./root/
COPY	./srcs/wp_databases.sql .

EXPOSE	3306

CMD		sh ./root/setup.sh