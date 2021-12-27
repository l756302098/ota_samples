#! /bin/bash
BASE_NAME=$(basename $0)
echo "$BASE_NAME start. $(date +%Y/%m/%d-%H:%M:%S)" >> /tmp/$BASE_NAME.log

# 检测 ./start_all.sh
start_all_id=`pgrep -ax start_all.sh | wc -l`
if [ $start_all_id -ne 0 ];then
    kill $(pgrep -ax start_all.sh) 2>&1
fi

# 启动 ./start_all.sh
cd /root/workspaces/scripts/
nohup ./start_all.sh > /dev/null 2>&1 &

exit 0
