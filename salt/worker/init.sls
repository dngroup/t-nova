{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:worker', minealias,"grain") %}
{%- set Worker_ip= addrs.items()[0][1][0] %}
{%- set key = salt['mine.get']('roles:controller', 'key_swarm', expr_form='grain')  %}



/etc/default/docker:
  file:
    - managed
    - source: salt://worker/file/docker
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 755


docker:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/default/docker

docker swarm join --token {{ key.items()[0][1] }}  {{ Worker_ip }}:
  cmd.run
