curl --location --request GET '{base_url}{base_api}/tenants/{tenant_name_with_topics}/limits' \
--header 'X-DataStax-Pulsar-Cluster: {cluster_name}' \
--header "Authorization: Bearer {bearer_token}"
