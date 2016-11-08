#!/bin/bash

if [ $TC_WAIT_FOR_PORT -gt 0 ]; then
	
	echo "Performing wait for a port"
	
	while ! echo exit | nc localhost $TC_WAIT_FOR_PORT; do
		echo "Waiting for port $TC_WAIT_FOR_PORT ...";
		sleep 2;
	done
	
fi

echo "Starting services"

/run-services.sh