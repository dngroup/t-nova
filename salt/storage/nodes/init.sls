node swift dependencies:
  pkg.installed:
    - pkgs:
      - swift 
      - swift-account 
      - swift-container 
      - swift-object 
      - xfsprogs 

xinetd:
  pkg: 
    - installed
  file:
    - managed
    - source: salt://storage/nodes/rsyncd.conf
    - name: /etc/rsyncd.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
    
    
xinetd-restart:
  service.running:
    - name: xinetd
    - watch: 
      - file: /etc/rsyncd.conf
    

include:
  - .swift
