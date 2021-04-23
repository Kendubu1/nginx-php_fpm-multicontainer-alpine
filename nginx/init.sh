#!/usr/bin/env bash

echo "Setup openrc ..." && openrc && touch /run/openrc/softlevel

# BEGIN: Initialize ssh daemon as early as possible
echo Starting ssh service...
rc-service sshd start

# We want all ssh sesions to start in the /home directory
echo "cd /home" >> /etc/profile

# Start nginx
service nginx start
