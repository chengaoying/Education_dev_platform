/*
Navicat MySQL Data Transfer

Source Server         : .5
Source Server Version : 50166
Source Host           : 192.168.0.5:3306
Source Database       : edu_hipi

Target Server Type    : MYSQL
Target Server Version : 50166
File Encoding         : 65001

Date: 2014-12-12 18:14:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_ad
-- ----------------------------
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE `t_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asId` int(11) NOT NULL COMMENT '广告位ID',
  `adClass` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为内部banner，1为广告',
  `apId` int(11) DEFAULT NULL COMMENT '广告商Id',
  `adId` int(11) DEFAULT NULL COMMENT '广告ID',
  `adType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '广告类型，0为图片，1为视频',
  `title` varchar(60) NOT NULL COMMENT '广告标题',
  `content` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `linkUrl` varchar(200) DEFAULT NULL COMMENT '访问地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '广告排序',
  `time` float(3,1) DEFAULT NULL COMMENT '跳转时间(单位秒)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adSpaceId` (`asId`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_ad
-- ----------------------------
INSERT INTO `t_ad` VALUES ('1', '4', '0', '0', '0', '0', '推荐的课程', '7/548a893d04b6e.jpg', '', '0', '0.0', '1', '2014-11-26 11:03:27');
INSERT INTO `t_ad` VALUES ('2', '3', '0', '0', '0', '0', '推荐介绍', '2/548a9b032129b.jpg', '', '0', '0.0', '1', '2014-11-26 11:35:58');
INSERT INTO `t_ad` VALUES ('3', '5', '0', '0', '0', '0', '底部广告', '4/548aa120158f2.jpg', '', '0', '0.0', '1', '2014-12-12 16:02:45');

-- ----------------------------
-- Table structure for t_ad_space
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_space`;
CREATE TABLE `t_ad_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asKey` varchar(20) NOT NULL COMMENT '广告位EKY',
  `title` varchar(20) NOT NULL COMMENT '广告位名称',
  `asType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '广告位类型(0-单图片,1-轮播图,2-视频)',
  `showNum` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位广告显示数量',
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_ad_space
-- ----------------------------
INSERT INTO `t_ad_space` VALUES ('3', 'recommend_left', '推荐课程-左侧广告位', '0', '1', '2014-11-26 10:55:53');
INSERT INTO `t_ad_space` VALUES ('4', 'recommend_right', '推荐课程-右侧广告位', '0', '1', '2014-12-12 14:04:38');
INSERT INTO `t_ad_space` VALUES ('5', 'recommend_bottom', '推荐课程-底部广告', '0', '1', '2014-12-12 16:01:57');

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
INSERT INTO `t_channel` VALUES ('1', '0', '精彩推荐', 'recommend', '9/548a48f6202e1.png,3/548a490636109.png', '', '1', '', '0', '1', '0000-00-00 00:00:00');
INSERT INTO `t_channel` VALUES ('12', '0', '全部课程', 'allcourse', '0/548a4927958a6.png,c/548a492795d8d.png', '', '1', '', '0', '1', '2014-11-19 14:00:11');
INSERT INTO `t_channel` VALUES ('13', '0', '我的课程', 'mycourse', 'f/548a494200813.png,e/548a494200d3d.png', '', '1', '', '0', '1', '2014-11-19 14:00:43');
INSERT INTO `t_channel` VALUES ('17', '0', '用户中心', 'usercenter', '', '', '0', '', '0', '1', '2014-11-19 18:16:23');
INSERT INTO `t_channel` VALUES ('18', '12', '早教', 'early', '', '', '0', '', '0', '1', '2014-11-22 09:36:57');
INSERT INTO `t_channel` VALUES ('19', '12', '幼教', 'preschool', '', '', '0', '', '0', '1', '2014-11-22 09:37:40');
INSERT INTO `t_channel` VALUES ('20', '12', '小学', 'primaryschool', '', '', '0', '', '0', '1', '2014-11-22 09:38:54');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chId` int(11) NOT NULL COMMENT '栏目ID',
  `stage` varchar(20) DEFAULT NULL COMMENT '龄段',
  `pressId` int(11) DEFAULT NULL COMMENT '出版社ID',
  `name` varchar(20) NOT NULL COMMENT '课程名称',
  `session` tinyint(1) DEFAULT NULL COMMENT '1-上学期，2-下学期',
  `subject` int(11) DEFAULT NULL COMMENT '科目',
  `typeId` int(11) DEFAULT NULL COMMENT '类型(基础/拓展)ID',
  `organization` varchar(50) DEFAULT NULL COMMENT '机构',
  `lecturer` varchar(20) DEFAULT NULL COMMENT '讲师',
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '20', '9,4', '2001', 'test', '0', '2', '2', 'o', 'l', '0.00', '0', '0', '', '1', '', '', '', '0', '1', '2014-12-01 09:38:10');
INSERT INTO `t_course` VALUES ('7', '18', '7', '0', 'tt', '0', '0', '1', '', '', '0.00', '0', '0', '', ',2,1', '', '', '', '0', '1', '2014-12-09 14:09:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='题库';

-- ----------------------------
-- Records of t_library
-- ----------------------------
INSERT INTO `t_library` VALUES ('1', '1', '1', '1', '0', '1', '1', '1', '6/547d8b2b58106.jpg', '1', '0', '1', '2014-12-01 00:00:00');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品公告',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '公告内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0-禁用,1-启用)',
  `addTime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `noticeKey` varchar(32) NOT NULL COMMENT '通知Key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='公告列表';

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('13', '小张', '0', '2014-12-03 18:48:14', 'bottom');
INSERT INTO `t_notice` VALUES ('14', '速度快放假', '1', '2014-12-03 18:49:16', 'bottom');
INSERT INTO `t_notice` VALUES ('15', '开学了', '1', '2014-12-03 19:00:00', 'top');
INSERT INTO `t_notice` VALUES ('22', 'sf ', '1', '2014-12-08 10:46:48', 'left');
INSERT INTO `t_notice` VALUES ('23', 'sdfsdf', '0', '2014-12-08 17:56:36', 'sf');

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
INSERT INTO `t_pro_config` VALUES ('16', '产品配置', 'proConfig', 'p_config.php', 'a:9:{s:12:\"channelThumb\";s:19:\"s=100*200,m=200*300\";s:10:\"courseType\";a:2:{i:1;s:6:\"基础\";i:2;s:6:\"拓展\";}s:7:\"subject\";a:12:{i:1;s:6:\"语文\";i:2;s:6:\"数学\";i:3;s:6:\"英语\";i:4;s:6:\"科学\";i:5;s:6:\"美术\";i:6;s:6:\"书法\";i:7;s:6:\"音乐\";i:8;s:6:\"舞蹈\";i:9;s:6:\"写作\";i:10;s:6:\"手工\";i:11;s:6:\"动漫\";i:12;s:6:\"电影\";}s:4:\"tags\";a:9:{i:1;s:6:\"音乐\";i:2;s:6:\"美术\";i:3;s:6:\"书法\";i:4;s:6:\"科学\";i:5;s:6:\"舞蹈\";i:6;s:6:\"动漫\";i:7;s:6:\"电影\";i:8;s:6:\"写作\";i:9;s:6:\"手工\";}s:7:\"session\";a:2:{i:1;s:9:\"上学期\";i:2;s:9:\"下学期\";}s:4:\"keys\";a:3:{i:1;s:6:\"热门\";i:2;s:6:\"推荐\";i:3;s:6:\"置顶\";}s:2:\"rp\";a:1:{i:1001;s:9:\"掌世界\";}s:2:\"ap\";a:1:{i:1001;s:9:\"掌世界\";}s:5:\"press\";a:1:{i:2001;s:15:\"某某出版社\";}}', '2014-11-20 15:40:58');

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
  `playCount` int(11) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `praiseCount` int(11) NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `favorCount` int(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `description` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '资源排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sectionId` (`sectionId`),
  KEY `content` (`content`),
  KEY `keyList` (`keyList`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1', '111', '1', '11', '1001', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '1', '1', '2014-11-28 14:37:51');
INSERT INTO `t_resource` VALUES ('17', '11', '11', '111222222', '1001', '11', '0', '11', '1', '1', '7/547d8ab82a880.jpg', '0', '0', '0', '1', '1', '0', '2014-11-28 14:42:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('15', '6', null, '6', null, null, null, null, '0', '0', '0', '1', '2014-12-12 13:42:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='知识点';

-- ----------------------------
-- Records of t_section
-- ----------------------------
INSERT INTO `t_section` VALUES ('1', '1', 'test', '0', '', '', '', '', '0', '1', '2014-12-04 10:44:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='角色龄段表';

-- ----------------------------
-- Records of t_stage
-- ----------------------------
INSERT INTO `t_stage` VALUES ('2', '一年级', 'gradeone', '20', '6', '1', '2014-11-23 11:35:10');
INSERT INTO `t_stage` VALUES ('3', '大班', 'big', '19', '5', '1', '2014-12-04 15:46:39');
INSERT INTO `t_stage` VALUES ('4', '小班', 'small', '19', '3', '1', '2014-12-05 17:03:50');
INSERT INTO `t_stage` VALUES ('5', '二年级', 'gradetwo', '20', '7', '1', '2014-12-05 17:05:39');
INSERT INTO `t_stage` VALUES ('6', '中班', 'middle', '19', '4', '1', '2014-12-09 11:09:12');
INSERT INTO `t_stage` VALUES ('7', '0-1岁', 'one', '18', '0', '1', '2014-12-09 11:10:35');
INSERT INTO `t_stage` VALUES ('8', '1-2岁', 'two', '18', '1', '1', '2014-12-09 11:10:49');
INSERT INTO `t_stage` VALUES ('9', '2-3岁', 'three', '18', '2', '1', '2014-12-09 11:11:01');
INSERT INTO `t_stage` VALUES ('10', '三年级', 'gradethree', '20', '8', '1', '2014-12-09 11:16:48');
INSERT INTO `t_stage` VALUES ('11', '四年级', 'gradefour', '20', '9', '1', '2014-12-09 11:17:09');
INSERT INTO `t_stage` VALUES ('12', '五年级', 'gradefive', '20', '10', '1', '2014-12-09 11:18:04');
INSERT INTO `t_stage` VALUES ('13', '六年级', 'gradesix', '20', '11', '1', '2014-12-09 11:18:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=1585 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES ('258', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417081669');
INSERT INTO `t_sys_log` VALUES ('259', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p*config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417081673');
INSERT INTO `t_sys_log` VALUES ('260', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417081676');
INSERT INTO `t_sys_log` VALUES ('261', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417083486');
INSERT INTO `t_sys_log` VALUES ('262', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417083489');
INSERT INTO `t_sys_log` VALUES ('263', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417083865');
INSERT INTO `t_sys_log` VALUES ('264', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417084439');
INSERT INTO `t_sys_log` VALUES ('265', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417084444');
INSERT INTO `t_sys_log` VALUES ('266', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417084526');
INSERT INTO `t_sys_log` VALUES ('267', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417084530');
INSERT INTO `t_sys_log` VALUES ('268', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417137646');
INSERT INTO `t_sys_log` VALUES ('269', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:30:\"1001=掌世界\r\n1001=掌世界\";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417137699');
INSERT INTO `t_sys_log` VALUES ('270', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417137704');
INSERT INTO `t_sys_log` VALUES ('271', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:31:\"1001=掌世界\r\n1002=掌世界 \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417137730');
INSERT INTO `t_sys_log` VALUES ('272', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p*config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417137780');
INSERT INTO `t_sys_log` VALUES ('273', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417137887');
INSERT INTO `t_sys_log` VALUES ('274', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417137890');
INSERT INTO `t_sys_log` VALUES ('275', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417138077');
INSERT INTO `t_sys_log` VALUES ('276', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417138090');
INSERT INTO `t_sys_log` VALUES ('277', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p*config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417138307');
INSERT INTO `t_sys_log` VALUES ('278', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417138311');
INSERT INTO `t_sys_log` VALUES ('279', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417138315');
INSERT INTO `t_sys_log` VALUES ('280', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417138323');
INSERT INTO `t_sys_log` VALUES ('281', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417141545');
INSERT INTO `t_sys_log` VALUES ('282', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:13:{s:5:\"title\";s:6:\"ewqeqw\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:18:\"asdqsqqqqqqqqqqqqq\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417142504');
INSERT INTO `t_sys_log` VALUES ('283', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:13:{s:5:\"title\";s:6:\"ewqeqw\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:18:\"asdqsqqqqqqqqqqqqq\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417142506');
INSERT INTO `t_sys_log` VALUES ('284', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:13:{s:5:\"title\";s:6:\"ewqeqw\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:18:\"asdqsqqqqqqqqqqqqq\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417142507');
INSERT INTO `t_sys_log` VALUES ('285', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:13:{s:5:\"title\";s:6:\"ewqeqw\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:18:\"asdqsqqqqqqqqqqqqq\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417142509');
INSERT INTO `t_sys_log` VALUES ('286', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:13:{s:5:\"title\";s:6:\"ewqeqw\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:18:\"asdqsqqqqqqqqqqqqq\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417142510');
INSERT INTO `t_sys_log` VALUES ('287', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417142932');
INSERT INTO `t_sys_log` VALUES ('288', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417142952');
INSERT INTO `t_sys_log` VALUES ('289', 'admin', 'ProConfig', 'sync', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417142957');
INSERT INTO `t_sys_log` VALUES ('290', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417143004');
INSERT INTO `t_sys_log` VALUES ('291', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417143142');
INSERT INTO `t_sys_log` VALUES ('292', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143291');
INSERT INTO `t_sys_log` VALUES ('293', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143293');
INSERT INTO `t_sys_log` VALUES ('294', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143294');
INSERT INTO `t_sys_log` VALUES ('295', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143295');
INSERT INTO `t_sys_log` VALUES ('296', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143296');
INSERT INTO `t_sys_log` VALUES ('297', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143296');
INSERT INTO `t_sys_log` VALUES ('298', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143297');
INSERT INTO `t_sys_log` VALUES ('299', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143298');
INSERT INTO `t_sys_log` VALUES ('300', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143349');
INSERT INTO `t_sys_log` VALUES ('301', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:24:\"asdqs1111111111111111111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143425');
INSERT INTO `t_sys_log` VALUES ('302', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417143475');
INSERT INTO `t_sys_log` VALUES ('303', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:1:\"a\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143580');
INSERT INTO `t_sys_log` VALUES ('304', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"a1\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417143924');
INSERT INTO `t_sys_log` VALUES ('305', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417144026');
INSERT INTO `t_sys_log` VALUES ('306', 'admin', 'ProConfig', 'sync', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417144033');
INSERT INTO `t_sys_log` VALUES ('307', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"6\";}}', '1417144372');
INSERT INTO `t_sys_log` VALUES ('308', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"5\";}}', '1417144380');
INSERT INTO `t_sys_log` VALUES ('309', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145235');
INSERT INTO `t_sys_log` VALUES ('310', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145378');
INSERT INTO `t_sys_log` VALUES ('311', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145380');
INSERT INTO `t_sys_log` VALUES ('312', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145381');
INSERT INTO `t_sys_log` VALUES ('313', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145382');
INSERT INTO `t_sys_log` VALUES ('314', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145383');
INSERT INTO `t_sys_log` VALUES ('315', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145383');
INSERT INTO `t_sys_log` VALUES ('316', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145384');
INSERT INTO `t_sys_log` VALUES ('317', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145385');
INSERT INTO `t_sys_log` VALUES ('318', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145387');
INSERT INTO `t_sys_log` VALUES ('319', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145387');
INSERT INTO `t_sys_log` VALUES ('320', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145388');
INSERT INTO `t_sys_log` VALUES ('321', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145407');
INSERT INTO `t_sys_log` VALUES ('322', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"a11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145438');
INSERT INTO `t_sys_log` VALUES ('323', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:6:\"a11qwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145452');
INSERT INTO `t_sys_log` VALUES ('324', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:6:\"a11qwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145521');
INSERT INTO `t_sys_log` VALUES ('325', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145616');
INSERT INTO `t_sys_log` VALUES ('326', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145625');
INSERT INTO `t_sys_log` VALUES ('327', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145944');
INSERT INTO `t_sys_log` VALUES ('328', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417145945');
INSERT INTO `t_sys_log` VALUES ('329', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146216');
INSERT INTO `t_sys_log` VALUES ('330', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146248');
INSERT INTO `t_sys_log` VALUES ('331', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146495');
INSERT INTO `t_sys_log` VALUES ('332', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1417146536');
INSERT INTO `t_sys_log` VALUES ('333', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1417146540');
INSERT INTO `t_sys_log` VALUES ('334', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"4\";}}', '1417146545');
INSERT INTO `t_sys_log` VALUES ('335', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146580');
INSERT INTO `t_sys_log` VALUES ('336', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:12:\"a11qwewqeqwe\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146629');
INSERT INTO `t_sys_log` VALUES ('337', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"av\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146648');
INSERT INTO `t_sys_log` VALUES ('338', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417146656');
INSERT INTO `t_sys_log` VALUES ('339', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417146659');
INSERT INTO `t_sys_log` VALUES ('340', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"qaz\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:3:\"avi\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"11\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:2:\"12\";s:6:\"libUrl\";s:3:\"qwe\";s:6:\"imgUrl\";s:3:\"ewq\";s:11:\"description\";s:4:\"ewqe\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146691');
INSERT INTO `t_sys_log` VALUES ('341', 'admin', 'Channel', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"21\";}}', '1417146706');
INSERT INTO `t_sys_log` VALUES ('342', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"212\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:3:\"121\";s:7:\"content\";s:3:\"212\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"21\";s:8:\"playAuth\";s:2:\"21\";s:7:\"keyList\";s:2:\"21\";s:5:\"price\";s:2:\"21\";s:6:\"libUrl\";s:2:\"21\";s:6:\"imgUrl\";s:2:\"21\";s:11:\"description\";s:2:\"21\";s:4:\"sort\";s:3:\"122\";s:6:\"status\";s:1:\"1\";}}', '1417146776');
INSERT INTO `t_sys_log` VALUES ('343', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"8\";}}', '1417146809');
INSERT INTO `t_sys_log` VALUES ('344', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"7\";}}', '1417146825');
INSERT INTO `t_sys_log` VALUES ('345', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:1:\"q\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"asd\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:3:\"111\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:2:\"11\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417146860');
INSERT INTO `t_sys_log` VALUES ('346', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:3:\"111\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:2:\"11\";s:6:\"imgUrl\";s:2:\"11\";s:11:\"description\";s:3:\"111\";s:4:\"sort\";s:4:\"1111\";s:6:\"status\";s:1:\"1\";}}', '1417147011');
INSERT INTO `t_sys_log` VALUES ('347', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:3:\"111\";s:5:\"price\";s:2:\"11\";s:6:\"libUrl\";s:2:\"11\";s:6:\"imgUrl\";s:2:\"11\";s:11:\"description\";s:3:\"111\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417147106');
INSERT INTO `t_sys_log` VALUES ('348', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"zx\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:1:\"1\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417147202');
INSERT INTO `t_sys_log` VALUES ('349', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"as\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:1:\"1\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:3:\"111\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417147248');
INSERT INTO `t_sys_log` VALUES ('350', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"13\";}}', '1417147367');
INSERT INTO `t_sys_log` VALUES ('351', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"12\";}}', '1417147376');
INSERT INTO `t_sys_log` VALUES ('352', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"11\";}}', '1417153257');
INSERT INTO `t_sys_log` VALUES ('353', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:70:\"1001=掌世界                    \r\n1002=新世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417153317');
INSERT INTO `t_sys_log` VALUES ('354', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:50:\"1001=掌世界\r\n1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417153352');
INSERT INTO `t_sys_log` VALUES ('355', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417153363');
INSERT INTO `t_sys_log` VALUES ('356', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417153447');
INSERT INTO `t_sys_log` VALUES ('357', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417153463');
INSERT INTO `t_sys_log` VALUES ('358', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417153466');
INSERT INTO `t_sys_log` VALUES ('359', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417153476');
INSERT INTO `t_sys_log` VALUES ('360', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417153490');
INSERT INTO `t_sys_log` VALUES ('361', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417153493');
INSERT INTO `t_sys_log` VALUES ('362', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p*config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417153525');
INSERT INTO `t_sys_log` VALUES ('363', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p*config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417153528');
INSERT INTO `t_sys_log` VALUES ('364', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417153535');
INSERT INTO `t_sys_log` VALUES ('365', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:8:\"p*config\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417154217');
INSERT INTO `t_sys_log` VALUES ('366', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"10\";}}', '1417154298');
INSERT INTO `t_sys_log` VALUES ('367', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:6:\"ewqeqw\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"av\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1417154533');
INSERT INTO `t_sys_log` VALUES ('368', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"9\";}}', '1417154724');
INSERT INTO `t_sys_log` VALUES ('369', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"1\";}}', '1417154746');
INSERT INTO `t_sys_log` VALUES ('370', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"1qw\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:5:\"10001\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:3:\"111\";s:4:\"sort\";s:3:\"111\";s:6:\"status\";s:1:\"1\";}}', '1417155113');
INSERT INTO `t_sys_log` VALUES ('371', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"14\";}}', '1417155126');
INSERT INTO `t_sys_log` VALUES ('372', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:3:\"111\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:2:\"11\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:2:\"11\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417155198');
INSERT INTO `t_sys_log` VALUES ('373', 'admin', 'Resource', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"15\";}}', '1417155202');
INSERT INTO `t_sys_log` VALUES ('374', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"11\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417156671');
INSERT INTO `t_sys_log` VALUES ('375', 'admin', 'Resource', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"11\";s:2:\"id\";s:0:\"\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"11\";s:8:\"playAuth\";s:1:\"0\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1417156921');
INSERT INTO `t_sys_log` VALUES ('376', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417396725');
INSERT INTO `t_sys_log` VALUES ('377', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417397142');
INSERT INTO `t_sys_log` VALUES ('378', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417397197');
INSERT INTO `t_sys_log` VALUES ('379', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:8:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:50:\"1001=掌世界\r\n1002=新世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417397233');
INSERT INTO `t_sys_log` VALUES ('380', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417397240');
INSERT INTO `t_sys_log` VALUES ('381', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:8:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417397248');
INSERT INTO `t_sys_log` VALUES ('382', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417397254');
INSERT INTO `t_sys_log` VALUES ('383', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:17:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:0:\"\";s:6:\"volume\";s:0:\"\";s:6:\"typeId\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417397763');
INSERT INTO `t_sys_log` VALUES ('384', 'admin', 'ProConfig', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:12:\"产品配置\";s:4:\"cKey\";s:9:\"proConfig\";s:8:\"templete\";s:12:\"p_config.php\";}}', '1417397861');
INSERT INTO `t_sys_log` VALUES ('385', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:8:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417397865');
INSERT INTO `t_sys_log` VALUES ('386', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:17:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417397890');
INSERT INTO `t_sys_log` VALUES ('387', 'admin', 'Library', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:0:\"\";s:8:\"courseId\";s:3:\"111\";s:9:\"sectionId\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"price\";s:2:\"11\";s:4:\"auth\";s:2:\"11\";s:6:\"libUrl\";s:2:\"11\";s:6:\"imgUrl\";s:2:\"11\";s:11:\"description\";s:2:\"11\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417413123');
INSERT INTO `t_sys_log` VALUES ('388', 'admin', 'Library', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:12:{s:5:\"title\";s:6:\"111222\";s:2:\"id\";s:1:\"2\";s:8:\"courseId\";s:6:\"111222\";s:9:\"sectionId\";s:6:\"111222\";s:4:\"rpId\";s:4:\"1001\";s:5:\"price\";s:4:\"1122\";s:4:\"auth\";s:4:\"1122\";s:6:\"libUrl\";s:4:\"1122\";s:6:\"imgUrl\";s:4:\"1122\";s:11:\"description\";s:4:\"1122\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"1\";}}', '1417413194');
INSERT INTO `t_sys_log` VALUES ('389', 'admin', 'Library', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:12:{s:5:\"title\";s:6:\"111222\";s:2:\"id\";s:1:\"2\";s:8:\"courseId\";s:6:\"111222\";s:9:\"sectionId\";s:6:\"111222\";s:4:\"rpId\";s:4:\"1001\";s:5:\"price\";s:4:\"1122\";s:4:\"auth\";s:3:\"127\";s:6:\"libUrl\";s:4:\"1122\";s:6:\"imgUrl\";s:4:\"1122\";s:11:\"description\";s:4:\"1122\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"0\";}}', '1417413204');
INSERT INTO `t_sys_log` VALUES ('390', 'admin', 'Library', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1417413210');
INSERT INTO `t_sys_log` VALUES ('391', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417413523');
INSERT INTO `t_sys_log` VALUES ('392', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417413857');
INSERT INTO `t_sys_log` VALUES ('393', 'admin', 'ProConfig', 'sync', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417413869');
INSERT INTO `t_sys_log` VALUES ('394', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417413888');
INSERT INTO `t_sys_log` VALUES ('395', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417414025');
INSERT INTO `t_sys_log` VALUES ('396', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417414121');
INSERT INTO `t_sys_log` VALUES ('397', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417414344');
INSERT INTO `t_sys_log` VALUES ('398', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417414947');
INSERT INTO `t_sys_log` VALUES ('399', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417414947');
INSERT INTO `t_sys_log` VALUES ('400', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417414950');
INSERT INTO `t_sys_log` VALUES ('401', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"18\";}s:4:\"post\";a:0:{}}', '1417414953');
INSERT INTO `t_sys_log` VALUES ('402', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417414958');
INSERT INTO `t_sys_log` VALUES ('403', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"18\";}s:4:\"post\";a:0:{}}', '1417414965');
INSERT INTO `t_sys_log` VALUES ('404', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:0:\"\";}s:4:\"post\";a:0:{}}', '1417414968');
INSERT INTO `t_sys_log` VALUES ('405', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415082');
INSERT INTO `t_sys_log` VALUES ('406', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415082');
INSERT INTO `t_sys_log` VALUES ('407', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417415095');
INSERT INTO `t_sys_log` VALUES ('408', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415278');
INSERT INTO `t_sys_log` VALUES ('409', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415278');
INSERT INTO `t_sys_log` VALUES ('410', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415296');
INSERT INTO `t_sys_log` VALUES ('411', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415296');
INSERT INTO `t_sys_log` VALUES ('412', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415360');
INSERT INTO `t_sys_log` VALUES ('413', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415361');
INSERT INTO `t_sys_log` VALUES ('414', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415392');
INSERT INTO `t_sys_log` VALUES ('415', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415392');
INSERT INTO `t_sys_log` VALUES ('416', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415393');
INSERT INTO `t_sys_log` VALUES ('417', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415394');
INSERT INTO `t_sys_log` VALUES ('418', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417415399');
INSERT INTO `t_sys_log` VALUES ('419', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415453');
INSERT INTO `t_sys_log` VALUES ('420', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"18\";}s:4:\"post\";a:0:{}}', '1417415517');
INSERT INTO `t_sys_log` VALUES ('421', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415559');
INSERT INTO `t_sys_log` VALUES ('422', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415664');
INSERT INTO `t_sys_log` VALUES ('423', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417415664');
INSERT INTO `t_sys_log` VALUES ('424', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415682');
INSERT INTO `t_sys_log` VALUES ('425', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415716');
INSERT INTO `t_sys_log` VALUES ('426', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415752');
INSERT INTO `t_sys_log` VALUES ('427', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415785');
INSERT INTO `t_sys_log` VALUES ('428', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415842');
INSERT INTO `t_sys_log` VALUES ('429', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415874');
INSERT INTO `t_sys_log` VALUES ('430', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417415937');
INSERT INTO `t_sys_log` VALUES ('431', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417416009');
INSERT INTO `t_sys_log` VALUES ('432', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417416050');
INSERT INTO `t_sys_log` VALUES ('433', 'admin', 'Course', 'get_data1.php', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}', '1417416307');
INSERT INTO `t_sys_log` VALUES ('434', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417416365');
INSERT INTO `t_sys_log` VALUES ('435', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417416406');
INSERT INTO `t_sys_log` VALUES ('436', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:9:\"ProConfig\";}}', '1417416439');
INSERT INTO `t_sys_log` VALUES ('437', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417416442');
INSERT INTO `t_sys_log` VALUES ('438', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417416443');
INSERT INTO `t_sys_log` VALUES ('439', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417416454');
INSERT INTO `t_sys_log` VALUES ('440', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417416504');
INSERT INTO `t_sys_log` VALUES ('441', 'admin', 'Library', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:12:{s:5:\"title\";s:1:\"1\";s:2:\"id\";s:1:\"1\";s:8:\"courseId\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:4:\"rpId\";s:4:\"1002\";s:5:\"price\";s:1:\"1\";s:4:\"auth\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417416638');
INSERT INTO `t_sys_log` VALUES ('442', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:7:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:66:\"1001=掌世界\r\n1002=新世界\r\n1003=新世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417416673');
INSERT INTO `t_sys_log` VALUES ('443', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417416676');
INSERT INTO `t_sys_log` VALUES ('444', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:7:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:66:\"1001=掌世界\r\n1002=新世界\r\n1003=好世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417416762');
INSERT INTO `t_sys_log` VALUES ('445', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417416765');
INSERT INTO `t_sys_log` VALUES ('446', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417420736');
INSERT INTO `t_sys_log` VALUES ('447', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421036');
INSERT INTO `t_sys_log` VALUES ('448', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421036');
INSERT INTO `t_sys_log` VALUES ('449', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417421041');
INSERT INTO `t_sys_log` VALUES ('450', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"18\";}s:4:\"post\";a:0:{}}', '1417421045');
INSERT INTO `t_sys_log` VALUES ('451', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421211');
INSERT INTO `t_sys_log` VALUES ('452', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421211');
INSERT INTO `t_sys_log` VALUES ('453', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417421214');
INSERT INTO `t_sys_log` VALUES ('454', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421259');
INSERT INTO `t_sys_log` VALUES ('455', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421259');
INSERT INTO `t_sys_log` VALUES ('456', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417421261');
INSERT INTO `t_sys_log` VALUES ('457', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421806');
INSERT INTO `t_sys_log` VALUES ('458', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421806');
INSERT INTO `t_sys_log` VALUES ('459', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"19\";}s:4:\"post\";a:0:{}}', '1417421808');
INSERT INTO `t_sys_log` VALUES ('460', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"18\";}s:4:\"post\";a:0:{}}', '1417421858');
INSERT INTO `t_sys_log` VALUES ('461', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421862');
INSERT INTO `t_sys_log` VALUES ('462', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421862');
INSERT INTO `t_sys_log` VALUES ('463', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417421864');
INSERT INTO `t_sys_log` VALUES ('464', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417425062');
INSERT INTO `t_sys_log` VALUES ('465', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417429719');
INSERT INTO `t_sys_log` VALUES ('466', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417430557');
INSERT INTO `t_sys_log` VALUES ('467', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417483048');
INSERT INTO `t_sys_log` VALUES ('468', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417484872');
INSERT INTO `t_sys_log` VALUES ('469', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417489703');
INSERT INTO `t_sys_log` VALUES ('470', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417489706');
INSERT INTO `t_sys_log` VALUES ('471', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417489811');
INSERT INTO `t_sys_log` VALUES ('472', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417490632');
INSERT INTO `t_sys_log` VALUES ('473', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417490649');
INSERT INTO `t_sys_log` VALUES ('474', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417490772');
INSERT INTO `t_sys_log` VALUES ('475', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417490911');
INSERT INTO `t_sys_log` VALUES ('476', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491263');
INSERT INTO `t_sys_log` VALUES ('477', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491271');
INSERT INTO `t_sys_log` VALUES ('478', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491279');
INSERT INTO `t_sys_log` VALUES ('479', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491284');
INSERT INTO `t_sys_log` VALUES ('480', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491288');
INSERT INTO `t_sys_log` VALUES ('481', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491293');
INSERT INTO `t_sys_log` VALUES ('482', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491685');
INSERT INTO `t_sys_log` VALUES ('483', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491687');
INSERT INTO `t_sys_log` VALUES ('484', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491739');
INSERT INTO `t_sys_log` VALUES ('485', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491785');
INSERT INTO `t_sys_log` VALUES ('486', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491814');
INSERT INTO `t_sys_log` VALUES ('487', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417491957');
INSERT INTO `t_sys_log` VALUES ('488', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:1:\"1\";s:4:\"memo\";s:0:\"\";}}', '1417492043');
INSERT INTO `t_sys_log` VALUES ('489', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417499481');
INSERT INTO `t_sys_log` VALUES ('490', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417499729');
INSERT INTO `t_sys_log` VALUES ('491', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:8:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:51:\"2001=某某出版社 \r\n2002=xxxx                   \";}}', '1417499830');
INSERT INTO `t_sys_log` VALUES ('492', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417500505');
INSERT INTO `t_sys_log` VALUES ('493', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:6:\"dsadsd\";}}', '1417501936');
INSERT INTO `t_sys_log` VALUES ('494', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"17\";}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"11\";s:2:\"id\";s:2:\"17\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"11\";s:8:\"playAuth\";s:1:\"0\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:1:\"1\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1417501942');
INSERT INTO `t_sys_log` VALUES ('495', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417506960');
INSERT INTO `t_sys_log` VALUES ('496', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417507002');
INSERT INTO `t_sys_log` VALUES ('497', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417509761');
INSERT INTO `t_sys_log` VALUES ('498', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417509855');
INSERT INTO `t_sys_log` VALUES ('499', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511016');
INSERT INTO `t_sys_log` VALUES ('500', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511156');
INSERT INTO `t_sys_log` VALUES ('501', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511379');
INSERT INTO `t_sys_log` VALUES ('502', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511385');
INSERT INTO `t_sys_log` VALUES ('503', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511416');
INSERT INTO `t_sys_log` VALUES ('504', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511418');
INSERT INTO `t_sys_log` VALUES ('505', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511602');
INSERT INTO `t_sys_log` VALUES ('506', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511753');
INSERT INTO `t_sys_log` VALUES ('507', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417511776');
INSERT INTO `t_sys_log` VALUES ('508', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:13:\"广告图片-\";}}', '1417511821');
INSERT INTO `t_sys_log` VALUES ('509', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:33:\"栏目导航图片：精彩推荐\";}}', '1417511848');
INSERT INTO `t_sys_log` VALUES ('510', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:12:\"精彩推荐\";s:5:\"chKey\";s:9:\"recommend\";s:6:\"imgUrl\";s:19:\"3/547d83a826457.jpg\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417511850');
INSERT INTO `t_sys_log` VALUES ('511', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417511892');
INSERT INTO `t_sys_log` VALUES ('512', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:0:\"\";}}', '1417512105');
INSERT INTO `t_sys_log` VALUES ('513', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"栏目导航图片：1\";}}', '1417512267');
INSERT INTO `t_sys_log` VALUES ('514', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"17\";}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"11\";s:2:\"id\";s:2:\"17\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"11\";s:8:\"playAuth\";s:1:\"0\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:5:\"1.png\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1417512287');
INSERT INTO `t_sys_log` VALUES ('515', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:26:\"栏目导航图片：1.png\";}}', '1417512296');
INSERT INTO `t_sys_log` VALUES ('516', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1417512331');
INSERT INTO `t_sys_log` VALUES ('517', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:26:\"资源导航图片：1.png\";}}', '1417512385');
INSERT INTO `t_sys_log` VALUES ('518', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417512965');
INSERT INTO `t_sys_log` VALUES ('519', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:26:\"资源导航图片：1.png\";}}', '1417513655');
INSERT INTO `t_sys_log` VALUES ('520', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"17\";}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"11\";s:2:\"id\";s:2:\"17\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:3:\"111\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"11\";s:8:\"playAuth\";s:1:\"0\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:19:\"7/547d8ab82a880.jpg\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1417513659');
INSERT INTO `t_sys_log` VALUES ('521', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:40:\"资源导航图片：7/547d8ab82a880.jpg\";}}', '1417513671');
INSERT INTO `t_sys_log` VALUES ('522', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1417513771');
INSERT INTO `t_sys_log` VALUES ('523', 'admin', 'Library', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:12:{s:5:\"title\";s:1:\"1\";s:2:\"id\";s:1:\"1\";s:8:\"courseId\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:4:\"rpId\";s:4:\"1003\";s:5:\"price\";s:1:\"1\";s:4:\"auth\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:19:\"6/547d8b2b58106.jpg\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417513773');
INSERT INTO `t_sys_log` VALUES ('524', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417513963');
INSERT INTO `t_sys_log` VALUES ('525', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"17\";}s:4:\"post\";a:14:{s:5:\"title\";s:2:\"11\";s:2:\"id\";s:2:\"17\";s:9:\"sectionId\";s:2:\"11\";s:7:\"content\";s:9:\"111222222\";s:4:\"rpId\";s:4:\"1001\";s:5:\"outId\";s:2:\"11\";s:8:\"playAuth\";s:1:\"0\";s:7:\"keyList\";s:2:\"11\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:19:\"7/547d8ab82a880.jpg\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"0\";}}', '1417514551');
INSERT INTO `t_sys_log` VALUES ('526', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:40:\"资源导航图片：7/547d8ab82a880.jpg\";}}', '1417514799');
INSERT INTO `t_sys_log` VALUES ('527', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417576945');
INSERT INTO `t_sys_log` VALUES ('528', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"幼儿园\";s:4:\"sKey\";s:1:\"5\";s:4:\"chId\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417578026');
INSERT INTO `t_sys_log` VALUES ('529', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585464');
INSERT INTO `t_sys_log` VALUES ('530', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585464');
INSERT INTO `t_sys_log` VALUES ('531', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585628');
INSERT INTO `t_sys_log` VALUES ('532', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585628');
INSERT INTO `t_sys_log` VALUES ('533', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585665');
INSERT INTO `t_sys_log` VALUES ('534', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585665');
INSERT INTO `t_sys_log` VALUES ('535', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585711');
INSERT INTO `t_sys_log` VALUES ('536', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585711');
INSERT INTO `t_sys_log` VALUES ('537', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585745');
INSERT INTO `t_sys_log` VALUES ('538', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585745');
INSERT INTO `t_sys_log` VALUES ('539', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585814');
INSERT INTO `t_sys_log` VALUES ('540', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:3:\"key\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417585814');
INSERT INTO `t_sys_log` VALUES ('541', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417586446');
INSERT INTO `t_sys_log` VALUES ('542', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417586446');
INSERT INTO `t_sys_log` VALUES ('543', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:17:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"数学\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"1\";s:5:\"price\";s:2:\"20\";s:8:\"midLibId\";s:1:\"1\";s:10:\"finalLibId\";s:1:\"2\";s:8:\"topicIds\";s:1:\"1\";s:4:\"keys\";s:6:\"上册\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:13:\"www.baidu.com\";s:11:\"description\";s:6:\"课程\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417586523');
INSERT INTO `t_sys_log` VALUES ('544', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:17:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"数学\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"1\";s:5:\"price\";s:2:\"20\";s:8:\"midLibId\";s:1:\"1\";s:10:\"finalLibId\";s:1:\"2\";s:8:\"topicIds\";s:1:\"1\";s:4:\"keys\";s:6:\"上册\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:13:\"www.baidu.com\";s:11:\"description\";s:6:\"课程\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417586527');
INSERT INTO `t_sys_log` VALUES ('545', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:17:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"数学\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"1\";s:5:\"price\";s:2:\"20\";s:8:\"midLibId\";s:1:\"1\";s:10:\"finalLibId\";s:1:\"2\";s:8:\"topicIds\";s:1:\"1\";s:4:\"keys\";s:6:\"上册\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:13:\"www.baidu.com\";s:11:\"description\";s:6:\"课程\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417586528');
INSERT INTO `t_sys_log` VALUES ('546', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:17:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"数学\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"1\";s:5:\"price\";s:2:\"20\";s:8:\"midLibId\";s:1:\"1\";s:10:\"finalLibId\";s:1:\"2\";s:8:\"topicIds\";s:1:\"1\";s:4:\"keys\";s:6:\"上册\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:13:\"www.baidu.com\";s:11:\"description\";s:6:\"课程\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417586529');
INSERT INTO `t_sys_log` VALUES ('547', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417586558');
INSERT INTO `t_sys_log` VALUES ('548', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417586558');
INSERT INTO `t_sys_log` VALUES ('549', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"加减法\";s:8:\"courseId\";s:6:\"数学\";s:10:\"sectionIds\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:18:\"阿打发斯蒂芬\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417586732');
INSERT INTO `t_sys_log` VALUES ('550', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"加减法\";s:8:\"courseId\";s:6:\"数学\";s:10:\"sectionIds\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:18:\"阿打发斯蒂芬\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1417586733');
INSERT INTO `t_sys_log` VALUES ('551', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417586771');
INSERT INTO `t_sys_log` VALUES ('552', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417586771');
INSERT INTO `t_sys_log` VALUES ('553', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:7:\"asdfasd\";s:8:\"courseId\";s:8:\"adsfasdf\";s:10:\"sectionIds\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417593941');
INSERT INTO `t_sys_log` VALUES ('554', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"1\";}}', '1417595271');
INSERT INTO `t_sys_log` VALUES ('555', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1417595279');
INSERT INTO `t_sys_log` VALUES ('556', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1417595283');
INSERT INTO `t_sys_log` VALUES ('557', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417596785');
INSERT INTO `t_sys_log` VALUES ('558', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417596785');
INSERT INTO `t_sys_log` VALUES ('559', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417597037');
INSERT INTO `t_sys_log` VALUES ('560', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417597037');
INSERT INTO `t_sys_log` VALUES ('561', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417597299');
INSERT INTO `t_sys_log` VALUES ('562', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417597299');
INSERT INTO `t_sys_log` VALUES ('563', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417597818');
INSERT INTO `t_sys_log` VALUES ('564', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417597818');
INSERT INTO `t_sys_log` VALUES ('565', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417598912');
INSERT INTO `t_sys_log` VALUES ('566', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417598913');
INSERT INTO `t_sys_log` VALUES ('567', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417598949');
INSERT INTO `t_sys_log` VALUES ('568', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417598950');
INSERT INTO `t_sys_log` VALUES ('569', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:16:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417598953');
INSERT INTO `t_sys_log` VALUES ('570', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417598957');
INSERT INTO `t_sys_log` VALUES ('571', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417598957');
INSERT INTO `t_sys_log` VALUES ('572', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:16:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417598962');
INSERT INTO `t_sys_log` VALUES ('573', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599066');
INSERT INTO `t_sys_log` VALUES ('574', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599066');
INSERT INTO `t_sys_log` VALUES ('575', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:16:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:6:\"数学\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"1\";s:5:\"price\";s:4:\"9.99\";s:8:\"midLibId\";s:1:\"1\";s:10:\"finalLibId\";s:1:\"2\";s:8:\"topicIds\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:13:\"www.baidu.com\";s:11:\"description\";s:6:\"课程\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599100');
INSERT INTO `t_sys_log` VALUES ('576', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599103');
INSERT INTO `t_sys_log` VALUES ('577', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599103');
INSERT INTO `t_sys_log` VALUES ('578', 'admin', 'Course', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1417599141');
INSERT INTO `t_sys_log` VALUES ('579', 'admin', 'Course', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1417599145');
INSERT INTO `t_sys_log` VALUES ('580', 'admin', 'Course', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"4\";}}', '1417599150');
INSERT INTO `t_sys_log` VALUES ('581', 'admin', 'Course', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"5\";}}', '1417599154');
INSERT INTO `t_sys_log` VALUES ('582', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599157');
INSERT INTO `t_sys_log` VALUES ('583', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599157');
INSERT INTO `t_sys_log` VALUES ('584', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599161');
INSERT INTO `t_sys_log` VALUES ('585', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599161');
INSERT INTO `t_sys_log` VALUES ('586', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:16:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:4:\"chId\";s:0:\"\";s:7:\"stageId\";s:0:\"\";s:7:\"pressId\";s:0:\"\";s:6:\"volume\";s:0:\"\";s:6:\"typeId\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417599165');
INSERT INTO `t_sys_log` VALUES ('587', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:8:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:56:\"1=热门\r\n2=推荐\r\n3=置顶   \r\n5=test                 \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:51:\"2001=某某出版社\r\n2002=xxxx                    \";}}', '1417599250');
INSERT INTO `t_sys_log` VALUES ('588', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599257');
INSERT INTO `t_sys_log` VALUES ('589', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599257');
INSERT INTO `t_sys_log` VALUES ('590', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599285');
INSERT INTO `t_sys_log` VALUES ('591', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599285');
INSERT INTO `t_sys_log` VALUES ('592', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599411');
INSERT INTO `t_sys_log` VALUES ('593', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599412');
INSERT INTO `t_sys_log` VALUES ('594', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599416');
INSERT INTO `t_sys_log` VALUES ('595', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599418');
INSERT INTO `t_sys_log` VALUES ('596', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599419');
INSERT INTO `t_sys_log` VALUES ('597', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599425');
INSERT INTO `t_sys_log` VALUES ('598', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599466');
INSERT INTO `t_sys_log` VALUES ('599', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599466');
INSERT INTO `t_sys_log` VALUES ('600', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599558');
INSERT INTO `t_sys_log` VALUES ('601', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599558');
INSERT INTO `t_sys_log` VALUES ('602', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599560');
INSERT INTO `t_sys_log` VALUES ('603', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599574');
INSERT INTO `t_sys_log` VALUES ('604', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599574');
INSERT INTO `t_sys_log` VALUES ('605', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599577');
INSERT INTO `t_sys_log` VALUES ('606', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599580');
INSERT INTO `t_sys_log` VALUES ('607', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599580');
INSERT INTO `t_sys_log` VALUES ('608', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599585');
INSERT INTO `t_sys_log` VALUES ('609', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599672');
INSERT INTO `t_sys_log` VALUES ('610', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599672');
INSERT INTO `t_sys_log` VALUES ('611', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599681');
INSERT INTO `t_sys_log` VALUES ('612', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599747');
INSERT INTO `t_sys_log` VALUES ('613', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599747');
INSERT INTO `t_sys_log` VALUES ('614', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599764');
INSERT INTO `t_sys_log` VALUES ('615', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599798');
INSERT INTO `t_sys_log` VALUES ('616', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599798');
INSERT INTO `t_sys_log` VALUES ('617', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599814');
INSERT INTO `t_sys_log` VALUES ('618', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599814');
INSERT INTO `t_sys_log` VALUES ('619', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599839');
INSERT INTO `t_sys_log` VALUES ('620', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599839');
INSERT INTO `t_sys_log` VALUES ('621', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599979');
INSERT INTO `t_sys_log` VALUES ('622', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599979');
INSERT INTO `t_sys_log` VALUES ('623', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417599984');
INSERT INTO `t_sys_log` VALUES ('624', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599987');
INSERT INTO `t_sys_log` VALUES ('625', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417599987');
INSERT INTO `t_sys_log` VALUES ('626', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600175');
INSERT INTO `t_sys_log` VALUES ('627', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600175');
INSERT INTO `t_sys_log` VALUES ('628', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600181');
INSERT INTO `t_sys_log` VALUES ('629', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600358');
INSERT INTO `t_sys_log` VALUES ('630', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600359');
INSERT INTO `t_sys_log` VALUES ('631', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600365');
INSERT INTO `t_sys_log` VALUES ('632', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600368');
INSERT INTO `t_sys_log` VALUES ('633', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600368');
INSERT INTO `t_sys_log` VALUES ('634', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"1,2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600396');
INSERT INTO `t_sys_log` VALUES ('635', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600407');
INSERT INTO `t_sys_log` VALUES ('636', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600422');
INSERT INTO `t_sys_log` VALUES ('637', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600423');
INSERT INTO `t_sys_log` VALUES ('638', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:21:\"资源导航图片：\";}}', '1417600492');
INSERT INTO `t_sys_log` VALUES ('639', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600508');
INSERT INTO `t_sys_log` VALUES ('640', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600508');
INSERT INTO `t_sys_log` VALUES ('641', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600512');
INSERT INTO `t_sys_log` VALUES ('642', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600613');
INSERT INTO `t_sys_log` VALUES ('643', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600613');
INSERT INTO `t_sys_log` VALUES ('644', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600616');
INSERT INTO `t_sys_log` VALUES ('645', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600619');
INSERT INTO `t_sys_log` VALUES ('646', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417600619');
INSERT INTO `t_sys_log` VALUES ('647', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417600623');
INSERT INTO `t_sys_log` VALUES ('648', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:7:\"notice1\";s:6:\"status\";s:1:\"1\";}}', '1417601286');
INSERT INTO `t_sys_log` VALUES ('649', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:3:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:7:\"notice2\";s:6:\"status\";s:1:\"1\";}}', '1417601333');
INSERT INTO `t_sys_log` VALUES ('650', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"3\";}}', '1417601343');
INSERT INTO `t_sys_log` VALUES ('651', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:8:\"adfasfas\";s:6:\"status\";s:1:\"1\";}}', '1417601352');
INSERT INTO `t_sys_log` VALUES ('652', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"4\";}}', '1417601362');
INSERT INTO `t_sys_log` VALUES ('653', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:7:\"notice3\";s:6:\"status\";s:1:\"1\";}}', '1417601374');
INSERT INTO `t_sys_log` VALUES ('654', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417601585');
INSERT INTO `t_sys_log` VALUES ('655', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417601585');
INSERT INTO `t_sys_log` VALUES ('656', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417601597');
INSERT INTO `t_sys_log` VALUES ('657', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:7:\"notice5\";s:6:\"status\";s:1:\"0\";}}', '1417602079');
INSERT INTO `t_sys_log` VALUES ('658', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417602342');
INSERT INTO `t_sys_log` VALUES ('659', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417602346');
INSERT INTO `t_sys_log` VALUES ('660', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417602346');
INSERT INTO `t_sys_log` VALUES ('661', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417602351');
INSERT INTO `t_sys_log` VALUES ('662', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"sdfs\";s:6:\"status\";s:1:\"1\";}}', '1417602386');
INSERT INTO `t_sys_log` VALUES ('663', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"sdfs\";s:6:\"status\";s:1:\"1\";}}', '1417602392');
INSERT INTO `t_sys_log` VALUES ('664', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:7:\"notice3\";s:6:\"status\";s:1:\"1\";}}', '1417602429');
INSERT INTO `t_sys_log` VALUES ('665', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417602430');
INSERT INTO `t_sys_log` VALUES ('666', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417602431');
INSERT INTO `t_sys_log` VALUES ('667', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417602458');
INSERT INTO `t_sys_log` VALUES ('668', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417602461');
INSERT INTO `t_sys_log` VALUES ('669', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417602461');
INSERT INTO `t_sys_log` VALUES ('670', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:7:\"notice2\";s:6:\"status\";s:1:\"1\";}}', '1417602509');
INSERT INTO `t_sys_log` VALUES ('671', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:9:\"陈高英\";s:6:\"status\";s:1:\"1\";}}', '1417602585');
INSERT INTO `t_sys_log` VALUES ('672', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"9\";}s:4:\"post\";a:3:{s:2:\"id\";s:1:\"9\";s:7:\"content\";s:9:\"吴自豪\";s:6:\"status\";s:1:\"1\";}}', '1417602605');
INSERT INTO `t_sys_log` VALUES ('673', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"9\";}}', '1417602612');
INSERT INTO `t_sys_log` VALUES ('674', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:9:\"乐乐乐\";s:6:\"status\";s:1:\"0\";}}', '1417602630');
INSERT INTO `t_sys_log` VALUES ('675', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603136');
INSERT INTO `t_sys_log` VALUES ('676', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603137');
INSERT INTO `t_sys_log` VALUES ('677', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:6:\"c_keys\";s:3:\"1,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603141');
INSERT INTO `t_sys_log` VALUES ('678', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:11:\"description\";s:6:\"小明\";s:6:\"status\";s:1:\"1\";}}', '1417603201');
INSERT INTO `t_sys_log` VALUES ('679', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603218');
INSERT INTO `t_sys_log` VALUES ('680', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603218');
INSERT INTO `t_sys_log` VALUES ('681', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603225');
INSERT INTO `t_sys_log` VALUES ('682', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"11\";}}', '1417603281');
INSERT INTO `t_sys_log` VALUES ('683', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"10\";}}', '1417603285');
INSERT INTO `t_sys_log` VALUES ('684', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603283');
INSERT INTO `t_sys_log` VALUES ('685', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603283');
INSERT INTO `t_sys_log` VALUES ('686', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:6:\"小明\";s:6:\"status\";s:1:\"0\";}}', '1417603299');
INSERT INTO `t_sys_log` VALUES ('687', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603332');
INSERT INTO `t_sys_log` VALUES ('688', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603335');
INSERT INTO `t_sys_log` VALUES ('689', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603335');
INSERT INTO `t_sys_log` VALUES ('690', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"1,2,3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603345');
INSERT INTO `t_sys_log` VALUES ('691', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603347');
INSERT INTO `t_sys_log` VALUES ('692', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603347');
INSERT INTO `t_sys_log` VALUES ('693', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603377');
INSERT INTO `t_sys_log` VALUES ('694', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603377');
INSERT INTO `t_sys_log` VALUES ('695', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603462');
INSERT INTO `t_sys_log` VALUES ('696', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603462');
INSERT INTO `t_sys_log` VALUES ('697', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"12\";}}', '1417603482');
INSERT INTO `t_sys_log` VALUES ('698', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603484');
INSERT INTO `t_sys_log` VALUES ('699', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603484');
INSERT INTO `t_sys_log` VALUES ('700', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603527');
INSERT INTO `t_sys_log` VALUES ('701', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603527');
INSERT INTO `t_sys_log` VALUES ('702', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603570');
INSERT INTO `t_sys_log` VALUES ('703', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603570');
INSERT INTO `t_sys_log` VALUES ('704', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603596');
INSERT INTO `t_sys_log` VALUES ('705', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603596');
INSERT INTO `t_sys_log` VALUES ('706', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:6:\"小张\";s:6:\"status\";s:1:\"0\";}}', '1417603694');
INSERT INTO `t_sys_log` VALUES ('707', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:15:\"速度快放假\";s:6:\"status\";s:1:\"1\";}}', '1417603756');
INSERT INTO `t_sys_log` VALUES ('708', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603770');
INSERT INTO `t_sys_log` VALUES ('709', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603770');
INSERT INTO `t_sys_log` VALUES ('710', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"5\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603778');
INSERT INTO `t_sys_log` VALUES ('711', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603781');
INSERT INTO `t_sys_log` VALUES ('712', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603781');
INSERT INTO `t_sys_log` VALUES ('713', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603814');
INSERT INTO `t_sys_log` VALUES ('714', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603816');
INSERT INTO `t_sys_log` VALUES ('715', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603816');
INSERT INTO `t_sys_log` VALUES ('716', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417603821');
INSERT INTO `t_sys_log` VALUES ('717', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603823');
INSERT INTO `t_sys_log` VALUES ('718', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603823');
INSERT INTO `t_sys_log` VALUES ('719', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603932');
INSERT INTO `t_sys_log` VALUES ('720', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417603932');
INSERT INTO `t_sys_log` VALUES ('721', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604025');
INSERT INTO `t_sys_log` VALUES ('722', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604025');
INSERT INTO `t_sys_log` VALUES ('723', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417604054');
INSERT INTO `t_sys_log` VALUES ('724', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604064');
INSERT INTO `t_sys_log` VALUES ('725', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604064');
INSERT INTO `t_sys_log` VALUES ('726', 'admin', 'Library', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:12:{s:5:\"title\";s:1:\"1\";s:2:\"id\";s:1:\"1\";s:8:\"courseId\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:4:\"rpId\";s:0:\"\";s:5:\"price\";s:1:\"1\";s:4:\"auth\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:19:\"6/547d8b2b58106.jpg\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417604081');
INSERT INTO `t_sys_log` VALUES ('727', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604132');
INSERT INTO `t_sys_log` VALUES ('728', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604133');
INSERT INTO `t_sys_log` VALUES ('729', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:9:\"司法所\";s:6:\"status\";s:1:\"1\";}}', '1417604400');
INSERT INTO `t_sys_log` VALUES ('730', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604456');
INSERT INTO `t_sys_log` VALUES ('731', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604456');
INSERT INTO `t_sys_log` VALUES ('732', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604504');
INSERT INTO `t_sys_log` VALUES ('733', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604504');
INSERT INTO `t_sys_log` VALUES ('734', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604558');
INSERT INTO `t_sys_log` VALUES ('735', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417604558');
INSERT INTO `t_sys_log` VALUES ('736', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654537');
INSERT INTO `t_sys_log` VALUES ('737', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654537');
INSERT INTO `t_sys_log` VALUES ('738', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654605');
INSERT INTO `t_sys_log` VALUES ('739', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654606');
INSERT INTO `t_sys_log` VALUES ('740', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654659');
INSERT INTO `t_sys_log` VALUES ('741', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654659');
INSERT INTO `t_sys_log` VALUES ('742', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"3\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417654671');
INSERT INTO `t_sys_log` VALUES ('743', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654674');
INSERT INTO `t_sys_log` VALUES ('744', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654674');
INSERT INTO `t_sys_log` VALUES ('745', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654733');
INSERT INTO `t_sys_log` VALUES ('746', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654733');
INSERT INTO `t_sys_log` VALUES ('747', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"3,2,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417654745');
INSERT INTO `t_sys_log` VALUES ('748', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654748');
INSERT INTO `t_sys_log` VALUES ('749', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654748');
INSERT INTO `t_sys_log` VALUES ('750', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654797');
INSERT INTO `t_sys_log` VALUES ('751', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654797');
INSERT INTO `t_sys_log` VALUES ('752', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654818');
INSERT INTO `t_sys_log` VALUES ('753', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654818');
INSERT INTO `t_sys_log` VALUES ('754', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:7:\"3,2,1,5\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417654822');
INSERT INTO `t_sys_log` VALUES ('755', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654825');
INSERT INTO `t_sys_log` VALUES ('756', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654825');
INSERT INTO `t_sys_log` VALUES ('757', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654867');
INSERT INTO `t_sys_log` VALUES ('758', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654867');
INSERT INTO `t_sys_log` VALUES ('759', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:5:\"3,2,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417654870');
INSERT INTO `t_sys_log` VALUES ('760', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654912');
INSERT INTO `t_sys_log` VALUES ('761', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417654912');
INSERT INTO `t_sys_log` VALUES ('762', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655065');
INSERT INTO `t_sys_log` VALUES ('763', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655065');
INSERT INTO `t_sys_log` VALUES ('764', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655129');
INSERT INTO `t_sys_log` VALUES ('765', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655129');
INSERT INTO `t_sys_log` VALUES ('766', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655177');
INSERT INTO `t_sys_log` VALUES ('767', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655177');
INSERT INTO `t_sys_log` VALUES ('768', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655178');
INSERT INTO `t_sys_log` VALUES ('769', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655256');
INSERT INTO `t_sys_log` VALUES ('770', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655256');
INSERT INTO `t_sys_log` VALUES ('771', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655256');
INSERT INTO `t_sys_log` VALUES ('772', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655633');
INSERT INTO `t_sys_log` VALUES ('773', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655633');
INSERT INTO `t_sys_log` VALUES ('774', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655633');
INSERT INTO `t_sys_log` VALUES ('775', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655746');
INSERT INTO `t_sys_log` VALUES ('776', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655746');
INSERT INTO `t_sys_log` VALUES ('777', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655746');
INSERT INTO `t_sys_log` VALUES ('778', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655798');
INSERT INTO `t_sys_log` VALUES ('779', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655798');
INSERT INTO `t_sys_log` VALUES ('780', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655798');
INSERT INTO `t_sys_log` VALUES ('781', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655798');
INSERT INTO `t_sys_log` VALUES ('782', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:0:\"\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417655802');
INSERT INTO `t_sys_log` VALUES ('783', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655804');
INSERT INTO `t_sys_log` VALUES ('784', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655804');
INSERT INTO `t_sys_log` VALUES ('785', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655804');
INSERT INTO `t_sys_log` VALUES ('786', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655804');
INSERT INTO `t_sys_log` VALUES ('787', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655989');
INSERT INTO `t_sys_log` VALUES ('788', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417655989');
INSERT INTO `t_sys_log` VALUES ('789', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417655989');
INSERT INTO `t_sys_log` VALUES ('790', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656032');
INSERT INTO `t_sys_log` VALUES ('791', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656032');
INSERT INTO `t_sys_log` VALUES ('792', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656032');
INSERT INTO `t_sys_log` VALUES ('793', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656145');
INSERT INTO `t_sys_log` VALUES ('794', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656145');
INSERT INTO `t_sys_log` VALUES ('795', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656145');
INSERT INTO `t_sys_log` VALUES ('796', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656265');
INSERT INTO `t_sys_log` VALUES ('797', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656265');
INSERT INTO `t_sys_log` VALUES ('798', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656265');
INSERT INTO `t_sys_log` VALUES ('799', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656266');
INSERT INTO `t_sys_log` VALUES ('800', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656627');
INSERT INTO `t_sys_log` VALUES ('801', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656627');
INSERT INTO `t_sys_log` VALUES ('802', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656627');
INSERT INTO `t_sys_log` VALUES ('803', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656628');
INSERT INTO `t_sys_log` VALUES ('804', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:17:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417656633');
INSERT INTO `t_sys_log` VALUES ('805', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656635');
INSERT INTO `t_sys_log` VALUES ('806', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656636');
INSERT INTO `t_sys_log` VALUES ('807', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656636');
INSERT INTO `t_sys_log` VALUES ('808', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656636');
INSERT INTO `t_sys_log` VALUES ('809', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656650');
INSERT INTO `t_sys_log` VALUES ('810', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656650');
INSERT INTO `t_sys_log` VALUES ('811', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656650');
INSERT INTO `t_sys_log` VALUES ('812', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656650');
INSERT INTO `t_sys_log` VALUES ('813', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656679');
INSERT INTO `t_sys_log` VALUES ('814', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656679');
INSERT INTO `t_sys_log` VALUES ('815', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656679');
INSERT INTO `t_sys_log` VALUES ('816', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656679');
INSERT INTO `t_sys_log` VALUES ('817', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656691');
INSERT INTO `t_sys_log` VALUES ('818', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656691');
INSERT INTO `t_sys_log` VALUES ('819', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656691');
INSERT INTO `t_sys_log` VALUES ('820', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656691');
INSERT INTO `t_sys_log` VALUES ('821', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656699');
INSERT INTO `t_sys_log` VALUES ('822', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656699');
INSERT INTO `t_sys_log` VALUES ('823', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656699');
INSERT INTO `t_sys_log` VALUES ('824', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656699');
INSERT INTO `t_sys_log` VALUES ('825', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656708');
INSERT INTO `t_sys_log` VALUES ('826', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656708');
INSERT INTO `t_sys_log` VALUES ('827', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656708');
INSERT INTO `t_sys_log` VALUES ('828', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656708');
INSERT INTO `t_sys_log` VALUES ('829', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417656750');
INSERT INTO `t_sys_log` VALUES ('830', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656753');
INSERT INTO `t_sys_log` VALUES ('831', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656753');
INSERT INTO `t_sys_log` VALUES ('832', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656753');
INSERT INTO `t_sys_log` VALUES ('833', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656754');
INSERT INTO `t_sys_log` VALUES ('834', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656829');
INSERT INTO `t_sys_log` VALUES ('835', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:0:\"\";}s:4:\"post\";a:0:{}}', '1417656831');
INSERT INTO `t_sys_log` VALUES ('836', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:0:\"\";}s:4:\"post\";a:0:{}}', '1417656831');
INSERT INTO `t_sys_log` VALUES ('837', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656831');
INSERT INTO `t_sys_log` VALUES ('838', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656857');
INSERT INTO `t_sys_log` VALUES ('839', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656857');
INSERT INTO `t_sys_log` VALUES ('840', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656857');
INSERT INTO `t_sys_log` VALUES ('841', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656858');
INSERT INTO `t_sys_log` VALUES ('842', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656965');
INSERT INTO `t_sys_log` VALUES ('843', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656966');
INSERT INTO `t_sys_log` VALUES ('844', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417656966');
INSERT INTO `t_sys_log` VALUES ('845', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417656966');
INSERT INTO `t_sys_log` VALUES ('846', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417657055');
INSERT INTO `t_sys_log` VALUES ('847', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417657056');
INSERT INTO `t_sys_log` VALUES ('848', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417657056');
INSERT INTO `t_sys_log` VALUES ('849', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417657057');
INSERT INTO `t_sys_log` VALUES ('850', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417658582');
INSERT INTO `t_sys_log` VALUES ('851', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417658582');
INSERT INTO `t_sys_log` VALUES ('852', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417658800');
INSERT INTO `t_sys_log` VALUES ('853', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417658800');
INSERT INTO `t_sys_log` VALUES ('854', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417658820');
INSERT INTO `t_sys_log` VALUES ('855', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417658821');
INSERT INTO `t_sys_log` VALUES ('856', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:2:{s:4:\"type\";s:5:\"stage\";s:4:\"chId\";s:2:\"20\";}s:4:\"post\";a:0:{}}', '1417658821');
INSERT INTO `t_sys_log` VALUES ('857', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417658821');
INSERT INTO `t_sys_log` VALUES ('858', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417659071');
INSERT INTO `t_sys_log` VALUES ('859', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417659071');
INSERT INTO `t_sys_log` VALUES ('860', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:8:\"courseId\";s:0:\"\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417659157');
INSERT INTO `t_sys_log` VALUES ('861', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417659168');
INSERT INTO `t_sys_log` VALUES ('862', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"知识点名称一\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417660365');
INSERT INTO `t_sys_log` VALUES ('863', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"知识点名称一\";s:8:\"courseId\";s:2:\"1c\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417660561');
INSERT INTO `t_sys_log` VALUES ('864', 'admin', 'Section', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:10:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"test\";s:7:\"topicId\";s:1:\"1\";s:5:\"libId\";s:0:\"\";s:11:\"previewList\";s:0:\"\";s:10:\"lessonList\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417661058');
INSERT INTO `t_sys_log` VALUES ('865', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417661885');
INSERT INTO `t_sys_log` VALUES ('866', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417661885');
INSERT INTO `t_sys_log` VALUES ('867', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417662187');
INSERT INTO `t_sys_log` VALUES ('868', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417662187');
INSERT INTO `t_sys_log` VALUES ('869', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417662788');
INSERT INTO `t_sys_log` VALUES ('870', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417662788');
INSERT INTO `t_sys_log` VALUES ('871', 'admin', 'Upfile', 'count', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}', '1417662939');
INSERT INTO `t_sys_log` VALUES ('872', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417672514');
INSERT INTO `t_sys_log` VALUES ('873', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417673750');
INSERT INTO `t_sys_log` VALUES ('874', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417673750');
INSERT INTO `t_sys_log` VALUES ('875', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417675338');
INSERT INTO `t_sys_log` VALUES ('876', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417675338');
INSERT INTO `t_sys_log` VALUES ('877', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:45:\"1=热门\r\n2=推荐\r\n3=置顶                 \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:51:\"2001=某某出版社\r\n2002=xxxx                    \";}}', '1417678199');
INSERT INTO `t_sys_log` VALUES ('878', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:51:\"2001=某某出版社\r\n2002=xxxx                    \";}}', '1417678210');
INSERT INTO `t_sys_log` VALUES ('879', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1417678213');
INSERT INTO `t_sys_log` VALUES ('880', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1417678228');
INSERT INTO `t_sys_log` VALUES ('881', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678690');
INSERT INTO `t_sys_log` VALUES ('882', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678690');
INSERT INTO `t_sys_log` VALUES ('883', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678703');
INSERT INTO `t_sys_log` VALUES ('884', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678703');
INSERT INTO `t_sys_log` VALUES ('885', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"3\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417678711');
INSERT INTO `t_sys_log` VALUES ('886', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678715');
INSERT INTO `t_sys_log` VALUES ('887', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678716');
INSERT INTO `t_sys_log` VALUES ('888', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678747');
INSERT INTO `t_sys_log` VALUES ('889', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417678747');
INSERT INTO `t_sys_log` VALUES ('890', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417678751');
INSERT INTO `t_sys_log` VALUES ('891', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679045');
INSERT INTO `t_sys_log` VALUES ('892', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679046');
INSERT INTO `t_sys_log` VALUES ('893', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679046');
INSERT INTO `t_sys_log` VALUES ('894', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679046');
INSERT INTO `t_sys_log` VALUES ('895', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679166');
INSERT INTO `t_sys_log` VALUES ('896', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679166');
INSERT INTO `t_sys_log` VALUES ('897', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679166');
INSERT INTO `t_sys_log` VALUES ('898', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679166');
INSERT INTO `t_sys_log` VALUES ('899', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"大班\";s:4:\"sKey\";s:3:\"big\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417679199');
INSERT INTO `t_sys_log` VALUES ('900', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679205');
INSERT INTO `t_sys_log` VALUES ('901', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679205');
INSERT INTO `t_sys_log` VALUES ('902', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679205');
INSERT INTO `t_sys_log` VALUES ('903', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679205');
INSERT INTO `t_sys_log` VALUES ('904', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679209');
INSERT INTO `t_sys_log` VALUES ('905', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679213');
INSERT INTO `t_sys_log` VALUES ('906', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679213');
INSERT INTO `t_sys_log` VALUES ('907', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679213');
INSERT INTO `t_sys_log` VALUES ('908', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679213');
INSERT INTO `t_sys_log` VALUES ('909', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679217');
INSERT INTO `t_sys_log` VALUES ('910', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679444');
INSERT INTO `t_sys_log` VALUES ('911', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679444');
INSERT INTO `t_sys_log` VALUES ('912', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679444');
INSERT INTO `t_sys_log` VALUES ('913', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679444');
INSERT INTO `t_sys_log` VALUES ('914', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:7:\"stageId\";s:4:\",2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679448');
INSERT INTO `t_sys_log` VALUES ('915', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679510');
INSERT INTO `t_sys_log` VALUES ('916', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679510');
INSERT INTO `t_sys_log` VALUES ('917', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679510');
INSERT INTO `t_sys_log` VALUES ('918', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679510');
INSERT INTO `t_sys_log` VALUES ('919', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679514');
INSERT INTO `t_sys_log` VALUES ('920', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679517');
INSERT INTO `t_sys_log` VALUES ('921', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679517');
INSERT INTO `t_sys_log` VALUES ('922', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679517');
INSERT INTO `t_sys_log` VALUES ('923', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679517');
INSERT INTO `t_sys_log` VALUES ('924', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679662');
INSERT INTO `t_sys_log` VALUES ('925', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679662');
INSERT INTO `t_sys_log` VALUES ('926', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679662');
INSERT INTO `t_sys_log` VALUES ('927', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679662');
INSERT INTO `t_sys_log` VALUES ('928', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679666');
INSERT INTO `t_sys_log` VALUES ('929', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679668');
INSERT INTO `t_sys_log` VALUES ('930', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679668');
INSERT INTO `t_sys_log` VALUES ('931', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679668');
INSERT INTO `t_sys_log` VALUES ('932', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679668');
INSERT INTO `t_sys_log` VALUES ('933', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679672');
INSERT INTO `t_sys_log` VALUES ('934', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679778');
INSERT INTO `t_sys_log` VALUES ('935', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679778');
INSERT INTO `t_sys_log` VALUES ('936', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679778');
INSERT INTO `t_sys_log` VALUES ('937', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679778');
INSERT INTO `t_sys_log` VALUES ('938', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:1:\"2\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679779');
INSERT INTO `t_sys_log` VALUES ('939', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679859');
INSERT INTO `t_sys_log` VALUES ('940', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679859');
INSERT INTO `t_sys_log` VALUES ('941', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417679859');
INSERT INTO `t_sys_log` VALUES ('942', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417679859');
INSERT INTO `t_sys_log` VALUES ('943', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:19:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417679862');
INSERT INTO `t_sys_log` VALUES ('944', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417680429');
INSERT INTO `t_sys_log` VALUES ('945', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417680429');
INSERT INTO `t_sys_log` VALUES ('946', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417680429');
INSERT INTO `t_sys_log` VALUES ('947', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417680429');
INSERT INTO `t_sys_log` VALUES ('948', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681080');
INSERT INTO `t_sys_log` VALUES ('949', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681080');
INSERT INTO `t_sys_log` VALUES ('950', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681080');
INSERT INTO `t_sys_log` VALUES ('951', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681080');
INSERT INTO `t_sys_log` VALUES ('952', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681105');
INSERT INTO `t_sys_log` VALUES ('953', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681105');
INSERT INTO `t_sys_log` VALUES ('954', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681105');
INSERT INTO `t_sys_log` VALUES ('955', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681105');
INSERT INTO `t_sys_log` VALUES ('956', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:12:\"organization\";s:1:\"d\";s:8:\"lecturer\";s:1:\"d\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417681110');
INSERT INTO `t_sys_log` VALUES ('957', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681112');
INSERT INTO `t_sys_log` VALUES ('958', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681112');
INSERT INTO `t_sys_log` VALUES ('959', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681112');
INSERT INTO `t_sys_log` VALUES ('960', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681112');
INSERT INTO `t_sys_log` VALUES ('961', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"1\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417681119');
INSERT INTO `t_sys_log` VALUES ('962', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681175');
INSERT INTO `t_sys_log` VALUES ('963', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681175');
INSERT INTO `t_sys_log` VALUES ('964', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681175');
INSERT INTO `t_sys_log` VALUES ('965', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681175');
INSERT INTO `t_sys_log` VALUES ('966', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681214');
INSERT INTO `t_sys_log` VALUES ('967', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681214');
INSERT INTO `t_sys_log` VALUES ('968', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417681214');
INSERT INTO `t_sys_log` VALUES ('969', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417681214');
INSERT INTO `t_sys_log` VALUES ('970', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:9:\"啊打发\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:18:\"阿打发斯蒂芬\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417688450');
INSERT INTO `t_sys_log` VALUES ('971', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:21:\"是地方胜多负少\";s:6:\"status\";s:1:\"0\";}}', '1417689438');
INSERT INTO `t_sys_log` VALUES ('972', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:3:{s:2:\"id\";s:2:\"16\";s:7:\"content\";s:2:\"ZZ\";s:6:\"status\";s:1:\"0\";}}', '1417689475');
INSERT INTO `t_sys_log` VALUES ('973', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:21:\"地方是否是奋斗\";s:6:\"status\";s:1:\"1\";}}', '1417689518');
INSERT INTO `t_sys_log` VALUES ('974', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:9:\"地方的\";s:6:\"status\";s:1:\"1\";}}', '1417689596');
INSERT INTO `t_sys_log` VALUES ('975', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"17\";}}', '1417689684');
INSERT INTO `t_sys_log` VALUES ('976', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:3:{s:2:\"id\";s:2:\"16\";s:7:\"content\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417689720');
INSERT INTO `t_sys_log` VALUES ('977', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1417692193');
INSERT INTO `t_sys_log` VALUES ('978', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417743659');
INSERT INTO `t_sys_log` VALUES ('979', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1417757801');
INSERT INTO `t_sys_log` VALUES ('980', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417757873');
INSERT INTO `t_sys_log` VALUES ('981', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417757873');
INSERT INTO `t_sys_log` VALUES ('982', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417757874');
INSERT INTO `t_sys_log` VALUES ('983', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417757874');
INSERT INTO `t_sys_log` VALUES ('984', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:18:\"阿打发斯蒂芬\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417764584');
INSERT INTO `t_sys_log` VALUES ('985', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417765160');
INSERT INTO `t_sys_log` VALUES ('986', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417765467');
INSERT INTO `t_sys_log` VALUES ('987', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417766191');
INSERT INTO `t_sys_log` VALUES ('988', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417766863');
INSERT INTO `t_sys_log` VALUES ('989', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"知识点名称一\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417767000');
INSERT INTO `t_sys_log` VALUES ('990', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:18:\"知识点名称一\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417767026');
INSERT INTO `t_sys_log` VALUES ('991', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:1:\"2\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417767150');
INSERT INTO `t_sys_log` VALUES ('992', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417767463');
INSERT INTO `t_sys_log` VALUES ('993', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:0:\"\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768148');
INSERT INTO `t_sys_log` VALUES ('994', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768159');
INSERT INTO `t_sys_log` VALUES ('995', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768249');
INSERT INTO `t_sys_log` VALUES ('996', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:1:\"e\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768324');
INSERT INTO `t_sys_log` VALUES ('997', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768357');
INSERT INTO `t_sys_log` VALUES ('998', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:1:\"1\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768436');
INSERT INTO `t_sys_log` VALUES ('999', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:10:\"知识点2\";s:8:\"courseId\";s:0:\"\";s:10:\"sectionIds\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:19:\"阿打发斯蒂芬d\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"0\";}}', '1417768454');
INSERT INTO `t_sys_log` VALUES ('1000', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417768886');
INSERT INTO `t_sys_log` VALUES ('1001', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417768886');
INSERT INTO `t_sys_log` VALUES ('1002', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"小班\";s:4:\"sKey\";s:5:\"small\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417770230');
INSERT INTO `t_sys_log` VALUES ('1003', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"小班\";s:4:\"sKey\";s:5:\"small\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417770238');
INSERT INTO `t_sys_log` VALUES ('1004', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"二年级\";s:4:\"sKey\";s:6:\"second\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417770339');
INSERT INTO `t_sys_log` VALUES ('1005', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:5:\"dfasf\";s:8:\"courseId\";s:5:\"adsfa\";s:10:\"sectionIds\";s:5:\"adfas\";s:6:\"imgUrl\";s:8:\"adfasfas\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417770419');
INSERT INTO `t_sys_log` VALUES ('1006', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417770436');
INSERT INTO `t_sys_log` VALUES ('1007', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417770436');
INSERT INTO `t_sys_log` VALUES ('1008', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417770436');
INSERT INTO `t_sys_log` VALUES ('1009', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417770436');
INSERT INTO `t_sys_log` VALUES ('1010', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1417771326');
INSERT INTO `t_sys_log` VALUES ('1011', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:3:{s:2:\"id\";s:2:\"16\";s:7:\"content\";s:3:\"qwq\";s:6:\"status\";s:1:\"1\";}}', '1417776852');
INSERT INTO `t_sys_log` VALUES ('1012', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"18\";}s:4:\"post\";a:3:{s:2:\"id\";s:2:\"18\";s:7:\"content\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1417776870');
INSERT INTO `t_sys_log` VALUES ('1013', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417777487');
INSERT INTO `t_sys_log` VALUES ('1014', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417777487');
INSERT INTO `t_sys_log` VALUES ('1015', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417777487');
INSERT INTO `t_sys_log` VALUES ('1016', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417777487');
INSERT INTO `t_sys_log` VALUES ('1017', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417777491');
INSERT INTO `t_sys_log` VALUES ('1018', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417777491');
INSERT INTO `t_sys_log` VALUES ('1019', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417777491');
INSERT INTO `t_sys_log` VALUES ('1020', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417777492');
INSERT INTO `t_sys_log` VALUES ('1021', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:4:\"tags\";s:1:\"1\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1417777498');
INSERT INTO `t_sys_log` VALUES ('1022', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417778059');
INSERT INTO `t_sys_log` VALUES ('1023', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417778059');
INSERT INTO `t_sys_log` VALUES ('1024', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1417778059');
INSERT INTO `t_sys_log` VALUES ('1025', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1417778059');
INSERT INTO `t_sys_log` VALUES ('1026', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:1:\"1\";s:3:\"sex\";s:1:\"2\";s:7:\"stageId\";s:1:\"3\";s:8:\"nickName\";s:1:\"4\";s:9:\"interests\";s:1:\"4\";s:9:\"advantage\";s:1:\"4\";s:12:\"disAdvantage\";s:1:\"4\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"4\";s:6:\"status\";s:1:\"0\";}}', '1417779435');
INSERT INTO `t_sys_log` VALUES ('1027', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:1:\"2\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:1:\"2\";s:8:\"nickName\";s:1:\"2\";s:9:\"interests\";s:1:\"2\";s:9:\"advantage\";s:1:\"2\";s:12:\"disAdvantage\";s:1:\"2\";s:5:\"level\";s:1:\"2\";s:5:\"point\";s:1:\"2\";s:4:\"face\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}}', '1417780222');
INSERT INTO `t_sys_log` VALUES ('1028', 'admin', 'Role', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"2\";}}', '1418001701');
INSERT INTO `t_sys_log` VALUES ('1029', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"1\";s:6:\"userId\";s:0:\"\";s:3:\"sex\";s:1:\"2\";s:7:\"stageId\";s:1:\"3\";s:8:\"nickName\";s:1:\"4\";s:9:\"interests\";s:1:\"4\";s:9:\"advantage\";s:1:\"4\";s:12:\"disAdvantage\";s:1:\"4\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"4\";s:6:\"status\";s:1:\"0\";}}', '1418001755');
INSERT INTO `t_sys_log` VALUES ('1030', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:0:\"\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:1:\"2\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418001922');
INSERT INTO `t_sys_log` VALUES ('1031', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:1:\"2\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:1:\"2\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418001927');
INSERT INTO `t_sys_log` VALUES ('1032', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:0:\"\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:1:\"2\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418001946');
INSERT INTO `t_sys_log` VALUES ('1033', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:1:\"1\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:1:\"2\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418001950');
INSERT INTO `t_sys_log` VALUES ('1034', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:1:\"1\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:0:\"\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418002029');
INSERT INTO `t_sys_log` VALUES ('1035', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:1:\"1\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:1:\"2\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418002043');
INSERT INTO `t_sys_log` VALUES ('1036', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:1:\"1\";s:3:\"sex\";s:1:\"1\";s:7:\"stageId\";s:2:\"33\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418002122');
INSERT INTO `t_sys_log` VALUES ('1037', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1418003131');
INSERT INTO `t_sys_log` VALUES ('1038', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"13\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"13\";s:7:\"content\";s:6:\"小张\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"0\";}}', '1418005280');
INSERT INTO `t_sys_log` VALUES ('1039', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"13\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"13\";s:7:\"content\";s:6:\"小张\";s:9:\"noticeKey\";s:6:\"bottom\";s:6:\"status\";s:1:\"0\";}}', '1418005338');
INSERT INTO `t_sys_log` VALUES ('1040', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"14\";s:7:\"content\";s:15:\"速度快放假\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005342');
INSERT INTO `t_sys_log` VALUES ('1041', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"14\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"14\";s:7:\"content\";s:15:\"速度快放假\";s:9:\"noticeKey\";s:6:\"bottom\";s:6:\"status\";s:1:\"1\";}}', '1418005351');
INSERT INTO `t_sys_log` VALUES ('1042', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"18\";}}', '1418005357');
INSERT INTO `t_sys_log` VALUES ('1043', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1418005363');
INSERT INTO `t_sys_log` VALUES ('1044', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"15\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"15\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:3:\"top\";s:6:\"status\";s:1:\"1\";}}', '1418005372');
INSERT INTO `t_sys_log` VALUES ('1045', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"15\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"15\";s:7:\"content\";s:9:\"开学了\";s:9:\"noticeKey\";s:3:\"top\";s:6:\"status\";s:1:\"1\";}}', '1418005413');
INSERT INTO `t_sys_log` VALUES ('1046', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005439');
INSERT INTO `t_sys_log` VALUES ('1047', 'admin', 'Topic', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:8:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:8:\"courseId\";s:0:\"\";s:10:\"sectionIds\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005483');
INSERT INTO `t_sys_log` VALUES ('1048', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:0:\"\";s:7:\"stageId\";s:0:\"\";s:3:\"sex\";s:0:\"\";s:8:\"nickName\";s:0:\"\";s:9:\"interests\";s:0:\"\";s:9:\"advantage\";s:0:\"\";s:12:\"disAdvantage\";s:0:\"\";s:5:\"level\";s:0:\"\";s:5:\"point\";s:0:\"\";s:4:\"face\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005492');
INSERT INTO `t_sys_log` VALUES ('1049', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:1:\"9\";s:7:\"stageId\";s:0:\"\";s:3:\"sex\";s:0:\"\";s:8:\"nickName\";s:0:\"\";s:9:\"interests\";s:0:\"\";s:9:\"advantage\";s:0:\"\";s:12:\"disAdvantage\";s:0:\"\";s:5:\"level\";s:0:\"\";s:5:\"point\";s:0:\"\";s:4:\"face\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005500');
INSERT INTO `t_sys_log` VALUES ('1050', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005507');
INSERT INTO `t_sys_log` VALUES ('1051', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:2:\"hk\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005534');
INSERT INTO `t_sys_log` VALUES ('1052', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"21\";}}', '1418005539');
INSERT INTO `t_sys_log` VALUES ('1053', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"19\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"19\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005542');
INSERT INTO `t_sys_log` VALUES ('1054', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"19\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"19\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005545');
INSERT INTO `t_sys_log` VALUES ('1055', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"19\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"19\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005547');
INSERT INTO `t_sys_log` VALUES ('1056', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"19\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"19\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005880');
INSERT INTO `t_sys_log` VALUES ('1057', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005886');
INSERT INTO `t_sys_log` VALUES ('1058', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:3:\"sad\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005892');
INSERT INTO `t_sys_log` VALUES ('1059', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418005898');
INSERT INTO `t_sys_log` VALUES ('1060', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"19\";}}', '1418005913');
INSERT INTO `t_sys_log` VALUES ('1061', 'admin', 'Notice', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"20\";}}', '1418005917');
INSERT INTO `t_sys_log` VALUES ('1062', '', 'Public', 'login', 'a:2:{s:3:\"get\";a:1:{s:4:\"ajax\";s:4:\"true\";}s:4:\"post\";a:1:{s:8:\"userName\";s:5:\"admin\";}}', '1418006617');
INSERT INTO `t_sys_log` VALUES ('1063', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:1:\"1\";s:7:\"stageId\";s:2:\"33\";s:3:\"sex\";s:0:\"\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418006723');
INSERT INTO `t_sys_log` VALUES ('1064', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"3\";s:6:\"userId\";s:1:\"1\";s:7:\"stageId\";s:2:\"33\";s:3:\"sex\";s:1:\"0\";s:8:\"nickName\";s:9:\"蜘蛛侠\";s:9:\"interests\";s:6:\"游戏\";s:9:\"advantage\";s:3:\"无\";s:12:\"disAdvantage\";s:3:\"吴\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418006729');
INSERT INTO `t_sys_log` VALUES ('1065', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:0:\"\";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418006800');
INSERT INTO `t_sys_log` VALUES ('1066', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:3:\"sf \";s:9:\"noticeKey\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418006805');
INSERT INTO `t_sys_log` VALUES ('1067', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:7:\"content\";s:3:\"sf \";s:9:\"noticeKey\";s:3:\"afd\";s:6:\"status\";s:1:\"1\";}}', '1418006808');
INSERT INTO `t_sys_log` VALUES ('1068', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"22\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"22\";s:7:\"content\";s:3:\"sf \";s:9:\"noticeKey\";s:4:\"left\";s:6:\"status\";s:1:\"1\";}}', '1418006819');
INSERT INTO `t_sys_log` VALUES ('1069', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418022615');
INSERT INTO `t_sys_log` VALUES ('1070', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418024598');
INSERT INTO `t_sys_log` VALUES ('1071', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418030085');
INSERT INTO `t_sys_log` VALUES ('1072', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"19\";}s:4:\"post\";a:10:{s:3:\"pId\";s:2:\"12\";s:2:\"id\";s:2:\"19\";s:4:\"name\";s:6:\"幼教\";s:5:\"chKey\";s:9:\"preschool\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"0\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418030098');
INSERT INTO `t_sys_log` VALUES ('1073', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418030104');
INSERT INTO `t_sys_log` VALUES ('1074', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:9:\"noticeKey\";s:1:\"s\";s:7:\"content\";s:4:\"sdfd\";s:6:\"status\";s:1:\"1\";}}', '1418032173');
INSERT INTO `t_sys_log` VALUES ('1075', 'admin', 'Notice', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:9:\"noticeKey\";s:2:\"sf\";s:7:\"content\";s:6:\"sdfsdf\";s:6:\"status\";s:1:\"1\";}}', '1418032596');
INSERT INTO `t_sys_log` VALUES ('1076', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"23\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"23\";s:9:\"noticeKey\";s:4:\"left\";s:7:\"content\";s:6:\"sdfsdf\";s:6:\"status\";s:1:\"1\";}}', '1418032606');
INSERT INTO `t_sys_log` VALUES ('1077', 'admin', 'Notice', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"23\";}s:4:\"post\";a:4:{s:2:\"id\";s:2:\"23\";s:9:\"noticeKey\";s:2:\"sf\";s:7:\"content\";s:6:\"sdfsdf\";s:6:\"status\";s:1:\"0\";}}', '1418032647');
INSERT INTO `t_sys_log` VALUES ('1078', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"w\";s:4:\"cKey\";s:0:\"\";s:8:\"templete\";s:1:\"e\";}}', '1418034702');
INSERT INTO `t_sys_log` VALUES ('1079', 'admin', 'ProConfig', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:4:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:1:\"w\";s:4:\"cKey\";s:0:\"\";s:8:\"templete\";s:5:\"esdfs\";}}', '1418034726');
INSERT INTO `t_sys_log` VALUES ('1080', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086477');
INSERT INTO `t_sys_log` VALUES ('1081', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:39:\"1=基础1\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086485');
INSERT INTO `t_sys_log` VALUES ('1082', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:39:\"1=基础1\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086487');
INSERT INTO `t_sys_log` VALUES ('1083', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086512');
INSERT INTO `t_sys_log` VALUES ('1084', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086514');
INSERT INTO `t_sys_log` VALUES ('1085', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:39:\"1=基础1\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086523');
INSERT INTO `t_sys_log` VALUES ('1086', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:40:\"s=100*200\r\nm=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:48:\"1=语文\r\n2=数学\r\n3=英语                    \";s:10:\"courseTags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:6:\"volume\";s:38:\"1=上册\r\n2=下册                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418086532');
INSERT INTO `t_sys_log` VALUES ('1087', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094125');
INSERT INTO `t_sys_log` VALUES ('1088', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094125');
INSERT INTO `t_sys_log` VALUES ('1089', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094125');
INSERT INTO `t_sys_log` VALUES ('1090', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094125');
INSERT INTO `t_sys_log` VALUES ('1091', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418094152');
INSERT INTO `t_sys_log` VALUES ('1092', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094156');
INSERT INTO `t_sys_log` VALUES ('1093', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094156');
INSERT INTO `t_sys_log` VALUES ('1094', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094156');
INSERT INTO `t_sys_log` VALUES ('1095', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094156');
INSERT INTO `t_sys_log` VALUES ('1096', 'admin', 'ProConfig', 'reloadConf', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1418094178');
INSERT INTO `t_sys_log` VALUES ('1097', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094184');
INSERT INTO `t_sys_log` VALUES ('1098', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094184');
INSERT INTO `t_sys_log` VALUES ('1099', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094184');
INSERT INTO `t_sys_log` VALUES ('1100', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094185');
INSERT INTO `t_sys_log` VALUES ('1101', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"1\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418094189');
INSERT INTO `t_sys_log` VALUES ('1102', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094198');
INSERT INTO `t_sys_log` VALUES ('1103', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094198');
INSERT INTO `t_sys_log` VALUES ('1104', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094198');
INSERT INTO `t_sys_log` VALUES ('1105', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094198');
INSERT INTO `t_sys_log` VALUES ('1106', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418094202');
INSERT INTO `t_sys_log` VALUES ('1107', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094238');
INSERT INTO `t_sys_log` VALUES ('1108', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094238');
INSERT INTO `t_sys_log` VALUES ('1109', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094238');
INSERT INTO `t_sys_log` VALUES ('1110', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094239');
INSERT INTO `t_sys_log` VALUES ('1111', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418094243');
INSERT INTO `t_sys_log` VALUES ('1112', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094315');
INSERT INTO `t_sys_log` VALUES ('1113', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094315');
INSERT INTO `t_sys_log` VALUES ('1114', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094315');
INSERT INTO `t_sys_log` VALUES ('1115', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094315');
INSERT INTO `t_sys_log` VALUES ('1116', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418094319');
INSERT INTO `t_sys_log` VALUES ('1117', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094456');
INSERT INTO `t_sys_log` VALUES ('1118', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094456');
INSERT INTO `t_sys_log` VALUES ('1119', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094456');
INSERT INTO `t_sys_log` VALUES ('1120', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094457');
INSERT INTO `t_sys_log` VALUES ('1121', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094478');
INSERT INTO `t_sys_log` VALUES ('1122', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094478');
INSERT INTO `t_sys_log` VALUES ('1123', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094478');
INSERT INTO `t_sys_log` VALUES ('1124', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094478');
INSERT INTO `t_sys_log` VALUES ('1125', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"中班\";s:4:\"sKey\";s:6:\"middle\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418094552');
INSERT INTO `t_sys_log` VALUES ('1126', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"0-1岁\";s:4:\"sKey\";s:1:\"1\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418094635');
INSERT INTO `t_sys_log` VALUES ('1127', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"1-2岁\";s:4:\"sKey\";s:1:\"2\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418094649');
INSERT INTO `t_sys_log` VALUES ('1128', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"2-3岁\";s:4:\"sKey\";s:1:\"3\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418094661');
INSERT INTO `t_sys_log` VALUES ('1129', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"8\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"8\";s:4:\"name\";s:6:\"1-2岁\";s:4:\"sKey\";s:1:\"2\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1418094691');
INSERT INTO `t_sys_log` VALUES ('1130', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"9\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"9\";s:4:\"name\";s:6:\"2-3岁\";s:4:\"sKey\";s:1:\"3\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}}', '1418094695');
INSERT INTO `t_sys_log` VALUES ('1131', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:6:\"小班\";s:4:\"sKey\";s:5:\"small\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}}', '1418094702');
INSERT INTO `t_sys_log` VALUES ('1132', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"6\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:6:\"中班\";s:4:\"sKey\";s:6:\"middle\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:1:\"4\";s:6:\"status\";s:1:\"1\";}}', '1418094718');
INSERT INTO `t_sys_log` VALUES ('1133', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:6:\"大班\";s:4:\"sKey\";s:3:\"big\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:1:\"5\";s:6:\"status\";s:1:\"1\";}}', '1418094723');
INSERT INTO `t_sys_log` VALUES ('1134', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:9:\"一年级\";s:4:\"sKey\";s:8:\"gradeOne\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"6\";s:6:\"status\";s:1:\"1\";}}', '1418094727');
INSERT INTO `t_sys_log` VALUES ('1135', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:9:\"二年级\";s:4:\"sKey\";s:6:\"second\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"7\";s:6:\"status\";s:1:\"1\";}}', '1418094731');
INSERT INTO `t_sys_log` VALUES ('1136', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094816');
INSERT INTO `t_sys_log` VALUES ('1137', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418094816');
INSERT INTO `t_sys_log` VALUES ('1138', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094816');
INSERT INTO `t_sys_log` VALUES ('1139', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418094817');
INSERT INTO `t_sys_log` VALUES ('1140', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"5\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:9:\"二年级\";s:4:\"sKey\";s:8:\"gradetwo\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"7\";s:6:\"status\";s:1:\"1\";}}', '1418094978');
INSERT INTO `t_sys_log` VALUES ('1141', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"三年级\";s:4:\"sKey\";s:10:\"gradethree\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"8\";s:6:\"status\";s:1:\"1\";}}', '1418095008');
INSERT INTO `t_sys_log` VALUES ('1142', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"2,3\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:4:\"tags\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418095024');
INSERT INTO `t_sys_log` VALUES ('1143', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"四年级\";s:4:\"sKey\";s:9:\"gradefour\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"9\";s:6:\"status\";s:1:\"1\";}}', '1418095029');
INSERT INTO `t_sys_log` VALUES ('1144', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418095045');
INSERT INTO `t_sys_log` VALUES ('1145', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418095045');
INSERT INTO `t_sys_log` VALUES ('1146', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418095046');
INSERT INTO `t_sys_log` VALUES ('1147', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418095045');
INSERT INTO `t_sys_log` VALUES ('1148', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"五年级\";s:4:\"sKey\";s:9:\"gradefive\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"10\";s:6:\"status\";s:1:\"1\";}}', '1418095084');
INSERT INTO `t_sys_log` VALUES ('1149', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"六年级\";s:4:\"sKey\";s:8:\"gradesix\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"11\";s:6:\"status\";s:1:\"1\";}}', '1418095110');
INSERT INTO `t_sys_log` VALUES ('1150', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418096082');
INSERT INTO `t_sys_log` VALUES ('1151', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097189');
INSERT INTO `t_sys_log` VALUES ('1152', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097189');
INSERT INTO `t_sys_log` VALUES ('1153', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097190');
INSERT INTO `t_sys_log` VALUES ('1154', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097190');
INSERT INTO `t_sys_log` VALUES ('1155', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097249');
INSERT INTO `t_sys_log` VALUES ('1156', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097249');
INSERT INTO `t_sys_log` VALUES ('1157', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097249');
INSERT INTO `t_sys_log` VALUES ('1158', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097249');
INSERT INTO `t_sys_log` VALUES ('1159', 'admin', 'Topic', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"6\";}s:4:\"post\";a:8:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:5:\"dfasf\";s:8:\"courseId\";s:1:\"0\";s:10:\"sectionIds\";s:5:\"adfas\";s:6:\"imgUrl\";s:8:\"adfasfas\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}}', '1418097518');
INSERT INTO `t_sys_log` VALUES ('1160', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097665');
INSERT INTO `t_sys_log` VALUES ('1161', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097665');
INSERT INTO `t_sys_log` VALUES ('1162', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097665');
INSERT INTO `t_sys_log` VALUES ('1163', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097665');
INSERT INTO `t_sys_log` VALUES ('1164', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097714');
INSERT INTO `t_sys_log` VALUES ('1165', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097714');
INSERT INTO `t_sys_log` VALUES ('1166', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418097714');
INSERT INTO `t_sys_log` VALUES ('1167', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418097714');
INSERT INTO `t_sys_log` VALUES ('1168', 'admin', 'ProConfig', 'config', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:10:{s:2:\"id\";s:2:\"16\";s:12:\"channelThumb\";s:39:\"s=100*200,m=200*300                    \";s:10:\"courseType\";s:38:\"1=基础\r\n2=拓展                    \";s:7:\"subject\";s:141:\"1=语文\r\n2=数学\r\n3=英语\r\n4=科学\r\n5=美术\r\n6=书法\r\n7=音乐\r\n8=舞蹈\r\n9=写作\r\n10=手工\r\n11=动漫\r\n12=电影                    \";s:4:\"tags\";s:108:\"1=音乐\r\n2=美术\r\n3=书法\r\n4=科学\r\n5=舞蹈\r\n6=动漫\r\n7=电影\r\n8=写作\r\n9=手工                    \";s:7:\"session\";s:44:\"1=上学期\r\n2=下学期                    \";s:4:\"keys\";s:48:\"1=热门\r\n2=推荐\r\n3=置顶                    \";s:2:\"rp\";s:34:\"1001=掌世界                    \";s:2:\"ap\";s:34:\"1001=掌世界                    \";s:5:\"press\";s:40:\"2001=某某出版社                    \";}}', '1418099059');
INSERT INTO `t_sys_log` VALUES ('1169', 'admin', 'User', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:13:{s:2:\"id\";s:1:\"4\";s:6:\"userId\";s:12:\"123456789036\";s:8:\"userName\";s:30:\"031115082569800166408211251010\";s:9:\"userToken\";s:32:\"03111508256980016640821125101009\";s:8:\"nickName\";s:0:\"\";s:6:\"amount\";s:1:\"0\";s:5:\"point\";s:1:\"0\";s:4:\"face\";s:1:\"0\";s:5:\"phone\";s:1:\"0\";s:2:\"qq\";s:1:\"0\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"ztbType\";s:0:\"\";}}', '1418103399');
INSERT INTO `t_sys_log` VALUES ('1170', 'admin', 'User', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"4\";}s:4:\"post\";a:13:{s:2:\"id\";s:1:\"4\";s:6:\"userId\";s:12:\"123456789036\";s:8:\"userName\";s:30:\"031115082569800166408211251010\";s:9:\"userToken\";s:32:\"03111508256980016640821125101009\";s:8:\"nickName\";s:4:\"test\";s:6:\"amount\";s:1:\"0\";s:5:\"point\";s:1:\"0\";s:4:\"face\";s:1:\"0\";s:5:\"phone\";s:1:\"0\";s:2:\"qq\";s:1:\"0\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"ztbType\";s:0:\"\";}}', '1418103403');
INSERT INTO `t_sys_log` VALUES ('1171', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104092');
INSERT INTO `t_sys_log` VALUES ('1172', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104092');
INSERT INTO `t_sys_log` VALUES ('1173', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104092');
INSERT INTO `t_sys_log` VALUES ('1174', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104092');
INSERT INTO `t_sys_log` VALUES ('1175', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104597');
INSERT INTO `t_sys_log` VALUES ('1176', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104597');
INSERT INTO `t_sys_log` VALUES ('1177', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104597');
INSERT INTO `t_sys_log` VALUES ('1178', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104597');
INSERT INTO `t_sys_log` VALUES ('1179', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:20:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:4:\"chId\";s:0:\"\";s:5:\"stage\";s:0:\"\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:0:\"\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418104616');
INSERT INTO `t_sys_log` VALUES ('1180', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:20:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"ttt\";s:4:\"chId\";s:0:\"\";s:5:\"stage\";s:0:\"\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:0:\"\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418104621');
INSERT INTO `t_sys_log` VALUES ('1181', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:20:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"ttt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:0:\"\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:0:\"\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418104629');
INSERT INTO `t_sys_log` VALUES ('1182', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:20:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"ttt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:0:\"\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418104654');
INSERT INTO `t_sys_log` VALUES ('1183', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104660');
INSERT INTO `t_sys_log` VALUES ('1184', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104660');
INSERT INTO `t_sys_log` VALUES ('1185', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104660');
INSERT INTO `t_sys_log` VALUES ('1186', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104660');
INSERT INTO `t_sys_log` VALUES ('1187', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104665');
INSERT INTO `t_sys_log` VALUES ('1188', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104665');
INSERT INTO `t_sys_log` VALUES ('1189', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104665');
INSERT INTO `t_sys_log` VALUES ('1190', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104665');
INSERT INTO `t_sys_log` VALUES ('1191', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:0:\"\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418104670');
INSERT INTO `t_sys_log` VALUES ('1192', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104673');
INSERT INTO `t_sys_log` VALUES ('1193', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104673');
INSERT INTO `t_sys_log` VALUES ('1194', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104673');
INSERT INTO `t_sys_log` VALUES ('1195', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104673');
INSERT INTO `t_sys_log` VALUES ('1196', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"6\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:3:\"ttt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:4:\",8,7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418104680');
INSERT INTO `t_sys_log` VALUES ('1197', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104683');
INSERT INTO `t_sys_log` VALUES ('1198', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104683');
INSERT INTO `t_sys_log` VALUES ('1199', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104683');
INSERT INTO `t_sys_log` VALUES ('1200', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104683');
INSERT INTO `t_sys_log` VALUES ('1201', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:2:\",8\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:3:\"3,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418104686');
INSERT INTO `t_sys_log` VALUES ('1202', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104689');
INSERT INTO `t_sys_log` VALUES ('1203', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104689');
INSERT INTO `t_sys_log` VALUES ('1204', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104689');
INSERT INTO `t_sys_log` VALUES ('1205', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104689');
INSERT INTO `t_sys_log` VALUES ('1206', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"6\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:3:\"ttt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:4:\",8,7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418104692');
INSERT INTO `t_sys_log` VALUES ('1207', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104699');
INSERT INTO `t_sys_log` VALUES ('1208', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104699');
INSERT INTO `t_sys_log` VALUES ('1209', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104699');
INSERT INTO `t_sys_log` VALUES ('1210', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104699');
INSERT INTO `t_sys_log` VALUES ('1211', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104743');
INSERT INTO `t_sys_log` VALUES ('1212', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104743');
INSERT INTO `t_sys_log` VALUES ('1213', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104743');
INSERT INTO `t_sys_log` VALUES ('1214', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104744');
INSERT INTO `t_sys_log` VALUES ('1215', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104755');
INSERT INTO `t_sys_log` VALUES ('1216', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104755');
INSERT INTO `t_sys_log` VALUES ('1217', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418104755');
INSERT INTO `t_sys_log` VALUES ('1218', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418104756');
INSERT INTO `t_sys_log` VALUES ('1219', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"6\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:3:\"ttt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:4:\",8,7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:2:\",2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418104760');
INSERT INTO `t_sys_log` VALUES ('1220', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105196');
INSERT INTO `t_sys_log` VALUES ('1221', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105196');
INSERT INTO `t_sys_log` VALUES ('1222', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105196');
INSERT INTO `t_sys_log` VALUES ('1223', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105196');
INSERT INTO `t_sys_log` VALUES ('1224', 'admin', 'Course', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:1:\"6\";}}', '1418105270');
INSERT INTO `t_sys_log` VALUES ('1225', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105276');
INSERT INTO `t_sys_log` VALUES ('1226', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105277');
INSERT INTO `t_sys_log` VALUES ('1227', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105277');
INSERT INTO `t_sys_log` VALUES ('1228', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105277');
INSERT INTO `t_sys_log` VALUES ('1229', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:2:\",8\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105281');
INSERT INTO `t_sys_log` VALUES ('1230', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105284');
INSERT INTO `t_sys_log` VALUES ('1231', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105284');
INSERT INTO `t_sys_log` VALUES ('1232', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105284');
INSERT INTO `t_sys_log` VALUES ('1233', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105284');
INSERT INTO `t_sys_log` VALUES ('1234', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:1:\"7\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105305');
INSERT INTO `t_sys_log` VALUES ('1235', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105311');
INSERT INTO `t_sys_log` VALUES ('1236', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105311');
INSERT INTO `t_sys_log` VALUES ('1237', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105311');
INSERT INTO `t_sys_log` VALUES ('1238', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105311');
INSERT INTO `t_sys_log` VALUES ('1239', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:1:\"7\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105314');
INSERT INTO `t_sys_log` VALUES ('1240', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105317');
INSERT INTO `t_sys_log` VALUES ('1241', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105317');
INSERT INTO `t_sys_log` VALUES ('1242', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105317');
INSERT INTO `t_sys_log` VALUES ('1243', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105317');
INSERT INTO `t_sys_log` VALUES ('1244', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105357');
INSERT INTO `t_sys_log` VALUES ('1245', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105357');
INSERT INTO `t_sys_log` VALUES ('1246', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105357');
INSERT INTO `t_sys_log` VALUES ('1247', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105357');
INSERT INTO `t_sys_log` VALUES ('1248', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"7,9\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:1:\"2\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105361');
INSERT INTO `t_sys_log` VALUES ('1249', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105366');
INSERT INTO `t_sys_log` VALUES ('1250', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105366');
INSERT INTO `t_sys_log` VALUES ('1251', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105366');
INSERT INTO `t_sys_log` VALUES ('1252', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105366');
INSERT INTO `t_sys_log` VALUES ('1253', 'admin', 'Course', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:20:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:0:\"\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:0:\"\";s:8:\"midLibId\";s:0:\"\";s:10:\"finalLibId\";s:0:\"\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418105376');
INSERT INTO `t_sys_log` VALUES ('1254', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105617');
INSERT INTO `t_sys_log` VALUES ('1255', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105618');
INSERT INTO `t_sys_log` VALUES ('1256', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105618');
INSERT INTO `t_sys_log` VALUES ('1257', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105618');
INSERT INTO `t_sys_log` VALUES ('1258', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105629');
INSERT INTO `t_sys_log` VALUES ('1259', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105629');
INSERT INTO `t_sys_log` VALUES ('1260', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105629');
INSERT INTO `t_sys_log` VALUES ('1261', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105629');
INSERT INTO `t_sys_log` VALUES ('1262', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105822');
INSERT INTO `t_sys_log` VALUES ('1263', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105822');
INSERT INTO `t_sys_log` VALUES ('1264', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105822');
INSERT INTO `t_sys_log` VALUES ('1265', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105822');
INSERT INTO `t_sys_log` VALUES ('1266', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105833');
INSERT INTO `t_sys_log` VALUES ('1267', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105833');
INSERT INTO `t_sys_log` VALUES ('1268', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105833');
INSERT INTO `t_sys_log` VALUES ('1269', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105833');
INSERT INTO `t_sys_log` VALUES ('1270', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:2:\",7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105837');
INSERT INTO `t_sys_log` VALUES ('1271', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105840');
INSERT INTO `t_sys_log` VALUES ('1272', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105840');
INSERT INTO `t_sys_log` VALUES ('1273', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105840');
INSERT INTO `t_sys_log` VALUES ('1274', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105840');
INSERT INTO `t_sys_log` VALUES ('1275', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:1:\"7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105847');
INSERT INTO `t_sys_log` VALUES ('1276', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105850');
INSERT INTO `t_sys_log` VALUES ('1277', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105850');
INSERT INTO `t_sys_log` VALUES ('1278', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105850');
INSERT INTO `t_sys_log` VALUES ('1279', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105850');
INSERT INTO `t_sys_log` VALUES ('1280', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:3:\"7,8\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105853');
INSERT INTO `t_sys_log` VALUES ('1281', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105860');
INSERT INTO `t_sys_log` VALUES ('1282', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105860');
INSERT INTO `t_sys_log` VALUES ('1283', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105860');
INSERT INTO `t_sys_log` VALUES ('1284', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105860');
INSERT INTO `t_sys_log` VALUES ('1285', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105935');
INSERT INTO `t_sys_log` VALUES ('1286', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105935');
INSERT INTO `t_sys_log` VALUES ('1287', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418105935');
INSERT INTO `t_sys_log` VALUES ('1288', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418105935');
INSERT INTO `t_sys_log` VALUES ('1289', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:1:\"7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:0:\"\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418105938');
INSERT INTO `t_sys_log` VALUES ('1290', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418106039');
INSERT INTO `t_sys_log` VALUES ('1291', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418106039');
INSERT INTO `t_sys_log` VALUES ('1292', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418106039');
INSERT INTO `t_sys_log` VALUES ('1293', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418106039');
INSERT INTO `t_sys_log` VALUES ('1294', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:1:\"7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:2:\",2\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418106044');
INSERT INTO `t_sys_log` VALUES ('1295', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418106047');
INSERT INTO `t_sys_log` VALUES ('1296', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418106047');
INSERT INTO `t_sys_log` VALUES ('1297', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418106047');
INSERT INTO `t_sys_log` VALUES ('1298', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418106047');
INSERT INTO `t_sys_log` VALUES ('1299', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:2:\"tt\";s:4:\"chId\";s:2:\"18\";s:5:\"stage\";s:1:\"7\";s:7:\"pressId\";s:0:\"\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"1\";s:7:\"subject\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:4:\",2,1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"lecturer\";s:0:\"\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418106051');
INSERT INTO `t_sys_log` VALUES ('1300', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110240');
INSERT INTO `t_sys_log` VALUES ('1301', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110240');
INSERT INTO `t_sys_log` VALUES ('1302', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110240');
INSERT INTO `t_sys_log` VALUES ('1303', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110240');
INSERT INTO `t_sys_log` VALUES ('1304', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110421');
INSERT INTO `t_sys_log` VALUES ('1305', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110421');
INSERT INTO `t_sys_log` VALUES ('1306', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110421');
INSERT INTO `t_sys_log` VALUES ('1307', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110421');
INSERT INTO `t_sys_log` VALUES ('1308', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110624');
INSERT INTO `t_sys_log` VALUES ('1309', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110624');
INSERT INTO `t_sys_log` VALUES ('1310', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110624');
INSERT INTO `t_sys_log` VALUES ('1311', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110624');
INSERT INTO `t_sys_log` VALUES ('1312', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110692');
INSERT INTO `t_sys_log` VALUES ('1313', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110692');
INSERT INTO `t_sys_log` VALUES ('1314', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110692');
INSERT INTO `t_sys_log` VALUES ('1315', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110693');
INSERT INTO `t_sys_log` VALUES ('1316', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110709');
INSERT INTO `t_sys_log` VALUES ('1317', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110710');
INSERT INTO `t_sys_log` VALUES ('1318', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110710');
INSERT INTO `t_sys_log` VALUES ('1319', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110710');
INSERT INTO `t_sys_log` VALUES ('1320', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110779');
INSERT INTO `t_sys_log` VALUES ('1321', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110779');
INSERT INTO `t_sys_log` VALUES ('1322', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110779');
INSERT INTO `t_sys_log` VALUES ('1323', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110780');
INSERT INTO `t_sys_log` VALUES ('1324', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110788');
INSERT INTO `t_sys_log` VALUES ('1325', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110789');
INSERT INTO `t_sys_log` VALUES ('1326', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110788');
INSERT INTO `t_sys_log` VALUES ('1327', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110789');
INSERT INTO `t_sys_log` VALUES ('1328', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110928');
INSERT INTO `t_sys_log` VALUES ('1329', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110928');
INSERT INTO `t_sys_log` VALUES ('1330', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418110928');
INSERT INTO `t_sys_log` VALUES ('1331', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418110928');
INSERT INTO `t_sys_log` VALUES ('1332', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"7,9\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:4:\"tags\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418110931');
INSERT INTO `t_sys_log` VALUES ('1333', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418111014');
INSERT INTO `t_sys_log` VALUES ('1334', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418111014');
INSERT INTO `t_sys_log` VALUES ('1335', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418111014');
INSERT INTO `t_sys_log` VALUES ('1336', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418111015');
INSERT INTO `t_sys_log` VALUES ('1337', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"test1\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"7,9\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:4:\"tags\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418111018');
INSERT INTO `t_sys_log` VALUES ('1338', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418111414');
INSERT INTO `t_sys_log` VALUES ('1339', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418111414');
INSERT INTO `t_sys_log` VALUES ('1340', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418111414');
INSERT INTO `t_sys_log` VALUES ('1341', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418111414');
INSERT INTO `t_sys_log` VALUES ('1342', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:21:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"7,9\";s:7:\"pressId\";s:4:\"2001\";s:6:\"volume\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:4:\"tags\";s:0:\"\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418111420');
INSERT INTO `t_sys_log` VALUES ('1343', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:5:\"Stage\";}}', '1418112478');
INSERT INTO `t_sys_log` VALUES ('1344', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418112696');
INSERT INTO `t_sys_log` VALUES ('1345', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418112696');
INSERT INTO `t_sys_log` VALUES ('1346', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418112696');
INSERT INTO `t_sys_log` VALUES ('1347', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418112696');
INSERT INTO `t_sys_log` VALUES ('1348', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"7,9\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418112703');
INSERT INTO `t_sys_log` VALUES ('1349', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418114004');
INSERT INTO `t_sys_log` VALUES ('1350', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418114004');
INSERT INTO `t_sys_log` VALUES ('1351', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418114004');
INSERT INTO `t_sys_log` VALUES ('1352', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418114004');
INSERT INTO `t_sys_log` VALUES ('1353', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418114073');
INSERT INTO `t_sys_log` VALUES ('1354', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418114073');
INSERT INTO `t_sys_log` VALUES ('1355', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418114073');
INSERT INTO `t_sys_log` VALUES ('1356', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418114073');
INSERT INTO `t_sys_log` VALUES ('1357', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418115550');
INSERT INTO `t_sys_log` VALUES ('1358', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418115550');
INSERT INTO `t_sys_log` VALUES ('1359', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418115550');
INSERT INTO `t_sys_log` VALUES ('1360', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418115550');
INSERT INTO `t_sys_log` VALUES ('1361', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"7,9\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418115600');
INSERT INTO `t_sys_log` VALUES ('1362', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418115612');
INSERT INTO `t_sys_log` VALUES ('1363', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418115612');
INSERT INTO `t_sys_log` VALUES ('1364', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418115612');
INSERT INTO `t_sys_log` VALUES ('1365', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418115612');
INSERT INTO `t_sys_log` VALUES ('1366', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418115767');
INSERT INTO `t_sys_log` VALUES ('1367', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418115767');
INSERT INTO `t_sys_log` VALUES ('1368', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418115767');
INSERT INTO `t_sys_log` VALUES ('1369', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418115767');
INSERT INTO `t_sys_log` VALUES ('1370', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,7\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418115777');
INSERT INTO `t_sys_log` VALUES ('1371', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"1\";s:6:\"userId\";s:1:\"0\";s:7:\"stageId\";s:1:\"3\";s:3:\"sex\";s:1:\"2\";s:8:\"nickName\";s:1:\"4\";s:9:\"interests\";s:1:\"4\";s:9:\"advantage\";s:1:\"4\";s:12:\"disAdvantage\";s:1:\"4\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"4\";s:6:\"status\";s:1:\"0\";}}', '1418116931');
INSERT INTO `t_sys_log` VALUES ('1372', 'admin', 'Role', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:12:{s:2:\"id\";s:1:\"1\";s:6:\"userId\";s:1:\"0\";s:7:\"stageId\";s:1:\"3\";s:3:\"sex\";s:1:\"2\";s:8:\"nickName\";s:1:\"4\";s:9:\"interests\";s:1:\"4\";s:9:\"advantage\";s:1:\"4\";s:12:\"disAdvantage\";s:1:\"4\";s:5:\"level\";s:1:\"4\";s:5:\"point\";s:1:\"4\";s:4:\"face\";s:1:\"4\";s:6:\"status\";s:1:\"1\";}}', '1418116937');
INSERT INTO `t_sys_log` VALUES ('1373', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418126263');
INSERT INTO `t_sys_log` VALUES ('1374', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418126264');
INSERT INTO `t_sys_log` VALUES ('1375', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418126264');
INSERT INTO `t_sys_log` VALUES ('1376', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418126264');
INSERT INTO `t_sys_log` VALUES ('1377', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418126594');
INSERT INTO `t_sys_log` VALUES ('1378', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418126594');
INSERT INTO `t_sys_log` VALUES ('1379', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418126595');
INSERT INTO `t_sys_log` VALUES ('1380', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418126595');
INSERT INTO `t_sys_log` VALUES ('1381', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418127857');
INSERT INTO `t_sys_log` VALUES ('1382', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418127858');
INSERT INTO `t_sys_log` VALUES ('1383', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418127858');
INSERT INTO `t_sys_log` VALUES ('1384', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418127858');
INSERT INTO `t_sys_log` VALUES ('1385', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418127995');
INSERT INTO `t_sys_log` VALUES ('1386', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418127995');
INSERT INTO `t_sys_log` VALUES ('1387', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418127995');
INSERT INTO `t_sys_log` VALUES ('1388', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418127995');
INSERT INTO `t_sys_log` VALUES ('1389', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,6\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418128356');
INSERT INTO `t_sys_log` VALUES ('1390', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418128364');
INSERT INTO `t_sys_log` VALUES ('1391', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418128364');
INSERT INTO `t_sys_log` VALUES ('1392', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418128364');
INSERT INTO `t_sys_log` VALUES ('1393', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418128365');
INSERT INTO `t_sys_log` VALUES ('1394', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418128713');
INSERT INTO `t_sys_log` VALUES ('1395', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418128713');
INSERT INTO `t_sys_log` VALUES ('1396', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418128713');
INSERT INTO `t_sys_log` VALUES ('1397', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418128713');
INSERT INTO `t_sys_log` VALUES ('1398', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418175268');
INSERT INTO `t_sys_log` VALUES ('1399', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418176099');
INSERT INTO `t_sys_log` VALUES ('1400', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418176100');
INSERT INTO `t_sys_log` VALUES ('1401', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418176100');
INSERT INTO `t_sys_log` VALUES ('1402', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418176100');
INSERT INTO `t_sys_log` VALUES ('1403', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,6\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418176108');
INSERT INTO `t_sys_log` VALUES ('1404', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418176151');
INSERT INTO `t_sys_log` VALUES ('1405', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418176151');
INSERT INTO `t_sys_log` VALUES ('1406', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418176151');
INSERT INTO `t_sys_log` VALUES ('1407', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418176151');
INSERT INTO `t_sys_log` VALUES ('1408', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418176220');
INSERT INTO `t_sys_log` VALUES ('1409', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418176684');
INSERT INTO `t_sys_log` VALUES ('1410', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418176684');
INSERT INTO `t_sys_log` VALUES ('1411', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418176684');
INSERT INTO `t_sys_log` VALUES ('1412', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418176684');
INSERT INTO `t_sys_log` VALUES ('1413', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418177215');
INSERT INTO `t_sys_log` VALUES ('1414', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418177215');
INSERT INTO `t_sys_log` VALUES ('1415', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418177216');
INSERT INTO `t_sys_log` VALUES ('1416', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418177216');
INSERT INTO `t_sys_log` VALUES ('1417', 'admin', 'Role', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:12:{s:2:\"id\";s:0:\"\";s:6:\"userId\";s:1:\"1\";s:7:\"stageId\";s:2:\"23\";s:3:\"sex\";s:1:\"1\";s:8:\"nickName\";s:4:\"test\";s:9:\"interests\";s:0:\"\";s:9:\"advantage\";s:0:\"\";s:12:\"disAdvantage\";s:0:\"\";s:5:\"level\";s:0:\"\";s:5:\"point\";s:0:\"\";s:4:\"face\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418177623');
INSERT INTO `t_sys_log` VALUES ('1418', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418178925');
INSERT INTO `t_sys_log` VALUES ('1419', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418178925');
INSERT INTO `t_sys_log` VALUES ('1420', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418178925');
INSERT INTO `t_sys_log` VALUES ('1421', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418178925');
INSERT INTO `t_sys_log` VALUES ('1422', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418179605');
INSERT INTO `t_sys_log` VALUES ('1423', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418179605');
INSERT INTO `t_sys_log` VALUES ('1424', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418179605');
INSERT INTO `t_sys_log` VALUES ('1425', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418179605');
INSERT INTO `t_sys_log` VALUES ('1426', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418179608');
INSERT INTO `t_sys_log` VALUES ('1427', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418179999');
INSERT INTO `t_sys_log` VALUES ('1428', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418179999');
INSERT INTO `t_sys_log` VALUES ('1429', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418179999');
INSERT INTO `t_sys_log` VALUES ('1430', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418179999');
INSERT INTO `t_sys_log` VALUES ('1431', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418180021');
INSERT INTO `t_sys_log` VALUES ('1432', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418180528');
INSERT INTO `t_sys_log` VALUES ('1433', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418180625');
INSERT INTO `t_sys_log` VALUES ('1434', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418180625');
INSERT INTO `t_sys_log` VALUES ('1435', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418180626');
INSERT INTO `t_sys_log` VALUES ('1436', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418180625');
INSERT INTO `t_sys_log` VALUES ('1437', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418180711');
INSERT INTO `t_sys_log` VALUES ('1438', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418182227');
INSERT INTO `t_sys_log` VALUES ('1439', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418182227');
INSERT INTO `t_sys_log` VALUES ('1440', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418182227');
INSERT INTO `t_sys_log` VALUES ('1441', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418182227');
INSERT INTO `t_sys_log` VALUES ('1442', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418182291');
INSERT INTO `t_sys_log` VALUES ('1443', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418193184');
INSERT INTO `t_sys_log` VALUES ('1444', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418193184');
INSERT INTO `t_sys_log` VALUES ('1445', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418193184');
INSERT INTO `t_sys_log` VALUES ('1446', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418193185');
INSERT INTO `t_sys_log` VALUES ('1447', 'admin', 'Course', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:20:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"test\";s:4:\"chId\";s:2:\"20\";s:5:\"stage\";s:3:\"9,4\";s:7:\"pressId\";s:4:\"2001\";s:7:\"session\";s:0:\"\";s:6:\"typeId\";s:1:\"2\";s:7:\"subject\";s:1:\"2\";s:5:\"price\";s:4:\"0.00\";s:8:\"midLibId\";s:1:\"0\";s:10:\"finalLibId\";s:1:\"0\";s:8:\"topicIds\";s:0:\"\";s:4:\"keys\";s:1:\"1\";s:6:\"imgUrl\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:12:\"organization\";s:1:\"o\";s:8:\"lecturer\";s:1:\"l\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418193194');
INSERT INTO `t_sys_log` VALUES ('1448', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:6:\"0-1岁\";s:4:\"sKey\";s:3:\"one\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418199894');
INSERT INTO `t_sys_log` VALUES ('1449', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"8\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"8\";s:4:\"name\";s:6:\"1-2岁\";s:4:\"sKey\";s:3:\"two\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1418199903');
INSERT INTO `t_sys_log` VALUES ('1450', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"9\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"9\";s:4:\"name\";s:6:\"2-3岁\";s:4:\"sKey\";s:5:\"three\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}}', '1418199911');
INSERT INTO `t_sys_log` VALUES ('1451', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"2\";s:4:\"name\";s:9:\"一年级\";s:4:\"sKey\";s:8:\"gradeone\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"6\";s:6:\"status\";s:1:\"1\";}}', '1418201000');
INSERT INTO `t_sys_log` VALUES ('1452', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418201758');
INSERT INTO `t_sys_log` VALUES ('1453', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418201918');
INSERT INTO `t_sys_log` VALUES ('1454', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418202071');
INSERT INTO `t_sys_log` VALUES ('1455', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418202455');
INSERT INTO `t_sys_log` VALUES ('1456', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418202943');
INSERT INTO `t_sys_log` VALUES ('1457', 'admin', 'AdSpace', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:5:{s:2:\"id\";s:1:\"3\";s:5:\"asKey\";s:5:\"sdfds\";s:5:\"title\";s:3:\"sss\";s:6:\"asType\";s:1:\"0\";s:7:\"showNum\";s:1:\"1\";}}', '1418203240');
INSERT INTO `t_sys_log` VALUES ('1458', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"AdSpace\";}}', '1418203246');
INSERT INTO `t_sys_log` VALUES ('1459', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"11\";s:4:\"rpId\";s:0:\"\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:40:\"17/54880d5809f96.png,8/54880d580aeda.png\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1418203509');
INSERT INTO `t_sys_log` VALUES ('1460', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"11\";s:4:\"rpId\";s:0:\"\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:40:\"17/54880d5809f96.png,8/54880d580aeda.png\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1418203528');
INSERT INTO `t_sys_log` VALUES ('1461', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418203554');
INSERT INTO `t_sys_log` VALUES ('1462', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"11\";s:4:\"rpId\";s:0:\"\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:20:\"1c/548811a2efa97.png\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1418203566');
INSERT INTO `t_sys_log` VALUES ('1463', 'admin', 'Resource', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:14:{s:5:\"title\";s:3:\"111\";s:2:\"id\";s:1:\"1\";s:9:\"sectionId\";s:1:\"1\";s:7:\"content\";s:2:\"11\";s:4:\"rpId\";s:0:\"\";s:5:\"outId\";s:1:\"1\";s:8:\"playAuth\";s:1:\"1\";s:7:\"keyList\";s:1:\"1\";s:5:\"price\";s:1:\"1\";s:6:\"libUrl\";s:1:\"1\";s:6:\"imgUrl\";s:20:\"1c/548811a2efa97.png\";s:11:\"description\";s:1:\"1\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}}', '1418203595');
INSERT INTO `t_sys_log` VALUES ('1464', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418203637');
INSERT INTO `t_sys_log` VALUES ('1465', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418204070');
INSERT INTO `t_sys_log` VALUES ('1466', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:22:\"资源导航图片：1\";}}', '1418204082');
INSERT INTO `t_sys_log` VALUES ('1467', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418204101');
INSERT INTO `t_sys_log` VALUES ('1468', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418204130');
INSERT INTO `t_sys_log` VALUES ('1469', 'admin', 'Upfile', 'count', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}', '1418211984');
INSERT INTO `t_sys_log` VALUES ('1470', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418269585');
INSERT INTO `t_sys_log` VALUES ('1471', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:5:\"Stage\";}}', '1418269869');
INSERT INTO `t_sys_log` VALUES ('1472', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:6:\"0-1岁\";s:4:\"sKey\";s:3:\"one\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}', '1418269891');
INSERT INTO `t_sys_log` VALUES ('1473', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"7\";}s:4:\"post\";a:6:{s:2:\"id\";s:1:\"7\";s:4:\"name\";s:6:\"0-1岁\";s:4:\"sKey\";s:3:\"one\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418269910');
INSERT INTO `t_sys_log` VALUES ('1474', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418286353');
INSERT INTO `t_sys_log` VALUES ('1475', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418347056');
INSERT INTO `t_sys_log` VALUES ('1476', 'admin', 'ProConfig', 'sync', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1418347068');
INSERT INTO `t_sys_log` VALUES ('1477', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418348193');
INSERT INTO `t_sys_log` VALUES ('1478', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:33:\"栏目导航图片：精彩推荐\";}}', '1418348790');
INSERT INTO `t_sys_log` VALUES ('1479', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:33:\"栏目导航图片：精彩推荐\";}}', '1418348806');
INSERT INTO `t_sys_log` VALUES ('1480', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:1:\"1\";s:4:\"name\";s:12:\"精彩推荐\";s:5:\"chKey\";s:9:\"recommend\";s:6:\"imgUrl\";s:40:\"9/548a48f6202e1.png\r\n3/548a490636109.png\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418348812');
INSERT INTO `t_sys_log` VALUES ('1481', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:33:\"栏目导航图片：全部课程\";}}', '1418348839');
INSERT INTO `t_sys_log` VALUES ('1482', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"12\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:2:\"12\";s:4:\"name\";s:12:\"全部课程\";s:5:\"chKey\";s:9:\"allcourse\";s:6:\"imgUrl\";s:40:\"0/548a4927958a6.png\r\nc/548a492795d8d.png\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418348843');
INSERT INTO `t_sys_log` VALUES ('1483', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:33:\"栏目导航图片：我的课程\";}}', '1418348865');
INSERT INTO `t_sys_log` VALUES ('1484', 'admin', 'Channel', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"13\";}s:4:\"post\";a:10:{s:3:\"pId\";s:0:\"\";s:2:\"id\";s:2:\"13\";s:4:\"name\";s:12:\"我的课程\";s:5:\"chKey\";s:8:\"mycourse\";s:6:\"imgUrl\";s:40:\"f/548a494200813.png\r\ne/548a494200d3d.png\";s:7:\"linkUrl\";s:0:\"\";s:6:\"isShow\";s:1:\"1\";s:11:\"description\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418348868');
INSERT INTO `t_sys_log` VALUES ('1485', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418348948');
INSERT INTO `t_sys_log` VALUES ('1486', 'admin', 'ProConfig', 'sync', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1418348953');
INSERT INTO `t_sys_log` VALUES ('1487', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418349144');
INSERT INTO `t_sys_log` VALUES ('1488', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418350168');
INSERT INTO `t_sys_log` VALUES ('1489', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418350168');
INSERT INTO `t_sys_log` VALUES ('1490', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418350168');
INSERT INTO `t_sys_log` VALUES ('1491', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418350168');
INSERT INTO `t_sys_log` VALUES ('1492', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418350190');
INSERT INTO `t_sys_log` VALUES ('1493', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418350189');
INSERT INTO `t_sys_log` VALUES ('1494', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:5:\"stage\";}s:4:\"post\";a:0:{}}', '1418350190');
INSERT INTO `t_sys_log` VALUES ('1495', 'admin', 'Course', 'load', 'a:2:{s:3:\"get\";a:1:{s:4:\"type\";s:3:\"key\";}s:4:\"post\";a:0:{}}', '1418350190');
INSERT INTO `t_sys_log` VALUES ('1496', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418353010');
INSERT INTO `t_sys_log` VALUES ('1497', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418353450');
INSERT INTO `t_sys_log` VALUES ('1498', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418359204');
INSERT INTO `t_sys_log` VALUES ('1499', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418363998');
INSERT INTO `t_sys_log` VALUES ('1500', 'admin', 'AdSpace', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:5:{s:2:\"id\";s:1:\"3\";s:5:\"asKey\";s:14:\"recommend_left\";s:5:\"title\";s:28:\"推荐课程-左侧广告位\";s:6:\"asType\";s:1:\"0\";s:7:\"showNum\";s:1:\"1\";}}', '1418364213');
INSERT INTO `t_sys_log` VALUES ('1501', 'admin', 'AdSpace', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:5:\"asKey\";s:15:\"recommend_right\";s:5:\"title\";s:28:\"推荐课程-右侧广告位\";s:6:\"asType\";s:1:\"0\";s:7:\"showNum\";s:1:\"1\";}}', '1418364278');
INSERT INTO `t_sys_log` VALUES ('1502', 'admin', 'AdSpace', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:5:{s:2:\"id\";s:1:\"3\";s:5:\"asKey\";s:14:\"recommend_left\";s:5:\"title\";s:28:\"推荐课程-左侧广告位\";s:6:\"asType\";s:1:\"2\";s:7:\"showNum\";s:1:\"1\";}}', '1418364289');
INSERT INTO `t_sys_log` VALUES ('1503', 'admin', 'AdSpace', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"3\";}s:4:\"post\";a:5:{s:2:\"id\";s:1:\"3\";s:5:\"asKey\";s:14:\"recommend_left\";s:5:\"title\";s:28:\"推荐课程-左侧广告位\";s:6:\"asType\";s:1:\"0\";s:7:\"showNum\";s:1:\"1\";}}', '1418364539');
INSERT INTO `t_sys_log` VALUES ('1504', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418364726');
INSERT INTO `t_sys_log` VALUES ('1505', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418364924');
INSERT INTO `t_sys_log` VALUES ('1506', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418364943');
INSERT INTO `t_sys_log` VALUES ('1507', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418364960');
INSERT INTO `t_sys_log` VALUES ('1508', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418365043');
INSERT INTO `t_sys_log` VALUES ('1509', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:11:\"gradeEight1\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:1:\"0\";s:6:\"status\";s:1:\"1\";}}', '1418365066');
INSERT INTO `t_sys_log` VALUES ('1510', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"14\";}}', '1418365136');
INSERT INTO `t_sys_log` VALUES ('1511', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"14\";}}', '1418365144');
INSERT INTO `t_sys_log` VALUES ('1512', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"15\";}}', '1418365150');
INSERT INTO `t_sys_log` VALUES ('1513', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"15\";}}', '1418365159');
INSERT INTO `t_sys_log` VALUES ('1514', 'admin', 'Ad', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:13:{s:2:\"id\";s:1:\"2\";s:4:\"asId\";s:1:\"3\";s:7:\"adClass\";s:1:\"0\";s:4:\"apId\";s:0:\"\";s:4:\"adId\";s:5:\"23424\";s:5:\"title\";s:18:\"推荐介绍视频\";s:6:\"adType\";s:1:\"1\";s:5:\"image\";s:0:\"\";s:5:\"video\";s:4:\"test\";s:7:\"linkUrl\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:4:\"time\";s:3:\"0.0\";s:6:\"status\";s:1:\"1\";}}', '1418365156');
INSERT INTO `t_sys_log` VALUES ('1515', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:17:\"广告图片-sdfd\";}}', '1418365244');
INSERT INTO `t_sys_log` VALUES ('1516', 'admin', 'Ad', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"1\";}s:4:\"post\";a:13:{s:2:\"id\";s:1:\"1\";s:4:\"asId\";s:1:\"4\";s:7:\"adClass\";s:1:\"0\";s:4:\"apId\";s:0:\"\";s:4:\"adId\";s:1:\"0\";s:5:\"title\";s:15:\"推荐的课程\";s:6:\"adType\";s:1:\"0\";s:5:\"image\";s:19:\"7/548a893d04b6e.jpg\";s:5:\"video\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:4:\"time\";s:3:\"0.0\";s:6:\"status\";s:1:\"1\";}}', '1418365252');
INSERT INTO `t_sys_log` VALUES ('1517', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"13\";s:6:\"status\";s:1:\"1\";}}', '1418365335');
INSERT INTO `t_sys_log` VALUES ('1518', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"13\";s:6:\"status\";s:1:\"1\";}}', '1418365338');
INSERT INTO `t_sys_log` VALUES ('1519', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"1\";}}', '1418365369');
INSERT INTO `t_sys_log` VALUES ('1520', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"0\";}}', '1418365710');
INSERT INTO `t_sys_log` VALUES ('1521', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"0\";}}', '1418365712');
INSERT INTO `t_sys_log` VALUES ('1522', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"1\";}}', '1418365905');
INSERT INTO `t_sys_log` VALUES ('1523', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"1\";}}', '1418365907');
INSERT INTO `t_sys_log` VALUES ('1524', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"11\";s:4:\"sKey\";s:2:\"11\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"13\";s:6:\"status\";s:1:\"1\";}}', '1418365980');
INSERT INTO `t_sys_log` VALUES ('1525', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:2:\"11\";s:4:\"sKey\";s:2:\"11\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"13\";s:6:\"status\";s:1:\"1\";}}', '1418365981');
INSERT INTO `t_sys_log` VALUES ('1526', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"234\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366123');
INSERT INTO `t_sys_log` VALUES ('1527', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"234\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366136');
INSERT INTO `t_sys_log` VALUES ('1528', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"234\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366139');
INSERT INTO `t_sys_log` VALUES ('1529', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"2134\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"16\";s:6:\"status\";s:1:\"1\";}}', '1418366198');
INSERT INTO `t_sys_log` VALUES ('1530', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"2134\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"16\";s:6:\"status\";s:1:\"1\";}}', '1418366205');
INSERT INTO `t_sys_log` VALUES ('1531', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"18\";}}', '1418366247');
INSERT INTO `t_sys_log` VALUES ('1532', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"17\";}}', '1418366253');
INSERT INTO `t_sys_log` VALUES ('1533', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"17\";}}', '1418366255');
INSERT INTO `t_sys_log` VALUES ('1534', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"234\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366284');
INSERT INTO `t_sys_log` VALUES ('1535', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"234\";s:4:\"sKey\";s:3:\"234\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366285');
INSERT INTO `t_sys_log` VALUES ('1536', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"ewr\";s:4:\"sKey\";s:5:\"ewrr2\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"15\";s:6:\"status\";s:1:\"1\";}}', '1418366358');
INSERT INTO `t_sys_log` VALUES ('1537', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"ewr\";s:4:\"sKey\";s:5:\"ewrr2\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"15\";s:6:\"status\";s:1:\"1\";}}', '1418366360');
INSERT INTO `t_sys_log` VALUES ('1538', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"20\";}}', '1418366395');
INSERT INTO `t_sys_log` VALUES ('1539', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"20\";}}', '1418366397');
INSERT INTO `t_sys_log` VALUES ('1540', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"19\";}}', '1418366401');
INSERT INTO `t_sys_log` VALUES ('1541', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"19\";}}', '1418366404');
INSERT INTO `t_sys_log` VALUES ('1542', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"213\";s:4:\"sKey\";s:3:\"123\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366426');
INSERT INTO `t_sys_log` VALUES ('1543', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"213\";s:4:\"sKey\";s:3:\"123\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366661');
INSERT INTO `t_sys_log` VALUES ('1544', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"1231\";s:4:\"sKey\";s:2:\"12\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"16\";s:6:\"status\";s:1:\"1\";}}', '1418366737');
INSERT INTO `t_sys_log` VALUES ('1545', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"22\";}}', '1418366789');
INSERT INTO `t_sys_log` VALUES ('1546', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"22\";}}', '1418366792');
INSERT INTO `t_sys_log` VALUES ('1547', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"21\";}}', '1418366796');
INSERT INTO `t_sys_log` VALUES ('1548', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"21\";}}', '1418366799');
INSERT INTO `t_sys_log` VALUES ('1549', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"1231\";s:4:\"sKey\";s:3:\"123\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366813');
INSERT INTO `t_sys_log` VALUES ('1550', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"1231\";s:4:\"sKey\";s:3:\"123\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366835');
INSERT INTO `t_sys_log` VALUES ('1551', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"1231\";s:4:\"sKey\";s:3:\"123\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418366846');
INSERT INTO `t_sys_log` VALUES ('1552', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"234\";s:4:\"sKey\";s:2:\"42\";s:4:\"chId\";s:2:\"19\";s:4:\"sort\";s:2:\"15\";s:6:\"status\";s:1:\"1\";}}', '1418366877');
INSERT INTO `t_sys_log` VALUES ('1553', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"24\";}}', '1418367336');
INSERT INTO `t_sys_log` VALUES ('1554', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"24\";}}', '1418367338');
INSERT INTO `t_sys_log` VALUES ('1555', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"23\";}}', '1418367345');
INSERT INTO `t_sys_log` VALUES ('1556', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"23\";}}', '1418367347');
INSERT INTO `t_sys_log` VALUES ('1557', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"2342\";s:4:\"sKey\";s:3:\"242\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418367371');
INSERT INTO `t_sys_log` VALUES ('1558', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"25\";}}', '1418368049');
INSERT INTO `t_sys_log` VALUES ('1559', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"25\";}}', '1418368052');
INSERT INTO `t_sys_log` VALUES ('1560', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:4:\"1231\";s:4:\"sKey\";s:3:\"123\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"14\";s:6:\"status\";s:1:\"1\";}}', '1418368075');
INSERT INTO `t_sys_log` VALUES ('1561', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"26\";}}', '1418368116');
INSERT INTO `t_sys_log` VALUES ('1562', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"26\";}}', '1418368118');
INSERT INTO `t_sys_log` VALUES ('1563', 'admin', 'Stage', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:3:\"113\";s:4:\"sKey\";s:2:\"13\";s:4:\"chId\";s:2:\"18\";s:4:\"sort\";s:2:\"13\";s:6:\"status\";s:1:\"1\";}}', '1418368143');
INSERT INTO `t_sys_log` VALUES ('1564', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"0\";}}', '1418368316');
INSERT INTO `t_sys_log` VALUES ('1565', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"27\";}}', '1418368659');
INSERT INTO `t_sys_log` VALUES ('1566', 'admin', 'Stage', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:2:\"16\";}s:4:\"post\";a:6:{s:2:\"id\";s:2:\"16\";s:4:\"name\";s:9:\"八年级\";s:4:\"sKey\";s:10:\"gradeEight\";s:4:\"chId\";s:2:\"20\";s:4:\"sort\";s:2:\"12\";s:6:\"status\";s:1:\"1\";}}', '1418368727');
INSERT INTO `t_sys_log` VALUES ('1567', 'admin', 'Stage', 'del', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:2:\"16\";}}', '1418368816');
INSERT INTO `t_sys_log` VALUES ('1568', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418369003');
INSERT INTO `t_sys_log` VALUES ('1569', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418369048');
INSERT INTO `t_sys_log` VALUES ('1570', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418369177');
INSERT INTO `t_sys_log` VALUES ('1571', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418369312');
INSERT INTO `t_sys_log` VALUES ('1572', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418369421');
INSERT INTO `t_sys_log` VALUES ('1573', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418369857');
INSERT INTO `t_sys_log` VALUES ('1574', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:31:\"广告图片-推荐介绍视频\";}}', '1418369795');
INSERT INTO `t_sys_log` VALUES ('1575', 'admin', 'Ad', 'edit', 'a:2:{s:3:\"get\";a:1:{s:2:\"id\";s:1:\"2\";}s:4:\"post\";a:13:{s:2:\"id\";s:1:\"2\";s:4:\"asId\";s:1:\"3\";s:7:\"adClass\";s:1:\"0\";s:4:\"apId\";s:0:\"\";s:4:\"adId\";s:1:\"0\";s:5:\"title\";s:12:\"推荐介绍\";s:6:\"adType\";s:1:\"0\";s:5:\"image\";s:19:\"2/548a9b032129b.jpg\";s:5:\"video\";s:4:\"test\";s:7:\"linkUrl\";s:0:\"\";s:4:\"sort\";s:1:\"0\";s:4:\"time\";s:3:\"0.0\";s:6:\"status\";s:1:\"1\";}}', '1418369798');
INSERT INTO `t_sys_log` VALUES ('1576', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418369920');
INSERT INTO `t_sys_log` VALUES ('1577', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418369976');
INSERT INTO `t_sys_log` VALUES ('1578', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:7:\"Channel\";}}', '1418370114');
INSERT INTO `t_sys_log` VALUES ('1579', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418370248');
INSERT INTO `t_sys_log` VALUES ('1580', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418370330');
INSERT INTO `t_sys_log` VALUES ('1581', 'admin', 'Cache', 'update', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:1:{s:2:\"id\";s:0:\"\";}}', '1418370970');
INSERT INTO `t_sys_log` VALUES ('1582', 'admin', 'AdSpace', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:5:{s:2:\"id\";s:0:\"\";s:5:\"asKey\";s:16:\"recommend_bottom\";s:5:\"title\";s:25:\"推荐课程-底部广告\";s:6:\"asType\";s:1:\"0\";s:7:\"showNum\";s:1:\"1\";}}', '1418371317');
INSERT INTO `t_sys_log` VALUES ('1583', 'admin', 'Upfile', 'upfile', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:3:{s:8:\"fileType\";s:1:\"1\";s:5:\"thumb\";s:0:\"\";s:4:\"memo\";s:13:\"广告图片-\";}}', '1418371360');
INSERT INTO `t_sys_log` VALUES ('1584', 'admin', 'Ad', 'add', 'a:2:{s:3:\"get\";a:0:{}s:4:\"post\";a:13:{s:2:\"id\";s:0:\"\";s:4:\"asId\";s:1:\"5\";s:7:\"adClass\";s:1:\"0\";s:4:\"apId\";s:0:\"\";s:4:\"adId\";s:0:\"\";s:5:\"title\";s:12:\"底部广告\";s:6:\"adType\";s:1:\"0\";s:5:\"image\";s:19:\"4/548aa120158f2.jpg\";s:5:\"video\";s:0:\"\";s:7:\"linkUrl\";s:0:\"\";s:4:\"sort\";s:0:\"\";s:4:\"time\";s:0:\"\";s:6:\"status\";s:1:\"1\";}}', '1418371365');

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
INSERT INTO `t_sys_user` VALUES ('1', 'admin', '系统管理员', '21232f297a57a5a743894a0e4a801fc3', '1', '1', '2014-12-12 14:01:51', '192.168.0.152', '1970-01-01 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='知识点';

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('4', '1', '知识点名称一', '', '', '', '0', '1', '2014-12-04 10:12:48');
INSERT INTO `t_topic` VALUES ('5', '1', '知识点2', '', '', '阿打发斯蒂芬d', '2', '0', '2014-12-04 18:20:50');
INSERT INTO `t_topic` VALUES ('6', '0', 'dfasf', 'adfas', 'adfasfas', '', '3', '1', '2014-12-05 17:06:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=2636 DEFAULT CHARSET=utf8 COMMENT='上传文件';

-- ----------------------------
-- Records of t_upfile
-- ----------------------------
INSERT INTO `t_upfile` VALUES ('2588', '1', 'c/546b1b6e7a5d7.png', 's=100*200,m=200*300', '361', '栏目导航图片：testss', '2014-11-18 18:11:58');
INSERT INTO `t_upfile` VALUES ('2589', '1', '0/546b1bac6f261.png', '', '361', '栏目导航图片：ds', '2014-11-18 18:13:00');
INSERT INTO `t_upfile` VALUES ('2590', '1', 'e/547d5759e0bd7.jpg', '', '966441', '', '2014-12-02 14:08:25');
INSERT INTO `t_upfile` VALUES ('2591', '1', '9/547d5cf0a9f0c.png', '', '2643', 'dsadsd', '2014-12-02 14:32:16');
INSERT INTO `t_upfile` VALUES ('2592', '1', '4/547d70910c1bc.jpg', '', '966441', '', '2014-12-02 15:56:00');
INSERT INTO `t_upfile` VALUES ('2593', '1', 'b/547d70bb11e32.jpg', '', '966441', '', '2014-12-02 15:56:42');
INSERT INTO `t_upfile` VALUES ('2594', '1', 'd/547d7b81ab471.jpg', '', '966441', '', '2014-12-02 16:42:41');
INSERT INTO `t_upfile` VALUES ('2595', '1', '8/547d7b8238f96.jpg', '', '120000', '', '2014-12-02 16:42:41');
INSERT INTO `t_upfile` VALUES ('2596', '1', 'e/547d7bdfaadb5.jpg', '', '966441', '', '2014-12-02 16:44:15');
INSERT INTO `t_upfile` VALUES ('2597', '1', '4/547d8068ba7b9.jpg', '', '966441', '', '2014-12-02 17:03:36');
INSERT INTO `t_upfile` VALUES ('2598', '1', '5/547d80f4dcf3e.jpg', '', '43016', '', '2014-12-02 17:05:56');
INSERT INTO `t_upfile` VALUES ('2599', '1', '5/547d81d46a0f7.jpg', '', '966441', '', '2014-12-02 17:09:39');
INSERT INTO `t_upfile` VALUES ('2600', '1', '4/547d81d9ee126.jpg', '', '966441', '', '2014-12-02 17:09:45');
INSERT INTO `t_upfile` VALUES ('2601', '1', '8/547d81f83763a.jpg', '', '966441', '', '2014-12-02 17:10:16');
INSERT INTO `t_upfile` VALUES ('2602', '1', 'a/547d81fae550e.jpg', '', '966441', '', '2014-12-02 17:10:18');
INSERT INTO `t_upfile` VALUES ('2603', '1', '7/547d82b25529b.jpg', '', '966441', '', '2014-12-02 17:13:22');
INSERT INTO `t_upfile` VALUES ('2604', '1', '5/547d834965f73.jpg', '', '966441', '', '2014-12-02 17:15:53');
INSERT INTO `t_upfile` VALUES ('2605', '1', '9/547d838dee78b.jpg', '', '214667', '广告图片-', '2014-12-02 17:17:01');
INSERT INTO `t_upfile` VALUES ('2606', '1', '3/547d83a826457.jpg', '', '966441', '栏目导航图片：精彩推荐', '2014-12-02 17:17:28');
INSERT INTO `t_upfile` VALUES ('2607', '1', '9/547d83d46699b.jpg', '', '966441', '', '2014-12-02 17:18:12');
INSERT INTO `t_upfile` VALUES ('2608', '1', '4/547d84a9b7236.jpg', '', '966441', '', '2014-12-02 17:21:45');
INSERT INTO `t_upfile` VALUES ('2609', '1', '4/547d854ba192d.jpg', '', '966441', '栏目导航图片：1', '2014-12-02 17:24:27');
INSERT INTO `t_upfile` VALUES ('2610', '1', 'a/547d85685f5db.jpg', '', '966441', '栏目导航图片：1.png', '2014-12-02 17:24:56');
INSERT INTO `t_upfile` VALUES ('2611', '1', '6/547d858bc96f2.jpg', '', '966441', '资源导航图片：1', '2014-12-02 17:25:31');
INSERT INTO `t_upfile` VALUES ('2612', '1', '4/547d85c1e73e7.jpg', '', '966441', '资源导航图片：1.png', '2014-12-02 17:26:25');
INSERT INTO `t_upfile` VALUES ('2613', '1', '7/547d8ab82a880.jpg', '', '966441', '资源导航图片：1.png', '2014-12-02 17:47:35');
INSERT INTO `t_upfile` VALUES ('2614', '1', '3/547d8ac79819a.jpg', '', '114795', '资源导航图片：7/547d8ab82a880.jpg', '2014-12-02 17:47:51');
INSERT INTO `t_upfile` VALUES ('2615', '1', '6/547d8b2b58106.jpg', '', '43016', '资源导航图片：1', '2014-12-02 17:49:31');
INSERT INTO `t_upfile` VALUES ('2616', '1', 'e/547d8f2f692cb.jpg', '', '120000', '资源导航图片：7/547d8ab82a880.jpg', '2014-12-02 18:06:39');
INSERT INTO `t_upfile` VALUES ('2617', '1', 'a/547eddec4462f.jpg', '', '139486', '资源导航图片：', '2014-12-03 17:54:52');
INSERT INTO `t_upfile` VALUES ('2618', '1', 'c/54880b3e4a9f2.png', '', '883', '资源导航图片：1', '2014-12-10 16:58:38');
INSERT INTO `t_upfile` VALUES ('2619', '1', '8/54880bd765d3b.png', '', '883', '资源导航图片：1', '2014-12-10 17:01:11');
INSERT INTO `t_upfile` VALUES ('2620', '1', '3/54880bd76f479.png', '', '883', '资源导航图片：1', '2014-12-10 17:01:11');
INSERT INTO `t_upfile` VALUES ('2621', '1', '7/54880d5809f96.png', '', '883', '资源导航图片：1', '2014-12-10 17:07:35');
INSERT INTO `t_upfile` VALUES ('2622', '1', '8/54880d580aeda.png', '', '883', '资源导航图片：1', '2014-12-10 17:07:35');
INSERT INTO `t_upfile` VALUES ('2623', '1', 'c/548811a2efa97.png', '', '883', '资源导航图片：1', '2014-12-10 17:25:54');
INSERT INTO `t_upfile` VALUES ('2624', '1', '3/548811f5a9f0a.png', '', '883', '资源导航图片：1', '2014-12-10 17:27:17');
INSERT INTO `t_upfile` VALUES ('2625', '1', 'b/548813a6780ff.png', '', '883', '资源导航图片：1', '2014-12-10 17:34:30');
INSERT INTO `t_upfile` VALUES ('2626', '1', '5/548813b2c3eb0.png', '', '883', '资源导航图片：1', '2014-12-10 17:34:42');
INSERT INTO `t_upfile` VALUES ('2627', '1', '9/548a48f6202e1.png', '', '2022', '栏目导航图片：精彩推荐', '2014-12-12 09:46:30');
INSERT INTO `t_upfile` VALUES ('2628', '1', '3/548a490636109.png', '', '3525', '栏目导航图片：精彩推荐', '2014-12-12 09:46:46');
INSERT INTO `t_upfile` VALUES ('2629', '1', '0/548a4927958a6.png', '', '2008', '栏目导航图片：全部课程', '2014-12-12 09:47:19');
INSERT INTO `t_upfile` VALUES ('2630', '1', 'c/548a492795d8d.png', '', '3511', '栏目导航图片：全部课程', '2014-12-12 09:47:19');
INSERT INTO `t_upfile` VALUES ('2631', '1', 'f/548a494200813.png', '', '2059', '栏目导航图片：我的课程', '2014-12-12 09:47:45');
INSERT INTO `t_upfile` VALUES ('2632', '1', 'e/548a494200d3d.png', '', '3711', '栏目导航图片：我的课程', '2014-12-12 09:47:45');
INSERT INTO `t_upfile` VALUES ('2633', '1', '7/548a893d04b6e.jpg', '', '36303', '广告图片-sdfd', '2014-12-12 14:20:44');
INSERT INTO `t_upfile` VALUES ('2634', '1', '2/548a9b032129b.jpg', '', '23803', '广告图片-推荐介绍视频', '2014-12-12 15:36:35');
INSERT INTO `t_upfile` VALUES ('2635', '1', '4/548aa120158f2.jpg', '', '8937', '广告图片-', '2014-12-12 16:02:40');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OpUserId` varchar(30) NOT NULL COMMENT '运营商提供的UserID',
  `OpUserToken` varchar(50) DEFAULT NULL COMMENT '运营商提供的UserToken',
  `OpUserName` varchar(30) DEFAULT NULL COMMENT '运营商提供的用户Name',
  `nickName` varchar(20) NOT NULL COMMENT '用户昵称',
  `point` int(11) DEFAULT '0' COMMENT '用户积分',
  `amount` int(11) DEFAULT '0' COMMENT '用户元宝',
  `face` tinyint(2) DEFAULT '0' COMMENT '用户头像',
  `phone` int(11) DEFAULT '0' COMMENT '联系电话',
  `qq` int(11) DEFAULT '0' COMMENT 'QQ',
  `email` varchar(50) DEFAULT NULL COMMENT 'E-mail',
  `usedRoleID` int(11) DEFAULT '0' COMMENT '最近使用的角色ID',
  `stbType` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `addTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opUserId` (`OpUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', '123456789036', '03111508256980016640821125101009', '00000000', '', '0', '0', '0', '0', '0', null, '15', 'ztebw', null, '2014-12-10 11:28:55');
