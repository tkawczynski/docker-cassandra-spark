FROM ubuntu

RUN groupadd -r spark --gid=998 && useradd -g spark --uid=998 -m spark

RUN apt-get update && apt-get install -y wget \
        default-jdk \
        python2.7 > /dev/null 2>&1

RUN wget http://www-eu.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz > /dev/null 2>&1 \
        && tar -zxvf spark-2.2.1-bin-hadoop2.7.tgz >/dev/null 2>&1 \
        && rm spark-2.2.1-bin-hadoop2.7.tgz \
        && mv spark-2.2.1-bin-hadoop2.7 spark

RUN chown -R spark:spark /spark

