#!/bin/sh -e

args="$@"

if [ ! -f "/data/config/config.yaml" ]; then
        echo 'No registration found, generating now'
        args="--INIT"
fi

# if no --uid is supplied, prepare files to drop privileges
if [ "$(id -u)" = 0 ]; then
	chown node:node /data

	if find *.db > /dev/null 2>&1; then
		# make sure sqlite files are writeable
		chown node:node *.db
	fi
	if find *.log.* > /dev/null 2>&1; then
		# make sure log files are writeable
		chown node:node *.log.*
	fi

	su_exec='su-exec node:node'
else
	su_exec=''
fi

# $su_exec is used in case we have to drop the privileges
exec $su_exec /usr/local/bin/node '/opt/matrix-appservice-minecraft/dist/src/app.js' \
     $args
