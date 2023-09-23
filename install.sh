#!/bin/bash

# Build and install smtprelay
go build
cp smtprelay /usr/local/bin/smtprelay

# Which initialization system is used
if [[ `stat /proc/1/exe | grep "/sbin/init"` != "" ]]; then
	INIT="openrc"
elif [[ `stat /proc/1/exe | grep "/lib/systemd/systemd"` != "" ]]; then
	INIT="systemd"
fi

# Add system user
getent passwd smtprelay &> /dev/null

if [ $? -eq 2 ]; then
    useradd -Mrs /sbin/nologin smtprelay &> /dev/null
fi

# Install config file
if [ ! -d /etc/smtprelay ]; then
    mkdir /etc/smtprelay
fi

cp smtprelay.ini /etc/smtprelay/smtprelay.ini

# Make log file
if [ ! -d /var/log/smtprelay ]; then
    mkdir /var/log/smtprelay
fi

touch /var/log/smtprelay/smtprelay.log
chown -R smtprelay:smtprelay /var/log/smtprelay

# Install daemon service
if [ $INIT = "openrc" ]; then
	cp services/openrc/smtprelay /etc/init.d/smtprelay
elif [ $INIT = "systemd" ]; then
	cp services/systemd/smtprelay.service /etc/systemd/system/smtprelay.service
else
	echo "Unknown init system"
fi
