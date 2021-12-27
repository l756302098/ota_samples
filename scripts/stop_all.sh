#!/bin/bash

BASE_NAME=$(basename $0)
echo "$BASE_NAME start. $(date +%Y/%m/%d-%H:%M:%S)" >> /tmp/$BASE_NAME.log

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

START_ALL_NAME=start_all.sh

#stop all
start_all_id=`pgrep -ax ${START_ALL_NAME} | awk '{print $1}'`
for id in $start_all_id
do
    kill -9 ${id}
done

#stop client
cd $SCRIPTS_DIR
./start_client.sh stop

#stop around_18r
cd $SCRIPTS_DIR
./start_around_18r.sh stop

exit 0
