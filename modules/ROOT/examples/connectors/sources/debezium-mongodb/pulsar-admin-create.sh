./bin/pulsar-admin sources create \
  --source-type debezium-mongodb \
  --name "${SOURCE_NAME}" \
  --destination-topic-name "persistent://${TENANT}/${NAMESPACE}/${DESTINATION_TOPIC}" \
  --tenant "${TENANT}" \
  --source-config '{
    "database.whitelist": "asdasd",
    "mongodb.hosts": "asd",
    "mongodb.name": "asdasd",
    "mongodb.password": "asd",
    "mongodb.task.id": "123",
    "mongodb.user": "asd"
    }'
