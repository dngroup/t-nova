install_all_server: # need to update the pillar after this
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

admission:
  salt.state:
    - tgt: 'roles:admission'
    - tgt_type: grain
    - sls:
      - core.admission
    - require:
      - salt: install_all_server

Frontend:
  salt.state:
    - tgt: 'roles:frontend'
    - tgt_type: grain
    - sls:
      - core.frontend
    - require:
      - salt: admission


updatemine:
  salt.state: #force update pillar
    - tgt: 'roles:controller'
    - tgt_type: grain
    - sls:
      - updatemine
    - require:
      - salt: install_all_server

worker:
  salt.state: # use the updated pillar
    - tgt: 'roles:worker'
    - tgt_type: grain
    - sls:
      - worker
    - require:
      - salt: updatemine
