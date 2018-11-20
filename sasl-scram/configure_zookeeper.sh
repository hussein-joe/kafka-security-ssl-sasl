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