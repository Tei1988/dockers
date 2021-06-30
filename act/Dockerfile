FROM alpine:3.13 AS downloader

ENV ACT_VERSION=0.2.23

WORKDIR /tmp

RUN wget https://github.com/nektos/act/releases/download/v${ACT_VERSION}/act_Linux_$(arch).tar.gz -O ./act.tar.gz
RUN tar zxvf ./act.tar.gz

FROM alpine:3.13

WORKDIR /

RUN apk --no-cache add \
      ca-certificates

COPY --from=downloader /tmp/act /act
ENTRYPOINT [ "/act" ]
