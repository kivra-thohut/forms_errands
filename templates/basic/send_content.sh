export CLIENT_ID=""
export CLIENT_SECRET=""

../../kivra_cli/bin/kivra-content post -t 16853693069494e9d83b45448a9ec273d6a3c777ed --api "https://sender.api.kivra.com" --ssn $1 --content content_with_form.json --api-version v2 --file content.pdf