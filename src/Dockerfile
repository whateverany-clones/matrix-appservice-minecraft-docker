FROM whateverany/node-whateverany:0.0.1 AS builder

WORKDIR /opt

RUN set -x ;\
  echo "INFO: begin RUN1" ;\
  apk add --no-cache su-exec git python3 gcc g++ ;\
  git clone https://github.com/dylhack/matrix-appservice-minecraft ;\
  ls -ld /opt/matrix-appservice-minecraft ;\
  ls -l /opt/matrix-appservice-minecraft ;\
  echo "INFO: end RUN1"

WORKDIR /opt/matrix-appservice-minecraft

RUN set -x ;\
  echo "INFO: begin RUN2" ;\
  npm install -P ;\
  npm run build ;\
  echo "INFO: end RUN2"

FROM whateverany/node-whateverany:0.0.1

RUN set -x ;\
  echo "INFO: begin RUN1" ;\
  apk add --no-cache su-exec ;\
  echo "INFO: end RUN1"

WORKDIR /opt/matrix-appservice-minecraft

COPY ./src/docker-run.sh .
COPY --chown=node:node --from=builder /opt/matrix-appservice-minecraft/node_modules/ ./node_modules
COPY --chown=node:node --from=builder /opt/matrix-appservice-minecraft/dist/ ./dist

VOLUME /data

WORKDIR /data

USER node
ENTRYPOINT ["/opt/matrix-appservice-minecraft/docker-run.sh"]

