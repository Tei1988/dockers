FROM alpine:3.12 AS downloader

ENV TBX_VERSION=79.4.762

WORKDIR /tmp

RUN apk add wget unzip
RUN wget -L -O tbx.zip https://github.com/watermint/toolbox/releases/download/79.4.762/tbx-${TBX_VERSION}-linux.zip
RUN echo "cfb2eafa41fe32f9b10e17d574bc819b0bf1c8a01ab6458043123a536a6f2afc  tbx.zip" | sha256sum -c
RUN unzip tbx.zip

FROM scratch

COPY --from=downloader /tmp/* /
ENTRYPOINT [ "/tbx" ]
