/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : edu

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-09-20 23:05:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(200) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `rmb` decimal(10,0) DEFAULT NULL,
  `usd` decimal(10,0) DEFAULT NULL,
  `activateCode` varchar(300) DEFAULT NULL,
  `uuid` varchar(200) DEFAULT NULL,
  `userType` varchar(100) DEFAULT NULL,
  `homeUrl` varchar(200) DEFAULT NULL,
  `imageUrl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creation_by` int(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` int(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `roleId` int(20) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_role_resources`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resources`;
CREATE TABLE `t_role_resources` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `resourcesId` int(20) DEFAULT NULL,
  `roleId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_resources`;
CREATE TABLE `t_resources` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ctl` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `leaf` bit(1) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `methodName` varchar(255) DEFAULT NULL,
  `modules` varchar(255) DEFAULT NULL,
  `modulesName` varchar(255) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  `qtip` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  `display` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gh3ryfwlwfbulr0tf6nv7lffq` (`pid`),
  CONSTRAINT `FK_gh3ryfwlwfbulr0tf6nv7lffq` FOREIGN KEY (`pid`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_flatcode`
-- ----------------------------
DROP TABLE IF EXISTS `t_flatcode`;
CREATE TABLE `t_flatcode` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3873 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_classes`;
CREATE TABLE `t_classes` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `bh` varchar(255) DEFAULT NULL,
  `bjmc` varchar(255) DEFAULT NULL,
  `jbny` varchar(255) DEFAULT NULL,
  `schoolId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_school`
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cjxyzk` varchar(255) DEFAULT NULL,
  `czdh` varchar(255) DEFAULT NULL,
  `dwfzr` varchar(255) DEFAULT NULL,
  `dzxx` varchar(255) DEFAULT NULL,
  `gcyxzk` varchar(255) DEFAULT NULL,
  `jxny` varchar(255) DEFAULT NULL,
  `lsyg` varchar(255) DEFAULT NULL,
  `lxdh` varchar(255) DEFAULT NULL,
  `wlxyzk` varchar(255) DEFAULT NULL,
  `xkmls` int(11) DEFAULT NULL,
  `xqr` varchar(255) DEFAULT NULL,
  `xxbxlxm` varchar(255) DEFAULT NULL,
  `xxdm` varchar(255) DEFAULT NULL,
  `xxdz` varchar(255) DEFAULT NULL,
  `xxjbzm` varchar(255) DEFAULT NULL,
  `xxmc` varchar(255) DEFAULT NULL,
  `xxqhm` varchar(255) DEFAULT NULL,
  `xxxz` varchar(255) DEFAULT NULL,
  `xxxzm` varchar(255) DEFAULT NULL,
  `xxywmc` varchar(255) DEFAULT NULL,
  `xxzgbmm` varchar(255) DEFAULT NULL,
  `xxzgbmmc` varchar(255) DEFAULT NULL,
  `yjsyzk` varchar(255) DEFAULT NULL,
  `yzbm` varchar(255) DEFAULT NULL,
  `zdyxzk` varchar(255) DEFAULT NULL,
  `zydz` varchar(255) DEFAULT NULL,
  `zzjgdm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_curriculum`
-- ----------------------------
DROP TABLE IF EXISTS `t_curriculum`;
CREATE TABLE `t_curriculum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `charge` decimal(19,2) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `kch` varchar(255) DEFAULT NULL,
  `kcjj` varchar(255) DEFAULT NULL,
  `kclbm` varchar(255) DEFAULT NULL,
  `kcmc` varchar(255) DEFAULT NULL,
  `kcyq` varchar(255) DEFAULT NULL,
  `kcywmc` varchar(255) DEFAULT NULL,
  `kkjssj` datetime DEFAULT NULL,
  `kkkssj` datetime DEFAULT NULL,
  `ksxnd` varchar(255) DEFAULT NULL,
  `ksxqm` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `wsjxzk` varchar(255) DEFAULT NULL,
  `xf` int(11) DEFAULT NULL,
  `xs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `star` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
