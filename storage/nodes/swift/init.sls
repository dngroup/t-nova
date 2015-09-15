/etc/swift/account-server.conf:
  file:
    - managed
    - source: salt://storage/nodes/swift/account-server.conf
    - template: jinja
    - makedirs: True
    - user: swift
    - group: swift
    - mode: 700
    - require: 
      - pkg: node swift dependencies

/etc/swift/container-server.conf:
  file:
    - managed
    - source: salt://storage/nodes/swift/container-server.conf
    - template: jinja
    - makedirs: True
    - user: swift
    - group: swift
    - mode: 700
    - require: 
      - pkg: node swift dependencies


/etc/swift/object-server.conf:
  file:
    - managed
    - source: salt://storage/nodes/swift/object-server.conf
    - template: jinja
    - makedirs: True
    - user: swift
    - group: swift
    - mode: 700
    - require: 
      - pkg: node swift dependencies

/var/salt/swift.conf.sh:
  file:
    - managed
    - source: salt://storage/nodes/swift/swift.conf.sh
    - name: /var/salt/swift.conf.sh
    - template: jinja
    - makedirs: True
    - user: swift
    - group: swift
    - mode: 700
  cmd:
    - run
    - require:
      - file: /etc/swift/object-server.conf
      - file: /etc/swift/container-server.conf
      - file: /etc/swift/account-server.conf

      

    
/etc/swift:
  file.directory:
    - user: swift
    - group: swift
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - cmd: /srv/salt/mount-loopback.sh
  
/srv/node/loop2:
  file:
    - directory
    - makedirs: True
    - recursive: True
    - user: swift
    - group: swift
    - require:
      - cmd: /var/salt/swift.conf.sh


/srv/salt/mount-loopback.sh:
  file:
    - managed
    - source:  salt://storage/nodes/swift/mount-loopback.sh
    - makedirs: True
    - mode: 700
  cmd:
    - run
    - require:
      - file: /srv/node/loop2
      - file: /srv/salt/mount-loopback.sh

/srv/node:
  file.directory:
    - user: swift
    - group: swift
    - makedirs: True
    - recurse:
      - user
      - group
    - watch:
      - cmd: /srv/salt/mount-loopback.sh

swift-account:
  service.running:
    - require: 
      - file: /etc/swift
swift-container :
  service.running:
    - require: 
      - file: /etc/swift 
      
      
swift-container-updater :
  service.running:
    - require: 
      - file: /etc/swift
swift-object-updater :
  service.running:
    - require: 
      - file: /etc/swift
swift-account-auditor:
  service.running:
    - require: 
      - file: /etc/swift
swift-container-auditor :
  service.running:
    - require: 
      - file: /etc/swift
swift-object :
  service.running:
    - require: 
      - file: /etc/swift
swift-account-reaper :
  service.running:
    - require: 
      - file: /etc/swift
swift-container-replicator :
  service.running:
    - require: 
      - file: /etc/swift
swift-object-auditor :
  service.running:
    - require: 
      - file: /etc/swift
swift-account-replicator :
  service.running:
    - require: 
      - file: /etc/swift
swift-container-sync :
  service.running:
    - require: 
      - file: /etc/swift
swift-object-replicator :
  service.running:
    - require: 
      - file: /etc/swift
