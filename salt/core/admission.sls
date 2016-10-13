dngroup/vhg-adaptation-admission:
  dockerng.image_present:
    - force: True
    - name: dngroup/vhg-adaptation-worker


{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}

{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}
  

core-admission:
  dockerng.running:
    - image: dngroup/vhg-adaptation-worker
    - environment:
      - "CELERY_BROKER_URL" : "amqp://guest@{{ pillar['ips']['Frontend']['data'] }}"
      - "ST_AUTH" : "http://{{ pillar['ips']['Frontend']['data'] }}:8080/auth/v1.0"
      - "ST_USER" : "admin:admin"
      - "ST_KEY" : "admin"
      - "QUEUE" : "celery"
#salt issu https://github.com/saltstack/salt/issues/31595
    - user: user
    - restart_policy: always
    - require:
      - dockerng: dngroup/vhg-adaptation-admission


