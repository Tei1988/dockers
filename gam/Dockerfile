FROM alpine AS stage

WORKDIR /tmp

RUN apk add curl xz
RUN curl -OL https://github.com/GAM-team/GAM/releases/download/v6.31/gam-6.31-linux-aarch64-legacy.tar.xz
RUN tar Jxfv ./gam-6.31-linux-aarch64-legacy.tar.xz
RUN chown -R root ./gam

FROM alpine

WORKDIR /

COPY --from=stage /tmp/gam/* /

ENTRYPOINT [ "/gam" ]
