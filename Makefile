TEMPLATE ?= basic

new:
	mkdir "errands/$(ERRAND)"
	cp -r "templates/$(TEMPLATE)" "errands/$(ERRAND)"
