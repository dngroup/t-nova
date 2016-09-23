#!/usr/bin/env bash
{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:worker', minealias,"grain") %}
{%- set Worker_ip= addrs.items()[0][1][0] %}

docker node update --availability pause $HOSTNAME
ssh -o StrictHostKeyChecking=no {{ Worker_ip }} 'docker node update --availability pause $HOSTNAME'

## docker kill -s SIGTERM do not propagate to celery because of bash charging venv
# for that we exec inside the container a kill and we get the first bahs (venv) and get only the pid to soft kill it

docker exec -it --user root $(docker ps -q) /bin/bash -c "kill -15 \$(ps -e | grep bash | head -n 1 | cut -b 4-6 )"