#!/usr/bin/env bash

docker -d --label type=worker
docker swarm init  --advertise-addr eth0
docker service create \
     --constraint 'type == worker' \
     --mode global \
     --name worker \
     -e CELERY_BROKER_URL=amqp://guest@{{ pillar['ips']['Frontend']['data'] }}/ \
     -e ST_AUTH=http://{{ pillar['ips']['Frontend']['data'] }}:8080/auth/v1.0 \
     -e ST_USER=admin:admin \
     -e ST_KEY=admin \
     dngroup/vhg-adaptation-worker
