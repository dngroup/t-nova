/etc/swift/proxy-server.conf:  
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://storage/proxy/swift/proxy-server.conf
    - makedirs: True

/etc/swift/swift.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://storage/proxy/swift/swift.conf
    - makedirs: True
