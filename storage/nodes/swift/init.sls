/etc/swift/account-server.conf:
  file:
    - managed
    - source: salt://storage/nodes/swift/account-server.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700

/etc/swift/container-server.conf:
  file:
    - managed
    - source: salt://storage/nodes/swift/container-server.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700


/etc/swift/object-server.conf:
  file:
    - managed
    - source: salt://storage/nodes/swift/object-server.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700

/var/salt/swift.conf.sh:
  file:
    - managed
    - source: salt://storage/nodes/swift/swift.conf.sh
    - name: /var/salt/swift.conf.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    
    
  
  
