FROM  golang:alpine
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
WORKDIR /go/web/gin-admin
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
    && apk --no-cache update \
    && go env -w GO111MODULE=on \
    && go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct \
    && go get  github.com/acoshift/goreload \
    && openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out example.crt -keyout example.key -subj "/C=SI/ST=Ljubljana/L=Ljubljana/O=Security/OU=IT Department/CN=www.example.com"
CMD ["goreload"]
EXPOSE 9099 3000
