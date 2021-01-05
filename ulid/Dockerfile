FROM golang:1.15.6-buster AS builder
ENV GOOS=linux \
    CGO_ENABLED=0 \
    GOARCH=amd64 \
    GO111MODULE=on \
    ULID_VERSION=2.0.2
WORKDIR /tmp
RUN go mod init github.com/te1988/tools && \
    go get github.com/oklog/ulid/v2/cmd/ulid@v${ULID_VERSION} && \
    strip /go/bin/ulid

FROM scratch

COPY --from=builder /go/bin/ulid /ulid
ENTRYPOINT [ "/ulid" ]
