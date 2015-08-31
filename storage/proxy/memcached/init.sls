/etc/memcached.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://storage/proxy/memcached/memcached.conf

