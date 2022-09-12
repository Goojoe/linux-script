cat << EOF > /etc/apt/sources.list
deb https://mirrors.nju.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.nju.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.nju.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.nju.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.nju.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.nju.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.nju.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.nju.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# deb https://mirrors.nju.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.nju.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse"
EOF


cat /etc/apt/sources.list

apt update

# 安装常用软件
apt update && apt install -y \
curl \
wget \
git \
vim \
sudo \
gcc \
g++ \
make \
lrzsz \
python3 \
axel

echo "安装Nodejs"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt update && apt install -y nodejs
echo "修改npm镜像"
npm config set registry https://registry.npmmirror.com
npm config get registry
echo "安装yarn"
npm -g i yarn
echo "修改yarn镜像"
yarn config set registry https://registry.npmmirror.com
# 验证
yarn config get registry
node -v
npm -v
yarn -v
echo "=====Nodejs 安装完成====="


echo "安装Java"
axel -a -n 64 https://download.oracle.com/java/17/archive/jdk-17.0.4.1_linux-x64_bin.tar.gz
#创建安装目录
mkdir /usr/local/java/
#解压至安装目录
tar -zxvf jdk-17.0.4.1_linux-x64_bin.tar.gz -C /usr/local/java/
# 环境变量
cat << EOF >> /etc/profile
export JAVA_HOME=/usr/local/java/jdk-17.0.4.1
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
EOF
#使环境变量生效
source /etc/profile
#添加软连接
ln -s /usr/local/java/jdk-17.0.4.1/bin/java /usr/bin/java
java -version

echo "rclone安装"
axel -a -n 3 https://download.nuaa.cf/rclone/rclone/releases/download/v1.59.1/rclone-v1.59.1-linux-amd64.deb
dpkg -i rclone-v1.59.1-linux-amd64.deb
rclone version

# 安装 Docker
apt remove docker docker-engine docker.io containerd runc -y
apt update
curl -sSL https://get.daocloud.io/docker | sh
systemctl start docker
systemctl enable docker
docker version
echo "=====Docker安装完成====="
echo '修改Docker 镜像'


cat << EOF > /etc/docker/daemon.json
{
"registry-mirrors":
[
"https://xo75veh1.mirror.aliyuncs.com",
"https://mirror.ccs.tencentyun.com",
"https://hub-mirror.c.163.com",
"https://mirror.baidubce.com",
"https://registry.cn-hangzhou.aliyuncs.com"
]
}
EOF
cat /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker

# SSH Root登录
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

systemctl restart sshd

echo "SSH Root登录替换完成"
echo "=============脚本执行完毕============="
