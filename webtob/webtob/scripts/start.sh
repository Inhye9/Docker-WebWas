#!/bin/bash
. /home/tmax/scripts/env.sh

##### IPCS Check #####
IPCS1=`ipcs | grep 0000d2f0 | wc -l`
IPCS2=`ipcs | grep 0000d2f1 | wc -l`
IPCS3=`ipcs | grep 0000d2f2 | wc -l`
if [ $IPCS1 != 0 ]; then 
   ipcrm -M 0x0000d2f0
fi
if [ $IPCS2 != 0 ]; then 
   ipcrm -M 0x0000d2f1
fi
if [ $IPCS3 != 0 ]; then 
   ipcrm -M 0x0000d2f2
fi

##### LOGGING Setting #####
SVRNAME=`hostname`
SVRIP=`hostname -i`
sed -i "s/@@SVRNAME@@/${SVRNAME}/g" ${WEBTOBDIR}/config/http.m
sed -i "s/@@SVRIP@@/${SVRIP}/g" ${WEBTOBDIR}/config/http.m

$WEBTOBDIR/bin/wsboot -c $WEBTOBDIR/config/http.m -V

#${HTH_COUNT} ${APP_DOCROOT} ${SERVICE_DOMAIN} ${SERVICE_PORT} ${WORKER_THREAD} ${PATH_PREFIX} ${SERVER_PREFIX}
