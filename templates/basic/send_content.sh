export CLIENT_ID={CLIENT_ID}
export CLIENT_SECRET={CLIENT_SECRET}
TENANT_KEY={TENANT_KEY}
API={API}

../../kivra_cli/bin/kivra-content post -t $TENANT_KEY --api $API --ssn $1 --content content_with_form.json --api-version v2 --file content.pdf