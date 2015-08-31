api:
  user.present:
    - password: $6$s83VS0R_$feNrFXG9vgFF/PtExwfbYmR0SBgGoPEUON8CzvHh/Vg.cyroKTgtzLaxrFFv5po41TZsLs2JZYA5ExR7RPNOG.


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
