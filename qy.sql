/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : qy

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-28 17:01:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'yuanlu', '460bc8fb94253aac4a323e3433e6a1f0', '1');
INSERT INTO `tp_admin` VALUES ('6', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `tp_admin` VALUES ('7', 'SuperAdmin', 'e10adc3949ba59abbe56e057f20f883e', '1');

-- ----------------------------
-- Table structure for tp_admin_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_comment`;
CREATE TABLE `tp_admin_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `top` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_log`;
CREATE TABLE `tp_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '操作人',
  `uname` varchar(20) NOT NULL,
  `os` varchar(20) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `module` varchar(20) DEFAULT NULL,
  `controller` varchar(20) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `time` int(11) NOT NULL COMMENT '操作时间',
  `desc` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2361 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tp_advert
-- ----------------------------
DROP TABLE IF EXISTS `tp_advert`;
CREATE TABLE `tp_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `thumb2` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL COMMENT '链接',
  `desc` varchar(255) DEFAULT NULL,
  `cate_id` tinyint(10) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `advert_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`,`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of tp_advert
-- ----------------------------
INSERT INTO `tp_advert` VALUES ('13', '多媒体解决方案领导者', '/uploads/cate/20190624/9faecedea939ef98e6dae860818581dd.jpg', '', 'http://', '  ', '0', '1', 'banner', '');
INSERT INTO `tp_advert` VALUES ('14', '顶尖多媒体设备供应商', '/uploads/cate/20190624/60487a30ffbd3ab26a1aa9d0c0bbb887.jpg', '', 'http://', '  ', '0', '1', 'banner', '');
INSERT INTO `tp_advert` VALUES ('15', '专业展馆设计及建设服务商', '/uploads/cate/20190624/6346c8480831f5d1028cba8222204c80.jpg', '', 'http://', '  ', '0', '1', 'banner', '');

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `author` varchar(50) NOT NULL DEFAULT '远路' COMMENT '作者',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `thumb` varchar(255) NOT NULL COMMENT '压缩图',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `thumb_list` text NOT NULL COMMENT '相册',
  `cate_id` tinyint(10) NOT NULL COMMENT '栏目id',
  `content` longtext NOT NULL COMMENT '内容',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `qq` varchar(12) NOT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `look` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0',
  `type_upload` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传文件类型 0：图片 1： 文件 ',
  `file_link` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `thumbs` varchar(255) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `sort_title` varchar(255) DEFAULT NULL,
  `sort_desc` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`cate_id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES ('1', '远路大学1.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('2', '远路大学2.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('3', '远路大学3.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('4', '远路大学4.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('5', '远路大学5.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('6', '远路大学6.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('7', '远路大学7.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('8', '远路大学8.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('9', '远路大学9.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('10', '远路大学10.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('11', '远路大学11.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('12', '远路大学12.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '1', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('13', '远路大学13.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '14', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('14', '远路大学14.0', '远路大学', '', '/uploads/cate/20190926\\a356e9bd20f4b4db0ea196097760a6e5.jpg', '1569499181', '', '10', '<p>sd</p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', 'The University of Leeds', ' <h2> University of Birmingham </h2>\r\n<p> 中国那嘎达</p>\r\n<p> 学校类型：公立 </p>\r\n<p> 热门专业：商科 机械工程 化学 戏剧 国际关系 </p>\r\n                                                                ');
INSERT INTO `tp_article` VALUES ('15', '远路社区第一个活动1', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('16', '远路社区第一个活动2', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '3', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('17', '远路社区第一个活动3', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('18', '远路社区第一个活动4', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('19', '远路社区第一个活动5', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('20', '远路社区第一个活动6', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('21', '远路社区第一个活动7', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('22', '远路社区第一个活动8', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('23', '远路社区第一个活动9', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '0', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('24', '远路社区第一个活动10', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '10', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('25', '远路社区第一个活动11', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '10', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('26', '远路社区第一个活动12', '远路', '二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二', '/uploads/cate/20190926\\750a2318aef10c1e453a74b48c080465.jpg', '1569509167', '', '9', '<p><span style=\"color: rgb(153, 153, 153); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 13px; background-color: rgb(255, 255, 255);\">二十岁出头，正好处在一个尴尬的年纪。似乎看透了生活，实质却依旧单纯；似乎应有尽有，实质却一无所有；内心身怀雄心壮志，却又不得不脚踏实地。 身处二</span></p>', '1', '', null, '0', '0', '28', '0', '0', '', null, '', '', '');
INSERT INTO `tp_article` VALUES ('27', '犹张国荣', '远路', '4天前 - VUE 已全面适配微信朋友圈短视频,竖屏全屏效果在朋友圈展示更富有冲击力,更有超宽屏、圆形画幅等可供选择。前置摄像头自带美颜功能,展示你360度的美,..', '/uploads/cate/20190927\\f0c8a3f1d3d035f7a619058ea2db2a87.jpg', '1569587088', '', '13', '<p><span class=\" newTimeFactor_before_abs m\" style=\"color: rgb(102, 102, 102); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">4天前&nbsp;-&nbsp;</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">VUE</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">&nbsp;已全面适配微信朋友圈短视频,竖屏全屏效果在朋友圈展示更富有冲击力,更有超宽屏、圆形画幅等可供选择。前置摄像头自带美颜功能,展示你360度的美,..</span></p>', '1', '', null, '0', '0', '2', '0', '0', '', null, '', '', '<p>从业时间：10+年</p>\r\n<p>从事：凯银智梦CEO</p>\r\n                                ');

-- ----------------------------
-- Table structure for tp_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group`;
CREATE TABLE `tp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 状态：为1正常，为0禁用',
  `rules` varchar(380) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id',
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of tp_auth_group
-- ----------------------------
INSERT INTO `tp_auth_group` VALUES ('1', '超级管理员', '1', '5,7,6,69,70,11,31,32,33,105,8,9,102,34,36,37,19,20,75,76,78,84,80,81,82,83,100,2,3,4,39,40,41,89,103,42,43,44,45,46,71,72,73,74,104,110,113,114,115,116,117,13,14,47,108,109,87,23,24,48,49,50,51,52,25,27,28,53,55,56,26,29,30,35,58,59,60,77,67,64,63,65,66,68,85,86,106,107,88,95,96,97,98,99,122,119,120,118,123,124,125,126,127,128,129,130', '所有权限');
INSERT INTO `tp_auth_group` VALUES ('3', '大内总管', '1', '5,19,20,75,76,13,14,47,108,109,87', '');

-- ----------------------------
-- Table structure for tp_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group_access`;
CREATE TABLE `tp_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of tp_auth_group_access
-- ----------------------------
INSERT INTO `tp_auth_group_access` VALUES ('1', '1');
INSERT INTO `tp_auth_group_access` VALUES ('1', '3');
INSERT INTO `tp_auth_group_access` VALUES ('1', '5');
INSERT INTO `tp_auth_group_access` VALUES ('5', '3');
INSERT INTO `tp_auth_group_access` VALUES ('6', '3');
INSERT INTO `tp_auth_group_access` VALUES ('7', '1');

-- ----------------------------
-- Table structure for tp_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `name` char(80) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `pid` tinyint(5) DEFAULT '0',
  `level` tinyint(1) DEFAULT NULL,
  `sort` tinyint(5) DEFAULT '50',
  `icon` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `condition` char(100) NOT NULL,
  `types` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of tp_auth_rule
-- ----------------------------
INSERT INTO `tp_auth_rule` VALUES ('5', '系统设置', 'system', '1', '0', '0', '1', '', '1', '', '1');
INSERT INTO `tp_auth_rule` VALUES ('2', '栏目管理', 'cate', '1', '0', '0', '2', '', '1', '', '1');
INSERT INTO `tp_auth_rule` VALUES ('3', '栏目管理', 'cate/lst', '1', '2', '1', '1', '&#xe6bf;', '1', '', '2');
INSERT INTO `tp_auth_rule` VALUES ('4', '栏目添加', 'cate/add', '1', '3', null, '50', '', '1', '', '3');
INSERT INTO `tp_auth_rule` VALUES ('6', '配置页', 'System/page', '1', '7', '2', '1', '', '1', '', '3');
INSERT INTO `tp_auth_rule` VALUES ('7', '配置列表', 'system/lst', '1', '5', '3', '3', '&#xe63c;', '1', '', '2');
INSERT INTO `tp_auth_rule` VALUES ('8', '广告轮播', 'Advert', '1', '5', '1', '4', '', '1', '', '2');
INSERT INTO `tp_auth_rule` VALUES ('9', '广告编辑', 'Advert/edit', '1', '8', null, '50', '', '1', '', '0');
INSERT INTO `tp_auth_rule` VALUES ('102', '广告列表', 'Advert/lst', '1', '8', '2', '50', '', '1', '', '3');
 

-- ----------------------------
-- Table structure for tp_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_cate`;
CREATE TABLE `tp_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_mode` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开发者模式',
  `cate_name` varchar(50) DEFAULT NULL,
  `pid` int(10) NOT NULL,
  `hot_word` tinyint(1) NOT NULL DEFAULT '0' COMMENT '热词',
  `top_menu` tinyint(1) NOT NULL DEFAULT '0',
  `thumb` varchar(100) DEFAULT '',
  `cate_desc` varchar(255) NOT NULL COMMENT '栏目描述',
  `cate_seo` varchar(255) DEFAULT NULL COMMENT '栏目SEO',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'q',
  `link` varchar(255) DEFAULT '/about',
  `wap_link` varchar(255) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '50',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of tp_cate
-- ----------------------------
INSERT INTO `tp_cate` VALUES ('1', '0', '美国留学', '0', '0', '0', '', '', '', '1', '0', '1569309798', '<p>1</p>', '0', '/category?v=mgbk', null, '50');
INSERT INTO `tp_cate` VALUES ('2', '0', '英国留学', '0', '0', '0', '', ' ', '', '1', '0', '1569309898', '<p>1</p>', '0', '/category?v=ygbk', null, '50');
INSERT INTO `tp_cate` VALUES ('3', '0', '加拿大留学', '0', '0', '0', '', ' ', '', '1', '0', '1569309917', '<p>1</p>', '0', '/category?v=jndbk', null, '50');
INSERT INTO `tp_cate` VALUES ('4', '0', '奥新留学', '0', '0', '0', '', ' ', '', '1', '0', '1569309798', '<p>1</p>', '0', '/category?v=axbk', null, '50');
INSERT INTO `tp_cate` VALUES ('5', '0', '香港留学', '0', '0', '0', '', ' ', '', '1', '0', '1569309898', '<p>1</p>', '0', '/category?v=xglx', null, '50');
INSERT INTO `tp_cate` VALUES ('6', '0', '欧洲留学', '0', '0', '0', '', ' ', '', '1', '0', '1569309917', '<p>1</p>', '0', '/category?v=azlx', null, '50');
INSERT INTO `tp_cate` VALUES ('7', '0', '海外移民', '0', '0', '0', '', ' ', '', '1', '0', '1569309798', '<p>1</p>', '0', '/category?v=mrdlx', null, '50');
INSERT INTO `tp_cate` VALUES ('8', '1', '顾问团队', '0', '0', '0', '', '', '', '1', '0', '1569309898', '<p>1</p>', '1', '/teacher', null, '50');
INSERT INTO `tp_cate` VALUES ('9', '1', '热门活动', '0', '0', '0', '', '', '', '1', '0', '1569309917', '<p>1</p>', '1', '/hotDoing', null, '50');
INSERT INTO `tp_cate` VALUES ('10', '1', '院校中心', '0', '0', '0', '', '', '', '1', '0', '1569309898', '<p>1</p>', '1', '/collage', null, '50');
INSERT INTO `tp_cate` VALUES ('11', '1', '服务查询', '0', '0', '0', '', '', '', '1', '0', '1569309917', '<p>1</p>', '1', '/serviceSearch', null, '50');
INSERT INTO `tp_cate` VALUES ('12', '0', '马耳他', '7', '0', '0', '', ' ', '', '1', '0', '1569310159', '<p>1</p>', '0', '/category?v=mrdlx', null, '50');
INSERT INTO `tp_cate` VALUES ('13', '0', '中方顾问', '8', '0', '0', '', '', '', '1', '0', '1569510423', '<p>1</p>', '1', 'teacher?cid=13', null, '50');
INSERT INTO `tp_cate` VALUES ('14', '0', '外籍顾问', '8', '0', '0', '', '', '', '1', '0', '1569510436', '<p>1</p>', '1', 'teacher?cid=14', null, '50');
INSERT INTO `tp_cate` VALUES ('15', '0', '本科留学', '1', '0', '0', '', '', '', '1', '0', '1569587323', '<p>1</p>', '0', '/category?v=mgbk', null, '50');
INSERT INTO `tp_cate` VALUES ('16', '0', '社区留学', '1', '0', '0', '', '', '', '1', '0', '1569587346', '<p>1</p>', '0', '/category?v=mgsq', null, '50');
INSERT INTO `tp_cate` VALUES ('17', '0', '硕士留学', '1', '0', '0', '', '', '', '1', '0', '1569587363', '<p>1</p>', '0', '/category?v=mgss', null, '50');
INSERT INTO `tp_cate` VALUES ('18', '0', '本科留学', '2', '0', '0', '', '', '', '1', '0', '1569590105', '<p>1</p>', '0', '/category?v=ygbk', null, '50');
INSERT INTO `tp_cate` VALUES ('19', '0', '硕士留学', '2', '0', '0', '', ' ', '', '1', '0', '1569590120', '<p>1</p>', '0', '/category?v=ygss', null, '50');
INSERT INTO `tp_cate` VALUES ('20', '0', '本科留学', '3', '0', '0', '', '', '', '1', '0', '1569591540', '<p>1</p>', '0', '/category?v=jndbk', null, '50');
INSERT INTO `tp_cate` VALUES ('21', '0', '硕士留学', '3', '0', '0', '', '', '', '1', '0', '1569591567', '<p>1</p>', '0', '/category?v=jndss', null, '50');
INSERT INTO `tp_cate` VALUES ('22', '0', '本科留学', '4', '0', '0', '', '', '', '1', '0', '1569591708', '<p>1</p>', '0', '/category?v=axbk', null, '50');
INSERT INTO `tp_cate` VALUES ('23', '0', '硕士留学', '4', '0', '0', '', '', '', '1', '0', '1569591726', '<p>1</p>', '0', '/category?v=axss', null, '50');
INSERT INTO `tp_cate` VALUES ('24', '1', '关于我们', '0', '0', '0', '', '', '', '1', '0', '1569593080', '<p>1</p>', '0', '/aboutUs', null, '50');
INSERT INTO `tp_cate` VALUES ('25', '1', '公司简介', '24', '0', '0', '', ' ', '', '1', '0', '1569593507', '<p>1后台栏目编辑里的内容里填写a</p>', '0', '/intro', null, '50');
INSERT INTO `tp_cate` VALUES ('26', '1', '联系我们', '24', '0', '0', '', '', '', '1', '0', '1569593544', '<p>1后台栏目编辑里的内容里填写a</p>', '0', '/contact', null, '50');
INSERT INTO `tp_cate` VALUES ('27', '1', '招聘信息', '24', '0', '0', '', '', '', '1', '0', '1569593595', '<p>1后台栏目编辑里的内容里填写a</p>', '0', '/takeJob', null, '50');
INSERT INTO `tp_cate` VALUES ('28', '1', '请您留言', '24', '0', '0', '', '', '', '1', '0', '1569639051', '<p>1后台栏目编辑里的内容里填写a</p>', '0', '/message', null, '50');

-- ----------------------------
-- Table structure for tp_city
-- ----------------------------
DROP TABLE IF EXISTS `tp_city`;
CREATE TABLE `tp_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pid` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`cid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COMMENT='市';

-- ----------------------------
-- Records of tp_city
-- ----------------------------
INSERT INTO `tp_city` VALUES ('1', '1', '北京市', '1');
INSERT INTO `tp_city` VALUES ('2', '1', '天津市', '2');
INSERT INTO `tp_city` VALUES ('3', '1', '上海市', '3');
INSERT INTO `tp_city` VALUES ('4', '1', '重庆市', '4');
INSERT INTO `tp_city` VALUES ('5', '1', '石家庄市', '5');
INSERT INTO `tp_city` VALUES ('6', '2', '唐山市', '5');
INSERT INTO `tp_city` VALUES ('7', '3', '秦皇岛市', '5');
INSERT INTO `tp_city` VALUES ('8', '4', '邯郸市', '5');
INSERT INTO `tp_city` VALUES ('9', '5', '邢台市', '5');
INSERT INTO `tp_city` VALUES ('10', '6', '保定市', '5');
INSERT INTO `tp_city` VALUES ('11', '7', '张家口市', '5');
INSERT INTO `tp_city` VALUES ('12', '8', '承德市', '5');
INSERT INTO `tp_city` VALUES ('13', '9', '沧州市', '5');
INSERT INTO `tp_city` VALUES ('14', '10', '廊坊市', '5');
INSERT INTO `tp_city` VALUES ('15', '11', '衡水市', '5');
INSERT INTO `tp_city` VALUES ('16', '1', '太原市', '6');
INSERT INTO `tp_city` VALUES ('17', '2', '大同市', '6');
INSERT INTO `tp_city` VALUES ('18', '3', '阳泉市', '6');
INSERT INTO `tp_city` VALUES ('19', '4', '长治市', '6');
INSERT INTO `tp_city` VALUES ('20', '5', '晋城市', '6');
INSERT INTO `tp_city` VALUES ('21', '6', '朔州市', '6');
INSERT INTO `tp_city` VALUES ('22', '7', '晋中市', '6');
INSERT INTO `tp_city` VALUES ('23', '8', '运城市', '6');
INSERT INTO `tp_city` VALUES ('24', '9', '忻州市', '6');
INSERT INTO `tp_city` VALUES ('25', '10', '临汾市', '6');
INSERT INTO `tp_city` VALUES ('26', '11', '吕梁市', '6');
INSERT INTO `tp_city` VALUES ('27', '1', '台北市', '7');
INSERT INTO `tp_city` VALUES ('28', '2', '高雄市', '7');
INSERT INTO `tp_city` VALUES ('29', '3', '基隆市', '7');
INSERT INTO `tp_city` VALUES ('30', '4', '台中市', '7');
INSERT INTO `tp_city` VALUES ('31', '5', '台南市', '7');
INSERT INTO `tp_city` VALUES ('32', '6', '新竹市', '7');
INSERT INTO `tp_city` VALUES ('33', '7', '嘉义市', '7');
INSERT INTO `tp_city` VALUES ('34', '8', '台北县', '7');
INSERT INTO `tp_city` VALUES ('35', '9', '宜兰县', '7');
INSERT INTO `tp_city` VALUES ('36', '10', '桃园县', '7');
INSERT INTO `tp_city` VALUES ('37', '11', '新竹县', '7');
INSERT INTO `tp_city` VALUES ('38', '12', '苗栗县', '7');
INSERT INTO `tp_city` VALUES ('39', '13', '台中县', '7');
INSERT INTO `tp_city` VALUES ('40', '14', '彰化县', '7');
INSERT INTO `tp_city` VALUES ('41', '15', '南投县', '7');
INSERT INTO `tp_city` VALUES ('42', '16', '云林县', '7');
INSERT INTO `tp_city` VALUES ('43', '17', '嘉义县', '7');
INSERT INTO `tp_city` VALUES ('44', '18', '台南县', '7');
INSERT INTO `tp_city` VALUES ('45', '19', '高雄县', '7');
INSERT INTO `tp_city` VALUES ('46', '20', '屏东县', '7');
INSERT INTO `tp_city` VALUES ('47', '21', '澎湖县', '7');
INSERT INTO `tp_city` VALUES ('48', '22', '台东县', '7');
INSERT INTO `tp_city` VALUES ('49', '23', '花莲县', '7');
INSERT INTO `tp_city` VALUES ('50', '1', '沈阳市', '8');
INSERT INTO `tp_city` VALUES ('51', '2', '大连市', '8');
INSERT INTO `tp_city` VALUES ('52', '3', '鞍山市', '8');
INSERT INTO `tp_city` VALUES ('53', '4', '抚顺市', '8');
INSERT INTO `tp_city` VALUES ('54', '5', '本溪市', '8');
INSERT INTO `tp_city` VALUES ('55', '6', '丹东市', '8');
INSERT INTO `tp_city` VALUES ('56', '7', '锦州市', '8');
INSERT INTO `tp_city` VALUES ('57', '8', '营口市', '8');
INSERT INTO `tp_city` VALUES ('58', '9', '阜新市', '8');
INSERT INTO `tp_city` VALUES ('59', '10', '辽阳市', '8');
INSERT INTO `tp_city` VALUES ('60', '11', '盘锦市', '8');
INSERT INTO `tp_city` VALUES ('61', '12', '铁岭市', '8');
INSERT INTO `tp_city` VALUES ('62', '13', '朝阳市', '8');
INSERT INTO `tp_city` VALUES ('63', '14', '葫芦岛市', '8');
INSERT INTO `tp_city` VALUES ('64', '1', '长春市', '9');
INSERT INTO `tp_city` VALUES ('65', '2', '吉林市', '9');
INSERT INTO `tp_city` VALUES ('66', '3', '四平市', '9');
INSERT INTO `tp_city` VALUES ('67', '4', '辽源市', '9');
INSERT INTO `tp_city` VALUES ('68', '5', '通化市', '9');
INSERT INTO `tp_city` VALUES ('69', '6', '白山市', '9');
INSERT INTO `tp_city` VALUES ('70', '7', '松原市', '9');
INSERT INTO `tp_city` VALUES ('71', '8', '白城市', '9');
INSERT INTO `tp_city` VALUES ('72', '9', '延边朝鲜族自治州', '9');
INSERT INTO `tp_city` VALUES ('73', '1', '哈尔滨市', '10');
INSERT INTO `tp_city` VALUES ('74', '2', '齐齐哈尔市', '10');
INSERT INTO `tp_city` VALUES ('75', '3', '鹤 岗 市', '10');
INSERT INTO `tp_city` VALUES ('76', '4', '双鸭山市', '10');
INSERT INTO `tp_city` VALUES ('77', '5', '鸡 西 市', '10');
INSERT INTO `tp_city` VALUES ('78', '6', '大 庆 市', '10');
INSERT INTO `tp_city` VALUES ('79', '7', '伊 春 市', '10');
INSERT INTO `tp_city` VALUES ('80', '8', '牡丹江市', '10');
INSERT INTO `tp_city` VALUES ('81', '9', '佳木斯市', '10');
INSERT INTO `tp_city` VALUES ('82', '10', '七台河市', '10');
INSERT INTO `tp_city` VALUES ('83', '11', '黑 河 市', '10');
INSERT INTO `tp_city` VALUES ('84', '12', '绥 化 市', '10');
INSERT INTO `tp_city` VALUES ('85', '13', '大兴安岭地区', '10');
INSERT INTO `tp_city` VALUES ('86', '1', '南京市', '11');
INSERT INTO `tp_city` VALUES ('87', '2', '无锡市', '11');
INSERT INTO `tp_city` VALUES ('88', '3', '徐州市', '11');
INSERT INTO `tp_city` VALUES ('89', '4', '常州市', '11');
INSERT INTO `tp_city` VALUES ('90', '5', '苏州市', '11');
INSERT INTO `tp_city` VALUES ('91', '6', '南通市', '11');
INSERT INTO `tp_city` VALUES ('92', '7', '连云港市', '11');
INSERT INTO `tp_city` VALUES ('93', '8', '淮安市', '11');
INSERT INTO `tp_city` VALUES ('94', '9', '盐城市', '11');
INSERT INTO `tp_city` VALUES ('95', '10', '扬州市', '11');
INSERT INTO `tp_city` VALUES ('96', '11', '镇江市', '11');
INSERT INTO `tp_city` VALUES ('97', '12', '泰州市', '11');
INSERT INTO `tp_city` VALUES ('98', '13', '宿迁市', '11');
INSERT INTO `tp_city` VALUES ('99', '1', '杭州市', '12');
INSERT INTO `tp_city` VALUES ('100', '2', '宁波市', '12');
INSERT INTO `tp_city` VALUES ('101', '3', '温州市', '12');
INSERT INTO `tp_city` VALUES ('102', '4', '嘉兴市', '12');
INSERT INTO `tp_city` VALUES ('103', '5', '湖州市', '12');
INSERT INTO `tp_city` VALUES ('104', '6', '绍兴市', '12');
INSERT INTO `tp_city` VALUES ('105', '7', '金华市', '12');
INSERT INTO `tp_city` VALUES ('106', '8', '衢州市', '12');
INSERT INTO `tp_city` VALUES ('107', '9', '舟山市', '12');
INSERT INTO `tp_city` VALUES ('108', '10', '台州市', '12');
INSERT INTO `tp_city` VALUES ('109', '11', '丽水市', '12');
INSERT INTO `tp_city` VALUES ('110', '1', '合肥市', '13');
INSERT INTO `tp_city` VALUES ('111', '2', '芜湖市', '13');
INSERT INTO `tp_city` VALUES ('112', '3', '蚌埠市', '13');
INSERT INTO `tp_city` VALUES ('113', '4', '淮南市', '13');
INSERT INTO `tp_city` VALUES ('114', '5', '马鞍山市', '13');
INSERT INTO `tp_city` VALUES ('115', '6', '淮北市', '13');
INSERT INTO `tp_city` VALUES ('116', '7', '铜陵市', '13');
INSERT INTO `tp_city` VALUES ('117', '8', '安庆市', '13');
INSERT INTO `tp_city` VALUES ('118', '9', '黄山市', '13');
INSERT INTO `tp_city` VALUES ('119', '10', '滁州市', '13');
INSERT INTO `tp_city` VALUES ('120', '11', '阜阳市', '13');
INSERT INTO `tp_city` VALUES ('121', '12', '宿州市', '13');
INSERT INTO `tp_city` VALUES ('122', '13', '巢湖市', '13');
INSERT INTO `tp_city` VALUES ('123', '14', '六安市', '13');
INSERT INTO `tp_city` VALUES ('124', '15', '亳州市', '13');
INSERT INTO `tp_city` VALUES ('125', '16', '池州市', '13');
INSERT INTO `tp_city` VALUES ('126', '17', '宣城市', '13');
INSERT INTO `tp_city` VALUES ('127', '1', '福州市', '14');
INSERT INTO `tp_city` VALUES ('128', '2', '厦门市', '14');
INSERT INTO `tp_city` VALUES ('129', '3', '莆田市', '14');
INSERT INTO `tp_city` VALUES ('130', '4', '三明市', '14');
INSERT INTO `tp_city` VALUES ('131', '5', '泉州市', '14');
INSERT INTO `tp_city` VALUES ('132', '6', '漳州市', '14');
INSERT INTO `tp_city` VALUES ('133', '7', '南平市', '14');
INSERT INTO `tp_city` VALUES ('134', '8', '龙岩市', '14');
INSERT INTO `tp_city` VALUES ('135', '9', '宁德市', '14');
INSERT INTO `tp_city` VALUES ('136', '1', '南昌市', '15');
INSERT INTO `tp_city` VALUES ('137', '2', '景德镇市', '15');
INSERT INTO `tp_city` VALUES ('138', '3', '萍乡市', '15');
INSERT INTO `tp_city` VALUES ('139', '4', '九江市', '15');
INSERT INTO `tp_city` VALUES ('140', '5', '新余市', '15');
INSERT INTO `tp_city` VALUES ('141', '6', '鹰潭市', '15');
INSERT INTO `tp_city` VALUES ('142', '7', '赣州市', '15');
INSERT INTO `tp_city` VALUES ('143', '8', '吉安市', '15');
INSERT INTO `tp_city` VALUES ('144', '9', '宜春市', '15');
INSERT INTO `tp_city` VALUES ('145', '10', '抚州市', '15');
INSERT INTO `tp_city` VALUES ('146', '11', '上饶市', '15');
INSERT INTO `tp_city` VALUES ('147', '1', '济南市', '16');
INSERT INTO `tp_city` VALUES ('148', '2', '青岛市', '16');
INSERT INTO `tp_city` VALUES ('149', '3', '淄博市', '16');
INSERT INTO `tp_city` VALUES ('150', '4', '枣庄市', '16');
INSERT INTO `tp_city` VALUES ('151', '5', '东营市', '16');
INSERT INTO `tp_city` VALUES ('152', '6', '烟台市', '16');
INSERT INTO `tp_city` VALUES ('153', '7', '潍坊市', '16');
INSERT INTO `tp_city` VALUES ('154', '8', '济宁市', '16');
INSERT INTO `tp_city` VALUES ('155', '9', '泰安市', '16');
INSERT INTO `tp_city` VALUES ('156', '10', '威海市', '16');
INSERT INTO `tp_city` VALUES ('157', '11', '日照市', '16');
INSERT INTO `tp_city` VALUES ('158', '12', '莱芜市', '16');
INSERT INTO `tp_city` VALUES ('159', '13', '临沂市', '16');
INSERT INTO `tp_city` VALUES ('160', '14', '德州市', '16');
INSERT INTO `tp_city` VALUES ('161', '15', '聊城市', '16');
INSERT INTO `tp_city` VALUES ('162', '16', '滨州市', '16');
INSERT INTO `tp_city` VALUES ('163', '17', '菏泽市', '16');
INSERT INTO `tp_city` VALUES ('164', '1', '郑州市', '17');
INSERT INTO `tp_city` VALUES ('165', '2', '开封市', '17');
INSERT INTO `tp_city` VALUES ('166', '3', '洛阳市', '17');
INSERT INTO `tp_city` VALUES ('167', '4', '平顶山市', '17');
INSERT INTO `tp_city` VALUES ('168', '5', '安阳市', '17');
INSERT INTO `tp_city` VALUES ('169', '6', '鹤壁市', '17');
INSERT INTO `tp_city` VALUES ('170', '7', '新乡市', '17');
INSERT INTO `tp_city` VALUES ('171', '8', '焦作市', '17');
INSERT INTO `tp_city` VALUES ('172', '9', '濮阳市', '17');
INSERT INTO `tp_city` VALUES ('173', '10', '许昌市', '17');
INSERT INTO `tp_city` VALUES ('174', '11', '漯河市', '17');
INSERT INTO `tp_city` VALUES ('175', '12', '三门峡市', '17');
INSERT INTO `tp_city` VALUES ('176', '13', '南阳市', '17');
INSERT INTO `tp_city` VALUES ('177', '14', '商丘市', '17');
INSERT INTO `tp_city` VALUES ('178', '15', '信阳市', '17');
INSERT INTO `tp_city` VALUES ('179', '16', '周口市', '17');
INSERT INTO `tp_city` VALUES ('180', '17', '驻马店市', '17');
INSERT INTO `tp_city` VALUES ('181', '18', '济源市', '17');
INSERT INTO `tp_city` VALUES ('182', '1', '武汉市', '18');
INSERT INTO `tp_city` VALUES ('183', '2', '黄石市', '18');
INSERT INTO `tp_city` VALUES ('184', '3', '十堰市', '18');
INSERT INTO `tp_city` VALUES ('185', '4', '荆州市', '18');
INSERT INTO `tp_city` VALUES ('186', '5', '宜昌市', '18');
INSERT INTO `tp_city` VALUES ('187', '6', '襄樊市', '18');
INSERT INTO `tp_city` VALUES ('188', '7', '鄂州市', '18');
INSERT INTO `tp_city` VALUES ('189', '8', '荆门市', '18');
INSERT INTO `tp_city` VALUES ('190', '9', '孝感市', '18');
INSERT INTO `tp_city` VALUES ('191', '10', '黄冈市', '18');
INSERT INTO `tp_city` VALUES ('192', '11', '咸宁市', '18');
INSERT INTO `tp_city` VALUES ('193', '12', '随州市', '18');
INSERT INTO `tp_city` VALUES ('194', '13', '仙桃市', '18');
INSERT INTO `tp_city` VALUES ('195', '14', '天门市', '18');
INSERT INTO `tp_city` VALUES ('196', '15', '潜江市', '18');
INSERT INTO `tp_city` VALUES ('197', '16', '神农架林区', '18');
INSERT INTO `tp_city` VALUES ('198', '17', '恩施土家族苗族自治州', '18');
INSERT INTO `tp_city` VALUES ('199', '1', '长沙市', '19');
INSERT INTO `tp_city` VALUES ('200', '2', '株洲市', '19');
INSERT INTO `tp_city` VALUES ('201', '3', '湘潭市', '19');
INSERT INTO `tp_city` VALUES ('202', '4', '衡阳市', '19');
INSERT INTO `tp_city` VALUES ('203', '5', '邵阳市', '19');
INSERT INTO `tp_city` VALUES ('204', '6', '岳阳市', '19');
INSERT INTO `tp_city` VALUES ('205', '7', '常德市', '19');
INSERT INTO `tp_city` VALUES ('206', '8', '张家界市', '19');
INSERT INTO `tp_city` VALUES ('207', '9', '益阳市', '19');
INSERT INTO `tp_city` VALUES ('208', '10', '郴州市', '19');
INSERT INTO `tp_city` VALUES ('209', '11', '永州市', '19');
INSERT INTO `tp_city` VALUES ('210', '12', '怀化市', '19');
INSERT INTO `tp_city` VALUES ('211', '13', '娄底市', '19');
INSERT INTO `tp_city` VALUES ('212', '14', '湘西土家族苗族自治州', '19');
INSERT INTO `tp_city` VALUES ('213', '1', '广州市', '20');
INSERT INTO `tp_city` VALUES ('214', '2', '深圳市', '20');
INSERT INTO `tp_city` VALUES ('215', '3', '珠海市', '20');
INSERT INTO `tp_city` VALUES ('216', '4', '汕头市', '20');
INSERT INTO `tp_city` VALUES ('217', '5', '韶关市', '20');
INSERT INTO `tp_city` VALUES ('218', '6', '佛山市', '20');
INSERT INTO `tp_city` VALUES ('219', '7', '江门市', '20');
INSERT INTO `tp_city` VALUES ('220', '8', '湛江市', '20');
INSERT INTO `tp_city` VALUES ('221', '9', '茂名市', '20');
INSERT INTO `tp_city` VALUES ('222', '10', '肇庆市', '20');
INSERT INTO `tp_city` VALUES ('223', '11', '惠州市', '20');
INSERT INTO `tp_city` VALUES ('224', '12', '梅州市', '20');
INSERT INTO `tp_city` VALUES ('225', '13', '汕尾市', '20');
INSERT INTO `tp_city` VALUES ('226', '14', '河源市', '20');
INSERT INTO `tp_city` VALUES ('227', '15', '阳江市', '20');
INSERT INTO `tp_city` VALUES ('228', '16', '清远市', '20');
INSERT INTO `tp_city` VALUES ('229', '17', '东莞市', '20');
INSERT INTO `tp_city` VALUES ('230', '18', '中山市', '20');
INSERT INTO `tp_city` VALUES ('231', '19', '潮州市', '20');
INSERT INTO `tp_city` VALUES ('232', '20', '揭阳市', '20');
INSERT INTO `tp_city` VALUES ('233', '21', '云浮市', '20');
INSERT INTO `tp_city` VALUES ('234', '1', '兰州市', '21');
INSERT INTO `tp_city` VALUES ('235', '2', '金昌市', '21');
INSERT INTO `tp_city` VALUES ('236', '3', '白银市', '21');
INSERT INTO `tp_city` VALUES ('237', '4', '天水市', '21');
INSERT INTO `tp_city` VALUES ('238', '5', '嘉峪关市', '21');
INSERT INTO `tp_city` VALUES ('239', '6', '武威市', '21');
INSERT INTO `tp_city` VALUES ('240', '7', '张掖市', '21');
INSERT INTO `tp_city` VALUES ('241', '8', '平凉市', '21');
INSERT INTO `tp_city` VALUES ('242', '9', '酒泉市', '21');
INSERT INTO `tp_city` VALUES ('243', '10', '庆阳市', '21');
INSERT INTO `tp_city` VALUES ('244', '11', '定西市', '21');
INSERT INTO `tp_city` VALUES ('245', '12', '陇南市', '21');
INSERT INTO `tp_city` VALUES ('246', '13', '临夏回族自治州', '21');
INSERT INTO `tp_city` VALUES ('247', '14', '甘南藏族自治州', '21');
INSERT INTO `tp_city` VALUES ('248', '1', '成都市', '22');
INSERT INTO `tp_city` VALUES ('249', '2', '自贡市', '22');
INSERT INTO `tp_city` VALUES ('250', '3', '攀枝花市', '22');
INSERT INTO `tp_city` VALUES ('251', '4', '泸州市', '22');
INSERT INTO `tp_city` VALUES ('252', '5', '德阳市', '22');
INSERT INTO `tp_city` VALUES ('253', '6', '绵阳市', '22');
INSERT INTO `tp_city` VALUES ('254', '7', '广元市', '22');
INSERT INTO `tp_city` VALUES ('255', '8', '遂宁市', '22');
INSERT INTO `tp_city` VALUES ('256', '9', '内江市', '22');
INSERT INTO `tp_city` VALUES ('257', '10', '乐山市', '22');
INSERT INTO `tp_city` VALUES ('258', '11', '南充市', '22');
INSERT INTO `tp_city` VALUES ('259', '12', '眉山市', '22');
INSERT INTO `tp_city` VALUES ('260', '13', '宜宾市', '22');
INSERT INTO `tp_city` VALUES ('261', '14', '广安市', '22');
INSERT INTO `tp_city` VALUES ('262', '15', '达州市', '22');
INSERT INTO `tp_city` VALUES ('263', '16', '雅安市', '22');
INSERT INTO `tp_city` VALUES ('264', '17', '巴中市', '22');
INSERT INTO `tp_city` VALUES ('265', '18', '资阳市', '22');
INSERT INTO `tp_city` VALUES ('266', '19', '阿坝藏族羌族自治州', '22');
INSERT INTO `tp_city` VALUES ('267', '20', '甘孜藏族自治州', '22');
INSERT INTO `tp_city` VALUES ('268', '21', '凉山彝族自治州', '22');
INSERT INTO `tp_city` VALUES ('269', '1', '贵阳市', '23');
INSERT INTO `tp_city` VALUES ('270', '2', '六盘水市', '23');
INSERT INTO `tp_city` VALUES ('271', '3', '遵义市', '23');
INSERT INTO `tp_city` VALUES ('272', '4', '安顺市', '23');
INSERT INTO `tp_city` VALUES ('273', '5', '铜仁地区', '23');
INSERT INTO `tp_city` VALUES ('274', '6', '毕节地区', '23');
INSERT INTO `tp_city` VALUES ('275', '7', '黔西南布依族苗族自治州', '23');
INSERT INTO `tp_city` VALUES ('276', '8', '黔东南苗族侗族自治州', '23');
INSERT INTO `tp_city` VALUES ('277', '9', '黔南布依族苗族自治州', '23');
INSERT INTO `tp_city` VALUES ('278', '1', '海口市', '24');
INSERT INTO `tp_city` VALUES ('279', '2', '三亚市', '24');
INSERT INTO `tp_city` VALUES ('280', '3', '五指山市', '24');
INSERT INTO `tp_city` VALUES ('281', '4', '琼海市', '24');
INSERT INTO `tp_city` VALUES ('282', '5', '儋州市', '24');
INSERT INTO `tp_city` VALUES ('283', '6', '文昌市', '24');
INSERT INTO `tp_city` VALUES ('284', '7', '万宁市', '24');
INSERT INTO `tp_city` VALUES ('285', '8', '东方市', '24');
INSERT INTO `tp_city` VALUES ('286', '9', '澄迈县', '24');
INSERT INTO `tp_city` VALUES ('287', '10', '定安县', '24');
INSERT INTO `tp_city` VALUES ('288', '11', '屯昌县', '24');
INSERT INTO `tp_city` VALUES ('289', '12', '临高县', '24');
INSERT INTO `tp_city` VALUES ('290', '13', '白沙黎族自治县', '24');
INSERT INTO `tp_city` VALUES ('291', '14', '昌江黎族自治县', '24');
INSERT INTO `tp_city` VALUES ('292', '15', '乐东黎族自治县', '24');
INSERT INTO `tp_city` VALUES ('293', '16', '陵水黎族自治县', '24');
INSERT INTO `tp_city` VALUES ('294', '17', '保亭黎族苗族自治县', '24');
INSERT INTO `tp_city` VALUES ('295', '18', '琼中黎族苗族自治县', '24');
INSERT INTO `tp_city` VALUES ('296', '1', '昆明市', '25');
INSERT INTO `tp_city` VALUES ('297', '2', '曲靖市', '25');
INSERT INTO `tp_city` VALUES ('298', '3', '玉溪市', '25');
INSERT INTO `tp_city` VALUES ('299', '4', '保山市', '25');
INSERT INTO `tp_city` VALUES ('300', '5', '昭通市', '25');
INSERT INTO `tp_city` VALUES ('301', '6', '丽江市', '25');
INSERT INTO `tp_city` VALUES ('302', '7', '思茅市', '25');
INSERT INTO `tp_city` VALUES ('303', '8', '临沧市', '25');
INSERT INTO `tp_city` VALUES ('304', '9', '文山壮族苗族自治州', '25');
INSERT INTO `tp_city` VALUES ('305', '10', '红河哈尼族彝族自治州', '25');
INSERT INTO `tp_city` VALUES ('306', '11', '西双版纳傣族自治州', '25');
INSERT INTO `tp_city` VALUES ('307', '12', '楚雄彝族自治州', '25');
INSERT INTO `tp_city` VALUES ('308', '13', '大理白族自治州', '25');
INSERT INTO `tp_city` VALUES ('309', '14', '德宏傣族景颇族自治州', '25');
INSERT INTO `tp_city` VALUES ('310', '15', '怒江傈傈族自治州', '25');
INSERT INTO `tp_city` VALUES ('311', '16', '迪庆藏族自治州', '25');
INSERT INTO `tp_city` VALUES ('312', '1', '西宁市', '26');
INSERT INTO `tp_city` VALUES ('313', '2', '海东地区', '26');
INSERT INTO `tp_city` VALUES ('314', '3', '海北藏族自治州', '26');
INSERT INTO `tp_city` VALUES ('315', '4', '黄南藏族自治州', '26');
INSERT INTO `tp_city` VALUES ('316', '5', '海南藏族自治州', '26');
INSERT INTO `tp_city` VALUES ('317', '6', '果洛藏族自治州', '26');
INSERT INTO `tp_city` VALUES ('318', '7', '玉树藏族自治州', '26');
INSERT INTO `tp_city` VALUES ('319', '8', '海西蒙古族藏族自治州', '26');
INSERT INTO `tp_city` VALUES ('320', '1', '西安市', '27');
INSERT INTO `tp_city` VALUES ('321', '2', '铜川市', '27');
INSERT INTO `tp_city` VALUES ('322', '3', '宝鸡市', '27');
INSERT INTO `tp_city` VALUES ('323', '4', '咸阳市', '27');
INSERT INTO `tp_city` VALUES ('324', '5', '渭南市', '27');
INSERT INTO `tp_city` VALUES ('325', '6', '延安市', '27');
INSERT INTO `tp_city` VALUES ('326', '7', '汉中市', '27');
INSERT INTO `tp_city` VALUES ('327', '8', '榆林市', '27');
INSERT INTO `tp_city` VALUES ('328', '9', '安康市', '27');
INSERT INTO `tp_city` VALUES ('329', '10', '商洛市', '27');
INSERT INTO `tp_city` VALUES ('330', '1', '南宁市', '28');
INSERT INTO `tp_city` VALUES ('331', '2', '柳州市', '28');
INSERT INTO `tp_city` VALUES ('332', '3', '桂林市', '28');
INSERT INTO `tp_city` VALUES ('333', '4', '梧州市', '28');
INSERT INTO `tp_city` VALUES ('334', '5', '北海市', '28');
INSERT INTO `tp_city` VALUES ('335', '6', '防城港市', '28');
INSERT INTO `tp_city` VALUES ('336', '7', '钦州市', '28');
INSERT INTO `tp_city` VALUES ('337', '8', '贵港市', '28');
INSERT INTO `tp_city` VALUES ('338', '9', '玉林市', '28');
INSERT INTO `tp_city` VALUES ('339', '10', '百色市', '28');
INSERT INTO `tp_city` VALUES ('340', '11', '贺州市', '28');
INSERT INTO `tp_city` VALUES ('341', '12', '河池市', '28');
INSERT INTO `tp_city` VALUES ('342', '13', '来宾市', '28');
INSERT INTO `tp_city` VALUES ('343', '14', '崇左市', '28');
INSERT INTO `tp_city` VALUES ('344', '1', '拉萨市', '29');
INSERT INTO `tp_city` VALUES ('345', '2', '那曲地区', '29');
INSERT INTO `tp_city` VALUES ('346', '3', '昌都地区', '29');
INSERT INTO `tp_city` VALUES ('347', '4', '山南地区', '29');
INSERT INTO `tp_city` VALUES ('348', '5', '日喀则地区', '29');
INSERT INTO `tp_city` VALUES ('349', '6', '阿里地区', '29');
INSERT INTO `tp_city` VALUES ('350', '7', '林芝地区', '29');
INSERT INTO `tp_city` VALUES ('351', '1', '银川市', '30');
INSERT INTO `tp_city` VALUES ('352', '2', '石嘴山市', '30');
INSERT INTO `tp_city` VALUES ('353', '3', '吴忠市', '30');
INSERT INTO `tp_city` VALUES ('354', '4', '固原市', '30');
INSERT INTO `tp_city` VALUES ('355', '5', '中卫市', '30');
INSERT INTO `tp_city` VALUES ('356', '1', '乌鲁木齐市', '31');
INSERT INTO `tp_city` VALUES ('357', '2', '克拉玛依市', '31');
INSERT INTO `tp_city` VALUES ('358', '3', '石河子市　', '31');
INSERT INTO `tp_city` VALUES ('359', '4', '阿拉尔市', '31');
INSERT INTO `tp_city` VALUES ('360', '5', '图木舒克市', '31');
INSERT INTO `tp_city` VALUES ('361', '6', '五家渠市', '31');
INSERT INTO `tp_city` VALUES ('362', '7', '吐鲁番市', '31');
INSERT INTO `tp_city` VALUES ('363', '8', '阿克苏市', '31');
INSERT INTO `tp_city` VALUES ('364', '9', '喀什市', '31');
INSERT INTO `tp_city` VALUES ('365', '10', '哈密市', '31');
INSERT INTO `tp_city` VALUES ('366', '11', '和田市', '31');
INSERT INTO `tp_city` VALUES ('367', '12', '阿图什市', '31');
INSERT INTO `tp_city` VALUES ('368', '13', '库尔勒市', '31');
INSERT INTO `tp_city` VALUES ('369', '14', '昌吉市　', '31');
INSERT INTO `tp_city` VALUES ('370', '15', '阜康市', '31');
INSERT INTO `tp_city` VALUES ('371', '16', '米泉市', '31');
INSERT INTO `tp_city` VALUES ('372', '17', '博乐市', '31');
INSERT INTO `tp_city` VALUES ('373', '18', '伊宁市', '31');
INSERT INTO `tp_city` VALUES ('374', '19', '奎屯市', '31');
INSERT INTO `tp_city` VALUES ('375', '20', '塔城市', '31');
INSERT INTO `tp_city` VALUES ('376', '21', '乌苏市', '31');
INSERT INTO `tp_city` VALUES ('377', '22', '阿勒泰市', '31');
INSERT INTO `tp_city` VALUES ('378', '1', '呼和浩特市', '32');
INSERT INTO `tp_city` VALUES ('379', '2', '包头市', '32');
INSERT INTO `tp_city` VALUES ('380', '3', '乌海市', '32');
INSERT INTO `tp_city` VALUES ('381', '4', '赤峰市', '32');
INSERT INTO `tp_city` VALUES ('382', '5', '通辽市', '32');
INSERT INTO `tp_city` VALUES ('383', '6', '鄂尔多斯市', '32');
INSERT INTO `tp_city` VALUES ('384', '7', '呼伦贝尔市', '32');
INSERT INTO `tp_city` VALUES ('385', '8', '巴彦淖尔市', '32');
INSERT INTO `tp_city` VALUES ('386', '9', '乌兰察布市', '32');
INSERT INTO `tp_city` VALUES ('387', '10', '锡林郭勒盟', '32');
INSERT INTO `tp_city` VALUES ('388', '11', '兴安盟', '32');
INSERT INTO `tp_city` VALUES ('389', '12', '阿拉善盟', '32');
INSERT INTO `tp_city` VALUES ('390', '1', '澳门特别行政区', '33');
INSERT INTO `tp_city` VALUES ('391', '1', '香港特别行政区', '34');

-- ----------------------------
-- Table structure for tp_click
-- ----------------------------
DROP TABLE IF EXISTS `tp_click`;
CREATE TABLE `tp_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='点赞';

-- ----------------------------
-- Records of tp_click
-- ----------------------------
INSERT INTO `tp_click` VALUES ('6', '4', '4', 'w_group');
INSERT INTO `tp_click` VALUES ('7', '4', '2', 'w_group');
INSERT INTO `tp_click` VALUES ('11', '4', '20', 'w_personal');
INSERT INTO `tp_click` VALUES ('10', '4', '2', 'w_personal');
INSERT INTO `tp_click` VALUES ('12', '4', '15', 'w_product');
INSERT INTO `tp_click` VALUES ('13', '4', '1', 'w_personal');
INSERT INTO `tp_click` VALUES ('14', '4', '40', 'w_personal');
INSERT INTO `tp_click` VALUES ('15', '4', '31', 'w_openid');
INSERT INTO `tp_click` VALUES ('16', '4', '7', 'w_product');

-- ----------------------------
-- Table structure for tp_deposit_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_deposit_log`;
CREATE TABLE `tp_deposit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `time` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `desc` varchar(20) NOT NULL,
  `current` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_deposit_log
-- ----------------------------
INSERT INTO `tp_deposit_log` VALUES ('1', '-1', '10.00', '1549270912', '4', '发布微信群', '0.31');
INSERT INTO `tp_deposit_log` VALUES ('2', '1', '0.02', '1549271119', '4', '签到', '0.33');
INSERT INTO `tp_deposit_log` VALUES ('7', '1', '0.05', '1549378082', '4', '签到', '0.38');
INSERT INTO `tp_deposit_log` VALUES ('8', '1', '0.05', '1549378491', '4', '签到', '0.48');
INSERT INTO `tp_deposit_log` VALUES ('9', '1', '0.02', '1549378518', '4', '签到', '0.50');
INSERT INTO `tp_deposit_log` VALUES ('10', '1', '0.02', '1549461569', '4', '签到', '0.52');
INSERT INTO `tp_deposit_log` VALUES ('11', '-1', '50.00', '1549532142', '4', '发布货源', '0.52');
INSERT INTO `tp_deposit_log` VALUES ('12', '-1', '8.00', '1549609827', '4', '发布公众号', '2.52');
INSERT INTO `tp_deposit_log` VALUES ('13', '-1', '8.00', '1549625747', '4', '发布公众号', '12.52');

-- ----------------------------
-- Table structure for tp_like
-- ----------------------------
DROP TABLE IF EXISTS `tp_like`;
CREATE TABLE `tp_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `art_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='点击表';

-- ----------------------------
-- Records of tp_like
-- ----------------------------
INSERT INTO `tp_like` VALUES ('3', '127.0.0.1', '29');
INSERT INTO `tp_like` VALUES ('4', '127.0.0.1', '31');

-- ----------------------------
-- Table structure for tp_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_link`;
CREATE TABLE `tp_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `thumb` varchar(255) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_link
-- ----------------------------
INSERT INTO `tp_link` VALUES ('1', 'hotword', '美女微信', '/copenid/115', '1', '', '      ');
INSERT INTO `tp_link` VALUES ('2', 'hotart', '微信怎么抢红包', '/marticle/56', '1', '', '  ');

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='管理员登陆记录';

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES ('1', '1', '1546937479', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('2', '1', '1546943189', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('3', '1', '1547021307', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('4', '5', '1547053899', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('5', '1', '1547057879', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('6', '1', '1547057932', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('7', '1', '1547058073', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('8', '1', '1547058246', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('9', '1', '1547058459', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('10', '1', '1547058648', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('11', '1', '1547058671', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('12', '1', '1547058719', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('13', '1', '1547058908', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('14', '1', '1547058928', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('15', '1', '1547060955', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('16', '1', '1547061285', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('17', '5', '1547113303', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('18', '5', '1547787754', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('19', '5', '1547944253', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('20', '5', '1547945180', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('21', '1', '1547945235', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('22', '1', '1547945896', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('23', '1', '1547946166', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('24', '1', '1548076829', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('25', '1', '1548122710', '127.0.0.1', '本地环境');
INSERT INTO `tp_login_log` VALUES ('26', '5', '1548125704', '127.0.0.1', '本地环境');

-- ----------------------------
-- Table structure for tp_message
-- ----------------------------
DROP TABLE IF EXISTS `tp_message`;
CREATE TABLE `tp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `contact` varchar(50) NOT NULL COMMENT '联系方式',
  `message` varchar(500) NOT NULL COMMENT '留言',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '称谓',
  `mobile` varchar(12) DEFAULT NULL,
  `fix` varchar(12) DEFAULT NULL,
  `topic` varchar(50) DEFAULT NULL,
  `weixin` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of tp_message
-- ----------------------------
INSERT INTO `tp_message` VALUES ('8', '张国荣', '', '这是一个竞争异常激烈的名单，精挑细选了2017年1月到12月之间发布的最佳开源Python库、工具和应用程序。Mybridge AI 通过考量受欢迎程度、参与度和新近度等指标来评估这些参选项目的质量。这些项目在Github上得星的数量平均为3,707个', '0', '1552462066', '先生', '17608428675', '3243424', '没有主题', null, null);
INSERT INTO `tp_message` VALUES ('9', '字符分', '', '这是一个竞争异常激烈的名单，精挑细选了2017年1月到12月之间发布的最佳开源Python库、工具和应用程序。Mybridge AI 通过考量受欢迎程度、参与度和新近度等指标来评估这些参选项目的质量。这些项目在Github上得星的数量平均为3,707个', '0', '1552462113', '先生', '18674357966', '46546534', '的归属感', null, null);
INSERT INTO `tp_message` VALUES ('12', 'sdd', '', '', '0', '1569655667', null, 'sdsd', null, null, 'sdsd', null);
INSERT INTO `tp_message` VALUES ('13', 'dsd', '', '', '0', '1569655723', null, 'sdsd', null, null, 'sdsd', null);
INSERT INTO `tp_message` VALUES ('14', 'sdd', '', 'dasd', '0', '1569656600', null, '17608539685', null, null, 'dsad', 'sadas');

-- ----------------------------
-- Table structure for tp_provincial
-- ----------------------------
DROP TABLE IF EXISTS `tp_provincial`;
CREATE TABLE `tp_provincial` (
  `id` int(11) NOT NULL DEFAULT '0',
  `provincial` varchar(50) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='省';

-- ----------------------------
-- Records of tp_provincial
-- ----------------------------
INSERT INTO `tp_provincial` VALUES ('1', '北京市', '0');
INSERT INTO `tp_provincial` VALUES ('2', '天津市', '0');
INSERT INTO `tp_provincial` VALUES ('3', '上海市', '0');
INSERT INTO `tp_provincial` VALUES ('4', '重庆市', '0');
INSERT INTO `tp_provincial` VALUES ('5', '河北省', '0');
INSERT INTO `tp_provincial` VALUES ('6', '山西省', '0');
INSERT INTO `tp_provincial` VALUES ('7', '台湾省', '0');
INSERT INTO `tp_provincial` VALUES ('8', '辽宁省', '0');
INSERT INTO `tp_provincial` VALUES ('9', '吉林省', '0');
INSERT INTO `tp_provincial` VALUES ('10', '黑龙江省', '0');
INSERT INTO `tp_provincial` VALUES ('11', '江苏省', '0');
INSERT INTO `tp_provincial` VALUES ('12', '浙江省', '0');
INSERT INTO `tp_provincial` VALUES ('13', '安徽省', '0');
INSERT INTO `tp_provincial` VALUES ('14', '福建省', '0');
INSERT INTO `tp_provincial` VALUES ('15', '江西省', '0');
INSERT INTO `tp_provincial` VALUES ('16', '山东省', '0');
INSERT INTO `tp_provincial` VALUES ('17', '河南省', '0');
INSERT INTO `tp_provincial` VALUES ('18', '湖北省', '0');
INSERT INTO `tp_provincial` VALUES ('19', '湖南省', '0');
INSERT INTO `tp_provincial` VALUES ('20', '广东省', '0');
INSERT INTO `tp_provincial` VALUES ('21', '甘肃省', '0');
INSERT INTO `tp_provincial` VALUES ('22', '四川省', '0');
INSERT INTO `tp_provincial` VALUES ('23', '贵州省', '0');
INSERT INTO `tp_provincial` VALUES ('24', '海南省', '0');
INSERT INTO `tp_provincial` VALUES ('25', '云南省', '0');
INSERT INTO `tp_provincial` VALUES ('26', '青海省', '0');
INSERT INTO `tp_provincial` VALUES ('27', '陕西省', '0');
INSERT INTO `tp_provincial` VALUES ('28', '广西壮族自治区', '0');
INSERT INTO `tp_provincial` VALUES ('29', '西藏自治区', '0');
INSERT INTO `tp_provincial` VALUES ('30', '宁夏回族自治区', '0');
INSERT INTO `tp_provincial` VALUES ('31', '新疆维吾尔自治区', '0');
INSERT INTO `tp_provincial` VALUES ('32', '内蒙古自治区', '0');
INSERT INTO `tp_provincial` VALUES ('33', '澳门特别行政区', '0');
INSERT INTO `tp_provincial` VALUES ('34', '香港特别行政区', '0');

-- ----------------------------
-- Table structure for tp_service
-- ----------------------------
DROP TABLE IF EXISTS `tp_service`;
CREATE TABLE `tp_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` int(11) NOT NULL,
  `info` tinytext NOT NULL,
  `memo` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_service
-- ----------------------------
INSERT INTO `tp_service` VALUES ('40', '20181013018', '张子涵', '1547568000', '已收到香港城市大学offer一封', '查看offer, 请登录邮箱zhangzihan@126.com');
INSERT INTO `tp_service` VALUES ('41', '20181013018', '张子涵', '1547740800', '收到香港大学笔试和面试通知', '查看具体时间和要求，请登录zhangzihan@126.com');
INSERT INTO `tp_service` VALUES ('42', '20181013018', '张子涵', '1551715200', '已收到香港大学offer一封', '查看offer, 请登录邮箱zhangzihan@126.com');
INSERT INTO `tp_service` VALUES ('39', '20181013018', '张子涵', '1547049600', '已受客户委托递交以下申请：香港大学授课型硕士，共1个专业。', '');
INSERT INTO `tp_service` VALUES ('37', '20181013018', '张子涵', '1541088000', '已向客户提交留学文书初稿，收到修改意见', '留学文书终稿确认中');
INSERT INTO `tp_service` VALUES ('38', '20181013018', '张子涵', '1542211200', '已受客户委托递交以下申请：香港中文大学、香港城市大学、香港理工大学授课型硕士，共4个专业。', '');
INSERT INTO `tp_service` VALUES ('35', '20181013018', '张子涵', '1539360000', '成功购买“留学服务”（详见合同）', '请真实填写《信息收集表》并递交给相应文书顾问');
INSERT INTO `tp_service` VALUES ('36', '20181013018', '张子涵', '1539964800', '已收到客户《信息收集表》，开始制作留学文书材料', '文书顾问会在15日内向您递交初稿，征求修改意见');

-- ----------------------------
-- Table structure for tp_signin
-- ----------------------------
DROP TABLE IF EXISTS `tp_signin`;
CREATE TABLE `tp_signin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='签到表';

-- ----------------------------
-- Records of tp_signin
-- ----------------------------
INSERT INTO `tp_signin` VALUES ('5', '4', '1549085512', '0.03');
INSERT INTO `tp_signin` VALUES ('12', '4', '1549271119', '0.02');
INSERT INTO `tp_signin` VALUES ('19', '4', '1549378518', '0.02');
INSERT INTO `tp_signin` VALUES ('20', '4', '1549461569', '0.02');

-- ----------------------------
-- Table structure for tp_system
-- ----------------------------
DROP TABLE IF EXISTS `tp_system`;
CREATE TABLE `tp_system` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL COMMENT '中文名字',
  `ename` varchar(50) NOT NULL COMMENT '英文名字',
  `value` mediumtext NOT NULL COMMENT '值',
  `values` varchar(255) NOT NULL COMMENT '多选值',
  `type` tinyint(1) NOT NULL COMMENT '表单类型,1文本框 2下拉框,3复选框,4开关复选框,5单选框,6文本框,7附件',
  `isdelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `status` tinyint(1) NOT NULL COMMENT '妆台',
  `type_id` tinyint(2) NOT NULL COMMENT '所属模型',
  `time` int(11) NOT NULL COMMENT 'shijian',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of tp_system
-- ----------------------------
INSERT INTO `tp_system` VALUES ('50', '网站名称', 'website_name', 'qixing', '', '1', '0', '1', '3', '1569510607');
INSERT INTO `tp_system` VALUES ('51', 'keywords', 'keywords', '', '', '6', '0', '1', '3', '1569510717');
INSERT INTO `tp_system` VALUES ('52', 'description', 'description', '', '', '6', '0', '1', '3', '1569510725');
INSERT INTO `tp_system` VALUES ('53', 'Copyright', 'Copyright', 'Copyright ©2011-2027 某某网 版权所有<br>   自费出国留学中介服务机构资格认定某某信息技术股份有限公司所有', '', '6', '0', '1', '3', '1569510798');
INSERT INTO `tp_system` VALUES ('54', '二维码', 'erwm', '/uploads/system/20190926\\e9342b389b143632fb83038db47826aa.jpg', '', '7', '0', '1', '3', '1569510825');
INSERT INTO `tp_system` VALUES ('55', '公司图片', 'gsthumb', '', '', '7', '0', '1', '3', '1569594087');
INSERT INTO `tp_system` VALUES ('56', '公司介绍', 'gsdesc', '', '', '6', '0', '1', '3', '1569594102');
INSERT INTO `tp_system` VALUES ('57', '客服链接', 'kflink', '', '', '6', '0', '1', '3', '1569594123');

-- ----------------------------
-- Table structure for tp_system_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_type`;
CREATE TABLE `tp_system_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL COMMENT '类型名字',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` mediumint(9) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统类型';

-- ----------------------------
-- Records of tp_system_type
-- ----------------------------
INSERT INTO `tp_system_type` VALUES ('3', '网站配置', '1', '50');
INSERT INTO `tp_system_type` VALUES ('4', '', '1', '50');

-- ----------------------------
-- Table structure for tp_tag
-- ----------------------------
DROP TABLE IF EXISTS `tp_tag`;
CREATE TABLE `tp_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_tag
-- ----------------------------
INSERT INTO `tp_tag` VALUES ('1', '阳光2', '1');
INSERT INTO `tp_tag` VALUES ('2', '太阳', '1');
INSERT INTO `tp_tag` VALUES ('3', '下雨', '1');
INSERT INTO `tp_tag` VALUES ('4', '阴云', '1');
INSERT INTO `tp_tag` VALUES ('5', '清晨', '1');

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(36) NOT NULL,
  `thumb` varchar(255) DEFAULT '/uploads/default.png',
  `reg_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0',
  `email` varchar(255) DEFAULT NULL,
  `truename` varchar(20) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('4', 'yuanlu', 'e10adc3949ba59abbe56e057f20f883e', '/uploads/cate/20190201\\dbc18e0de8083afc98bfa46df2733acd.jpg', '1548940965', '1', '1549088785@qq.com', '张国荣', '17608428674', '1549088789', '12.52');
INSERT INTO `tp_user` VALUES ('5', 'yuanlus', 'e10adc3949ba59abbe56e057f20f883e', '/uploads/icon_avatar.png', '1548941258', '1', '1549088785@qq.com', null, null, null, '0.00');

-- ----------------------------
-- Table structure for tp_visit_count
-- ----------------------------
DROP TABLE IF EXISTS `tp_visit_count`;
CREATE TABLE `tp_visit_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0',
  `pc` int(11) NOT NULL DEFAULT '0',
  `mobile` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_visit_count
-- ----------------------------
INSERT INTO `tp_visit_count` VALUES ('1', '216', '213', '102', '1548093926');
INSERT INTO `tp_visit_count` VALUES ('2', '600', '300', '300', '1548000000');
INSERT INTO `tp_visit_count` VALUES ('3', '700', '400', '300', '1547913600');
INSERT INTO `tp_visit_count` VALUES ('4', '500', '200', '300', '1547827200');
INSERT INTO `tp_visit_count` VALUES ('5', '900', '800', '100', '1547740800');
INSERT INTO `tp_visit_count` VALUES ('6', '450', '250', '200', '1547654400');
INSERT INTO `tp_visit_count` VALUES ('7', '1200', '1000', '200', '1547568000');
INSERT INTO `tp_visit_count` VALUES ('8', '2', '2', '0', '1548259899');
INSERT INTO `tp_visit_count` VALUES ('9', '1', '1', '0', '1548384884');
INSERT INTO `tp_visit_count` VALUES ('10', '1', '1', '0', '1548433551');
INSERT INTO `tp_visit_count` VALUES ('11', '2', '2', '0', '1548567309');
INSERT INTO `tp_visit_count` VALUES ('12', '3', '3', '0', '1548773845');
INSERT INTO `tp_visit_count` VALUES ('13', '4', '4', '0', '1548788642');
INSERT INTO `tp_visit_count` VALUES ('14', '18', '18', '0', '1549000205');
INSERT INTO `tp_visit_count` VALUES ('15', '30', '30', '0', '1549037517');
INSERT INTO `tp_visit_count` VALUES ('16', '11', '11', '0', '1549249393');
INSERT INTO `tp_visit_count` VALUES ('17', '10', '10', '0', '1549300028');
INSERT INTO `tp_visit_count` VALUES ('18', '17', '17', '0', '1549419734');
INSERT INTO `tp_visit_count` VALUES ('19', '9', '9', '0', '1549469543');
INSERT INTO `tp_visit_count` VALUES ('20', '11', '11', '0', '1549608132');
INSERT INTO `tp_visit_count` VALUES ('21', '4', '4', '0', '1549642681');
INSERT INTO `tp_visit_count` VALUES ('22', '11', '10', '1', '1549802613');
INSERT INTO `tp_visit_count` VALUES ('23', '7', '7', '0', '1549815284');
INSERT INTO `tp_visit_count` VALUES ('24', '2', '2', '0', '1549947010');
INSERT INTO `tp_visit_count` VALUES ('25', '14', '14', '0', '1550049167');
INSERT INTO `tp_visit_count` VALUES ('26', '18', '18', '0', '1550074481');
INSERT INTO `tp_visit_count` VALUES ('27', '1', '1', '0', '1550164493');
INSERT INTO `tp_visit_count` VALUES ('28', '1', '1', '0', '1550423238');
INSERT INTO `tp_visit_count` VALUES ('29', '3', '3', '0', '1550585133');
INSERT INTO `tp_visit_count` VALUES ('30', '1', '1', '0', '1550595887');
INSERT INTO `tp_visit_count` VALUES ('31', '7', '7', '0', '1551345727');
INSERT INTO `tp_visit_count` VALUES ('32', '2', '2', '0', '1551370509');
INSERT INTO `tp_visit_count` VALUES ('33', '1', '1', '0', '1551519366');
INSERT INTO `tp_visit_count` VALUES ('34', '1', '1', '0', '1551599743');
INSERT INTO `tp_visit_count` VALUES ('35', '3', '3', '0', '1551848634');
INSERT INTO `tp_visit_count` VALUES ('36', '16', '5', '11', '1552031427');
INSERT INTO `tp_visit_count` VALUES ('37', '12', '7', '5', '1552382385');
INSERT INTO `tp_visit_count` VALUES ('38', '14', '8', '6', '1552451608');
INSERT INTO `tp_visit_count` VALUES ('39', '5', '2', '3', '1552709275');
INSERT INTO `tp_visit_count` VALUES ('40', '2', '1', '1', '1552830257');
INSERT INTO `tp_visit_count` VALUES ('41', '1', '1', '0', '1553600978');
INSERT INTO `tp_visit_count` VALUES ('42', '2', '2', '0', '1554987848');
INSERT INTO `tp_visit_count` VALUES ('43', '2', '2', '0', '1555326402');
INSERT INTO `tp_visit_count` VALUES ('44', '11', '9', '2', '1555344035');
INSERT INTO `tp_visit_count` VALUES ('45', '49', '38', '11', '1555467203');
INSERT INTO `tp_visit_count` VALUES ('46', '11', '7', '4', '1555548526');
INSERT INTO `tp_visit_count` VALUES ('47', '3', '0', '3', '1555625013');
INSERT INTO `tp_visit_count` VALUES ('48', '7', '1', '6', '1555721769');
INSERT INTO `tp_visit_count` VALUES ('49', '5', '1', '4', '1555792872');
INSERT INTO `tp_visit_count` VALUES ('50', '2', '0', '2', '1555892150');
INSERT INTO `tp_visit_count` VALUES ('51', '1', '1', '0', '1556012394');
INSERT INTO `tp_visit_count` VALUES ('52', '1', '1', '0', '1556073120');
INSERT INTO `tp_visit_count` VALUES ('53', '1', '0', '1', '1556143586');
INSERT INTO `tp_visit_count` VALUES ('54', '3', '3', '0', '1556347976');
INSERT INTO `tp_visit_count` VALUES ('55', '2', '1', '1', '1556397107');
INSERT INTO `tp_visit_count` VALUES ('56', '26', '23', '3', '1556510225');
INSERT INTO `tp_visit_count` VALUES ('57', '1', '0', '1', '1556588448');
INSERT INTO `tp_visit_count` VALUES ('58', '2', '1', '1', '1556691234');
INSERT INTO `tp_visit_count` VALUES ('59', '2', '1', '1', '1556759485');
INSERT INTO `tp_visit_count` VALUES ('60', '1', '1', '0', '1556878579');
INSERT INTO `tp_visit_count` VALUES ('61', '2', '1', '1', '1556938697');
INSERT INTO `tp_visit_count` VALUES ('62', '22', '21', '1', '1557007853');
INSERT INTO `tp_visit_count` VALUES ('63', '4', '2', '2', '1557072061');
INSERT INTO `tp_visit_count` VALUES ('64', '7', '6', '1', '1557190731');
INSERT INTO `tp_visit_count` VALUES ('65', '7', '4', '3', '1557279877');
INSERT INTO `tp_visit_count` VALUES ('66', '4', '3', '1', '1557374148');
INSERT INTO `tp_visit_count` VALUES ('67', '3', '2', '1', '1557458507');
INSERT INTO `tp_visit_count` VALUES ('68', '3', '2', '1', '1557540855');
INSERT INTO `tp_visit_count` VALUES ('69', '2', '1', '1', '1557637553');
INSERT INTO `tp_visit_count` VALUES ('70', '2', '2', '0', '1557796955');
INSERT INTO `tp_visit_count` VALUES ('71', '3', '2', '1', '1557891761');
INSERT INTO `tp_visit_count` VALUES ('72', '2', '2', '0', '1557973771');
INSERT INTO `tp_visit_count` VALUES ('73', '3', '1', '2', '1558097319');
INSERT INTO `tp_visit_count` VALUES ('74', '3', '1', '2', '1558174351');
INSERT INTO `tp_visit_count` VALUES ('75', '6', '5', '1', '1558212274');
INSERT INTO `tp_visit_count` VALUES ('76', '5', '1', '4', '1558308039');
INSERT INTO `tp_visit_count` VALUES ('77', '2', '1', '1', '1558387574');
INSERT INTO `tp_visit_count` VALUES ('78', '2', '2', '0', '1558476856');
INSERT INTO `tp_visit_count` VALUES ('79', '2', '2', '0', '1558562211');
INSERT INTO `tp_visit_count` VALUES ('80', '2', '2', '0', '1558644925');
INSERT INTO `tp_visit_count` VALUES ('81', '2', '2', '0', '1558731944');
INSERT INTO `tp_visit_count` VALUES ('82', '3', '2', '1', '1558817959');
INSERT INTO `tp_visit_count` VALUES ('83', '2', '1', '1', '1558946730');
INSERT INTO `tp_visit_count` VALUES ('84', '1', '1', '0', '1559038913');
INSERT INTO `tp_visit_count` VALUES ('85', '1', '0', '1', '1559130722');
INSERT INTO `tp_visit_count` VALUES ('86', '1', '1', '0', '1559214630');
INSERT INTO `tp_visit_count` VALUES ('87', '23', '12', '11', '1559278015');
INSERT INTO `tp_visit_count` VALUES ('88', '11', '7', '4', '1559327650');
INSERT INTO `tp_visit_count` VALUES ('89', '13', '11', '2', '1559405124');
INSERT INTO `tp_visit_count` VALUES ('90', '20', '18', '2', '1559504876');
INSERT INTO `tp_visit_count` VALUES ('91', '7', '5', '2', '1559591558');
INSERT INTO `tp_visit_count` VALUES ('92', '14', '14', '0', '1559670650');
INSERT INTO `tp_visit_count` VALUES ('93', '8', '8', '0', '1559758325');
INSERT INTO `tp_visit_count` VALUES ('94', '6', '4', '2', '1559849483');
INSERT INTO `tp_visit_count` VALUES ('95', '8', '7', '1', '1559943561');
INSERT INTO `tp_visit_count` VALUES ('96', '7', '5', '2', '1560022823');
INSERT INTO `tp_visit_count` VALUES ('97', '17', '13', '4', '1560108948');
INSERT INTO `tp_visit_count` VALUES ('98', '12', '10', '2', '1560195541');
INSERT INTO `tp_visit_count` VALUES ('99', '10', '9', '1', '1560293172');
INSERT INTO `tp_visit_count` VALUES ('100', '12', '10', '2', '1560391894');
INSERT INTO `tp_visit_count` VALUES ('101', '11', '11', '0', '1560457052');
INSERT INTO `tp_visit_count` VALUES ('102', '7', '5', '2', '1560529732');
INSERT INTO `tp_visit_count` VALUES ('103', '9', '7', '2', '1560628747');
INSERT INTO `tp_visit_count` VALUES ('104', '8', '8', '0', '1560713644');
INSERT INTO `tp_visit_count` VALUES ('105', '12', '11', '1', '1560796430');
INSERT INTO `tp_visit_count` VALUES ('106', '11', '9', '2', '1560907723');
INSERT INTO `tp_visit_count` VALUES ('107', '9', '9', '0', '1560978171');
INSERT INTO `tp_visit_count` VALUES ('108', '8', '6', '2', '1561059288');
INSERT INTO `tp_visit_count` VALUES ('109', '10', '6', '4', '1561159195');
INSERT INTO `tp_visit_count` VALUES ('110', '7', '5', '2', '1561223327');
INSERT INTO `tp_visit_count` VALUES ('111', '65', '57', '8', '1561313266');
INSERT INTO `tp_visit_count` VALUES ('112', '1', '1', '0', '1564584410');
INSERT INTO `tp_visit_count` VALUES ('113', '1', '1', '0', '1569253172');
INSERT INTO `tp_visit_count` VALUES ('114', '13', '12', '1', '1569290080');
INSERT INTO `tp_visit_count` VALUES ('115', '11', '11', '0', '1569371982');
INSERT INTO `tp_visit_count` VALUES ('116', '17', '15', '2', '1569459126');
INSERT INTO `tp_visit_count` VALUES ('117', '10', '10', '0', '1569587101');
INSERT INTO `tp_visit_count` VALUES ('118', '12', '12', '0', '1569638506');

-- ----------------------------
-- Table structure for tp_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_visit_log`;
CREATE TABLE `tp_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `client` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=896 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_visit_log
-- ----------------------------
INSERT INTO `tp_visit_log` VALUES ('7', '127.0.0.1', '1548092913', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('8', '127.0.0.1', '1548092920', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('9', '127.0.0.1', '1548093035', 'Edge', 'pc');
INSERT INTO `tp_visit_log` VALUES ('12', '127.0.0.1', '1548094024', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('13', '127.0.0.1', '1548094105', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('14', '127.0.0.1', '1548094117', 'Edge', 'pc');
INSERT INTO `tp_visit_log` VALUES ('15', '127.0.0.1', '1548095388', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('16', '127.0.0.1', '1548096988', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('17', '127.0.0.1', '1548101735', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('18', '127.0.0.1', '1548101752', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('19', '127.0.0.1', '1548101791', 'Edge', 'pc');
INSERT INTO `tp_visit_log` VALUES ('20', '127.0.0.1', '1548102854', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('21', '127.0.0.1', '1548102874', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('22', '127.0.0.1', '1548106358', 'Edge', 'pc');
INSERT INTO `tp_visit_log` VALUES ('23', '127.0.0.1', '1548108647', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('24', '127.0.0.1', '1548109928', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('25', '127.0.0.1', '1548113986', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('26', '127.0.0.1', '1548122148', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('27', '127.0.0.1', '1548127045', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('28', '127.0.0.1', '1548162419', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('29', '127.0.0.1', '1548164860', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('30', '127.0.0.1', '1548259899', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('31', '127.0.0.1', '1548329889', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('32', '127.0.0.1', '1548384884', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('33', '127.0.0.1', '1548433551', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('34', '127.0.0.1', '1548567309', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('35', '127.0.0.1', '1548599513', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('36', '127.0.0.1', '1548773845', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('37', '127.0.0.1', '1548774823', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('38', '127.0.0.1', '1548775735', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('39', '127.0.0.1', '1548788642', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('40', '127.0.0.1', '1548850327', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('41', '127.0.0.1', '1548853495', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('42', '127.0.0.1', '1548856278', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('43', '127.0.0.1', '1549000205', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('44', '127.0.0.1', '1549012559', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('45', '127.0.0.1', '1549015633', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('46', '127.0.0.1', '1549016620', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('47', '127.0.0.1', '1549018201', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('48', '127.0.0.1', '1549020655', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('49', '127.0.0.1', '1549022724', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('50', '127.0.0.1', '1549023627', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('51', '127.0.0.1', '1549024861', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('52', '127.0.0.1', '1549025790', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('53', '127.0.0.1', '1549026915', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('54', '127.0.0.1', '1549028190', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('55', '127.0.0.1', '1549029183', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('56', '127.0.0.1', '1549030111', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('57', '127.0.0.1', '1549031142', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('58', '127.0.0.1', '1549034550', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('59', '127.0.0.1', '1549035659', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('60', '127.0.0.1', '1549036565', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('61', '127.0.0.1', '1549037517', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('62', '127.0.0.1', '1549038448', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('63', '127.0.0.1', '1549039432', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('64', '127.0.0.1', '1549040395', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('65', '127.0.0.1', '1549041566', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('66', '127.0.0.1', '1549043124', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('67', '127.0.0.1', '1549077368', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('68', '127.0.0.1', '1549080356', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('69', '127.0.0.1', '1549081296', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('70', '127.0.0.1', '1549085320', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('71', '127.0.0.1', '1549086401', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('72', '127.0.0.1', '1549088523', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('73', '127.0.0.1', '1549089526', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('74', '127.0.0.1', '1549090579', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('75', '127.0.0.1', '1549093162', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('76', '127.0.0.1', '1549094642', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('77', '127.0.0.1', '1549095587', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('78', '127.0.0.1', '1549096848', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('79', '127.0.0.1', '1549097748', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('80', '127.0.0.1', '1549099658', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('81', '127.0.0.1', '1549101415', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('82', '127.0.0.1', '1549102324', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('83', '127.0.0.1', '1549109314', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('84', '127.0.0.1', '1549110385', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('85', '127.0.0.1', '1549114789', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('86', '127.0.0.1', '1549118069', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('87', '127.0.0.1', '1549119175', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('88', '127.0.0.1', '1549120324', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('89', '127.0.0.1', '1549121306', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('90', '127.0.0.1', '1549122224', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('91', '127.0.0.1', '1549249393', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('92', '127.0.0.1', '1549250508', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('93', '127.0.0.1', '1549251661', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('94', '127.0.0.1', '1549268770', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('95', '127.0.0.1', '1549269677', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('96', '127.0.0.1', '1549270761', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('97', '127.0.0.1', '1549271877', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('98', '127.0.0.1', '1549273204', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('99', '127.0.0.1', '1549274109', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('100', '127.0.0.1', '1549275464', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('101', '127.0.0.1', '1549276703', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('102', '127.0.0.1', '1549300028', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('103', '127.0.0.1', '1549357855', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('104', '127.0.0.1', '1549359193', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('105', '127.0.0.1', '1549360405', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('106', '127.0.0.1', '1549377186', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('107', '127.0.0.1', '1549378487', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('108', '127.0.0.1', '1549379459', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('109', '127.0.0.1', '1549380399', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('110', '127.0.0.1', '1549381342', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('111', '127.0.0.1', '1549382333', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('112', '127.0.0.1', '1549419734', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('113', '127.0.0.1', '1549420693', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('114', '127.0.0.1', '1549421651', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('115', '127.0.0.1', '1549422752', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('116', '127.0.0.1', '1549423754', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('117', '127.0.0.1', '1549425152', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('118', '127.0.0.1', '1549426099', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('119', '127.0.0.1', '1549428533', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('120', '127.0.0.1', '1549441659', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('121', '127.0.0.1', '1549442900', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('122', '127.0.0.1', '1549443889', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('123', '127.0.0.1', '1549451960', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('124', '127.0.0.1', '1549461530', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('125', '127.0.0.1', '1549462851', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('126', '127.0.0.1', '1549463758', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('127', '127.0.0.1', '1549467621', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('128', '127.0.0.1', '1549468543', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('129', '127.0.0.1', '1549469543', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('130', '127.0.0.1', '1549470566', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('131', '127.0.0.1', '1549526919', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('132', '127.0.0.1', '1549527819', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('133', '127.0.0.1', '1549528779', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('134', '127.0.0.1', '1549530706', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('135', '127.0.0.1', '1549531824', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('136', '127.0.0.1', '1549532731', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('137', '127.0.0.1', '1549533654', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('138', '127.0.0.1', '1549608132', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('139', '127.0.0.1', '1549609228', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('140', '127.0.0.1', '1549610130', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('141', '127.0.0.1', '1549625218', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('142', '127.0.0.1', '1549626200', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('143', '127.0.0.1', '1549628755', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('144', '127.0.0.1', '1549629806', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('145', '127.0.0.1', '1549630726', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('146', '127.0.0.1', '1549631750', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('147', '127.0.0.1', '1549632726', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('148', '127.0.0.1', '1549633809', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('149', '127.0.0.1', '1549642681', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('150', '127.0.0.1', '1549644225', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('151', '127.0.0.1', '1549645199', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('152', '127.0.0.1', '1549646107', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('153', '127.0.0.1', '1549802613', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('154', '127.0.0.1', '1549802674', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('155', '127.0.0.1', '1549804642', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('156', '127.0.0.1', '1549805572', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('157', '127.0.0.1', '1549806577', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('158', '127.0.0.1', '1549807540', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('159', '127.0.0.1', '1549810523', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('160', '127.0.0.1', '1549811466', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('161', '127.0.0.1', '1549812367', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('162', '127.0.0.1', '1549813329', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('163', '127.0.0.1', '1549814303', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('164', '127.0.0.1', '1549815284', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('165', '127.0.0.1', '1549816230', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('166', '127.0.0.1', '1549817130', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('167', '127.0.0.1', '1549858692', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('168', '127.0.0.1', '1549859661', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('169', '127.0.0.1', '1549860603', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('170', '127.0.0.1', '1549861936', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('171', '127.0.0.1', '1549947010', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('172', '127.0.0.1', '1549948368', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('173', '127.0.0.1', '1550049167', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('174', '127.0.0.1', '1550050986', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('175', '127.0.0.1', '1550053903', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('176', '127.0.0.1', '1550055027', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('177', '127.0.0.1', '1550056458', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('178', '127.0.0.1', '1550057450', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('179', '127.0.0.1', '1550058543', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('180', '127.0.0.1', '1550067804', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('181', '127.0.0.1', '1550068783', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('182', '127.0.0.1', '1550069775', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('183', '127.0.0.1', '1550070675', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('184', '127.0.0.1', '1550071605', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('185', '127.0.0.1', '1550072564', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('186', '127.0.0.1', '1550073511', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('187', '127.0.0.1', '1550074481', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('188', '127.0.0.1', '1550075602', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('189', '127.0.0.1', '1550076564', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('190', '127.0.0.1', '1550077701', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('191', '127.0.0.1', '1550078607', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('192', '127.0.0.1', '1550079520', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('193', '127.0.0.1', '1550081097', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('194', '127.0.0.1', '1550082045', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('195', '127.0.0.1', '1550083474', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('196', '127.0.0.1', '1550085133', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('197', '127.0.0.1', '1550086048', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('198', '127.0.0.1', '1550086951', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('199', '127.0.0.1', '1550115495', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('200', '127.0.0.1', '1550140107', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('201', '127.0.0.1', '1550141034', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('202', '127.0.0.1', '1550143736', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('203', '127.0.0.1', '1550144699', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('204', '127.0.0.1', '1550149726', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('205', '127.0.0.1', '1550164493', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('206', '127.0.0.1', '1550423238', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('207', '127.0.0.1', '1550585133', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('208', '127.0.0.1', '1550586928', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('209', '127.0.0.1', '1550588599', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('210', '127.0.0.1', '1550595887', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('211', '127.0.0.1', '1551345727', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('212', '127.0.0.1', '1551347612', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('213', '127.0.0.1', '1551362718', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('214', '127.0.0.1', '1551364928', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('215', '127.0.0.1', '1551366741', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('216', '127.0.0.1', '1551368106', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('217', '127.0.0.1', '1551369165', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('218', '127.0.0.1', '1551370509', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('219', '127.0.0.1', '1551371604', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('220', '127.0.0.1', '1551519366', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('221', '127.0.0.1', '1551599743', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('222', '127.0.0.1', '1551848634', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('223', '127.0.0.1', '1551877986', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('224', '127.0.0.1', '1551881854', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('225', '127.0.0.1', '1552031427', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('226', '127.0.0.1', '1552032327', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('227', '127.0.0.1', '1552032978', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('228', '127.0.0.1', '1552034111', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('229', '127.0.0.1', '1552035875', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('230', '127.0.0.1', '1552037559', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('231', '127.0.0.1', '1552039357', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('232', '127.0.0.1', '1552040630', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('233', '127.0.0.1', '1552051336', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('234', '127.0.0.1', '1552051443', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('235', '127.0.0.1', '1552052395', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('236', '127.0.0.1', '1552052966', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('237', '127.0.0.1', '1552053741', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('238', '127.0.0.1', '1552054262', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('239', '127.0.0.1', '1552054722', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('240', '127.0.0.1', '1552056260', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('241', '127.0.0.1', '1552382385', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('242', '127.0.0.1', '1552383174', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('243', '127.0.0.1', '1552383339', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('244', '127.0.0.1', '1552384166', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('245', '127.0.0.1', '1552384388', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('246', '127.0.0.1', '1552385090', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('247', '127.0.0.1', '1552385366', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('248', '127.0.0.1', '1552386000', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('249', '127.0.0.1', '1552393757', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('250', '127.0.0.1', '1552393785', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('251', '127.0.0.1', '1552401005', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('252', '127.0.0.1', '1552403723', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('253', '127.0.0.1', '1552451608', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('254', '127.0.0.1', '1552452548', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('255', '127.0.0.1', '1552453476', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('256', '127.0.0.1', '1552453601', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('257', '127.0.0.1', '1552454462', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('258', '127.0.0.1', '1552455094', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('259', '127.0.0.1', '1552459199', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('260', '127.0.0.1', '1552459209', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('261', '127.0.0.1', '1552461336', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('262', '127.0.0.1', '1552462237', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('263', '127.0.0.1', '1552463183', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('264', '127.0.0.1', '1552463417', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('265', '127.0.0.1', '1552464437', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('266', '127.0.0.1', '1552479557', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('267', '127.0.0.1', '1552709275', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('268', '127.0.0.1', '1552709289', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('269', '127.0.0.1', '1552710374', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('270', '127.0.0.1', '1552711636', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('271', '127.0.0.1', '1552711716', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('272', '127.0.0.1', '1552830257', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('273', '127.0.0.1', '1552830272', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('274', '127.0.0.1', '1553600978', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('275', '127.0.0.1', '1554987848', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('276', '127.0.0.1', '1554996348', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('277', '127.0.0.1', '1555326402', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('278', '127.0.0.1', '1555330895', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('279', '127.0.0.1', '1555344035', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('280', '127.0.0.1', '1555344518', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('281', '127.0.0.1', '1555345030', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('282', '127.0.0.1', '1555345973', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('283', '127.0.0.1', '1555346341', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('284', '127.0.0.1', '1555349475', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('285', '127.0.0.1', '1555419813', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('286', '127.0.0.1', '1555420720', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('287', '127.0.0.1', '1555421636', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('288', '127.0.0.1', '1555423138', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('289', '127.0.0.1', '1555424078', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('290', '101.75.206.60', '1555467203', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('291', '101.75.206.60', '1555468133', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('292', '101.75.206.60', '1555469100', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('293', '101.89.239.232', '1555469467', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('294', '61.129.8.179', '1555469535', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('295', '58.247.206.139', '1555469540', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('296', '61.129.6.174', '1555469541', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('297', '180.97.118.223', '1555469542', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('298', '101.75.206.60', '1555470367', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('299', '101.89.239.120', '1555470705', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('300', '101.75.206.60', '1555471505', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('301', '101.75.206.60', '1555472584', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('302', '101.75.206.60', '1555473695', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('303', '101.75.206.60', '1555474621', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('304', '58.246.221.163', '1555474965', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('305', '101.75.206.60', '1555475023', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('306', '101.75.206.60', '1555475645', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('307', '101.75.206.60', '1555476564', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('308', '101.75.206.60', '1555477401', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('309', '101.75.206.60', '1555478201', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('310', '119.250.149.253', '1555485916', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('311', '119.250.149.253', '1555487490', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('312', '119.250.149.253', '1555492503', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('313', '101.91.60.11', '1555492657', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('314', '183.199.55.100', '1555502380', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('315', '101.227.139.172', '1555502456', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('316', '61.151.178.177', '1555502472', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('317', '180.97.118.223', '1555502598', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('318', '61.151.178.163', '1555502626', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('319', '101.89.239.216', '1555502730', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('320', '183.199.55.100', '1555503340', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('321', '183.199.55.100', '1555504269', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('322', '183.199.55.100', '1555504706', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('323', '183.199.55.100', '1555504811', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('324', '58.247.206.154', '1555505170', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('325', '183.199.55.100', '1555505188', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('326', '183.199.55.100', '1555505594', 'Edge', 'pc');
INSERT INTO `tp_visit_log` VALUES ('327', '61.151.179.84', '1555505900', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('328', '101.91.60.107', '1555505902', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('329', '101.89.29.86', '1555505904', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('330', '183.199.55.100', '1555505956', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('331', '183.199.55.100', '1555506116', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('332', '60.26.106.25', '1555506529', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('333', '60.26.106.25', '1555506704', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('334', '183.199.55.100', '1555507471', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('335', '183.199.55.100', '1555507512', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('336', '60.26.106.25', '1555508005', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('337', '60.26.68.30', '1555508298', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('338', '183.199.55.100', '1555510063', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('339', '119.250.149.253', '1555548526', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('340', '106.14.204.78', '1555549972', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('341', '119.250.149.253', '1555550792', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('342', '119.250.149.253', '1555551247', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('343', '119.250.149.253', '1555554302', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('344', '119.250.149.253', '1555555533', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('345', '117.136.47.185', '1555556424', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('346', '119.250.149.253', '1555558448', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('347', '119.250.149.253', '1555562475', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('348', '119.250.149.253', '1555563631', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('349', '183.199.55.100', '1555584997', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('350', '47.100.51.203', '1555625013', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('351', '117.136.47.138', '1555660693', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('352', '117.136.47.151', '1555671229', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('353', '117.132.183.17', '1555721769', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('354', '47.92.101.29', '1555727837', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('355', '124.64.17.1', '1555732783', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('356', '101.132.182.68', '1555741094', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('357', '101.132.131.7', '1555742989', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('358', '47.100.38.232', '1555745122', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('359', '47.92.120.136', '1555745804', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('360', '47.101.200.199', '1555792872', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('361', '106.15.201.111', '1555805750', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('362', '39.107.116.226', '1555810622', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('363', '101.132.107.246', '1555813359', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('364', '183.199.55.100', '1555815356', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('365', '47.92.35.138', '1555892150', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('366', '47.97.120.5', '1555913739', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('367', '47.103.55.137', '1556012394', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('368', '119.250.150.197', '1556073120', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('369', '47.100.51.108', '1556143586', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('370', '119.250.150.197', '1556347976', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('371', '119.250.150.197', '1556349013', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('372', '119.250.150.197', '1556355432', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('373', '101.132.78.143', '1556397107', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('374', '106.14.189.11', '1556408815', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('375', '117.9.99.10', '1556510225', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('376', '117.9.99.10', '1556510462', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('377', '101.75.207.133', '1556511136', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('378', '117.9.99.10', '1556511527', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('379', '117.136.47.177', '1556511562', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('380', '101.75.207.133', '1556512562', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('381', '117.9.99.10', '1556512801', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('382', '101.75.207.133', '1556514171', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('383', '117.9.99.10', '1556514229', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('384', '101.91.62.65', '1556514424', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('385', '117.9.99.10', '1556515230', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('386', '117.9.99.10', '1556518306', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('387', '101.75.207.133', '1556518816', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('388', '183.199.55.204', '1556539935', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('389', '180.97.118.223', '1556540623', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('390', '101.91.60.105', '1556540627', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('391', '101.89.19.197', '1556540679', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('392', '61.129.6.203', '1556540681', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('393', '183.199.55.204', '1556540976', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('394', '110.52.217.239', '1556541155', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('395', '183.199.55.204', '1556542333', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('396', '110.52.217.239', '1556542627', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('397', '183.199.55.204', '1556543253', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('398', '110.52.217.239', '1556543533', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('399', '183.199.55.204', '1556546352', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('400', '183.199.55.204', '1556548298', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('401', '101.132.156.172', '1556588448', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('402', '117.9.99.10', '1556691234', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('403', '183.199.55.204', '1556706220', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('404', '101.132.78.143', '1556759485', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('405', '47.98.96.116', '1556789362', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('406', '183.199.55.76', '1556878579', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('407', '139.224.15.159', '1556938697', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('408', '183.199.55.76', '1556976045', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('409', '47.98.97.252', '1557007853', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('410', '27.189.35.242', '1557047261', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('411', '27.189.35.242', '1557048589', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('412', '183.199.55.76', '1557051158', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('413', '183.199.55.76', '1557054278', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('414', '61.151.178.174', '1557054338', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('415', '183.199.55.76', '1557055471', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('416', '183.199.55.76', '1557056493', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('417', '183.199.55.76', '1557058153', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('418', '60.26.79.159', '1557059433', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('419', '183.199.55.76', '1557059448', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('420', '60.26.79.159', '1557060747', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('421', '183.199.55.76', '1557061089', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('422', '60.26.79.159', '1557061706', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('423', '183.199.55.76', '1557062290', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('424', '183.199.55.76', '1557065121', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('425', '110.52.194.76', '1557066280', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('426', '183.199.55.76', '1557067174', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('427', '101.226.226.221', '1557067317', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('428', '101.91.60.107', '1557067380', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('429', '110.52.194.76', '1557067632', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('430', '183.199.55.76', '1557068217', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('431', '39.100.69.215', '1557072061', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('432', '27.189.35.242', '1557104365', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('433', '106.15.186.63', '1557107601', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('434', '27.189.35.242', '1557133692', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('435', '27.189.35.242', '1557190731', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('436', '47.100.104.184', '1557192891', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('437', '183.199.55.76', '1557229652', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('438', '60.26.79.159', '1557239251', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('439', '183.199.55.76', '1557239662', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('440', '58.247.206.143', '1557239723', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('441', '110.52.194.76', '1557240877', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('442', '27.189.42.80', '1557279877', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('443', '223.72.52.182', '1557281206', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('444', '27.189.42.80', '1557281215', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('445', '27.189.42.80', '1557282806', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('446', '47.98.96.116', '1557284218', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('447', '183.199.55.76', '1557314137', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('448', '183.199.55.76', '1557329325', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('449', '47.92.50.96', '1557374148', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('450', '183.199.55.233', '1557414034', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('451', '183.199.55.233', '1557415428', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('452', '61.151.178.166', '1557415488', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('453', '47.92.103.177', '1557458506', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('454', '183.199.55.233', '1557494388', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('455', '183.199.55.233', '1557498001', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('456', '47.100.57.133', '1557540855', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('457', '183.199.55.233', '1557575835', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('458', '183.199.55.233', '1557576774', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('459', '101.132.126.80', '1557637553', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('460', '183.199.55.233', '1557654570', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('461', '27.189.39.95', '1557796955', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('462', '183.199.55.233', '1557844014', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('463', '101.132.107.246', '1557891761', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('464', '47.100.7.25', '1557894546', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('465', '183.199.55.233', '1557919022', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('466', '27.189.39.95', '1557973771', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('467', '183.199.55.71', '1558009711', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('468', '183.199.55.71', '1558097319', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('469', '101.132.144.145', '1558099849', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('470', '47.97.192.46', '1558100024', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('471', '183.199.55.71', '1558174351', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('472', '47.92.99.247', '1558183963', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('473', '101.132.193.68', '1558184018', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('474', '222.188.216.106', '1558212274', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('475', '122.247.157.228', '1558212281', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('476', '122.247.158.233', '1558212290', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('477', '222.137.31.214', '1558212303', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('478', '101.132.156.172', '1558234478', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('479', '183.199.55.71', '1558262003', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('480', '47.100.1.70', '1558308039', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('481', '106.12.99.73', '1558314850', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('482', '182.61.32.9', '1558335374', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('483', '183.199.55.71', '1558356042', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('484', '106.12.119.175', '1558358763', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('485', '183.136.190.62', '1558387574', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('486', '101.132.193.68', '1558446761', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('487', '183.136.190.62', '1558476856', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('488', '183.136.190.62', '1558512720', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('489', '183.136.190.62', '1558562211', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('490', '183.199.55.57', '1558616679', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('491', '183.136.190.62', '1558644925', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('492', '183.199.55.57', '1558696619', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('493', '183.136.190.40', '1558731944', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('494', '183.199.55.57', '1558779706', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('495', '183.136.190.40', '1558817959', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('496', '183.199.55.57', '1558851635', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('497', '47.100.38.9', '1558884254', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('498', '47.98.62.203', '1558946730', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('499', '183.199.55.57', '1558956930', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('500', '183.199.55.57', '1559038913', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('501', '47.92.75.171', '1559130721', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('502', '183.199.55.57', '1559214630', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('503', '27.189.39.27', '1559278015', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('504', '117.12.154.50', '1559278983', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('505', '27.189.39.27', '1559278989', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('506', '61.151.178.165', '1559279047', '微信浏览器', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('507', '101.89.239.230', '1559279055', '微信浏览器', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('508', '101.89.29.86', '1559279059', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('509', '210.12.31.250', '1559280999', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('510', '210.12.31.250', '1559281302', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('511', '223.71.40.74', '1559284413', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('512', '171.13.14.50', '1559284601', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('513', '117.12.154.50', '1559284703', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('514', '117.12.154.50', '1559285671', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('515', '116.236.146.21', '1559288535', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('516', '120.52.147.43', '1559303427', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('517', '65.154.226.109', '1559303447', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('518', '65.154.226.126', '1559303710', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('519', '183.199.55.57', '1559313808', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('520', '220.194.106.93', '1559313823', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('521', '111.30.142.78', '1559313823', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('522', '220.194.106.94', '1559313834', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('523', '220.194.107.222', '1559313837', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('524', '61.151.178.177', '1559313882', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('525', '101.91.62.99', '1559313894', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('526', '181.214.63.2', '1559327650', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('527', '47.98.97.81', '1559337959', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('528', '139.224.116.230', '1559338457', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('529', '101.132.131.7', '1559339230', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('530', '101.132.156.172', '1559339811', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('531', '123.126.113.249', '1559357819', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('532', '111.193.193.119', '1559375176', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('533', '120.25.208.128', '1559379775', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('534', '47.92.124.187', '1559397118', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('535', '101.132.188.111', '1559397509', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('536', '101.132.107.246', '1559402838', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('537', '47.97.220.124', '1559405124', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('538', '104.238.248.15', '1559406787', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('539', '117.25.139.88', '1559408002', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('540', '139.224.11.233', '1559432195', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('541', '47.92.29.149', '1559432399', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('542', '34.217.215.45', '1559438284', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('543', '123.126.113.249', '1559444917', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('544', '112.124.202.139', '1559446850', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('545', '113.45.42.69', '1559453631', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('546', '47.92.39.202', '1559455197', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('547', '47.100.51.108', '1559455414', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('548', '111.193.193.119', '1559456951', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('549', '112.124.202.139', '1559461261', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('550', '47.100.104.184', '1559504876', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('551', '47.92.95.89', '1559505220', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('552', '175.42.43.113', '1559514170', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('553', '120.76.96.186', '1559517836', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('554', '116.236.146.21', '1559521893', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('555', '116.236.146.22', '1559525068', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('556', '210.12.31.250', '1559526345', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('557', '223.71.40.74', '1559527211', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('558', '180.163.220.5', '1559527318', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('559', '116.236.146.21', '1559528960', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('560', '123.126.113.249', '1559532037', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('561', '60.26.101.172', '1559532946', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('562', '118.186.3.48', '1559533043', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('563', '118.186.3.48', '1559533044', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('564', '223.71.40.74', '1559543965', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('565', '223.71.40.74', '1559548164', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('566', '210.12.31.250', '1559550403', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('567', '47.97.215.92', '1559575567', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('568', '101.85.21.89', '1559575936', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('569', '139.224.238.50', '1559575959', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('570', '101.132.97.53', '1559591558', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('571', '47.92.116.44', '1559591738', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('572', '116.62.215.53', '1559605510', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('573', '47.92.102.179', '1559605635', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('574', '116.236.146.22', '1559619540', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('575', '123.126.113.249', '1559624527', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('576', '123.168.89.161', '1559654495', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('577', '91.227.68.74', '1559670650', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('578', '106.15.201.111', '1559677009', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('579', '106.15.176.145', '1559677333', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('580', '159.69.74.243', '1559684159', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('581', '120.25.208.128', '1559688445', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('582', '210.12.31.250', '1559697994', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('583', '101.91.60.108', '1559700122', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('584', '223.71.40.74', '1559700246', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('585', '120.25.208.128', '1559700278', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('586', '14.215.176.147', '1559700554', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('587', '27.189.38.117', '1559703657', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('588', '123.117.78.218', '1559714229', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('589', '118.186.3.48', '1559717392', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('590', '123.126.113.249', '1559718746', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('591', '117.45.252.89', '1559758325', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('592', '47.98.62.203', '1559762874', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('593', '47.92.35.138', '1559762995', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('594', '223.71.40.74', '1559787008', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('595', '60.178.154.170', '1559800078', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('596', '111.207.165.253', '1559811297', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('597', '111.207.165.253', '1559811298', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('598', '123.126.113.249', '1559818279', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('599', '47.100.53.146', '1559849483', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('600', '101.132.182.68', '1559850032', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('601', '202.108.211.151', '1559852824', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('602', '47.100.51.203', '1559859288', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('603', '47.100.1.70', '1559859643', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('604', '13.48.85.6', '1559867123', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('605', '106.15.191.180', '1559943561', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('606', '139.224.238.50', '1559944488', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('607', '54.213.86.186', '1559953396', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('608', '101.132.126.80', '1559957320', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('609', '111.193.200.211', '1559982447', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('610', '42.236.10.75', '1559982456', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('611', '120.76.54.183', '1559998357', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('612', '120.76.54.183', '1559998357', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('613', '120.76.54.183', '1559998357', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('614', '120.76.54.183', '1559998357', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('615', '120.25.208.128', '1559999374', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('616', '101.132.100.6', '1560022823', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('617', '106.14.115.254', '1560023133', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('618', '206.180.165.147', '1560024726', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('619', '120.77.213.254', '1560039375', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('620', '54.184.226.53', '1560039434', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('621', '47.92.99.247', '1560040797', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('622', '115.35.212.83', '1560067253', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('623', '101.132.102.45', '1560108948', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('624', '40.77.167.90', '1560109245', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('625', '47.92.141.208', '1560109547', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('626', '106.14.189.11', '1560110402', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('627', '47.97.167.161', '1560111007', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('628', '46.101.80.192', '1560115774', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('629', '47.97.167.161', '1560134794', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('630', '139.224.116.230', '1560135041', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('631', '47.101.185.36', '1560138863', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('632', '115.231.98.28', '1560143305', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('633', '47.101.203.232', '1560145051', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('634', '118.186.3.48', '1560148999', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('635', '118.186.3.48', '1560155092', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('636', '111.204.138.18', '1560158176', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('637', '117.9.105.166', '1560164347', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('638', '42.236.10.114', '1560164352', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('639', '180.163.220.5', '1560164530', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('640', '47.92.140.160', '1560195541', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('641', '106.14.168.238', '1560195681', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('642', '116.236.146.21', '1560236712', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('643', '47.101.197.246', '1560236722', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('644', '101.132.97.6', '1560237848', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('645', '47.97.215.92', '1560238224', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('646', '54.92.171.193', '1560242860', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('647', '117.15.212.87', '1560249429', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('648', '111.197.241.162', '1560261793', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('649', '117.9.105.166', '1560261821', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('650', '42.236.10.117', '1560262039', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('651', '42.236.10.78', '1560262147', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('652', '120.25.208.128', '1560293172', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('653', '123.207.174.188', '1560300899', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('654', '123.207.174.188', '1560305159', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('655', '112.64.119.5', '1560309333', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('656', '106.14.115.254', '1560310501', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('657', '101.132.100.6', '1560311043', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('658', '47.110.159.36', '1560330816', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('659', '173.252.95.43', '1560331877', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('660', '39.107.126.72', '1560335107', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('661', '112.124.202.139', '1560341996', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('662', '47.100.38.232', '1560391894', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('663', '47.100.51.108', '1560392016', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('664', '123.207.174.188', '1560394324', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('665', '116.62.215.53', '1560395860', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('666', '39.107.116.226', '1560395974', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('667', '212.33.255.53', '1560400240', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('668', '210.12.31.250', '1560409476', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('669', '112.64.68.125', '1560425424', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('670', '212.33.255.53', '1560433496', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('671', '111.161.189.191', '1560435361', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('672', '180.163.220.5', '1560436017', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('673', '42.236.10.75', '1560436038', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('674', '202.108.211.151', '1560457052', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('675', '65.155.30.101', '1560458760', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('676', '47.100.1.70', '1560460129', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('677', '47.98.96.116', '1560460549', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('678', '65.155.30.101', '1560462861', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('679', '123.207.174.188', '1560474690', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('680', '34.211.115.77', '1560481941', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('681', '38.100.53.84', '1560493301', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('682', '70.42.131.189', '1560493364', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('683', '65.154.226.126', '1560493854', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('684', '123.59.209.112', '1560512170', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('685', '101.132.182.68', '1560529732', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('686', '47.92.74.243', '1560529920', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('687', '47.97.167.161', '1560543281', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('688', '47.92.125.35', '1560543763', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('689', '114.248.237.71', '1560571266', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('690', '111.161.190.252', '1560583127', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('691', '120.25.208.128', '1560613694', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('692', '47.98.34.250', '1560628747', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('693', '39.107.126.72', '1560629128', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('694', '47.98.34.250', '1560629927', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('695', '47.92.50.96', '1560630306', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('696', '65.155.30.101', '1560656852', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('697', '113.45.86.196', '1560660053', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('698', '113.44.44.52', '1560675744', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('699', '113.45.113.210', '1560681548', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('700', '180.163.220.66', '1560681551', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('701', '106.14.190.222', '1560713644', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('702', '47.97.216.82', '1560714138', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('703', '123.120.84.8', '1560742476', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('704', '54.202.229.201', '1560744524', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('705', '223.71.40.74', '1560759369', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('706', '61.50.116.90', '1560763335', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('707', '116.236.146.22', '1560763648', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('708', '180.163.220.3', '1560763974', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('709', '47.93.54.131', '1560796430', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('710', '47.98.97.252', '1560799398', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('711', '47.100.1.70', '1560799544', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('712', '47.103.103.170', '1560809065', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('713', '54.218.127.20', '1560816178', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('714', '61.50.116.90', '1560840824', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('715', '180.163.220.3', '1560840834', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('716', '47.103.59.143', '1560845434', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('717', '191.101.85.114', '1560847680', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('718', '116.236.146.21', '1560848995', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('719', '116.236.146.21', '1560853954', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('720', '116.236.146.21', '1560860185', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('721', '47.92.110.185', '1560907723', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('722', '18.237.151.159', '1560908243', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('723', '39.107.127.149', '1560908335', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('724', '171.211.69.11', '1560910820', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('725', '120.76.41.9', '1560914425', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('726', '47.92.102.179', '1560915054', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('727', '47.92.148.120', '1560915243', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('728', '218.94.117.234', '1560919256', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('729', '116.236.146.22', '1560942627', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('730', '64.246.165.200', '1560945625', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('731', '157.41.241.207', '1560951692', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('732', '121.29.80.4', '1560978171', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('733', '34.211.99.130', '1560989050', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('734', '111.196.242.172', '1560994278', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('735', '116.236.146.21', '1560998046', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('736', '69.58.178.56', '1560998277', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('737', '116.236.146.21', '1560999749', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('738', '117.63.112.63', '1561005916', 'IE', 'pc');
INSERT INTO `tp_visit_log` VALUES ('739', '111.198.18.138', '1561011928', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('740', '120.52.147.48', '1561016195', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('741', '202.108.211.151', '1561059288', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('742', '35.162.60.24', '1561081779', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('743', '47.100.38.9', '1561090050', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('744', '47.100.38.232', '1561090460', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('745', '47.97.215.92', '1561093389', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('746', '47.100.38.9', '1561093478', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('747', '120.52.147.48', '1561111564', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('748', '120.52.147.40', '1561111874', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('749', '101.132.188.111', '1561159195', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('750', '47.92.125.35', '1561159279', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('751', '47.98.34.250', '1561160369', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('752', '47.100.1.70', '1561161026', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('753', '47.98.97.81', '1561161246', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('754', '47.101.192.18', '1561161371', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('755', '47.101.199.215', '1561161627', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('756', '47.97.192.46', '1561162385', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('757', '35.166.153.215', '1561169022', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('758', '54.188.129.1', '1561195101', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('759', '123.126.113.249', '1561223327', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('760', '47.92.140.160', '1561235750', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('761', '47.98.96.116', '1561236655', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('762', '106.14.114.244', '1561236671', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('763', '47.101.202.86', '1561237775', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('764', '101.132.102.45', '1561238430', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('765', '34.217.21.202', '1561253867', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('766', '40.77.167.172', '1561313266', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('767', '47.100.51.108', '1561319920', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('768', '101.132.156.172', '1561320626', '其它', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('769', '39.107.121.196', '1561325094', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('770', '106.15.201.111', '1561325351', 'Firefox', 'pc');
INSERT INTO `tp_visit_log` VALUES ('771', '18.231.143.180', '1561326077', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('772', '35.164.128.161', '1561336138', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('773', '79.191.142.242', '1561346928', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('774', '111.172.8.16', '1561347204', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('775', '125.37.113.58', '1561351427', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('776', '60.26.82.95', '1561351536', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('777', '27.189.40.45', '1561351740', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('778', '101.91.60.110', '1561352456', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('779', '125.37.113.58', '1561352575', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('780', '60.26.82.95', '1561352616', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('781', '27.189.40.45', '1561353412', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('782', '60.26.82.95', '1561353592', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('783', '113.246.174.229', '1561353819', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('784', '113.246.174.229', '1561353977', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('785', '125.37.113.58', '1561354449', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('786', '27.189.40.45', '1561354483', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('787', '60.26.82.95', '1561354525', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('788', '113.246.174.229', '1561355223', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('789', '60.26.82.95', '1561355438', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('790', '125.37.113.58', '1561355478', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('791', '27.189.40.45', '1561355615', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('792', '180.163.220.3', '1561355786', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('793', '60.26.82.95', '1561357060', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('794', '60.26.82.95', '1561357964', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('795', '125.37.113.58', '1561358885', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('796', '120.52.147.43', '1561359315', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('797', '125.37.113.58', '1561359786', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('798', '60.26.82.95', '1561360726', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('799', '125.37.113.58', '1561360736', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('800', '27.189.40.45', '1561360950', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('801', '125.37.113.58', '1561361649', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('802', '27.189.40.45', '1561361966', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('803', '125.37.113.58', '1561363147', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('804', '27.189.40.45', '1561363297', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('805', '60.26.82.95', '1561363347', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('806', '125.37.113.58', '1561364128', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('807', '61.151.178.174', '1561364352', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('808', '27.189.40.45', '1561364819', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('809', '60.26.82.95', '1561364951', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('810', '125.37.113.58', '1561365093', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('811', '60.26.82.95', '1561366002', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('812', '60.26.82.95', '1561366095', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('813', '27.189.40.45', '1561366107', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('814', '125.37.113.58', '1561366266', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('815', '125.37.113.58', '1561367230', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('816', '117.50.113.2', '1561367242', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('817', '27.189.40.45', '1561368404', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('818', '125.37.113.58', '1561368414', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('819', '60.26.82.95', '1561368587', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('820', '27.189.40.45', '1561369010', 'Chrome', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('821', '125.37.113.58', '1561369456', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('822', '121.10.143.92', '1561369913', '其它', 'pc');
INSERT INTO `tp_visit_log` VALUES ('823', '183.199.55.141', '1561371100', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('824', '125.37.113.58', '1561371398', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('825', '125.37.114.215', '1561371692', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('826', '127.0.0.1', '1561381471', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('827', '127.0.0.1', '1561382644', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('828', '127.0.0.1', '1561386062', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('829', '127.0.0.1', '1561387418', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('830', '127.0.0.1', '1561387561', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('831', '127.0.0.1', '1564584410', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('832', '127.0.0.1', '1569253172', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('833', '127.0.0.1', '1569290080', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('834', '127.0.0.1', '1569296056', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('835', '127.0.0.1', '1569296957', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('836', '127.0.0.1', '1569307576', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('837', '127.0.0.1', '1569309500', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('838', '127.0.0.1', '1569311934', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('839', '127.0.0.1', '1569312503', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('840', '127.0.0.1', '1569312895', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('841', '127.0.0.1', '1569313847', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('842', '127.0.0.1', '1569315156', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('843', '127.0.0.1', '1569316225', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('844', '127.0.0.1', '1569317152', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('845', '127.0.0.1', '1569318197', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('846', '127.0.0.1', '1569371982', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('847', '127.0.0.1', '1569372950', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('848', '127.0.0.1', '1569373971', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('849', '127.0.0.1', '1569375224', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('850', '127.0.0.1', '1569376170', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('851', '127.0.0.1', '1569377866', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('852', '127.0.0.1', '1569378849', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('853', '127.0.0.1', '1569391014', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('854', '127.0.0.1', '1569396837', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('855', '127.0.0.1', '1569402398', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('856', '127.0.0.1', '1569404568', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('857', '127.0.0.1', '1569459126', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('858', '127.0.0.1', '1569482478', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('859', '127.0.0.1', '1569483439', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('860', '127.0.0.1', '1569485283', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('861', '127.0.0.1', '1569486323', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('862', '127.0.0.1', '1569487239', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('863', '127.0.0.1', '1569488172', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('864', '127.0.0.1', '1569489885', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('865', '127.0.0.1', '1569499759', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('866', '127.0.0.1', '1569499896', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('867', '127.0.0.1', '1569500925', 'Firefox', 'mobile');
INSERT INTO `tp_visit_log` VALUES ('868', '127.0.0.1', '1569500938', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('869', '127.0.0.1', '1569504628', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('870', '127.0.0.1', '1569505878', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('871', '127.0.0.1', '1569508433', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('872', '127.0.0.1', '1569509367', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('873', '127.0.0.1', '1569510328', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('874', '127.0.0.1', '1569587101', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('875', '127.0.0.1', '1569588027', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('876', '127.0.0.1', '1569588935', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('877', '127.0.0.1', '1569589860', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('878', '127.0.0.1', '1569591157', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('879', '127.0.0.1', '1569592188', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('880', '127.0.0.1', '1569593696', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('881', '127.0.0.1', '1569594723', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('882', '127.0.0.1', '1569595684', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('883', '127.0.0.1', '1569596905', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('884', '127.0.0.1', '1569638506', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('885', '127.0.0.1', '1569639805', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('886', '127.0.0.1', '1569641007', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('887', '127.0.0.1', '1569641912', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('888', '127.0.0.1', '1569642813', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('889', '127.0.0.1', '1569650837', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('890', '127.0.0.1', '1569655155', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('891', '127.0.0.1', '1569656093', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('892', '127.0.0.1', '1569657012', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('893', '127.0.0.1', '1569657921', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('894', '127.0.0.1', '1569658828', 'Chrome', 'pc');
INSERT INTO `tp_visit_log` VALUES ('895', '127.0.0.1', '1569660652', 'Chrome', 'pc');

-- ----------------------------
-- Table structure for tp_w_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_w_group`;
CREATE TABLE `tp_w_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '行业id',
  `cid` int(11) NOT NULL COMMENT '城市id',
  `title` varchar(80) NOT NULL COMMENT '微信群名称',
  `weixin` varchar(255) NOT NULL COMMENT '微信群主号',
  `thumb` varchar(255) NOT NULL COMMENT '微信群头像',
  `thumb2` varchar(255) NOT NULL COMMENT '微信群二维码',
  `thumb3` varchar(255) NOT NULL COMMENT '群主二维码',
  `keyboard` varchar(120) DEFAULT NULL COMMENT '标签',
  `smalltext` mediumtext COMMENT '帐号介绍',
  `contact` varchar(10) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(13) DEFAULT NULL COMMENT '联系QQ',
  `add_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `click` int(11) DEFAULT '0',
  `look` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`pid`,`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='微信群';

-- ----------------------------
-- Records of tp_w_group
-- ----------------------------
INSERT INTO `tp_w_group` VALUES ('1', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100326', '1', '3', '64', '0');
INSERT INTO `tp_w_group` VALUES ('2', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100423', '1', '3', '43', '1');
INSERT INTO `tp_w_group` VALUES ('3', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270873', '1', '1', '34', '0');
INSERT INTO `tp_w_group` VALUES ('4', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270912', '1', '53', '5', '1');
INSERT INTO `tp_w_group` VALUES ('5', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100326', '1', '3', '64', '0');
INSERT INTO `tp_w_group` VALUES ('6', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100423', '1', '2', '43', '1');
INSERT INTO `tp_w_group` VALUES ('7', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270873', '1', '1', '34', '0');
INSERT INTO `tp_w_group` VALUES ('8', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270912', '1', '52', '3', '1');
INSERT INTO `tp_w_group` VALUES ('9', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100326', '1', '3', '64', '0');
INSERT INTO `tp_w_group` VALUES ('10', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100423', '1', '2', '43', '1');
INSERT INTO `tp_w_group` VALUES ('11', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270873', '1', '1', '34', '0');
INSERT INTO `tp_w_group` VALUES ('12', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270912', '1', '52', '2', '1');
INSERT INTO `tp_w_group` VALUES ('13', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100326', '1', '3', '64', '0');
INSERT INTO `tp_w_group` VALUES ('14', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100423', '1', '2', '43', '1');
INSERT INTO `tp_w_group` VALUES ('15', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270873', '1', '1', '34', '0');
INSERT INTO `tp_w_group` VALUES ('16', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270912', '1', '52', '2', '1');
INSERT INTO `tp_w_group` VALUES ('17', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100326', '1', '3', '64', '0');
INSERT INTO `tp_w_group` VALUES ('18', '106', '138', '聚众赌博是不可以的', 'zhangguorong', 'uploads/page/20190202/154910002590877.png!350.jpg', 'uploads/page/20190202/154910003664602.png!350.jpg', 'uploads/page/20190202/154910003856485.png!350.jpg', '远路,赌博', '不要赌博，要遵纪守法 做一个好公民 明白？', '张国荣', '17608428674', '', '1549100423', '1', '2', '43', '1');
INSERT INTO `tp_w_group` VALUES ('19', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270873', '1', '1', '34', '0');
INSERT INTO `tp_w_group` VALUES ('20', '116', '210', '我是来自远方的一个大哥', 'yuanfandedage', 'uploads/page/20190204/154927081117743.png!350.jpg', 'uploads/page/20190204/154927081455476.png!350.jpg', 'uploads/page/20190204/154927081633593.png!350.jpg', '大哥，远方', '我就是远方的大哥 你是小弟', '大哥', '17608428674', '134651231', '1549270912', '1', '52', '2', '1');

-- ----------------------------
-- Table structure for tp_w_personal
-- ----------------------------
DROP TABLE IF EXISTS `tp_w_personal`;
CREATE TABLE `tp_w_personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1微信号2公众号',
  `pid` int(11) NOT NULL COMMENT '行业id',
  `cid` int(11) NOT NULL COMMENT '城市id',
  `title` varchar(80) NOT NULL COMMENT '微信群名称',
  `weixin` varchar(255) NOT NULL COMMENT '微信群主号',
  `thumb` varchar(255) NOT NULL COMMENT '微信群头像',
  `thumb2` varchar(255) NOT NULL COMMENT '微信群二维码',
  `keyboard` varchar(120) DEFAULT NULL COMMENT '标签',
  `smalltext` mediumtext COMMENT '帐号介绍',
  `contact` varchar(10) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(13) DEFAULT NULL COMMENT '联系QQ',
  `add_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `look` int(11) NOT NULL DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`pid`,`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='微信号';

-- ----------------------------
-- Records of tp_w_personal
-- ----------------------------
INSERT INTO `tp_w_personal` VALUES ('1', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '4', '1', '0');
INSERT INTO `tp_w_personal` VALUES ('2', '1', '271', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '1', '1', '0');
INSERT INTO `tp_w_personal` VALUES ('3', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '3', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('4', '1', '271', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('5', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('6', '1', '271', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('7', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('8', '1', '271', '34', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('9', '1', '271', '34', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('10', '1', '271', '34', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('11', '1', '271', '34', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '12', '0');
INSERT INTO `tp_w_personal` VALUES ('12', '1', '271', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '12', '0');
INSERT INTO `tp_w_personal` VALUES ('13', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '20', '12', '0');
INSERT INTO `tp_w_personal` VALUES ('14', '1', '271', '90', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '20', '12', '0');
INSERT INTO `tp_w_personal` VALUES ('15', '1', '271', '90', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '20', '12', '0');
INSERT INTO `tp_w_personal` VALUES ('16', '1', '271', '90', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '20', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('17', '1', '271', '90', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '20', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('18', '1', '271', '90', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '20', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('19', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '20', '52', '1');
INSERT INTO `tp_w_personal` VALUES ('20', '1', '271', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '29', '53', '1');
INSERT INTO `tp_w_personal` VALUES ('21', '1', '271', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '1', '52', '1');
INSERT INTO `tp_w_personal` VALUES ('22', '1', '271', '3', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '8', '52', '1');
INSERT INTO `tp_w_personal` VALUES ('23', '1', '271', '3', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '52', '0');
INSERT INTO `tp_w_personal` VALUES ('24', '1', '271', '3', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '52', '0');
INSERT INTO `tp_w_personal` VALUES ('25', '1', '271', '3', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '4', '52', '0');
INSERT INTO `tp_w_personal` VALUES ('26', '1', '271', '1', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '3', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('27', '1', '271', '1', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '3', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('28', '1', '271', '1', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '3', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('29', '2', '183', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '20', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('30', '2', '183', '1', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '20', '52', '1');
INSERT INTO `tp_w_personal` VALUES ('31', '2', '183', '1', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '7', '53', '1');
INSERT INTO `tp_w_personal` VALUES ('32', '2', '183', '1', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '52', '1');
INSERT INTO `tp_w_personal` VALUES ('33', '2', '183', '1', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '2', '52', '1');
INSERT INTO `tp_w_personal` VALUES ('34', '2', '183', '1', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '0', '52', '0');
INSERT INTO `tp_w_personal` VALUES ('35', '2', '183', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '0', '52', '0');
INSERT INTO `tp_w_personal` VALUES ('36', '2', '183', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '3', '52', '0');
INSERT INTO `tp_w_personal` VALUES ('37', '2', '183', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '3', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('38', '2', '183', '0', 'yuanlu', 'yuanludeni', 'uploads/page/20190202/154911878463658.png!350.jpg', 'uploads/page/20190202/154911878723312.png!350.jpg', '个人，娱乐', '你好这是远路的微信账号 赶快加上特别的我吧', '远路', '17608428674', '123131653', '1549118831', '1', '5', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('39', '2', '183', '0', 'DAMING', 'damingshi', 'uploads/page/20190202/154911956221411.png!350.jpg', 'uploads/page/20190202/154911956439431.png!350.jpg', '牛逼，厉害', '非常不错的一款产品 包治百病 一颗见效', '刘德华', '17608428699', '13215633', '1549119693', '1', '7', '0', '0');
INSERT INTO `tp_w_personal` VALUES ('40', '2', '196', '0', '拆红包', 'chaihongbao', 'uploads/page/20190208/154960975580080.png!350.jpg', 'uploads/page/20190208/154960977668573.png!350.jpg', '拆红包', '拆红包拆红包拆红包拆红包拆红包拆红包', '拆红包', '17608428674', '651513', '1549609827', '1', '12', '1', '1');
INSERT INTO `tp_w_personal` VALUES ('41', '1', '278', '161', '哪里买卖微信号-出售实名交易记录微信老号-微信小号低价批发', 'sdasadasd', 'uploads/page/20190208/154962570238384.png!350.jpg', 'uploads/page/20190208/154962571215603.png!350.jpg', '半年活跃功效', '【微号供应商QQ：257-476-105】全网低价出售微信号-我们的每个微信号都是精心开发而出、每个微信号出售后都有售后、请放心使用！\r\n\r\n\r\n微信手工小号： 自养15天全新小号，满50个起算批发价15元/个 \r\n微信满月白号： 注册满1个月，带朋友圈时间记录 ，批发价30元/个 \r\n国外满月白号： 满3个月另算，带朋友圈时间记录 ，批发价25元/个 \r\n微信半年老号： 半年活跃功效，带朋友圈时间记录，批发价58元/个 \r\n微信一年老号： 1', '哪里买卖微信号', '17608428674', '6231561', '1549625747', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for tp_w_product
-- ----------------------------
DROP TABLE IF EXISTS `tp_w_product`;
CREATE TABLE `tp_w_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '行业id',
  `cid` int(11) NOT NULL COMMENT '城市id',
  `title` varchar(80) NOT NULL COMMENT '货源名称',
  `weixin` varchar(255) NOT NULL COMMENT '微信群主号',
  `thumb` varchar(255) NOT NULL COMMENT '货源封面',
  `thumb2` varchar(255) NOT NULL COMMENT '微信二维码',
  `maidian` varchar(255) DEFAULT NULL COMMENT '货源卖点',
  `smalltext` text COMMENT '货源描述',
  `contact` varchar(10) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(13) DEFAULT NULL COMMENT '联系QQ',
  `add_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0未审核1通过-1不通过',
  `top` tinyint(4) NOT NULL DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  `look` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`pid`,`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='微信货源';

-- ----------------------------
-- Records of tp_w_product
-- ----------------------------
INSERT INTO `tp_w_product` VALUES ('1', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('2', '148', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('3', '148', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('4', '148', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('5', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('6', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('7', '149', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '1', '6');
INSERT INTO `tp_w_product` VALUES ('8', '149', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('9', '149', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('10', '149', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '1');
INSERT INTO `tp_w_product` VALUES ('11', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('12', '150', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('13', '150', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('14', '150', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('15', '150', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '1', '0');
INSERT INTO `tp_w_product` VALUES ('16', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '2');
INSERT INTO `tp_w_product` VALUES ('17', '152', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('18', '152', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('19', '152', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '1');
INSERT INTO `tp_w_product` VALUES ('20', '152', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('21', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('22', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('23', '153', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('24', '153', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('25', '153', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('26', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '0');
INSERT INTO `tp_w_product` VALUES ('27', '151', '0', '益正堂老苗八卦磁疗贴', '15964055960', 'uploads/page/20190202/154911923516468.png!350.jpg', 'uploads/page/20190202/154911923853284.png!350.jpg', '益正堂老苗八卦磁疗贴膏药 \r\n没有任何风险不吃药不手术不针灸', '<p>老苗八卦磁疗贴的优势</p><p>&nbsp;</p><p>安全无副作用：因为它是58味名贵纯中草药熬制而成。</p><p>药量足：含药量50％，在业界顶尖了。</p><p>吸收快：太极磁疗贴</p><p>快速缓解疼痛：含有2000毫磁的永磁片，结合人体自身生物磁场产生生物磁场，快速渗透皮肤，直达病源。</p><p>太极八卦调节人体阴阳平衡，帮助人体达到气血通畅，增强体质，更有利于药物吸收。</p><p>药效持久：24小时~48小时</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">活血散瘀：含有远红粉，打通血液中的瘀堵，使血液畅通无阻老苗八卦磁疗贴适用：颈椎病、肩周炎、风湿痛、网球肘、滑膜炎、骨刺、鼻炎、落枕、关节炎、骨质疏松、腰肌劳损、坐骨神经痛、跌打损伤、腰间盘突出、痛风、月经痛、风湿关节炎、半月板损伤、骨头坏死、静脉曲张调理、肾亏气虚、强制性脊柱炎、乳腺增生，</p><p><br/></p>', '无', '15964055960', '15964055960', '1549119471', '1', '0', '0', '7');
INSERT INTO `tp_w_product` VALUES ('28', '163', '0', ' 微信扫一扫，添加关注  护肤品---敏感肌修复套装', 'meiyuouxiexie', 'uploads/page/20190207/154953207788509.png!350.jpg', 'uploads/page/20190207/154953129198285.png!350.jpg', '1.大量真实案例 \r\n2.产品经过备案、检测合格 \r\n3.配方技术先进，超越去年爆品同款', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">&nbsp;一、无风险无库存：指的是产品质量放心，效果显著，无需进货，平台统一发货，后台自动核算；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">二、无压力躺赚，在这里是不可能的！虽然我们有操盘过千万业绩品牌的运营总监带领大家，但努力回报才高；</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">三、发朋友圈卖货，你能卖多少?我们首先需要自己改变思维，市场不是盲目得来的。公司专业化妆品配方师教你变得专业，超越别人，成就自己。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">四、你只需要学习、学习、不断学习，链接10个超级用户，月收入轻松超过3000元；如果链接20个呢?具体怎么做?我们帮你开发就是！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">欢迎做过化妆品相关行业、有志于在竞争激烈的化妆品市场走出自己一条生路的热血小伙伴加入我们！人不在多，只在精！盲目加我微信的、加入发广告的、没有恒心创业的、不愿意学习的都请勿扰！</p><p><span class=\"fl\" style=\"float: left; display: inline;\">上一篇：<a href=\"http://www.jinnianduoda.com/product/97.html\" title=\"益正堂老苗八卦磁疗贴\" style=\"text-decoration-line: none; color: rgb(51, 51, 51);\">益正堂老苗八卦磁疗贴</a></span></p><p><br/></p>', '刘德华', '17608428695', '12316513213', '1549532142', '1', '0', '0', '1');
