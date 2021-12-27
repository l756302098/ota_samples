#! /bin/bash

# 取消自启动
cd /etc/init.d/
update-rc.d -f samples_service.sh remove

# 移除脚本
cd /etc/init.d/
rm samples_service.sh

exit 0
