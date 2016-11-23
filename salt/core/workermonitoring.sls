{%- set uuid= salt['cmd.run']("curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*\"uuid\": \"//; s/\".*//'") -%}


dngroup/monitoring-worker-t-nova:
  dockerng.image_present:
    - force: True
    - name:  dngroup/monitoring-t-nova:t-nova-v1

dngroup/monitoring-worker-t-nova-backup:
  dockerng.image_present:
    - force: True
    - name:  dngroup/monitoring-t-nova:t-nova-v1
    - onfail:
      - dockerng: dngroup/monitoring-worker-t-nova

monitoring-worker-t-nova:
  dockerng.running:
    - image:  dngroup/monitoring-t-nova:t-nova-v1
    - environment:
      - "UUID" : "{{ uuid }}"
      - "RABBITMQ" : "{{ pillar['ips']['Frontend']['management'] }}"
      - "QUEUE" : "soft"
      - "METRICNAME" : "transcoding_score"
    - restart_policy: always
    - require:
      - dockerng: dngroup/monitoring-worker-t-nova
