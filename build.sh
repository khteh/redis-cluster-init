#!/bin/bash
$(aws ecr get-login --no-include-email)
docker build -t redis-cluster-init .
docker tag redis-cluster-init:latest 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/redis-cluster-init:latest
docker push 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/redis-cluster-init:latest
docker tag redis-cluster-init:latest khteh/redis-cluster-init:latest
docker push khteh/redis-cluster-init:latest
