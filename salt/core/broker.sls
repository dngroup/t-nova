rabbitmq:
  docker.pulled:
    - tag: 3.5.4-management


core-broker:
  docker.running:
    - image:  rabbitmq:3.5.4-management
    - ports:
      - "5672/tcp":
          HostIp: "0.0.0.0"
          HostPort: "5672"  
      - "15672/tcp":
          HostIp: "0.0.0.0"
          HostPort: "15672"

    - require: 
      - docker: rabbitmq
