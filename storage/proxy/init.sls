
mypkgs:
  pkg.installed:
    - pkgs:
      - swift 
      - python-swiftclient 
      - swift-proxy

      
    

include:
  - .memcached
  - .ssh
  - .swift

