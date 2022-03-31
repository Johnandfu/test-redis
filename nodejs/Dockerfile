FROM  node:lts-alpine3.12
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
WORKDIR /var/vue-admin
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
    && apk --no-cache update \
    && apk --update add git composer python3 \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/apt/lists/* \
    &&  rm /var/cache/apk/*

#ENTRYPOINT ["composer", "config -g repo.packagist composer https://mirrors.aliyun.com/composer/"]
#CMD ["/bin/sh","npmstart.sh"]

EXPOSE 9527
