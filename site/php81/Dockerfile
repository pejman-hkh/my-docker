From pejmanhkh/alpine

RUN apk update;\
apk add --no-cache curl php81 php81-fileinfo php81-xml php81-xmlreader php81-xmlwriter php81-phar php81-ftp php81-common php81-mysqlnd php81-pdo php81-pdo_dblib php81-pdo_odbc php81-pdo_mysql php81-pdo_sqlite php81-mbstring php81-gettext php81-iconv php81-zip php81-curl php81-dom php81-session php81-mysqli php81-gd php81-fpm bash;\
mkdir -p /usr/local/php81/sockets/; \
curl -s https://getcomposer.org/installer | php; \
mv composer.phar /usr/bin/composer

EXPOSE 9000

COPY lib/ctype.so /usr/lib/php81/modules/ctype.so
COPY lib/tokenizer.so /usr/lib/php81/modules/tokenizer.so
COPY lib/simplexml.so /usr/lib/php81/modules/simplexml.so
COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]