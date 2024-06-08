
.PHONY:	chime
chime:
	@rm -rf output/chime
	cp ../chime-server/bin/chime-server output/chime
	cp ../chime-server/bin/chimecli output/chime
	cp ../chime-server/conf/server.yaml output/chime
	cp ../chime-server/systemd/chime-server.service output/chime
	cp ../chime-agent/bin/chime-agent output/chime
	cp ../chime-agent/conf/agent.yaml output/chime
	cp ../chime-agent/systemd/chime-agent.service output/chime
	cp ../chime-adm/bin/chimeadm output/chime
	cp install.sh output/
	cp uninstall.sh output/chime
	@sleep 2
	tar -czvf output/chime.tgz output/chime
	cat output/install.sh output/chime.tgz > output/chime.bin 
	@chmod +x output/chime.bin 

.PHONY: clean
clean:
	@rm -rf output
	@echo "clean ok"

.PHONY: allinone
allinone:
	@rm -rf output/allinone
	@mkdir -p output/allinone
	cp ../chime-server/bin/chime-server output/allinone/
	cp ../chime-server/bin/chimecli output/allinone/
	cp allinone/chime/server.yaml output/allinone/
	cp ../chime-server/systemd/chime-server.service output/allinone/
	cp ../chime-agent/bin/chime-agent output/allinone/
	cp allinone/chime/agent.yaml output/allinone/
	cp ../chime-agent/systemd/chime-agent.service output/allinone/
	cp allinone/chime/libceph-common.so.2 output/allinone/
	cp allinone/chime/librados.so.2.0.0 output/allinone/
	cp allinone/chime/librbd.so.1.17.0 output/allinone/
	cp -R allinone/sql output/allinone/
	cp allinone/install_allinone.sh output/
	@sleep 2
	tar -czvf output/allinone.tgz output/allinone
	cat output/install_allinone.sh output/allinone.tgz > output/chime_allinone.bin 
