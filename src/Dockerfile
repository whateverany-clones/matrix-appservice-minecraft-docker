FROM whateverany/node-whateverany:0.0.1



RUN set -x ;\
  echo "INFO: begin RUN1" ;\
  apk add --no-cache su-exec git ;\
  git clone https://github.com/dylhack/matrix-appservice-minecraft /opt/matrix-appservice-minecraft ;\
  echo "INFO: end RUN1"

WORKDIR /opt/matrix-appservice-minecraft

COPY ./src/docker-run.sh .

RUN set -x ;\
  echo "INFO: begin RUN2" ;\
  chown node:node /opt/matrix-appservice-minecraft ;\
  npm install -P ;\
  npm run build ;\
  echo "INFO: end RUN2"

VOLUME /data

WORKDIR /data

ENTRYPOINT ["/opt/matrix-appservice-minecraft/docker-run.sh"]

