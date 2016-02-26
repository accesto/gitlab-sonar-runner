#!/bin/bash
set -eo pipefail

if [ "${1:0:1}" = '-' ]; then
	set -- $SONAR_RUNNER_HOME/bin/sonar-runner "$@"
fi

if [ ! -z "$SONAR_URL" ]; then
	sed  -i "s|#sonar.host.url=.*|sonar.host.url=$SONAR_URL|g" "$SONAR_RUNNER_HOME/conf/sonar-runner.properties"
fi

if [ ! -z "$SONAR_LOGIN" ]; then
        sed  -i "s|#sonar.login=.*|sonar.login=$SONAR_LOGIN|g" "$SONAR_RUNNER_HOME/conf/sonar-runner.properties"
fi

if [ ! -z "$SONAR_PASSWORD" ]; then
        sed  -i "s|#sonar.password=.*|sonar.password=$SONAR_PASSWORD|g" "$SONAR_RUNNER_HOME/conf/sonar-runner.properties"
fi

exec "$@"
