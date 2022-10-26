curl -sS --fail --request POST ''${WEB_SERVICE_URL}'/admin/v3/sinks/'${TENANT}'/'${NAMESPACE}'/'${SINK_NAME}'?opt=poweruser' \
  --header "Authorization: Bearer ${ASTRA_STREAMING_TOKEN}" \
  --form 'sinkConfig="{
    \"archive\":\"builtin:\/\/snowflake\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"parallelism\": 1,
    \"inputs\":[\"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\"],
    \"configs\":{
      \"topic\": \"snowflake-demo\",
      \"offsetStorageTopic\": \"snowflake-sink-offsets-demo\",
      \"batchSize\": 100,
      \"lingerTimeMs\": 600000,
      \"kafkaConnectorConfigProperties\":{
         \"name\": \"snowflakedemo\",
         \"topics\": \"snowflake-demo\",
         \"buffer.count.records\": 100,
         \"buffer.flush.time\": 600,
         \"buffer.size.bytes\": 102400,
         \"snowflake.url.name\": \"tenant.snowflakecomputing.com:443\",
         \"snowflake.user.name\": \"kafka_connector_user\",
         \"snowflake.private.key\": \"very_secret_key\",
         \"snowflake.database.name\": \"kafka_db\",
         \"snowflake.schema.name\": \"kafka_schema\",
         \"key.converter\": \"org.apache.kafka.connect.storage.StringConverter\",
         \"value.converter\": \"com.snowflake.kafka.connector.records.SnowflakeJsonConverter\"
      }
    }
  }"'
  
