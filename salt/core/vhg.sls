dngroup/adapted-video-osgi-bundle:
  dockerng.image_present:
    - force: True
    - name: dngroup/adapted-video-osgi-bundle:t-nova-v1


dngroup/adapted-video-osgi-bundle-backup:
  dockerng.image_present:
    - force: True
    - name: dngroup/adapted-video-osgi-bundle:t-nova-v1
    - onfail:
      - dockerng: dngroup/adapted-video-osgi-bundle




vhg:
  dockerng.running:
    - image:  dngroup/adapted-video-osgi-bundle:t-nova-v1
    - port_bindings: "8080:8080"
    - environment:
      - "FRONTAL_PORT" : "5000"
      - "FRONTAL_HOSTNAME" : "{{ pillar['ips']['Frontend']['management'] }}"
    - restart_policy: always
    - require: 
      - dockerng: dngroup/adapted-video-osgi-bundle
