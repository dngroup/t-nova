#!/usr/bin/env bash
{% set proxy_info =  salt['mine.get']('roles:swift_proxy', 'network.ip_addrs', 'grain' ).items()[0] %}


salt-call cp.get_file salt://{{ proxy_info[0] }}/etc/swift/swift.conf /etc/swift/swift.conf
salt-call cp.get_file salt://{{ proxy_info[0] }}/etc/swift/container.ring.gz /etc/swift/container.ring.gz
salt-call cp.get_file salt://{{ proxy_info[0] }}/etc/swift/object.ring.gz /etc/swift/object.ring.gz
salt-call cp.get_file salt://{{ proxy_info[0] }}/etc/swift/account.ring.gz /etc/swift/account.ring.gz

#scp -oStrictHostKeyChecking=no  {{ proxy_info[0] }}:/etc/swift/swift.conf /etc/swift/swift.conf
#scp -oStrictHostKeyChecking=no  {{ proxy_info[0] }}:/etc/swift/account.ring.gz /etc/swift/account.ring.gz
#scp -oStrictHostKeyChecking=no  {{ proxy_info[0] }}:/etc/swift/container.ring.gz /etc/swift/container.ring.gz
#scp -oStrictHostKeyChecking=no  {{ proxy_info[0] }}:/etc/swift/object.ring.gz /etc/swift/object.ring.gz
