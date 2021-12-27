#!/bin/bash

BASE_NAME=$(basename $0)
echo "$BASE_NAME start. $(date +%Y/%m/%d-%H:%M:%S)" >> /tmp/$BASE_NAME.log

EXE_NAME=ota_samples

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPTS_DIR

while true
do
    #检测
    ota_samples_id=`pgrep -ax ${EXE_NAME} | wc -l`
    if [ $ota_samples_id -eq 0 ];then
        nohup ./start_samples.sh start > /dev/null 2>&1 &
    fi

    sleep 1
done

exit 0
