
.PHONY:	chime
chime:	
	mkdir -p chime/
	cp ../chime-server/bin/chime-server ./chime
	cp ../chime-agent/bin/chime-agent ./chime
	sleep 1
#	cp ../chime-adm/bin/chimeadm ./chime
	tar -czvf chime.tgz ./chime



	
