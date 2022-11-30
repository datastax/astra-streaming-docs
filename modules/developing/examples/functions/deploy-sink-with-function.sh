./bin/pulsar-admin sinks create \
--sink-type <sink_type> \
--inputs my-input-topic \
--tenant public \
--namespace default \
--name my-sink \
--transform-function "builtin://transforms" \
--transform-function-config '{"steps": [{"type": "drop-fields", "fields": "password"}, {"type": "merge-key-value"}, {"type": "unwrap-key-value"}, {"type": "cast", "schema-type": "STRING"}]}'