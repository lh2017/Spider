# -*- coding: utf-8 -*-
import json
import os
import sys
import urllib2
from hashlib import md5
import requests
import time

base_dir = os.getenv("SCRAPY_BASE_DIR")
sys.path.append(base_dir)
# 导入爬虫模板的spider类
from Allspider_I import AllSpider
# 导入爬虫模板的item类
from Allitems import AllItem
import traceback
import re
# 以下是可能加载的类或函数。
import scrapy


class SpiderSpider(AllSpider):
    name = "spider"
    allowed_domains = ["http://www.scuinfo.com/"]

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
            url_c = "http://www.scuinfo.com/api/post?id=" + li[0].split(u'id=')[-1]
            Time = {'url': url_c, 'li': li[1], 'last': li[2], 'current_year': self.current_year,
                    'current_md': self.current_md}
            Time['page'] = 1
            Time['page_c'] = 0
            Time['nowcmp'] = self.nowcmp
            Time['current_month'] = current_month
            yield scrapy.Request(url_c, meta=Time, method="GET", headers=self.headers, callback=self.parse, dont_filter=True)

    def parse_comment_url(self, ids):
        result_url = "http://www.scuinfo.com/api/comments/?postId=%s&pageSize=15" % str(ids)
        return result_url

    def parse(self, response):
        self.parse_module(response)
        # 传递参数
        p = response.meta
        jsons = json.loads(response.body)

        sel = jsons['data']
        try:
            # 存放时间，查找最小时间。判断是否翻页。
            first_page_max_lastdate = []
            item = AllItem()
            authors = sel['nickname']
            item['author'] = self.filter_keyword(authors)
            id_s = sel['id']
            comCount = sel['commentCount']
            a = sel['content']
            c = '\xF0\x9F\x98\x9D'.decode("gbk")
            comments = a.replace(u'\xF0\x9F\x98\x9D', u'qqqqqqq')

            item['comments'] = self.filter_keyword(comments)
            item['website'] = p['url']
            item['is_content'] = '1'
            time_c = sel['date']
            item['time'] = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time_c))
            item['img_link'] = ''
            if item['comments']:
                item['c_id'] = md5(item['comments'].encode("utf8")).hexdigest()
            # 否则用图片或者动态图片链接组【可能是多个图片】生成md5校验码
            else:
                item['c_id'] = md5(item['img_link']).hexdigest()
            item['status'], item['word'] = self.sign_keyword(item['comments'])
            first_page_max_lastdate.append(item['time'])
            if not p['last']:
                # 获取规定时间内的评论
                if item['time'] >= self.two_days_ago:
                    yield item
                else:
                    pass
            # 不为空则就不是第一次爬取，也就是说refertable表中有lastdate
            else:
                if item['time'] >= str(p['last']):
                    yield item
                else:
                    pass
            if comCount > 0:
                url = self.parse_comment_url(id_s)
                p['url'] = url
                p['comCount'] = comCount
                yield scrapy.Request(url, headers=self.headers, meta=p, callback=self.parse_comment, dont_filter=True)
            else:
                pass

        except:
            self.cw_info = traceback.format_exc()+response.url
            return


    def parse_comment(self, response):
        self.response = response
        p = response.meta
        jsons = json.loads(response.body)
        sel = jsons['data']
        try:
            first_page_max_lastdate = []
            item = AllItem()
            for js in sel:
                authors = js['nickname']
                item['author'] = self.filter_keyword(authors)
                id_s = js['id']
                comment = js['content'].replace(' ', '').replace(u'\n', '')
                item['comments'] = self.filter_keyword(comment)
                item['website'] = p['url']
                item['is_content'] = '0'
                time_c = js['date']
                item['time'] = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time_c))
                item['img_link'] = ''
                if item['comments']:
                    item['c_id'] = md5(item['comments'].encode("utf8")).hexdigest()
                # 否则用图片或者动态图片链接组【可能是多个图片】生成md5校验码
                else:
                    item['c_id'] = md5(item['img_link']).hexdigest()
                item['status'], item['word'] = self.sign_keyword(item['comments'])
                first_page_max_lastdate.append(item['time'])
                if not p['last']:
                    # 获取规定时间内的评论
                    if item['time'] >= self.two_days_ago:
                        yield item
                    else:
                        pass
                # 不为空则就不是第一次爬取，也就是说refertable表中有lastdate
                else:
                    if item['time'] >= str(p['last']):
                        yield item
                    else:
                        pass

        except:
            self.cw_info = traceback.format_exc()+response.url
            return




