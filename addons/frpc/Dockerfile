ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV FRP_VERSION=0.61.1

WORKDIR /frp


RUN apk add --no-cache curl tar jq


RUN set -eux; \
    ARCH="$(uname -m)"; \
    if [ "$ARCH" = "aarch64" ]; then FRP_ARCH="arm64"; \
    elif [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "armv6l" ]; then FRP_ARCH="arm"; \
    elif [ "$ARCH" = "x86_64" ]; then FRP_ARCH="amd64"; \
    elif [ "$ARCH" = "i686" ]; then FRP_ARCH="386"; \
    else echo "Arquitetura não suportada: $ARCH" && exit 1; fi; \
    curl -L "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz" -o frp.tar.gz; \
    tar -xvzf frp.tar.gz --strip-components=1; \
    rm -f frp.tar.gz

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
