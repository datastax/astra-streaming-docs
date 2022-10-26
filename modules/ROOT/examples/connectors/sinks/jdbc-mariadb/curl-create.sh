curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"archive\":\"builtin:\/\/jdbc-mariadb\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 1,
    \"inputs\":[\"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\"],
    \"configs\":{
      \"userName\": \"mariadb\",
      \"password\": \"password\",
      \"jdbcUrl\": \"jdbc:mariadb://localhost:8123/pulsar_mariadb_jdbc_sink\",
      \"tableName\": \"pulsar_mariadb_jdbc_sink\"
    }
  }"'

