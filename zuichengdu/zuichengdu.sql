/*
Navicat MySQL Data Transfer

Source Server         : scrapy
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : zuichengdu

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2018-01-20 19:56:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zuichengdu_cookies
-- ----------------------------
DROP TABLE IF EXISTS `zuichengdu_cookies`;
CREATE TABLE `zuichengdu_cookies` (
  `id` int(11) NOT NULL,
  `set_cookies` varchar(255) DEFAULT NULL,
  `set_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zuichengdu_cookies
-- ----------------------------
INSERT INTO `zuichengdu_cookies` VALUES ('0', '__cfduid=d4db2c50fee9751f740ec050aeb7038cf1516431432; cf_clearance=449352be77fba4a007bb155900ffe6f15e4c622b-1516431436-86400', '2018-01-20 14:57:18');

-- ----------------------------
-- Table structure for zuichengtu
-- ----------------------------
DROP TABLE IF EXISTS `zuichengtu`;
CREATE TABLE `zuichengtu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zuichengtu
-- ----------------------------
INSERT INTO `zuichengtu` VALUES ('1', '最近流行火盆烧烤的嘛！', '管姐勒', '2012-08-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('2', '最近流行火盆烧烤的嘛！', '管姐勒', '2012-08-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('3', '不比超市逊色的麻辣牛肉干', 'pplica110', '2012-08-29 00:00:00');
INSERT INTO `zuichengtu` VALUES ('4', '（转）探寻烧烤摊--营兴街红河包浆豆腐', 'pplica110', '2012-08-07 00:00:00');
INSERT INTO `zuichengtu` VALUES ('5', '论四川人与火锅的关系', 'grazy', '2018-01-19 00:00:00');
INSERT INTO `zuichengtu` VALUES ('6', '毛血旺', '成都都成1', '2018-01-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('7', '麻辣小天府为什么这么成功？最重要的是选址!', 'grazy', '2018-01-17 00:00:00');
INSERT INTO `zuichengtu` VALUES ('8', '舌尖上的唐昌古镇——吴鸭子', '狮子山下', '2016-07-27 00:00:00');
INSERT INTO `zuichengtu` VALUES ('9', '钢管厂和小龙坎', 'kingsbu', '2017-12-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('10', '白果林，出门就可以吃到全成都得美食', '成都小潮妹', '2017-11-17 00:00:00');
INSERT INTO `zuichengtu` VALUES ('11', '粗粮早餐：红薯饼', '游在水里的鱼', '2017-12-29 00:00:00');
INSERT INTO `zuichengtu` VALUES ('12', '成都市最正宗的绵阳米粉在啥子地方？', '破晓', '2012-08-13 00:00:00');
INSERT INTO `zuichengtu` VALUES ('13', '生意还是这么好啊？', '成都都成1', '2018-01-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('14', '水煮牛哇', '成都都成1', '2018-01-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('15', '天回镇粉蒸牛肉', '窗含西岭雪', '2017-12-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('16', '十米长龙蛋糕，你要吃吗？', '成功的吃货', '2014-07-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('17', '美食', 'cdjx', '2017-01-03 00:00:00');
INSERT INTO `zuichengtu` VALUES ('18', '自家养的山羊肉！大家给评评。。', '内江小高', '2017-10-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('19', '晒晒自家的饭', '达达麻麻', '2012-08-30 00:00:00');
INSERT INTO `zuichengtu` VALUES ('20', '老鸭粉丝汤', 'rh969', '2012-08-29 00:00:00');
INSERT INTO `zuichengtu` VALUES ('21', '不怕吃胖的火锅——鱼火锅', 'xiaoyuu91', '2016-10-28 00:00:00');
INSERT INTO `zuichengtu` VALUES ('22', '运动可以预防癌症吗？答案当然是——能！', 'pepelu', '2017-10-19 00:00:00');
INSERT INTO `zuichengtu` VALUES ('23', '锭子锅盔既充饥又当碗', '窗含西岭雪', '2014-11-18 00:00:00');
INSERT INTO `zuichengtu` VALUES ('24', '天回镇上“豆花面”', '窗含西岭雪', '2017-12-04 00:00:00');
INSERT INTO `zuichengtu` VALUES ('25', '大口吃肉，就要吃烧白才过瘾', '10086', '2012-08-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('26', '小炒肉，油腻腻的，适合肉食动物', 'rancho', '2012-08-23 00:00:00');
INSERT INTO `zuichengtu` VALUES ('27', '洗澡泡菜', '浣花船上', '2016-08-22 00:00:00');
INSERT INTO `zuichengtu` VALUES ('28', '重庆小吃夫妻肺片，麻婆豆腐', '恐高症', '2017-10-17 00:00:00');
INSERT INTO `zuichengtu` VALUES ('29', '重口味重口味，我们都爱吃辣子鸡', '浠范儿', '2012-08-28 00:00:00');
INSERT INTO `zuichengtu` VALUES ('30', '双楠附近哪里有味道好点的豆花吃？', 'kingsbu', '2017-12-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('31', '我做的粉蒸肉就是想吃肉', 'chengdu小豆', '2012-08-13 00:00:00');
INSERT INTO `zuichengtu` VALUES ('32', '15种花样排骨吃法，简单又美味', '小熊没有维尼', '2012-08-21 00:00:00');
INSERT INTO `zuichengtu` VALUES ('33', '食光公元的这家素食餐厅挺不错', '食光公元', '2017-05-15 00:00:00');
INSERT INTO `zuichengtu` VALUES ('34', '无美食，不午餐，无色彩，不生活', '四川人民', '2012-08-30 00:00:00');
INSERT INTO `zuichengtu` VALUES ('35', '钢管厂小俊干', 'zy646106', '2017-05-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('36', '【水煮肉片】私房做法6大关键秘诀', '达达麻麻', '2012-08-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('37', '味道成都，外地朋友来成都美食全攻略。绝对值得收藏', '熹嬢嬢', '2012-08-01 00:00:00');
INSERT INTO `zuichengtu` VALUES ('38', '双流县文星镇外面有太多好吃的了！先来凉面凉皮！', '默默数', '2012-08-07 00:00:00');
INSERT INTO `zuichengtu` VALUES ('39', '抹茶蜜豆慕斯蛋糕，我承认我很能干', '洋baby', '2012-08-29 00:00:00');
INSERT INTO `zuichengtu` VALUES ('40', '简单四步制作芒果冰棍，喜欢吃冷饮的孩子有福了', '四川人民', '2012-08-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('41', '来两道很黄很黄的美食~~', '美yoyo', '2012-08-24 00:00:00');
INSERT INTO `zuichengtu` VALUES ('42', '5类易失眠晚餐，你知多少？', '小熊没有维尼', '2012-08-23 00:00:00');
INSERT INTO `zuichengtu` VALUES ('43', '请教各位老师！', '辉辉太郎', '2017-03-23 00:00:00');
INSERT INTO `zuichengtu` VALUES ('44', '喝酸奶6大误区', '你的模样', '2012-08-23 00:00:00');
INSERT INTO `zuichengtu` VALUES ('45', '成都qiaqiagege里的美味', 'hxjzcdu', '2016-08-12 00:00:00');
INSERT INTO `zuichengtu` VALUES ('46', '勾魂土豆！冷面杀手！！', '辉辉太郎', '2017-03-22 00:00:00');
INSERT INTO `zuichengtu` VALUES ('47', '食鱼有道——秋季是吃鱼的最好时节！', 'xiaoyuu91', '2016-09-26 00:00:00');
INSERT INTO `zuichengtu` VALUES ('48', '热天的都要莫得了，还没吃过虾，今天整个高规格的白灼大虾', '浠范儿', '2012-08-22 00:00:00');
INSERT INTO `zuichengtu` VALUES ('49', '抹茶控，绿色控，甜食控，器皿控。', 'chengdu小豆', '2012-08-31 00:00:00');
INSERT INTO `zuichengtu` VALUES ('50', '成都白果上市：生吃多吃易中毒一天最多吃8颗', 'xjj', '2015-10-21 00:00:00');
INSERT INTO `zuichengtu` VALUES ('51', '尼玛看到太开胃了，忍不住复制粘贴哈', '切格瓦拉', '2012-08-17 00:00:00');
INSERT INTO `zuichengtu` VALUES ('52', '布依美食热糍粑想吃还要有说法', '窗含西岭雪', '2017-06-14 00:00:00');
INSERT INTO `zuichengtu` VALUES ('53', '巴黎贝甜中国第200家门店入驻宽窄巷子', '窗含西岭雪', '2017-09-04 00:00:00');
INSERT INTO `zuichengtu` VALUES ('54', '来了！成都首条地铁环线7号线全面开展空载运行！预计年底开通试运营！', '赵云1987', '2017-10-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('55', '【票选】成都四只鸡，你最爱吃哪只？', 'wallen', '2008-11-21 00:00:00');
INSERT INTO `zuichengtu` VALUES ('56', '辣白菜拌饭，很好吃的说…………', '洋baby', '2012-08-28 00:00:00');
INSERT INTO `zuichengtu` VALUES ('57', '中国34省市最出名的一道菜', '四川美丽', '2014-09-16 00:00:00');
INSERT INTO `zuichengtu` VALUES ('58', '爱吃冒菜的伙伴们，福利来啦，分享冒菜的做法哈', '像花一样的女子', '2013-12-02 00:00:00');
INSERT INTO `zuichengtu` VALUES ('59', '四川“烧饼”', '加油小伙伴', '2014-07-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('60', '剑门豆腐为啥好吃原来用的是“金豆豆”', '窗含西岭雪', '2017-06-06 00:00:00');
INSERT INTO `zuichengtu` VALUES ('61', '推荐这家永远在排队的店', 'zy646106', '2017-05-10 00:00:00');
INSERT INTO `zuichengtu` VALUES ('62', '找到宝了！发现了春熙路附近一家炒鸡好吃的冒菜', 'Sunshine1988', '2017-09-30 00:00:00');
INSERT INTO `zuichengtu` VALUES ('63', '红油抄手', 'tianxinyang', '2016-05-03 00:00:00');
INSERT INTO `zuichengtu` VALUES ('64', '求学在四川——四川大学周边美食攻略', '窗含西岭雪', '2014-06-18 00:00:00');
INSERT INTO `zuichengtu` VALUES ('65', '菠萝与米饭的完美结合---泰式菠萝饭', '顾小白', '2012-08-31 00:00:00');
INSERT INTO `zuichengtu` VALUES ('66', '火锅专家揭秘配方地道火锅一学就会', '窗含西岭雪', '2017-04-07 00:00:00');
INSERT INTO `zuichengtu` VALUES ('67', '流口水了诶，这么丰盛滴早餐', '顾小白', '2012-08-30 00:00:00');
INSERT INTO `zuichengtu` VALUES ('68', '内江牛肉面做法素有“巴蜀小吃之首”的美誉', '窗含西岭雪', '2015-12-07 00:00:00');
INSERT INTO `zuichengtu` VALUES ('69', '四川泡菜赋', '窗含西岭雪', '2016-12-06 00:00:00');
INSERT INTO `zuichengtu` VALUES ('70', '十大羊肉美食地，哪个最馋你？', 'bob365', '2012-03-07 00:00:00');
INSERT INTO `zuichengtu` VALUES ('71', '10月房贷额度趋紧各大行利率至少上浮5%', '赵云1987', '2017-10-13 00:00:00');
INSERT INTO `zuichengtu` VALUES ('72', '成都成华区两公园即将开放年内建50个小游园微绿地', '赵云1987', '2017-10-12 00:00:00');
INSERT INTO `zuichengtu` VALUES ('73', '黄金周“楼市”惨淡，什么样的好铺才能打动置业者的心', '赵云1987', '2017-10-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('74', '成都“东进”新增9条东西向和4条南北向快速路', '赵云1987', '2017-10-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('75', '包邮免费试吃', 'zhusun2', '2015-06-16 00:00:00');
INSERT INTO `zuichengtu` VALUES ('76', '“老妈”史桂如口口相传的兔头“王者”', '窗含西岭雪', '2017-01-18 00:00:00');
INSERT INTO `zuichengtu` VALUES ('77', '求问高新区或华阳哪里有好吃的炒河粉？', 'puhh', '2016-11-28 00:00:00');
INSERT INTO `zuichengtu` VALUES ('78', '万春卤菜', '扁卦大爷', '2016-02-26 00:00:00');
INSERT INTO `zuichengtu` VALUES ('79', '把你知道最好吃的早餐都交出来吧~嘿嘿', '天台之歌', '2015-09-08 00:00:00');
INSERT INTO `zuichengtu` VALUES ('80', '肯德基的蛋挞好贵，自己做哈看，味道还多可以的', 'chengdu小豆', '2012-08-22 00:00:00');
INSERT INTO `zuichengtu` VALUES ('81', '鹿港小镇成都第四店亮相大悦城', '窗含西岭雪', '2017-07-14 00:00:00');
INSERT INTO `zuichengtu` VALUES ('82', '成都民间厨师争霸“羊马渣渣面”', '窗含西岭雪', '2016-11-13 00:00:00');
INSERT INTO `zuichengtu` VALUES ('83', '好灶头是川菜也是美好的祝愿', 'hicoral', '2017-09-15 00:00:00');
INSERT INTO `zuichengtu` VALUES ('84', '成都银泰城哪家川菜最好吃？吃货请看这里，这道鱼吃的你爽歪歪！', 'hicoral', '2017-09-15 00:00:00');
INSERT INTO `zuichengtu` VALUES ('85', 'iherb优惠码，请捂好你的钱包！', 'qinmanson', '2017-09-08 00:00:00');
INSERT INTO `zuichengtu` VALUES ('86', '爱链车西南地区首家GOGO无人超市正式开业', 'forget7599', '2017-09-06 00:00:00');
INSERT INTO `zuichengtu` VALUES ('87', '【图】成都小伙网上卖椒麻鸡生意火爆引来日方投资', '窗含西岭雪', '2017-06-13 00:00:00');
INSERT INTO `zuichengtu` VALUES ('88', '自贡特色冷吃牛肉，兔', 'wjj000', '2017-02-27 00:00:00');
INSERT INTO `zuichengtu` VALUES ('89', '会理会东羊肉粉佐料要摆半张桌', '窗含西岭雪', '2017-07-18 00:00:00');
INSERT INTO `zuichengtu` VALUES ('90', '成都美食，味蕾搭建起的世界桥梁', '窗含西岭雪', '2017-07-07 00:00:00');
INSERT INTO `zuichengtu` VALUES ('91', '我在成都电视台《食不可挡》官微买“T5虾爆”代金券的遭遇', '王铁塔', '2017-06-09 00:00:00');
INSERT INTO `zuichengtu` VALUES ('92', '“大千干烧鱼”源于大千家传豆瓣鱼', '窗含西岭雪', '2017-06-02 00:00:00');
INSERT INTO `zuichengtu` VALUES ('93', '这一方红糖，甜出了我心中的味道', '梅西莱万', '2017-05-11 00:00:00');
INSERT INTO `zuichengtu` VALUES ('94', '德克士西南首家“舒食+”概念店落户成都', '窗含西岭雪', '2016-08-05 00:00:00');
INSERT INTO `zuichengtu` VALUES ('95', '【组图】飞哥：让成都美食和世界走得更近', '窗含西岭雪', '2017-01-09 00:00:00');
INSERT INTO `zuichengtu` VALUES ('96', '黑科技改变生活，EMS被动健身登陆成都', '积极的小太阳', '2016-12-19 00:00:00');
INSERT INTO `zuichengtu` VALUES ('97', '自贡：贡井牛肉街特色美味多', '窗含西岭雪', '2016-11-17 00:00:00');
INSERT INTO `zuichengtu` VALUES ('98', '愤怒的小鸟翻糖蛋糕【你舍得吃吗】', 'annysy', '2012-09-03 00:00:00');
INSERT INTO `zuichengtu` VALUES ('99', '免费吃鱼啦—年年有鱼贺国诞！', 'xiaoyuu91', '2016-09-29 00:00:00');
INSERT INTO `zuichengtu` VALUES ('100', '“好吃嘴”注意上海美食周来了', '窗含西岭雪', '2014-06-22 00:00:00');
