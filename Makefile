TEMPLATE ?= basic

init:
	git clone git@github.com:kivra/kivra_cli.git

new:
	mkdir "errands/$(ERRAND)"
	cp -r templates/$(TEMPLATE)/* errands/$(ERRAND)

