nherbaut/adapted-video-frontend:
  docker.pulled:
    - tag: latest
    - require:
      - sls: docker


{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}



core-frontend:
  docker.running:
    - image:  nherbaut/adapted-video-frontend
    - ports:
      - "8080" : "8080"
    - environment:
      - "AMQP_PORT_5672_TCP_ADDR" : "{{ broker_ip }}"
      - "AMQP_PORT_5672_TCP_PORT" : "5672"
      - "STREAMER_PORT_8081_TCP_ADDR" : " {{ swift_proxy_ip }}"
      - "STREAMER_PORT_8081_TCP_PORT" : " 8080"
    - require: 
      - docker: nherbaut/adapted-video-frontend
