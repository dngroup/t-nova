install_all_server: # update the pillar
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

updatemine:
  salt.state: # update pillar,
    - tgt: 'roles:controller'
    - tgt_type: grain
    - sls:
      - updatemine
    - require:
      - salt: install_all_server

worker:
  salt.state: # use the updated pillar, but it's still the old one...
    - tgt: 'roles:worker'
    - tgt_type: grain
    - sls:
      - worker
    - require:
      - salt: updatemine
