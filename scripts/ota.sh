#! /bin/bash
BASE_NAME=$(basename $0)
#EXE_NAME=$(basename $1)
FTP_SERVER=192.168.50.191
EXE_NAME=INDEMINDAPP_ICE_EVT3.1_1.1.3.0.deb
echo $EXE_NAME
echo "$BASE_NAME start. $(date +%Y/%m/%d-%H:%M:%S)" >> /tmp/$BASE_NAME.log
#cd workspaces
cd /home/li/workspaces
#remove old deb
rm -rf $EXE_NAME
#ftp download
wget --user=guest --password='guest' ftp://$FTP_SERVER/release/INDEMINDAPP/$EXE_NAME
if [[ "$?" -eq 0 ]] ; then
    echo "wget successful." >> /tmp/$BASE_NAME.log
    echo -e  "\033[32m wget succeful!  \033[0m"
else
    echo "wget failed. " >> /tmp/$BASE_NAME.log
    echo -e "\033[31m wget failed! \033[0m"
    exit 0;
fi
#uninstall

#install
sudo dpkg -i $EXE_NAME
if [[ "$?" -eq 0 ]] ; then
    echo "install successful." >> /tmp/$BASE_NAME.log
    echo -e "\033[32m install succeful!  \033[0m"
else
    echo "install failed. " >> /tmp/$BASE_NAME.log
    echo -e "\033[31m install failed! \033[0m"
    exit 0;
fi
#set init.d


