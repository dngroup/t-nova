
/var/worker/scaling-in.sh:
  file:
    - managed
    - name: /var/worker/scaling-in.sh
    - source: salt://worker/scaling/scaling-in.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - name: /var/worker/scaling-in.sh
    - cwd: /etc/worker
    - require:
      - file: /var/worker/scaling-in.sh