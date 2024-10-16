# About

The goal for forms_errands is to provide a way to keep track of forms errands in production. An errand could be sending a form to sales to demo to a customer, sending to internal users at Kivra or perhaps just doing experimental testing.

Implementation wise it is essentially a wrapper around Kivra CLI.

# Prerequisites

- Make sure you have `make` installed.
- Ensure you have `jq` installed for JSON processing.

# Quick Start

Note that this guide uses the default template `basic`. You can create your own templates.

```
make init
```

This will clone kivra_cli. 

```
make new ERRAND=salesdemo \
         CLIENT_ID= 
         CLIENT_SECRET= 
         API= 
         TENANT_KEY=
cd errands/salesdemo 
```

This creates a new errand called salesdemo using the default template `basic`. 

`errands/salesdemo` contains various scripts for creating form templates, sending content with a form and collecting the responses. Below are the scripts with a description of what they do.

* `create_form_template.sh` - This creates the form template using form_template.json, so insert your template here.
* `send_content_to_many.sh` - Sends the content to the users in the `ssn.csv` file. Be sure to configure `content_with_form.json` and place a `content.pdf` file in this directory.
* `collect_responses.sh` - Downloads all the responses. Insert custom processing logic in this script. A file called `raw_forms_response.json` is created. This can be used by another script (e.g. Python) to process the response or for troubleshooting.


**Note this runs in production so be tripple sure the SSN is correct before running this.**

**If you are unsure about the form then send it to yourself first and check it before sending to others.**
