/*
Navicat MySQL Data Transfer

Source Server         : .5
Source Server Version : 50166
Source Host           : 192.168.0.5:3306
Source Database       : edu_hipi

Target Server Type    : MYSQL
Target Server Version : 50166
File Encoding         : 65001

Date: 2014-11-17 10:19:51
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
  `description` varchar(50) DEFAULT NULL COMMENT '栏目描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '栏目排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pId` (`pId`),
  KEY `chKey` (`chKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目';

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chId` int(11) NOT NULL COMMENT '栏目ID',
  `pressId` int(11) DEFAULT NULL COMMENT '出版社ID',
  `name` varchar(20) NOT NULL COMMENT '课程名称',
  `volume` tinyint(1) DEFAULT NULL COMMENT '0-上册，1-下册',
  `typeId` int(11) DEFAULT NULL COMMENT '类型(基础/拓展)ID',
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
-- Table structure for t_course_type
-- ----------------------------
DROP TABLE IF EXISTS `t_course_type`;
CREATE TABLE `t_course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `number` int(11) NOT NULL COMMENT '编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程类型表';

-- ----------------------------
-- Table structure for t_key
-- ----------------------------
DROP TABLE IF EXISTS `t_key`;
CREATE TABLE `t_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '关键字名称',
  `description` varchar(50) DEFAULT NULL COMMENT '关键字描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键字';

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
-- Table structure for t_press
-- ----------------------------
DROP TABLE IF EXISTS `t_press`;
CREATE TABLE `t_press` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `number` int(11) NOT NULL COMMENT '编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出版社表';

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
-- Table structure for t_role_stage
-- ----------------------------
DROP TABLE IF EXISTS `t_role_stage`;
CREATE TABLE `t_role_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `sKey` varchar(20) NOT NULL COMMENT '龄段key',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sKey` (`sKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色龄段表';

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
