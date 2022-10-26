./bin/pulsar-admin sinks create \
  --sink-type jdbc-mariadb \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
    "userName": "mariadb",
    "password": "password",
    "jdbcUrl": "jdbc:mariadb://localhost:8123/pulsar_mariadb_jdbc_sink",
    "tableName": "pulsar_mariadb_jdbc_sink"
  }'
