base:
  '*':
    - storage
    
  'proxy*':
    - require:
      -  sls: storage
    - storage/proxy
    
  'object*':
    - require:
      -  sls: storage
    - storage/nodes/ssh

