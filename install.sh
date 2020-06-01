#!/bin/bash

echo 'Installing dependencies ...'

echo 'Fetching slacktee GitHub repo ...'
git clone https://github.com/course-hero/slacktee.git

echo 'Installing slacktee.sh ...'
bash ./slacktee/install.sh /usr/bin

echo 'Removing fetched /slacktee folder ...'
rm -rf slacktee

echo 'Installing service-health.sh ...'

install_path=/usr/bin
health_script="service-health.sh"

script_dir=$( cd $(dirname $0); pwd -P )

cp -i "$script_dir/$health_script" "$install_path"
if [[ $? -ne 0 ]]; then
	exit 1
fi

chmod +x "$install_path/$health_script"

echo ':tada: service-health.sh installed'

echo 'Removing service-health folder ...'
cd ../
rm -rf service-health

echo 'Done.'