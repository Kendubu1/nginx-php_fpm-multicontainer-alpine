#!/usr/bin/env bash

echo "Setup openrc ..." && openrc && touch /run/openrc/softlevel

echo Starting ssh service...
rc-service sshd start

# Start nginx
echo Starting nginx...
nginx -g "daemon off;"