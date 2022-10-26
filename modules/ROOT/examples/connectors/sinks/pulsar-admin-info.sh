# Get information about connector
./bin/pulsar-admin sinks get \
  --namespace "${NAMESPACE}" \
  --name "${SINK_NAME}" \
  --tenant "${TENANT}"