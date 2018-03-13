#!/bin/bash

export SPARK_HOME=/spark

. "/spark/sbin/spark-config.sh"
. "/spark/bin/load-spark-env.sh"

/spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
	--webui-port $SPARK_WORKER_WEBUI_PORT \
	spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT
