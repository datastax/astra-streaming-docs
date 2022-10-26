./bin/pulsar-admin sinks create \
  --sink-type snowflake \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
      xxxx
    }'
