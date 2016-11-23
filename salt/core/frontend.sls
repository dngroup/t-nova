dngroup/adapted-video-frontend:
  dockerng.image_present:
    - force: True
    - name: dngroup/adapted-video-frontend:t-nova-v1

dngroup/adapted-video-frontend-backup:
  dockerng.image_present:
    - force: True
    - name: dngroup/adapted-video-frontend:t-nova-v1
    - onfail:
      - dockerng: dngroup/adapted-video-frontend

{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}



core-frontend:
  dockerng.running:
    - image: dngroup/adapted-video-frontend:t-nova-v1
    - port_bindings: "5000:8080"
    - volumes:
      - "/root:/root:ro" 
    - environment:
      - "AMQP_PORT_5672_TCP_ADDR" : "{{ broker_ip }}"
      - "AMQP_PORT_5672_TCP_PORT" : "5672"
      - "STREAMER_URL" : " http://{{ pillar['ips']['Frontend']['Floating'] }}:8080/v1/AUTH_admin/"
      - "SWIFT_URL" : "http://{{ pillar['ips']['Frontend']['data'] }}:8080"
      - "TRANSCOD_PARAM_FILE" : "~/transcodeParam.json"
    - restart_policy: always
    - require: 
      - dockerng: dngroup/adapted-video-frontend
