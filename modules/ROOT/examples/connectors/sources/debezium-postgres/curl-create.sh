curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/astrasources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "tenant": "'${TENANT}'",
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "name": "'${SOURCE_NAME}'",
        "namespace": "'${NAMESPACE}'",
        "archive": "builtin://debezium-postgres",
        "parallelism": 1,
        "processingGuarantees": "ATLEAST_ONCE",
        "configs": {
          "database.dbname": "somedb",
          "database.hostname": "localhost",
          "database.password": "sdfg",
          "database.port": "3306",
          "database.server.id": 123,
          "database.server.name": "dbserver1",
          "database.user": "debezium",
          "database.whitelist": "inventory",
          "json-with-envelope": "true",
          "key.converter": "org.apache.kafka.connect.json.JsonConverter",
          "value.converter": "org.apache.kafka.connect.json.JsonConverter"
        }
      }'
