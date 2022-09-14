# 7ZIP
curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' https://mirror.nju.edu.cn/7-zip/7z2201.exe -o 7zip.exe

echo "安装"
.\7zip.exe /S /D="C:/soft/7zip"
ls "C:/soft/7zip"
echo "安装完成"

# 设置环境变量
[environment]::SetEnvironmentvariable("7ZIP", "C:/soft/7zip", "Machine")
# 设置Path变量
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "Machine"));%7ZIP%", "Machine")





