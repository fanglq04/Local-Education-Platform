-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.13-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 laravel-project-3.admin_password_resets 结构
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `admin_password_resets_email_index` (`email`),
  KEY `admin_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.admin_password_resets 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;


-- 导出  表 laravel-project-3.admin_users 结构
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_super` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.admin_users 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `is_super`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@admin.com', '$2y$10$GBKiY/ngDVpe1iHwlTem3e0fbNrnv1sRLGcj4wT1isK0gbzY4oQoC', 1, 'jPGgBSGYXlD58xgBNTP9VySHNOdpCo1635DwfCHf7EKAkvZARX8wYD95qW1G', '2016-07-22 11:37:59', '2016-07-22 03:37:59');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;


-- 导出  表 laravel-project-3.admin_user_role 结构
CREATE TABLE IF NOT EXISTS `admin_user_role` (
  `admin_user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_user_id`,`role_id`),
  KEY `admin_user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `admin_user_roles_admin_user_id_foreign` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.admin_user_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `admin_user_role` DISABLE KEYS */;
INSERT INTO `admin_user_role` (`admin_user_id`, `role_id`) VALUES
	(1, 10);
/*!40000 ALTER TABLE `admin_user_role` ENABLE KEYS */;


-- 导出  表 laravel-project-3.categories 结构
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `sort` tinyint(4) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categorys_pid_index` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.categories 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `pid`, `sort`, `status`) VALUES
	(1, '幼儿', 0, 1, 1),
	(2, '学龄前', 0, 2, 1),
	(3, '小学', 0, 3, 1),
	(4, '初中', 0, 4, 1),
	(5, '高中', 0, 5, 1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- 导出  表 laravel-project-3.category_user 结构
CREATE TABLE IF NOT EXISTS `category_user` (
  `category_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`user_id`),
  KEY `FK_category_user_users` (`user_id`),
  CONSTRAINT `FK_category_user_categorys` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_category_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与分类多对多关系表（机构、个人培训单位）';

-- 正在导出表  laravel-project-3.category_user 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `category_user` DISABLE KEYS */;
INSERT INTO `category_user` (`category_id`, `user_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(1, 2),
	(2, 2),
	(3, 2);
/*!40000 ALTER TABLE `category_user` ENABLE KEYS */;


-- 导出  表 laravel-project-3.members 结构
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `passport_front_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片身份证正面',
  `passport_back_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片身份证反面',
  `passport_handheld_id_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片手拿身份证',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `members_user_id_foreign` (`user_id`),
  CONSTRAINT `members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.members 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`, `user_id`, `name`, `passport_front_images`, `passport_back_images`, `passport_handheld_id_images`, `created_at`, `updated_at`) VALUES
	(1, 3, '张小星家长', '', '', '', '2016-07-20 10:41:54', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


-- 导出  表 laravel-project-3.migrations 结构
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.migrations 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2016_01_18_071439_create_admin_users', 1),
	('2016_01_18_071720_create_admin_password_resets_table', 1),
	('2016_01_23_031442_entrust_base', 1),
	('2016_01_23_031518_entrust_pivot_admin_user_role', 1),
	('2016_07_16_212954_create_categorys_table', 2),
	('2016_07_16_214738_create_organizations_table', 2),
	('2016_07_16_223212_create_personals_table', 2),
	('2016_07_17_213046_create_members_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- 导出  表 laravel-project-3.organizations 结构
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `corporate_id_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '法人身份证照',
  `business license_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业营业执照照',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `organizations_user_id_foreign` (`user_id`),
  CONSTRAINT `organizations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.organizations 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` (`id`, `user_id`, `name`, `corporate_id_images`, `business license_images`, `created_at`, `updated_at`) VALUES
	(2, 2, '滁州龙兴教育培训机构', NULL, NULL, '2016-07-19 10:53:24', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;


-- 导出  表 laravel-project-3.password_resets 结构
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.password_resets 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- 导出  表 laravel-project-3.permissions 结构
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单父ID',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标class',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_menu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作为菜单显示,[1|0]',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.permissions 的数据：~31 rows (大约)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `fid`, `icon`, `name`, `display_name`, `description`, `is_menu`, `sort`, `created_at`, `updated_at`) VALUES
	(20, 0, 'edit', '#-1456129983', '系统设置', '', 1, 100, '2016-07-22 11:37:31', '2016-02-22 16:33:03'),
	(21, 20, '', 'admin.admin_user.index', '用户权限', '查看后台用户列表', 1, 0, '2016-02-18 15:56:26', '2016-02-18 15:56:26'),
	(22, 20, '', 'admin.admin_user.create', '创建后台用户', '页面', 0, 0, '2016-02-23 11:48:18', '2016-02-23 11:48:18'),
	(35, 0, 'home', 'admin.home', 'Dashboard', '后台首页', 1, 0, '2016-02-22 16:32:40', '2016-02-22 16:32:40'),
	(36, 0, 'fa-laptop', '#-1456132007', '博客管理', '', 1, 0, '2016-07-22 10:54:54', '2016-02-22 17:06:47'),
	(37, 36, '', 'admin.blog.index', '博客列表', '', 1, 0, '2016-02-22 17:15:48', '2016-02-22 17:15:48'),
	(38, 20, '', 'admin.admin_user.store', '保存新建后台用户', '操作', 0, 0, '2016-02-23 11:48:52', '2016-02-23 11:48:52'),
	(39, 20, '', 'admin.admin_user.destroy', '删除后台用户', '操作', 0, 0, '2016-02-23 11:49:09', '2016-02-23 11:49:09'),
	(40, 20, '', 'admin.admin_user.destory.all', '批量后台用户删除', '操作', 0, 0, '2016-02-23 12:01:01', '2016-02-23 12:01:01'),
	(42, 20, '', 'admin.admin_user.edit', '编辑后台用户', '页面', 0, 0, '2016-02-23 11:48:35', '2016-02-23 11:48:35'),
	(43, 20, '', 'admin.admin_user.update', '保存编辑后台用户', '操作', 0, 0, '2016-02-23 11:50:12', '2016-02-23 11:50:12'),
	(44, 20, '', 'admin.permission.index', '权限管理', '页面', 0, 0, '2016-02-23 11:51:36', '2016-02-23 11:51:36'),
	(45, 20, '', 'admin.permission.create', '新建权限', '页面', 0, 0, '2016-02-23 11:52:16', '2016-02-23 11:52:16'),
	(46, 20, '', 'admin.permission.store', '保存新建权限', '操作', 0, 0, '2016-02-23 11:52:38', '2016-02-23 11:52:38'),
	(47, 20, '', 'admin.permission.edit', '编辑权限', '页面', 0, 0, '2016-02-23 11:53:29', '2016-02-23 11:53:29'),
	(48, 20, '', 'admin.permission.update', '保存编辑权限', '操作', 0, 0, '2016-02-23 11:53:56', '2016-02-23 11:53:56'),
	(49, 20, '', 'admin.permission.destroy', '删除权限', '操作', 0, 0, '2016-02-23 11:54:27', '2016-02-23 11:54:27'),
	(50, 20, '', 'admin.permission.destory.all', '批量删除权限', '操作', 0, 0, '2016-02-23 11:55:17', '2016-02-23 11:55:17'),
	(51, 20, '', 'admin.role.index', '角色管理', '页面', 0, 0, '2016-02-23 11:56:07', '2016-02-23 11:56:07'),
	(52, 20, '', 'admin.role.create', '新建角色', '页面', 0, 0, '2016-02-23 11:56:33', '2016-02-23 11:56:33'),
	(53, 20, '', 'admin.role.store', '保存新建角色', '操作', 0, 0, '2016-02-23 11:57:26', '2016-02-23 11:57:26'),
	(54, 20, '', 'admin.role.edit', '编辑角色', '页面', 0, 0, '2016-02-23 11:58:25', '2016-02-23 11:58:25'),
	(55, 20, '', 'admin.role.update', '保存编辑角色', '操作', 0, 0, '2016-02-23 11:58:50', '2016-02-23 11:58:50'),
	(56, 20, '', 'admin.role.permissions', '角色权限设置', '', 0, 0, '2016-02-23 11:59:26', '2016-02-23 11:59:26'),
	(57, 20, '', 'admin.role.destroy', '角色删除', '操作', 0, 0, '2016-02-23 11:59:49', '2016-02-23 11:59:49'),
	(58, 20, '', 'admin.role.destory.all', '批量删除角色', '', 0, 0, '2016-02-23 12:01:58', '2016-02-23 12:01:58'),
	(59, 0, 'fa-male', '#-1469152218', '用户管理', '用户管理组', 1, 0, '2016-07-22 10:54:59', '2016-07-22 01:50:18'),
	(60, 59, '', 'admin.member.index', '用户列表', '页面', 1, 0, '2016-07-22 11:04:44', '2016-07-22 02:59:38'),
	(61, 59, '', 'admin.member.edit', '编辑用户', '页面', 0, 0, '2016-07-22 11:04:49', '2016-07-22 02:28:53'),
	(62, 59, '', 'admin.member.forbidden', '禁用用户', '操作', 0, 0, '2016-07-22 11:04:52', '2016-07-22 02:29:26'),
	(63, 59, '', 'admin.member.detail', '详细信息', '页面', 0, 0, '2016-07-22 11:04:55', '2016-07-22 02:29:47');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- 导出  表 laravel-project-3.permission_role 结构
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.permission_role 的数据：~37 rows (大约)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(20, 10),
	(21, 10),
	(22, 10),
	(35, 10),
	(36, 10),
	(37, 10),
	(38, 10),
	(39, 10),
	(40, 10),
	(42, 10),
	(43, 10),
	(44, 10),
	(45, 10),
	(46, 10),
	(47, 10),
	(48, 10),
	(49, 10),
	(50, 10),
	(51, 10),
	(52, 10),
	(53, 10),
	(54, 10),
	(55, 10),
	(56, 10),
	(57, 10),
	(58, 10),
	(59, 10),
	(60, 10),
	(61, 10),
	(62, 10),
	(63, 10),
	(20, 12),
	(21, 12),
	(22, 12),
	(35, 12),
	(36, 12),
	(37, 12);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- 导出  表 laravel-project-3.personals 结构
CREATE TABLE IF NOT EXISTS `personals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `passport_front_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片身份证正面',
  `passport_back_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片身份证反面',
  `passport_handheld_id_images` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片手拿身份证',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_personals_users` (`user_id`),
  CONSTRAINT `FK_personals_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.personals 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `personals` DISABLE KEYS */;
INSERT INTO `personals` (`id`, `user_id`, `name`, `description`, `passport_front_images`, `passport_back_images`, `passport_handheld_id_images`, `created_at`, `updated_at`) VALUES
	(3, 1, '张老师', '个人金牌家教', '', '', '', '2016-07-20 10:36:07', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `personals` ENABLE KEYS */;


-- 导出  表 laravel-project-3.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.roles 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(10, 'administrator', '系统管理员', '', '2016-02-19 17:59:52', '2016-02-19 17:59:52'),
	(12, 'test', '测试狗', '', '2016-02-19 18:00:43', '2016-02-19 18:00:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- 导出  表 laravel-project-3.subjects 结构
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`category_id`),
  KEY `FK_subjects_categories` (`category_id`),
  CONSTRAINT `FK_subjects_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='科目表';

-- 正在导出表  laravel-project-3.subjects 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`id`, `category_id`, `name`) VALUES
	(1, 1, '多说'),
	(2, 1, '学走路'),
	(3, 2, '多说听写'),
	(4, 3, '数学'),
	(5, 3, '钢琴');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;


-- 导出  表 laravel-project-3.subject_user 结构
CREATE TABLE IF NOT EXISTS `subject_user` (
  `subject_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subject_id`,`user_id`),
  KEY `FK_subject_user_users` (`user_id`),
  CONSTRAINT `FK_subject_user_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `FK_subject_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  laravel-project-3.subject_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `subject_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_user` ENABLE KEYS */;


-- 导出  表 laravel-project-3.tags 结构
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  laravel-project-3.tags 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`) VALUES
	(1, '幼儿'),
	(2, '看图'),
	(3, '表达'),
	(4, '初中'),
	(5, '名师'),
	(6, '滁州一中'),
	(7, '本科');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


-- 导出  表 laravel-project-3.tag_user 结构
CREATE TABLE IF NOT EXISTS `tag_user` (
  `tag_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`user_id`),
  KEY `FK_tag_user_users` (`user_id`),
  CONSTRAINT `FK_tag_user_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `FK_tag_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  laravel-project-3.tag_user 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `tag_user` DISABLE KEYS */;
