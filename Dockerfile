FROM docker.n8n.io/n8nio/n8n

USER root

RUN mkdir -p /usr/local/lib/node_modules/n8n/node_modules \
 && cd /usr/local/lib/node_modules/n8n/node_modules \
 && npm install sharp

COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER node