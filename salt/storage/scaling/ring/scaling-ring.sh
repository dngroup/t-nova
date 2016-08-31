#!/usr/bin/env bash

## add all new swift node 
{% for server, addrs in salt['mine.get']('roles:swift_object', 'network.ip_addrs', 'grain' ).items() %}
swift-ring-builder account.builder add r0z1-{{ addrs[0] }}:6002/loop2 10
swift-ring-builder container.builder add r0z1-{{ addrs[0] }}:6001/loop2 10
swift-ring-builder object.builder add r0z1-{{ addrs[0] }}:6000/loop2 10
{% endfor %}

swift-ring-builder account.builder rebalance
swift-ring-builder container.builder rebalance
swift-ring-builder object.builder rebalance


{% for server, addrs in salt['mine.get']('roles:swift_object', 'network.ip_addrs', 'grain' ).items() %}
scp account.ring.gz {{ addrs[0] }}:/etc/swift/account.ring.gz
scp container.ring.gz {{ addrs[0] }}:/etc/swift/container.ring.gz
scp object.ring.gz {{ addrs[0] }}:/etc/swift/object.ring.gz
{% endfor %}

