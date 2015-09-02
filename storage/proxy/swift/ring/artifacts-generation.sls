/var/swift/build-ring.sh:
  file:
    - managed
    - name: /var/swift/build-ring.sh
    - source: salt://storage/proxy/swift/ring/build-ring.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
    - required_in: /var/swift/build-ring.sh
    - require:
      - sls : storage/proxy
    - required_in:
      - cmd: /etc/swift/object.ring.gz
      - cmd: /etc/swift/account.ring.gz
      - cmd: /etc/swift/container.ring.gz
  cmd.run:
    - cwd: /etc/swift
