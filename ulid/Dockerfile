FROM golang:1.14.4-buster AS builder
ENV GOOS=linux \
    CGO_ENABLED=0 \
    GOARCH=amd64
RUN go get github.com/oklog/ulid/cmd/ulid && \
    strip /go/bin/ulid

FROM scratch

COPY --from=builder /go/bin/ulid /ulid
ENTRYPOINT [ "/ulid" ]
