#!/bin/bash

if [ $# -eq 0 ]; then
  echo 'You must supply service name as an argument'
	exit 1
fi

service_name=$1

if ! systemctl status $service_name; then
  echo "<!channel> *$service_name* is not operational on $(hostname)" | slacktee.sh -p
fi