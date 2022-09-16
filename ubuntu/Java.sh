echo "=====Java Install====="
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
echo "=====Java安装完成====="