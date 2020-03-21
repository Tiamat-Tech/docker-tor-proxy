# docker: tor socks & dns proxy 🌐 🐳

docker hub: https://hub.docker.com/r/fphammerle/tor-proxy

signed tags: https://github.com/fphammerle/docker-tor-proxy/tags

```sh
$ docker run --rm --name tor-proxy \
    -p 127.0.0.1:9050:9050/tcp \
    -p 127.0.0.1:53:53/udp \
    fphammerle/tor-proxy
```

or after cloning the repository 🐙
```sh
$ docker-compose up
```

test proxies:
```sh
$ curl --proxy socks5h://localhost:9050 ipinfo.io
$ torsocks wget -O - ipinfo.io
$ torsocks lynx -dump https://check.torproject.org/
$ dig @localhost fabian.hammerle.me
$ ssh -o 'ProxyCommand nc -x localhost:9050 -v %h %p' abcdefghi.onion
# no anonymity!
$ chromium-browser --proxy-server=socks5://localhost:9050 ipinfo.io
```

isolate:
```sh
iptables -A OUTPUT ! -o lo -j REJECT --reject-with icmp-admin-prohibited
```

change `SocksTimeout` option:
```sh
$ docker run -e SOCKS_TIMEOUT_SECONDS=60 …
```
