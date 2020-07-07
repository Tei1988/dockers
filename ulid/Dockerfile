FROM golang:1.14.4-buster AS builder
ENV GOOS=linux \
    CGO_ENABLED=0 \
    GOARCH=amd64 \
    GO111MODULE=on \
    ULID_VERSION=v2.0.2
WORKDIR /tmp
RUN go mod init github.com/te1988/tools && \
    go get github.com/oklog/ulid/v2/cmd/ulid@${ULID_VERSION} && \
    strip /go/bin/ulid

FROM scratch

COPY --from=builder /go/bin/ulid /ulid
ENTRYPOINT [ "/ulid" ]
