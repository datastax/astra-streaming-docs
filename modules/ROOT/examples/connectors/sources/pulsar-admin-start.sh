# Start all instances of a connector
./bin/pulsar-admin sources start \
  --namespace "${NAMESPACE}" \
  --name "${SOURCE_NAME}" \
  --tenant "${TENANT}"

# optionally add --instance-id to only start an individual instance