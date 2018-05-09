# -*- coding: utf-8 -*-
import json
import os
import sys
import urllib2
from datetime import datetime
from datetime import timedelta
import MySQLdb
import requests
base_dir = os.getenv("SCRAPY_BASE_DIR")
sys.path.append(base_dir)
from Allitems import AllItem
from T_Allspider import AllSpider
import scrapy
import traceback
import time


class SpiderSpider(AllSpider):
    name = "spider"
    allowed_domains = ["www.scuinfo.com"]

    def __init__(self):
        AllSpider.__init__(self)

        self.headers = {
            'Host': 'www.scuinfo.com',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0',
            'Accept': '*/*',
            'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
            'Accept-Encoding': 'gzip, deflate',
            'Referer': 'http://www.scuinfo.com/',
            'Connection': 'keep-alive',
        }


    def start_requests(self):
        current_year = time.strftime("%Y", time.localtime())
        current_md = time.strftime("%m-%d", time.localtime())
        current_month = time.strftime("%m", time.localtime())
        self.nowcmp = time.strftime("%m-%d %H:%M", time.localtime())
        self.current_year = time.strftime("%Y", time.localtime())
        self.current_md = time.strftime("%m-%d", time.localtime())
        current_month = time.strftime("%m", time.localtime())
        list = self.geturlfromdb()
        if not list:
            return
        self.putdatetodb(self.now)
        for li in list:
            # session = requests.Session()
            pre_url = "http://www.scuinfo.com/api/posts?pageSize=15"
            ww = requests.get(pre_url, headers=self.headers)
            cookies = ''
            for i in ww.cookies:
                cookies += i.name + "=" + i.value + ";"
            # print resp
            end_cookies = cookies.strip(";")
            # 将自动生成的cookies添加到headers
            self.headers["Cookie"] = end_cookies
            Time = {'url': li[0], 'li': li[1], 'last': li[2], 'current_year': self.current_year,
                    'current_md': self.current_md}
            Time['page'] = 1
            Time['page_c'] = 0
            Time['nowcmp'] = self.nowcmp
            Time['current_month'] = current_month
            yield scrapy.Request(li[0], meta=Time, method="GET", headers=self.headers, callback=self.parse, dont_filter=True)


    def getnextpageurl(self, ids):
        urls ="http://www.scuinfo.com/api/posts?pageSize=15&fromId=" + str(ids)
        return urls

    def parse(self, response):
        self.response = response
        p = response.meta
        jsons = json.loads(response.body)
        js = jsons['data']
        try:
            first_page_max_lastdate = []
            id_list = []
            for sel in js:
                item = AllItem()
                authors = sel['nickname']
                id_s = sel['id']
                item['author'] = self.filter_keyword(authors)
                titles = str(sel['title'].replace(' ','').replace('\n', ''))

                item['title'] = self.filter_keyword(titles)
                item['website'] = "http://www.scuinfo.com/#page=detail&id=" + str(id_s)
                time_c = sel['date']
                item['time'] = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time_c))
                item['reply'] = str(sel['commentCount'])
                view = '0'
                item['view'] = view
                item['status'] = "0"
                item['last_rtime'] = item['time']
                item['last_ruser'] = ''
                item['ofmodule'] = p['li']
                first_page_max_lastdate.append(item['time'])
                id_list.append(id_s)
                yield item

            if p['page_c'] == 1:
                return
            else:
                pass
            if not p['last']:
                p['page_c'] = 1
                p['page'] = p['page'] + 1
                url = self.getnextpageurl(min(id_list))
                print url
                yield scrapy.Request(url, headers=self.headers, meta=p, callback=self.parse)
            else:
                l = min(first_page_max_lastdate)
                if l >= str(p['last']):
                    p['page'] = p['page'] + 1
                    url = self.getnextpageurl(min(id_list))
                    yield scrapy.Request(url, headers=self.headers, meta=p, callback=self.parse)
                else:
                    return
        except:
            self.cw_info = traceback.format_exc() + response.url
            return