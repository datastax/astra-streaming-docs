curl --location --request POST '{base_url}{base_api}/tenants?topic={topic_name}' \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer {bearer_token}" \
--data-raw '{
    "cloudProvider": "aws",
    "cloudRegion": "useast2",
    "tenantName": "{tenant_name}",
    "userEmail": "joshua@example.com"
}'
