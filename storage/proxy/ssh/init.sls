openssh-client:
  pkg.installed

/etc/ssh/sshd_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://storage/proxy/ssh/sshd_config

ssh keys installed:
  ssh_auth.present:
    - user: root
    - source: salt://storage/ssh_keys/swift.pub
