#!/bin/bash

service_name = $1

crontab -l | { cat; echo "*/5 * * * * /bin/bash service-health $service_name"; } | crontab -

echo "$service_name added to crontab"