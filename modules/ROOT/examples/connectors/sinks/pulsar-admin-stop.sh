# Stop all instances of a connector
./bin/pulsar-admin sinks stop \
  --namespace "${NAMESPACE}" \
  --name "${SINK_NAME}" \
  --tenant "${TENANT}"

# optionally add --instance-id to only stop an individual instance