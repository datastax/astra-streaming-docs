# NOTE: This is not a working example.

./bin/pulsar-admin sinks update \
  --sink-type cassandra-enhanced \
  --name "pulsar-sink-ks1-table1" \
  --inputs "persistent://${TENANT}/${NAMESPACE}/pulsar-topic-ks1-table1" \
  --tenant "${TENANT}" \
  --sink-config '{
    "contactPoints": "cassandra",
    "loadBalancing.localDc": "datacenter1",
    "port": 9042,
    "cloud.secureConnectBundle": null,
    "ignoreErrors": "None",
    "maxConcurrentRequests": 500,
    "maxNumberOfRecordsInBatch": 32,
    "queryExecutionTimeout": 30,
    "connectionPoolLocalSize": 4,
    "jmx": true,
    "compression": "None",
    "auth": {
        "provider": "None",
        "username": null,
        "password": null,
        "gssapi": {
            "keyTab": null,
            "principal": null,
            "service": "dse"
        }
    },
    "ssl": {
        "provider": "None",
        "hostnameValidation": true,
        "keystore": {
            "password": null,
            "path": null
        },
        "openssl": {
            "keyCertChain": null,
            "privateKey": null
        },
        "truststore": {
        "password": null,
        "path": null
        },
        "cipherSuites": null
    },
    "topic": {
        "pulsar-topic-ks1-table1": {
            "ks1": {
                "table1": {
                    "mapping": "name=value.name",
                    "consistencyLevel": "LOCAL_ONE",
                    "ttl": -1,
                    "ttlTimeUnit": "SECONDS",
                    "timestampTimeUnit": "MICROSECONDS",
                    "nullToUnset": true,
                    "deletesEnabled": true
                }
            },
            "codec": {
                "locale": "en_US",
                "timeZone": "UTC",
                "timestamp": "CQL_TIMESTAMP",
                "date": "ISO_LOCAL_DATE",
                "time": "ISO_LOCAL_TIME",
                "unit": "MILLISECONDS"
            }
        }
      }
    }'
