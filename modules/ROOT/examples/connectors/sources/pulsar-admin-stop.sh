# Stop all instances of a connector
./bin/pulsar-admin sources stop \
  --namespace "${NAMESPACE}" \
  --name "${SOURCE_NAME}" \
  --tenant "${TENANT}"

# optionally add --instance-id to only stop an individual instance