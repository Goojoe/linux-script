# 弃用
echo "弃用"
cat << EOF >> /etc/wgetrc
use_proxy = on
http_proxy = http://127.0.0.1:20171/
https_proxy = http://127.0.0.1:20171/
EOF