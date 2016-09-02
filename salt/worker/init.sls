/var/worker/manager.sh:
  file:
    - managed
    - name: /var/worker/manager.sh
    - source: salt://worker/manager.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - name: /var/worker/manager.sh
    - require:
      - file: /var/worker/manager.sh