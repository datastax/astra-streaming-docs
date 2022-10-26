curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/astrasources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "tenant": "'${TENANT}'",
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "name": "'${SOURCE_NAME}'",
        "namespace": "'${NAMESPACE}'",
        "archive": "builtin://debezium-oracle",
        "parallelism": 1,
        "processingGuarantees": "ATLEAST_ONCE",
        "configs": {
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
        }
      }'