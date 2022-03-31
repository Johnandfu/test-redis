ARG ELK_VERSION=7.12.0

FROM  elasticsearch:6.8.2
#FROM elasticsearch:7.8.1
ADD https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.8.2/elasticsearch-analysis-ik-6.8.2.zip /tmp/
RUN elasticsearch-plugin install -b file:///tmp/elasticsearch-analysis-ik-6.8.2.zip

RUN rm -rf /tmp/*

EXPOSE 9200 9300
