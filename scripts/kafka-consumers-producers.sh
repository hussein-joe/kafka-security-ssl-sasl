#!/usr/bin/env bash

docker run -it -v ${KAFKA_SSL_SECRETS_DIR}:/etc/kafka/secrets confluentinc/cp-kafka:5.0.1 \
kafka-topics --zookeeper zookeeper-1:22181 --create --topic test --partitions 10 --replication-factor 3

docker run -it -v ${KAFKA_SSL_SECRETS_DIR}:/etc/kafka/secrets confluentinc/cp-kafka:5.0.1  kafka-console-producer \
--broker-list kafka-broker-1:19093,kafka-broker-2:29093,kafka-broker-3:39093 --topic test \
--producer.config /etc/kafka/secrets/host.producer.ssl.config