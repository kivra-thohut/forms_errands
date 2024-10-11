export CLIENT_ID=""
export CLIENT_SECRET=""

../../kivra_cli/bin/kivra-form create -t 16853693069494e9d83b45448a9ec273d6a3c777ed --api "https://sender.api.kivra.com" --form form_template.json
cp /tmp/content_with_form.json .