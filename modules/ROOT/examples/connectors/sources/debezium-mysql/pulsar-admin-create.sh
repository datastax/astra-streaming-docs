./bin/pulsar-admin sources create \
  --source-type debezium-mysql \
  --name "${SOURCE_NAME}" \
  --destination-topic-name "persistent://${TENANT}/${NAMESPACE}/${DESTINATION_TOPIC}" \
  --tenant "${TENANT}" \
  --source-config '{
    "database.dbname": "somedb",
    "database.hostname": "localhost",
    "database.password": "sensitive_data_removed",
    "database.port": "3306",
    "database.server.id": 123,
    "database.server.name": "dbserver1",
    "database.user": "debezium",
    "database.whitelist": "inventory",
    "json-with-envelope": "true",
    "key.converter": "org.apache.kafka.connect.json.JsonConverter",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter"
    }'
