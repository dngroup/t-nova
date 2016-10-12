install_all_server:
  salt.state:
    - tgt: '*'
    - highstate: True
    - reload_pillar: true


swift_object:
  salt.state:
    - tgt: 'roles:swift_object'
    - tgt_type: grain
    - sls:
      - storage/nodes
    - require:
      - salt: install_all_server

worker:
  salt.state:
    - tgt: 'roles:worker'
    - tgt_type: grain
    - sls:
      - worker
    - require:
      - salt: install_all_server
    - reload_pillar: true