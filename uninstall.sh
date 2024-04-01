#!/bin/bash 

if [ "--force" == "$1" ]; then 
    #delete the /var/lib/chime
    rm -rf /var/lib/chime
    rm -rf /etc/chime
else 
    #delete the runtime  
    rm -f /var/lib/chime/*runtime
fi

#delete binaries
rm -f /usr/bin/chime-server
rm -f /usr/bin/chime-agent
rm -f /usr/bin/chimeadm