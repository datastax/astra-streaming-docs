./bin/pulsar-admin sources create \
  --source-type kinesis \
  --name "${SOURCE_NAME}" \
  --destination-topic-name "persistent://${TENANT}/${NAMESPACE}/${DESTINATION_TOPIC}" \
  --tenant "${TENANT}" \
  --source-config '{
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
    }'
