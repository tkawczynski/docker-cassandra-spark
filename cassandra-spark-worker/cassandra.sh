#!/bin/bash

if [ -z "${CASSANDRA_LISTEN_ADDRESS}" ] || [ "${CASSANDRA_LISTEN_ADDRESS}" = 'auto' ]; then
	CASSANDRA_LISTEN_ADDRESS="$(hostname -i)"
fi

if [ -z "${CASSANDRA_SEEDS}" ] || [ "${CASSANDRA_SEEDS}" = 'auto' ]; then
	CASSANDRA_SEEDS="$(hostname -i)"
fi
sed -i "s/^listen_address:.*/listen_address: ${CASSANDRA_LISTEN_ADDRESS}/" /etc/cassandra/cassandra.yaml \
	&& sed -i "s/^broadcast_address:.*/broadcast_address: ${CASSANDRA_LISTEN_ADDRESS}/" /etc/cassandra/cassandra.yaml \
        && sed -i "s/- seeds:.*/- seeds: \"${CASSANDRA_SEEDS}\"/" /etc/cassandra/cassandra.yaml \
        && sed -i "s/^rpc_address:.*/rpc_address: 0.0.0.0/" /etc/cassandra/cassandra.yaml \
        && sed -i "s/.*broadcast_rpc_address:.*/broadcast_rpc_address: \"${CASSANDRA_LISTEN_ADDRESS}\"/" /etc/cassandra/cassandra.yaml


cassandra -f
