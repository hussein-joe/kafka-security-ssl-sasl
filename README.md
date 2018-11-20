# Kafka security

Implementation of Kafka authentication and authorisation using different approaches.


## Run locally

Every directory has its own compose file and scripts to test. In the compose file
all services are using a network with name `kafka-cluster-network` which means,
all other containers outside the compose file could access Kafka and Zookeeper nodes by
being attached to this network. For example

```
docker run -it --network kafka-cluster-network confluentinc/cp-kafka:5.0.1 kafka-topics --zookeeper \ zookeeper-1:22181 --list
```
