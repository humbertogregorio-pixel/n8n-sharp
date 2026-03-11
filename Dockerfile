FROM docker.n8n.io/n8nio/n8n

USER root

RUN npm install -g sharp
ENV NODE_PATH=/usr/local/lib/node_modules

COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER node