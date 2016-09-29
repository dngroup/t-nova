install_all_server:
  salt.state:
    - tgt: '*'
    - highstate: True


swift_object:
  salt.state:
    - tgt: 'roles:swift_object'
    - tgt_type: grain
    - sls:
      - storage/nodes
    - require:
      - salt: install_all_server
