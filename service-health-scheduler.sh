#!/bin/bash

if [ $# -eq 0 ]; then
  echo 'You must supply service name as an argument'
	exit 1
fi

service_name=$1

crontab -l | { cat; echo "*/5 * * * * /bin/bash service-health.sh $service_name"; } | crontab -

echo "service-health for $service_name was added to crontab"