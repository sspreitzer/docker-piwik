#!/bin/bash

set -e

if [ "$@" != "piwik" ]; then
	exec "$@"
fi

stop(){
	/etc/init.d/apache2 stop
	pkill tail
}

trap stop SIGINT SIGTERM
/etc/init.d/apache2 start
tail -f /var/log/apache2/*.log &
wait

