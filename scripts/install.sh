#! /bin/bash

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "scripts path: $SCRIPTS_DIR"

# 放置守护进程脚本
cd $SCRIPTS_DIR
cp samples_service.sh  /etc/init.d/

# 设置自启动
cd /etc/init.d/
update-rc.d samples_service.sh defaults 90

exit 0
