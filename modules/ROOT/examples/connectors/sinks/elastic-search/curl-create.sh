curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"archive\":\"builtin:\/\/elastic_search\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 1,
    \"inputs\":[\"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\"],
    \"configs\":{
      \"elasticSearchUrl\":\"http://localhost:9200\",
      \"username\": \"scooby\",
      \"password\":\"doobie\",
      \"indexName\":\"my_index\"
    }
  }"'
