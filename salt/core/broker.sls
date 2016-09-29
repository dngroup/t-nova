rabbitmq:3.5.4-management:
  dockerng.image_present:
    - force: True


core-broker:
  dockerng.running:
    - image:  rabbitmq:3.5.4-management
    - port_bindings: "5672:5672,15672:15672"
    - require: 
      - dockerng: rabbitmq:3.5.4-management
