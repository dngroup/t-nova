
mypkgs:
  pkg.installed:
    - skip_verify: True
    - pkgs:
      - swift 
      - python-swiftclient 
      - swift-proxy

      
    

include:
  - .ssh
  - .swift
  - .memcached

