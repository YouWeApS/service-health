#!/bin/bash

if ! systemctl status $1
then
echo "<!channel> $1 is not operational on $(hostname)" | slacktee.sh -p
fi