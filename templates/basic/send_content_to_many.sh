#!/bin/bash

# Set the input file name
csv_file="ssns.csv"

# Read the CSV file line by line
while IFS= read -r ssn
do
  # Process the line
  echo "About to send content with form to $ssn"
  ./send_content.sh $ssn
done < "$csv_file"