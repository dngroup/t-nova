#testswarm:
#  cmd.run:
#    - name: docker swarm join-token worker -q


/var/worker/manager.sh:
  cmd.run:
    - name: docker swarm init  --advertise-addr eth0
    - unless:
      - docker swarm join-token worker -q

#docker service create \
#     --mode global \
#     --name worker \
#     -e CELERY_BROKER_URL=amqp://guest@{{ pillar['ips']['Frontend']['data'] }}/ \
#     -e ST_AUTH=http://{{ pillar['ips']['Frontend']['data'] }}:8080/auth/v1.0 \
#     -e ST_USER=admin:admin \
#     -e ST_KEY=admin \
#     dngroup/vhg-adaptation-worker
#testswarmworker:
#  cmd.run:
#    - name: docker service ps worker


service worker:
  cmd.run:
    - name: docker service create --constraint type==engine.labels.worker  --mode global --name worker -e CELERY_BROKER_URL=amqp://guest@{{ pillar['ips']['Frontend']['data'] }}/ -e ST_AUTH=http://{{ pillar['ips']['Frontend']['data'] }}:8080/auth/v1.0 -e ST_USER=admin:admin -e ST_KEY=admin dngroup/vhg-adaptation-worker
    - unless:
      - docker service ps worker
    - reload_pillar: true