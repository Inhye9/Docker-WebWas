#!/bin/bash
#### Container ENV ####
export TERM=vt100
export WEBTOBDIR=/home/tmax/webtob
export PATH=$PATH:$WEBTOBDIR/bin
export LD_LIBRARY_PATH=$WEBTOBDIR/lib
export SVRNAME=`hostname`

########## WebtoB  Alias #################
alias whome='cd ${WEBTOBDIR}'
alias wbin='cd ${WEBTOBDIR}/bin'
alias wcfg='cd ${WEBTOBDIR}/config'
alias wlog='cd /logs/webtob'

if [ -z $SERVERNAME ]; then export SERVERNAME=`hostname`; fi
sed -i "s/%SERVERNAME%/${SERVERNAME}/g" ${WEBTOBDIR}/config/http.m

if [ -z $HTH_COUNT ]; then export HTH_COUNT=@@HTH_COUNT@@; fi
sed -i "s/%HTH_COUNT%/${HTH_COUNT}/g" ${WEBTOBDIR}/config/http.m

if [ -z $APP_DOCROOT ]; then export APP_DOCROOT=/home/tmax/webtob/docs; fi
sed -i "s/%APP_DOCROOT%/${APP_DOCROOT}/g" ${WEBTOBDIR}/config/http.m

if [ -z $SHARED_DOCROOT ]; then export SHARED_DOCROOT=/home/tmax/webtob/docs/; fi
sed -i "s/%SHARED_DOCROOT%/${SHARED_DOCROOT}/g" ${WEBTOBDIR}/config/http.m

if [ -z $SERVICE_PORT ]; then export SERVICE_PORT=8080; fi
sed -i "s/%SERVICE_PORT%/${SERVICE_PORT}/g" ${WEBTOBDIR}/config/http.m

if [ -z $JEUS_DOMAIN ]; then export JEUS_DOMAIN="192.168.56.108:80"; fi
sed -i "s/%JEUS_DOMAIN%/${JEUS_DOMAIN}/g" ${WEBTOBDIR}/config/http.m

#if [ -z $JEUS_DOMAIN ]; then export JEUS_DOMAIN="jeusfin.apps.test.5cab.sandbox1869.opentlc.com:80"; fi
#sed -i "s/%JEUS_DOMAIN%/${JEUS_DOMAIN}/g" ${WEBTOBDIR}/config/http.m
