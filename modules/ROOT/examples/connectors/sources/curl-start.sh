# Start all instances of a connector
curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/start" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"

# Start an individual instance of a connector
curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/${SOURCE_INSTANCEID}/start" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"