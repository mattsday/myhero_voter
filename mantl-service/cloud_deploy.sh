#!/bin/bash
# Marathon servers to use:
[[ -z $MANTL_SERVER_LIST ]] && echo "You should set MANTL_SERVER_LIST" && exit
[[ -z $MANTL_USER_NAME ]] && echo "You should set MANTL_USER_NAME" && exit

# App config file
config_file="voter.json"

# Password (get from input)
echo 'Enter password:'
read -sr password


for server in ${MANTL_SERVER_LIST[@]}; do
	echo "Deploying to $server";
	curl -k -X POST -H "Content-Type: application/json" https://$MANTL_USER_NAME:$password@$server:8080/v2/apps -d@$config_file 2>/dev/null
done
