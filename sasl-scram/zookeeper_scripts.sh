#!/usr/bin/env bash

docker exec -it zookeeper-1 echo stat | nc localhost 22181 | grep Mode
docker exec -it zookeeper-2 echo stat | nc localhost 32181 | grep Mode
docker exec -it zookeeper-3 echo stat | nc localhost 42181 | grep Mode