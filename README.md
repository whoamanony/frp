frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet.

to see more about it please visit to <https://github.com/fatedier/frp>.

## image usage

image will run the client default, if you want to run server, please append 'server' arg to the docker run.

- run a client
```bash
docker run theanony/frp:0.44.0
```

- run a server
```bash
docker run theanony/frp:0.44.0 server
```

- custom the client config
```bash
docker run -v ./frpc.ini:/frp/frpc.ini:ro theanony/frp:0.44.0
```

- custom the server config
```bash
docker run -v ./frps.ini:/frp/frps.ini:ro theanony/frp:0.44.0 server
```
