#!/bin/sh

. ${SCRIPT_HOME}/env.sh

${JEUS_HOME}/bin/stopServer -host localhost:$BASE_PORT -u $JEUS_USER -p $PASSWORD -g
