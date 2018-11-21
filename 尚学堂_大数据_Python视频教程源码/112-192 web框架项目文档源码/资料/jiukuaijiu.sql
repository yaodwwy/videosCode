/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : jiukuaijiu

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-11-10 11:04:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add category', '7', 'add_category');
INSERT INTO `auth_permission` VALUES ('20', 'Can change category', '7', 'change_category');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete category', '7', 'delete_category');
INSERT INTO `auth_permission` VALUES ('22', 'Can add size', '8', 'add_size');
INSERT INTO `auth_permission` VALUES ('23', 'Can change size', '8', 'change_size');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete size', '8', 'delete_size');
INSERT INTO `auth_permission` VALUES ('25', 'Can add store', '9', 'add_store');
INSERT INTO `auth_permission` VALUES ('26', 'Can change store', '9', 'change_store');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete store', '9', 'delete_store');
INSERT INTO `auth_permission` VALUES ('28', 'Can add goods', '10', 'add_goods');
INSERT INTO `auth_permission` VALUES ('29', 'Can change goods', '10', 'change_goods');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete goods', '10', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('31', 'Can add color', '11', 'add_color');
INSERT INTO `auth_permission` VALUES ('32', 'Can change color', '11', 'change_color');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete color', '11', 'delete_color');
INSERT INTO `auth_permission` VALUES ('34', 'Can add goods details', '12', 'add_goodsdetails');
INSERT INTO `auth_permission` VALUES ('35', 'Can change goods details', '12', 'change_goodsdetails');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete goods details', '12', 'delete_goodsdetails');
INSERT INTO `auth_permission` VALUES ('37', 'Can add user', '13', 'add_user');
INSERT INTO `auth_permission` VALUES ('38', 'Can change user', '13', 'change_user');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete user', '13', 'delete_user');
INSERT INTO `auth_permission` VALUES ('40', 'Can add order', '14', 'add_order');
INSERT INTO `auth_permission` VALUES ('41', 'Can change order', '14', 'change_order');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete order', '14', 'delete_order');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$36000$L3kFMH9dP223$dA9ywZv71VzW+Aj42KfVvSpkOqGkargfk1+CiYMmI0M=', '2017-11-09 06:24:13', '1', 'admin', '', '', '', '1', '1', '2017-09-26 06:50:17');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-09-26 06:50:45', '1', '男装', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-09-26 06:50:48', '2', '女装', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-09-26 06:50:51', '3', '鞋子', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-09-26 06:50:55', '4', '箱包', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-09-26 06:50:59', '5', '母婴', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-09-26 06:51:03', '6', '美妆', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-09-26 06:51:18', '7', '居家', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-09-26 06:51:21', '8', '家纺', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-09-26 06:51:25', '9', '文体', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-09-26 06:51:33', '10', '美食', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-09-26 06:51:37', '11', '数码', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-09-26 06:51:42', '12', '电器', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-09-26 06:51:47', '13', '内衣', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-09-26 06:51:53', '14', '装饰', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-09-26 06:53:37', '1', '1:秋冬小脚弹力裤', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-09-26 07:51:05', '1', 'GoodsDetails object', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-09-26 08:07:43', '1', 'GoodsDetails object', '2', '[{\"changed\": {\"fields\": [\"value\"]}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-09-26 08:09:00', '1', '1:秋冬小脚弹力裤', '3', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-09-26 08:57:07', '3', '黑色', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-09-26 08:57:17', '3', '黑色', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2017-09-26 09:05:18', '9', '黑色', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2017-09-26 09:05:26', '9', '黑色', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2017-09-26 09:07:44', '11', 'heise', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2017-09-26 09:24:43', '1', 'XM', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2017-09-26 09:38:13', '11', 'heise', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2017-09-26 09:38:28', '1', 'XM', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2017-09-26 09:39:03', '15', '黑色', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2017-09-26 09:39:24', '2', 'asd', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2017-09-26 09:39:54', '15', '黑色', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2017-09-26 09:40:08', '2', 'asd', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2017-09-26 09:44:07', '3', 'sadasd', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2017-09-26 09:48:20', '20', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2017-09-26 09:48:45', '20', '(黑色)', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2017-09-26 09:48:57', '3', '(sadasd)', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2017-09-26 09:50:18', '21', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2017-09-26 09:50:59', '21', '(黑色)', '2', '[{\"changed\": {\"fields\": [\"value\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2017-09-26 09:52:13', '6', '(S)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2017-09-26 09:52:53', '22', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2017-09-26 09:53:10', '7', '(S)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2017-09-26 09:57:59', '23', '(棕色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2017-09-26 10:00:54', '5', '(中长款双面呢毛呢外套)', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2017-09-26 10:01:11', '5', '(中长款双面呢毛呢外套)', '2', '[{\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2017-09-26 10:02:03', '5', '(中长款双面呢毛呢外套)', '2', '[{\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2017-09-26 10:02:41', '7', '(S)', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2017-09-26 10:02:57', '8', '(M)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2017-09-26 10:03:04', '9', '(L)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2017-09-26 10:03:09', '10', '(XL)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2017-09-26 10:04:13', '5', '(中长款双面呢毛呢外套)', '2', '[{\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2017-09-26 10:06:24', '5', '(中长款双面呢毛呢外套)', '2', '[{\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"store\"}}, {\"changed\": {\"fields\": [\"size\"], \"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2017-09-26 10:06:47', '5', '(中长款双面呢毛呢外套)', '2', '[{\"changed\": {\"fields\": [\"size\"], \"object\": \"(\\u4e2d\\u957f\\u6b3e\\u53cc\\u9762\\u5462\\u6bdb\\u5462\\u5916\\u5957)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2017-09-26 10:12:26', '5', '(中长款双面呢毛呢外套)', '2', '[]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2017-09-26 10:14:39', '24', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2017-09-26 10:15:23', '25', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2017-09-26 10:15:30', '6', '(修身短款呢子小外套)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2017-09-26 10:18:19', '6', '(修身短款呢子小外套)', '2', '[{\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u77ed\\u6b3e\\u5462\\u5b50\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2017-09-26 10:20:04', '26', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2017-09-26 10:20:15', '7', '(高腰刺绣PU皮短裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2017-09-26 10:23:03', '7', '(高腰刺绣PU皮短裙)', '2', '[{\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2017-09-26 10:24:55', '27', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2017-09-26 10:25:13', '8', '(松紧腰PU皮短裤)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2017-09-26 10:28:56', '8', '(松紧腰PU皮短裤)', '2', '[{\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u677e\\u7d27\\u8170PU\\u76ae\\u77ed\\u88e4)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2017-09-26 10:30:21', '7', '(高腰刺绣PU皮短裙)', '2', '[{\"changed\": {\"fields\": [\"value\"], \"object\": \"(\\u9ad8\\u8170\\u523a\\u7ee3PU\\u76ae\\u77ed\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2017-09-26 13:07:31', '28', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2017-09-26 13:07:42', '9', '(秋季V领镂空蕾丝衫)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2017-09-26 13:09:54', '9', '(秋季V领镂空蕾丝衫)', '2', '[{\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u5b63V\\u9886\\u9542\\u7a7a\\u857e\\u4e1d\\u886b)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2017-09-26 13:13:51', '29', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2017-09-26 13:14:23', '30', '(绿色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2017-09-26 13:14:43', '31', '(黄)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2017-09-26 13:17:36', '10', '(系带显瘦宽松套装)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u7cfb\\u5e26\\u663e\\u7626\\u5bbd\\u677e\\u5957\\u88c5)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2017-09-26 13:19:03', '32', '(斑马色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2017-09-26 13:21:53', '11', '(条纹针织包臀连衣裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u9488\\u7ec7\\u5305\\u81c0\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2017-09-26 13:25:40', '33', '(绿色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2017-09-26 13:26:01', '34', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2017-09-26 13:26:19', '35', '(棕色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2017-09-26 13:28:55', '12', '(时尚修身两件套装裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u65f6\\u5c1a\\u4fee\\u8eab\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2017-09-26 13:30:21', '36', '(白色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2017-09-26 13:30:38', '37', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2017-09-26 13:33:03', '13', '(显瘦蕾丝中长连衣裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u663e\\u7626\\u857e\\u4e1d\\u4e2d\\u957f\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2017-09-26 13:34:33', '38', '(斑马色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2017-09-26 13:34:53', '39', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2017-09-26 13:37:07', '14', '(条纹显瘦网纱连衣裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u6761\\u7eb9\\u663e\\u7626\\u7f51\\u7eb1\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2017-09-26 13:40:08', '40', '(橘色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2017-09-26 13:40:23', '41', '(紫色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2017-09-26 13:43:04', '15', '(修身显瘦格子打底裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u663e\\u7626\\u683c\\u5b50\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2017-09-26 13:45:38', '42', '(绿色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2017-09-26 13:46:00', '43', '(白色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2017-09-26 13:46:14', '44', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2017-09-26 13:51:01', '16', '(修身包臀蕾丝打底裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4fee\\u8eab\\u5305\\u81c0\\u857e\\u4e1d\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2017-09-26 13:53:06', '45', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2017-09-26 13:55:37', '17', '(双排扣假两件连衣裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u53cc\\u6392\\u6263\\u5047\\u4e24\\u4ef6\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2017-09-26 13:57:20', '46', '(灰色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2017-09-26 13:57:34', '47', '(蓝色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2017-09-26 13:57:52', '48', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2017-09-26 13:58:07', '49', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2017-09-26 14:00:36', '18', '(针织袖拼接毛呢打底裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u9488\\u7ec7\\u8896\\u62fc\\u63a5\\u6bdb\\u5462\\u6253\\u5e95\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2017-09-26 14:02:07', '50', '(绿色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2017-09-26 14:02:27', '51', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2017-09-26 14:02:41', '52', '(蓝色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2017-09-26 14:05:41', '19', '(气质收腰显瘦连衣裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u6c14\\u8d28\\u6536\\u8170\\u663e\\u7626\\u8fde\\u8863\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2017-09-26 14:16:37', '53', '(蓝色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2017-09-26 14:18:46', '20', '(宽松短款牛仔外套)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u5bbd\\u677e\\u77ed\\u6b3e\\u725b\\u4ed4\\u5916\\u5957)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2017-09-26 14:19:44', '54', '(蓝色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2017-09-26 14:21:43', '21', '(不规则毛边喇叭牛仔裤)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u4e0d\\u89c4\\u5219\\u6bdb\\u8fb9\\u5587\\u53ed\\u725b\\u4ed4\\u88e4)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2017-09-26 14:22:45', '55', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2017-09-26 14:24:57', '22', '(红色原宿bf风小外套)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u7ea2\\u8272\\u539f\\u5bbfbf\\u98ce\\u5c0f\\u5916\\u5957)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2017-09-26 14:26:59', '56', '(蓝色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2017-09-26 14:29:23', '23', '(无袖套头毛衣马甲女秋)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u65e0\\u8896\\u5957\\u5934\\u6bdb\\u8863\\u9a6c\\u7532\\u5973\\u79cb)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('123', '2017-09-26 14:31:00', '11', '(均码)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('124', '2017-09-26 14:31:14', '57', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('125', '2017-09-26 14:31:28', '12', '(均码)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('126', '2017-09-26 14:31:40', '58', '(黄色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('127', '2017-09-26 14:31:59', '59', '(紫色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('128', '2017-09-26 14:32:07', '13', '(均码)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('129', '2017-09-26 14:34:15', '24', '(韩版侧开叉宽松毛衣)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('130', '2017-09-26 14:35:06', '24', '(韩版侧开叉宽松毛衣)', '2', '[{\"changed\": {\"fields\": [\"size\"], \"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"store\"}}, {\"changed\": {\"fields\": [\"size\"], \"object\": \"(\\u97e9\\u7248\\u4fa7\\u5f00\\u53c9\\u5bbd\\u677e\\u6bdb\\u8863)\", \"name\": \"store\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('131', '2017-09-26 14:35:24', '13', '(均码)', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('132', '2017-09-26 14:35:31', '12', '(均码)', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('133', '2017-09-27 01:44:05', '60', '(白色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('134', '2017-09-27 01:44:27', '61', '(三号色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('135', '2017-09-27 01:46:33', '25', '(秋时尚印花两件套装裙)', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(\\u79cb\\u65f6\\u5c1a\\u5370\\u82b1\\u4e24\\u4ef6\\u5957\\u88c5\\u88d9)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('136', '2017-09-27 01:48:21', '26', '(90绒大毛领保暖羽绒服)', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('137', '2017-09-27 01:48:39', '12', '(150)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('138', '2017-09-27 01:48:44', '13', '(160)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('139', '2017-09-27 01:48:49', '14', '(165)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('140', '2017-09-27 01:48:54', '15', '(170)', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('141', '2017-09-27 01:49:15', '62', '(红色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('142', '2017-09-27 01:49:30', '63', '(绿色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('143', '2017-09-27 01:49:43', '64', '(黄色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('144', '2017-09-27 01:50:00', '65', '(黑色)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('145', '2017-09-27 01:56:09', '26', '(90绒大毛领保暖羽绒服)', '2', '[{\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"store\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}, {\"added\": {\"object\": \"(90\\u7ed2\\u5927\\u6bdb\\u9886\\u4fdd\\u6696\\u7fbd\\u7ed2\\u670d)\", \"name\": \"goods details\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('146', '2017-09-27 02:00:42', '26', '(90绒大毛领保暖羽绒服)', '2', '[{\"changed\": {\"fields\": [\"gprice\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('147', '2017-10-09 05:29:12', '1', 'User object', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('148', '2017-10-10 02:12:56', 'ff89d0ef-1691-4f6a-bf9f-b1814af259be', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('149', '2017-10-10 02:12:56', 'e0cc2179-ddaa-4d2d-a930-9ca903bd0660', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('150', '2017-10-10 02:12:57', 'ccb789d3-6f20-45c8-a3e5-fc97bd27f957', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('151', '2017-10-10 02:12:57', 'cb65a6e5-1f4a-4043-b570-7824a5733e9a', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('152', '2017-10-10 02:12:57', 'c1e44f06-d3f0-4615-a24c-dd4c2738ceb6', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('153', '2017-10-10 02:12:57', 'b667f048-5083-40cd-9fd0-613a90d9560d', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('154', '2017-10-10 02:12:57', 'a51c41a7-5c57-4366-b59b-2f6918d5f85b', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('155', '2017-10-10 02:12:57', '8f1367c7-bae5-4b43-b303-d9d05f8b3ae9', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('156', '2017-10-10 02:12:57', '70897b83-514e-4497-a27a-47c2a76ec557', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('157', '2017-10-10 02:12:57', '5d2439b1-7006-448a-a678-c4905e13463d', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('158', '2017-10-10 02:12:57', '4e625be4-d98f-454f-a2e7-3f1f61811211', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('159', '2017-10-10 02:12:57', '2aaad794-3ae8-4e4e-ac44-d705169001a2', 'Order object', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('160', '2017-10-10 02:12:57', '2654cd19-1116-4d83-ac7f-bdfe72fd05ca', 'Order object', '3', '', '14', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'shop', 'category');
INSERT INTO `django_content_type` VALUES ('11', 'shop', 'color');
INSERT INTO `django_content_type` VALUES ('10', 'shop', 'goods');
INSERT INTO `django_content_type` VALUES ('12', 'shop', 'goodsdetails');
INSERT INTO `django_content_type` VALUES ('14', 'shop', 'order');
INSERT INTO `django_content_type` VALUES ('8', 'shop', 'size');
INSERT INTO `django_content_type` VALUES ('9', 'shop', 'store');
INSERT INTO `django_content_type` VALUES ('13', 'shop', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('14', 'shop', '0001_initial', '2017-09-26 06:36:33');
INSERT INTO `django_migrations` VALUES ('15', 'shop', '0002_auto_20170926_1654', '2017-09-26 08:54:05');
INSERT INTO `django_migrations` VALUES ('16', 'shop', '0003_auto_20170926_1704', '2017-09-26 09:04:32');
INSERT INTO `django_migrations` VALUES ('17', 'shop', '0004_auto_20170926_1735', '2017-09-26 09:35:50');
INSERT INTO `django_migrations` VALUES ('18', 'shop', '0005_auto_20170926_1805', '2017-09-26 10:05:33');
INSERT INTO `django_migrations` VALUES ('19', 'shop', '0006_user', '2017-10-09 05:26:58');
INSERT INTO `django_migrations` VALUES ('20', 'shop', '0007_order', '2017-10-10 01:37:55');
INSERT INTO `django_migrations` VALUES ('21', 'shop', '0008_auto_20171010_0954', '2017-10-10 01:54:55');
INSERT INTO `django_migrations` VALUES ('22', 'shop', '0009_auto_20171010_1004', '2017-10-10 02:04:46');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('06vk59r5zw3pqa8gkt63639x9id1p9ra', 'NjUyNmRlODBhMDA0YzM2YmRkNzZmZjNiMjM1ZDYzZWNjMDBiNmRjZjp7ImNhcnQiOnsiTWpVc05qRXNOZz09XG4iOjF9fQ==', '2017-10-11 10:41:23');
INSERT INTO `django_session` VALUES ('1h36bn7b9pnahdimkb66618dxt13sy0y', 'YWZmYTcyMWQ1NWFhODY5YTNhYWZkNGFhN2I4NTAwYjY4YTk3NzBiNTp7ImNhcnQiOnsiTWpRc05UY3NNVEU9XG4iOjUsIk1qUXNOVGdzTVRFPVxuIjozfX0=', '2017-10-13 09:33:40');
INSERT INTO `django_session` VALUES ('1xh3i8r5jh5ax8y9jspwib6f3t8vyuo5', 'OTU4MWFjYzQ2YzRhZDZmMDFhYmU1MGJiMGVjNDhjNDA4ZDQ3MzcyNzp7ImNhcnQiOnsiMjYsNjIsMTIiOjF9LCJfYXV0aF91c2VyX2hhc2giOiI2ZDBmMDU4NzliNTZlYTE1MjkyZmIwNDM0NWVkNWI4ZmM0NjUyZTIxIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2017-10-11 07:36:40');
INSERT INTO `django_session` VALUES ('2pfi321ky99cw3a132qeh0u0uibxkc0r', 'NzRmYjUwMTg4ZDU5ZjlkOTU1NTA4NGM0MTc1NDNmNDg3OGRjMzBiYzp7ImNhcnQiOnsiTWpZc05qSXNcbiI6MiwiTWpZc05qSXNNVEk9XG4iOjF9fQ==', '2017-10-13 09:17:56');
INSERT INTO `django_session` VALUES ('58wtq66hakqoj7nzt5fss5wgq9o19rrj', 'ZDdlMjg5ZTg3NzBmYTQ4NDg5NzVmNjQ3ODEzY2RiOWY1ZDRkMzdhNTp7ImNhcnQiOnsiTWpZc05qSXNcbiI6MywiTWpZc05qSXNNVEk9XG4iOjF9fQ==', '2017-10-13 09:16:14');
INSERT INTO `django_session` VALUES ('5u3pjjifydfebr7zr7jsoeftdox6amap', 'YzU3OGYzZGM2ZTcwMTdhZjgzODAzMDQ4Y2ExNjNjOTMwOTQ3MDUyNjp7ImNhcnQiOnsiTWpZc05qSXNcbiI6MSwiTWpZc05qSXNNVEk9XG4iOjF9fQ==', '2017-10-13 09:18:41');
INSERT INTO `django_session` VALUES ('6ivommutkj9z2o39ipvxdxs7jkxoyjus', 'ZTM2OGNjNWRiNGE2ZWQ5ODM5MjRmNDRlNzg4NzczYjBmOGMxYjI3ZTp7ImNhcnQiOnsiTWpVc05qQXNOZz09XG4iOjF9fQ==', '2017-10-11 09:41:03');
INSERT INTO `django_session` VALUES ('8ryezmdb05m3ijdt9yljv5k0t1z0beck', 'ZTM2OGNjNWRiNGE2ZWQ5ODM5MjRmNDRlNzg4NzczYjBmOGMxYjI3ZTp7ImNhcnQiOnsiTWpVc05qQXNOZz09XG4iOjF9fQ==', '2017-10-11 13:38:52');
INSERT INTO `django_session` VALUES ('ah835hdpgknh0eu64mzznml8sfoqxv9c', 'NDE5NjQwZjQ1YjdlZWU2MTk0YTZlYjFhOThkYWU0YmU5NzQ1Y2EyMzp7ImNhcnQiOnsiTWpVc05qQXNOZz09XG4iOjEsIk1qWXNOaklzTVRJPVxuIjoyLCJOeXd5Tml3NFxuIjoxLCJNallzTmpRc01UST1cbiI6MSwiTWpZc05qUXNNVE09XG4iOjF9fQ==', '2017-10-12 09:33:59');
INSERT INTO `django_session` VALUES ('aw97g8zv9ephvainos6jedggrr80ceme', 'YzczODg1YTY4ZWRlZjQ0NWY3OTlmMmYwYmM5Zjc3NTJiMmJjNzFmZTp7ImNhcnQiOnsiTWpVc05qRXNOZz09XG4iOjEsIk1qVXNOakFzTmc9PVxuIjoyLCJNak1zTlRZc09BPT1cbiI6NCwiTWpVc05qQXNPQT09XG4iOjEsIk1qWXNOaklzTVRJPVxuIjoxLCJNVGtzTlRBc05nPT1cbiI6MX19', '2017-10-12 08:13:08');
INSERT INTO `django_session` VALUES ('di2bqm1dak7gbzudagaqzcmxnezft605', 'NjUyNmRlODBhMDA0YzM2YmRkNzZmZjNiMjM1ZDYzZWNjMDBiNmRjZjp7ImNhcnQiOnsiTWpVc05qRXNOZz09XG4iOjF9fQ==', '2017-10-11 10:45:28');
INSERT INTO `django_session` VALUES ('dpfjhd35lvu7qbydauwp2nv4z7bpmlbp', 'ZTIzMDVhYTFkOGQ5NDU0MmRhM2IzMTQzOTA0OWE0ZGMwYWQ2ZDQxMDp7ImNhcnQiOnsiTWpZc05qSXNNVEk9XG4iOjJ9fQ==', '2017-10-13 01:45:12');
INSERT INTO `django_session` VALUES ('e1fm941spf4qpxw75c4hpthem8x3d7po', 'YzU3OGYzZGM2ZTcwMTdhZjgzODAzMDQ4Y2ExNjNjOTMwOTQ3MDUyNjp7ImNhcnQiOnsiTWpZc05qSXNcbiI6MSwiTWpZc05qSXNNVEk9XG4iOjF9fQ==', '2017-10-13 09:19:37');
INSERT INTO `django_session` VALUES ('eeitmcq5r099ziihj05r9xsq8blvr9i6', 'ZjhiOWVmMDAyYjUwZmE0MDMwNjNkODk3OGI5ZDM2YzFjNjA5NTYyNjp7ImNhcnQiOnsiTWpVc05qQXNPQT09XG4iOjEsIk1qVXNOakFzTmc9PVxuIjo5LCJNVEVzTXpJc09BPT1cbiI6M30sIl9hdXRoX3VzZXJfaGFzaCI6ImI1ZDIyY2FhMzg2ODEzMzUxYTM4ZTY1NWJmMzA5N2MyZmI5YjMyZTMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlciI6MX0=', '2017-10-23 09:14:16');
INSERT INTO `django_session` VALUES ('ez7a1wmew0fxwt6h5nxv41qzet53d7qb', 'NjExNzk3ZGFmYjJmNDJjOTEzZGVlMjRhMDFkNWU4OGQ5YjQxOGEzMjp7ImNhcnQiOnsiTWpZc05qSXNcbiI6LTEsIk1qWXNOaklzTVRJPVxuIjoxLCJNallzTmpNc01UST1cbiI6MX19', '2017-10-13 09:15:18');
INSERT INTO `django_session` VALUES ('iiylcog9at213a7ds1dckc8mexqfz5nj', 'MDA1N2NkYzI5YzQyYjQwMDExNmZlMzQyNjQ4ZmY1NWFjNDgxMTA0ZTp7ImNhcnQiOnsiMjYsNjIsMTIiOjF9fQ==', '2017-10-11 09:00:33');
INSERT INTO `django_session` VALUES ('j7ygz0z49nz4oz5jcpu93n5hkv4srl0t', 'MDA1N2NkYzI5YzQyYjQwMDExNmZlMzQyNjQ4ZmY1NWFjNDgxMTA0ZTp7ImNhcnQiOnsiMjYsNjIsMTIiOjF9fQ==', '2017-10-11 09:35:43');
INSERT INTO `django_session` VALUES ('jbk19j7kva5pdmt1xp1fxs83ac0q5zyf', 'NWZjMzkzMDBlZjA1MTI0NWZiNTE0ZTQwMzcwY2FlNTEwNWVjNDk1Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjVkMjJjYWEzODY4MTMzNTFhMzhlNjU1YmYzMDk3YzJmYjliMzJlMyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiY2FydCI6e30sInVzZXIiOjF9', '2017-10-24 03:33:08');
INSERT INTO `django_session` VALUES ('jyp8q51rczodmr1uqdegedcufc4ntxaq', 'MDA1N2NkYzI5YzQyYjQwMDExNmZlMzQyNjQ4ZmY1NWFjNDgxMTA0ZTp7ImNhcnQiOnsiMjYsNjIsMTIiOjF9fQ==', '2017-10-11 09:01:39');
INSERT INTO `django_session` VALUES ('mbfaongem8cipjuueqhd99vh45armfm4', 'ZTM4YWIxNGVmYjA5YmRhMTAyZDZjYTYyZGM3MDAzOGVhOTM3NGMyODp7ImNhcnQiOnsiTWpJc05UVXNOZz09XG4iOjUsIk1qVXNOakFzTmc9PVxuIjoyLCJNalVzTmpFc09RPT1cbiI6MiwiTWpZc05qUXNNVE09XG4iOjh9LCJfYXV0aF91c2VyX2hhc2giOiI3NjI0ZmYxNmZkZDJjZTc4Nzg5MTNhYzZjOTdhYTZlNTU2ODZlYjcyIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2017-11-24 01:27:09');
INSERT INTO `django_session` VALUES ('otsu36gsq0xnsa5bjuer81v799fzl46i', 'YzVkMjQwOTk4N2ViNDIxZjNiNzI1YjIyMDYxOGNjNzJhY2MwOTM3Mjp7ImNhcnQiOnsiTWpRc05UY3NNVEU9XG4iOjF9fQ==', '2017-10-11 09:46:14');
INSERT INTO `django_session` VALUES ('qcu0c68i5w294cgrcxwurns0weota9f2', 'YWI5ZTI2NTA4YzhiN2Q5Y2Q3MWY2OWRjZTZhYjMzOTdlNzljMzQyNTp7ImNhcnQiOnsiTWpZc05qSXNNVEk9XG4iOjF9fQ==', '2017-10-12 06:33:57');
INSERT INTO `django_session` VALUES ('tbmz5gfrz80d1j1hogv2d2gvk5s0nx32', 'NjUyNmRlODBhMDA0YzM2YmRkNzZmZjNiMjM1ZDYzZWNjMDBiNmRjZjp7ImNhcnQiOnsiTWpVc05qRXNOZz09XG4iOjF9fQ==', '2017-10-11 10:34:29');
INSERT INTO `django_session` VALUES ('u9qkgzll9qd6pbx22wbzawp0ok755b0q', 'YjU4MmM4MDkxNjhjZWNiZTQ0NTA2MWIwOTRiYjZhODBiMWY3MTExMDp7ImNhcnQiOnsiTWpZc05qTXNNVE09XG4iOjIsIk1qWXNOaklzTVRJPVxuIjozLCJNallzTmpVc01UST1cbiI6MX19', '2017-10-13 07:08:17');

-- ----------------------------
-- Table structure for shop_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cname` (`cname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_category
-- ----------------------------
INSERT INTO `shop_category` VALUES ('13', '内衣');
INSERT INTO `shop_category` VALUES ('2', '女装');
INSERT INTO `shop_category` VALUES ('8', '家纺');
INSERT INTO `shop_category` VALUES ('7', '居家');
INSERT INTO `shop_category` VALUES ('11', '数码');
INSERT INTO `shop_category` VALUES ('9', '文体');
INSERT INTO `shop_category` VALUES ('5', '母婴');
INSERT INTO `shop_category` VALUES ('12', '电器');
INSERT INTO `shop_category` VALUES ('1', '男装');
INSERT INTO `shop_category` VALUES ('4', '箱包');
INSERT INTO `shop_category` VALUES ('6', '美妆');
INSERT INTO `shop_category` VALUES ('10', '美食');
INSERT INTO `shop_category` VALUES ('14', '装饰');
INSERT INTO `shop_category` VALUES ('3', '鞋子');

-- ----------------------------
-- Table structure for shop_color
-- ----------------------------
DROP TABLE IF EXISTS `shop_color`;
CREATE TABLE `shop_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_color
-- ----------------------------
INSERT INTO `shop_color` VALUES ('21', '黑色', 'color/h_2og4uJv.jpg');
INSERT INTO `shop_color` VALUES ('22', '红色', 'color/hong.jpg');
INSERT INTO `shop_color` VALUES ('23', '棕色', 'color/zong.jpg');
INSERT INTO `shop_color` VALUES ('24', '黑色', 'color/hei.jpg');
INSERT INTO `shop_color` VALUES ('25', '红色', 'color/hongse.jpg');
INSERT INTO `shop_color` VALUES ('26', '黑色', 'color/hei_1d7yrVm.jpg');
INSERT INTO `shop_color` VALUES ('27', '黑色', 'color/hei_LfSKcUV.jpg');
INSERT INTO `shop_color` VALUES ('28', '黑色', 'color/hei_JeBWGjF.jpg');
INSERT INTO `shop_color` VALUES ('29', '黑色', 'color/hei_3vOTo3s.jpg');
INSERT INTO `shop_color` VALUES ('30', '绿色', 'color/lv.jpg');
INSERT INTO `shop_color` VALUES ('31', '黄', 'color/huang.jpg');
INSERT INTO `shop_color` VALUES ('32', '斑马色', 'color/ban.jpg');
INSERT INTO `shop_color` VALUES ('33', '绿色', 'color/lv_eFlravj.jpg');
INSERT INTO `shop_color` VALUES ('34', '红色', 'color/hong_nwQGdMd.jpg');
INSERT INTO `shop_color` VALUES ('35', '棕色', 'color/zong_v7JDaAc.jpg');
INSERT INTO `shop_color` VALUES ('36', '白色', 'color/bai.jpg');
INSERT INTO `shop_color` VALUES ('37', '黑色', 'color/hei_goVnbhs.jpg');
INSERT INTO `shop_color` VALUES ('38', '斑马色', 'color/ban_fSqFE03.jpg');
INSERT INTO `shop_color` VALUES ('39', '黑色', 'color/hei_ZyxMfgc.jpg');
INSERT INTO `shop_color` VALUES ('40', '橘色', 'color/ju.jpg');
INSERT INTO `shop_color` VALUES ('41', '紫色', 'color/zi.jpg');
INSERT INTO `shop_color` VALUES ('42', '绿色', 'color/lv_sxlJZTq.jpg');
INSERT INTO `shop_color` VALUES ('43', '白色', 'color/bai_B7tmsjh.jpg');
INSERT INTO `shop_color` VALUES ('44', '黑色', 'color/hei_sNOao2p.jpg');
INSERT INTO `shop_color` VALUES ('45', '黑色', 'color/hei_kYyKPNv.jpg');
INSERT INTO `shop_color` VALUES ('46', '灰色', 'color/hui.jpg');
INSERT INTO `shop_color` VALUES ('47', '蓝色', 'color/lan.jpg');
INSERT INTO `shop_color` VALUES ('48', '红色', 'color/hong_UO2LzHh.jpg');
INSERT INTO `shop_color` VALUES ('49', '黑色', 'color/hei_cOOnNKI.jpg');
INSERT INTO `shop_color` VALUES ('50', '绿色', 'color/lv_H5hkmmq.jpg');
INSERT INTO `shop_color` VALUES ('51', '红色', 'color/hong_4FhJTrJ.jpg');
INSERT INTO `shop_color` VALUES ('52', '蓝色', 'color/lan_7rd4yDs.jpg');
INSERT INTO `shop_color` VALUES ('53', '蓝色', 'color/lan_ELubwxG.jpg');
INSERT INTO `shop_color` VALUES ('54', '蓝色', 'color/lan_IThSO4Z.jpg');
INSERT INTO `shop_color` VALUES ('55', '红色', 'color/hong_zHPXVqY.jpg');
INSERT INTO `shop_color` VALUES ('56', '蓝色', 'color/lan_BKQdpOj.jpg');
INSERT INTO `shop_color` VALUES ('57', '红色', 'color/hong_y7wQwRw.jpg');
INSERT INTO `shop_color` VALUES ('58', '黄色', 'color/huang_NKcgOlT.jpg');
INSERT INTO `shop_color` VALUES ('59', '紫色', 'color/zi_umktLLD.jpg');
INSERT INTO `shop_color` VALUES ('60', '白色', 'color/bai_mt1VrH5.jpg');
INSERT INTO `shop_color` VALUES ('61', '三号色', 'color/san.jpg');
INSERT INTO `shop_color` VALUES ('62', '红色', 'color/hong_Dm4fQ6U.jpg');
INSERT INTO `shop_color` VALUES ('63', '绿色', 'color/lv_cTMJg2K.jpg');
INSERT INTO `shop_color` VALUES ('64', '黄色', 'color/huang_bvCMlhn.jpg');
INSERT INTO `shop_color` VALUES ('65', '黑色', 'color/hei_rFOWelp.jpg');

-- ----------------------------
-- Table structure for shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) NOT NULL,
  `gdesc` varchar(1024) DEFAULT NULL,
  `gprice` decimal(10,2) NOT NULL,
  `goldprice` decimal(10,2) NOT NULL,
  `categoryId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_goods_categoryId_id_40fbb43a_fk_shop_category_id` (`categoryId_id`),
  CONSTRAINT `shop_goods_categoryId_id_40fbb43a_fk_shop_category_id` FOREIGN KEY (`categoryId_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO `shop_goods` VALUES ('5', '中长款双面呢毛呢外套', '中长款双面呢毛呢外套', '33.00', '256.00', '2');
INSERT INTO `shop_goods` VALUES ('6', '修身短款呢子小外套', '秋装新款女装毛呢短外套女 时尚修身短款呢子小西装潮', '39.00', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('7', '高腰刺绣PU皮短裙', '秋冬时尚高腰刺绣PU皮短裙女打底半身裙', '29.90', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('8', '松紧腰PU皮短裤', '秋冬时尚百搭高腰PU皮阔腿短裤女打底皮裤', '19.90', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('9', '秋季V领镂空蕾丝衫', '新款大码女装蕾丝衫韩版修身V领长袖打底衫网纱镂空上衣', '28.00', '124.00', '2');
INSERT INTO `shop_goods` VALUES ('10', '系带显瘦宽松套装', '诗赫姿秋系带显瘦宽松时尚套装阔腿裤女', '69.90', '259.00', '2');
INSERT INTO `shop_goods` VALUES ('11', '条纹针织包臀连衣裙', '诗赫姿秋条纹时尚针织包臀打底裙连衣裙', '65.00', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('12', '时尚修身两件套装裙', '诗赫姿秋新款时尚修身两件套装连衣裙女', '68.90', '299.00', '2');
INSERT INTO `shop_goods` VALUES ('13', '显瘦蕾丝中长连衣裙', '诗赫姿秋新款时尚显瘦蕾丝中长连衣裙女', '69.00', '255.00', '2');
INSERT INTO `shop_goods` VALUES ('14', '条纹显瘦网纱连衣裙', '诗赫姿秋新款条纹时尚显瘦网纱连衣裙女', '69.90', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('15', '修身显瘦格子打底裙', '诗赫姿秋新款修身显瘦格子打底裙连衣裙', '69.90', '259.00', '2');
INSERT INTO `shop_goods` VALUES ('16', '修身包臀蕾丝打底裙', '诗赫姿秋新款修身包臀蕾丝打底裙连衣裙', '69.00', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('17', '双排扣假两件连衣裙', '诗赫姿秋新款简约双排扣假两件连衣裙女', '69.00', '299.00', '2');
INSERT INTO `shop_goods` VALUES ('18', '针织袖拼接毛呢打底裙', '诗赫姿秋新款针织袖时尚拼接毛呢打底裙', '69.00', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('19', '气质收腰显瘦连衣裙', '诗赫姿秋新款气质时尚收腰显瘦连衣裙女', '69.00', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('20', '宽松短款牛仔外套', '诗赫姿秋新款宽松短款时尚绣花牛仔外套女', '79.00', '259.00', '2');
INSERT INTO `shop_goods` VALUES ('21', '不规则毛边喇叭牛仔裤', '诗赫姿秋新款不规则毛边喇叭长裤牛仔裤', '65.00', '199.00', '2');
INSERT INTO `shop_goods` VALUES ('22', '红色原宿bf风小外套', '诗赫姿秋新款红色原宿bf风牛仔小外套女', '69.00', '229.00', '2');
INSERT INTO `shop_goods` VALUES ('23', '无袖套头毛衣马甲女秋', '2017秋季新款上衣潮 笑脸学院风针织背心无袖套头毛衣马甲女春秋', '39.00', '296.00', '2');
INSERT INTO `shop_goods` VALUES ('24', '韩版侧开叉宽松毛衣', '新款韩版前短后长 侧开叉宽松圆领 纯色大码套头针织衫外套', '39.00', '369.00', '2');
INSERT INTO `shop_goods` VALUES ('25', '秋时尚印花两件套装裙', '秋装时尚印花复古时尚休闲两件套装裙子', '35.00', '100.00', '2');
INSERT INTO `shop_goods` VALUES ('26', '90绒大毛领保暖羽绒服', '梦娜世家2017女式新款修身中长款毛领时尚显瘦欧美气质羽绒服A88', '99.00', '499.00', '2');

-- ----------------------------
-- Table structure for shop_goodsdetails
-- ----------------------------
DROP TABLE IF EXISTS `shop_goodsdetails`;
CREATE TABLE `shop_goodsdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `goodsId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_goodsdetails_goodsId_id_dd0f546e_fk_shop_goods_id` (`goodsId_id`),
  CONSTRAINT `shop_goodsdetails_goodsId_id_dd0f546e_fk_shop_goods_id` FOREIGN KEY (`goodsId_id`) REFERENCES `shop_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goodsdetails
-- ----------------------------
INSERT INTO `shop_goodsdetails` VALUES ('4', '1.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('5', '2.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('6', '3.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('7', '4.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('8', '5.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('9', '6.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('10', '7.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('11', '8.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('12', '9.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('13', '10.jpg', '5');
INSERT INTO `shop_goodsdetails` VALUES ('14', '1_lCofK1Q.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('15', '2_fN7fXqT.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('16', '3_sQci5N1.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('17', '4_t8f1jLp.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('18', '5_pnAqZij.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('19', '6_Jyvt0gV.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('20', '7_88GAaTo.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('21', '8_dwmGQq1.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('22', '9_IVxniTc.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('23', '10_MBQOH1D.jpg', '6');
INSERT INTO `shop_goodsdetails` VALUES ('24', '1_elE8eIp.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('25', '2_4vn9XVx.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('26', '3_D1iL18X.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('27', '4_i3s0HY6.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('28', '5_fjAcCOl.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('29', '6_ECsXNEg.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('30', '7_7pnv5eG.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('31', '8_dDvDZt3.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('32', '9_e0PyyUN.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('33', '10_w27K7NE.jpg', '7');
INSERT INTO `shop_goodsdetails` VALUES ('34', '1_hYKWHNU.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('35', '2_HG8qNBO.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('36', '3_aDwC2Ql.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('37', '4_Rj4l1L8.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('38', '5_23MIkpl.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('39', '6_q3Kpy4T.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('40', '7_9VDJMAo.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('41', '8_aIKJvFt.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('42', '9_InpWyDb.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('43', '10_5jDjWzb.jpg', '8');
INSERT INTO `shop_goodsdetails` VALUES ('44', '1_NMUUNXC.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('45', '2_Ouot4Pr.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('46', '3_Gz1jfea.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('47', '4_I75CkJ3.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('48', '5_o83wrz9.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('49', '6_a6urQrM.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('50', '7_Wj7Dhuj.jpg', '9');
INSERT INTO `shop_goodsdetails` VALUES ('51', '1_vXCGxCI.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('52', '2_54gKgQP.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('53', '3_eNxYhCr.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('54', '4_BprQkfJ.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('55', '5_qsc95lP.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('56', '6_UAGLwbX.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('57', '7_F6hIwWB.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('58', '8_a2kJabS.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('59', '9_SZ0wMpy.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('60', '10_MeWXSKs.jpg', '10');
INSERT INTO `shop_goodsdetails` VALUES ('61', '1_v57UFo5.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('62', '2_nT3X3Gi.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('63', '3_C9361FH.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('64', '4_KPjviHC.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('65', '5_j9H6NUg.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('66', '6_0yvtHsK.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('67', '7_OyIqVRu.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('68', '8_zaePCtI.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('69', '9_zDqfKRE.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('70', '10_o3nc5fU.jpg', '11');
INSERT INTO `shop_goodsdetails` VALUES ('71', '1_YVRqAfG.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('72', '2_rJP2AdH.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('73', '3_gQdONuG.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('74', '4_7T0yj4F.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('75', '5_DI2p1Wl.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('76', '6_CmqXZLW.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('77', '7_XOIrJSq.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('78', '8_ZqFUlsq.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('79', '9_CwxVXnR.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('80', '10_gn66t3j.jpg', '12');
INSERT INTO `shop_goodsdetails` VALUES ('81', '1_qhSeLSP.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('82', '2_T1EYNmq.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('83', '3_M5MK3Rp.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('84', '4_Qsb0wFi.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('85', '5_8L7yPar.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('86', '6_Xaip1y1.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('87', '7_MEUf1z0.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('88', '8_KtL5Rj0.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('89', '9_yFn3P2g.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('90', '10_TmP9DXa.jpg', '13');
INSERT INTO `shop_goodsdetails` VALUES ('91', '1_X1vUHuX.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('92', '2_rQvH5hc.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('93', '3_T5aiJXo.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('94', '4_VYfCSBP.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('95', '5_KdbwcPL.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('96', '6_7stuZRI.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('97', '7_WB2mznP.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('98', '8_7HnFJUe.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('99', '9_HN634xt.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('100', '10_Gs7AS8Z.jpg', '14');
INSERT INTO `shop_goodsdetails` VALUES ('101', '1_EPbLlsh.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('102', '2_CG1HTi2.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('103', '3_LrJ1TCJ.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('104', '4_ppO44fs.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('105', '5_3tIgCS6.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('106', '6_KN6SOts.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('107', '7_7vLJg1T.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('108', '8_BaXff43.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('109', '9_AexcCbE.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('110', '10_yG5bZ6x.jpg', '15');
INSERT INTO `shop_goodsdetails` VALUES ('111', '1_Rqdz7U7.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('112', '2_wyGJ4ta.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('113', '3_NNxcobt.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('114', '4_LOhSXlh.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('115', '5_OEepnkc.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('116', '6_om0yrNS.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('117', '7_va0yr9Y.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('118', '8_egWx7Pl.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('119', '9_JJPOi3d.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('120', '10_yXoBnL0.jpg', '16');
INSERT INTO `shop_goodsdetails` VALUES ('121', '1_oeshNKk.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('122', '2_iQ7dNj1.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('123', '3_8WGGwE5.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('124', '4_m2QcMFM.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('125', '5_m3BYUyr.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('126', '6_mJhhcKP.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('127', '7_NKEyR9K.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('128', '8_gRR4RHz.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('129', '9_YhUmuWF.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('130', '10_8H4hKoc.jpg', '17');
INSERT INTO `shop_goodsdetails` VALUES ('131', '1_mfc1bTY.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('132', '2_GohidDO.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('133', '3_mFj1A5X.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('134', '4_H23ayWL.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('135', '5_SGzSxZZ.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('136', '6_li3hJqN.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('137', '7_lK1M9SF.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('138', '8_7L4e40W.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('139', '9_TW7TlmY.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('140', '10_woLP7jo.jpg', '18');
INSERT INTO `shop_goodsdetails` VALUES ('141', '1_VJ7ZAQ6.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('142', '2_w4cxzhY.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('143', '3_U55lgsP.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('144', '4_EzoxL21.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('145', '5_Rewgb01.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('146', '6_ze76f9K.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('147', '7_6Wq1Bgx.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('148', '8_R2uMfUz.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('149', '9_D7uVd9z.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('150', '10_0RIywDD.jpg', '19');
INSERT INTO `shop_goodsdetails` VALUES ('151', '1_bmqDR3N.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('152', '2_72CrUqv.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('153', '3_FVVk5kE.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('154', '4_LNKrlRN.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('155', '5_qHsL809.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('156', '6_EXgGQLK.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('157', '7_lJD2O84.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('158', '8_TM4De6X.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('159', '9_gLF6TGo.jpg', '20');
INSERT INTO `shop_goodsdetails` VALUES ('160', '1_f8GP2Js.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('161', '2_mewqiym.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('162', '3_T3najRK.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('163', '4_Zn7OFjf.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('164', '5_z6JRqPe.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('165', '6_96JhJlq.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('166', '7_eNtOUP3.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('167', '8_B13UoeN.jpg', '21');
INSERT INTO `shop_goodsdetails` VALUES ('168', '1_0IilSTS.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('169', '2_dU6RLKQ.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('170', '3_eLYKeSJ.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('171', '4_mwUqQ7u.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('172', '5_AOfqMfX.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('173', '6_LE1Qg19.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('174', '7_7RVZFif.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('175', '8_W5zUBfp.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('176', '9_Py3cDKv.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('177', '10_w9OXfoC.jpg', '22');
INSERT INTO `shop_goodsdetails` VALUES ('178', '1_ORTzeTY.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('179', '2_RbgTYId.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('180', '3_1CyOSyR.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('181', '4_0490Pq4.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('182', '5_gk51Yc1.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('183', '6_MNo76Wb.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('184', '7_4JyLPNO.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('185', '8_VX32aT2.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('186', '9_x8mkplo.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('187', '10_1OVaH2E.jpg', '23');
INSERT INTO `shop_goodsdetails` VALUES ('188', '1_QoLgPlj.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('189', '2_lHY8mE9.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('190', '3_GiFc4gk.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('191', '4_IBO3QkF.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('192', '5_NjssJjH.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('193', '6_TJDGChY.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('194', '7_Sv0tWHZ.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('195', '8_MDhSM1I.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('196', '9_BUoWkrL.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('197', '10_k9f1eEK.jpg', '24');
INSERT INTO `shop_goodsdetails` VALUES ('198', '1_DNiW0D5.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('199', '2_eHi0Rix.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('200', '3_2e1cWcs.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('201', '4_D0ck80V.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('202', '5_bxMyxv5.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('203', '6_Z4j72Ft.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('204', '7_3QbFC0z.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('205', '8_OQGcrwL.jpg', '25');
INSERT INTO `shop_goodsdetails` VALUES ('206', '1_mpwtoGA.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('207', '2_UuQkY4b.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('208', '3_ViMgWv6.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('209', '4_BDmgdFv.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('210', '5_ozWIsej.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('211', '6_Pny8yTQ.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('212', '7_K4tB09L.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('213', '8_60MJMwS.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('214', '9_8YomGSk.jpg', '26');
INSERT INTO `shop_goodsdetails` VALUES ('215', '10_vonnLjk.jpg', '26');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` char(32) NOT NULL,
  `desc` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_user_id_00aba627_fk_shop_user_id` (`user_id`),
  CONSTRAINT `shop_order_user_id_00aba627_fk_shop_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('1689cc4929724686853e2a05a26981a3', '0', '2017-10-10 03:32:41', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('2905bbe5df9340dca9d291a2209dbc39', '0', '2017-10-10 02:18:08', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('2b7763ad56624fe6bc639c1b0b114a15', '0', '2017-10-10 02:21:44', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('3c752851c2b34d819c59c219512e4725', '0', '2017-10-10 02:33:08', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('443957a128034eab850ecadaa43ba639', '0', '2017-10-10 02:19:58', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('4e9b2320068a4ee69776947359acf0d3', '0', '2017-10-10 02:41:44', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('56bcc668613e4185999a222aa68c9997', '0', '2017-10-10 02:22:39', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('5e82866db1f24df78bac377c76b8b784', '0', '2017-10-10 02:30:04', '25:61:6,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('660164b622864a12a14f8c5de81a1c7e', '0', '2017-10-10 02:34:22', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('6e7b5ea7eb004b5ea4ae1452f82f7c1b', '0', '2017-10-10 02:18:43', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('71603018b643479ebda62e15670724ae', '0', '2017-10-10 02:29:36', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('7d6973efde3e414d9c3238dce0fc37a3', '0', '2017-10-10 02:38:26', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('82a0d6ab9ce4414ba5c91fb8558a7959', '0', '2017-10-10 02:22:38', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('8a79afd1fef2429fbeee22fab0180903', '0', '2017-10-10 03:33:08', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('91a6a78234ce453a8529751d98479c03', '0', '2017-10-10 02:13:01', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('9564079dc05546c0bbbd2cca703f5e2b', '0', '2017-10-10 02:34:48', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('98631bc463694c2991e8c7e5372ca16c', '0', '2017-10-10 02:48:57', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('ad6a9fbb717e47b4b9f39056c40be60c', '0', '2017-10-10 02:19:12', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('b04f58eb56d54015bac78c133a389e45', '0', '2017-10-10 02:38:19', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('b1425a94eeea4ff28861255c9f21e7d4', '0', '2017-10-10 02:18:30', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('cc49db5f57364b5eac816ddd334649fa', '0', '2017-10-10 02:20:14', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('dea5b317ca9f40c186f950f5fe18e2ef', '0', '2017-10-10 02:40:19', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('e4072fb9e9fd46479acc47c3c75b8cec', '0', '2017-10-10 02:57:02', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('e441bca0c22e43ecaf99955a070c1f26', '0', '2017-10-10 02:22:34', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('e4c159b2d9f84506b3bd8b3b7a5f4696', '0', '2017-10-10 02:55:59', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('eb67a4b41dfa479ea8f29895097bfa81', '0', '2017-10-10 02:22:40', '26:62:12,25:60:6', '1');
INSERT INTO `shop_order` VALUES ('f40bfba3eda64170b6536915a9bfd8fa', '0', '2017-10-10 02:47:01', '25:60:6', '1');
INSERT INTO `shop_order` VALUES ('fa91e054880f491da1ad6a1057ce1c93', '0', '2017-10-10 02:22:37', '26:62:12,25:60:6', '1');

-- ----------------------------
-- Table structure for shop_size
-- ----------------------------
DROP TABLE IF EXISTS `shop_size`;
CREATE TABLE `shop_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_size
-- ----------------------------
INSERT INTO `shop_size` VALUES ('6', 'S', 'S');
INSERT INTO `shop_size` VALUES ('8', 'M', 'M');
INSERT INTO `shop_size` VALUES ('9', 'L', 'L');
INSERT INTO `shop_size` VALUES ('10', 'XL', 'XL');
INSERT INTO `shop_size` VALUES ('11', '均码', '均码');
INSERT INTO `shop_size` VALUES ('12', '150', '150');
INSERT INTO `shop_size` VALUES ('13', '160', '160');
INSERT INTO `shop_size` VALUES ('14', '165', '165');
INSERT INTO `shop_size` VALUES ('15', '170', '170');

-- ----------------------------
-- Table structure for shop_store
-- ----------------------------
DROP TABLE IF EXISTS `shop_store`;
CREATE TABLE `shop_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(10) unsigned NOT NULL,
  `color_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_store_color_id_d369b394` (`color_id`),
  KEY `shop_store_goods_id_a707e16c` (`goods_id`),
  CONSTRAINT `shop_store_color_id_d369b394_fk_shop_color_id` FOREIGN KEY (`color_id`) REFERENCES `shop_color` (`id`),
  CONSTRAINT `shop_store_goods_id_a707e16c_fk_shop_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `shop_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store
-- ----------------------------
INSERT INTO `shop_store` VALUES ('6', '100', '21', '5');
INSERT INTO `shop_store` VALUES ('8', '100', '22', '5');
INSERT INTO `shop_store` VALUES ('9', '100', '23', '5');
INSERT INTO `shop_store` VALUES ('10', '100', '24', '6');
INSERT INTO `shop_store` VALUES ('11', '100', '25', '6');
INSERT INTO `shop_store` VALUES ('12', '100', '26', '7');
INSERT INTO `shop_store` VALUES ('13', '100', '27', '8');
INSERT INTO `shop_store` VALUES ('14', '100', '28', '9');
INSERT INTO `shop_store` VALUES ('15', '100', '29', '10');
INSERT INTO `shop_store` VALUES ('16', '100', '30', '10');
INSERT INTO `shop_store` VALUES ('17', '100', '31', '10');
INSERT INTO `shop_store` VALUES ('18', '100', '32', '11');
INSERT INTO `shop_store` VALUES ('19', '100', '33', '12');
INSERT INTO `shop_store` VALUES ('20', '100', '34', '12');
INSERT INTO `shop_store` VALUES ('21', '100', '35', '12');
INSERT INTO `shop_store` VALUES ('22', '100', '36', '13');
INSERT INTO `shop_store` VALUES ('23', '100', '37', '13');
INSERT INTO `shop_store` VALUES ('24', '100', '38', '14');
INSERT INTO `shop_store` VALUES ('25', '100', '39', '14');
INSERT INTO `shop_store` VALUES ('26', '100', '40', '15');
INSERT INTO `shop_store` VALUES ('27', '100', '41', '15');
INSERT INTO `shop_store` VALUES ('28', '100', '42', '16');
INSERT INTO `shop_store` VALUES ('29', '100', '43', '16');
INSERT INTO `shop_store` VALUES ('30', '100', '44', '16');
INSERT INTO `shop_store` VALUES ('31', '100', '45', '17');
INSERT INTO `shop_store` VALUES ('32', '100', '46', '18');
INSERT INTO `shop_store` VALUES ('33', '100', '47', '18');
INSERT INTO `shop_store` VALUES ('34', '100', '48', '18');
INSERT INTO `shop_store` VALUES ('35', '100', '49', '18');
INSERT INTO `shop_store` VALUES ('36', '100', '50', '19');
INSERT INTO `shop_store` VALUES ('37', '100', '51', '19');
INSERT INTO `shop_store` VALUES ('38', '100', '52', '19');
INSERT INTO `shop_store` VALUES ('39', '100', '53', '20');
INSERT INTO `shop_store` VALUES ('40', '100', '54', '21');
INSERT INTO `shop_store` VALUES ('41', '100', '55', '22');
INSERT INTO `shop_store` VALUES ('42', '100', '56', '23');
INSERT INTO `shop_store` VALUES ('43', '100', '57', '24');
INSERT INTO `shop_store` VALUES ('44', '100', '58', '24');
INSERT INTO `shop_store` VALUES ('45', '100', '59', '24');
INSERT INTO `shop_store` VALUES ('46', '100', '60', '25');
INSERT INTO `shop_store` VALUES ('47', '100', '61', '25');
INSERT INTO `shop_store` VALUES ('48', '100', '62', '26');
INSERT INTO `shop_store` VALUES ('49', '100', '63', '26');
INSERT INTO `shop_store` VALUES ('50', '100', '64', '26');
INSERT INTO `shop_store` VALUES ('51', '100', '65', '26');

-- ----------------------------
-- Table structure for shop_store_size
-- ----------------------------
DROP TABLE IF EXISTS `shop_store_size`;
CREATE TABLE `shop_store_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_store_size_store_id_size_id_6f364186_uniq` (`store_id`,`size_id`),
  KEY `shop_store_size_size_id_aacfbe35_fk_shop_size_id` (`size_id`),
  CONSTRAINT `shop_store_size_size_id_aacfbe35_fk_shop_size_id` FOREIGN KEY (`size_id`) REFERENCES `shop_size` (`id`),
  CONSTRAINT `shop_store_size_store_id_cb5a9e52_fk_shop_store_id` FOREIGN KEY (`store_id`) REFERENCES `shop_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_store_size
-- ----------------------------
INSERT INTO `shop_store_size` VALUES ('4', '6', '6');
INSERT INTO `shop_store_size` VALUES ('1', '6', '8');
INSERT INTO `shop_store_size` VALUES ('2', '6', '9');
INSERT INTO `shop_store_size` VALUES ('3', '6', '10');
INSERT INTO `shop_store_size` VALUES ('8', '8', '6');
INSERT INTO `shop_store_size` VALUES ('5', '8', '8');
INSERT INTO `shop_store_size` VALUES ('6', '8', '9');
INSERT INTO `shop_store_size` VALUES ('7', '8', '10');
INSERT INTO `shop_store_size` VALUES ('9', '9', '8');
INSERT INTO `shop_store_size` VALUES ('10', '9', '9');
INSERT INTO `shop_store_size` VALUES ('11', '9', '10');
INSERT INTO `shop_store_size` VALUES ('16', '10', '6');
INSERT INTO `shop_store_size` VALUES ('13', '10', '8');
INSERT INTO `shop_store_size` VALUES ('14', '10', '9');
INSERT INTO `shop_store_size` VALUES ('15', '10', '10');
INSERT INTO `shop_store_size` VALUES ('20', '11', '6');
INSERT INTO `shop_store_size` VALUES ('17', '11', '8');
INSERT INTO `shop_store_size` VALUES ('18', '11', '9');
INSERT INTO `shop_store_size` VALUES ('19', '11', '10');
INSERT INTO `shop_store_size` VALUES ('24', '12', '6');
INSERT INTO `shop_store_size` VALUES ('21', '12', '8');
INSERT INTO `shop_store_size` VALUES ('22', '12', '9');
INSERT INTO `shop_store_size` VALUES ('23', '12', '10');
INSERT INTO `shop_store_size` VALUES ('28', '13', '6');
INSERT INTO `shop_store_size` VALUES ('25', '13', '8');
INSERT INTO `shop_store_size` VALUES ('26', '13', '9');
INSERT INTO `shop_store_size` VALUES ('27', '13', '10');
INSERT INTO `shop_store_size` VALUES ('31', '14', '6');
INSERT INTO `shop_store_size` VALUES ('29', '14', '8');
INSERT INTO `shop_store_size` VALUES ('30', '14', '9');
INSERT INTO `shop_store_size` VALUES ('35', '15', '6');
INSERT INTO `shop_store_size` VALUES ('32', '15', '8');
INSERT INTO `shop_store_size` VALUES ('33', '15', '9');
INSERT INTO `shop_store_size` VALUES ('34', '15', '10');
INSERT INTO `shop_store_size` VALUES ('38', '16', '6');
INSERT INTO `shop_store_size` VALUES ('36', '16', '8');
INSERT INTO `shop_store_size` VALUES ('37', '16', '9');
INSERT INTO `shop_store_size` VALUES ('42', '17', '6');
INSERT INTO `shop_store_size` VALUES ('39', '17', '8');
INSERT INTO `shop_store_size` VALUES ('40', '17', '9');
INSERT INTO `shop_store_size` VALUES ('41', '17', '10');
INSERT INTO `shop_store_size` VALUES ('43', '18', '8');
INSERT INTO `shop_store_size` VALUES ('44', '18', '9');
INSERT INTO `shop_store_size` VALUES ('45', '18', '10');
INSERT INTO `shop_store_size` VALUES ('49', '19', '6');
INSERT INTO `shop_store_size` VALUES ('46', '19', '8');
INSERT INTO `shop_store_size` VALUES ('47', '19', '9');
INSERT INTO `shop_store_size` VALUES ('48', '19', '10');
INSERT INTO `shop_store_size` VALUES ('53', '20', '6');
INSERT INTO `shop_store_size` VALUES ('50', '20', '8');
INSERT INTO `shop_store_size` VALUES ('51', '20', '9');
INSERT INTO `shop_store_size` VALUES ('52', '20', '10');
INSERT INTO `shop_store_size` VALUES ('57', '21', '6');
INSERT INTO `shop_store_size` VALUES ('54', '21', '8');
INSERT INTO `shop_store_size` VALUES ('55', '21', '9');
INSERT INTO `shop_store_size` VALUES ('56', '21', '10');
INSERT INTO `shop_store_size` VALUES ('61', '22', '6');
INSERT INTO `shop_store_size` VALUES ('58', '22', '8');
INSERT INTO `shop_store_size` VALUES ('59', '22', '9');
INSERT INTO `shop_store_size` VALUES ('60', '22', '10');
INSERT INTO `shop_store_size` VALUES ('65', '23', '6');
INSERT INTO `shop_store_size` VALUES ('62', '23', '8');
INSERT INTO `shop_store_size` VALUES ('63', '23', '9');
INSERT INTO `shop_store_size` VALUES ('64', '23', '10');
INSERT INTO `shop_store_size` VALUES ('69', '24', '6');
INSERT INTO `shop_store_size` VALUES ('66', '24', '8');
INSERT INTO `shop_store_size` VALUES ('67', '24', '9');
INSERT INTO `shop_store_size` VALUES ('68', '24', '10');
INSERT INTO `shop_store_size` VALUES ('73', '25', '6');
INSERT INTO `shop_store_size` VALUES ('70', '25', '8');
INSERT INTO `shop_store_size` VALUES ('71', '25', '9');
INSERT INTO `shop_store_size` VALUES ('72', '25', '10');
INSERT INTO `shop_store_size` VALUES ('74', '26', '8');
INSERT INTO `shop_store_size` VALUES ('75', '26', '9');
INSERT INTO `shop_store_size` VALUES ('76', '26', '10');
INSERT INTO `shop_store_size` VALUES ('77', '27', '8');
INSERT INTO `shop_store_size` VALUES ('78', '27', '9');
INSERT INTO `shop_store_size` VALUES ('82', '28', '6');
INSERT INTO `shop_store_size` VALUES ('79', '28', '8');
INSERT INTO `shop_store_size` VALUES ('80', '28', '9');
INSERT INTO `shop_store_size` VALUES ('81', '28', '10');
INSERT INTO `shop_store_size` VALUES ('86', '29', '6');
INSERT INTO `shop_store_size` VALUES ('83', '29', '8');
INSERT INTO `shop_store_size` VALUES ('84', '29', '9');
INSERT INTO `shop_store_size` VALUES ('85', '29', '10');
INSERT INTO `shop_store_size` VALUES ('90', '30', '6');
INSERT INTO `shop_store_size` VALUES ('87', '30', '8');
INSERT INTO `shop_store_size` VALUES ('88', '30', '9');
INSERT INTO `shop_store_size` VALUES ('89', '30', '10');
INSERT INTO `shop_store_size` VALUES ('94', '31', '6');
INSERT INTO `shop_store_size` VALUES ('91', '31', '8');
INSERT INTO `shop_store_size` VALUES ('92', '31', '9');
INSERT INTO `shop_store_size` VALUES ('93', '31', '10');
INSERT INTO `shop_store_size` VALUES ('98', '32', '6');
INSERT INTO `shop_store_size` VALUES ('95', '32', '8');
INSERT INTO `shop_store_size` VALUES ('96', '32', '9');
INSERT INTO `shop_store_size` VALUES ('97', '32', '10');
INSERT INTO `shop_store_size` VALUES ('102', '33', '6');
INSERT INTO `shop_store_size` VALUES ('99', '33', '8');
INSERT INTO `shop_store_size` VALUES ('100', '33', '9');
INSERT INTO `shop_store_size` VALUES ('101', '33', '10');
INSERT INTO `shop_store_size` VALUES ('106', '34', '6');
INSERT INTO `shop_store_size` VALUES ('103', '34', '8');
INSERT INTO `shop_store_size` VALUES ('104', '34', '9');
INSERT INTO `shop_store_size` VALUES ('105', '34', '10');
INSERT INTO `shop_store_size` VALUES ('110', '35', '6');
INSERT INTO `shop_store_size` VALUES ('107', '35', '8');
INSERT INTO `shop_store_size` VALUES ('108', '35', '9');
INSERT INTO `shop_store_size` VALUES ('109', '35', '10');
INSERT INTO `shop_store_size` VALUES ('114', '36', '6');
INSERT INTO `shop_store_size` VALUES ('111', '36', '8');
INSERT INTO `shop_store_size` VALUES ('112', '36', '9');
INSERT INTO `shop_store_size` VALUES ('113', '36', '10');
INSERT INTO `shop_store_size` VALUES ('118', '37', '6');
INSERT INTO `shop_store_size` VALUES ('115', '37', '8');
INSERT INTO `shop_store_size` VALUES ('116', '37', '9');
INSERT INTO `shop_store_size` VALUES ('117', '37', '10');
INSERT INTO `shop_store_size` VALUES ('122', '38', '6');
INSERT INTO `shop_store_size` VALUES ('119', '38', '8');
INSERT INTO `shop_store_size` VALUES ('120', '38', '9');
INSERT INTO `shop_store_size` VALUES ('121', '38', '10');
INSERT INTO `shop_store_size` VALUES ('123', '39', '8');
INSERT INTO `shop_store_size` VALUES ('124', '39', '9');
INSERT INTO `shop_store_size` VALUES ('125', '39', '10');
INSERT INTO `shop_store_size` VALUES ('128', '40', '6');
INSERT INTO `shop_store_size` VALUES ('126', '40', '8');
INSERT INTO `shop_store_size` VALUES ('127', '40', '9');
INSERT INTO `shop_store_size` VALUES ('132', '41', '6');
INSERT INTO `shop_store_size` VALUES ('129', '41', '8');
INSERT INTO `shop_store_size` VALUES ('130', '41', '9');
INSERT INTO `shop_store_size` VALUES ('131', '41', '10');
INSERT INTO `shop_store_size` VALUES ('133', '42', '8');
INSERT INTO `shop_store_size` VALUES ('134', '43', '11');
INSERT INTO `shop_store_size` VALUES ('137', '44', '11');
INSERT INTO `shop_store_size` VALUES ('138', '45', '11');
INSERT INTO `shop_store_size` VALUES ('142', '46', '6');
INSERT INTO `shop_store_size` VALUES ('139', '46', '8');
INSERT INTO `shop_store_size` VALUES ('140', '46', '9');
INSERT INTO `shop_store_size` VALUES ('141', '46', '10');
INSERT INTO `shop_store_size` VALUES ('146', '47', '6');
INSERT INTO `shop_store_size` VALUES ('143', '47', '8');
INSERT INTO `shop_store_size` VALUES ('144', '47', '9');
INSERT INTO `shop_store_size` VALUES ('145', '47', '10');
INSERT INTO `shop_store_size` VALUES ('147', '48', '12');
INSERT INTO `shop_store_size` VALUES ('148', '48', '13');
INSERT INTO `shop_store_size` VALUES ('149', '48', '14');
INSERT INTO `shop_store_size` VALUES ('150', '48', '15');
INSERT INTO `shop_store_size` VALUES ('151', '49', '12');
INSERT INTO `shop_store_size` VALUES ('152', '49', '13');
INSERT INTO `shop_store_size` VALUES ('153', '49', '14');
INSERT INTO `shop_store_size` VALUES ('154', '49', '15');
INSERT INTO `shop_store_size` VALUES ('155', '50', '12');
INSERT INTO `shop_store_size` VALUES ('156', '50', '13');
INSERT INTO `shop_store_size` VALUES ('157', '50', '14');
INSERT INTO `shop_store_size` VALUES ('158', '50', '15');
INSERT INTO `shop_store_size` VALUES ('159', '51', '12');
INSERT INTO `shop_store_size` VALUES ('160', '51', '13');
INSERT INTO `shop_store_size` VALUES ('161', '51', '14');
INSERT INTO `shop_store_size` VALUES ('162', '51', '15');

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO `shop_user` VALUES ('1', 'admin@sxt.com', 'admin');
