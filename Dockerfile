FROM alpine:3

ARG VERSION=0.44.0
COPY frp /frp
WORKDIR /frp
RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories          && \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS tzdata                                    && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime                                             && \
    echo "Asia/Shanghai" > /etc/timezone                                                            && \
    wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz  && \
    tar zxvf frp_${VERSION}_linux_amd64.tar.gz --strip-components=1                             && \
    rm -f frp_${VERSION}_linux_amd64.tar.gz                                                     && \
    apk del .build-deps tzdata
ENTRYPOINT ["./run"]
