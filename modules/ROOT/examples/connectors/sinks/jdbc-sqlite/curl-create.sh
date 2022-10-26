curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"archive\":\"builtin:\/\/jdbc-sqlite\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 1,
    \"inputs\":[\"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\"],
    \"configs\":{
      \"jdbcUrl\": \"jdbc:sqlite:db.sqlite\",
      \"tableName\": \"pulsar_sqlite_jdbc_sink\"
    }
  }"'

