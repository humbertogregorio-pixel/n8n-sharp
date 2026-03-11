FROM docker.n8n.io/n8nio/n8n

USER root
RUN cd /usr/local/lib/node_modules/n8n && npm install sharp
USER node