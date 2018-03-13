FROM spark-base

# Install supervisor

RUN apt-get update && apt-get install -y supervisor > /dev/null 2>&1
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Spark Worker

EXPOSE 8081

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077

ADD worker.sh /

RUN chmod +x /worker.sh

# Cassandra

EXPOSE 9042

ENV CASSANDRA_LISTEN_ADDRESS auto
ENV CASSANDRA_SEEDS auto

RUN groupadd -r cassandra --gid=999 && useradd -r -g cassandra --uid=999 cassandra

RUN apt-get install -y curl > /dev/null 2>&1
RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list \
	&& curl https://www.apache.org/dist/cassandra/KEYS | apt-key add - \
	&& apt-get update > /dev/null 2>&1\
	&& apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA \
	&& apt-get update > /dev/null 2>&1 \
	&& apt-get install -y cassandra > /dev/null 2>&1

RUN chown -R cassandra:cassandra /etc/cassandra

ADD cassandra.sh /
RUN chmod +x /cassandra.sh

# Starter command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
