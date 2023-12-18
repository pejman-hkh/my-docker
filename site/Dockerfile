From pejmanhkh/alpine

RUN apk update;\
apk add --no-cache certbot aria2 nginx nodejs npm curl bash;\
mkdir -p /usr/local/data/certs;

EXPOSE 80 443

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]