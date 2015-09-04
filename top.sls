base:
  '*':
   - hostsfile
    
    
  'roles:swift_proxy':
    - match: grain
    - require:
      -  sls: storage
    - storage
    - storage/proxy
    
  'roles:swift_object':
    - match: grain
    - require:
      - sls: storage
    - watch:
      - sls: storage/nodes
    - storage
    - storage/nodes

  'roles:core':
    - match: grain
    - docker
    - core
    
  'roles:broker':
    - match: grain
    - core.broker
    
  'roles:worker':
    - match: grain
    - core.worker

  'roles:frontend':
    - match: grain
    - core.frontend
