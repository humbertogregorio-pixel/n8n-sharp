FROM docker.n8n.io/n8nio/n8n

USER root

RUN mkdir -p /opt/custom \
 && npm install --prefix /opt/custom sharp \
 && mkdir -p /usr/local/lib/node_modules/n8n/node_modules \
 && cp -R /opt/custom/node_modules/* /usr/local/lib/node_modules/n8n/node_modules/

COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER node