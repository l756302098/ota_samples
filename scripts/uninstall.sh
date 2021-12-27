#! /bin/bash

# 取消自启动
cd /etc/init.d/
update-rc.d -f new_service.sh remove

# 移除脚本
cd /etc/init.d/
rm new_service.sh

exit 0
