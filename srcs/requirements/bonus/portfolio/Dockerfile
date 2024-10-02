FROM debian:11 AS BASE

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install lighttpd -y

COPY ./tools/ /

COPY ./conf/ /

WORKDIR /portfolio

ENTRYPOINT [ "lighttpd", "-D", "-f", "/lighttpd.conf"]
