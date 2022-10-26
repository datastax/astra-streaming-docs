# Delete all instances of a connector
./bin/pulsar-admin sinks delete \
  --namespace "${NAMESPACE}" \
  --name "${SINK_NAME}" \
  --tenant "${TENANT}"