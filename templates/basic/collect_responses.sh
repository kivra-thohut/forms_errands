#!/bin/bash
set -e -o pipefail

export CLIENT_ID=""
export CLIENT_SECRET=""
TENANT_KEY=""
FORM_TEMPLATE_KEY=""

access_token=$(../../kivra_cli/bin/kivra-access-token --api https://sender.api.kivra.com)

keys=$(../../kivra_cli/bin/kivra-form list-responses --api https://sender.api.kivra.com \
                                              --token $access_token \
                                              --tenant $TENANT_KEY \
                                              --form-template-key $FORM_TEMPLATE_KEY \
                                              | jq -r '.responses[].form_response_key'
                                              )

# artifact that is handed over to the person who created the erand
processed_response="processed_response.csv"
rm -rf $processed_response
echo "form_response_key,participate,alergies" >> $processed_response

# used for understanding form response 
raw_forms_response="raw_forms_response.json"
rm -rf $raw_forms_response

# for each form_response_key lookup the coresponding form response and then process it
for key in $keys; do
    echo "processing form_response_key: $key"
    response=$(../../kivra_cli/bin/kivra-form get-response --api "https://sender.api.kivra.com" \
                                                           --token $access_token \
                                                           --tenant $TENANT_KEY \
                                                           --form-template-key $FORM_TEMPLATE_KEY \
                                                           --response-key "$key")

    # you can modify this to put your own custom processing here
    form_response_key=$(echo $response | jq '.form_response_key') 

    participate_id=$(echo $response | jq '.response[1].id') 
    participate_value=$(echo $response | jq '.response[1].value') 
    participate_id_value=${participate_id}-${participate_value}

    allergies_id=$(echo $response | jq '.response[0].id') 
    allergies_value=$(echo $response | jq '.response[0].value') 
    allergies_id_value=${allergies_id}-${allergies_value}

    echo "$form_response_key,$participate_id_value,$allergies_id_value" >> $processed_response

    echo $response >> raw_forms_response.json
done


