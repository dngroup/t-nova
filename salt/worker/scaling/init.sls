/var/worker/scaling-.sh:
  file:
    - managed
    - name: /var/worker/scaling-out.sh
    - source: salt://worker/scaling/scaling-out.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - name: /var/worker/scaling-out.sh
    - require:
      - file: /var/worker/scaling-out.sh