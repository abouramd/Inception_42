FROM debian:11 AS BASE

EXPOSE 20 21

ARG FTP_USER FTP_PASS

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install vsftpd -y \
  && useradd -m -G www-data ${FTP_USER} && echo "${FTP_USER}:${FTP_PASS}" | chpasswd \
  && mkdir -p /var/run/vsftpd/empty \
  && mkdir -p /home/${FTP_USER}/wp

COPY ./conf/ftp.conf /etc/vsftpd.conf

ENTRYPOINT [ "vsftpd" ]
