#!/bin/bash
set -x
yes yes | redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')
redis-cli -h svc-redis-cluster cluster info
