The goal is forms_errands is to provide a way to keep track of forms errands in production. An errand could be sending a form to sales to demo to a customer, sending to internal users at Kivra or perhaps just doing experimental testing.

# Quick Start

Note that this guide uses the default template `basic`. You can create your own templates.

```
make init
```

This will clone kivra_cli. 

```
make new ERRAND=salesdemo 
cd errands/salesdemo
```

This creates a new errand called salesdemo using the default template `basic`. 

This will create the directory `errands/salesdemo` along with everything you need to create a form template and send it out. Here is an overview of the files.

## errands/salesdemo/create_form_template.sh

This will create a form template using form_template.json.

## errands/salesdemo/form_template.json

This is the form template. Be sure to fill this out.

## errands/salesdemo/content_with_form.json

This is the content file. Be sure to add to it what you need.
Note this is generated once `create_form_template.sh` is called.

## errands/salesdemo/send_content.sh

This sends out a content with form to the user. 
Move the PDF you wish to include to this directory and name it content.pdf.

When running this it takes an SSN as the first parameter e.g. `send_content.sh XXXXXXXXXX`.

**Note this runs in production so be tripple sure the SSN is correct before running this.**

**If you are unsure about the form then send it to yourself first and check it before sending to others.**
