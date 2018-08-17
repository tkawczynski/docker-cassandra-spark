#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if  hash docker 2>/dev/null; then
	docker build -t spark-base $SCRIPT_DIR/spark-base
	docker build -t spark-master $SCRIPT_DIR/spark-master
	docker build -t cassandra-spark-worker $SCRIPT_DIR/cassandra-spark-worker
	docker build -t spark-shell $SCRIPT_DIR/spark-shell
	docker build -t spark-zeppelin $SCRIPT_DIR/spark-zeppelin
else 
	echo "Docker not installed"
	exit 1
fi

