FROM alpine
ENV RIPGREP_VERSION=11.0.1
ADD https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl.tar.gz /dist/rg.tgz
RUN tar -C /usr/local/bin --strip-components 1 -xzf /dist/rg.tgz ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/rg

FROM scratch
COPY --from=0 /usr/local/bin/rg /
ENTRYPOINT ["/rg"]
