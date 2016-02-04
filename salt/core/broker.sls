rabbitmq:
  docker.pulled:
    - tag: 3.5.4-management


core-broker:
  docker.running:
    - image:  rabbitmq:3.5.4-management
    - ports:
      - "5672" : "5672"
    - require: 
      - docker: rabbitmq
