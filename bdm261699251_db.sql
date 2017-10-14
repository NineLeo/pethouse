/*
Navicat MySQL Data Transfer

Source Server         : Ali
Source Server Version : 50173
Source Host           : bdm261699251.my3w.com:3306
Source Database       : bdm261699251_db

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-04-24 20:34:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collect_goods
-- ----------------------------
DROP TABLE IF EXISTS `collect_goods`;
CREATE TABLE `collect_goods` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `gid` int(11) NOT NULL COMMENT '商品ID',
  `gname` varchar(255) DEFAULT NULL COMMENT '商品名字',
  UNIQUE KEY `uid` (`uid`,`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect_goods
-- ----------------------------
INSERT INTO `collect_goods` VALUES ('3', '6', '小狗服饰');
INSERT INTO `collect_goods` VALUES ('2', '1', '维嘉狗粮');

-- ----------------------------
-- Table structure for collect_pets
-- ----------------------------
DROP TABLE IF EXISTS `collect_pets`;
CREATE TABLE `collect_pets` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `pid` int(11) DEFAULT NULL COMMENT '宠物ID',
  `pname` varchar(255) DEFAULT NULL COMMENT '宠物名字',
  UNIQUE KEY `uid` (`uid`,`pid`,`pname`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect_pets
-- ----------------------------
INSERT INTO `collect_pets` VALUES ('1', '1', '哈士奇');
INSERT INTO `collect_pets` VALUES ('2', '1', '哈士奇');
INSERT INTO `collect_pets` VALUES ('2', '3', '贵宾犬');
INSERT INTO `collect_pets` VALUES ('2', '7', '柴犬');
INSERT INTO `collect_pets` VALUES ('2', '8', '萨摩耶犬');
INSERT INTO `collect_pets` VALUES ('2', '11', '大丹犬');
INSERT INTO `collect_pets` VALUES ('2', '16', '波斯猫');
INSERT INTO `collect_pets` VALUES ('2', '18', '日本短尾猫');
INSERT INTO `collect_pets` VALUES ('6', '2', '藏獒');
INSERT INTO `collect_pets` VALUES ('24', '17', '埃及猫');

-- ----------------------------
-- Table structure for collect_stores
-- ----------------------------
DROP TABLE IF EXISTS `collect_stores`;
CREATE TABLE `collect_stores` (
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `sid` int(11) DEFAULT NULL COMMENT '商店ID',
  `sname` varchar(255) DEFAULT NULL COMMENT '商店名字',
  UNIQUE KEY `uid` (`uid`,`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect_stores
-- ----------------------------
INSERT INTO `collect_stores` VALUES ('1', '1', '郭斯特宠物用品店');
INSERT INTO `collect_stores` VALUES ('2', '2', null);

-- ----------------------------
-- Table structure for comments_statuses
-- ----------------------------
DROP TABLE IF EXISTS `comments_statuses`;
CREATE TABLE `comments_statuses` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表的主键id',
  `text` text COMMENT '评论内容',
  `th_com_pic` varchar(255) DEFAULT NULL COMMENT '评论图片缩略图链接',
  `com_pic` varchar(255) DEFAULT NULL COMMENT '评论图片原图链接',
  `mid` int(11) DEFAULT NULL COMMENT '状态ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments_statuses
-- ----------------------------
INSERT INTO `comments_statuses` VALUES ('1', '评论1', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', '2', '2', '2017-03-23 16:23:17');
INSERT INTO `comments_statuses` VALUES ('2', '评论2', 'http://wx4.sinaimg.cn/mw690/61e75fb8gy1fd8cgcfytxj212e1kwqow.jpg', 'http://wx4.sinaimg.cn/mw690/61e75fb8gy1fd8cgcfytxj212e1kwqow.jpg', '3', '3', '2017-03-01 16:23:20');
INSERT INTO `comments_statuses` VALUES ('3', '评论3', '', null, '4', '4', '2017-03-02 16:23:15');
INSERT INTO `comments_statuses` VALUES ('4', '评论4', null, null, '5', '1', '2017-03-02 16:23:50');
INSERT INTO `comments_statuses` VALUES ('5', '评论5', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', '2', '2', '2017-03-23 16:23:17');
INSERT INTO `comments_statuses` VALUES ('6', '评论1', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', '2', '2', '2017-03-23 16:23:17');
INSERT INTO `comments_statuses` VALUES ('7', '评论1', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', 'http://wx2.sinaimg.cn/mw690/66b6e1c4ly1fd8b2k07xjj20ja0ixdg0.jpg', '2', '2', '2017-03-23 16:23:17');
INSERT INTO `comments_statuses` VALUES ('8', '评论27', null, null, '12', '3', '2017-03-09 17:40:30');
INSERT INTO `comments_statuses` VALUES ('9', '当然，也不是每一张票都的库存都完全这样实时计算，可以根据往年的运营情况，在黄金周这样的高峰时段，预先对票', null, null, '1', '3', '2017-03-17 13:25:44');
INSERT INTO `comments_statuses` VALUES ('10', '想象一下，8万人举着钱对你高喊：卖给我。你好不容易在钱堆里找到一只手，拿了他的钱，转身找120个同事，告诉他们减库存，而这120个同事也和', null, null, '1', '3', '2017-03-22 13:25:57');
INSERT INTO `comments_statuses` VALUES ('11', '再说一下抢票插件，机器永远比人快', null, null, '1', '5', '2017-03-08 13:26:22');
INSERT INTO `comments_statuses` VALUES ('12', '当你好不容易从8万人里突出重围，来到了柜台前，你发现，我操，来了10万根绑着钱的竹竿，而且当有退票出来的时候，你要闯过3层人肉才能接近柜台，竹竿在8个人身后一伸，钱就到了柜台前。你低头看了一眼手机，票就没了', null, null, '1', '5', '2017-03-08 13:26:36');
INSERT INTO `comments_statuses` VALUES ('13', '都是有技能的，主子们get起来', 'http://wx1.sinaimg.cn/bmiddle/50c9051fly1fdpr8pnkgmj20qo0qo78c.jpg', 'http://wx1.sinaimg.cn/bmiddle/50c9051fly1fdpr8pnkgmj20qo0qo78c.jpg', '2', '3', '2017-03-14 13:27:28');
INSERT INTO `comments_statuses` VALUES ('14', '这个好可爱', null, null, '3', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('15', '来自霓虹的小众蜡烛品牌nuri candle', null, null, '4', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('16', '懵智最喜欢蜡烛了', 'http://wx2.sinaimg.cn/mw690/67927117ly1fdp2w2rogtj20ku0r075w.jpg', 'http://wx2.sinaimg.cn/mw690/67927117ly1fdp2w2rogtj20ku0r075w.jpg', '5', '2', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('17', 'g，汤姆·希德勒斯顿配音反派Lord Nooth，Dug为保护家园而联合部落对抗Nooth和他的“青铜器时代”城。但是看预告', null, null, '5', '3', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('18', '》第五季发布迈克尔&萨拉混剪】《越狱》1-4季迈克尔&萨拉有爱画面全回顾！见证两人的虐心之恋', null, null, '6', '4', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('19', '又回到了同样的地方或用同样的姿势拍', null, null, '7', '5', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('20', '《霸王别姬》将于3月30日在韩国院线上映171分钟版本', null, null, '8', '6', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('21', '夫妻纠纷丈夫被砍，当事人现身', null, null, '9', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('22', '喵星人到底有多怕水？特别心疼第三只猫。。', null, null, '10', '2', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('23', '【小钱钱曾痛扁加拿大总理贾斯汀】《老友记》“小钱钱”马修派瑞曾跟现任加拿大总理贾斯汀特鲁多在同个学校上学。', null, null, '11', '3', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('24', '小胖James Corden爆笑恶搞《美女与野兽》', null, null, '12', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('25', '儿时写照', null, null, '13', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('26', '法国动画短片《狐狸和老鼠的故事》', null, null, '14', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('27', '重映版海报', null, null, '15', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('28', '重映版海报', null, null, '16', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('29', '泰国广告一般是脑洞大的猜不到', null, null, '17', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('30', '印尼军区一座魔性的老虎雕像最近火了', null, null, '18', '2', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('31', '军区很气', null, null, '19', '3', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('32', '《心理罪》曝光李易峰”方而不木“特辑', null, null, '20', '3', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('33', '管网红Rudy Mancuso', null, null, '21', '1', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('34', '《变形金刚5：最后的骑士》', null, null, '21', '5', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('35', '【动物叫声】狮子等大猫是roar，猫', null, null, '21', '6', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('36', '斯嘉丽·约翰逊和北野武等亮相', null, null, '5', '15', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('37', '盲人姑娘正在摸她的猫', null, null, '5', '17', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('38', '国外网友收集了一组神奇的买家秀，表示也是很绝望啊', null, null, '5', '14', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('39', '哈哈哈哈做这种东西的人肯定都是', null, null, '5', '12', '2017-02-28 13:29:23');
INSERT INTO `comments_statuses` VALUES ('40', '龙妈：囧儿，姑姑的拽根又变大了', null, null, '5', '13', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('41', '谁叫她是是安达尔人洛伊拿人和先民的女王大草原的卡丽熙解放者龙之母不焚者风暴降生丹尼莉丝呢', null, null, '5', '17', '2017-04-01 13:36:22');
INSERT INTO `comments_statuses` VALUES ('42', '安达尔人洛伊拿人和', 'http://wx4.sinaimg.cn/mw690/006ztE9Qgy1fdoqtckdohj30qo0qowhh.jpg', 'http://wx4.sinaimg.cn/mw690/006ztE9Qgy1fdoqtckdohj30qo0qowhh.jpg', '5', '18', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('43', '丹妮莉丝夜半投宿，老妪：”门外是谁？”丹妮莉丝：”风暴降生丹妮莉丝，不焚者，弥林的女王，安达尔人，洛伊拿', null, null, '5', '19', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('44', '韩红听了想打人，依萍听了想跳河', null, null, '5', '20', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('45', '你知道我最喜欢的人是谁么', null, null, '5', '21', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('46', 'There is only one war that matters;', null, null, '5', '7', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('47', '发布新全长预告', 'http://wx1.sinaimg.cn/mw690/8f9cdcb4gy1fdp57rnyewj20c80lqtav.jpg', 'http://wx1.sinaimg.cn/mw690/8f9cdcb4gy1fdp57rnyewj20c80lqtav.jpg', '5', '8', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('48', '威震天现身，钢索生吞汽车', null, null, '5', '9', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('49', '网友下班准备拿摩托车时发现', 'http://wx2.sinaimg.cn/mw690/8f9cdcb4gy1fdp57onsmkj20c80lqjts.jpg', 'http://wx2.sinaimg.cn/mw690/8f9cdcb4gy1fdp57onsmkj20c80lqjts.jpg', '5', '14', '2017-03-17 13:36:16');
INSERT INTO `comments_statuses` VALUES ('50', '维达爵爷与皇帝连线汇报工作遭机器人打断', null, null, '5', '15', '2017-03-30 13:37:59');
INSERT INTO `comments_statuses` VALUES ('51', 'FX正式续订《大群》', null, null, '5', '16', '2017-03-19 13:38:02');
INSERT INTO `comments_statuses` VALUES ('52', 'pet', null, null, '10', '6', '2017-03-17 19:53:04');
INSERT INTO `comments_statuses` VALUES ('53', 'pet', null, null, '11', '6', '2017-03-17 19:55:16');
INSERT INTO `comments_statuses` VALUES ('54', 'pets', null, null, '11', '7', '2017-03-17 19:55:47');
INSERT INTO `comments_statuses` VALUES ('55', 'pets', null, null, '11', '8', '2017-03-17 19:59:30');
INSERT INTO `comments_statuses` VALUES ('56', '哈李健', null, null, '15', '2', '2017-03-18 00:25:37');
INSERT INTO `comments_statuses` VALUES ('57', '可田淼', null, null, '31', '2', '2017-03-18 00:26:00');
INSERT INTO `comments_statuses` VALUES ('58', 'B口OK[馋嘴][哼][怒][睡][睡]', null, null, '31', '2', '2017-03-18 00:28:11');
INSERT INTO `comments_statuses` VALUES ('59', '焦路天', null, null, '32', '2', '2017-03-18 21:07:48');
INSERT INTO `comments_statuses` VALUES ('60', '图咯哦哦哦哦哦哦', null, null, '22', '2', '2017-03-19 14:28:01');
INSERT INTO `comments_statuses` VALUES ('61', 'Tufhj', null, null, '32', '2', '2017-03-19 14:46:32');
INSERT INTO `comments_statuses` VALUES ('62', 'Iffhhhhhhhhh', null, null, '32', '2', '2017-03-19 14:48:19');
INSERT INTO `comments_statuses` VALUES ('63', '[哈哈][哈哈][哈哈][哈哈][哈哈]', null, null, '32', '2', '2017-03-19 14:50:51');
INSERT INTO `comments_statuses` VALUES ('64', 'Gjhhjjjjfqqqqqq', null, null, '32', '2', '2017-03-19 14:51:26');
INSERT INTO `comments_statuses` VALUES ('65', '狗粮', null, null, '33', '2', '2017-03-19 15:10:34');
INSERT INTO `comments_statuses` VALUES ('66', '家', null, null, '26', '2', '2017-03-19 15:11:00');
INSERT INTO `comments_statuses` VALUES ('67', '[怒][可爱][抓狂][睡]', null, null, '33', '2', '2017-03-19 15:37:23');
INSERT INTO `comments_statuses` VALUES ('68', '阿狸，lj', null, null, '35', '2', '2017-03-22 15:42:09');
INSERT INTO `comments_statuses` VALUES ('69', '话卡路', null, null, '20', '2', '2017-03-22 15:42:35');
INSERT INTO `comments_statuses` VALUES ('70', '哈哈哈哈哈', null, null, '35', '2', '2017-03-22 16:18:19');
INSERT INTO `comments_statuses` VALUES ('71', '一页页', null, null, '35', '2', '2017-03-22 16:40:58');
INSERT INTO `comments_statuses` VALUES ('72', '雨u', null, null, '35', '2', '2017-03-22 16:41:05');
INSERT INTO `comments_statuses` VALUES ('73', '这ba', null, null, '48', '2', '2017-03-23 13:08:47');
INSERT INTO `comments_statuses` VALUES ('74', 'Drrtrrrrr', null, null, '27', '2', '2017-03-30 23:00:49');
INSERT INTO `comments_statuses` VALUES ('75', 'Dfg', null, null, '29', '2', '2017-04-04 18:27:16');
INSERT INTO `comments_statuses` VALUES ('76', '我有一头小毛驴', null, null, '3', '2', '2017-04-04 18:36:40');
INSERT INTO `comments_statuses` VALUES ('78', '……', null, null, '28', '2', '2017-04-04 20:09:46');
INSERT INTO `comments_statuses` VALUES ('79', '啦啦啦啦啦', null, null, '31', '2', '2017-04-05 20:46:24');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键id',
  `by_follower` int(11) DEFAULT NULL COMMENT '被关注的用户id',
  `fans` int(11) NOT NULL COMMENT '发起关注的用户的ID',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `firstid` (`by_follower`,`fans`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('1', '5', '4');
INSERT INTO `follow` VALUES ('3', '8', '2');
INSERT INTO `follow` VALUES ('38', '13', '2');
INSERT INTO `follow` VALUES ('40', '4', '2');
INSERT INTO `follow` VALUES ('39', '12', '2');
INSERT INTO `follow` VALUES ('41', '2', '23');
INSERT INTO `follow` VALUES ('8', '10', '3');
INSERT INTO `follow` VALUES ('9', '2', '10');
INSERT INTO `follow` VALUES ('10', '2', '11');
INSERT INTO `follow` VALUES ('11', '2', '12');
INSERT INTO `follow` VALUES ('12', '2', '13');
INSERT INTO `follow` VALUES ('13', '2', '15');
INSERT INTO `follow` VALUES ('14', '2', '18');
INSERT INTO `follow` VALUES ('15', '1', '18');
INSERT INTO `follow` VALUES ('16', '3', '18');
INSERT INTO `follow` VALUES ('32', '18', '2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `gname` varchar(255) DEFAULT NULL COMMENT '商品名字',
  `price` float(10,2) DEFAULT NULL COMMENT '商品价格',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '商品原图链接',
  `thumbnail_pic` varchar(255) DEFAULT NULL COMMENT '商品缩略图链接',
  `sid` int(11) NOT NULL COMMENT '商品所属商店的商店id',
  `goods_description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `sale_type` varchar(255) DEFAULT NULL,
  `sales_count` int(255) DEFAULT NULL COMMENT '销售总数量',
  `sname` varchar(255) DEFAULT NULL COMMENT '商品所属商店的商店名字',
  `multi_pic` tinyint(1) DEFAULT NULL COMMENT '是否具有多张图片，有为1，没有为0',
  PRIMARY KEY (`gid`),
  KEY `sname` (`sname`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '维嘉狗粮', '25.56', 'http://www.popostar.cn/img/wg.png', 'http://www.popostar.cn/img/wg.png', '1', '健康狗粮', '1', '5', '郭斯特宠物用品店', '1');
INSERT INTO `goods` VALUES ('2', 'Nice狗粮', '57.79', 'http://www.popostar.cn/img/nc.png', 'http://www.popostar.cn/img/nc.png', '1', '茁壮成长', '2', '20', '郭斯特宠物用品店', '1');
INSERT INTO `goods` VALUES ('3', '鳕鱼猫粮', '79.90', 'http://www.popostar.cn/img/f3.png', 'http://www.popostar.cn/img/f3.png', '1', '新鲜食材制成', '3', '13', '郭斯特宠物用品店', '0');
INSERT INTO `goods` VALUES ('4', '犬类新年装', '23.60', 'http://www.pethouse.space/img/store/pet_clothes_01.png', 'http://www.pethouse.space/img/store/pet_clothes_01.png', '2', '换购专场5元起!', '1', '54', '小狐狸宠物用品店', '0');
INSERT INTO `goods` VALUES ('5', '狗狗四脚衣', '215.70', 'http://www.pethouse.space/img/store/pet_clothes_02.png', 'http://www.pethouse.space/img/store/pet_clothes_02.png', '2', '加厚升级,质量保证！', '2', '568', '小狐狸宠物用品店', '0');
INSERT INTO `goods` VALUES ('6', '小狗服饰  ', '16.99', 'http://www.pethouse.space/img/store/pet_clothes_03.png', 'http://www.pethouse.space/img/store/pet_clothes_03.png', '2', '两四脚猫咪宠物衣物', '3', '534', '小狐狸宠物用品店', '0');
INSERT INTO `goods` VALUES ('7', '宠物电推剪 ', '58.00', 'http://www.pethouse.space/img/store/pet_clothes_04.png', 'http://www.pethouse.space/img/store/pet_clothes_04.png', '2', '静音安全 不卡毛', '1', '721', '小狐狸宠物用品店', '0');
INSERT INTO `goods` VALUES ('8', '狗狗零食 ', '46.20', 'http://www.pethouse.space/img/store/pet_clothes_05.png', 'http://www.pethouse.space/img/store/pet_clothes_05.png', '3', '疯抢中,训犬必备', '2', '3235', '端午宠物用品店', '0');
INSERT INTO `goods` VALUES ('9', '四季宠物窝', '59.90', 'http://www.pethouse.space/img/store/pet_house_01.png', 'http://www.pethouse.space/img/store/pet_house_01.png', '3', '四季可用,好睡眠', '3', '314', '端午宠物用品店', '0');
INSERT INTO `goods` VALUES ('10', '狗狗玩具球', '7.80', 'http://www.pethouse.space/img/store/pet_toy_01.png', 'http://www.pethouse.space/img/store/pet_toy_01.png', '4', '好玩耐咬,橡胶七彩球', '1', '147', '小馒头宠物用品店', '0');
INSERT INTO `goods` VALUES ('11', '沙发猫爪板', '25.60', 'http://www.pethouse.space/img/store/pet_toy_02.png', 'http://www.pethouse.space/img/store/pet_toy_02.png', '4', '磨爪利器,一板双用', '2', '673', '小馒头宠物用品店', '0');
INSERT INTO `goods` VALUES ('12', '宠物沐浴露', '28.90', 'http://www.pethouse.space/img/store/petstore_01.png', 'http://www.pethouse.space/img/store/petstore_01.png', '4', '猫狗两用沐浴露', '3', '531', '小馒头宠物用品店', '0');
INSERT INTO `goods` VALUES ('13', '宠物狗笼子', '168.90', 'http://www.pethouse.space/img/store/petstore_02.png', 'http://www.pethouse.space/img/store/petstore_02.png', '4', '宠物狗狗笼泰迪拉布拉多中型大型犬萨摩耶金毛大狗笼子带厕所加粗', '1', '78', '小馒头宠物用品店', '0');

-- ----------------------------
-- Table structure for pet_wiki
-- ----------------------------
DROP TABLE IF EXISTS `pet_wiki`;
CREATE TABLE `pet_wiki` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物id',
  `pname` varchar(255) DEFAULT NULL COMMENT '宠物名字',
  `pdetail` varchar(255) DEFAULT NULL COMMENT '宠物详情',
  `pet_pic` varchar(255) DEFAULT NULL COMMENT '宠物图片的链接',
  `p_index` varchar(8) DEFAULT NULL COMMENT '宠物名字的拼音首字母（大写）',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pet_wiki
-- ----------------------------
INSERT INTO `pet_wiki` VALUES ('1', '哈士奇', 'IQ： 第45名\r\nPrice： 1000-3000元\r\nfeed： 好养（68%网民）\r\nbody_type： 中型犬\r\nshoulder_height： 52-71厘米\r\nweight： 20-40公斤', 'http://www.pethouse.space/img/wiki/哈士奇.png', 'H');
INSERT INTO `pet_wiki` VALUES ('2', '藏獒', 'Price： 1000-2000元\r\nfeed： 好养（50%网民）\r\nbody_type： 大型犬\r\nshoulder_height： 61-71厘米\r\nweight： 64-82公斤\r\nfunction： 工作犬', 'http://www.pethouse.space/img/wiki/藏獒.png', 'Z');
INSERT INTO `pet_wiki` VALUES ('3', '贵宾犬', 'IQ： 第2名\r\nPrice： 1000-2200元\r\nbody_type： 小型犬\r\nshoulder_height： 20-38厘米\r\nweight： 4-8公斤\r\nfunction： 玩具犬、 家庭犬', 'http://www.pethouse.space/img/wiki/贵宾犬.png', 'G');
INSERT INTO `pet_wiki` VALUES ('4', '秋田犬', 'IQ： 第54名\r\nPrice： 1000-7000元\r\nbody_type： 超大型犬\r\nshoulder_height： (公)66-71厘米\r\nweight： (公)45-55公斤\r\nfunction： 工作犬', 'http://www.pethouse.space/img/wiki/秋田犬.png', 'Q');
INSERT INTO `pet_wiki` VALUES ('5', '边境牧羊犬', 'IQ： 第1名\r\nPrice： 1000-5000元\r\nbody_type： 中型犬\r\nshoulder_height： 48-56厘米\r\nweight： 14-20公斤\r\nfunction： 牧羊犬', 'http://www.pethouse.space/img/wiki/边境牧羊犬.png', 'B');
INSERT INTO `pet_wiki` VALUES ('6', '博美犬', 'IQ： 第23名\r\nbody_type： 超小型犬\r\nshoulder_height： 22-28厘米\r\nweight： 2-3公斤\r\nfunction： 玩具犬', 'http://www.pethouse.space/img/wiki/博美犬.png', 'B');
INSERT INTO `pet_wiki` VALUES ('7', '柴犬', 'body_type： 中型犬\r\nPrice： 1500-4000元\r\nshoulder_height： 35-41厘米\r\nweight： 8-10公斤\r\nfunction： 家庭犬', 'http://www.pethouse.space/img/wiki/柴犬.png', 'C');
INSERT INTO `pet_wiki` VALUES ('8', '萨摩耶犬', 'IQ： 第33名\r\nPrice： 1000-2000元\r\nfeed： 好养（80%网民）\r\nbody_type： 中型犬\r\nshoulder_height： 48-59厘米\r\nweight： 23-30公斤', 'http://www.pethouse.space/img/wiki/萨摩耶犬.png', 'S');
INSERT INTO `pet_wiki` VALUES ('9', '英国斗牛犬', 'IQ： 第77名\r\nPrice： 1000-6001元\r\nbody_type： 中型犬\r\nshoulder_height： 51-64厘米\r\nweight： 29-48公斤\r\nfunction： 家庭犬', 'http://www.pethouse.space/img/wiki/英国斗牛犬.png', 'Y');
INSERT INTO `pet_wiki` VALUES ('10', '阿富汗猎犬', 'IQ： 第79名\r\nPrice： 1000-6000元\r\nbody_type： 大型犬\r\nshoulder_height： 64-74厘米\r\nweight： 23-27公斤\r\nfunction： 狩猎犬', 'http://www.pethouse.space/img/wiki/阿富汗猎犬.png', 'A');
INSERT INTO `pet_wiki` VALUES ('11', '大丹犬', 'IQ： 第48名\r\nPrice： 1000-9999元\r\nbody_type： 超大型犬\r\nshoulder_height： 71-76厘米\r\nweight： 46-54公斤\r\nfunction： 工作犬', 'http://www.pethouse.space/img/wiki/大丹犬.png', 'D');
INSERT INTO `pet_wiki` VALUES ('12', '大白熊犬', 'IQ： 第64名\r\nPrice： 1000-1800元\r\nbody_type： 超大型犬\r\nshoulder_height： (公)69～81厘米\r\nweight： (公)46～57公斤\r\nfunction： 工作犬', 'http://www.pethouse.space/img/wiki/大白熊犬.png', 'D');
INSERT INTO `pet_wiki` VALUES ('13', '北京犬', 'IQ： 第73名\r\nPrice： 500-8000元\r\nbody_type： 小型犬\r\nshoulder_height： 15-23厘米\r\nweight： 3-6公斤\r\nfunction： 玩具犬', 'http://www.pethouse.space/img/wiki/北京犬.png', 'B');
INSERT INTO `pet_wiki` VALUES ('14', '英国短毛猫', 'body_type： 中型\r\nwool_length： 短毛', 'http://www.pethouse.space/img/wiki/英国短毛猫.png', 'Y');
INSERT INTO `pet_wiki` VALUES ('15', '布偶猫', 'body_type： 大型\r\nPrice： 3500元\r\nwool_length： 长毛\r\nweight： 4.5-9KG', 'http://www.pethouse.space/img/wiki/布偶猫.png', 'B');
INSERT INTO `pet_wiki` VALUES ('16', '波斯猫', 'body_type： 中型\r\nPrice： 2000元\r\nwool_length： 长毛\r\nweight： 3.5-7kg', 'http://www.pethouse.space/img/wiki/波斯猫.png', 'B');
INSERT INTO `pet_wiki` VALUES ('17', '埃及猫', 'body_type： 中型\r\nPrice： 1000元\r\nwool_length： 短毛\r\nweight： 2.25-5kg', 'http://www.pethouse.space/img/wiki/埃及猫.png', 'A');
INSERT INTO `pet_wiki` VALUES ('18', '日本短尾猫', 'body_type： 中型\r\nwool_length： 短毛', 'http://www.pethouse.space/img/wiki/日本短尾猫.png', 'R');
INSERT INTO `pet_wiki` VALUES ('19', '折耳猫', 'body_type： 中型\r\nPrice： 500-2000元\r\nwool_length： 短毛\r\nweight： 2.4-6kg', 'http://www.pethouse.space/img/wiki/折耳猫.png', 'Z');

-- ----------------------------
-- Table structure for pic_goods
-- ----------------------------
DROP TABLE IF EXISTS `pic_goods`;
CREATE TABLE `pic_goods` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品图片表的主键id',
  `gid` int(11) DEFAULT NULL COMMENT '商品id',
  `th_url` varchar(255) DEFAULT NULL COMMENT '商品缩略图链接',
  `url` varchar(255) DEFAULT NULL COMMENT '商品原图链接',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic_goods
-- ----------------------------
INSERT INTO `pic_goods` VALUES ('1', '1', 'http://www.popostar.cn/img/wg.png', 'http://www.popostar.cn/img/wg.png');
INSERT INTO `pic_goods` VALUES ('2', '1', 'http://www.popostar.cn/img/wg1.png', 'http://www.popostar.cn/img/wg1.png');
INSERT INTO `pic_goods` VALUES ('3', '1', 'http://www.popostar.cn/img/wg2.png', 'http://www.popostar.cn/img/wg2.png');
INSERT INTO `pic_goods` VALUES ('4', '1', 'http://www.popostar.cn/img/wg3.png', 'http://www.popostar.cn/img/wg3.png');
INSERT INTO `pic_goods` VALUES ('5', '1', 'http://www.popostar.cn/img/wg4.png', 'http://www.popostar.cn/img/wg4.png');
INSERT INTO `pic_goods` VALUES ('6', '2', 'http://www.popostar.cn/img/nc.png', 'http://www.popostar.cn/img/nc.png');
INSERT INTO `pic_goods` VALUES ('7', '2', 'http://www.popostar.cn/img/nc1.png', 'http://www.popostar.cn/img/nc1.png');
INSERT INTO `pic_goods` VALUES ('8', '2', 'http://www.popostar.cn/img/nc2.png', 'http://www.popostar.cn/img/nc2.png');

-- ----------------------------
-- Table structure for pic_statuses
-- ----------------------------
DROP TABLE IF EXISTS `pic_statuses`;
CREATE TABLE `pic_statuses` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态图片表的主键id',
  `mid` int(11) NOT NULL COMMENT '状态id',
  `th_url` varchar(255) NOT NULL COMMENT '状态图片的缩略图链接',
  `url` varchar(255) NOT NULL COMMENT '状态图片的原图链接',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic_statuses
-- ----------------------------
INSERT INTO `pic_statuses` VALUES ('1', '3', 'http://wx1.sinaimg.cn/mw690/5cfc088ely1fd9pci064nj20sg0izwjp.jpg', 'http://wx1.sinaimg.cn/mw690/5cfc088ely1fd9pci064nj20sg0izwjp.jpg');
INSERT INTO `pic_statuses` VALUES ('2', '3', 'http://wx4.sinaimg.cn/mw690/5cfc088ely1fd9pcn9q64j20sg0iygqa.jpg', 'http://wx4.sinaimg.cn/mw690/5cfc088ely1fd9pcn9q64j20sg0iygqa.jpg');
INSERT INTO `pic_statuses` VALUES ('3', '3', 'http://wx1.sinaimg.cn/mw690/6b7c5633ly1fd9qpkxkwmj20bg0git9t.jpg', 'http://wx1.sinaimg.cn/mw690/6b7c5633ly1fd9qpkxkwmj20bg0git9t.jpg');
INSERT INTO `pic_statuses` VALUES ('4', '3', 'http://wx2.sinaimg.cn/mw690/bba92d9agy1fd9iekzq8kj20zk0npk71.jpg', 'http://wx2.sinaimg.cn/mw690/bba92d9agy1fd9iekzq8kj20zk0npk71.jpg');
INSERT INTO `pic_statuses` VALUES ('5', '3', 'http://wx4.sinaimg.cn/mw690/8f9cdcb4gy1fdgo28rhyaj20h80bedrn.jpg', 'http://wx4.sinaimg.cn/mw690/8f9cdcb4gy1fdgo28rhyaj20h80bedrn.jpg');
INSERT INTO `pic_statuses` VALUES ('6', '3', 'http://wx4.sinaimg.cn/mw690/8f9cdcb4gy1fdgo27p2t9j20h80c6dqm.jpg', 'http://wx4.sinaimg.cn/mw690/8f9cdcb4gy1fdgo27p2t9j20h80c6dqm.jpg');
INSERT INTO `pic_statuses` VALUES ('7', '3', 'http://wx3.sinaimg.cn/mw690/714704d7gy1fdgnalfpbpg208w04zu0y.gif', 'http://wx3.sinaimg.cn/mw690/714704d7gy1fdgnalfpbpg208w04zu0y.gif');
INSERT INTO `pic_statuses` VALUES ('8', '3', 'http://wx1.sinaimg.cn/mw690/76c73f8dly1fddgx8zci1j20rs0ijdrg.jpg', 'http://wx1.sinaimg.cn/mw690/76c73f8dly1fddgx8zci1j20rs0ijdrg.jpg');
INSERT INTO `pic_statuses` VALUES ('9', '3', 'http://wx4.sinaimg.cn/mw690/76c73f8dly1fddgx6h74xj211x1kwk1h.jpg', 'http://wx4.sinaimg.cn/mw690/76c73f8dly1fddgx6h74xj211x1kwk1h.jpg');
INSERT INTO `pic_statuses` VALUES ('10', '10', 'http://wx3.sinaimg.cn/mw690/6428220dly1fdgkgjw49gj20is0is0t7.jpg', 'http://wx3.sinaimg.cn/mw690/6428220dly1fdgkgjw49gj20is0is0t7.jpg');
INSERT INTO `pic_statuses` VALUES ('11', '10', 'http://wx4.sinaimg.cn/mw690/6c4fb28egy1fdgoi2m0akg20a005mu0y.gif', 'http://wx4.sinaimg.cn/mw690/6c4fb28egy1fdgoi2m0akg20a005mu0y.gif');
INSERT INTO `pic_statuses` VALUES ('12', '10', 'http://wx1.sinaimg.cn/mw690/0068KSUIly1fdfq6wyus4j30ng0dbgmo.jpg', 'http://wx1.sinaimg.cn/mw690/0068KSUIly1fdfq6wyus4j30ng0dbgmo.jpg');
INSERT INTO `pic_statuses` VALUES ('13', '10', 'http://wx2.sinaimg.cn/mw690/697079acgy1fdf7sqbfj3j20sg0klaej.jpg', 'http://wx2.sinaimg.cn/mw690/697079acgy1fdf7sqbfj3j20sg0klaej.jpg');
INSERT INTO `pic_statuses` VALUES ('14', '10', 'http://wx2.sinaimg.cn/mw690/005NMAtTgy1fdfprqljqej31d71jcay5.jpg', 'http://wx2.sinaimg.cn/mw690/005NMAtTgy1fdfprqljqej31d71jcay5.jpg');
INSERT INTO `pic_statuses` VALUES ('15', '10', 'http://wx1.sinaimg.cn/mw690/005NMAtTgy1fdfprmmjxmj31fa1kzkj7.jpg', 'http://wx1.sinaimg.cn/mw690/005NMAtTgy1fdfprmmjxmj31fa1kzkj7.jpg');
INSERT INTO `pic_statuses` VALUES ('16', '10', 'http://wx4.sinaimg.cn/mw690/005NMAtTgy1fdfprt84ocj317t1qw7ti.jpg', 'http://wx4.sinaimg.cn/mw690/005NMAtTgy1fdfprt84ocj317t1qw7ti.jpg');
INSERT INTO `pic_statuses` VALUES ('17', '10', 'http://wx3.sinaimg.cn/mw690/005NMAtTgy1fdfproxn8gj31hi1fz4qp.jpg', 'http://wx3.sinaimg.cn/mw690/005NMAtTgy1fdfproxn8gj31hi1fz4qp.jpg');
INSERT INTO `pic_statuses` VALUES ('18', '10', 'http://wx3.sinaimg.cn/bmiddle/805e6c32gy1fdfs2plfqsj20qo111wlt.jpg', 'http://wx3.sinaimg.cn/bmiddle/805e6c32gy1fdfs2plfqsj20qo111wlt.jpg');
INSERT INTO `pic_statuses` VALUES ('19', '11', 'http://wx1.sinaimg.cn/bmiddle/6b414cb8gy1fdg973wqndj20qo0qo79o.jpg', 'http://wx1.sinaimg.cn/bmiddle/6b414cb8gy1fdg973wqndj20qo0qo79o.jpg');
INSERT INTO `pic_statuses` VALUES ('20', '11', 'http://wx4.sinaimg.cn/mw690/bba92d9agy1fdgja9wvxij21kw11xwtr.jpg', 'http://wx4.sinaimg.cn/mw690/bba92d9agy1fdgja9wvxij21kw11xwtr.jpg');
INSERT INTO `pic_statuses` VALUES ('21', '11', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgjafpmz1j21kw11xk94.jpg', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgjafpmz1j21kw11xk94.jpg');
INSERT INTO `pic_statuses` VALUES ('22', '11', 'http://wx2.sinaimg.cn/mw690/bba92d9agy1fdgjalfimkj21kw11xk8a.jpg', 'http://wx2.sinaimg.cn/mw690/bba92d9agy1fdgjalfimkj21kw11xk8a.jpg');
INSERT INTO `pic_statuses` VALUES ('23', '11', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgjas350xj21kw11xk9j.jpg', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgjas350xj21kw11xk9j.jpg');
INSERT INTO `pic_statuses` VALUES ('24', '11', 'http://wx4.sinaimg.cn/mw690/bba92d9agy1fdgjax7hbaj21kw11xk73.jpg', 'http://wx4.sinaimg.cn/mw690/bba92d9agy1fdgjax7hbaj21kw11xk73.jpg');
INSERT INTO `pic_statuses` VALUES ('25', '12', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgii9nj0cj21kw11y7he.jpg', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgii9nj0cj21kw11y7he.jpg');
INSERT INTO `pic_statuses` VALUES ('26', '12', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgiihkfhzj21kw11y4bc.jpg', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgiihkfhzj21kw11y4bc.jpg');
INSERT INTO `pic_statuses` VALUES ('27', '12', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgiibgbp8j21kw11y4bo.jpg', 'http://wx3.sinaimg.cn/mw690/bba92d9agy1fdgiibgbp8j21kw11y4bo.jpg');
INSERT INTO `pic_statuses` VALUES ('28', '31', 'http://wx2.sinaimg.cn/mw690/699132e6ly1febvn2t1jsj20u018w7gb.jpg', 'http://wx2.sinaimg.cn/mw690/699132e6ly1febvn2t1jsj20u018w7gb.jpg');
INSERT INTO `pic_statuses` VALUES ('29', '30', 'http://wx1.sinaimg.cn/mw690/91e4a538gy1febsxcrjo0j20go0gomxg.jpg', 'http://wx1.sinaimg.cn/mw690/91e4a538gy1febsxcrjo0j20go0gomxg.jpg');
INSERT INTO `pic_statuses` VALUES ('30', '30', 'http://wx3.sinaimg.cn/mw690/91e4a538gy1febsxdc2s3j20go0go74z.jpg', 'http://wx3.sinaimg.cn/mw690/91e4a538gy1febsxdc2s3j20go0go74z.jpg');
INSERT INTO `pic_statuses` VALUES ('31', '29', 'http://wx3.sinaimg.cn/mw690/82c9bc65ly1febyew5fbqj20qr0qodme.jpg', 'http://wx3.sinaimg.cn/mw690/82c9bc65ly1febyew5fbqj20qr0qodme.jpg');
INSERT INTO `pic_statuses` VALUES ('32', '29', 'http://wx3.sinaimg.cn/mw690/82c9bc65ly1febyexgh04j20qo0qodm1.jpg', 'http://wx3.sinaimg.cn/mw690/82c9bc65ly1febyexgh04j20qo0qodm1.jpg');
INSERT INTO `pic_statuses` VALUES ('33', '29', 'http://wx3.sinaimg.cn/mw690/82c9bc65ly1febyeyp6dzj20qo0qote3.jpg', 'http://wx3.sinaimg.cn/mw690/82c9bc65ly1febyeyp6dzj20qo0qote3.jpg');
INSERT INTO `pic_statuses` VALUES ('34', '29', 'http://wx2.sinaimg.cn/mw690/005CksD3ly1febxjk8jsoj30m80m9q52.jpg', 'http://wx2.sinaimg.cn/mw690/005CksD3ly1febxjk8jsoj30m80m9q52.jpg');
INSERT INTO `pic_statuses` VALUES ('35', '28', 'http://wx1.sinaimg.cn/mw690/6b7c5633ly1febx0lgdsrg20jg0ay1l4.gif', 'http://wx1.sinaimg.cn/mw690/6b7c5633ly1febx0lgdsrg20jg0ay1l4.gif');
INSERT INTO `pic_statuses` VALUES ('36', '28', 'http://wx3.sinaimg.cn/mw690/6b7c5633ly1febx08zni0g20jg0aye87.gif', 'http://wx3.sinaimg.cn/mw690/6b7c5633ly1febx08zni0g20jg0aye87.gif');
INSERT INTO `pic_statuses` VALUES ('37', '28', 'http://wx4.sinaimg.cn/mw690/6b7c5633ly1febwzvnn0bg20jg0ayqve.gif', 'http://wx4.sinaimg.cn/mw690/6b7c5633ly1febwzvnn0bg20jg0ayqve.gif');
INSERT INTO `pic_statuses` VALUES ('38', '28', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1febx0en05ag20jg0ayx6y.gif', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1febx0en05ag20jg0ayx6y.gif');
INSERT INTO `pic_statuses` VALUES ('39', '28', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1febx0oc42tg20jg0ay4qt.gif', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1febx0oc42tg20jg0ay4qt.gif');
INSERT INTO `pic_statuses` VALUES ('40', '28', 'http://wx3.sinaimg.cn/mw690/6b7c5633ly1febx92ld4bj20v90ksgpe.jpg', 'http://wx3.sinaimg.cn/mw690/6b7c5633ly1febx92ld4bj20v90ksgpe.jpg');
INSERT INTO `pic_statuses` VALUES ('41', '27', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhrfytuj30go0esdhk.jpg', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhrfytuj30go0esdhk.jpg');
INSERT INTO `pic_statuses` VALUES ('42', '27', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhs3knqj30go0cidjl.jpg', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhs3knqj30go0cidjl.jpg');
INSERT INTO `pic_statuses` VALUES ('43', '27', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhrlzjdj30es0estbg.jpg', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhrlzjdj30es0estbg.jpg');
INSERT INTO `pic_statuses` VALUES ('44', '27', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhsb3rhj30go0jgjuc.jpg', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhsb3rhj30go0jgjuc.jpg');
INSERT INTO `pic_statuses` VALUES ('45', '27', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhspncbj30go0goq5b.jpg', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhspncbj30go0goq5b.jpg');
INSERT INTO `pic_statuses` VALUES ('46', '27', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhr8lk7j30go0go77n.jpg', 'http://wx4.sinaimg.cn/mw690/006nWT84ly1febzhr8lk7j30go0go77n.jpg');
INSERT INTO `pic_statuses` VALUES ('47', '27', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhrvyesj30dm09iwfx.jpg', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhrvyesj30dm09iwfx.jpg');
INSERT INTO `pic_statuses` VALUES ('48', '27', 'http://wx3.sinaimg.cn/mw690/006nWT84ly1febzhsj9mvj30go0mlq63.jpg', 'http://wx3.sinaimg.cn/mw690/006nWT84ly1febzhsj9mvj30go0mlq63.jpg');
INSERT INTO `pic_statuses` VALUES ('49', '27', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhqze9pj30go0iqtbw.jpg', 'http://wx2.sinaimg.cn/mw690/006nWT84ly1febzhqze9pj30go0iqtbw.jpg');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'session表的主键id',
  `session_token` varchar(64) DEFAULT NULL COMMENT '发送个用户的session令牌',
  `create_time` datetime DEFAULT NULL COMMENT 'session创建的时间',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`session_id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('1', 'c9802fba5e6799aca0530fed592d1739', '2017-03-28 20:37:23', '6');
INSERT INTO `sessions` VALUES ('2', '5214562367fc02be17510da4b7824bf3', '2017-03-28 20:37:41', '3');
INSERT INTO `sessions` VALUES ('3', '6c3510ace1ad32ce544fc020d19c6e50', '2017-03-30 12:03:40', '2');
INSERT INTO `sessions` VALUES ('4', 'a1c334a8df8cecf14a9b9c3686340ed7', '2017-04-04 13:23:47', '2');
INSERT INTO `sessions` VALUES ('5', '07558a27bd21ded476b244e6be485fa1', '2017-04-04 14:25:00', '2');
INSERT INTO `sessions` VALUES ('7', '0a96bac2bf86adf9678da875715663cb', '2017-04-04 14:25:04', '2');
INSERT INTO `sessions` VALUES ('8', 'f8e64fa30012748b787e6a720434b9ad', '2017-04-04 14:25:05', '2');
INSERT INTO `sessions` VALUES ('10', '70fc21c7646efbe7438cca4139a92b2e', '2017-04-04 20:00:18', '2');
INSERT INTO `sessions` VALUES ('13', '6cdc08d84af3182bddb51dd590eab142', '2017-04-04 20:05:57', '2');
INSERT INTO `sessions` VALUES ('14', '50f786ef56e28921f0e7b4e6e0881a7c', '2017-04-04 20:08:57', '2');
INSERT INTO `sessions` VALUES ('15', '229ce76ac8b1a77e3f406e0613272716', '2017-04-05 21:30:06', '23');
INSERT INTO `sessions` VALUES ('19', 'ae2620d33a15dda6ff563e80a530e2d9', '2017-04-09 16:51:52', '2');
INSERT INTO `sessions` VALUES ('17', 'b91b41a705f5c782862a1c2fdceb5dd4', '2017-04-09 12:33:17', '2');
INSERT INTO `sessions` VALUES ('20', '9e10f1207ffa5d195508da9e44d1ac66', '2017-04-09 17:02:57', '2');
INSERT INTO `sessions` VALUES ('38', '2eaa96a2405807a3a175ae31d6d08243', '2017-04-24 18:34:04', '2');

-- ----------------------------
-- Table structure for statuses
-- ----------------------------
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态表的主键id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `created_at` datetime DEFAULT NULL COMMENT '状态创建的时间',
  `text` text COMMENT '状态的文本内容',
  `thumbnail_pic` varchar(255) DEFAULT NULL COMMENT '状态的图片缩略图链接（单张）',
  `pic_urls` varchar(255) DEFAULT NULL COMMENT '状态的图片原图链接（单张）',
  `source` varchar(255) DEFAULT NULL COMMENT '用户发布状态使用设备的类型',
  `checked` tinyint(2) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL COMMENT '点赞数',
  `is_pic` tinyint(2) DEFAULT NULL COMMENT '是否带多张图片，是为1，否为0',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statuses
-- ----------------------------
INSERT INTO `statuses` VALUES ('1', '1', '2017-01-19 16:31:19', 'This is a test weibo', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'chrome', null, '7', null);
INSERT INTO `statuses` VALUES ('2', '3', '2017-01-10 16:31:19', '汉字', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'chrome', null, '18', null);
INSERT INTO `statuses` VALUES ('3', '2', '2017-01-22 16:31:19', 'tset3', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'firefox', null, '0', '1');
INSERT INTO `statuses` VALUES ('4', '3', '2011-01-05 16:31:19', 'test4', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'chrome', null, '5', null);
INSERT INTO `statuses` VALUES ('5', '2', '2017-01-05 16:31:19', 'test5', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'ie', null, '152', null);
INSERT INTO `statuses` VALUES ('6', '13', '2016-01-19 16:31:19', 'test6', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'firefox', null, '3', null);
INSERT INTO `statuses` VALUES ('7', '3', '2017-01-05 16:31:19', '刚刚来到新家的小猫，小心翼翼地去找家里的老住户大狗', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'mobile', null, '1', null);
INSERT INTO `statuses` VALUES ('8', '4', '2017-01-05 16:31:19', '【格力电器董事长董明珠：建议个人所得税起征点提到5000元】全国人大代表、格力电器董事长兼总裁董明珠在提交给全国人大的议案中建议，个人所得税起征点提高到5000元，并建立动态调整机制。同时，逐步建立以家庭为单位计算应纳税所得额的计税方式，最大限度的体现税负公平。', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'ie', null, '65', null);
INSERT INTO `statuses` VALUES ('9', '3', '2017-01-05 16:31:19', '英特尔已经向Motely Fool证实，公司将在2017年下半年推出10纳米CPU。此前英特尔官网公布了许多职位招聘信息，业界认为英特尔新芯片的生产可能碰到了困难，Cannonlake处理器上市时间也许会推迟到2018年。不过英特尔澄清说职位招聘信息已经撤销，因为里面出现了错误，10纳米处理器将按计划如期推出。', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'chrome', null, '656', null);
INSERT INTO `statuses` VALUES ('10', '2', '2017-01-05 16:31:19', '放在过去，英特尔的“Tick-Tock”蓝图一直是简单清晰的：先是推出Tick处理器，也就是用新的（更小的）制程节点和现有架构推出小幅升级的处理器', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'mobile', null, '72', '1');
INSERT INTO `statuses` VALUES ('11', '8', '2017-01-05 16:31:19', '熊猫日常', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'firefox', null, '4', '1');
INSERT INTO `statuses` VALUES ('12', '9', '2008-01-05 16:31:19', '可爱的大熊猫', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'ie', null, '878', '1');
INSERT INTO `statuses` VALUES ('13', '7', '2017-01-05 16:31:19', '关爱过气网红 ', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'chrome', null, '645', null);
INSERT INTO `statuses` VALUES ('14', '6', '2017-01-05 16:31:19', '喵星人翻脸比较翻书还快.....喵：手酸了收回来，也不用这样吧！', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'ie', null, '123', null);
INSERT INTO `statuses` VALUES ('15', '10', '2015-01-05 16:31:19', '有75后自称空巢老人，看来是有依据的', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'firefox', null, '77', null);
INSERT INTO `statuses` VALUES ('16', '11', '2017-01-05 16:31:19', '【苹果宣布在上海和苏州建立新研发中心】苹果今天宣布，继北京和深圳之后，将在上海和苏州开设研发中心。目前，苹果已承诺在中国研发中心投入超过 35 亿元人民币。苹果在中国的研发中心旨在培养供应链中的技术专家和来自包括北京大学、清华大学和上海交通大学等高等院校的毕业生人才。', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'ie', null, '5464', null);
INSERT INTO `statuses` VALUES ('17', '1', '2016-03-10 16:12:17', '口袋打印机2个，小到不可思议的口袋打印机，希望能让虚拟走进现实。 拿走不谢！！', null, '', 'mobile', null, '456', null);
INSERT INTO `statuses` VALUES ('18', '12', '2017-03-10 16:12:20', '明天与北京城草原的约会你准备好了吗？你还不知道是什么？', null, '', 'mobile', null, '32', null);
INSERT INTO `statuses` VALUES ('19', '13', '2017-01-05 16:31:19', '还是个中分发型', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'mobile', null, '2', null);
INSERT INTO `statuses` VALUES ('20', '19', '2017-01-05 16:31:19', '亨利·卡维尔加盟《碟中谍6》，角色尚未宣布。', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'mobile', null, '1', null);
INSERT INTO `statuses` VALUES ('21', '18', '2017-01-19 16:31:19', 'BBC直播中两个乱入的萌娃现在国外已经有了一票粉丝，还有网友专门设计了他们的卡通造型！ ​​​​', null, 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo716kij20dc0godgg.jpg', 'chrome', null, '1', null);
INSERT INTO `statuses` VALUES ('22', '20', '2017-03-17 13:40:15', '大秦剧组确实要好好反思一下', null, null, 'iPhone7', null, '3', null);
INSERT INTO `statuses` VALUES ('23', '21', '2017-03-31 13:41:20', '【抖森出席《金刚：骷髅岛》中国首映发布会】动作冒险巨制《金刚：骷髅岛》昨日在北京举行盛大的中国首映发布会及首映见面会！抖森、塞缪尔·杰克逊、布丽·拉尔森、景甜重磅亮相！', null, null, null, null, '10', null);
INSERT INTO `statuses` VALUES ('24', '6', '2017-03-17 13:41:30', '【小钱钱曾痛扁加拿大总理贾斯汀】', null, null, null, null, '11', null);
INSERT INTO `statuses` VALUES ('25', '8', '2017-03-17 20:20:30', '距“捷豹F-PACE摩天轮“只有20分钟了！', null, null, 'Iphone 7', null, null, null);
INSERT INTO `statuses` VALUES ('26', '9', '2017-03-17 20:21:00', '巨无霸猫咪是谁家的~他叫做P\'BONE~是一只泰国猫咪~感觉每个人抱着他的时候都幸福感爆棚', 'http://wx1.sinaimg.cn/mw690/5cfc088ely1febmadwntej20jg0pxq56.jpg', 'http://wx1.sinaimg.cn/mw690/5cfc088ely1febmadwntej20jg0pxq56.jpg', 'Iphone 7', null, null, null);
INSERT INTO `statuses` VALUES ('27', '9', '2017-03-17 20:29:18', '做了一组胖猫的表情包，日常吸猫', null, null, 'Iphone 7', null, null, '1');
INSERT INTO `statuses` VALUES ('28', '5', '2017-03-22 21:31:37', '纪录片《我是希斯·莱杰》预告中，那些鲜活的希斯的笑脸，和他亲手记录的生活。', null, null, 'Iphone 7', null, null, '1');
INSERT INTO `statuses` VALUES ('29', '4', '2017-03-22 21:51:27', '好久没拍他啦，早上十分的黏人。', '', '', 'Iphone 7', null, null, '1');
INSERT INTO `statuses` VALUES ('30', '2', '2017-03-27 22:10:44', '剃毛前和剃毛后。。。给你个眼神自己体会！', null, null, 'Iphone 7', null, null, '1');
INSERT INTO `statuses` VALUES ('31', '2', '2017-04-04 18:29:45', '4月你会有好事发生。', null, null, 'Iphone 7', null, null, '1');
INSERT INTO `statuses` VALUES ('32', '2', '2017-04-10 18:58:00', '^_^', null, null, 'Iphone 7', null, null, null);
INSERT INTO `statuses` VALUES ('33', '2', '2017-04-21 15:19:51', '我爱我家的小猫', null, null, 'Iphone 7', null, null, null);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商店id',
  `sname` varchar(255) DEFAULT NULL COMMENT '商店名字',
  `store_description` varchar(255) DEFAULT NULL COMMENT '商店描述',
  `s_icon` varchar(255) DEFAULT NULL COMMENT '商店图标l链接',
  PRIMARY KEY (`sid`),
  KEY `sname` (`sname`),
  KEY `sid` (`sid`,`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '郭斯特宠物用品店', '宠物店描述1', 'http://tva2.sinaimg.cn/crop.0.0.180.180.180/71b2cbb3jw8eznoba683jj20500500sy.jpg');
INSERT INTO `store` VALUES ('2', '小狐狸宠物用品店', '宠物店描述2', 'http://ww3.sinaimg.cn/bmiddle/71b2cbb3ly1fc5fjn50m8j21kw2aiqrv.jpg');
INSERT INTO `store` VALUES ('3', '端午宠物用品店', '宠物店描述3', 'http://ww2.sinaimg.cn/bmiddle/bfc243a3gy1fdmhrxk5fhj215o1jl1l0.jpg');
INSERT INTO `store` VALUES ('4', '小馒头宠物用品店', '宠物店描述4', 'http://ww1.sinaimg.cn/bmiddle/71b2cbb3ly1fc5fkvwrazj21kw12cthp.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` char(255) DEFAULT NULL COMMENT '用户的昵称',
  `sex` varchar(20) DEFAULT NULL COMMENT '用户的性别',
  `account` varchar(255) NOT NULL COMMENT '用户的登陆账户',
  `password` char(255) DEFAULT NULL COMMENT '用户的登陆密码（已md5加密）',
  `birthday` date DEFAULT NULL COMMENT '用户的生日',
  `thumbnail_pic` varchar(255) DEFAULT NULL COMMENT '用户头像缩略图的链接',
  `profile_image_url` varchar(255) DEFAULT NULL COMMENT '用户头像原图的链接',
  `user_description` text COMMENT '用户描述',
  `created_date` date DEFAULT NULL COMMENT '用户的创建日期',
  `location` varchar(255) DEFAULT NULL,
  `verified_type` tinyint(4) DEFAULT NULL COMMENT '用户的认证类型',
  `mbrank` tinyint(4) DEFAULT NULL COMMENT '用户会员等级',
  PRIMARY KEY (`uid`,`account`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Uzi', 'man', 's8', '123', '2004-08-19', 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo93kukj20go0gojru.jpg', 'http://wx2.sinaimg.cn/mw690/91e4a538gy1fbvxo93kukj20go0gojru.jpg', '我去问问v第三方', '2017-02-25', null, '0', '5');
INSERT INTO `user` VALUES ('2', 'Azir', 'man', '123', '123', '2003-12-19', 'http://ww4.sinaimg.cn/thumb180/9394dd24gw1f5x07vdrv4j2050050wen.jpg', 'http://ww4.sinaimg.cn/thumb180/9394dd24gw1f5x07vdrv4j2050050wen.jpg', '荒古遗尘步枪', '2016-12-22', null, '2', '6');
INSERT INTO `user` VALUES ('3', '威尔逊', 'man', '456@qq.com', '123', '1996-11-10', 'http://wx1.sinaimg.cn/mw690/0066zIelgy1fd3tgvavr1j30qe0zkmzo.jpg', 'http://wx1.sinaimg.cn/mw690/0066zIelgy1fd3tgvavr1j30qe0zkmzo.jpg', '问问问题', '2016-08-26', null, '3', '7');
INSERT INTO `user` VALUES ('4', '贾克斯', 'man', 'Jax@163.com', '123', '2017-03-18', 'http://wx2.sinaimg.cn/mw690/6b3bcc19ly1fd3t7xgyetj20qo0zkwmj.jpg', 'http://wx2.sinaimg.cn/mw690/6b3bcc19ly1fd3t7xgyetj20qo0zkwmj.jpg', '我是武器大师', '2017-02-25', null, '3', '1');
INSERT INTO `user` VALUES ('5', '瑞兹', 'woman', 'Ryze@163.com', '123', '1995-09-26', 'http://wx1.sinaimg.cn/mw690/d59d1a93ly1fd33ve7og6j20qo0zktfx.jpg', 'http://wx1.sinaimg.cn/mw690/d59d1a93ly1fd33ve7og6j20qo0zktfx.jpg', '我是流浪法师', '2017-02-25', null, '5', '5');
INSERT INTO `user` VALUES ('6', '没时间解释了', 'man', '15518153496', '123', '1995-09-26', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1fdpnsj458qj20h80cxwf6.jpg', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1fdpnsj458qj20h80cxwf6.jpg', '我有一头小毛驴', '2017-03-01', null, '5', '3');
INSERT INTO `user` VALUES ('7', '小马甲', 'man', '1234', '123', '2008-03-19', 'http://tva3.sinaimg.cn/crop.664.0.356.356.50/76c73f8djw1em2x2862h5j20xc0lldjd.jpg', 'http://tva3.sinaimg.cn/crop.664.0.356.356.50/76c73f8djw1em2x2862h5j20xc0lldjd.jpg', '很顽皮了', '2017-03-17', null, '5', '3');
INSERT INTO `user` VALUES ('8', '老花', 'man', 'qwer', '123', '2009-03-19', 'http://wx3.sinaimg.cn/mw690/bbde6284ly1fdpolfrz9jj20ku0rsn0e.jpg', 'http://wx3.sinaimg.cn/mw690/bbde6284ly1fdpolfrz9jj20ku0rsn0e.jpg', 'Vincent Zhao Three', '2017-03-18', null, '5', '3');
INSERT INTO `user` VALUES ('9', 'DC宇宙', 'woman', 'dc', '123', '2010-03-19', 'http://wx4.sinaimg.cn/mw690/6b7c5633ly1fdpm9ox6wmj20sg0f8mzz.jpg', 'http://wx4.sinaimg.cn/mw690/6b7c5633ly1fdpm9ox6wmj20sg0f8mzz.jpg', '这是朕为你打下的江山', '2017-03-17', null, '3', '3');
INSERT INTO `user` VALUES ('10', '大奔', 'woman', 'daben', '123', '2011-03-19', 'http://wx1.sinaimg.cn/mw690/005NMAtTgy1fec0vvelb5j32c03407wj.jpg', 'http://wx1.sinaimg.cn/mw690/005NMAtTgy1fec0vvelb5j32c03407wj.jpg', '假面二猫', '2017-03-17', null, '3', '3');
INSERT INTO `user` VALUES ('11', '平凡无奇', 'man', 'asd', '123', '1986-03-19', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1fdpnsa3nwpj20h30h3dhl.jpg', 'http://wx2.sinaimg.cn/mw690/6b7c5633ly1fdpnsa3nwpj20h30h3dhl.jpg', '不开坏车', '2017-03-17', null, '3', '3');
INSERT INTO `user` VALUES ('12', '笔芯', 'man', '1qw', '123', '1997-03-19', 'http://wx1.sinaimg.cn/bmiddle/7bddaa21ly1fdp7jrwebdj20hi0i3ta3.jpg', 'http://wx1.sinaimg.cn/bmiddle/7bddaa21ly1fdp7jrwebdj20hi0i3ta3.jpg', '卖笔的', '2017-03-17', null, '3', '3');
INSERT INTO `user` VALUES ('13', '设计大咖', 'man', '3er', '123', '1992-03-19', 'http://wx4.sinaimg.cn/mw690/6aa09e8fly1fdp5bqs68hj20k00ntq4g.jpg', 'http://wx4.sinaimg.cn/mw690/6aa09e8fly1fdp5bqs68hj20k00ntq4g.jpg', '不爱数学', '2017-03-17', null, '0', '5');
INSERT INTO `user` VALUES ('14', '维达爵爷', 'man', 'fgr', '123', '2009-03-19', 'http://wx4.sinaimg.cn/mw690/8f9cdcb4gy1fdp48p7f5oj20m90qogon.jpg', 'http://wx4.sinaimg.cn/mw690/8f9cdcb4gy1fdp48p7f5oj20m90qogon.jpg', '星战粉丝', '2017-03-17', null, '2', '7');
INSERT INTO `user` VALUES ('15', '一条狗', 'man', 'hght', '123', '1992-05-19', 'http://wx2.sinaimg.cn/mw690/8f9cdcb4gy1fdp0mjl6bxj20k00qo40o.jpg', 'http://wx2.sinaimg.cn/mw690/8f9cdcb4gy1fdp0mjl6bxj20k00qo40o.jpg', '喜欢骨头', '2017-03-17', null, '3', '1');
INSERT INTO `user` VALUES ('16', '一只猫', 'man', 'mnj', '123', '1992-05-19', 'http://wx3.sinaimg.cn/mw690/8f9cdcb4gy1fdozy4uvhrj20c80lrmzd.jpg', 'http://wx3.sinaimg.cn/mw690/8f9cdcb4gy1fdozy4uvhrj20c80lrmzd.jpg', '喜欢新鲜小肉', '2017-03-17', null, '5', '7');
INSERT INTO `user` VALUES ('17', '新浪科技', 'man', 'cvs', '123', '1992-05-19', 'http://wx1.sinaimg.cn/mw690/7fc46e2fgy1fdppxxtay3j20gl0gl422.jpg', 'http://wx1.sinaimg.cn/mw690/7fc46e2fgy1fdppxxtay3j20gl0gl422.jpg', '传递新科技', '2017-03-17', null, '5', '1');
INSERT INTO `user` VALUES ('18', '是我本人', 'man', 'grty', '123', '1999-03-19', 'http://wx1.sinaimg.cn/mw690/91e4a538gy1fdn731nrudj20jg0jgweo.jpg', 'http://wx1.sinaimg.cn/mw690/91e4a538gy1fdn731nrudj20jg0jgweo.jpg', 'xxxx', '2017-03-17', null, '5', '1');
INSERT INTO `user` VALUES ('19', '汤老湿', 'man', 'fsdw', '123', '1999-03-19', 'http://wx1.sinaimg.cn/mw690/006lFwUbgy1fdoywz3741j30gb0g3dqx.jpg', 'http://wx1.sinaimg.cn/mw690/006lFwUbgy1fdoywz3741j30gb0g3dqx.jpg', null, '2017-03-17', null, '5', '1');
INSERT INTO `user` VALUES ('20', 'Netflix', 'woman', 'xcfg', '123', '1999-03-19', 'http://wx2.sinaimg.cn/mw690/6ddb06d2ly1fdplx337vmj205604qa9z.jpg', 'http://wx2.sinaimg.cn/mw690/6ddb06d2ly1fdplx337vmj205604qa9z.jpg', '电视台', '2017-03-17', null, '3', '1');
INSERT INTO `user` VALUES ('21', '11111', '44444', '22222', '33333', null, null, null, '55555', '2017-03-30', null, null, null);
INSERT INTO `user` VALUES ('22', '1234fer564', '', '123445', '1234', null, null, null, '', '2017-04-02', null, null, null);
INSERT INTO `user` VALUES ('23', 'query', 'woman', '12', '1234', null, 'http://wx4.sinaimg.cn/mw690/71b2cbb3ly1feayf80oyoj21kw18qahp.jpg', 'http://wx4.sinaimg.cn/mw690/71b2cbb3ly1feayf80oyoj21kw18qahp.jpg', '', '2017-04-02', null, null, null);
INSERT INTO `user` VALUES ('24', '是啊', 'man', '123456', '123456', null, null, null, '', '2017-04-13', null, null, null);
