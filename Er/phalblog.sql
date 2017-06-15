/*
Navicat MySQL Data Transfer

Source Server         : phpstudy
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : phalblog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-06-15 23:52:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '权限父id',
  `ismenu` int(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限图标',
  `issort` int(255) NOT NULL DEFAULT '0' COMMENT '权限排序',
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '0', '1', '主页管理', 'admin/manage', '主页管理', 'fa fa-home', '1', null, '2017-04-11 20:28:42', '2017-06-11 23:42:02');
INSERT INTO `permissions` VALUES ('2', '0', '1', '权限管理', 'rbac/manage', '权限管理', 'fa fa-sitemap', '1', null, '2017-04-11 20:29:47', '2017-06-11 23:39:22');
INSERT INTO `permissions` VALUES ('3', '1', '1', '网站主页', 'admin/index', '网站主页', 'fa fa-home', '0', null, '2017-04-13 17:02:54', '2017-06-11 23:42:29');
INSERT INTO `permissions` VALUES ('4', '2', '1', '管理员管理', 'admin/user', '管理员管理', 'fa fa-user', '1', null, '2017-04-13 11:58:19', '2017-06-12 21:21:27');
INSERT INTO `permissions` VALUES ('5', '2', '1', '角色管理', 'admin/role', '角色管理', 'fa fa-bullhorn', '1', null, '2017-04-13 12:20:44', '2017-06-12 21:21:36');
INSERT INTO `permissions` VALUES ('6', '2', '1', '节点管理', 'admin/permission', '节点管理', 'fa fa-arrows', '1', null, '2017-04-13 12:21:31', '2017-06-12 21:21:45');
INSERT INTO `permissions` VALUES ('7', '6', '0', '节点添加视图', 'admin/permission/create', '节点添加视图', '', '1', null, '2017-04-13 12:22:21', '2017-06-12 21:27:33');
INSERT INTO `permissions` VALUES ('8', '6', '0', '节点添加操作', 'admin/permission/store', '节点添加操作', '', '2', null, '2017-04-13 12:23:11', '2017-06-12 21:28:47');
INSERT INTO `permissions` VALUES ('9', '6', '0', '节点更新视图', 'admin/permission/edit', '节点更新视图', '', '1', null, '2017-04-13 12:24:18', '2017-06-12 21:28:53');
INSERT INTO `permissions` VALUES ('10', '6', '0', '节点更新操作', 'admin/permission/update', '节点更新操作', '', '1', null, '2017-04-13 12:25:02', '2017-06-12 21:30:07');
INSERT INTO `permissions` VALUES ('11', '6', '0', '节点删除', 'admin/permission/destroy', '节点删除', '', '1', null, '2017-04-13 12:25:55', '2017-06-12 21:30:13');
INSERT INTO `permissions` VALUES ('12', '5', '0', '角色添加视图', 'role.create', '角色添加视图', null, '1', null, '2017-04-13 12:32:26', '2017-04-13 12:32:26');
INSERT INTO `permissions` VALUES ('13', '5', '0', '角色添加操作', 'role.store', '角色添加操作', null, '1', null, '2017-04-13 12:44:37', '2017-04-13 12:44:37');
INSERT INTO `permissions` VALUES ('14', '5', '0', '角色更新视图', 'role.edit', '角色更新视图', null, '1', null, '2017-04-13 12:58:03', '2017-04-13 12:58:03');
INSERT INTO `permissions` VALUES ('15', '5', '0', '角色更新操作', 'role.update', '角色更新操作', null, '1', null, '2017-04-13 13:01:53', '2017-04-13 13:01:53');
INSERT INTO `permissions` VALUES ('16', '5', '0', '角色删除操作', 'role.destroy', '角色删除操作', null, '1', null, '2017-04-13 13:07:18', '2017-04-13 13:07:18');
INSERT INTO `permissions` VALUES ('17', '4', '0', '管理员添加视图', 'user.create', '管理员添加视图', null, '1', null, '2017-04-13 13:15:47', '2017-04-13 13:15:47');
INSERT INTO `permissions` VALUES ('18', '4', '0', '管理员添加操作', 'user.store', '管理员添加操作', null, '1', null, '2017-04-13 13:17:28', '2017-04-13 13:17:28');
INSERT INTO `permissions` VALUES ('19', '4', '0', '管理员更新视图', 'user.edit', '管理员更新视图', null, '1', null, '2017-04-13 13:18:14', '2017-04-13 13:18:14');
INSERT INTO `permissions` VALUES ('20', '4', '0', '管理员更新操作', 'user.update', '管理员更新操作', null, '1', null, '2017-04-13 13:18:40', '2017-04-13 13:18:40');
INSERT INTO `permissions` VALUES ('21', '4', '0', '管理员删除操作', 'user.destroy', '管理员删除操作', null, '1', null, '2017-04-13 13:19:58', '2017-04-13 13:19:58');
INSERT INTO `permissions` VALUES ('22', '0', '1', '文章管理', 'article.manage', '文章管理', 'fa fa-calendar-o', '1', null, '2017-04-13 16:39:42', '2017-04-17 13:24:56');
INSERT INTO `permissions` VALUES ('24', '5', '0', '角色权限', 'role.permission', '角色权限', null, '1', null, '2017-04-13 18:53:10', '2017-04-13 18:53:10');
INSERT INTO `permissions` VALUES ('25', '4', '0', '管理员详情', 'user.show', '管理员详情', null, '1', null, '2017-04-17 14:44:39', '2017-04-17 14:44:39');
INSERT INTO `permissions` VALUES ('26', '5', '0', '角色详情', 'role.show', '角色详情', null, '1', null, '2017-04-17 14:45:13', '2017-04-17 14:45:13');
INSERT INTO `permissions` VALUES ('27', '4', '0', '角色分配', 'user.role', '角色分配', null, '1', null, '2017-04-17 15:55:01', '2017-04-17 15:55:01');
INSERT INTO `permissions` VALUES ('28', '22', '1', '文章分类', 'article.category.index', '文章分类管理', 'fa fa-clone', '1', null, '2017-04-17 16:10:38', '2017-04-25 12:03:57');
INSERT INTO `permissions` VALUES ('29', '28', '0', '文章分类添加操作', 'article.category.store', '文章分类添加操作', null, '1', null, '2017-04-18 12:17:03', '2017-04-18 12:17:03');
INSERT INTO `permissions` VALUES ('30', '28', '0', '文章分类添加视图', 'article.category.create', '文章添加视图', null, '1', null, '2017-04-18 12:18:11', '2017-04-18 12:18:11');
INSERT INTO `permissions` VALUES ('31', '28', '0', '文章分类更新视图', 'article.category.edit', '文章分类更新视图', null, '1', null, '2017-04-18 12:19:17', '2017-04-18 12:19:17');
INSERT INTO `permissions` VALUES ('32', '28', '0', '文章分类删除', 'article.category.destroy', '文章分类删除', null, '1', null, '2017-04-18 12:20:24', '2017-04-18 12:20:24');
INSERT INTO `permissions` VALUES ('33', '0', '1', '网站管理', 'web.manage', '网站管理', 'fa fa-edge', '1', '', '2017-04-18 14:59:08', '2017-04-18 15:02:00');
INSERT INTO `permissions` VALUES ('40', '22', '1', '文章列表', 'article.index', '文章列表', 'fa fa-reorder', '1', null, '2017-04-19 12:05:05', '2017-04-19 12:05:05');
INSERT INTO `permissions` VALUES ('41', '40', '0', '文章添加视图', 'article.create', '文章添加视图', null, '1', null, '2017-04-19 12:06:23', '2017-04-19 12:06:23');
INSERT INTO `permissions` VALUES ('42', '40', '0', '文章添加操作', 'article.store', '文章添加操作', null, '1', null, '2017-04-19 12:07:10', '2017-04-19 12:07:10');
INSERT INTO `permissions` VALUES ('43', '40', '0', '文章更新视图', 'article.edit', '文章更新视图', null, '1', null, '2017-04-19 12:07:57', '2017-04-19 12:07:57');
INSERT INTO `permissions` VALUES ('44', '40', '0', '文章更新操作', 'article.update', '文章更新操作', null, '1', null, '2017-04-19 12:09:18', '2017-04-19 12:09:18');
INSERT INTO `permissions` VALUES ('45', '40', '0', '文章删除', 'article.destroy', '文章删除', null, '1', null, '2017-04-19 12:10:02', '2017-04-19 13:05:20');
INSERT INTO `permissions` VALUES ('84', '0', '1', '会员管理', 'member.manage', '会员管理', 'fa fa-user', '1', null, '2017-04-25 16:28:35', '2017-04-25 16:28:35');
INSERT INTO `permissions` VALUES ('85', '84', '1', '会员列表', 'member.index', '会员列表', 'fa fa-navicon', '1', null, '2017-04-25 16:30:02', '2017-04-25 16:30:02');
INSERT INTO `permissions` VALUES ('86', '85', '0', '会员添加视图', 'member.create', '会员添加视图', null, '1', null, '2017-04-25 16:30:52', '2017-04-25 16:30:52');
INSERT INTO `permissions` VALUES ('87', '85', '0', '会员添加操作', 'member.store', '会员添加操作', null, '1', null, '2017-04-25 16:31:27', '2017-04-25 16:31:27');
INSERT INTO `permissions` VALUES ('88', '85', '0', '会员编辑视图', 'member.edit', '会员编辑视图', null, '1', null, '2017-04-25 16:32:12', '2017-04-25 16:32:12');
INSERT INTO `permissions` VALUES ('89', '85', '0', '会员编辑操作', 'member.update', '会员编辑操作', null, '1', null, '2017-04-25 16:32:46', '2017-04-25 16:32:46');
INSERT INTO `permissions` VALUES ('90', '85', '0', '会员删除操作', 'member.destroy', '会员删除操作', null, '1', null, '2017-04-25 16:33:50', '2017-04-25 16:33:50');
INSERT INTO `permissions` VALUES ('92', '85', '0', '会员启用禁用', 'member.switch', '会员启用禁用', null, '1', null, '2017-04-26 19:24:19', '2017-04-26 19:24:19');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', 'admin', '超级管理员', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles` VALUES ('2', '普通用户', 'user', '普通用户', '1', '2017-04-07 13:07:50', '2017-04-19 12:45:21');
INSERT INTO `roles` VALUES ('4', '八斗管理员', 'badou', '八斗管理员', '1', '2017-05-04 19:20:10', '2017-05-04 19:20:10');

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES ('1', '1', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('2', '2', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('3', '3', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('4', '4', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('5', '5', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('6', '6', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('7', '7', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('8', '8', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('9', '9', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('10', '10', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('11', '11', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('12', '12', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('13', '13', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('14', '14', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('15', '15', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('16', '16', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('17', '17', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('18', '18', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('19', '19', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('20', '20', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('21', '21', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('22', '22', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('53', '32', '1', '2017-04-18 12:20:36', '2017-04-18 12:20:36');
INSERT INTO `roles_permissions` VALUES ('24', '24', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('25', '25', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('26', '26', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_permissions` VALUES ('52', '31', '1', '2017-04-18 12:20:36', '2017-04-18 12:20:36');
INSERT INTO `roles_permissions` VALUES ('51', '30', '1', '2017-04-18 12:20:36', '2017-04-18 12:20:36');
INSERT INTO `roles_permissions` VALUES ('49', '28', '1', '2017-04-17 17:43:48', '2017-04-17 17:43:48');
INSERT INTO `roles_permissions` VALUES ('50', '29', '1', '2017-04-18 12:20:36', '2017-04-18 12:20:36');
INSERT INTO `roles_permissions` VALUES ('196', '44', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('195', '43', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('194', '42', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('193', '41', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('192', '40', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('191', '32', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('190', '31', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('189', '30', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('188', '29', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('76', '33', '2', '2017-04-19 12:45:55', '2017-04-19 12:45:55');
INSERT INTO `roles_permissions` VALUES ('187', '28', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('186', '22', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('185', '11', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('184', '10', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('183', '9', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('182', '8', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('181', '7', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('180', '6', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('179', '26', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('178', '24', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('108', '38', '2', '2017-04-21 15:18:25', '2017-04-21 15:18:25');
INSERT INTO `roles_permissions` VALUES ('107', '37', '2', '2017-04-21 15:18:25', '2017-04-21 15:18:25');
INSERT INTO `roles_permissions` VALUES ('60', '40', '1', '2017-04-19 12:10:20', '2017-04-19 12:10:20');
INSERT INTO `roles_permissions` VALUES ('61', '41', '1', '2017-04-19 12:10:20', '2017-04-19 12:10:20');
INSERT INTO `roles_permissions` VALUES ('62', '42', '1', '2017-04-19 12:10:20', '2017-04-19 12:10:20');
INSERT INTO `roles_permissions` VALUES ('63', '43', '1', '2017-04-19 12:10:20', '2017-04-19 12:10:20');
INSERT INTO `roles_permissions` VALUES ('64', '44', '1', '2017-04-19 12:10:20', '2017-04-19 12:10:20');
INSERT INTO `roles_permissions` VALUES ('82', '45', '1', '2017-04-19 12:53:54', '2017-04-19 12:53:54');
INSERT INTO `roles_permissions` VALUES ('106', '36', '2', '2017-04-21 15:18:25', '2017-04-21 15:18:25');
INSERT INTO `roles_permissions` VALUES ('105', '35', '2', '2017-04-21 15:18:25', '2017-04-21 15:18:25');
INSERT INTO `roles_permissions` VALUES ('177', '16', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('176', '15', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('175', '14', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('89', '27', '1', '2017-04-19 13:39:07', '2017-04-19 13:39:07');
INSERT INTO `roles_permissions` VALUES ('104', '34', '2', '2017-04-21 15:18:24', '2017-04-21 15:18:24');
INSERT INTO `roles_permissions` VALUES ('127', '51', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('128', '52', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('129', '53', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('130', '54', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('131', '55', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('132', '56', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('133', '57', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('134', '58', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('135', '59', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('136', '60', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('137', '61', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('138', '62', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('139', '63', '1', '2017-04-21 17:30:15', '2017-04-21 17:30:15');
INSERT INTO `roles_permissions` VALUES ('140', '33', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('141', '34', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('142', '35', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('143', '36', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('144', '37', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('145', '38', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('146', '46', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('147', '47', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('148', '48', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('149', '49', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('150', '50', '1', '2017-04-21 20:05:16', '2017-04-21 20:05:16');
INSERT INTO `roles_permissions` VALUES ('174', '13', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('173', '12', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('172', '5', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('171', '27', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('170', '25', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('169', '21', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('168', '20', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('167', '19', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('166', '18', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('165', '17', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('164', '4', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('163', '2', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('197', '45', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('198', '46', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('199', '47', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('200', '48', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('201', '49', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('202', '50', '2', '2017-04-24 14:16:47', '2017-04-24 14:16:47');
INSERT INTO `roles_permissions` VALUES ('203', '39', '2', '2017-04-24 15:16:20', '2017-04-24 15:16:20');
INSERT INTO `roles_permissions` VALUES ('204', '64', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('205', '65', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('206', '66', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('207', '67', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('208', '68', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('209', '69', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('210', '70', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('211', '71', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('212', '72', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('213', '73', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('214', '74', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('215', '75', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('216', '76', '1', '2017-04-25 11:59:06', '2017-04-25 11:59:06');
INSERT INTO `roles_permissions` VALUES ('217', '84', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('218', '85', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('219', '86', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('220', '87', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('221', '88', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('222', '89', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('223', '90', '2', '2017-04-25 16:34:16', '2017-04-25 16:34:16');
INSERT INTO `roles_permissions` VALUES ('224', '64', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('225', '65', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('226', '66', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('227', '67', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('228', '68', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('229', '69', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('230', '70', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('231', '71', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('232', '72', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('233', '73', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('234', '74', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('235', '75', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('236', '76', '2', '2017-04-26 10:22:54', '2017-04-26 10:22:54');
INSERT INTO `roles_permissions` VALUES ('237', '92', '2', '2017-04-26 19:24:51', '2017-04-26 19:24:51');
INSERT INTO `roles_permissions` VALUES ('238', '77', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('239', '78', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('240', '79', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('241', '80', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('242', '81', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('243', '82', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('244', '83', '2', '2017-04-27 11:22:49', '2017-04-27 11:22:49');
INSERT INTO `roles_permissions` VALUES ('245', '93', '2', '2017-04-27 11:36:33', '2017-04-27 11:36:33');
INSERT INTO `roles_permissions` VALUES ('246', '94', '1', '2017-04-28 16:26:13', '2017-04-28 16:26:13');
INSERT INTO `roles_permissions` VALUES ('247', '95', '2', '2017-04-28 17:01:03', '2017-04-28 17:01:03');
INSERT INTO `roles_permissions` VALUES ('248', '39', '1', '2017-05-02 16:01:57', '2017-05-02 16:01:57');
INSERT INTO `roles_permissions` VALUES ('249', '96', '1', '2017-05-02 16:01:57', '2017-05-02 16:01:57');
INSERT INTO `roles_permissions` VALUES ('250', '84', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('251', '85', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('252', '86', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('253', '87', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('254', '88', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('255', '89', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('256', '90', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('257', '92', '1', '2017-05-02 19:06:53', '2017-05-02 19:06:53');
INSERT INTO `roles_permissions` VALUES ('258', '103', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('259', '104', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('260', '105', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('261', '106', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('262', '107', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('263', '108', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('264', '109', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('265', '110', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('266', '111', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('267', '112', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('268', '113', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('269', '114', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('270', '115', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('271', '116', '1', '2017-05-03 16:41:05', '2017-05-03 16:41:05');
INSERT INTO `roles_permissions` VALUES ('272', '77', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('273', '78', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('274', '79', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('275', '80', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('276', '81', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('277', '82', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('278', '83', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('279', '93', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('280', '95', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('281', '97', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('282', '98', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('283', '99', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('284', '100', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('285', '101', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('286', '102', '1', '2017-05-04 12:34:59', '2017-05-04 12:34:59');
INSERT INTO `roles_permissions` VALUES ('287', '1', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('288', '3', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('289', '22', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('290', '28', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('291', '29', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('292', '30', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('293', '31', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('294', '32', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('295', '40', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('296', '41', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('297', '42', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('298', '43', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('299', '44', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('300', '45', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('301', '33', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('302', '34', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('303', '35', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('304', '36', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('305', '37', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('306', '38', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('307', '39', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('308', '46', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('309', '47', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('310', '48', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('311', '49', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('312', '50', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('313', '51', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('314', '52', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('315', '53', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('316', '54', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('317', '55', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('318', '56', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('319', '57', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('320', '58', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('321', '59', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('322', '60', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('323', '61', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('324', '62', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('325', '63', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('326', '64', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('327', '65', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('328', '66', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('329', '67', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('330', '68', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('331', '69', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('332', '70', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('333', '71', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('334', '72', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('335', '73', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('336', '74', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('337', '75', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('338', '76', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('339', '94', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('340', '84', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('341', '85', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('342', '86', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('343', '87', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('344', '88', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('345', '89', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('346', '90', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('347', '92', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('348', '103', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('349', '104', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('350', '105', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('351', '106', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('352', '107', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('353', '108', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('354', '109', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('355', '110', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('356', '111', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('357', '112', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('358', '113', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('359', '114', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('360', '115', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('361', '116', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('362', '117', '1', '2017-05-05 19:56:36', '2017-05-05 19:56:36');
INSERT INTO `roles_permissions` VALUES ('363', '118', '1', '2017-05-05 19:56:36', '2017-05-05 19:56:36');

-- ----------------------------
-- Table structure for roles_users
-- ----------------------------
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles_users
-- ----------------------------
INSERT INTO `roles_users` VALUES ('1', '1', '1', '2017-04-07 13:07:50', '2017-04-07 13:07:50');
INSERT INTO `roles_users` VALUES ('2', '2', '2', '2017-04-07 13:07:51', '2017-04-07 13:07:51');
INSERT INTO `roles_users` VALUES ('5', '4', '3', '2017-05-04 19:21:12', '2017-05-04 19:21:12');
INSERT INTO `roles_users` VALUES ('4', '2', '4', '2017-04-07 13:07:51', '2017-04-07 13:07:51');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', null, 'admin', null, '00e16ca9f73de8880085d1630cf31f3384a574f8', null, '2017-06-04 23:00:01', '2017-06-03 15:31:56');
