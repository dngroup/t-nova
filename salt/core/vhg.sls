dngroup/adapted-video-osgi-bundle:
  docker.pulled:
    - tag: latest



{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:broker', minealias,"grain") %}
{%- set broker_ip= addrs.items()[0][1][0] %}


{%- set addrs = salt['mine.get']('roles:swift_proxy', minealias,"grain") %}
{%- set swift_proxy_ip= addrs.items()[0][1][0] %}



vhg:
  docker.running:
    - image:  dngroup/adapted-video-osgi-bundle
    - ports:
      - "8080/tcp":
          HostIp: "0.0.0.0"
          HostPort: "8080"
    - environment:
      - "FRONTAL_PORT" : "5000"
      - "FRONTAL_HOSTNAME" : "{{ pillar['ips']['Frontend']['management'] }}"
    - require: 
      - docker: dngroup/adapted-video-osgi-bundle
