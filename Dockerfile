FROM gliderlabs/alpine:3.1
ENTRYPOINT ["/bin/ssllabs-scan"]

COPY . /go/src/github.com/ssllabs/ssllabs-scan
RUN apk-install go ca-certificates \
    && cd /go/src/github.com/ssllabs/ssllabs-scan \
    && export GOPATH=/go \
    && go build -o /bin/ssllabs-scan \
    && rm -rf /go \
    && apk del go
