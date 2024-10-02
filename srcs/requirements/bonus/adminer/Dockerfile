FROM debian:11 AS BASE

WORKDIR /usr/share/adminer/

COPY --chmod=777 ./tools/* /

RUN /adminer_build.sh

ENTRYPOINT [ "php-fpm7.4", "-F" ]
