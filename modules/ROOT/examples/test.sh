#!/bin/bash

# SET THE BEARER TOKEN FOR ALL OTHER COMMANDS

BEARER_TOKEN=<replace_me>


# SET VARIABLES
base_url=https://api.astra.datastax.com
base_api=/v2/streaming
tenant_name=llp-llp-testcreater
tenant_name_with_topics=test-llp
topic_name=blah
cluster_name=astradev-aws

for FILE in *;
 do
    if [[ "$FILE" != "test"* ]]
    then
      gsed "s#{base_url}#$base_url#; s#{base_api}#$base_api#; s#{tenant_name}#$tenant_name#; s#{tenant_name_with_topics}#$tenant_name_with_topics#; s#{topic_name}#$topic_name#; s#{cluster_name}#$cluster_name#; s#{bearer_token}#$BEARER_TOKEN#;" $FILE > $FILE.tmp;
      chmod 755 $FILE.tmp;
    fi
done

echo -e "\nGet all clusters\n"
./get_clusters.sh.tmp | jq

echo -e "\nGet all providers\n"
./get_providers.sh.tmp | jq

echo -e "\nGet all tenants\n"
./get_tenants.sh.tmp | jq

echo -e "\nCheck tenant exists\n"
./check_tenant_exists.sh.tmp

echo -e "\nCreate tenant\n"
./create_tenant.sh.tmp | jq

echo -e "\nGet tenant limits\n"
./get_tenant_limits.sh.tmp | jq

echo -e "\nGet all tenants again, now that new tenant is created\n"
./get_tenants.sh.tmp | jq

echo -e "\nDelete tenant hard\n"
./delete_tenant_hard.sh.tmp

#echo -e "\nDelete tenant soft\n"
#./delete_tenant_soft.sh.tmp

# CLEAN UP tmp files
rm *.tmp; 
