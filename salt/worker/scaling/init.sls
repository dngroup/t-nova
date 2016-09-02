 /var/worker/scaling-out.sh:
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
    - cwd: /etc/worker
    - require:
      - file: /var/worker/scaling-out.sh