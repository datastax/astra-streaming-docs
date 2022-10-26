curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"archive\":\"builtin:\/\/kafka\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 1,
    \"inputs\":[\"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\"],
    \"configs\":{
      \"bootstrapServers\": \"localhost:6667\",
      \"topic\": \"test\",
      \"acks\": \"1\",
      \"batchSize\": \"16384\",
      \"maxRequestSize\": \"1048576\",
      \"producerConfigProperties\": {
         \"client.id\": \"test-pulsar-producer\",
         \"security.protocol\": \"SASL_PLAINTEXT\",
         \"sasl.mechanism\": \"GSSAPI\",
         \"sasl.kerberos.service.name\": \"kafka\",
         \"acks\": \"all\"
      }
    }
  }"'
  
