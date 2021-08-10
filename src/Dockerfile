FROM whateverany/node-whateverany:0.0.1

COPY src/matrix-appservice-minecraft /opt/matrix-appservice-minecraft


RUN echo "INFO: begin RUN" ;\
  pushd /opt/matrix-appservice-minecraft ;\
  npm install -P ;\
  popd ;\
  echo "INFO: end RUN"
