FROM alpine:3.10 AS builder

ENV NGINX_SRC=nginx-1.19.0 \
    NGX_MRUBY_VERSION=v2.2.3
WORKDIR /tmp

RUN apk --update add \
      autoconf \
      automake \
      bison \
      build-base \
      flex \
      gawk \
      git \
      grep \
      libtool \
      patch \
      pkgconf \
      ruby-rake \
      sed \
      wget \
      linux-headers \
      fts-dev \
      gd-dev \
      geoip-dev \
      libedit-dev \
      libxslt-dev \
      musl-dev \
      perl-dev \
      pcre-dev \
      ruby-dev \
      openssl-dev \
      zlib-dev
RUN git clone --depth=1 https://github.com/matsumotory/ngx_mruby.git -b ${NGX_MRUBY_VERSION}
RUN git clone --depth=1 https://github.com/vision5/ngx_devel_kit.git
RUN wget -O ${NGINX_SRC}.tar.gz http://nginx.org/download/${NGINX_SRC}.tar.gz
RUN tar zxvf ${NGINX_SRC}.tar.gz

WORKDIR /tmp/ngx_mruby

RUN NGX_MRUBY_LIBS="fts" \
    BUILD_DYNAMIC_MODULE=1 \
    NGINX_SRC_ENV=/tmp/${NGINX_SRC} \
    NGINX_CONFIG_OPT_ENV="\
      --prefix=/etc/nginx \
      --sbin-path=/usr/sbin/nginx \
      --modules-path=/usr/lib/nginx/modules \
      --conf-path=/etc/nginx/nginx.conf \
      --error-log-path=/var/log/nginx/error.log \
      --http-log-path=/var/log/nginx/access.log \
      --pid-path=/var/run/nginx.pid \
      --lock-path=/var/run/nginx.lock \
      --http-client-body-temp-path=/var/cache/nginx/client_temp \
      --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
      --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
      --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
      --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
      --with-perl_modules_path=/usr/lib/perl5/vendor_perl \
      --user=nginx \
      --group=nginx \
      --with-compat \
      --with-file-aio \
      --with-threads \
      --with-http_addition_module \
      --with-http_auth_request_module \
      --with-http_dav_module \
      --with-http_flv_module \
      --with-http_gunzip_module \
      --with-http_gzip_static_module \
      --with-http_mp4_module \
      --with-http_random_index_module \
      --with-http_realip_module \
      --with-http_secure_link_module \
      --with-http_slice_module \
      --with-http_ssl_module \
      --with-http_stub_status_module \
      --with-http_sub_module \
      --with-http_v2_module \
      --with-mail \
      --with-mail_ssl_module \
      --with-stream \
      --with-stream_realip_module \
      --with-stream_ssl_module \
      --with-stream_ssl_preread_module \
      --with-cc-opt='-Os -fomit-frame-pointer' \
      --with-ld-opt=-Wl,--as-needed \
      --add-dynamic-module=/tmp/ngx_devel_kit" \
    ./build.sh
RUN strip /tmp/${NGINX_SRC}/objs/ndk_http_module.so && \
    strip /tmp/${NGINX_SRC}/objs/ngx_http_mruby_module.so
RUN mv /tmp/${NGINX_SRC}/objs/ndk_http_module.so /tmp/ndk_http_module.so && \
    mv /tmp/${NGINX_SRC}/objs/ngx_http_mruby_module.so /tmp/ngx_http_mruby_module.so

FROM nginx:1.19.0-alpine

RUN apk add --no-cache fts
COPY --from=builder /tmp/ndk_http_module.so /usr/lib/nginx/modules/ndk_http_module.so
COPY --from=builder /tmp/ngx_http_mruby_module.so /usr/lib/nginx/modules/ngx_http_mruby_module.so

ONBUILD COPY docker/hook /etc/nginx/hook
ONBUILD COPY docker/conf /etc/nginx
ONBUILD COPY docker/conf/nginx.conf /etc/nginx/nginx.conf
