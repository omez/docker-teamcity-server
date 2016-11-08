#!/bin/bash

if [ $TC_WAIT_FOR_PORT -gt 0 ]; then
	
	echo "Performing wait for a host/port"
	
	while [ ! -z `nc $TC_WAIT_FOR_HOST $TC_WAIT_FOR_PORT`]; do
		echo "$(date): Waiting for $TC_WAIT_FOR_HOST:$TC_WAIT_FOR_PORT ...";
		sleep 2;
	done
	
fi

echo "Starting services"

/run-services.sh