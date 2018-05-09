# -*- coding: utf-8 -*-
# Define your item pipelines here
# Don't forget to add your pipeline to the ITEM_PIPELINES Setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
import time
import MySQLdb.cursors
from twisted.enterprise import adbapi
import json
class ZuichengduPipeline(object):
    def __init__(self):
        self.dbpool = adbapi.ConnectionPool("MySQLdb",
                                            host='localhost',
                                            db='zuichengdu',
                                            user='root',
                                            passwd='root',
                                            # db="message",
                                            cursorclass=MySQLdb.cursors.DictCursor,
                                            charset="utf8",
                                            use_unicode=True
                                            )
    # 本函数用来处理返回的item字典.
    def process_item(self, item, spider):
        self.dbpool.runInteraction(self.insert, item)
    def insert(self, conn, item):
        sql_insert = "insert ignore into zuichengtu values('','%s','%s','%s')"%(item['title'],item['author'],item['time'])
        conn.execute(sql_insert)


