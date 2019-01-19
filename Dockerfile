FROM alpine:3.8

RUN apk --update add lighttpd && rm -rf /var/cache/apk/*

COPY ./public /var/www/localhost/htdocs

RUN cd /etc/lighttpd &&\
    sed -e '/^server.modules = (/a"mod_openssl",' \
        -e '/^# server\.port/aserver.port = 443' \
        -e '/^# ssl.engine/assl.engine = "enable"' \
        -e '/^# ssl.pemfile/assl.pemfile = "/etc/ssl/certs/server.pem"' \
        -e '/^# ssl.pemfile/assl.ca-file = "/etc/ssl/certs/chain.pem"'\
        --in-place \
        lighttpd.conf &&\
        echo -e '#/bin/sh\n'\
                'cat /certs/privkey.pem /certs/cert.pem > /etc/ssl/certs/server.pem\n'\
                'cat /certs/chain.pem >/etc/ssl/certs/chain.pem\n'\
                'chmod 600 /etc/ssl/certs/*.pem\n'\
                'lighttpd -f /etc/lighttpd/lighttpd.conf\n'\
                'sleep 1\n'\
                'tail -f /var/log/lighttpd/error.log -f /var/log/lighttpd/access.log\n' > /start.sh &&\
        chmod +x /start.sh

EXPOSE 443

CMD "/start.sh"
