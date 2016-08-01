#!/bin/bash

# Marathon servers to use:
if [[ -z $MANTL_SERVER_LIST ]]; then
	echo "Enter a list of Mantl servers separated by space (e.g. mantl-1.example.com mantl-2.example.com)"
	read -r MANTL_SERVER_LIST
fi

if [[ -z $MANTL_USER_NAME ]]; then
	echo "Enter Mantl username"
	read -r MANTL_USER_NAME
fi

# Password (get from input)
echo 'Enter Mantl password:'
read -sr password

# App config
if [[ -z $MY_HERO_URL ]]; then
	echo "Enter the full URL to the My Hero web (e.g. http://myhero-web.example.com)"
	read -r MY_HERO_URL
fi
if [[ -z $MY_HERO_THREADS ]]; then
	echo "Enter number of threads per process (e.g. 4)"
	read -r MY_HERO_THREADS
fi
if [[ -z $MY_HERO ]]; then
	echo 'Enter hero name to vote for (e.g. Captain Cloud)'
	read -r MY_HERO
fi



# Template file
template_file="voter-template.json"
# Config file to create from template
config_file="voter.json"

# Build template
cp -f "$template_file" "$config_file"
sed -i "s/REPLACE_WITH_MY_HERO_THREADS/$MY_HERO_THREADS/" $config_file
sed -i "s#REPLACE_WITH_MY_HERO_URL#$MY_HERO_URL#" $config_file
sed -i "s/REPLACE_WITH_MY_HERO/$MY_HERO/" $config_file

for server in ${MANTL_SERVER_LIST[@]}; do
	echo "Deploying to $server";
	curl -k -X POST -H "Content-Type: application/json" https://$MANTL_USER_NAME:$password@$server:8080/v2/apps -d@$config_file 2>/dev/null
done
