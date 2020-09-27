/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : libms

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-09-27 13:49:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_parent_for` (`parent_id`),
  KEY `comment_document_for` (`document_id`),
  CONSTRAINT `comment_document_for` FOREIGN KEY (`document_id`) REFERENCES `tb_document` (`document_id`),
  CONSTRAINT `comment_parent_for` FOREIGN KEY (`parent_id`) REFERENCES `tb_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_document
-- ----------------------------
DROP TABLE IF EXISTS `tb_document`;
CREATE TABLE `tb_document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `first_picture` varchar(500) DEFAULT NULL,
  `flag` varchar(10) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `appreciate` int(11) DEFAULT NULL,
  `comment_able` int(11) DEFAULT NULL,
  `share_info` int(11) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  KEY `document_type_for` (`type_id`),
  KEY `document_user_for` (`user_id`),
  CONSTRAINT `document_type_for` FOREIGN KEY (`type_id`) REFERENCES `tb_type` (`type_id`),
  CONSTRAINT `document_user_for` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_document
-- ----------------------------
INSERT INTO `tb_document` VALUES ('42', '玩忽职守的特朗普', '玩忽职守的特朗普', 'test', '1', '0', '1', '1', '1', '1', '2020-09-27 13:36:57', '1', '2020-09-27 13:39:59', '4', '1');

-- ----------------------------
-- Table structure for tb_document_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_tag`;
CREATE TABLE `tb_document_tag` (
  `document_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`document_id`,`tag_id`),
  KEY `document_tag_tag_for` (`tag_id`),
  CONSTRAINT `document_tag_document_for` FOREIGN KEY (`document_id`) REFERENCES `tb_document` (`document_id`),
  CONSTRAINT `document_tag_tag_for` FOREIGN KEY (`tag_id`) REFERENCES `tb_tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_document_tag
-- ----------------------------
INSERT INTO `tb_document_tag` VALUES ('42', '2');

-- ----------------------------
-- Table structure for tb_file
-- ----------------------------
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE `tb_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(500) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_origin_name` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `user_for` (`user_id`),
  KEY `doc_for` (`document_id`),
  CONSTRAINT `doc_for` FOREIGN KEY (`document_id`) REFERENCES `tb_document` (`document_id`),
  CONSTRAINT `user_for` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_file
-- ----------------------------
INSERT INTO `tb_file` VALUES ('19', 'admin.rar', '\\admin\\玩忽职守的特朗普\\20200927133958', '医疗知识图谱.rar', '1', '42', '2020-09-27 13:39:59', '2020-09-27 13:39:59');

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES ('2', 'technonlogy');
INSERT INTO `tb_tag` VALUES ('3', 'text');

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_type
-- ----------------------------
INSERT INTO `tb_type` VALUES ('1', 'java');
INSERT INTO `tb_type` VALUES ('2', 'python');
INSERT INTO `tb_type` VALUES ('4', '宁熙桐');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '宁小木同', 'admin', '202cb962ac59075b964b07152d234b70', '51992239', ' ', '1', '2020-09-19 20:13:44', '2020-09-19 20:13:46');
INSERT INTO `tb_user` VALUES ('2', 'nxtabb', 'S319067067', 'c1c164190407146124e51bcb4b81e0d7', '519923938@qq.com', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=692442730,856156816&fm=26&gp=0.jpg', '1', '2020-09-26 14:55:56', '2020-09-26 14:55:56');
