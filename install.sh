#!/bin/bash 

#uninstall old versions
if [ -f "/var/lib/chime/uninstall.sh" ]; then
	echo -e "\t uninstalling legacy chime versions ..."
	/var/lib/chime/uninstall.sh "$1" 
	echo -e "\t ***** chime legacy version uninstalled ***** "
	echo ""
fi

#seperate the install zip package
TEMPFILE=/tmp/chime.tgz
echo -e "\t ready for installing chime package ..."

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

#copy files 
echo -e "\t installing binaries ..."
cp chime/chimeadm /usr/bin/
cp chime/chime-server /usr/bin/
cp chime/chime-agent /usr/bin/
cp chime/chimecli /usr/bin/

#copy systemd files
cp chime/chime-server.service /usr/lib/systemd/system/
cp chime/chime-agent.service /usr/lib/systemd/system/
systemctl daemon-reload
if [ -f /etc/chime/agent.yaml ]; then 
    if [ "--force" == "$1" ]; then 
	    cp chime/agent.yaml /etc/chime/
	fi
else 
    cp chime/agent.yaml /etc/chime/
fi 
if [ -f /etc/chime/server.yaml ]; then 
    if [ "--force" == "$1" ]; then 
	    cp chime/server.yaml /etc/chime/
	fi
else 
    cp chime/server.yaml /etc/chime/
fi 
cp chime/uninstall.sh /var/lib/chime/
chmod 755 /var/lib/chime/uninstall.sh

rm -rf chime
echo -e "\t ***** chime installed successfully ***** !"
exit 0
