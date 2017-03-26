/*
Navicat MySQL Data Transfer

Source Server         : songjhh
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : shiro_system_1

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-26 15:41:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `alterTime` datetime DEFAULT NULL,
  `text` mediumtext,
  `tagId` smallint(6) DEFAULT NULL,
  `locked` tinyint(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('00000000001', 'tset', '2017-01-13 21:22:29', '2017-01-13 21:22:29', 'sdjfasd\r\n\r\n_fdsa_\r\n\r\n**adsf adsf**', null, null);
INSERT INTO `blog` VALUES ('00000000002', '寻找意义', '2017-01-13 22:55:55', '2017-01-13 22:55:55', '**我的**\r\n\r\n_妈妈_\r\n\r\n### 很漂亮\r\n\r\n- 大幅度', null, null);
INSERT INTO `blog` VALUES ('00000000003', '二十五歲以後，要無所畏懼', '2017-01-15 19:38:38', '2017-01-15 19:38:38', '明天要向**老闆**交差，玩了一天，晚上趕到_實驗室_，爭分奪秒調程序。代碼跑通後，我立馬又打開記事本，開始碼字，想要留住腦中僅存的記憶。因為，今天是我二十五歲的生日。我想對自己說一聲，『你好，生日快樂』。\r\n\r\n![enter image description here](https://imgsa.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=fcf279a7dc0735fa85fd46ebff3864d6/8644ebf81a4c510f8e1339a66859252dd52aa5b3.jpg \"enter image title here\")\r\n\r\n- jianghouhong\r\n- heyuxia\r\n- hexiaoling\r\n\r\n### biaoti\r\n\r\n## dabiaoti', null, null);
INSERT INTO `blog` VALUES ('00000000004', '高度测试', '2017-01-15 20:07:02', '2017-01-15 20:07:02', '- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 2323123213\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 321231231231231232\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1\r\n- 1', null, null);
INSERT INTO `blog` VALUES ('00000000005', 'jfiadn', '2017-02-04 10:51:35', '2017-02-04 10:51:35', '**adsfasf **\r\ndxafd sa\r\n\r\n dasf d', null, null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'user:update');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permissionId`),
  KEY `role_id` (`roleId`),
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1', '1');
INSERT INTO `permission_role` VALUES ('2', '1', '2');
INSERT INTO `permission_role` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'blogger', null);
INSERT INTO `role` VALUES ('2', 'administrator', null);
INSERT INTO `role` VALUES ('3', 'normal_user', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createTime` date DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `sex` enum('male','female') DEFAULT 'male',
  `salt` varchar(50) DEFAULT NULL,
  `picture` varchar(64) DEFAULT NULL,
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'songjhh', 'e9d4afe66ea80c3dad6535daf0e85aed', '2017-01-04', '2017-02-10 09:16:11', 'songjhh0312@gmail.com', 'male', '1a433d74d03d576526c73055b4659420', null, '0');
INSERT INTO `user` VALUES ('2', 'test01', '67beb08dd6cafa5ecbbb0d111355abab', '2017-01-04', '2017-01-13 22:52:56', 'test01@gmail.com', 'male', 'cb85434d7346f5a5e3ec388ed0ff2939', null, '0');
INSERT INTO `user` VALUES ('3', 'test02', '224b7cc5c300db9581aeeab93f743cce', '2017-01-04', '2017-01-05 10:23:53', 'test02@gmail.com', 'female', '4c032ab6cf4f36992ebfec3218987b69', null, '0');
INSERT INTO `user` VALUES ('4', 'heyuxia', 'e38b40dd96ec883b1f6ce5336554d0ea', '2017-01-13', '2017-01-13 23:15:14', '', 'female', '12fde9045b884e9679201a88f534d6f8', null, '0');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`roleId`),
  KEY `user_role_ibfk_1` (`userId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '3');
INSERT INTO `user_role` VALUES ('3', '3', '3');
INSERT INTO `user_role` VALUES ('4', '4', '3');
