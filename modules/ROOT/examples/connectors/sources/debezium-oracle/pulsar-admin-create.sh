./bin/pulsar-admin sources create \
  --source-type debezium-oracle \
  --name "${SOURCE_NAME}" \
  --destination-topic-name "persistent://${TENANT}/${NAMESPACE}/${DESTINATION_TOPIC}" \
  --tenant "${TENANT}" \
  --source-config '{
    "database.hostname": "localhost",
    "database.port": "1521",
    "database.user": "dbzuser",
    "database.password": "dbz",
    "database.dbname": "a-db",
    "database.server.name": "my-server",
    "schema.exclude.list": "system,dbzuser",
    "snapshot.mode": "initial",
    "topic.namespace": "'${TENANT}'/'${NAMESPACE}'",
    "task.class": "io.debezium.connector.oracle.OracleConnectorTask",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "key.converter": "org.apache.kafka.connect.json.JsonConverter",
    "typeClassName": "org.apache.pulsar.common.schema.KeyValue",
    "database.tcpKeepAlive": "true",
    "decimal.handling.mode": "double"
    }'
