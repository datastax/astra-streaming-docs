# Delete all instances of a connector
curl -sS --fail --location --request DELETE ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}"