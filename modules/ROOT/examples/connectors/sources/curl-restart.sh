# Restart all instances of a connector
curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/restart" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"

# Restart an individual instance of a connector
#curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}/${SOURCE_INSTANCEID}/restart" \
#  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"