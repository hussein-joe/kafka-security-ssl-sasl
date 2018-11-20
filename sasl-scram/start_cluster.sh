#!/usr/bin/env bash

export KAFKA_SSL_SECRETS_DIR=/Users/husseinjoe/Hussein/SampleProjects/Kafka/kafka-security-ssl-sasl/secrets
export KAFKA_SASL_SCRAM_SECRETS_DIR=/Users/husseinjoe/Hussein/SampleProjects/Kafka/kafka-security-ssl-sasl/sasl-scram/secrets
docker-compose -f docker-compose-scram.yml up -d
