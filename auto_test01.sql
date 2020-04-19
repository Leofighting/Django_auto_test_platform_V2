/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : auto_test01

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 19/04/2020 09:35:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_test_apis
-- ----------------------------
DROP TABLE IF EXISTS `api_test_apis`;
CREATE TABLE `api_test_apis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_param_value` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_result` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_status` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_test_apis_product_id_9b14e376_fk_product_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `api_test_apis_product_id_9b14e376_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_test_apis
-- ----------------------------
INSERT INTO `api_test_apis` VALUES (1, '登陆', '127.0.0.1:8000/login', 'null', '0', 'login', 0, '2020-04-16 02:24:05.302231', 4);

-- ----------------------------
-- Table structure for api_test_apistep
-- ----------------------------
DROP TABLE IF EXISTS `api_test_apistep`;
CREATE TABLE `api_test_apistep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_step` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_param_value` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_result` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_status` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `api_test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_test_apistep_api_test_id_e8f130d6_fk_api_test_apitest_id`(`api_test_id`) USING BTREE,
  CONSTRAINT `api_test_apistep_api_test_id_e8f130d6_fk_api_test_apitest_id` FOREIGN KEY (`api_test_id`) REFERENCES `api_test_apitest` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_test_apistep
-- ----------------------------
INSERT INTO `api_test_apistep` VALUES (1, '登录', '127.0.0.1:8000/login', '01', 'null', 'get', '跳转到登陆页面', 0, '2020-04-15 06:48:36.633880', 1);

-- ----------------------------
-- Table structure for api_test_apitest
-- ----------------------------
DROP TABLE IF EXISTS `api_test_apitest`;
CREATE TABLE `api_test_apitest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_test_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_test_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_tester` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_test_result` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `api_test_apitest_product_id_402331af_fk_product_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `api_test_apitest_product_id_402331af_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_test_apitest
-- ----------------------------
INSERT INTO `api_test_apitest` VALUES (1, '登录购物支付', '测试流程接口', 'LEO', 0, '2020-04-15 06:48:36.632854', 4);

-- ----------------------------
-- Table structure for app_test_appcase
-- ----------------------------
DROP TABLE IF EXISTS `app_test_appcase`;
CREATE TABLE `app_test_appcase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_case_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_test_result` tinyint(1) NOT NULL,
  `app_tester` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_test_appcase_product_id_9d1421df_fk_product_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `app_test_appcase_product_id_9d1421df_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_test_appcase
-- ----------------------------
INSERT INTO `app_test_appcase` VALUES (1, '使用计算器，计算1+1=2', 0, 'LEO', '2020-04-16 06:34:20.921148', 3);

