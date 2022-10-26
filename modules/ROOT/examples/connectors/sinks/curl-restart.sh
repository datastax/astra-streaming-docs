# Restart all instances of a connector
curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'/restart' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}"

# Restart an individual instance of a connector
curl -X POST "${WEB_SERVICE_URL}/admin/v3/sinks/${TENANT}/${NAMESPACE}/${SINK_NAME}/${SINK_INSTANCEID}/restart" \
-H "Authorization: ${ASTRA_STREAMING_TOKEN}"