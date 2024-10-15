export CLIENT_ID={CLIENT_ID}
export CLIENT_SECRET={CLIENT_SECRET}
TENANT_KEY={TENANT_KEY}
API={API}

../../kivra_cli/bin/kivra-form create -t $TENANT_KEY --api $API --form form_template.json

cp /tmp/content_with_form.json .
form_template_key=$(cat content_with_form.json | jq .form.id)
gsed -i "s/{FORM_TEMPLATE_KEY}/$form_template_key/g" collect_responses.sh