#nherbaut/worker:
#  docker.pulled:
#    - tag: latest
#    - require:
#      - sls: docker

nherbaut/adapted-video-frontend:
  docker.pulled:
    - tag: latest
    - require:
      - sls: docker
    
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


{%- set minealias = salt['pillar.get']('hostsfile:alias', 'network.ip_addrs') %}
{%- set addrs = salt['mine.get']('roles:core', minealias,"grain") %}
  
  
celery:
  docker.pulled:
    - tag: latest
    - name: celery

celery-container:
  docker.running:
    - image: celery
    - name: celery-container
    - links:
        core-broker : rabbit
    - environment:
    - watch:
      - docker: celery
      
  
#core-worker-container:
#  docker.installed:
#    - name: core-worker-container
#    - image: nherbaut/worker:latest
#    - environment:
#      - AMQP_PORT_5672_TCP_ADDR : {{  addrs['core2'][0] }}
#      - "AMQP_PORT_5672_TCP_ADDR" : "core"
#      
#    - watch:
#      - docker: nherbaut/worker
      
#Context is: {{ show_full_context() }}

#worker:
#  docker.running:
#    - container: core-worker-container
#    - image: nherbaut/worker:latest
#    - environment:
#      - "AMQP_PORT_5672_TCP_ADDR" : "salut"
#    - watch:
#      - docker: core-worker-container

