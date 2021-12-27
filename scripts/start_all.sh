#!/bin/bash

BASE_NAME=$(basename $0)
echo "$BASE_NAME start. $(date +%Y/%m/%d-%H:%M:%S)" >> /tmp/$BASE_NAME.log

ROSCORE_NAME=roscore
CLIENT_NAME=client
AROUND_18R_NAME=around_18r

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPTS_DIR

while true
do
    #检测roscore
    roscore_id=`pgrep -ax ${ROSCORE_NAME} | wc -l`
    if [ $roscore_id -eq 0 ];then
        nohup ./start_ros.sh start > /dev/null 2>&1 &
        nohup ./start_around_18r.sh restart > /dev/null 2>&1 &
        nohup ./start_client.sh restart > /dev/null 2>&1 &
    fi

    sleep 1

    #检测client
    client_id=`pgrep -ax ${CLIENT_NAME} | wc -l`
    if [ $client_id -eq 0 ];then
        #若client退出，则先restart around_18r，再启client
        nohup ./start_client.sh start > /dev/null 2>&1 &
        nohup ./start_around_18r.sh restart > /dev/null 2>&1 &
    fi

    sleep 1

    #检测around_18r
    around_18r_id=`pgrep -ax ${AROUND_18R_NAME} | wc -l`
    if [ $around_18r_id -eq 0 ];then
        nohup ./start_around_18r.sh start > /dev/null 2>&1 &
    fi

    sleep 1
done

exit 0
