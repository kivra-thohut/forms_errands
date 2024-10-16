#!/bin/bash
set -e -o pipefail

function get_id_value_pair {
    local response_json=$1
    local index=$2

    local id=$(echo $response_json | jq ".response[$index].id")
    local value=$(echo $response_json | jq ".response[$index].value")
    local id_value=${id}-${value}

    echo $id_value
}

export CLIENT_ID={CLIENT_ID}
export CLIENT_SECRET={CLIENT_SECRET}
TENANT_KEY={TENANT_KEY}
FORM_TEMPLATE_KEY={FORM_TEMPLATE_KEY}
API={API}

access_token=$(../../kivra_cli/bin/kivra-access-token --api $API)

keys=$(../../kivra_cli/bin/kivra-form list-responses --api $API \
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
    response=$(../../kivra_cli/bin/kivra-form get-response --api $API \
                                                           --token $access_token \
                                                           --tenant $TENANT_KEY \
                                                           --form-template-key $FORM_TEMPLATE_KEY \
                                                           --response-key "$key")

    # you can modify this to put your own custom processing here
    # consider a python script if you need to do more complex processing
    form_response_key=$(echo $response | jq '.form_response_key')
    first_answer=$(get_id_value_pair "$response" 0)
    second_answer=$(get_id_value_pair "$response" 1)
    third_answer=$(get_id_value_pair "$response" 2)

    echo "$form_response_key,$first_answer,$second_answer,$third_answer" >> $processed_response

    echo $response >> raw_forms_response.json
done


