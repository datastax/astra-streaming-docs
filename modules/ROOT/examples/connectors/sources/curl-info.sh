# Get a connector's information
curl -sS --fail "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}"