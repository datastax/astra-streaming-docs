./bin/pulsar-admin sinks create \
  --sink-type jdbc-postgres \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
    "userName": "postgres",
    "password": "password",
    "jdbcUrl": "jdbc:postgres://localhost:8123/pulsar_postgres_jdbc_sink",
    "tableName": "pulsar_postgres_jdbc_sink"
  }'
