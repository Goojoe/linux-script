echo "=====Rclone Install====="
axel -a -n 3 https://github.com/rclone/rclone/releases/download/v1.59.2/rclone-v1.59.2-linux-amd64.deb
dpkg -i rclone-v1.59.2-linux-amd64.deb
rclone version
echo "=====Rclone安装完成====="