/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : user

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-09-17 19:08:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(32) NOT NULL COMMENT '商品名称',
  `item_price` float(6,1) NOT NULL COMMENT '商品价格',
  `item_detail` text COMMENT '商品描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('1', 'iPhone 6', '5288.0', '苹果公司新发布的手机产品。');
INSERT INTO `tb_item` VALUES ('2', 'iPhone 6 plus', '6288.0', '苹果公司发布的新大屏手机。');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `order_number` varchar(20) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY `FK_orders_1` (`user_id`),
  CONSTRAINT `FK_orders_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '1', '20140921001');
INSERT INTO `tb_order` VALUES ('2', '2', '20140921002');
INSERT INTO `tb_order` VALUES ('3', '1', '20140921003');

-- ----------------------------
-- Table structure for tb_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetail`;
CREATE TABLE `tb_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(32) DEFAULT NULL COMMENT '订单号',
  `item_id` int(32) DEFAULT NULL COMMENT '商品id',
  `total_price` double(20,0) DEFAULT NULL COMMENT '商品总价',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `FK_orderdetail_1` (`order_id`),
  KEY `FK_orderdetail_2` (`item_id`),
  CONSTRAINT `FK_orderdetail_1` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`id`),
  CONSTRAINT `FK_orderdetail_2` FOREIGN KEY (`item_id`) REFERENCES `tb_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderdetail
-- ----------------------------
INSERT INTO `tb_orderdetail` VALUES ('1', '1', '1', '5288', '1');
INSERT INTO `tb_orderdetail` VALUES ('2', '1', '2', '6288', '1');
INSERT INTO `tb_orderdetail` VALUES ('3', '2', '2', '6288', '1');
INSERT INTO `tb_orderdetail` VALUES ('4', '3', '1', '5288', '1');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别，1男性，2女性',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'zhangsan', '123456', '张三', '30', '1', '1984-08-08', '2014-09-19 16:56:04', '2014-09-21 11:24:59');
INSERT INTO `tb_user` VALUES ('2', 'lisi', '123456', '李四', '21', '2', '1991-01-01', '2014-09-19 16:56:04', '2014-09-19 16:56:04');
INSERT INTO `tb_user` VALUES ('4', 'zhangwei', '123456', '张伟', '20', '1', '1988-09-01', '2014-09-19 16:56:04', '2014-09-19 16:56:04');
INSERT INTO `tb_user` VALUES ('5', 'lina', '123456', '李娜', '28', '1', '1985-01-01', '2014-09-19 16:56:04', '2014-09-19 16:56:04');
INSERT INTO `tb_user` VALUES ('6', 'lilei', '123456', '李磊', '23', '1', '1988-08-08', '2014-09-20 11:41:15', '2014-09-20 11:41:15');
INSERT INTO `tb_user` VALUES ('11', 'aaa', '123456', '啊啊啊', '18', '2', '1970-01-01', '2018-09-14 21:28:14', '2018-09-14 21:28:14');
INSERT INTO `tb_user` VALUES ('13', 'ddd', '654623', '顶顶顶', '30', '2', '1970-01-01', '2018-09-14 21:33:02', '2018-09-14 21:33:02');
INSERT INTO `tb_user` VALUES ('18', 'ttt', '234244', '突突突', '30', '0', '2018-09-16', '2018-09-16 08:35:07', '2018-09-16 08:35:07');
INSERT INTO `tb_user` VALUES ('20', 'fff', '234244', '烦烦烦', '30', '0', '2018-09-16', '2018-09-16 09:21:23', '2018-09-16 09:21:23');
INSERT INTO `tb_user` VALUES ('21', 'ggg', '234244', '嘎嘎嘎', '30', '0', '2018-09-16', '2018-09-16 09:22:20', '2018-09-16 09:22:20');
INSERT INTO `tb_user` VALUES ('28', 'jjj', '342546', '急急急', '30', '2', '2018-09-16', '2018-09-16 17:24:08', '2018-09-16 17:29:27');
