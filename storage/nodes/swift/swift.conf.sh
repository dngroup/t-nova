{% set proxy_info =  salt['mine.get']('roles:swift_proxy', 'network.ip_addrs', 'grain' ).items()[0] %}
salt-call cp.get_file salt://{{ proxy_info[0] }}/etc/swift/swift.conf /etc/swift/swift.conf

