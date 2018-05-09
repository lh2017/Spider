#coding=utf8
import os
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import time
import MySQLdb
from datetime import datetime
import logging
def phantomjs_requests(url):
    headers = {'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
               'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
               'User-Agent': 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0',
               'Connection': 'keep-alive',
               }
    dcap = dict(DesiredCapabilities.PHANTOMJS)
    for key, value in headers.iteritems():
        dcap['phantomjs.page.customHeaders.{}'.format(key)] = value
    dcap['phantomjs.page.settings.loadImages'] = False
    phantomjs_path = os.getenv('executable_path')
    driver = webdriver.PhantomJS(executable_path=phantomjs_path, desired_capabilities=dcap)
    driver.implicitly_wait(10)
    driver.set_page_load_timeout(15)
    driver.set_script_timeout(15)
    driver.get(url)
    return driver
def save_cookies(cookie):
    db = MySQLdb.connect("localhost", "root", "root", "zuichengdu", charset="utf8")
    cur = db.cursor()
    temp_now=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    logging.warning('保存最成都cookies')
    sql="update zuichengdu_cookies set set_cookies='%s',set_time='%s'"%(cookie,temp_now)
    cur.execute(sql)
    db.commit()
    logging.warning('保存成功')
    cur.close()
    db.close()
if __name__=='__main__':
    logging.basicConfig(level=logging.WARNING, filename="cookies_zuichengdu.txt", filemode="a",
                        format="%(asctime)s-%(message)s")
    text_url='http://www.chengtu.com/'
    driver=phantomjs_requests(text_url)
    time.sleep(5)
    cfduid=driver.get_cookie('__cfduid')['value']
    clearance=driver.get_cookie('cf_clearance')['value']
    Cookie='__cfduid=%s;cf_clearance=%s'%(cfduid,clearance)
    save_cookies(Cookie)



