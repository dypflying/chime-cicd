#!/bin/bash 

#uninstall old versions
if [ -f "/var/lib/chime/uninstall.sh" ]; then
	echo "uninstalling legacy chime versions ..."
	/var/lib/chime/uninstall.sh
	echo "chime legacy version uninstalled"
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
mkdir -p /etc/chime

#copy files 
echo -e "\t installing binaries ..."
cp chime/chime-server /usr/bin/
cp chime/server.yaml /etc/chime/
cp chime/chime-agent /usr/bin/
cp chime/agent.yaml /etc/chime/
cp chime/uninstall.sh /var/lib/chime/
chmod +x /var/lib/chime/uninstall.sh
#cp chime/chimeadm /usr/bin/

rm -rf chime
echo -e "\t chime installed!"
exit 0
