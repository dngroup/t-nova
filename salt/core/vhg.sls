dngroup/adapted-video-osgi-bundle:
  dockerng.image_present:
    - force: True



{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}



vhg:
  dockerng.running:
    - image:  dngroup/adapted-video-osgi-bundle
    - port_bindings: "8080:8080"
    - environment:
      - "FRONTAL_PORT" : "5000"
      - "FRONTAL_HOSTNAME" : "{{ pillar['ips']['Frontend']['management'] }}"
    - require: 
      - dockerng: dngroup/adapted-video-osgi-bundle
