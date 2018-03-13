#!/bin/bash

export SPARK_HOME=/spark
export SPARK_MASTER_HOST=$(hostname -i)
. "/spark/sbin/spark-config.sh"
. "/spark/bin/load-spark-env.sh"

/spark/bin/spark-class org.apache.spark.deploy.master.Master \
	--ip $SPARK_MASTER_HOST \
	--port $SPARK_MASTER_PORT \
	--webui-port $SPARK_MASTER_WEBUI_PORT
	
