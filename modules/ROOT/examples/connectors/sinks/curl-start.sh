# Start all instances of a connector
curl -sS --fail --location --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'/start' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}"

# Start an individual instance of a connector
curl -X POST "${WEB_SERVICE_URL}/admin/v3/sinks/${TENANT}/${NAMESPACE}/${SINK_NAME}/${SINK_INSTANCEID}/start" \
-H "Authorization: ${ASTRA_STREAMING_TOKEN}"