FROM  alpine:3.13

ARG CMAK_VERSION="3.0.0.5"


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories\
    && apk add --no-cache bash coreutils tar su-exec openjdk11-jdk\ 
    && apk add --no-cache -t .build-deps curl unzip \
    && curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip \
    && unzip /tmp/cmak.zip -d / \
    && ln -s /cmak-$CMAK_VERSION /cmak \
    && rm -rf /tmp/cmak.zip \
    && rm -rf /tmp/* \
    && apk del --purge .build-deps

WORKDIR /cmak
COPY conf/application.conf  /cmak/conf/application.conf  
VOLUME   /data

#ENTRYPOINT ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]
CMD ["./bin/cmak","-Dconfig.path=conf/application.conf" ,"-Dhttp.port=9000"]

EXPOSE 9000
