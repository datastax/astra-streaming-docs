./bin/pulsar-admin sinks create \
  --sink-type kafka \
  --name "${SINK_NAME}" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/${INPUT_TOPIC}" \
  --tenant "${TENANT}" \
  --sink-config '{
      "bootstrapServers": "localhost:6667",
      "topic": "test",
      "acks": "1",
      "batchSize": "16384",
      "maxRequestSize": "1048576",
      "producerConfigProperties": {
         "client.id": "test-pulsar-producer",
         "security.protocol": "SASL_SSL",
         "sasl.mechanism": "PLAIN",
         "sasl.kerberos.service.name": "kafka",
         "sasl.username": "cccccc",
         "sasl.password": "cccccc",
         "acks": "all"
      }
    }
