./bin/pulsar-admin sinks update \
  --sink-type jdbc-mariadb \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --parallelism 2 \
  --sink-config ''
