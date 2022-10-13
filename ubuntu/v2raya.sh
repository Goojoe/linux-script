#/bin/sh
apt install net-tools xsel
ip=`ip a | grep '192.168.*.*' | cut -c10-23`
port=":2017"
echo "安装xray内核"
bash -c "$(curl -L https://raw.iqiq.io/Goojoe/linux-script/master/ubuntu/xray.sh)" @ install
echo "启动服务"
sudo systemctl start xray.service
sudo systemctl enable xray.service

wget https://download.fastgit.org/v2rayA/v2rayA/releases/download/v1.5.9.1698.1/installer_debian_amd64_1.5.9.1698.1.deb
apt install ./installer_debian_amd64_*.deb
sudo systemctl start v2raya.service
sudo systemctl enable v2raya.service
curl -L localhost:2017

echo -e "\n======================"
echo 访问地址为:  ${ip}${port} 
echo 命令复制到剪贴板需要xmanager
echo  ${ip}${port} | xsel -b
echo 项目文档:
echo https://v2raya.org/docs/prologue/quick-start/
echo "======================"
