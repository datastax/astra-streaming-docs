./bin/pulsar-admin sinks update \
  --sink-type elastic_search \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
    "elasticSearchUrl": "http://localhost:9200",
    "indexName": "my_index",
    "username": "scooby",
    "password": "doobie"
    }'