#!/usr/bin/env bash
{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:worker', minealias,"grain") %}
{%- set Worker_ip= addrs.items()[0][1][0] %}

docker swarm join --token $(ssh -o StrictHostKeyChecking=no {{ Worker_ip }} 'docker swarm join-token worker -q')  {{ Worker_ip }}