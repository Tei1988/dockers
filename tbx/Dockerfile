FROM alpine:3.13 AS downloader

ENV TBX_VERSION=89.8.931

WORKDIR /tmp

RUN apk add wget unzip
RUN wget -L -O tbx.zip https://github.com/watermint/toolbox/releases/download/${TBX_VERSION}/tbx-${TBX_VERSION}-linux.zip
RUN echo "bc79624602fd363411e7e2751d020558845f269a630e608f40408581125f065c  tbx.zip" | sha256sum -c
RUN unzip tbx.zip

FROM alpine:3.13

COPY --from=downloader /tmp/* /
ENTRYPOINT [ "/tbx" ]
