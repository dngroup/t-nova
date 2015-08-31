/root/.ssh/swift:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://storage/ssh_keys/swift

/root/.ssh/swift.pub:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://storage/ssh_keys/swift.pub
