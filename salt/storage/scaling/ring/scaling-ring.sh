#!/usr/bin/env bash


## add all new swift node

{% for server, addrs in salt['mine.get']('roles:swift_object', 'network.ip_addrs', 'grain' ).items() %}
swift-ring-builder account.builder add r0z1-{{ addrs[0] }}:6002/loop2 10
swift-ring-builder container.builder add r0z1-{{ addrs[0] }}:6001/loop2 10
swift-ring-builder object.builder add r0z1-{{ addrs[0] }}:6000/loop2 10
{% endfor %}

# not use because if nothing this script is exec 2 time this is blocking
#until swift-ring-builder account.builder rebalance; do     echo "sleep 5min      date : $(date)";     sleep 300; done
#until swift-ring-builder container.builder rebalance; do     echo "sleep 5min      date : $(date)";     sleep 300; done
#until swift-ring-builder object.builder rebalance; do     echo "sleep 5min      date : $(date)";     sleep 300; done

swift-ring-builder account.builder rebalance
swift-ring-builder container.builder rebalance
swift-ring-builder object.builder rebalance

{% for server, addrs in salt['mine.get']('roles:swift_object', 'network.ip_addrs', 'grain' ).items() %}
scp -oStrictHostKeyChecking=no account.ring.gz {{ addrs[0] }}:/etc/swift/account.ring.gz
scp -oStrictHostKeyChecking=no container.ring.gz {{ addrs[0] }}:/etc/swift/container.ring.gz
scp -oStrictHostKeyChecking=no object.ring.gz {{ addrs[0] }}:/etc/swift/object.ring.gz
{% endfor %}

