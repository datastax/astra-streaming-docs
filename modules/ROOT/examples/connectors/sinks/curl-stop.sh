# Stop all instances of a connector
curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'/stop' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}"

# Stop an individual instance of a connector
curl -X POST "${WEB_SERVICE_URL}/admin/v3/sinks/${TENANT}/${NAMESPACE}/${SINK_NAME}/${SINK_INSTANCEID}/stop" \
  --H "Authorization: ${ASTRA_STREAMING_TOKEN}"