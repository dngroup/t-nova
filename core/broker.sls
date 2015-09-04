rabbitmq:
  docker.pulled:
    - tag: 3.5.4
    - require:
      - sls: docker

core-broker:
  docker.running:
    - image:  rabbitmq:3.5.4
    - ports:
      - "5672" : "5672"
    - require: 
      - docker: rabbitmq
