rabbitmq:3.5.4-management:
  dockerng.image_present:
    - force: True

rabbitmq:3.5.4-management-backup:
  dockerng.image_present:
    - force: True
    - onfail:
      - dockerng: rabbitmq:3.5.4-management

core-broker:
  dockerng.running:
    - image:  rabbitmq:3.5.4-management
    - port_bindings: "5672:5672,15672:15672"
    - restart_policy: always
    - require: 
      - dockerng: rabbitmq:3.5.4-management
