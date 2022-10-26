# Get the status of all connector instances
curl -sS --fail "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/status" \
  -H "accept: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"

# Get the status of an individual connector instance
curl "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/${SOURCE_INSTANCEID}/status" \
  -H "accept: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"
