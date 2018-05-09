# -*- coding: utf-8 -*-
import requests
from zuichengdu.items import ZuichengduItem

import MySQLdb
import scrapy
import traceback
import time
class TianyaltSpider(scrapy.spiders.Spider):
    name = "chengtu"
    allowed_domains = ["www.chengtu.com"]
    custom_settings = {
        'ROBOTSTXT_OBEY': False,
        # 设置谷歌cookies，不管登录信息
        'COOKIES_ENABLED': False,
        'HTTPERROR_ALLOWED_CODES': [200, 400, 401, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416,
                                    417, 500, 501, 502, 503, 504, 505],
        'ITEM_PIPELINES': { 'zuichengdu.pipelines.ZuichengduPipeline': 300,#保存到mysql数据库
                              },
    }
    def __init__(self):
        pass
    #获取事先获取好的最成都cookies
    def getcookies(self):
        db = MySQLdb.connect("localhost", "root", "root", "zuichengdu", charset="utf8")
        cur = db.cursor()
        sql="select set_cookies from zuichengdu_cookies"
        cur.execute(sql)
        result=cur.fetchall()
        cur.close()
        db.close()
        return result
    def start_requests(self):
        cookies = self.getcookies()[0][0]
        self.headers = {'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                        'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
                        'User-Agent': 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0',
                        'Connection': 'keep-alive',
                        'Cookie': cookies
                        }
        Meta={}
        Meta['page']=1
        yield scrapy.Request(url='http://www.chengtu.com/forum.php?mod=forumdisplay&fid=11',meta=Meta,callback=self.parse,headers=self.headers,dont_filter=True)

    def parse(self, response):
        p=response.meta
        try:
            #for循环遍历一页的所有数据
            for sel in response.xpath("//tbody[starts-with(@id,'normalthread')]"):
                item = ZuichengduItem()
                titles = ''
                for title in sel.xpath('.//a[@class="xst"]/text()').extract()[0]:
                    titles = titles + title.strip()
                title_com = ''
                for title_c in titles.splitlines():
                    title_com = title_com + title_c.strip()
                item['title']=title_com
                print item['title']
                author=sel.xpath('.//td[@class="by"][1]/cite/a/text()').extract().pop()
                item['author'] = author
                s_time=''
                if sel.xpath('.//td[@class="by"][1]//em//span[@title]/@title'):
                    s_time = sel.xpath('.//td[@class="by"][1]//em//span[@title]/@title').extract().pop()
                else:
                    s_time=sel.xpath(".//td[2]//span/text()").extract()[0]
                item['time'] = time.strftime("%Y-%m-%d %H:%M:%S", time.strptime(s_time, "%Y-%m-%d"))
                print item['title'],item['author'],item['time']
                yield item
            #默认翻2页
            if p['page']>=2:
                return
            #判断是否有翻页
            if response.xpath(".//*[@id='fd_page_top']/div/label/span/@title"):
                total_page=response.xpath(".//*[@id='fd_page_top']/div/label/span/@title").extract()[0].replace(u'共 ','').replace(u' 页','')
                if p['page']<=total_page:
                    p['page'] = p['page'] + 1
                    url = response.url + '&page=' + str(p['page'])
                    yield scrapy.Request(url, meta=p, callback=self.parse,headers=self.headers)
        except:
            self.cw_info = traceback.format_exc()
            return
