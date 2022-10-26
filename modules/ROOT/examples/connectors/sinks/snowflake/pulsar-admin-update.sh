./bin/pulsar-admin sinks update \
  --sink-type snowflake \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --parallelism 2
