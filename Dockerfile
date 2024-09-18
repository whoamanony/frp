FROM alpine:3
ARG VERSION=0.60.0
WORKDIR /frp
RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories                                              && \
    apk add --no-cache tzdata                                                                                                           && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime                                                                                 && \
    echo "Asia/Shanghai" > /etc/timezone                                                                                                && \
    mkdir -p /frp                                                                                                                       && \
    wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz      && \
    tar zxvf frp_${VERSION}_linux_amd64.tar.gz --strip-components=1                                                                     && \
    cp frpc.toml config.toml                                                                                                            && \
    rm -f frp_${VERSION}_linux_amd64.tar.gz                                                                                             && \
    apk del tzdata
ENTRYPOINT ["./frpc"]
CMD ["-c" "config.toml"]