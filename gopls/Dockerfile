FROM golang:1.24.5 AS builder
ENV CGO_ENABLED=0
WORKDIR /tmp
RUN go install -ldflags="-extldflags=-static -w -s" -trimpath golang.org/x/tools/gopls@v0.19.1
RUN strip /go/bin/gopls

FROM golang:1.24.5

COPY --from=builder /go/bin/gopls /gopls
ENTRYPOINT [ "/gopls" ]
