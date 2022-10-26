# Delete all instances of a connector
curl -sS --fail -X DELETE "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"