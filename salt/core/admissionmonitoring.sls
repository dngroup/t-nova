{%- set uuid= salt['cmd.run']("curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*\"uuid\": \"//; s/\".*//'") -%}


dngroup/monitoring-admission-t-nova:
  dockerng.image_present:
    - force: True
    - name:  dngroup/monitoring-t-nova:t-nova-v1

monitoring-admission-t-nova:
  dockerng.running:
    - image:  dngroup/monitoring-t-nova:t-nova-v1
    - environment:
      - "UUID" : "{{ uuid }}"
      - "RABBITMQ" : "{{ pillar['ips']['Frontend']['management'] }}"
      - "QUEUE" : "celery"
      - "METRICNAME" : "admission"
    - restart_policy: always
    - require:
      - dockerng: dngroup/monitoring-admission-t-nova
