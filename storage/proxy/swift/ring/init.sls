generate /var/swift/build-ring.sh:
  file.managed:
    - name: /var/swift/build-ring.sh
    - source: salt://storage/proxy/swift/ring/build-ring.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
    - required_in: /var/swift/build-ring.sh
    - require:
      - sls : storage/proxy
  
    
/var/swift/build-ring.sh:
  cmd.run:
    - cwd: /etc/swift
 
  
/etc/swift:
  file.directory:
    - user: swift
    - group: swift
    - file_mode: 744
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      
    - required_in: swift-proxy

swift-proxy:
  service.running: []
 
 

  
  
  
