FROM docker.n8n.io/n8nio/n8n

USER root

RUN mkdir -p /opt/custom \
 && npm install --prefix /opt/custom sharp \
 && mkdir -p /usr/local/lib/node_modules/n8n/node_modules \
 && rm -rf /usr/local/lib/node_modules/n8n/node_modules/sharp \
           /usr/local/lib/node_modules/n8n/node_modules/detect-libc \
           /usr/local/lib/node_modules/n8n/node_modules/semver \
           /usr/local/lib/node_modules/n8n/node_modules/@img \
 && cp -R /opt/custom/node_modules/sharp /usr/local/lib/node_modules/n8n/node_modules/sharp \
 && cp -R /opt/custom/node_modules/detect-libc /usr/local/lib/node_modules/n8n/node_modules/detect-libc \
 && cp -R /opt/custom/node_modules/semver /usr/local/lib/node_modules/n8n/node_modules/semver \
 && cp -R /opt/custom/node_modules/@img /usr/local/lib/node_modules/n8n/node_modules/@img

COPY n8n-task-runners.json /etc/n8n-task-runners.json
COPY render.js /usr/local/bin/render.js

USER node