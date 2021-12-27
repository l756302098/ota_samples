#!/bin/bash

BASE_NAME=$(basename $0)
echo "$BASE_NAME start. $(date +%Y/%m/%d-%H:%M:%S)" >> /tmp/$BASE_NAME.log

script_name=$(basename $0)
result_log=/var/log/${script_name}".log"

log_with_time() {
    local now_time=$(date +%Y/%m/%d-%H:%M:%S)
    echo "$now_time: $*" >>$result_log
}

do_start() {
    export QT_QPA_PLATFORM=wayland
    export XDG_RUNTIME_DIR=/tmp/.xdg
    cd /root/workspace/client/
    nohup ./client > /dev/null 2>&1 &
}

do_stop() {
    kill $(pgrep -ax client) >>$result_log 2>&1
}

log_with_time "[BEGIN] $0 $*."

case "$1" in
start)
    do_start
    ;;
stop)
    do_stop
    ;;
restart)
    do_stop
    do_start
    ;;
*)
    log_with_time "Wrong parameter: $*."
    ;;
esac

log_with_time "[END] $0 $*."
exit 0

