./bin/pulsar-admin sinks create --namespace ${namespace} --tenant ${TENANT} \
    --sink-type cassandra-enhanced \
    --name cassandra-sink \
    --inputs dbserver1.public.pulsar_source_table \
    --subs-position Earliest \
    --sink-config '{"verbose": true, "tasks.max":1, ...}' \
    --parallelism 1 \
    --transform-function builtin://transform \
    --transform-function-config `{"steps": [{"type": "flatten"}]}`