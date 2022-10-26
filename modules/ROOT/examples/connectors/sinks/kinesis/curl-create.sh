curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"archive\":\"builtin:\/\/kinesis\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 1,
    \"inputs\":[\"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\"],
    \"configs\":{
      \"awsEndpoint\": \"some.endpoint.aws\",
      \"awsRegion\": \"us-east-1\",
      \"awsKinesisStreamName\": \"my-stream\",
      \"awsCredentialPluginParam\": \"{\\\"accessKey\\\":\\\"myKey\\\",\\\"secretKey\\\":\\\"my-Secret\\\"}\",
      \"messageFormat\": \"ONLY_RAW_PAYLOAD\",
      \"retainOrdering\": \"true\"
    }
  }"'