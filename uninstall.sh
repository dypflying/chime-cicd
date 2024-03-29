#!/bin/bash 

#delete the chime home 
rm -rf /var/lib/chime

#backup the configuration file
if [ -f /etc/chime/server.yaml ]; then 
    mv /etc/chime/server.yaml /etc/chime/server.yaml_bak
fi
if [ -f /etc/chime/agent.yaml ]; then 
    mv /etc/chime/agent.yaml /etc/chime/agent.yaml_bak
fi

#delete binaries
rm -f /usr/bin/chime-server
rm -f /usr/bin/chime-agent
rm -f /usr/bin/chimeadm