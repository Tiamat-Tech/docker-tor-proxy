FROM alpine:3.12

ARG CURL_PACKAGE_VERSION=7.69.1-r0
ARG BIND_TOOLS_PACKAGE_VERSION=9.16.6-r0
ARG TOR_PACKAGE_VERSION=0.4.3.5-r0
RUN adduser -S onion \
    && apk add --no-cache \
        curl=$CURL_PACKAGE_VERSION \
        bind-tools=$BIND_TOOLS_PACKAGE_VERSION `# dig` \
        tor=$TOR_PACKAGE_VERSION

#RUN apk add --no-cache \
#        less \
#        man-db \
#        tor-doc=$TOR_PACKAGE_VERSION
#ENV PAGER=less

EXPOSE 9050/tcp
EXPOSE 9053/udp
COPY torrc.template entrypoint.sh /
ENV SOCKS_TIMEOUT_SECONDS=
ENTRYPOINT ["/entrypoint.sh"]
RUN chmod -c a+rX /torrc.template /entrypoint.sh

USER onion
CMD ["tor", "-f", "/tmp/torrc"]

HEALTHCHECK CMD \
    printf 'AUTHENTICATE\nGETINFO status/circuit-established\n' \
        | nc localhost 9051 | grep -q status/circuit-established=1 \
    && curl --silent --socks5 localhost:9050 https://google.com > /dev/null \
    && [ ! -z "$(dig -p 9053 +notcp +short one.one.one.one @localhost)" ] \
    || exit 1