-- ----------------------------
-- Table structure for app_test_appcasestep
-- ----------------------------
DROP TABLE IF EXISTS `app_test_appcasestep`;
CREATE TABLE `app_test_appcasestep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_test_step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_test_obj_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_find_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_element` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_opt_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_test_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_assert_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_test_result` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `app_case_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_test_appcasestep_app_case_id_d0a40409_fk_app_test_appcase_id`(`app_case_id`) USING BTREE,
  CONSTRAINT `app_test_appcasestep_app_case_id_d0a40409_fk_app_test_appcase_id` FOREIGN KEY (`app_case_id`) REFERENCES `app_test_appcase` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_test_appcasestep
-- ----------------------------
INSERT INTO `app_test_appcasestep` VALUES (1, '01', '输入1', 'find_element_by_name', 'one', 'click', '1', '1', 0, '2020-04-16 06:32:12.363919', 1);
INSERT INTO `app_test_appcasestep` VALUES (2, '02', '输入+', 'find_element_by_name', 'plus', 'click', '+', '+', 0, '2020-04-16 06:34:20.922138', 1);
INSERT INTO `app_test_appcasestep` VALUES (3, '03', '输入1', 'find_element_by_name', 'one', 'click', '1', '1', 0, '2020-04-16 06:34:20.923116', 1);
INSERT INTO `app_test_appcasestep` VALUES (4, '04', '输入=', 'find_element_by_name', 'equal', 'click', '=', '=', 0, '2020-04-16 06:34:20.923116', 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add 产品管理', 7, 'add_product');
INSERT INTO `auth_permission` VALUES (20, 'Can change 产品管理', 7, 'change_product');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 产品管理', 7, 'delete_product');
INSERT INTO `auth_permission` VALUES (22, 'Can add 流程场景接口', 8, 'add_apitest');
INSERT INTO `auth_permission` VALUES (23, 'Can change 流程场景接口', 8, 'change_apitest');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 流程场景接口', 8, 'delete_apitest');
INSERT INTO `auth_permission` VALUES (25, 'Can add api step', 9, 'add_apistep');
INSERT INTO `auth_permission` VALUES (26, 'Can change api step', 9, 'change_apistep');
INSERT INTO `auth_permission` VALUES (27, 'Can delete api step', 9, 'delete_apistep');
INSERT INTO `auth_permission` VALUES (28, 'Can add 单一场景接口', 10, 'add_apis');
INSERT INTO `auth_permission` VALUES (29, 'Can change 单一场景接口', 10, 'change_apis');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 单一场景接口', 10, 'delete_apis');
INSERT INTO `auth_permission` VALUES (31, 'Can add bug 管理', 11, 'add_bug');
INSERT INTO `auth_permission` VALUES (32, 'Can change bug 管理', 11, 'change_bug');
INSERT INTO `auth_permission` VALUES (33, 'Can delete bug 管理', 11, 'delete_bug');
INSERT INTO `auth_permission` VALUES (34, 'Can add 系统设置', 12, 'add_set');
INSERT INTO `auth_permission` VALUES (35, 'Can change 系统设置', 12, 'change_set');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 系统设置', 12, 'delete_set');
INSERT INTO `auth_permission` VALUES (37, 'Can add app 测试用例', 13, 'add_appcase');
INSERT INTO `auth_permission` VALUES (38, 'Can change app 测试用例', 13, 'change_appcase');
INSERT INTO `auth_permission` VALUES (39, 'Can delete app 测试用例', 13, 'delete_appcase');
INSERT INTO `auth_permission` VALUES (40, 'Can add app case step', 14, 'add_appcasestep');
INSERT INTO `auth_permission` VALUES (41, 'Can change app case step', 14, 'change_appcasestep');
INSERT INTO `auth_permission` VALUES (42, 'Can delete app case step', 14, 'delete_appcasestep');
INSERT INTO `auth_permission` VALUES (43, 'Can add web 测试用例', 15, 'add_webcase');
INSERT INTO `auth_permission` VALUES (44, 'Can change web 测试用例', 15, 'change_webcase');
INSERT INTO `auth_permission` VALUES (45, 'Can delete web 测试用例', 15, 'delete_webcase');
INSERT INTO `auth_permission` VALUES (46, 'Can add web case step', 16, 'add_webcasestep');
INSERT INTO `auth_permission` VALUES (47, 'Can change web case step', 16, 'change_webcasestep');
INSERT INTO `auth_permission` VALUES (48, 'Can delete web case step', 16, 'delete_webcasestep');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$100000$kMlJixaXIkEM$xwgqa2ipd9kDsfwWEu1Q/BBxWTRMAfN3EecP7kZNOA8=', '2020-04-19 00:41:47.818505', 1, 'admin', '', '', 'test@163.com', 1, 1, '2020-04-15 05:56:32.232872');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bug_bug
-- ----------------------------
DROP TABLE IF EXISTS `bug_bug`;
CREATE TABLE `bug_bug`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bug_detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bug_status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_creat` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bug_assign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bug_bug_product_id_a0410aad_fk_product_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `bug_bug_product_id_a0410aad_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bug_bug
-- ----------------------------
INSERT INTO `bug_bug` VALUES (1, 'bug01', 'bug 测试01', '激活', '3', 'LEO', 'TOM', '2020-04-16 03:05:29.904061', 4);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-04-15 06:10:22.770782', '1', 'web产品', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-04-15 06:10:45.092142', '2', '自动化平台', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-04-15 06:10:54.160879', '3', 'APP 产品', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-04-15 06:11:03.952674', '4', '商城', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-04-15 06:48:36.634849', '1', '登录购物支付', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"api step\", \"object\": \"\\u767b\\u5f55\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-04-16 02:24:05.304226', '1', '登陆', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-04-16 03:05:29.905086', '1', 'bug01', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-04-16 06:03:29.601789', '1', 'seturl', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-04-16 06:32:12.363919', '1', '使用计算器，计算1+1=2', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"app case step\", \"object\": \"01\"}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-04-16 06:34:20.924113', '1', '使用计算器，计算1+1=2', 2, '[{\"added\": {\"name\": \"app case step\", \"object\": \"02\"}}, {\"added\": {\"name\": \"app case step\", \"object\": \"03\"}}, {\"added\": {\"name\": \"app case step\", \"object\": \"04\"}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-04-17 01:46:27.429991', '1', '搜索：自动化测试', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"web case step\", \"object\": \"\\u5728\\u8f93\\u5165\\u6846\\u8f93\\u5165\\u5185\\u5bb9\"}}, {\"added\": {\"name\": \"web case step\", \"object\": \"\\u641c\\u7d22 \\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\"}}]', 15, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (10, 'api_test', 'apis');
INSERT INTO `django_content_type` VALUES (9, 'api_test', 'apistep');
INSERT INTO `django_content_type` VALUES (8, 'api_test', 'apitest');
INSERT INTO `django_content_type` VALUES (13, 'app_test', 'appcase');
INSERT INTO `django_content_type` VALUES (14, 'app_test', 'appcasestep');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (11, 'bug', 'bug');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'product', 'product');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'set', 'set');
INSERT INTO `django_content_type` VALUES (15, 'web_test', 'webcase');
INSERT INTO `django_content_type` VALUES (16, 'web_test', 'webcasestep');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-04-15 05:55:55.858127');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-04-15 05:55:56.656990');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-04-15 05:55:56.976137');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-04-15 05:55:56.986139');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2020-04-15 05:55:57.123770');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2020-04-15 05:55:57.205552');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2020-04-15 05:55:57.230492');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2020-04-15 05:55:57.238437');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2020-04-15 05:55:57.314262');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2020-04-15 05:55:57.319219');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2020-04-15 05:55:57.329222');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2020-04-15 05:55:57.437902');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2020-04-15 05:55:57.544617');
INSERT INTO `django_migrations` VALUES (14, 'sessions', '0001_initial', '2020-04-15 05:55:57.614431');
INSERT INTO `django_migrations` VALUES (15, 'product', '0001_initial', '2020-04-15 06:08:58.784347');
INSERT INTO `django_migrations` VALUES (16, 'api_test', '0001_initial', '2020-04-15 06:40:18.385032');
INSERT INTO `django_migrations` VALUES (17, 'api_test', '0002_apis', '2020-04-16 02:22:23.897186');
INSERT INTO `django_migrations` VALUES (18, 'bug', '0001_initial', '2020-04-16 02:46:32.549502');
INSERT INTO `django_migrations` VALUES (19, 'bug', '0002_auto_20200416_1400', '2020-04-16 06:00:44.150718');
INSERT INTO `django_migrations` VALUES (20, 'set', '0001_initial', '2020-04-16 06:00:44.249422');
INSERT INTO `django_migrations` VALUES (21, 'app_test', '0001_initial', '2020-04-16 06:28:36.890190');
INSERT INTO `django_migrations` VALUES (22, 'api_test', '0003_auto_20200417_0906', '2020-04-17 01:07:01.235395');
INSERT INTO `django_migrations` VALUES (23, 'api_test', '0004_auto_20200417_0936', '2020-04-17 01:36:21.975109');
INSERT INTO `django_migrations` VALUES (24, 'app_test', '0002_auto_20200417_0936', '2020-04-17 01:36:22.085785');
INSERT INTO `django_migrations` VALUES (25, 'web_test', '0001_initial', '2020-04-17 01:36:22.318162');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('bzzsx7t4n723biz6dpfoi1a1prb5b54d', 'OGVkNThiZDM5ZTY4YmNhNzc4NDZmYzczNWM2Njg3MDJhYTIwZjNjODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwM2MwZjg5MzRhMDRiNTQ0NWE1ZDMxZjNmODhiMDYxNTEyZWQyNjNiIiwidXNlciI6ImFkbWluIn0=', '2020-05-03 00:41:47.919235');

-- ----------------------------
-- Table structure for product_product
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_owner` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_product
-- ----------------------------
INSERT INTO `product_product` VALUES (1, 'web产品', '百度搜索', 'LEO', '2020-04-15 06:10:22.769784');
INSERT INTO `product_product` VALUES (2, '自动化平台', '包括 API， WebUI、AppUI自动化测试', 'LEO', '2020-04-15 06:10:45.091103');
INSERT INTO `product_product` VALUES (3, 'APP 产品', '计算器，csdn', 'LEO', '2020-04-15 06:10:54.160879');
INSERT INTO `product_product` VALUES (4, '商城', '图书', 'LEO', '2020-04-15 06:11:03.951676');

