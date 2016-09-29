install all server:
  salt.state:
    - tgt: '*'
    - highstate: True


two:
  salt.state:
    - tgt: 'roles:swift_object'
    - sls:
      - storage/nodes
    - require:
      - salt: one
