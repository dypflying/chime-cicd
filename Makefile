
.PHONY:	chime
chime: clean
	@mkdir -p output/chime
	cp ../chime-server/bin/chime-server output/chime
	cp ../chime-server/conf/server.yaml output/chime
	cp ../chime-agent/bin/chime-agent output/chime
	cp ../chime-agent/conf/agent.yaml output/chime
	cp install.sh output/
	cp uninstall.sh output/chime
#	cp ../chime-adm/bin/chimeadm ./chime
	@sleep 1
	tar -czvf output/chime.tgz output/chime
	cat output/install.sh output/chime.tgz > output/chime.bin 
	@chmod +x output/chime.bin 

.PHONY: clean
clean:
	@rm -rf output/	
	@echo "clean ok"
