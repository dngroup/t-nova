

mypkgs:
  pkg.installed:
    - pkgs:
      - swift 
      - swift-proxy
      - python-swiftclient 
      - memcached

include:
  - .memcached
  - .ssh
  - .swift
