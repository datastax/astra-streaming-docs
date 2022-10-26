# Stop all instances of a connector
curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/stop" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"

# Stop an individual instance of a connector
#curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/${SOURCE_INSTANCEID}/stop" \
#  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"