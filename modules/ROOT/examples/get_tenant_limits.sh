curl --location --request GET 'https://api.astra.datastax.com/v2/streaming/tenants/llp-test/limits' \
--header 'X-DataStax-Pulsar-Cluster: astradev-aws' \
--header "Authorization: Bearer $BEARER_TOKEN"
