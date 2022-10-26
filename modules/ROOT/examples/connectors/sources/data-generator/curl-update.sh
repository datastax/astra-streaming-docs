# Update all instances of a connector currently running
curl -sS --fail -X PUT "${WEB_SERVICE_URL}/admin/v3/sources/${TENANT}/${NAMESPACE}/${SOURCE_NAME}" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -d '{
        "topicName": "persistent://'${TENANT}'/'${NAMESPACE}'/'${DESTINATION_TOPIC}'",
        "configs": {
          "sleepBetweenMessages": "100"
        }
      }'

# REQUEST DATA SAMPLE
# {
#   "topicName": "string",
#   "producerConfig": {
#     "maxPendingMessages": 0,
#     "maxPendingMessagesAcrossPartitions": 0,
#     "useThreadLocalProducers": true,
#     "cryptoConfig": {
#       "cryptoKeyReaderClassName": "string",
#       "cryptoKeyReaderConfig": {
#         "property1": {},
#         "property2": {}
#       },
#       "encryptionKeys": [
#         "string"
#       ],
#       "producerCryptoFailureAction": "FAIL",
#       "consumerCryptoFailureAction": "FAIL"
#     },
#     "batchBuilder": "string"
#   },
#   "serdeClassName": "string",
#   "schemaType": "string",
#   "configs": {
#     "property1": {},
#     "property2": {}
#   },
#   "secrets": {
#     "property1": {},
#     "property2": {}
#   },
#   "parallelism": 0,
#   "processingGuarantees": "ATLEAST_ONCE",
#   "resources": {
#     "cpu": 0,
#     "ram": 0,
#     "disk": 0
#   },
#   "archive": "string",
#   "runtimeFlags": "string",
#   "customRuntimeOptions": "string",
#   "batchSourceConfig": {
#     "discoveryTriggererClassName": "string",
#     "discoveryTriggererConfig": {
#       "property1": {},
#       "property2": {}
#     }
#   },
#   "batchBuilder": "string"
# }