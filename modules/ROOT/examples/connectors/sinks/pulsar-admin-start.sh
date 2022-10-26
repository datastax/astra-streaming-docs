# Start all instances of a connector
./bin/pulsar-admin sinks start \
  --namespace "${NAMESPACE}" \
  --name "${SINK_NAME}" \
  --tenant "${TENANT}"

# optionally add --instance-id to only start an individual instance