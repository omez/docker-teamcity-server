#!/bin/bash

# copy JDBC connector

MYSQL_CONNECTOR_PATH="/mysql-connector-java-5.1.42/mysql-connector-java-5.1.42-bin.jar"
MYSQL_CONNECTOR_TARGET_DIR="$TEAMCITY_DATA_PATH/lib/jdbc"
mkdir -p $MYSQL_CONNECTOR_TARGET_DIR
cp -u -t $MYSQL_CONNECTOR_TARGET_DIR $MYSQL_CONNECTOR_PATH

if [ $TC_WAIT_FOR_PORT -gt 0 ]; then
	
	echo "Performing wait for a host/port"
	
	while [ ! $(nc $TC_WAIT_FOR_HOST $TC_WAIT_FOR_PORT)]; do
		echo "$(date): Waiting for $TC_WAIT_FOR_HOST:$TC_WAIT_FOR_PORT ...";
		sleep 2;
	done
	
fi

echo "Starting services..."
/run-services.sh