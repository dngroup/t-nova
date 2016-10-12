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

docker swarm join --token {{ key.items()[0][1] }}  {{ pillar['ips']['controller']['management'] }}:
  cmd.run:
    - watch:
      - file: /etc/default/docker
