curl -sS --fail --request PUT ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 2
  }"'
