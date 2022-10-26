# Restart all instances of a connector
./bin/pulsar-admin sources restart \
  --namespace "${NAMESPACE}" \
  --name "${SOURCE_NAME}" \
  --tenant "${TENANT}"

# optionally add --instance-id to only restart an individual instance