FROM debian:11 AS BASE

WORKDIR /proj

ARG CODE_PASS

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install curl -y \
    && curl -fsSL https://code-server.dev/install.sh | sh \
    && echo "bind-addr: 0.0.0.0:443\nauth: password\npassword: ${CODE_PASS}\ncert: true" > /.code-config.yaml

ENTRYPOINT [ "code-server", "--config", "/.code-config.yaml", "--open", "/proj"]