INSERT INTO `tag_user` (`tag_id`, `user_id`) VALUES
	(2, 1),
	(3, 1),
	(2, 2),
	(4, 2),
	(5, 2),
	(6, 2);
/*!40000 ALTER TABLE `tag_user` ENABLE KEYS */;


-- 导出  表 laravel-project-3.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` char(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1用户-家长学生2培训机构3个人培训班',
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男2女',
  `authable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已认证0未认证',
  `avatar` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) DEFAULT NULL COMMENT '0拉黑1正常',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-project-3.users 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `type`, `password`, `remember_token`, `gender`, `authable`, `avatar`, `status`, `created_at`, `updated_at`, `lastlogin_at`) VALUES
	(1, 'test1', 'test1@admin.com', NULL, 3, '$2y$10$osDZZ10QibYuAmyQm4i0.OYMWn268cW/0rrxgcqi.e6HRU3gQvaDy', 'XNVvrMBuYwc6RY6dibjLJH9QjhNDk7eTzmZDv1RAP7kPEeHeefzVfgh5eeLZ', 1, 0, NULL, 1, '2016-07-21 13:55:46', '2016-07-21 02:18:59', '0000-00-00 00:00:00'),
	(2, 'test2', 'test2@admin.com', NULL, 2, '$2y$10$2ATviDVWAvaFMDXdaYuYke.RkP.tOGCjf2I0Sy0KIpEQCwUX3CG.2', '4jpLX88OcEKp22AngaCaU0DxMYycOk16sowFpOQbTQFu81CsHbhb8nI5Xxbn', 1, 0, NULL, 1, '2016-07-20 10:41:29', '2016-07-20 02:41:29', '0000-00-00 00:00:00'),
	(3, 'test3', 'test3@admin.com', NULL, 1, '$2y$10$C3oxZDRr4l5ykMdBKfewGu26tsG5Q/bBxmZ9DMIJFmtUDF8UaOpCi', 'XepCAhqwZLLcVx589939LulrCAq4gzJVjCmVgoJh6BRTTGpwrf4brVpO5XiW', 1, 0, NULL, 1, '2016-07-21 13:55:45', '2016-07-19 01:51:32', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
