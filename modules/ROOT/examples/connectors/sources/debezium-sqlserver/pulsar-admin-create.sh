./bin/pulsar-admin sources create \
  --source-type debezium-mssql \
  --name "${SOURCE_NAME}" \
  --destination-topic-name "persistent://${TENANT}/${NAMESPACE}/${DESTINATION_TOPIC}" \
  --tenant "${TENANT}" \
  --source-config '{
    "database.hostname": "localhost",
    "database.port": "1433",
    "database.user": "sa",
    "database.password": "MyP@ssw0rd!",
    "database.dbname": "MyTestDB",
    "database.server.name": "mssql",
    "snapshot.mode": "schema_only",
    "topic.namespace": "'${TENANT}'/'${NAMESPACE}'",
    "task.class": "io.debezium.connector.sqlserver.SqlServerConnectorTask",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "key.converter": "org.apache.kafka.connect.json.JsonConverter",
    "typeClassName": "org.apache.pulsar.common.schema.KeyValue",
    "database.tcpKeepAlive": "true",
    "decimal.handling.mode": "double"
    }'
