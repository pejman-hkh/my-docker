FROM alpine:3.8

RUN apk --no-cache add supervisor curl php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mbstring php7-gd php7-imagick php7-redis php7-xdebug \
    php7-opcache php7-zip php7-pdo php7-pdo_mysql php7-tokenizer php7-fileinfo php7-pdo_mysql php7-simplexml \
    php7-xmlwriter php7-iconv composer php7-fileinfo tzdata;\
mkdir -p /usr/local/php81/sockets/;    

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]