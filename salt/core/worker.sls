nherbaut/worker:
  docker.pulled:
    - tag: latest



{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}

  
core-worker-container:
  docker.installed:
    - name: core-worker-container
    - image: nherbaut/worker:latest
    - environment:
      - "CELERY_BROKER_URL" : "amqp://guest@{{ broker_ip }}"
      - "ST_AUTH" : "http://{{ swift_proxy_ip }}:8080/auth/v1.0"
      - "ST_USER" : "admin:admin"
      - "ST_KEY" : "admin"
    - watch:
      - docker: nherbaut/worker
      


core-worker:
  docker.running:
    - image: nherbaut/worker:latest
    - environment:
      - "CELERY_BROKER_URL" : "amqp://guest@{{ broker_ip }}"
      - "ST_AUTH" : "http://{{ swift_proxy_ip }}:8080/auth/v1.0"
      - "ST_USER" : "admin:admin"
      - "ST_KEY" : "admin"

    - watch:
      - docker: core-worker-container
