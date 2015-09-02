/etc/swift/container.ring.gz:
  cmd.run:
    - name: "salt-call cp.push /etc/swift/container.ring.gz"
    
/etc/swift/account.ring.gz:
  cmd.run:
    - name: "salt-call cp.push /etc/swift/account.ring.gz"
    
/etc/swift/object.ring.gz:
  cmd.run:
    - name: "salt-call cp.push /etc/swift/object.ring.gz"
    

