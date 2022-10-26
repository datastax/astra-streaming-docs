# Delete all instances of a connector
./bin/pulsar-admin sources delete \
  --namespace "${NAMESPACE}" \
  --name "${SOURCE_NAME}" \
  --tenant "${TENANT}"