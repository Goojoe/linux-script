import requests
from tqdm import tqdm
import os
from RainbowPrint import RainbowPrint as rp
import json
import re
proxies = {
    "http": "127.0.0.1:7891",
    "https": "127.0.0.1:7891"
}

def http_dl(file_name,url):

    r = requests.get(url, stream=True,proxies=proxies)

    # 获取文件大小
    file_size = int(r.headers['content-length'])

    # 如果文件存在获取文件大小，否在从 0 开始下载，
    first_byte = 0
    if os.path.exists(file_name):
        first_byte = os.path.getsize(file_name)
        
    # 判断是否已经下载完成
    if first_byte >= file_size:
        rp.info(f'{file_name}下载完成')
        return
    else:
        rp.info(f'{file_name}下载未完成,开始下载')

    # Range 加入请求头
    header = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36","Range": f"bytes={first_byte}-{file_size}"
        }

    # 加了一个 initial 参数
    with tqdm(total=file_size, unit='B', initial=first_byte, unit_scale=True, unit_divisor=1024, ascii=True, desc=file_name) as bar:
        # 加 headers 参数
        with requests.get(url, headers = header, stream=True,proxies=proxies) as r:
            with open(file_name, 'ab') as fp:
                for chunk in r.iter_content(chunk_size=1024):
                    if chunk:
                        fp.write(chunk)
                        bar.update(len(chunk))


http_dl("notosans.zip","https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/02_NotoSansCJK-TTF-VF.zip")


# https://api.github.com/repos/Zxilly/UA2F/releases/latest

def github_zip_dl(file_name,github_obj):
    github_obj = "https://api.github.com/repos/" + github_obj + "releases/latest"
    github_res = requests.get("https://api.github.com/repos/Zxilly/UA2F/releases/latest",proxies=proxies)
    github_data = github_res.content

    github_url = re.match(r"https://github\.com(.+?)releases/download/(.+?)\.(zip|7z|exe)",github_data)

    http_dl(file_name,github_url)


githubRes = requests.get("https://api.github.com/repos/agalwood/Motrix/releases/latest",proxies=proxies)

githubData = githubRes.json()

print(githubData["assets"]["browser_download_url"])