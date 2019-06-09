#!/bin/bash
set -x
yes yes | redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')
redis-cli -h svc-redis-cluster cluster info
nodes=`kubectl get pods -l app=redis-cluster | grep redis-cluster | wc -l`
echo $nodes nodes
for x in $(seq 0 $(( --nodes )));
do 
  kubectl exec redis-cluster-$x -- /conf/fix-ip.sh;
  kubectl exec redis-cluster-$x -- redis-cli role; 
done
