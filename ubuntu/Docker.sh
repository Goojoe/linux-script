echo "=====Docker Install====="
curl -fsSL https://get.docker.com | bash -s docker 
echo "Docker开机自启"
systemctl enable docker
docker version
echo "=====Docker安装完成====="
echo '修改Docker 镜像'
