python-pip:
  pkg.installed

dockey-py:
  pip.installed:
    - name: docker-py
    - upgrade: True

