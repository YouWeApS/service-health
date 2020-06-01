#!/bin/bash

echo 'Installing dependencies ...'

echo 'Fetching slacktee GitHub repo ...'
git clone https://github.com/course-hero/slacktee.git

echo 'Installing slacktee.sh ...'
bash ./slacktee/install.sh /usr/bin

echo 'Removing fetched /slacktee folder ...'
rm -rf slacktee

echo 'Moving slacktee.conf to /etc ...'
sed  -i "1i webhook_url=$1" slacktee.conf # pasting the webhook url to slacktee config
cp -i "$script_dir/slacktee.conf" "/etc"


install_path=/usr/bin
script_dir=$( cd $(dirname $0); pwd -P )

echo 'Installing service-health.sh ...'

health_script="service-health.sh"

cp -i "$script_dir/$health_script" "$install_path"
if [[ $? -ne 0 ]]; then
	exit 1
fi

chmod +x "$install_path/$health_script"

echo ':tada: service-health.sh installed'

echo 'Installing service-health-scheduler.sh ...'

scheduler_script="service-health-scheduler.sh"

cp -i "$script_dir/$scheduler_script" "$install_path"
if [[ $? -ne 0 ]]; then
	exit 1
fi

chmod +x "$install_path/$scheduler_script"

echo ':tada: service-health-scheduler.sh installed'

echo 'Removing service-health folder ...'
cd ../
rm -rf service-health

echo 'Done.'