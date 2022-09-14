#!powershell
echo "=====修改DNS====="
$adapter = Get-NetAdapter |?{$_.InterfaceDescription -ne "Microsoft KM-TEST Loopback Adapter"}
if ($adapter -ne $null) 
{
    $adapter | Rename-NetAdapter -NewName "Eth"
     disable-NetAdapterBinding -Name "Eth" -ComponentID ms_tcpip6
     netsh interface ipv4 set dns name="Eth" source=static address=114.114.114.114 primary
     netsh interface ipv4 add dnsserver name="Eth" address=223.5.5.5 index=2
    #  netsh interface ipv4 add dnsserver name="Eth" address=202.96.209.133 index=3
}
echo "=====刷新DNS缓存====="
ipconfig /flushdns

echo "=====安装PowerShell====="
winget install --id=Microsoft.PowerShell -e --accept-package-agreements --accept-source-agreements

echo "=====安装WindowsTerminal====="
winget install --id=Microsoft.WindowsTerminal.Preview -e --accept-package-agreements --accept-source-agreements

pause