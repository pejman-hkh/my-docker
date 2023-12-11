From pejmanhkh/alpine

COPY run.sh /root/run.sh
RUN apk update;\
apk add --no-cache mariadb mariadb-client mariadb-server-utils bash;\
chmod +x /root/run.sh

EXPOSE 3306

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]