curl -sS --fail -X PUT "${WEB_SERVICE_URL}/admin/v3/astrasources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "tenant": "'${TENANT}'",
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "name": "'${SOURCE_NAME}'",
        "namespace": "'${NAMESPACE}'",
        "archive": "builtin://debezium-mssql",
        "parallelism": 1,
        "processingGuarantees": "ATLEAST_ONCE",
        "configs": {
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
        }
      }'