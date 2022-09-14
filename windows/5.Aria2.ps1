# Aria2
curl "https://ghproxy.com/https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0-win-64bit-build1.zip" -o aria2.zip
echo "安装"
mkdir -p "C:/soft/aria2"
7z.exe e aria2.zip -oC:/soft/aria2
ls "C:/soft/aria2"
echo "安装完成"

# 设置环境变量
[environment]::SetEnvironmentvariable("ARIA2", "C:/soft/aria2", "Machine")
# 设置Path变量
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "Machine"));%ARIA2%", "Machine")
