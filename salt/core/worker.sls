dngroup/vhg-adaptation-worker:
  docker.pulled:
    - tag: latest



{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}


core-worker:
  docker.running:
    - image: dngroup/vhg-adaptation-worker
    - environment:
      - "CELERY_BROKER_URL" : "amqp://guest@{{ pillar['ips']['CDN-LB']['data_in'] }}/"
      - "ST_AUTH" : "http://{{ pillar['ips']['CDN-LB']['data_in'] }}:8080/auth/v1.0"
      - "ST_USER" : "admin:admin"
      - "ST_KEY" : "admin"
