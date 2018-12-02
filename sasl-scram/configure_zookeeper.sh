#!/usr/bin/env bash


docker run -it --rm -v ${KAFKA_SSL_SECRETS_DIR}/producer:/etc/kafka/secrets \
-v ${KAFKA_SASL_SCRAM_SECRETS_DIR}/zookeeper_client_jaas.conf:/etc/kafka/secrets/zookeeper_client_jaas.conf  \
-e KAFKA_OPTS="-Djava.security.auth.login.config=/etc/kafka/secrets/zookeeper_client_jaas.conf" \
--network kafka-cluster-network confluentinc/cp-kafka:5.0.1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name metricsreporter

docker run -it --rm -v ${KAFKA_SSL_SECRETS_DIR}/producer:/etc/kafka/secrets \
-v ${KAFKA_SASL_SCRAM_SECRETS_DIR}/zookeeper_client_jaas.conf:/etc/kafka/secrets/zookeeper_client_jaas.conf  \
-e KAFKA_OPTS="-Djava.security.auth.login.config=/etc/kafka/secrets/zookeeper_client_jaas.conf" \
--network kafka-cluster-network confluentinc/cp-kafka:5.0.1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name kafkabroker

docker run -it --rm -v ${KAFKA_SSL_SECRETS_DIR}/producer:/etc/kafka/secrets \
-v ${KAFKA_SASL_SCRAM_SECRETS_DIR}/zookeeper_client_jaas.conf:/etc/kafka/secrets/zookeeper_client_jaas.conf  \
-e KAFKA_OPTS="-Djava.security.auth.login.config=/etc/kafka/secrets/zookeeper_client_jaas.conf" \
--network kafka-cluster-network confluentinc/cp-kafka:5.0.1 kafka-configs --zookeeper zookeeper-1:22181 \
--describe --entity-type users --entity-name kafkabroker