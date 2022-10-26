./bin/pulsar-admin sinks create \
  --sink-type jdbc-sqlite \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
    "jdbcUrl": "jdbc:sqlite:db.sqlite",
    "tableName": "pulsar_sqlite_jdbc_sink"
  }'
