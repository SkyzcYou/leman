/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : leman

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2021-02-06 19:50:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'admin', 'admin');
INSERT INTO `admin` VALUES ('4', 'CMCC', 'admin');

-- ----------------------------
-- Table structure for anime
-- ----------------------------
DROP TABLE IF EXISTS `anime`;
CREATE TABLE `anime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tip` varchar(255) NOT NULL COMMENT '动漫总集数',
  `pimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`tip`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of anime
-- ----------------------------
INSERT INTO `anime` VALUES ('3', '斗罗大陆', '《斗罗大陆》是唐家三少创作的穿越玄幻小说', '9cf01f91-e7eb-4c2c-acf8-86031a12c4100.jpg');
INSERT INTO `anime` VALUES ('4', '狐妖小红娘', '万物有界，爱恨无由', '3f09091a-dc82-4c53-865f-b542fc0e18fcc1.jpg');
INSERT INTO `anime` VALUES ('5', '唯我独神', '手掌吞灵 逆袭而上', 'a2f5b4c3-07a5-455e-ba5a-7b8b50602abdc2.jpg');
INSERT INTO `anime` VALUES ('6', '雪鹰领主', '踏风归来 扫荡昔日仇敌！', '7846ef45-9e37-45aa-82aa-528ca6a73e88c3.jpg');
INSERT INTO `anime` VALUES ('7', '灵剑尊', '天地三界，我为至尊！', '8632e296-c03c-4daa-8c81-7e17f2e7eb56c4.jpg');
INSERT INTO `anime` VALUES ('8', '万界法神', '末法时代，法神重生', '8aec225a-20d5-4f06-81ed-9cf07b35c46ac5.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `episode_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '20200101', '1', '123123', '2019-12-16 00:14:55');
INSERT INTO `comment` VALUES ('2', '20200101', '1', '哈哈哈真好看呀', '2019-12-16 05:07:22');
INSERT INTO `comment` VALUES ('3', '20200101', '1', '3556', '2019-12-16 01:43:34');
INSERT INTO `comment` VALUES ('4', '124', '1234', 'rqwerq', '2019-12-16 04:54:44');
INSERT INTO `comment` VALUES ('5', '8', '10', '哈哈哈真好看呀', '2019-12-16 06:40:15');
INSERT INTO `comment` VALUES ('6', '8', '1', '不错不错 henNice', '2021-01-24 17:28:47');

-- ----------------------------
-- Table structure for episode
-- ----------------------------
DROP TABLE IF EXISTS `episode`;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `indexx` int(11) unsigned zerofill NOT NULL COMMENT '该视频在剧集的集数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20200112 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of episode
-- ----------------------------
INSERT INTO `episode` VALUES ('8', '2', '斗破苍穹', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=m0022eyxv9v\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('9', '234', '星辰变', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=m002777wq26\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('13', '1234', '魔道祖师', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=m0022eyxv9v\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('14', '123123', '猪屁登', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=x0032ipwf4f\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('15', '12312', '枪神记', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=r00255csceo\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200101', '3', '斗罗大陆', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=m00253deqqo\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200102', '3', '斗罗大陆', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=h0025x3mn7z\" allowFullScreen=\"true\"></iframe>', '00000000002');
INSERT INTO `episode` VALUES ('20200103', '3', '斗罗大陆', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=h00251u5sdp\" allowFullScreen=\"true\"></iframe>', '00000000003');
INSERT INTO `episode` VALUES ('20200104', '3', '斗罗大陆', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=m0025m9timl\" allowFullScreen=\"true\"></iframe>', '00000000004');
INSERT INTO `episode` VALUES ('20200105', '3', '斗罗大陆', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=h0025iluh3s\" allowFullScreen=\"true\"></iframe>', '00000000005');
INSERT INTO `episode` VALUES ('20200106', '4', '狐妖小红娘', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=f0157y2e83y\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200107', '6', '雪鹰领主', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=z00294mly5y\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200108', '5', '唯我独神', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=s0035snmjl6\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200109', '7', '灵剑尊', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=u00296p6t50\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200110', '8', '万界法神', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=p0035fk2bu2\" allowFullScreen=\"true\"></iframe>', '00000000001');
INSERT INTO `episode` VALUES ('20200111', '2323', '西行记', '<iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=d0027mif1kk\" allowFullScreen=\"true\"></iframe>', '00000000001');

-- ----------------------------
-- Table structure for home_carousel
-- ----------------------------
DROP TABLE IF EXISTS `home_carousel`;
CREATE TABLE `home_carousel` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `anime_id` int(10) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of home_carousel
-- ----------------------------
INSERT INTO `home_carousel` VALUES ('1', '4');
INSERT INTO `home_carousel` VALUES ('2', '5');
INSERT INTO `home_carousel` VALUES ('3', '6');
INSERT INTO `home_carousel` VALUES ('4', '7');
INSERT INTO `home_carousel` VALUES ('5', '8');

-- ----------------------------
-- Table structure for home_episode
-- ----------------------------
DROP TABLE IF EXISTS `home_episode`;
CREATE TABLE `home_episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `episode_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_episode
-- ----------------------------
INSERT INTO `home_episode` VALUES ('1', '20200101');
INSERT INTO `home_episode` VALUES ('2', '8');
INSERT INTO `home_episode` VALUES ('3', '9');
INSERT INTO `home_episode` VALUES ('4', '14');
INSERT INTO `home_episode` VALUES ('5', '20200111');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345@qq.com', '123456', '梦言', '男');
INSERT INTO `user` VALUES ('2', 'zhangxiaohua@qq.com', '123456', 'zhangxiaohua@qq.com', '未填写');
INSERT INTO `user` VALUES ('3', 'zhangxiaohua123@qq.com', '123456', 'zhangxiaohua123@qq.com', '未填写');
INSERT INTO `user` VALUES ('4', 'zhangxiaohua12356@qq.com', '123456', 'zhangxiaohua12356@qq.com', '未填写');
INSERT INTO `user` VALUES ('5', '1404725@qq.com', '12345', '1404725@qq.com', '未填写');
INSERT INTO `user` VALUES ('6', 'mengyanyzc333@qq.com', '123456', 'mengyanyzc333@qq.com', '未填写');
INSERT INTO `user` VALUES ('7', 'mengyanyzc99@qq.com', '123', 'mengyanyzc99@qq.com', '未填写');
INSERT INTO `user` VALUES ('8', 'mengyanyzcxx@qq.com', '123456xx', '测试员', '男');
INSERT INTO `user` VALUES ('9', 'mengyanyzc1223@qq.com', 'edf8', 'SkyzcYou', '女');
INSERT INTO `user` VALUES ('10', '1231234@qq.com', '123123', 'SkyzcYou', '女');
INSERT INTO `user` VALUES ('11', 'mengyanyzc88765@qq.com', 'edf8', 'SkyzcYou', '女');
INSERT INTO `user` VALUES ('12', '123zc@qq.com', '123', '123', '女');
