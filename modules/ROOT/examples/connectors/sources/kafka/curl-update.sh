curl -sS --fail -X PUT "${WEB_SERVICE_URL}/admin/v3/astrasources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "tenant": "'${TENANT}'",
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "name": "'${SOURCE_NAME}'",
        "namespace": "'${NAMESPACE}'",
        "archive": "builtin://kafka",
        "parallelism": 1,
        "processingGuarantees": "ATLEAST_ONCE",
        "configs": {
          "bootstrapServers": "asdasd",
          "consumerConfigProperties": {
            "sasl.jaas.config": "sensitive_data_removed",
            "sasl.mechanism": "PLAIN",
            "sasl.password": "sensitive_data_removed",
            "sasl.username": "asdasd",
            "security.protocol": "SASL_SSL"
          },
          "groupId": "asd",
          "topic": "asdasd"
        }
      }'
