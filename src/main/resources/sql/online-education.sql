/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : online-education

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-09-20 23:09:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_achievementinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_achievementinfo`;
CREATE TABLE `t_achievementinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `curriculumId` bigint(20) DEFAULT NULL,
  `fs` bigint(20) DEFAULT NULL,
  `ksId` bigint(20) DEFAULT NULL,
  `sjId` bigint(20) DEFAULT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_achievementinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bh` varchar(255) DEFAULT NULL,
  `bjmc` varchar(255) DEFAULT NULL,
  `bzrzgh` varchar(255) DEFAULT NULL,
  `bzxh` varchar(255) DEFAULT NULL,
  `collegeDepartmentId` bigint(20) DEFAULT NULL,
  `jbny` varchar(255) DEFAULT NULL,
  `majorId` bigint(20) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `xz` int(11) DEFAULT NULL,
  `zyh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------

-- ----------------------------
-- Table structure for `t_collection`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountCategory` varchar(255) DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `customerId` bigint(20) DEFAULT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `t_collegedepartment`
-- ----------------------------
DROP TABLE IF EXISTS `t_collegedepartment`;
CREATE TABLE `t_collegedepartment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dwfzr` varchar(255) DEFAULT NULL,
  `jlny` varchar(255) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `xzfzr` varchar(255) DEFAULT NULL,
  `yxsbbm` varchar(255) DEFAULT NULL,
  `yxsh` varchar(255) DEFAULT NULL,
  `yxsjc` varchar(255) DEFAULT NULL,
  `yxslbm` varchar(255) DEFAULT NULL,
  `yxsmc` varchar(255) DEFAULT NULL,
  `yxsywmc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collegedepartment
-- ----------------------------

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
  `studentid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

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
  `majorId` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `wsjxzk` varchar(255) DEFAULT NULL,
  `xf` int(11) DEFAULT NULL,
  `xs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_curriculum
-- ----------------------------

-- ----------------------------
-- Table structure for `t_curriculumdocument`
-- ----------------------------
DROP TABLE IF EXISTS `t_curriculumdocument`;
CREATE TABLE `t_curriculumdocument` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attName` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_curriculumdocument
-- ----------------------------

-- ----------------------------
-- Table structure for `t_curriculum_resources`
-- ----------------------------
DROP TABLE IF EXISTS `t_curriculum_resources`;
CREATE TABLE `t_curriculum_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chapterName` varchar(255) DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `leaf` bit(1) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `qtip` varchar(255) DEFAULT NULL,
  `resourcesName` varchar(255) DEFAULT NULL,
  `resourcesType` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_curriculum_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` bigint(20) NOT NULL,
  `activateCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `companyWebsite` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `rmb` decimal(19,2) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `usd` decimal(19,2) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `xm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('5', null, null, null, null, null, null, null, null, null, 'customer', null, 'Y3VzdG9tZXI=', '2018-09-15 13:03:31', null, null, '1', null, null, '会员');
INSERT INTO `t_customer` VALUES ('10', null, null, null, null, null, null, null, null, null, 'customer', null, 'Y3VzdG9tZXI=', '2018-09-15 13:06:58', null, null, '1', null, null, '会员');
INSERT INTO `t_customer` VALUES ('11', null, null, null, null, null, null, null, null, null, 'guest', null, 'Z3Vlc3Q=', '2018-09-15 13:06:58', null, null, '1', null, null, '来宾');

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `collegeDepartmentId` bigint(20) DEFAULT NULL,
  `ksfzrzgh` varchar(255) DEFAULT NULL,
  `ksh` varchar(255) DEFAULT NULL,
  `ksjc` varchar(255) DEFAULT NULL,
  `ksmc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------

-- ----------------------------
-- Table structure for `t_examinationclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_examinationclass`;
CREATE TABLE `t_examinationclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bjId` bigint(20) DEFAULT NULL,
  `ksId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_examinationclass
-- ----------------------------

-- ----------------------------
-- Table structure for `t_examinationinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_examinationinfo`;
CREATE TABLE `t_examinationinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `jskssj` datetime DEFAULT NULL,
  `kcId` bigint(20) DEFAULT NULL,
  `kskssj` datetime DEFAULT NULL,
  `ksmc` varchar(255) DEFAULT NULL,
  `ksrj` datetime DEFAULT NULL,
  `sjId` bigint(20) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_examinationinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_examinationpaper`
-- ----------------------------
DROP TABLE IF EXISTS `t_examinationpaper`;
CREATE TABLE `t_examinationpaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `sjmc` varchar(255) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_examinationpaper
-- ----------------------------

-- ----------------------------
-- Table structure for `t_examinationroom`
-- ----------------------------
DROP TABLE IF EXISTS `t_examinationroom`;
CREATE TABLE `t_examinationroom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `kcmc` varchar(255) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_examinationroom
-- ----------------------------

-- ----------------------------
-- Table structure for `t_expenserecord`
-- ----------------------------
DROP TABLE IF EXISTS `t_expenserecord`;
CREATE TABLE `t_expenserecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) DEFAULT NULL,
  `customerId` bigint(20) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `rmb` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expenserecord
-- ----------------------------

-- ----------------------------
-- Table structure for `t_flatcode`
-- ----------------------------
DROP TABLE IF EXISTS `t_flatcode`;
CREATE TABLE `t_flatcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3873 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_flatcode
-- ----------------------------
INSERT INTO `t_flatcode` VALUES ('1', 'dm_rkxd', '任课学段码', '3', null, '普通初中');
INSERT INTO `t_flatcode` VALUES ('2', 'dm_rkxd', '任课学段码', '4', null, '普通高中');
INSERT INTO `t_flatcode` VALUES ('3', 'dm_rkxd', '任课学段码', '1', null, '学前教育');
INSERT INTO `t_flatcode` VALUES ('4', 'dm_rkxd', '任课学段码', '2', null, '小学');
INSERT INTO `t_flatcode` VALUES ('5', 'dm_rkxd', '任课学段码', '5', null, '职业初中');
INSERT INTO `t_flatcode` VALUES ('6', 'dm_rkxd', '任课学段码', '6', null, '职业高中');
INSERT INTO `t_flatcode` VALUES ('7', 'dm_rkxd', '任课学段码', '7', null, '特殊教育');
INSERT INTO `t_flatcode` VALUES ('8', 'dm_rkxd', '任课学段码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('9', 'gb_jtcs', '家庭出身码', '01', null, '工人');
INSERT INTO `t_flatcode` VALUES ('10', 'gb_jtcs', '家庭出身码', '03', null, '农民');
INSERT INTO `t_flatcode` VALUES ('11', 'gb_jtcs', '家庭出身码', '10', null, '干部');
INSERT INTO `t_flatcode` VALUES ('12', 'gb_jtcs', '家庭出身码', '11', null, '革命军人');
INSERT INTO `t_flatcode` VALUES ('13', 'gb_jtcs', '家庭出身码', '12', null, '革命烈士');
INSERT INTO `t_flatcode` VALUES ('14', 'gb_jtcs', '家庭出身码', '14', null, '职员');
INSERT INTO `t_flatcode` VALUES ('15', 'gb_jtcs', '家庭出身码', '16', null, '自由职业');
INSERT INTO `t_flatcode` VALUES ('16', 'gb_jtcs', '家庭出身码', '17', null, '店员');
INSERT INTO `t_flatcode` VALUES ('17', 'gb_jtcs', '家庭出身码', '20', null, '商人');
INSERT INTO `t_flatcode` VALUES ('18', 'gb_jtcs', '家庭出身码', '21', null, '小业主');
INSERT INTO `t_flatcode` VALUES ('19', 'gb_jtcs', '家庭出身码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('20', 'gb_brcf', '本人成分码', '01', null, '工人');
INSERT INTO `t_flatcode` VALUES ('21', 'gb_brcf', '本人成分码', '03', null, '农民');
INSERT INTO `t_flatcode` VALUES ('22', 'gb_brcf', '本人成分码', '10', null, '干部');
INSERT INTO `t_flatcode` VALUES ('23', 'gb_brcf', '本人成分码', '11', null, '革命军人');
INSERT INTO `t_flatcode` VALUES ('24', 'gb_brcf', '本人成分码', '13', null, '学生');
INSERT INTO `t_flatcode` VALUES ('25', 'gb_brcf', '本人成分码', '14', null, '职员');
INSERT INTO `t_flatcode` VALUES ('26', 'gb_brcf', '本人成分码', '16', null, '自由职业');
INSERT INTO `t_flatcode` VALUES ('27', 'gb_brcf', '本人成分码', '17', null, '店员');
INSERT INTO `t_flatcode` VALUES ('28', 'gb_brcf', '本人成分码', '20', null, '商人');
INSERT INTO `t_flatcode` VALUES ('29', 'gb_brcf', '本人成分码', '21', null, '小业主');
INSERT INTO `t_flatcode` VALUES ('30', 'gb_brcf', '本人成分码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('31', 'gb_whcd', '文化程度码', '21', null, '大学毕业');
INSERT INTO `t_flatcode` VALUES ('32', 'gb_whcd', '文化程度码', '11', null, '研究毕业生');
INSERT INTO `t_flatcode` VALUES ('33', 'gb_whcd', '文化程度码', '31', null, '专科毕业');
INSERT INTO `t_flatcode` VALUES ('34', 'gb_whcd', '文化程度码', '41', null, '中专毕业');
INSERT INTO `t_flatcode` VALUES ('35', 'gb_whcd', '文化程度码', '51', null, '技工学校毕业');
INSERT INTO `t_flatcode` VALUES ('36', 'gb_whcd', '文化程度码', '61', null, '高中毕业');
INSERT INTO `t_flatcode` VALUES ('37', 'gb_whcd', '文化程度码', '71', null, '初中毕业');
INSERT INTO `t_flatcode` VALUES ('38', 'gb_whcd', '文化程度码', '81', null, '小学毕业');
INSERT INTO `t_flatcode` VALUES ('39', 'dm_bzlb', '编制类别码', '1', null, '专任教师');
INSERT INTO `t_flatcode` VALUES ('40', 'dm_bzlb', '编制类别码', '2', null, '行政人员');
INSERT INTO `t_flatcode` VALUES ('41', 'dm_bzlb', '编制类别码', '3', null, '教辅人员');
INSERT INTO `t_flatcode` VALUES ('42', 'dm_bzlb', '编制类别码', '4', null, '工勤人员');
INSERT INTO `t_flatcode` VALUES ('43', 'dm_bzlb', '编制类别码', '5', null, '校办企业职工');
INSERT INTO `t_flatcode` VALUES ('44', 'dm_bzlb', '编制类别码', '6', null, '代课教师');
INSERT INTO `t_flatcode` VALUES ('45', 'dm_bzlb', '编制类别码', '7', null, '兼任(职)教师');
INSERT INTO `t_flatcode` VALUES ('46', 'dm_bzlb', '编制类别码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('47', 'dm_gwzy', '岗位职业码', '10', null, '教师');
INSERT INTO `t_flatcode` VALUES ('48', 'dm_gwzy', '岗位职业码', '20', null, '教师兼行政');
INSERT INTO `t_flatcode` VALUES ('49', 'dm_gwzy', '岗位职业码', '21', null, '教研室主任(组长)');
INSERT INTO `t_flatcode` VALUES ('50', 'dm_gwzy', '岗位职业码', '22', null, '年级主任(组长)');
INSERT INTO `t_flatcode` VALUES ('51', 'dm_gwzy', '岗位职业码', '23', null, '班主任');
INSERT INTO `t_flatcode` VALUES ('52', 'dm_gwzy', '岗位职业码', '24', null, '辅导员、教练员');
INSERT INTO `t_flatcode` VALUES ('53', 'dm_gwzy', '岗位职业码', '25', null, '共青团工作负责人');
INSERT INTO `t_flatcode` VALUES ('54', 'dm_gwzy', '岗位职业码', '26', null, '工会工作负责人');
INSERT INTO `t_flatcode` VALUES ('55', 'dm_gwzy', '岗位职业码', '27', null, '妇女工作负责人');
INSERT INTO `t_flatcode` VALUES ('56', 'dm_gwzy', '岗位职业码', '28', null, '其他工作负责人');
INSERT INTO `t_flatcode` VALUES ('57', 'dm_gwzy', '岗位职业码', '30', null, '行政');
INSERT INTO `t_flatcode` VALUES ('58', 'dm_gwzy', '岗位职业码', '31', null, '校领导');
INSERT INTO `t_flatcode` VALUES ('59', 'dm_gwzy', '岗位职业码', '32', null, '行政处室负责人');
INSERT INTO `t_flatcode` VALUES ('60', 'dm_gwzy', '岗位职业码', '33', null, '行政处室工作');
INSERT INTO `t_flatcode` VALUES ('61', 'dm_gwzy', '岗位职业码', '34', null, '行政兼教学工作');
INSERT INTO `t_flatcode` VALUES ('62', 'dm_gwzy', '岗位职业码', '40', null, '教辅');
INSERT INTO `t_flatcode` VALUES ('63', 'dm_gwzy', '岗位职业码', '41', null, '实习实验工作与管理');
INSERT INTO `t_flatcode` VALUES ('64', 'dm_gwzy', '岗位职业码', '42', null, '教学仪器设备维护与管理');
INSERT INTO `t_flatcode` VALUES ('65', 'dm_gwzy', '岗位职业码', '43', null, '体育设备设施维护与管理');
INSERT INTO `t_flatcode` VALUES ('66', 'dm_gwzy', '岗位职业码', '44', null, '文艺设备设施维护与管理');
INSERT INTO `t_flatcode` VALUES ('67', 'dm_gwzy', '岗位职业码', '45', null, '图书教材工作与管理');
INSERT INTO `t_flatcode` VALUES ('68', 'dm_gwzy', '岗位职业码', '46', null, '档案资料工作与管理');
INSERT INTO `t_flatcode` VALUES ('69', 'dm_gwzy', '岗位职业码', '47', null, '电教设备维护与管理');
INSERT INTO `t_flatcode` VALUES ('70', 'dm_gwzy', '岗位职业码', '48', null, '宣传教育工作与管理');
INSERT INTO `t_flatcode` VALUES ('71', 'dm_gwzy', '岗位职业码', '60', null, '工勤');
INSERT INTO `t_flatcode` VALUES ('72', 'dm_gwzy', '岗位职业码', '61', null, '医护保健工作与管理');
INSERT INTO `t_flatcode` VALUES ('73', 'dm_gwzy', '岗位职业码', '62', null, '财务统计工作与管理');
INSERT INTO `t_flatcode` VALUES ('74', 'dm_gwzy', '岗位职业码', '63', null, '校园维护与管理');
INSERT INTO `t_flatcode` VALUES ('75', 'dm_gwzy', '岗位职业码', '64', null, '建筑维护与管理');
INSERT INTO `t_flatcode` VALUES ('76', 'dm_gwzy', '岗位职业码', '65', null, '餐饮服务与管理');
INSERT INTO `t_flatcode` VALUES ('77', 'dm_gwzy', '岗位职业码', '66', null, '生活服务与管理');
INSERT INTO `t_flatcode` VALUES ('78', 'dm_gwzy', '岗位职业码', '67', null, '商贸服务与管理');
INSERT INTO `t_flatcode` VALUES ('79', 'dm_gwzy', '岗位职业码', '68', null, '教学服务与管理');
INSERT INTO `t_flatcode` VALUES ('80', 'dm_gwzy', '岗位职业码', '70', null, '校办企业');
INSERT INTO `t_flatcode` VALUES ('81', 'dm_gwzy', '岗位职业码', '71', null, '校办企业负责人');
INSERT INTO `t_flatcode` VALUES ('82', 'dm_gwzy', '岗位职业码', '79', null, '校办企业职工');
INSERT INTO `t_flatcode` VALUES ('83', 'dm_gwzy', '岗位职业码', '80', null, '其他工作');
INSERT INTO `t_flatcode` VALUES ('84', 'gb_dzzw', '曾任党政职务码12403', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('85', 'gb_dzzw', '曾任党政职务码12403', '216A', null, '局长');
INSERT INTO `t_flatcode` VALUES ('86', 'gb_dzzw', '曾任党政职务码12403', '216B', null, '副局长');
INSERT INTO `t_flatcode` VALUES ('87', 'gb_dzzw', '曾任党政职务码12403', '219A', null, '处长');
INSERT INTO `t_flatcode` VALUES ('88', 'gb_dzzw', '曾任党政职务码12403', '219B', null, '副处长');
INSERT INTO `t_flatcode` VALUES ('89', 'gb_dzzw', '曾任党政职务码12403', '220A', null, '科长');
INSERT INTO `t_flatcode` VALUES ('90', 'gb_dzzw', '曾任党政职务码12403', '220B', null, '副科长');
INSERT INTO `t_flatcode` VALUES ('91', 'gb_dzzw', '曾任党政职务码12403', '258A', null, '县长');
INSERT INTO `t_flatcode` VALUES ('92', 'gb_dzzw', '曾任党政职务码12403', '258B', null, '副县长');
INSERT INTO `t_flatcode` VALUES ('93', 'gb_dzzw', '曾任党政职务码12403', '260A', null, '镇长');
INSERT INTO `t_flatcode` VALUES ('94', 'gb_dzzw', '曾任党政职务码12403', '260B', null, '副镇长');
INSERT INTO `t_flatcode` VALUES ('95', 'gb_dzzw', '曾任党政职务码12403', '261A', null, '乡长');
INSERT INTO `t_flatcode` VALUES ('96', 'gb_dzzw', '曾任党政职务码12403', '261B', null, '副乡长');
INSERT INTO `t_flatcode` VALUES ('97', 'gb_dzzw', '曾任党政职务码12403', '262A', null, '村长');
INSERT INTO `t_flatcode` VALUES ('98', 'gb_dzzw', '曾任党政职务码12403', '262B', null, '副村长');
INSERT INTO `t_flatcode` VALUES ('99', 'gb_jszw', '曾任技术职务码8561', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('100', 'gb_jszw', '曾任技术职务码8561', '01', null, '高等学校教师');
INSERT INTO `t_flatcode` VALUES ('101', 'gb_jszw', '曾任技术职务码8561', '02', null, '中等专业学校教师');
INSERT INTO `t_flatcode` VALUES ('102', 'gb_jszw', '曾任技术职务码8561', '05', null, '中学教师');
INSERT INTO `t_flatcode` VALUES ('103', 'gb_jszw', '曾任技术职务码8561', '052', null, '中学高级教师');
INSERT INTO `t_flatcode` VALUES ('104', 'gb_jszw', '曾任技术职务码8561', '053', null, '中学一级教师');
INSERT INTO `t_flatcode` VALUES ('105', 'gb_jszw', '曾任技术职务码8561', '054', null, '中学二级教师');
INSERT INTO `t_flatcode` VALUES ('106', 'gb_jszw', '曾任技术职务码8561', '055', null, '中学三级教师');
INSERT INTO `t_flatcode` VALUES ('107', 'gb_jszw', '曾任技术职务码8561', '072', null, '高级实验师');
INSERT INTO `t_flatcode` VALUES ('108', 'gb_jszw', '曾任技术职务码8561', '073', null, '实验师');
INSERT INTO `t_flatcode` VALUES ('109', 'gb_jszw', '曾任技术职务码8561', '074', null, '助理实验师');
INSERT INTO `t_flatcode` VALUES ('110', 'gb_jszw', '曾任技术职务码8561', '075', null, '实验员');
INSERT INTO `t_flatcode` VALUES ('111', 'gb_jszw', '曾任技术职务码8561', '099', null, '其他');
INSERT INTO `t_flatcode` VALUES ('112', 'gb_xw', '学位码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('113', 'gb_xw', '学位码', '1', null, '名誉博士');
INSERT INTO `t_flatcode` VALUES ('114', 'gb_xw', '学位码', '2', null, '博士');
INSERT INTO `t_flatcode` VALUES ('115', 'gb_xw', '学位码', '3', null, '硕士');
INSERT INTO `t_flatcode` VALUES ('116', 'gb_xw', '学位码', '4', null, '学士');
INSERT INTO `t_flatcode` VALUES ('117', 'gb_shjz', '社会兼职码12408', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('118', 'gb_shjz', '社会兼职码12408', '0118', null, '全国人大代表');
INSERT INTO `t_flatcode` VALUES ('119', 'gb_shjz', '社会兼职码12408', '0128', null, '省(自治区、直辖市)人大代表');
INSERT INTO `t_flatcode` VALUES ('120', 'gb_shjz', '社会兼职码12408', '0148', null, '市(地级)人大代表');
INSERT INTO `t_flatcode` VALUES ('121', 'gb_shjz', '社会兼职码12408', '0168', null, '县(市、旗、区)人大代表');
INSERT INTO `t_flatcode` VALUES ('122', 'gb_shjz', '社会兼职码12408', '0216', null, '全国政协委员');
INSERT INTO `t_flatcode` VALUES ('123', 'gb_shjz', '社会兼职码12408', '0226', null, '省(自治区、直辖市)政协委员');
INSERT INTO `t_flatcode` VALUES ('124', 'gb_shjz', '社会兼职码12408', '0246', null, '市(地级)政协委员');
INSERT INTO `t_flatcode` VALUES ('125', 'gb_shjz', '社会兼职码12408', '0266', null, '县(市、旗、区)政协委员');
INSERT INTO `t_flatcode` VALUES ('126', 'gb_shjz', '社会兼职码12408', '0416', null, '民革委员');
INSERT INTO `t_flatcode` VALUES ('127', 'gb_shjz', '社会兼职码12408', '0496', null, '民革执行局委员');
INSERT INTO `t_flatcode` VALUES ('128', 'gb_shjz', '社会兼职码12408', '0426', null, '民革省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('129', 'gb_shjz', '社会兼职码12408', '0446', null, '民革地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('130', 'gb_shjz', '社会兼职码12408', '0466', null, '民革县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('131', 'gb_shjz', '社会兼职码12408', '0516', null, '民盟委员');
INSERT INTO `t_flatcode` VALUES ('132', 'gb_shjz', '社会兼职码12408', '0596', null, '民盟执行局委员');
INSERT INTO `t_flatcode` VALUES ('133', 'gb_shjz', '社会兼职码12408', '0526', null, '民盟省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('134', 'gb_shjz', '社会兼职码12408', '0546', null, '民盟地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('135', 'gb_shjz', '社会兼职码12408', '0566', null, '民盟县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('136', 'gb_shjz', '社会兼职码12408', '0616', null, '民建委员');
INSERT INTO `t_flatcode` VALUES ('137', 'gb_shjz', '社会兼职码12408', '0696', null, '民建执行局委员');
INSERT INTO `t_flatcode` VALUES ('138', 'gb_shjz', '社会兼职码12408', '0626', null, '民建省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('139', 'gb_shjz', '社会兼职码12408', '0646', null, '民建地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('140', 'gb_shjz', '社会兼职码12408', '0666', null, '民建县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('141', 'gb_shjz', '社会兼职码12408', '0716', null, '民进委员');
INSERT INTO `t_flatcode` VALUES ('142', 'gb_shjz', '社会兼职码12408', '0796', null, '民进执行局委员');
INSERT INTO `t_flatcode` VALUES ('143', 'gb_shjz', '社会兼职码12408', '0726', null, '民进省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('144', 'gb_shjz', '社会兼职码12408', '0746', null, '民进地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('145', 'gb_shjz', '社会兼职码12408', '0766', null, '民进县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('146', 'gb_shjz', '社会兼职码12408', '0816', null, '农工党委员');
INSERT INTO `t_flatcode` VALUES ('147', 'gb_shjz', '社会兼职码12408', '0896', null, '农工党执行局委员');
INSERT INTO `t_flatcode` VALUES ('148', 'gb_shjz', '社会兼职码12408', '0826', null, '农工党省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('149', 'gb_shjz', '社会兼职码12408', '0846', null, '农工党地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('150', 'gb_shjz', '社会兼职码12408', '0866', null, '农工党县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('151', 'gb_shjz', '社会兼职码12408', '0916', null, '致公党委员');
INSERT INTO `t_flatcode` VALUES ('152', 'gb_shjz', '社会兼职码12408', '0996', null, '致公党执行局委员');
INSERT INTO `t_flatcode` VALUES ('153', 'gb_shjz', '社会兼职码12408', '0926', null, '致公党省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('154', 'gb_shjz', '社会兼职码12408', '0946', null, '致公党地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('155', 'gb_shjz', '社会兼职码12408', '0966', null, '致公党县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('156', 'gb_shjz', '社会兼职码12408', '1016', null, '九三学社委员');
INSERT INTO `t_flatcode` VALUES ('157', 'gb_shjz', '社会兼职码12408', '1096', null, '九三学社执行局委员');
INSERT INTO `t_flatcode` VALUES ('158', 'gb_shjz', '社会兼职码12408', '1026', null, '九三学社省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('159', 'gb_shjz', '社会兼职码12408', '1046', null, '九三学社地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('160', 'gb_shjz', '社会兼职码12408', '1066', null, '九三学社县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('161', 'gb_shjz', '社会兼职码12408', '1116', null, '台盟委员');
INSERT INTO `t_flatcode` VALUES ('162', 'gb_shjz', '社会兼职码12408', '1196', null, '台盟执行局委员');
INSERT INTO `t_flatcode` VALUES ('163', 'gb_shjz', '社会兼职码12408', '1126', null, '台盟省(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('164', 'gb_shjz', '社会兼职码12408', '1146', null, '台盟地(市、州、盟)委员');
INSERT INTO `t_flatcode` VALUES ('165', 'gb_shjz', '社会兼职码12408', '1166', null, '台盟县(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('166', 'gb_shjz', '社会兼职码12408', '4116', null, '全国总工会主席团委员');
INSERT INTO `t_flatcode` VALUES ('167', 'gb_shjz', '社会兼职码12408', '4126', null, '省(自治区、直辖市)工会委员');
INSERT INTO `t_flatcode` VALUES ('168', 'gb_shjz', '社会兼职码12408', '4146', null, '市(地级市)工会委员');
INSERT INTO `t_flatcode` VALUES ('169', 'gb_shjz', '社会兼职码12408', '4166', null, '县(市、旗、区)工会委员');
INSERT INTO `t_flatcode` VALUES ('170', 'gb_shjz', '社会兼职码12408', '4216', null, '团中央委员');
INSERT INTO `t_flatcode` VALUES ('171', 'gb_shjz', '社会兼职码12408', '4217', null, '团中央候补委员');
INSERT INTO `t_flatcode` VALUES ('172', 'gb_shjz', '社会兼职码12408', '4226', null, '省共青团(自治区、直辖市)委员');
INSERT INTO `t_flatcode` VALUES ('173', 'gb_shjz', '社会兼职码12408', '4227', null, '省共青团(自治区、直辖市)候补委员');
INSERT INTO `t_flatcode` VALUES ('174', 'gb_shjz', '社会兼职码12408', '4246', null, '市共青团(地级市)委员');
INSERT INTO `t_flatcode` VALUES ('175', 'gb_shjz', '社会兼职码12408', '4247', null, '市共青团(地级市)候补委员');
INSERT INTO `t_flatcode` VALUES ('176', 'gb_shjz', '社会兼职码12408', '4266', null, '县共青团(市、旗、区)委员');
INSERT INTO `t_flatcode` VALUES ('177', 'gb_shjz', '社会兼职码12408', '4267', null, '县共青团(市、旗、区)候补委员');
INSERT INTO `t_flatcode` VALUES ('178', 'gb_shjz', '社会兼职码12408', '5116', null, '全国侨联委员');
INSERT INTO `t_flatcode` VALUES ('179', 'gb_shjz', '社会兼职码12408', '5126', null, '省(自治区、直辖市)侨联委员');
INSERT INTO `t_flatcode` VALUES ('180', 'gb_shjz', '社会兼职码12408', '5246', null, '地(市、州、盟)侨联委员');
INSERT INTO `t_flatcode` VALUES ('181', 'gb_shjz', '社会兼职码12408', '5266', null, '县(市、旗、区)侨联委员');
INSERT INTO `t_flatcode` VALUES ('182', 'gb_shjz', '社会兼职码12408', '6116', null, '全国文联委员');
INSERT INTO `t_flatcode` VALUES ('183', 'gb_shjz', '社会兼职码12408', '6196', null, '全国文联主席团委员');
INSERT INTO `t_flatcode` VALUES ('184', 'gb_shjz', '社会兼职码12408', '6126', null, '省(自治区、直辖市)文联委员');
INSERT INTO `t_flatcode` VALUES ('185', 'gb_shjz', '社会兼职码12408', '6147', null, '地(市、州、盟)文联委员');
INSERT INTO `t_flatcode` VALUES ('186', 'gb_shjz', '社会兼职码12408', '6166', null, '县(市、旗、区)文联委员');
INSERT INTO `t_flatcode` VALUES ('187', 'gb_shjz', '社会兼职码12408', '6216', null, '作协会员');
INSERT INTO `t_flatcode` VALUES ('188', 'gb_shjz', '社会兼职码12408', '6226', null, '省(自治区、直辖市)作协会员');
INSERT INTO `t_flatcode` VALUES ('189', 'gb_shjz', '社会兼职码12408', '6246', null, '地(市、州、盟)作协会员');
INSERT INTO `t_flatcode` VALUES ('190', 'gb_shjz', '社会兼职码12408', '6266', null, '县(市、旗、区)作协会员');
INSERT INTO `t_flatcode` VALUES ('191', 'gb_shjz', '社会兼职码12408', '6316', null, '全国科协委员');
INSERT INTO `t_flatcode` VALUES ('192', 'gb_shjz', '社会兼职码12408', '6326', null, '省(自治区、直辖市)科协委员');
INSERT INTO `t_flatcode` VALUES ('193', 'gb_shjz', '社会兼职码12408', '6346', null, '地(市、州、盟)科协委员');
INSERT INTO `t_flatcode` VALUES ('194', 'gb_shjz', '社会兼职码12408', '6366', null, '县(市、旗、区)科协委员');
INSERT INTO `t_flatcode` VALUES ('195', 'gb_shjz', '社会兼职码12408', '6416', null, '中国科学院和社会科学院学部委员');
INSERT INTO `t_flatcode` VALUES ('196', 'gb_xl', '学历码4658', '10', null, '研究生');
INSERT INTO `t_flatcode` VALUES ('197', 'gb_xl', '学历码4658', '11', null, '研究生毕业');
INSERT INTO `t_flatcode` VALUES ('198', 'gb_xl', '学历码4658', '21', null, '大学毕业');
INSERT INTO `t_flatcode` VALUES ('199', 'gb_xl', '学历码4658', '31', null, '专科毕业');
INSERT INTO `t_flatcode` VALUES ('200', 'gb_xl', '学历码4658', '41', null, '中专毕业');
INSERT INTO `t_flatcode` VALUES ('201', 'gb_xl', '学历码4658', '51', null, '技工学校毕业');
INSERT INTO `t_flatcode` VALUES ('202', 'gb_xl', '学历码4658', '61', null, '高中毕业');
INSERT INTO `t_flatcode` VALUES ('203', 'gb_xl', '学历码4658', '71', null, '初中毕业');
INSERT INTO `t_flatcode` VALUES ('204', 'gb_xl', '学历码4658', '81', null, '小学毕业');
INSERT INTO `t_flatcode` VALUES ('205', 'gb_xl', '学历码4658', '-', null, '其他');
INSERT INTO `t_flatcode` VALUES ('206', 'dm_xxxs', '学习形式码4658', '01', null, '高等学校（学历教育）');
INSERT INTO `t_flatcode` VALUES ('207', 'dm_xxxs', '学习形式码4658', '02', null, '高等教育自学考试');
INSERT INTO `t_flatcode` VALUES ('208', 'dm_xxxs', '学习形式码4658', '03', null, '夜大学');
INSERT INTO `t_flatcode` VALUES ('209', 'dm_xxxs', '学习形式码4658', '04', null, '职工大学');
INSERT INTO `t_flatcode` VALUES ('210', 'dm_xxxs', '学习形式码4658', '05', null, '广播电视大学');
INSERT INTO `t_flatcode` VALUES ('211', 'dm_xxxs', '学习形式码4658', '06', null, '业余大学');
INSERT INTO `t_flatcode` VALUES ('212', 'dm_xxxs', '学习形式码4658', '07', null, '函授');
INSERT INTO `t_flatcode` VALUES ('213', 'dm_xxxs', '学习形式码4658', '08', null, '研修班');
INSERT INTO `t_flatcode` VALUES ('214', 'dm_xxxs', '学习形式码4658', '09', null, '高等学校进修');
INSERT INTO `t_flatcode` VALUES ('215', 'dm_xxxs', '学习形式码4658', '11', null, '培训');
INSERT INTO `t_flatcode` VALUES ('216', 'dm_xxxs', '学习形式码4658', '21', null, '网络教育');
INSERT INTO `t_flatcode` VALUES ('217', 'dm_xxxs', '学习形式码4658', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('218', 'dm_xxfs', '学习方式码', '1', null, '脱产');
INSERT INTO `t_flatcode` VALUES ('219', 'dm_xxfs', '学习方式码', '2', null, '半脱产');
INSERT INTO `t_flatcode` VALUES ('220', 'dm_xxfs', '学习方式码', '3', null, '业余');
INSERT INTO `t_flatcode` VALUES ('221', 'dm_zwlb', '职务类别码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('222', 'dm_zwlb', '职务类别码', '11', null, '党委正职');
INSERT INTO `t_flatcode` VALUES ('223', 'dm_zwlb', '职务类别码', '12', null, '行政正职');
INSERT INTO `t_flatcode` VALUES ('224', 'dm_zwlb', '职务类别码', '13', null, '学的职能部门正职');
INSERT INTO `t_flatcode` VALUES ('225', 'dm_zwlb', '职务类别码', '14', null, '行政职能部门正职');
INSERT INTO `t_flatcode` VALUES ('226', 'dm_zwlb', '职务类别码', '15', null, '民主党派正职');
INSERT INTO `t_flatcode` VALUES ('227', 'dm_zwlb', '职务类别码', '16', null, '社会团体正职');
INSERT INTO `t_flatcode` VALUES ('228', 'dm_zwlb', '职务类别码', '21', null, '党委副职');
INSERT INTO `t_flatcode` VALUES ('229', 'dm_zwlb', '职务类别码', '22', null, '行政副职');
INSERT INTO `t_flatcode` VALUES ('230', 'dm_zwlb', '职务类别码', '23', null, '党的职能部门副职');
INSERT INTO `t_flatcode` VALUES ('231', 'dm_zwlb', '职务类别码', '24', null, '行政职能部门副职');
INSERT INTO `t_flatcode` VALUES ('232', 'dm_zwlb', '职务类别码', '25', null, '民主党派副职');
INSERT INTO `t_flatcode` VALUES ('233', 'dm_zwlb', '职务类别码', '26', null, '社会团体副职');
INSERT INTO `t_flatcode` VALUES ('234', 'dm_zwlb', '职务类别码', '31', null, '党委其他职');
INSERT INTO `t_flatcode` VALUES ('235', 'dm_zwlb', '职务类别码', '32', null, '行政其他职');
INSERT INTO `t_flatcode` VALUES ('236', 'dm_zwlb', '职务类别码', '33', null, '党的职能部门其他职');
INSERT INTO `t_flatcode` VALUES ('237', 'dm_zwlb', '职务类别码', '34', null, '行政职能部门其他职');
INSERT INTO `t_flatcode` VALUES ('238', 'dm_zwlb', '职务类别码', '35', null, '民主党派其他职');
INSERT INTO `t_flatcode` VALUES ('239', 'dm_zwlb', '职务类别码', '36', null, '社会团体其他职');
INSERT INTO `t_flatcode` VALUES ('240', 'gb_zwmc', '职务名称码12403', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('241', 'gb_zwmc', '职务名称码12403', '216A', null, '局长');
INSERT INTO `t_flatcode` VALUES ('242', 'gb_zwmc', '职务名称码12403', '216B', null, '副局长');
INSERT INTO `t_flatcode` VALUES ('243', 'gb_zwmc', '职务名称码12403', '219A', null, '处长');
INSERT INTO `t_flatcode` VALUES ('244', 'dm_rzfs', '任职方式码', '1', null, '任命');
INSERT INTO `t_flatcode` VALUES ('245', 'dm_rzfs', '任职方式码', '2', null, '委任');
INSERT INTO `t_flatcode` VALUES ('246', 'dm_rzfs', '任职方式码', '3', null, '选举');
INSERT INTO `t_flatcode` VALUES ('247', 'dm_rzfs', '任职方式码', '4', null, '聘任');
INSERT INTO `t_flatcode` VALUES ('248', 'dm_rzfs', '任职方式码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('249', 'dm_zwbdlb', '职务变动类别码', '1', null, '逐级晋升');
INSERT INTO `t_flatcode` VALUES ('250', 'dm_zwbdlb', '职务变动类别码', '2', null, '越级晋升');
INSERT INTO `t_flatcode` VALUES ('251', 'dm_zwbdlb', '职务变动类别码', '3', null, '平级调整');
INSERT INTO `t_flatcode` VALUES ('252', 'dm_zwbdlb', '职务变动类别码', '4', null, '平级兼职');
INSERT INTO `t_flatcode` VALUES ('253', 'dm_zwbdlb', '职务变动类别码', '5', null, '向下兼职');
INSERT INTO `t_flatcode` VALUES ('254', 'dm_zwbdlb', '职务变动类别码', '6', null, '降职');
INSERT INTO `t_flatcode` VALUES ('255', 'dm_zwbdlb', '职务变动类别码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('256', 'dm_mzfs', '免职方式码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('257', 'dm_mzfs', '免职方式码', '1', null, '落选');
INSERT INTO `t_flatcode` VALUES ('258', 'dm_mzfs', '免职方式码', '2', null, '解聘');
INSERT INTO `t_flatcode` VALUES ('259', 'dm_mzfs', '免职方式码', '3', null, '罢免');
INSERT INTO `t_flatcode` VALUES ('260', 'dm_mzfs', '免职方式码', '4', null, '届满');
INSERT INTO `t_flatcode` VALUES ('261', 'dm_mzfs', '免职方式码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('262', 'dm_mzyy', '免职原因码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('263', 'dm_mzyy', '免职原因码', '1', null, '转换职位任职的');
INSERT INTO `t_flatcode` VALUES ('264', 'dm_mzyy', '免职原因码', '2', null, '晋升或者降低职务的');
INSERT INTO `t_flatcode` VALUES ('265', 'dm_mzyy', '免职原因码', '3', null, '离职学习期限超过一年的');
INSERT INTO `t_flatcode` VALUES ('266', 'dm_mzyy', '免职原因码', '4', null, '因健康原因不能坚持正常工作一年以上的');
INSERT INTO `t_flatcode` VALUES ('267', 'dm_mzyy', '免职原因码', '5', null, '退休的');
INSERT INTO `t_flatcode` VALUES ('268', 'dm_mzyy', '免职原因码', '9', null, '因其他原因职务发生变化的');
INSERT INTO `t_flatcode` VALUES ('269', 'gb_rzzgmc', '任职资格名称码8561', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('270', 'gb_rzzgmc', '任职资格名称码8561', '052', null, '高级教师(中学)');
INSERT INTO `t_flatcode` VALUES ('271', 'gb_rzzgmc', '任职资格名称码8561', '053', null, '一级教师(中学)');
INSERT INTO `t_flatcode` VALUES ('272', 'gb_rzzgmc', '任职资格名称码8561', '054', null, '二级教师(中学)');
INSERT INTO `t_flatcode` VALUES ('273', 'gb_rzzgmc', '任职资格名称码8561', '055', null, '三级教师(中学)');
INSERT INTO `t_flatcode` VALUES ('274', 'gb_rzzgmc', '任职资格名称码8561', '072', null, '高级实验师');
INSERT INTO `t_flatcode` VALUES ('275', 'gb_rzzgmc', '任职资格名称码8561', '073', null, '实验师');
INSERT INTO `t_flatcode` VALUES ('276', 'gb_rzzgmc', '任职资格名称码8561', '074', null, '助理实验师');
INSERT INTO `t_flatcode` VALUES ('277', 'gb_rzzgmc', '任职资格名称码8561', '075', null, '实验员');
INSERT INTO `t_flatcode` VALUES ('278', 'dm_qdzgtj', '取得资格途径码', '1', null, '评审');
INSERT INTO `t_flatcode` VALUES ('279', 'dm_qdzgtj', '取得资格途径码', '2', null, '考试');
INSERT INTO `t_flatcode` VALUES ('280', 'dm_qdzgtj', '取得资格途径码', '3', null, '其他');
INSERT INTO `t_flatcode` VALUES ('281', 'gb_przw', '聘任职务码6565', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('282', 'gb_przw', '聘任职务码6565', '16A', null, '局长');
INSERT INTO `t_flatcode` VALUES ('283', 'gb_przw', '聘任职务码6565', '16B', null, '副局长');
INSERT INTO `t_flatcode` VALUES ('284', 'gb_przw', '聘任职务码6565', '19A', null, '处长');
INSERT INTO `t_flatcode` VALUES ('285', 'gb_przw', '聘任职务码6565', '19B', null, '副处长');
INSERT INTO `t_flatcode` VALUES ('286', 'gb_przw', '聘任职务码6565', '20A', null, '科长');
INSERT INTO `t_flatcode` VALUES ('287', 'gb_przw', '聘任职务码6565', '20B', null, '副科长');
INSERT INTO `t_flatcode` VALUES ('288', 'gb_przw', '聘任职务码6565', '58A', null, '县长');
INSERT INTO `t_flatcode` VALUES ('289', 'gb_przw', '聘任职务码6565', '58B', null, '副县长');
INSERT INTO `t_flatcode` VALUES ('290', 'gb_przw', '聘任职务码6565', '60A', null, '镇长');
INSERT INTO `t_flatcode` VALUES ('291', 'gb_przw', '聘任职务码6565', '60B', null, '副镇长');
INSERT INTO `t_flatcode` VALUES ('292', 'gb_przw', '聘任职务码6565', '61A', null, '乡长');
INSERT INTO `t_flatcode` VALUES ('293', 'gb_przw', '聘任职务码6565', '61B', null, '副乡长');
INSERT INTO `t_flatcode` VALUES ('294', 'gb_przw', '聘任职务码6565', '62A', null, '村长');
INSERT INTO `t_flatcode` VALUES ('295', 'gb_przw', '聘任职务码6565', '62B', null, '副村长');
INSERT INTO `t_flatcode` VALUES ('296', 'dm_prqk', '聘任情况码', '1', null, '已聘');
INSERT INTO `t_flatcode` VALUES ('297', 'dm_prqk', '聘任情况码', '2', null, '高聘');
INSERT INTO `t_flatcode` VALUES ('298', 'dm_prqk', '聘任情况码', '3', null, '低聘');
INSERT INTO `t_flatcode` VALUES ('299', 'dm_prqk', '聘任情况码', '4', null, '待聘');
INSERT INTO `t_flatcode` VALUES ('300', 'dm_prqk', '聘任情况码', '5', null, '未聘');
INSERT INTO `t_flatcode` VALUES ('301', 'dm_prqk', '聘任情况码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('302', 'dm_jshjlb', '获奖类别码', '1', null, '教学工作');
INSERT INTO `t_flatcode` VALUES ('303', 'dm_jshjlb', '获奖类别码', '2', null, '科研工作');
INSERT INTO `t_flatcode` VALUES ('304', 'dm_jshjlb', '获奖类别码', '3', null, '专业技术');
INSERT INTO `t_flatcode` VALUES ('305', 'dm_jshjlb', '获奖类别码', '4', null, '工作业绩');
INSERT INTO `t_flatcode` VALUES ('306', 'dm_jshjlb', '获奖类别码', '5', null, '科技竞赛');
INSERT INTO `t_flatcode` VALUES ('307', 'dm_jshjlb', '获奖类别码', '6', null, '体育比赛');
INSERT INTO `t_flatcode` VALUES ('308', 'dm_jshjlb', '获奖类别码', '7', null, '文艺比赛');
INSERT INTO `t_flatcode` VALUES ('309', 'dm_jshjlb', '获奖类别码', '8', null, '公益事业');
INSERT INTO `t_flatcode` VALUES ('310', 'dm_jshjlb', '获奖类别码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('311', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1201', null, '记功');
INSERT INTO `t_flatcode` VALUES ('312', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1202', null, '记大功');
INSERT INTO `t_flatcode` VALUES ('313', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1204', null, '晋一级');
INSERT INTO `t_flatcode` VALUES ('314', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1205', null, '晋二级');
INSERT INTO `t_flatcode` VALUES ('315', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1208', null, '通令嘉奖');
INSERT INTO `t_flatcode` VALUES ('316', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1209', null, '授予荣誉称号');
INSERT INTO `t_flatcode` VALUES ('317', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '1299', null, '其他奖励');
INSERT INTO `t_flatcode` VALUES ('318', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2001', null, '国家发明特等奖');
INSERT INTO `t_flatcode` VALUES ('319', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2002', null, '国家发明一等奖');
INSERT INTO `t_flatcode` VALUES ('320', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2003', null, '国家发明二等奖');
INSERT INTO `t_flatcode` VALUES ('321', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2004', null, '国家发明三等奖');
INSERT INTO `t_flatcode` VALUES ('322', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2005', null, '国家发明四等奖');
INSERT INTO `t_flatcode` VALUES ('323', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2011', null, '国家自然科学特等奖');
INSERT INTO `t_flatcode` VALUES ('324', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2012', null, '国家自然科学一等奖');
INSERT INTO `t_flatcode` VALUES ('325', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2013', null, '国家自然科学二等奖');
INSERT INTO `t_flatcode` VALUES ('326', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2014', null, '国家自然科学三等奖');
INSERT INTO `t_flatcode` VALUES ('327', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2015', null, '国家自然科学四等奖');
INSERT INTO `t_flatcode` VALUES ('328', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2021', null, '国家科学技术进步特等奖');
INSERT INTO `t_flatcode` VALUES ('329', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2022', null, '国家科学技术进步一等奖');
INSERT INTO `t_flatcode` VALUES ('330', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2023', null, '国家科学技术进步二等奖');
INSERT INTO `t_flatcode` VALUES ('331', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2024', null, '国家科学技术进步三等奖');
INSERT INTO `t_flatcode` VALUES ('332', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2031', null, '全国科学大会奖');
INSERT INTO `t_flatcode` VALUES ('333', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2099', null, '国家级其他奖励');
INSERT INTO `t_flatcode` VALUES ('334', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2201', null, '省(部、委)科学技术进步一等奖');
INSERT INTO `t_flatcode` VALUES ('335', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2202', null, '省(部、委)科学技术进步二等奖');
INSERT INTO `t_flatcode` VALUES ('336', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2203', null, '省(部、委)科学技术进步三等奖');
INSERT INTO `t_flatcode` VALUES ('337', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2204', null, '省(部、委)科学技术进步四等奖');
INSERT INTO `t_flatcode` VALUES ('338', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2211', null, '合理化建议和技术改进一等奖');
INSERT INTO `t_flatcode` VALUES ('339', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2212', null, '合理化建议和技术改进二等奖');
INSERT INTO `t_flatcode` VALUES ('340', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2213', null, '合理化建议和技术改进三等奖');
INSERT INTO `t_flatcode` VALUES ('341', 'gb_jlmc', '奖励名称码8563（这个代码已经不用）2006/11/14', '2214', null, '合理化建议和技术改进四等奖');
INSERT INTO `t_flatcode` VALUES ('342', 'gb_rych', '荣誉称号码8560', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('343', 'gb_rych', '荣誉称号码8560', '002', null, '全国劳动模范');
INSERT INTO `t_flatcode` VALUES ('344', 'gb_rych', '荣誉称号码8560', '009', null, '全国新长征突击手');
INSERT INTO `t_flatcode` VALUES ('345', 'gb_rych', '荣誉称号码8560', '010', null, '全国优秀团干部');
INSERT INTO `t_flatcode` VALUES ('346', 'gb_rych', '荣誉称号码8560', '011', null, '全国三八红旗手');
INSERT INTO `t_flatcode` VALUES ('347', 'gb_rych', '荣誉称号码8560', '099', null, '国家级其他荣誉称号');
INSERT INTO `t_flatcode` VALUES ('348', 'gb_rych', '荣誉称号码8560', '101', null, '省(自治区、直辖市)特级劳动模范');
INSERT INTO `t_flatcode` VALUES ('349', 'gb_rych', '荣誉称号码8560', '102', null, '省(自治区、直辖市)级劳动模范');
INSERT INTO `t_flatcode` VALUES ('350', 'gb_rych', '荣誉称号码8560', '105', null, '省(自治区、直辖市)级优秀党员');
INSERT INTO `t_flatcode` VALUES ('351', 'gb_rych', '荣誉称号码8560', '106', null, '省(自治区、直辖市)级优秀工会工作者');
INSERT INTO `t_flatcode` VALUES ('352', 'gb_rych', '荣誉称号码8560', '107', null, '省(自治区、直辖市)级优秀工会积极分子');
INSERT INTO `t_flatcode` VALUES ('353', 'gb_rych', '荣誉称号码8560', '108', null, '省(自治区、直辖市)级全国技术协作能手');
INSERT INTO `t_flatcode` VALUES ('354', 'gb_rych', '荣誉称号码8560', '109', null, '省(自治区、直辖市)级新长征突击手');
INSERT INTO `t_flatcode` VALUES ('355', 'gb_rych', '荣誉称号码8560', '110', null, '省(自治区、直辖市)级优秀团干部');
INSERT INTO `t_flatcode` VALUES ('356', 'gb_rych', '荣誉称号码8560', '111', null, '省(自治区、直辖市)级三八红旗手');
INSERT INTO `t_flatcode` VALUES ('357', 'gb_rych', '荣誉称号码8560', '112', null, '省(自治区、直辖市)级优秀知识分子');
INSERT INTO `t_flatcode` VALUES ('358', 'gb_rych', '荣誉称号码8560', '299', null, '省(自治区、直辖市)级其他荣誉称号');
INSERT INTO `t_flatcode` VALUES ('359', 'gb_rych', '荣誉称号码8560', '302', null, '部(委)级劳动模范');
INSERT INTO `t_flatcode` VALUES ('360', 'gb_rych', '荣誉称号码8560', '305', null, '部(委)级优秀党员');
INSERT INTO `t_flatcode` VALUES ('361', 'gb_rych', '荣誉称号码8560', '309', null, '部(委)级新长征突击手');
INSERT INTO `t_flatcode` VALUES ('362', 'gb_rych', '荣誉称号码8560', '310', null, '部(委)级优秀团干部');
INSERT INTO `t_flatcode` VALUES ('363', 'gb_rych', '荣誉称号码8560', '311', null, '部(委)级三八红旗手');
INSERT INTO `t_flatcode` VALUES ('364', 'gb_rych', '荣誉称号码8560', '312', null, '部(委)级优秀知识分子');
INSERT INTO `t_flatcode` VALUES ('365', 'gb_rych', '荣誉称号码8560', '499', null, '部(委)级其他荣誉称号');
INSERT INTO `t_flatcode` VALUES ('366', 'gb_rych', '荣誉称号码8560', '502', null, '地(市、厅、局)级劳动模范');
INSERT INTO `t_flatcode` VALUES ('367', 'gb_rych', '荣誉称号码8560', '505', null, '地(市、厅、局)级优秀党员');
INSERT INTO `t_flatcode` VALUES ('368', 'gb_rych', '荣誉称号码8560', '606', null, '地(市、厅、局)级优秀工作者');
INSERT INTO `t_flatcode` VALUES ('369', 'gb_rych', '荣誉称号码8560', '607', null, '地(市、厅、局)级优秀工会积极分子');
INSERT INTO `t_flatcode` VALUES ('370', 'gb_rych', '荣誉称号码8560', '608', null, '地(市、厅、局)级全国技术协作能手');
INSERT INTO `t_flatcode` VALUES ('371', 'gb_rych', '荣誉称号码8560', '609', null, '地(市、厅、局)级新长征突击手');
INSERT INTO `t_flatcode` VALUES ('372', 'gb_rych', '荣誉称号码8560', '610', null, '地(市、厅、局)级优秀团干部');
INSERT INTO `t_flatcode` VALUES ('373', 'gb_rych', '荣誉称号码8560', '611', null, '地(市、厅、局)级三八红旗手');
INSERT INTO `t_flatcode` VALUES ('374', 'gb_rych', '荣誉称号码8560', '612', null, '地(市、厅、局)级优秀知识分子');
INSERT INTO `t_flatcode` VALUES ('375', 'gb_rych', '荣誉称号码8560', '699', null, '地(市、厅、局)级其他荣誉称号');
INSERT INTO `t_flatcode` VALUES ('376', 'gb_rych', '荣誉称号码8560', '705', null, '基层企事业单位优秀党员');
INSERT INTO `t_flatcode` VALUES ('377', 'gb_rych', '荣誉称号码8560', '799', null, '基层企事业单位其他荣誉称号');
INSERT INTO `t_flatcode` VALUES ('378', 'dm_hjjs', '获奖角色码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('379', 'dm_hjjs', '获奖角色码', '410', null, '获奖成果负责人');
INSERT INTO `t_flatcode` VALUES ('380', 'dm_hjjs', '获奖角色码', '411', null, '获奖成果第一负责人');
INSERT INTO `t_flatcode` VALUES ('381', 'dm_hjjs', '获奖角色码', '412', null, '获奖成果第二负责人');
INSERT INTO `t_flatcode` VALUES ('382', 'dm_hjjs', '获奖角色码', '413', null, '获奖成果第三负责人');
INSERT INTO `t_flatcode` VALUES ('383', 'dm_hjjs', '获奖角色码', '419', null, '获奖成果其他负责人');
INSERT INTO `t_flatcode` VALUES ('384', 'dm_hjjs', '获奖角色码', '420', null, '获奖成果参加人');
INSERT INTO `t_flatcode` VALUES ('385', 'dm_hjjs', '获奖角色码', '421', null, '获奖成果第一参加者');
INSERT INTO `t_flatcode` VALUES ('386', 'dm_hjjs', '获奖角色码', '422', null, '获奖成果第二参加者');
INSERT INTO `t_flatcode` VALUES ('387', 'dm_hjjs', '获奖角色码', '423', null, '获奖成果第三参加者');
INSERT INTO `t_flatcode` VALUES ('388', 'dm_hjjs', '获奖角色码', '424', null, '获奖成果第四参加者');
INSERT INTO `t_flatcode` VALUES ('389', 'dm_hjjs', '获奖角色码', '425', null, '获奖成果第五参加者');
INSERT INTO `t_flatcode` VALUES ('390', 'dm_hjjs', '获奖角色码', '429', null, '获奖成果其他参加者');
INSERT INTO `t_flatcode` VALUES ('391', 'dm_jzgly', '来源码', '10', null, '录用');
INSERT INTO `t_flatcode` VALUES ('392', 'dm_jzgly', '来源码', '11', null, '城镇应届毕业生');
INSERT INTO `t_flatcode` VALUES ('393', 'dm_jzgly', '来源码', '12', null, '农村应届毕业生');
INSERT INTO `t_flatcode` VALUES ('394', 'dm_jzgly', '来源码', '13', null, '城镇非应届毕业生');
INSERT INTO `t_flatcode` VALUES ('395', 'dm_jzgly', '来源码', '14', null, '农村非应届毕业生');
INSERT INTO `t_flatcode` VALUES ('396', 'dm_jzgly', '来源码', '20', null, '军队转业、复员');
INSERT INTO `t_flatcode` VALUES ('397', 'dm_jzgly', '来源码', '21', null, '军队转业');
INSERT INTO `t_flatcode` VALUES ('398', 'dm_jzgly', '来源码', '22', null, '军队复员');
INSERT INTO `t_flatcode` VALUES ('399', 'dm_jzgly', '来源码', '30', null, '调入');
INSERT INTO `t_flatcode` VALUES ('400', 'dm_jzgly', '来源码', '31', null, '系统内调入');
INSERT INTO `t_flatcode` VALUES ('401', 'dm_jzgly', '来源码', '32', null, '系统外调入');
INSERT INTO `t_flatcode` VALUES ('402', 'dm_jzgly', '来源码', '40', null, '回国定居');
INSERT INTO `t_flatcode` VALUES ('403', 'dm_jzgly', '来源码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('404', 'gb_xk', '学科码13745', '120', null, '计算机科学技术');
INSERT INTO `t_flatcode` VALUES ('405', 'gb_xk', '学科码13745', '140', null, '物理学');
INSERT INTO `t_flatcode` VALUES ('406', 'gb_xk', '学科码13745', '150', null, '化学');
INSERT INTO `t_flatcode` VALUES ('407', 'gb_xk', '学科码13745', '170', null, '地球科学');
INSERT INTO `t_flatcode` VALUES ('408', 'gb_xk', '学科码13745', '180', null, '生物学');
INSERT INTO `t_flatcode` VALUES ('409', 'gb_xk', '学科码13745', '740', null, '语言学');
INSERT INTO `t_flatcode` VALUES ('410', 'gb_xk', '学科码13745', '750', null, '文学');
INSERT INTO `t_flatcode` VALUES ('411', 'gb_xk', '学科码13745', '770', null, '历史学');
INSERT INTO `t_flatcode` VALUES ('412', 'gb_xk', '学科码13745', '810', null, '政治学');
INSERT INTO `t_flatcode` VALUES ('413', 'gb_xk', '学科码13745', '890', null, '体育科学');
INSERT INTO `t_flatcode` VALUES ('414', 'gb_xk', '学科码13745', '-', null, '其他');
INSERT INTO `t_flatcode` VALUES ('415', 'dm_yclb', '异常类别码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('416', 'dm_yclb', '异常类别码', '01', null, '入团转党');
INSERT INTO `t_flatcode` VALUES ('417', 'dm_yclb', '异常类别码', '02', null, '重新入党');
INSERT INTO `t_flatcode` VALUES ('418', 'dm_yclb', '异常类别码', '11', null, '延期转正');
INSERT INTO `t_flatcode` VALUES ('419', 'dm_yclb', '异常类别码', '21', null, '未予登记');
INSERT INTO `t_flatcode` VALUES ('420', 'dm_yclb', '异常类别码', '22', null, '暂缓登记');
INSERT INTO `t_flatcode` VALUES ('421', 'dm_yclb', '异常类别码', '31', null, '自动脱党');
INSERT INTO `t_flatcode` VALUES ('422', 'dm_yclb', '异常类别码', '32', null, '除名');
INSERT INTO `t_flatcode` VALUES ('423', 'dm_yclb', '异常类别码', '33', null, '取消预备党员资格');
INSERT INTO `t_flatcode` VALUES ('424', 'dm_yclb', '异常类别码', '34', null, '开除党籍');
INSERT INTO `t_flatcode` VALUES ('425', 'dm_yclb', '异常类别码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('426', 'dm_grjsdj', '工人技术等级资格码', '1', null, '初级技术工人');
INSERT INTO `t_flatcode` VALUES ('427', 'dm_grjsdj', '工人技术等级资格码', '2', null, '中级技术工人');
INSERT INTO `t_flatcode` VALUES ('428', 'dm_grjsdj', '工人技术等级资格码', '3', null, '高级技术工人');
INSERT INTO `t_flatcode` VALUES ('429', 'dm_grjsdj', '工人技术等级资格码', '4', null, '技师');
INSERT INTO `t_flatcode` VALUES ('430', 'dm_grjsdj', '工人技术等级资格码', '5', null, '高级技师');
INSERT INTO `t_flatcode` VALUES ('431', 'dm_hrgzlb', '工人工种名称码', '01', null, '机械加工类');
INSERT INTO `t_flatcode` VALUES ('432', 'dm_hrgzlb', '工人工种名称码', '02', null, '电工电器工程类');
INSERT INTO `t_flatcode` VALUES ('433', 'dm_hrgzlb', '工人工种名称码', '03', null, '建筑工程类');
INSERT INTO `t_flatcode` VALUES ('434', 'dm_hrgzlb', '工人工种名称码', '04', null, '仪器仪表工程类');
INSERT INTO `t_flatcode` VALUES ('435', 'dm_hrgzlb', '工人工种名称码', '05', null, '水暖通风工程类');
INSERT INTO `t_flatcode` VALUES ('436', 'dm_hrgzlb', '工人工种名称码', '06', null, '机动车驾驶类');
INSERT INTO `t_flatcode` VALUES ('437', 'dm_hrgzlb', '工人工种名称码', '07', null, '家具维修类');
INSERT INTO `t_flatcode` VALUES ('438', 'dm_hrgzlb', '工人工种名称码', '08', null, '宣传广告标本制作类');
INSERT INTO `t_flatcode` VALUES ('439', 'dm_hrgzlb', '工人工种名称码', '09', null, '餐饮服务类');
INSERT INTO `t_flatcode` VALUES ('440', 'dm_hrgzlb', '工人工种名称码', '10', null, '商贸服务类');
INSERT INTO `t_flatcode` VALUES ('441', 'dm_hrgzlb', '工人工种名称码', '11', null, '护理保健类');
INSERT INTO `t_flatcode` VALUES ('442', 'dm_hrgzlb', '工人工种名称码', '12', null, '花木养殖类');
INSERT INTO `t_flatcode` VALUES ('443', 'dm_hrgzlb', '工人工种名称码', '13', null, '其他');
INSERT INTO `t_flatcode` VALUES ('444', 'dm_khlb', '考察（考核）类别码', '1', null, '平时考核');
INSERT INTO `t_flatcode` VALUES ('445', 'dm_khlb', '考察（考核）类别码', '2', null, '年度考核');
INSERT INTO `t_flatcode` VALUES ('446', 'dm_khlb', '考察（考核）类别码', '3', null, '特写考核');
INSERT INTO `t_flatcode` VALUES ('447', 'dm_khlb', '考察（考核）类别码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('448', 'dm_kcjg', '考察（考核）结果码', '1', null, '优秀');
INSERT INTO `t_flatcode` VALUES ('449', 'dm_kcjg', '考察（考核）结果码', '2', null, '称职');
INSERT INTO `t_flatcode` VALUES ('450', 'dm_kcjg', '考察（考核）结果码', '3', null, '不称职');
INSERT INTO `t_flatcode` VALUES ('451', 'gb_wgyz', '外国语种码4880', 'ea', null, '英语');
INSERT INTO `t_flatcode` VALUES ('452', 'gb_wgyz', '外国语种码4880', 'ab', null, '阿面哈兹语');
INSERT INTO `t_flatcode` VALUES ('453', 'gb_wgyz', '外国语种码4880', 'sq', null, '阿尔巴尼亚语');
INSERT INTO `t_flatcode` VALUES ('454', 'gb_wgyz', '外国语种码4880', 'aa', null, '阿芳·奥洛莫话');
INSERT INTO `t_flatcode` VALUES ('455', 'gb_wgyz', '外国语种码4880', 'cm', null, '阿非利琪斯语');
INSERT INTO `t_flatcode` VALUES ('456', 'gb_wgyz', '外国语种码4880', 'ar', null, '阿拉伯语');
INSERT INTO `t_flatcode` VALUES ('457', 'gb_wgyz', '外国语种码4880', 'am', null, '阿姆哈拉语');
INSERT INTO `t_flatcode` VALUES ('458', 'gb_wgyz', '外国语种码4880', 'as', null, '阿萨姆语');
INSERT INTO `t_flatcode` VALUES ('459', 'gb_wgyz', '外国语种码4880', 'az', null, '阿塞拜疆语');
INSERT INTO `t_flatcode` VALUES ('460', 'gb_wgyz', '外国语种码4880', 'ay', null, '艾马拉语');
INSERT INTO `t_flatcode` VALUES ('461', 'gb_wgyz', '外国语种码4880', 'ga', null, '爱尔兰语');
INSERT INTO `t_flatcode` VALUES ('462', 'gb_wgyz', '外国语种码4880', 'ct', null, '爱沙尼亚语');
INSERT INTO `t_flatcode` VALUES ('463', 'gb_wgyz', '外国语种码4880', 'oc', null, '奥克西唐语');
INSERT INTO `t_flatcode` VALUES ('464', 'gb_wgyz', '外国语种码4880', 'or', null, '奥利亚语');
INSERT INTO `t_flatcode` VALUES ('465', 'gb_wgyz', '外国语种码4880', 'ba', null, '巴什基尔语');
INSERT INTO `t_flatcode` VALUES ('466', 'gb_wgyz', '外国语种码4880', 'cu', null, '巴斯克语');
INSERT INTO `t_flatcode` VALUES ('467', 'gb_wgyz', '外国语种码4880', 'be', null, '白俄罗斯语');
INSERT INTO `t_flatcode` VALUES ('468', 'gb_wgyz', '外国语种码4880', 'bg', null, '保加利亚语');
INSERT INTO `t_flatcode` VALUES ('469', 'gb_wgyz', '外国语种码4880', 'bh', null, '比哈尔语');
INSERT INTO `t_flatcode` VALUES ('470', 'gb_wgyz', '外国语种码4880', 'bi', null, '比斯拉玛语');
INSERT INTO `t_flatcode` VALUES ('471', 'gb_wgyz', '外国语种码4880', 'is', null, '冰岛语');
INSERT INTO `t_flatcode` VALUES ('472', 'gb_wgyz', '外国语种码4880', 'pl', null, '波兰语');
INSERT INTO `t_flatcode` VALUES ('473', 'gb_wgyz', '外国语种码4880', 'fa', null, '波斯语');
INSERT INTO `t_flatcode` VALUES ('474', 'gb_wgyz', '外国语种码4880', 'dz', null, '不丹语');
INSERT INTO `t_flatcode` VALUES ('475', 'gb_wgyz', '外国语种码4880', 'br', null, '布列塔尼语');
INSERT INTO `t_flatcode` VALUES ('476', 'gb_wgyz', '外国语种码4880', 'ko', null, '朝鲜语');
INSERT INTO `t_flatcode` VALUES ('477', 'gb_wgyz', '外国语种码4880', 'th', null, '傣语');
INSERT INTO `t_flatcode` VALUES ('478', 'gb_wgyz', '外国语种码4880', 'da', null, '丹麦语');
INSERT INTO `t_flatcode` VALUES ('479', 'gb_wgyz', '外国语种码4880', 'de', null, '德语');
INSERT INTO `t_flatcode` VALUES ('480', 'gb_wgyz', '外国语种码4880', 'ru', null, '俄语');
INSERT INTO `t_flatcode` VALUES ('481', 'gb_wgyz', '外国语种码4880', 'fr', null, '法语');
INSERT INTO `t_flatcode` VALUES ('482', 'gb_wgyz', '外国语种码4880', 'fo', null, '法罗斯语');
INSERT INTO `t_flatcode` VALUES ('483', 'gb_wgyz', '外国语种码4880', 'sa', null, '梵语');
INSERT INTO `t_flatcode` VALUES ('484', 'gb_wgyz', '外国语种码4880', 'fj', null, '斐济语');
INSERT INTO `t_flatcode` VALUES ('485', 'gb_wgyz', '外国语种码4880', 'fi', null, '芬兰语');
INSERT INTO `t_flatcode` VALUES ('486', 'gb_wgyz', '外国语种码4880', 'fy', null, '弗里西亚语');
INSERT INTO `t_flatcode` VALUES ('487', 'gb_wgyz', '外国语种码4880', 'kl', null, '格陵兰语');
INSERT INTO `t_flatcode` VALUES ('488', 'gb_wgyz', '外国语种码4880', 'gn', null, '瓜拉尼语');
INSERT INTO `t_flatcode` VALUES ('489', 'gb_wgyz', '外国语种码4880', 'ia', null, '国际语A ');
INSERT INTO `t_flatcode` VALUES ('490', 'gb_wgyz', '外国语种码4880', 'ie', null, '国际语E ');
INSERT INTO `t_flatcode` VALUES ('491', 'gb_wgyz', '外国语种码4880', 'kk', null, '哈萨克语');
INSERT INTO `t_flatcode` VALUES ('492', 'gb_wgyz', '外国语种码4880', 'zh', null, '汉语（中文）');
INSERT INTO `t_flatcode` VALUES ('493', 'gb_wgyz', '外国语种码4880', 'ha', null, '豪萨语');
INSERT INTO `t_flatcode` VALUES ('494', 'gb_wgyz', '外国语种码4880', 'nl', null, '荷兰语');
INSERT INTO `t_flatcode` VALUES ('495', 'gb_wgyz', '外国语种码4880', 'ky', null, '吉尔吉斯语');
INSERT INTO `t_flatcode` VALUES ('496', 'gb_wgyz', '外国语种码4880', 'rw', null, '基尼阿万达语');
INSERT INTO `t_flatcode` VALUES ('497', 'gb_wgyz', '外国语种码4880', 'rn', null, '基隆迪语');
INSERT INTO `t_flatcode` VALUES ('498', 'gb_wgyz', '外国语种码4880', 'gl', null, '加利西亚语');
INSERT INTO `t_flatcode` VALUES ('499', 'gb_wgyz', '外国语种码4880', 'ca', null, '加泰隆语');
INSERT INTO `t_flatcode` VALUES ('500', 'gb_wgyz', '外国语种码4880', 'km', null, '柬埔寨语');
INSERT INTO `t_flatcode` VALUES ('501', 'gb_wgyz', '外国语种码4880', 'cs', null, '捷克语');
INSERT INTO `t_flatcode` VALUES ('502', 'gb_wgyz', '外国语种码4880', 'qu', null, '凯笼亚语');
INSERT INTO `t_flatcode` VALUES ('503', 'gb_wgyz', '外国语种码4880', 'kn', null, '坎纳达语');
INSERT INTO `t_flatcode` VALUES ('504', 'gb_wgyz', '外国语种码4880', 'hr', null, '克罗地亚语');
INSERT INTO `t_flatcode` VALUES ('505', 'gb_wgyz', '外国语种码4880', 'ks', null, '克会米尔语');
INSERT INTO `t_flatcode` VALUES ('506', 'gb_wgyz', '外国语种码4880', 'xh', null, '科萨语');
INSERT INTO `t_flatcode` VALUES ('507', 'gb_wgyz', '外国语种码4880', 'co', null, '科西嘉语');
INSERT INTO `t_flatcode` VALUES ('508', 'gb_wgyz', '外国语种码4880', 'ku', null, '库尔德语');
INSERT INTO `t_flatcode` VALUES ('509', 'gb_wgyz', '外国语种码4880', 'la', null, '拉丁语');
INSERT INTO `t_flatcode` VALUES ('510', 'gb_wgyz', '外国语种码4880', 'lw', null, '拉脱维亚语');
INSERT INTO `t_flatcode` VALUES ('511', 'gb_wgyz', '外国语种码4880', 'lo', null, '老挝语');
INSERT INTO `t_flatcode` VALUES ('512', 'gb_wgyz', '外国语种码4880', 'lt', null, '立陶宛语');
INSERT INTO `t_flatcode` VALUES ('513', 'gb_wgyz', '外国语种码4880', 'rm', null, '利托——罗曼语');
INSERT INTO `t_flatcode` VALUES ('514', 'gb_wgyz', '外国语种码4880', 'ln', null, '林加拉语');
INSERT INTO `t_flatcode` VALUES ('515', 'gb_wgyz', '外国语种码4880', 'ro', null, '罗马尼亚语');
INSERT INTO `t_flatcode` VALUES ('516', 'gb_wgyz', '外国语种码4880', 'mg', null, '马达加斯加语');
INSERT INTO `t_flatcode` VALUES ('517', 'gb_wgyz', '外国语种码4880', 'mt', null, '马耳他语');
INSERT INTO `t_flatcode` VALUES ('518', 'gb_wgyz', '外国语种码4880', 'nr', null, '马拉提语');
INSERT INTO `t_flatcode` VALUES ('519', 'gb_wgyz', '外国语种码4880', 'ml', null, '马拉亚拉姆语');
INSERT INTO `t_flatcode` VALUES ('520', 'gb_wgyz', '外国语种码4880', 'ms', null, '马来语');
INSERT INTO `t_flatcode` VALUES ('521', 'gb_wgyz', '外国语种码4880', 'mk', null, '马其顿语');
INSERT INTO `t_flatcode` VALUES ('522', 'gb_wgyz', '外国语种码4880', 'mi', null, '毛利语');
INSERT INTO `t_flatcode` VALUES ('523', 'gb_wgyz', '外国语种码4880', 'mn', null, '蒙古语');
INSERT INTO `t_flatcode` VALUES ('524', 'gb_wgyz', '外国语种码4880', 'bn', null, '孟加拉语');
INSERT INTO `t_flatcode` VALUES ('525', 'gb_wgyz', '外国语种码4880', 'my', null, '缅甸语');
INSERT INTO `t_flatcode` VALUES ('526', 'gb_wgyz', '外国语种码4880', 'mo', null, '摩尔达维亚语');
INSERT INTO `t_flatcode` VALUES ('527', 'gb_wgyz', '外国语种码4880', 'no', null, '挪威语');
INSERT INTO `t_flatcode` VALUES ('528', 'gb_wgyz', '外国语种码4880', 'na', null, '瑙鲁语');
INSERT INTO `t_flatcode` VALUES ('529', 'gb_wgyz', '外国语种码4880', 'ne', null, '尼泊尔语');
INSERT INTO `t_flatcode` VALUES ('530', 'gb_wgyz', '外国语种码4880', 'pa', null, '旁遮普语');
INSERT INTO `t_flatcode` VALUES ('531', 'gb_wgyz', '外国语种码4880', 'ps', null, '普什图语');
INSERT INTO `t_flatcode` VALUES ('532', 'gb_wgyz', '外国语种码4880', 'pt', null, '葡萄牙语');
INSERT INTO `t_flatcode` VALUES ('533', 'gb_wgyz', '外国语种码4880', 'ja', null, '日语');
INSERT INTO `t_flatcode` VALUES ('534', 'gb_wgyz', '外国语种码4880', 'sv', null, '瑞典语');
INSERT INTO `t_flatcode` VALUES ('535', 'gb_wgyz', '外国语种码4880', 'tn', null, '塞茨瓦纳语');
INSERT INTO `t_flatcode` VALUES ('536', 'gb_wgyz', '外国语种码4880', 'sr', null, '塞尔维亚语');
INSERT INTO `t_flatcode` VALUES ('537', 'gb_wgyz', '外国语种码4880', 'sh', null, '塞尔维亚——克罗地亚语');
INSERT INTO `t_flatcode` VALUES ('538', 'gb_wgyz', '外国语种码4880', 'ss', null, '塞斯瓦替语');
INSERT INTO `t_flatcode` VALUES ('539', 'gb_wgyz', '外国语种码4880', 'st', null, '塞索托语');
INSERT INTO `t_flatcode` VALUES ('540', 'gb_wgyz', '外国语种码4880', 'sg', null, '桑戈语');
INSERT INTO `t_flatcode` VALUES ('541', 'gb_wgyz', '外国语种码4880', 'si', null, '僧加罗语');
INSERT INTO `t_flatcode` VALUES ('542', 'gb_wgyz', '外国语种码4880', 'sm', null, '萨摩亚语');
INSERT INTO `t_flatcode` VALUES ('543', 'gb_wgyz', '外国语种码4880', 'sn', null, '绍纳语');
INSERT INTO `t_flatcode` VALUES ('544', 'gb_wgyz', '外国语种码4880', 'eo', null, '世界语');
INSERT INTO `t_flatcode` VALUES ('545', 'gb_wgyz', '外国语种码4880', 'sk', null, '斯洛伐克语');
INSERT INTO `t_flatcode` VALUES ('546', 'gb_wgyz', '外国语种码4880', 'sl', null, '斯洛文尼亚语');
INSERT INTO `t_flatcode` VALUES ('547', 'gb_wgyz', '外国语种码4880', 'sw', null, '斯瓦希里语');
INSERT INTO `t_flatcode` VALUES ('548', 'gb_wgyz', '外国语种码4880', 'gd', null, '苏格兰语');
INSERT INTO `t_flatcode` VALUES ('549', 'gb_wgyz', '外国语种码4880', 'go', null, '索马里语');
INSERT INTO `t_flatcode` VALUES ('550', 'gb_wgyz', '外国语种码4880', 'tl', null, '他加禄语');
INSERT INTO `t_flatcode` VALUES ('551', 'gb_wgyz', '外国语种码4880', 'tg', null, '塔吉克语');
INSERT INTO `t_flatcode` VALUES ('552', 'gb_wgyz', '外国语种码4880', 'tt', null, '塔塔尔语');
INSERT INTO `t_flatcode` VALUES ('553', 'gb_wgyz', '外国语种码4880', 'ta', null, '泰来尔语');
INSERT INTO `t_flatcode` VALUES ('554', 'gb_wgyz', '外国语种码4880', 'te', null, '泰声固语');
INSERT INTO `t_flatcode` VALUES ('555', 'gb_wgyz', '外国语种码4880', 'to', null, '汤加语');
INSERT INTO `t_flatcode` VALUES ('556', 'gb_wgyz', '外国语种码4880', 'tw', null, '特威语');
INSERT INTO `t_flatcode` VALUES ('557', 'gb_wgyz', '外国语种码4880', 'ti', null, '提格里尼亚语');
INSERT INTO `t_flatcode` VALUES ('558', 'gb_wgyz', '外国语种码4880', 'tr', null, '土耳其语');
INSERT INTO `t_flatcode` VALUES ('559', 'gb_wgyz', '外国语种码4880', 'tk', null, '土库曼语');
INSERT INTO `t_flatcode` VALUES ('560', 'gb_wgyz', '外国语种码4880', 'cy', null, '威尔士语');
INSERT INTO `t_flatcode` VALUES ('561', 'gb_wgyz', '外国语种码4880', 'ug', null, '维吾尔语');
INSERT INTO `t_flatcode` VALUES ('562', 'gb_wgyz', '外国语种码4880', 'vo', null, '沃拉普克语');
INSERT INTO `t_flatcode` VALUES ('563', 'gb_wgyz', '外国语种码4880', 'wo', null, '沃洛夫语');
INSERT INTO `t_flatcode` VALUES ('564', 'gb_wgyz', '外国语种码4880', 'ur', null, '乌尔都语');
INSERT INTO `t_flatcode` VALUES ('565', 'gb_wgyz', '外国语种码4880', 'uk', null, '乌克兰语');
INSERT INTO `t_flatcode` VALUES ('566', 'gb_wgyz', '外国语种码4880', 'uz', null, '乌兹别克语');
INSERT INTO `t_flatcode` VALUES ('567', 'gb_wgyz', '外国语种码4880', 'es', null, '西班牙');
INSERT INTO `t_flatcode` VALUES ('568', 'gb_wgyz', '外国语种码4880', 'iw', null, '希伯业语');
INSERT INTO `t_flatcode` VALUES ('569', 'gb_wgyz', '外国语种码4880', 'el', null, '希腊语');
INSERT INTO `t_flatcode` VALUES ('570', 'gb_wgyz', '外国语种码4880', 'sd', null, '信德语');
INSERT INTO `t_flatcode` VALUES ('571', 'gb_wgyz', '外国语种码4880', 'su', null, '巽他语');
INSERT INTO `t_flatcode` VALUES ('572', 'gb_wgyz', '外国语种码4880', 'hy', null, '亚美尼亚语');
INSERT INTO `t_flatcode` VALUES ('573', 'gb_wgyz', '外国语种码4880', 'it', null, '意大利语');
INSERT INTO `t_flatcode` VALUES ('574', 'gb_wgyz', '外国语种码4880', 'ji', null, '依地语');
INSERT INTO `t_flatcode` VALUES ('575', 'gb_wgyz', '外国语种码4880', 'ik', null, '依努庇克语');
INSERT INTO `t_flatcode` VALUES ('576', 'gb_wgyz', '外国语种码4880', 'hi', null, '印地语');
INSERT INTO `t_flatcode` VALUES ('577', 'gb_wgyz', '外国语种码4880', 'in', null, '印尼语');
INSERT INTO `t_flatcode` VALUES ('578', 'gb_wgyz', '外国语种码4880', 'yo', null, '约鲁巴语');
INSERT INTO `t_flatcode` VALUES ('579', 'gb_wgyz', '外国语种码4880', 'vi', null, '越南语');
INSERT INTO `t_flatcode` VALUES ('580', 'gb_wgyz', '外国语种码4880', 'bo', null, '藏语');
INSERT INTO `t_flatcode` VALUES ('581', 'gb_wgyz', '外国语种码4880', 'jv', null, '爪哇语');
INSERT INTO `t_flatcode` VALUES ('582', 'gb_wgyz', '外国语种码4880', 'za', null, '壮语');
INSERT INTO `t_flatcode` VALUES ('583', 'gb_wgyz', '外国语种码4880', 'ts', null, '宗加语');
INSERT INTO `t_flatcode` VALUES ('584', 'gb_wgyz', '外国语种码4880', 'zu', null, '祖鲁语');
INSERT INTO `t_flatcode` VALUES ('585', 'gb_wgyz', '外国语种码4880', 'zz', null, '其他语言');
INSERT INTO `t_flatcode` VALUES ('586', 'gb_yzslcd', '语种熟练程度码6865', '1', null, '精通');
INSERT INTO `t_flatcode` VALUES ('587', 'gb_yzslcd', '语种熟练程度码6865', '2', null, '熟练');
INSERT INTO `t_flatcode` VALUES ('588', 'gb_yzslcd', '语种熟练程度码6865', '3', null, '良好');
INSERT INTO `t_flatcode` VALUES ('589', 'gb_yzslcd', '语种熟练程度码6865', '4', null, '一般');
INSERT INTO `t_flatcode` VALUES ('590', 'gb_zgyz', '中国语种码4881', '211', null, '汉语（中文）');
INSERT INTO `t_flatcode` VALUES ('591', 'gb_zgyz', '中国语种码4881', '224', null, '壮语');
INSERT INTO `t_flatcode` VALUES ('592', 'gb_zgyz', '中国语种码4881', '217', null, '朝鲜语');
INSERT INTO `t_flatcode` VALUES ('593', 'gb_zgyz', '中国语种码4881', '501', null, '裕固语');
INSERT INTO `t_flatcode` VALUES ('594', 'gb_zgyz', '中国语种码4881', '506', null, '蒙古语');
INSERT INTO `t_flatcode` VALUES ('595', 'gb_zgyz', '中国语种码4881', '507', null, '保安语');
INSERT INTO `t_flatcode` VALUES ('596', 'gb_zgyz', '中国语种码4881', '508', null, '达斡尔语');
INSERT INTO `t_flatcode` VALUES ('597', 'gb_zgyz', '中国语种码4881', '509', null, '东乡语');
INSERT INTO `t_flatcode` VALUES ('598', 'gb_zgyz', '中国语种码4881', '513', null, '土语');
INSERT INTO `t_flatcode` VALUES ('599', 'gb_zgyz', '中国语种码4881', '514', null, '鄂温克语');
INSERT INTO `t_flatcode` VALUES ('600', 'gb_zgyz', '中国语种码4881', '517', null, '赫哲语');
INSERT INTO `t_flatcode` VALUES ('601', 'gb_zgyz', '中国语种码4881', '518', null, '满语');
INSERT INTO `t_flatcode` VALUES ('602', 'gb_zgyz', '中国语种码4881', '519', null, '锡伯语');
INSERT INTO `t_flatcode` VALUES ('603', 'gb_zgyz', '中国语种码4881', '161', null, '塔塔尔语');
INSERT INTO `t_flatcode` VALUES ('604', 'gb_zgyz', '中国语种码4881', '162', null, '柯尔克孜语');
INSERT INTO `t_flatcode` VALUES ('605', 'gb_zgyz', '中国语种码4881', '163', null, '哈萨克语');
INSERT INTO `t_flatcode` VALUES ('606', 'gb_zgyz', '中国语种码4881', '168', null, '乌孜别克语');
INSERT INTO `t_flatcode` VALUES ('607', 'gb_zgyz', '中国语种码4881', '223', null, '维吾尔语');
INSERT INTO `t_flatcode` VALUES ('608', 'gb_zgyz', '中国语种码4881', '524', null, '撒拉语');
INSERT INTO `t_flatcode` VALUES ('609', 'gb_zgyz', '中国语种码4881', '531', null, '瑶语');
INSERT INTO `t_flatcode` VALUES ('610', 'gb_zgyz', '中国语种码4881', '532', null, '仡佬语');
INSERT INTO `t_flatcode` VALUES ('611', 'gb_zgyz', '中国语种码4881', '536', null, '阿昌语');
INSERT INTO `t_flatcode` VALUES ('612', 'gb_zgyz', '中国语种码4881', '537', null, '独龙语');
INSERT INTO `t_flatcode` VALUES ('613', 'gb_zgyz', '中国语种码4881', '538', null, '基诺语');
INSERT INTO `t_flatcode` VALUES ('614', 'gb_zgyz', '中国语种码4881', '539', null, '珞巴语');
INSERT INTO `t_flatcode` VALUES ('615', 'gb_zgyz', '中国语种码4881', '540', null, '门巴语');
INSERT INTO `t_flatcode` VALUES ('616', 'gb_zgyz', '中国语种码4881', '541', null, '怒语');
INSERT INTO `t_flatcode` VALUES ('617', 'gb_zgyz', '中国语种码4881', '542', null, '普米语');
INSERT INTO `t_flatcode` VALUES ('618', 'gb_zgyz', '中国语种码4881', '543', null, '羌语');
INSERT INTO `t_flatcode` VALUES ('619', 'gb_zgyz', '中国语种码4881', '544', null, '土家语');
INSERT INTO `t_flatcode` VALUES ('620', 'gb_zgyz', '中国语种码4881', '548', null, '景颇语');
INSERT INTO `t_flatcode` VALUES ('621', 'gb_zgyz', '中国语种码4881', '551', null, '白语');
INSERT INTO `t_flatcode` VALUES ('622', 'gb_zgyz', '中国语种码4881', '552', null, '哈尼语');
INSERT INTO `t_flatcode` VALUES ('623', 'gb_zgyz', '中国语种码4881', '553', null, '拉祜语');
INSERT INTO `t_flatcode` VALUES ('624', 'gb_zgyz', '中国语种码4881', '554', null, '傈僳语');
INSERT INTO `t_flatcode` VALUES ('625', 'gb_zgyz', '中国语种码4881', '555', null, '纳西语');
INSERT INTO `t_flatcode` VALUES ('626', 'gb_zgyz', '中国语种码4881', '556', null, '彝语');
INSERT INTO `t_flatcode` VALUES ('627', 'gb_zgyz', '中国语种码4881', '215', null, '藏语');
INSERT INTO `t_flatcode` VALUES ('628', 'gb_zgyz', '中国语种码4881', '563', null, '黎语');
INSERT INTO `t_flatcode` VALUES ('629', 'gb_zgyz', '中国语种码4881', '567', null, '侗语');
INSERT INTO `t_flatcode` VALUES ('630', 'gb_zgyz', '中国语种码4881', '568', null, '--仡佬语');
INSERT INTO `t_flatcode` VALUES ('631', 'gb_zgyz', '中国语种码4881', '569', null, '毛难语');
INSERT INTO `t_flatcode` VALUES ('632', 'gb_zgyz', '中国语种码4881', '570', null, '水语');
INSERT INTO `t_flatcode` VALUES ('633', 'gb_zgyz', '中国语种码4881', '212', null, '傣语');
INSERT INTO `t_flatcode` VALUES ('634', 'gb_zgyz', '中国语种码4881', '574', null, '布依语');
INSERT INTO `t_flatcode` VALUES ('635', 'gb_zgyz', '中国语种码4881', '580', null, '苗语');
INSERT INTO `t_flatcode` VALUES ('636', 'gb_zgyz', '中国语种码4881', '584', null, '崩龙语');
INSERT INTO `t_flatcode` VALUES ('637', 'gb_zgyz', '中国语种码4881', '585', null, '布朗语');
INSERT INTO `t_flatcode` VALUES ('638', 'gb_zgyz', '中国语种码4881', '590', null, '高山语');
INSERT INTO `t_flatcode` VALUES ('639', 'gb_zgyz', '中国语种码4881', '061', null, '俄语');
INSERT INTO `t_flatcode` VALUES ('640', 'gb_zgyz', '中国语种码4881', '111', null, '塔吉尔克语');
INSERT INTO `t_flatcode` VALUES ('641', 'dm_jxlx', '教学类型码', '11', null, '讲课');
INSERT INTO `t_flatcode` VALUES ('642', 'dm_jxlx', '教学类型码', '12', null, '编写教材');
INSERT INTO `t_flatcode` VALUES ('643', 'dm_jxlx', '教学类型码', '13', null, '辅导');
INSERT INTO `t_flatcode` VALUES ('644', 'dm_jxlx', '教学类型码', '21', null, '带实验');
INSERT INTO `t_flatcode` VALUES ('645', 'dm_jxlx', '教学类型码', '22', null, '带实习');
INSERT INTO `t_flatcode` VALUES ('646', 'dm_jxlx', '教学类型码', '23', null, '带设计');
INSERT INTO `t_flatcode` VALUES ('647', 'dm_jxlx', '教学类型码', '24', null, '带社会实践');
INSERT INTO `t_flatcode` VALUES ('648', 'dm_jxlx', '教学类型码', '31', null, '带军训');
INSERT INTO `t_flatcode` VALUES ('649', 'dm_jxlx', '教学类型码', '32', null, '带学工');
INSERT INTO `t_flatcode` VALUES ('650', 'dm_jxlx', '教学类型码', '33', null, '带学农');
INSERT INTO `t_flatcode` VALUES ('651', 'dm_jxlx', '教学类型码', '41', null, '班主任');
INSERT INTO `t_flatcode` VALUES ('652', 'dm_jxlx', '教学类型码', '42', null, '指导员');
INSERT INTO `t_flatcode` VALUES ('653', 'dm_jxlx', '教学类型码', '43', null, '政治辅导员');
INSERT INTO `t_flatcode` VALUES ('654', 'dm_jxlx', '教学类型码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('655', 'dm_rkjs', '任课角色码', '1', null, '主讲');
INSERT INTO `t_flatcode` VALUES ('656', 'dm_rkjs', '任课角色码', '2', null, '辅导');
INSERT INTO `t_flatcode` VALUES ('657', 'dm_rkjs', '任课角色码', '3', null, '实验');
INSERT INTO `t_flatcode` VALUES ('658', 'dm_rkjs', '任课角色码', '4', null, '习题');
INSERT INTO `t_flatcode` VALUES ('659', 'dm_rkjs', '任课角色码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('660', 'dm_gzlb', '工资类别码', '2221', null, '中学高级教师一档');
INSERT INTO `t_flatcode` VALUES ('661', 'dm_gzlb', '工资类别码', '2222', null, '中学高级教师二档');
INSERT INTO `t_flatcode` VALUES ('662', 'dm_gzlb', '工资类别码', '2223', null, '中学高级教师三档');
INSERT INTO `t_flatcode` VALUES ('663', 'dm_gzlb', '工资类别码', '2224', null, '中学高级教师四档');
INSERT INTO `t_flatcode` VALUES ('664', 'dm_gzlb', '工资类别码', '2225', null, '中学高级教师五档');
INSERT INTO `t_flatcode` VALUES ('665', 'dm_gzlb', '工资类别码', '2226', null, '中学高级教师六档');
INSERT INTO `t_flatcode` VALUES ('666', 'dm_gzlb', '工资类别码', '2227', null, '中学高级教师七档');
INSERT INTO `t_flatcode` VALUES ('667', 'dm_gzlb', '工资类别码', '2228', null, '中学高级教师八档');
INSERT INTO `t_flatcode` VALUES ('668', 'dm_gzlb', '工资类别码', '2229', null, '中学高级教师九档');
INSERT INTO `t_flatcode` VALUES ('669', 'dm_gzlb', '工资类别码', '222A', null, '中学高级教师十档');
INSERT INTO `t_flatcode` VALUES ('670', 'dm_gzlb', '工资类别码', '222B', null, '中学高级教师十一档');
INSERT INTO `t_flatcode` VALUES ('671', 'dm_gzlb', '工资类别码', '222C', null, '中学高级教师十二档');
INSERT INTO `t_flatcode` VALUES ('672', 'dm_gzlb', '工资类别码', '222D', null, '中学高级教师十三档');
INSERT INTO `t_flatcode` VALUES ('673', 'dm_gzlb', '工资类别码', '222E', null, '中学高级教师十四档');
INSERT INTO `t_flatcode` VALUES ('674', 'dm_gzlb', '工资类别码', '2231', null, '中学一级教师、小学高级教师一档');
INSERT INTO `t_flatcode` VALUES ('675', 'dm_gzlb', '工资类别码', '2232', null, '中学一级教师、小学高级教师二档');
INSERT INTO `t_flatcode` VALUES ('676', 'dm_gzlb', '工资类别码', '2233', null, '中学一级教师、小学高级教师三档');
INSERT INTO `t_flatcode` VALUES ('677', 'dm_gzlb', '工资类别码', '2234', null, '中学一级教师、小学高级教师四档');
INSERT INTO `t_flatcode` VALUES ('678', 'dm_gzlb', '工资类别码', '2235', null, '中学一级教师、小学高级教师五档');
INSERT INTO `t_flatcode` VALUES ('679', 'dm_gzlb', '工资类别码', '2236', null, '中学一级教师、小学高级教师六档');
INSERT INTO `t_flatcode` VALUES ('680', 'dm_gzlb', '工资类别码', '2237', null, '中学一级教师、小学高级教师七档');
INSERT INTO `t_flatcode` VALUES ('681', 'dm_gzlb', '工资类别码', '2238', null, '中学一级教师、小学高级教师八档');
INSERT INTO `t_flatcode` VALUES ('682', 'dm_gzlb', '工资类别码', '2239', null, '中学一级教师、小学高级教师九档');
INSERT INTO `t_flatcode` VALUES ('683', 'dm_gzlb', '工资类别码', '223A', null, '中学一级教师、小学高级教师十档');
INSERT INTO `t_flatcode` VALUES ('684', 'dm_gzlb', '工资类别码', '223B', null, '中学一级教师、小学高级教师十一档');
INSERT INTO `t_flatcode` VALUES ('685', 'dm_gzlb', '工资类别码', '223C', null, '中学一级教师、小学高级教师十二档');
INSERT INTO `t_flatcode` VALUES ('686', 'dm_gzlb', '工资类别码', '223D', null, '中学一级教师、小学高级教师十三档');
INSERT INTO `t_flatcode` VALUES ('687', 'dm_gzlb', '工资类别码', '223E', null, '中学一级教师、小学高级教师十四档');
INSERT INTO `t_flatcode` VALUES ('688', 'dm_gzlb', '工资类别码', '223F', null, '中学一级教师、小学高级教师十五档');
INSERT INTO `t_flatcode` VALUES ('689', 'dm_gzlb', '工资类别码', '223G', null, '中学一级教师、小学高级教师十六档');
INSERT INTO `t_flatcode` VALUES ('690', 'dm_gzlb', '工资类别码', '2241', null, '中学二级教师、小学一级教师一档');
INSERT INTO `t_flatcode` VALUES ('691', 'dm_gzlb', '工资类别码', '2242', null, '中学二级教师、小学一级教师二档');
INSERT INTO `t_flatcode` VALUES ('692', 'dm_gzlb', '工资类别码', '2243', null, '中学二级教师、小学一级教师三档');
INSERT INTO `t_flatcode` VALUES ('693', 'dm_gzlb', '工资类别码', '2244', null, '中学二级教师、小学一级教师四档');
INSERT INTO `t_flatcode` VALUES ('694', 'dm_gzlb', '工资类别码', '2245', null, '中学二级教师、小学一级教师五档');
INSERT INTO `t_flatcode` VALUES ('695', 'dm_gzlb', '工资类别码', '2246', null, '中学二级教师、小学一级教师六档');
INSERT INTO `t_flatcode` VALUES ('696', 'dm_gzlb', '工资类别码', '2247', null, '中学二级教师、小学一级教师七档');
INSERT INTO `t_flatcode` VALUES ('697', 'dm_gzlb', '工资类别码', '2248', null, '中学二级教师、小学一级教师八档');
INSERT INTO `t_flatcode` VALUES ('698', 'dm_gzlb', '工资类别码', '2249', null, '中学二级教师、小学一级教师九档');
INSERT INTO `t_flatcode` VALUES ('699', 'dm_gzlb', '工资类别码', '224A', null, '中学二级教师、小学一级教师十档');
INSERT INTO `t_flatcode` VALUES ('700', 'dm_gzlb', '工资类别码', '224B', null, '中学二级教师、小学一级教师十一档');
INSERT INTO `t_flatcode` VALUES ('701', 'dm_gzlb', '工资类别码', '224C', null, '中学二级教师、小学一级教师十二档');
INSERT INTO `t_flatcode` VALUES ('702', 'dm_gzlb', '工资类别码', '224D', null, '中学二级教师、小学一级教师十三档');
INSERT INTO `t_flatcode` VALUES ('703', 'dm_gzlb', '工资类别码', '224E', null, '中学二级教师、小学一级教师十四档');
INSERT INTO `t_flatcode` VALUES ('704', 'dm_gzlb', '工资类别码', '224F', null, '中学二级教师、小学一级教师十五档');
INSERT INTO `t_flatcode` VALUES ('705', 'dm_gzlb', '工资类别码', '224G', null, '中学二级教师、小学一级教师十六档');
INSERT INTO `t_flatcode` VALUES ('706', 'dm_gzlb', '工资类别码', '2251', null, '中学三级教师、小学二级教师一档');
INSERT INTO `t_flatcode` VALUES ('707', 'dm_gzlb', '工资类别码', '2252', null, '中学三级教师、小学二级教师二档');
INSERT INTO `t_flatcode` VALUES ('708', 'dm_gzlb', '工资类别码', '2253', null, '中学三级教师、小学二级教师三档');
INSERT INTO `t_flatcode` VALUES ('709', 'dm_gzlb', '工资类别码', '2254', null, '中学三级教师、小学二级教师四档');
INSERT INTO `t_flatcode` VALUES ('710', 'dm_gzlb', '工资类别码', '2255', null, '中学三级教师、小学二级教师五档');
INSERT INTO `t_flatcode` VALUES ('711', 'dm_gzlb', '工资类别码', '2256', null, '中学三级教师、小学二级教师六档');
INSERT INTO `t_flatcode` VALUES ('712', 'dm_gzlb', '工资类别码', '2257', null, '中学三级教师、小学二级教师七档');
INSERT INTO `t_flatcode` VALUES ('713', 'dm_gzlb', '工资类别码', '2258', null, '中学三级教师、小学二级教师八档');
INSERT INTO `t_flatcode` VALUES ('714', 'dm_gzlb', '工资类别码', '2259', null, '中学三级教师、小学二级教师九档');
INSERT INTO `t_flatcode` VALUES ('715', 'dm_gzlb', '工资类别码', '225A', null, '中学三级教师、小学二级教师十档');
INSERT INTO `t_flatcode` VALUES ('716', 'dm_gzlb', '工资类别码', '225B', null, '中学三级教师、小学二级教师十一档');
INSERT INTO `t_flatcode` VALUES ('717', 'dm_gzlb', '工资类别码', '225C', null, '中学三级教师、小学二级教师十二档');
INSERT INTO `t_flatcode` VALUES ('718', 'dm_gzlb', '工资类别码', '225D', null, '中学三级教师、小学二级教师十三档');
INSERT INTO `t_flatcode` VALUES ('719', 'dm_gzlb', '工资类别码', '225E', null, '中学三级教师、小学二级教师十四档');
INSERT INTO `t_flatcode` VALUES ('720', 'dm_gzbdyy', '工资变动原因码', '01', null, '普调升级');
INSERT INTO `t_flatcode` VALUES ('721', 'dm_gzbdyy', '工资变动原因码', '02', null, '正常升级');
INSERT INTO `t_flatcode` VALUES ('722', 'dm_gzbdyy', '工资变动原因码', '03', null, '奖励升级');
INSERT INTO `t_flatcode` VALUES ('723', 'dm_gzbdyy', '工资变动原因码', '04', null, '处分降级');
INSERT INTO `t_flatcode` VALUES ('724', 'dm_gzbdyy', '工资变动原因码', '11', null, '职务变动');
INSERT INTO `t_flatcode` VALUES ('725', 'dm_gzbdyy', '工资变动原因码', '12', null, '职称工资兑现');
INSERT INTO `t_flatcode` VALUES ('726', 'dm_gzbdyy', '工资变动原因码', '13', null, '见习、临时工资');
INSERT INTO `t_flatcode` VALUES ('727', 'dm_gzbdyy', '工资变动原因码', '14', null, '定级工资');
INSERT INTO `t_flatcode` VALUES ('728', 'dm_gzbdyy', '工资变动原因码', '15', null, '考工升级');
INSERT INTO `t_flatcode` VALUES ('729', 'dm_gzbdyy', '工资变动原因码', '21', null, '工资套改');
INSERT INTO `t_flatcode` VALUES ('730', 'dm_gzbdyy', '工资变动原因码', '22', null, '工资集体转制');
INSERT INTO `t_flatcode` VALUES ('731', 'dm_gzbdyy', '工资变动原因码', '23', null, '军人转业复退');
INSERT INTO `t_flatcode` VALUES ('732', 'dm_gzbdyy', '工资变动原因码', '24', null, '调动工资');
INSERT INTO `t_flatcode` VALUES ('733', 'dm_gzbdyy', '工资变动原因码', '31', null, '工资改革');
INSERT INTO `t_flatcode` VALUES ('734', 'dm_gzbdyy', '工资变动原因码', '32', null, '提高工资标准');
INSERT INTO `t_flatcode` VALUES ('735', 'dm_gzbdyy', '工资变动原因码', '33', null, '调整工资区');
INSERT INTO `t_flatcode` VALUES ('736', 'dm_gzbdyy', '工资变动原因码', '41', null, '落实政策');
INSERT INTO `t_flatcode` VALUES ('737', 'dm_gzbdyy', '工资变动原因码', '42', null, '离退休');
INSERT INTO `t_flatcode` VALUES ('738', 'dm_gzbdyy', '工资变动原因码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('739', 'dm_bxflf', '保险福利费细目码', '02', null, '职工生活困难补助');
INSERT INTO `t_flatcode` VALUES ('740', 'dm_bxflf', '保险福利费细目码', '03', null, '职工计划生育补贴');
INSERT INTO `t_flatcode` VALUES ('741', 'dm_bxflf', '保险福利费细目码', '04', null, '职工上、下班交通补贴');
INSERT INTO `t_flatcode` VALUES ('742', 'dm_bxflf', '保险福利费细目码', '05', null, '职工洗理卫生费');
INSERT INTO `t_flatcode` VALUES ('743', 'dm_bxflf', '保险福利费细目码', '11', null, '职工医疗卫生费');
INSERT INTO `t_flatcode` VALUES ('744', 'dm_bxflf', '保险福利费细目码', '12', null, '职工文体宣传费');
INSERT INTO `t_flatcode` VALUES ('745', 'dm_bxflf', '保险福利费细目码', '13', null, '职工集体福利事业补贴');
INSERT INTO `t_flatcode` VALUES ('746', 'dm_bxflf', '保险福利费细目码', '14', null, '职工集体福利设施费');
INSERT INTO `t_flatcode` VALUES ('747', 'dm_bxflf', '保险福利费细目码', '16', null, '职工冬季取暖补贴');
INSERT INTO `t_flatcode` VALUES ('748', 'dm_bxflf', '保险福利费细目码', '19', null, '职工个人其他保险福利费用');
INSERT INTO `t_flatcode` VALUES ('749', 'dm_bxflf', '保险福利费细目码', '51', null, '职工集体保险福利其他费用');
INSERT INTO `t_flatcode` VALUES ('750', 'dm_bxflf', '保险福利费细目码', '01', null, '职工丧葬抚恤救济费');
INSERT INTO `t_flatcode` VALUES ('751', 'dm_bxflf', '保险福利费细目码', '52', null, '离休金');
INSERT INTO `t_flatcode` VALUES ('752', 'dm_bxflf', '保险福利费细目码', '53', null, '退休金');
INSERT INTO `t_flatcode` VALUES ('753', 'dm_bxflf', '保险福利费细目码', '54', null, '退职生活费');
INSERT INTO `t_flatcode` VALUES ('754', 'dm_bxflf', '保险福利费细目码', '55', null, '离退人员医疗卫生费');
INSERT INTO `t_flatcode` VALUES ('755', 'dm_bxflf', '保险福利费细目码', '56', null, '护理费');
INSERT INTO `t_flatcode` VALUES ('756', 'dm_bxflf', '保险福利费细目码', '57', null, '生活补贴');
INSERT INTO `t_flatcode` VALUES ('757', 'dm_bxflf', '保险福利费细目码', '58', null, '离休人员交通补贴');
INSERT INTO `t_flatcode` VALUES ('758', 'dm_bxflf', '保险福利费细目码', '60', null, '离休人员冬季取暖补贴');
INSERT INTO `t_flatcode` VALUES ('759', 'dm_bxflf', '保险福利费细目码', '61', null, '离休人员物价补贴');
INSERT INTO `t_flatcode` VALUES ('760', 'dm_bxflf', '保险福利费细目码', '99', null, '离退人员保险福利其他费用');
INSERT INTO `t_flatcode` VALUES ('761', 'dm_bxflf', '保险福利费细目码', '59', null, '离休人员丧葬抚恤救济费');
INSERT INTO `t_flatcode` VALUES ('762', 'dm_zjlb', '专家类别码', '10', null, '院士');
INSERT INTO `t_flatcode` VALUES ('763', 'dm_zjlb', '专家类别码', '11', null, '中国科学院院士');
INSERT INTO `t_flatcode` VALUES ('764', 'dm_zjlb', '专家类别码', '12', null, '中国工程院院士');
INSERT INTO `t_flatcode` VALUES ('765', 'dm_zjlb', '专家类别码', '13', null, '两院院士');
INSERT INTO `t_flatcode` VALUES ('766', 'dm_zjlb', '专家类别码', '14', null, '外国科学院院士');
INSERT INTO `t_flatcode` VALUES ('767', 'dm_zjlb', '专家类别码', '20', null, '国家级专家');
INSERT INTO `t_flatcode` VALUES ('768', 'dm_zjlb', '专家类别码', '21', null, '国家主管部门批准的有突出贡献的专家');
INSERT INTO `t_flatcode` VALUES ('769', 'dm_zjlb', '专家类别码', '22', null, '享受政府特殊津贴（定期发放）专家');
INSERT INTO `t_flatcode` VALUES ('770', 'dm_zjlb', '专家类别码', '23', null, '享受政府特殊津贴（一次性发放）专家');
INSERT INTO `t_flatcode` VALUES ('771', 'dm_zjlb', '专家类别码', '29', null, '国家主管部门批准的其他专家');
INSERT INTO `t_flatcode` VALUES ('772', 'dm_zjlb', '专家类别码', '30', null, '省、部级有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('773', 'dm_zjlb', '专家类别码', '40', null, '地、市级有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('774', 'dm_zjlb', '专家类别码', '50', null, '县级有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('775', 'dm_zjlb', '专家类别码', '80', null, '解放军专家');
INSERT INTO `t_flatcode` VALUES ('776', 'dm_zjlb', '专家类别码', '81', null, '全军有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('777', 'dm_zjlb', '专家类别码', '82', null, '大军区有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('778', 'dm_zjlb', '专家类别码', '83', null, '军级有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('779', 'dm_zjlb', '专家类别码', '84', null, '师级有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('780', 'dm_zjlb', '专家类别码', '85', null, '团级有突出贡献专家');
INSERT INTO `t_flatcode` VALUES ('781', 'dm_zjlb', '专家类别码', '99', null, '其他专家');
INSERT INTO `t_flatcode` VALUES ('782', 'dm_xsttjb', '团体级别码', '1', null, '国际');
INSERT INTO `t_flatcode` VALUES ('783', 'dm_xsttjb', '团体级别码', '2', null, '国家');
INSERT INTO `t_flatcode` VALUES ('784', 'dm_xsttjb', '团体级别码', '3', null, '省（生活区、直辖市）');
INSERT INTO `t_flatcode` VALUES ('785', 'dm_xsttjb', '团体级别码', '4', null, '地（市、州）');
INSERT INTO `t_flatcode` VALUES ('786', 'dm_xsttjb', '团体级别码', '5', null, '县（区、旗）');
INSERT INTO `t_flatcode` VALUES ('787', 'dm_xsttjb', '团体级别码', '-', null, '其他');
INSERT INTO `t_flatcode` VALUES ('788', 'dm_cqshjz', '团兼辞职原因码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('789', 'dm_cqshjz', '团兼辞职原因码', '1', null, '任职期满');
INSERT INTO `t_flatcode` VALUES ('790', 'dm_cqshjz', '团兼辞职原因码', '2', null, '工作调动');
INSERT INTO `t_flatcode` VALUES ('791', 'dm_cqshjz', '团兼辞职原因码', '3', null, '换届改选');
INSERT INTO `t_flatcode` VALUES ('792', 'dm_cqshjz', '团兼辞职原因码', '4', null, '离退休');
INSERT INTO `t_flatcode` VALUES ('793', 'dm_cqshjz', '团兼辞职原因码', '5', null, '健康原因');
INSERT INTO `t_flatcode` VALUES ('794', 'dm_cqshjz', '团兼辞职原因码', '6', null, '辞职');
INSERT INTO `t_flatcode` VALUES ('795', 'dm_cqshjz', '团兼辞职原因码', '7', null, '免职');
INSERT INTO `t_flatcode` VALUES ('796', 'dm_cqshjz', '团兼辞职原因码', '8', null, '处分');
INSERT INTO `t_flatcode` VALUES ('797', 'dm_cqshjz', '团兼辞职原因码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('798', 'dm_lxlzyy', '离校原因码', '11', null, '离休');
INSERT INTO `t_flatcode` VALUES ('799', 'dm_lxlzyy', '离校原因码', '12', null, '退休');
INSERT INTO `t_flatcode` VALUES ('800', 'dm_lxlzyy', '离校原因码', '21', null, '系统内调出');
INSERT INTO `t_flatcode` VALUES ('801', 'dm_lxlzyy', '离校原因码', '22', null, '调出至系统外');
INSERT INTO `t_flatcode` VALUES ('802', 'dm_lxlzyy', '离校原因码', '31', null, '参军');
INSERT INTO `t_flatcode` VALUES ('803', 'dm_lxlzyy', '离校原因码', '32', null, '进修学习');
INSERT INTO `t_flatcode` VALUES ('804', 'dm_lxlzyy', '离校原因码', '41', null, '辞职');
INSERT INTO `t_flatcode` VALUES ('805', 'dm_lxlzyy', '离校原因码', '42', null, '辞退');
INSERT INTO `t_flatcode` VALUES ('806', 'dm_lxlzyy', '离校原因码', '43', null, '合同期满');
INSERT INTO `t_flatcode` VALUES ('807', 'dm_lxlzyy', '离校原因码', '51', null, '除名');
INSERT INTO `t_flatcode` VALUES ('808', 'dm_lxlzyy', '离校原因码', '52', null, '开除');
INSERT INTO `t_flatcode` VALUES ('809', 'dm_lxlzyy', '离校原因码', '53', null, '死亡');
INSERT INTO `t_flatcode` VALUES ('810', 'dm_lxlzyy', '离校原因码', '54', null, '失踪');
INSERT INTO `t_flatcode` VALUES ('811', 'dm_lxlzyy', '离校原因码', '55', null, '借调期满');
INSERT INTO `t_flatcode` VALUES ('812', 'dm_lxlzyy', '离校原因码', '56', null, '借调外出');
INSERT INTO `t_flatcode` VALUES ('813', 'dm_lxlzyy', '离校原因码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('814', 'dm_bzyd', '编制异动码', '1', null, '调至非教学岗位');
INSERT INTO `t_flatcode` VALUES ('815', 'dm_bzyd', '编制异动码', '2', null, '调至教学岗位');
INSERT INTO `t_flatcode` VALUES ('816', 'dm_bzyd', '编制异动码', '3', null, '其他');
INSERT INTO `t_flatcode` VALUES ('817', 'dm_lgyy', '离岗原因码', '1', null, '出国（境）');
INSERT INTO `t_flatcode` VALUES ('818', 'dm_lgyy', '离岗原因码', '2', null, '国内探亲');
INSERT INTO `t_flatcode` VALUES ('819', 'dm_lgyy', '离岗原因码', '3', null, '事假');
INSERT INTO `t_flatcode` VALUES ('820', 'dm_lgyy', '离岗原因码', '4', null, '病休');
INSERT INTO `t_flatcode` VALUES ('821', 'dm_lgyy', '离岗原因码', '5', null, '国内进修学习');
INSERT INTO `t_flatcode` VALUES ('822', 'dm_lgyy', '离岗原因码', '6', null, '借调');
INSERT INTO `t_flatcode` VALUES ('823', 'dm_lgyy', '离岗原因码', '7', null, '不胜任工作');
INSERT INTO `t_flatcode` VALUES ('824', 'dm_lgyy', '离岗原因码', '8', null, '处分');
INSERT INTO `t_flatcode` VALUES ('825', 'dm_lgyy', '离岗原因码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('826', 'dm_jxxz', '进修性质码', '1', null, '学历教育');
INSERT INTO `t_flatcode` VALUES ('827', 'dm_jxxz', '进修性质码', '2', null, '非学历教育');
INSERT INTO `t_flatcode` VALUES ('828', 'dm_dwxz', '主办单位性质码', '10', null, '机关');
INSERT INTO `t_flatcode` VALUES ('829', 'dm_dwxz', '主办单位性质码', '20', null, '事业单位');
INSERT INTO `t_flatcode` VALUES ('830', 'dm_dwxz', '主办单位性质码', '21', null, '科研设计单位');
INSERT INTO `t_flatcode` VALUES ('831', 'dm_dwxz', '主办单位性质码', '22', null, '高级学校');
INSERT INTO `t_flatcode` VALUES ('832', 'dm_dwxz', '主办单位性质码', '23', null, '其他教学单位');
INSERT INTO `t_flatcode` VALUES ('833', 'dm_dwxz', '主办单位性质码', '29', null, '其他事业单位');
INSERT INTO `t_flatcode` VALUES ('834', 'dm_dwxz', '主办单位性质码', '30', null, '企业');
INSERT INTO `t_flatcode` VALUES ('835', 'dm_dwxz', '主办单位性质码', '31', null, '国有企业');
INSERT INTO `t_flatcode` VALUES ('836', 'dm_dwxz', '主办单位性质码', '32', null, '三资企业');
INSERT INTO `t_flatcode` VALUES ('837', 'dm_dwxz', '主办单位性质码', '39', null, '其他企业');
INSERT INTO `t_flatcode` VALUES ('838', 'dm_dwxz', '主办单位性质码', '40', null, '部队');
INSERT INTO `t_flatcode` VALUES ('839', 'dm_dwxz', '主办单位性质码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('840', 'dm_zxdwlb', '在学单位类别码', '1', null, '高等学校');
INSERT INTO `t_flatcode` VALUES ('841', 'dm_zxdwlb', '在学单位类别码', '2', null, '行政学院');
INSERT INTO `t_flatcode` VALUES ('842', 'dm_zxdwlb', '在学单位类别码', '3', null, '研究所');
INSERT INTO `t_flatcode` VALUES ('843', 'dm_zxdwlb', '在学单位类别码', '4', null, '企业');
INSERT INTO `t_flatcode` VALUES ('844', 'dm_zxdwlb', '在学单位类别码', '5', null, '学会');
INSERT INTO `t_flatcode` VALUES ('845', 'dm_zxdwlb', '在学单位类别码', '6', null, '党政机关');
INSERT INTO `t_flatcode` VALUES ('846', 'dm_zxdwlb', '在学单位类别码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('847', 'gb_cgmd', '出国（境）目的码', '01', null, '常驻国外使馆、领事馆');
INSERT INTO `t_flatcode` VALUES ('848', 'gb_cgmd', '出国（境）目的码', '02', null, '常驻国际组织及其代表机构');
INSERT INTO `t_flatcode` VALUES ('849', 'gb_cgmd', '出国（境）目的码', '03', null, '常驻国外其他组织');
INSERT INTO `t_flatcode` VALUES ('850', 'gb_cgmd', '出国（境）目的码', '05', null, '短期派驻国外使馆、领事馆');
INSERT INTO `t_flatcode` VALUES ('851', 'gb_cgmd', '出国（境）目的码', '06', null, '短期派驻国外其他代表机构');
INSERT INTO `t_flatcode` VALUES ('852', 'gb_cgmd', '出国（境）目的码', '08', null, '短期派驻国外其他组织');
INSERT INTO `t_flatcode` VALUES ('853', 'gb_cgmd', '出国（境）目的码', '10', null, '党政代表团出访');
INSERT INTO `t_flatcode` VALUES ('854', 'gb_cgmd', '出国（境）目的码', '11', null, '军事代表团出访');
INSERT INTO `t_flatcode` VALUES ('855', 'gb_cgmd', '出国（境）目的码', '12', null, '经济贸易和财务方面代表团出访与洽谈');
INSERT INTO `t_flatcode` VALUES ('856', 'gb_cgmd', '出国（境）目的码', '13', null, '学术、文艺、体育代表团和其它社会团体出访');
INSERT INTO `t_flatcode` VALUES ('857', 'gb_cgmd', '出国（境）目的码', '14', null, '参加国际性的各类比赛');
INSERT INTO `t_flatcode` VALUES ('858', 'gb_cgmd', '出国（境）目的码', '15', null, '参加交易会和展览会');
INSERT INTO `t_flatcode` VALUES ('859', 'gb_cgmd', '出国（境）目的码', '20', null, '引进技术和设备');
INSERT INTO `t_flatcode` VALUES ('860', 'gb_cgmd', '出国（境）目的码', '21', null, '商务出国');
INSERT INTO `t_flatcode` VALUES ('861', 'gb_cgmd', '出国（境）目的码', '22', null, '实习');
INSERT INTO `t_flatcode` VALUES ('862', 'gb_cgmd', '出国（境）目的码', '23', null, '监造');
INSERT INTO `t_flatcode` VALUES ('863', 'gb_cgmd', '出国（境）目的码', '30', null, '援外技术工作');
INSERT INTO `t_flatcode` VALUES ('864', 'gb_cgmd', '出国（境）目的码', '31', null, '援建工作');
INSERT INTO `t_flatcode` VALUES ('865', 'gb_cgmd', '出国（境）目的码', '32', null, '援外培训工作');
INSERT INTO `t_flatcode` VALUES ('866', 'gb_cgmd', '出国（境）目的码', '33', null, '劳务出口');
INSERT INTO `t_flatcode` VALUES ('867', 'gb_cgmd', '出国（境）目的码', '34', null, '合营工程');
INSERT INTO `t_flatcode` VALUES ('868', 'gb_cgmd', '出国（境）目的码', '36', null, '航空、邮电、海运、公路等国际联运业务');
INSERT INTO `t_flatcode` VALUES ('869', 'gb_cgmd', '出国（境）目的码', '37', null, '随船工作');
INSERT INTO `t_flatcode` VALUES ('870', 'gb_cgmd', '出国（境）目的码', '39', null, '科技合作项目');
INSERT INTO `t_flatcode` VALUES ('871', 'gb_cgmd', '出国（境）目的码', '40', null, '考察');
INSERT INTO `t_flatcode` VALUES ('872', 'gb_cgmd', '出国（境）目的码', '41', null, '领奖');
INSERT INTO `t_flatcode` VALUES ('873', 'gb_cgmd', '出国（境）目的码', '42', null, '参加各种会议');
INSERT INTO `t_flatcode` VALUES ('874', 'gb_cgmd', '出国（境）目的码', '43', null, '进修');
INSERT INTO `t_flatcode` VALUES ('875', 'gb_cgmd', '出国（境）目的码', '44', null, '讲学');
INSERT INTO `t_flatcode` VALUES ('876', 'gb_cgmd', '出国（境）目的码', '45', null, '公派留学');
INSERT INTO `t_flatcode` VALUES ('877', 'gb_cgmd', '出国（境）目的码', '46', null, '自费留学');
INSERT INTO `t_flatcode` VALUES ('878', 'gb_cgmd', '出国（境）目的码', '47', null, '自费公派留学');
INSERT INTO `t_flatcode` VALUES ('879', 'gb_cgmd', '出国（境）目的码', '60', null, '旅游');
INSERT INTO `t_flatcode` VALUES ('880', 'gb_cgmd', '出国（境）目的码', '61', null, '探亲');
INSERT INTO `t_flatcode` VALUES ('881', 'gb_cgmd', '出国（境）目的码', '62', null, '会友');
INSERT INTO `t_flatcode` VALUES ('882', 'gb_cgmd', '出国（境）目的码', '63', null, '结婚');
INSERT INTO `t_flatcode` VALUES ('883', 'gb_cgmd', '出国（境）目的码', '64', null, '继承财产');
INSERT INTO `t_flatcode` VALUES ('884', 'gb_cgmd', '出国（境）目的码', '65', null, '就业');
INSERT INTO `t_flatcode` VALUES ('885', 'gb_cgmd', '出国（境）目的码', '66', null, '定居');
INSERT INTO `t_flatcode` VALUES ('886', 'gb_cgmd', '出国（境）目的码', '70', null, '特殊任务');
INSERT INTO `t_flatcode` VALUES ('887', 'gb_cgmd', '出国（境）目的码', '99', null, '其它原因出国');
INSERT INTO `t_flatcode` VALUES ('888', 'dm_cgjfly', '出国（境）经费来源码', '1', null, '国家出资');
INSERT INTO `t_flatcode` VALUES ('889', 'dm_cgjfly', '出国（境）经费来源码', '2', null, '单位出资');
INSERT INTO `t_flatcode` VALUES ('890', 'dm_cgjfly', '出国（境）经费来源码', '3', null, '外方出资');
INSERT INTO `t_flatcode` VALUES ('891', 'dm_cgjfly', '出国（境）经费来源码', '4', null, '自费');
INSERT INTO `t_flatcode` VALUES ('892', 'dm_cgjfly', '出国（境）经费来源码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('893', 'dm_khjg', '考核结论码', '1', null, '优秀');
INSERT INTO `t_flatcode` VALUES ('894', 'dm_khjg', '考核结论码', '2', null, '称职');
INSERT INTO `t_flatcode` VALUES ('895', 'dm_khjg', '考核结论码', '3', null, '不称职');
INSERT INTO `t_flatcode` VALUES ('896', 'dm_hygzlb', '考核工种码dmhygzlb', '01', null, '机械加工类');
INSERT INTO `t_flatcode` VALUES ('897', 'dm_hygzlb', '考核工种码dmhygzlb', '02', null, '电工电器工程类');
INSERT INTO `t_flatcode` VALUES ('898', 'dm_hygzlb', '考核工种码dmhygzlb', '03', null, '建筑工程类');
INSERT INTO `t_flatcode` VALUES ('899', 'dm_hygzlb', '考核工种码dmhygzlb', '04', null, '仪器仪表工程类');
INSERT INTO `t_flatcode` VALUES ('900', 'dm_hygzlb', '考核工种码dmhygzlb', '05', null, '水暖通风工程类');
INSERT INTO `t_flatcode` VALUES ('901', 'dm_hygzlb', '考核工种码dmhygzlb', '06', null, '机动车驾驶类');
INSERT INTO `t_flatcode` VALUES ('902', 'dm_hygzlb', '考核工种码dmhygzlb', '07', null, '家具维修类');
INSERT INTO `t_flatcode` VALUES ('903', 'dm_hygzlb', '考核工种码dmhygzlb', '08', null, '宣传广告标本制作类');
INSERT INTO `t_flatcode` VALUES ('904', 'dm_hygzlb', '考核工种码dmhygzlb', '09', null, '餐饮服务类');
INSERT INTO `t_flatcode` VALUES ('905', 'dm_hygzlb', '考核工种码dmhygzlb', '10', null, '商贸服务类');
INSERT INTO `t_flatcode` VALUES ('906', 'dm_hygzlb', '考核工种码dmhygzlb', '11', null, '护理保健类');
INSERT INTO `t_flatcode` VALUES ('907', 'dm_hygzlb', '考核工种码dmhygzlb', '12', null, '花木养殖类');
INSERT INTO `t_flatcode` VALUES ('908', 'dm_hygzlb', '考核工种码dmhygzlb', '13', null, '其他');
INSERT INTO `t_flatcode` VALUES ('909', 'dm_jzwjg', '建筑物结构码', '1', null, '框架结构');
INSERT INTO `t_flatcode` VALUES ('910', 'dm_jzwjg', '建筑物结构码', '2', null, '砖混结构');
INSERT INTO `t_flatcode` VALUES ('911', 'dm_jzwjg', '建筑物结构码', '3', null, '砖木结构');
INSERT INTO `t_flatcode` VALUES ('912', 'dm_jzwjg', '建筑物结构码', '4', null, '土木结构');
INSERT INTO `t_flatcode` VALUES ('913', 'dm_jzwjg', '建筑物结构码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('914', 'dm_fwlx', '房屋类型码', '1', null, '楼房');
INSERT INTO `t_flatcode` VALUES ('915', 'dm_fwlx', '房屋类型码', '2', null, '平房');
INSERT INTO `t_flatcode` VALUES ('916', 'dm_fwlx', '房屋类型码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('917', 'dm_ltlb', '离退类别码', '1', null, '离休');
INSERT INTO `t_flatcode` VALUES ('918', 'dm_ltlb', '离退类别码', '2', null, '退休');
INSERT INTO `t_flatcode` VALUES ('919', 'dm_dwjb', '批准单位级别码', '01', null, '中央级');
INSERT INTO `t_flatcode` VALUES ('920', 'dm_dwjb', '批准单位级别码', '03', null, '部、省级');
INSERT INTO `t_flatcode` VALUES ('921', 'dm_dwjb', '批准单位级别码', '04', null, '副部、副省级');
INSERT INTO `t_flatcode` VALUES ('922', 'dm_dwjb', '批准单位级别码', '05', null, '司、局、地、厅级');
INSERT INTO `t_flatcode` VALUES ('923', 'dm_dwjb', '批准单位级别码', '06', null, '副司、副局、副地、副厅级');
INSERT INTO `t_flatcode` VALUES ('924', 'dm_dwjb', '批准单位级别码', '07', null, '县、处级');
INSERT INTO `t_flatcode` VALUES ('925', 'dm_dwjb', '批准单位级别码', '08', null, '副县、副处级');
INSERT INTO `t_flatcode` VALUES ('926', 'dm_dwjb', '批准单位级别码', '09', null, '正科级');
INSERT INTO `t_flatcode` VALUES ('927', 'dm_dwjb', '批准单位级别码', '10', null, '副科级');
INSERT INTO `t_flatcode` VALUES ('928', 'dm_dwjb', '批准单位级别码', '11', null, '股级');
INSERT INTO `t_flatcode` VALUES ('929', 'dm_dwjb', '批准单位级别码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('930', 'dm_fwcq', '房屋产权码', '01', null, '自购福利住房');
INSERT INTO `t_flatcode` VALUES ('931', 'dm_fwcq', '房屋产权码', '02', null, '自购经济实用住房');
INSERT INTO `t_flatcode` VALUES ('932', 'dm_fwcq', '房屋产权码', '03', null, '自购商品住房');
INSERT INTO `t_flatcode` VALUES ('933', 'dm_fwcq', '房屋产权码', '04', null, '自建住房');
INSERT INTO `t_flatcode` VALUES ('934', 'dm_fwcq', '房屋产权码', '05', null, '租住本校公有住房');
INSERT INTO `t_flatcode` VALUES ('935', 'dm_fwcq', '房屋产权码', '06', null, '租住外单位公有住房');
INSERT INTO `t_flatcode` VALUES ('936', 'dm_fwcq', '房屋产权码', '07', null, '租住私有住房');
INSERT INTO `t_flatcode` VALUES ('937', 'dm_fwcq', '房屋产权码', '08', null, '集体宿舍');
INSERT INTO `t_flatcode` VALUES ('938', 'dm_fwcq', '房屋产权码', '09', null, '本校暂住');
INSERT INTO `t_flatcode` VALUES ('939', 'dm_fwcq', '房屋产权码', '10', null, '外单位暂借');
INSERT INTO `t_flatcode` VALUES ('940', 'dm_fwcq', '房屋产权码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('941', 'dm_fwwzzk', '房屋位置状况()2006/11/14', '1', null, '校内');
INSERT INTO `t_flatcode` VALUES ('942', 'dm_fwwzzk', '房屋位置状况()2006/11/14', '0', null, '校外');
INSERT INTO `t_flatcode` VALUES ('943', 'dm_zwfl', '职位分类码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('944', 'dm_zwfl', '职位分类码', '01', null, '国务院总理级');
INSERT INTO `t_flatcode` VALUES ('945', 'dm_zwfl', '职位分类码', '02', null, '国务院副总理,国务委员级');
INSERT INTO `t_flatcode` VALUES ('946', 'dm_zwfl', '职位分类码', '03', null, '部级正职,省级正职级');
INSERT INTO `t_flatcode` VALUES ('947', 'dm_zwfl', '职位分类码', '04', null, '部级副级,省级副职级');
INSERT INTO `t_flatcode` VALUES ('948', 'dm_zwfl', '职位分类码', '05', null, '司级正职,厅级正职,巡视员级');
INSERT INTO `t_flatcode` VALUES ('949', 'dm_zwfl', '职位分类码', '06', null, '司级副职,厅级副职,助理巡视员级');
INSERT INTO `t_flatcode` VALUES ('950', 'dm_zwfl', '职位分类码', '07', null, '处级正职,县级正职,调研员级');
INSERT INTO `t_flatcode` VALUES ('951', 'dm_zwfl', '职位分类码', '08', null, '处级副职,县级副职,助理调研员级');
INSERT INTO `t_flatcode` VALUES ('952', 'dm_zwfl', '职位分类码', '09', null, '科级正职,乡级正职,主任科员级');
INSERT INTO `t_flatcode` VALUES ('953', 'dm_zwfl', '职位分类码', '10', null, '科级副职,乡级副职,副主任科员级');
INSERT INTO `t_flatcode` VALUES ('954', 'dm_zwfl', '职位分类码', '11', null, '科员级');
INSERT INTO `t_flatcode` VALUES ('955', 'dm_zwfl', '职位分类码', '12', null, '办事员级');
INSERT INTO `t_flatcode` VALUES ('956', 'dm_gzjb', '工资级别代码', '01', null, '一级');
INSERT INTO `t_flatcode` VALUES ('957', 'dm_gzjb', '工资级别代码', '02', null, '二级');
INSERT INTO `t_flatcode` VALUES ('958', 'dm_gzjb', '工资级别代码', '03', null, '三级');
INSERT INTO `t_flatcode` VALUES ('959', 'dm_gzjb', '工资级别代码', '04', null, '四级');
INSERT INTO `t_flatcode` VALUES ('960', 'dm_gzjb', '工资级别代码', '05', null, '五级');
INSERT INTO `t_flatcode` VALUES ('961', 'dm_gzjb', '工资级别代码', '06', null, '六级');
INSERT INTO `t_flatcode` VALUES ('962', 'dm_gzjb', '工资级别代码', '07', null, '七级');
INSERT INTO `t_flatcode` VALUES ('963', 'dm_gzjb', '工资级别代码', '08', null, '八级');
INSERT INTO `t_flatcode` VALUES ('964', 'dm_gzjb', '工资级别代码', '09', null, '九级');
INSERT INTO `t_flatcode` VALUES ('965', 'dm_gzjb', '工资级别代码', '10', null, '十级');
INSERT INTO `t_flatcode` VALUES ('966', 'dm_gzjb', '工资级别代码', '11', null, '十一级');
INSERT INTO `t_flatcode` VALUES ('967', 'dm_gzjb', '工资级别代码', '12', null, '十二级');
INSERT INTO `t_flatcode` VALUES ('968', 'dm_gzjb', '工资级别代码', '13', null, '十三级');
INSERT INTO `t_flatcode` VALUES ('969', 'dm_gzjb', '工资级别代码', '14', null, '十四级');
INSERT INTO `t_flatcode` VALUES ('970', 'dm_gzjb', '工资级别代码', '15', null, '十五级');
INSERT INTO `t_flatcode` VALUES ('971', 'gb_xb', '性别码2261', '1', null, '男');
INSERT INTO `t_flatcode` VALUES ('972', 'gb_xb', '性别码2261', '2', null, '女');
INSERT INTO `t_flatcode` VALUES ('973', 'gb_csd', '出生地码226', '0', null, '测试数据--贵港');
INSERT INTO `t_flatcode` VALUES ('974', 'gb_csd', '出生地码226', '1', null, '测试数据--覃塘');
INSERT INTO `t_flatcode` VALUES ('975', 'gb_csd', '出生地码226', '2', null, '测试数据--蒙公');
INSERT INTO `t_flatcode` VALUES ('976', 'dm_xx', '血型码', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('977', 'dm_xx', '血型码', '0', null, '未知血型');
INSERT INTO `t_flatcode` VALUES ('978', 'dm_xx', '血型码', '1', null, 'A型');
INSERT INTO `t_flatcode` VALUES ('979', 'dm_xx', '血型码', '2', null, 'B型');
INSERT INTO `t_flatcode` VALUES ('980', 'dm_xx', '血型码', '3', null, 'AB型');
INSERT INTO `t_flatcode` VALUES ('981', 'dm_xx', '血型码', '4', null, 'O型');
INSERT INTO `t_flatcode` VALUES ('982', 'dm_xx', '血型码', '5', null, '其他血型');
INSERT INTO `t_flatcode` VALUES ('983', 'dm_xx', '血型码', '9', null, '未定血型');
INSERT INTO `t_flatcode` VALUES ('984', 'gb_jg', '籍贯码2260', '0', null, '测试数据--贵港');
INSERT INTO `t_flatcode` VALUES ('985', 'gb_jg', '籍贯码2260', '1', null, '测试数据--覃塘');
INSERT INTO `t_flatcode` VALUES ('986', 'gb_jg', '籍贯码2260', '2', null, '测试数据--蒙公');
INSERT INTO `t_flatcode` VALUES ('987', 'gb_mz', '民族码3304', '01', null, '汉族');
INSERT INTO `t_flatcode` VALUES ('988', 'gb_mz', '民族码3304', '08', null, '壮族');
INSERT INTO `t_flatcode` VALUES ('989', 'gb_mz', '民族码3304', '02', null, '蒙古族');
INSERT INTO `t_flatcode` VALUES ('990', 'gb_mz', '民族码3304', '03', null, '回族');
INSERT INTO `t_flatcode` VALUES ('991', 'gb_mz', '民族码3304', '04', null, '藏族');
INSERT INTO `t_flatcode` VALUES ('992', 'gb_mz', '民族码3304', '05', null, '维吾尔族');
INSERT INTO `t_flatcode` VALUES ('993', 'gb_mz', '民族码3304', '06', null, '苗族');
INSERT INTO `t_flatcode` VALUES ('994', 'gb_mz', '民族码3304', '07', null, '彝族');
INSERT INTO `t_flatcode` VALUES ('995', 'gb_mz', '民族码3304', '09', null, '布依族');
INSERT INTO `t_flatcode` VALUES ('996', 'gb_mz', '民族码3304', '10', null, '朝鲜族');
INSERT INTO `t_flatcode` VALUES ('997', 'gb_mz', '民族码3304', '11', null, '满族');
INSERT INTO `t_flatcode` VALUES ('998', 'gb_mz', '民族码3304', '12', null, '侗族');
INSERT INTO `t_flatcode` VALUES ('999', 'gb_mz', '民族码3304', '13', null, '瑶族');
INSERT INTO `t_flatcode` VALUES ('1000', 'gb_mz', '民族码3304', '14', null, '白族');
INSERT INTO `t_flatcode` VALUES ('1001', 'gb_mz', '民族码3304', '15', null, '土家族');
INSERT INTO `t_flatcode` VALUES ('1002', 'gb_mz', '民族码3304', '16', null, '哈尼族');
INSERT INTO `t_flatcode` VALUES ('1003', 'gb_mz', '民族码3304', '17', null, '哈萨克族');
INSERT INTO `t_flatcode` VALUES ('1004', 'gb_mz', '民族码3304', '18', null, '傣族');
INSERT INTO `t_flatcode` VALUES ('1005', 'gb_mz', '民族码3304', '19', null, '黎族');
INSERT INTO `t_flatcode` VALUES ('1006', 'gb_mz', '民族码3304', '20', null, '傈僳族');
INSERT INTO `t_flatcode` VALUES ('1007', 'gb_mz', '民族码3304', '21', null, '佤族');
INSERT INTO `t_flatcode` VALUES ('1008', 'gb_mz', '民族码3304', '22', null, '畲族');
INSERT INTO `t_flatcode` VALUES ('1009', 'gb_mz', '民族码3304', '23', null, '高山族');
INSERT INTO `t_flatcode` VALUES ('1010', 'gb_mz', '民族码3304', '24', null, '拉祜族');
INSERT INTO `t_flatcode` VALUES ('1011', 'gb_mz', '民族码3304', '25', null, '水族');
INSERT INTO `t_flatcode` VALUES ('1012', 'gb_mz', '民族码3304', '26', null, '东乡族');
INSERT INTO `t_flatcode` VALUES ('1013', 'gb_mz', '民族码3304', '27', null, '纳西族');
INSERT INTO `t_flatcode` VALUES ('1014', 'gb_mz', '民族码3304', '28', null, '景颇族');
INSERT INTO `t_flatcode` VALUES ('1015', 'gb_mz', '民族码3304', '29', null, '柯尔克孜族');
INSERT INTO `t_flatcode` VALUES ('1016', 'gb_mz', '民族码3304', '30', null, '土族');
INSERT INTO `t_flatcode` VALUES ('1017', 'gb_mz', '民族码3304', '31', null, '达斡尔族');
INSERT INTO `t_flatcode` VALUES ('1018', 'gb_mz', '民族码3304', '32', null, '仫佬族');
INSERT INTO `t_flatcode` VALUES ('1019', 'gb_mz', '民族码3304', '33', null, '羌族');
INSERT INTO `t_flatcode` VALUES ('1020', 'gb_mz', '民族码3304', '34', null, '布朗族');
INSERT INTO `t_flatcode` VALUES ('1021', 'gb_mz', '民族码3304', '35', null, '撒拉族');
INSERT INTO `t_flatcode` VALUES ('1022', 'gb_mz', '民族码3304', '36', null, '毛南族');
INSERT INTO `t_flatcode` VALUES ('1023', 'gb_mz', '民族码3304', '37', null, '仡佬族');
INSERT INTO `t_flatcode` VALUES ('1024', 'gb_mz', '民族码3304', '38', null, '锡伯族');
INSERT INTO `t_flatcode` VALUES ('1025', 'gb_mz', '民族码3304', '39', null, '阿昌族');
INSERT INTO `t_flatcode` VALUES ('1026', 'gb_mz', '民族码3304', '40', null, '普米族');
INSERT INTO `t_flatcode` VALUES ('1027', 'gb_mz', '民族码3304', '41', null, '塔吉克族');
INSERT INTO `t_flatcode` VALUES ('1028', 'gb_mz', '民族码3304', '42', null, '怒族');
INSERT INTO `t_flatcode` VALUES ('1029', 'gb_mz', '民族码3304', '43', null, '乌孜别克族');
INSERT INTO `t_flatcode` VALUES ('1030', 'gb_mz', '民族码3304', '44', null, '俄罗斯族');
INSERT INTO `t_flatcode` VALUES ('1031', 'gb_mz', '民族码3304', '45', null, '鄂温克族');
INSERT INTO `t_flatcode` VALUES ('1032', 'gb_mz', '民族码3304', '46', null, '德昂族');
INSERT INTO `t_flatcode` VALUES ('1033', 'gb_mz', '民族码3304', '47', null, '保安族');
INSERT INTO `t_flatcode` VALUES ('1034', 'gb_mz', '民族码3304', '48', null, '裕固族');
INSERT INTO `t_flatcode` VALUES ('1035', 'gb_mz', '民族码3304', '49', null, '京族');
INSERT INTO `t_flatcode` VALUES ('1036', 'gb_mz', '民族码3304', '50', null, '塔塔尔族');
INSERT INTO `t_flatcode` VALUES ('1037', 'gb_mz', '民族码3304', '51', null, '独龙族');
INSERT INTO `t_flatcode` VALUES ('1038', 'gb_mz', '民族码3304', '52', null, '鄂伦春族');
INSERT INTO `t_flatcode` VALUES ('1039', 'gb_mz', '民族码3304', '53', null, '赫哲族');
INSERT INTO `t_flatcode` VALUES ('1040', 'gb_mz', '民族码3304', '54', null, '门巴族');
INSERT INTO `t_flatcode` VALUES ('1041', 'gb_mz', '民族码3304', '55', null, '珞巴族');
INSERT INTO `t_flatcode` VALUES ('1042', 'gb_mz', '民族码3304', '56', null, '基诺族');
INSERT INTO `t_flatcode` VALUES ('1043', 'dm_gatq', '港澳台侨码', '0', null, '无');
INSERT INTO `t_flatcode` VALUES ('1044', 'dm_gatq', '港澳台侨码', '1', null, '归侨');
INSERT INTO `t_flatcode` VALUES ('1045', 'dm_gatq', '港澳台侨码', '2', null, '华侨');
INSERT INTO `t_flatcode` VALUES ('1046', 'dm_gatq', '港澳台侨码', '3', null, '侨眷');
INSERT INTO `t_flatcode` VALUES ('1047', 'dm_gatq', '港澳台侨码', '4', null, '港澳');
INSERT INTO `t_flatcode` VALUES ('1048', 'dm_gatq', '港澳台侨码', '5', null, '台胞');
INSERT INTO `t_flatcode` VALUES ('1049', 'dm_gatq', '港澳台侨码', '6', null, '外籍华人');
INSERT INTO `t_flatcode` VALUES ('1050', 'dm_gatq', '港澳台侨码', '7', null, '华籍外人');
INSERT INTO `t_flatcode` VALUES ('1051', 'dm_gatq', '港澳台侨码', '8', null, '非华裔外人');
INSERT INTO `t_flatcode` VALUES ('1052', 'dm_gatq', '港澳台侨码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1053', 'gb_jkzk', '健康状况码4767', '10', null, '健康');
INSERT INTO `t_flatcode` VALUES ('1054', 'gb_jkzk', '健康状况码4767', '11', null, '良好');
INSERT INTO `t_flatcode` VALUES ('1055', 'gb_jkzk', '健康状况码4767', '20', null, '一般或较弱');
INSERT INTO `t_flatcode` VALUES ('1056', 'gb_jkzk', '健康状况码4767', '30', null, '有慢性病');
INSERT INTO `t_flatcode` VALUES ('1057', 'gb_jkzk', '健康状况码4767', '31', null, '心血管病');
INSERT INTO `t_flatcode` VALUES ('1058', 'gb_jkzk', '健康状况码4767', '32', null, '脑血管病');
INSERT INTO `t_flatcode` VALUES ('1059', 'gb_jkzk', '健康状况码4767', '33', null, '慢性呼吸系统病');
INSERT INTO `t_flatcode` VALUES ('1060', 'gb_jkzk', '健康状况码4767', '34', null, '慢性消化系统病（包括溃疡、肝炎及肝硬化）');
INSERT INTO `t_flatcode` VALUES ('1061', 'gb_jkzk', '健康状况码4767', '35', null, '慢性肾炎');
INSERT INTO `t_flatcode` VALUES ('1062', 'gb_jkzk', '健康状况码4767', '36', null, '结核病');
INSERT INTO `t_flatcode` VALUES ('1063', 'gb_jkzk', '健康状况码4767', '37', null, '糖尿病');
INSERT INTO `t_flatcode` VALUES ('1064', 'gb_jkzk', '健康状况码4767', '38', null, '神经或精神疾病');
INSERT INTO `t_flatcode` VALUES ('1065', 'gb_jkzk', '健康状况码4767', '39', null, '其他慢性病');
INSERT INTO `t_flatcode` VALUES ('1066', 'gb_jkzk', '健康状况码4767', '40', null, '有生理缺陷');
INSERT INTO `t_flatcode` VALUES ('1067', 'gb_jkzk', '健康状况码4767', '41', null, '聋哑');
INSERT INTO `t_flatcode` VALUES ('1068', 'gb_jkzk', '健康状况码4767', '42', null, '盲人');
INSERT INTO `t_flatcode` VALUES ('1069', 'gb_jkzk', '健康状况码4767', '43', null, '高度近视');
INSERT INTO `t_flatcode` VALUES ('1070', 'gb_jkzk', '健康状况码4767', '49', null, '其他缺陷');
INSERT INTO `t_flatcode` VALUES ('1071', 'gb_jkzk', '健康状况码4767', '50', null, '残废');
INSERT INTO `t_flatcode` VALUES ('1072', 'gb_jkzk', '健康状况码4767', '51', null, '特等残废');
INSERT INTO `t_flatcode` VALUES ('1073', 'gb_jkzk', '健康状况码4767', '52', null, '一等残废');
INSERT INTO `t_flatcode` VALUES ('1074', 'gb_jkzk', '健康状况码4767', '53', null, '二等甲级残废');
INSERT INTO `t_flatcode` VALUES ('1075', 'gb_jkzk', '健康状况码4767', '54', null, '二等乙级残废');
INSERT INTO `t_flatcode` VALUES ('1076', 'gb_jkzk', '健康状况码4767', '55', null, '三等甲级残废');
INSERT INTO `t_flatcode` VALUES ('1077', 'gb_jkzk', '健康状况码4767', '56', null, '三等乙级残废');
INSERT INTO `t_flatcode` VALUES ('1078', 'gb_jkzk', '健康状况码4767', '59', null, '其他残废');
INSERT INTO `t_flatcode` VALUES ('1079', 'gb_zzmm', '政治面貌码4762', '01', null, '中国共产党党员');
INSERT INTO `t_flatcode` VALUES ('1080', 'gb_zzmm', '政治面貌码4762', '02', null, '中国共产党预备党员');
INSERT INTO `t_flatcode` VALUES ('1081', 'gb_zzmm', '政治面貌码4762', '03', null, '中国共产主义青年团团员');
INSERT INTO `t_flatcode` VALUES ('1082', 'gb_zzmm', '政治面貌码4762', '04', null, '中国国民党革命委员会会员');
INSERT INTO `t_flatcode` VALUES ('1083', 'gb_zzmm', '政治面貌码4762', '05', null, '中国民主同盟盟员');
INSERT INTO `t_flatcode` VALUES ('1084', 'gb_zzmm', '政治面貌码4762', '06', null, '中国民主建国会会员');
INSERT INTO `t_flatcode` VALUES ('1085', 'gb_zzmm', '政治面貌码4762', '07', null, '中国民主促进会会员');
INSERT INTO `t_flatcode` VALUES ('1086', 'gb_zzmm', '政治面貌码4762', '08', null, '中国农工民主党党员');
INSERT INTO `t_flatcode` VALUES ('1087', 'gb_zzmm', '政治面貌码4762', '09', null, '中国致公党党员');
INSERT INTO `t_flatcode` VALUES ('1088', 'gb_zzmm', '政治面貌码4762', '10', null, '九三学社社员');
INSERT INTO `t_flatcode` VALUES ('1089', 'gb_zzmm', '政治面貌码4762', '11', null, '台湾民主自治同盟盟员');
INSERT INTO `t_flatcode` VALUES ('1090', 'gb_zzmm', '政治面貌码4762', '12', null, '无党派民主人士');
INSERT INTO `t_flatcode` VALUES ('1091', 'gb_zzmm', '政治面貌码4762', '13', null, '群众');
INSERT INTO `t_flatcode` VALUES ('1092', 'gb_zzmm', '政治面貌码4762', 'AB', null, '少先队员');
INSERT INTO `t_flatcode` VALUES ('1093', 'gb_zzmm', '政治面貌码4762', '-', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1094', 'dm_hkxz', '户口性质码', '1', null, '农业户口');
INSERT INTO `t_flatcode` VALUES ('1095', 'dm_hkxz', '户口性质码', '2', null, '非农业户口');
INSERT INTO `t_flatcode` VALUES ('1096', 'gb_gb', '国别码2659', '156', null, '中国');
INSERT INTO `t_flatcode` VALUES ('1097', 'gb_gb', '国别码2659', '036', null, '澳大利亚');
INSERT INTO `t_flatcode` VALUES ('1098', 'gb_gb', '国别码2659', '076', null, '巴西');
INSERT INTO `t_flatcode` VALUES ('1099', 'gb_gb', '国别码2659', '124', null, '加拿大');
INSERT INTO `t_flatcode` VALUES ('1100', 'gb_gb', '国别码2659', '818', null, '埃及');
INSERT INTO `t_flatcode` VALUES ('1101', 'gb_gb', '国别码2659', '251', null, '法国');
INSERT INTO `t_flatcode` VALUES ('1102', 'gb_gb', '国别码2659', '276', null, '德国');
INSERT INTO `t_flatcode` VALUES ('1103', 'gb_gb', '国别码2659', '356', null, '印度');
INSERT INTO `t_flatcode` VALUES ('1104', 'gb_gb', '国别码2659', '392', null, '日本');
INSERT INTO `t_flatcode` VALUES ('1105', 'gb_gb', '国别码2659', '410', null, '韩国');
INSERT INTO `t_flatcode` VALUES ('1106', 'gb_gb', '国别码2659', '458', null, '马来西亚');
INSERT INTO `t_flatcode` VALUES ('1107', 'gb_gb', '国别码2659', '484', null, '墨西哥');
INSERT INTO `t_flatcode` VALUES ('1108', 'gb_gb', '国别码2659', '826', null, '英国');
INSERT INTO `t_flatcode` VALUES ('1109', 'gb_gb', '国别码2659', '840', null, '美国');
INSERT INTO `t_flatcode` VALUES ('1110', 'gb_gb', '国别码2659', '-', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1111', 'gb_gx', '关系码4761', '1', null, '配偶');
INSERT INTO `t_flatcode` VALUES ('1112', 'gb_gx', '关系码4761', '2', null, '子');
INSERT INTO `t_flatcode` VALUES ('1113', 'gb_gx', '关系码4761', '3', null, '女');
INSERT INTO `t_flatcode` VALUES ('1114', 'gb_gx', '关系码4761', '4', null, '孙子、孙女或外孙子、外孙女');
INSERT INTO `t_flatcode` VALUES ('1115', 'gb_gx', '关系码4761', '5', null, '父母');
INSERT INTO `t_flatcode` VALUES ('1116', 'gb_gx', '关系码4761', '6', null, '祖父母或外祖父母');
INSERT INTO `t_flatcode` VALUES ('1117', 'gb_gx', '关系码4761', '7', null, '兄、弟、姐、妹');
INSERT INTO `t_flatcode` VALUES ('1118', 'gb_gx', '关系码4761', '8', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1119', 'gb_zy', '职业码6565', '0', null, '国家机关、党群组织、企业、事业单位负责人');
INSERT INTO `t_flatcode` VALUES ('1120', 'gb_zy', '职业码6565', '01', null, '中国共产党中央委员会和地方各级组织负责人');
INSERT INTO `t_flatcode` VALUES ('1121', 'gb_zy', '职业码6565', '02', null, '国家机关及其工作机构负责人');
INSERT INTO `t_flatcode` VALUES ('1122', 'gb_zy', '职业码6565', '03', null, '民主党派和社会团体及其工作机构负责人');
INSERT INTO `t_flatcode` VALUES ('1123', 'gb_zy', '职业码6565', '04', null, '事业单位负责人');
INSERT INTO `t_flatcode` VALUES ('1124', 'gb_zy', '职业码6565', '05', null, '企业负责人');
INSERT INTO `t_flatcode` VALUES ('1125', 'gb_zy', '职业码6565', '1', null, '专业技术人员');
INSERT INTO `t_flatcode` VALUES ('1126', 'gb_zy', '职业码6565', '11', null, '科学研究人员');
INSERT INTO `t_flatcode` VALUES ('1127', 'gb_zy', '职业码6565', '13', null, '工程技术人员');
INSERT INTO `t_flatcode` VALUES ('1128', 'gb_zy', '职业码6565', '17', null, '农业技术人员');
INSERT INTO `t_flatcode` VALUES ('1129', 'gb_zy', '职业码6565', '18', null, '飞机和船舶技术人员');
INSERT INTO `t_flatcode` VALUES ('1130', 'gb_zy', '职业码6565', '19', null, '卫生专业技术人员');
INSERT INTO `t_flatcode` VALUES ('1131', 'gb_zy', '职业码6565', '191', null, '西医医师');
INSERT INTO `t_flatcode` VALUES ('1132', 'gb_zy', '职业码6565', '192', null, '中医医师');
INSERT INTO `t_flatcode` VALUES ('1133', 'gb_zy', '职业码6565', '193', null, '中西医结合医师');
INSERT INTO `t_flatcode` VALUES ('1134', 'gb_zy', '职业码6565', '198', null, '护理人员');
INSERT INTO `t_flatcode` VALUES ('1135', 'gb_zy', '职业码6565', '21', null, '经济业务人员');
INSERT INTO `t_flatcode` VALUES ('1136', 'gb_zy', '职业码6565', '31', null, '行政办公人员');
INSERT INTO `t_flatcode` VALUES ('1137', 'gb_zy', '职业码6565', '32', null, '安全保卫和消防人员');
INSERT INTO `t_flatcode` VALUES ('1138', 'gb_zy', '职业码6565', '33', null, '邮政和电信业务人员');
INSERT INTO `t_flatcode` VALUES ('1139', 'gb_zy', '职业码6565', '39', null, '其他办事人员和有关人员');
INSERT INTO `t_flatcode` VALUES ('1140', 'gb_zy', '职业码6565', '4', null, '商业、服务业人员');
INSERT INTO `t_flatcode` VALUES ('1141', 'gb_zy', '职业码6565', '41', null, '购销人员');
INSERT INTO `t_flatcode` VALUES ('1142', 'gb_zy', '职业码6565', '42', null, '仓储人员');
INSERT INTO `t_flatcode` VALUES ('1143', 'gb_zy', '职业码6565', '43', null, '餐饮服务人员');
INSERT INTO `t_flatcode` VALUES ('1144', 'gb_zy', '职业码6565', '44', null, '饭店、旅游及健身娱乐场所服务人员');
INSERT INTO `t_flatcode` VALUES ('1145', 'gb_zy', '职业码6565', '45', null, '运输服务人员');
INSERT INTO `t_flatcode` VALUES ('1146', 'gb_zy', '职业码6565', '46', null, '医疗卫生辅助服务人员');
INSERT INTO `t_flatcode` VALUES ('1147', 'gb_zy', '职业码6565', '47', null, '社会服务和居民生活服务人员');
INSERT INTO `t_flatcode` VALUES ('1148', 'gb_zy', '职业码6565', '49', null, '其他商业、服务业人员');
INSERT INTO `t_flatcode` VALUES ('1149', 'gb_zy', '职业码6565', '5', null, '农、林、牧、渔、水利业生产人员');
INSERT INTO `t_flatcode` VALUES ('1150', 'gb_zy', '职业码6565', '51', null, '种植业生产人员');
INSERT INTO `t_flatcode` VALUES ('1151', 'gb_zy', '职业码6565', '52', null, '林业生产及野生动植物保护人员');
INSERT INTO `t_flatcode` VALUES ('1152', 'gb_zy', '职业码6565', '53', null, '畜牧业生产人员');
INSERT INTO `t_flatcode` VALUES ('1153', 'gb_zy', '职业码6565', '54', null, '渔业生产人员');
INSERT INTO `t_flatcode` VALUES ('1154', 'gb_zy', '职业码6565', '55', null, '水利设备管理养护人员');
INSERT INTO `t_flatcode` VALUES ('1155', 'gb_zy', '职业码6565', '59', null, '其他农、林、牧、鱼、水利业生产人员');
INSERT INTO `t_flatcode` VALUES ('1156', 'gb_zy', '职业码6565', '6', null, '生产、运输设备操作人员及有关人员');
INSERT INTO `t_flatcode` VALUES ('1157', 'gb_zy', '职业码6565', '61', null, '勘测及矿物开采人员');
INSERT INTO `t_flatcode` VALUES ('1158', 'gb_zy', '职业码6565', '62', null, '金属冶炼、轧制人员');
INSERT INTO `t_flatcode` VALUES ('1159', 'gb_zy', '职业码6565', '64', null, '化工产品生产人员');
INSERT INTO `t_flatcode` VALUES ('1160', 'gb_zy', '职业码6565', '66', null, '机械制造加工人员');
INSERT INTO `t_flatcode` VALUES ('1161', 'gb_zy', '职业码6565', '67', null, '机电产品装配人员');
INSERT INTO `t_flatcode` VALUES ('1162', 'gb_zy', '职业码6565', '71', null, '机械设备修理人员');
INSERT INTO `t_flatcode` VALUES ('1163', 'gb_zy', '职业码6565', '72', null, '电力设备安装、运行、检修及供电人员');
INSERT INTO `t_flatcode` VALUES ('1164', 'gb_zy', '职业码6565', '73', null, '电子元器件与设备制造、装配、调试用维修人员');
INSERT INTO `t_flatcode` VALUES ('1165', 'gb_zy', '职业码6565', '74', null, '橡胶和塑料制品生产人员');
INSERT INTO `t_flatcode` VALUES ('1166', 'gb_zy', '职业码6565', '75', null, '纺织、针织、印染人员');
INSERT INTO `t_flatcode` VALUES ('1167', 'gb_zy', '职业码6565', '76', null, '裁剪、缝纫和皮革、毛皮制品加工制作人员');
INSERT INTO `t_flatcode` VALUES ('1168', 'gb_zy', '职业码6565', '77', null, '粮油、食品、饮料生产加工及饮料生产加工人员');
INSERT INTO `t_flatcode` VALUES ('1169', 'gb_zy', '职业码6565', '78', null, '烟草及其制品加工人员');
INSERT INTO `t_flatcode` VALUES ('1170', 'gb_zy', '职业码6565', '79', null, '药品生产人员');
INSERT INTO `t_flatcode` VALUES ('1171', 'gb_zy', '职业码6565', '81', null, '木材加工、人造板生产、木制品品制作及制浆、造纸和纸制品生产加工人员');
INSERT INTO `t_flatcode` VALUES ('1172', 'gb_zy', '职业码6565', '82', null, '建筑材料生产加工人员');
INSERT INTO `t_flatcode` VALUES ('1173', 'gb_zy', '职业码6565', '83', null, '玻璃、陶瓷、搪瓷及其制品生产加工人员');
INSERT INTO `t_flatcode` VALUES ('1174', 'gb_zy', '职业码6565', '84', null, '广播影视制品制作、播放及文物保护作业人员');
INSERT INTO `t_flatcode` VALUES ('1175', 'gb_zy', '职业码6565', '85', null, '印刷人员');
INSERT INTO `t_flatcode` VALUES ('1176', 'gb_zy', '职业码6565', '86', null, '工艺、美术品制作人员');
INSERT INTO `t_flatcode` VALUES ('1177', 'gb_zy', '职业码6565', '87', null, '文化教育、体育用品制作人员');
INSERT INTO `t_flatcode` VALUES ('1178', 'gb_zy', '职业码6565', '88', null, '工程施工人员');
INSERT INTO `t_flatcode` VALUES ('1179', 'gb_zy', '职业码6565', '91', null, '运输设备操作人员及有关人员');
INSERT INTO `t_flatcode` VALUES ('1180', 'gb_zy', '职业码6565', '92', null, '环境监测及废物处理人员');
INSERT INTO `t_flatcode` VALUES ('1181', 'gb_zy', '职业码6565', '93', null, '检验、计量人员');
INSERT INTO `t_flatcode` VALUES ('1182', 'gb_zy', '职业码6565', '99', null, '其他生产、运输设备操作人员及有关人员');
INSERT INTO `t_flatcode` VALUES ('1183', 'gb_zy', '职业码6565', 'x', null, '军人');
INSERT INTO `t_flatcode` VALUES ('1184', 'gb_zy', '职业码6565', 'y', null, '不便分类的其他从业人员');
INSERT INTO `t_flatcode` VALUES ('1185', 'gb_zyjszw', '专业技术职务码8561', '01', null, '高等学校教师');
INSERT INTO `t_flatcode` VALUES ('1186', 'gb_zyjszw', '专业技术职务码8561', '02', null, '中等专业学校教师');
INSERT INTO `t_flatcode` VALUES ('1187', 'gb_zyjszw', '专业技术职务码8561', '010', null, '高等学校教师');
INSERT INTO `t_flatcode` VALUES ('1188', 'gb_zyjszw', '专业技术职务码8561', '011', null, '教授');
INSERT INTO `t_flatcode` VALUES ('1189', 'gb_zyjszw', '专业技术职务码8561', '012', null, '副教授');
INSERT INTO `t_flatcode` VALUES ('1190', 'gb_zyjszw', '专业技术职务码8561', '013', null, '讲师(高校)');
INSERT INTO `t_flatcode` VALUES ('1191', 'gb_zyjszw', '专业技术职务码8561', '014', null, '助教(高校)');
INSERT INTO `t_flatcode` VALUES ('1192', 'gb_zyjszw', '专业技术职务码8561', '020', null, '中等专业学校教师');
INSERT INTO `t_flatcode` VALUES ('1193', 'gb_zyjszw', '专业技术职务码8561', '022', null, '高级讲师(中专)');
INSERT INTO `t_flatcode` VALUES ('1194', 'gb_zyjszw', '专业技术职务码8561', '023', null, '讲师(中专)');
INSERT INTO `t_flatcode` VALUES ('1195', 'gb_zyjszw', '专业技术职务码8561', '024', null, '助理讲师(中专)');
INSERT INTO `t_flatcode` VALUES ('1196', 'gb_zyjszw', '专业技术职务码8561', '025', null, '教员(中专)');
INSERT INTO `t_flatcode` VALUES ('1197', 'gb_zyjszw', '专业技术职务码8561', '030', null, '技工学校教师');
INSERT INTO `t_flatcode` VALUES ('1198', 'gb_zyjszw', '专业技术职务码8561', '032', null, '高级讲师(技校)');
INSERT INTO `t_flatcode` VALUES ('1199', 'gb_zyjszw', '专业技术职务码8561', '033', null, '讲师(技校)');
INSERT INTO `t_flatcode` VALUES ('1200', 'gb_zyjszw', '专业技术职务码8561', '034', null, '助理讲师(技校)');
INSERT INTO `t_flatcode` VALUES ('1201', 'gb_zyjszw', '专业技术职务码8561', '035', null, '教员(技校)');
INSERT INTO `t_flatcode` VALUES ('1202', 'gb_zyjszw', '专业技术职务码8561', '040', null, '技工学校教师（实习指导）');
INSERT INTO `t_flatcode` VALUES ('1203', 'gb_zyjszw', '专业技术职务码8561', '042', null, '高级实习指导教师');
INSERT INTO `t_flatcode` VALUES ('1204', 'gb_zyjszw', '专业技术职务码8561', '043', null, '一级实习指导教师');
INSERT INTO `t_flatcode` VALUES ('1205', 'gb_zyjszw', '专业技术职务码8561', '044', null, '二级实习指导教师');
INSERT INTO `t_flatcode` VALUES ('1206', 'gb_zyjszw', '专业技术职务码8561', '045', null, '三级实习指导教师');
INSERT INTO `t_flatcode` VALUES ('1207', 'gb_zyjszw', '专业技术职务码8561', '050', null, '中学教师');
INSERT INTO `t_flatcode` VALUES ('1208', 'gb_zyjszw', '专业技术职务码8561', '052', null, '高级教师（中学）');
INSERT INTO `t_flatcode` VALUES ('1209', 'gb_zyjszw', '专业技术职务码8561', '053', null, '一级教师（中学）');
INSERT INTO `t_flatcode` VALUES ('1210', 'gb_zyjszw', '专业技术职务码8561', '054', null, '二级教师（中学）');
INSERT INTO `t_flatcode` VALUES ('1211', 'gb_zyjszw', '专业技术职务码8561', '055', null, '三级教师（中学）');
INSERT INTO `t_flatcode` VALUES ('1212', 'gb_zyjszw', '专业技术职务码8561', '070', null, '实验技术人员');
INSERT INTO `t_flatcode` VALUES ('1213', 'gb_zyjszw', '专业技术职务码8561', '072', null, '高级实验师');
INSERT INTO `t_flatcode` VALUES ('1214', 'gb_zyjszw', '专业技术职务码8561', '073', null, '实验师');
INSERT INTO `t_flatcode` VALUES ('1215', 'gb_zyjszw', '专业技术职务码8561', '074', null, '助理实验师');
INSERT INTO `t_flatcode` VALUES ('1216', 'gb_zyjszw', '专业技术职务码8561', '075', null, '实验员');
INSERT INTO `t_flatcode` VALUES ('1217', 'gb_zyjszw', '专业技术职务码8561', '080', null, '工程技术人员');
INSERT INTO `t_flatcode` VALUES ('1218', 'gb_zyjszw', '专业技术职务码8561', '082', null, '高级工程师');
INSERT INTO `t_flatcode` VALUES ('1219', 'gb_zyjszw', '专业技术职务码8561', '083', null, '工程师');
INSERT INTO `t_flatcode` VALUES ('1220', 'gb_zyjszw', '专业技术职务码8561', '084', null, '助理工程师');
INSERT INTO `t_flatcode` VALUES ('1221', 'gb_zyjszw', '专业技术职务码8561', '085', null, '技术员');
INSERT INTO `t_flatcode` VALUES ('1222', 'gb_zyjszw', '专业技术职务码8561', '090', null, '农业技术人员（农艺）');
INSERT INTO `t_flatcode` VALUES ('1223', 'gb_zyjszw', '专业技术职务码8561', '091', null, '农业技术推广研究员（农艺）');
INSERT INTO `t_flatcode` VALUES ('1224', 'gb_zyjszw', '专业技术职务码8561', '092', null, '农高级农艺师');
INSERT INTO `t_flatcode` VALUES ('1225', 'gb_zyjszw', '专业技术职务码8561', '093', null, '农艺师）');
INSERT INTO `t_flatcode` VALUES ('1226', 'gb_zyjszw', '专业技术职务码8561', '094', null, '助理农艺师');
INSERT INTO `t_flatcode` VALUES ('1227', 'gb_zyjszw', '专业技术职务码8561', '095', null, '农业技术人员（农艺）');
INSERT INTO `t_flatcode` VALUES ('1228', 'gb_zyjszw', '专业技术职务码8561', '100', null, '农业技术人员（兽医）');
INSERT INTO `t_flatcode` VALUES ('1229', 'gb_zyjszw', '专业技术职务码8561', '101', null, '农业技术推广研究员（兽医）');
INSERT INTO `t_flatcode` VALUES ('1230', 'gb_zyjszw', '专业技术职务码8561', '102', null, '高级兽医师');
INSERT INTO `t_flatcode` VALUES ('1231', 'gb_zyjszw', '专业技术职务码8561', '103', null, '兽医师');
INSERT INTO `t_flatcode` VALUES ('1232', 'gb_zyjszw', '专业技术职务码8561', '104', null, '助理兽医师');
INSERT INTO `t_flatcode` VALUES ('1233', 'gb_zyjszw', '专业技术职务码8561', '105', null, '兽医技术员');
INSERT INTO `t_flatcode` VALUES ('1234', 'gb_zyjszw', '专业技术职务码8561', '110', null, '农业技术人员（畜牧）');
INSERT INTO `t_flatcode` VALUES ('1235', 'gb_zyjszw', '专业技术职务码8561', '111', null, '农业技术推广研究员（畜牧）');
INSERT INTO `t_flatcode` VALUES ('1236', 'gb_zyjszw', '专业技术职务码8561', '112', null, '高级畜牧师');
INSERT INTO `t_flatcode` VALUES ('1237', 'gb_zyjszw', '专业技术职务码8561', '113', null, '畜牧师');
INSERT INTO `t_flatcode` VALUES ('1238', 'gb_zyjszw', '专业技术职务码8561', '114', null, '助理畜牧师');
INSERT INTO `t_flatcode` VALUES ('1239', 'gb_zyjszw', '专业技术职务码8561', '115', null, '畜牧技术人员');
INSERT INTO `t_flatcode` VALUES ('1240', 'gb_zyjszw', '专业技术职务码8561', '120', null, '经济专业人员');
INSERT INTO `t_flatcode` VALUES ('1241', 'gb_zyjszw', '专业技术职务码8561', '122', null, '高级经济师');
INSERT INTO `t_flatcode` VALUES ('1242', 'gb_zyjszw', '专业技术职务码8561', '123', null, '经济师');
INSERT INTO `t_flatcode` VALUES ('1243', 'gb_zyjszw', '专业技术职务码8561', '124', null, '助理经济师');
INSERT INTO `t_flatcode` VALUES ('1244', 'gb_zyjszw', '专业技术职务码8561', '125', null, '经济员');
INSERT INTO `t_flatcode` VALUES ('1245', 'gb_zyjszw', '专业技术职务码8561', '130', null, '会计专业人员');
INSERT INTO `t_flatcode` VALUES ('1246', 'gb_zyjszw', '专业技术职务码8561', '132', null, '高级会计师');
INSERT INTO `t_flatcode` VALUES ('1247', 'gb_zyjszw', '专业技术职务码8561', '133', null, '会计师');
INSERT INTO `t_flatcode` VALUES ('1248', 'gb_zyjszw', '专业技术职务码8561', '134', null, '助理会计师');
INSERT INTO `t_flatcode` VALUES ('1249', 'gb_zyjszw', '专业技术职务码8561', '135', null, '会计员');
INSERT INTO `t_flatcode` VALUES ('1250', 'gb_zyjszw', '专业技术职务码8561', '140', null, '统计专业人员');
INSERT INTO `t_flatcode` VALUES ('1251', 'gb_zyjszw', '专业技术职务码8561', '142', null, '高级统计师');
INSERT INTO `t_flatcode` VALUES ('1252', 'gb_zyjszw', '专业技术职务码8561', '143', null, '统计师');
INSERT INTO `t_flatcode` VALUES ('1253', 'gb_zyjszw', '专业技术职务码8561', '144', null, '助理统计师');
INSERT INTO `t_flatcode` VALUES ('1254', 'gb_zyjszw', '专业技术职务码8561', '145', null, '统计员');
INSERT INTO `t_flatcode` VALUES ('1255', 'gb_zyjszw', '专业技术职务码8561', '150', null, '出版专业人员（编审）');
INSERT INTO `t_flatcode` VALUES ('1256', 'gb_zyjszw', '专业技术职务码8561', '151', null, '编审');
INSERT INTO `t_flatcode` VALUES ('1257', 'gb_zyjszw', '专业技术职务码8561', '152', null, '副编审');
INSERT INTO `t_flatcode` VALUES ('1258', 'gb_zyjszw', '专业技术职务码8561', '153', null, '编辑');
INSERT INTO `t_flatcode` VALUES ('1259', 'gb_zyjszw', '专业技术职务码8561', '154', null, '助理编辑');
INSERT INTO `t_flatcode` VALUES ('1260', 'gb_zyjszw', '专业技术职务码8561', '160', null, '出版专业人员（技术编辑）');
INSERT INTO `t_flatcode` VALUES ('1261', 'gb_zyjszw', '专业技术职务码8561', '163', null, '技术编辑');
INSERT INTO `t_flatcode` VALUES ('1262', 'gb_zyjszw', '专业技术职务码8561', '164', null, '助理技术编辑');
INSERT INTO `t_flatcode` VALUES ('1263', 'gb_zyjszw', '专业技术职务码8561', '165', null, '技术设计员');
INSERT INTO `t_flatcode` VALUES ('1264', 'gb_zyjszw', '专业技术职务码8561', '170', null, '出版专业人员（校对）');
INSERT INTO `t_flatcode` VALUES ('1265', 'gb_zyjszw', '专业技术职务码8561', '173', null, '一级校对');
INSERT INTO `t_flatcode` VALUES ('1266', 'gb_zyjszw', '专业技术职务码8561', '174', null, '二级校对');
INSERT INTO `t_flatcode` VALUES ('1267', 'gb_zyjszw', '专业技术职务码8561', '175', null, '三级校对');
INSERT INTO `t_flatcode` VALUES ('1268', 'gb_zyjszw', '专业技术职务码8561', '180', null, '翻译人员');
INSERT INTO `t_flatcode` VALUES ('1269', 'gb_zyjszw', '专业技术职务码8561', '181', null, '译审');
INSERT INTO `t_flatcode` VALUES ('1270', 'gb_zyjszw', '专业技术职务码8561', '182', null, '副译审');
INSERT INTO `t_flatcode` VALUES ('1271', 'gb_zyjszw', '专业技术职务码8561', '183', null, '翻译');
INSERT INTO `t_flatcode` VALUES ('1272', 'gb_zyjszw', '专业技术职务码8561', '184', null, '助理翻译');
INSERT INTO `t_flatcode` VALUES ('1273', 'gb_zyjszw', '专业技术职务码8561', '190', null, '新闻专业人员（记者）');
INSERT INTO `t_flatcode` VALUES ('1274', 'gb_zyjszw', '专业技术职务码8561', '191', null, '高级记者）');
INSERT INTO `t_flatcode` VALUES ('1275', 'gb_zyjszw', '专业技术职务码8561', '192', null, '主任记者');
INSERT INTO `t_flatcode` VALUES ('1276', 'gb_zyjszw', '专业技术职务码8561', '193', null, '记者');
INSERT INTO `t_flatcode` VALUES ('1277', 'gb_zyjszw', '专业技术职务码8561', '194', null, '助理记者');
INSERT INTO `t_flatcode` VALUES ('1278', 'gb_zyjszw', '专业技术职务码8561', '200', null, '新闻专业人员（编辑）');
INSERT INTO `t_flatcode` VALUES ('1279', 'gb_zyjszw', '专业技术职务码8561', '201', null, '高级编辑');
INSERT INTO `t_flatcode` VALUES ('1280', 'gb_zyjszw', '专业技术职务码8561', '202', null, '主任编辑）');
INSERT INTO `t_flatcode` VALUES ('1281', 'gb_zyjszw', '专业技术职务码8561', '203', null, '编辑');
INSERT INTO `t_flatcode` VALUES ('1282', 'gb_zyjszw', '专业技术职务码8561', '204', null, '助理编辑');
INSERT INTO `t_flatcode` VALUES ('1283', 'gb_zyjszw', '专业技术职务码8561', '220', null, '播音员');
INSERT INTO `t_flatcode` VALUES ('1284', 'gb_zyjszw', '专业技术职务码8561', '221', null, '播音指导');
INSERT INTO `t_flatcode` VALUES ('1285', 'gb_zyjszw', '专业技术职务码8561', '222', null, '主任播音员');
INSERT INTO `t_flatcode` VALUES ('1286', 'gb_zyjszw', '专业技术职务码8561', '223', null, '一级播音员');
INSERT INTO `t_flatcode` VALUES ('1287', 'gb_zyjszw', '专业技术职务码8561', '224', null, '二级播音员');
INSERT INTO `t_flatcode` VALUES ('1288', 'gb_zyjszw', '专业技术职务码8561', '225', null, '三级播音员');
INSERT INTO `t_flatcode` VALUES ('1289', 'gb_zyjszw', '专业技术职务码8561', '230', null, '卫生技术人员（医师）');
INSERT INTO `t_flatcode` VALUES ('1290', 'gb_zyjszw', '专业技术职务码8561', '231', null, '主任医师');
INSERT INTO `t_flatcode` VALUES ('1291', 'gb_zyjszw', '专业技术职务码8561', '232', null, '副主任医师');
INSERT INTO `t_flatcode` VALUES ('1292', 'gb_zyjszw', '专业技术职务码8561', '233', null, '主治医师');
INSERT INTO `t_flatcode` VALUES ('1293', 'gb_zyjszw', '专业技术职务码8561', '234', null, '医师');
INSERT INTO `t_flatcode` VALUES ('1294', 'gb_zyjszw', '专业技术职务码8561', '235', null, '医士');
INSERT INTO `t_flatcode` VALUES ('1295', 'gb_zyjszw', '专业技术职务码8561', '240', null, '卫生技术人员（药剂）');
INSERT INTO `t_flatcode` VALUES ('1296', 'gb_zyjszw', '专业技术职务码8561', '241', null, '主任药师');
INSERT INTO `t_flatcode` VALUES ('1297', 'gb_zyjszw', '专业技术职务码8561', '242', null, '副主任药师');
INSERT INTO `t_flatcode` VALUES ('1298', 'gb_zyjszw', '专业技术职务码8561', '243', null, '主管药师');
INSERT INTO `t_flatcode` VALUES ('1299', 'gb_zyjszw', '专业技术职务码8561', '244', null, '药师');
INSERT INTO `t_flatcode` VALUES ('1300', 'gb_zyjszw', '专业技术职务码8561', '245', null, '药士');
INSERT INTO `t_flatcode` VALUES ('1301', 'gb_zyjszw', '专业技术职务码8561', '250', null, '卫生技术人员（护理）');
INSERT INTO `t_flatcode` VALUES ('1302', 'gb_zyjszw', '专业技术职务码8561', '251', null, '主任护师');
INSERT INTO `t_flatcode` VALUES ('1303', 'gb_zyjszw', '专业技术职务码8561', '252', null, '副主任护师');
INSERT INTO `t_flatcode` VALUES ('1304', 'gb_zyjszw', '专业技术职务码8561', '253', null, '主管护师');
INSERT INTO `t_flatcode` VALUES ('1305', 'gb_zyjszw', '专业技术职务码8561', '254', null, '护师');
INSERT INTO `t_flatcode` VALUES ('1306', 'gb_zyjszw', '专业技术职务码8561', '255', null, '护士');
INSERT INTO `t_flatcode` VALUES ('1307', 'gb_zyjszw', '专业技术职务码8561', '260', null, '卫生技术人员（技师）');
INSERT INTO `t_flatcode` VALUES ('1308', 'gb_zyjszw', '专业技术职务码8561', '261', null, '主任技师');
INSERT INTO `t_flatcode` VALUES ('1309', 'gb_zyjszw', '专业技术职务码8561', '262', null, '副主任技师');
INSERT INTO `t_flatcode` VALUES ('1310', 'gb_zyjszw', '专业技术职务码8561', '263', null, '主管技师');
INSERT INTO `t_flatcode` VALUES ('1311', 'gb_zyjszw', '专业技术职务码8561', '264', null, '技师');
INSERT INTO `t_flatcode` VALUES ('1312', 'gb_zyjszw', '专业技术职务码8561', '265', null, '技士');
INSERT INTO `t_flatcode` VALUES ('1313', 'gb_zyjszw', '专业技术职务码8561', '270', null, '工艺美术人员');
INSERT INTO `t_flatcode` VALUES ('1314', 'gb_zyjszw', '专业技术职务码8561', '272', null, '高级工艺美术师');
INSERT INTO `t_flatcode` VALUES ('1315', 'gb_zyjszw', '专业技术职务码8561', '273', null, '工艺美术师');
INSERT INTO `t_flatcode` VALUES ('1316', 'gb_zyjszw', '专业技术职务码8561', '274', null, '助理工艺美术师');
INSERT INTO `t_flatcode` VALUES ('1317', 'gb_zyjszw', '专业技术职务码8561', '275', null, '工艺美术员');
INSERT INTO `t_flatcode` VALUES ('1318', 'gb_zyjszw', '专业技术职务码8561', '280', null, '艺术人员（演员）');
INSERT INTO `t_flatcode` VALUES ('1319', 'gb_zyjszw', '专业技术职务码8561', '281', null, '一级演员');
INSERT INTO `t_flatcode` VALUES ('1320', 'gb_zyjszw', '专业技术职务码8561', '282', null, '二级演员');
INSERT INTO `t_flatcode` VALUES ('1321', 'gb_zyjszw', '专业技术职务码8561', '283', null, '三级演员');
INSERT INTO `t_flatcode` VALUES ('1322', 'gb_zyjszw', '专业技术职务码8561', '284', null, '四级演员');
INSERT INTO `t_flatcode` VALUES ('1323', 'gb_zyjszw', '专业技术职务码8561', '290', null, '艺术人员（演奏员）');
INSERT INTO `t_flatcode` VALUES ('1324', 'gb_zyjszw', '专业技术职务码8561', '291', null, '一级演奏员');
INSERT INTO `t_flatcode` VALUES ('1325', 'gb_zyjszw', '专业技术职务码8561', '292', null, '二级演奏员');
INSERT INTO `t_flatcode` VALUES ('1326', 'gb_zyjszw', '专业技术职务码8561', '293', null, '三级演奏员');
INSERT INTO `t_flatcode` VALUES ('1327', 'gb_zyjszw', '专业技术职务码8561', '294', null, '四级演奏员');
INSERT INTO `t_flatcode` VALUES ('1328', 'gb_zyjszw', '专业技术职务码8561', '300', null, '艺术人员（编剧）');
INSERT INTO `t_flatcode` VALUES ('1329', 'gb_zyjszw', '专业技术职务码8561', '301', null, '一级编剧');
INSERT INTO `t_flatcode` VALUES ('1330', 'gb_zyjszw', '专业技术职务码8561', '302', null, '二级编剧');
INSERT INTO `t_flatcode` VALUES ('1331', 'gb_zyjszw', '专业技术职务码8561', '303', null, '三级编剧');
INSERT INTO `t_flatcode` VALUES ('1332', 'gb_zyjszw', '专业技术职务码8561', '304', null, '四级编剧');
INSERT INTO `t_flatcode` VALUES ('1333', 'gb_zyjszw', '专业技术职务码8561', '310', null, '艺术人员（导演）');
INSERT INTO `t_flatcode` VALUES ('1334', 'gb_zyjszw', '专业技术职务码8561', '311', null, '一级导演');
INSERT INTO `t_flatcode` VALUES ('1335', 'gb_zyjszw', '专业技术职务码8561', '312', null, '二级导演');
INSERT INTO `t_flatcode` VALUES ('1336', 'gb_zyjszw', '专业技术职务码8561', '313', null, '三级导演');
INSERT INTO `t_flatcode` VALUES ('1337', 'gb_zyjszw', '专业技术职务码8561', '314', null, '四级导演');
INSERT INTO `t_flatcode` VALUES ('1338', 'gb_zyjszw', '专业技术职务码8561', '320', null, '艺术人员（指挥）');
INSERT INTO `t_flatcode` VALUES ('1339', 'gb_zyjszw', '专业技术职务码8561', '321', null, '一级指挥');
INSERT INTO `t_flatcode` VALUES ('1340', 'gb_zyjszw', '专业技术职务码8561', '322', null, '二级指挥');
INSERT INTO `t_flatcode` VALUES ('1341', 'gb_zyjszw', '专业技术职务码8561', '323', null, '三级指挥');
INSERT INTO `t_flatcode` VALUES ('1342', 'gb_zyjszw', '专业技术职务码8561', '324', null, '四级指挥');
INSERT INTO `t_flatcode` VALUES ('1343', 'gb_zyjszw', '专业技术职务码8561', '330', null, '艺术人员（作曲）');
INSERT INTO `t_flatcode` VALUES ('1344', 'gb_zyjszw', '专业技术职务码8561', '331', null, '一级作曲');
INSERT INTO `t_flatcode` VALUES ('1345', 'gb_zyjszw', '专业技术职务码8561', '332', null, '二级作曲');
INSERT INTO `t_flatcode` VALUES ('1346', 'gb_zyjszw', '专业技术职务码8561', '333', null, '三级作曲');
INSERT INTO `t_flatcode` VALUES ('1347', 'gb_zyjszw', '专业技术职务码8561', '334', null, '四级作曲');
INSERT INTO `t_flatcode` VALUES ('1348', 'gb_zyjszw', '专业技术职务码8561', '340', null, '艺术人员（美术）');
INSERT INTO `t_flatcode` VALUES ('1349', 'gb_zyjszw', '专业技术职务码8561', '341', null, '一级美术');
INSERT INTO `t_flatcode` VALUES ('1350', 'gb_zyjszw', '专业技术职务码8561', '342', null, '二级美术');
INSERT INTO `t_flatcode` VALUES ('1351', 'gb_zyjszw', '专业技术职务码8561', '343', null, '三级美术');
INSERT INTO `t_flatcode` VALUES ('1352', 'gb_zyjszw', '专业技术职务码8561', '344', null, '美术员');
INSERT INTO `t_flatcode` VALUES ('1353', 'gb_zyjszw', '专业技术职务码8561', '350', null, '艺术人员（舞美设计）');
INSERT INTO `t_flatcode` VALUES ('1354', 'gb_zyjszw', '专业技术职务码8561', '351', null, '一级舞美设计');
INSERT INTO `t_flatcode` VALUES ('1355', 'gb_zyjszw', '专业技术职务码8561', '352', null, '二级舞美设计');
INSERT INTO `t_flatcode` VALUES ('1356', 'gb_zyjszw', '专业技术职务码8561', '353', null, '三级舞美设计');
INSERT INTO `t_flatcode` VALUES ('1357', 'gb_zyjszw', '专业技术职务码8561', '354', null, '舞美设计员');
INSERT INTO `t_flatcode` VALUES ('1358', 'gb_zyjszw', '专业技术职务码8561', '360', null, '艺术人员（舞台技术）');
INSERT INTO `t_flatcode` VALUES ('1359', 'gb_zyjszw', '专业技术职务码8561', '362', null, '主任舞台技师');
INSERT INTO `t_flatcode` VALUES ('1360', 'gb_zyjszw', '专业技术职务码8561', '363', null, '舞台技师');
INSERT INTO `t_flatcode` VALUES ('1361', 'gb_zyjszw', '专业技术职务码8561', '364', null, '舞台技术员');
INSERT INTO `t_flatcode` VALUES ('1362', 'gb_zyjszw', '专业技术职务码8561', '370', null, '体育锻炼');
INSERT INTO `t_flatcode` VALUES ('1363', 'gb_zyjszw', '专业技术职务码8561', '371', null, '国家级教练');
INSERT INTO `t_flatcode` VALUES ('1364', 'gb_zyjszw', '专业技术职务码8561', '372', null, '高级教练');
INSERT INTO `t_flatcode` VALUES ('1365', 'gb_zyjszw', '专业技术职务码8561', '373', null, '一级教练');
INSERT INTO `t_flatcode` VALUES ('1366', 'gb_zyjszw', '专业技术职务码8561', '374', null, '二级教练');
INSERT INTO `t_flatcode` VALUES ('1367', 'gb_zyjszw', '专业技术职务码8561', '375', null, '三级教练');
INSERT INTO `t_flatcode` VALUES ('1368', 'gb_zyjszw', '专业技术职务码8561', '390', null, '律师');
INSERT INTO `t_flatcode` VALUES ('1369', 'gb_zyjszw', '专业技术职务码8561', '391', null, '一级律师');
INSERT INTO `t_flatcode` VALUES ('1370', 'gb_zyjszw', '专业技术职务码8561', '392', null, '二级律师');
INSERT INTO `t_flatcode` VALUES ('1371', 'gb_zyjszw', '专业技术职务码8561', '393', null, '三级律师');
INSERT INTO `t_flatcode` VALUES ('1372', 'gb_zyjszw', '专业技术职务码8561', '394', null, '四级律师');
INSERT INTO `t_flatcode` VALUES ('1373', 'gb_zyjszw', '专业技术职务码8561', '395', null, '律师助理');
INSERT INTO `t_flatcode` VALUES ('1374', 'gb_zyjszw', '专业技术职务码8561', '400', null, '公证员');
INSERT INTO `t_flatcode` VALUES ('1375', 'gb_zyjszw', '专业技术职务码8561', '401', null, '一级公证员');
INSERT INTO `t_flatcode` VALUES ('1376', 'gb_zyjszw', '专业技术职务码8561', '402', null, '二级公证员');
INSERT INTO `t_flatcode` VALUES ('1377', 'gb_zyjszw', '专业技术职务码8561', '403', null, '三级公证员');
INSERT INTO `t_flatcode` VALUES ('1378', 'gb_zyjszw', '专业技术职务码8561', '404', null, '四级公证员');
INSERT INTO `t_flatcode` VALUES ('1379', 'gb_zyjszw', '专业技术职务码8561', '405', null, '公证助理员');
INSERT INTO `t_flatcode` VALUES ('1380', 'gb_zyjszw', '专业技术职务码8561', '410', null, '小学教师');
INSERT INTO `t_flatcode` VALUES ('1381', 'gb_zyjszw', '专业技术职务码8561', '413', null, '高级教师（小学）');
INSERT INTO `t_flatcode` VALUES ('1382', 'gb_zyjszw', '专业技术职务码8561', '414', null, '一级教师（小学）');
INSERT INTO `t_flatcode` VALUES ('1383', 'gb_zyjszw', '专业技术职务码8561', '415', null, '二级教师（小学）');
INSERT INTO `t_flatcode` VALUES ('1384', 'gb_zyjszw', '专业技术职务码8561', '416', null, '三级教师（小学）');
INSERT INTO `t_flatcode` VALUES ('1385', 'gb_zyjszw', '专业技术职务码8561', '420', null, '船舶技术人员（驾驶）');
INSERT INTO `t_flatcode` VALUES ('1386', 'gb_zyjszw', '专业技术职务码8561', '422', null, '高级船长');
INSERT INTO `t_flatcode` VALUES ('1387', 'gb_zyjszw', '专业技术职务码8561', '423', null, '船长（大副）');
INSERT INTO `t_flatcode` VALUES ('1388', 'gb_zyjszw', '专业技术职务码8561', '424', null, '二副');
INSERT INTO `t_flatcode` VALUES ('1389', 'gb_zyjszw', '专业技术职务码8561', '425', null, '三副');
INSERT INTO `t_flatcode` VALUES ('1390', 'gb_zyjszw', '专业技术职务码8561', '430', null, '船舶技术人员（轮机）');
INSERT INTO `t_flatcode` VALUES ('1391', 'gb_zyjszw', '专业技术职务码8561', '432', null, '高级轮机长');
INSERT INTO `t_flatcode` VALUES ('1392', 'gb_zyjszw', '专业技术职务码8561', '433', null, '轮机长（大管轮）');
INSERT INTO `t_flatcode` VALUES ('1393', 'gb_zyjszw', '专业技术职务码8561', '434', null, '二管轮');
INSERT INTO `t_flatcode` VALUES ('1394', 'gb_zyjszw', '专业技术职务码8561', '435', null, '三管轮');
INSERT INTO `t_flatcode` VALUES ('1395', 'gb_zyjszw', '专业技术职务码8561', '440', null, '船舶技术人员（电机）');
INSERT INTO `t_flatcode` VALUES ('1396', 'gb_zyjszw', '专业技术职务码8561', '442', null, '高级电机员');
INSERT INTO `t_flatcode` VALUES ('1397', 'gb_zyjszw', '专业技术职务码8561', '443', null, '通用电机员（一等电机员）');
INSERT INTO `t_flatcode` VALUES ('1398', 'gb_zyjszw', '专业技术职务码8561', '444', null, '二等电机员');
INSERT INTO `t_flatcode` VALUES ('1399', 'gb_zyjszw', '专业技术职务码8561', '450', null, '船舶技术人员（报务）');
INSERT INTO `t_flatcode` VALUES ('1400', 'gb_zyjszw', '专业技术职务码8561', '452', null, '高级报务员');
INSERT INTO `t_flatcode` VALUES ('1401', 'gb_zyjszw', '专业技术职务码8561', '453', null, '通用报务员');
INSERT INTO `t_flatcode` VALUES ('1402', 'gb_zyjszw', '专业技术职务码8561', '454', null, '二等报务员');
INSERT INTO `t_flatcode` VALUES ('1403', 'gb_zyjszw', '专业技术职务码8561', '455', null, '限用报务员');
INSERT INTO `t_flatcode` VALUES ('1404', 'gb_zyjszw', '专业技术职务码8561', '460', null, '飞行技术人员（驾驶）');
INSERT INTO `t_flatcode` VALUES ('1405', 'gb_zyjszw', '专业技术职务码8561', '462', null, '一级飞行员');
INSERT INTO `t_flatcode` VALUES ('1406', 'gb_zyjszw', '专业技术职务码8561', '463', null, '二级飞行员');
INSERT INTO `t_flatcode` VALUES ('1407', 'gb_zyjszw', '专业技术职务码8561', '464', null, '三级飞行员');
INSERT INTO `t_flatcode` VALUES ('1408', 'gb_zyjszw', '专业技术职务码8561', '465', null, '四级飞行员');
INSERT INTO `t_flatcode` VALUES ('1409', 'gb_zyjszw', '专业技术职务码8561', '470', null, '飞行技术人员（领航）');
INSERT INTO `t_flatcode` VALUES ('1410', 'gb_zyjszw', '专业技术职务码8561', '472', null, '一级领航员');
INSERT INTO `t_flatcode` VALUES ('1411', 'gb_zyjszw', '专业技术职务码8561', '473', null, '二级领航员');
INSERT INTO `t_flatcode` VALUES ('1412', 'gb_zyjszw', '专业技术职务码8561', '474', null, '三级领航员');
INSERT INTO `t_flatcode` VALUES ('1413', 'gb_zyjszw', '专业技术职务码8561', '475', null, '四级领航员');
INSERT INTO `t_flatcode` VALUES ('1414', 'gb_zyjszw', '专业技术职务码8561', '480', null, '飞行技术人员（通信）');
INSERT INTO `t_flatcode` VALUES ('1415', 'gb_zyjszw', '专业技术职务码8561', '482', null, '一级通信员');
INSERT INTO `t_flatcode` VALUES ('1416', 'gb_zyjszw', '专业技术职务码8561', '483', null, '二级通信员');
INSERT INTO `t_flatcode` VALUES ('1417', 'gb_zyjszw', '专业技术职务码8561', '484', null, '三级通信员');
INSERT INTO `t_flatcode` VALUES ('1418', 'gb_zyjszw', '专业技术职务码8561', '485', null, '四级通信员');
INSERT INTO `t_flatcode` VALUES ('1419', 'gb_zyjszw', '专业技术职务码8561', '490', null, '飞行技术人员（机械）');
INSERT INTO `t_flatcode` VALUES ('1420', 'gb_zyjszw', '专业技术职务码8561', '492', null, '一级机械员');
INSERT INTO `t_flatcode` VALUES ('1421', 'gb_zyjszw', '专业技术职务码8561', '493', null, '二级机械员');
INSERT INTO `t_flatcode` VALUES ('1422', 'gb_zyjszw', '专业技术职务码8561', '494', null, '三级机械员');
INSERT INTO `t_flatcode` VALUES ('1423', 'gb_zyjszw', '专业技术职务码8561', '495', null, '四级机械员');
INSERT INTO `t_flatcode` VALUES ('1424', 'gb_zyjszw', '专业技术职务码8561', '500', null, '船舶技术人员（引航）');
INSERT INTO `t_flatcode` VALUES ('1425', 'gb_zyjszw', '专业技术职务码8561', '502', null, '高级引航员');
INSERT INTO `t_flatcode` VALUES ('1426', 'gb_zyjszw', '专业技术职务码8561', '503', null, '一、二级引航员');
INSERT INTO `t_flatcode` VALUES ('1427', 'gb_zyjszw', '专业技术职务码8561', '504', null, '三、四级引航员');
INSERT INTO `t_flatcode` VALUES ('1428', 'gb_zyjszw', '专业技术职务码8561', '610', null, '自然科学研究人员');
INSERT INTO `t_flatcode` VALUES ('1429', 'gb_zyjszw', '专业技术职务码8561', '611', null, '研究员（自然科学）');
INSERT INTO `t_flatcode` VALUES ('1430', 'gb_zyjszw', '专业技术职务码8561', '612', null, '副研究员（自然科学）');
INSERT INTO `t_flatcode` VALUES ('1431', 'gb_zyjszw', '专业技术职务码8561', '613', null, '助理研究员（自然科学）');
INSERT INTO `t_flatcode` VALUES ('1432', 'gb_zyjszw', '专业技术职务码8561', '614', null, '研究实习员（自然科学）');
INSERT INTO `t_flatcode` VALUES ('1433', 'gb_zyjszw', '专业技术职务码8561', '620', null, '社会科学研究人员');
INSERT INTO `t_flatcode` VALUES ('1434', 'gb_zyjszw', '专业技术职务码8561', '621', null, '研究员（社会科学）');
INSERT INTO `t_flatcode` VALUES ('1435', 'gb_zyjszw', '专业技术职务码8561', '622', null, '副研究员（社会科学）');
INSERT INTO `t_flatcode` VALUES ('1436', 'gb_zyjszw', '专业技术职务码8561', '623', null, '助理研究员（社会科学）');
INSERT INTO `t_flatcode` VALUES ('1437', 'gb_zyjszw', '专业技术职务码8561', '624', null, '研究实习员（社会科学）');
INSERT INTO `t_flatcode` VALUES ('1438', 'gb_zyjszw', '专业技术职务码8561', '640', null, '图书、资料专业人员');
INSERT INTO `t_flatcode` VALUES ('1439', 'gb_zyjszw', '专业技术职务码8561', '641', null, '研究馆员（图书）');
INSERT INTO `t_flatcode` VALUES ('1440', 'gb_zyjszw', '专业技术职务码8561', '642', null, '副研究馆员（图书）');
INSERT INTO `t_flatcode` VALUES ('1441', 'gb_zyjszw', '专业技术职务码8561', '643', null, '馆员（图书）');
INSERT INTO `t_flatcode` VALUES ('1442', 'gb_zyjszw', '专业技术职务码8561', '644', null, '助理馆员（图书）');
INSERT INTO `t_flatcode` VALUES ('1443', 'gb_zyjszw', '专业技术职务码8561', '645', null, '管理员（图书）');
INSERT INTO `t_flatcode` VALUES ('1444', 'gb_zyjszw', '专业技术职务码8561', '650', null, '文博专业人员');
INSERT INTO `t_flatcode` VALUES ('1445', 'gb_zyjszw', '专业技术职务码8561', '651', null, '研究馆员（文博）');
INSERT INTO `t_flatcode` VALUES ('1446', 'gb_zyjszw', '专业技术职务码8561', '652', null, '副研究馆员（文博）');
INSERT INTO `t_flatcode` VALUES ('1447', 'gb_zyjszw', '专业技术职务码8561', '653', null, '馆员（文博）');
INSERT INTO `t_flatcode` VALUES ('1448', 'gb_zyjszw', '专业技术职务码8561', '654', null, '助理馆员（文博）');
INSERT INTO `t_flatcode` VALUES ('1449', 'gb_zyjszw', '专业技术职务码8561', '655', null, '管理员（文博）');
INSERT INTO `t_flatcode` VALUES ('1450', 'gb_zyjszw', '专业技术职务码8561', '660', null, '档案专业人员');
INSERT INTO `t_flatcode` VALUES ('1451', 'gb_zyjszw', '专业技术职务码8561', '661', null, '研究馆员（档案）');
INSERT INTO `t_flatcode` VALUES ('1452', 'gb_zyjszw', '专业技术职务码8561', '662', null, '副研究馆员（档案）');
INSERT INTO `t_flatcode` VALUES ('1453', 'gb_zyjszw', '专业技术职务码8561', '663', null, '馆员（档案）');
INSERT INTO `t_flatcode` VALUES ('1454', 'gb_zyjszw', '专业技术职务码8561', '664', null, '助理馆员（档案）');
INSERT INTO `t_flatcode` VALUES ('1455', 'gb_zyjszw', '专业技术职务码8561', '665', null, '管理员（档案）');
INSERT INTO `t_flatcode` VALUES ('1456', 'gb_zyjszw', '专业技术职务码8561', '670', null, '群众文化专业人员');
INSERT INTO `t_flatcode` VALUES ('1457', 'gb_zyjszw', '专业技术职务码8561', '671', null, '研究馆员（群众文化）');
INSERT INTO `t_flatcode` VALUES ('1458', 'gb_zyjszw', '专业技术职务码8561', '672', null, '副研究馆员（群众文化）');
INSERT INTO `t_flatcode` VALUES ('1459', 'gb_zyjszw', '专业技术职务码8561', '673', null, '馆员（群众文化）');
INSERT INTO `t_flatcode` VALUES ('1460', 'gb_zyjszw', '专业技术职务码8561', '674', null, '助理馆员（群众文化）');
INSERT INTO `t_flatcode` VALUES ('1461', 'gb_zyjszw', '专业技术职务码8561', '675', null, '管理员（群众文化）');
INSERT INTO `t_flatcode` VALUES ('1462', 'gb_zyjszw', '专业技术职务码8561', '680', null, '审计专业人员');
INSERT INTO `t_flatcode` VALUES ('1463', 'gb_zyjszw', '专业技术职务码8561', '682', null, '高级审计师');
INSERT INTO `t_flatcode` VALUES ('1464', 'gb_zyjszw', '专业技术职务码8561', '683', null, '审计师');
INSERT INTO `t_flatcode` VALUES ('1465', 'gb_zyjszw', '专业技术职务码8561', '684', null, '助理审计师');
INSERT INTO `t_flatcode` VALUES ('1466', 'gb_zyjszw', '专业技术职务码8561', '685', null, '审计员');
INSERT INTO `t_flatcode` VALUES ('1467', 'gb_zyjszw', '专业技术职务码8561', '690', null, '法医专业人员');
INSERT INTO `t_flatcode` VALUES ('1468', 'gb_zyjszw', '专业技术职务码8561', '691', null, '主任法医师');
INSERT INTO `t_flatcode` VALUES ('1469', 'gb_zyjszw', '专业技术职务码8561', '692', null, '副主任法医师');
INSERT INTO `t_flatcode` VALUES ('1470', 'gb_zyjszw', '专业技术职务码8561', '693', null, '主检法医师');
INSERT INTO `t_flatcode` VALUES ('1471', 'gb_zyjszw', '专业技术职务码8561', '694', null, '法医师');
INSERT INTO `t_flatcode` VALUES ('1472', 'gb_zyjszw', '专业技术职务码8561', '695', null, '法医士');
INSERT INTO `t_flatcode` VALUES ('1473', 'gb_zyjszw', '专业技术职务码8561', '980', null, '思想政治工作人员');
INSERT INTO `t_flatcode` VALUES ('1474', 'gb_zyjszw', '专业技术职务码8561', '982', null, '高级政工师');
INSERT INTO `t_flatcode` VALUES ('1475', 'gb_zyjszw', '专业技术职务码8561', '983', null, '政工师');
INSERT INTO `t_flatcode` VALUES ('1476', 'gb_zyjszw', '专业技术职务码8561', '984', null, '助理政工师');
INSERT INTO `t_flatcode` VALUES ('1477', 'gb_zyjszw', '专业技术职务码8561', '985', null, '思政工员');
INSERT INTO `t_flatcode` VALUES ('1478', 'gb_zwjb', '职务级别码12407', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('1479', 'gb_zwjb', '职务级别码12407', '02', null, '副总理、常务委员级');
INSERT INTO `t_flatcode` VALUES ('1480', 'gb_zwjb', '职务级别码12407', '03', null, '部、省级');
INSERT INTO `t_flatcode` VALUES ('1481', 'gb_zwjb', '职务级别码12407', '04', null, '副部、副省级');
INSERT INTO `t_flatcode` VALUES ('1482', 'gb_zwjb', '职务级别码12407', '05', null, '司、局、地、厅级');
INSERT INTO `t_flatcode` VALUES ('1483', 'gb_zwjb', '职务级别码12407', '06', null, '副司、副局、副地、副厅级');
INSERT INTO `t_flatcode` VALUES ('1484', 'gb_zwjb', '职务级别码12407', '07', null, '县级、处级');
INSERT INTO `t_flatcode` VALUES ('1485', 'gb_zwjb', '职务级别码12407', '08', null, '副县、副处级');
INSERT INTO `t_flatcode` VALUES ('1486', 'gb_zwjb', '职务级别码12407', '09', null, '正科级');
INSERT INTO `t_flatcode` VALUES ('1487', 'gb_zwjb', '职务级别码12407', '10', null, '副科级');
INSERT INTO `t_flatcode` VALUES ('1488', 'gb_zwjb', '职务级别码12407', '11', null, '科员级');
INSERT INTO `t_flatcode` VALUES ('1489', 'gb_zwjb', '职务级别码12407', '12', null, '办事员级');
INSERT INTO `t_flatcode` VALUES ('1490', 'gb_hyzk', '婚姻状况码4766', '1', null, '未婚');
INSERT INTO `t_flatcode` VALUES ('1491', 'gb_hyzk', '婚姻状况码4766', '2', null, '已婚');
INSERT INTO `t_flatcode` VALUES ('1492', 'gb_hyzk', '婚姻状况码4766', '3', null, '丧婚');
INSERT INTO `t_flatcode` VALUES ('1493', 'gb_hyzk', '婚姻状况码4766', '4', null, '离婚');
INSERT INTO `t_flatcode` VALUES ('1494', 'gb_hyzk', '婚姻状况码4766', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1495', 'gb_qjd', '侨居地码2659', '-', null, null);
INSERT INTO `t_flatcode` VALUES ('1496', 'gb_qjd', '侨居地码2659', '04', null, '阿富汗');
INSERT INTO `t_flatcode` VALUES ('1497', 'gb_qjd', '侨居地码2659', '032', null, '阿根廷');
INSERT INTO `t_flatcode` VALUES ('1498', 'gb_qjd', '侨居地码2659', '036', null, '澳大利亚');
INSERT INTO `t_flatcode` VALUES ('1499', 'gb_qjd', '侨居地码2659', '040', null, '奥地利');
INSERT INTO `t_flatcode` VALUES ('1500', 'gb_qjd', '侨居地码2659', '112', null, '白俄罗斯');
INSERT INTO `t_flatcode` VALUES ('1501', 'gb_qjd', '侨居地码2659', '076', null, '巴西');
INSERT INTO `t_flatcode` VALUES ('1502', 'gb_qjd', '侨居地码2659', '096', null, '文莱');
INSERT INTO `t_flatcode` VALUES ('1503', 'gb_qjd', '侨居地码2659', '124', null, '加拿大');
INSERT INTO `t_flatcode` VALUES ('1504', 'gb_qjd', '侨居地码2659', '152', null, '智利');
INSERT INTO `t_flatcode` VALUES ('1505', 'gb_qjd', '侨居地码2659', '156', null, '中国');
INSERT INTO `t_flatcode` VALUES ('1506', 'gb_qjd', '侨居地码2659', '344', null, '香港');
INSERT INTO `t_flatcode` VALUES ('1507', 'gb_qjd', '侨居地码2659', '446', null, '澳门');
INSERT INTO `t_flatcode` VALUES ('1508', 'gb_qjd', '侨居地码2659', '158', null, '台湾');
INSERT INTO `t_flatcode` VALUES ('1509', 'gb_qjd', '侨居地码2659', '192', null, '古巴');
INSERT INTO `t_flatcode` VALUES ('1510', 'gb_qjd', '侨居地码2659', '203', null, '捷克');
INSERT INTO `t_flatcode` VALUES ('1511', 'gb_qjd', '侨居地码2659', '208', null, '丹麦');
INSERT INTO `t_flatcode` VALUES ('1512', 'gb_qjd', '侨居地码2659', '818', null, '埃及');
INSERT INTO `t_flatcode` VALUES ('1513', 'gb_qjd', '侨居地码2659', '246', null, '芬兰');
INSERT INTO `t_flatcode` VALUES ('1514', 'gb_qjd', '侨居地码2659', '250', null, '法国');
INSERT INTO `t_flatcode` VALUES ('1515', 'gb_qjd', '侨居地码2659', '276', null, '德国');
INSERT INTO `t_flatcode` VALUES ('1516', 'gb_qjd', '侨居地码2659', '300', null, '希腊');
INSERT INTO `t_flatcode` VALUES ('1517', 'gb_qjd', '侨居地码2659', '348', null, '匈牙利');
INSERT INTO `t_flatcode` VALUES ('1518', 'gb_qjd', '侨居地码2659', '356', null, '印度');
INSERT INTO `t_flatcode` VALUES ('1519', 'gb_qjd', '侨居地码2659', '364', null, '伊朗');
INSERT INTO `t_flatcode` VALUES ('1520', 'gb_qjd', '侨居地码2659', '372', null, '爱尔兰');
INSERT INTO `t_flatcode` VALUES ('1521', 'gb_qjd', '侨居地码2659', '376', null, '以色列');
INSERT INTO `t_flatcode` VALUES ('1522', 'gb_qjd', '侨居地码2659', '380', null, '意大利');
INSERT INTO `t_flatcode` VALUES ('1523', 'gb_qjd', '侨居地码2659', '392', null, '日本');
INSERT INTO `t_flatcode` VALUES ('1524', 'gb_qjd', '侨居地码2659', '408', null, '朝鲜');
INSERT INTO `t_flatcode` VALUES ('1525', 'gb_qjd', '侨居地码2659', '410', null, '韩国');
INSERT INTO `t_flatcode` VALUES ('1526', 'gb_qjd', '侨居地码2659', '418', null, '老挝');
INSERT INTO `t_flatcode` VALUES ('1527', 'gb_qjd', '侨居地码2659', '422', null, '黎巴嫩');
INSERT INTO `t_flatcode` VALUES ('1528', 'gb_qjd', '侨居地码2659', '458', null, '马来西亚');
INSERT INTO `t_flatcode` VALUES ('1529', 'gb_qjd', '侨居地码2659', '496', null, '蒙古');
INSERT INTO `t_flatcode` VALUES ('1530', 'gb_qjd', '侨居地码2659', '104', null, '缅甸');
INSERT INTO `t_flatcode` VALUES ('1531', 'gb_qjd', '侨居地码2659', '528', null, '荷兰');
INSERT INTO `t_flatcode` VALUES ('1532', 'gb_qjd', '侨居地码2659', '554', null, '新西兰');
INSERT INTO `t_flatcode` VALUES ('1533', 'gb_qjd', '侨居地码2659', '608', null, '菲律宾');
INSERT INTO `t_flatcode` VALUES ('1534', 'gb_qjd', '侨居地码2659', '620', null, '葡萄牙');
INSERT INTO `t_flatcode` VALUES ('1535', 'gb_qjd', '侨居地码2659', '643', null, '俄罗斯联邦');
INSERT INTO `t_flatcode` VALUES ('1536', 'gb_qjd', '侨居地码2659', '702', null, '新加坡');
INSERT INTO `t_flatcode` VALUES ('1537', 'gb_qjd', '侨居地码2659', '710', null, '南非');
INSERT INTO `t_flatcode` VALUES ('1538', 'gb_qjd', '侨居地码2659', '752', null, '瑞典');
INSERT INTO `t_flatcode` VALUES ('1539', 'gb_qjd', '侨居地码2659', '756', null, '瑞士');
INSERT INTO `t_flatcode` VALUES ('1540', 'gb_qjd', '侨居地码2659', '764', null, '泰国');
INSERT INTO `t_flatcode` VALUES ('1541', 'gb_qjd', '侨居地码2659', '826', null, '英国');
INSERT INTO `t_flatcode` VALUES ('1542', 'gb_qjd', '侨居地码2659', '840', null, '美国');
INSERT INTO `t_flatcode` VALUES ('1543', 'gb_qjd', '侨居地码2659', '704', null, '越南');
INSERT INTO `t_flatcode` VALUES ('1544', 'dm_ydlb', '异动类别码', '00', null, '升级');
INSERT INTO `t_flatcode` VALUES ('1545', 'dm_ydlb', '异动类别码', '01', null, '留级');
INSERT INTO `t_flatcode` VALUES ('1546', 'dm_ydlb', '异动类别码', '02', null, '降级');
INSERT INTO `t_flatcode` VALUES ('1547', 'dm_ydlb', '异动类别码', '03', null, '跳级');
INSERT INTO `t_flatcode` VALUES ('1548', 'dm_ydlb', '异动类别码', '04', null, '试读');
INSERT INTO `t_flatcode` VALUES ('1549', 'dm_ydlb', '异动类别码', '11', null, '休学');
INSERT INTO `t_flatcode` VALUES ('1550', 'dm_ydlb', '异动类别码', '12', null, '复学');
INSERT INTO `t_flatcode` VALUES ('1551', 'dm_ydlb', '异动类别码', '13', null, '停学');
INSERT INTO `t_flatcode` VALUES ('1552', 'dm_ydlb', '异动类别码', '14', null, '保留入学资格');
INSERT INTO `t_flatcode` VALUES ('1553', 'dm_ydlb', '异动类别码', '15', null, '恢复入学资格');
INSERT INTO `t_flatcode` VALUES ('1554', 'dm_ydlb', '异动类别码', '16', null, '恢复学籍');
INSERT INTO `t_flatcode` VALUES ('1555', 'dm_ydlb', '异动类别码', '17', null, '取消学籍');
INSERT INTO `t_flatcode` VALUES ('1556', 'dm_ydlb', '异动类别码', '21', null, '转学（转出）');
INSERT INTO `t_flatcode` VALUES ('1557', 'dm_ydlb', '异动类别码', '22', null, '转学（转入）');
INSERT INTO `t_flatcode` VALUES ('1558', 'dm_ydlb', '异动类别码', '31', null, '退学');
INSERT INTO `t_flatcode` VALUES ('1559', 'dm_ydlb', '异动类别码', '32', null, '勒令退学');
INSERT INTO `t_flatcode` VALUES ('1560', 'dm_ydlb', '异动类别码', '33', null, '开除学籍');
INSERT INTO `t_flatcode` VALUES ('1561', 'dm_ydlb', '异动类别码', '51', null, '正常死亡');
INSERT INTO `t_flatcode` VALUES ('1562', 'dm_ydlb', '异动类别码', '52', null, '非正常死亡');
INSERT INTO `t_flatcode` VALUES ('1563', 'dm_ydlb', '异动类别码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1564', 'dm_rxfs', '入学方式码', '1', null, '普通入学');
INSERT INTO `t_flatcode` VALUES ('1565', 'dm_rxfs', '入学方式码', '2', null, '民族班');
INSERT INTO `t_flatcode` VALUES ('1566', 'dm_rxfs', '入学方式码', '3', null, '体育特招');
INSERT INTO `t_flatcode` VALUES ('1567', 'dm_rxfs', '入学方式码', '4', null, '外校转入');
INSERT INTO `t_flatcode` VALUES ('1568', 'dm_rxfs', '入学方式码', '5', null, '恢复入学资格');
INSERT INTO `t_flatcode` VALUES ('1569', 'dm_rxfs', '入学方式码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1570', 'dm_xsly', '学生来源码', '1', null, '正常入学');
INSERT INTO `t_flatcode` VALUES ('1571', 'dm_xsly', '学生来源码', '2', null, '借读');
INSERT INTO `t_flatcode` VALUES ('1572', 'dm_xsly', '学生来源码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1573', 'dm_jdfs', '就读方式码', '2', null, '住校');
INSERT INTO `t_flatcode` VALUES ('1574', 'dm_jdfs', '就读方式码', '1', null, '走读');
INSERT INTO `t_flatcode` VALUES ('1575', 'dm_jdfs', '就读方式码', '3', null, '借宿');
INSERT INTO `t_flatcode` VALUES ('1576', 'dm_jdfs', '就读方式码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1577', 'dm_jyjg', '教育结果代码', '2', null, '结业');
INSERT INTO `t_flatcode` VALUES ('1578', 'dm_jyjg', '教育结果代码', '3', null, '未结业');
INSERT INTO `t_flatcode` VALUES ('1579', 'dm_jyjg', '教育结果代码', '4', null, '肆业');
INSERT INTO `t_flatcode` VALUES ('1580', 'dm_byqx', '毕业去向码', '10', null, '升学');
INSERT INTO `t_flatcode` VALUES ('1581', 'dm_byqx', '毕业去向码', '11', null, '本科');
INSERT INTO `t_flatcode` VALUES ('1582', 'dm_byqx', '毕业去向码', '12', null, '专科');
INSERT INTO `t_flatcode` VALUES ('1583', 'dm_byqx', '毕业去向码', '13', null, '中专');
INSERT INTO `t_flatcode` VALUES ('1584', 'dm_byqx', '毕业去向码', '14', null, '技校');
INSERT INTO `t_flatcode` VALUES ('1585', 'dm_byqx', '毕业去向码', '15', null, '高职');
INSERT INTO `t_flatcode` VALUES ('1586', 'dm_byqx', '毕业去向码', '16', null, '职业高中');
INSERT INTO `t_flatcode` VALUES ('1587', 'dm_byqx', '毕业去向码', '17', null, '职业初中');
INSERT INTO `t_flatcode` VALUES ('1588', 'dm_byqx', '毕业去向码', '18', null, '普通高中');
INSERT INTO `t_flatcode` VALUES ('1589', 'dm_byqx', '毕业去向码', '20', null, '就业');
INSERT INTO `t_flatcode` VALUES ('1590', 'dm_byqx', '毕业去向码', '30', null, '参军');
INSERT INTO `t_flatcode` VALUES ('1591', 'dm_byqx', '毕业去向码', '40', null, '出国(境)');
INSERT INTO `t_flatcode` VALUES ('1592', 'dm_byqx', '毕业去向码', '50', null, '赴港澳台');
INSERT INTO `t_flatcode` VALUES ('1593', 'dm_byqx', '毕业去向码', '60', null, '待就业');
INSERT INTO `t_flatcode` VALUES ('1594', 'dm_byqx', '毕业去向码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1595', 'dm_jljb', '奖励级别码', '60', null, '学校级');
INSERT INTO `t_flatcode` VALUES ('1596', 'dm_jljb', '奖励级别码', '10', null, '国家级');
INSERT INTO `t_flatcode` VALUES ('1597', 'dm_jljb', '奖励级别码', '20', null, '省、部委级');
INSERT INTO `t_flatcode` VALUES ('1598', 'dm_jljb', '奖励级别码', '21', null, '教育部');
INSERT INTO `t_flatcode` VALUES ('1599', 'dm_jljb', '奖励级别码', '22', null, '中央其他部委');
INSERT INTO `t_flatcode` VALUES ('1600', 'dm_jljb', '奖励级别码', '23', null, '省（自治区、直辖市）级');
INSERT INTO `t_flatcode` VALUES ('1601', 'dm_jljb', '奖励级别码', '30', null, '省部门级、地（市、州）级');
INSERT INTO `t_flatcode` VALUES ('1602', 'dm_jljb', '奖励级别码', '31', null, '省级教育主管部门');
INSERT INTO `t_flatcode` VALUES ('1603', 'dm_jljb', '奖励级别码', '32', null, '省级其他部门');
INSERT INTO `t_flatcode` VALUES ('1604', 'dm_jljb', '奖励级别码', '33', null, '地（市、州）级');
INSERT INTO `t_flatcode` VALUES ('1605', 'dm_jljb', '奖励级别码', '40', null, '地（市、州）部门级、县（区、旗）级');
INSERT INTO `t_flatcode` VALUES ('1606', 'dm_jljb', '奖励级别码', '41', null, '地级教育主管部门');
INSERT INTO `t_flatcode` VALUES ('1607', 'dm_jljb', '奖励级别码', '42', null, '地级其他部门');
INSERT INTO `t_flatcode` VALUES ('1608', 'dm_jljb', '奖励级别码', '43', null, '县级');
INSERT INTO `t_flatcode` VALUES ('1609', 'dm_jljb', '奖励级别码', '50', null, '县部门级、乡（镇）级');
INSERT INTO `t_flatcode` VALUES ('1610', 'dm_jljb', '奖励级别码', '51', null, '县级教育主管部门');
INSERT INTO `t_flatcode` VALUES ('1611', 'dm_jljb', '奖励级别码', '52', null, '县级其他部门');
INSERT INTO `t_flatcode` VALUES ('1612', 'dm_jljb', '奖励级别码', '53', null, '乡（镇）级');
INSERT INTO `t_flatcode` VALUES ('1613', 'dm_jljb', '奖励级别码', '70', null, '国外');
INSERT INTO `t_flatcode` VALUES ('1614', 'dm_jljb', '奖励级别码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1615', 'dm_xshjlb', '学生获奖类别码', '1', null, '学科获奖');
INSERT INTO `t_flatcode` VALUES ('1616', 'dm_xshjlb', '学生获奖类别码', '2', null, '科技获奖');
INSERT INTO `t_flatcode` VALUES ('1617', 'dm_xshjlb', '学生获奖类别码', '3', null, '文艺获奖');
INSERT INTO `t_flatcode` VALUES ('1618', 'dm_xshjlb', '学生获奖类别码', '4', null, '体育获奖');
INSERT INTO `t_flatcode` VALUES ('1619', 'dm_xshjlb', '学生获奖类别码', '5', null, '综合获奖');
INSERT INTO `t_flatcode` VALUES ('1620', 'dm_xshjlb', '学生获奖类别码', '6', null, '社会工作获奖');
INSERT INTO `t_flatcode` VALUES ('1621', 'dm_xshjlb', '学生获奖类别码', '7', null, '公益事业获奖');
INSERT INTO `t_flatcode` VALUES ('1622', 'dm_xshjlb', '学生获奖类别码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1623', 'dm_cfmc', '处分原因', '1', null, '警告');
INSERT INTO `t_flatcode` VALUES ('1624', 'dm_cfmc', '处分原因', '2', null, '记过');
INSERT INTO `t_flatcode` VALUES ('1625', 'dm_cfmc', '处分原因', '7', null, '记大过');
INSERT INTO `t_flatcode` VALUES ('1626', 'dm_cfmc', '处分原因', '3', null, '严重警告');
INSERT INTO `t_flatcode` VALUES ('1627', 'dm_cfmc', '处分原因', '4', null, '留校察看');
INSERT INTO `t_flatcode` VALUES ('1628', 'dm_cfmc', '处分原因', '5', null, '勒令退学');
INSERT INTO `t_flatcode` VALUES ('1629', 'dm_cfmc', '处分原因', '6', null, '开除学籍');
INSERT INTO `t_flatcode` VALUES ('1630', 'dm_cfmc', '处分原因', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1631', 'dm_ksfs', '考试方式码', '1', null, '笔试');
INSERT INTO `t_flatcode` VALUES ('1632', 'dm_ksfs', '考试方式码', '2', null, '口试');
INSERT INTO `t_flatcode` VALUES ('1633', 'dm_ksfs', '考试方式码', '3', null, '考查');
INSERT INTO `t_flatcode` VALUES ('1634', 'dm_ksfs', '考试方式码', '4', null, '操作');
INSERT INTO `t_flatcode` VALUES ('1635', 'dm_ksfs', '考试方式码', '5', null, '网上考试');
INSERT INTO `t_flatcode` VALUES ('1636', 'dm_ksfs', '考试方式码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1637', 'dm_xslb', '学生类别dmxslb', '00', null, '普通学生');
INSERT INTO `t_flatcode` VALUES ('1638', 'dm_xslb', '学生类别dmxslb', '10', null, '随班就读学生');
INSERT INTO `t_flatcode` VALUES ('1639', 'dm_xslb', '学生类别dmxslb', '11', null, '视力残疾学生');
INSERT INTO `t_flatcode` VALUES ('1640', 'dm_xslb', '学生类别dmxslb', '12', null, '听力残疾学生');
INSERT INTO `t_flatcode` VALUES ('1641', 'dm_xslb', '学生类别dmxslb', '13', null, '智力残疾学生');
INSERT INTO `t_flatcode` VALUES ('1642', 'dm_xslb', '学生类别dmxslb', '19', null, '其他随班就读学生');
INSERT INTO `t_flatcode` VALUES ('1643', 'dm_tjxmlb', '体检项目类别代码', '01', null, '内科');
INSERT INTO `t_flatcode` VALUES ('1644', 'dm_tjxmlb', '体检项目类别代码', '02', null, '外科');
INSERT INTO `t_flatcode` VALUES ('1645', 'dm_tjxmlb', '体检项目类别代码', '03', null, '眼科');
INSERT INTO `t_flatcode` VALUES ('1646', 'dm_tjxmlb', '体检项目类别代码', '04', null, '五官科');
INSERT INTO `t_flatcode` VALUES ('1647', 'dm_tjxmlb', '体检项目类别代码', '05', null, '口腔科');
INSERT INTO `t_flatcode` VALUES ('1648', 'dm_tjxmlb', '体检项目类别代码', '06', null, '妇科');
INSERT INTO `t_flatcode` VALUES ('1649', 'dm_tjxmlb', '体检项目类别代码', '07', null, '生化检查');
INSERT INTO `t_flatcode` VALUES ('1650', 'dm_tjxmlb', '体检项目类别代码', '08', null, '物理（仪器）检查');
INSERT INTO `t_flatcode` VALUES ('1651', 'dm_tjxmlb', '体检项目类别代码', '09', null, '体能、形态');
INSERT INTO `t_flatcode` VALUES ('1652', 'dm_tjxmlb', '体检项目类别代码', '99', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1653', 'dm_kslb', '考试类别码', '01', null, '期末考试');
INSERT INTO `t_flatcode` VALUES ('1654', 'dm_kslb', '考试类别码', '02', null, '期中考试');
INSERT INTO `t_flatcode` VALUES ('1655', 'dm_kslb', '考试类别码', '03', null, '月考');
INSERT INTO `t_flatcode` VALUES ('1656', 'dm_kslb', '考试类别码', '04', null, '周考');
INSERT INTO `t_flatcode` VALUES ('1657', 'dm_kslb', '考试类别码', '05', null, '平时考试');
INSERT INTO `t_flatcode` VALUES ('1658', 'dm_kslb', '考试类别码', '09', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1659', 'dm_ldrkzk', '流动人口状况新增代码2006/11/14', '0', null, '否');
INSERT INTO `t_flatcode` VALUES ('1660', 'dm_ldrkzk', '流动人口状况新增代码2006/11/14', '1', null, '是');
INSERT INTO `t_flatcode` VALUES ('1661', 'dm_xxbb', '学校办别码dmxxbb', '1', null, '教育部门和集体办');
INSERT INTO `t_flatcode` VALUES ('1662', 'dm_xxbb', '学校办别码dmxxbb', '2', null, '社会力量办');
INSERT INTO `t_flatcode` VALUES ('1663', 'dm_xxbb', '学校办别码dmxxbb', '3', null, '其他部门办');
INSERT INTO `t_flatcode` VALUES ('1664', 'dm_xxbb', '学校办别码dmxxbb', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1665', 'dm_xxlb', '学校类别码', '11', null, '小学');
INSERT INTO `t_flatcode` VALUES ('1666', 'dm_xxlb', '学校类别码', '12', null, '独立设置少数民族小学');
INSERT INTO `t_flatcode` VALUES ('1667', 'dm_xxlb', '学校类别码', '17', null, '贯制学校小学部');
INSERT INTO `t_flatcode` VALUES ('1668', 'dm_xxlb', '学校类别码', '18', null, '小学教学点');
INSERT INTO `t_flatcode` VALUES ('1669', 'dm_xxlb', '学校类别码', '19', null, '其他学校辅设小学班');
INSERT INTO `t_flatcode` VALUES ('1670', 'dm_xxlb', '学校类别码', '21', null, '完全中学');
INSERT INTO `t_flatcode` VALUES ('1671', 'dm_xxlb', '学校类别码', '22', null, '初级中学');
INSERT INTO `t_flatcode` VALUES ('1672', 'dm_xxlb', '学校类别码', '23', null, '高级中学');
INSERT INTO `t_flatcode` VALUES ('1673', 'dm_xxlb', '学校类别码', '24', null, '一贯制学校');
INSERT INTO `t_flatcode` VALUES ('1674', 'dm_xxlb', '学校类别码', '29', null, '其他学校附设中学班');
INSERT INTO `t_flatcode` VALUES ('1675', 'dm_xxlb', '学校类别码', '31', null, '独立设置少数民族完全中学');
INSERT INTO `t_flatcode` VALUES ('1676', 'dm_xxlb', '学校类别码', '32', null, '独立设置少数民族高中');
INSERT INTO `t_flatcode` VALUES ('1677', 'dm_xxlb', '学校类别码', '33', null, '独立设置少数民族初中');
INSERT INTO `t_flatcode` VALUES ('1678', 'dm_xxlb', '学校类别码', '34', null, '独立设置一贯制少数民族学校');
INSERT INTO `t_flatcode` VALUES ('1679', 'dm_szdqjjsx', '所在地经济属性码', '0', null, '非贫困县');
INSERT INTO `t_flatcode` VALUES ('1680', 'dm_szdqjjsx', '所在地经济属性码', '1', null, '国家级贫困县');
INSERT INTO `t_flatcode` VALUES ('1681', 'dm_szdqjjsx', '所在地经济属性码', '2', null, '省级贫困县');
INSERT INTO `t_flatcode` VALUES ('1682', 'dm_szdmzsx', '所在地民族属性', '0', null, '民族自治县');
INSERT INTO `t_flatcode` VALUES ('1683', 'dm_szdmzsx', '所在地民族属性', '1', null, '非民族自治县');
INSERT INTO `t_flatcode` VALUES ('1684', 'dm_dbqk', '达标情况码', '0', null, '未达标');
INSERT INTO `t_flatcode` VALUES ('1685', 'dm_dbqk', '达标情况码', '1', null, '达标');
INSERT INTO `t_flatcode` VALUES ('1686', 'dm_szdlb', '所在地区类别码', '1', null, '城市');
INSERT INTO `t_flatcode` VALUES ('1687', 'dm_szdlb', '所在地区类别码', '2', null, '县镇');
INSERT INTO `t_flatcode` VALUES ('1688', 'dm_szdlb', '所在地区类别码', '3', null, '农村');
INSERT INTO `t_flatcode` VALUES ('1689', 'dm_bjlx', '班级类型代码', '20', null, '普通初中班');
INSERT INTO `t_flatcode` VALUES ('1690', 'dm_bjlx', '班级类型代码', '40', null, '普通高中班');
INSERT INTO `t_flatcode` VALUES ('1691', 'dm_bjlx', '班级类型代码', '10', null, '普通小学班');
INSERT INTO `t_flatcode` VALUES ('1692', 'dm_bjlx', '班级类型代码', '11', null, '少数民族班');
INSERT INTO `t_flatcode` VALUES ('1693', 'dm_bjlx', '班级类型代码', '12', null, '小学复式班');
INSERT INTO `t_flatcode` VALUES ('1694', 'dm_bjlx', '班级类型代码', '13', null, '小学教学点班');
INSERT INTO `t_flatcode` VALUES ('1695', 'dm_bjlx', '班级类型代码', '14', null, '小学特长班(文体艺智等班)');
INSERT INTO `t_flatcode` VALUES ('1696', 'dm_bjlx', '班级类型代码', '15', null, '小学视力残疾班');
INSERT INTO `t_flatcode` VALUES ('1697', 'dm_bjlx', '班级类型代码', '16', null, '小学听力残疾班');
INSERT INTO `t_flatcode` VALUES ('1698', 'dm_bjlx', '班级类型代码', '17', null, '小学智力残疾班');
INSERT INTO `t_flatcode` VALUES ('1699', 'dm_bjlx', '班级类型代码', '21', null, '少数民族初中班');
INSERT INTO `t_flatcode` VALUES ('1700', 'dm_bjlx', '班级类型代码', '22', null, '初中复式班');
INSERT INTO `t_flatcode` VALUES ('1701', 'dm_bjlx', '班级类型代码', '23', null, '初中教学点班');
INSERT INTO `t_flatcode` VALUES ('1702', 'dm_bjlx', '班级类型代码', '24', null, '初中特长班(文体艺智等班)');
INSERT INTO `t_flatcode` VALUES ('1703', 'dm_bjlx', '班级类型代码', '25', null, '初中视力残疾班');
INSERT INTO `t_flatcode` VALUES ('1704', 'dm_bjlx', '班级类型代码', '26', null, '初中听力残疾班');
INSERT INTO `t_flatcode` VALUES ('1705', 'dm_bjlx', '班级类型代码', '27', null, '初中智力残疾班');
INSERT INTO `t_flatcode` VALUES ('1706', 'dm_bjlx', '班级类型代码', '41', null, '少数民族高中班');
INSERT INTO `t_flatcode` VALUES ('1707', 'dm_bjlx', '班级类型代码', '42', null, '高中特长班(文体艺智等班)');
INSERT INTO `t_flatcode` VALUES ('1708', 'dm_jxzylx', '教学资源类型', '00', null, '普通教室');
INSERT INTO `t_flatcode` VALUES ('1709', 'dm_jxzylx', '教学资源类型', '11', null, '物理实验');
INSERT INTO `t_flatcode` VALUES ('1710', 'dm_jxzylx', '教学资源类型', '12', null, '化学实验');
INSERT INTO `t_flatcode` VALUES ('1711', 'dm_jxzylx', '教学资源类型', '13', null, '生物实验');
INSERT INTO `t_flatcode` VALUES ('1712', 'dm_jxzylx', '教学资源类型', '14', null, '其他实验');
INSERT INTO `t_flatcode` VALUES ('1713', 'dm_jxzylx', '教学资源类型', '21', null, '音乐室');
INSERT INTO `t_flatcode` VALUES ('1714', 'dm_jxzylx', '教学资源类型', '31', null, '语音室');
INSERT INTO `t_flatcode` VALUES ('1715', 'dm_jxzylx', '教学资源类型', '41', null, '计算机房');
INSERT INTO `t_flatcode` VALUES ('1716', 'dm_jxzylx', '教学资源类型', '51', null, '体育场地');
INSERT INTO `t_flatcode` VALUES ('1717', 'dm_skfs', '授课方式', '1', null, '面授讲课');
INSERT INTO `t_flatcode` VALUES ('1718', 'dm_skfs', '授课方式', '2', null, '辅导');
INSERT INTO `t_flatcode` VALUES ('1719', 'dm_skfs', '授课方式', '3', null, '录像讲课');
INSERT INTO `t_flatcode` VALUES ('1720', 'dm_skfs', '授课方式', '4', null, '网络教学');
INSERT INTO `t_flatcode` VALUES ('1721', 'dm_skfs', '授课方式', '5', null, '实验');
INSERT INTO `t_flatcode` VALUES ('1722', 'dm_skfs', '授课方式', '6', null, '实习');
INSERT INTO `t_flatcode` VALUES ('1723', 'dm_skfs', '授课方式', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1724', 'bui_pthdj', '普通话等级码', '1', null, '一级甲等');
INSERT INTO `t_flatcode` VALUES ('1725', 'bui_pthdj', '普通话等级码', '2', null, '一级乙等');
INSERT INTO `t_flatcode` VALUES ('1726', 'bui_pthdj', '普通话等级码', '3', null, '二级甲等');
INSERT INTO `t_flatcode` VALUES ('1727', 'bui_pthdj', '普通话等级码', '4', null, '二级乙等');
INSERT INTO `t_flatcode` VALUES ('1728', 'bui_pthdj', '普通话等级码', '5', null, '三级甲等');
INSERT INTO `t_flatcode` VALUES ('1729', 'bui_pthdj', '普通话等级码', '6', null, '三级乙等');
INSERT INTO `t_flatcode` VALUES ('1730', 'bui_pthdj', '普通话等级码', '7', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1731', 'dm_njlx', '年级类型码', '1', null, '一年级');
INSERT INTO `t_flatcode` VALUES ('1732', 'dm_njlx', '年级类型码', '2', null, '二年级');
INSERT INTO `t_flatcode` VALUES ('1733', 'dm_njlx', '年级类型码', '3', null, '三年级');
INSERT INTO `t_flatcode` VALUES ('1734', 'dm_njlx', '年级类型码', '4', null, '四年级');
INSERT INTO `t_flatcode` VALUES ('1735', 'dm_njlx', '年级类型码', '5', null, '五年级');
INSERT INTO `t_flatcode` VALUES ('1736', 'dm_njlx', '年级类型码', '6', null, '六年级');
INSERT INTO `t_flatcode` VALUES ('1737', 'dm_njlx', '年级类型码', '7', null, '七年级');
INSERT INTO `t_flatcode` VALUES ('1738', 'dm_njlx', '年级类型码', '8', null, '八年级');
INSERT INTO `t_flatcode` VALUES ('1739', 'dm_njlx', '年级类型码', '9', null, '九年级');
INSERT INTO `t_flatcode` VALUES ('1740', 'dm_njlx', '年级类型码', '10', null, '高一年级');
INSERT INTO `t_flatcode` VALUES ('1741', 'dm_njlx', '年级类型码', '11', null, '高二年级');
INSERT INTO `t_flatcode` VALUES ('1742', 'dm_njlx', '年级类型码', '12', null, '高三年级');
INSERT INTO `t_flatcode` VALUES ('1743', 'dm_kskmlb', '考试科目类别码', '1', null, '主科 ');
INSERT INTO `t_flatcode` VALUES ('1744', 'dm_kskmlb', '考试科目类别码', '2', null, '副科 ');
INSERT INTO `t_flatcode` VALUES ('1745', 'dm_xqxnlx', '学期类型码', '1', null, '上学期 ');
INSERT INTO `t_flatcode` VALUES ('1746', 'dm_xqxnlx', '学期类型码', '2', null, '下学期 ');
INSERT INTO `t_flatcode` VALUES ('1747', 'dm_pylx', '评语类型码', '1', null, '平时评语 ');
INSERT INTO `t_flatcode` VALUES ('1748', 'dm_pylx', '评语类型码', '2', null, '周评语 ');
INSERT INTO `t_flatcode` VALUES ('1749', 'dm_pylx', '评语类型码', '3', null, '期末评语 ');
INSERT INTO `t_flatcode` VALUES ('1750', 'dm_pyk_pylx', '评语库评语类型码', '1', null, '优秀 ');
INSERT INTO `t_flatcode` VALUES ('1751', 'dm_pyk_pylx', '评语库评语类型码', '2', null, '中等 ');
INSERT INTO `t_flatcode` VALUES ('1752', 'dm_pyk_pylx', '评语库评语类型码', '3', null, '差 ');
INSERT INTO `t_flatcode` VALUES ('1753', 'dm_njglz_zw', '年级领导职务', '1', null, '年级主任');
INSERT INTO `t_flatcode` VALUES ('1754', 'dm_njglz_zw', '年级领导职务', '2', null, '年级副主任 ');
INSERT INTO `t_flatcode` VALUES ('1755', 'dm_bjglz_zw', '班级领导职务', '1', null, '班级主任');
INSERT INTO `t_flatcode` VALUES ('1756', 'dm_bjglz_zw', '班级领导职务', '2', null, '班级副主任 ');
INSERT INTO `t_flatcode` VALUES ('1757', 'dm_bgb_zw', '班干部职务', '01', null, '班长');
INSERT INTO `t_flatcode` VALUES ('1758', 'dm_bgb_zw', '班干部职务', '02', null, '副班长');
INSERT INTO `t_flatcode` VALUES ('1759', 'dm_bgb_zw', '班干部职务', '03', null, '学习委员');
INSERT INTO `t_flatcode` VALUES ('1760', 'dm_bgb_zw', '班干部职务', '04', null, '纪律委员');
INSERT INTO `t_flatcode` VALUES ('1761', 'dm_bgb_zw', '班干部职务', '05', null, '劳动委员');
INSERT INTO `t_flatcode` VALUES ('1762', 'dm_bgb_zw', '班干部职务', '06', null, '文娱委员');
INSERT INTO `t_flatcode` VALUES ('1763', 'dm_ksglz_zw', '科室领导职务', '01', null, '科主任');
INSERT INTO `t_flatcode` VALUES ('1764', 'dm_ksglz_zw', '科室领导职务', '02', null, '科室副主任');
INSERT INTO `t_flatcode` VALUES ('1765', 'notification_lx', '新闻类型', '01', null, '新闻');
INSERT INTO `t_flatcode` VALUES ('1766', 'notification_lx', '新闻类型', '02', null, '通知');
INSERT INTO `t_flatcode` VALUES ('1767', 'eam-zczt', '资产状态', '401001', null, '库存-待用');
INSERT INTO `t_flatcode` VALUES ('1768', 'eam-zczt', '资产状态', '401002', null, '库存-退库');
INSERT INTO `t_flatcode` VALUES ('1769', 'eam-zczt', '资产状态', '401003', null, '库存-借用');
INSERT INTO `t_flatcode` VALUES ('1770', 'eam-zczt', '资产状态', '402001', null, '在使用');
INSERT INTO `t_flatcode` VALUES ('1771', 'eam-zczt', '资产状态', '403001', null, '维修');
INSERT INTO `t_flatcode` VALUES ('1772', 'eam-zczt', '资产状态', '404001', null, '出租');
INSERT INTO `t_flatcode` VALUES ('1773', 'eam-zczt', '资产状态', '405001', null, '报废-待处理');
INSERT INTO `t_flatcode` VALUES ('1774', 'eam-zczt', '资产状态', '405002', null, '报废-已内卖');
INSERT INTO `t_flatcode` VALUES ('1775', 'eam-zczt', '资产状态', '405003', null, '报废-已外卖');
INSERT INTO `t_flatcode` VALUES ('1776', 'eam-zclx', '资产类型', '201001', null, '固定资产');
INSERT INTO `t_flatcode` VALUES ('1777', 'eam-zclx', '资产类型', '202001', null, '低值易耗品');
INSERT INTO `t_flatcode` VALUES ('1778', 'eam-zclx', '资产类型', '201002', null, '融资租入固定资产');
INSERT INTO `t_flatcode` VALUES ('1779', 'eam-zcyt', '资产用途', '301001', null, '管理用');
INSERT INTO `t_flatcode` VALUES ('1780', 'eam-zcyt', '资产用途', '301002', null, '销售用');
INSERT INTO `t_flatcode` VALUES ('1781', 'eam-zcyt', '资产用途', '301003', null, '操作用');
INSERT INTO `t_flatcode` VALUES ('1782', 'eam-zcyt', '资产用途', '301004', null, '租出用');
INSERT INTO `t_flatcode` VALUES ('1783', 'eam-zcyt', '资产用途', '301005', null, '福利用');
INSERT INTO `t_flatcode` VALUES ('1784', 'eam-zcyt', '资产用途', '301006', null, '培训用');
INSERT INTO `t_flatcode` VALUES ('1785', 'eam-zcyt', '资产用途', '301007', null, '研发用费用化');
INSERT INTO `t_flatcode` VALUES ('1786', 'eam-zcyt', '资产用途', '301008', null, '研发用资本化');
INSERT INTO `t_flatcode` VALUES ('1787', 'eam-xzsz', '闲置设置', '601001', null, '非闲置');
INSERT INTO `t_flatcode` VALUES ('1788', 'eam-xzsz', '闲置设置', '602001', null, '闲置可调拨');
INSERT INTO `t_flatcode` VALUES ('1789', 'eam-xzsz', '闲置设置', '602002', null, '闲置不可调拨');
INSERT INTO `t_flatcode` VALUES ('1790', 'eam-xzsz', '闲置设置', '603001', null, '报废');
INSERT INTO `t_flatcode` VALUES ('1791', 'eam-bflx', '报废类型', '101001', null, '注销公司报废');
INSERT INTO `t_flatcode` VALUES ('1792', 'eam-bflx', '报废类型', '101002', null, '对内变卖报废');
INSERT INTO `t_flatcode` VALUES ('1793', 'eam-bflx', '报废类型', '101003', null, '对外变卖报废');
INSERT INTO `t_flatcode` VALUES ('1794', 'eam-bflx', '报废类型', '101004', null, '正常报废');
INSERT INTO `t_flatcode` VALUES ('1795', 'eam-bflx', '报废类型', '101005', null, '盘亏');
INSERT INTO `t_flatcode` VALUES ('1796', 'eam-bflx', '报废类型', '101006', null, '捐赠转出');
INSERT INTO `t_flatcode` VALUES ('1797', 'eam-bflx', '报废类型', '101007', null, '毁损');
INSERT INTO `t_flatcode` VALUES ('1798', 'eam-bflx', '报废类型', '101008', null, '其它方式减少');
INSERT INTO `t_flatcode` VALUES ('1799', 'eam-zcly', '资产来源', '001001', null, '统购');
INSERT INTO `t_flatcode` VALUES ('1800', 'eam-zcly', '资产来源', '001002', null, '自购');
INSERT INTO `t_flatcode` VALUES ('1801', 'eam-zcly', '资产来源', '001003', null, '团购');
INSERT INTO `t_flatcode` VALUES ('1802', 'eam-zcly', '资产来源', '002001', null, '融资租入');
INSERT INTO `t_flatcode` VALUES ('1803', 'eam-zcly', '资产来源', '003001', null, '盘盈');
INSERT INTO `t_flatcode` VALUES ('1804', 'eam-zcly', '资产来源', '004001', null, '在建工程转入');
INSERT INTO `t_flatcode` VALUES ('1805', 'eam-zcly', '资产来源', '005001', null, '捐赠');
INSERT INTO `t_flatcode` VALUES ('1806', 'eam-zcly', '资产来源', '006001', null, '其它增加方式');
INSERT INTO `t_flatcode` VALUES ('1807', 'eam-zcly', '资产来源', '007001', null, '对内变卖增加');
INSERT INTO `t_flatcode` VALUES ('1808', 'eam-zcly', '资产来源', '007002', null, '注销公司转入');
INSERT INTO `t_flatcode` VALUES ('1809', 'dm_yqsyfx', '仪器使用方向代码', '1', null, '教学');
INSERT INTO `t_flatcode` VALUES ('1810', 'dm_yqsyfx', '仪器使用方向代码', '2', null, '科研');
INSERT INTO `t_flatcode` VALUES ('1811', 'dm_yqsyfx', '仪器使用方向代码', '3', null, '行政');
INSERT INTO `t_flatcode` VALUES ('1812', 'dm_yqsyfx', '仪器使用方向代码', '4', null, '生活与后勤');
INSERT INTO `t_flatcode` VALUES ('1813', 'dm_yqsyfx', '仪器使用方向代码', '5', null, '生产');
INSERT INTO `t_flatcode` VALUES ('1814', 'dm_yqsyfx', '仪器使用方向代码', '6', null, '技术开发');
INSERT INTO `t_flatcode` VALUES ('1815', 'dm_yqsyfx', '仪器使用方向代码', '7', null, '社会服务');
INSERT INTO `t_flatcode` VALUES ('1816', 'dm_yqsyfx', '仪器使用方向代码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1817', 'dm_yqxz', '仪器现状代码', '1', null, '在用');
INSERT INTO `t_flatcode` VALUES ('1818', 'dm_yqxz', '仪器现状代码', '2', null, '闲置');
INSERT INTO `t_flatcode` VALUES ('1819', 'dm_yqxz', '仪器现状代码', '3', null, '待修');
INSERT INTO `t_flatcode` VALUES ('1820', 'dm_yqxz', '仪器现状代码', '4', null, '待报废');
INSERT INTO `t_flatcode` VALUES ('1821', 'dm_yqxz', '仪器现状代码', '5', null, '丢失');
INSERT INTO `t_flatcode` VALUES ('1822', 'dm_yqxz', '仪器现状代码', '6', null, '报废');
INSERT INTO `t_flatcode` VALUES ('1823', 'dm_yqxz', '仪器现状代码', '7', null, '调出');
INSERT INTO `t_flatcode` VALUES ('1824', 'dm_yqxz', '仪器现状代码', '8', null, '降档');
INSERT INTO `t_flatcode` VALUES ('1825', 'dm_yqxz', '仪器现状代码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1826', 'dm_jfkm', '经费科目代码', '1', null, '教育事业费');
INSERT INTO `t_flatcode` VALUES ('1827', 'dm_jfkm', '经费科目代码', '2', null, '科研专款及基金');
INSERT INTO `t_flatcode` VALUES ('1828', 'dm_jfkm', '经费科目代码', '3', null, '基建设备费');
INSERT INTO `t_flatcode` VALUES ('1829', 'dm_jfkm', '经费科目代码', '4', null, '自筹经费');
INSERT INTO `t_flatcode` VALUES ('1830', 'dm_jfkm', '经费科目代码', '5', null, '世界银行贷款');
INSERT INTO `t_flatcode` VALUES ('1831', 'dm_jfkm', '经费科目代码', '6', null, '捐款');
INSERT INTO `t_flatcode` VALUES ('1832', 'dm_jfkm', '经费科目代码', '7', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1833', 'dm_syzlb', '实验者类别代码', '1', null, '学生');
INSERT INTO `t_flatcode` VALUES ('1834', 'dm_syzlb', '实验者类别代码', '2', null, '教师');
INSERT INTO `t_flatcode` VALUES ('1835', 'dm_syzlb', '实验者类别代码', '3', null, '工程与实验技术人员');
INSERT INTO `t_flatcode` VALUES ('1836', 'dm_syzlb', '实验者类别代码', '4', null, '研究人员');
INSERT INTO `t_flatcode` VALUES ('1837', 'dm_syzlb', '实验者类别代码', '5', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1838', 'dm_syyq', '实验要求代码', '1', null, '必修');
INSERT INTO `t_flatcode` VALUES ('1839', 'dm_syyq', '实验要求代码', '2', null, '选修');
INSERT INTO `t_flatcode` VALUES ('1840', 'dm_syyq', '实验要求代码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1841', 'dm_sylb', '实验类别代码', '1', null, '基础、专业基础或技术基础');
INSERT INTO `t_flatcode` VALUES ('1842', 'dm_sylb', '实验类别代码', '2', null, '专业');
INSERT INTO `t_flatcode` VALUES ('1843', 'dm_sylb', '实验类别代码', '3', null, '科研');
INSERT INTO `t_flatcode` VALUES ('1844', 'dm_sylb', '实验类别代码', '4', null, '生产或技术开发');
INSERT INTO `t_flatcode` VALUES ('1845', 'dm_sylb', '实验类别代码', '9', null, '其他（含毕业论文和毕业设计实验）');
INSERT INTO `t_flatcode` VALUES ('1846', 'dm_syslb', '实验室类别代码', '1', null, '基础、专业基础或技术基础');
INSERT INTO `t_flatcode` VALUES ('1847', 'dm_syslb', '实验室类别代码', '2', null, '专业');
INSERT INTO `t_flatcode` VALUES ('1848', 'dm_syslb', '实验室类别代码', '3', null, '科研');
INSERT INTO `t_flatcode` VALUES ('1849', 'dm_syslb', '实验室类别代码', '9', null, '其他');
INSERT INTO `t_flatcode` VALUES ('1850', 'DM_XXDM', '高等学校代码', '10001', null, '北京大学');
INSERT INTO `t_flatcode` VALUES ('1851', 'DM_XXDM', '高等学校代码', '10002', null, '中国人民大学');
INSERT INTO `t_flatcode` VALUES ('1852', 'DM_XXDM', '高等学校代码', '10003', null, '清华大学');
INSERT INTO `t_flatcode` VALUES ('1853', 'DM_XXDM', '高等学校代码', '10004', null, '北方交通大学');
INSERT INTO `t_flatcode` VALUES ('1854', 'DM_XXDM', '高等学校代码', '10005', null, '北京工业大学');
INSERT INTO `t_flatcode` VALUES ('1855', 'DM_XXDM', '高等学校代码', '10006', null, '北京航空航天大学');
INSERT INTO `t_flatcode` VALUES ('1856', 'DM_XXDM', '高等学校代码', '10007', null, '北京理工大学');
INSERT INTO `t_flatcode` VALUES ('1857', 'DM_XXDM', '高等学校代码', '10008', null, '北京科技大学');
INSERT INTO `t_flatcode` VALUES ('1858', 'DM_XXDM', '高等学校代码', '10009', null, '北方工业大学');
INSERT INTO `t_flatcode` VALUES ('1859', 'DM_XXDM', '高等学校代码', '10010', null, '北京化工大学');
INSERT INTO `t_flatcode` VALUES ('1860', 'DM_XXDM', '高等学校代码', '10011', null, '北京工商大学');
INSERT INTO `t_flatcode` VALUES ('1861', 'DM_XXDM', '高等学校代码', '10012', null, '北京服装学院');
INSERT INTO `t_flatcode` VALUES ('1862', 'DM_XXDM', '高等学校代码', '10013', null, '北京邮电大学');
INSERT INTO `t_flatcode` VALUES ('1863', 'DM_XXDM', '高等学校代码', '10015', null, '北京印刷学院');
INSERT INTO `t_flatcode` VALUES ('1864', 'DM_XXDM', '高等学校代码', '10016', null, '北京建筑工程学院');
INSERT INTO `t_flatcode` VALUES ('1865', 'DM_XXDM', '高等学校代码', '10017', null, '北京石油化工学院');
INSERT INTO `t_flatcode` VALUES ('1866', 'DM_XXDM', '高等学校代码', '10018', null, '北京电子科技学院');
INSERT INTO `t_flatcode` VALUES ('1867', 'DM_XXDM', '高等学校代码', '10019', null, '中国农业大学');
INSERT INTO `t_flatcode` VALUES ('1868', 'DM_XXDM', '高等学校代码', '10020', null, '北京农学院');
INSERT INTO `t_flatcode` VALUES ('1869', 'DM_XXDM', '高等学校代码', '10022', null, '北京林业大学');
INSERT INTO `t_flatcode` VALUES ('1870', 'DM_XXDM', '高等学校代码', '10023', null, '中国协和医科大学');
INSERT INTO `t_flatcode` VALUES ('1871', 'DM_XXDM', '高等学校代码', '10025', null, '首都医科大学');
INSERT INTO `t_flatcode` VALUES ('1872', 'DM_XXDM', '高等学校代码', '10026', null, '北京中医药大学');
INSERT INTO `t_flatcode` VALUES ('1873', 'DM_XXDM', '高等学校代码', '10027', null, '北京师范大学');
INSERT INTO `t_flatcode` VALUES ('1874', 'DM_XXDM', '高等学校代码', '10028', null, '首都师范大学');
INSERT INTO `t_flatcode` VALUES ('1875', 'DM_XXDM', '高等学校代码', '10029', null, '首都体育学院');
INSERT INTO `t_flatcode` VALUES ('1876', 'DM_XXDM', '高等学校代码', '10030', null, '北京外国语大学');
INSERT INTO `t_flatcode` VALUES ('1877', 'DM_XXDM', '高等学校代码', '10031', null, '北京第二外国语学院');
INSERT INTO `t_flatcode` VALUES ('1878', 'DM_XXDM', '高等学校代码', '10032', null, '北京语言文化大学');
INSERT INTO `t_flatcode` VALUES ('1879', 'DM_XXDM', '高等学校代码', '10033', null, '北京广播学院');
INSERT INTO `t_flatcode` VALUES ('1880', 'DM_XXDM', '高等学校代码', '80000', null, '中共中央党校');
INSERT INTO `t_flatcode` VALUES ('1881', 'DM_XXDM', '高等学校代码', '80001', null, '航空航天部204所');
INSERT INTO `t_flatcode` VALUES ('1882', 'DM_XXDM', '高等学校代码', '80002', null, '中科院数学所');
INSERT INTO `t_flatcode` VALUES ('1883', 'DM_XXDM', '高等学校代码', '80007', null, '中科院力学研究所');
INSERT INTO `t_flatcode` VALUES ('1884', 'DM_XXDM', '高等学校代码', '80008', null, '中科院物理研究所');
INSERT INTO `t_flatcode` VALUES ('1885', 'DM_XXDM', '高等学校代码', '80009', null, '中科院高能物理所');
INSERT INTO `t_flatcode` VALUES ('1886', 'DM_XXDM', '高等学校代码', '80010', null, '中国科学院声学研');
INSERT INTO `t_flatcode` VALUES ('1887', 'DM_XXDM', '高等学校代码', '80012', null, '中科院理论物理所');
INSERT INTO `t_flatcode` VALUES ('1888', 'DM_XXDM', '高等学校代码', '80025', null, '中科院北京天文台');
INSERT INTO `t_flatcode` VALUES ('1889', 'DM_XXDM', '高等学校代码', '80032', null, '中科院化学研究所');
INSERT INTO `t_flatcode` VALUES ('1890', 'DM_XXDM', '高等学校代码', '80041', null, '中科院过程工程研究所');
INSERT INTO `t_flatcode` VALUES ('1891', 'DM_XXDM', '高等学校代码', '80042', null, '中科院生态环境所');
INSERT INTO `t_flatcode` VALUES ('1892', 'DM_XXDM', '高等学校代码', '80044', null, '中科院理化技术研究所');
INSERT INTO `t_flatcode` VALUES ('1893', 'DM_XXDM', '高等学校代码', '80052', null, '中科院地质研究所');
INSERT INTO `t_flatcode` VALUES ('1894', 'DM_XXDM', '高等学校代码', '80054', null, '中科院古脊椎所');
INSERT INTO `t_flatcode` VALUES ('1895', 'DM_XXDM', '高等学校代码', '80058', null, '中科院大气物理所');
INSERT INTO `t_flatcode` VALUES ('1896', 'DM_XXDM', '高等学校代码', '80060', null, '中科院地理科学与资源研究所');
INSERT INTO `t_flatcode` VALUES ('1897', 'DM_XXDM', '高等学校代码', '80073', null, '空间科学与应用研究中心');
INSERT INTO `t_flatcode` VALUES ('1898', 'DM_XXDM', '高等学校代码', '80074', null, '遥感卫星地面站');
INSERT INTO `t_flatcode` VALUES ('1899', 'DM_XXDM', '高等学校代码', '80103', null, '中科院动物研究所');
INSERT INTO `t_flatcode` VALUES ('1900', 'DM_XXDM', '高等学校代码', '80105', null, '中科院植物研究所');
INSERT INTO `t_flatcode` VALUES ('1901', 'DM_XXDM', '高等学校代码', '80112', null, '中科院生物物理所');
INSERT INTO `t_flatcode` VALUES ('1902', 'DM_XXDM', '高等学校代码', '80113', null, '中科院微生物所');
INSERT INTO `t_flatcode` VALUES ('1903', 'DM_XXDM', '高等学校代码', '80121', null, '中科院遗传研究所');
INSERT INTO `t_flatcode` VALUES ('1904', 'DM_XXDM', '高等学校代码', '80125', null, '中科院心理研究所');
INSERT INTO `t_flatcode` VALUES ('1905', 'DM_XXDM', '高等学校代码', '80132', null, '中科院计算技术所');
INSERT INTO `t_flatcode` VALUES ('1906', 'DM_XXDM', '高等学校代码', '80135', null, '中科院工程热物理');
INSERT INTO `t_flatcode` VALUES ('1907', 'DM_XXDM', '高等学校代码', '80136', null, '中科院半导体所');
INSERT INTO `t_flatcode` VALUES ('1908', 'DM_XXDM', '高等学校代码', '80137', null, '中科院电子学所');
INSERT INTO `t_flatcode` VALUES ('1909', 'DM_XXDM', '高等学校代码', '80146', null, '中科院自动化所');
INSERT INTO `t_flatcode` VALUES ('1910', 'DM_XXDM', '高等学校代码', '80148', null, '中科院电工研究所');
INSERT INTO `t_flatcode` VALUES ('1911', 'DM_XXDM', '高等学校代码', '80150', null, '中科院软件研究所');
INSERT INTO `t_flatcode` VALUES ('1912', 'DM_XXDM', '高等学校代码', '80152', null, '中科院北京科学仪器研制中心');
INSERT INTO `t_flatcode` VALUES ('1913', 'DM_XXDM', '高等学校代码', '80155', null, '中科院文献情报中心');
INSERT INTO `t_flatcode` VALUES ('1914', 'DM_XXDM', '高等学校代码', '80164', null, '科技政策和管理研究所');
INSERT INTO `t_flatcode` VALUES ('1915', 'DM_XXDM', '高等学校代码', '80169', null, '中科院微电子中心');
INSERT INTO `t_flatcode` VALUES ('1916', 'DM_XXDM', '高等学校代码', '83224', null, '航天部二院十七所');
INSERT INTO `t_flatcode` VALUES ('1917', 'DM_XXDM', '高等学校代码', '83225', null, '航天部二院23所');
INSERT INTO `t_flatcode` VALUES ('1918', 'DM_XXDM', '高等学校代码', '83226', null, '航天部二院25所');
INSERT INTO `t_flatcode` VALUES ('1919', 'DM_XXDM', '高等学校代码', '83227', null, '航天工业总公司二院203所');
INSERT INTO `t_flatcode` VALUES ('1920', 'DM_XXDM', '高等学校代码', '83228', null, '航天部二院206所');
INSERT INTO `t_flatcode` VALUES ('1921', 'DM_XXDM', '高等学校代码', '83229', null, '航天部二院207所');
INSERT INTO `t_flatcode` VALUES ('1922', 'DM_XXDM', '高等学校代码', '83231', null, '航天部二院706所');
INSERT INTO `t_flatcode` VALUES ('1923', 'DM_XXDM', '高等学校代码', '83232', null, '北京信息控制研究所');
INSERT INTO `t_flatcode` VALUES ('1924', 'DM_XXDM', '高等学校代码', '83241', null, '航空航天部第3研究院31所');
INSERT INTO `t_flatcode` VALUES ('1925', 'DM_XXDM', '高等学校代码', '83242', null, '航天部第三研究院第三设计部');
INSERT INTO `t_flatcode` VALUES ('1926', 'DM_XXDM', '高等学校代码', '83244', null, '航天部三院33所');
INSERT INTO `t_flatcode` VALUES ('1927', 'DM_XXDM', '高等学校代码', '83248', null, '航天部三院8359所');
INSERT INTO `t_flatcode` VALUES ('1928', 'DM_XXDM', '高等学校代码', '83274', null, '航空航天部503所');
INSERT INTO `t_flatcode` VALUES ('1929', 'DM_XXDM', '高等学校代码', '83275', null, '航空工业总公司628所');
INSERT INTO `t_flatcode` VALUES ('1930', 'DM_XXDM', '高等学校代码', '83277', null, '北京空气动力所');
INSERT INTO `t_flatcode` VALUES ('1931', 'DM_XXDM', '高等学校代码', '83280', null, '中国北方车辆研究所');
INSERT INTO `t_flatcode` VALUES ('1932', 'DM_XXDM', '高等学校代码', '83281', null, '中国工程物理研究院研究生部');
INSERT INTO `t_flatcode` VALUES ('1933', 'DM_XXDM', '高等学校代码', '83401', null, '石油勘探开发科学所');
INSERT INTO `t_flatcode` VALUES ('1934', 'DM_XXDM', '高等学校代码', '83501', null, '北京化工研究院');
INSERT INTO `t_flatcode` VALUES ('1935', 'DM_XXDM', '高等学校代码', '83504', null, '北京橡胶工业研究院');
INSERT INTO `t_flatcode` VALUES ('1936', 'DM_XXDM', '高等学校代码', '83706', null, '北京制浆造纸研究所');
INSERT INTO `t_flatcode` VALUES ('1937', 'DM_XXDM', '高等学校代码', '83801', null, '铁道部科学研究院');
INSERT INTO `t_flatcode` VALUES ('1938', 'DM_XXDM', '高等学校代码', '83902', null, '交通部公路科研院');
INSERT INTO `t_flatcode` VALUES ('1939', 'DM_XXDM', '高等学校代码', '84001', null, '邮电科学研究院');
INSERT INTO `t_flatcode` VALUES ('1940', 'DM_XXDM', '高等学校代码', '84201', null, '中国艺术研究院');
INSERT INTO `t_flatcode` VALUES ('1941', 'DM_XXDM', '高等学校代码', '84501', null, '中国预防医科院');
INSERT INTO `t_flatcode` VALUES ('1942', 'DM_XXDM', '高等学校代码', '84502', null, '中国中医研究院');
INSERT INTO `t_flatcode` VALUES ('1943', 'DM_XXDM', '高等学校代码', '84503', null, '中国药品生物制品检定所');
INSERT INTO `t_flatcode` VALUES ('1944', 'DM_XXDM', '高等学校代码', '84508', null, '中日临床医学所');
INSERT INTO `t_flatcode` VALUES ('1945', 'DM_XXDM', '高等学校代码', '84509', null, '卫生部老年所');
INSERT INTO `t_flatcode` VALUES ('1946', 'DM_XXDM', '高等学校代码', '84511', null, '北京生物制品所');
INSERT INTO `t_flatcode` VALUES ('1947', 'DM_XXDM', '高等学校代码', '84901', null, '建筑材料科学研究');
INSERT INTO `t_flatcode` VALUES ('1948', 'DM_XXDM', '高等学校代码', '85101', null, '气象科学研究院');
INSERT INTO `t_flatcode` VALUES ('1949', 'DM_XXDM', '高等学校代码', '85304', null, '海洋环境预报中心');
INSERT INTO `t_flatcode` VALUES ('1950', 'DM_XXDM', '高等学校代码', '85401', null, '地震局地球物理所');
INSERT INTO `t_flatcode` VALUES ('1951', 'DM_XXDM', '高等学校代码', '85402', null, '地震局地质研究所');
INSERT INTO `t_flatcode` VALUES ('1952', 'DM_XXDM', '高等学校代码', '10859', null, '民办天狮职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1953', 'DM_XXDM', '高等学校代码', '10860', null, '天津工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1954', 'DM_XXDM', '高等学校代码', '11032', null, '天津职业大学');
INSERT INTO `t_flatcode` VALUES ('1955', 'DM_XXDM', '高等学校代码', '12105', null, '天津中德职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1956', 'DM_XXDM', '高等学校代码', '12484', null, '天津滨海职业学院');
INSERT INTO `t_flatcode` VALUES ('1957', 'DM_XXDM', '高等学校代码', '12487', null, '大港工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1958', 'DM_XXDM', '高等学校代码', '12535', null, '天津青年职业学院');
INSERT INTO `t_flatcode` VALUES ('1959', 'DM_XXDM', '高等学校代码', '12719', null, '天津渤海职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1960', 'DM_XXDM', '高等学校代码', '12720', null, '天津电子信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1961', 'DM_XXDM', '高等学校代码', '12721', null, '天津机电职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1962', 'DM_XXDM', '高等学校代码', '12722', null, '天津现代职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1963', 'DM_XXDM', '高等学校代码', '12723', null, '天津公安警官职业学院');
INSERT INTO `t_flatcode` VALUES ('1964', 'DM_XXDM', '高等学校代码', '12732', null, '天津轻工职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1965', 'DM_XXDM', '高等学校代码', '12788', null, '天津对外经济贸易职业学院');
INSERT INTO `t_flatcode` VALUES ('1966', 'DM_XXDM', '高等学校代码', '12803', null, '天津工商职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1967', 'DM_XXDM', '高等学校代码', '10075', null, '河北大学');
INSERT INTO `t_flatcode` VALUES ('1968', 'DM_XXDM', '高等学校代码', '10076', null, '河北建筑科技学院');
INSERT INTO `t_flatcode` VALUES ('1969', 'DM_XXDM', '高等学校代码', '10077', null, '石家庄经济学院');
INSERT INTO `t_flatcode` VALUES ('1970', 'DM_XXDM', '高等学校代码', '10079', null, '华北电力大学');
INSERT INTO `t_flatcode` VALUES ('1971', 'DM_XXDM', '高等学校代码', '10080', null, '河北工业大学');
INSERT INTO `t_flatcode` VALUES ('1972', 'DM_XXDM', '高等学校代码', '10081', null, '河北理工学院');
INSERT INTO `t_flatcode` VALUES ('1973', 'DM_XXDM', '高等学校代码', '10082', null, '河北科技大学');
INSERT INTO `t_flatcode` VALUES ('1974', 'DM_XXDM', '高等学校代码', '10084', null, '河北建筑工程学院');
INSERT INTO `t_flatcode` VALUES ('1975', 'DM_XXDM', '高等学校代码', '10085', null, '河北工程技术高等专科学校');
INSERT INTO `t_flatcode` VALUES ('1976', 'DM_XXDM', '高等学校代码', '10086', null, '河北农业大学');
INSERT INTO `t_flatcode` VALUES ('1977', 'DM_XXDM', '高等学校代码', '10087', null, '张家口农业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('1978', 'DM_XXDM', '高等学校代码', '10089', null, '河北医科大学');
INSERT INTO `t_flatcode` VALUES ('1979', 'DM_XXDM', '高等学校代码', '10090', null, '华北煤炭医学院');
INSERT INTO `t_flatcode` VALUES ('1980', 'DM_XXDM', '高等学校代码', '10092', null, '张家口医学院');
INSERT INTO `t_flatcode` VALUES ('1981', 'DM_XXDM', '高等学校代码', '10093', null, '承德医学院');
INSERT INTO `t_flatcode` VALUES ('1982', 'DM_XXDM', '高等学校代码', '10094', null, '河北师范大学');
INSERT INTO `t_flatcode` VALUES ('1983', 'DM_XXDM', '高等学校代码', '10096', null, '保定师范专科学校');
INSERT INTO `t_flatcode` VALUES ('1984', 'DM_XXDM', '高等学校代码', '10097', null, '张家口师范专科学校');
INSERT INTO `t_flatcode` VALUES ('1985', 'DM_XXDM', '高等学校代码', '10098', null, '承德民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('1986', 'DM_XXDM', '高等学校代码', '12773', null, '秦皇岛职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1987', 'DM_XXDM', '高等学校代码', '12782', null, '石家庄计算机职业学院');
INSERT INTO `t_flatcode` VALUES ('1988', 'DM_XXDM', '高等学校代码', '12783', null, '邯郸中原外国语职业学院');
INSERT INTO `t_flatcode` VALUES ('1989', 'DM_XXDM', '高等学校代码', '12784', null, '石家庄影视艺术职业学院');
INSERT INTO `t_flatcode` VALUES ('1990', 'DM_XXDM', '高等学校代码', '12785', null, '唐山职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1991', 'DM_XXDM', '高等学校代码', '12786', null, '衡水职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1992', 'DM_XXDM', '高等学校代码', '12787', null, '唐山工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('1993', 'DM_XXDM', '高等学校代码', '12796', null, '石家庄法商职业学院');
INSERT INTO `t_flatcode` VALUES ('1994', 'DM_XXDM', '高等学校代码', '83004', null, '河北半导体研究所');
INSERT INTO `t_flatcode` VALUES ('1995', 'DM_XXDM', '高等学校代码', '83010', null, '通信测控技术研究');
INSERT INTO `t_flatcode` VALUES ('1996', 'DM_XXDM', '高等学校代码', '10108', null, '山西大学');
INSERT INTO `t_flatcode` VALUES ('1997', 'DM_XXDM', '高等学校代码', '10109', null, '太原重型机械学院');
INSERT INTO `t_flatcode` VALUES ('1998', 'DM_XXDM', '高等学校代码', '10110', null, '华北工学院');
INSERT INTO `t_flatcode` VALUES ('1999', 'DM_XXDM', '高等学校代码', '10112', null, '太原理工大学');
INSERT INTO `t_flatcode` VALUES ('2000', 'DM_XXDM', '高等学校代码', '10113', null, '山西农业大学');
INSERT INTO `t_flatcode` VALUES ('2001', 'DM_XXDM', '高等学校代码', '10114', null, '山西医科大学');
INSERT INTO `t_flatcode` VALUES ('2002', 'DM_XXDM', '高等学校代码', '10116', null, '大同医学专科学校');
INSERT INTO `t_flatcode` VALUES ('2003', 'DM_XXDM', '高等学校代码', '10117', null, '长治医学院');
INSERT INTO `t_flatcode` VALUES ('2004', 'DM_XXDM', '高等学校代码', '10118', null, '山西师范大学');
INSERT INTO `t_flatcode` VALUES ('2005', 'DM_XXDM', '高等学校代码', '10119', null, '太原师范学院');
INSERT INTO `t_flatcode` VALUES ('2006', 'DM_XXDM', '高等学校代码', '10120', null, '雁北师范学院');
INSERT INTO `t_flatcode` VALUES ('2007', 'DM_XXDM', '高等学校代码', '10121', null, '晋中师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2008', 'DM_XXDM', '高等学校代码', '10122', null, '晋东南师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2009', 'DM_XXDM', '高等学校代码', '10123', null, '运城高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2010', 'DM_XXDM', '高等学校代码', '10124', null, '忻州师范学院');
INSERT INTO `t_flatcode` VALUES ('2011', 'DM_XXDM', '高等学校代码', '10125', null, '山西财经大学');
INSERT INTO `t_flatcode` VALUES ('2012', 'DM_XXDM', '高等学校代码', '10805', null, '太原电力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2013', 'DM_XXDM', '高等学校代码', '10809', null, '山西中医学院');
INSERT INTO `t_flatcode` VALUES ('2014', 'DM_XXDM', '高等学校代码', '10812', null, '吕梁高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2015', 'DM_XXDM', '高等学校代码', '11242', null, '太原大学');
INSERT INTO `t_flatcode` VALUES ('2016', 'DM_XXDM', '高等学校代码', '11243', null, '大同职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2017', 'DM_XXDM', '高等学校代码', '11245', null, '山西矿业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2018', 'DM_XXDM', '高等学校代码', '11630', null, '山西财政税务专科学校');
INSERT INTO `t_flatcode` VALUES ('2019', 'DM_XXDM', '高等学校代码', '12111', null, '山西警官高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2020', 'DM_XXDM', '高等学校代码', '10140', null, '辽宁大学');
INSERT INTO `t_flatcode` VALUES ('2021', 'DM_XXDM', '高等学校代码', '10141', null, '大连理工大学');
INSERT INTO `t_flatcode` VALUES ('2022', 'DM_XXDM', '高等学校代码', '10142', null, '沈阳工业大学');
INSERT INTO `t_flatcode` VALUES ('2023', 'DM_XXDM', '高等学校代码', '10143', null, '沈阳航空工业学院');
INSERT INTO `t_flatcode` VALUES ('2024', 'DM_XXDM', '高等学校代码', '10144', null, '沈阳工业学院');
INSERT INTO `t_flatcode` VALUES ('2025', 'DM_XXDM', '高等学校代码', '10145', null, '东北大学');
INSERT INTO `t_flatcode` VALUES ('2026', 'DM_XXDM', '高等学校代码', '10146', null, '鞍山钢铁学院');
INSERT INTO `t_flatcode` VALUES ('2027', 'DM_XXDM', '高等学校代码', '10147', null, '辽宁工程技术大学');
INSERT INTO `t_flatcode` VALUES ('2028', 'DM_XXDM', '高等学校代码', '10148', null, '抚顺石油学院');
INSERT INTO `t_flatcode` VALUES ('2029', 'DM_XXDM', '高等学校代码', '10149', null, '沈阳化工学院');
INSERT INTO `t_flatcode` VALUES ('2030', 'DM_XXDM', '高等学校代码', '10150', null, '大连铁道学院');
INSERT INTO `t_flatcode` VALUES ('2031', 'DM_XXDM', '高等学校代码', '10151', null, '大连海事大学');
INSERT INTO `t_flatcode` VALUES ('2032', 'DM_XXDM', '高等学校代码', '10152', null, '大连轻工业学院');
INSERT INTO `t_flatcode` VALUES ('2033', 'DM_XXDM', '高等学校代码', '10153', null, '沈阳建筑工程学院');
INSERT INTO `t_flatcode` VALUES ('2034', 'DM_XXDM', '高等学校代码', '10154', null, '辽宁工学院');
INSERT INTO `t_flatcode` VALUES ('2035', 'DM_XXDM', '高等学校代码', '10157', null, '沈阳农业大学');
INSERT INTO `t_flatcode` VALUES ('2036', 'DM_XXDM', '高等学校代码', '10158', null, '大连水产学院');
INSERT INTO `t_flatcode` VALUES ('2037', 'DM_XXDM', '高等学校代码', '10159', null, '中国医科大学');
INSERT INTO `t_flatcode` VALUES ('2038', 'DM_XXDM', '高等学校代码', '10160', null, '锦州医学院');
INSERT INTO `t_flatcode` VALUES ('2039', 'DM_XXDM', '高等学校代码', '10161', null, '大连医科大学');
INSERT INTO `t_flatcode` VALUES ('2040', 'DM_XXDM', '高等学校代码', '10162', null, '辽宁中医学院');
INSERT INTO `t_flatcode` VALUES ('2041', 'DM_XXDM', '高等学校代码', '10163', null, '沈阳药科大学');
INSERT INTO `t_flatcode` VALUES ('2042', 'DM_XXDM', '高等学校代码', '10164', null, '沈阳医学院');
INSERT INTO `t_flatcode` VALUES ('2043', 'DM_XXDM', '高等学校代码', '10165', null, '辽宁师范大学');
INSERT INTO `t_flatcode` VALUES ('2044', 'DM_XXDM', '高等学校代码', '10166', null, '沈阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2045', 'DM_XXDM', '高等学校代码', '10167', null, '锦州师范学院');
INSERT INTO `t_flatcode` VALUES ('2046', 'DM_XXDM', '高等学校代码', '10169', null, '鞍山师范学院');
INSERT INTO `t_flatcode` VALUES ('2047', 'DM_XXDM', '高等学校代码', '10170', null, '丹东职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2048', 'DM_XXDM', '高等学校代码', '10171', null, '朝阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2049', 'DM_XXDM', '高等学校代码', '10172', null, '大连外国语学院');
INSERT INTO `t_flatcode` VALUES ('2050', 'DM_XXDM', '高等学校代码', '10173', null, '东北财经大学');
INSERT INTO `t_flatcode` VALUES ('2051', 'DM_XXDM', '高等学校代码', '10174', null, '辽宁商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2052', 'DM_XXDM', '高等学校代码', '10175', null, '中国刑事警察学院');
INSERT INTO `t_flatcode` VALUES ('2053', 'DM_XXDM', '高等学校代码', '10176', null, '沈阳体育学院');
INSERT INTO `t_flatcode` VALUES ('2054', 'DM_XXDM', '高等学校代码', '10177', null, '沈阳音乐学院');
INSERT INTO `t_flatcode` VALUES ('2055', 'DM_XXDM', '高等学校代码', '82607', null, '鞍山热能研究院');
INSERT INTO `t_flatcode` VALUES ('2056', 'DM_XXDM', '高等学校代码', '82705', null, '沈阳铸造研究所');
INSERT INTO `t_flatcode` VALUES ('2057', 'DM_XXDM', '高等学校代码', '82903', null, '六零一所');
INSERT INTO `t_flatcode` VALUES ('2058', 'DM_XXDM', '高等学校代码', '82905', null, '六零六所');
INSERT INTO `t_flatcode` VALUES ('2059', 'DM_XXDM', '高等学校代码', '82929', null, '航空工业总公司626所');
INSERT INTO `t_flatcode` VALUES ('2060', 'DM_XXDM', '高等学校代码', '83304', null, '煤科总院抚顺分院');
INSERT INTO `t_flatcode` VALUES ('2061', 'DM_XXDM', '高等学校代码', '83503', null, '沈阳化工研究院');
INSERT INTO `t_flatcode` VALUES ('2062', 'DM_XXDM', '高等学校代码', '10183', null, '吉林大学');
INSERT INTO `t_flatcode` VALUES ('2063', 'DM_XXDM', '高等学校代码', '10184', null, '延边大学');
INSERT INTO `t_flatcode` VALUES ('2064', 'DM_XXDM', '高等学校代码', '10186', null, '长春光学精密机械学院');
INSERT INTO `t_flatcode` VALUES ('2065', 'DM_XXDM', '高等学校代码', '10188', null, '东北电力学院');
INSERT INTO `t_flatcode` VALUES ('2066', 'DM_XXDM', '高等学校代码', '10190', null, '吉林工学院');
INSERT INTO `t_flatcode` VALUES ('2067', 'DM_XXDM', '高等学校代码', '10191', null, '吉林建筑工程学院');
INSERT INTO `t_flatcode` VALUES ('2068', 'DM_XXDM', '高等学校代码', '10192', null, '吉林化工学院');
INSERT INTO `t_flatcode` VALUES ('2069', 'DM_XXDM', '高等学校代码', '10193', null, '吉林农业大学');
INSERT INTO `t_flatcode` VALUES ('2070', 'DM_XXDM', '高等学校代码', '10199', null, '长春中医学院');
INSERT INTO `t_flatcode` VALUES ('2071', 'DM_XXDM', '高等学校代码', '10200', null, '东北师范大学');
INSERT INTO `t_flatcode` VALUES ('2072', 'DM_XXDM', '高等学校代码', '10201', null, '北华大学');
INSERT INTO `t_flatcode` VALUES ('2073', 'DM_XXDM', '高等学校代码', '10202', null, '通化师范学院');
INSERT INTO `t_flatcode` VALUES ('2074', 'DM_XXDM', '高等学校代码', '10203', null, '四平师范学院');
INSERT INTO `t_flatcode` VALUES ('2075', 'DM_XXDM', '高等学校代码', '10204', null, '吉林职业师范学院');
INSERT INTO `t_flatcode` VALUES ('2076', 'DM_XXDM', '高等学校代码', '10205', null, '长春师范学院');
INSERT INTO `t_flatcode` VALUES ('2077', 'DM_XXDM', '高等学校代码', '10206', null, '白城师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2078', 'DM_XXDM', '高等学校代码', '10207', null, '长春税务学院');
INSERT INTO `t_flatcode` VALUES ('2079', 'DM_XXDM', '高等学校代码', '10208', null, '吉林体育学院');
INSERT INTO `t_flatcode` VALUES ('2080', 'DM_XXDM', '高等学校代码', '10209', null, '吉林艺术学院');
INSERT INTO `t_flatcode` VALUES ('2081', 'DM_XXDM', '高等学校代码', '10847', null, '辽源职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2082', 'DM_XXDM', '高等学校代码', '10964', null, '民办吉林华桥外语职业学院');
INSERT INTO `t_flatcode` VALUES ('2083', 'DM_XXDM', '高等学校代码', '11044', null, '四平职业大学');
INSERT INTO `t_flatcode` VALUES ('2084', 'DM_XXDM', '高等学校代码', '11261', null, '吉林财税高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2085', 'DM_XXDM', '高等学校代码', '11262', null, '吉林商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2086', 'DM_XXDM', '高等学校代码', '11263', null, '吉林粮食高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2087', 'DM_XXDM', '高等学校代码', '11436', null, '长春汽车工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2088', 'DM_XXDM', '高等学校代码', '11437', null, '长春工程学院');
INSERT INTO `t_flatcode` VALUES ('2089', 'DM_XXDM', '高等学校代码', '10240', null, '哈尔滨商业大学');
INSERT INTO `t_flatcode` VALUES ('2090', 'DM_XXDM', '高等学校代码', '10242', null, '哈尔滨体育学院');
INSERT INTO `t_flatcode` VALUES ('2091', 'DM_XXDM', '高等学校代码', '10243', null, '黑龙江水利专科学校');
INSERT INTO `t_flatcode` VALUES ('2092', 'DM_XXDM', '高等学校代码', '10244', null, '黑龙江农垦师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2093', 'DM_XXDM', '高等学校代码', '10245', null, '哈尔滨金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2094', 'DM_XXDM', '高等学校代码', '10872', null, '伊春职业学院');
INSERT INTO `t_flatcode` VALUES ('2095', 'DM_XXDM', '高等学校代码', '11046', null, '牡丹江大学');
INSERT INTO `t_flatcode` VALUES ('2096', 'DM_XXDM', '高等学校代码', '11230', null, '齐齐哈尔医学院');
INSERT INTO `t_flatcode` VALUES ('2097', 'DM_XXDM', '高等学校代码', '11445', null, '鸡西大学');
INSERT INTO `t_flatcode` VALUES ('2098', 'DM_XXDM', '高等学校代码', '11446', null, '民办黑龙江东方学院');
INSERT INTO `t_flatcode` VALUES ('2099', 'DM_XXDM', '高等学校代码', '11802', null, '黑龙江工程学院');
INSERT INTO `t_flatcode` VALUES ('2100', 'DM_XXDM', '高等学校代码', '11830', null, '鸡西煤炭医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2101', 'DM_XXDM', '高等学校代码', '12053', null, '黑龙江建筑职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2102', 'DM_XXDM', '高等学校代码', '12718', null, '大庆职业学院');
INSERT INTO `t_flatcode` VALUES ('2103', 'DM_XXDM', '高等学校代码', '12724', null, '黑龙江林业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2104', 'DM_XXDM', '高等学校代码', '12725', null, '黑龙江农业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2105', 'DM_XXDM', '高等学校代码', '12726', null, '黑龙江农业工程职业学院');
INSERT INTO `t_flatcode` VALUES ('2106', 'DM_XXDM', '高等学校代码', '12727', null, '黑龙江农垦职业学院');
INSERT INTO `t_flatcode` VALUES ('2107', 'DM_XXDM', '高等学校代码', '12728', null, '黑龙江司法警官职业学院');
INSERT INTO `t_flatcode` VALUES ('2108', 'DM_XXDM', '高等学校代码', '12729', null, '齐齐哈尔职业学院');
INSERT INTO `t_flatcode` VALUES ('2109', 'DM_XXDM', '高等学校代码', '82706', null, '哈尔滨焊接研究所');
INSERT INTO `t_flatcode` VALUES ('2110', 'DM_XXDM', '高等学校代码', '82928', null, '中国航空工业总公司627所');
INSERT INTO `t_flatcode` VALUES ('2111', 'DM_XXDM', '高等学校代码', '85406', null, '中国地震局工程力学研究所');
INSERT INTO `t_flatcode` VALUES ('2112', 'DM_XXDM', '高等学校代码', '86209', null, '哈市船舶锅炉涡轮机研究所');
INSERT INTO `t_flatcode` VALUES ('2113', 'DM_XXDM', '高等学校代码', '87801', null, '黑龙江省中医研究院');
INSERT INTO `t_flatcode` VALUES ('2114', 'DM_XXDM', '高等学校代码', '87802', null, '黑龙江省社会科学院');
INSERT INTO `t_flatcode` VALUES ('2115', 'DM_XXDM', '高等学校代码', '87804', null, '黑龙江省科学院');
INSERT INTO `t_flatcode` VALUES ('2116', 'DM_XXDM', '高等学校代码', '89623', null, '中共黑龙江省委党校');
INSERT INTO `t_flatcode` VALUES ('2117', 'DM_XXDM', '高等学校代码', '10246', null, '复旦大学');
INSERT INTO `t_flatcode` VALUES ('2118', 'DM_XXDM', '高等学校代码', '10247', null, '同济大学');
INSERT INTO `t_flatcode` VALUES ('2119', 'DM_XXDM', '高等学校代码', '10248', null, '上海交通大学');
INSERT INTO `t_flatcode` VALUES ('2120', 'DM_XXDM', '高等学校代码', '10251', null, '华东理工大学');
INSERT INTO `t_flatcode` VALUES ('2121', 'DM_XXDM', '高等学校代码', '10252', null, '上海理工大学');
INSERT INTO `t_flatcode` VALUES ('2122', 'DM_XXDM', '高等学校代码', '10254', null, '上海海运学院');
INSERT INTO `t_flatcode` VALUES ('2123', 'DM_XXDM', '高等学校代码', '12799', null, '民办上海建桥职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2124', 'DM_XXDM', '高等学校代码', '12800', null, '民办上海工商外国语职业学院');
INSERT INTO `t_flatcode` VALUES ('2125', 'DM_XXDM', '高等学校代码', '12801', null, '上海科学技术职业学院');
INSERT INTO `t_flatcode` VALUES ('2126', 'DM_XXDM', '高等学校代码', '80014', null, '中科院上海原子核研究所');
INSERT INTO `t_flatcode` VALUES ('2127', 'DM_XXDM', '高等学校代码', '80022', null, '中科院上海天文台');
INSERT INTO `t_flatcode` VALUES ('2128', 'DM_XXDM', '高等学校代码', '80026', null, '中科院东海站');
INSERT INTO `t_flatcode` VALUES ('2129', 'DM_XXDM', '高等学校代码', '80035', null, '中科院上海有机化学所');
INSERT INTO `t_flatcode` VALUES ('2130', 'DM_XXDM', '高等学校代码', '80040', null, '中科院上海硅酸盐所');
INSERT INTO `t_flatcode` VALUES ('2131', 'DM_XXDM', '高等学校代码', '80116', null, '中科院上海生命科学研究院');
INSERT INTO `t_flatcode` VALUES ('2132', 'DM_XXDM', '高等学校代码', '80123', null, '中科院上海药物研究所');
INSERT INTO `t_flatcode` VALUES ('2133', 'DM_XXDM', '高等学校代码', '80138', null, '中科院上海冶金研究所');
INSERT INTO `t_flatcode` VALUES ('2134', 'DM_XXDM', '高等学校代码', '80140', null, '中科院上海光机研究所');
INSERT INTO `t_flatcode` VALUES ('2135', 'DM_XXDM', '高等学校代码', '80143', null, '中科院上海技术物理所');
INSERT INTO `t_flatcode` VALUES ('2136', 'DM_XXDM', '高等学校代码', '82707', null, '上海材料研究所');
INSERT INTO `t_flatcode` VALUES ('2137', 'DM_XXDM', '高等学校代码', '82717', null, '上海发电设备成套设计研究所');
INSERT INTO `t_flatcode` VALUES ('2138', 'DM_XXDM', '高等学校代码', '82718', null, '上海内燃机研究所');
INSERT INTO `t_flatcode` VALUES ('2139', 'DM_XXDM', '高等学校代码', '82805', null, '上海核工程研究设计院');
INSERT INTO `t_flatcode` VALUES ('2140', 'DM_XXDM', '高等学校代码', '83009', null, '华东计算技术研究');
INSERT INTO `t_flatcode` VALUES ('2141', 'DM_XXDM', '高等学校代码', '83285', null, '上海航天技术研究院');
INSERT INTO `t_flatcode` VALUES ('2142', 'DM_XXDM', '高等学校代码', '83303', null, '煤炭科学研究总院上海分院');
INSERT INTO `t_flatcode` VALUES ('2143', 'DM_XXDM', '高等学校代码', '83502', null, '上海化工研究院');
INSERT INTO `t_flatcode` VALUES ('2144', 'DM_XXDM', '高等学校代码', '83703', null, '上海香料研究所');
INSERT INTO `t_flatcode` VALUES ('2145', 'DM_XXDM', '高等学校代码', '83901', null, '上海船舶运输科学研究院');
INSERT INTO `t_flatcode` VALUES ('2146', 'DM_XXDM', '高等学校代码', '84002', null, '电信科学技术第一研究所');
INSERT INTO `t_flatcode` VALUES ('2147', 'DM_XXDM', '高等学校代码', '84505', null, '上海生物制品研究所');
INSERT INTO `t_flatcode` VALUES ('2148', 'DM_XXDM', '高等学校代码', '85901', null, '上海医药工业研究院');
INSERT INTO `t_flatcode` VALUES ('2149', 'DM_XXDM', '高等学校代码', '86206', null, '中国船舶及海洋工程研究院');
INSERT INTO `t_flatcode` VALUES ('2150', 'DM_XXDM', '高等学校代码', '86207', null, '上海船舶设备研究所');
INSERT INTO `t_flatcode` VALUES ('2151', 'DM_XXDM', '高等学校代码', '86208', null, '上海船用柴油机研究所');
INSERT INTO `t_flatcode` VALUES ('2152', 'DM_XXDM', '高等学校代码', '87901', null, '上海市计算技术研究所');
INSERT INTO `t_flatcode` VALUES ('2153', 'DM_XXDM', '高等学校代码', '87902', null, '上海国际问题研究所');
INSERT INTO `t_flatcode` VALUES ('2154', 'DM_XXDM', '高等学校代码', '87903', null, '上海社会科学院研究生部');
INSERT INTO `t_flatcode` VALUES ('2155', 'DM_XXDM', '高等学校代码', '87904', null, '上海市飞机研究所');
INSERT INTO `t_flatcode` VALUES ('2156', 'DM_XXDM', '高等学校代码', '87905', null, '农科院上海家畜寄生虫病研究');
INSERT INTO `t_flatcode` VALUES ('2157', 'DM_XXDM', '高等学校代码', '10826', null, '民办明达职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2158', 'DM_XXDM', '高等学校代码', '10848', null, '无锡职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2159', 'DM_XXDM', '高等学校代码', '10849', null, '徐州建筑职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2160', 'DM_XXDM', '高等学校代码', '10850', null, '南京工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2161', 'DM_XXDM', '高等学校代码', '10958', null, '南通纺织职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2162', 'DM_XXDM', '高等学校代码', '10960', null, '苏州工艺美术职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2163', 'DM_XXDM', '高等学校代码', '11048', null, '金陵职业大学');
INSERT INTO `t_flatcode` VALUES ('2164', 'DM_XXDM', '高等学校代码', '11049', null, '淮阴工学院');
INSERT INTO `t_flatcode` VALUES ('2165', 'DM_XXDM', '高等学校代码', '11050', null, '连云港职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2166', 'DM_XXDM', '高等学校代码', '11051', null, '镇江市高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2167', 'DM_XXDM', '高等学校代码', '11052', null, '南通职业大学');
INSERT INTO `t_flatcode` VALUES ('2168', 'DM_XXDM', '高等学校代码', '11053', null, '彭城职业大学');
INSERT INTO `t_flatcode` VALUES ('2169', 'DM_XXDM', '高等学校代码', '11054', null, '苏州职业大学');
INSERT INTO `t_flatcode` VALUES ('2170', 'DM_XXDM', '高等学校代码', '11055', null, '常州工学院');
INSERT INTO `t_flatcode` VALUES ('2171', 'DM_XXDM', '高等学校代码', '11117', null, '扬州大学');
INSERT INTO `t_flatcode` VALUES ('2172', 'DM_XXDM', '高等学校代码', '11122', null, '民办三江学院');
INSERT INTO `t_flatcode` VALUES ('2173', 'DM_XXDM', '高等学校代码', '11276', null, '南京工程学院');
INSERT INTO `t_flatcode` VALUES ('2174', 'DM_XXDM', '高等学校代码', '11280', null, '南京金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2175', 'DM_XXDM', '高等学校代码', '11287', null, '南京审计学院');
INSERT INTO `t_flatcode` VALUES ('2176', 'DM_XXDM', '高等学校代码', '11288', null, '沙洲职业工学院');
INSERT INTO `t_flatcode` VALUES ('2177', 'DM_XXDM', '高等学校代码', '11290', null, '南京市农业专科学校');
INSERT INTO `t_flatcode` VALUES ('2178', 'DM_XXDM', '高等学校代码', '11460', null, '南京晓庄学院');
INSERT INTO `t_flatcode` VALUES ('2179', 'DM_XXDM', '高等学校代码', '11462', null, '扬州市职业大学');
INSERT INTO `t_flatcode` VALUES ('2180', 'DM_XXDM', '高等学校代码', '11463', null, '常州技术师范学院');
INSERT INTO `t_flatcode` VALUES ('2181', 'DM_XXDM', '高等学校代码', '11585', null, '连云港师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2182', 'DM_XXDM', '高等学校代码', '11641', null, '淮海工学院');
INSERT INTO `t_flatcode` VALUES ('2183', 'DM_XXDM', '高等学校代码', '12106', null, '泰州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2184', 'DM_XXDM', '高等学校代码', '12213', null, '南京森林公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2185', 'DM_XXDM', '高等学校代码', '12317', null, '常州信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2186', 'DM_XXDM', '高等学校代码', '12702', null, '无锡商业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2187', 'DM_XXDM', '高等学校代码', '12703', null, '南通航运职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2188', 'DM_XXDM', '高等学校代码', '12804', null, '南京交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2189', 'DM_XXDM', '高等学校代码', '12805', null, '淮安信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2190', 'DM_XXDM', '高等学校代码', '12806', null, '江苏畜牧兽医职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2191', 'DM_XXDM', '高等学校代码', '12807', null, '常州纺织服装职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2192', 'DM_XXDM', '高等学校代码', '12808', null, '苏州农业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2193', 'DM_XXDM', '高等学校代码', '10863', null, '宁波职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2194', 'DM_XXDM', '高等学校代码', '10864', null, '温州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2195', 'DM_XXDM', '高等学校代码', '10876', null, '浙江万里学院(筹)');
INSERT INTO `t_flatcode` VALUES ('2196', 'DM_XXDM', '高等学校代码', '11057', null, '浙江科技学院');
INSERT INTO `t_flatcode` VALUES ('2197', 'DM_XXDM', '高等学校代码', '11058', null, '宁波高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2198', 'DM_XXDM', '高等学校代码', '11148', null, '杭州医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2199', 'DM_XXDM', '高等学校代码', '11292', null, '温州大学');
INSERT INTO `t_flatcode` VALUES ('2200', 'DM_XXDM', '高等学校代码', '11481', null, '浙江水利水电专科学校');
INSERT INTO `t_flatcode` VALUES ('2201', 'DM_XXDM', '高等学校代码', '11482', null, '浙江财经学院');
INSERT INTO `t_flatcode` VALUES ('2202', 'DM_XXDM', '高等学校代码', '11483', null, '浙江公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2203', 'DM_XXDM', '高等学校代码', '11646', null, '宁波大学');
INSERT INTO `t_flatcode` VALUES ('2204', 'DM_XXDM', '高等学校代码', '11647', null, '浙江广播电视高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2205', 'DM_XXDM', '高等学校代码', '11842', null, '民办浙江树人学院');
INSERT INTO `t_flatcode` VALUES ('2206', 'DM_XXDM', '高等学校代码', '12036', null, '浙江交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2207', 'DM_XXDM', '高等学校代码', '12061', null, '民办金华职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2208', 'DM_XXDM', '高等学校代码', '12789', null, '浙江工商职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2209', 'DM_XXDM', '高等学校代码', '12790', null, '台州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2210', 'DM_XXDM', '高等学校代码', '12791', null, '浙江工贸职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2211', 'DM_XXDM', '高等学校代码', '12792', null, '绍兴越秀外国语职业学院');
INSERT INTO `t_flatcode` VALUES ('2212', 'DM_XXDM', '高等学校代码', '85302', null, '第二海洋研究所');
INSERT INTO `t_flatcode` VALUES ('2213', 'DM_XXDM', '高等学校代码', '86204', null, '杭州应用声学研究所');
INSERT INTO `t_flatcode` VALUES ('2214', 'DM_XXDM', '高等学校代码', '88101', null, '浙江医学科学院');
INSERT INTO `t_flatcode` VALUES ('2215', 'DM_XXDM', '高等学校代码', '89633', null, '中共浙江省委党校');
INSERT INTO `t_flatcode` VALUES ('2216', 'DM_XXDM', '高等学校代码', '10357', null, '安徽大学');
INSERT INTO `t_flatcode` VALUES ('2217', 'DM_XXDM', '高等学校代码', '10358', null, '中国科学技术大学');
INSERT INTO `t_flatcode` VALUES ('2218', 'DM_XXDM', '高等学校代码', '10359', null, '合肥工业大学');
INSERT INTO `t_flatcode` VALUES ('2219', 'DM_XXDM', '高等学校代码', '10360', null, '安徽工业大学');
INSERT INTO `t_flatcode` VALUES ('2220', 'DM_XXDM', '高等学校代码', '10361', null, '淮南工业学院');
INSERT INTO `t_flatcode` VALUES ('2221', 'DM_XXDM', '高等学校代码', '10363', null, '安徽机电学院');
INSERT INTO `t_flatcode` VALUES ('2222', 'DM_XXDM', '高等学校代码', '10364', null, '安徽农业大学');
INSERT INTO `t_flatcode` VALUES ('2223', 'DM_XXDM', '高等学校代码', '10366', null, '安徽医科大学');
INSERT INTO `t_flatcode` VALUES ('2224', 'DM_XXDM', '高等学校代码', '10367', null, '蚌埠医学院');
INSERT INTO `t_flatcode` VALUES ('2225', 'DM_XXDM', '高等学校代码', '10368', null, '皖南医学院');
INSERT INTO `t_flatcode` VALUES ('2226', 'DM_XXDM', '高等学校代码', '10369', null, '安徽中医学院');
INSERT INTO `t_flatcode` VALUES ('2227', 'DM_XXDM', '高等学校代码', '12813', null, '六安职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2228', 'DM_XXDM', '高等学校代码', '12814', null, '安徽电子信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2229', 'DM_XXDM', '高等学校代码', '12815', null, '民办合肥经济技术职业学院');
INSERT INTO `t_flatcode` VALUES ('2230', 'DM_XXDM', '高等学校代码', '12816', null, '安徽交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2231', 'DM_XXDM', '高等学校代码', '12817', null, '安徽体育运动职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2232', 'DM_XXDM', '高等学校代码', '80015', null, '中科院等离子所');
INSERT INTO `t_flatcode` VALUES ('2233', 'DM_XXDM', '高等学校代码', '80016', null, '中国科学院固体物');
INSERT INTO `t_flatcode` VALUES ('2234', 'DM_XXDM', '高等学校代码', '80141', null, '中科院安徽光机所');
INSERT INTO `t_flatcode` VALUES ('2235', 'DM_XXDM', '高等学校代码', '80157', null, '中科院合肥智能所');
INSERT INTO `t_flatcode` VALUES ('2236', 'DM_XXDM', '高等学校代码', '82604', null, '马鞍山矿山研究院');
INSERT INTO `t_flatcode` VALUES ('2237', 'DM_XXDM', '高等学校代码', '10384', null, '厦门大学');
INSERT INTO `t_flatcode` VALUES ('2238', 'DM_XXDM', '高等学校代码', '10385', null, '华侨大学');
INSERT INTO `t_flatcode` VALUES ('2239', 'DM_XXDM', '高等学校代码', '10386', null, '福州大学');
INSERT INTO `t_flatcode` VALUES ('2240', 'DM_XXDM', '高等学校代码', '10388', null, '福建建筑高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2241', 'DM_XXDM', '高等学校代码', '10389', null, '福建农林大学');
INSERT INTO `t_flatcode` VALUES ('2242', 'DM_XXDM', '高等学校代码', '10390', null, '集美大学');
INSERT INTO `t_flatcode` VALUES ('2243', 'DM_XXDM', '高等学校代码', '10392', null, '福建医科大学');
INSERT INTO `t_flatcode` VALUES ('2244', 'DM_XXDM', '高等学校代码', '10393', null, '福建中医学院');
INSERT INTO `t_flatcode` VALUES ('2245', 'DM_XXDM', '高等学校代码', '10394', null, '福建师范大学');
INSERT INTO `t_flatcode` VALUES ('2246', 'DM_XXDM', '高等学校代码', '10395', null, '福州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2247', 'DM_XXDM', '高等学校代码', '10397', null, '南平师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2248', 'DM_XXDM', '高等学校代码', '10398', null, '宁德师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2249', 'DM_XXDM', '高等学校代码', '10399', null, '泉州师范学院');
INSERT INTO `t_flatcode` VALUES ('2250', 'DM_XXDM', '高等学校代码', '10402', null, '漳州师范学院');
INSERT INTO `t_flatcode` VALUES ('2251', 'DM_XXDM', '高等学校代码', '10866', null, '福建交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2252', 'DM_XXDM', '高等学校代码', '11062', null, '鹭江职业大学');
INSERT INTO `t_flatcode` VALUES ('2253', 'DM_XXDM', '高等学校代码', '11311', null, '三明高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2254', 'DM_XXDM', '高等学校代码', '11312', null, '龙岩师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2255', 'DM_XXDM', '高等学校代码', '11313', null, '福建商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2256', 'DM_XXDM', '高等学校代码', '11314', null, '漳州职业大学');
INSERT INTO `t_flatcode` VALUES ('2257', 'DM_XXDM', '高等学校代码', '11315', null, '闽西职业大学');
INSERT INTO `t_flatcode` VALUES ('2258', 'DM_XXDM', '高等学校代码', '11316', null, '闽江职业大学');
INSERT INTO `t_flatcode` VALUES ('2259', 'DM_XXDM', '高等学校代码', '11317', null, '黎明职业大学');
INSERT INTO `t_flatcode` VALUES ('2260', 'DM_XXDM', '高等学校代码', '11495', null, '福建公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2261', 'DM_XXDM', '高等学校代码', '11321', null, '九江医学专科学校');
INSERT INTO `t_flatcode` VALUES ('2262', 'DM_XXDM', '高等学校代码', '11322', null, '南昌高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2263', 'DM_XXDM', '高等学校代码', '11504', null, '江西公安专科学校');
INSERT INTO `t_flatcode` VALUES ('2264', 'DM_XXDM', '高等学校代码', '11505', null, '九江职业大学');
INSERT INTO `t_flatcode` VALUES ('2265', 'DM_XXDM', '高等学校代码', '11508', null, '新余高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2266', 'DM_XXDM', '高等学校代码', '11785', null, '九江职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2267', 'DM_XXDM', '高等学校代码', '11843', null, '九江财经高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2268', 'DM_XXDM', '高等学校代码', '12766', null, '江西渝州科技职业学院');
INSERT INTO `t_flatcode` VALUES ('2269', 'DM_XXDM', '高等学校代码', '12795', null, '江西航天科技职业学院');
INSERT INTO `t_flatcode` VALUES ('2270', 'DM_XXDM', '高等学校代码', '10422', null, '山东大学');
INSERT INTO `t_flatcode` VALUES ('2271', 'DM_XXDM', '高等学校代码', '10423', null, '青岛海洋大学');
INSERT INTO `t_flatcode` VALUES ('2272', 'DM_XXDM', '高等学校代码', '10424', null, '山东科技大学');
INSERT INTO `t_flatcode` VALUES ('2273', 'DM_XXDM', '高等学校代码', '10426', null, '青岛化工学院');
INSERT INTO `t_flatcode` VALUES ('2274', 'DM_XXDM', '高等学校代码', '10427', null, '济南大学');
INSERT INTO `t_flatcode` VALUES ('2275', 'DM_XXDM', '高等学校代码', '10429', null, '青岛建筑工程学院');
INSERT INTO `t_flatcode` VALUES ('2276', 'DM_XXDM', '高等学校代码', '10430', null, '山东建筑工程学院');
INSERT INTO `t_flatcode` VALUES ('2277', 'DM_XXDM', '高等学校代码', '10431', null, '山东轻工业学院');
INSERT INTO `t_flatcode` VALUES ('2278', 'DM_XXDM', '高等学校代码', '10433', null, '山东工程学院');
INSERT INTO `t_flatcode` VALUES ('2279', 'DM_XXDM', '高等学校代码', '10434', null, '山东农业大学');
INSERT INTO `t_flatcode` VALUES ('2280', 'DM_XXDM', '高等学校代码', '10435', null, '莱阳农学院');
INSERT INTO `t_flatcode` VALUES ('2281', 'DM_XXDM', '高等学校代码', '10438', null, '潍坊医学院');
INSERT INTO `t_flatcode` VALUES ('2282', 'DM_XXDM', '高等学校代码', '10439', null, '泰山医学院');
INSERT INTO `t_flatcode` VALUES ('2283', 'DM_XXDM', '高等学校代码', '10440', null, '滨州医学院');
INSERT INTO `t_flatcode` VALUES ('2284', 'DM_XXDM', '高等学校代码', '10441', null, '山东中医药大学');
INSERT INTO `t_flatcode` VALUES ('2285', 'DM_XXDM', '高等学校代码', '10442', null, '临沂医学专科学校');
INSERT INTO `t_flatcode` VALUES ('2286', 'DM_XXDM', '高等学校代码', '10443', null, '济宁医学院');
INSERT INTO `t_flatcode` VALUES ('2287', 'DM_XXDM', '高等学校代码', '10444', null, '菏泽医学专科学校');
INSERT INTO `t_flatcode` VALUES ('2288', 'DM_XXDM', '高等学校代码', '10445', null, '山东师范大学');
INSERT INTO `t_flatcode` VALUES ('2289', 'DM_XXDM', '高等学校代码', '10446', null, '曲阜师范大学');
INSERT INTO `t_flatcode` VALUES ('2290', 'DM_XXDM', '高等学校代码', '10447', null, '聊城师范学院');
INSERT INTO `t_flatcode` VALUES ('2291', 'DM_XXDM', '高等学校代码', '10448', null, '德州学院');
INSERT INTO `t_flatcode` VALUES ('2292', 'DM_XXDM', '高等学校代码', '10449', null, '滨州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2293', 'DM_XXDM', '高等学校代码', '10451', null, '烟台师范学院');
INSERT INTO `t_flatcode` VALUES ('2294', 'DM_XXDM', '高等学校代码', '10452', null, '临沂师范学院');
INSERT INTO `t_flatcode` VALUES ('2295', 'DM_XXDM', '高等学校代码', '12841', null, '山东服装职业学院');
INSERT INTO `t_flatcode` VALUES ('2296', 'DM_XXDM', '高等学校代码', '12842', null, '德州科技职业学院');
INSERT INTO `t_flatcode` VALUES ('2297', 'DM_XXDM', '高等学校代码', '12843', null, '潍坊科技职业学院');
INSERT INTO `t_flatcode` VALUES ('2298', 'DM_XXDM', '高等学校代码', '12844', null, '山东力明科技职业学院');
INSERT INTO `t_flatcode` VALUES ('2299', 'DM_XXDM', '高等学校代码', '80068', null, '中国科学院海洋研');
INSERT INTO `t_flatcode` VALUES ('2300', 'DM_XXDM', '高等学校代码', '85301', null, '第一海洋研究所');
INSERT INTO `t_flatcode` VALUES ('2301', 'DM_XXDM', '高等学校代码', '88501', null, '山东省医学科学院');
INSERT INTO `t_flatcode` VALUES ('2302', 'DM_XXDM', '高等学校代码', '10078', null, '华北水利水电学院');
INSERT INTO `t_flatcode` VALUES ('2303', 'DM_XXDM', '高等学校代码', '10459', null, '郑州大学');
INSERT INTO `t_flatcode` VALUES ('2304', 'DM_XXDM', '高等学校代码', '10460', null, '焦作工学院');
INSERT INTO `t_flatcode` VALUES ('2305', 'DM_XXDM', '高等学校代码', '10462', null, '郑州轻工业学院');
INSERT INTO `t_flatcode` VALUES ('2306', 'DM_XXDM', '高等学校代码', '10463', null, '郑州工程学院');
INSERT INTO `t_flatcode` VALUES ('2307', 'DM_XXDM', '高等学校代码', '10464', null, '洛阳工学院');
INSERT INTO `t_flatcode` VALUES ('2308', 'DM_XXDM', '高等学校代码', '10465', null, '中原工学院');
INSERT INTO `t_flatcode` VALUES ('2309', 'DM_XXDM', '高等学校代码', '10466', null, '河南农业大学');
INSERT INTO `t_flatcode` VALUES ('2310', 'DM_XXDM', '高等学校代码', '10467', null, '河南职业技术师范学院');
INSERT INTO `t_flatcode` VALUES ('2311', 'DM_XXDM', '高等学校代码', '10468', null, '洛阳农业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2312', 'DM_XXDM', '高等学校代码', '10469', null, '郑州牧业工程高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2313', 'DM_XXDM', '高等学校代码', '10471', null, '河南中医学院');
INSERT INTO `t_flatcode` VALUES ('2314', 'DM_XXDM', '高等学校代码', '10472', null, '新乡医学院');
INSERT INTO `t_flatcode` VALUES ('2315', 'DM_XXDM', '高等学校代码', '10474', null, '洛阳医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2316', 'DM_XXDM', '高等学校代码', '10475', null, '河南大学');
INSERT INTO `t_flatcode` VALUES ('2317', 'DM_XXDM', '高等学校代码', '10476', null, '河南师范大学');
INSERT INTO `t_flatcode` VALUES ('2318', 'DM_XXDM', '高等学校代码', '10477', null, '信阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2319', 'DM_XXDM', '高等学校代码', '10478', null, '周口师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2320', 'DM_XXDM', '高等学校代码', '10479', null, '安阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2321', 'DM_XXDM', '高等学校代码', '10480', null, '许昌师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2322', 'DM_XXDM', '高等学校代码', '10481', null, '南阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2323', 'DM_XXDM', '高等学校代码', '10482', null, '洛阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2324', 'DM_XXDM', '高等学校代码', '10483', null, '商丘师范学院');
INSERT INTO `t_flatcode` VALUES ('2325', 'DM_XXDM', '高等学校代码', '10484', null, '河南财经学院');
INSERT INTO `t_flatcode` VALUES ('2326', 'DM_XXDM', '高等学校代码', '10485', null, '郑州航空工业管理学院');
INSERT INTO `t_flatcode` VALUES ('2327', 'DM_XXDM', '高等学校代码', '10824', null, '河南职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2328', 'DM_XXDM', '高等学校代码', '10835', null, '漯河职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2329', 'DM_XXDM', '高等学校代码', '12794', null, '河南工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2330', 'DM_XXDM', '高等学校代码', '82606', null, '洛阳耐火材料研究所');
INSERT INTO `t_flatcode` VALUES ('2331', 'DM_XXDM', '高等学校代码', '82708', null, '机械科学研究所');
INSERT INTO `t_flatcode` VALUES ('2332', 'DM_XXDM', '高等学校代码', '82720', null, '洛阳船舶材料研究所');
INSERT INTO `t_flatcode` VALUES ('2333', 'DM_XXDM', '高等学校代码', '82722', null, '洛阳轴承研究所');
INSERT INTO `t_flatcode` VALUES ('2334', 'DM_XXDM', '高等学校代码', '82907', null, '航空航天工业部014中心');
INSERT INTO `t_flatcode` VALUES ('2335', 'DM_XXDM', '高等学校代码', '82908', null, '航空航天工业部61');
INSERT INTO `t_flatcode` VALUES ('2336', 'DM_XXDM', '高等学校代码', '83006', null, '中国电波传播研究所');
INSERT INTO `t_flatcode` VALUES ('2337', 'DM_XXDM', '高等学校代码', '10486', null, '武汉大学');
INSERT INTO `t_flatcode` VALUES ('2338', 'DM_XXDM', '高等学校代码', '10487', null, '华中科技大学');
INSERT INTO `t_flatcode` VALUES ('2339', 'DM_XXDM', '高等学校代码', '10488', null, '武汉科技大学');
INSERT INTO `t_flatcode` VALUES ('2340', 'DM_XXDM', '高等学校代码', '10489', null, '江汉石油学院');
INSERT INTO `t_flatcode` VALUES ('2341', 'DM_XXDM', '高等学校代码', '10490', null, '武汉化工学院');
INSERT INTO `t_flatcode` VALUES ('2342', 'DM_XXDM', '高等学校代码', '10491', null, '中国地质大学');
INSERT INTO `t_flatcode` VALUES ('2343', 'DM_XXDM', '高等学校代码', '10495', null, '武汉科技学院');
INSERT INTO `t_flatcode` VALUES ('2344', 'DM_XXDM', '高等学校代码', '10496', null, '武汉工业学院');
INSERT INTO `t_flatcode` VALUES ('2345', 'DM_XXDM', '高等学校代码', '10497', null, '武汉理工大学');
INSERT INTO `t_flatcode` VALUES ('2346', 'DM_XXDM', '高等学校代码', '10500', null, '湖北工学院');
INSERT INTO `t_flatcode` VALUES ('2347', 'DM_XXDM', '高等学校代码', '10504', null, '华中农业大学');
INSERT INTO `t_flatcode` VALUES ('2348', 'DM_XXDM', '高等学校代码', '10507', null, '湖北中医学院');
INSERT INTO `t_flatcode` VALUES ('2349', 'DM_XXDM', '高等学校代码', '10511', null, '华中师范大学');
INSERT INTO `t_flatcode` VALUES ('2350', 'DM_XXDM', '高等学校代码', '10512', null, '湖北大学');
INSERT INTO `t_flatcode` VALUES ('2351', 'DM_XXDM', '高等学校代码', '10513', null, '湖北师范学院');
INSERT INTO `t_flatcode` VALUES ('2352', 'DM_XXDM', '高等学校代码', '10514', null, '黄冈师范学院');
INSERT INTO `t_flatcode` VALUES ('2353', 'DM_XXDM', '高等学校代码', '10515', null, '荆州师范学院');
INSERT INTO `t_flatcode` VALUES ('2354', 'DM_XXDM', '高等学校代码', '10517', null, '湖北民族学院');
INSERT INTO `t_flatcode` VALUES ('2355', 'DM_XXDM', '高等学校代码', '10518', null, '郧阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2356', 'DM_XXDM', '高等学校代码', '10519', null, '襄樊学院');
INSERT INTO `t_flatcode` VALUES ('2357', 'DM_XXDM', '高等学校代码', '10520', null, '中南财经政法大学');
INSERT INTO `t_flatcode` VALUES ('2358', 'DM_XXDM', '高等学校代码', '10522', null, '武汉体育学院');
INSERT INTO `t_flatcode` VALUES ('2359', 'DM_XXDM', '高等学校代码', '10523', null, '湖北美术学院');
INSERT INTO `t_flatcode` VALUES ('2360', 'DM_XXDM', '高等学校代码', '10524', null, '中南民族学院');
INSERT INTO `t_flatcode` VALUES ('2361', 'DM_XXDM', '高等学校代码', '10525', null, '湖北汽车工业学院');
INSERT INTO `t_flatcode` VALUES ('2362', 'DM_XXDM', '高等学校代码', '10527', null, '湖北药检高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2363', 'DM_XXDM', '高等学校代码', '80057', null, '测量与地球物理研究所');
INSERT INTO `t_flatcode` VALUES ('2364', 'DM_XXDM', '高等学校代码', '80108', null, '武汉植物研究所');
INSERT INTO `t_flatcode` VALUES ('2365', 'DM_XXDM', '高等学校代码', '80119', null, '水生生物研究所');
INSERT INTO `t_flatcode` VALUES ('2366', 'DM_XXDM', '高等学校代码', '80124', null, '武汉病毒研究所');
INSERT INTO `t_flatcode` VALUES ('2367', 'DM_XXDM', '高等学校代码', '82305', null, '长江科学院');
INSERT INTO `t_flatcode` VALUES ('2368', 'DM_XXDM', '高等学校代码', '82609', null, '安全环保研究所');
INSERT INTO `t_flatcode` VALUES ('2369', 'DM_XXDM', '高等学校代码', '82709', null, '武汉材料保护研究所');
INSERT INTO `t_flatcode` VALUES ('2370', 'DM_XXDM', '高等学校代码', '83258', null, '航天部第四研究院四十二所');
INSERT INTO `t_flatcode` VALUES ('2371', 'DM_XXDM', '高等学校代码', '84011', null, '武汉邮电科学研究院');
INSERT INTO `t_flatcode` VALUES ('2372', 'DM_XXDM', '高等学校代码', '84506', null, '武汉生物制品研究所');
INSERT INTO `t_flatcode` VALUES ('2373', 'DM_XXDM', '高等学校代码', '85404', null, '武汉地震研究所');
INSERT INTO `t_flatcode` VALUES ('2374', 'DM_XXDM', '高等学校代码', '86202', null, '武汉数字工程研究所');
INSERT INTO `t_flatcode` VALUES ('2375', 'DM_XXDM', '高等学校代码', '86203', null, '武汉船舶设计研究所');
INSERT INTO `t_flatcode` VALUES ('2376', 'DM_XXDM', '高等学校代码', '86215', null, '武汉船用电力推进装置研究所');
INSERT INTO `t_flatcode` VALUES ('2377', 'DM_XXDM', '高等学校代码', '86216', null, '武汉华中光电技术研究所');
INSERT INTO `t_flatcode` VALUES ('2378', 'DM_XXDM', '高等学校代码', '86217', null, '武汉船舶通信研究所');
INSERT INTO `t_flatcode` VALUES ('2379', 'DM_XXDM', '高等学校代码', '88701', null, '湖北省社会科学院');
INSERT INTO `t_flatcode` VALUES ('2380', 'DM_XXDM', '高等学校代码', '88711', null, '湖北省化学研究所');
INSERT INTO `t_flatcode` VALUES ('2381', 'DM_XXDM', '高等学校代码', '10530', null, '湘潭大学');
INSERT INTO `t_flatcode` VALUES ('2382', 'DM_XXDM', '高等学校代码', '10531', null, '吉首大学');
INSERT INTO `t_flatcode` VALUES ('2383', 'DM_XXDM', '高等学校代码', '10532', null, '湖南大学');
INSERT INTO `t_flatcode` VALUES ('2384', 'DM_XXDM', '高等学校代码', '10533', null, '中南大学');
INSERT INTO `t_flatcode` VALUES ('2385', 'DM_XXDM', '高等学校代码', '10534', null, '湘潭工学院');
INSERT INTO `t_flatcode` VALUES ('2386', 'DM_XXDM', '高等学校代码', '10536', null, '长沙交通学院');
INSERT INTO `t_flatcode` VALUES ('2387', 'DM_XXDM', '高等学校代码', '10537', null, '湖南农业大学');
INSERT INTO `t_flatcode` VALUES ('2388', 'DM_XXDM', '高等学校代码', '10538', null, '中南林学院');
INSERT INTO `t_flatcode` VALUES ('2389', 'DM_XXDM', '高等学校代码', '10541', null, '湖南中医学院');
INSERT INTO `t_flatcode` VALUES ('2390', 'DM_XXDM', '高等学校代码', '10542', null, '湖南师范大学');
INSERT INTO `t_flatcode` VALUES ('2391', 'DM_XXDM', '高等学校代码', '10543', null, '岳阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2392', 'DM_XXDM', '高等学校代码', '10545', null, '郴州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2393', 'DM_XXDM', '高等学校代码', '10546', null, '衡阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2394', 'DM_XXDM', '高等学校代码', '10547', null, '邵阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2395', 'DM_XXDM', '高等学校代码', '10548', null, '怀化师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2396', 'DM_XXDM', '高等学校代码', '10549', null, '常德师范学院');
INSERT INTO `t_flatcode` VALUES ('2397', 'DM_XXDM', '高等学校代码', '12343', null, '湖南生物与机电工程职业技术');
INSERT INTO `t_flatcode` VALUES ('2398', 'DM_XXDM', '高等学校代码', '12397', null, '湖南交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2399', 'DM_XXDM', '高等学校代码', '12401', null, '湖南商务职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2400', 'DM_XXDM', '高等学校代码', '12739', null, '湖南环境生物职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2401', 'DM_XXDM', '高等学校代码', '12845', null, '长沙通信职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2402', 'DM_XXDM', '高等学校代码', '12846', null, '湘潭职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2403', 'DM_XXDM', '高等学校代码', '12847', null, '郴州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2404', 'DM_XXDM', '高等学校代码', '12848', null, '娄底职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2405', 'DM_XXDM', '高等学校代码', '12849', null, '张家界航空工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2406', 'DM_XXDM', '高等学校代码', '80066', null, '中科院长沙大地所');
INSERT INTO `t_flatcode` VALUES ('2407', 'DM_XXDM', '高等学校代码', '80162', null, '长沙农业现代化所');
INSERT INTO `t_flatcode` VALUES ('2408', 'DM_XXDM', '高等学校代码', '82603', null, '长沙矿冶研究院');
INSERT INTO `t_flatcode` VALUES ('2409', 'DM_XXDM', '高等学校代码', '82925', null, '中航公司六零八所');
INSERT INTO `t_flatcode` VALUES ('2410', 'DM_XXDM', '高等学校代码', '86404', null, '长沙矿山研究院');
INSERT INTO `t_flatcode` VALUES ('2411', 'DM_XXDM', '高等学校代码', '88801', null, '湖南省中医药研究院');
INSERT INTO `t_flatcode` VALUES ('2412', 'DM_XXDM', '高等学校代码', '10558', null, '中山大学');
INSERT INTO `t_flatcode` VALUES ('2413', 'DM_XXDM', '高等学校代码', '10559', null, '暨南大学');
INSERT INTO `t_flatcode` VALUES ('2414', 'DM_XXDM', '高等学校代码', '10560', null, '汕头大学');
INSERT INTO `t_flatcode` VALUES ('2415', 'DM_XXDM', '高等学校代码', '10561', null, '华南理工大学');
INSERT INTO `t_flatcode` VALUES ('2416', 'DM_XXDM', '高等学校代码', '10564', null, '华南农业大学');
INSERT INTO `t_flatcode` VALUES ('2417', 'DM_XXDM', '高等学校代码', '10566', null, '湛江海洋大学');
INSERT INTO `t_flatcode` VALUES ('2418', 'DM_XXDM', '高等学校代码', '10570', null, '广州医学院');
INSERT INTO `t_flatcode` VALUES ('2419', 'DM_XXDM', '高等学校代码', '10571', null, '广东医学院');
INSERT INTO `t_flatcode` VALUES ('2420', 'DM_XXDM', '高等学校代码', '10572', null, '广州中医药大学');
INSERT INTO `t_flatcode` VALUES ('2421', 'DM_XXDM', '高等学校代码', '10573', null, '广东药学院');
INSERT INTO `t_flatcode` VALUES ('2422', 'DM_XXDM', '高等学校代码', '10574', null, '华南师范大学');
INSERT INTO `t_flatcode` VALUES ('2423', 'DM_XXDM', '高等学校代码', '10576', null, '韶关学院');
INSERT INTO `t_flatcode` VALUES ('2424', 'DM_XXDM', '高等学校代码', '10577', null, '惠州学院');
INSERT INTO `t_flatcode` VALUES ('2425', 'DM_XXDM', '高等学校代码', '10578', null, '韩山师范学院');
INSERT INTO `t_flatcode` VALUES ('2426', 'DM_XXDM', '高等学校代码', '10579', null, '湛江师范学院');
INSERT INTO `t_flatcode` VALUES ('2427', 'DM_XXDM', '高等学校代码', '10580', null, '肇庆学院');
INSERT INTO `t_flatcode` VALUES ('2428', 'DM_XXDM', '高等学校代码', '10582', null, '嘉应学院');
INSERT INTO `t_flatcode` VALUES ('2429', 'DM_XXDM', '高等学校代码', '10585', null, '广州体育学院');
INSERT INTO `t_flatcode` VALUES ('2430', 'DM_XXDM', '高等学校代码', '10586', null, '广州美术学院');
INSERT INTO `t_flatcode` VALUES ('2431', 'DM_XXDM', '高等学校代码', '12742', null, '广东女子职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2432', 'DM_XXDM', '高等学校代码', '12743', null, '广东机电职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2433', 'DM_XXDM', '高等学校代码', '12749', null, '广东岭南职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2434', 'DM_XXDM', '高等学校代码', '12765', null, '汕尾职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2435', 'DM_XXDM', '高等学校代码', '12770', null, '罗定职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2436', 'DM_XXDM', '高等学校代码', '12771', null, '阳江职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2437', 'DM_XXDM', '高等学校代码', '12772', null, '河源职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2438', 'DM_XXDM', '高等学校代码', '80033', null, '中科院广州化学研究所');
INSERT INTO `t_flatcode` VALUES ('2439', 'DM_XXDM', '高等学校代码', '80069', null, '中国科学院南海海洋研究所');
INSERT INTO `t_flatcode` VALUES ('2440', 'DM_XXDM', '高等学校代码', '80107', null, '中国科学院华南植物研究所');
INSERT INTO `t_flatcode` VALUES ('2441', 'DM_XXDM', '高等学校代码', '80149', null, '中科院广州能源研究所');
INSERT INTO `t_flatcode` VALUES ('2442', 'DM_XXDM', '高等学校代码', '80165', null, '中科院广州地球化学研究所');
INSERT INTO `t_flatcode` VALUES ('2443', 'DM_XXDM', '高等学校代码', '86406', null, '中共广东省委党校');
INSERT INTO `t_flatcode` VALUES ('2444', 'DM_XXDM', '高等学校代码', '88901', null, '广东省社会科学院');
INSERT INTO `t_flatcode` VALUES ('2445', 'DM_XXDM', '高等学校代码', '88911', null, '广东省心血管病研究所');
INSERT INTO `t_flatcode` VALUES ('2446', 'DM_XXDM', '高等学校代码', '10593', null, '广西大学');
INSERT INTO `t_flatcode` VALUES ('2447', 'DM_XXDM', '高等学校代码', '10594', null, '广西工学院');
INSERT INTO `t_flatcode` VALUES ('2448', 'DM_XXDM', '高等学校代码', '10595', null, '桂林电子工业学院');
INSERT INTO `t_flatcode` VALUES ('2449', 'DM_XXDM', '高等学校代码', '10596', null, '桂林工学院');
INSERT INTO `t_flatcode` VALUES ('2450', 'DM_XXDM', '高等学校代码', '10598', null, '广西医科大学');
INSERT INTO `t_flatcode` VALUES ('2451', 'DM_XXDM', '高等学校代码', '10599', null, '右江民族医学院');
INSERT INTO `t_flatcode` VALUES ('2452', 'DM_XXDM', '高等学校代码', '10600', null, '广西中医学院');
INSERT INTO `t_flatcode` VALUES ('2453', 'DM_XXDM', '高等学校代码', '10601', null, '桂林医学院');
INSERT INTO `t_flatcode` VALUES ('2454', 'DM_XXDM', '高等学校代码', '10602', null, '广西师范大学');
INSERT INTO `t_flatcode` VALUES ('2455', 'DM_XXDM', '高等学校代码', '10603', null, '广西师范学院');
INSERT INTO `t_flatcode` VALUES ('2456', 'DM_XXDM', '高等学校代码', '10604', null, '南宁师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2457', 'DM_XXDM', '高等学校代码', '10605', null, '河池师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2458', 'DM_XXDM', '高等学校代码', '10606', null, '玉林师范学院');
INSERT INTO `t_flatcode` VALUES ('2459', 'DM_XXDM', '高等学校代码', '10607', null, '广西艺术学院');
INSERT INTO `t_flatcode` VALUES ('2460', 'DM_XXDM', '高等学校代码', '10608', null, '广西民族学院');
INSERT INTO `t_flatcode` VALUES ('2461', 'DM_XXDM', '高等学校代码', '10609', null, '右江民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2462', 'DM_XXDM', '高等学校代码', '10867', null, '广西机电职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2463', 'DM_XXDM', '高等学校代码', '11350', null, '广西体育高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2464', 'DM_XXDM', '高等学校代码', '11351', null, '广西商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2465', 'DM_XXDM', '高等学校代码', '10655', null, '四川美术学院');
INSERT INTO `t_flatcode` VALUES ('2466', 'DM_XXDM', '高等学校代码', '10870', null, '重庆电子职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2467', 'DM_XXDM', '高等学校代码', '11356', null, '渝州大学');
INSERT INTO `t_flatcode` VALUES ('2468', 'DM_XXDM', '高等学校代码', '11551', null, '重庆工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2469', 'DM_XXDM', '高等学校代码', '11660', null, '重庆工学院');
INSERT INTO `t_flatcode` VALUES ('2470', 'DM_XXDM', '高等学校代码', '11799', null, '重庆商学院');
INSERT INTO `t_flatcode` VALUES ('2471', 'DM_XXDM', '高等学校代码', '11829', null, '重庆石油高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2472', 'DM_XXDM', '高等学校代码', '11848', null, '重庆电力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2473', 'DM_XXDM', '高等学校代码', '12215', null, '重庆工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2474', 'DM_XXDM', '高等学校代码', '12754', null, '重庆海联职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2475', 'DM_XXDM', '高等学校代码', '12755', null, '重庆信息技术职业学院');
INSERT INTO `t_flatcode` VALUES ('2476', 'DM_XXDM', '高等学校代码', '12756', null, '重庆光彩职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2477', 'DM_XXDM', '高等学校代码', '12757', null, '重庆警官职业学院');
INSERT INTO `t_flatcode` VALUES ('2478', 'DM_XXDM', '高等学校代码', '12758', null, '重庆社会工作职业学院');
INSERT INTO `t_flatcode` VALUES ('2479', 'DM_XXDM', '高等学校代码', '12759', null, '重庆工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2480', 'DM_XXDM', '高等学校代码', '12760', null, '重庆职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2481', 'DM_XXDM', '高等学校代码', '12820', null, '重庆巴渝职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2482', 'DM_XXDM', '高等学校代码', '83302', null, '煤炭科学研究院重庆分院');
INSERT INTO `t_flatcode` VALUES ('2483', 'DM_XXDM', '高等学校代码', '10610', null, '四川大学');
INSERT INTO `t_flatcode` VALUES ('2484', 'DM_XXDM', '高等学校代码', '10613', null, '西南交通大学');
INSERT INTO `t_flatcode` VALUES ('2485', 'DM_XXDM', '高等学校代码', '10614', null, '电子科技大学');
INSERT INTO `t_flatcode` VALUES ('2486', 'DM_XXDM', '高等学校代码', '10615', null, '西南石油学院');
INSERT INTO `t_flatcode` VALUES ('2487', 'DM_XXDM', '高等学校代码', '10616', null, '成都理工大学');
INSERT INTO `t_flatcode` VALUES ('2488', 'DM_XXDM', '高等学校代码', '10619', null, '西南科技大学');
INSERT INTO `t_flatcode` VALUES ('2489', 'DM_XXDM', '高等学校代码', '10621', null, '成都信息工程学院');
INSERT INTO `t_flatcode` VALUES ('2490', 'DM_XXDM', '高等学校代码', '10622', null, '四川轻化工学院');
INSERT INTO `t_flatcode` VALUES ('2491', 'DM_XXDM', '高等学校代码', '10623', null, '四川工业学院');
INSERT INTO `t_flatcode` VALUES ('2492', 'DM_XXDM', '高等学校代码', '10624', null, '中国民用航空飞行学院');
INSERT INTO `t_flatcode` VALUES ('2493', 'DM_XXDM', '高等学校代码', '10626', null, '四川农业大学');
INSERT INTO `t_flatcode` VALUES ('2494', 'DM_XXDM', '高等学校代码', '10628', null, '西昌农业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2495', 'DM_XXDM', '高等学校代码', '10632', null, '泸州医学院');
INSERT INTO `t_flatcode` VALUES ('2496', 'DM_XXDM', '高等学校代码', '10633', null, '成都中医药大学');
INSERT INTO `t_flatcode` VALUES ('2497', 'DM_XXDM', '高等学校代码', '10634', null, '川北医学院');
INSERT INTO `t_flatcode` VALUES ('2498', 'DM_XXDM', '高等学校代码', '10636', null, '四川师范大学');
INSERT INTO `t_flatcode` VALUES ('2499', 'DM_XXDM', '高等学校代码', '80151', null, '中科院光电技术研究所');
INSERT INTO `t_flatcode` VALUES ('2500', 'DM_XXDM', '高等学校代码', '80153', null, '中科院成都计算机应用研究所');
INSERT INTO `t_flatcode` VALUES ('2501', 'DM_XXDM', '高等学校代码', '82802', null, '中国核动力研究设计院');
INSERT INTO `t_flatcode` VALUES ('2502', 'DM_XXDM', '高等学校代码', '82809', null, '核工业西南物理研究院');
INSERT INTO `t_flatcode` VALUES ('2503', 'DM_XXDM', '高等学校代码', '82906', null, '航空工业总公司611研究所');
INSERT INTO `t_flatcode` VALUES ('2504', 'DM_XXDM', '高等学校代码', '82910', null, '中国燃气涡轮研究院');
INSERT INTO `t_flatcode` VALUES ('2505', 'DM_XXDM', '高等学校代码', '83008', null, '西南通信研究所');
INSERT INTO `t_flatcode` VALUES ('2506', 'DM_XXDM', '高等学校代码', '83012', null, '中物院电子工程研究所');
INSERT INTO `t_flatcode` VALUES ('2507', 'DM_XXDM', '高等学校代码', '85902', null, '四川抗菌素工业研究所');
INSERT INTO `t_flatcode` VALUES ('2508', 'DM_XXDM', '高等学校代码', '89101', null, '四川省社会科学院');
INSERT INTO `t_flatcode` VALUES ('2509', 'DM_XXDM', '高等学校代码', '10657', null, '贵州大学');
INSERT INTO `t_flatcode` VALUES ('2510', 'DM_XXDM', '高等学校代码', '10658', null, '贵州工业大学');
INSERT INTO `t_flatcode` VALUES ('2511', 'DM_XXDM', '高等学校代码', '10660', null, '贵阳医学院');
INSERT INTO `t_flatcode` VALUES ('2512', 'DM_XXDM', '高等学校代码', '10661', null, '遵义医学院');
INSERT INTO `t_flatcode` VALUES ('2513', 'DM_XXDM', '高等学校代码', '10662', null, '贵阳中医学院');
INSERT INTO `t_flatcode` VALUES ('2514', 'DM_XXDM', '高等学校代码', '10663', null, '贵州师范大学');
INSERT INTO `t_flatcode` VALUES ('2515', 'DM_XXDM', '高等学校代码', '10664', null, '遵义师范学院');
INSERT INTO `t_flatcode` VALUES ('2516', 'DM_XXDM', '高等学校代码', '10665', null, '铜仁师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2517', 'DM_XXDM', '高等学校代码', '10666', null, '黔西南民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2518', 'DM_XXDM', '高等学校代码', '10667', null, '安顺师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2519', 'DM_XXDM', '高等学校代码', '10668', null, '毕节师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2520', 'DM_XXDM', '高等学校代码', '10669', null, '黔东南民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2521', 'DM_XXDM', '高等学校代码', '10670', null, '黔南民族师范学院');
INSERT INTO `t_flatcode` VALUES ('2522', 'DM_XXDM', '高等学校代码', '10671', null, '贵州财经学院');
INSERT INTO `t_flatcode` VALUES ('2523', 'DM_XXDM', '高等学校代码', '10672', null, '贵州民族学院');
INSERT INTO `t_flatcode` VALUES ('2524', 'DM_XXDM', '高等学校代码', '10976', null, '贵阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2525', 'DM_XXDM', '高等学校代码', '10977', null, '六盘水师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2526', 'DM_XXDM', '高等学校代码', '11389', null, '贵阳金筑大学');
INSERT INTO `t_flatcode` VALUES ('2527', 'DM_XXDM', '高等学校代码', '11663', null, '黔南民族医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2528', 'DM_XXDM', '高等学校代码', '11731', null, '贵州商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2529', 'DM_XXDM', '高等学校代码', '12107', null, '贵州警官职业学院');
INSERT INTO `t_flatcode` VALUES ('2530', 'DM_XXDM', '高等学校代码', '12222', null, '贵州交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2531', 'DM_XXDM', '高等学校代码', '12223', null, '贵州航天职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2532', 'DM_XXDM', '高等学校代码', '12224', null, '贵州冶金职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2533', 'DM_XXDM', '高等学校代码', '12851', null, '昆明艺术职业学院');
INSERT INTO `t_flatcode` VALUES ('2534', 'DM_XXDM', '高等学校代码', '80023', null, '中科院云南天文台');
INSERT INTO `t_flatcode` VALUES ('2535', 'DM_XXDM', '高等学校代码', '80104', null, '中科院昆明动物所');
INSERT INTO `t_flatcode` VALUES ('2536', 'DM_XXDM', '高等学校代码', '80106', null, '中科院昆明植物研究所');
INSERT INTO `t_flatcode` VALUES ('2537', 'DM_XXDM', '高等学校代码', '80128', null, '中科院版纳植物园');
INSERT INTO `t_flatcode` VALUES ('2538', 'DM_XXDM', '高等学校代码', '83104', null, '昆明物理研究所');
INSERT INTO `t_flatcode` VALUES ('2539', 'DM_XXDM', '高等学校代码', '86401', null, '昆明贵金属研究所');
INSERT INTO `t_flatcode` VALUES ('2540', 'DM_XXDM', '高等学校代码', '10694', null, '西藏大学');
INSERT INTO `t_flatcode` VALUES ('2541', 'DM_XXDM', '高等学校代码', '10695', null, '西藏民族学院');
INSERT INTO `t_flatcode` VALUES ('2542', 'DM_XXDM', '高等学校代码', '10696', null, '药王山藏医学院');
INSERT INTO `t_flatcode` VALUES ('2543', 'DM_XXDM', '高等学校代码', '10697', null, '西北大学');
INSERT INTO `t_flatcode` VALUES ('2544', 'DM_XXDM', '高等学校代码', '10698', null, '西安交通大学');
INSERT INTO `t_flatcode` VALUES ('2545', 'DM_XXDM', '高等学校代码', '10699', null, '西北工业大学');
INSERT INTO `t_flatcode` VALUES ('2546', 'DM_XXDM', '高等学校代码', '10700', null, '西安理工大学');
INSERT INTO `t_flatcode` VALUES ('2547', 'DM_XXDM', '高等学校代码', '10701', null, '西安电子科技大学');
INSERT INTO `t_flatcode` VALUES ('2548', 'DM_XXDM', '高等学校代码', '10702', null, '西安工业学院');
INSERT INTO `t_flatcode` VALUES ('2549', 'DM_XXDM', '高等学校代码', '10703', null, '西安建筑科技大学');
INSERT INTO `t_flatcode` VALUES ('2550', 'DM_XXDM', '高等学校代码', '10704', null, '西安科技学院');
INSERT INTO `t_flatcode` VALUES ('2551', 'DM_XXDM', '高等学校代码', '10705', null, '西安石油学院');
INSERT INTO `t_flatcode` VALUES ('2552', 'DM_XXDM', '高等学校代码', '10708', null, '西北轻工业学院');
INSERT INTO `t_flatcode` VALUES ('2553', 'DM_XXDM', '高等学校代码', '10709', null, '西安工程科技学院');
INSERT INTO `t_flatcode` VALUES ('2554', 'DM_XXDM', '高等学校代码', '10710', null, '长安大学');
INSERT INTO `t_flatcode` VALUES ('2555', 'DM_XXDM', '高等学校代码', '10712', null, '西北农林科技大学');
INSERT INTO `t_flatcode` VALUES ('2556', 'DM_XXDM', '高等学校代码', '10716', null, '陕西中医学院');
INSERT INTO `t_flatcode` VALUES ('2557', 'DM_XXDM', '高等学校代码', '10718', null, '陕西师范大学');
INSERT INTO `t_flatcode` VALUES ('2558', 'DM_XXDM', '高等学校代码', '10719', null, '延安大学');
INSERT INTO `t_flatcode` VALUES ('2559', 'DM_XXDM', '高等学校代码', '10720', null, '陕西理工学院');
INSERT INTO `t_flatcode` VALUES ('2560', 'DM_XXDM', '高等学校代码', '10721', null, '宝鸡文理学院');
INSERT INTO `t_flatcode` VALUES ('2561', 'DM_XXDM', '高等学校代码', '10722', null, '咸阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2562', 'DM_XXDM', '高等学校代码', '10723', null, '渭南师范学院');
INSERT INTO `t_flatcode` VALUES ('2563', 'DM_XXDM', '高等学校代码', '10724', null, '西安外国语学院');
INSERT INTO `t_flatcode` VALUES ('2564', 'DM_XXDM', '高等学校代码', '10726', null, '西北政法学院');
INSERT INTO `t_flatcode` VALUES ('2565', 'DM_XXDM', '高等学校代码', '83101', null, '西安近代化学研究所');
INSERT INTO `t_flatcode` VALUES ('2566', 'DM_XXDM', '高等学校代码', '83103', null, '西安应用光学研究所');
INSERT INTO `t_flatcode` VALUES ('2567', 'DM_XXDM', '高等学校代码', '83109', null, '西安机电信息研究所');
INSERT INTO `t_flatcode` VALUES ('2568', 'DM_XXDM', '高等学校代码', '83110', null, '中国兵器工业第二一三研究所');
INSERT INTO `t_flatcode` VALUES ('2569', 'DM_XXDM', '高等学校代码', '83111', null, '中国兵器工业第202所');
INSERT INTO `t_flatcode` VALUES ('2570', 'DM_XXDM', '高等学校代码', '83112', null, '中国兵器工业第203研究所');
INSERT INTO `t_flatcode` VALUES ('2571', 'DM_XXDM', '高等学校代码', '83113', null, '中国兵器工业第206所');
INSERT INTO `t_flatcode` VALUES ('2572', 'DM_XXDM', '高等学校代码', '83233', null, '航天科技集团第16研究所');
INSERT INTO `t_flatcode` VALUES ('2573', 'DM_XXDM', '高等学校代码', '83256', null, '航空航天部四院');
INSERT INTO `t_flatcode` VALUES ('2574', 'DM_XXDM', '高等学校代码', '83269', null, '航天科技集团504所');
INSERT INTO `t_flatcode` VALUES ('2575', 'DM_XXDM', '高等学校代码', '83276', null, '西安微电子技术研究所(771)');
INSERT INTO `t_flatcode` VALUES ('2576', 'DM_XXDM', '高等学校代码', '83278', null, '航空航天十一所');
INSERT INTO `t_flatcode` VALUES ('2577', 'DM_XXDM', '高等学校代码', '83306', null, '煤科总院西安分院');
INSERT INTO `t_flatcode` VALUES ('2578', 'DM_XXDM', '高等学校代码', '84003', null, '邮电部第四研究所');
INSERT INTO `t_flatcode` VALUES ('2579', 'DM_XXDM', '高等学校代码', '86212', null, '西安精密机械研究所');
INSERT INTO `t_flatcode` VALUES ('2580', 'DM_XXDM', '高等学校代码', '89661', null, '中共陕西省委党校');
INSERT INTO `t_flatcode` VALUES ('2581', 'DM_XXDM', '高等学校代码', '10730', null, '兰州大学');
INSERT INTO `t_flatcode` VALUES ('2582', 'DM_XXDM', '高等学校代码', '10731', null, '甘肃工业大学');
INSERT INTO `t_flatcode` VALUES ('2583', 'DM_XXDM', '高等学校代码', '10732', null, '兰州铁道学院');
INSERT INTO `t_flatcode` VALUES ('2584', 'DM_XXDM', '高等学校代码', '10733', null, '甘肃农业大学');
INSERT INTO `t_flatcode` VALUES ('2585', 'DM_XXDM', '高等学校代码', '10734', null, '兰州医学院');
INSERT INTO `t_flatcode` VALUES ('2586', 'DM_XXDM', '高等学校代码', '10735', null, '甘肃中医学院');
INSERT INTO `t_flatcode` VALUES ('2587', 'DM_XXDM', '高等学校代码', '10736', null, '西北师范大学');
INSERT INTO `t_flatcode` VALUES ('2588', 'DM_XXDM', '高等学校代码', '10737', null, '兰州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2589', 'DM_XXDM', '高等学校代码', '10738', null, '庆阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2590', 'DM_XXDM', '高等学校代码', '10739', null, '天水师范学院');
INSERT INTO `t_flatcode` VALUES ('2591', 'DM_XXDM', '高等学校代码', '10740', null, '河西学院');
INSERT INTO `t_flatcode` VALUES ('2592', 'DM_XXDM', '高等学校代码', '10741', null, '兰州商学院');
INSERT INTO `t_flatcode` VALUES ('2593', 'DM_XXDM', '高等学校代码', '10742', null, '西北民族学院');
INSERT INTO `t_flatcode` VALUES ('2594', 'DM_XXDM', '高等学校代码', '10838', null, '兰州石化职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2595', 'DM_XXDM', '高等学校代码', '11406', null, '甘肃政法学院');
INSERT INTO `t_flatcode` VALUES ('2596', 'DM_XXDM', '高等学校代码', '11561', null, '合作民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2597', 'DM_XXDM', '高等学校代码', '11562', null, '甘肃联合大学');
INSERT INTO `t_flatcode` VALUES ('2598', 'DM_XXDM', '高等学校代码', '11807', null, '兰州工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2599', 'DM_XXDM', '高等学校代码', '12716', null, '吴忠职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2600', 'DM_XXDM', '高等学校代码', '12837', null, '宁夏工业职业学院');
INSERT INTO `t_flatcode` VALUES ('2601', 'DM_XXDM', '高等学校代码', '10755', null, '新疆大学');
INSERT INTO `t_flatcode` VALUES ('2602', 'DM_XXDM', '高等学校代码', '10757', null, '塔里木农垦大学');
INSERT INTO `t_flatcode` VALUES ('2603', 'DM_XXDM', '高等学校代码', '10758', null, '新疆农业大学');
INSERT INTO `t_flatcode` VALUES ('2604', 'DM_XXDM', '高等学校代码', '10759', null, '石河子大学');
INSERT INTO `t_flatcode` VALUES ('2605', 'DM_XXDM', '高等学校代码', '10760', null, '新疆医科大学');
INSERT INTO `t_flatcode` VALUES ('2606', 'DM_XXDM', '高等学校代码', '10762', null, '新疆师范大学');
INSERT INTO `t_flatcode` VALUES ('2607', 'DM_XXDM', '高等学校代码', '10763', null, '喀什师范学院');
INSERT INTO `t_flatcode` VALUES ('2608', 'DM_XXDM', '高等学校代码', '10764', null, '伊犁师范学院');
INSERT INTO `t_flatcode` VALUES ('2609', 'DM_XXDM', '高等学校代码', '10765', null, '和田师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2610', 'DM_XXDM', '高等学校代码', '10766', null, '新疆财经学院');
INSERT INTO `t_flatcode` VALUES ('2611', 'DM_XXDM', '高等学校代码', '10768', null, '新疆艺术学院');
INSERT INTO `t_flatcode` VALUES ('2612', 'DM_XXDM', '高等学校代码', '10994', null, '新疆工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2613', 'DM_XXDM', '高等学校代码', '10995', null, '新疆农业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2614', 'DM_XXDM', '高等学校代码', '10997', null, '昌吉学院');
INSERT INTO `t_flatcode` VALUES ('2615', 'DM_XXDM', '高等学校代码', '11565', null, '乌鲁木齐职业大学');
INSERT INTO `t_flatcode` VALUES ('2616', 'DM_XXDM', '高等学校代码', '11818', null, '新疆维吾尔医学专科学校');
INSERT INTO `t_flatcode` VALUES ('2617', 'DM_XXDM', '高等学校代码', '12482', null, '新疆克拉玛依职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2618', 'DM_XXDM', '高等学校代码', '12513', null, '新疆机电职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2619', 'DM_XXDM', '高等学校代码', '12514', null, '新疆轻工职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2620', 'DM_XXDM', '高等学校代码', '12734', null, '新疆警官高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2621', 'DM_XXDM', '高等学校代码', '12838', null, '昌吉职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2622', 'DM_XXDM', '高等学校代码', '80028', null, '中科院新疆物理');
INSERT INTO `t_flatcode` VALUES ('2623', 'DM_XXDM', '高等学校代码', '80034', null, '中科院新疆化学');
INSERT INTO `t_flatcode` VALUES ('2624', 'DM_XXDM', '高等学校代码', '80102', null, '中科院新疆生物');
INSERT INTO `t_flatcode` VALUES ('2625', 'DM_XXDM', '高等学校代码', '10034', null, '中央财经大学');
INSERT INTO `t_flatcode` VALUES ('2626', 'DM_XXDM', '高等学校代码', '10036', null, '对外经济贸易大学');
INSERT INTO `t_flatcode` VALUES ('2627', 'DM_XXDM', '高等学校代码', '10037', null, '北京物资学院');
INSERT INTO `t_flatcode` VALUES ('2628', 'DM_XXDM', '高等学校代码', '10038', null, '首都经济贸易大学');
INSERT INTO `t_flatcode` VALUES ('2629', 'DM_XXDM', '高等学校代码', '10040', null, '外交学院');
INSERT INTO `t_flatcode` VALUES ('2630', 'DM_XXDM', '高等学校代码', '10041', null, '中国人民公安大学');
INSERT INTO `t_flatcode` VALUES ('2631', 'DM_XXDM', '高等学校代码', '10042', null, '国际关系学院');
INSERT INTO `t_flatcode` VALUES ('2632', 'DM_XXDM', '高等学校代码', '10043', null, '北京体育大学');
INSERT INTO `t_flatcode` VALUES ('2633', 'DM_XXDM', '高等学校代码', '10045', null, '中央音乐学院');
INSERT INTO `t_flatcode` VALUES ('2634', 'DM_XXDM', '高等学校代码', '10046', null, '中国音乐学院');
INSERT INTO `t_flatcode` VALUES ('2635', 'DM_XXDM', '高等学校代码', '10047', null, '中央美术学院');
INSERT INTO `t_flatcode` VALUES ('2636', 'DM_XXDM', '高等学校代码', '10048', null, '中央戏剧学院');
INSERT INTO `t_flatcode` VALUES ('2637', 'DM_XXDM', '高等学校代码', '10049', null, '中国戏曲学院');
INSERT INTO `t_flatcode` VALUES ('2638', 'DM_XXDM', '高等学校代码', '10050', null, '北京电影学院');
INSERT INTO `t_flatcode` VALUES ('2639', 'DM_XXDM', '高等学校代码', '10051', null, '北京舞蹈学院');
INSERT INTO `t_flatcode` VALUES ('2640', 'DM_XXDM', '高等学校代码', '10052', null, '中央民族大学');
INSERT INTO `t_flatcode` VALUES ('2641', 'DM_XXDM', '高等学校代码', '10053', null, '中国政法大学');
INSERT INTO `t_flatcode` VALUES ('2642', 'DM_XXDM', '高等学校代码', '10772', null, '北京信息工程学院');
INSERT INTO `t_flatcode` VALUES ('2643', 'DM_XXDM', '高等学校代码', '10853', null, '北京工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2644', 'DM_XXDM', '高等学校代码', '10857', null, '北京信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2645', 'DM_XXDM', '高等学校代码', '10858', null, '北京轻工职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2646', 'DM_XXDM', '高等学校代码', '11232', null, '北京机械工业学院');
INSERT INTO `t_flatcode` VALUES ('2647', 'DM_XXDM', '高等学校代码', '11414', null, '石油大学');
INSERT INTO `t_flatcode` VALUES ('2648', 'DM_XXDM', '高等学校代码', '11417', null, '北京联合大学');
INSERT INTO `t_flatcode` VALUES ('2649', 'DM_XXDM', '高等学校代码', '11418', null, '海淀走读大学');
INSERT INTO `t_flatcode` VALUES ('2650', 'DM_XXDM', '高等学校代码', '11625', null, '中国青年政治学院');
INSERT INTO `t_flatcode` VALUES ('2651', 'DM_XXDM', '高等学校代码', '11626', null, '北京青年政治学院');
INSERT INTO `t_flatcode` VALUES ('2652', 'DM_XXDM', '高等学校代码', '11831', null, '首钢工学院');
INSERT INTO `t_flatcode` VALUES ('2653', 'DM_XXDM', '高等学校代码', '12448', null, '北京农业职业学院');
INSERT INTO `t_flatcode` VALUES ('2654', 'DM_XXDM', '高等学校代码', '12733', null, '北京科技经营管理学院');
INSERT INTO `t_flatcode` VALUES ('2655', 'DM_XXDM', '高等学校代码', '12802', null, '北京吉利大学');
INSERT INTO `t_flatcode` VALUES ('2656', 'DM_XXDM', '高等学校代码', '80170', null, '中国科大研究生院');
INSERT INTO `t_flatcode` VALUES ('2657', 'DM_XXDM', '高等学校代码', '80201', null, '社科院研究生院');
INSERT INTO `t_flatcode` VALUES ('2658', 'DM_XXDM', '高等学校代码', '80204', null, '五一一研究所');
INSERT INTO `t_flatcode` VALUES ('2659', 'DM_XXDM', '高等学校代码', '80205', null, '航天总公司三院35所');
INSERT INTO `t_flatcode` VALUES ('2660', 'DM_XXDM', '高等学校代码', '80901', null, '中国科技信息研究所');
INSERT INTO `t_flatcode` VALUES ('2661', 'DM_XXDM', '高等学校代码', '81601', null, '财政科学研究所');
INSERT INTO `t_flatcode` VALUES ('2662', 'DM_XXDM', '高等学校代码', '81801', null, '人行研究生部');
INSERT INTO `t_flatcode` VALUES ('2663', 'DM_XXDM', '高等学校代码', '82101', null, '农科院研究生院');
INSERT INTO `t_flatcode` VALUES ('2664', 'DM_XXDM', '高等学校代码', '82201', null, '林业科学研究院');
INSERT INTO `t_flatcode` VALUES ('2665', 'DM_XXDM', '高等学校代码', '82301', null, '水利水电科学研究院');
INSERT INTO `t_flatcode` VALUES ('2666', 'DM_XXDM', '高等学校代码', '82302', null, '电科院研究生部');
INSERT INTO `t_flatcode` VALUES ('2667', 'DM_XXDM', '高等学校代码', '82401', null, '中国建筑科学研究院');
INSERT INTO `t_flatcode` VALUES ('2668', 'DM_XXDM', '高等学校代码', '82402', null, '城市规划设计研究院');
INSERT INTO `t_flatcode` VALUES ('2669', 'DM_XXDM', '高等学校代码', '82501', null, '中国地质科学院');
INSERT INTO `t_flatcode` VALUES ('2670', 'DM_XXDM', '高等学校代码', '82601', null, '钢铁研究总院');
INSERT INTO `t_flatcode` VALUES ('2671', 'DM_XXDM', '高等学校代码', '82602', null, '冶金部建筑研究总院');
INSERT INTO `t_flatcode` VALUES ('2672', 'DM_XXDM', '高等学校代码', '82605', null, '冶金部自动化研究所');
INSERT INTO `t_flatcode` VALUES ('2673', 'DM_XXDM', '高等学校代码', '82701', null, '机械科学研究院');
INSERT INTO `t_flatcode` VALUES ('2674', 'DM_XXDM', '高等学校代码', '82703', null, '机械工业自动化所');
INSERT INTO `t_flatcode` VALUES ('2675', 'DM_XXDM', '高等学校代码', '82715', null, '农业机械化研究所');
INSERT INTO `t_flatcode` VALUES ('2676', 'DM_XXDM', '高等学校代码', '82801', null, '中国原子能科研院');
INSERT INTO `t_flatcode` VALUES ('2677', 'DM_XXDM', '高等学校代码', '82803', null, '核工业部二院');
INSERT INTO `t_flatcode` VALUES ('2678', 'DM_XXDM', '高等学校代码', '82806', null, '核工业部地质研究所');
INSERT INTO `t_flatcode` VALUES ('2679', 'DM_XXDM', '高等学校代码', '82807', null, '核工业部化工冶金所');
INSERT INTO `t_flatcode` VALUES ('2680', 'DM_XXDM', '高等学校代码', '82902', null, '航空航天部303所');
INSERT INTO `t_flatcode` VALUES ('2681', 'DM_XXDM', '高等学校代码', '82913', null, '北京航空材料研究院');
INSERT INTO `t_flatcode` VALUES ('2682', 'DM_XXDM', '高等学校代码', '82914', null, '航空航天部625所');
INSERT INTO `t_flatcode` VALUES ('2683', 'DM_XXDM', '高等学校代码', '82920', null, '航天工业规划设计院');
INSERT INTO `t_flatcode` VALUES ('2684', 'DM_XXDM', '高等学校代码', '82932', null, '航空航天部304所');
INSERT INTO `t_flatcode` VALUES ('2685', 'DM_XXDM', '高等学校代码', '83001', null, '华北计算机系统工程研究所');
INSERT INTO `t_flatcode` VALUES ('2686', 'DM_XXDM', '高等学校代码', '83002', null, '华北计算技术所');
INSERT INTO `t_flatcode` VALUES ('2687', 'DM_XXDM', '高等学校代码', '83003', null, '北京真空电子技术');
INSERT INTO `t_flatcode` VALUES ('2688', 'DM_XXDM', '高等学校代码', '83011', null, '信息产业部电子11研究所');
INSERT INTO `t_flatcode` VALUES ('2689', 'DM_XXDM', '高等学校代码', '83201', null, '航天科技集团公司一院');
INSERT INTO `t_flatcode` VALUES ('2690', 'DM_XXDM', '高等学校代码', '83222', null, '航天部第二研究院');
INSERT INTO `t_flatcode` VALUES ('2691', 'DM_XXDM', '高等学校代码', '83223', null, '航天部四部');
INSERT INTO `t_flatcode` VALUES ('2692', 'DM_XXDM', '高等学校代码', '85405', null, '地震局分析预报中心');
INSERT INTO `t_flatcode` VALUES ('2693', 'DM_XXDM', '高等学校代码', '85407', null, '国家地震局地壳应力研究所');
INSERT INTO `t_flatcode` VALUES ('2694', 'DM_XXDM', '高等学校代码', '85801', null, '中国计量科学研究院');
INSERT INTO `t_flatcode` VALUES ('2695', 'DM_XXDM', '高等学校代码', '85802', null, '中国测绘科学研究院');
INSERT INTO `t_flatcode` VALUES ('2696', 'DM_XXDM', '高等学校代码', '86301', null, '石油化工科研院');
INSERT INTO `t_flatcode` VALUES ('2697', 'DM_XXDM', '高等学校代码', '86402', null, '北京矿冶研究总院');
INSERT INTO `t_flatcode` VALUES ('2698', 'DM_XXDM', '高等学校代码', '86403', null, '有色金属研究总院');
INSERT INTO `t_flatcode` VALUES ('2699', 'DM_XXDM', '高等学校代码', '87002', null, '煤炭科学研究总院');
INSERT INTO `t_flatcode` VALUES ('2700', 'DM_XXDM', '高等学校代码', '87101', null, '市科学技术研究院劳保研究所');
INSERT INTO `t_flatcode` VALUES ('2701', 'DM_XXDM', '高等学校代码', '87103', null, '市环境保护研究所');
INSERT INTO `t_flatcode` VALUES ('2702', 'DM_XXDM', '高等学校代码', '87110', null, '市心肺血管疾病研究所');
INSERT INTO `t_flatcode` VALUES ('2703', 'DM_XXDM', '高等学校代码', '87111', null, '市政工程研究所');
INSERT INTO `t_flatcode` VALUES ('2704', 'DM_XXDM', '高等学校代码', '87112', null, '北京结核病胸部肿瘤研究所');
INSERT INTO `t_flatcode` VALUES ('2705', 'DM_XXDM', '高等学校代码', '87113', null, '市创伤骨科研究所');
INSERT INTO `t_flatcode` VALUES ('2706', 'DM_XXDM', '高等学校代码', '87114', null, '北京市中医研究所');
INSERT INTO `t_flatcode` VALUES ('2707', 'DM_XXDM', '高等学校代码', '87120', null, '首都儿科研究所');
INSERT INTO `t_flatcode` VALUES ('2708', 'DM_XXDM', '高等学校代码', '10055', null, '南开大学');
INSERT INTO `t_flatcode` VALUES ('2709', 'DM_XXDM', '高等学校代码', '10056', null, '天津大学');
INSERT INTO `t_flatcode` VALUES ('2710', 'DM_XXDM', '高等学校代码', '10057', null, '天津轻工业学院');
INSERT INTO `t_flatcode` VALUES ('2711', 'DM_XXDM', '高等学校代码', '10058', null, '天津工业大学');
INSERT INTO `t_flatcode` VALUES ('2712', 'DM_XXDM', '高等学校代码', '10059', null, '中国民用航空学院');
INSERT INTO `t_flatcode` VALUES ('2713', 'DM_XXDM', '高等学校代码', '10060', null, '天津理工学院');
INSERT INTO `t_flatcode` VALUES ('2714', 'DM_XXDM', '高等学校代码', '10061', null, '天津农学院');
INSERT INTO `t_flatcode` VALUES ('2715', 'DM_XXDM', '高等学校代码', '10062', null, '天津医科大学');
INSERT INTO `t_flatcode` VALUES ('2716', 'DM_XXDM', '高等学校代码', '10063', null, '天津中医学院');
INSERT INTO `t_flatcode` VALUES ('2717', 'DM_XXDM', '高等学校代码', '10065', null, '天津师范大学');
INSERT INTO `t_flatcode` VALUES ('2718', 'DM_XXDM', '高等学校代码', '10066', null, '天津职业技术师范学院');
INSERT INTO `t_flatcode` VALUES ('2719', 'DM_XXDM', '高等学校代码', '10068', null, '天津外国语学院');
INSERT INTO `t_flatcode` VALUES ('2720', 'DM_XXDM', '高等学校代码', '10069', null, '天津商学院');
INSERT INTO `t_flatcode` VALUES ('2721', 'DM_XXDM', '高等学校代码', '10070', null, '天津财经学院');
INSERT INTO `t_flatcode` VALUES ('2722', 'DM_XXDM', '高等学校代码', '10071', null, '天津体育学院');
INSERT INTO `t_flatcode` VALUES ('2723', 'DM_XXDM', '高等学校代码', '10072', null, '天津音乐学院');
INSERT INTO `t_flatcode` VALUES ('2724', 'DM_XXDM', '高等学校代码', '10073', null, '天津美术学院');
INSERT INTO `t_flatcode` VALUES ('2725', 'DM_XXDM', '高等学校代码', '10792', null, '天津城市建设学院');
INSERT INTO `t_flatcode` VALUES ('2726', 'DM_XXDM', '高等学校代码', '10099', null, '唐山师范学院');
INSERT INTO `t_flatcode` VALUES ('2727', 'DM_XXDM', '高等学校代码', '10100', null, '廊坊师范学院');
INSERT INTO `t_flatcode` VALUES ('2728', 'DM_XXDM', '高等学校代码', '10101', null, '衡水师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2729', 'DM_XXDM', '高等学校代码', '10102', null, '石家庄师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2730', 'DM_XXDM', '高等学校代码', '10103', null, '邯郸师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2731', 'DM_XXDM', '高等学校代码', '10104', null, '邢台师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2732', 'DM_XXDM', '高等学校代码', '10105', null, '沧州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2733', 'DM_XXDM', '高等学校代码', '10107', null, '石家庄铁道学院');
INSERT INTO `t_flatcode` VALUES ('2734', 'DM_XXDM', '高等学校代码', '10216', null, '燕山大学');
INSERT INTO `t_flatcode` VALUES ('2735', 'DM_XXDM', '高等学校代码', '10795', null, '邯郸农业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2736', 'DM_XXDM', '高等学校代码', '10796', null, '邯郸医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2737', 'DM_XXDM', '高等学校代码', '10798', null, '河北职业技术师范学院');
INSERT INTO `t_flatcode` VALUES ('2738', 'DM_XXDM', '高等学校代码', '10837', null, '河北职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2739', 'DM_XXDM', '高等学校代码', '10873', null, '河北工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2740', 'DM_XXDM', '高等学校代码', '11033', null, '唐山高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2741', 'DM_XXDM', '高等学校代码', '11034', null, '邯郸职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2742', 'DM_XXDM', '高等学校代码', '11104', null, '华北矿业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2743', 'DM_XXDM', '高等学校代码', '11105', null, '中国人民武装警察部队学院');
INSERT INTO `t_flatcode` VALUES ('2744', 'DM_XXDM', '高等学校代码', '11236', null, '河北体育学院');
INSERT INTO `t_flatcode` VALUES ('2745', 'DM_XXDM', '高等学校代码', '11238', null, '石家庄职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2746', 'DM_XXDM', '高等学校代码', '11420', null, '保定金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2747', 'DM_XXDM', '高等学校代码', '11423', null, '张家口职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2748', 'DM_XXDM', '高等学校代码', '11424', null, '承德民族职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2749', 'DM_XXDM', '高等学校代码', '11629', null, '华北航天工业学院');
INSERT INTO `t_flatcode` VALUES ('2750', 'DM_XXDM', '高等学校代码', '11775', null, '防灾技术高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2751', 'DM_XXDM', '高等学校代码', '11777', null, '承德石油高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2752', 'DM_XXDM', '高等学校代码', '11821', null, '邢台职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2753', 'DM_XXDM', '高等学校代码', '11832', null, '河北经贸大学');
INSERT INTO `t_flatcode` VALUES ('2754', 'DM_XXDM', '高等学校代码', '12352', null, '河北工程技术职业学院');
INSERT INTO `t_flatcode` VALUES ('2755', 'DM_XXDM', '高等学校代码', '12367', null, '河北石油职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2756', 'DM_XXDM', '高等学校代码', '12389', null, '河北建材职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2757', 'DM_XXDM', '高等学校代码', '12408', null, '河北政法职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2758', 'DM_XXDM', '高等学校代码', '12415', null, '沧州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2759', 'DM_XXDM', '高等学校代码', '12418', null, '河北能源职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2760', 'DM_XXDM', '高等学校代码', '12424', null, '石家庄铁路工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2761', 'DM_XXDM', '高等学校代码', '12543', null, '保定职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2762', 'DM_XXDM', '高等学校代码', '12388', null, '长治职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2763', 'DM_XXDM', '高等学校代码', '12704', null, '山西艺术职业学院');
INSERT INTO `t_flatcode` VALUES ('2764', 'DM_XXDM', '高等学校代码', '12774', null, '晋城职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2765', 'DM_XXDM', '高等学校代码', '12775', null, '山西建筑工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2766', 'DM_XXDM', '高等学校代码', '12776', null, '山西生物应用职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2767', 'DM_XXDM', '高等学校代码', '12777', null, '山西省工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2768', 'DM_XXDM', '高等学校代码', '12778', null, '山西交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2769', 'DM_XXDM', '高等学校代码', '12779', null, '山西兴华职业学院');
INSERT INTO `t_flatcode` VALUES ('2770', 'DM_XXDM', '高等学校代码', '12780', null, '北岳职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2771', 'DM_XXDM', '高等学校代码', '80043', null, '中科院山西煤炭化学研究所');
INSERT INTO `t_flatcode` VALUES ('2772', 'DM_XXDM', '高等学校代码', '82808', null, '中国辐射防护研究所');
INSERT INTO `t_flatcode` VALUES ('2773', 'DM_XXDM', '高等学校代码', '83704', null, '轻科院日用化工研究所');
INSERT INTO `t_flatcode` VALUES ('2774', 'DM_XXDM', '高等学校代码', '87401', null, '山西省中医药研究院');
INSERT INTO `t_flatcode` VALUES ('2775', 'DM_XXDM', '高等学校代码', '10126', null, '内蒙古大学');
INSERT INTO `t_flatcode` VALUES ('2776', 'DM_XXDM', '高等学校代码', '10127', null, '包头钢铁学院');
INSERT INTO `t_flatcode` VALUES ('2777', 'DM_XXDM', '高等学校代码', '10128', null, '内蒙古工业大学');
INSERT INTO `t_flatcode` VALUES ('2778', 'DM_XXDM', '高等学校代码', '10129', null, '内蒙古农业大学');
INSERT INTO `t_flatcode` VALUES ('2779', 'DM_XXDM', '高等学校代码', '10132', null, '内蒙古医学院');
INSERT INTO `t_flatcode` VALUES ('2780', 'DM_XXDM', '高等学校代码', '10133', null, '包头医学院');
INSERT INTO `t_flatcode` VALUES ('2781', 'DM_XXDM', '高等学校代码', '10135', null, '内蒙古师范大学');
INSERT INTO `t_flatcode` VALUES ('2782', 'DM_XXDM', '高等学校代码', '10136', null, '内蒙古民族大学');
INSERT INTO `t_flatcode` VALUES ('2783', 'DM_XXDM', '高等学校代码', '10137', null, '包头师范学院');
INSERT INTO `t_flatcode` VALUES ('2784', 'DM_XXDM', '高等学校代码', '10138', null, '赤峰民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2785', 'DM_XXDM', '高等学校代码', '10139', null, '内蒙古财经学院');
INSERT INTO `t_flatcode` VALUES ('2786', 'DM_XXDM', '高等学校代码', '10819', null, '呼伦贝尔学院');
INSERT INTO `t_flatcode` VALUES ('2787', 'DM_XXDM', '高等学校代码', '10871', null, '呼和浩特职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2788', 'DM_XXDM', '高等学校代码', '11427', null, '集宁师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2789', 'DM_XXDM', '高等学校代码', '11429', null, '民办内蒙古丰州学院');
INSERT INTO `t_flatcode` VALUES ('2790', 'DM_XXDM', '高等学校代码', '11631', null, '河套大学');
INSERT INTO `t_flatcode` VALUES ('2791', 'DM_XXDM', '高等学校代码', '11709', null, '内蒙古民族高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2792', 'DM_XXDM', '高等学校代码', '12057', null, '包头职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2793', 'DM_XXDM', '高等学校代码', '12443', null, '兴安职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2794', 'DM_XXDM', '高等学校代码', '12797', null, '内蒙古警察职业学院');
INSERT INTO `t_flatcode` VALUES ('2795', 'DM_XXDM', '高等学校代码', '83102', null, '中国兵器工业52研究所');
INSERT INTO `t_flatcode` VALUES ('2796', 'DM_XXDM', '高等学校代码', '10178', null, '鲁迅美术学院');
INSERT INTO `t_flatcode` VALUES ('2797', 'DM_XXDM', '高等学校代码', '10179', null, '抚顺师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2798', 'DM_XXDM', '高等学校代码', '10180', null, '锦州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2799', 'DM_XXDM', '高等学校代码', '10181', null, '营口职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2800', 'DM_XXDM', '高等学校代码', '10182', null, '铁岭师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2801', 'DM_XXDM', '高等学校代码', '10841', null, '辽宁对外经贸职业学院');
INSERT INTO `t_flatcode` VALUES ('2802', 'DM_XXDM', '高等学校代码', '10844', null, '辽宁商务职业学院');
INSERT INTO `t_flatcode` VALUES ('2803', 'DM_XXDM', '高等学校代码', '10845', null, '大连职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2804', 'DM_XXDM', '高等学校代码', '10957', null, '辽宁农业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2805', 'DM_XXDM', '高等学校代码', '11035', null, '沈阳大学');
INSERT INTO `t_flatcode` VALUES ('2806', 'DM_XXDM', '高等学校代码', '11036', null, '鞍山市高等职业专科学校');
INSERT INTO `t_flatcode` VALUES ('2807', 'DM_XXDM', '高等学校代码', '11037', null, '抚顺职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2808', 'DM_XXDM', '高等学校代码', '11249', null, '辽阳职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2809', 'DM_XXDM', '高等学校代码', '11250', null, '阜新高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2810', 'DM_XXDM', '高等学校代码', '11251', null, '本溪师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2811', 'DM_XXDM', '高等学校代码', '11252', null, '辽宁外国语师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2812', 'DM_XXDM', '高等学校代码', '11258', null, '大连大学');
INSERT INTO `t_flatcode` VALUES ('2813', 'DM_XXDM', '高等学校代码', '11259', null, '本溪市高等职业专科学校');
INSERT INTO `t_flatcode` VALUES ('2814', 'DM_XXDM', '高等学校代码', '11430', null, '本溪冶金高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2815', 'DM_XXDM', '高等学校代码', '11431', null, '辽阳石油化工高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2816', 'DM_XXDM', '高等学校代码', '11432', null, '辽宁警官高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2817', 'DM_XXDM', '高等学校代码', '11500', null, '辽宁交通高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2818', 'DM_XXDM', '高等学校代码', '11632', null, '沈阳电力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2819', 'DM_XXDM', '高等学校代码', '11735', null, '辽宁税务高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2820', 'DM_XXDM', '高等学校代码', '11779', null, '辽宁财政高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2821', 'DM_XXDM', '高等学校代码', '12026', null, '大连民族学院');
INSERT INTO `t_flatcode` VALUES ('2822', 'DM_XXDM', '高等学校代码', '12063', null, '盘锦职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2823', 'DM_XXDM', '高等学校代码', '12730', null, '大连商务职业学院');
INSERT INTO `t_flatcode` VALUES ('2824', 'DM_XXDM', '高等学校代码', '12839', null, '大连艺术职业学院');
INSERT INTO `t_flatcode` VALUES ('2825', 'DM_XXDM', '高等学校代码', '12840', null, '大连东软信息技术职业学院');
INSERT INTO `t_flatcode` VALUES ('2826', 'DM_XXDM', '高等学校代码', '12931', null, '渤海船舶职业学院');
INSERT INTO `t_flatcode` VALUES ('2827', 'DM_XXDM', '高等学校代码', '80038', null, '中科院大连化学物理研究所');
INSERT INTO `t_flatcode` VALUES ('2828', 'DM_XXDM', '高等学校代码', '80127', null, '沈阳应用生态所');
INSERT INTO `t_flatcode` VALUES ('2829', 'DM_XXDM', '高等学校代码', '80133', null, '中国科学院沈阳计算所');
INSERT INTO `t_flatcode` VALUES ('2830', 'DM_XXDM', '高等学校代码', '80144', null, '金属研究所');
INSERT INTO `t_flatcode` VALUES ('2831', 'DM_XXDM', '高等学校代码', '80147', null, '沈阳自动化所');
INSERT INTO `t_flatcode` VALUES ('2832', 'DM_XXDM', '高等学校代码', '11439', null, '吉林特产高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2833', 'DM_XXDM', '高等学校代码', '11440', null, '长春金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2834', 'DM_XXDM', '高等学校代码', '11441', null, '吉林公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2835', 'DM_XXDM', '高等学校代码', '11726', null, '长春大学');
INSERT INTO `t_flatcode` VALUES ('2836', 'DM_XXDM', '高等学校代码', '11823', null, '长春医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2837', 'DM_XXDM', '高等学校代码', '12049', null, '吉林交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2838', 'DM_XXDM', '高等学校代码', '12305', null, '吉林对外经贸职业学院');
INSERT INTO `t_flatcode` VALUES ('2839', 'DM_XXDM', '高等学校代码', '12306', null, '民办东方学院');
INSERT INTO `t_flatcode` VALUES ('2840', 'DM_XXDM', '高等学校代码', '80037', null, '中国科学院长春应化所');
INSERT INTO `t_flatcode` VALUES ('2841', 'DM_XXDM', '高等学校代码', '80062', null, '中国科学院长春地');
INSERT INTO `t_flatcode` VALUES ('2842', 'DM_XXDM', '高等学校代码', '80139', null, '中国科学院长春光机所');
INSERT INTO `t_flatcode` VALUES ('2843', 'DM_XXDM', '高等学校代码', '86701', null, '长春汽车研究所');
INSERT INTO `t_flatcode` VALUES ('2844', 'DM_XXDM', '高等学校代码', '89802', null, '长春生物制品研究所');
INSERT INTO `t_flatcode` VALUES ('2845', 'DM_XXDM', '高等学校代码', '10212', null, '黑龙江大学');
INSERT INTO `t_flatcode` VALUES ('2846', 'DM_XXDM', '高等学校代码', '10213', null, '哈尔滨工业大学');
INSERT INTO `t_flatcode` VALUES ('2847', 'DM_XXDM', '高等学校代码', '10214', null, '哈尔滨理工大学');
INSERT INTO `t_flatcode` VALUES ('2848', 'DM_XXDM', '高等学校代码', '10217', null, '哈尔滨工程大学');
INSERT INTO `t_flatcode` VALUES ('2849', 'DM_XXDM', '高等学校代码', '10219', null, '黑龙江科技学院');
INSERT INTO `t_flatcode` VALUES ('2850', 'DM_XXDM', '高等学校代码', '10220', null, '大庆石油学院');
INSERT INTO `t_flatcode` VALUES ('2851', 'DM_XXDM', '高等学校代码', '10222', null, '佳木斯大学');
INSERT INTO `t_flatcode` VALUES ('2852', 'DM_XXDM', '高等学校代码', '10223', null, '黑龙江八一农垦大学');
INSERT INTO `t_flatcode` VALUES ('2853', 'DM_XXDM', '高等学校代码', '10224', null, '东北农业大学');
INSERT INTO `t_flatcode` VALUES ('2854', 'DM_XXDM', '高等学校代码', '10225', null, '东北林业大学');
INSERT INTO `t_flatcode` VALUES ('2855', 'DM_XXDM', '高等学校代码', '10226', null, '哈尔滨医科大学');
INSERT INTO `t_flatcode` VALUES ('2856', 'DM_XXDM', '高等学校代码', '10228', null, '黑龙江中医药大学');
INSERT INTO `t_flatcode` VALUES ('2857', 'DM_XXDM', '高等学校代码', '10229', null, '牡丹江医学院');
INSERT INTO `t_flatcode` VALUES ('2858', 'DM_XXDM', '高等学校代码', '10231', null, '哈尔滨师范大学');
INSERT INTO `t_flatcode` VALUES ('2859', 'DM_XXDM', '高等学校代码', '10232', null, '齐齐哈尔大学');
INSERT INTO `t_flatcode` VALUES ('2860', 'DM_XXDM', '高等学校代码', '10233', null, '牡丹江师范学院');
INSERT INTO `t_flatcode` VALUES ('2861', 'DM_XXDM', '高等学校代码', '10234', null, '哈尔滨学院');
INSERT INTO `t_flatcode` VALUES ('2862', 'DM_XXDM', '高等学校代码', '10235', null, '大庆高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2863', 'DM_XXDM', '高等学校代码', '10236', null, '绥化师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2864', 'DM_XXDM', '高等学校代码', '10238', null, '克山师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2865', 'DM_XXDM', '高等学校代码', '10239', null, '呼兰师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2866', 'DM_XXDM', '高等学校代码', '10255', null, '东华大学');
INSERT INTO `t_flatcode` VALUES ('2867', 'DM_XXDM', '高等学校代码', '10256', null, '上海电力学院');
INSERT INTO `t_flatcode` VALUES ('2868', 'DM_XXDM', '高等学校代码', '10259', null, '上海应用技术学院');
INSERT INTO `t_flatcode` VALUES ('2869', 'DM_XXDM', '高等学校代码', '10262', null, '上海医疗器械高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2870', 'DM_XXDM', '高等学校代码', '10264', null, '上海水产大学');
INSERT INTO `t_flatcode` VALUES ('2871', 'DM_XXDM', '高等学校代码', '10266', null, '上海第二医科大学');
INSERT INTO `t_flatcode` VALUES ('2872', 'DM_XXDM', '高等学校代码', '10268', null, '上海中医药大学');
INSERT INTO `t_flatcode` VALUES ('2873', 'DM_XXDM', '高等学校代码', '10269', null, '华东师范大学');
INSERT INTO `t_flatcode` VALUES ('2874', 'DM_XXDM', '高等学校代码', '10270', null, '上海师范大学');
INSERT INTO `t_flatcode` VALUES ('2875', 'DM_XXDM', '高等学校代码', '10271', null, '上海外国语大学');
INSERT INTO `t_flatcode` VALUES ('2876', 'DM_XXDM', '高等学校代码', '10272', null, '上海财经大学');
INSERT INTO `t_flatcode` VALUES ('2877', 'DM_XXDM', '高等学校代码', '10273', null, '上海对外贸易学院');
INSERT INTO `t_flatcode` VALUES ('2878', 'DM_XXDM', '高等学校代码', '10274', null, '上海海关高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2879', 'DM_XXDM', '高等学校代码', '10275', null, '上海旅游高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2880', 'DM_XXDM', '高等学校代码', '10276', null, '华东政法学院');
INSERT INTO `t_flatcode` VALUES ('2881', 'DM_XXDM', '高等学校代码', '10277', null, '上海体育学院');
INSERT INTO `t_flatcode` VALUES ('2882', 'DM_XXDM', '高等学校代码', '10278', null, '上海音乐学院');
INSERT INTO `t_flatcode` VALUES ('2883', 'DM_XXDM', '高等学校代码', '10279', null, '上海戏剧学院');
INSERT INTO `t_flatcode` VALUES ('2884', 'DM_XXDM', '高等学校代码', '10280', null, '上海大学');
INSERT INTO `t_flatcode` VALUES ('2885', 'DM_XXDM', '高等学校代码', '10283', null, '上海公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2886', 'DM_XXDM', '高等学校代码', '10851', null, '民办东海职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2887', 'DM_XXDM', '高等学校代码', '10852', null, '民办新侨职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2888', 'DM_XXDM', '高等学校代码', '10856', null, '上海工程技术大学');
INSERT INTO `t_flatcode` VALUES ('2889', 'DM_XXDM', '高等学校代码', '11047', null, '立信会计高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2890', 'DM_XXDM', '高等学校代码', '11458', null, '上海电机技术高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2891', 'DM_XXDM', '高等学校代码', '11639', null, '上海金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2892', 'DM_XXDM', '高等学校代码', '11733', null, '上海出版印刷高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2893', 'DM_XXDM', '高等学校代码', '11833', null, '民办杉达学院');
INSERT INTO `t_flatcode` VALUES ('2894', 'DM_XXDM', '高等学校代码', '12044', null, '上海第二工业大学');
INSERT INTO `t_flatcode` VALUES ('2895', 'DM_XXDM', '高等学校代码', '12050', null, '上海商业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2896', 'DM_XXDM', '高等学校代码', '12493', null, '上海行健职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2897', 'DM_XXDM', '高等学校代码', '12495', null, '上海城市管理职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2898', 'DM_XXDM', '高等学校代码', '12497', null, '上海交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2899', 'DM_XXDM', '高等学校代码', '12498', null, '上海海事职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2900', 'DM_XXDM', '高等学校代码', '12499', null, '上海电子信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2901', 'DM_XXDM', '高等学校代码', '12798', null, '民办上海济光职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2902', 'DM_XXDM', '高等学校代码', '10284', null, '南京大学');
INSERT INTO `t_flatcode` VALUES ('2903', 'DM_XXDM', '高等学校代码', '10285', null, '苏州大学');
INSERT INTO `t_flatcode` VALUES ('2904', 'DM_XXDM', '高等学校代码', '10286', null, '东南大学');
INSERT INTO `t_flatcode` VALUES ('2905', 'DM_XXDM', '高等学校代码', '10287', null, '南京航空航天大学');
INSERT INTO `t_flatcode` VALUES ('2906', 'DM_XXDM', '高等学校代码', '10288', null, '南京理工大学');
INSERT INTO `t_flatcode` VALUES ('2907', 'DM_XXDM', '高等学校代码', '10289', null, '华东船舶工业学院');
INSERT INTO `t_flatcode` VALUES ('2908', 'DM_XXDM', '高等学校代码', '10290', null, '中国矿业大学');
INSERT INTO `t_flatcode` VALUES ('2909', 'DM_XXDM', '高等学校代码', '10291', null, '南京工业大学');
INSERT INTO `t_flatcode` VALUES ('2910', 'DM_XXDM', '高等学校代码', '10292', null, '江苏石油化工学院');
INSERT INTO `t_flatcode` VALUES ('2911', 'DM_XXDM', '高等学校代码', '10293', null, '南京邮电学院');
INSERT INTO `t_flatcode` VALUES ('2912', 'DM_XXDM', '高等学校代码', '10294', null, '河海大学');
INSERT INTO `t_flatcode` VALUES ('2913', 'DM_XXDM', '高等学校代码', '10295', null, '江南大学');
INSERT INTO `t_flatcode` VALUES ('2914', 'DM_XXDM', '高等学校代码', '10298', null, '南京林业大学');
INSERT INTO `t_flatcode` VALUES ('2915', 'DM_XXDM', '高等学校代码', '10299', null, '江苏大学');
INSERT INTO `t_flatcode` VALUES ('2916', 'DM_XXDM', '高等学校代码', '10300', null, '南京气象学院');
INSERT INTO `t_flatcode` VALUES ('2917', 'DM_XXDM', '高等学校代码', '10301', null, '南京动力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2918', 'DM_XXDM', '高等学校代码', '10302', null, '连云港化工高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2919', 'DM_XXDM', '高等学校代码', '10304', null, '南通工学院');
INSERT INTO `t_flatcode` VALUES ('2920', 'DM_XXDM', '高等学校代码', '10305', null, '盐城工学院');
INSERT INTO `t_flatcode` VALUES ('2921', 'DM_XXDM', '高等学校代码', '10307', null, '南京农业大学');
INSERT INTO `t_flatcode` VALUES ('2922', 'DM_XXDM', '高等学校代码', '10311', null, '南通医学院');
INSERT INTO `t_flatcode` VALUES ('2923', 'DM_XXDM', '高等学校代码', '10312', null, '南京医科大学');
INSERT INTO `t_flatcode` VALUES ('2924', 'DM_XXDM', '高等学校代码', '10313', null, '徐州医学院');
INSERT INTO `t_flatcode` VALUES ('2925', 'DM_XXDM', '高等学校代码', '10315', null, '南京中医药大学');
INSERT INTO `t_flatcode` VALUES ('2926', 'DM_XXDM', '高等学校代码', '10316', null, '中国药科大学');
INSERT INTO `t_flatcode` VALUES ('2927', 'DM_XXDM', '高等学校代码', '10319', null, '南京师范大学');
INSERT INTO `t_flatcode` VALUES ('2928', 'DM_XXDM', '高等学校代码', '10320', null, '徐州师范大学');
INSERT INTO `t_flatcode` VALUES ('2929', 'DM_XXDM', '高等学校代码', '10323', null, '淮阴师范学院');
INSERT INTO `t_flatcode` VALUES ('2930', 'DM_XXDM', '高等学校代码', '10324', null, '盐城师范学院');
INSERT INTO `t_flatcode` VALUES ('2931', 'DM_XXDM', '高等学校代码', '10325', null, '南通师范学院');
INSERT INTO `t_flatcode` VALUES ('2932', 'DM_XXDM', '高等学校代码', '10327', null, '南京经济学院');
INSERT INTO `t_flatcode` VALUES ('2933', 'DM_XXDM', '高等学校代码', '10329', null, '江苏公安专科学校');
INSERT INTO `t_flatcode` VALUES ('2934', 'DM_XXDM', '高等学校代码', '10330', null, '南京体育学院');
INSERT INTO `t_flatcode` VALUES ('2935', 'DM_XXDM', '高等学校代码', '10331', null, '南京艺术学院');
INSERT INTO `t_flatcode` VALUES ('2936', 'DM_XXDM', '高等学校代码', '10332', null, '苏州科技学院');
INSERT INTO `t_flatcode` VALUES ('2937', 'DM_XXDM', '高等学校代码', '10333', null, '常熟高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2938', 'DM_XXDM', '高等学校代码', '12809', null, '苏州工业园区职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2939', 'DM_XXDM', '高等学校代码', '80021', null, '中国科学院紫金山天文台');
INSERT INTO `t_flatcode` VALUES ('2940', 'DM_XXDM', '高等学校代码', '80055', null, '中科院南京地理与湖泊研究所');
INSERT INTO `t_flatcode` VALUES ('2941', 'DM_XXDM', '高等学校代码', '80061', null, '中科院南京地质古生物研究所');
INSERT INTO `t_flatcode` VALUES ('2942', 'DM_XXDM', '高等学校代码', '80126', null, '中国科学院南京土壤研究所');
INSERT INTO `t_flatcode` VALUES ('2943', 'DM_XXDM', '高等学校代码', '80301', null, '南京天文仪器研制中心');
INSERT INTO `t_flatcode` VALUES ('2944', 'DM_XXDM', '高等学校代码', '82303', null, '电力工业部电力自动化研究所');
INSERT INTO `t_flatcode` VALUES ('2945', 'DM_XXDM', '高等学校代码', '82309', null, '水电部南京水利科学研究院');
INSERT INTO `t_flatcode` VALUES ('2946', 'DM_XXDM', '高等学校代码', '83005', null, '南京电子工程研究中心');
INSERT INTO `t_flatcode` VALUES ('2947', 'DM_XXDM', '高等学校代码', '83007', null, '南京电子器件研究所');
INSERT INTO `t_flatcode` VALUES ('2948', 'DM_XXDM', '高等学校代码', '86205', null, '中国舰船科学研究中心');
INSERT INTO `t_flatcode` VALUES ('2949', 'DM_XXDM', '高等学校代码', '87235', null, '江苏自动化研究所');
INSERT INTO `t_flatcode` VALUES ('2950', 'DM_XXDM', '高等学校代码', '88001', null, '江苏省植物研究所');
INSERT INTO `t_flatcode` VALUES ('2951', 'DM_XXDM', '高等学校代码', '88002', null, '江苏省血吸虫病防治研究所');
INSERT INTO `t_flatcode` VALUES ('2952', 'DM_XXDM', '高等学校代码', '10335', null, '浙江大学');
INSERT INTO `t_flatcode` VALUES ('2953', 'DM_XXDM', '高等学校代码', '10336', null, '杭州电子工业学院');
INSERT INTO `t_flatcode` VALUES ('2954', 'DM_XXDM', '高等学校代码', '10337', null, '浙江工业大学');
INSERT INTO `t_flatcode` VALUES ('2955', 'DM_XXDM', '高等学校代码', '10338', null, '浙江工程学院');
INSERT INTO `t_flatcode` VALUES ('2956', 'DM_XXDM', '高等学校代码', '10340', null, '浙江海洋学院');
INSERT INTO `t_flatcode` VALUES ('2957', 'DM_XXDM', '高等学校代码', '10341', null, '浙江林学院');
INSERT INTO `t_flatcode` VALUES ('2958', 'DM_XXDM', '高等学校代码', '10343', null, '温州医学院');
INSERT INTO `t_flatcode` VALUES ('2959', 'DM_XXDM', '高等学校代码', '10344', null, '浙江中医学院');
INSERT INTO `t_flatcode` VALUES ('2960', 'DM_XXDM', '高等学校代码', '10345', null, '浙江师范大学');
INSERT INTO `t_flatcode` VALUES ('2961', 'DM_XXDM', '高等学校代码', '10346', null, '杭州师范学院');
INSERT INTO `t_flatcode` VALUES ('2962', 'DM_XXDM', '高等学校代码', '10347', null, '湖州师范学院');
INSERT INTO `t_flatcode` VALUES ('2963', 'DM_XXDM', '高等学校代码', '10349', null, '绍兴文理学院');
INSERT INTO `t_flatcode` VALUES ('2964', 'DM_XXDM', '高等学校代码', '10350', null, '台州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2965', 'DM_XXDM', '高等学校代码', '10351', null, '温州师范学院');
INSERT INTO `t_flatcode` VALUES ('2966', 'DM_XXDM', '高等学校代码', '10352', null, '丽水师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2967', 'DM_XXDM', '高等学校代码', '10353', null, '杭州商学院');
INSERT INTO `t_flatcode` VALUES ('2968', 'DM_XXDM', '高等学校代码', '10354', null, '嘉兴学院');
INSERT INTO `t_flatcode` VALUES ('2969', 'DM_XXDM', '高等学校代码', '10355', null, '中国美术学院');
INSERT INTO `t_flatcode` VALUES ('2970', 'DM_XXDM', '高等学校代码', '10356', null, '中国计量学院');
INSERT INTO `t_flatcode` VALUES ('2971', 'DM_XXDM', '高等学校代码', '10829', null, '公安海警高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2972', 'DM_XXDM', '高等学校代码', '10370', null, '安徽师范大学');
INSERT INTO `t_flatcode` VALUES ('2973', 'DM_XXDM', '高等学校代码', '10371', null, '阜阳师范学院');
INSERT INTO `t_flatcode` VALUES ('2974', 'DM_XXDM', '高等学校代码', '10372', null, '安庆师范学院');
INSERT INTO `t_flatcode` VALUES ('2975', 'DM_XXDM', '高等学校代码', '10373', null, '淮北煤炭师范学院');
INSERT INTO `t_flatcode` VALUES ('2976', 'DM_XXDM', '高等学校代码', '10374', null, '芜湖师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2977', 'DM_XXDM', '高等学校代码', '10375', null, '黄山高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2978', 'DM_XXDM', '高等学校代码', '10376', null, '皖西学院');
INSERT INTO `t_flatcode` VALUES ('2979', 'DM_XXDM', '高等学校代码', '10377', null, '滁州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2980', 'DM_XXDM', '高等学校代码', '10378', null, '安徽财贸学院');
INSERT INTO `t_flatcode` VALUES ('2981', 'DM_XXDM', '高等学校代码', '10379', null, '宿州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2982', 'DM_XXDM', '高等学校代码', '10380', null, '巢湖师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2983', 'DM_XXDM', '高等学校代码', '10381', null, '淮南师范学院');
INSERT INTO `t_flatcode` VALUES ('2984', 'DM_XXDM', '高等学校代码', '10383', null, '铜陵财经专科学校');
INSERT INTO `t_flatcode` VALUES ('2985', 'DM_XXDM', '高等学校代码', '10869', null, '安徽纺织职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2986', 'DM_XXDM', '高等学校代码', '10878', null, '安徽建筑工业学院');
INSERT INTO `t_flatcode` VALUES ('2987', 'DM_XXDM', '高等学校代码', '10879', null, '安徽技术师范学院');
INSERT INTO `t_flatcode` VALUES ('2988', 'DM_XXDM', '高等学校代码', '10959', null, '民办三联职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2989', 'DM_XXDM', '高等学校代码', '10963', null, '淮北职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2990', 'DM_XXDM', '高等学校代码', '11059', null, '合肥联合大学');
INSERT INTO `t_flatcode` VALUES ('2991', 'DM_XXDM', '高等学校代码', '11061', null, '芜湖职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2992', 'DM_XXDM', '高等学校代码', '11305', null, '蚌埠高等专科学校');
INSERT INTO `t_flatcode` VALUES ('2993', 'DM_XXDM', '高等学校代码', '11306', null, '池州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('2994', 'DM_XXDM', '高等学校代码', '11308', null, '淮南联合大学');
INSERT INTO `t_flatcode` VALUES ('2995', 'DM_XXDM', '高等学校代码', '12072', null, '安徽商贸职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2996', 'DM_XXDM', '高等学校代码', '12073', null, '安徽水利水电职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2997', 'DM_XXDM', '高等学校代码', '12074', null, '阜阳职业技术学院');
INSERT INTO `t_flatcode` VALUES ('2998', 'DM_XXDM', '高等学校代码', '12216', null, '民办安徽新华职业学院');
INSERT INTO `t_flatcode` VALUES ('2999', 'DM_XXDM', '高等学校代码', '12217', null, '铜陵职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3000', 'DM_XXDM', '高等学校代码', '12218', null, '民办万博科技职业学院');
INSERT INTO `t_flatcode` VALUES ('3001', 'DM_XXDM', '高等学校代码', '12219', null, '安徽警官职业学院');
INSERT INTO `t_flatcode` VALUES ('3002', 'DM_XXDM', '高等学校代码', '12220', null, '淮南职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3003', 'DM_XXDM', '高等学校代码', '12334', null, '安徽工业经济职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3004', 'DM_XXDM', '高等学校代码', '12410', null, '合肥通用职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3005', 'DM_XXDM', '高等学校代码', '12810', null, '民办安徽文达信息技术职业学');
INSERT INTO `t_flatcode` VALUES ('3006', 'DM_XXDM', '高等学校代码', '12811', null, '安徽工贸职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3007', 'DM_XXDM', '高等学校代码', '12812', null, '宿州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3008', 'DM_XXDM', '高等学校代码', '11498', null, '莆田高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3009', 'DM_XXDM', '高等学校代码', '11499', null, '福建华南女子职业学院');
INSERT INTO `t_flatcode` VALUES ('3010', 'DM_XXDM', '高等学校代码', '11502', null, '福建职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3011', 'DM_XXDM', '高等学校代码', '11784', null, '仰恩大学');
INSERT INTO `t_flatcode` VALUES ('3012', 'DM_XXDM', '高等学校代码', '12708', null, '福州英华职业学院');
INSERT INTO `t_flatcode` VALUES ('3013', 'DM_XXDM', '高等学校代码', '12709', null, '厦门华厦职业学院');
INSERT INTO `t_flatcode` VALUES ('3014', 'DM_XXDM', '高等学校代码', '12710', null, '泉州光电信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3015', 'DM_XXDM', '高等学校代码', '12711', null, '泉州育青职业学院');
INSERT INTO `t_flatcode` VALUES ('3016', 'DM_XXDM', '高等学校代码', '80045', null, '中国科学院福建物构所');
INSERT INTO `t_flatcode` VALUES ('3017', 'DM_XXDM', '高等学校代码', '85303', null, '国家海洋局第三海洋研究所');
INSERT INTO `t_flatcode` VALUES ('3018', 'DM_XXDM', '高等学校代码', '10403', null, '南昌大学');
INSERT INTO `t_flatcode` VALUES ('3019', 'DM_XXDM', '高等学校代码', '10404', null, '华东交通大学');
INSERT INTO `t_flatcode` VALUES ('3020', 'DM_XXDM', '高等学校代码', '10405', null, '华东地质学院');
INSERT INTO `t_flatcode` VALUES ('3021', 'DM_XXDM', '高等学校代码', '10406', null, '南昌航空工业学院');
INSERT INTO `t_flatcode` VALUES ('3022', 'DM_XXDM', '高等学校代码', '10407', null, '南方冶金学院');
INSERT INTO `t_flatcode` VALUES ('3023', 'DM_XXDM', '高等学校代码', '10408', null, '景德镇陶瓷学院');
INSERT INTO `t_flatcode` VALUES ('3024', 'DM_XXDM', '高等学校代码', '10410', null, '江西农业大学');
INSERT INTO `t_flatcode` VALUES ('3025', 'DM_XXDM', '高等学校代码', '10412', null, '江西中医学院');
INSERT INTO `t_flatcode` VALUES ('3026', 'DM_XXDM', '高等学校代码', '10413', null, '赣南医学院');
INSERT INTO `t_flatcode` VALUES ('3027', 'DM_XXDM', '高等学校代码', '10414', null, '江西师范大学');
INSERT INTO `t_flatcode` VALUES ('3028', 'DM_XXDM', '高等学校代码', '10415', null, '九江师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3029', 'DM_XXDM', '高等学校代码', '10416', null, '上饶师范学院');
INSERT INTO `t_flatcode` VALUES ('3030', 'DM_XXDM', '高等学校代码', '10417', null, '宜春学院');
INSERT INTO `t_flatcode` VALUES ('3031', 'DM_XXDM', '高等学校代码', '10418', null, '赣南师范学院');
INSERT INTO `t_flatcode` VALUES ('3032', 'DM_XXDM', '高等学校代码', '10419', null, '井冈山师范学院');
INSERT INTO `t_flatcode` VALUES ('3033', 'DM_XXDM', '高等学校代码', '10420', null, '抚州师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3034', 'DM_XXDM', '高等学校代码', '10421', null, '江西财经大学');
INSERT INTO `t_flatcode` VALUES ('3035', 'DM_XXDM', '高等学校代码', '10839', null, '江西工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3036', 'DM_XXDM', '高等学校代码', '10846', null, '民办蓝天职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3037', 'DM_XXDM', '高等学校代码', '10890', null, '井冈山医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3038', 'DM_XXDM', '高等学校代码', '10894', null, '景德镇高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3039', 'DM_XXDM', '高等学校代码', '10895', null, '萍乡高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3040', 'DM_XXDM', '高等学校代码', '11318', null, '南昌职业技术师范学院');
INSERT INTO `t_flatcode` VALUES ('3041', 'DM_XXDM', '高等学校代码', '11319', null, '南昌水利水电高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3042', 'DM_XXDM', '高等学校代码', '10453', null, '泰安师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3043', 'DM_XXDM', '高等学校代码', '10454', null, '济宁师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3044', 'DM_XXDM', '高等学校代码', '10455', null, '菏泽师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3045', 'DM_XXDM', '高等学校代码', '10456', null, '山东经济学院');
INSERT INTO `t_flatcode` VALUES ('3046', 'DM_XXDM', '高等学校代码', '10457', null, '山东体育学院');
INSERT INTO `t_flatcode` VALUES ('3047', 'DM_XXDM', '高等学校代码', '10458', null, '山东艺术学院');
INSERT INTO `t_flatcode` VALUES ('3048', 'DM_XXDM', '高等学校代码', '10825', null, '民办山东万杰医学高等专科学');
INSERT INTO `t_flatcode` VALUES ('3049', 'DM_XXDM', '高等学校代码', '10832', null, '山东商业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3050', 'DM_XXDM', '高等学校代码', '10868', null, '民办青岛滨海职业学院');
INSERT INTO `t_flatcode` VALUES ('3051', 'DM_XXDM', '高等学校代码', '10903', null, '淄博学院');
INSERT INTO `t_flatcode` VALUES ('3052', 'DM_XXDM', '高等学校代码', '10904', null, '枣庄师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3053', 'DM_XXDM', '高等学校代码', '10908', null, '山东工艺美术学院');
INSERT INTO `t_flatcode` VALUES ('3054', 'DM_XXDM', '高等学校代码', '11065', null, '青岛大学');
INSERT INTO `t_flatcode` VALUES ('3055', 'DM_XXDM', '高等学校代码', '11066', null, '烟台大学');
INSERT INTO `t_flatcode` VALUES ('3056', 'DM_XXDM', '高等学校代码', '11067', null, '潍坊学院');
INSERT INTO `t_flatcode` VALUES ('3057', 'DM_XXDM', '高等学校代码', '11323', null, '山东水利专科学校');
INSERT INTO `t_flatcode` VALUES ('3058', 'DM_XXDM', '高等学校代码', '11324', null, '山东公安专科学校');
INSERT INTO `t_flatcode` VALUES ('3059', 'DM_XXDM', '高等学校代码', '11510', null, '济南交通高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3060', 'DM_XXDM', '高等学校代码', '11688', null, '中国煤炭经济学院');
INSERT INTO `t_flatcode` VALUES ('3061', 'DM_XXDM', '高等学校代码', '11822', null, '山东财政学院');
INSERT INTO `t_flatcode` VALUES ('3062', 'DM_XXDM', '高等学校代码', '11827', null, '山东电力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3063', 'DM_XXDM', '高等学校代码', '12062', null, '日照职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3064', 'DM_XXDM', '高等学校代码', '12070', null, '曲阜远东职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3065', 'DM_XXDM', '高等学校代码', '12071', null, '山东军星职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3066', 'DM_XXDM', '高等学校代码', '12324', null, '青岛职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3067', 'DM_XXDM', '高等学校代码', '12326', null, '威海职业学院');
INSERT INTO `t_flatcode` VALUES ('3068', 'DM_XXDM', '高等学校代码', '12330', null, '莱芜职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3069', 'DM_XXDM', '高等学校代码', '12332', null, '山东南山职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3070', 'DM_XXDM', '高等学校代码', '12335', null, '济宁职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3071', 'DM_XXDM', '高等学校代码', '12391', null, '潍坊职业学院');
INSERT INTO `t_flatcode` VALUES ('3072', 'DM_XXDM', '高等学校代码', '12396', null, '烟台职业学院');
INSERT INTO `t_flatcode` VALUES ('3073', 'DM_XXDM', '高等学校代码', '12440', null, '东营职业学院');
INSERT INTO `t_flatcode` VALUES ('3074', 'DM_XXDM', '高等学校代码', '12441', null, '聊城职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3075', 'DM_XXDM', '高等学校代码', '12707', null, '山东劳动职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3076', 'DM_XXDM', '高等学校代码', '12818', null, '滨州职业学院');
INSERT INTO `t_flatcode` VALUES ('3077', 'DM_XXDM', '高等学校代码', '12819', null, '山东纺织职业学院');
INSERT INTO `t_flatcode` VALUES ('3078', 'DM_XXDM', '高等学校代码', '10840', null, '民办中原职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3079', 'DM_XXDM', '高等学校代码', '10842', null, '三门峡职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3080', 'DM_XXDM', '高等学校代码', '10843', null, '郑州铁路职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3081', 'DM_XXDM', '高等学校代码', '10916', null, '新乡师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3082', 'DM_XXDM', '高等学校代码', '10918', null, '驻马店师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3083', 'DM_XXDM', '高等学校代码', '10919', null, '平顶山师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3084', 'DM_XXDM', '高等学校代码', '11068', null, '中州大学');
INSERT INTO `t_flatcode` VALUES ('3085', 'DM_XXDM', '高等学校代码', '11069', null, '开封大学');
INSERT INTO `t_flatcode` VALUES ('3086', 'DM_XXDM', '高等学校代码', '11070', null, '洛阳大学');
INSERT INTO `t_flatcode` VALUES ('3087', 'DM_XXDM', '高等学校代码', '11071', null, '平原大学');
INSERT INTO `t_flatcode` VALUES ('3088', 'DM_XXDM', '高等学校代码', '11326', null, '信阳农业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3089', 'DM_XXDM', '高等学校代码', '11327', null, '郑州工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3090', 'DM_XXDM', '高等学校代码', '11329', null, '河南机电高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3091', 'DM_XXDM', '高等学校代码', '11330', null, '安阳大学');
INSERT INTO `t_flatcode` VALUES ('3092', 'DM_XXDM', '高等学校代码', '11515', null, '洛阳工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3093', 'DM_XXDM', '高等学校代码', '11517', null, '河南纺织高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3094', 'DM_XXDM', '高等学校代码', '11522', null, '焦作大学');
INSERT INTO `t_flatcode` VALUES ('3095', 'DM_XXDM', '高等学校代码', '11651', null, '河南商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3096', 'DM_XXDM', '高等学校代码', '11652', null, '河南财政税务高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3097', 'DM_XXDM', '高等学校代码', '11653', null, '南阳理工学院');
INSERT INTO `t_flatcode` VALUES ('3098', 'DM_XXDM', '高等学校代码', '11765', null, '河南城建高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3099', 'DM_XXDM', '高等学校代码', '11787', null, '濮阳职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3100', 'DM_XXDM', '高等学校代码', '11788', null, '河南公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3101', 'DM_XXDM', '高等学校代码', '11828', null, '郑州电力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3102', 'DM_XXDM', '高等学校代码', '11834', null, '黄河科技学院');
INSERT INTO `t_flatcode` VALUES ('3103', 'DM_XXDM', '高等学校代码', '12058', null, '黄河水利职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3104', 'DM_XXDM', '高等学校代码', '12067', null, '许昌职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3105', 'DM_XXDM', '高等学校代码', '12735', null, '铁道警官高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3106', 'DM_XXDM', '高等学校代码', '12745', null, '商丘职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3107', 'DM_XXDM', '高等学校代码', '12746', null, '郑州科技职业学院');
INSERT INTO `t_flatcode` VALUES ('3108', 'DM_XXDM', '高等学校代码', '12747', null, '郑州华信职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3109', 'DM_XXDM', '高等学校代码', '12748', null, '平顶山工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3110', 'DM_XXDM', '高等学校代码', '12750', null, '周口职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3111', 'DM_XXDM', '高等学校代码', '12768', null, '济源职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3112', 'DM_XXDM', '高等学校代码', '12781', null, '河南司法警官职业学院');
INSERT INTO `t_flatcode` VALUES ('3113', 'DM_XXDM', '高等学校代码', '12793', null, '鹤壁职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3114', 'DM_XXDM', '高等学校代码', '10528', null, '孝感学院');
INSERT INTO `t_flatcode` VALUES ('3115', 'DM_XXDM', '高等学校代码', '10529', null, '咸宁师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3116', 'DM_XXDM', '高等学校代码', '10834', null, '武汉职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3117', 'DM_XXDM', '高等学校代码', '10920', null, '黄石高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3118', 'DM_XXDM', '高等学校代码', '10927', null, '咸宁医学院');
INSERT INTO `t_flatcode` VALUES ('3119', 'DM_XXDM', '高等学校代码', '10929', null, '郧阳医学院');
INSERT INTO `t_flatcode` VALUES ('3120', 'DM_XXDM', '高等学校代码', '10955', null, '黄冈职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3121', 'DM_XXDM', '高等学校代码', '10956', null, '民办长江职业学院');
INSERT INTO `t_flatcode` VALUES ('3122', 'DM_XXDM', '高等学校代码', '11072', null, '江汉大学');
INSERT INTO `t_flatcode` VALUES ('3123', 'DM_XXDM', '高等学校代码', '11074', null, '沙市职业大学');
INSERT INTO `t_flatcode` VALUES ('3124', 'DM_XXDM', '高等学校代码', '11075', null, '三峡大学');
INSERT INTO `t_flatcode` VALUES ('3125', 'DM_XXDM', '高等学校代码', '11332', null, '湖北公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3126', 'DM_XXDM', '高等学校代码', '11334', null, '十堰职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3127', 'DM_XXDM', '高等学校代码', '11335', null, '鄂州职业大学');
INSERT INTO `t_flatcode` VALUES ('3128', 'DM_XXDM', '高等学校代码', '11336', null, '荆门职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3129', 'DM_XXDM', '高等学校代码', '11523', null, '武汉金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3130', 'DM_XXDM', '高等学校代码', '11524', null, '武汉音乐学院');
INSERT INTO `t_flatcode` VALUES ('3131', 'DM_XXDM', '高等学校代码', '11600', null, '湖北商业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3132', 'DM_XXDM', '高等学校代码', '11621', null, '湖北农学院');
INSERT INTO `t_flatcode` VALUES ('3133', 'DM_XXDM', '高等学校代码', '11654', null, '武汉商业服务学院');
INSERT INTO `t_flatcode` VALUES ('3134', 'DM_XXDM', '高等学校代码', '11790', null, '湖北财经高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3135', 'DM_XXDM', '高等学校代码', '11794', null, '沙洋师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3136', 'DM_XXDM', '高等学校代码', '11795', null, '汉口职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3137', 'DM_XXDM', '高等学校代码', '12051', null, '孝感职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3138', 'DM_XXDM', '高等学校代码', '12052', null, '武汉船舶职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3139', 'DM_XXDM', '高等学校代码', '12347', null, '恩施职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3140', 'DM_XXDM', '高等学校代码', '12354', null, '襄樊职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3141', 'DM_XXDM', '高等学校代码', '12362', null, '武汉生物工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3142', 'DM_XXDM', '高等学校代码', '12369', null, '武汉时代职业学院');
INSERT INTO `t_flatcode` VALUES ('3143', 'DM_XXDM', '高等学校代码', '12737', null, '荆州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3144', 'DM_XXDM', '高等学校代码', '12738', null, '武汉工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3145', 'DM_XXDM', '高等学校代码', '12740', null, '仙桃职业学院');
INSERT INTO `t_flatcode` VALUES ('3146', 'DM_XXDM', '高等学校代码', '12744', null, '湖北轻工职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3147', 'DM_XXDM', '高等学校代码', '12752', null, '湖北交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3148', 'DM_XXDM', '高等学校代码', '80005', null, '武汉岩土力学研究所');
INSERT INTO `t_flatcode` VALUES ('3149', 'DM_XXDM', '高等学校代码', '80020', null, '中科院武汉物理与数学研究所');
INSERT INTO `t_flatcode` VALUES ('3150', 'DM_XXDM', '高等学校代码', '10550', null, '益阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3151', 'DM_XXDM', '高等学校代码', '10551', null, '零陵师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3152', 'DM_XXDM', '高等学校代码', '10553', null, '娄底师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3153', 'DM_XXDM', '高等学校代码', '10554', null, '湖南商学院');
INSERT INTO `t_flatcode` VALUES ('3154', 'DM_XXDM', '高等学校代码', '10555', null, '南华大学');
INSERT INTO `t_flatcode` VALUES ('3155', 'DM_XXDM', '高等学校代码', '10556', null, '长沙电力学院');
INSERT INTO `t_flatcode` VALUES ('3156', 'DM_XXDM', '高等学校代码', '10557', null, '湘潭师范学院');
INSERT INTO `t_flatcode` VALUES ('3157', 'DM_XXDM', '高等学校代码', '10823', null, '湘南医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3158', 'DM_XXDM', '高等学校代码', '10827', null, '长沙民政职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3159', 'DM_XXDM', '高等学校代码', '10830', null, '湖南工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3160', 'DM_XXDM', '高等学校代码', '10836', null, '株洲师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3161', 'DM_XXDM', '高等学校代码', '10865', null, '湖南托普信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3162', 'DM_XXDM', '高等学校代码', '11077', null, '长沙大学');
INSERT INTO `t_flatcode` VALUES ('3163', 'DM_XXDM', '高等学校代码', '11341', null, '湖南计算机专科学校');
INSERT INTO `t_flatcode` VALUES ('3164', 'DM_XXDM', '高等学校代码', '11342', null, '湖南工程学院');
INSERT INTO `t_flatcode` VALUES ('3165', 'DM_XXDM', '高等学校代码', '11527', null, '湖南城建高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3166', 'DM_XXDM', '高等学校代码', '11528', null, '湖南建材高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3167', 'DM_XXDM', '高等学校代码', '11529', null, '湖南轻工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3168', 'DM_XXDM', '高等学校代码', '11530', null, '邵阳高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3169', 'DM_XXDM', '高等学校代码', '11532', null, '湖南财经高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3170', 'DM_XXDM', '高等学校代码', '11534', null, '湖南公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3171', 'DM_XXDM', '高等学校代码', '11535', null, '株洲工学院');
INSERT INTO `t_flatcode` VALUES ('3172', 'DM_XXDM', '高等学校代码', '11538', null, '湖南女子职业大学');
INSERT INTO `t_flatcode` VALUES ('3173', 'DM_XXDM', '高等学校代码', '11601', null, '湖南税务高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3174', 'DM_XXDM', '高等学校代码', '11604', null, '株洲职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3175', 'DM_XXDM', '高等学校代码', '11761', null, '湖南医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3176', 'DM_XXDM', '高等学校代码', '11835', null, '武陵高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3177', 'DM_XXDM', '高等学校代码', '11836', null, '郴州医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3178', 'DM_XXDM', '高等学校代码', '12034', null, '湖南省第一师范学校');
INSERT INTO `t_flatcode` VALUES ('3179', 'DM_XXDM', '高等学校代码', '12055', null, '长沙航空职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3180', 'DM_XXDM', '高等学校代码', '12214', null, '怀化医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3181', 'DM_XXDM', '高等学校代码', '12300', null, '湖南大众传媒职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3182', 'DM_XXDM', '高等学校代码', '12301', null, '永州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3183', 'DM_XXDM', '高等学校代码', '12302', null, '湖南铁道职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3184', 'DM_XXDM', '高等学校代码', '12303', null, '湖南涉外经济职业学院');
INSERT INTO `t_flatcode` VALUES ('3185', 'DM_XXDM', '高等学校代码', '12304', null, '湖南科技职业学院');
INSERT INTO `t_flatcode` VALUES ('3186', 'DM_XXDM', '高等学校代码', '10587', null, '星海音乐学院');
INSERT INTO `t_flatcode` VALUES ('3187', 'DM_XXDM', '高等学校代码', '10588', null, '广东职业技术师范学院');
INSERT INTO `t_flatcode` VALUES ('3188', 'DM_XXDM', '高等学校代码', '10590', null, '深圳大学');
INSERT INTO `t_flatcode` VALUES ('3189', 'DM_XXDM', '高等学校代码', '10592', null, '广东商学院');
INSERT INTO `t_flatcode` VALUES ('3190', 'DM_XXDM', '高等学校代码', '10822', null, '白云职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3191', 'DM_XXDM', '高等学校代码', '10831', null, '顺德职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3192', 'DM_XXDM', '高等学校代码', '10833', null, '广东轻工职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3193', 'DM_XXDM', '高等学校代码', '10861', null, '广东交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3194', 'DM_XXDM', '高等学校代码', '10862', null, '广东水利电力职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3195', 'DM_XXDM', '高等学校代码', '10965', null, '潮汕职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3196', 'DM_XXDM', '高等学校代码', '11078', null, '广州大学');
INSERT INTO `t_flatcode` VALUES ('3197', 'DM_XXDM', '高等学校代码', '11106', null, '广州航海高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3198', 'DM_XXDM', '高等学校代码', '11110', null, '广东公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3199', 'DM_XXDM', '高等学校代码', '11113', null, '深圳职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3200', 'DM_XXDM', '高等学校代码', '11114', null, '民办南华工商学院');
INSERT INTO `t_flatcode` VALUES ('3201', 'DM_XXDM', '高等学校代码', '11121', null, '私立华联学院');
INSERT INTO `t_flatcode` VALUES ('3202', 'DM_XXDM', '高等学校代码', '11347', null, '仲恺农业技术学院');
INSERT INTO `t_flatcode` VALUES ('3203', 'DM_XXDM', '高等学校代码', '11349', null, '五邑大学');
INSERT INTO `t_flatcode` VALUES ('3204', 'DM_XXDM', '高等学校代码', '11540', null, '广州金融高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3205', 'DM_XXDM', '高等学校代码', '11545', null, '中山学院');
INSERT INTO `t_flatcode` VALUES ('3206', 'DM_XXDM', '高等学校代码', '11656', null, '茂名学院');
INSERT INTO `t_flatcode` VALUES ('3207', 'DM_XXDM', '高等学校代码', '11819', null, '东莞理工学院');
INSERT INTO `t_flatcode` VALUES ('3208', 'DM_XXDM', '高等学校代码', '11845', null, '广东工业大学');
INSERT INTO `t_flatcode` VALUES ('3209', 'DM_XXDM', '高等学校代码', '11846', null, '广东外语外贸大学');
INSERT INTO `t_flatcode` VALUES ('3210', 'DM_XXDM', '高等学校代码', '11847', null, '佛山科学技术学院');
INSERT INTO `t_flatcode` VALUES ('3211', 'DM_XXDM', '高等学校代码', '12005', null, '广东财经职业学院');
INSERT INTO `t_flatcode` VALUES ('3212', 'DM_XXDM', '高等学校代码', '12013', null, '广东外语职业学院');
INSERT INTO `t_flatcode` VALUES ('3213', 'DM_XXDM', '高等学校代码', '12040', null, '广州民航职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3214', 'DM_XXDM', '高等学校代码', '12046', null, '番禺职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3215', 'DM_XXDM', '高等学校代码', '12059', null, '民办培正商学院');
INSERT INTO `t_flatcode` VALUES ('3216', 'DM_XXDM', '高等学校代码', '12060', null, '广东松山职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3217', 'DM_XXDM', '高等学校代码', '12322', null, '广东农工商职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3218', 'DM_XXDM', '高等学校代码', '12325', null, '新安职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3219', 'DM_XXDM', '高等学校代码', '12327', null, '佛山职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3220', 'DM_XXDM', '高等学校代码', '12736', null, '广东纺织职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3221', 'DM_XXDM', '高等学校代码', '12741', null, '广东建设职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3222', 'DM_XXDM', '高等学校代码', '11355', null, '南宁职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3223', 'DM_XXDM', '高等学校代码', '11546', null, '柳州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3224', 'DM_XXDM', '高等学校代码', '11548', null, '广西财政高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3225', 'DM_XXDM', '高等学校代码', '11549', null, '邕江大学');
INSERT INTO `t_flatcode` VALUES ('3226', 'DM_XXDM', '高等学校代码', '11607', null, '钦州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3227', 'DM_XXDM', '高等学校代码', '11671', null, '桂林师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3228', 'DM_XXDM', '高等学校代码', '11773', null, '广西职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3229', 'DM_XXDM', '高等学校代码', '11825', null, '桂林航天工业高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3230', 'DM_XXDM', '高等学校代码', '11837', null, '桂林旅游高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3231', 'DM_XXDM', '高等学校代码', '11838', null, '梧州师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3232', 'DM_XXDM', '高等学校代码', '12104', null, '柳州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3233', 'DM_XXDM', '高等学校代码', '10565', null, '华南热带农业大学');
INSERT INTO `t_flatcode` VALUES ('3234', 'DM_XXDM', '高等学校代码', '10589', null, '海南大学');
INSERT INTO `t_flatcode` VALUES ('3235', 'DM_XXDM', '高等学校代码', '11100', null, '琼州大学');
INSERT INTO `t_flatcode` VALUES ('3236', 'DM_XXDM', '高等学校代码', '11658', null, '海南师范学院');
INSERT INTO `t_flatcode` VALUES ('3237', 'DM_XXDM', '高等学校代码', '11810', null, '海南医学院');
INSERT INTO `t_flatcode` VALUES ('3238', 'DM_XXDM', '高等学校代码', '11999', null, '海南职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3239', 'DM_XXDM', '高等学校代码', '12308', null, '海口经济职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3240', 'DM_XXDM', '高等学校代码', '12717', null, '三亚卓达旅游职业学院');
INSERT INTO `t_flatcode` VALUES ('3241', 'DM_XXDM', '高等学校代码', '12769', null, '海南国科园职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3242', 'DM_XXDM', '高等学校代码', '10611', null, '重庆大学');
INSERT INTO `t_flatcode` VALUES ('3243', 'DM_XXDM', '高等学校代码', '10617', null, '重庆邮电学院');
INSERT INTO `t_flatcode` VALUES ('3244', 'DM_XXDM', '高等学校代码', '10618', null, '重庆交通学院');
INSERT INTO `t_flatcode` VALUES ('3245', 'DM_XXDM', '高等学校代码', '10625', null, '西南农业大学');
INSERT INTO `t_flatcode` VALUES ('3246', 'DM_XXDM', '高等学校代码', '10631', null, '重庆医科大学');
INSERT INTO `t_flatcode` VALUES ('3247', 'DM_XXDM', '高等学校代码', '10635', null, '西南师范大学');
INSERT INTO `t_flatcode` VALUES ('3248', 'DM_XXDM', '高等学校代码', '10637', null, '重庆师范学院');
INSERT INTO `t_flatcode` VALUES ('3249', 'DM_XXDM', '高等学校代码', '10642', null, '渝西学院');
INSERT INTO `t_flatcode` VALUES ('3250', 'DM_XXDM', '高等学校代码', '10643', null, '重庆三峡学院');
INSERT INTO `t_flatcode` VALUES ('3251', 'DM_XXDM', '高等学校代码', '10647', null, '涪陵师范学院');
INSERT INTO `t_flatcode` VALUES ('3252', 'DM_XXDM', '高等学校代码', '10650', null, '四川外语学院');
INSERT INTO `t_flatcode` VALUES ('3253', 'DM_XXDM', '高等学校代码', '10652', null, '西南政法大学');
INSERT INTO `t_flatcode` VALUES ('3254', 'DM_XXDM', '高等学校代码', '10638', null, '四川师范学院');
INSERT INTO `t_flatcode` VALUES ('3255', 'DM_XXDM', '高等学校代码', '10639', null, '绵阳师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3256', 'DM_XXDM', '高等学校代码', '10640', null, '内江师范学院');
INSERT INTO `t_flatcode` VALUES ('3257', 'DM_XXDM', '高等学校代码', '10641', null, '宜宾学院');
INSERT INTO `t_flatcode` VALUES ('3258', 'DM_XXDM', '高等学校代码', '10644', null, '达县师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3259', 'DM_XXDM', '高等学校代码', '10645', null, '西昌师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3260', 'DM_XXDM', '高等学校代码', '10646', null, '阿坝师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3261', 'DM_XXDM', '高等学校代码', '10648', null, '成都师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3262', 'DM_XXDM', '高等学校代码', '10649', null, '乐山师范学院');
INSERT INTO `t_flatcode` VALUES ('3263', 'DM_XXDM', '高等学校代码', '10651', null, '西南财经大学');
INSERT INTO `t_flatcode` VALUES ('3264', 'DM_XXDM', '高等学校代码', '10653', null, '成都体育学院');
INSERT INTO `t_flatcode` VALUES ('3265', 'DM_XXDM', '高等学校代码', '10654', null, '四川音乐学院');
INSERT INTO `t_flatcode` VALUES ('3266', 'DM_XXDM', '高等学校代码', '10656', null, '西南民族学院');
INSERT INTO `t_flatcode` VALUES ('3267', 'DM_XXDM', '高等学校代码', '11079', null, '成都大学');
INSERT INTO `t_flatcode` VALUES ('3268', 'DM_XXDM', '高等学校代码', '11116', null, '成都电子机械高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3269', 'DM_XXDM', '高等学校代码', '11357', null, '自贡师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3270', 'DM_XXDM', '高等学校代码', '11360', null, '攀枝花学院');
INSERT INTO `t_flatcode` VALUES ('3271', 'DM_XXDM', '高等学校代码', '11552', null, '四川烹饪高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3272', 'DM_XXDM', '高等学校代码', '11553', null, '成都纺织高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3273', 'DM_XXDM', '高等学校代码', '11661', null, '康定民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3274', 'DM_XXDM', '高等学校代码', '11662', null, '凉山大学');
INSERT INTO `t_flatcode` VALUES ('3275', 'DM_XXDM', '高等学校代码', '11839', null, '自贡高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3276', 'DM_XXDM', '高等学校代码', '11841', null, '民办四川天一学院');
INSERT INTO `t_flatcode` VALUES ('3277', 'DM_XXDM', '高等学校代码', '12064', null, '成都航空职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3278', 'DM_XXDM', '高等学校代码', '12065', null, '四川电力职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3279', 'DM_XXDM', '高等学校代码', '12212', null, '四川警官高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3280', 'DM_XXDM', '高等学校代码', '12751', null, '四川机电职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3281', 'DM_XXDM', '高等学校代码', '12753', null, '绵阳职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3282', 'DM_XXDM', '高等学校代码', '12761', null, '四川交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3283', 'DM_XXDM', '高等学校代码', '12762', null, '四川工商职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3284', 'DM_XXDM', '高等学校代码', '12763', null, '四川工程职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3285', 'DM_XXDM', '高等学校代码', '12764', null, '四川建筑职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3286', 'DM_XXDM', '高等学校代码', '12767', null, '达州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3287', 'DM_XXDM', '高等学校代码', '80036', null, '中科院成都有机化学研究所');
INSERT INTO `t_flatcode` VALUES ('3288', 'DM_XXDM', '高等学校代码', '80075', null, '中科院成都山地灾害研究所');
INSERT INTO `t_flatcode` VALUES ('3289', 'DM_XXDM', '高等学校代码', '80110', null, '中科院成都生物研究所');
INSERT INTO `t_flatcode` VALUES ('3290', 'DM_XXDM', '高等学校代码', '12336', null, '贵州电子信息职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3291', 'DM_XXDM', '高等学校代码', '12821', null, '安顺职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3292', 'DM_XXDM', '高等学校代码', '12822', null, '黔东南民族职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3293', 'DM_XXDM', '高等学校代码', '12823', null, '黔南民族职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3294', 'DM_XXDM', '高等学校代码', '12824', null, '遵义职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3295', 'DM_XXDM', '高等学校代码', '12850', null, '贵州鸿源管理工程职业学院');
INSERT INTO `t_flatcode` VALUES ('3296', 'DM_XXDM', '高等学校代码', '80065', null, '中国科学院地球化');
INSERT INTO `t_flatcode` VALUES ('3297', 'DM_XXDM', '高等学校代码', '10673', null, '云南大学');
INSERT INTO `t_flatcode` VALUES ('3298', 'DM_XXDM', '高等学校代码', '10674', null, '昆明理工大学');
INSERT INTO `t_flatcode` VALUES ('3299', 'DM_XXDM', '高等学校代码', '10676', null, '云南农业大学');
INSERT INTO `t_flatcode` VALUES ('3300', 'DM_XXDM', '高等学校代码', '10677', null, '西南林学院');
INSERT INTO `t_flatcode` VALUES ('3301', 'DM_XXDM', '高等学校代码', '10678', null, '昆明医学院');
INSERT INTO `t_flatcode` VALUES ('3302', 'DM_XXDM', '高等学校代码', '10679', null, '大理学院');
INSERT INTO `t_flatcode` VALUES ('3303', 'DM_XXDM', '高等学校代码', '10680', null, '云南中医学院');
INSERT INTO `t_flatcode` VALUES ('3304', 'DM_XXDM', '高等学校代码', '10681', null, '云南师范大学');
INSERT INTO `t_flatcode` VALUES ('3305', 'DM_XXDM', '高等学校代码', '10682', null, '昆明师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3306', 'DM_XXDM', '高等学校代码', '10683', null, '昭通师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3307', 'DM_XXDM', '高等学校代码', '10684', null, '曲靖师范学院');
INSERT INTO `t_flatcode` VALUES ('3308', 'DM_XXDM', '高等学校代码', '10685', null, '思茅师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3309', 'DM_XXDM', '高等学校代码', '10686', null, '保山师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3310', 'DM_XXDM', '高等学校代码', '10687', null, '蒙自师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3311', 'DM_XXDM', '高等学校代码', '10689', null, '云南财贸学院');
INSERT INTO `t_flatcode` VALUES ('3312', 'DM_XXDM', '高等学校代码', '10690', null, '云南艺术学院');
INSERT INTO `t_flatcode` VALUES ('3313', 'DM_XXDM', '高等学校代码', '10691', null, '云南民族学院');
INSERT INTO `t_flatcode` VALUES ('3314', 'DM_XXDM', '高等学校代码', '11390', null, '玉溪师范学院');
INSERT INTO `t_flatcode` VALUES ('3315', 'DM_XXDM', '高等学校代码', '11391', null, '楚雄师范学院');
INSERT INTO `t_flatcode` VALUES ('3316', 'DM_XXDM', '高等学校代码', '11392', null, '云南公安高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3317', 'DM_XXDM', '高等学校代码', '11393', null, '昆明大学');
INSERT INTO `t_flatcode` VALUES ('3318', 'DM_XXDM', '高等学校代码', '11556', null, '文山师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3319', 'DM_XXDM', '高等学校代码', '11557', null, '昆明冶金高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3320', 'DM_XXDM', '高等学校代码', '12349', null, '云南国土资源职业学院');
INSERT INTO `t_flatcode` VALUES ('3321', 'DM_XXDM', '高等学校代码', '12357', null, '云南交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3322', 'DM_XXDM', '高等学校代码', '12825', null, '云南科技信息职业学院');
INSERT INTO `t_flatcode` VALUES ('3323', 'DM_XXDM', '高等学校代码', '12826', null, '西双版纳职业学院');
INSERT INTO `t_flatcode` VALUES ('3324', 'DM_XXDM', '高等学校代码', '10727', null, '西安体育学院');
INSERT INTO `t_flatcode` VALUES ('3325', 'DM_XXDM', '高等学校代码', '10728', null, '西安音乐学院');
INSERT INTO `t_flatcode` VALUES ('3326', 'DM_XXDM', '高等学校代码', '10729', null, '西安美术学院');
INSERT INTO `t_flatcode` VALUES ('3327', 'DM_XXDM', '高等学校代码', '10828', null, '陕西工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3328', 'DM_XXDM', '高等学校代码', '10966', null, '杨凌职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3329', 'DM_XXDM', '高等学校代码', '11080', null, '西安联合大学');
INSERT INTO `t_flatcode` VALUES ('3330', 'DM_XXDM', '高等学校代码', '11395', null, '榆林高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3331', 'DM_XXDM', '高等学校代码', '11396', null, '商洛师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3332', 'DM_XXDM', '高等学校代码', '11397', null, '安康师范专科学校');
INSERT INTO `t_flatcode` VALUES ('3333', 'DM_XXDM', '高等学校代码', '11400', null, '西安培华女子大学');
INSERT INTO `t_flatcode` VALUES ('3334', 'DM_XXDM', '高等学校代码', '11560', null, '西安财经学院');
INSERT INTO `t_flatcode` VALUES ('3335', 'DM_XXDM', '高等学校代码', '11664', null, '西安邮电学院');
INSERT INTO `t_flatcode` VALUES ('3336', 'DM_XXDM', '高等学校代码', '11736', null, '西安航空技术高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3337', 'DM_XXDM', '高等学校代码', '11826', null, '西安电力高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3338', 'DM_XXDM', '高等学校代码', '11840', null, '陕西医学高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3339', 'DM_XXDM', '高等学校代码', '12510', null, '陕西能源职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3340', 'DM_XXDM', '高等学校代码', '12712', null, '西安欧亚职业学院');
INSERT INTO `t_flatcode` VALUES ('3341', 'DM_XXDM', '高等学校代码', '12713', null, '西安外事职业学院');
INSERT INTO `t_flatcode` VALUES ('3342', 'DM_XXDM', '高等学校代码', '12714', null, '西安翻译职业学院');
INSERT INTO `t_flatcode` VALUES ('3343', 'DM_XXDM', '高等学校代码', '12715', null, '西京职业学院');
INSERT INTO `t_flatcode` VALUES ('3344', 'DM_XXDM', '高等学校代码', '12827', null, '陕西国防工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3345', 'DM_XXDM', '高等学校代码', '12828', null, '西安航空职业技术学校');
INSERT INTO `t_flatcode` VALUES ('3346', 'DM_XXDM', '高等学校代码', '12829', null, '陕西财经职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3347', 'DM_XXDM', '高等学校代码', '12830', null, '陕西省交通职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3348', 'DM_XXDM', '高等学校代码', '12831', null, '陕西职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3349', 'DM_XXDM', '高等学校代码', '80024', null, '中科院陕西天文台');
INSERT INTO `t_flatcode` VALUES ('3350', 'DM_XXDM', '高等学校代码', '80142', null, '中科院西安光机所');
INSERT INTO `t_flatcode` VALUES ('3351', 'DM_XXDM', '高等学校代码', '80158', null, '中科院地球环境研究所');
INSERT INTO `t_flatcode` VALUES ('3352', 'DM_XXDM', '高等学校代码', '80302', null, '中科院盐湖研究所西安二部');
INSERT INTO `t_flatcode` VALUES ('3353', 'DM_XXDM', '高等学校代码', '80303', null, '西北核技术研究所');
INSERT INTO `t_flatcode` VALUES ('3354', 'DM_XXDM', '高等学校代码', '82304', null, '国家电力公司热工研究院');
INSERT INTO `t_flatcode` VALUES ('3355', 'DM_XXDM', '高等学校代码', '82904', null, '航空航天部603所');
INSERT INTO `t_flatcode` VALUES ('3356', 'DM_XXDM', '高等学校代码', '82909', null, '航空航天部623所');
INSERT INTO `t_flatcode` VALUES ('3357', 'DM_XXDM', '高等学校代码', '82911', null, '中国飞行试验研究院');
INSERT INTO `t_flatcode` VALUES ('3358', 'DM_XXDM', '高等学校代码', '82912', null, '航空航天部631所');
INSERT INTO `t_flatcode` VALUES ('3359', 'DM_XXDM', '高等学校代码', '82936', null, '航空工业618研究所');
INSERT INTO `t_flatcode` VALUES ('3360', 'DM_XXDM', '高等学校代码', '12511', null, '甘肃建筑职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3361', 'DM_XXDM', '高等学校代码', '12539', null, '酒泉职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3362', 'DM_XXDM', '高等学校代码', '12832', null, '兰州外语职业学院');
INSERT INTO `t_flatcode` VALUES ('3363', 'DM_XXDM', '高等学校代码', '12833', null, '兰州职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3364', 'DM_XXDM', '高等学校代码', '12834', null, '甘肃警察职业学院');
INSERT INTO `t_flatcode` VALUES ('3365', 'DM_XXDM', '高等学校代码', '12835', null, '甘肃林业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3366', 'DM_XXDM', '高等学校代码', '12836', null, '甘肃工业职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3367', 'DM_XXDM', '高等学校代码', '80017', null, '中科院近代物理研究所');
INSERT INTO `t_flatcode` VALUES ('3368', 'DM_XXDM', '高等学校代码', '80039', null, '中国科学院兰州化物所');
INSERT INTO `t_flatcode` VALUES ('3369', 'DM_XXDM', '高等学校代码', '80053', null, '中科院兰州地质研究所');
INSERT INTO `t_flatcode` VALUES ('3370', 'DM_XXDM', '高等学校代码', '80059', null, '中科院寒区旱区环境与工程所');
INSERT INTO `t_flatcode` VALUES ('3371', 'DM_XXDM', '高等学校代码', '83271', null, '航天工业总公司510研究所');
INSERT INTO `t_flatcode` VALUES ('3372', 'DM_XXDM', '高等学校代码', '83505', null, '化工部化工机械及自动化研究');
INSERT INTO `t_flatcode` VALUES ('3373', 'DM_XXDM', '高等学校代码', '84507', null, '兰州生物制品研究所');
INSERT INTO `t_flatcode` VALUES ('3374', 'DM_XXDM', '高等学校代码', '85403', null, '中国地震局兰州地震研究所');
INSERT INTO `t_flatcode` VALUES ('3375', 'DM_XXDM', '高等学校代码', '89801', null, '铁道部研究院西北分院');
INSERT INTO `t_flatcode` VALUES ('3376', 'DM_XXDM', '高等学校代码', '10743', null, '青海大学');
INSERT INTO `t_flatcode` VALUES ('3377', 'DM_XXDM', '高等学校代码', '10745', null, '青海医学院');
INSERT INTO `t_flatcode` VALUES ('3378', 'DM_XXDM', '高等学校代码', '10746', null, '青海师范大学');
INSERT INTO `t_flatcode` VALUES ('3379', 'DM_XXDM', '高等学校代码', '10747', null, '青海师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3380', 'DM_XXDM', '高等学校代码', '10748', null, '青海民族学院');
INSERT INTO `t_flatcode` VALUES ('3381', 'DM_XXDM', '高等学校代码', '11563', null, '青海民族师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3382', 'DM_XXDM', '高等学校代码', '12199', null, '青海财经职业学院');
INSERT INTO `t_flatcode` VALUES ('3383', 'DM_XXDM', '高等学校代码', '12852', null, '青海警官职业学院');
INSERT INTO `t_flatcode` VALUES ('3384', 'DM_XXDM', '高等学校代码', '80046', null, '青海盐湖研究所');
INSERT INTO `t_flatcode` VALUES ('3385', 'DM_XXDM', '高等学校代码', '80081', null, '中国科学院西北高原生物研');
INSERT INTO `t_flatcode` VALUES ('3386', 'DM_XXDM', '高等学校代码', '10749', null, '宁夏大学');
INSERT INTO `t_flatcode` VALUES ('3387', 'DM_XXDM', '高等学校代码', '10751', null, '宁夏农学院');
INSERT INTO `t_flatcode` VALUES ('3388', 'DM_XXDM', '高等学校代码', '10752', null, '宁夏医学院');
INSERT INTO `t_flatcode` VALUES ('3389', 'DM_XXDM', '高等学校代码', '10753', null, '固原师范高等专科学校');
INSERT INTO `t_flatcode` VALUES ('3390', 'DM_XXDM', '高等学校代码', '11407', null, '西北第二民族学院');
INSERT INTO `t_flatcode` VALUES ('3391', 'DM_XXDM', '高等学校代码', '12544', null, '宁夏石嘴山职业技术学院');
INSERT INTO `t_flatcode` VALUES ('3392', 'DM_BZKZY', '高等学校本、专科专业代码', '010000', null, '学科门类：哲学');
INSERT INTO `t_flatcode` VALUES ('3393', 'DM_BZKZY', '高等学校本、专科专业代码', '010100', null, '哲学类');
INSERT INTO `t_flatcode` VALUES ('3394', 'DM_BZKZY', '高等学校本、专科专业代码', '010101', null, '哲学');
INSERT INTO `t_flatcode` VALUES ('3395', 'DM_BZKZY', '高等学校本、专科专业代码', '010102', null, '逻辑学');
INSERT INTO `t_flatcode` VALUES ('3396', 'DM_BZKZY', '高等学校本、专科专业代码', '010103', null, '宗教学');
INSERT INTO `t_flatcode` VALUES ('3397', 'DM_BZKZY', '高等学校本、专科专业代码', '010104', null, '伦理学');
INSERT INTO `t_flatcode` VALUES ('3398', 'DM_BZKZY', '高等学校本、专科专业代码', '020000', null, '学科门类：经济学');
INSERT INTO `t_flatcode` VALUES ('3399', 'DM_BZKZY', '高等学校本、专科专业代码', '020100', null, '经济学类');
INSERT INTO `t_flatcode` VALUES ('3400', 'DM_BZKZY', '高等学校本、专科专业代码', '020101', null, '经济学');
INSERT INTO `t_flatcode` VALUES ('3401', 'DM_BZKZY', '高等学校本、专科专业代码', '020102', null, '国际经济与贸易');
INSERT INTO `t_flatcode` VALUES ('3402', 'DM_BZKZY', '高等学校本、专科专业代码', '020103', null, '财政学');
INSERT INTO `t_flatcode` VALUES ('3403', 'DM_BZKZY', '高等学校本、专科专业代码', '020104', null, '金融学');
INSERT INTO `t_flatcode` VALUES ('3404', 'DM_BZKZY', '高等学校本、专科专业代码', '020105', null, '国民经济管理');
INSERT INTO `t_flatcode` VALUES ('3405', 'DM_BZKZY', '高等学校本、专科专业代码', '020106', null, '贸易经济');
INSERT INTO `t_flatcode` VALUES ('3406', 'DM_BZKZY', '高等学校本、专科专业代码', '020107', null, '保险');
INSERT INTO `t_flatcode` VALUES ('3407', 'DM_BZKZY', '高等学校本、专科专业代码', '020108', null, '环境经济');
INSERT INTO `t_flatcode` VALUES ('3408', 'DM_BZKZY', '高等学校本、专科专业代码', '020109', null, '金融工程');
INSERT INTO `t_flatcode` VALUES ('3409', 'DM_BZKZY', '高等学校本、专科专业代码', '020110', null, '税务');
INSERT INTO `t_flatcode` VALUES ('3410', 'DM_BZKZY', '高等学校本、专科专业代码', '020111', null, '信用管理');
INSERT INTO `t_flatcode` VALUES ('3411', 'DM_BZKZY', '高等学校本、专科专业代码', '020112', null, '网络经济学');
INSERT INTO `t_flatcode` VALUES ('3412', 'DM_BZKZY', '高等学校本、专科专业代码', '020113', null, '体育经济');
INSERT INTO `t_flatcode` VALUES ('3413', 'DM_BZKZY', '高等学校本、专科专业代码', '030000', null, '学科门类：法学');
INSERT INTO `t_flatcode` VALUES ('3414', 'DM_BZKZY', '高等学校本、专科专业代码', '030100', null, '法学类');
INSERT INTO `t_flatcode` VALUES ('3415', 'DM_BZKZY', '高等学校本、专科专业代码', '030101', null, '法学');
INSERT INTO `t_flatcode` VALUES ('3416', 'DM_BZKZY', '高等学校本、专科专业代码', '030102', null, '知识产权法');
INSERT INTO `t_flatcode` VALUES ('3417', 'DM_BZKZY', '高等学校本、专科专业代码', '030120', null, '监狱学');
INSERT INTO `t_flatcode` VALUES ('3418', 'DM_BZKZY', '高等学校本、专科专业代码', '030200', null, '马克思主义理论类');
INSERT INTO `t_flatcode` VALUES ('3419', 'DM_BZKZY', '高等学校本、专科专业代码', '030201', null, '科学社会主义与国际共产主义运动');
INSERT INTO `t_flatcode` VALUES ('3420', 'DM_BZKZY', '高等学校本、专科专业代码', '030202', null, '中国革命史与中国共产党党史');
INSERT INTO `t_flatcode` VALUES ('3421', 'DM_BZKZY', '高等学校本、专科专业代码', '040205', null, '民族传统体育');
INSERT INTO `t_flatcode` VALUES ('3422', 'DM_BZKZY', '高等学校本、专科专业代码', '040300', null, '职业技术教育类');
INSERT INTO `t_flatcode` VALUES ('3423', 'DM_BZKZY', '高等学校本、专科专业代码', '040301', null, '农艺教育');
INSERT INTO `t_flatcode` VALUES ('3424', 'DM_BZKZY', '高等学校本、专科专业代码', '040302', null, '园艺教育');
INSERT INTO `t_flatcode` VALUES ('3425', 'DM_BZKZY', '高等学校本、专科专业代码', '040303', null, '特用作物教育');
INSERT INTO `t_flatcode` VALUES ('3426', 'DM_BZKZY', '高等学校本、专科专业代码', '040304', null, '林木生产教育');
INSERT INTO `t_flatcode` VALUES ('3427', 'DM_BZKZY', '高等学校本、专科专业代码', '040305', null, '特用动物教育');
INSERT INTO `t_flatcode` VALUES ('3428', 'DM_BZKZY', '高等学校本、专科专业代码', '040306', null, '畜禽生产教育');
INSERT INTO `t_flatcode` VALUES ('3429', 'DM_BZKZY', '高等学校本、专科专业代码', '040307', null, '水产养殖教育');
INSERT INTO `t_flatcode` VALUES ('3430', 'DM_BZKZY', '高等学校本、专科专业代码', '040308', null, '应用生物教育');
INSERT INTO `t_flatcode` VALUES ('3431', 'DM_BZKZY', '高等学校本、专科专业代码', '040309', null, '农业机械教育');
INSERT INTO `t_flatcode` VALUES ('3432', 'DM_BZKZY', '高等学校本、专科专业代码', '040310', null, '农业建筑与环境控制教育');
INSERT INTO `t_flatcode` VALUES ('3433', 'DM_BZKZY', '高等学校本、专科专业代码', '040311', null, '农产品储运与加工教育');
INSERT INTO `t_flatcode` VALUES ('3434', 'DM_BZKZY', '高等学校本、专科专业代码', '040312', null, '农业经营管理教育');
INSERT INTO `t_flatcode` VALUES ('3435', 'DM_BZKZY', '高等学校本、专科专业代码', '040313', null, '机械制造工艺教育');
INSERT INTO `t_flatcode` VALUES ('3436', 'DM_BZKZY', '高等学校本、专科专业代码', '040314', null, '机械维修及检测技术教育');
INSERT INTO `t_flatcode` VALUES ('3437', 'DM_BZKZY', '高等学校本、专科专业代码', '040315', null, '机电技术教育');
INSERT INTO `t_flatcode` VALUES ('3438', 'DM_BZKZY', '高等学校本、专科专业代码', '040316', null, '电气技术教育');
INSERT INTO `t_flatcode` VALUES ('3439', 'DM_BZKZY', '高等学校本、专科专业代码', '040317', null, '汽车维修工程教育');
INSERT INTO `t_flatcode` VALUES ('3440', 'DM_BZKZY', '高等学校本、专科专业代码', '040318', null, '应用电子技术教育');
INSERT INTO `t_flatcode` VALUES ('3441', 'DM_BZKZY', '高等学校本、专科专业代码', '040319', null, '制浆造纸工艺教育');
INSERT INTO `t_flatcode` VALUES ('3442', 'DM_BZKZY', '高等学校本、专科专业代码', '040320', null, '印刷工艺教育');
INSERT INTO `t_flatcode` VALUES ('3443', 'DM_BZKZY', '高等学校本、专科专业代码', '040321', null, '橡塑制品成型工艺教育');
INSERT INTO `t_flatcode` VALUES ('3444', 'DM_BZKZY', '高等学校本、专科专业代码', '040322', null, '食品工艺教育');
INSERT INTO `t_flatcode` VALUES ('3445', 'DM_BZKZY', '高等学校本、专科专业代码', '040323', null, '纺织工艺教育');
INSERT INTO `t_flatcode` VALUES ('3446', 'DM_BZKZY', '高等学校本、专科专业代码', '040324', null, '染整工艺教育');
INSERT INTO `t_flatcode` VALUES ('3447', 'DM_BZKZY', '高等学校本、专科专业代码', '040325', null, '化工工艺教育');
INSERT INTO `t_flatcode` VALUES ('3448', 'DM_BZKZY', '高等学校本、专科专业代码', '040326', null, '化工分析与检测技术教育');
INSERT INTO `t_flatcode` VALUES ('3449', 'DM_BZKZY', '高等学校本、专科专业代码', '040327', null, '建筑材料工程教育');
INSERT INTO `t_flatcode` VALUES ('3450', 'DM_BZKZY', '高等学校本、专科专业代码', '040328', null, '建筑工程教育');
INSERT INTO `t_flatcode` VALUES ('3451', 'DM_BZKZY', '高等学校本、专科专业代码', '040329', null, '服装设计与工艺教育');
INSERT INTO `t_flatcode` VALUES ('3452', 'DM_BZKZY', '高等学校本、专科专业代码', '040330', null, '装潢设计与工艺教育');
INSERT INTO `t_flatcode` VALUES ('3453', 'DM_BZKZY', '高等学校本、专科专业代码', '040331', null, '旅游管理与服务教育');
INSERT INTO `t_flatcode` VALUES ('3454', 'DM_BZKZY', '高等学校本、专科专业代码', '040332', null, '食品营养与检验教育');
INSERT INTO `t_flatcode` VALUES ('3455', 'DM_BZKZY', '高等学校本、专科专业代码', '040333', null, '烹饪与营养教育');
INSERT INTO `t_flatcode` VALUES ('3456', 'DM_BZKZY', '高等学校本、专科专业代码', '040334', null, '财务会计教育');
INSERT INTO `t_flatcode` VALUES ('3457', 'DM_BZKZY', '高等学校本、专科专业代码', '050223', null, '越南语');
INSERT INTO `t_flatcode` VALUES ('3458', 'DM_BZKZY', '高等学校本、专科专业代码', '050224', null, '豪萨语');
INSERT INTO `t_flatcode` VALUES ('3459', 'DM_BZKZY', '高等学校本、专科专业代码', '050225', null, '斯瓦希里语');
INSERT INTO `t_flatcode` VALUES ('3460', 'DM_BZKZY', '高等学校本、专科专业代码', '050226', null, '阿尔巴尼亚语');
INSERT INTO `t_flatcode` VALUES ('3461', 'DM_BZKZY', '高等学校本、专科专业代码', '050227', null, '保加利亚语');
INSERT INTO `t_flatcode` VALUES ('3462', 'DM_BZKZY', '高等学校本、专科专业代码', '050228', null, '波兰语');
INSERT INTO `t_flatcode` VALUES ('3463', 'DM_BZKZY', '高等学校本、专科专业代码', '050229', null, '捷克语');
INSERT INTO `t_flatcode` VALUES ('3464', 'DM_BZKZY', '高等学校本、专科专业代码', '050230', null, '罗马尼亚语');
INSERT INTO `t_flatcode` VALUES ('3465', 'DM_BZKZY', '高等学校本、专科专业代码', '050231', null, '葡萄牙语');
INSERT INTO `t_flatcode` VALUES ('3466', 'DM_BZKZY', '高等学校本、专科专业代码', '050232', null, '瑞典语');
INSERT INTO `t_flatcode` VALUES ('3467', 'DM_BZKZY', '高等学校本、专科专业代码', '050233', null, '塞尔维亚—克罗地亚语');
INSERT INTO `t_flatcode` VALUES ('3468', 'DM_BZKZY', '高等学校本、专科专业代码', '050234', null, '土耳其语');
INSERT INTO `t_flatcode` VALUES ('3469', 'DM_BZKZY', '高等学校本、专科专业代码', '050235', null, '希腊语');
INSERT INTO `t_flatcode` VALUES ('3470', 'DM_BZKZY', '高等学校本、专科专业代码', '050236', null, '匈牙利语');
INSERT INTO `t_flatcode` VALUES ('3471', 'DM_BZKZY', '高等学校本、专科专业代码', '050237', null, '意大利语');
INSERT INTO `t_flatcode` VALUES ('3472', 'DM_BZKZY', '高等学校本、专科专业代码', '050238', null, '捷克语—斯洛伐克语');
INSERT INTO `t_flatcode` VALUES ('3473', 'DM_BZKZY', '高等学校本、专科专业代码', '050239', null, '泰米尔语');
INSERT INTO `t_flatcode` VALUES ('3474', 'DM_BZKZY', '高等学校本、专科专业代码', '050240', null, '普什图语');
INSERT INTO `t_flatcode` VALUES ('3475', 'DM_BZKZY', '高等学校本、专科专业代码', '050241', null, '世界语');
INSERT INTO `t_flatcode` VALUES ('3476', 'DM_BZKZY', '高等学校本、专科专业代码', '050242', null, '孟加拉语');
INSERT INTO `t_flatcode` VALUES ('3477', 'DM_BZKZY', '高等学校本、专科专业代码', '050243', null, '尼泊尔语');
INSERT INTO `t_flatcode` VALUES ('3478', 'DM_BZKZY', '高等学校本、专科专业代码', '050244', null, '塞尔维亚语—克罗地亚语');
INSERT INTO `t_flatcode` VALUES ('3479', 'DM_BZKZY', '高等学校本、专科专业代码', '050245', null, '荷兰语');
INSERT INTO `t_flatcode` VALUES ('3480', 'DM_BZKZY', '高等学校本、专科专业代码', '050246', null, '芬兰语');
INSERT INTO `t_flatcode` VALUES ('3481', 'DM_BZKZY', '高等学校本、专科专业代码', '050300', null, '新闻传播学类');
INSERT INTO `t_flatcode` VALUES ('3482', 'DM_BZKZY', '高等学校本、专科专业代码', '050301', null, '新闻学');
INSERT INTO `t_flatcode` VALUES ('3483', 'DM_BZKZY', '高等学校本、专科专业代码', '050302', null, '广播电视新闻学');
INSERT INTO `t_flatcode` VALUES ('3484', 'DM_BZKZY', '高等学校本、专科专业代码', '050303', null, '广告学');
INSERT INTO `t_flatcode` VALUES ('3485', 'DM_BZKZY', '高等学校本、专科专业代码', '050304', null, '编辑出版学');
INSERT INTO `t_flatcode` VALUES ('3486', 'DM_BZKZY', '高等学校本、专科专业代码', '050305', null, '传播学');
INSERT INTO `t_flatcode` VALUES ('3487', 'DM_BZKZY', '高等学校本、专科专业代码', '050400', null, '艺术类');
INSERT INTO `t_flatcode` VALUES ('3488', 'DM_BZKZY', '高等学校本、专科专业代码', '050401', null, '音乐学');
INSERT INTO `t_flatcode` VALUES ('3489', 'DM_BZKZY', '高等学校本、专科专业代码', '050402', null, '作曲与作曲技术理论');
INSERT INTO `t_flatcode` VALUES ('3490', 'DM_BZKZY', '高等学校本、专科专业代码', '050403', null, '音乐表演');
INSERT INTO `t_flatcode` VALUES ('3491', 'DM_BZKZY', '高等学校本、专科专业代码', '050404', null, '绘画');
INSERT INTO `t_flatcode` VALUES ('3492', 'DM_BZKZY', '高等学校本、专科专业代码', '050405', null, '雕塑');
INSERT INTO `t_flatcode` VALUES ('3493', 'DM_BZKZY', '高等学校本、专科专业代码', '070301', null, '化学');
INSERT INTO `t_flatcode` VALUES ('3494', 'DM_BZKZY', '高等学校本、专科专业代码', '070302', null, '应用化学');
INSERT INTO `t_flatcode` VALUES ('3495', 'DM_BZKZY', '高等学校本、专科专业代码', '070400', null, '生物科学类');
INSERT INTO `t_flatcode` VALUES ('3496', 'DM_BZKZY', '高等学校本、专科专业代码', '070401', null, '生物科学');
INSERT INTO `t_flatcode` VALUES ('3497', 'DM_BZKZY', '高等学校本、专科专业代码', '070402', null, '生物技术');
INSERT INTO `t_flatcode` VALUES ('3498', 'DM_BZKZY', '高等学校本、专科专业代码', '070403', null, '生物信息学');
INSERT INTO `t_flatcode` VALUES ('3499', 'DM_BZKZY', '高等学校本、专科专业代码', '070404', null, '生物信息技术');
INSERT INTO `t_flatcode` VALUES ('3500', 'DM_BZKZY', '高等学校本、专科专业代码', '070405', null, '生物科学与生物技术');
INSERT INTO `t_flatcode` VALUES ('3501', 'DM_BZKZY', '高等学校本、专科专业代码', '070500', null, '天文学类');
INSERT INTO `t_flatcode` VALUES ('3502', 'DM_BZKZY', '高等学校本、专科专业代码', '070501', null, '天文学');
INSERT INTO `t_flatcode` VALUES ('3503', 'DM_BZKZY', '高等学校本、专科专业代码', '070600', null, '地质学类');
INSERT INTO `t_flatcode` VALUES ('3504', 'DM_BZKZY', '高等学校本、专科专业代码', '070601', null, '地质学');
INSERT INTO `t_flatcode` VALUES ('3505', 'DM_BZKZY', '高等学校本、专科专业代码', '070602', null, '地球化学');
INSERT INTO `t_flatcode` VALUES ('3506', 'DM_BZKZY', '高等学校本、专科专业代码', '070700', null, '地理科学类');
INSERT INTO `t_flatcode` VALUES ('3507', 'DM_BZKZY', '高等学校本、专科专业代码', '070701', null, '地理科学');
INSERT INTO `t_flatcode` VALUES ('3508', 'DM_BZKZY', '高等学校本、专科专业代码', '070702', null, '资源环境与城乡规划管理');
INSERT INTO `t_flatcode` VALUES ('3509', 'DM_BZKZY', '高等学校本、专科专业代码', '070703', null, '地理信息系统');
INSERT INTO `t_flatcode` VALUES ('3510', 'DM_BZKZY', '高等学校本、专科专业代码', '070800', null, '地球物理学类');
INSERT INTO `t_flatcode` VALUES ('3511', 'DM_BZKZY', '高等学校本、专科专业代码', '070801', null, '地球物理学');
INSERT INTO `t_flatcode` VALUES ('3512', 'DM_BZKZY', '高等学校本、专科专业代码', '070900', null, '大气科学类');
INSERT INTO `t_flatcode` VALUES ('3513', 'DM_BZKZY', '高等学校本、专科专业代码', '070901', null, '大气科学');
INSERT INTO `t_flatcode` VALUES ('3514', 'DM_BZKZY', '高等学校本、专科专业代码', '070902', null, '应用气象学');
INSERT INTO `t_flatcode` VALUES ('3515', 'DM_BZKZY', '高等学校本、专科专业代码', '071000', null, '海洋科学类');
INSERT INTO `t_flatcode` VALUES ('3516', 'DM_BZKZY', '高等学校本、专科专业代码', '071001', null, '海洋科学');
INSERT INTO `t_flatcode` VALUES ('3517', 'DM_BZKZY', '高等学校本、专科专业代码', '071002', null, '海洋技术');
INSERT INTO `t_flatcode` VALUES ('3518', 'DM_BZKZY', '高等学校本、专科专业代码', '071003', null, '海洋管理');
INSERT INTO `t_flatcode` VALUES ('3519', 'DM_BZKZY', '高等学校本、专科专业代码', '071004', null, '军事海洋学');
INSERT INTO `t_flatcode` VALUES ('3520', 'DM_BZKZY', '高等学校本、专科专业代码', '071100', null, '力学类');
INSERT INTO `t_flatcode` VALUES ('3521', 'DM_BZKZY', '高等学校本、专科专业代码', '071101', null, '理论与应用力学');
INSERT INTO `t_flatcode` VALUES ('3522', 'DM_BZKZY', '高等学校本、专科专业代码', '071200', null, '电子信息科学类');
INSERT INTO `t_flatcode` VALUES ('3523', 'DM_BZKZY', '高等学校本、专科专业代码', '071201', null, '电子信息科学与技术');
INSERT INTO `t_flatcode` VALUES ('3524', 'DM_BZKZY', '高等学校本、专科专业代码', '071202', null, '微电子学');
INSERT INTO `t_flatcode` VALUES ('3525', 'DM_BZKZY', '高等学校本、专科专业代码', '071203', null, '光信息科学与技术');
INSERT INTO `t_flatcode` VALUES ('3526', 'DM_BZKZY', '高等学校本、专科专业代码', '071204', null, '科技防卫');
INSERT INTO `t_flatcode` VALUES ('3527', 'DM_BZKZY', '高等学校本、专科专业代码', '071205', null, '信息安全');
INSERT INTO `t_flatcode` VALUES ('3528', 'DM_BZKZY', '高等学校本、专科专业代码', '071300', null, '材料科学类');
INSERT INTO `t_flatcode` VALUES ('3529', 'DM_BZKZY', '高等学校本、专科专业代码', '080302', null, '材料成型及控制工程');
INSERT INTO `t_flatcode` VALUES ('3530', 'DM_BZKZY', '高等学校本、专科专业代码', '080303', null, '工业设计');
INSERT INTO `t_flatcode` VALUES ('3531', 'DM_BZKZY', '高等学校本、专科专业代码', '080304', null, '过程装备与控制工程');
INSERT INTO `t_flatcode` VALUES ('3532', 'DM_BZKZY', '高等学校本、专科专业代码', '080305', null, '机械工程及自动化');
INSERT INTO `t_flatcode` VALUES ('3533', 'DM_BZKZY', '高等学校本、专科专业代码', '080306', null, '车辆工程');
INSERT INTO `t_flatcode` VALUES ('3534', 'DM_BZKZY', '高等学校本、专科专业代码', '080307', null, '机械电子工程');
INSERT INTO `t_flatcode` VALUES ('3535', 'DM_BZKZY', '高等学校本、专科专业代码', '080400', null, '仪器仪表类');
INSERT INTO `t_flatcode` VALUES ('3536', 'DM_BZKZY', '高等学校本、专科专业代码', '080401', null, '测控技术与仪器');
INSERT INTO `t_flatcode` VALUES ('3537', 'DM_BZKZY', '高等学校本、专科专业代码', '080500', null, '能源动力类');
INSERT INTO `t_flatcode` VALUES ('3538', 'DM_BZKZY', '高等学校本、专科专业代码', '080501', null, '热能与动力工程');
INSERT INTO `t_flatcode` VALUES ('3539', 'DM_BZKZY', '高等学校本、专科专业代码', '080502', null, '核工程与核技术');
INSERT INTO `t_flatcode` VALUES ('3540', 'DM_BZKZY', '高等学校本、专科专业代码', '080503', null, '工程物理');
INSERT INTO `t_flatcode` VALUES ('3541', 'DM_BZKZY', '高等学校本、专科专业代码', '080600', null, '电气信息类');
INSERT INTO `t_flatcode` VALUES ('3542', 'DM_BZKZY', '高等学校本、专科专业代码', '080601', null, '电气工程及其自动化');
INSERT INTO `t_flatcode` VALUES ('3543', 'DM_BZKZY', '高等学校本、专科专业代码', '080602', null, '自动化');
INSERT INTO `t_flatcode` VALUES ('3544', 'DM_BZKZY', '高等学校本、专科专业代码', '080603', null, '电子信息工程');
INSERT INTO `t_flatcode` VALUES ('3545', 'DM_BZKZY', '高等学校本、专科专业代码', '080604', null, '通信工程');
INSERT INTO `t_flatcode` VALUES ('3546', 'DM_BZKZY', '高等学校本、专科专业代码', '080605', null, '计算机科学与技术');
INSERT INTO `t_flatcode` VALUES ('3547', 'DM_BZKZY', '高等学校本、专科专业代码', '080606', null, '电子科学与技术');
INSERT INTO `t_flatcode` VALUES ('3548', 'DM_BZKZY', '高等学校本、专科专业代码', '080607', null, '生物医学工程');
INSERT INTO `t_flatcode` VALUES ('3549', 'DM_BZKZY', '高等学校本、专科专业代码', '080608', null, '电气工程与自动化');
INSERT INTO `t_flatcode` VALUES ('3550', 'DM_BZKZY', '高等学校本、专科专业代码', '080609', null, '信息工程');
INSERT INTO `t_flatcode` VALUES ('3551', 'DM_BZKZY', '高等学校本、专科专业代码', '080610', null, '光源与照明');
INSERT INTO `t_flatcode` VALUES ('3552', 'DM_BZKZY', '高等学校本、专科专业代码', '080611', null, '软件工程');
INSERT INTO `t_flatcode` VALUES ('3553', 'DM_BZKZY', '高等学校本、专科专业代码', '080612', null, '影视艺术技术');
INSERT INTO `t_flatcode` VALUES ('3554', 'DM_BZKZY', '高等学校本、专科专业代码', '080613', null, '网络工程');
INSERT INTO `t_flatcode` VALUES ('3555', 'DM_BZKZY', '高等学校本、专科专业代码', '080614', null, '信息显示与光电技术');
INSERT INTO `t_flatcode` VALUES ('3556', 'DM_BZKZY', '高等学校本、专科专业代码', '080615', null, '集成电路设计与集成系统');
INSERT INTO `t_flatcode` VALUES ('3557', 'DM_BZKZY', '高等学校本、专科专业代码', '080616', null, '光电信息工程');
INSERT INTO `t_flatcode` VALUES ('3558', 'DM_BZKZY', '高等学校本、专科专业代码', '080617', null, '广播电视工程');
INSERT INTO `t_flatcode` VALUES ('3559', 'DM_BZKZY', '高等学校本、专科专业代码', '080618', null, '电气信息工程');
INSERT INTO `t_flatcode` VALUES ('3560', 'DM_BZKZY', '高等学校本、专科专业代码', '080619', null, '计算机软件');
INSERT INTO `t_flatcode` VALUES ('3561', 'DM_BZKZY', '高等学校本、专科专业代码', '080700', null, '土建类');
INSERT INTO `t_flatcode` VALUES ('3562', 'DM_BZKZY', '高等学校本、专科专业代码', '080701', null, '建筑学');
INSERT INTO `t_flatcode` VALUES ('3563', 'DM_BZKZY', '高等学校本、专科专业代码', '080701', null, '建筑学');
INSERT INTO `t_flatcode` VALUES ('3564', 'DM_BZKZY', '高等学校本、专科专业代码', '080702', null, '城市规划');
INSERT INTO `t_flatcode` VALUES ('3565', 'DM_BZKZY', '高等学校本、专科专业代码', '081404', null, '印刷工程');
INSERT INTO `t_flatcode` VALUES ('3566', 'DM_BZKZY', '高等学校本、专科专业代码', '081405', null, '纺织工程');
INSERT INTO `t_flatcode` VALUES ('3567', 'DM_BZKZY', '高等学校本、专科专业代码', '081406', null, '服装设计与工程');
INSERT INTO `t_flatcode` VALUES ('3568', 'DM_BZKZY', '高等学校本、专科专业代码', '081407', null, '食品质量与安全');
INSERT INTO `t_flatcode` VALUES ('3569', 'DM_BZKZY', '高等学校本、专科专业代码', '081408', null, '酿酒工程');
INSERT INTO `t_flatcode` VALUES ('3570', 'DM_BZKZY', '高等学校本、专科专业代码', '081500', null, '航空航天类');
INSERT INTO `t_flatcode` VALUES ('3571', 'DM_BZKZY', '高等学校本、专科专业代码', '081501', null, '飞行器设计与工程');
INSERT INTO `t_flatcode` VALUES ('3572', 'DM_BZKZY', '高等学校本、专科专业代码', '081502', null, '飞行器动力工程');
INSERT INTO `t_flatcode` VALUES ('3573', 'DM_BZKZY', '高等学校本、专科专业代码', '081503', null, '飞行器制造工程');
INSERT INTO `t_flatcode` VALUES ('3574', 'DM_BZKZY', '高等学校本、专科专业代码', '081504', null, '飞行器环境与生命保障工程');
INSERT INTO `t_flatcode` VALUES ('3575', 'DM_BZKZY', '高等学校本、专科专业代码', '081600', null, '武器类');
INSERT INTO `t_flatcode` VALUES ('3576', 'DM_BZKZY', '高等学校本、专科专业代码', '081601', null, '武器系统与发射工程');
INSERT INTO `t_flatcode` VALUES ('3577', 'DM_BZKZY', '高等学校本、专科专业代码', '081602', null, '探测制导与控制技术');
INSERT INTO `t_flatcode` VALUES ('3578', 'DM_BZKZY', '高等学校本、专科专业代码', '081603', null, '弹药工程与爆炸技术');
INSERT INTO `t_flatcode` VALUES ('3579', 'DM_BZKZY', '高等学校本、专科专业代码', '081604', null, '特种能源工程与烟火技术');
INSERT INTO `t_flatcode` VALUES ('3580', 'DM_BZKZY', '高等学校本、专科专业代码', '081605', null, '地面武器机动工程');
INSERT INTO `t_flatcode` VALUES ('3581', 'DM_BZKZY', '高等学校本、专科专业代码', '081606', null, '信息对抗技术');
INSERT INTO `t_flatcode` VALUES ('3582', 'DM_BZKZY', '高等学校本、专科专业代码', '081607', null, '武器系统与工程');
INSERT INTO `t_flatcode` VALUES ('3583', 'DM_BZKZY', '高等学校本、专科专业代码', '081700', null, '工程力学类');
INSERT INTO `t_flatcode` VALUES ('3584', 'DM_BZKZY', '高等学校本、专科专业代码', '081701', null, '工程力学');
INSERT INTO `t_flatcode` VALUES ('3585', 'DM_BZKZY', '高等学校本、专科专业代码', '081702', null, '工程结构分析');
INSERT INTO `t_flatcode` VALUES ('3586', 'DM_BZKZY', '高等学校本、专科专业代码', '081800', null, '生物工程类');
INSERT INTO `t_flatcode` VALUES ('3587', 'DM_BZKZY', '高等学校本、专科专业代码', '081801', null, '生物工程');
INSERT INTO `t_flatcode` VALUES ('3588', 'DM_BZKZY', '高等学校本、专科专业代码', '081900', null, '农业工程类');
INSERT INTO `t_flatcode` VALUES ('3589', 'DM_BZKZY', '高等学校本、专科专业代码', '081901', null, '农业机械化及其自动化');
INSERT INTO `t_flatcode` VALUES ('3590', 'DM_BZKZY', '高等学校本、专科专业代码', '081902', null, '农业电气化与自动化');
INSERT INTO `t_flatcode` VALUES ('3591', 'DM_BZKZY', '高等学校本、专科专业代码', '081903', null, '农业建筑环境与能源工程');
INSERT INTO `t_flatcode` VALUES ('3592', 'DM_BZKZY', '高等学校本、专科专业代码', '081904', null, '农业水利工程');
INSERT INTO `t_flatcode` VALUES ('3593', 'DM_BZKZY', '高等学校本、专科专业代码', '081905', null, '农业工程');
INSERT INTO `t_flatcode` VALUES ('3594', 'DM_BZKZY', '高等学校本、专科专业代码', '081906', null, '生物系统工程');
INSERT INTO `t_flatcode` VALUES ('3595', 'DM_BZKZY', '高等学校本、专科专业代码', '082000', null, '林业工程类');
INSERT INTO `t_flatcode` VALUES ('3596', 'DM_BZKZY', '高等学校本、专科专业代码', '082001', null, '森林工程');
INSERT INTO `t_flatcode` VALUES ('3597', 'DM_BZKZY', '高等学校本、专科专业代码', '082002', null, '木材科学与工程');
INSERT INTO `t_flatcode` VALUES ('3598', 'DM_BZKZY', '高等学校本、专科专业代码', '082003', null, '林产化工');
INSERT INTO `t_flatcode` VALUES ('3599', 'DM_BZKZY', '高等学校本、专科专业代码', '082100', null, '公安技术类');
INSERT INTO `t_flatcode` VALUES ('3600', 'DM_BZKZY', '高等学校本、专科专业代码', '082101', null, '刑事科学技术');
INSERT INTO `t_flatcode` VALUES ('3601', 'DM_BZKZY', '高等学校本、专科专业代码', '100100', null, '基础医学类');
INSERT INTO `t_flatcode` VALUES ('3602', 'DM_BZKZY', '高等学校本、专科专业代码', '100101', null, '基础医学');
INSERT INTO `t_flatcode` VALUES ('3603', 'DM_BZKZY', '高等学校本、专科专业代码', '100200', null, '预防医学类');
INSERT INTO `t_flatcode` VALUES ('3604', 'DM_BZKZY', '高等学校本、专科专业代码', '100201', null, '预防医学');
INSERT INTO `t_flatcode` VALUES ('3605', 'DM_BZKZY', '高等学校本、专科专业代码', '100300', null, '临床医学与医学技术类');
INSERT INTO `t_flatcode` VALUES ('3606', 'DM_BZKZY', '高等学校本、专科专业代码', '100301', null, '临床医学');
INSERT INTO `t_flatcode` VALUES ('3607', 'DM_BZKZY', '高等学校本、专科专业代码', '100302', null, '麻醉学');
INSERT INTO `t_flatcode` VALUES ('3608', 'DM_BZKZY', '高等学校本、专科专业代码', '100303', null, '医学影像学');
INSERT INTO `t_flatcode` VALUES ('3609', 'DM_BZKZY', '高等学校本、专科专业代码', '100304', null, '医学检验');
INSERT INTO `t_flatcode` VALUES ('3610', 'DM_BZKZY', '高等学校本、专科专业代码', '100305', null, '放射医学');
INSERT INTO `t_flatcode` VALUES ('3611', 'DM_BZKZY', '高等学校本、专科专业代码', '100306', null, '眼视光学');
INSERT INTO `t_flatcode` VALUES ('3612', 'DM_BZKZY', '高等学校本、专科专业代码', '100307', null, '康复治疗学');
INSERT INTO `t_flatcode` VALUES ('3613', 'DM_BZKZY', '高等学校本、专科专业代码', '100308', null, '精神医学');
INSERT INTO `t_flatcode` VALUES ('3614', 'DM_BZKZY', '高等学校本、专科专业代码', '100309', null, '医学技术');
INSERT INTO `t_flatcode` VALUES ('3615', 'DM_BZKZY', '高等学校本、专科专业代码', '100310', null, '听力学');
INSERT INTO `t_flatcode` VALUES ('3616', 'DM_BZKZY', '高等学校本、专科专业代码', '100400', null, '口腔医学类');
INSERT INTO `t_flatcode` VALUES ('3617', 'DM_BZKZY', '高等学校本、专科专业代码', '100401', null, '口腔医学');
INSERT INTO `t_flatcode` VALUES ('3618', 'DM_BZKZY', '高等学校本、专科专业代码', '100500', null, '中医学类');
INSERT INTO `t_flatcode` VALUES ('3619', 'DM_BZKZY', '高等学校本、专科专业代码', '100501', null, '中医学');
INSERT INTO `t_flatcode` VALUES ('3620', 'DM_BZKZY', '高等学校本、专科专业代码', '100502', null, '针灸推拿学');
INSERT INTO `t_flatcode` VALUES ('3621', 'DM_BZKZY', '高等学校本、专科专业代码', '100503', null, '蒙医学');
INSERT INTO `t_flatcode` VALUES ('3622', 'DM_BZKZY', '高等学校本、专科专业代码', '100504', null, '藏医学');
INSERT INTO `t_flatcode` VALUES ('3623', 'DM_BZKZY', '高等学校本、专科专业代码', '100505', null, '中西医临床医学');
INSERT INTO `t_flatcode` VALUES ('3624', 'DM_BZKZY', '高等学校本、专科专业代码', '100600', null, '法医学类');
INSERT INTO `t_flatcode` VALUES ('3625', 'DM_BZKZY', '高等学校本、专科专业代码', '100601', null, '法医学');
INSERT INTO `t_flatcode` VALUES ('3626', 'DM_BZKZY', '高等学校本、专科专业代码', '100700', null, '护理学类');
INSERT INTO `t_flatcode` VALUES ('3627', 'DM_BZKZY', '高等学校本、专科专业代码', '100701', null, '护理学');
INSERT INTO `t_flatcode` VALUES ('3628', 'DM_BZKZY', '高等学校本、专科专业代码', '100800', null, '药学类');
INSERT INTO `t_flatcode` VALUES ('3629', 'DM_BZKZY', '高等学校本、专科专业代码', '100801', null, '药学');
INSERT INTO `t_flatcode` VALUES ('3630', 'DM_BZKZY', '高等学校本、专科专业代码', '100802', null, '中药学');
INSERT INTO `t_flatcode` VALUES ('3631', 'DM_BZKZY', '高等学校本、专科专业代码', '100803', null, '药物制剂');
INSERT INTO `t_flatcode` VALUES ('3632', 'DM_BZKZY', '高等学校本、专科专业代码', '100804', null, '中草药栽培与鉴定');
INSERT INTO `t_flatcode` VALUES ('3633', 'DM_BZKZY', '高等学校本、专科专业代码', '100805', null, '藏药学');
INSERT INTO `t_flatcode` VALUES ('3634', 'DM_BZKZY', '高等学校本、专科专业代码', '100806', null, '中药资源与开发');
INSERT INTO `t_flatcode` VALUES ('3635', 'DM_BZKZY', '高等学校本、专科专业代码', '030300', null, '社会学类');
INSERT INTO `t_flatcode` VALUES ('3636', 'DM_BZKZY', '高等学校本、专科专业代码', '030301', null, '社会学');
INSERT INTO `t_flatcode` VALUES ('3637', 'DM_BZKZY', '高等学校本、专科专业代码', '030302', null, '社会工作');
INSERT INTO `t_flatcode` VALUES ('3638', 'DM_BZKZY', '高等学校本、专科专业代码', '030400', null, '政治学类');
INSERT INTO `t_flatcode` VALUES ('3639', 'DM_BZKZY', '高等学校本、专科专业代码', '030401', null, '政治学与行政学');
INSERT INTO `t_flatcode` VALUES ('3640', 'DM_BZKZY', '高等学校本、专科专业代码', '030402', null, '国际政治');
INSERT INTO `t_flatcode` VALUES ('3641', 'DM_BZKZY', '高等学校本、专科专业代码', '030403', null, '外交学');
INSERT INTO `t_flatcode` VALUES ('3642', 'DM_BZKZY', '高等学校本、专科专业代码', '030404', null, '思想政治教育');
INSERT INTO `t_flatcode` VALUES ('3643', 'DM_BZKZY', '高等学校本、专科专业代码', '030405', null, '国际文化交流');
INSERT INTO `t_flatcode` VALUES ('3644', 'DM_BZKZY', '高等学校本、专科专业代码', '030500', null, '公安学类');
INSERT INTO `t_flatcode` VALUES ('3645', 'DM_BZKZY', '高等学校本、专科专业代码', '030501', null, '治安学');
INSERT INTO `t_flatcode` VALUES ('3646', 'DM_BZKZY', '高等学校本、专科专业代码', '030502', null, '侦查学');
INSERT INTO `t_flatcode` VALUES ('3647', 'DM_BZKZY', '高等学校本、专科专业代码', '030503', null, '边防管理');
INSERT INTO `t_flatcode` VALUES ('3648', 'DM_BZKZY', '高等学校本、专科专业代码', '030504', null, '火灾勘查');
INSERT INTO `t_flatcode` VALUES ('3649', 'DM_BZKZY', '高等学校本、专科专业代码', '030505', null, '禁毒学');
INSERT INTO `t_flatcode` VALUES ('3650', 'DM_BZKZY', '高等学校本、专科专业代码', 'null', null, 'null');
INSERT INTO `t_flatcode` VALUES ('3651', 'DM_BZKZY', '高等学校本、专科专业代码', '040000', null, '学科门类：教育学');
INSERT INTO `t_flatcode` VALUES ('3652', 'DM_BZKZY', '高等学校本、专科专业代码', '040100', null, '教育学类');
INSERT INTO `t_flatcode` VALUES ('3653', 'DM_BZKZY', '高等学校本、专科专业代码', '040101', null, '教育学');
INSERT INTO `t_flatcode` VALUES ('3654', 'DM_BZKZY', '高等学校本、专科专业代码', '040102', null, '学前教育');
INSERT INTO `t_flatcode` VALUES ('3655', 'DM_BZKZY', '高等学校本、专科专业代码', '040103', null, '特殊教育');
INSERT INTO `t_flatcode` VALUES ('3656', 'DM_BZKZY', '高等学校本、专科专业代码', '040104', null, '教育技术学');
INSERT INTO `t_flatcode` VALUES ('3657', 'DM_BZKZY', '高等学校本、专科专业代码', '040105', null, '小学教育');
INSERT INTO `t_flatcode` VALUES ('3658', 'DM_BZKZY', '高等学校本、专科专业代码', '040106', null, '艺术教育');
INSERT INTO `t_flatcode` VALUES ('3659', 'DM_BZKZY', '高等学校本、专科专业代码', '040107', null, '人文教育');
INSERT INTO `t_flatcode` VALUES ('3660', 'DM_BZKZY', '高等学校本、专科专业代码', '040108', null, '科学教育');
INSERT INTO `t_flatcode` VALUES ('3661', 'DM_BZKZY', '高等学校本、专科专业代码', '040200', null, '体育学类');
INSERT INTO `t_flatcode` VALUES ('3662', 'DM_BZKZY', '高等学校本、专科专业代码', '040201', null, '体育教育');
INSERT INTO `t_flatcode` VALUES ('3663', 'DM_BZKZY', '高等学校本、专科专业代码', '040202', null, '运动训练');
INSERT INTO `t_flatcode` VALUES ('3664', 'DM_BZKZY', '高等学校本、专科专业代码', '040203', null, '社会体育');
INSERT INTO `t_flatcode` VALUES ('3665', 'DM_BZKZY', '高等学校本、专科专业代码', '040204', null, '运动人体科学');
INSERT INTO `t_flatcode` VALUES ('3666', 'DM_BZKZY', '高等学校本、专科专业代码', '040335', null, '文秘教育');
INSERT INTO `t_flatcode` VALUES ('3667', 'DM_BZKZY', '高等学校本、专科专业代码', '040336', null, '市场营销教育');
INSERT INTO `t_flatcode` VALUES ('3668', 'DM_BZKZY', '高等学校本、专科专业代码', '040337', null, '职业技术教育管理');
INSERT INTO `t_flatcode` VALUES ('3669', 'DM_BZKZY', '高等学校本、专科专业代码', '050000', null, '学科门类：文学');
INSERT INTO `t_flatcode` VALUES ('3670', 'DM_BZKZY', '高等学校本、专科专业代码', '050100', null, '中国语言文学类');
INSERT INTO `t_flatcode` VALUES ('3671', 'DM_BZKZY', '高等学校本、专科专业代码', '050101', null, '汉语言文学');
INSERT INTO `t_flatcode` VALUES ('3672', 'DM_BZKZY', '高等学校本、专科专业代码', '050102', null, '汉语言');
INSERT INTO `t_flatcode` VALUES ('3673', 'DM_BZKZY', '高等学校本、专科专业代码', '050103', null, '对外汉语');
INSERT INTO `t_flatcode` VALUES ('3674', 'DM_BZKZY', '高等学校本、专科专业代码', '050104', null, '中国少数民族语言文学');
INSERT INTO `t_flatcode` VALUES ('3675', 'DM_BZKZY', '高等学校本、专科专业代码', '050105', null, '古典文献');
INSERT INTO `t_flatcode` VALUES ('3676', 'DM_BZKZY', '高等学校本、专科专业代码', '050106', null, '中国语言文化');
INSERT INTO `t_flatcode` VALUES ('3677', 'DM_BZKZY', '高等学校本、专科专业代码', '050107', null, '应用语言学');
INSERT INTO `t_flatcode` VALUES ('3678', 'DM_BZKZY', '高等学校本、专科专业代码', '050200', null, '外国语言文学类');
INSERT INTO `t_flatcode` VALUES ('3679', 'DM_BZKZY', '高等学校本、专科专业代码', '050201', null, '英语');
INSERT INTO `t_flatcode` VALUES ('3680', 'DM_BZKZY', '高等学校本、专科专业代码', '050202', null, '俄语');
INSERT INTO `t_flatcode` VALUES ('3681', 'DM_BZKZY', '高等学校本、专科专业代码', '050203', null, '德语');
INSERT INTO `t_flatcode` VALUES ('3682', 'DM_BZKZY', '高等学校本、专科专业代码', '050204', null, '法语');
INSERT INTO `t_flatcode` VALUES ('3683', 'DM_BZKZY', '高等学校本、专科专业代码', '050205', null, '西班牙语');
INSERT INTO `t_flatcode` VALUES ('3684', 'DM_BZKZY', '高等学校本、专科专业代码', '050206', null, '阿拉伯语');
INSERT INTO `t_flatcode` VALUES ('3685', 'DM_BZKZY', '高等学校本、专科专业代码', '050207', null, '日语');
INSERT INTO `t_flatcode` VALUES ('3686', 'DM_BZKZY', '高等学校本、专科专业代码', '050208', null, '波斯语');
INSERT INTO `t_flatcode` VALUES ('3687', 'DM_BZKZY', '高等学校本、专科专业代码', '050209', null, '朝鲜语');
INSERT INTO `t_flatcode` VALUES ('3688', 'DM_BZKZY', '高等学校本、专科专业代码', '050210', null, '菲律宾语');
INSERT INTO `t_flatcode` VALUES ('3689', 'DM_BZKZY', '高等学校本、专科专业代码', '050211', null, '梵语巴利语');
INSERT INTO `t_flatcode` VALUES ('3690', 'DM_BZKZY', '高等学校本、专科专业代码', '050212', null, '印度尼西亚语');
INSERT INTO `t_flatcode` VALUES ('3691', 'DM_BZKZY', '高等学校本、专科专业代码', '050213', null, '印地语');
INSERT INTO `t_flatcode` VALUES ('3692', 'DM_BZKZY', '高等学校本、专科专业代码', '050214', null, '柬埔寨语');
INSERT INTO `t_flatcode` VALUES ('3693', 'DM_BZKZY', '高等学校本、专科专业代码', '050215', null, '老挝语');
INSERT INTO `t_flatcode` VALUES ('3694', 'DM_BZKZY', '高等学校本、专科专业代码', '050216', null, '缅甸语');
INSERT INTO `t_flatcode` VALUES ('3695', 'DM_BZKZY', '高等学校本、专科专业代码', '050217', null, '马来语');
INSERT INTO `t_flatcode` VALUES ('3696', 'DM_BZKZY', '高等学校本、专科专业代码', '050218', null, '蒙古语');
INSERT INTO `t_flatcode` VALUES ('3697', 'DM_BZKZY', '高等学校本、专科专业代码', '050219', null, '僧加罗语');
INSERT INTO `t_flatcode` VALUES ('3698', 'DM_BZKZY', '高等学校本、专科专业代码', '050220', null, '泰语');
INSERT INTO `t_flatcode` VALUES ('3699', 'DM_BZKZY', '高等学校本、专科专业代码', '050221', null, '乌尔都语');
INSERT INTO `t_flatcode` VALUES ('3700', 'DM_BZKZY', '高等学校本、专科专业代码', '050222', null, '希伯莱语');
INSERT INTO `t_flatcode` VALUES ('3701', 'DM_BZKZY', '高等学校本、专科专业代码', '050406', null, '美术学');
INSERT INTO `t_flatcode` VALUES ('3702', 'DM_BZKZY', '高等学校本、专科专业代码', '050407', null, '艺术设计学');
INSERT INTO `t_flatcode` VALUES ('3703', 'DM_BZKZY', '高等学校本、专科专业代码', '050408', null, '艺术设计');
INSERT INTO `t_flatcode` VALUES ('3704', 'DM_BZKZY', '高等学校本、专科专业代码', '050409', null, '舞蹈学');
INSERT INTO `t_flatcode` VALUES ('3705', 'DM_BZKZY', '高等学校本、专科专业代码', '050410', null, '舞蹈编导');
INSERT INTO `t_flatcode` VALUES ('3706', 'DM_BZKZY', '高等学校本、专科专业代码', '050411', null, '戏剧学');
INSERT INTO `t_flatcode` VALUES ('3707', 'DM_BZKZY', '高等学校本、专科专业代码', '050412', null, '表演');
INSERT INTO `t_flatcode` VALUES ('3708', 'DM_BZKZY', '高等学校本、专科专业代码', '050413', null, '导演');
INSERT INTO `t_flatcode` VALUES ('3709', 'DM_BZKZY', '高等学校本、专科专业代码', '050414', null, '戏剧影视文学');
INSERT INTO `t_flatcode` VALUES ('3710', 'DM_BZKZY', '高等学校本、专科专业代码', '050415', null, '戏剧影视美术设计');
INSERT INTO `t_flatcode` VALUES ('3711', 'DM_BZKZY', '高等学校本、专科专业代码', '050416', null, '摄影');
INSERT INTO `t_flatcode` VALUES ('3712', 'DM_BZKZY', '高等学校本、专科专业代码', '050417', null, '录音艺术');
INSERT INTO `t_flatcode` VALUES ('3713', 'DM_BZKZY', '高等学校本、专科专业代码', '050418', null, '动画');
INSERT INTO `t_flatcode` VALUES ('3714', 'DM_BZKZY', '高等学校本、专科专业代码', '050419', null, '播音与主持艺术');
INSERT INTO `t_flatcode` VALUES ('3715', 'DM_BZKZY', '高等学校本、专科专业代码', '050420', null, '广播电视编导');
INSERT INTO `t_flatcode` VALUES ('3716', 'DM_BZKZY', '高等学校本、专科专业代码', '050421', null, '影视教育');
INSERT INTO `t_flatcode` VALUES ('3717', 'DM_BZKZY', '高等学校本、专科专业代码', '050422', null, '艺术学');
INSERT INTO `t_flatcode` VALUES ('3718', 'DM_BZKZY', '高等学校本、专科专业代码', '060000', null, '学科门类：历史学');
INSERT INTO `t_flatcode` VALUES ('3719', 'DM_BZKZY', '高等学校本、专科专业代码', '060100', null, '历史学类');
INSERT INTO `t_flatcode` VALUES ('3720', 'DM_BZKZY', '高等学校本、专科专业代码', '060101', null, '历史学');
INSERT INTO `t_flatcode` VALUES ('3721', 'DM_BZKZY', '高等学校本、专科专业代码', '060102', null, '世界历史');
INSERT INTO `t_flatcode` VALUES ('3722', 'DM_BZKZY', '高等学校本、专科专业代码', '060103', null, '考古学');
INSERT INTO `t_flatcode` VALUES ('3723', 'DM_BZKZY', '高等学校本、专科专业代码', '060104', null, '博物馆学');
INSERT INTO `t_flatcode` VALUES ('3724', 'DM_BZKZY', '高等学校本、专科专业代码', '060105', null, '民族学');
INSERT INTO `t_flatcode` VALUES ('3725', 'DM_BZKZY', '高等学校本、专科专业代码', '060106', null, '文物保护技术');
INSERT INTO `t_flatcode` VALUES ('3726', 'DM_BZKZY', '高等学校本、专科专业代码', '070000', null, '学科门类：理学');
INSERT INTO `t_flatcode` VALUES ('3727', 'DM_BZKZY', '高等学校本、专科专业代码', '070100', null, '数学类');
INSERT INTO `t_flatcode` VALUES ('3728', 'DM_BZKZY', '高等学校本、专科专业代码', '070101', null, '数学与应用数学');
INSERT INTO `t_flatcode` VALUES ('3729', 'DM_BZKZY', '高等学校本、专科专业代码', '070102', null, '信息与计算科学');
INSERT INTO `t_flatcode` VALUES ('3730', 'DM_BZKZY', '高等学校本、专科专业代码', '070200', null, '物理学类');
INSERT INTO `t_flatcode` VALUES ('3731', 'DM_BZKZY', '高等学校本、专科专业代码', '070201', null, '物理学');
INSERT INTO `t_flatcode` VALUES ('3732', 'DM_BZKZY', '高等学校本、专科专业代码', '070202', null, '应用物理学');
INSERT INTO `t_flatcode` VALUES ('3733', 'DM_BZKZY', '高等学校本、专科专业代码', '070203', null, '声学');
INSERT INTO `t_flatcode` VALUES ('3734', 'DM_BZKZY', '高等学校本、专科专业代码', '070300', null, '化学类');
INSERT INTO `t_flatcode` VALUES ('3735', 'DM_BZKZY', '高等学校本、专科专业代码', '071301', null, '材料物理');
INSERT INTO `t_flatcode` VALUES ('3736', 'DM_BZKZY', '高等学校本、专科专业代码', '071302', null, '材料化学');
INSERT INTO `t_flatcode` VALUES ('3737', 'DM_BZKZY', '高等学校本、专科专业代码', '071400', null, '环境科学类');
INSERT INTO `t_flatcode` VALUES ('3738', 'DM_BZKZY', '高等学校本、专科专业代码', '071401', null, '环境科学');
INSERT INTO `t_flatcode` VALUES ('3739', 'DM_BZKZY', '高等学校本、专科专业代码', '071402', null, '生态学');
INSERT INTO `t_flatcode` VALUES ('3740', 'DM_BZKZY', '高等学校本、专科专业代码', '071500', null, '心理学类');
INSERT INTO `t_flatcode` VALUES ('3741', 'DM_BZKZY', '高等学校本、专科专业代码', '071501', null, '心理学');
INSERT INTO `t_flatcode` VALUES ('3742', 'DM_BZKZY', '高等学校本、专科专业代码', '071502', null, '应用心理学');
INSERT INTO `t_flatcode` VALUES ('3743', 'DM_BZKZY', '高等学校本、专科专业代码', '071600', null, '统计学类');
INSERT INTO `t_flatcode` VALUES ('3744', 'DM_BZKZY', '高等学校本、专科专业代码', '071601', null, '统计学');
INSERT INTO `t_flatcode` VALUES ('3745', 'DM_BZKZY', '高等学校本、专科专业代码', '071700', null, '系统理论类');
INSERT INTO `t_flatcode` VALUES ('3746', 'DM_BZKZY', '高等学校本、专科专业代码', '071701', null, '系统理论');
INSERT INTO `t_flatcode` VALUES ('3747', 'DM_BZKZY', '高等学校本、专科专业代码', '080000', null, '学科门类：工学');
INSERT INTO `t_flatcode` VALUES ('3748', 'DM_BZKZY', '高等学校本、专科专业代码', '080100', null, '地矿类');
INSERT INTO `t_flatcode` VALUES ('3749', 'DM_BZKZY', '高等学校本、专科专业代码', '080101', null, '采矿工程');
INSERT INTO `t_flatcode` VALUES ('3750', 'DM_BZKZY', '高等学校本、专科专业代码', '080102', null, '石油工程');
INSERT INTO `t_flatcode` VALUES ('3751', 'DM_BZKZY', '高等学校本、专科专业代码', '080103', null, '矿物加工工程');
INSERT INTO `t_flatcode` VALUES ('3752', 'DM_BZKZY', '高等学校本、专科专业代码', '080104', null, '勘查技术与工程');
INSERT INTO `t_flatcode` VALUES ('3753', 'DM_BZKZY', '高等学校本、专科专业代码', '080105', null, '资源勘查工程');
INSERT INTO `t_flatcode` VALUES ('3754', 'DM_BZKZY', '高等学校本、专科专业代码', '080106', null, '地质工程');
INSERT INTO `t_flatcode` VALUES ('3755', 'DM_BZKZY', '高等学校本、专科专业代码', '080107', null, '矿物资源工程');
INSERT INTO `t_flatcode` VALUES ('3756', 'DM_BZKZY', '高等学校本、专科专业代码', '080200', null, '材料类');
INSERT INTO `t_flatcode` VALUES ('3757', 'DM_BZKZY', '高等学校本、专科专业代码', '080201', null, '冶金工程');
INSERT INTO `t_flatcode` VALUES ('3758', 'DM_BZKZY', '高等学校本、专科专业代码', '080202', null, '金属材料工程');
INSERT INTO `t_flatcode` VALUES ('3759', 'DM_BZKZY', '高等学校本、专科专业代码', '080203', null, '无机非金属材料工程');
INSERT INTO `t_flatcode` VALUES ('3760', 'DM_BZKZY', '高等学校本、专科专业代码', '080204', null, '高分子材料与工程');
INSERT INTO `t_flatcode` VALUES ('3761', 'DM_BZKZY', '高等学校本、专科专业代码', '080205', null, '材料科学与工程');
INSERT INTO `t_flatcode` VALUES ('3762', 'DM_BZKZY', '高等学校本、专科专业代码', '080206', null, '复合材料与工程');
INSERT INTO `t_flatcode` VALUES ('3763', 'DM_BZKZY', '高等学校本、专科专业代码', '080207', null, '焊接技术与工程');
INSERT INTO `t_flatcode` VALUES ('3764', 'DM_BZKZY', '高等学校本、专科专业代码', '080208', null, '宝石及材料工艺学');
INSERT INTO `t_flatcode` VALUES ('3765', 'DM_BZKZY', '高等学校本、专科专业代码', '080209', null, '粉体材料科学与工程');
INSERT INTO `t_flatcode` VALUES ('3766', 'DM_BZKZY', '高等学校本、专科专业代码', '080210', null, '再生资源科学与技术');
INSERT INTO `t_flatcode` VALUES ('3767', 'DM_BZKZY', '高等学校本、专科专业代码', '080211', null, '稀土工程');
INSERT INTO `t_flatcode` VALUES ('3768', 'DM_BZKZY', '高等学校本、专科专业代码', '080300', null, '机械类');
INSERT INTO `t_flatcode` VALUES ('3769', 'DM_BZKZY', '高等学校本、专科专业代码', '080301', null, '机械设计制造及其自动化');
INSERT INTO `t_flatcode` VALUES ('3770', 'DM_BZKZY', '高等学校本、专科专业代码', '080703', null, '土木工程');
INSERT INTO `t_flatcode` VALUES ('3771', 'DM_BZKZY', '高等学校本、专科专业代码', '080703', null, '土木工程');
INSERT INTO `t_flatcode` VALUES ('3772', 'DM_BZKZY', '高等学校本、专科专业代码', '080704', null, '建筑环境与设备工程');
INSERT INTO `t_flatcode` VALUES ('3773', 'DM_BZKZY', '高等学校本、专科专业代码', '080705', null, '给水排水工程');
INSERT INTO `t_flatcode` VALUES ('3774', 'DM_BZKZY', '高等学校本、专科专业代码', '080706', null, '城市地下空间工程');
INSERT INTO `t_flatcode` VALUES ('3775', 'DM_BZKZY', '高等学校本、专科专业代码', '080724', null, '道路桥梁与渡河工程');
INSERT INTO `t_flatcode` VALUES ('3776', 'DM_BZKZY', '高等学校本、专科专业代码', '080800', null, '水利类');
INSERT INTO `t_flatcode` VALUES ('3777', 'DM_BZKZY', '高等学校本、专科专业代码', '080801', null, '水利水电工程');
INSERT INTO `t_flatcode` VALUES ('3778', 'DM_BZKZY', '高等学校本、专科专业代码', '080802', null, '水文与水资源工程');
INSERT INTO `t_flatcode` VALUES ('3779', 'DM_BZKZY', '高等学校本、专科专业代码', '080803', null, '港口航道与海岸工程');
INSERT INTO `t_flatcode` VALUES ('3780', 'DM_BZKZY', '高等学校本、专科专业代码', '080804', null, '港口海岸及治河工程');
INSERT INTO `t_flatcode` VALUES ('3781', 'DM_BZKZY', '高等学校本、专科专业代码', '080900', null, '测绘类');
INSERT INTO `t_flatcode` VALUES ('3782', 'DM_BZKZY', '高等学校本、专科专业代码', '080901', null, '测绘工程');
INSERT INTO `t_flatcode` VALUES ('3783', 'DM_BZKZY', '高等学校本、专科专业代码', '080902', null, '遥感科学与技术');
INSERT INTO `t_flatcode` VALUES ('3784', 'DM_BZKZY', '高等学校本、专科专业代码', '081000', null, '环境与安全类');
INSERT INTO `t_flatcode` VALUES ('3785', 'DM_BZKZY', '高等学校本、专科专业代码', '081001', null, '环境工程');
INSERT INTO `t_flatcode` VALUES ('3786', 'DM_BZKZY', '高等学校本、专科专业代码', '081002', null, '安全工程');
INSERT INTO `t_flatcode` VALUES ('3787', 'DM_BZKZY', '高等学校本、专科专业代码', '081100', null, '化工与制药类');
INSERT INTO `t_flatcode` VALUES ('3788', 'DM_BZKZY', '高等学校本、专科专业代码', '081101', null, '化学工程与工艺');
INSERT INTO `t_flatcode` VALUES ('3789', 'DM_BZKZY', '高等学校本、专科专业代码', '081102', null, '制药工程');
INSERT INTO `t_flatcode` VALUES ('3790', 'DM_BZKZY', '高等学校本、专科专业代码', '081103', null, '化工与制药');
INSERT INTO `t_flatcode` VALUES ('3791', 'DM_BZKZY', '高等学校本、专科专业代码', '081200', null, '交通运输类');
INSERT INTO `t_flatcode` VALUES ('3792', 'DM_BZKZY', '高等学校本、专科专业代码', '081201', null, '交通运输');
INSERT INTO `t_flatcode` VALUES ('3793', 'DM_BZKZY', '高等学校本、专科专业代码', '081202', null, '交通工程');
INSERT INTO `t_flatcode` VALUES ('3794', 'DM_BZKZY', '高等学校本、专科专业代码', '081203', null, '油气储运工程');
INSERT INTO `t_flatcode` VALUES ('3795', 'DM_BZKZY', '高等学校本、专科专业代码', '081204', null, '飞行技术');
INSERT INTO `t_flatcode` VALUES ('3796', 'DM_BZKZY', '高等学校本、专科专业代码', '081205', null, '航海技术');
INSERT INTO `t_flatcode` VALUES ('3797', 'DM_BZKZY', '高等学校本、专科专业代码', '081206', null, '轮机工程');
INSERT INTO `t_flatcode` VALUES ('3798', 'DM_BZKZY', '高等学校本、专科专业代码', '081207', null, '物流工程');
INSERT INTO `t_flatcode` VALUES ('3799', 'DM_BZKZY', '高等学校本、专科专业代码', '081208', null, '海事管理');
INSERT INTO `t_flatcode` VALUES ('3800', 'DM_BZKZY', '高等学校本、专科专业代码', '081300', null, '海洋工程类');
INSERT INTO `t_flatcode` VALUES ('3801', 'DM_BZKZY', '高等学校本、专科专业代码', '081301', null, '船舶与海洋工程');
INSERT INTO `t_flatcode` VALUES ('3802', 'DM_BZKZY', '高等学校本、专科专业代码', '081400', null, '轻工纺织食品类');
INSERT INTO `t_flatcode` VALUES ('3803', 'DM_BZKZY', '高等学校本、专科专业代码', '081401', null, '食品科学与工程');
INSERT INTO `t_flatcode` VALUES ('3804', 'DM_BZKZY', '高等学校本、专科专业代码', '081402', null, '轻化工程');
INSERT INTO `t_flatcode` VALUES ('3805', 'DM_BZKZY', '高等学校本、专科专业代码', '081403', null, '包装工程');
INSERT INTO `t_flatcode` VALUES ('3806', 'DM_BZKZY', '高等学校本、专科专业代码', '082102', null, '消防工程');
INSERT INTO `t_flatcode` VALUES ('3807', 'DM_BZKZY', '高等学校本、专科专业代码', '082103', null, '安全防范工程');
INSERT INTO `t_flatcode` VALUES ('3808', 'DM_BZKZY', '高等学校本、专科专业代码', '082104', null, '交通管理工程');
INSERT INTO `t_flatcode` VALUES ('3809', 'DM_BZKZY', '高等学校本、专科专业代码', '082105', null, '核生化消防');
INSERT INTO `t_flatcode` VALUES ('3810', 'DM_BZKZY', '高等学校本、专科专业代码', '090000', null, '学科门类：农学');
INSERT INTO `t_flatcode` VALUES ('3811', 'DM_BZKZY', '高等学校本、专科专业代码', '090100', null, '植物生产类');
INSERT INTO `t_flatcode` VALUES ('3812', 'DM_BZKZY', '高等学校本、专科专业代码', '090101', null, '农学');
INSERT INTO `t_flatcode` VALUES ('3813', 'DM_BZKZY', '高等学校本、专科专业代码', '090102', null, '园艺');
INSERT INTO `t_flatcode` VALUES ('3814', 'DM_BZKZY', '高等学校本、专科专业代码', '090103', null, '植物保护');
INSERT INTO `t_flatcode` VALUES ('3815', 'DM_BZKZY', '高等学校本、专科专业代码', '090104', null, '茶学');
INSERT INTO `t_flatcode` VALUES ('3816', 'DM_BZKZY', '高等学校本、专科专业代码', '090105', null, '烟草');
INSERT INTO `t_flatcode` VALUES ('3817', 'DM_BZKZY', '高等学校本、专科专业代码', '090106', null, '植物科学与技术');
INSERT INTO `t_flatcode` VALUES ('3818', 'DM_BZKZY', '高等学校本、专科专业代码', '090107', null, '种子科学与工程');
INSERT INTO `t_flatcode` VALUES ('3819', 'DM_BZKZY', '高等学校本、专科专业代码', '090108', null, '应用生物科学');
INSERT INTO `t_flatcode` VALUES ('3820', 'DM_BZKZY', '高等学校本、专科专业代码', '090200', null, '草业科学类');
INSERT INTO `t_flatcode` VALUES ('3821', 'DM_BZKZY', '高等学校本、专科专业代码', '090201', null, '草业科学');
INSERT INTO `t_flatcode` VALUES ('3822', 'DM_BZKZY', '高等学校本、专科专业代码', '090300', null, '森林资源类');
INSERT INTO `t_flatcode` VALUES ('3823', 'DM_BZKZY', '高等学校本、专科专业代码', '090301', null, '林学');
INSERT INTO `t_flatcode` VALUES ('3824', 'DM_BZKZY', '高等学校本、专科专业代码', '090302', null, '森林资源保护与游憩');
INSERT INTO `t_flatcode` VALUES ('3825', 'DM_BZKZY', '高等学校本、专科专业代码', '090303', null, '野生动物与自然保护区管理');
INSERT INTO `t_flatcode` VALUES ('3826', 'DM_BZKZY', '高等学校本、专科专业代码', '090400', null, '环境生态类');
INSERT INTO `t_flatcode` VALUES ('3827', 'DM_BZKZY', '高等学校本、专科专业代码', '090401', null, '园林');
INSERT INTO `t_flatcode` VALUES ('3828', 'DM_BZKZY', '高等学校本、专科专业代码', '090402', null, '水土保持与荒漠化防治');
INSERT INTO `t_flatcode` VALUES ('3829', 'DM_BZKZY', '高等学校本、专科专业代码', '090403', null, '农业资源与环境');
INSERT INTO `t_flatcode` VALUES ('3830', 'DM_BZKZY', '高等学校本、专科专业代码', '090500', null, '动物生产类');
INSERT INTO `t_flatcode` VALUES ('3831', 'DM_BZKZY', '高等学校本、专科专业代码', '090501', null, '动物科学');
INSERT INTO `t_flatcode` VALUES ('3832', 'DM_BZKZY', '高等学校本、专科专业代码', '090502', null, '蚕学');
INSERT INTO `t_flatcode` VALUES ('3833', 'DM_BZKZY', '高等学校本、专科专业代码', '090503', null, '蜂学');
INSERT INTO `t_flatcode` VALUES ('3834', 'DM_BZKZY', '高等学校本、专科专业代码', '090600', null, '动物医学类');
INSERT INTO `t_flatcode` VALUES ('3835', 'DM_BZKZY', '高等学校本、专科专业代码', '090601', null, '动物医学');
INSERT INTO `t_flatcode` VALUES ('3836', 'DM_BZKZY', '高等学校本、专科专业代码', '090700', null, '水产类');
INSERT INTO `t_flatcode` VALUES ('3837', 'DM_BZKZY', '高等学校本、专科专业代码', '090701', null, '水产养殖学');
INSERT INTO `t_flatcode` VALUES ('3838', 'DM_BZKZY', '高等学校本、专科专业代码', '090702', null, '海洋渔业科学与技术');
INSERT INTO `t_flatcode` VALUES ('3839', 'DM_BZKZY', '高等学校本、专科专业代码', '100000', null, '学科门类：医学');
INSERT INTO `t_flatcode` VALUES ('3840', 'DM_BZKZY', '高等学校本、专科专业代码', '110000', null, '学科门类：管理学');
INSERT INTO `t_flatcode` VALUES ('3841', 'DM_BZKZY', '高等学校本、专科专业代码', '110100', null, '管理科学与工程类');
INSERT INTO `t_flatcode` VALUES ('3842', 'DM_BZKZY', '高等学校本、专科专业代码', '110101', null, '管理科学');
INSERT INTO `t_flatcode` VALUES ('3843', 'DM_BZKZY', '高等学校本、专科专业代码', '110102', null, '信息管理与信息系统');
INSERT INTO `t_flatcode` VALUES ('3844', 'DM_BZKZY', '高等学校本、专科专业代码', '110103', null, '工业工程');
INSERT INTO `t_flatcode` VALUES ('3845', 'DM_BZKZY', '高等学校本、专科专业代码', '110104', null, '工程管理');
INSERT INTO `t_flatcode` VALUES ('3846', 'DM_BZKZY', '高等学校本、专科专业代码', '110200', null, '工商管理类');
INSERT INTO `t_flatcode` VALUES ('3847', 'DM_BZKZY', '高等学校本、专科专业代码', '110201', null, '工商管理');
INSERT INTO `t_flatcode` VALUES ('3848', 'DM_BZKZY', '高等学校本、专科专业代码', '110202', null, '市场营销');
INSERT INTO `t_flatcode` VALUES ('3849', 'DM_BZKZY', '高等学校本、专科专业代码', '110203', null, '会计学');
INSERT INTO `t_flatcode` VALUES ('3850', 'DM_BZKZY', '高等学校本、专科专业代码', '110204', null, '财务管理');
INSERT INTO `t_flatcode` VALUES ('3851', 'DM_BZKZY', '高等学校本、专科专业代码', '110205', null, '人力资源管理');
INSERT INTO `t_flatcode` VALUES ('3852', 'DM_BZKZY', '高等学校本、专科专业代码', '110206', null, '旅游管理');
INSERT INTO `t_flatcode` VALUES ('3853', 'DM_BZKZY', '高等学校本、专科专业代码', '110207', null, '商品学');
INSERT INTO `t_flatcode` VALUES ('3854', 'DM_BZKZY', '高等学校本、专科专业代码', '110208', null, '审计学');
INSERT INTO `t_flatcode` VALUES ('3855', 'DM_BZKZY', '高等学校本、专科专业代码', '110209', null, '电子商务');
INSERT INTO `t_flatcode` VALUES ('3856', 'DM_BZKZY', '高等学校本、专科专业代码', '110210', null, '物流管理');
INSERT INTO `t_flatcode` VALUES ('3857', 'DM_BZKZY', '高等学校本、专科专业代码', '110300', null, '公共管理类');
INSERT INTO `t_flatcode` VALUES ('3858', 'DM_BZKZY', '高等学校本、专科专业代码', '110301', null, '行政管理');
INSERT INTO `t_flatcode` VALUES ('3859', 'DM_BZKZY', '高等学校本、专科专业代码', '110302', null, '公共事业管理');
INSERT INTO `t_flatcode` VALUES ('3860', 'DM_BZKZY', '高等学校本、专科专业代码', '110303', null, '劳动与社会保障');
INSERT INTO `t_flatcode` VALUES ('3861', 'DM_BZKZY', '高等学校本、专科专业代码', '110304', null, '土地资源管理');
INSERT INTO `t_flatcode` VALUES ('3862', 'DM_BZKZY', '高等学校本、专科专业代码', '110305', null, '公共关系学');
INSERT INTO `t_flatcode` VALUES ('3863', 'DM_BZKZY', '高等学校本、专科专业代码', '110306', null, '高等教育管理');
INSERT INTO `t_flatcode` VALUES ('3864', 'DM_BZKZY', '高等学校本、专科专业代码', '110307', null, '公共政策学');
INSERT INTO `t_flatcode` VALUES ('3865', 'DM_BZKZY', '高等学校本、专科专业代码', '110308', null, '城市管理');
INSERT INTO `t_flatcode` VALUES ('3866', 'DM_BZKZY', '高等学校本、专科专业代码', '110309', null, '公共管理');
INSERT INTO `t_flatcode` VALUES ('3867', 'DM_BZKZY', '高等学校本、专科专业代码', '110400', null, '农业经济管理类');
INSERT INTO `t_flatcode` VALUES ('3868', 'DM_BZKZY', '高等学校本、专科专业代码', '110401', null, '农林经济管理');
INSERT INTO `t_flatcode` VALUES ('3869', 'DM_BZKZY', '高等学校本、专科专业代码', '110402', null, '农村区域发展');
INSERT INTO `t_flatcode` VALUES ('3870', 'DM_BZKZY', '高等学校本、专科专业代码', '110500', null, '图书档案学类');
INSERT INTO `t_flatcode` VALUES ('3871', 'DM_BZKZY', '高等学校本、专科专业代码', '110501', null, '图书馆学');
INSERT INTO `t_flatcode` VALUES ('3872', 'DM_BZKZY', '高等学校本、专科专业代码', '110502', null, '档案学');

-- ----------------------------
-- Table structure for `t_live`
-- ----------------------------
DROP TABLE IF EXISTS `t_live`;
CREATE TABLE `t_live` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `liveName` varchar(255) DEFAULT NULL,
  `onlineNumber` int(11) DEFAULT NULL,
  `serviceIp` varchar(255) DEFAULT NULL,
  `servicePort` varchar(255) DEFAULT NULL,
  `streamName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_live
-- ----------------------------

-- ----------------------------
-- Table structure for `t_major`
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bxxf` int(11) DEFAULT NULL,
  `bzkzym` varchar(255) DEFAULT NULL,
  `collegeDepartmentId` bigint(20) DEFAULT NULL,
  `jlny` varchar(255) DEFAULT NULL,
  `rxny` varchar(255) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `xxxf` int(11) DEFAULT NULL,
  `yjszym` varchar(255) DEFAULT NULL,
  `zxf` int(11) DEFAULT NULL,
  `zyh` varchar(255) DEFAULT NULL,
  `zyjc` varchar(255) DEFAULT NULL,
  `zymc` varchar(255) DEFAULT NULL,
  `zyywmc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_major
-- ----------------------------

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gh3ryfwlwfbulr0tf6nv7lffq` (`pid`),
  CONSTRAINT `FK_gh3ryfwlwfbulr0tf6nv7lffq` FOREIGN KEY (`pid`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', null, null, '', null, null, 'eims', '教育信息管理系统', '0', '学校管理', '学校管理', null, null, null);
INSERT INTO `t_menu` VALUES ('2', 'school.Schools', null, '', null, null, 'eims', '教育信息管理系统', '0', '学校基本信息管理', '学校基本信息管理', null, 'School', '1');
INSERT INTO `t_menu` VALUES ('3', 'school.Schools', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.Schools.update', 'School', '2');
INSERT INTO `t_menu` VALUES ('4', 'school.Schools', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.Schools.delete', 'School', '2');
INSERT INTO `t_menu` VALUES ('5', 'school.Schools', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.Schools.save', 'School', '2');
INSERT INTO `t_menu` VALUES ('6', 'school.Schools', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.Schools.search', 'School', '2');
INSERT INTO `t_menu` VALUES ('7', 'school.Schools', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.Schools.show', 'School', '2');
INSERT INTO `t_menu` VALUES ('8', 'school.Schools', null, null, 'getSchoolI', 'getSchoolI', 'eims', '教育信息管理系统', null, null, null, 'school.Schools.getSchoolI', 'School', '2');
INSERT INTO `t_menu` VALUES ('9', 'school.Schools', null, null, 'getSchoolList', '获取学校列表', 'eims', '教育信息管理系统', null, '获取学校列表', '获取学校列表', 'school.Schools.getSchoolList', 'School', '2');
INSERT INTO `t_menu` VALUES ('10', 'school.Schools', null, null, 'setSchoolI', 'setSchoolI', 'eims', '教育信息管理系统', null, null, null, 'school.Schools.setSchoolI', 'School', '2');
INSERT INTO `t_menu` VALUES ('11', 'school.CollegeDepartments', null, '', null, null, 'eims', '教育信息管理系统', '1', '院系设置', '院系设置', null, 'CollegeDepartment', '1');
INSERT INTO `t_menu` VALUES ('12', 'school.CollegeDepartments', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.CollegeDepartments.update', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('13', 'school.CollegeDepartments', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.CollegeDepartments.delete', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('14', 'school.CollegeDepartments', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.CollegeDepartments.save', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('15', 'school.CollegeDepartments', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.CollegeDepartments.search', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('16', 'school.CollegeDepartments', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.CollegeDepartments.show', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('17', 'school.CollegeDepartments', null, null, 'getCollegeDepartmentI', 'getCollegeDepartmentI', 'eims', '教育信息管理系统', null, null, null, 'school.CollegeDepartments.getCollegeDepartmentI', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('18', 'school.CollegeDepartments', null, null, 'setCollegeDepartmentI', 'setCollegeDepartmentI', 'eims', '教育信息管理系统', null, null, null, 'school.CollegeDepartments.setCollegeDepartmentI', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('19', 'school.CollegeDepartments', null, null, 'getCollegeDepartmentList', '获取院系列表', 'eims', '教育信息管理系统', null, '获取院系列表', '获取院系列表', 'school.CollegeDepartments.getCollegeDepartmentList', 'CollegeDepartment', '11');
INSERT INTO `t_menu` VALUES ('20', 'school.Departments', null, '', null, null, 'eims', '教育信息管理系统', '2', '科室设置', '科室设置', null, 'Department', '1');
INSERT INTO `t_menu` VALUES ('21', 'school.Departments', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.Departments.update', 'Department', '20');
INSERT INTO `t_menu` VALUES ('22', 'school.Departments', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.Departments.delete', 'Department', '20');
INSERT INTO `t_menu` VALUES ('23', 'school.Departments', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.Departments.save', 'Department', '20');
INSERT INTO `t_menu` VALUES ('24', 'school.Departments', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.Departments.search', 'Department', '20');
INSERT INTO `t_menu` VALUES ('25', 'school.Departments', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.Departments.show', 'Department', '20');
INSERT INTO `t_menu` VALUES ('26', 'school.Departments', null, null, 'getDepartmentI', 'getDepartmentI', 'eims', '教育信息管理系统', null, null, null, 'school.Departments.getDepartmentI', 'Department', '20');
INSERT INTO `t_menu` VALUES ('27', 'school.Departments', null, null, 'getDpartmentList', '获取科室列表', 'eims', '教育信息管理系统', null, '获取科室列表', '获取科室列表', 'school.Departments.getDpartmentList', 'Department', '20');
INSERT INTO `t_menu` VALUES ('28', 'school.Departments', null, null, 'setDepartmentI', 'setDepartmentI', 'eims', '教育信息管理系统', null, null, null, 'school.Departments.setDepartmentI', 'Department', '20');
INSERT INTO `t_menu` VALUES ('29', 'school.Majors', null, '', null, null, 'eims', '教育信息管理系统', '3', '专业设置', '专业设置', null, 'Major', '1');
INSERT INTO `t_menu` VALUES ('30', 'school.Majors', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.Majors.update', 'Major', '29');
INSERT INTO `t_menu` VALUES ('31', 'school.Majors', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.Majors.delete', 'Major', '29');
INSERT INTO `t_menu` VALUES ('32', 'school.Majors', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.Majors.save', 'Major', '29');
INSERT INTO `t_menu` VALUES ('33', 'school.Majors', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.Majors.search', 'Major', '29');
INSERT INTO `t_menu` VALUES ('34', 'school.Majors', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.Majors.show', 'Major', '29');
INSERT INTO `t_menu` VALUES ('35', 'school.Majors', null, null, 'setMajorI', 'setMajorI', 'eims', '教育信息管理系统', null, null, null, 'school.Majors.setMajorI', 'Major', '29');
INSERT INTO `t_menu` VALUES ('36', 'school.Majors', null, null, 'getMajorList', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.Majors.getMajorList', 'Major', '29');
INSERT INTO `t_menu` VALUES ('37', 'school.Majors', null, null, 'getMajorI', 'getMajorI', 'eims', '教育信息管理系统', null, null, null, 'school.Majors.getMajorI', 'Major', '29');
INSERT INTO `t_menu` VALUES ('38', 'school.Curriculums', null, '', null, null, 'eims', '教育信息管理系统', '4', '课程设置', '课程设置', null, 'Curriculum', '1');
INSERT INTO `t_menu` VALUES ('39', 'school.Curriculums', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.Curriculums.update', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('40', 'school.Curriculums', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.Curriculums.delete', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('41', 'school.Curriculums', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.Curriculums.save', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('42', 'school.Curriculums', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.Curriculums.search', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('43', 'school.Curriculums', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.Curriculums.show', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('44', 'school.Curriculums', null, null, 'export', '导出excel', 'eims', '教育信息管理系统', null, '导出excel', '导出excel', 'school.Curriculums.export', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('45', 'school.Curriculums', null, null, 'getCurriculumList', '获取课程列表', 'eims', '教育信息管理系统', null, '获取课程列表', '获取课程列表', 'school.Curriculums.getCurriculumList', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('46', 'school.Curriculums', null, null, 'importExcel', '导入excel', 'eims', '教育信息管理系统', null, '导入excel', '导入excel', 'school.Curriculums.importExcel', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('47', 'school.Curriculums', null, null, 'downloadTemplate', '下载excel导入模板', 'eims', '教育信息管理系统', null, '下载excel导入模板', '下载excel导入模板', 'school.Curriculums.downloadTemplate', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('48', 'school.Curriculums', null, null, 'getCurriculumI', 'getCurriculumI', 'eims', '教育信息管理系统', null, null, null, 'school.Curriculums.getCurriculumI', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('49', 'school.Curriculums', null, null, 'viewList', '查看课程列表', 'eims', '教育信息管理系统', null, '查看课程列表', '查看课程列表', 'school.Curriculums.viewList', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('50', 'school.Curriculums', null, null, 'setCurriculumI', 'setCurriculumI', 'eims', '教育信息管理系统', null, null, null, 'school.Curriculums.setCurriculumI', 'Curriculum', '38');
INSERT INTO `t_menu` VALUES ('51', 'school.CurriculumResourceses', null, '', null, null, 'eims', '教育信息管理系统', '5', '课程资源管理', '课程资源管理', null, 'CurriculumResources', '1');
INSERT INTO `t_menu` VALUES ('52', 'school.CurriculumResourceses', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.CurriculumResourceses.update', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('53', 'school.CurriculumResourceses', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.CurriculumResourceses.delete', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('54', 'school.CurriculumResourceses', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.CurriculumResourceses.save', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('55', 'school.CurriculumResourceses', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.CurriculumResourceses.search', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('56', 'school.CurriculumResourceses', null, null, 'getChildren', 'getChildren', 'eims', '教育信息管理系统', null, null, null, 'school.CurriculumResourceses.getChildren', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('57', 'school.CurriculumResourceses', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.CurriculumResourceses.show', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('58', 'school.CurriculumResourceses', null, null, 'getCurrculumChapter', '查看课程目录', 'eims', '教育信息管理系统', null, '查看课程目录', '查看课程目录', 'school.CurriculumResourceses.getCurrculumChapter', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('59', 'school.CurriculumResourceses', null, null, 'getVideoUrl', '视频点播', 'eims', '教育信息管理系统', null, '视频点播', '视频点播', 'school.CurriculumResourceses.getVideoUrl', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('60', 'school.CurriculumResourceses', null, null, 'getChapterTree', '查看目录树', 'eims', '教育信息管理系统', null, '查看目录树', '查看目录树', 'school.CurriculumResourceses.getChapterTree', 'CurriculumResources', '51');
INSERT INTO `t_menu` VALUES ('61', 'school.Comments', null, '', null, null, 'eims', '教育信息管理系统', '6', '课程评论', '课程评论', null, 'Comment', '1');
INSERT INTO `t_menu` VALUES ('62', 'school.Comments', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'school.Comments.update', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('63', 'school.Comments', null, null, 'find', '后台评论查询', 'eims', '教育信息管理系统', null, '后台评论查询', '后台评论查询', 'school.Comments.find', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('64', 'school.Comments', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'school.Comments.delete', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('65', 'school.Comments', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'school.Comments.save', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('66', 'school.Comments', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'school.Comments.search', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('67', 'school.Comments', null, null, 'getComment', '查看评论', 'eims', '教育信息管理系统', null, '查看评论', '查看评论', 'school.Comments.getComment', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('68', 'school.Comments', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'school.Comments.show', 'Comment', '61');
INSERT INTO `t_menu` VALUES ('69', null, null, '', null, null, 'eims', '教育信息管理系统', '1', '教师管理', '教师管理', null, null, null);
INSERT INTO `t_menu` VALUES ('70', 'teacher.Teachers', null, '', null, null, 'eims', '教育信息管理系统', '0', '教师管理', '教师管理', null, 'Teacher', '69');
INSERT INTO `t_menu` VALUES ('71', 'teacher.Teachers', null, null, 'register', '注册', 'eims', '教育信息管理系统', null, '注册', '注册', 'teacher.Teachers.register', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('72', 'teacher.Teachers', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'teacher.Teachers.update', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('73', 'teacher.Teachers', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'teacher.Teachers.delete', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('74', 'teacher.Teachers', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'teacher.Teachers.save', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('75', 'teacher.Teachers', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'teacher.Teachers.search', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('76', 'teacher.Teachers', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'teacher.Teachers.show', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('77', 'teacher.Teachers', null, null, 'login', '登录', 'eims', '教育信息管理系统', null, '登录', '登录', 'teacher.Teachers.login', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('78', 'teacher.Teachers', null, null, 'getTeacherI', 'getTeacherI', 'eims', '教育信息管理系统', null, null, null, 'teacher.Teachers.getTeacherI', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('79', 'teacher.Teachers', null, null, 'setTeacherI', 'setTeacherI', 'eims', '教育信息管理系统', null, null, null, 'teacher.Teachers.setTeacherI', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('80', 'teacher.Teachers', null, null, 'onLogout', '注销', 'eims', '教育信息管理系统', null, '注销', '注销', 'teacher.Teachers.onLogout', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('81', 'teacher.Teachers', null, null, 'getTeacherList', '获取老师列表', 'eims', '教育信息管理系统', null, '获取老师列表', '获取老师列表', 'teacher.Teachers.getTeacherList', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('82', 'teacher.Teachers', null, null, 'validateLoginName', '登陆名验证', 'eims', '教育信息管理系统', null, '登陆名验证', '登陆名验证', 'teacher.Teachers.validateLoginName', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('83', 'teacher.Teachers', null, null, 'activateAccount', '激活账户', 'eims', '教育信息管理系统', null, '激活账户', '激活账户', 'teacher.Teachers.activateAccount', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('84', 'teacher.Teachers', null, null, 'validateEmail', '邮箱验证', 'eims', '教育信息管理系统', null, '邮箱验证', '邮箱验证', 'teacher.Teachers.validateEmail', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('85', 'teacher.Teachers', null, null, 'forgetPassword', '找回忘记', 'eims', '教育信息管理系统', null, '找回忘记', '找回忘记', 'teacher.Teachers.forgetPassword', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('86', 'teacher.Teachers', null, null, 'reSetPassword', '重置密码', 'eims', '教育信息管理系统', null, '重置密码', '重置密码', 'teacher.Teachers.reSetPassword', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('87', 'teacher.Teachers', null, null, 'validatePhone', '手机验证', 'eims', '教育信息管理系统', null, '手机验证', '手机验证', 'teacher.Teachers.validatePhone', 'Teacher', '70');
INSERT INTO `t_menu` VALUES ('88', null, null, '', null, null, 'eims', '教育信息管理系统', '2', '学生管理', '学生管理', null, null, null);
INSERT INTO `t_menu` VALUES ('89', 'student.Classes', null, '', null, null, 'eims', '教育信息管理系统', '0', '班级管理', '班级管理', null, 'Classes', '88');
INSERT INTO `t_menu` VALUES ('90', 'student.Classes', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'student.Classes.update', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('91', 'student.Classes', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'student.Classes.delete', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('92', 'student.Classes', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'student.Classes.save', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('93', 'student.Classes', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'student.Classes.search', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('94', 'student.Classes', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'student.Classes.show', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('95', 'student.Classes', null, null, 'getClasseI', 'getClasseI', 'eims', '教育信息管理系统', null, null, null, 'student.Classes.getClasseI', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('96', 'student.Classes', null, null, 'setClasseI', 'setClasseI', 'eims', '教育信息管理系统', null, null, null, 'student.Classes.setClasseI', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('97', 'student.Classes', null, null, 'getClassList', '获取班级列表', 'eims', '教育信息管理系统', null, '获取班级列表', '获取班级列表', 'student.Classes.getClassList', 'Classes', '89');
INSERT INTO `t_menu` VALUES ('98', 'student.Students', null, '', null, null, 'eims', '教育信息管理系统', '1', '学生基本信息管理', '学生基本信息管理', null, 'Student', '88');
INSERT INTO `t_menu` VALUES ('99', 'student.Students', null, null, 'register', '注册', 'eims', '教育信息管理系统', null, '注册', '注册', 'student.Students.register', 'Student', '98');
INSERT INTO `t_menu` VALUES ('100', 'student.Students', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'student.Students.update', 'Student', '98');
INSERT INTO `t_menu` VALUES ('101', 'student.Students', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'student.Students.delete', 'Student', '98');
INSERT INTO `t_menu` VALUES ('102', 'student.Students', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'student.Students.save', 'Student', '98');
INSERT INTO `t_menu` VALUES ('103', 'student.Students', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'student.Students.search', 'Student', '98');
INSERT INTO `t_menu` VALUES ('104', 'student.Students', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'student.Students.show', 'Student', '98');
INSERT INTO `t_menu` VALUES ('105', 'student.Students', null, null, 'login', '登陆', 'eims', '教育信息管理系统', null, '登陆', '登陆', 'student.Students.login', 'Student', '98');
INSERT INTO `t_menu` VALUES ('106', 'student.Students', null, null, 'validateLoginName', '登录名验证', 'eims', '教育信息管理系统', null, '登录名验证', '登录名验证', 'student.Students.validateLoginName', 'Student', '98');
INSERT INTO `t_menu` VALUES ('107', 'student.Students', null, null, 'activateAccount', '激活账户', 'eims', '教育信息管理系统', null, '激活账户', '激活账户', 'student.Students.activateAccount', 'Student', '98');
INSERT INTO `t_menu` VALUES ('108', 'student.Students', null, null, 'validateEmail', '邮箱验证', 'eims', '教育信息管理系统', null, '邮箱验证', '邮箱验证', 'student.Students.validateEmail', 'Student', '98');
INSERT INTO `t_menu` VALUES ('109', 'student.Students', null, null, 'forgetPassword', '找回密码', 'eims', '教育信息管理系统', null, '找回密码', '找回密码', 'student.Students.forgetPassword', 'Student', '98');
INSERT INTO `t_menu` VALUES ('110', 'student.Students', null, null, 'reSetPassword', '重置密码', 'eims', '教育信息管理系统', null, '重置密码', '重置密码', 'student.Students.reSetPassword', 'Student', '98');
INSERT INTO `t_menu` VALUES ('111', 'student.Students', null, null, 'validatePhone', '手机验证', 'eims', '教育信息管理系统', null, '手机验证', '手机验证', 'student.Students.validatePhone', 'Student', '98');
INSERT INTO `t_menu` VALUES ('112', 'student.Students', null, null, 'setStudentI', 'setStudentI', 'eims', '教育信息管理系统', null, null, null, 'student.Students.setStudentI', 'Student', '98');
INSERT INTO `t_menu` VALUES ('113', 'student.Students', null, null, 'getStudentI', 'getStudentI', 'eims', '教育信息管理系统', null, null, null, 'student.Students.getStudentI', 'Student', '98');
INSERT INTO `t_menu` VALUES ('114', 'student.Students', null, null, 'getStudentList', '获取学生列表', 'eims', '教育信息管理系统', null, '获取学生列表', '获取学生列表', 'student.Students.getStudentList', 'Student', '98');
INSERT INTO `t_menu` VALUES ('115', null, null, '', null, null, 'eims', '教育信息管理系统', '3', '系统管理', '系统管理', null, null, null);
INSERT INTO `t_menu` VALUES ('116', 'sys.Resourceses', null, '', null, null, 'eims', '教育信息管理系统', '0', '资源管理', '资源管理', null, 'Resources', '115');
INSERT INTO `t_menu` VALUES ('117', 'sys.Resourceses', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.Resourceses.update', 'Resources', '116');
INSERT INTO `t_menu` VALUES ('118', 'sys.Resourceses', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.Resourceses.delete', 'Resources', '116');
INSERT INTO `t_menu` VALUES ('119', 'sys.Resourceses', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.Resourceses.save', 'Resources', '116');
INSERT INTO `t_menu` VALUES ('120', 'sys.Resourceses', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.Resourceses.search', 'Resources', '116');
INSERT INTO `t_menu` VALUES ('121', 'sys.Resourceses', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.Resourceses.show', 'Resources', '116');
INSERT INTO `t_menu` VALUES ('122', 'sys.Expenserecords', null, '', null, null, 'eims', '教育信息管理系统', '1', '扣费记录', '扣费记录', null, 'Expenserecord', '115');
INSERT INTO `t_menu` VALUES ('123', 'sys.Expenserecords', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.Expenserecords.update', 'Expenserecord', '122');
INSERT INTO `t_menu` VALUES ('124', 'sys.Expenserecords', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.Expenserecords.delete', 'Expenserecord', '122');
INSERT INTO `t_menu` VALUES ('125', 'sys.Expenserecords', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.Expenserecords.save', 'Expenserecord', '122');
INSERT INTO `t_menu` VALUES ('126', 'sys.Expenserecords', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.Expenserecords.search', 'Expenserecord', '122');
INSERT INTO `t_menu` VALUES ('127', 'sys.Expenserecords', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.Expenserecords.show', 'Expenserecord', '122');
INSERT INTO `t_menu` VALUES ('128', 'sys.Users', null, '', null, null, 'eims', '教育信息管理系统', '2', '用户管理', '用户管理', null, 'User', '115');
INSERT INTO `t_menu` VALUES ('129', 'sys.Users', null, null, 'register', '注册', 'eims', '教育信息管理系统', null, '注册', '注册', 'sys.Users.register', 'User', '128');
INSERT INTO `t_menu` VALUES ('130', 'sys.Users', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.Users.update', 'User', '128');
INSERT INTO `t_menu` VALUES ('131', 'sys.Users', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.Users.delete', 'User', '128');
INSERT INTO `t_menu` VALUES ('132', 'sys.Users', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.Users.save', 'User', '128');
INSERT INTO `t_menu` VALUES ('133', 'sys.Users', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.Users.search', 'User', '128');
INSERT INTO `t_menu` VALUES ('134', 'sys.Users', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.Users.show', 'User', '128');
INSERT INTO `t_menu` VALUES ('135', 'sys.Users', null, null, 'login', '登录', 'eims', '教育信息管理系统', null, '登录', '登录', 'sys.Users.login', 'User', '128');
INSERT INTO `t_menu` VALUES ('136', 'sys.Users', null, null, 'validateLoginName', '注册登录名验证', 'eims', '教育信息管理系统', null, '注册登录名验证', '注册登录名验证', 'sys.Users.validateLoginName', 'User', '128');
INSERT INTO `t_menu` VALUES ('137', 'sys.Users', null, null, 'activateAccount', '激活账户', 'eims', '教育信息管理系统', null, '激活账户', '激活账户', 'sys.Users.activateAccount', 'User', '128');
INSERT INTO `t_menu` VALUES ('138', 'sys.Users', null, null, 'validateEmail', '验证注册邮箱', 'eims', '教育信息管理系统', null, '验证注册邮箱', '验证注册邮箱', 'sys.Users.validateEmail', 'User', '128');
INSERT INTO `t_menu` VALUES ('139', 'sys.Users', null, null, 'forgetPassword', '忘记密码，找回密码', 'eims', '教育信息管理系统', null, '忘记密码，找回密码', '忘记密码，找回密码', 'sys.Users.forgetPassword', 'User', '128');
INSERT INTO `t_menu` VALUES ('140', 'sys.Users', null, null, 'reSetPassword', '重置密码', 'eims', '教育信息管理系统', null, '重置密码', '重置密码', 'sys.Users.reSetPassword', 'User', '128');
INSERT INTO `t_menu` VALUES ('141', 'sys.Users', null, null, 'validatePhone', '注册手机验证', 'eims', '教育信息管理系统', null, '注册手机验证', '注册手机验证', 'sys.Users.validatePhone', 'User', '128');
INSERT INTO `t_menu` VALUES ('142', 'sys.Roles', null, '', null, null, 'eims', '教育信息管理系统', '3', '角色管理', '角色管理', null, 'Role', '115');
INSERT INTO `t_menu` VALUES ('143', 'sys.Roles', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.Roles.update', 'Role', '142');
INSERT INTO `t_menu` VALUES ('144', 'sys.Roles', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.Roles.delete', 'Role', '142');
INSERT INTO `t_menu` VALUES ('145', 'sys.Roles', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.Roles.save', 'Role', '142');
INSERT INTO `t_menu` VALUES ('146', 'sys.Roles', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.Roles.search', 'Role', '142');
INSERT INTO `t_menu` VALUES ('147', 'sys.Roles', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.Roles.show', 'Role', '142');
INSERT INTO `t_menu` VALUES ('148', 'sys.Roles', null, null, 'saveRolePermissions', '保存角色权限', 'eims', '教育信息管理系统', null, '保存角色权限', '保存角色权限', 'sys.Roles.saveRolePermissions', 'Role', '142');
INSERT INTO `t_menu` VALUES ('149', 'sys.Roles', null, null, 'getRolePermissions', '分配权限', 'eims', '教育信息管理系统', null, '分配权限', '分配权限', 'sys.Roles.getRolePermissions', 'Role', '142');
INSERT INTO `t_menu` VALUES ('150', 'sys.Roles', null, null, 'getRoleI', 'getRoleI', 'eims', '教育信息管理系统', null, null, null, 'sys.Roles.getRoleI', 'Role', '142');
INSERT INTO `t_menu` VALUES ('151', 'sys.Roles', null, null, 'setRoleI', 'setRoleI', 'eims', '教育信息管理系统', null, null, null, 'sys.Roles.setRoleI', 'Role', '142');
INSERT INTO `t_menu` VALUES ('152', 'sys.RoleResourceses', null, '', null, null, 'eims', '教育信息管理系统', '4', '角色资源管理', '角色资源管理', null, 'RoleResources', '115');
INSERT INTO `t_menu` VALUES ('153', 'sys.RoleResourceses', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.RoleResourceses.update', 'RoleResources', '152');
INSERT INTO `t_menu` VALUES ('154', 'sys.RoleResourceses', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.RoleResourceses.delete', 'RoleResources', '152');
INSERT INTO `t_menu` VALUES ('155', 'sys.RoleResourceses', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.RoleResourceses.save', 'RoleResources', '152');
INSERT INTO `t_menu` VALUES ('156', 'sys.RoleResourceses', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.RoleResourceses.search', 'RoleResources', '152');
INSERT INTO `t_menu` VALUES ('157', 'sys.RoleResourceses', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.RoleResourceses.show', 'RoleResources', '152');
INSERT INTO `t_menu` VALUES ('158', 'sys.RoleResourceses', null, null, 'batchSave', '批量保存角色资源', 'eims', '教育信息管理系统', null, '批量保存角色资源', '批量保存角色资源', 'sys.RoleResourceses.batchSave', 'RoleResources', '152');
INSERT INTO `t_menu` VALUES ('159', 'sys.UserRoles', null, '', null, null, 'eims', '教育信息管理系统', '5', '用户角色', '用户角色', null, 'UserRole', '115');
INSERT INTO `t_menu` VALUES ('160', 'sys.UserRoles', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.UserRoles.update', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('161', 'sys.UserRoles', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.UserRoles.delete', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('162', 'sys.UserRoles', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.UserRoles.save', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('163', 'sys.UserRoles', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.UserRoles.search', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('164', 'sys.UserRoles', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.UserRoles.show', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('165', 'sys.UserRoles', null, null, 'getUserRole', '获取用户所拥有的角色', 'eims', '教育信息管理系统', null, '获取用户所拥有的角色', '获取用户所拥有的角色', 'sys.UserRoles.getUserRole', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('166', 'sys.UserRoles', null, null, 'batchSave', '批量保存用户角色', 'eims', '教育信息管理系统', null, '批量保存用户角色', '批量保存用户角色', 'sys.UserRoles.batchSave', 'UserRole', '159');
INSERT INTO `t_menu` VALUES ('167', 'sys.Menus', null, '', null, null, 'eims', '教育信息管理系统', '6', '系统菜单管理', '系统菜单管理', null, 'Menu', '115');
INSERT INTO `t_menu` VALUES ('168', 'sys.Menus', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.Menus.update', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('169', 'sys.Menus', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.Menus.delete', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('170', 'sys.Menus', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.Menus.save', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('171', 'sys.Menus', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.Menus.search', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('172', 'sys.Menus', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.Menus.show', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('173', 'sys.Menus', null, null, 'toSaveMenus', 'toSaveMenus', 'eims', '教育信息管理系统', null, null, null, 'sys.Menus.toSaveMenus', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('174', 'sys.Menus', null, null, 'initMent', '初始化系统菜单', 'eims', '教育信息管理系统', null, '初始化系统菜单', '初始化系统菜单', 'sys.Menus.initMent', 'Menu', '167');
INSERT INTO `t_menu` VALUES ('175', 'sys.Resourceses', null, '', null, null, 'eims', '教育信息管理系统', '7', '系统代码管理', '系统代码管理', null, 'FlatCode', '115');
INSERT INTO `t_menu` VALUES ('176', 'sys.Resourceses', null, null, 'update', '更新', 'eims', '教育信息管理系统', null, '更新', '更新', 'sys.Resourceses.update', 'FlatCode', '175');
INSERT INTO `t_menu` VALUES ('177', 'sys.Resourceses', null, null, 'delete', '删除', 'eims', '教育信息管理系统', null, '删除', '删除', 'sys.Resourceses.delete', 'FlatCode', '175');
INSERT INTO `t_menu` VALUES ('178', 'sys.Resourceses', null, null, 'save', '保存', 'eims', '教育信息管理系统', null, '保存', '保存', 'sys.Resourceses.save', 'FlatCode', '175');
INSERT INTO `t_menu` VALUES ('179', 'sys.Resourceses', null, null, 'search', '查询', 'eims', '教育信息管理系统', null, '查询', '查询', 'sys.Resourceses.search', 'FlatCode', '175');
INSERT INTO `t_menu` VALUES ('180', 'sys.Resourceses', null, null, 'show', '查看', 'eims', '教育信息管理系统', null, '查看', '查看', 'sys.Resourceses.show', 'FlatCode', '175');
INSERT INTO `t_menu` VALUES ('181', null, null, '', null, null, 'examination', '考试管理系统', '0', '题库管理', '题库管理', null, null, null);
INSERT INTO `t_menu` VALUES ('182', 'examination.questions.QuestionsLibInfos', null, '', null, null, 'examination', '考试管理系统', '0', '题目信息', '题目信息', null, 'QuestionsLibInfo', '181');
INSERT INTO `t_menu` VALUES ('183', 'examination.questions.QuestionsLibInfos', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.questions.QuestionsLibInfos.update', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('184', 'examination.questions.QuestionsLibInfos', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.questions.QuestionsLibInfos.delete', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('185', 'examination.questions.QuestionsLibInfos', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.questions.QuestionsLibInfos.save', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('186', 'examination.questions.QuestionsLibInfos', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.questions.QuestionsLibInfos.search', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('187', 'examination.questions.QuestionsLibInfos', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.questions.QuestionsLibInfos.show', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('188', 'examination.questions.QuestionsLibInfos', null, null, 'setQuestionsLibInfoI', 'setQuestionsLibInfoI', 'examination', '考试管理系统', null, null, null, 'examination.questions.QuestionsLibInfos.setQuestionsLibInfoI', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('189', 'examination.questions.QuestionsLibInfos', null, null, 'questionsLibInfoList', '获取试题列表', 'examination', '考试管理系统', null, '获取试题列表', '获取试题列表', 'examination.questions.QuestionsLibInfos.questionsLibInfoList', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('190', 'examination.questions.QuestionsLibInfos', null, null, 'getQuestionsLibInfoI', 'getQuestionsLibInfoI', 'examination', '考试管理系统', null, null, null, 'examination.questions.QuestionsLibInfos.getQuestionsLibInfoI', 'QuestionsLibInfo', '182');
INSERT INTO `t_menu` VALUES ('191', 'examination.questions.QuestionsTypes', null, '', null, null, 'examination', '考试管理系统', '1', '题目类型', '题目类型', null, 'QuestionsType', '181');
INSERT INTO `t_menu` VALUES ('192', 'examination.questions.QuestionsTypes', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.questions.QuestionsTypes.update', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('193', 'examination.questions.QuestionsTypes', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.questions.QuestionsTypes.delete', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('194', 'examination.questions.QuestionsTypes', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.questions.QuestionsTypes.save', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('195', 'examination.questions.QuestionsTypes', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.questions.QuestionsTypes.search', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('196', 'examination.questions.QuestionsTypes', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.questions.QuestionsTypes.show', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('197', 'examination.questions.QuestionsTypes', null, null, 'getQuestionsTypeI', 'getQuestionsTypeI', 'examination', '考试管理系统', null, null, null, 'examination.questions.QuestionsTypes.getQuestionsTypeI', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('198', 'examination.questions.QuestionsTypes', null, null, 'getQuestionsTypesList', '获取题目类型列表', 'examination', '考试管理系统', null, '获取题目类型列表', '获取题目类型列表', 'examination.questions.QuestionsTypes.getQuestionsTypesList', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('199', 'examination.questions.QuestionsTypes', null, null, 'setQuestionsTypeI', 'setQuestionsTypeI', 'examination', '考试管理系统', null, null, null, 'examination.questions.QuestionsTypes.setQuestionsTypeI', 'QuestionsType', '191');
INSERT INTO `t_menu` VALUES ('200', null, null, '', null, null, 'examination', '考试管理系统', '1', '考试管理', '考试管理', null, null, null);
INSERT INTO `t_menu` VALUES ('201', 'examination.examinationmanagement.ExaminationClasses', null, '', null, null, 'examination', '考试管理系统', '0', '考试班级信息', '考试班级信息', null, 'ExaminationClass', '200');
INSERT INTO `t_menu` VALUES ('202', 'examination.examinationmanagement.ExaminationClasses', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.examinationmanagement.ExaminationClasses.update', 'ExaminationClass', '201');
INSERT INTO `t_menu` VALUES ('203', 'examination.examinationmanagement.ExaminationClasses', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.examinationmanagement.ExaminationClasses.delete', 'ExaminationClass', '201');
INSERT INTO `t_menu` VALUES ('204', 'examination.examinationmanagement.ExaminationClasses', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.examinationmanagement.ExaminationClasses.save', 'ExaminationClass', '201');
INSERT INTO `t_menu` VALUES ('205', 'examination.examinationmanagement.ExaminationClasses', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.ExaminationClasses.search', 'ExaminationClass', '201');
INSERT INTO `t_menu` VALUES ('206', 'examination.examinationmanagement.ExaminationClasses', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.examinationmanagement.ExaminationClasses.show', 'ExaminationClass', '201');
INSERT INTO `t_menu` VALUES ('207', 'examination.examinationmanagement.ExaminationInfos', null, '', null, null, 'examination', '考试管理系统', '1', '考试信息', '考试信息', null, 'ExaminationInfo', '200');
INSERT INTO `t_menu` VALUES ('208', 'examination.examinationmanagement.ExaminationInfos', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.examinationmanagement.ExaminationInfos.update', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('209', 'examination.examinationmanagement.ExaminationInfos', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.examinationmanagement.ExaminationInfos.delete', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('210', 'examination.examinationmanagement.ExaminationInfos', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.examinationmanagement.ExaminationInfos.save', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('211', 'examination.examinationmanagement.ExaminationInfos', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.ExaminationInfos.search', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('212', 'examination.examinationmanagement.ExaminationInfos', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.examinationmanagement.ExaminationInfos.show', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('213', 'examination.examinationmanagement.ExaminationInfos', null, null, 'setExaminationInfoI', 'setExaminationInfoI', 'examination', '考试管理系统', null, null, null, 'examination.examinationmanagement.ExaminationInfos.setExaminationInfoI', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('214', 'examination.examinationmanagement.ExaminationInfos', null, null, 'getExaminationInfoList', '考试列表', 'examination', '考试管理系统', null, '考试列表', '考试列表', 'examination.examinationmanagement.ExaminationInfos.getExaminationInfoList', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('215', 'examination.examinationmanagement.ExaminationInfos', null, null, 'getExaminationInfoI', 'getExaminationInfoI', 'examination', '考试管理系统', null, null, null, 'examination.examinationmanagement.ExaminationInfos.getExaminationInfoI', 'ExaminationInfo', '207');
INSERT INTO `t_menu` VALUES ('216', 'examination.examinationmanagement.ExaminationPapers', null, '', null, null, 'examination', '考试管理系统', '2', '试卷信息', '试卷信息', null, 'ExaminationPaper', '200');
INSERT INTO `t_menu` VALUES ('217', 'examination.examinationmanagement.ExaminationPapers', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.examinationmanagement.ExaminationPapers.update', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('218', 'examination.examinationmanagement.ExaminationPapers', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.examinationmanagement.ExaminationPapers.delete', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('219', 'examination.examinationmanagement.ExaminationPapers', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.examinationmanagement.ExaminationPapers.save', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('220', 'examination.examinationmanagement.ExaminationPapers', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.ExaminationPapers.search', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('221', 'examination.examinationmanagement.ExaminationPapers', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.examinationmanagement.ExaminationPapers.show', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('222', 'examination.examinationmanagement.ExaminationPapers', null, null, 'setExaminationPaperI', 'setExaminationPaperI', 'examination', '考试管理系统', null, null, null, 'examination.examinationmanagement.ExaminationPapers.setExaminationPaperI', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('223', 'examination.examinationmanagement.ExaminationPapers', null, null, 'getExaminationPaperList', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.ExaminationPapers.getExaminationPaperList', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('224', 'examination.examinationmanagement.ExaminationPapers', null, null, 'getExaminationPaperI', 'getExaminationPaperI', 'examination', '考试管理系统', null, null, null, 'examination.examinationmanagement.ExaminationPapers.getExaminationPaperI', 'ExaminationPaper', '216');
INSERT INTO `t_menu` VALUES ('225', 'examination.examinationmanagement.PaperQuestionses', null, '', null, null, 'examination', '考试管理系统', '3', '试卷题目', '试卷题目', null, 'PaperQuestions', '200');
INSERT INTO `t_menu` VALUES ('226', 'examination.examinationmanagement.PaperQuestionses', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.examinationmanagement.PaperQuestionses.update', 'PaperQuestions', '225');
INSERT INTO `t_menu` VALUES ('227', 'examination.examinationmanagement.PaperQuestionses', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.examinationmanagement.PaperQuestionses.delete', 'PaperQuestions', '225');
INSERT INTO `t_menu` VALUES ('228', 'examination.examinationmanagement.PaperQuestionses', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.examinationmanagement.PaperQuestionses.save', 'PaperQuestions', '225');
INSERT INTO `t_menu` VALUES ('229', 'examination.examinationmanagement.PaperQuestionses', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.PaperQuestionses.search', 'PaperQuestions', '225');
INSERT INTO `t_menu` VALUES ('230', 'examination.examinationmanagement.PaperQuestionses', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.examinationmanagement.PaperQuestionses.show', 'PaperQuestions', '225');
INSERT INTO `t_menu` VALUES ('231', 'examination.examinationmanagement.ExaminationRooms', null, '', null, null, 'examination', '考试管理系统', '4', '考场信息', '考场信息', null, 'ExaminationRoom', '200');
INSERT INTO `t_menu` VALUES ('232', 'examination.examinationmanagement.ExaminationRooms', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.examinationmanagement.ExaminationRooms.update', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('233', 'examination.examinationmanagement.ExaminationRooms', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.examinationmanagement.ExaminationRooms.delete', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('234', 'examination.examinationmanagement.ExaminationRooms', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.examinationmanagement.ExaminationRooms.save', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('235', 'examination.examinationmanagement.ExaminationRooms', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.ExaminationRooms.search', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('236', 'examination.examinationmanagement.ExaminationRooms', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.examinationmanagement.ExaminationRooms.show', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('237', 'examination.examinationmanagement.ExaminationRooms', null, null, 'setExaminationRoomI', 'setExaminationRoomI', 'examination', '考试管理系统', null, null, null, 'examination.examinationmanagement.ExaminationRooms.setExaminationRoomI', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('238', 'examination.examinationmanagement.ExaminationRooms', null, null, 'getExaminationRoomList', '获取考场列表', 'examination', '考试管理系统', null, '获取考场列表', '获取考场列表', 'examination.examinationmanagement.ExaminationRooms.getExaminationRoomList', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('239', 'examination.examinationmanagement.ExaminationRooms', null, null, 'getExaminationRoomI', 'getExaminationRoomI', 'examination', '考试管理系统', null, null, null, 'examination.examinationmanagement.ExaminationRooms.getExaminationRoomI', 'ExaminationRoom', '231');
INSERT INTO `t_menu` VALUES ('240', 'examination.examinationmanagement.StudentPaperAnswers', null, '', null, null, 'examination', '考试管理系统', '5', '学生试卷作答信息', '学生试卷作答信息', null, 'StudentPaperAnswer', '200');
INSERT INTO `t_menu` VALUES ('241', 'examination.examinationmanagement.StudentPaperAnswers', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.examinationmanagement.StudentPaperAnswers.update', 'StudentPaperAnswer', '240');
INSERT INTO `t_menu` VALUES ('242', 'examination.examinationmanagement.StudentPaperAnswers', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.examinationmanagement.StudentPaperAnswers.delete', 'StudentPaperAnswer', '240');
INSERT INTO `t_menu` VALUES ('243', 'examination.examinationmanagement.StudentPaperAnswers', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.examinationmanagement.StudentPaperAnswers.save', 'StudentPaperAnswer', '240');
INSERT INTO `t_menu` VALUES ('244', 'examination.examinationmanagement.StudentPaperAnswers', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.examinationmanagement.StudentPaperAnswers.search', 'StudentPaperAnswer', '240');
INSERT INTO `t_menu` VALUES ('245', 'examination.examinationmanagement.StudentPaperAnswers', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.examinationmanagement.StudentPaperAnswers.show', 'StudentPaperAnswer', '240');
INSERT INTO `t_menu` VALUES ('246', null, null, '', null, null, 'examination', '考试管理系统', '2', '成绩管理', '成绩管理', null, null, null);
INSERT INTO `t_menu` VALUES ('247', 'examination.achievementmanagement.AchievementInfos', null, '', null, null, 'examination', '考试管理系统', '0', '成绩信息', '成绩信息', null, 'AchievementInfo', '246');
INSERT INTO `t_menu` VALUES ('248', 'examination.achievementmanagement.AchievementInfos', null, null, 'update', '更新', 'examination', '考试管理系统', null, '更新', '更新', 'examination.achievementmanagement.AchievementInfos.update', 'AchievementInfo', '247');
INSERT INTO `t_menu` VALUES ('249', 'examination.achievementmanagement.AchievementInfos', null, null, 'delete', '删除', 'examination', '考试管理系统', null, '删除', '删除', 'examination.achievementmanagement.AchievementInfos.delete', 'AchievementInfo', '247');
INSERT INTO `t_menu` VALUES ('250', 'examination.achievementmanagement.AchievementInfos', null, null, 'save', '保存', 'examination', '考试管理系统', null, '保存', '保存', 'examination.achievementmanagement.AchievementInfos.save', 'AchievementInfo', '247');
INSERT INTO `t_menu` VALUES ('251', 'examination.achievementmanagement.AchievementInfos', null, null, 'search', '查询', 'examination', '考试管理系统', null, '查询', '查询', 'examination.achievementmanagement.AchievementInfos.search', 'AchievementInfo', '247');
INSERT INTO `t_menu` VALUES ('252', 'examination.achievementmanagement.AchievementInfos', null, null, 'show', '查看', 'examination', '考试管理系统', null, '查看', '查看', 'examination.achievementmanagement.AchievementInfos.show', 'AchievementInfo', '247');
INSERT INTO `t_menu` VALUES ('253', null, null, '', null, null, 'oles', '在线教育系统', '0', '客户管理', '客户管理', null, null, null);
INSERT INTO `t_menu` VALUES ('254', 'customer.Customers', null, '', null, null, 'oles', '在线教育系统', '0', '客户信息管理', '客户信息管理', null, 'Customer', '253');
INSERT INTO `t_menu` VALUES ('255', 'customer.Customers', null, null, 'register', '注册', 'oles', '在线教育系统', null, '注册', '注册', 'customer.Customers.register', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('256', 'customer.Customers', null, null, 'update', '更新', 'oles', '在线教育系统', null, '更新', '更新', 'customer.Customers.update', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('257', 'customer.Customers', null, null, 'delete', '删除', 'oles', '在线教育系统', null, '删除', '删除', 'customer.Customers.delete', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('258', 'customer.Customers', null, null, 'save', '保存', 'oles', '在线教育系统', null, '保存', '保存', 'customer.Customers.save', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('259', 'customer.Customers', null, null, 'search', '查询', 'oles', '在线教育系统', null, '查询', '查询', 'customer.Customers.search', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('260', 'customer.Customers', null, null, 'show', '查看', 'oles', '在线教育系统', null, '查看', '查看', 'customer.Customers.show', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('261', 'customer.Customers', null, null, 'login', '登录', 'oles', '在线教育系统', null, '登录', '登录', 'customer.Customers.login', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('262', 'customer.Customers', null, null, 'validateLoginName', '注册登录名验证', 'oles', '在线教育系统', null, '注册登录名验证', '注册登录名验证', 'customer.Customers.validateLoginName', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('263', 'customer.Customers', null, null, 'getCustomerI', 'getCustomerI', 'oles', '在线教育系统', null, null, null, 'customer.Customers.getCustomerI', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('264', 'customer.Customers', null, null, 'setCustomerI', 'setCustomerI', 'oles', '在线教育系统', null, null, null, 'customer.Customers.setCustomerI', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('265', 'customer.Customers', null, null, 'getCustomerList', '查询', 'oles', '在线教育系统', null, '查询', '查询', 'customer.Customers.getCustomerList', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('266', 'customer.Customers', null, null, 'activateAccount', '激活账户', 'oles', '在线教育系统', null, '激活账户', '激活账户', 'customer.Customers.activateAccount', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('267', 'customer.Customers', null, null, 'validateEmail', '验证注册邮箱', 'oles', '在线教育系统', null, '验证注册邮箱', '验证注册邮箱', 'customer.Customers.validateEmail', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('268', 'customer.Customers', null, null, 'forgetPassword', '忘记密码，找回密码', 'oles', '在线教育系统', null, '忘记密码，找回密码', '忘记密码，找回密码', 'customer.Customers.forgetPassword', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('269', 'customer.Customers', null, null, 'reSetPassword', '重置密码', 'oles', '在线教育系统', null, '重置密码', '重置密码', 'customer.Customers.reSetPassword', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('270', 'customer.Customers', null, null, 'validatePhone', '注册手机验证', 'oles', '在线教育系统', null, '注册手机验证', '注册手机验证', 'customer.Customers.validatePhone', 'Customer', '254');
INSERT INTO `t_menu` VALUES ('271', null, null, '', null, null, 'oles', '在线教育系统', '1', '订单管理', '订单管理', null, null, null);
INSERT INTO `t_menu` VALUES ('272', 'sys.Resourceses', null, '', null, null, 'oles', '在线教育系统', '0', '订单查询', '订单查询', null, 'Resources', '271');
INSERT INTO `t_menu` VALUES ('273', 'sys.Resourceses', null, null, 'update', '更新', 'oles', '在线教育系统', null, '更新', '更新', 'sys.Resourceses.update', 'Resources', '272');
INSERT INTO `t_menu` VALUES ('274', 'sys.Resourceses', null, null, 'delete', '删除', 'oles', '在线教育系统', null, '删除', '删除', 'sys.Resourceses.delete', 'Resources', '272');
INSERT INTO `t_menu` VALUES ('275', 'sys.Resourceses', null, null, 'save', '保存', 'oles', '在线教育系统', null, '保存', '保存', 'sys.Resourceses.save', 'Resources', '272');
INSERT INTO `t_menu` VALUES ('276', 'sys.Resourceses', null, null, 'search', '查询', 'oles', '在线教育系统', null, '查询', '查询', 'sys.Resourceses.search', 'Resources', '272');
INSERT INTO `t_menu` VALUES ('277', 'sys.Resourceses', null, null, 'show', '查看', 'oles', '在线教育系统', null, '查看', '查看', 'sys.Resourceses.show', 'Resources', '272');
INSERT INTO `t_menu` VALUES ('278', null, null, '', null, null, 'oles', '在线教育系统', '2', '资源库管理', '资源库管理', null, null, null);
INSERT INTO `t_menu` VALUES ('279', 'school.ResourceLibraries', null, '', null, null, 'oles', '在线教育系统', '0', '资源库信息', '资源库信息', null, 'ResourceLibrary', '278');
INSERT INTO `t_menu` VALUES ('280', 'school.ResourceLibraries', null, null, 'update', '更新', 'oles', '在线教育系统', null, '更新', '更新', 'school.ResourceLibraries.update', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('281', 'school.ResourceLibraries', null, null, 'delete', '删除', 'oles', '在线教育系统', null, '删除', '删除', 'school.ResourceLibraries.delete', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('282', 'school.ResourceLibraries', null, null, 'save', '保存', 'oles', '在线教育系统', null, '保存', '保存', 'school.ResourceLibraries.save', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('283', 'school.ResourceLibraries', null, null, 'search', '查询', 'oles', '在线教育系统', null, '查询', '查询', 'school.ResourceLibraries.search', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('284', 'school.ResourceLibraries', null, null, 'show', '查看', 'oles', '在线教育系统', null, '查看', '查看', 'school.ResourceLibraries.show', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('285', 'school.ResourceLibraries', null, null, 'export', '导出excel', 'oles', '在线教育系统', null, '导出excel', '导出excel', 'school.ResourceLibraries.export', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('286', 'school.ResourceLibraries', null, null, 'importExcel', '导入excel', 'oles', '在线教育系统', null, '导入excel', '导入excel', 'school.ResourceLibraries.importExcel', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('287', 'school.ResourceLibraries', null, null, 'downloadTemplate', '下载excel导入模板', 'oles', '在线教育系统', null, '下载excel导入模板', '下载excel导入模板', 'school.ResourceLibraries.downloadTemplate', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('288', 'school.ResourceLibraries', null, null, 'viewList', '查看资料列表', 'oles', '在线教育系统', null, '查看资料列表', '查看资料列表', 'school.ResourceLibraries.viewList', 'ResourceLibrary', '279');
INSERT INTO `t_menu` VALUES ('289', 'school.ResourceComments', null, '', null, null, 'oles', '在线教育系统', '1', '资源评论信息', '资源评论信息', null, 'ResourceComment', '278');
INSERT INTO `t_menu` VALUES ('290', 'school.ResourceComments', null, null, 'update', '更新', 'oles', '在线教育系统', null, '更新', '更新', 'school.ResourceComments.update', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('291', 'school.ResourceComments', null, null, 'delete', '删除', 'oles', '在线教育系统', null, '删除', '删除', 'school.ResourceComments.delete', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('292', 'school.ResourceComments', null, null, 'save', '保存', 'oles', '在线教育系统', null, '保存', '保存', 'school.ResourceComments.save', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('293', 'school.ResourceComments', null, null, 'search', '查询', 'oles', '在线教育系统', null, '查询', '查询', 'school.ResourceComments.search', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('294', 'school.ResourceComments', null, null, 'getComment', '查看评论', 'oles', '在线教育系统', null, '查看评论', '查看评论', 'school.ResourceComments.getComment', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('295', 'school.ResourceComments', null, null, 'show', '查看', 'oles', '在线教育系统', null, '查看', '查看', 'school.ResourceComments.show', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('296', 'school.ResourceComments', null, null, 'export', '导出excel', 'oles', '在线教育系统', null, '导出excel', '导出excel', 'school.ResourceComments.export', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('297', 'school.ResourceComments', null, null, 'importExcel', '导入excel', 'oles', '在线教育系统', null, '导入excel', '导入excel', 'school.ResourceComments.importExcel', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('298', 'school.ResourceComments', null, null, 'downloadTemplate', '下载excel导入模板', 'oles', '在线教育系统', null, '下载excel导入模板', '下载excel导入模板', 'school.ResourceComments.downloadTemplate', 'ResourceComment', '289');
INSERT INTO `t_menu` VALUES ('299', null, null, '', null, null, 'oa', 'OA办公系统', '0', '考勤管理', '考勤管理', null, null, null);
INSERT INTO `t_menu` VALUES ('300', 'teacher.Teachers', null, '', null, null, 'oa', 'OA办公系统', '0', '签到', '签到', null, 'Teacher', '299');
INSERT INTO `t_menu` VALUES ('301', 'teacher.Teachers', null, null, 'register', '注册', 'oa', 'OA办公系统', null, '注册', '注册', 'teacher.Teachers.register', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('302', 'teacher.Teachers', null, null, 'update', '更新', 'oa', 'OA办公系统', null, '更新', '更新', 'teacher.Teachers.update', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('303', 'teacher.Teachers', null, null, 'delete', '删除', 'oa', 'OA办公系统', null, '删除', '删除', 'teacher.Teachers.delete', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('304', 'teacher.Teachers', null, null, 'save', '保存', 'oa', 'OA办公系统', null, '保存', '保存', 'teacher.Teachers.save', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('305', 'teacher.Teachers', null, null, 'search', '查询', 'oa', 'OA办公系统', null, '查询', '查询', 'teacher.Teachers.search', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('306', 'teacher.Teachers', null, null, 'show', '查看', 'oa', 'OA办公系统', null, '查看', '查看', 'teacher.Teachers.show', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('307', 'teacher.Teachers', null, null, 'login', '登录', 'oa', 'OA办公系统', null, '登录', '登录', 'teacher.Teachers.login', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('308', 'teacher.Teachers', null, null, 'getTeacherI', 'getTeacherI', 'oa', 'OA办公系统', null, null, null, 'teacher.Teachers.getTeacherI', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('309', 'teacher.Teachers', null, null, 'setTeacherI', 'setTeacherI', 'oa', 'OA办公系统', null, null, null, 'teacher.Teachers.setTeacherI', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('310', 'teacher.Teachers', null, null, 'onLogout', '注销', 'oa', 'OA办公系统', null, '注销', '注销', 'teacher.Teachers.onLogout', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('311', 'teacher.Teachers', null, null, 'getTeacherList', '获取老师列表', 'oa', 'OA办公系统', null, '获取老师列表', '获取老师列表', 'teacher.Teachers.getTeacherList', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('312', 'teacher.Teachers', null, null, 'validateLoginName', '登陆名验证', 'oa', 'OA办公系统', null, '登陆名验证', '登陆名验证', 'teacher.Teachers.validateLoginName', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('313', 'teacher.Teachers', null, null, 'activateAccount', '激活账户', 'oa', 'OA办公系统', null, '激活账户', '激活账户', 'teacher.Teachers.activateAccount', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('314', 'teacher.Teachers', null, null, 'validateEmail', '邮箱验证', 'oa', 'OA办公系统', null, '邮箱验证', '邮箱验证', 'teacher.Teachers.validateEmail', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('315', 'teacher.Teachers', null, null, 'forgetPassword', '找回忘记', 'oa', 'OA办公系统', null, '找回忘记', '找回忘记', 'teacher.Teachers.forgetPassword', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('316', 'teacher.Teachers', null, null, 'reSetPassword', '重置密码', 'oa', 'OA办公系统', null, '重置密码', '重置密码', 'teacher.Teachers.reSetPassword', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('317', 'teacher.Teachers', null, null, 'validatePhone', '手机验证', 'oa', 'OA办公系统', null, '手机验证', '手机验证', 'teacher.Teachers.validatePhone', 'Teacher', '300');
INSERT INTO `t_menu` VALUES ('318', null, null, '', null, null, 'oa', 'OA办公系统', '1', '用车管理', '用车管理', null, null, null);
INSERT INTO `t_menu` VALUES ('319', 'student.Classes', null, '', null, null, 'oa', 'OA办公系统', '0', '车辆信息', '车辆信息', null, 'Classes', '318');
INSERT INTO `t_menu` VALUES ('320', 'student.Classes', null, null, 'update', '更新', 'oa', 'OA办公系统', null, '更新', '更新', 'student.Classes.update', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('321', 'student.Classes', null, null, 'delete', '删除', 'oa', 'OA办公系统', null, '删除', '删除', 'student.Classes.delete', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('322', 'student.Classes', null, null, 'save', '保存', 'oa', 'OA办公系统', null, '保存', '保存', 'student.Classes.save', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('323', 'student.Classes', null, null, 'search', '查询', 'oa', 'OA办公系统', null, '查询', '查询', 'student.Classes.search', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('324', 'student.Classes', null, null, 'show', '查看', 'oa', 'OA办公系统', null, '查看', '查看', 'student.Classes.show', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('325', 'student.Classes', null, null, 'getClasseI', 'getClasseI', 'oa', 'OA办公系统', null, null, null, 'student.Classes.getClasseI', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('326', 'student.Classes', null, null, 'setClasseI', 'setClasseI', 'oa', 'OA办公系统', null, null, null, 'student.Classes.setClasseI', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('327', 'student.Classes', null, null, 'getClassList', '获取班级列表', 'oa', 'OA办公系统', null, '获取班级列表', '获取班级列表', 'student.Classes.getClassList', 'Classes', '319');
INSERT INTO `t_menu` VALUES ('328', null, null, '', null, null, 'live', '直播管理', '0', '直播管理系统', '直播管理系统', null, null, null);
INSERT INTO `t_menu` VALUES ('329', 'live.Lives', null, '', null, null, 'live', '直播管理', '0', '直播频道', '直播频道', null, 'LiveChannel', '328');
INSERT INTO `t_menu` VALUES ('330', 'live.Lives', null, null, 'update', '更新', 'live', '直播管理', null, '更新', '更新', 'live.Lives.update', 'LiveChannel', '329');
INSERT INTO `t_menu` VALUES ('331', 'live.Lives', null, null, 'delete', '删除', 'live', '直播管理', null, '删除', '删除', 'live.Lives.delete', 'LiveChannel', '329');
INSERT INTO `t_menu` VALUES ('332', 'live.Lives', null, null, 'save', '保存', 'live', '直播管理', null, '保存', '保存', 'live.Lives.save', 'LiveChannel', '329');
INSERT INTO `t_menu` VALUES ('333', 'live.Lives', null, null, 'search', '查询', 'live', '直播管理', null, '查询', '查询', 'live.Lives.search', 'LiveChannel', '329');
INSERT INTO `t_menu` VALUES ('334', 'live.Lives', null, null, 'show', '查看', 'live', '直播管理', null, '查看', '查看', 'live.Lives.show', 'LiveChannel', '329');
INSERT INTO `t_menu` VALUES ('335', 'live.Lives', null, '', null, null, 'live', '直播管理', '1', '直播', '直播', null, 'LiveStream', '328');
INSERT INTO `t_menu` VALUES ('336', 'live.Lives', null, null, 'update', '更新', 'live', '直播管理', null, '更新', '更新', 'live.Lives.update', 'LiveStream', '335');
INSERT INTO `t_menu` VALUES ('337', 'live.Lives', null, null, 'delete', '删除', 'live', '直播管理', null, '删除', '删除', 'live.Lives.delete', 'LiveStream', '335');
INSERT INTO `t_menu` VALUES ('338', 'live.Lives', null, null, 'save', '保存', 'live', '直播管理', null, '保存', '保存', 'live.Lives.save', 'LiveStream', '335');
INSERT INTO `t_menu` VALUES ('339', 'live.Lives', null, null, 'search', '查询', 'live', '直播管理', null, '查询', '查询', 'live.Lives.search', 'LiveStream', '335');
INSERT INTO `t_menu` VALUES ('340', 'live.Lives', null, null, 'show', '查看', 'live', '直播管理', null, '查看', '查看', 'live.Lives.show', 'LiveStream', '335');
INSERT INTO `t_menu` VALUES ('341', 'live.StreamingMediaServer', null, '', null, null, 'live', '直播管理', '2', '流媒体服务器配置', '流媒体服务器配置', null, 'StreamingMediaServer', '328');

-- ----------------------------
-- Table structure for `t_ordersdetails`
-- ----------------------------
DROP TABLE IF EXISTS `t_ordersdetails`;
CREATE TABLE `t_ordersdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) DEFAULT NULL,
  `charge` decimal(19,2) DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `ordersId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_no5y5c3vhw15p2nsmib897xe` (`curriculumId`),
  KEY `FK_a536tm9vws5hvji1efcirnbfb` (`ordersId`),
  CONSTRAINT `FK_a536tm9vws5hvji1efcirnbfb` FOREIGN KEY (`ordersId`) REFERENCES `t_ordersinfo` (`id`),
  CONSTRAINT `FK_no5y5c3vhw15p2nsmib897xe` FOREIGN KEY (`curriculumId`) REFERENCES `t_curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ordersdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ordersinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_ordersinfo`;
CREATE TABLE `t_ordersinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `customerId` bigint(20) DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `studentId` bigint(20) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ordersinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_paperquestions`
-- ----------------------------
DROP TABLE IF EXISTS `t_paperquestions`;
CREATE TABLE `t_paperquestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sjId` bigint(20) DEFAULT NULL,
  `tmId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paperquestions
-- ----------------------------

-- ----------------------------
-- Table structure for `t_questionslibinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_questionslibinfo`;
CREATE TABLE `t_questionslibinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `da` varchar(255) DEFAULT NULL,
  `da1` varchar(255) DEFAULT NULL,
  `da2` varchar(255) DEFAULT NULL,
  `da3` varchar(255) DEFAULT NULL,
  `da4` varchar(255) DEFAULT NULL,
  `da5` varchar(255) DEFAULT NULL,
  `da6` varchar(255) DEFAULT NULL,
  `tmlxId` bigint(20) DEFAULT NULL,
  `tmmc` varchar(255) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_questionslibinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_questionstype`
-- ----------------------------
DROP TABLE IF EXISTS `t_questionstype`;
CREATE TABLE `t_questionstype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `tmlx` varchar(255) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_questionstype
-- ----------------------------

-- ----------------------------
-- Table structure for `t_rechargerecord`
-- ----------------------------
DROP TABLE IF EXISTS `t_rechargerecord`;
CREATE TABLE `t_rechargerecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `credit` decimal(19,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currencyPrice` decimal(19,2) DEFAULT NULL,
  `eurAmount` decimal(19,2) DEFAULT NULL,
  `gbpAmount` decimal(19,2) DEFAULT NULL,
  `hkAmount` decimal(19,2) DEFAULT NULL,
  `rmbAmount` decimal(19,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `usdAmount` decimal(19,2) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rechargerecord
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resourcecomment`
-- ----------------------------
DROP TABLE IF EXISTS `t_resourcecomment`;
CREATE TABLE `t_resourcecomment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `res_id` bigint(20) DEFAULT NULL,
  `star` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resourcecomment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resourcelibrary`
-- ----------------------------
DROP TABLE IF EXISTS `t_resourcelibrary`;
CREATE TABLE `t_resourcelibrary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `res_cover` varchar(255) DEFAULT NULL,
  `res_name` varchar(255) DEFAULT NULL,
  `res_type` varchar(255) DEFAULT NULL,
  `res_typeName` varchar(255) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resourcelibrary
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creation_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '2018-09-15 13:06:58', null, '管理员', '管理员', null, '1', null, '2018-09-15 13:06:58');
INSERT INTO `t_role` VALUES ('2', 'teacher', '2018-09-15 13:06:58', null, '老师', '老师', null, '1', null, '2018-09-15 13:06:58');
INSERT INTO `t_role` VALUES ('3', 'student', '2018-09-15 13:06:58', null, '学生', '学生', null, '1', null, '2018-09-15 13:06:58');
INSERT INTO `t_role` VALUES ('4', 'customer', '2018-09-15 13:06:58', null, '会员', '会员', null, '1', null, '2018-09-15 13:06:58');
INSERT INTO `t_role` VALUES ('5', 'guest', '2018-09-15 13:06:58', null, '来宾访客', '来宾访客', null, '1', null, '2018-09-15 13:06:58');

-- ----------------------------
-- Table structure for `t_role_resources`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resources`;
CREATE TABLE `t_role_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resourcesId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `t_school`
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
-- Records of t_school
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shoppingcart`;
CREATE TABLE `t_shoppingcart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shoppinginfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_shoppinginfo`;
CREATE TABLE `t_shoppinginfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) DEFAULT NULL,
  `charge` decimal(19,2) DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `curriculumId` bigint(20) DEFAULT NULL,
  `cartId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_73eq8wyd7jx1pv5vjh7gygnd4` (`curriculumId`),
  KEY `FK_ekl6v4my4jxfy16rbionpwset` (`cartId`),
  CONSTRAINT `FK_73eq8wyd7jx1pv5vjh7gygnd4` FOREIGN KEY (`curriculumId`) REFERENCES `t_curriculum` (`id`),
  CONSTRAINT `FK_ekl6v4my4jxfy16rbionpwset` FOREIGN KEY (`cartId`) REFERENCES `t_shoppingcart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoppinginfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_skydrivepersonal`
-- ----------------------------
DROP TABLE IF EXISTS `t_skydrivepersonal`;
CREATE TABLE `t_skydrivepersonal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_skydrivepersonal
-- ----------------------------

-- ----------------------------
-- Table structure for `t_skydrivepublic`
-- ----------------------------
DROP TABLE IF EXISTS `t_skydrivepublic`;
CREATE TABLE `t_skydrivepublic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_skydrivepublic
-- ----------------------------

-- ----------------------------
-- Table structure for `t_streamingmediaserver`
-- ----------------------------
DROP TABLE IF EXISTS `t_streamingmediaserver`;
CREATE TABLE `t_streamingmediaserver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createAuthor` varchar(255) DEFAULT NULL,
  `createDatetime` datetime DEFAULT NULL,
  `domainName` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `serviceType` varchar(255) DEFAULT NULL,
  `updateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_streamingmediaserver
-- ----------------------------

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` bigint(20) NOT NULL,
  `activateCode` varchar(255) DEFAULT NULL,
  `bh` varchar(255) DEFAULT NULL,
  `bjId` bigint(20) DEFAULT NULL,
  `csdm` varchar(255) DEFAULT NULL,
  `csrq` varchar(255) DEFAULT NULL,
  `cym` varchar(255) DEFAULT NULL,
  `dszgh` varchar(255) DEFAULT NULL,
  `dzxx` varchar(255) DEFAULT NULL,
  `gatqm` varchar(255) DEFAULT NULL,
  `gbm` varchar(255) DEFAULT NULL,
  `hdxlfsm` varchar(255) DEFAULT NULL,
  `hkszd` varchar(255) DEFAULT NULL,
  `hkxzm` varchar(255) DEFAULT NULL,
  `hyzkm` varchar(255) DEFAULT NULL,
  `jgm` varchar(255) DEFAULT NULL,
  `jkzkm` varchar(255) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `lxdh` varchar(255) DEFAULT NULL,
  `mzm` varchar(255) DEFAULT NULL,
  `nj` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `pyfsm` varchar(255) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `rxny` varchar(255) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `sfzh` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tc` varchar(255) DEFAULT NULL,
  `txdz` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `xbm` varchar(255) DEFAULT NULL,
  `xfzxszk` varchar(255) DEFAULT NULL,
  `xh` varchar(255) DEFAULT NULL,
  `xm` varchar(255) DEFAULT NULL,
  `xmpy` varchar(255) DEFAULT NULL,
  `xslbm` varchar(255) DEFAULT NULL,
  `xxm` varchar(255) DEFAULT NULL,
  `xz` int(11) DEFAULT NULL,
  `xzz` varchar(255) DEFAULT NULL,
  `yjfxm` varchar(255) DEFAULT NULL,
  `yxsm` varchar(255) DEFAULT NULL,
  `yzbm` varchar(255) DEFAULT NULL,
  `zjxy` varchar(255) DEFAULT NULL,
  `zydz` varchar(255) DEFAULT NULL,
  `zyh` varchar(255) DEFAULT NULL,
  `zyklm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'student', null, null, null, 'c3R1ZGVudA==', null, '2018-09-15 13:03:31', null, null, null, '1', null, null, null, null, null, null, '学生', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_student` VALUES ('12', null, null, null, null, null, null, null, '360216530@qq.com', null, null, null, null, null, null, null, null, null, null, '15986693609', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '何老师', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_studentpaperanswer`
-- ----------------------------
DROP TABLE IF EXISTS `t_studentpaperanswer`;
CREATE TABLE `t_studentpaperanswer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `da` varchar(255) DEFAULT NULL,
  `sjId` bigint(20) DEFAULT NULL,
  `tmId` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_studentpaperanswer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` bigint(20) NOT NULL,
  `activateCode` varchar(255) DEFAULT NULL,
  `brcfm` varchar(255) DEFAULT NULL,
  `bzlbm` varchar(255) DEFAULT NULL,
  `cjgzny` varchar(255) DEFAULT NULL,
  `cjny` varchar(255) DEFAULT NULL,
  `collegeDepartmentId` bigint(20) DEFAULT NULL,
  `csdm` varchar(255) DEFAULT NULL,
  `csrq` varchar(255) DEFAULT NULL,
  `cym` varchar(255) DEFAULT NULL,
  `dabh` varchar(255) DEFAULT NULL,
  `dzxx` varchar(255) DEFAULT NULL,
  `gatqm` varchar(255) DEFAULT NULL,
  `hkszd` varchar(255) DEFAULT NULL,
  `hkxzm` varchar(255) DEFAULT NULL,
  `hyzkm` varchar(255) DEFAULT NULL,
  `jgm` varchar(255) DEFAULT NULL,
  `jkzkm` varchar(255) DEFAULT NULL,
  `jtcsm` varchar(255) DEFAULT NULL,
  `jtzz` varchar(255) DEFAULT NULL,
  `jzglbm` varchar(255) DEFAULT NULL,
  `ksId` bigint(20) DEFAULT NULL,
  `ksh` varchar(255) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `lxdh` varchar(255) DEFAULT NULL,
  `lxny` varchar(255) DEFAULT NULL,
  `majorId` bigint(20) DEFAULT NULL,
  `mzm` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `rkzkm` varchar(255) DEFAULT NULL,
  `schoolId` bigint(20) DEFAULT NULL,
  `sfzh` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `txdz` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `whcdm` varchar(255) DEFAULT NULL,
  `xbm` varchar(255) DEFAULT NULL,
  `xm` varchar(255) DEFAULT NULL,
  `xmpy` varchar(255) DEFAULT NULL,
  `xxm` varchar(255) DEFAULT NULL,
  `xzz` varchar(255) DEFAULT NULL,
  `yxsh` varchar(255) DEFAULT NULL,
  `yzbm` varchar(255) DEFAULT NULL,
  `zgh` varchar(255) DEFAULT NULL,
  `zjxy` varchar(255) DEFAULT NULL,
  `zp` bit(1) DEFAULT NULL,
  `zydz` varchar(255) DEFAULT NULL,
  `zyh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin', null, null, null, null, 'YWRtaW4=', '2018-09-15 13:03:31', null, null, null, '1', null, null, null, null, '管理员', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_teacher` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'teacher', null, null, null, null, 'dGVhY2hlcg==', '2018-09-15 13:03:31', null, null, null, '1', null, null, null, null, '老师', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activateCode` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `rmb` decimal(19,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `usd` decimal(19,2) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', null, null, null, 'guest', 'Z3Vlc3Q=', null, '2018-09-15 13:03:31', null, '1', null, '来宾', null, null);
INSERT INTO `t_user` VALUES ('12', '715836', '360216530@qq.com', '2018-09-19 22:06:31', 'admin123', 'MTIzNDU2Nzg=', '15986693609', '2018-09-15 13:08:45', null, '0', null, '何老师', 'student', 'MjAxODA5MTUxMzA4NDUyMTE2Mjc=');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '2');
INSERT INTO `t_user_role` VALUES ('2', '2', '3');
INSERT INTO `t_user_role` VALUES ('3', '3', '4');
INSERT INTO `t_user_role` VALUES ('4', '4', '5');
INSERT INTO `t_user_role` VALUES ('5', '5', '6');
INSERT INTO `t_user_role` VALUES ('6', '1', '7');
INSERT INTO `t_user_role` VALUES ('7', '2', '8');
INSERT INTO `t_user_role` VALUES ('8', '3', '9');
INSERT INTO `t_user_role` VALUES ('9', '4', '10');
INSERT INTO `t_user_role` VALUES ('10', '5', '11');
INSERT INTO `t_user_role` VALUES ('11', '3', '12');
