#!/usr/bin/env bash


docker exec -it zookeeper-1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name kafka

docker exec -it zookeeper-1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name admin

docker exec -it zookeeper-1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name confluent

docker exec -it zookeeper-1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name metricsreporter

docker exec -it zookeeper-1 kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name console-client


docker exec -it zookeeper-1 kafka-configs --zookeeper zookeeper-1:22181 --describe --entity-type users --entity-name kafka


docker run -it --rm -v ${KAFKA_SSL_SECRETS_DIR}/producer:/etc/kafka/secrets \
-v ${KAFKA_SASL_SCRAM_SECRETS_DIR}/zookeeper_client_jaas.conf:/etc/kafka/secrets/zookeeper_client_jaas.conf  \
--network kafka-cluster-network confluentinc/cp-kafka:5.0.1 export KAFKA_OPTS="-Djava.security.auth.login.config=/etc/kafka/secrets/conf/zookeeper_client_jaas.conf" \
&& kafka-configs --zookeeper zookeeper-1:22181 --alter --add-config \
'SCRAM-SHA-256=[iterations=4096,password=password],SCRAM-SHA-512=[iterations=4096,password=password]' \
--entity-type users --entity-name metricsreporter



 \
kafka-console-producer --broker-list kafka-broker-1:19094 --topic test \
--producer.config /etc/kafka/secrets/host.producer.sasl_scram.config