# NOTE: This is not a working example.

CREATE KEYSPACE ks1 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};
CREATE TABLE ks1.table1 (name text, PRIMARY KEY (name));

# create topic pulsar-topic-ks1-table1

curl -X POST "${WEB_SERVICE_URL}/admin/v3/sinks/${TENANT}/${NAMESPACE}/${SINK_NAME}?opt=poweruser" \
  -H "Authorization: ${ASTRA_STREAMING_TOKEN}" \
  -F 'sinkConfig="{
    \"archive\":\"builtin:\/\/cassandra-enhanced\",
    \"tenant\":\"'${TENANT}'\",
    \"namespace\":\"'${NAMESPACE}'\",
    \"name\":\"'${SINK_NAME}'\",
    \"inputs\":[ \"'${TENANT}'\/'${NAMESPACE}'\/'${INPUT_TOPIC}'\" ],
    \"configs\":{
      ...
    }
  }"'