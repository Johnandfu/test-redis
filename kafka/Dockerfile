FROM  alpine:3.12
ENV KAFKA_VERSION=2.7.0
ENV SCALA_VERSION=2.13​​​

LABEL name="kafka" version=${KAFKA_VERSION}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories\
  && apk add --no-cache bash coreutils tar openjdk11-jdk su-exec\ 
  && apk add --no-cache -t .build-deps curl ca-certificates jq \
  && mkdir -p /opt/kafka \
  && curl -s  --output /tmp/kafka.tgz https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.7.1/kafka_2.13-2.7.1.tgz \
  && tar -xvf /tmp/kafka.tgz --strip-components=1 --directory=/opt/kafka\
  && adduser -DH -s /sbin/nologin kafka \
  && chown -R kafka: /opt/kafka \
  && rm -rf /tmp/* \
  && apk del --purge .build-deps
VOLUME   /data
WORKDIR /opt/kafka
COPY config/server.properties /opt/kafka/config/server.properties
COPY config/kafka-run-class.sh /opt/kafka/bin/kafka-run-class.sh
COPY config/kafka-server-start.sh /opt/kafka/bin/kafka-server-start.sh
RUN chown -R kafka: /opt/kafka \
  && chmod +x /opt/kafka/bin/kafka-run-class.sh \
  && chmod +x /opt/kafka/bin/kafka-server-start.sh

ENTRYPOINT  ["/bin/bash","-c","/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties"]
#CMD [ "/opt/kafka/bin/kafka-server-start.sh", "/opt/kafka/config/server.properties" ]
EXPOSE 9092 9999
