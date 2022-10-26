# Get the status of all connector instances
curl -sS --fail --location ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'/status' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}"

# Get the status of an individual connector instance
curl "${WEB_SERVICE_URL}/admin/v3/sinks/${TENANT}/${NAMESPACE}/${SINK_NAME}/${SINK_INSTANCEID}/status" \
  -H "accept: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"