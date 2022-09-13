axel -a -n 64 https://www.php.net/distributions/php-8.1.10.tar.xz

#  安装依赖
sudo apt install -y pkg-config build-essential autoconf bison re2c \
                    libxml2-dev libsqlite3-dev
# 解压源码包                   
tar -Jxf php-8.1.10.tar.xz
# 进入源码包
cd php-8.1.10

# 源码包中一般情况下是自带配置文件的
# 如果像重新生成 -f 重新生成PHP发布包中的配置文件
# 这一步可以不执行
# ./buildconf --force 
#生成 Makefile
./configure
# 编译
make
# 编译完成后 开始安装
make install
# 查看是否安装成功
php -v