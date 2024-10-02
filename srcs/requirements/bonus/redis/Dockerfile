FROM debian:11 AS BASE 

ARG REDIS_PASS

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install redis-server -y \
  && sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf \
  && sed -i 's/protected-mode.*/protected-mode no/g' /etc/redis/redis.conf \
  && sed -i "s/# requirepass.*/requirepass \"${REDIS_PASS}\"/g" /etc/redis/redis.conf

ENTRYPOINT redis-server --requirepass ${REDIS_PASS}

