curl -sS --fail -X PUT "${WEB_SERVICE_URL}/admin/v3/astrasources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "tenant": "'${TENANT}'",
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "name": "'${SOURCE_NAME}'",
        "namespace": "'${NAMESPACE}'",
        "archive": "builtin://kinesis",
        "parallelism": 1,
        "processingGuarantees": "ATLEAST_ONCE",
        "configs": {
          "awsEndpoint": "https://some.endpoint.aws",
          "awsRegion": "us-east-1",
          "awsKinesisStreamName": "my-stream",
          "awsCredentialPluginParam": "{\"accessKey\":\"myKey\",\"secretKey\":\"my-Secret\"}",
          "applicationName": "My test application",
          "checkpointInterval": "30000",
          "backoffTime": "4000",
          "numRetries": "3",
          "receiveQueueSize": 2000,
          "initialPositionInStream": "TRIM_HORIZON",
          "startAtTime": "2020-08-09T19:28:58.000Z"
        }
      }'
