#!/bin/bash

set -e

if [ ! -f /srv/piwik/index.php ]; then
	echo "Preparing container.."
	curl http://builds.piwik.org/piwik-${PIWIK_VERSION}.tar.gz | tar xzf - -C /srv
	chown -R www-data:www-data /srv/piwik
fi

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

