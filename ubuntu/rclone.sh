echo "=====Rclone Install====="
axel -a -n 3 https://download.nuaa.cf/rclone/rclone/releases/download/v1.59.1/rclone-v1.59.1-linux-amd64.deb
dpkg -i rclone-v1.59.1-linux-amd64.deb
rclone version
echo "=====Rclone安装完成====="