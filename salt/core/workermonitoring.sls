{%- set uuid= salt['cmd.run']("curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*\"uuid\": \"//; s/\".*//'") -%}


dngroup/monitoring-worker-t-nova:
  dockerng.image_present:
    - force: True
    - name:  dngroup/monitoring-t-nova

monitoring-worker-t-nova:
  dockerng.running:
    - image:  dngroup/monitoring-t-nova
    - environment:
      - "UUID" : "{{ uuid }}"
      - "RABBITMQ" : "{{ pillar['ips']['Frontend']['management'] }}"
      - "QUEUE" : "soft"
      - "METRICNAME" : "transcoding_score"
    - restart_policy: always
    - require:
      - dockerng: dngroup/monitoring-worker-t-nova
