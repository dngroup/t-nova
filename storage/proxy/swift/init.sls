/etc/swift/proxy-server.conf:
  file:
    - managed
    - source: salt://storage/proxy/swift/proxy-server.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
    


/etc/swift/swift.conf:
  file:
    - managed
    - name: /etc/swift/swift.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://storage/proxy/swift/swift.conf
    - makedirs: True
  cmd:
    - run
    - name: 'salt-call cp.push "/etc/swift/swift.conf"'
    
