FROM golang:1.15.6-buster AS builder
ENV GOOS=linux \
    CGO_ENABLED=0 \
    GOARCH=amd64 \
    GO111MODULE=on \
    PUP_VERSION=0.4.0
WORKDIR /tmp
RUN go mod init github.com/te1988/tools && \
    go get github.com/ericchiang/pup@v${PUP_VERSION} && \
    strip /go/bin/pup

FROM scratch

COPY --from=builder /go/bin/pup /pup
ENTRYPOINT [ "/pup" ]
