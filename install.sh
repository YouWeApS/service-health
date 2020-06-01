#!/bin/bash

if [ $# -eq 0 ]; then
  echo 'You must supply webhook token as an argument'
	exit 1
fi

echo '[*] Installing dependencies'

echo '[*] Fetching slacktee GitHub repo'
git clone https://github.com/YouWeApS/slacktee.git

echo '[*] Installing slacktee.sh ...'
bash ./slacktee/install.sh /usr/bin

echo '[*] Removing fetched /slacktee folder ...'
rm -rf slacktee

echo '[*] Moving custom slacktee.conf to /etc ...'

script_dir=$( cd $(dirname $0); pwd -P )

conf_file="slacktee.conf"
conf_location="/etc"

sed  -i "1i webhook_url=$1" "$script_dir/$conf_file" # pasting the webhook url to slacktee config
if [[ $? -ne 0 ]]; then
	echo 'Failed to paste webhook url to $conf_file'
	exit 1
fi

cp -i "$script_dir/$conf_file" $conf_location
if [[ $? -ne 0 ]]; then
	echo 'Failed to copy $conf_file to $conf_location'
	exit 1
fi

echo '[*] Installing service-health.sh ...'

install_path=/usr/bin

health_script="service-health.sh"

cp -i "$script_dir/$health_script" "$install_path"
if [[ $? -ne 0 ]]; then
	echo 'Failed to copy $health_script to $install_path'
	exit 1
fi

chmod +x "$install_path/$health_script"

echo '[*] :tada: service-health.sh installed'

echo '[*] Installing service-health-scheduler.sh ...'

scheduler_script="service-health-scheduler.sh"

cp -i "$script_dir/$scheduler_script" "$install_path"
if [[ $? -ne 0 ]]; then
	echo 'Failed to copy $scheduler_script to $install_path'
	exit 1
fi

chmod +x "$install_path/$scheduler_script"

echo '[*] :tada: service-health-scheduler.sh installed'

echo '[*] Removing service-health folder ...'
rm -rf service-health

echo '[*] Installation completed.'