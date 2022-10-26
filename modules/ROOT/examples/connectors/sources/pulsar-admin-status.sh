# Stop all instances of a connector
./bin/pulsar-admin sources status \
  --instance-id "${SOURCE_INSTANCEID}" \
  --namespace "${NAMESPACE}" \
  --name "${SOURCE_NAME}" \
  --tenant "${TENANT}"