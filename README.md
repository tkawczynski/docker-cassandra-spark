# docker-cassandra-spark
Set of docker images for learning spark and Cassandra.

# Content
Docker images with spark and cassandra collocated in the same docker container and separate spark-master container 
# Images
- __spark-base__: common docker image with raw Spark 2.2.1
- __spark-master__: spark "master" node image
- __cassandra-spark-worker__: Cassandra 3.11 + Spark 2.2.1 worker node collocated in the same docker image
- __spark-shell__: small image for running spark-shell against cluster

# Scripts
- __build-all-images.sh__: helper script for building images locally
- __spark-shell.sh__: helper script for running spark-shell attached to cluster with spark-cassandra-connector package as dependency

# Basic Usage
1. Build images `./build-all-images.sh`

2. Use docker-compose `docker-compose run -d`

3. Start spark-shell `./spark-shell.sh`
