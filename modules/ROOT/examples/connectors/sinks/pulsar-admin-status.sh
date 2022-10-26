# Check connector status
./bin/pulsar-admin sinks status \
  --instance-id "${SINK_INSTANCEID}" \
  --namespace "${NAMESPACE}" \
  --name "${SINK_NAME}" \
  --tenant "${TENANT}"