-- ----------------------------
-- Table structure for set_set
-- ----------------------------
DROP TABLE IF EXISTS `set_set`;
CREATE TABLE `set_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `set_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_set
-- ----------------------------
INSERT INTO `set_set` VALUES (1, 'seturl', '127.0.0.1:8000');

-- ----------------------------
-- Table structure for web_test_webcase
-- ----------------------------
DROP TABLE IF EXISTS `web_test_webcase`;
CREATE TABLE `web_test_webcase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_case_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_test_result` tinyint(1) NOT NULL,
  `web_tester` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_test_webcase_product_id_7dd15c96_fk_product_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `web_test_webcase_product_id_7dd15c96_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_test_webcase
-- ----------------------------
INSERT INTO `web_test_webcase` VALUES (1, '搜索：自动化测试', 0, 'LEO', '2020-04-17 01:46:27.426999', 1);

-- ----------------------------
-- Table structure for web_test_webcasestep
-- ----------------------------
DROP TABLE IF EXISTS `web_test_webcasestep`;
CREATE TABLE `web_test_webcasestep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_case_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_test_step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_test_obj_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_find_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_element` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_opt_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_test_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `web_assert_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `web_test_result` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `web_case_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_test_webcasestep_web_case_id_434c3cc1_fk_web_test_webcase_id`(`web_case_id`) USING BTREE,
  CONSTRAINT `web_test_webcasestep_web_case_id_434c3cc1_fk_web_test_webcase_id` FOREIGN KEY (`web_case_id`) REFERENCES `web_test_webcase` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_test_webcasestep
-- ----------------------------
INSERT INTO `web_test_webcasestep` VALUES (1, '在输入框输入内容', '01', '输入', 'find_element_by_id', 'search', 'send_keys', '自动化测试', '自动化数据', 0, '2020-04-17 01:46:27.429019', 1);
INSERT INTO `web_test_webcasestep` VALUES (2, '搜索 自动化测试', '02', '点击搜素', 'find_element_by_id', 'search_button', 'click', 'null', 'null', 0, '2020-04-17 01:46:27.429019', 1);

SET FOREIGN_KEY_CHECKS = 1;
