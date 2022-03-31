FROM openjdk:8-alpine
#FROM alpine:latest

# Rocketmq version
ENV ROCKETMQ_VERSION 4.8.0

# Rocketmq home
ENV ROCKETMQ_HOME  /home/rocketmq/rocketmq-${ROCKETMQ_VERSION}

WORKDIR  ${ROCKETMQ_HOME}

# Install
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache bash gettext curl  openjdk8-jre nmap-ncat openssl busybox-extras \
    && apk add --virtual .build-deps curl gnupg unzip \
    && curl -L https://mirrors.aliyun.com/apache/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip -o rocketmq.zip \
    #https://www.apache.org/dist/rocketmq/KEYS
    && unzip rocketmq.zip \
	&& mv rocketmq-all*/* . \
	&& rmdir rocketmq-all* \
	&& apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

# Copy customized scripts
COPY config/ ${ROCKETMQ_HOME}/bin/
COPY config/broker.conf /etc/rocketmq/broker.conf

# Expose namesrv port
EXPOSE 9876

# Override customized scripts for namesrv
RUN mv ${ROCKETMQ_HOME}/bin/runserver-customize.sh ${ROCKETMQ_HOME}/bin/runserver.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/runserver.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/mqnamesrv

# Expose broker ports
EXPOSE 10909 10911 10912

# Override customized scripts for broker
RUN mv ${ROCKETMQ_HOME}/bin/runbroker-customize.sh ${ROCKETMQ_HOME}/bin/runbroker.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/runbroker.sh \
 && chmod a+x ${ROCKETMQ_HOME}/bin/mqbroker

# Export Java options
RUN export JAVA_OPT=" -Duser.home=/opt"
#RUN export JAVA_OPT_EXT= "-Duser.home=/opt -Xms512M -Xmx512M -Xmn128m"

# Add ${JAVA_HOME}/lib/ext as java.ext.dirs
RUN sed -i 's/${JAVA_HOME}\/jre\/lib\/ext/${JAVA_HOME}\/jre\/lib\/ext:${JAVA_HOME}\/lib\/ext/' ${ROCKETMQ_HOME}/bin/tools.sh

WORKDIR ${ROCKETMQ_HOME}/bin

#ENTRYPOINT  ["mqbroker", "-c", "/etc/rocketmq/broker.conf"]
ENTRYPOINT  ["./start.sh"]