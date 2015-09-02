memcached:
  pkg: 
    - installed
  file:
    - managed
    - source: salt://storage/proxy/memcached/memcached.conf
    - name: /etc/memcached.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  service.running: 
    - require:
      - pkg: memcached
    - watch:
      - file: memcached
