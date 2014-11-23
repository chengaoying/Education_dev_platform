/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : edu_hipi

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2014-11-23 13:11:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE `t_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '栏目名称',
  `chKey` varchar(20) NOT NULL COMMENT '栏目关键字',
  `imgUrl` varchar(200) DEFAULT NULL COMMENT '栏目导航图片',
  `linkUrl` varchar(100) NOT NULL COMMENT '栏目链接地址',
  `isShow` tinyint(1) DEFAULT '0' COMMENT '是否在首页导航中显示',
  `description` varchar(50) DEFAULT NULL COMMENT '栏目描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '栏目排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pId` (`pId`),
  KEY `chKey` (`chKey`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='栏目';

-- ----------------------------
-- Records of t_channel
-- ----------------------------
INSERT INTO `t_channel` VALUES ('1', '0', '精彩推荐', 'recommend', '', '', '1', '', '0', '1', '0000-00-00 00:00:00');
INSERT INTO `t_channel` VALUES ('12', '0', '全部课程', 'allcourse', '', '', '1', '', '0', '1', '2014-11-19 14:00:11');
INSERT INTO `t_channel` VALUES ('13', '0', '我的课程', 'mycourse', '', '', '1', '', '0', '1', '2014-11-19 14:00:43');
INSERT INTO `t_channel` VALUES ('17', '0', '用户中心', 'usercenter', '', '', '0', '', '0', '1', '2014-11-19 18:16:23');
INSERT INTO `t_channel` VALUES ('18', '12', '早教', 'early', '', '', '0', '', '0', '1', '2014-11-22 09:36:57');
INSERT INTO `t_channel` VALUES ('19', '12', '幼教', 'preschool', '', '', '0', '', '0', '1', '2014-11-22 09:37:40');
INSERT INTO `t_channel` VALUES ('20', '12', '小学', 'primaryschool', '', '', '0', '', '0', '1', '2014-11-22 09:38:54');
INSERT INTO `t_channel` VALUES ('21', '12', '中学', 'middleschool', '', '', '0', '', '0', '1', '2014-11-22 09:39:08');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chId` int(11) NOT NULL COMMENT '栏目ID',
  `stageId` int(11) DEFAULT NULL COMMENT '龄段ID',
  `pressId` int(11) DEFAULT NULL COMMENT '出版社ID',
  `name` varchar(20) NOT NULL COMMENT '课程名称',
  `volume` tinyint(1) DEFAULT NULL COMMENT '0-上册，1-下册',
  `typeId` int(11) DEFAULT NULL COMMENT '类型(基础/拓展)ID',
  `price` float(3,2) NOT NULL DEFAULT '0.00',
  `midLibId` int(11) DEFAULT NULL COMMENT '期中考试题库ID',
  `finalLibId` int(11) DEFAULT NULL COMMENT '期末考试题库ID',
  `topicIds` varchar(50) NOT NULL COMMENT '知识点id(多个用逗号分隔)',
  `keys` varchar(50) DEFAULT NULL COMMENT '关键字(多个关键字用逗号分隔)',
  `imgUrl` varchar(200) DEFAULT NULL COMMENT '课程导航图片',
  `linkUrl` varchar(100) DEFAULT NULL COMMENT '课程链接地址',
  `description` varchar(50) DEFAULT NULL COMMENT '课程描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '课程排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chId` (`chId`),
  KEY `pressId` (`pressId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of t_course
-- ----------------------------

-- ----------------------------
-- Table structure for t_library
-- ----------------------------
DROP TABLE IF EXISTS `t_library`;
CREATE TABLE `t_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '题库标题',
  `courseId` int(11) DEFAULT NULL COMMENT '课程ID',
  `sectionId` int(11) DEFAULT NULL COMMENT '课时ID',
  `rpId` int(11) DEFAULT NULL COMMENT '所属于资源商ID',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `auth` tinyint(1) DEFAULT NULL COMMENT '题库权限',
  `libUrl` varchar(50) NOT NULL COMMENT '题库路径',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '题库导航图片',
  `description` varchar(50) DEFAULT NULL COMMENT '题库描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '题库排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseId` (`courseId`),
  KEY `sectionId` (`sectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库';

-- ----------------------------
-- Records of t_library
-- ----------------------------

-- ----------------------------
-- Table structure for t_pro_config
-- ----------------------------
DROP TABLE IF EXISTS `t_pro_config`;
CREATE TABLE `t_pro_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `cKey` varchar(20) NOT NULL COMMENT '配置关键字',
  `templete` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT '配置文本内容',
  `addTime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `cKey` (`cKey`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pro_config
-- ----------------------------
INSERT INTO `t_pro_config` VALUES ('16', '产品配置', 'p*config', 'p_config.php', 'a:5:{s:12:\"channelThumb\";s:23:\"s=100*200<br/>m=200*300\";s:10:\"courseType\";a:2:{i:1;s:6:\"基础\";i:2;s:6:\"拓展\";}s:4:\"keys\";a:3:{i:1;s:6:\"热门\";i:2;s:6:\"推荐\";i:3;s:6:\"置顶\";}s:2:\"rp\";a:1:{i:1001;s:9:\"掌世界\";}s:5:\"press\";a:1:{i:2001;s:15:\"某某出版社\";}}', '2014-11-20 15:40:58');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '视频标题',
  `sectionId` int(11) DEFAULT NULL COMMENT '课时ID',
  `content` varchar(50) NOT NULL COMMENT '视频流code',
  `rpId` int(11) NOT NULL COMMENT '所属于资源商ID',
  `outId` int(11) NOT NULL COMMENT '外部统一编号',
  `playAuth` tinyint(1) DEFAULT NULL COMMENT '播放权限',
  `keyList` varchar(50) DEFAULT NULL COMMENT '关键字列表',
  `price` int(11) DEFAULT NULL COMMENT '单播价格',
  `libUrl` varchar(50) NOT NULL COMMENT '资源路径',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '资源导航图片',
  `playCount` int(11) DEFAULT NULL COMMENT '播放次数',
  `praiseCount` int(11) DEFAULT NULL COMMENT '点赞次数',
  `favorCount` int(11) DEFAULT NULL COMMENT '收藏次数',
  `description` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '资源排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sectionId` (`sectionId`),
  KEY `content` (`content`),
  KEY `keyList` (`keyList`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of t_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_resource_provider
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_provider`;
CREATE TABLE `t_resource_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `number` int(11) NOT NULL COMMENT '编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源提供商表';

-- ----------------------------
-- Records of t_resource_provider
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `sex` tinyint(1) DEFAULT NULL COMMENT '用户性别',
  `stageId` int(11) DEFAULT NULL COMMENT '龄段ID',
  `nickName` varchar(20) DEFAULT NULL COMMENT '角色昵称',
  `interests` varchar(50) DEFAULT NULL COMMENT '兴趣爱好',
  `advantage` varchar(50) DEFAULT NULL COMMENT '强项',
  `disAdvantage` varchar(50) DEFAULT NULL COMMENT '弱项',
  `level` int(11) DEFAULT '0' COMMENT '荣誉等级',
  `point` int(11) DEFAULT '0' COMMENT '积分',
  `face` tinyint(2) DEFAULT '0' COMMENT '头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `stageId` (`stageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_browse
-- ----------------------------
DROP TABLE IF EXISTS `t_role_browse`;
CREATE TABLE `t_role_browse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `title` varchar(50) NOT NULL COMMENT '浏览内容标题',
  `url` varchar(100) NOT NULL COMMENT '收藏地址',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '图片地址',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色收藏记录表';

-- ----------------------------
-- Records of t_role_browse
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_favor
-- ----------------------------
DROP TABLE IF EXISTS `t_role_favor`;
CREATE TABLE `t_role_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `title` varchar(50) DEFAULT NULL COMMENT '收藏标题',
  `url` varchar(100) NOT NULL COMMENT '收藏地址',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '图片地址',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色收藏记录表';

-- ----------------------------
-- Records of t_role_favor
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_library
-- ----------------------------
DROP TABLE IF EXISTS `t_role_library`;
CREATE TABLE `t_role_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `libId` int(11) NOT NULL COMMENT '题库id',
  `libName` varchar(50) DEFAULT NULL COMMENT '题库id',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `libId` (`libId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色做题库记录表';

-- ----------------------------
-- Records of t_role_library
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `videoId` int(11) NOT NULL COMMENT '视频id',
  `videoName` varchar(50) DEFAULT NULL COMMENT '视频名称',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `videoId` (`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色观看视频记录表';

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_section
-- ----------------------------
DROP TABLE IF EXISTS `t_section`;
CREATE TABLE `t_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topicId` int(11) NOT NULL COMMENT '知识点ID',
  `name` varchar(20) NOT NULL COMMENT '课时名称',
  `libId` int(11) DEFAULT NULL COMMENT '题库ID',
  `previewList` varchar(20) DEFAULT NULL COMMENT '预习视频id(多个用逗号分隔)',
  `lessonList` varchar(20) DEFAULT NULL COMMENT '正文视频id(多个用逗号分隔)',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '课时导航图片',
  `description` varchar(50) DEFAULT NULL COMMENT '课时描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '课时排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topicId` (`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点';

-- ----------------------------
-- Records of t_section
-- ----------------------------

-- ----------------------------
-- Table structure for t_stage
-- ----------------------------
DROP TABLE IF EXISTS `t_stage`;
CREATE TABLE `t_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `sKey` varchar(20) NOT NULL COMMENT '龄段key',
  `chId` int(11) NOT NULL COMMENT '所属一级分类ID（全部课程下的子栏目）',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sKey` (`sKey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色龄段表';

-- ----------------------------
-- Records of t_stage
-- ----------------------------
INSERT INTO `t_stage` VALUES ('2', '一年级', 'gradeOne', '20', '0', '1', '2014-11-23 11:35:10');

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员',
  `controller` varchar(25) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(25) NOT NULL DEFAULT '' COMMENT '操作',
  `data` text COMMENT '操作数据',
  `addTime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`addTime`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES ('1', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416102748');
INSERT INTO `t_sys_log` VALUES ('2', 'admin', 'SysUser', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:6:\"status\";s:1:\"1\";s:6:\"roleId\";s:1:\"1\";s:8:\"realName\";s:4:\"test\";}}', '1416105081');
INSERT INTO `t_sys_log` VALUES ('3', 'admin', 'SysUser', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:5:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:4:\"test\";s:6:\"status\";s:1:\"0\";s:6:\"roleId\";s:1:\"1\";s:8:\"realName\";s:4:\"test\";}}', '1416105112');
INSERT INTO `t_sys_log` VALUES ('4', 'admin', 'SysUser', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1416105117');
INSERT INTO `t_sys_log` VALUES ('5', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:7:\"isSuper\";s:1:\"0\";s:4:\"auth\";a:1:{s:3:\"nav\";a:3:{s:13:\"SysRole_index\";s:1:\"1\";s:13:\"SysUser_index\";s:1:\"1\";s:12:\"SysLog_index\";s:1:\"1\";}}}}', '1416105137');
INSERT INTO `t_sys_log` VALUES ('6', 'admin', 'SysUser', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"ff\";s:6:\"status\";s:1:\"1\";s:6:\"roleId\";s:1:\"2\";s:8:\"realName\";s:2:\"ff\";}}', '1416105153');
INSERT INTO `t_sys_log` VALUES ('7', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:2:\"ff\";}}', '1416105158');
INSERT INTO `t_sys_log` VALUES ('8', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416105173');
INSERT INTO `t_sys_log` VALUES ('9', 'admin', 'SysUser', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1416105179');
INSERT INTO `t_sys_log` VALUES ('10', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1416105184');
INSERT INTO `t_sys_log` VALUES ('11', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1416105189');
INSERT INTO `t_sys_log` VALUES ('12', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"d\";s:7:\"isSuper\";s:1:\"0\";}}', '1416105201');
INSERT INTO `t_sys_log` VALUES ('13', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1416105205');
INSERT INTO `t_sys_log` VALUES ('14', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1416105213');
INSERT INTO `t_sys_log` VALUES ('15', 'admin', 'SysUser', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"d\";s:6:\"status\";s:1:\"1\";s:6:\"roleId\";s:1:\"1\";s:8:\"realName\";s:0:\"\";}}', '1416105229');
INSERT INTO `t_sys_log` VALUES ('16', 'admin', 'SysUser', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"4\";}}', '1416105233');
INSERT INTO `t_sys_log` VALUES ('17', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:7:\"isSuper\";s:1:\"0\";}}', '1416105821');
INSERT INTO `t_sys_log` VALUES ('18', 'admin', 'SysUser', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"dd\";s:6:\"status\";s:1:\"1\";s:6:\"roleId\";s:1:\"4\";s:8:\"realName\";s:0:\"\";}}', '1416105837');
INSERT INTO `t_sys_log` VALUES ('19', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"4\";}}', '1416105849');
INSERT INTO `t_sys_log` VALUES ('20', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"dds\";s:7:\"isSuper\";s:1:\"0\";}}', '1416105902');
INSERT INTO `t_sys_log` VALUES ('21', 'admin', 'SysUser', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"5\";}}', '1416105929');
INSERT INTO `t_sys_log` VALUES ('22', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"SysRole\";}}', '1416106263');
INSERT INTO `t_sys_log` VALUES ('23', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"x\";s:7:\"isSuper\";s:1:\"0\";}}', '1416106271');
INSERT INTO `t_sys_log` VALUES ('24', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"6\";}}', '1416106276');
INSERT INTO `t_sys_log` VALUES ('25', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"1\";s:7:\"isSuper\";s:1:\"0\";}}', '1416106531');
INSERT INTO `t_sys_log` VALUES ('26', 'admin', 'SysUser', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"2\";s:6:\"status\";s:1:\"1\";s:6:\"roleId\";s:1:\"1\";s:8:\"realName\";s:0:\"\";}}', '1416107280');
INSERT INTO `t_sys_log` VALUES ('27', 'admin', 'SysUser', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"2\";s:6:\"status\";s:1:\"1\";s:6:\"roleId\";s:1:\"1\";s:8:\"realName\";s:0:\"\";}}', '1416107284');
INSERT INTO `t_sys_log` VALUES ('28', 'admin', 'SysRole', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:3:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"超级管理组\";s:7:\"isSuper\";s:1:\"1\";}}', '1416107380');
INSERT INTO `t_sys_log` VALUES ('29', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"r\";s:7:\"isSuper\";s:1:\"0\";}}', '1416107386');
INSERT INTO `t_sys_log` VALUES ('30', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"8\";}}', '1416107407');
INSERT INTO `t_sys_log` VALUES ('31', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"dds\";s:7:\"isSuper\";s:1:\"0\";}}', '1416107895');
INSERT INTO `t_sys_log` VALUES ('32', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"9\";}}', '1416107899');
INSERT INTO `t_sys_log` VALUES ('33', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"21\";s:7:\"isSuper\";s:1:\"0\";}}', '1416107960');
INSERT INTO `t_sys_log` VALUES ('34', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"SysRole\";}}', '1416108450');
INSERT INTO `t_sys_log` VALUES ('35', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"SysRole\";}}', '1416108472');
INSERT INTO `t_sys_log` VALUES ('36', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"SysRole\";}}', '1416108724');
INSERT INTO `t_sys_log` VALUES ('37', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"12\";}}', '1416108744');
INSERT INTO `t_sys_log` VALUES ('38', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1416108761');
INSERT INTO `t_sys_log` VALUES ('39', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1416108835');
INSERT INTO `t_sys_log` VALUES ('40', 'admin', 'Upfile', 'count', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}', '1416109030');
INSERT INTO `t_sys_log` VALUES ('41', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416189318');
INSERT INTO `t_sys_log` VALUES ('42', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416189320');
INSERT INTO `t_sys_log` VALUES ('43', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416189327');
INSERT INTO `t_sys_log` VALUES ('44', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416189680');
INSERT INTO `t_sys_log` VALUES ('45', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416189699');
INSERT INTO `t_sys_log` VALUES ('46', 'admin', 'SysLog', 'clear', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"42\";}}', '1416192822');
INSERT INTO `t_sys_log` VALUES ('47', 'admin', 'SysLog', 'clear', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"43\";}}', '1416192930');
INSERT INTO `t_sys_log` VALUES ('48', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416202999');
INSERT INTO `t_sys_log` VALUES ('49', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"SysRole\";}}', '1416205340');
INSERT INTO `t_sys_log` VALUES ('50', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416212566');
INSERT INTO `t_sys_log` VALUES ('51', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416216365');
INSERT INTO `t_sys_log` VALUES ('52', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218041');
INSERT INTO `t_sys_log` VALUES ('53', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:25:\"栏目导航图片：test\";}}', '1416218197');
INSERT INTO `t_sys_log` VALUES ('54', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218255');
INSERT INTO `t_sys_log` VALUES ('55', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218257');
INSERT INTO `t_sys_log` VALUES ('56', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218257');
INSERT INTO `t_sys_log` VALUES ('57', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218258');
INSERT INTO `t_sys_log` VALUES ('58', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218259');
INSERT INTO `t_sys_log` VALUES ('59', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218260');
INSERT INTO `t_sys_log` VALUES ('60', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1416218274');
INSERT INTO `t_sys_log` VALUES ('61', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1416218278');
INSERT INTO `t_sys_log` VALUES ('62', 'admin', 'SysRole', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"d\";s:7:\"isSuper\";s:1:\"0\";}}', '1416218798');
INSERT INTO `t_sys_log` VALUES ('63', 'admin', 'SysRole', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:3:{s:2:\"id\";s:2:\"14\";s:4:\"name\";s:1:\"d\";s:7:\"isSuper\";s:1:\"0\";}}', '1416218803');
INSERT INTO `t_sys_log` VALUES ('64', 'admin', 'SysRole', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"14\";}}', '1416218961');
INSERT INTO `t_sys_log` VALUES ('65', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218968');
INSERT INTO `t_sys_log` VALUES ('66', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416218971');
INSERT INTO `t_sys_log` VALUES ('67', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416219007');
INSERT INTO `t_sys_log` VALUES ('68', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416219008');
INSERT INTO `t_sys_log` VALUES ('69', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"8\";}}', '1416219015');
INSERT INTO `t_sys_log` VALUES ('70', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"9\";}}', '1416219018');
INSERT INTO `t_sys_log` VALUES ('71', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:8:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416219436');
INSERT INTO `t_sys_log` VALUES ('72', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:5:\"title\";s:4:\"test\";s:2:\"id\";s:1:\"1\";s:5:\"chKey\";s:4:\"test\";s:9:\"navImgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"info\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416219497');
INSERT INTO `t_sys_log` VALUES ('73', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:2:\"id\";s:1:\"1\";s:5:\"chKey\";s:4:\"test\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416219548');
INSERT INTO `t_sys_log` VALUES ('74', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416275622');
INSERT INTO `t_sys_log` VALUES ('75', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:5:\"chKey\";s:4:\"test\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275636');
INSERT INTO `t_sys_log` VALUES ('76', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"tests\";s:5:\"chKey\";s:4:\"test\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275649');
INSERT INTO `t_sys_log` VALUES ('77', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"tests\";s:5:\"chKey\";s:4:\"test\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275807');
INSERT INTO `t_sys_log` VALUES ('78', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"tests\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275811');
INSERT INTO `t_sys_log` VALUES ('79', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"tests\";s:5:\"chKey\";s:4:\"test\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275820');
INSERT INTO `t_sys_log` VALUES ('80', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"tests\";s:5:\"chKey\";s:4:\"test\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275821');
INSERT INTO `t_sys_log` VALUES ('81', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"tests\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416275827');
INSERT INTO `t_sys_log` VALUES ('82', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416276555');
INSERT INTO `t_sys_log` VALUES ('83', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416276639');
INSERT INTO `t_sys_log` VALUES ('84', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416276648');
INSERT INTO `t_sys_log` VALUES ('85', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416276908');
INSERT INTO `t_sys_log` VALUES ('86', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"s\";s:5:\"chKey\";s:1:\"s\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1416277147');
INSERT INTO `t_sys_log` VALUES ('87', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"s\";s:5:\"chKey\";s:1:\"s\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1416277157');
INSERT INTO `t_sys_log` VALUES ('88', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"s\";s:5:\"chKey\";s:1:\"s\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1416277238');
INSERT INTO `t_sys_log` VALUES ('89', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"10\";}s:4:\"post\";a:10:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:2:\"10\";s:4:\"name\";s:1:\"s\";s:5:\"chKey\";s:1:\"s\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1416277250');
INSERT INTO `t_sys_log` VALUES ('90', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"10\";}s:4:\"post\";a:9:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:2:\"10\";s:4:\"name\";s:1:\"s\";s:5:\"chKey\";s:1:\"s\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1416278371');
INSERT INTO `t_sys_log` VALUES ('91', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"10\";}s:4:\"post\";a:9:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:2:\"10\";s:4:\"name\";s:1:\"s\";s:5:\"chKey\";s:1:\"s\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1416278404');
INSERT INTO `t_sys_log` VALUES ('92', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:9:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"ds\";s:5:\"chKey\";s:2:\"ss\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416280965');
INSERT INTO `t_sys_log` VALUES ('93', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416283253');
INSERT INTO `t_sys_log` VALUES ('94', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"10\";}}', '1416290889');
INSERT INTO `t_sys_log` VALUES ('95', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416292441');
INSERT INTO `t_sys_log` VALUES ('96', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:19:\"c/546ae8592a6fe.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416292455');
INSERT INTO `t_sys_log` VALUES ('97', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416292569');
INSERT INTO `t_sys_log` VALUES ('98', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:61:\"c/546ae8592a6fe.png\r\n8/546ae8d9853ea.png\r\n0/546ae8d985b88.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416292576');
INSERT INTO `t_sys_log` VALUES ('99', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:21:\"c/546ae8592a6fe.png\r\n\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416292756');
INSERT INTO `t_sys_log` VALUES ('100', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:19:\"c/546ae8592a6fe.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416292764');
INSERT INTO `t_sys_log` VALUES ('101', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416292899');
INSERT INTO `t_sys_log` VALUES ('102', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416293875');
INSERT INTO `t_sys_log` VALUES ('103', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416293912');
INSERT INTO `t_sys_log` VALUES ('104', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:43:\"c/546ae8592a6fe.png\r\ntest/546aee181abdf.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416293922');
INSERT INTO `t_sys_log` VALUES ('105', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416294670');
INSERT INTO `t_sys_log` VALUES ('106', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416294691');
INSERT INTO `t_sys_log` VALUES ('107', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:22:\"test/546af123866cf.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416294694');
INSERT INTO `t_sys_log` VALUES ('108', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:23:\"栏目导航图片：ds\";}}', '1416299286');
INSERT INTO `t_sys_log` VALUES ('109', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:23:\"栏目导航图片：ds\";}}', '1416299363');
INSERT INTO `t_sys_log` VALUES ('110', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:1:{s:8:\"fileType\";s:1:\"1\";}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:1:\"d\";}}', '1416299441');
INSERT INTO `t_sys_log` VALUES ('111', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416299484');
INSERT INTO `t_sys_log` VALUES ('112', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416299606');
INSERT INTO `t_sys_log` VALUES ('113', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416299620');
INSERT INTO `t_sys_log` VALUES ('114', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:1:{s:8:\"fileType\";s:1:\"1\";}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:1:\"d\";}}', '1416299695');
INSERT INTO `t_sys_log` VALUES ('115', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:23:\"栏目导航图片：ds\";}}', '1416299786');
INSERT INTO `t_sys_log` VALUES ('116', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"11\";}s:4:\"post\";a:9:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:2:\"11\";s:4:\"name\";s:2:\"ds\";s:5:\"chKey\";s:2:\"ss\";s:6:\"imgUrl\";s:22:\"test/546b050a46e26.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416299789');
INSERT INTO `t_sys_log` VALUES ('117', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416300235');
INSERT INTO `t_sys_log` VALUES ('118', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:2:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:0:\"\";}}', '1416300387');
INSERT INTO `t_sys_log` VALUES ('119', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:2:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:0:\"\";}}', '1416300740');
INSERT INTO `t_sys_log` VALUES ('120', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416300787');
INSERT INTO `t_sys_log` VALUES ('121', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:22:\"test/546b08f33b1d9.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416300789');
INSERT INTO `t_sys_log` VALUES ('122', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2583\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b08f33b1d9.png\";s:2:\"id\";s:4:\"2583\";s:7:\"delFile\";s:2:\"on\";}}', '1416302929');
INSERT INTO `t_sys_log` VALUES ('123', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2583\";}s:4:\"post\";a:2:{s:3:\"url\";s:22:\"test/546b08f33b1d9.png\";s:2:\"id\";s:4:\"2583\";}}', '1416302934');
INSERT INTO `t_sys_log` VALUES ('124', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2582\";}s:4:\"post\";a:2:{s:3:\"url\";s:22:\"test/546b08c4afa11.png\";s:2:\"id\";s:4:\"2582\";}}', '1416302939');
INSERT INTO `t_sys_log` VALUES ('125', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2581\";}s:4:\"post\";a:2:{s:3:\"url\";s:22:\"test/546b050a46e26.png\";s:2:\"id\";s:4:\"2581\";}}', '1416302943');
INSERT INTO `t_sys_log` VALUES ('126', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2580\";}s:4:\"post\";a:2:{s:3:\"url\";s:22:\"test/546b04b008515.png\";s:2:\"id\";s:4:\"2580\";}}', '1416302947');
INSERT INTO `t_sys_log` VALUES ('127', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416302964');
INSERT INTO `t_sys_log` VALUES ('128', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:22:\"test/546b117463b06.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416302966');
INSERT INTO `t_sys_log` VALUES ('129', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"11\";}s:4:\"post\";a:9:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:2:\"11\";s:4:\"name\";s:2:\"ds\";s:5:\"chKey\";s:2:\"ss\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416302971');
INSERT INTO `t_sys_log` VALUES ('130', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2584\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b117463b06.png\";s:2:\"id\";s:4:\"2584\";s:7:\"delFile\";s:2:\"on\";}}', '1416302991');
INSERT INTO `t_sys_log` VALUES ('131', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416303223');
INSERT INTO `t_sys_log` VALUES ('132', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:22:\"test/546b12779c507.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416303229');
INSERT INTO `t_sys_log` VALUES ('133', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2585\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b12779c507.png\";s:2:\"id\";s:4:\"2585\";s:7:\"delFile\";s:2:\"on\";}}', '1416303314');
INSERT INTO `t_sys_log` VALUES ('134', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2585\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b12779c507.png\";s:2:\"id\";s:4:\"2585\";s:7:\"delFile\";s:2:\"on\";}}', '1416303349');
INSERT INTO `t_sys_log` VALUES ('135', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2585\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b12779c507.png\";s:2:\"id\";s:4:\"2585\";s:7:\"delFile\";s:2:\"on\";}}', '1416303354');
INSERT INTO `t_sys_log` VALUES ('136', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416303369');
INSERT INTO `t_sys_log` VALUES ('137', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:22:\"test/546b130992472.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416303371');
INSERT INTO `t_sys_log` VALUES ('138', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2586\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b130992472.png\";s:2:\"id\";s:4:\"2586\";s:7:\"delFile\";s:2:\"on\";}}', '1416303387');
INSERT INTO `t_sys_log` VALUES ('139', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416304289');
INSERT INTO `t_sys_log` VALUES ('140', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:22:\"test/546b16a1dc17a.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416304295');
INSERT INTO `t_sys_log` VALUES ('141', 'admin', 'Upfile', 'del', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:4:\"2587\";}s:4:\"post\";a:3:{s:3:\"url\";s:22:\"test/546b16a1dc17a.png\";s:2:\"id\";s:4:\"2587\";s:7:\"delFile\";s:2:\"on\";}}', '1416304304');
INSERT INTO `t_sys_log` VALUES ('142', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:19:\"s=100*200,m=200*300\";s:4:\"memo\";s:27:\"栏目导航图片：testss\";}}', '1416305518');
INSERT INTO `t_sys_log` VALUES ('143', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:6:\"testss\";s:5:\"chKey\";s:5:\"testd\";s:6:\"imgUrl\";s:19:\"c/546b1b6e7a5d7.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416305520');
INSERT INTO `t_sys_log` VALUES ('144', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:23:\"栏目导航图片：ds\";}}', '1416305580');
INSERT INTO `t_sys_log` VALUES ('145', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"11\";}s:4:\"post\";a:9:{s:3:\"pId\";s:1:\"1\";s:2:\"id\";s:2:\"11\";s:4:\"name\";s:2:\"ds\";s:5:\"chKey\";s:2:\"ss\";s:6:\"imgUrl\";s:19:\"0/546b1bac6f261.png\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416305582');
INSERT INTO `t_sys_log` VALUES ('146', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416375615');
INSERT INTO `t_sys_log` VALUES ('147', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:12:\"精彩推荐\";s:5:\"chKey\";s:9:\"recommend\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416376764');
INSERT INTO `t_sys_log` VALUES ('148', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"11\";}}', '1416376781');
INSERT INTO `t_sys_log` VALUES ('149', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"全部课程\";s:5:\"chKey\";s:3:\"all\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416376811');
INSERT INTO `t_sys_log` VALUES ('150', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"我的课程\";s:5:\"chKey\";s:8:\"mycourse\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416376843');
INSERT INTO `t_sys_log` VALUES ('151', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"12\";}s:4:\"post\";a:9:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:2:\"12\";s:4:\"name\";s:12:\"全部课程\";s:5:\"chKey\";s:9:\"allcourse\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416376850');
INSERT INTO `t_sys_log` VALUES ('152', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:9:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:9:\"childhood\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416377501');
INSERT INTO `t_sys_log` VALUES ('153', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:9:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"幼儿园\";s:5:\"chKey\";s:9:\"preschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416377521');
INSERT INTO `t_sys_log` VALUES ('154', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:9:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"小学\";s:5:\"chKey\";s:13:\"primaryschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416377569');
INSERT INTO `t_sys_log` VALUES ('155', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:9:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"14\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:9:\"childhood\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"status\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";}}', '1416388764');
INSERT INTO `t_sys_log` VALUES ('156', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:9:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"14\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:9:\"childhood\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"status\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";}}', '1416388770');
INSERT INTO `t_sys_log` VALUES ('157', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"14\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:9:\"childhood\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416388820');
INSERT INTO `t_sys_log` VALUES ('158', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"14\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:9:\"childhood\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416388829');
INSERT INTO `t_sys_log` VALUES ('159', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:12:\"精彩推荐\";s:5:\"chKey\";s:9:\"recommend\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416388935');
INSERT INTO `t_sys_log` VALUES ('160', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"12\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:2:\"12\";s:4:\"name\";s:12:\"全部课程\";s:5:\"chKey\";s:9:\"allcourse\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416388940');
INSERT INTO `t_sys_log` VALUES ('161', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"13\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:2:\"13\";s:4:\"name\";s:12:\"我的课程\";s:5:\"chKey\";s:8:\"mycourse\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416388948');
INSERT INTO `t_sys_log` VALUES ('162', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"14\";}}', '1416391828');
INSERT INTO `t_sys_log` VALUES ('163', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"15\";}}', '1416391835');
INSERT INTO `t_sys_log` VALUES ('164', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1416391839');
INSERT INTO `t_sys_log` VALUES ('165', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"用户中心\";s:5:\"chKey\";s:10:\"usercenter\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416392183');
INSERT INTO `t_sys_log` VALUES ('166', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416449198');
INSERT INTO `t_sys_log` VALUES ('167', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"1\";}}', '1416465342');
INSERT INTO `t_sys_log` VALUES ('168', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:4:\"test\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:4:\"test\";s:8:\"templete\";s:0:\"\";}}', '1416465354');
INSERT INTO `t_sys_log` VALUES ('169', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:4:\"test\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"e\";s:8:\"templete\";s:0:\"\";}}', '1416465400');
INSERT INTO `t_sys_log` VALUES ('170', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:0:\"\";}}', '1416465434');
INSERT INTO `t_sys_log` VALUES ('171', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:4:\"test\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:4:\"test\";s:8:\"templete\";s:4:\"test\";}}', '1416466034');
INSERT INTO `t_sys_log` VALUES ('172', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416466048');
INSERT INTO `t_sys_log` VALUES ('173', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416466069');
INSERT INTO `t_sys_log` VALUES ('174', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416466139');
INSERT INTO `t_sys_log` VALUES ('175', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:1:\"2\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416466159');
INSERT INTO `t_sys_log` VALUES ('176', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1416466164');
INSERT INTO `t_sys_log` VALUES ('177', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:4:\"test\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:4:\"test\";s:8:\"templete\";s:2:\"tt\";}}', '1416466172');
INSERT INTO `t_sys_log` VALUES ('178', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1416466204');
INSERT INTO `t_sys_log` VALUES ('179', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:0:\"\";s:8:\"templete\";s:1:\"d\";}}', '1416466211');
INSERT INTO `t_sys_log` VALUES ('180', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:0:\"\";}}', '1416466216');
INSERT INTO `t_sys_log` VALUES ('181', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:0:\"\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:0:\"\";}}', '1416466220');
INSERT INTO `t_sys_log` VALUES ('182', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:0:\"\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416466223');
INSERT INTO `t_sys_log` VALUES ('183', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:5:{s:4:\"name\";s:1:\"d\";s:2:\"id\";s:1:\"4\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416466249');
INSERT INTO `t_sys_log` VALUES ('184', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"sdf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"sf\";s:8:\"templete\";s:1:\"f\";}}', '1416466671');
INSERT INTO `t_sys_log` VALUES ('185', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"sdf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"sf\";s:8:\"templete\";s:8:\"p_config\";}}', '1416466679');
INSERT INTO `t_sys_log` VALUES ('186', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"sdf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"sf\";s:8:\"templete\";s:8:\"p_config\";}}', '1416466706');
INSERT INTO `t_sys_log` VALUES ('187', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"adf\";s:8:\"templete\";s:1:\"d\";}}', '1416466715');
INSERT INTO `t_sys_log` VALUES ('188', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"adf\";s:8:\"templete\";s:2:\"dd\";}}', '1416466720');
INSERT INTO `t_sys_log` VALUES ('189', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"4\";}}', '1416466957');
INSERT INTO `t_sys_log` VALUES ('190', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"adf\";s:8:\"templete\";s:3:\"adf\";}}', '1416466965');
INSERT INTO `t_sys_log` VALUES ('191', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"adf\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416466975');
INSERT INTO `t_sys_log` VALUES ('192', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"adf\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416467006');
INSERT INTO `t_sys_log` VALUES ('193', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"5\";}}', '1416467015');
INSERT INTO `t_sys_log` VALUES ('194', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:4:\"dfad\";s:8:\"templete\";s:3:\"adf\";}}', '1416467022');
INSERT INTO `t_sys_log` VALUES ('195', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"6\";}}', '1416467087');
INSERT INTO `t_sys_log` VALUES ('196', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"fad\";s:8:\"templete\";s:3:\"dfa\";}}', '1416467095');
INSERT INTO `t_sys_log` VALUES ('197', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"fad\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416467101');
INSERT INTO `t_sys_log` VALUES ('198', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"fad\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416467240');
INSERT INTO `t_sys_log` VALUES ('199', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"7\";}}', '1416467248');
INSERT INTO `t_sys_log` VALUES ('200', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"gg\";s:8:\"templete\";s:2:\"gg\";}}', '1416467254');
INSERT INTO `t_sys_log` VALUES ('201', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"8\";}}', '1416467343');
INSERT INTO `t_sys_log` VALUES ('202', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:1:\"d\";s:8:\"templete\";s:1:\"d\";}}', '1416467351');
INSERT INTO `t_sys_log` VALUES ('203', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"gd\";s:8:\"templete\";s:3:\"adf\";}}', '1416468048');
INSERT INTO `t_sys_log` VALUES ('204', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"adf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"gfa\";s:8:\"templete\";s:2:\"fs\";}}', '1416468252');
INSERT INTO `t_sys_log` VALUES ('205', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"ga\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:3:\"sfg\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416468328');
INSERT INTO `t_sys_log` VALUES ('206', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"12\";}}', '1416468587');
INSERT INTO `t_sys_log` VALUES ('207', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"11\";}}', '1416468591');
INSERT INTO `t_sys_log` VALUES ('208', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"dd\";s:8:\"templete\";s:2:\"ad\";}}', '1416468599');
INSERT INTO `t_sys_log` VALUES ('209', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"dd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416468605');
INSERT INTO `t_sys_log` VALUES ('210', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"dd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416468609');
INSERT INTO `t_sys_log` VALUES ('211', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"dd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416468613');
INSERT INTO `t_sys_log` VALUES ('212', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"dd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416469095');
INSERT INTO `t_sys_log` VALUES ('213', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:3:\"gad\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"fg\";s:8:\"templete\";s:3:\"adf\";}}', '1416469104');
INSERT INTO `t_sys_log` VALUES ('214', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"10\";}}', '1416469111');
INSERT INTO `t_sys_log` VALUES ('215', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"9\";}}', '1416469119');
INSERT INTO `t_sys_log` VALUES ('216', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"hg\";s:8:\"templete\";s:2:\"jh\";}}', '1416469125');
INSERT INTO `t_sys_log` VALUES ('217', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"hg\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416469131');
INSERT INTO `t_sys_log` VALUES ('218', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"13\";}}', '1416469136');
INSERT INTO `t_sys_log` VALUES ('219', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"fg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"re\";s:8:\"templete\";s:3:\"hgf\";}}', '1416469144');
INSERT INTO `t_sys_log` VALUES ('220', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"fg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"re\";s:8:\"templete\";s:8:\"p_config\";}}', '1416469149');
INSERT INTO `t_sys_log` VALUES ('221', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"fg\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"re\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416469155');
INSERT INTO `t_sys_log` VALUES ('222', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"14\";}}', '1416469200');
INSERT INTO `t_sys_log` VALUES ('223', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:2:\"gf\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:2:\"fg\";s:8:\"templete\";s:1:\"f\";}}', '1416469207');
INSERT INTO `t_sys_log` VALUES ('224', 'admin', 'ProConfig', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"15\";}}', '1416469211');
INSERT INTO `t_sys_log` VALUES ('225', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:9:\"proConfig\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416469258');
INSERT INTO `t_sys_log` VALUES ('226', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:8:\"p_config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416474454');
INSERT INTO `t_sys_log` VALUES ('227', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:8:\"p_config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477477');
INSERT INTO `t_sys_log` VALUES ('228', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:9:\"p_configd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477483');
INSERT INTO `t_sys_log` VALUES ('229', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:8:\"p_config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477488');
INSERT INTO `t_sys_log` VALUES ('230', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:8:\"p_config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477513');
INSERT INTO `t_sys_log` VALUES ('231', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:9:\"p_configd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477516');
INSERT INTO `t_sys_log` VALUES ('232', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:9:\"p_configd\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477519');
INSERT INTO `t_sys_log` VALUES ('233', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:5:{s:4:\"name\";s:12:\"产品配置\";s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:4:\"cKey\";s:8:\"p_config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416477527');
INSERT INTO `t_sys_log` VALUES ('234', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416618034');
INSERT INTO `t_sys_log` VALUES ('235', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1416618053');
INSERT INTO `t_sys_log` VALUES ('236', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p_config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1416619832');
INSERT INTO `t_sys_log` VALUES ('237', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:5:\"early\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416620217');
INSERT INTO `t_sys_log` VALUES ('238', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"幼教\";s:5:\"chKey\";s:9:\"preschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416620260');
INSERT INTO `t_sys_log` VALUES ('239', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:13:\"primaryschool\";s:5:\"chKey\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416620322');
INSERT INTO `t_sys_log` VALUES ('240', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"小学\";s:5:\"chKey\";s:13:\"primaryschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416620334');
INSERT INTO `t_sys_log` VALUES ('241', 'admin', 'Channel', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"中学\";s:5:\"chKey\";s:12:\"middleschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416620348');
INSERT INTO `t_sys_log` VALUES ('242', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"21\";}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"21\";s:4:\"name\";s:6:\"中学\";s:5:\"chKey\";s:12:\"middleschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416620358');
INSERT INTO `t_sys_log` VALUES ('243', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1416706284');
INSERT INTO `t_sys_log` VALUES ('244', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"19\";s:4:\"name\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416712792');
INSERT INTO `t_sys_log` VALUES ('245', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:2:\"id\";s:2:\"19\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416712887');
INSERT INTO `t_sys_log` VALUES ('246', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"18\";}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"18\";s:4:\"name\";s:6:\"早教\";s:5:\"chKey\";s:5:\"early\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713028');
INSERT INTO `t_sys_log` VALUES ('247', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"19\";}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"19\";s:4:\"name\";s:6:\"幼教\";s:5:\"chKey\";s:9:\"preschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713032');
INSERT INTO `t_sys_log` VALUES ('248', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:2:\"id\";s:2:\"18\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713061');
INSERT INTO `t_sys_log` VALUES ('249', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713077');
INSERT INTO `t_sys_log` VALUES ('250', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:2:\"id\";s:2:\"18\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713487');
INSERT INTO `t_sys_log` VALUES ('251', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:2:\"id\";s:2:\"18\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713495');
INSERT INTO `t_sys_log` VALUES ('252', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:5:{s:2:\"id\";s:2:\"18\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713610');
INSERT INTO `t_sys_log` VALUES ('253', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713615');
INSERT INTO `t_sys_log` VALUES ('254', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"sKey\";s:4:\"test\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1416713622');
INSERT INTO `t_sys_log` VALUES ('255', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"一年级\";s:4:\"sKey\";s:8:\"gradeOne\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1416713710');
INSERT INTO `t_sys_log` VALUES ('256', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"1\";}}', '1416713834');
INSERT INTO `t_sys_log` VALUES ('257', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:5:\"Stage\";}}', '1416714420');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `name` varchar(24) NOT NULL DEFAULT '',
  `auth` text COMMENT '权限列表',
  `isSuper` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理组',
  `addTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '超级管理组', 'N;', '1', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `name` varchar(24) NOT NULL COMMENT '管理员用户名',
  `realName` varchar(24) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `roleId` int(11) NOT NULL DEFAULT '0' COMMENT '所属角色',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0-禁用,1-启用',
  `lastTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '最后登录时间',
  `lastIp` varchar(23) NOT NULL DEFAULT '' COMMENT '最后登录ＩＰ',
  `addTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'admin', '系统管理员', '21232f297a57a5a743894a0e4a801fc3', '1', '1', '2014-11-23 09:31:24', '127.0.0.1', '1970-01-01 00:00:00');

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL COMMENT '课程ID',
  `name` varchar(20) NOT NULL COMMENT '知识点名称',
  `sectionIds` varchar(50) NOT NULL COMMENT '课时id(多个用逗号分隔)',
  `imgUrl` varchar(200) DEFAULT NULL COMMENT '知识点导航图片',
  `description` varchar(50) DEFAULT NULL COMMENT '知识点描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '知识点排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseId` (`courseId`),
  KEY `sectionIds` (`sectionIds`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点';

-- ----------------------------
-- Records of t_topic
-- ----------------------------

-- ----------------------------
-- Table structure for t_upfile
-- ----------------------------
DROP TABLE IF EXISTS `t_upfile`;
CREATE TABLE `t_upfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文件类型',
  `url` varchar(50) DEFAULT '' COMMENT 'URL地址',
  `thumb` varchar(50) DEFAULT NULL COMMENT '缩略图',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '大小',
  `memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `addTime` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2590 DEFAULT CHARSET=utf8 COMMENT='上传文件';

-- ----------------------------
-- Records of t_upfile
-- ----------------------------
INSERT INTO `t_upfile` VALUES ('2588', '1', 'c/546b1b6e7a5d7.png', 's=100*200,m=200*300', '361', '栏目导航图片：testss', '2014-11-18 18:11:58');
INSERT INTO `t_upfile` VALUES ('2589', '1', '0/546b1bac6f261.png', '', '361', '栏目导航图片：ds', '2014-11-18 18:13:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opUserId` varchar(30) NOT NULL COMMENT '运营商提供的UserID',
  `opUserToken` varchar(50) DEFAULT NULL COMMENT '运营商提供的UserToken',
  `opUserName` varchar(30) DEFAULT NULL COMMENT '运营商提供的用户Name',
  `nickName` varchar(20) NOT NULL COMMENT '用户昵称',
  `point` int(11) DEFAULT '0' COMMENT '用户积分',
  `amount` int(11) DEFAULT '0' COMMENT '用户元宝',
  `face` tinyint(2) DEFAULT '0' COMMENT '用户头像',
  `phone` int(11) DEFAULT '0' COMMENT '联系电话',
  `qq` int(11) DEFAULT '0' COMMENT 'QQ',
  `email` varchar(50) DEFAULT NULL COMMENT 'E-mail',
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opUserId` (`opUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
