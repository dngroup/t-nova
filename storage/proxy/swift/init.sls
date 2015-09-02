/etc/swift:
  file:
    - directory
    - makedirs: True


swift-proxy:
  pkg.installed: []
  service.running:
    - require:
      - pkg: mypkgs
      - cmd: /var/swift/build-ring.sh
      
    - watch :
      - file: /etc/swift/proxy-server.conf
      - file: /etc/swift/swift.conf


/etc/swift/proxy-server.conf:
  file:
    - managed
    - source: salt://storage/proxy/swift/proxy-server.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 644


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

 
  
/var/swift/build-ring.sh:
  file:
    - managed
    - name: /var/swift/build-ring.sh
    - source: salt://storage/proxy/swift/ring/build-ring.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - name: /var/swift/build-ring.sh
    - cwd: /etc/swift
    - require:
      - file: /etc/swift/proxy-server.conf
      - file: /etc/swift/swift.conf
      - file: /etc/swift
      - pkg: swift-proxy

salt-call cp.push /etc/swift/container.ring.gz:
  cmd.wait: 
    - watch:
        - cmd: /var/swift/build-ring.sh


salt-call cp.push /etc/swift/object.ring.gz:
  cmd.wait: 
    - watch:
        - cmd: /var/swift/build-ring.sh


salt-call cp.push /etc/swift/account.ring.gz:
  cmd.wait: 
    - watch:
        - cmd: /var/swift/build-ring.sh
    
   
    


