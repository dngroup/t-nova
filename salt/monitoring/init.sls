collectd:
  pkg:
    - installed
  file:
    - managed
    - source: salt://monitoring/file/collectd.conf
    - name: /etc/collectd/collectd.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 700


/var/salt/update_uuid.sh:
  file:
    - managed
    - source: salt://monitoring/file/update_uuid.sh
    - name: /etc/collectd/update_uuid.sh
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - require:
      - pkg: collectd
