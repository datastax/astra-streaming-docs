./bin/pulsar-admin sources create \
  --source-type data-generator \
  --name "${SOURCE_NAME}" \
  --destination-topic-name "persistent://${TENANT}/${NAMESPACE}/${DESTINATION_TOPIC}" \
  --tenant "${TENANT}" \
  --source-config '{
    "sleepBetweenMessages": "50"
    }'
