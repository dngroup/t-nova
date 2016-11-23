dngroup/vhg-adaptation-worker:
  dockerng.image_present:
    - force: True
    - name: dngroup/vhg-adaptation-worker:t-nova-v1

dngroup/vhg-adaptation-worker-backup:
  dockerng.image_present:
    - force: True
    - name: dngroup/vhg-adaptation-worker:t-nova-v1
    - onfail:
      - dockerng: dngroup/vhg-adaptation-worker


{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}


core-worker:
  dockerng.running:
    - image: dngroup/vhg-adaptation-worker:t-nova-v1
    - environment:
      - "CELERY_BROKER_URL" : "amqp://guest@{{ pillar['ips']['Frontend']['data'] }}/"
      - "ST_AUTH" : "http://{{ pillar['ips']['Frontend']['data'] }}:8080/auth/v1.0"
      - "ST_USER" : "admin:admin"
      - "ST_KEY" : "admin"
    - user: user