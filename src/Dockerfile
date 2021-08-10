FROM whateverany/node-whateverany:0.0.1


WORKDIR /opt/matrix-appservice-minecraft

RUN set -x ;\
  echo "INFO: begin RUN1" ;\
  if [ \! -e ./src/matrix-appservice-minecraft ] ; then \
    echo "INFO: ./src/matrix-appservice-minecraft does not exist, pulling" ;\
    git clone https://github.com/dylhack/matrix-appservice-minecraft src/matrix-appservice-minecraft ;\
  fi ;\
  echo "INFO: end RUN1"

COPY ./src/matrix-appservice-minecraft  .

COPY ./src/docker-run.sh .

RUN set -x ;\
  echo "INFO: begin RUN2" ;\
  chown node:node /opt/matrix-appservice-minecraft ;\
  apk add --no-cache su-exec ;\
  cd /opt/matrix-appservice-minecraft ;\
  npm install -P ;\
  npm run build ;\
  echo "INFO: end RUN2"

VOLUME /data

WORKDIR /data

ENTRYPOINT ["/opt/matrix-appservice-minecraft/docker-run.sh"]

