#!/bin/bash
input="/home/manuel/Documents/n26/geolocation/terraform/scripts/InputForDestroy"

destroy=$((sed 's/^/ -target  /g' $input)|tr -d '\n')

printf "run this \n  terraform destroy$destroy"
printf "\n"

