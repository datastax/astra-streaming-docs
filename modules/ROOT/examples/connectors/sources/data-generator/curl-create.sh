curl -sS --fail -X POST "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "archive": "builtin://data-generator",
        "configs": {
          "sleepBetweenMessages": "50"
        }
      }'

