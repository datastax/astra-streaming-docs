curl --location --request POST 'https://api.astra.datastax.com/v2/streaming/tenants?topic=blah' \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer $BEARER_TOKEN" \
--data-raw '{
    "cloudProvider": "aws",
    "cloudRegion": "useast2",
    "tenantName": "testcreate",
    "userEmail": "joshua@example.com"
}'
