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

-- 导出  表 laravel-rbac.admin_password_resets 结构
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `admin_password_resets_email_index` (`email`),
  KEY `admin_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.admin_password_resets 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;


-- 导出  表 laravel-rbac.admin_users 结构
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

-- 正在导出表  laravel-rbac.admin_users 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `is_super`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@admin.com', '$2y$10$GBKiY/ngDVpe1iHwlTem3e0fbNrnv1sRLGcj4wT1isK0gbzY4oQoC', 1, 'kwXV90VBYWdZxWomfNrpZHuaaatlihTUtpsuBCE38W9O4NiN5xuw4zNqYJ22', '2016-07-18 20:47:11', '2016-07-18 12:47:11');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;


-- 导出  表 laravel-rbac.admin_user_role 结构
CREATE TABLE IF NOT EXISTS `admin_user_role` (
  `admin_user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_user_id`,`role_id`),
  KEY `admin_user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `admin_user_roles_admin_user_id_foreign` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.admin_user_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `admin_user_role` DISABLE KEYS */;
INSERT INTO `admin_user_role` (`admin_user_id`, `role_id`) VALUES
	(1, 10);
/*!40000 ALTER TABLE `admin_user_role` ENABLE KEYS */;


-- 导出  表 laravel-rbac.categories 结构
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `sort` tinyint(4) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categorys_pid_index` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.categories 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `pid`, `sort`, `status`) VALUES
	(1, '幼儿', 0, 1, 1),
	(2, '学龄前', 0, 2, 1),
	(3, '小学', 0, 3, 1),
	(4, '初中', 0, 4, 1),
	(5, '高中', 0, 5, 1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- 导出  表 laravel-rbac.category_user 结构
CREATE TABLE IF NOT EXISTS `category_user` (
  `category_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`user_id`),
  KEY `FK_category_user_users` (`user_id`),
  CONSTRAINT `FK_category_user_categorys` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_category_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  laravel-rbac.category_user 的数据：~8 rows (大约)
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


-- 导出  表 laravel-rbac.members 结构
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1男2女',
  `avatar` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已认证2未认证',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0拉黑1正常',
  `passport_images1` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片身份证正面',
  `passport_images2` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片身份证反面',
  `passport_images3` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证照片手拿身份证',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `members_user_id_foreign` (`user_id`),
  CONSTRAINT `members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.members 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`, `user_id`, `name`, `gender`, `avatar`, `authable`, `status`, `passport_images1`, `passport_images2`, `passport_images3`, `created_at`, `updated_at`) VALUES
	(1, 3, '11', 1, NULL, 0, 1, '', '', '', '2016-07-19 12:01:44', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


-- 导出  表 laravel-rbac.migrations 结构
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.migrations 的数据：~10 rows (大约)
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


-- 导出  表 laravel-rbac.organizations 结构
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `authable` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `passport_images1` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '法人身份证照',
  `passport_images2` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业营业执照照',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `organizations_user_id_foreign` (`user_id`),
  CONSTRAINT `organizations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.organizations 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` (`id`, `user_id`, `name`, `gender`, `authable`, `status`, `passport_images1`, `passport_images2`, `created_at`, `updated_at`) VALUES
	(2, 2, '滁州龙兴教育培训机构', 1, 0, 1, NULL, NULL, '2016-07-19 10:53:24', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;


-- 导出  表 laravel-rbac.password_resets 结构
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.password_resets 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- 导出  表 laravel-rbac.permissions 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.permissions 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `fid`, `icon`, `name`, `display_name`, `description`, `is_menu`, `sort`, `created_at`, `updated_at`) VALUES
	(20, 0, 'edit', '#-1456129983', '系统设置', '', 1, 100, '2016-02-22 16:33:03', '2016-02-22 16:33:03'),
	(21, 20, '', 'admin.admin_user.index', '用户权限', '查看后台用户列表', 1, 0, '2016-02-18 15:56:26', '2016-02-18 15:56:26'),
	(22, 20, '', 'admin.admin_user.create', '创建后台用户', '页面', 0, 0, '2016-02-23 11:48:18', '2016-02-23 11:48:18'),
	(35, 0, 'home', 'admin.home', 'Dashboard', '后台首页', 1, 0, '2016-02-22 16:32:40', '2016-02-22 16:32:40'),
	(36, 0, ' fa-laptop', '#-1456132007', '博客管理', '', 1, 0, '2016-02-22 17:06:47', '2016-02-22 17:06:47'),
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
	(58, 20, '', 'admin.role.destory.all', '批量删除角色', '', 0, 0, '2016-02-23 12:01:58', '2016-02-23 12:01:58');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- 导出  表 laravel-rbac.permission_role 结构
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.permission_role 的数据：~32 rows (大约)
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
	(20, 12),
	(21, 12),
	(22, 12),
	(35, 12),
	(36, 12),
	(37, 12);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- 导出  表 laravel-rbac.personals 结构
CREATE TABLE IF NOT EXISTS `personals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `avatar` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authable` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `passport_images1` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_images2` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_images3` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_personals_users` (`user_id`),
  CONSTRAINT `FK_personals_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.personals 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `personals` DISABLE KEYS */;
INSERT INTO `personals` (`id`, `user_id`, `name`, `description`, `gender`, `avatar`, `authable`, `status`, `passport_images1`, `passport_images2`, `passport_images3`, `created_at`, `updated_at`) VALUES
	(3, 1, '张老师', '个人金牌家教', 0, '', 0, 0, '', '', '', '2016-07-19 12:02:09', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `personals` ENABLE KEYS */;


-- 导出  表 laravel-rbac.roles 结构
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

-- 正在导出表  laravel-rbac.roles 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(10, 'administrator', '系统管理员', '', '2016-02-19 17:59:52', '2016-02-19 17:59:52'),
	(12, 'test', '测试狗', '', '2016-02-19 18:00:43', '2016-02-19 18:00:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- 导出  表 laravel-rbac.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1用户-家长学生2培训机构3个人培训班',
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  laravel-rbac.users 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `type`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'test1', 'test1@admin.com', 3, '$2y$10$osDZZ10QibYuAmyQm4i0.OYMWn268cW/0rrxgcqi.e6HRU3gQvaDy', NULL, '2016-07-19 12:02:15', '2016-07-18 12:46:23'),
	(2, 'test2', 'test2@admin.com', 2, '$2y$10$2ATviDVWAvaFMDXdaYuYke.RkP.tOGCjf2I0Sy0KIpEQCwUX3CG.2', '9PcLk66yUQ91fNoXGCKOCueb3wf2mYh0rPD5m8oqsSJUZ2e0c3TkOkUUDHs3', '2016-07-19 09:52:40', '2016-07-19 01:51:06'),
	(3, 'test3', 'test3@admin.com', 1, '$2y$10$C3oxZDRr4l5ykMdBKfewGu26tsG5Q/bBxmZ9DMIJFmtUDF8UaOpCi', 'XepCAhqwZLLcVx589939LulrCAq4gzJVjCmVgoJh6BRTTGpwrf4brVpO5XiW', '2016-07-19 12:02:17', '2016-07-19 01:51:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
