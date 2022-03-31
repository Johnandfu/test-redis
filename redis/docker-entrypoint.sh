#!/bin/sh
eval redis-server /usr/local/etc/redis/redis.conf

if [ -n "$REDIS_NODES" ]; then
    for element in ${REDIS_NODES[@]}; do
        echo "$element"
        IP=$(getent hosts $element | awk '{print $1}')
        echo "$IP"
        if [ -n "$IP" ]; then
            if [ -z "$nodes" ]; then
                nodes="$IP:6379"
            else
                nodes="$nodes $IP:6379"

            fi
        fi
    done
    if [ -n "$nodes" ]; then
        echo "yes" | eval redis-cli --cluster create --cluster-replicas 1 "$nodes"
    fi
else
    
    exit 0
fi
