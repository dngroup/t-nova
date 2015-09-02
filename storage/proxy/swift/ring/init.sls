swift-proxy:
  pkg.installed: []
  service.running: 
    - requires:
        - sls: ring.artifacts-publication
        - sls: ring.artifacts-generation
    
    - watch:
        - file: /etc/swift/proxy-server.conf
        - file: /etc/swift/swift.conf
    
  
    
 
 

  
  
  
