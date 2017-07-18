# Teamcity Server implementation


Executable command for service

```bash
docker run -it --name teamcity-server-instance  \
    -v <path to data directory>:/data/teamcity_server/datadir \
    -v <path to logs directory>:/opt/teamcity/logs  \
    -p <port on host>:8111 \
    -e TEAMCITY_SERVER_MEM_OPTS="-Xmx2g -XX:MaxPermSize=270m -XX:ReservedCodeCacheSize=350m" \
    omez/teamcity-server
```

Optionally available backup as

```bash
docker run -it --name teamcity-server-instance  \
    -v <path to data directory>:/data/teamcity_server/datadir  \
    -v <path to log directory>:/opt/teamcity/logs  \
    -p <port on host>:8111 \
    omez/teamcity-server \
    "/opt/teamcity/bin/maintainDB.sh" "backup"
```

#### Waiting for database or any else external connection before start

Two additional environment variables available

- TC_WAIT_FOR_HOST - used to wait until, for example, external database starts and available for connection
- TC_WAIT_FOR_PORT - the same as above, but port specified

So, complete service start command should be specified as follows:

```bash
docker run -it --name teamcity-server-instance  \
    -v <path to data directory>:/data/teamcity_server/datadir \
    -v <path to logs directory>:/opt/teamcity/logs  \
    -p <port on host>:8111 \
    -e TEAMCITY_SERVER_MEM_OPTS="-Xmx2g -XX:MaxPermSize=270m -XX:ReservedCodeCacheSize=350m" \
    -e TC_WAIT_FOR_HOST=<database-host> \
    -e TC_WAIT_FOR_PORT=3306 \
    omez/teamcity-server
```

exactly the same command used in teamcity-service example.



# Agent configuration
