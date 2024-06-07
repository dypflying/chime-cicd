
(如果已经执行过，步骤#1和#2可省略)
1. CentOS-CICD 机挂载 CentOS 8.5.2111.iso 光盘，启动后:
mkdir -p /mnt/cdrom 
mount /dev/sr0 /mnt/cdrom

2. 同步数据到自建目录:
mkdir -p /soft/centos 
rsync -a /mnt/cdrom/ /soft/centos

3. 拷贝文件到 /soft/centos 
mdkir -p /soft/centos/packages/chime
mdkir -p /soft/centos/packages/mysql 
mdkir -p /soft/centos/packages/influxdb
mdkir -p /soft/centos/packages/minio 

#1 更新阿里云yum源
cp /etc/yum.repos.d/CentOS-Base.repo /soft/centos/packages

#2 拷贝mysql初始化文件(mysql初始root用户密码为空)
scp allinone/chime.sql  centos-cicd:/soft/centos/packages/mysql 

#3 拷贝influxdb安装程序
scp packages/influxdb/* centos-cicd:/soft/centos/packages/influxdb

#4 拷贝minio
cp /etc/default/minio /soft/centos/packages/minio 
scp packages/minio/minio.rpm centos-cicd:/soft/centos/packages/minio 
cp -R /mnt/minio /soft/centos/packages/minio/data

4. 拷贝ks.cfg 
scp allinone/ks.cfg centos-cicd:/soft/centos/isolinux/

5. 拷贝geniso.sh 
scp allinone/geniso.sh centos-cicd:/soft/centos/

6. 修改/soft/centos/isolinux/isolinux.cfg 文件，注意要制定ks.cfg为安装程序，另外禁止网卡自动命名，采用eth0
```
label linux
  menu label ^Install CentOS Linux 8
  kernel vmlinuz
  append initrd=initrd.img ks=cdrom:/isolinux/ks.cfg net.ifnames=0 biosdevname=0 quiet
```

7. 运行 geniso.sh 

/soft/centos/geniso.sh 
生成 ~/chime-centos8.5.2111.iso



