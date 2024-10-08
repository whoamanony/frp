Frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet.

Include the fp-multiuser plugin in this image, you can run it via a specific --entrypoint.

To see more about it please visit to <https://github.com/fatedier/frp>.

## image usage

- run a client
```bash
docker run -itd theanony/frp:0.60.0
```

- run a server
```bash
docker run -itd --entrypoint ./frps theanony/frp:0.60.0 -c frps.toml
```

- custom the client config
```bash
docker run -itd -v ./frpc.toml:/frp/config.toml:ro theanony/frp:0.60.0
```

- custom the server config
```bash
docker run -itd --entrypoint ./frps -v ./frps.toml:/frp/config.toml:ro theanony/frp:0.60.0 -c config.toml
```

- run fp-multiuser plugin
```bash
docker run -itd --entrypoint ./fp-multiuser -v ./tokens:/frp/tokens:ro theanony/frp:0.60.0 -l 0.0.0.0:7200 -f tokens
```