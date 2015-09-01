base:
  '*':
    - storage
    
  'roles:swift_proxy':
    - match: grain
    - require:
      -  sls: storage
    - storage/proxy
    
  'roles:swift_object':
    - match: grain
    - require:
      -  sls: storage
    - storage/nodes

