./bin/pulsar-admin sinks create \
  --sink-type kinesis \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
      "awsEndpoint": "some.endpoint.aws",
      "awsRegion": "us-east-1",
      "awsKinesisStreamName": "my-stream",
      "awsCredentialPluginParam": "{\"accessKey\":\"myKey\",\"secretKey\":\"my-Secret\"}",
      "messageFormat": "ONLY_RAW_PAYLOAD",
      "retainOrdering": "true"
    }'
