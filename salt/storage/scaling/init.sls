 
/var/swift/scaling-ring.sh:
  file:
    - managed
    - name: /var/swift/scaling-ring.sh
    - source: salt://storage/scaling/ring/scaling-ring.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - name: /var/swift/scaling-ring.sh
    - cwd: /etc/swift
    - require:
      - file: /var/swift/scaling-ring.sh

#salt-call cp.push /etc/swift/container.ring.gz:
#  cmd.wait: 
#    - watch:
#        - cmd: /var/swift/scaling-ring.sh
#
#
#salt-call cp.push /etc/swift/object.ring.gz:
#  cmd.wait: 
#    - watch:
#        - cmd: /var/swift/scaling-ring.sh
#
#
#salt-call cp.push /etc/swift/account.ring.gz:
#  cmd.wait: 
#    - watch:
#        - cmd: /var/swift/scaling-ring.sh
