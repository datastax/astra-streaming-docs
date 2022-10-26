# Restart all instances of a connector
./bin/pulsar-admin sinks restart \
  --namespace "${NAMESPACE}" \
  --name "${SINK_NAME}" \
  --tenant "${TENANT}"

# optionally add --instance-id to only restart an individual instance