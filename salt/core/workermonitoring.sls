{%- set uuid= salt['cmd.run']("curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*\"uuid\": \"//; s/\".*//'") -%}


dngroup/monitoring-worker-t-nova:
  docker.pulled:
    - tag: latest
    - image:  dngroup/monitoring-t-nova

monitoring-worker-t-nova:
  docker.running:
    - image:  dngroup/monitoring-t-nova
    - environment:
      - "UUID" : "{{ uuid }}"
      - "RABBITMQ" : "{{ pillar['ips']['Frontend']['management'] }}"
      - "QUEUE" : "soft"
      - "METRICNAME" : "worker"
    - require:
      - docker: dngroup/monitoring-t-nova
