FROM whateverany/node-whateverany:0.0.1


WORKDIR /opt/matrix-appservice-minecraft

COPY ./src/matrix-appservice-minecraft  .

COPY ./src/docker-run.sh .

RUN set -x ;\
  echo "INFO: begin RUN" ;\
  chown node:node /opt/matrix-appservice-minecraft ;\
  apk add --no-cache su-exec ;\
  cd /opt/matrix-appservice-minecraft ;\
  npm install -P ;\
  npm run build ;\
  echo "INFO: end RUN"

VOLUME /data

WORKDIR /data

ENTRYPOINT ["/opt/matrix-appservice-minecraft/docker-run.sh"]

