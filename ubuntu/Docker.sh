echo "=====Docker Install====="
axel -a -n 64 "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_20.10.18~3-0~ubuntu-jammy_amd64.deb"

apt install docker-ce-cli_20.10.18~3-0~ubuntu-jammy_amd64.deb -y
echo "启动Docker"
systemctl start docker
echo "Docker开机自启"
systemctl enable docker
docker version
echo "=====Docker安装完成====="
echo '修改Docker 镜像'
