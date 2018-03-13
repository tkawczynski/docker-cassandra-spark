#!/bin/bash
DOCKER_NETWORK=`docker network list | grep cassandra-spark | awk '{print $2}'`

docker run --network ${DOCKER_NETWORK} -it -p4040:4040 --rm spark-shell \
	--master spark://spark-master:7077 \
	--packages datastax:spark-cassandra-connector:2.0.7-s_2.11 $@
