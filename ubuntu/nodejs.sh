echo "=====Nodejs Install====="
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt update && apt install -y nodejs
echo "安装yarn"
npm -g i yarn
node -v
npm -v
yarn -v
echo "=====Nodejs安装完成====="