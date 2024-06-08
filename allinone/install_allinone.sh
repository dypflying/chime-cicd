#!/bin/bash 

#seperate the install zip package
TEMPFILE=/tmp/allinone.tgz
echo -e "\t ready for installing chime allinone package ..."

#seperate the package
sed -n -e '1,/^exit 0$/!p' $0 > ${TEMPFILE} 2>/dev/null
tar xzf ${TEMPFILE} --strip-components 1 -C /tmp
rm -f ${TEMPFILE}

cd /tmp

#install directories 
echo -e "\t initiating directories ..."
mkdir -p /var/log/chime
mkdir -p /var/lib/chime
mkdir -p /var/lib/chime/server
mkdir -p /var/lib/chime/uploads
mkdir -p /var/lib/chime/portal/uploads
mkdir -p /var/lib/chime/agent/cloudinit
mkdir -p /etc/chime
mkdir -p /mnt/local/backend/volumes
mkdir -p /mnt/local/cache

#copy files 
echo -e "\t installing binaries ..."
cp -f allinone/chime-server /usr/bin/
cp -f allinone/chime-agent /usr/bin/
cp -f allinone/chimecli /usr/bin/

#copy systemd files
cp -f allinone/chime-server.service /usr/lib/systemd/system/
cp -f allinone/chime-agent.service /usr/lib/systemd/system/
systemctl daemon-reload

#copy config files 
if [ -f /etc/chime/agent.yaml ]; then 
    if [ "--force" == "$1" ]; then 
	    cp -f allinone/agent.yaml /etc/chime/
	fi
else 
    cp allinone/agent.yaml /etc/chime/
fi 
if [ -f /etc/chime/server.yaml ]; then 
    if [ "--force" == "$1" ]; then 
	    cp -f allinone/server.yaml /etc/chime/
	fi
else 
    cp allinone/server.yaml /etc/chime/
fi 

#copy dynamic libriaries
cp allinone/librados.so.2.0.0 /lib64/
ln -sf /lib64/librados.so.2.0.0 /lib64/librados.so.2 
ln -sf /lib64/librados.so.2 /lib64/librados.so
cp allinone/librbd.so.1.17.0 /lib64/
ln -sf /lib64/librbd.so.1.17.0 /lib64/librbd.so.1 
cp allinone/libceph-common.so.2 /lib64/ceph/
ln -sf /lib64/ceph/libceph-common.so.2 /lib64/ceph/libceph-common.so

#initiate mysql tables 
/usr/bin/mysql < allinone/sql/admin.sql >> /tmp/chime-config.log 2>&1
/usr/bin/mysql < allinone/sql/chime.sql >> /tmp/chime-config.log 2>&1
/usr/bin/mysql < allinone/sql/portal.sql >> /tmp/chime-config.log 2>&1

#initiate influxdb
/usr/bin/influx setup --username chime-user --password passw0rd --token hshuKMUoyEyfjl-aWwd_PS1oRNTL2LhwyaZhTLuJink63BsqM-QoV4qJ-IYtbnTCMBM8wG0FjX7wW4JPF-RiMg== --org chime --bucket chime --force --name chime >> /tmp/chime-config.log 2>&1

rm -rf allinone 
echo -e "\t ***** chime allinone installed successfully ***** !"
exit 0
