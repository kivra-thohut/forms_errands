TEMPLATE ?= basic

init:
	git clone git@github.com:kivra/kivra_cli.git

new:
	mkdir "errands/$(ERRAND)"
	cp -r templates/$(TEMPLATE)/* errands/$(ERRAND)

	gsed -i 's/{CLIENT_ID}/$(CLIENT_ID)/g' errands/$(ERRAND)/*.sh
	gsed -i 's/{CLIENT_SECRET}/$(CLIENT_SECRET)/g' errands/$(ERRAND)/*.sh
	gsed -i 's|{API}|https://sender.sandbox-api.kivra.com|g' errands/sandbox_test/*.sh
	gsed -i 's/{TENANT_KEY}/$(TENANT_KEY)/g' errands/$(ERRAND)/*.sh



