import requests
from tqdm import tqdm
import os
from RainbowPrint import RainbowPrint as rp

proxies = {
    "http": "127.0.0.1:7891",
    "https": "127.0.0.1:7891"
}


def http_dl(file_name, url):

    r = requests.get(url, stream=True, proxies=proxies,allow_redirects=True,verify=False)

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
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36","Range": f"bytes={first_byte}-{file_size}"
    }

    # 加了一个 initial 参数
    with tqdm(total=file_size, unit='B', initial=first_byte, unit_scale=True, unit_divisor=1024, ascii=True, desc=file_name) as bar:
        # 加 headers 参数
        with requests.get(url, headers=header, stream=True, proxies=proxies,verify=False,allow_redirects=True) as r:
            with open(file_name, 'ab') as fp:
                for chunk in r.iter_content(chunk_size=10240,decode_unicode=True):
                    if chunk:
                        fp.write(chunk)
                        bar.update(len(chunk))


def github_dl(author,releases_num,file_name):

    github_res = requests.get(f"https://api.github.com/repos/{author}/releases/latest", proxies=proxies,verify=False,allow_redirects=True)
    # 获取json
    github_data = github_res.json()
    # 解析URL
    github_url = github_data["assets"][releases_num]["browser_download_url"]
    
    proxy_url = github_url.replace("https://github.com", "https://ghproxy.goojoe.top/https://github.com");
    print(proxy_url)
    # 下载
    http_dl(file_name,proxy_url)
