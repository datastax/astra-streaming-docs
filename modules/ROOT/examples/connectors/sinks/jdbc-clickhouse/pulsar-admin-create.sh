./bin/pulsar-admin sinks create \
  --sink-type jdbc-clickhouse \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
    "userName": "clickhouse",
    "password": "password",
    "jdbcUrl": "jdbc:clickhouse://localhost:8123/pulsar_clickhouse_jdbc_sink",
    "tableName": "pulsar_clickhouse_jdbc_sink"
    }'
