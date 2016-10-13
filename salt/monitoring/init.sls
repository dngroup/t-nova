

collectd-core:
  pkg:
    - installed
  file:
    - managed
    - source: salt://monitoring/file/collectd.conf
    - name: /etc/collectd/collectd.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 666

collectd:
  service.running:
    - enable: True
    - watch:
      - file: /etc/collectd/collectd.conf
#/var/salt/update_uuid.sh:
#  file:
#    - managed
#    - source: salt://monitoring/file/update_uuid.sh
#    - name: /var/salt/update_uuid.sh
#    - makedirs: True
#    - user: root
#    - group: root
#    - mode: 700
#  cmd:
#    - run
#    - require:
#      - pkg: collectd-core
