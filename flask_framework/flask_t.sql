/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : flask_t

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 05/03/2020 20:34:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('4904aba2f210');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `category1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `comment_num` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `click_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'Financial', 'Technology', 'Alberto Savoia Can Teach You About Interior', '/static/img/blog-3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', '2020-02-01 12:40:57', 21, 1, 1);
INSERT INTO `article` VALUES (2, 'Technology', 'Technology', 'Diversity in Engineering: Effect on Questions', '/static/img/blog-2.jpg', 'The brave and the wise can both pity and excuse,when cowards and fools shew no mercy,Reputation is often got without merit and lost without fault.', '2020-02-02 12:45:01', 18, 1, 1);
INSERT INTO `article` VALUES (3, 'Business', 'Technology', 'Ways to remember your important ideas', '/static/img/blog-1.jpg', 'A lie begets a lie till they come to generations,Think twice before acting.', '2020-02-03 12:47:17', 10, 1, 2);
INSERT INTO `article` VALUES (4, 'Business', 'Technology', 'Alberto Savoia Can Teach You About Interior', '/static/img/featured-pic-3.jpeg', 'A good fame is better than a good face,Great hope makes great man.', '2020-03-01 12:48:57', 8, 1, 2);
INSERT INTO `article` VALUES (5, 'Business', 'Technology', 'Gossiping and lying go together', '/static/img/featured-pic-2.jpeg', 'Calamity and prisperity are the touchstones of integrity,A false tongue will hardly speak truth.', '2020-03-02 12:51:37', 5, 1, 3);
INSERT INTO `article` VALUES (6, 'Business', 'Technology', 'Lost time is never found again', '/static/img/featured-pic-1.jpeg', 'If thou injurest conscience,it will have its revenge on thee,Though malice may darken truth,it cannot put it out.', '2020-03-02 13:54:27', 4, 1, 3);
INSERT INTO `article` VALUES (7, 'Business', 'Technology', 'Alberto Savoia Can Teach You About', '/static/img/blog-post-1.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', '2016-05-20 00:00:00', 12, 1, 500);
INSERT INTO `article` VALUES (8, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-2.jpg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2016-03-10 00:00:00', 10, 2, 300);
INSERT INTO `article` VALUES (9, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-3.jpeg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2015-04-10 00:00:00', 39, 1, 220);
INSERT INTO `article` VALUES (10, 'Business', 'Technology', 'The True Story of AH Q', '/static/img/blog-post-4.jpeg', 'Lu Xun was a well-Known Chinese writer,he was not only a writer,a thinker,and translator,but also a founder of modern Chinese literature.His novels have been put many languages and some of novels have been made films,such as The True Story of AH Q and The New Year\'s Sacrifice which expose sharply the old society.The late Chairman Mao spoke highly of him.Some of his novels have been collected in high school and college textbooks.Since you are learning Chinese literature,I think reading Lu Xun\'s novels will benefit a lot.', '2017-04-20 00:00:00', 58, 2, 110);
INSERT INTO `article` VALUES (11, 'Business', 'Technology', 'Nobody looks down on you because everybody is too busy to look at you.', '/static/upload\\4-2020-03-05-11-44-42.jpeg', 'If we can only encounter each other rather than stay with each other, then I wish we had never encountered.Thoroughly understanding the world but not sophisticated is the maturest kindness.', '2020-03-05 11:44:42', 0, 4, 0);
INSERT INTO `article` VALUES (12, 'Business', 'Technology', 'Lost time is never found again', '/static/img/featured-pic-1.jpeg', 'If thou injurest conscience,it will have its revenge on thee,Though malice may darken truth,it cannot put it out.', '2020-03-02 13:54:27', 4, 1, 3);
INSERT INTO `article` VALUES (13, 'Business', 'Technology', 'Lost time is never found again', '/static/img/featured-pic-1.jpeg', 'If thou injurest conscience,it will have its revenge on thee,Though malice may darken truth,it cannot put it out.', '2020-03-02 13:54:27', 4, 1, 3);
INSERT INTO `article` VALUES (14, 'Business', 'Technology', 'Gossiping and lying go together', '/static/img/featured-pic-2.jpeg', 'Calamity and prisperity are the touchstones of integrity,A false tongue will hardly speak truth.', '2020-03-02 12:51:37', 5, 1, 3);
INSERT INTO `article` VALUES (15, 'Business', 'Technology', 'Lost time is never found again', '/static/img/featured-pic-1.jpeg', 'If thou injurest conscience,it will have its revenge on thee,Though malice may darken truth,it cannot put it out.', '2020-03-02 13:54:27', 4, 1, 3);
INSERT INTO `article` VALUES (16, 'Business', 'Technology', 'Alberto Savoia Can Teach You About', '/static/img/blog-post-1.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', '2016-05-20 00:00:00', 12, 1, 500);
INSERT INTO `article` VALUES (17, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-2.jpg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2016-03-10 00:00:00', 10, 2, 300);
INSERT INTO `article` VALUES (18, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-3.jpeg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2015-04-10 00:00:00', 39, 1, 220);
INSERT INTO `article` VALUES (19, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-3.jpeg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2015-04-10 00:00:00', 39, 1, 220);
INSERT INTO `article` VALUES (20, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-3.jpeg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2015-04-10 00:00:00', 39, 1, 220);
INSERT INTO `article` VALUES (21, 'Business', 'Technology', 'The New Year\'s Sacrifice', '/static/img/blog-post-3.jpeg', 'I was very glad to receive your letter on the tenth of February.You ask me something about Lu Xun and his works since you began to study Chinese literature.Now let me tell you something about him.', '2015-04-10 00:00:00', 39, 1, 220);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quote_num` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Business', 5, '2019-09-02 21:20:57');
INSERT INTO `category` VALUES (2, 'Technology', 7, '2019-12-04 21:21:26');
INSERT INTO `category` VALUES (3, 'Financial', 2, '2019-11-14 21:22:04');
INSERT INTO `category` VALUES (4, 'Growth', 12, '2019-12-10 21:22:58');
INSERT INTO `category` VALUES (5, 'Local', 25, '2019-12-11 21:23:21');
INSERT INTO `category` VALUES (6, 'Sales', 8, '2019-11-05 21:23:39');
INSERT INTO `category` VALUES (7, 'Tips', 17, '2019-11-06 21:24:05');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `bid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', '2019-12-21 23:08:38', 1, 1);
INSERT INTO `reply` VALUES (2, 'Life isn’t always beautiful, but the struggles make you stronger, the changes make you wiser.', '2020-02-12 23:09:01', 2, 1);
INSERT INTO `reply` VALUES (3, 'No matter how tough the life is, you will eventually find someone who’d make you willing to stay with.', '2020-02-05 23:11:04', 1, 1);
INSERT INTO `reply` VALUES (4, 'Things will come to you as it is planned for you. The firmer you grip, the easier you lose. We’ve tried and cherished, we have a clear conscience. Let the fate take care of the rest.', '2020-02-12 23:11:31', 1, 1);
INSERT INTO `reply` VALUES (5, 'When someone walk out your life, let them. They are just making more room for someone else better to walk in.', '2020-03-05 10:12:48', 1, 1);
INSERT INTO `reply` VALUES (6, 'Have you paid the rental for residing in my heart?', '2020-03-05 11:56:32', 4, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'WUHAO', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1);
INSERT INTO `user` VALUES (2, 'ZHANGSAN', '111111', 1);
INSERT INTO `user` VALUES (3, 'HAO', '121', 1);
INSERT INTO `user` VALUES (4, 'WU', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1);

SET FOREIGN_KEY_CHECKS = 1;
