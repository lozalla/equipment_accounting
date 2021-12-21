#
# TABLE STRUCTURE FOR: access_types
#

DROP TABLE IF EXISTS `access_types`;

CREATE TABLE `access_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ????? ???????';

INSERT INTO `access_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, ' \'B2C\'', '2016-01-01 05:21:36', '2015-12-31 03:53:23');
INSERT INTO `access_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, '\'B2B\'', '2014-11-10 09:15:57', '2014-06-26 09:06:11');
INSERT INTO `access_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, ' \"Aggr\'', '2012-04-14 07:10:05', '2012-09-23 03:04:36');


#
# TABLE STRUCTURE FOR: addresses
#

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `house_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ???? (??????? ?????, ????, ?????? ???? ?? ?????????????)',
  `prperty_type_id` tinyint(3) unsigned NOT NULL COMMENT '??? ????????????',
  `number_apartments` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '?????????? ???????',
  `region_id` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'id ???????',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ???????';

INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('1', 1, 316, 1, '2013-11-07 00:16:25', '2018-09-01 20:50:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('2', 2, 425, 2, '2012-03-15 18:53:23', '2021-01-19 06:20:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('3', 3, 484, 3, '2013-04-05 18:47:22', '2020-12-15 00:50:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('4', 1, 105, 4, '2020-06-14 01:00:12', '2021-02-12 14:46:03');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('5', 2, 78, 5, '2013-03-24 00:40:55', '2021-12-18 00:42:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('6', 3, 11, 6, '2013-02-04 18:15:40', '2015-08-02 10:03:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('7', 1, 279, 7, '2012-11-16 09:40:21', '2016-08-27 01:17:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('8', 2, 339, 8, '2020-03-26 11:51:39', '2017-04-27 10:48:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('9', 3, 388, 9, '2021-01-03 04:16:38', '2014-01-23 05:50:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('10', 1, 253, 10, '2020-04-14 10:58:52', '2020-06-03 23:54:59');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('11', 2, 204, 11, '2016-11-08 05:23:20', '2015-03-05 18:19:30');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('12', 3, 214, 12, '2012-01-14 10:07:54', '2016-01-01 10:29:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('13', 1, 460, 13, '2015-05-08 18:40:53', '2017-01-30 08:35:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('14', 2, 383, 14, '2019-05-31 20:26:00', '2014-01-20 09:07:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('15', 3, 230, 15, '2014-11-21 06:14:38', '2017-09-07 03:32:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('16', 1, 339, 16, '2016-03-05 21:22:42', '2012-03-08 19:24:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('17', 2, 198, 17, '2020-09-15 13:10:00', '2015-11-06 14:47:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('18', 3, 106, 18, '2016-06-02 18:39:33', '2019-02-23 17:11:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('19', 1, 336, 19, '2019-03-06 01:25:41', '2018-05-29 16:10:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('20', 2, 375, 20, '2013-05-31 12:48:17', '2017-06-01 18:19:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('21', 3, 380, 21, '2018-08-27 11:13:49', '2014-01-02 01:42:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('22', 1, 28, 22, '2020-12-31 02:39:31', '2019-02-05 14:36:48');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('23', 2, 52, 23, '2013-09-23 05:27:31', '2020-07-29 17:52:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('24', 3, 8, 24, '2012-03-29 23:55:30', '2014-03-31 05:57:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('25', 1, 312, 25, '2018-02-04 18:40:18', '2021-08-11 13:03:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('26', 2, 29, 26, '2013-12-15 05:51:44', '2019-09-02 01:30:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('27', 3, 421, 27, '2019-05-04 18:04:57', '2013-01-17 01:21:19');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('28', 1, 244, 28, '2014-02-17 04:43:13', '2017-10-09 00:30:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('29', 2, 335, 29, '2014-07-01 13:25:52', '2014-11-28 01:26:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('30', 3, 185, 30, '2020-10-03 02:52:22', '2020-06-02 13:24:26');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('31', 1, 66, 31, '2013-07-01 00:40:46', '2015-12-30 13:14:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('32', 2, 316, 32, '2016-12-25 05:15:46', '2012-12-24 19:55:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('33', 3, 203, 33, '2016-06-16 02:39:36', '2017-04-26 03:13:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('34', 1, 71, 34, '2012-09-25 16:55:18', '2018-05-23 15:45:45');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('35', 2, 138, 35, '2016-10-31 22:38:35', '2019-07-28 03:12:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('36', 3, 4, 36, '2019-08-01 12:43:34', '2016-03-08 20:56:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('37', 1, 74, 37, '2018-08-25 21:40:25', '2019-04-06 04:26:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('38', 2, 355, 38, '2012-05-13 05:10:47', '2018-05-23 22:11:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('39', 3, 413, 39, '2013-02-17 01:51:31', '2019-11-11 21:23:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('40', 1, 27, 40, '2015-09-20 10:07:20', '2020-08-07 14:23:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('41', 2, 205, 41, '2020-03-29 14:54:10', '2018-12-10 08:31:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('42', 3, 101, 42, '2019-09-22 03:19:21', '2020-10-09 09:25:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('43', 1, 187, 43, '2019-01-12 22:22:18', '2014-12-12 19:56:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('44', 2, 294, 44, '2012-01-03 06:22:18', '2016-08-25 05:09:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('45', 3, 492, 45, '2020-11-14 23:50:06', '2018-03-08 21:59:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('46', 1, 423, 46, '2013-02-16 15:00:15', '2018-12-11 06:12:15');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('47', 2, 124, 47, '2014-07-06 16:33:55', '2013-05-07 05:00:24');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('48', 3, 80, 48, '2018-08-25 18:14:42', '2017-10-12 20:38:01');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('49', 1, 294, 49, '2020-06-17 18:19:01', '2016-05-03 23:11:01');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('50', 2, 368, 50, '2012-12-06 17:38:41', '2013-09-19 12:17:03');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('51', 3, 340, 51, '2016-04-19 13:56:15', '2014-02-17 17:11:45');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('52', 1, 482, 52, '2017-08-29 11:31:32', '2015-08-03 00:45:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('53', 2, 157, 53, '2014-11-13 09:57:57', '2015-08-06 06:14:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('54', 3, 450, 54, '2013-11-23 10:41:03', '2017-08-30 10:27:51');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('55', 1, 326, 55, '2013-06-01 15:08:06', '2012-04-12 14:00:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('56', 2, 489, 56, '2017-08-10 08:36:17', '2017-07-22 22:20:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('57', 3, 73, 57, '2021-01-26 18:51:11', '2016-12-14 07:30:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('58', 1, 161, 58, '2018-10-21 18:18:23', '2013-03-15 17:01:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('59', 2, 382, 59, '2012-05-06 02:40:35', '2017-06-30 01:25:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('60', 3, 364, 60, '2012-08-14 19:46:09', '2021-02-27 13:06:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('61', 1, 215, 61, '2015-02-11 18:06:24', '2019-11-14 01:10:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('62', 2, 384, 62, '2015-06-02 08:14:11', '2015-12-29 02:40:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('63', 3, 383, 63, '2012-11-18 14:31:31', '2015-08-28 09:24:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('64', 1, 422, 64, '2019-09-17 23:10:55', '2021-03-18 07:47:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('65', 2, 49, 65, '2019-03-19 20:20:40', '2016-02-20 09:36:24');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('66', 3, 169, 66, '2021-07-08 16:51:24', '2021-11-27 10:37:13');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('67', 1, 385, 67, '2016-04-14 13:57:50', '2015-10-11 05:00:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('68', 2, 109, 68, '2014-08-14 13:21:56', '2018-11-26 20:02:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('69', 3, 430, 69, '2014-12-17 05:58:32', '2012-12-07 11:31:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('70', 1, 353, 70, '2015-02-16 09:12:30', '2020-10-20 13:18:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('71', 2, 492, 71, '2019-07-28 13:58:20', '2019-05-22 14:41:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('72', 3, 352, 72, '2015-11-05 10:09:16', '2013-07-03 08:21:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('73', 1, 15, 73, '2015-02-15 16:16:13', '2018-06-27 11:21:26');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('74', 2, 480, 74, '2014-10-04 06:49:57', '2014-01-21 03:43:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('75', 3, 162, 75, '2014-04-08 08:10:12', '2019-09-22 03:42:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('76', 1, 325, 76, '2016-07-25 14:32:05', '2019-05-24 22:33:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('77', 2, 100, 77, '2017-11-17 04:00:17', '2021-11-24 22:08:38');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('78', 3, 460, 78, '2018-07-02 02:09:07', '2020-05-25 10:08:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('79', 1, 482, 79, '2020-08-07 08:17:44', '2013-09-03 06:47:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('80', 2, 474, 80, '2021-01-17 18:51:29', '2018-03-12 13:30:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('81', 3, 321, 81, '2018-10-27 13:18:57', '2017-10-29 23:08:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('82', 1, 500, 82, '2020-04-08 00:38:28', '2018-04-21 17:59:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('83', 2, 426, 83, '2017-05-19 10:20:29', '2012-06-12 16:27:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('84', 3, 36, 84, '2016-09-25 21:35:12', '2012-06-08 14:30:25');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('85', 1, 93, 85, '2016-08-16 14:17:56', '2021-12-04 18:18:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('86', 2, 286, 1, '2019-04-16 11:27:48', '2017-01-16 20:29:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('87', 3, 172, 2, '2020-04-27 02:03:02', '2012-02-13 03:32:35');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('88', 1, 161, 3, '2021-01-02 17:44:01', '2012-05-09 08:05:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('89', 2, 422, 4, '2012-01-27 13:48:45', '2014-08-06 16:54:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('90', 3, 194, 5, '2019-05-07 16:43:21', '2018-11-09 00:44:22');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('91', 1, 268, 6, '2018-10-08 18:33:27', '2015-10-09 19:15:58');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('92', 2, 166, 7, '2012-04-05 23:03:26', '2017-09-01 22:29:35');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('93', 3, 475, 8, '2012-03-17 21:57:44', '2017-05-06 07:27:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('94', 1, 127, 9, '2018-08-05 10:39:59', '2019-01-11 17:25:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('95', 2, 46, 10, '2016-11-05 07:26:41', '2018-07-11 11:23:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('96', 3, 132, 11, '2018-12-16 12:01:33', '2016-01-24 00:45:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('97', 1, 214, 12, '2021-05-12 20:37:58', '2012-10-26 08:40:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('98', 2, 198, 13, '2020-08-31 09:32:15', '2016-06-24 16:32:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('99', 3, 117, 14, '2021-08-28 07:37:47', '2021-11-30 07:55:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('100', 1, 136, 15, '2017-11-01 10:50:59', '2019-10-22 00:32:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('101', 2, 482, 16, '2012-10-12 06:35:38', '2014-12-02 01:58:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('102', 3, 483, 17, '2014-11-17 06:18:03', '2013-06-29 06:11:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('103', 1, 301, 18, '2021-08-26 20:34:05', '2016-04-04 14:06:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('104', 2, 272, 19, '2020-03-22 01:14:01', '2019-12-11 17:11:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('105', 3, 146, 20, '2016-12-08 16:59:04', '2012-09-16 04:50:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('106', 1, 64, 21, '2017-03-07 13:57:04', '2021-12-17 20:58:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('107', 2, 307, 22, '2018-05-31 17:09:50', '2012-03-03 19:47:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('108', 3, 32, 23, '2018-06-22 08:55:49', '2020-06-10 21:55:51');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('109', 1, 101, 24, '2015-05-29 11:55:10', '2013-11-20 09:09:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('110', 2, 210, 25, '2013-11-08 15:22:32', '2017-07-23 11:34:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('111', 3, 98, 26, '2012-10-22 21:11:21', '2014-11-22 03:12:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('112', 1, 204, 27, '2016-09-27 10:10:48', '2012-07-01 01:02:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('113', 2, 77, 28, '2018-11-27 01:54:41', '2018-10-21 01:15:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('114', 3, 324, 29, '2015-01-17 07:04:29', '2015-12-30 08:22:40');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('115', 1, 161, 30, '2013-04-26 02:02:39', '2013-12-08 01:32:35');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('116', 2, 69, 31, '2019-04-11 00:44:38', '2015-01-23 08:13:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('117', 3, 48, 32, '2016-11-27 02:49:24', '2015-09-22 17:42:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('118', 1, 265, 33, '2020-08-10 20:11:52', '2017-06-17 00:14:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('119', 2, 402, 34, '2015-07-18 15:22:19', '2018-07-18 03:45:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('120', 3, 227, 35, '2017-02-04 03:41:44', '2018-05-24 06:00:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('121', 1, 264, 36, '2020-11-10 23:11:38', '2015-12-19 05:26:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('122', 2, 328, 37, '2013-09-19 01:19:21', '2014-03-14 10:02:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('123', 3, 381, 38, '2015-10-06 22:37:03', '2012-02-15 14:00:25');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('124', 1, 422, 39, '2018-05-02 16:48:14', '2016-05-01 21:50:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('125', 2, 499, 40, '2012-07-09 13:31:27', '2013-06-01 22:48:11');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('126', 3, 69, 41, '2012-07-06 13:06:09', '2013-09-29 00:37:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('127', 1, 462, 42, '2013-07-04 15:47:17', '2012-04-20 16:14:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('128', 2, 322, 43, '2020-12-04 13:01:42', '2013-09-03 12:55:19');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('129', 3, 306, 44, '2017-12-23 13:47:57', '2012-08-12 16:43:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('130', 1, 352, 45, '2012-09-19 02:14:48', '2013-02-07 19:01:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('131', 2, 204, 46, '2019-03-31 00:58:40', '2014-07-07 09:30:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('132', 3, 449, 47, '2019-04-25 01:36:38', '2015-03-30 06:59:19');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('133', 1, 8, 48, '2015-06-28 04:06:49', '2018-04-07 14:36:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('134', 2, 466, 49, '2015-01-28 08:50:37', '2019-03-13 20:20:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('135', 3, 284, 50, '2012-02-24 19:39:29', '2016-02-19 12:10:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('136', 1, 211, 51, '2012-03-26 12:04:23', '2021-07-23 02:42:30');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('137', 2, 398, 52, '2014-10-24 23:01:25', '2014-05-26 00:03:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('138', 3, 196, 53, '2019-01-01 10:34:31', '2016-08-16 17:49:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('139', 1, 291, 54, '2020-10-01 09:13:44', '2015-09-22 16:51:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('140', 2, 230, 55, '2019-10-19 22:40:37', '2015-05-23 20:23:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('141', 3, 345, 56, '2019-02-26 13:01:50', '2018-06-05 14:16:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('142', 1, 244, 57, '2019-08-19 22:01:41', '2017-10-12 10:33:48');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('143', 2, 364, 58, '2019-06-16 12:40:54', '2017-02-12 10:00:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('144', 3, 305, 59, '2015-12-12 21:43:05', '2018-04-30 16:02:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('145', 1, 280, 60, '2013-02-06 12:49:28', '2021-08-04 05:21:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('146', 2, 276, 61, '2017-06-26 01:42:50', '2019-08-20 08:12:40');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('147', 3, 16, 62, '2021-11-15 05:19:15', '2015-03-21 17:01:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('148', 1, 366, 63, '2019-10-06 09:24:16', '2020-08-11 21:05:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('149', 2, 234, 64, '2012-11-17 21:31:31', '2014-10-18 09:51:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('150', 3, 69, 65, '2020-03-12 02:44:34', '2013-01-14 13:10:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('151', 1, 412, 66, '2016-09-20 21:35:46', '2021-06-12 05:36:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('152', 2, 452, 67, '2021-07-08 13:05:13', '2021-02-18 02:11:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('153', 3, 420, 68, '2021-08-11 11:42:11', '2018-10-17 04:06:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('154', 1, 69, 69, '2016-09-18 01:30:51', '2013-12-29 10:52:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('155', 2, 340, 70, '2021-02-19 11:49:17', '2015-06-29 02:55:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('156', 3, 193, 71, '2017-10-01 06:00:13', '2016-07-02 16:13:39');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('157', 1, 373, 72, '2015-09-20 08:19:07', '2019-12-08 02:47:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('158', 2, 374, 73, '2020-07-22 20:27:19', '2019-11-20 02:30:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('159', 3, 236, 74, '2012-11-16 09:54:17', '2018-04-04 20:33:15');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('160', 1, 287, 75, '2018-10-30 02:49:28', '2020-07-25 21:34:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('161', 2, 192, 76, '2021-10-26 13:56:58', '2017-07-24 20:49:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('162', 3, 327, 77, '2015-05-08 22:48:56', '2014-12-02 16:11:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('163', 1, 198, 78, '2018-06-19 14:34:56', '2015-01-18 07:00:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('164', 2, 485, 79, '2019-06-28 16:15:27', '2012-11-18 18:03:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('165', 3, 114, 80, '2018-07-23 16:12:47', '2015-06-05 05:17:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('166', 1, 378, 81, '2019-10-07 08:25:26', '2012-12-20 09:52:30');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('167', 2, 331, 82, '2013-02-20 04:15:51', '2020-04-01 08:27:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('168', 3, 123, 83, '2018-04-30 12:12:59', '2012-12-02 18:52:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('169', 1, 499, 84, '2013-10-13 06:39:40', '2019-05-01 15:33:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('170', 2, 411, 85, '2014-07-22 07:23:32', '2014-06-25 08:27:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('171', 3, 66, 1, '2021-12-03 00:32:58', '2013-06-20 05:23:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('172', 1, 495, 2, '2012-10-09 16:39:26', '2019-01-28 18:18:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('173', 2, 249, 3, '2018-07-08 00:39:26', '2013-10-11 20:08:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('174', 3, 70, 4, '2016-12-28 22:20:04', '2019-12-30 10:12:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('175', 1, 446, 5, '2014-03-10 03:20:52', '2014-08-25 17:05:03');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('176', 2, 346, 6, '2018-02-11 17:07:47', '2021-07-17 03:17:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('177', 3, 379, 7, '2016-07-17 11:08:27', '2012-02-20 09:26:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('178', 1, 146, 8, '2018-03-17 15:07:58', '2020-05-16 14:43:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('179', 2, 411, 9, '2019-03-20 02:51:11', '2021-06-08 01:34:16');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('180', 3, 442, 10, '2019-04-07 03:38:53', '2020-04-27 02:02:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('181', 1, 34, 11, '2020-03-10 18:05:53', '2020-05-03 11:56:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('182', 2, 471, 12, '2013-06-11 04:03:51', '2014-06-28 01:53:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('183', 3, 20, 13, '2020-10-07 09:26:19', '2012-11-22 08:49:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('184', 1, 281, 14, '2013-09-20 11:00:01', '2018-08-19 21:05:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('185', 2, 27, 15, '2018-07-27 13:06:22', '2020-06-18 23:09:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('186', 3, 478, 16, '2021-05-13 18:14:19', '2012-02-13 23:15:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('187', 1, 19, 17, '2016-10-15 05:27:39', '2015-06-04 10:46:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('188', 2, 166, 18, '2019-12-04 08:11:36', '2013-09-19 04:45:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('189', 3, 92, 19, '2018-10-13 15:35:26', '2021-12-19 08:24:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('190', 1, 134, 20, '2018-07-26 20:19:38', '2016-06-22 22:10:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('191', 2, 439, 21, '2014-01-17 09:46:10', '2019-08-14 10:05:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('192', 3, 444, 22, '2013-10-09 01:32:17', '2021-01-17 23:40:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('193', 1, 4, 23, '2021-06-10 13:49:28', '2013-01-21 05:02:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('194', 2, 453, 24, '2014-06-26 12:24:32', '2013-10-13 11:55:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('195', 3, 170, 25, '2016-09-16 00:28:57', '2020-10-01 18:14:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('196', 1, 32, 26, '2019-03-04 13:49:51', '2020-06-24 00:18:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('197', 2, 211, 27, '2015-06-22 02:10:14', '2021-07-25 17:07:25');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('198', 3, 482, 28, '2021-01-10 15:07:36', '2012-06-12 10:18:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('199', 1, 206, 29, '2018-04-11 08:08:19', '2012-01-08 17:47:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('200', 2, 104, 30, '2019-09-08 18:44:15', '2020-04-18 16:47:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('201', 3, 344, 31, '2020-11-05 22:36:39', '2012-01-03 00:44:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('202', 1, 273, 32, '2020-06-22 01:40:06', '2012-02-18 22:30:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('203', 2, 345, 33, '2018-12-14 07:43:18', '2013-07-21 13:35:15');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('204', 3, 335, 34, '2017-07-29 14:13:00', '2014-09-14 19:29:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('205', 1, 377, 35, '2014-05-15 08:37:41', '2019-06-14 06:56:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('206', 2, 468, 36, '2016-04-14 12:20:19', '2018-06-02 00:19:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('207', 3, 220, 37, '2016-07-01 06:59:51', '2015-02-27 04:20:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('208', 1, 293, 38, '2015-03-22 02:16:57', '2016-08-31 04:32:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('209', 2, 142, 39, '2017-02-25 05:38:13', '2015-11-29 21:55:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('210', 3, 324, 40, '2018-02-26 06:28:38', '2017-03-16 23:08:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('211', 1, 88, 41, '2016-06-16 03:36:57', '2019-07-09 08:18:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('212', 2, 161, 42, '2019-06-17 15:37:13', '2019-10-13 21:50:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('213', 3, 339, 43, '2011-12-28 16:58:35', '2013-03-30 16:01:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('214', 1, 379, 44, '2021-09-26 12:21:25', '2018-10-06 09:42:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('215', 2, 35, 45, '2017-05-17 09:44:53', '2013-07-03 12:06:03');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('216', 3, 246, 46, '2014-12-29 08:42:12', '2019-06-13 18:20:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('217', 1, 99, 47, '2013-07-06 03:50:05', '2017-08-15 04:44:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('218', 2, 138, 48, '2012-06-12 21:44:25', '2018-08-15 13:00:26');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('219', 3, 375, 49, '2016-07-14 20:46:18', '2013-12-25 06:02:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('220', 1, 189, 50, '2015-11-13 16:57:53', '2017-07-29 21:48:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('221', 2, 4, 51, '2018-02-28 10:32:36', '2020-04-23 07:04:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('222', 3, 243, 52, '2014-06-09 11:20:07', '2018-03-16 23:32:51');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('223', 1, 325, 53, '2016-02-11 03:57:49', '2012-03-08 05:23:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('224', 2, 26, 54, '2016-12-04 07:58:29', '2016-06-23 04:01:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('225', 3, 473, 55, '2020-11-12 03:08:45', '2016-01-19 22:26:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('226', 1, 418, 56, '2021-06-06 09:35:23', '2013-05-11 03:57:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('227', 2, 323, 57, '2018-10-03 15:01:15', '2013-06-24 09:23:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('228', 3, 146, 58, '2016-03-08 02:17:03', '2016-01-04 19:54:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('229', 1, 405, 59, '2016-10-08 07:59:04', '2015-11-03 08:56:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('230', 2, 236, 60, '2015-06-24 02:48:12', '2014-07-04 02:22:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('231', 3, 70, 61, '2020-07-03 06:44:45', '2020-03-18 10:24:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('232', 1, 313, 62, '2018-09-07 20:33:47', '2012-02-22 21:00:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('233', 2, 293, 63, '2017-09-17 08:49:36', '2014-11-26 03:15:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('234', 3, 145, 64, '2018-02-19 12:27:31', '2018-10-15 07:33:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('235', 1, 348, 65, '2021-07-18 03:04:39', '2020-07-01 04:47:24');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('236', 2, 314, 66, '2021-01-23 08:54:37', '2013-10-02 09:41:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('237', 3, 490, 67, '2013-12-22 09:27:16', '2016-09-09 01:39:51');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('238', 1, 335, 68, '2013-07-03 03:55:21', '2020-07-28 16:45:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('239', 2, 468, 69, '2012-01-24 09:21:30', '2020-11-13 02:17:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('240', 3, 70, 70, '2018-10-08 05:47:04', '2015-08-09 22:54:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('241', 1, 381, 71, '2020-06-02 15:13:32', '2016-11-21 14:46:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('242', 2, 204, 72, '2012-02-03 17:48:35', '2014-07-08 03:12:11');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('243', 3, 181, 73, '2021-10-08 21:25:33', '2016-07-28 14:31:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('244', 1, 204, 74, '2013-03-20 09:23:17', '2014-11-09 13:37:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('245', 2, 88, 75, '2013-01-13 03:40:44', '2012-01-07 10:34:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('246', 3, 18, 76, '2016-03-06 05:05:14', '2012-02-15 18:32:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('247', 1, 144, 77, '2019-07-12 00:01:14', '2016-02-06 04:07:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('248', 2, 284, 78, '2012-06-25 15:39:04', '2014-02-08 23:40:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('249', 3, 235, 79, '2015-07-30 16:35:01', '2015-12-24 09:57:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('250', 1, 131, 80, '2014-12-19 23:55:43', '2018-02-08 08:05:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('251', 2, 165, 81, '2014-10-13 21:26:57', '2015-02-14 00:03:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('252', 3, 401, 82, '2012-10-01 13:26:10', '2019-05-30 07:31:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('253', 1, 384, 83, '2021-03-14 09:55:29', '2015-03-27 00:54:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('254', 2, 490, 84, '2015-05-24 02:02:08', '2014-12-01 05:19:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('255', 3, 102, 85, '2019-08-28 15:16:14', '2017-11-21 10:57:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('256', 1, 240, 1, '2013-12-23 22:22:01', '2012-10-30 00:00:11');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('257', 2, 142, 2, '2014-12-25 10:04:40', '2020-03-13 23:21:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('258', 3, 87, 3, '2020-04-20 20:51:20', '2016-12-01 21:58:30');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('259', 1, 260, 4, '2015-04-16 18:57:53', '2012-10-10 22:02:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('260', 2, 58, 5, '2015-10-02 22:49:40', '2019-03-02 22:40:16');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('261', 3, 407, 6, '2016-06-25 22:34:45', '2021-03-05 02:37:15');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('262', 1, 183, 7, '2017-12-03 03:02:59', '2019-11-24 03:39:22');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('263', 2, 175, 8, '2014-08-08 15:12:59', '2012-09-30 05:39:39');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('264', 3, 229, 9, '2012-07-02 09:05:29', '2013-08-31 21:17:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('265', 1, 489, 10, '2012-11-19 14:06:43', '2020-02-04 16:17:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('266', 2, 21, 11, '2019-11-28 21:58:21', '2019-12-25 21:20:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('267', 3, 412, 12, '2015-11-24 09:58:00', '2016-12-16 16:43:59');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('268', 1, 121, 13, '2021-09-21 13:06:56', '2018-05-12 03:00:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('269', 2, 371, 14, '2015-01-24 05:28:15', '2018-07-13 20:07:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('270', 3, 356, 15, '2012-11-17 18:11:59', '2016-07-21 00:47:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('271', 1, 268, 16, '2014-11-01 09:14:50', '2012-10-15 20:25:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('272', 2, 355, 17, '2019-09-10 06:38:14', '2014-07-19 21:15:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('273', 3, 488, 18, '2012-07-18 10:29:31', '2020-03-22 16:49:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('274', 1, 69, 19, '2016-04-28 06:45:44', '2019-09-18 06:11:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('275', 2, 341, 20, '2019-03-12 03:49:59', '2018-03-16 02:17:51');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('276', 3, 207, 21, '2016-02-18 11:42:49', '2020-06-27 13:44:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('277', 1, 193, 22, '2014-06-18 22:57:27', '2019-03-14 06:22:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('278', 2, 307, 23, '2018-04-09 15:43:59', '2012-02-05 15:48:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('279', 3, 319, 24, '2021-07-25 08:41:00', '2017-11-07 01:12:16');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('280', 1, 500, 25, '2013-01-15 13:39:14', '2017-07-02 06:44:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('281', 2, 231, 26, '2019-11-18 11:45:36', '2016-07-02 13:29:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('282', 3, 30, 27, '2020-07-02 17:32:04', '2016-08-23 01:36:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('283', 1, 318, 28, '2012-08-15 18:10:42', '2018-12-08 13:49:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('284', 2, 425, 29, '2013-11-17 14:21:04', '2012-11-28 12:23:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('285', 3, 29, 30, '2012-10-17 11:31:05', '2014-08-19 13:53:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('286', 1, 50, 31, '2015-12-19 11:34:15', '2018-04-04 03:50:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('287', 2, 67, 32, '2018-06-30 07:37:46', '2014-03-22 07:17:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('288', 3, 306, 33, '2021-06-24 05:46:11', '2013-12-19 22:56:13');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('289', 1, 295, 34, '2014-09-05 22:34:24', '2018-07-22 20:28:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('290', 2, 33, 35, '2016-12-26 21:42:44', '2017-04-20 16:08:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('291', 3, 446, 36, '2021-10-28 15:17:19', '2012-03-27 21:20:35');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('292', 1, 218, 37, '2018-03-30 06:12:12', '2012-02-13 08:13:45');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('293', 2, 265, 38, '2021-05-11 15:33:13', '2021-07-04 05:39:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('294', 3, 32, 39, '2014-12-03 14:46:51', '2014-05-26 00:21:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('295', 1, 96, 40, '2012-10-03 07:58:44', '2014-03-12 14:11:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('296', 2, 245, 41, '2012-03-06 10:57:41', '2013-12-08 01:27:13');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('297', 3, 394, 42, '2017-04-29 06:17:00', '2020-01-31 13:11:35');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('298', 1, 424, 43, '2021-08-11 23:19:05', '2012-01-07 11:53:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('299', 2, 420, 44, '2021-04-11 22:43:50', '2016-08-06 07:39:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('300', 3, 90, 45, '2019-12-02 05:26:56', '2013-07-06 09:19:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('301', 1, 1, 46, '2021-02-22 17:33:20', '2020-09-02 17:00:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('302', 2, 328, 47, '2019-10-06 20:38:05', '2018-11-17 14:06:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('303', 3, 391, 48, '2013-07-30 15:41:41', '2020-12-21 07:55:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('304', 1, 335, 49, '2021-09-14 04:59:09', '2015-08-04 11:20:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('305', 2, 39, 50, '2012-10-03 13:42:39', '2015-01-03 00:31:48');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('306', 3, 207, 51, '2014-03-09 10:20:17', '2020-08-15 02:15:46');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('307', 1, 489, 52, '2015-04-03 13:35:54', '2012-10-28 18:10:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('308', 2, 35, 53, '2018-10-29 14:56:32', '2020-08-20 13:18:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('309', 3, 490, 54, '2016-01-05 03:20:39', '2015-06-25 21:32:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('310', 1, 111, 55, '2013-02-13 22:13:39', '2018-08-23 06:59:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('311', 2, 264, 56, '2019-07-21 03:39:51', '2016-05-05 11:59:22');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('312', 3, 188, 57, '2013-09-12 21:48:13', '2015-02-05 10:20:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('313', 1, 216, 58, '2013-12-26 11:19:42', '2019-04-20 12:30:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('314', 2, 63, 59, '2021-03-31 04:59:39', '2020-07-01 20:51:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('315', 3, 311, 60, '2018-06-20 10:13:34', '2019-01-03 03:07:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('316', 1, 101, 61, '2020-11-10 06:06:33', '2018-12-15 03:41:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('317', 2, 16, 62, '2015-05-31 15:32:15', '2016-06-13 04:55:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('318', 3, 17, 63, '2021-07-26 09:54:22', '2017-01-25 00:21:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('319', 1, 424, 64, '2020-05-26 21:19:41', '2020-12-15 18:32:22');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('320', 2, 83, 65, '2020-10-21 12:58:47', '2018-03-24 07:34:25');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('321', 3, 235, 66, '2020-04-09 15:03:12', '2018-10-06 13:34:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('322', 1, 139, 67, '2012-03-27 15:18:03', '2015-01-16 03:56:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('323', 2, 154, 68, '2012-01-16 18:24:59', '2013-03-21 06:33:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('324', 3, 11, 69, '2013-01-09 19:35:26', '2013-02-24 02:17:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('325', 1, 25, 70, '2020-12-06 11:12:38', '2021-07-14 10:25:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('326', 2, 93, 71, '2016-08-18 07:51:45', '2013-08-10 23:59:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('327', 3, 206, 72, '2012-09-09 13:44:28', '2020-12-06 03:53:38');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('328', 1, 462, 73, '2019-05-29 06:35:21', '2021-08-07 12:47:39');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('329', 2, 468, 74, '2020-11-18 04:27:31', '2014-10-07 13:02:58');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('330', 3, 433, 75, '2014-06-15 20:25:23', '2015-10-11 22:19:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('331', 1, 488, 76, '2013-04-23 18:13:58', '2020-04-30 04:21:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('332', 2, 390, 77, '2016-07-13 12:50:37', '2021-07-07 04:03:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('333', 3, 388, 78, '2017-09-26 07:51:47', '2015-12-07 18:48:30');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('334', 1, 474, 79, '2018-09-14 01:18:59', '2012-06-22 19:38:01');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('335', 2, 41, 80, '2019-12-24 10:50:28', '2021-07-13 12:52:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('336', 3, 121, 81, '2017-09-07 20:44:50', '2015-11-09 19:24:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('337', 1, 174, 82, '2016-07-05 02:29:15', '2014-06-27 14:10:40');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('338', 2, 320, 83, '2018-04-20 15:26:01', '2014-07-26 06:47:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('339', 3, 355, 84, '2013-05-09 15:39:07', '2016-05-27 23:24:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('340', 1, 210, 85, '2018-05-18 13:52:33', '2014-03-29 22:45:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('341', 2, 151, 1, '2015-04-28 09:56:10', '2016-01-01 02:05:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('342', 3, 410, 2, '2014-12-26 03:04:30', '2017-12-20 12:26:48');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('343', 1, 384, 3, '2016-05-30 18:23:28', '2014-09-18 15:01:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('344', 2, 369, 4, '2018-04-23 22:44:43', '2014-01-11 21:59:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('345', 3, 446, 5, '2013-08-11 11:11:40', '2019-06-20 15:41:26');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('346', 1, 40, 6, '2019-08-03 01:21:34', '2015-12-19 13:39:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('347', 2, 200, 7, '2017-07-30 11:41:45', '2020-07-11 04:48:58');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('348', 3, 155, 8, '2020-06-13 18:58:04', '2018-12-29 23:27:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('349', 1, 298, 9, '2013-01-10 01:35:38', '2014-11-15 17:48:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('350', 2, 187, 10, '2020-01-19 06:38:06', '2012-12-10 22:59:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('351', 3, 408, 11, '2018-02-20 06:23:49', '2015-08-30 22:05:35');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('352', 1, 65, 12, '2020-04-19 09:01:19', '2017-06-12 22:49:48');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('353', 2, 1, 13, '2017-09-24 16:23:03', '2020-06-20 08:14:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('354', 3, 483, 14, '2015-07-22 23:07:15', '2020-11-01 04:44:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('355', 1, 222, 15, '2012-07-08 03:19:16', '2020-06-07 19:42:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('356', 2, 493, 16, '2013-04-02 23:08:34', '2019-10-19 23:24:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('357', 3, 207, 17, '2021-06-28 19:40:34', '2021-10-13 12:08:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('358', 1, 277, 18, '2016-03-08 13:43:34', '2021-07-18 00:45:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('359', 2, 391, 19, '2014-07-23 15:06:04', '2019-12-08 02:18:59');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('360', 3, 19, 20, '2018-04-27 07:22:37', '2016-06-23 02:42:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('361', 1, 138, 21, '2015-02-19 11:01:01', '2016-09-11 18:03:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('362', 2, 341, 22, '2018-07-06 13:11:01', '2020-11-23 07:48:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('363', 3, 383, 23, '2015-02-01 08:42:30', '2014-07-23 21:41:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('364', 1, 270, 24, '2017-07-21 11:06:12', '2016-12-18 01:12:01');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('365', 2, 116, 25, '2012-03-11 01:15:47', '2014-01-29 04:26:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('366', 3, 375, 26, '2013-08-19 10:39:07', '2020-12-15 14:48:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('367', 1, 102, 27, '2012-08-16 03:54:56', '2019-11-16 15:56:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('368', 2, 213, 28, '2018-08-22 07:38:05', '2021-05-04 11:23:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('369', 3, 437, 29, '2017-08-27 16:50:12', '2016-10-31 09:12:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('370', 1, 210, 30, '2013-03-12 04:49:32', '2020-02-22 23:47:22');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('371', 2, 218, 31, '2017-08-14 18:17:50', '2014-02-27 09:49:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('372', 3, 3, 32, '2019-11-14 14:40:41', '2014-02-03 18:47:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('373', 1, 420, 33, '2018-01-06 17:39:14', '2017-02-20 21:35:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('374', 2, 236, 34, '2012-04-12 06:30:57', '2017-01-09 06:10:01');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('375', 3, 328, 35, '2020-12-22 07:19:37', '2012-08-23 03:03:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('376', 1, 317, 36, '2018-01-31 09:53:19', '2021-07-05 14:14:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('377', 2, 270, 37, '2018-12-28 20:33:13', '2021-05-28 12:39:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('378', 3, 415, 38, '2017-08-02 14:50:33', '2013-08-01 15:57:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('379', 1, 471, 39, '2014-12-22 20:00:28', '2019-03-29 11:32:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('380', 2, 315, 40, '2012-06-20 23:39:39', '2014-09-05 18:19:16');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('381', 3, 92, 41, '2014-07-04 11:44:40', '2020-08-30 13:53:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('382', 1, 164, 42, '2020-01-19 10:18:23', '2016-11-24 11:12:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('383', 2, 379, 43, '2018-01-18 22:50:20', '2012-04-14 20:29:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('384', 3, 17, 44, '2021-01-29 11:07:26', '2013-09-28 19:06:53');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('385', 1, 361, 45, '2018-05-10 07:06:36', '2019-04-26 23:08:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('386', 2, 191, 46, '2016-10-16 06:34:03', '2013-07-05 14:30:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('387', 3, 62, 47, '2016-08-05 17:36:09', '2019-01-22 21:08:39');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('388', 1, 317, 48, '2014-07-27 19:05:27', '2012-09-04 23:08:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('389', 2, 136, 49, '2017-08-08 09:16:03', '2019-07-21 09:50:58');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('390', 3, 52, 50, '2013-09-03 00:10:21', '2014-05-20 21:00:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('391', 1, 22, 51, '2015-11-06 15:55:08', '2021-10-13 06:36:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('392', 2, 286, 52, '2015-04-21 20:11:12', '2017-01-02 04:23:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('393', 3, 478, 53, '2013-03-29 01:08:19', '2021-02-11 00:33:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('394', 1, 203, 54, '2014-05-13 23:20:08', '2013-10-04 09:33:15');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('395', 2, 370, 55, '2020-01-24 16:56:13', '2016-01-31 23:48:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('396', 3, 472, 56, '2014-05-01 04:45:49', '2012-03-06 21:29:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('397', 1, 379, 57, '2020-03-01 12:32:42', '2012-02-03 20:51:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('398', 2, 45, 58, '2013-07-06 23:48:45', '2015-11-20 21:17:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('399', 3, 354, 59, '2019-05-10 15:06:43', '2019-05-21 11:30:23');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('400', 1, 78, 60, '2013-04-05 13:05:56', '2016-03-04 13:49:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('401', 2, 225, 61, '2021-12-18 03:21:47', '2018-04-21 22:53:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('402', 3, 23, 62, '2020-11-26 02:49:19', '2020-07-10 17:35:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('403', 1, 232, 63, '2020-05-26 10:54:17', '2020-03-09 11:03:24');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('404', 2, 210, 64, '2015-10-23 07:24:51', '2018-10-30 15:55:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('405', 3, 437, 65, '2015-09-20 23:11:58', '2015-03-03 11:59:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('406', 1, 368, 66, '2012-09-26 04:52:32', '2015-01-27 23:36:22');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('407', 2, 85, 67, '2014-01-01 06:12:39', '2014-10-27 06:37:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('408', 3, 365, 68, '2012-02-29 20:20:34', '2017-08-27 23:06:19');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('409', 1, 317, 69, '2021-03-09 05:10:45', '2012-12-31 19:36:33');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('410', 2, 491, 70, '2016-06-12 07:34:37', '2021-05-28 02:09:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('411', 3, 353, 71, '2012-06-29 00:23:59', '2019-07-19 05:42:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('412', 1, 89, 72, '2018-01-10 08:27:53', '2018-07-22 17:43:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('413', 2, 215, 73, '2013-11-13 11:13:03', '2014-03-02 09:00:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('414', 3, 237, 74, '2020-11-14 08:50:21', '2018-12-30 02:34:03');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('415', 1, 188, 75, '2017-03-25 04:20:53', '2012-07-06 11:56:40');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('416', 2, 118, 76, '2015-01-03 08:12:03', '2021-03-09 16:26:13');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('417', 3, 310, 77, '2018-05-23 17:38:06', '2015-06-14 00:13:45');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('418', 1, 47, 78, '2020-11-19 10:11:24', '2015-05-04 00:42:13');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('419', 2, 477, 79, '2018-10-24 00:23:45', '2012-04-24 03:38:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('420', 3, 449, 80, '2015-09-24 02:26:21', '2019-05-01 07:27:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('421', 1, 258, 81, '2020-12-21 22:26:53', '2015-10-23 15:02:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('422', 2, 320, 82, '2018-07-31 02:43:10', '2017-03-05 18:11:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('423', 3, 266, 83, '2017-02-18 01:54:00', '2014-11-18 16:52:47');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('424', 1, 113, 84, '2020-06-15 21:31:04', '2015-06-08 14:12:09');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('425', 2, 236, 85, '2016-02-18 12:10:09', '2018-05-04 03:32:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('426', 3, 216, 1, '2013-11-22 15:51:08', '2014-10-15 19:37:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('427', 1, 438, 2, '2015-02-07 16:48:06', '2012-03-03 13:56:10');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('428', 2, 308, 3, '2016-07-31 08:03:46', '2016-02-20 21:39:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('429', 3, 198, 4, '2016-02-20 16:51:34', '2017-04-22 01:38:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('430', 1, 45, 5, '2016-07-19 20:35:09', '2014-12-04 07:33:04');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('431', 2, 484, 6, '2019-04-16 20:51:50', '2019-07-03 21:20:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('432', 3, 398, 7, '2020-12-03 01:42:12', '2018-04-28 06:36:57');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('433', 1, 346, 8, '2018-01-14 01:39:16', '2015-11-25 05:46:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('434', 2, 13, 9, '2014-09-26 04:01:45', '2012-11-05 10:16:18');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('435', 3, 154, 10, '2016-05-19 01:14:34', '2020-02-20 05:41:34');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('436', 1, 149, 11, '2013-04-16 18:44:15', '2018-09-11 10:58:01');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('437', 2, 332, 12, '2012-12-22 21:21:18', '2019-11-06 04:36:11');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('438', 3, 99, 13, '2018-11-01 05:05:10', '2021-09-16 00:32:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('439', 1, 260, 14, '2015-12-27 22:37:27', '2018-12-21 15:41:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('440', 2, 247, 15, '2018-10-21 00:36:40', '2014-05-30 06:49:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('441', 3, 112, 16, '2012-11-01 07:58:57', '2016-10-25 01:27:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('442', 1, 82, 17, '2021-01-28 03:07:05', '2013-02-27 08:26:49');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('443', 2, 467, 18, '2021-09-01 01:34:28', '2021-03-06 14:02:25');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('444', 3, 283, 19, '2012-01-30 19:51:22', '2018-01-18 19:43:43');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('445', 1, 475, 20, '2018-04-29 13:29:30', '2015-03-06 03:55:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('446', 2, 86, 21, '2014-01-20 01:53:22', '2012-02-20 14:20:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('447', 3, 45, 22, '2012-02-07 09:19:23', '2017-07-16 18:33:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('448', 1, 426, 23, '2020-09-22 17:47:21', '2019-08-29 14:29:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('449', 2, 490, 24, '2021-08-23 07:25:25', '2015-04-19 20:39:24');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('450', 3, 393, 25, '2014-02-06 17:42:51', '2015-09-12 15:40:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('451', 1, 349, 26, '2012-09-04 13:20:53', '2016-04-17 10:26:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('452', 2, 170, 27, '2015-09-28 10:24:40', '2019-07-05 23:41:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('453', 3, 337, 28, '2014-03-10 18:26:17', '2019-12-09 05:03:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('454', 1, 44, 29, '2017-02-22 09:22:55', '2021-09-16 19:49:14');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('455', 2, 290, 30, '2012-12-15 11:38:22', '2018-05-11 07:15:07');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('456', 3, 5, 31, '2021-11-19 05:21:33', '2016-06-18 12:58:17');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('457', 1, 101, 32, '2017-01-17 14:27:30', '2020-06-22 03:50:05');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('458', 2, 159, 33, '2015-09-12 21:59:26', '2013-08-28 01:40:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('459', 3, 344, 34, '2017-09-20 19:25:40', '2013-01-03 23:58:36');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('460', 1, 196, 35, '2014-06-14 12:48:34', '2017-10-25 10:10:00');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('461', 2, 145, 36, '2017-10-04 21:30:59', '2018-07-01 04:21:16');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('462', 3, 358, 37, '2013-10-20 17:49:45', '2017-01-24 18:42:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('463', 1, 287, 38, '2020-10-28 09:04:55', '2017-05-23 12:34:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('464', 2, 153, 39, '2017-01-01 05:59:20', '2015-03-17 16:20:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('465', 3, 138, 40, '2012-03-26 04:08:15', '2020-02-05 15:44:03');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('466', 1, 254, 41, '2019-09-18 00:36:56', '2015-11-04 20:52:45');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('467', 2, 411, 42, '2018-09-28 11:32:24', '2016-09-18 11:18:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('468', 3, 193, 43, '2019-11-13 15:29:31', '2013-10-25 08:47:41');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('469', 1, 229, 44, '2020-06-24 18:36:32', '2012-01-30 05:18:16');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('470', 2, 498, 45, '2016-11-22 03:01:59', '2015-09-09 21:04:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('471', 3, 101, 46, '2019-04-07 07:34:20', '2017-07-31 18:38:38');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('472', 1, 475, 47, '2017-02-15 13:07:15', '2014-07-31 05:01:20');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('473', 2, 466, 48, '2019-09-18 10:09:20', '2018-09-03 05:53:06');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('474', 3, 14, 49, '2017-05-02 04:28:41', '2016-01-03 21:51:55');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('475', 1, 102, 50, '2015-11-24 09:32:03', '2016-05-16 00:25:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('476', 2, 113, 51, '2018-05-26 23:24:46', '2014-11-15 16:42:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('477', 3, 263, 52, '2020-06-17 18:31:39', '2018-11-20 22:16:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('478', 1, 125, 53, '2019-11-04 11:43:45', '2014-02-24 20:52:54');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('479', 2, 42, 54, '2020-09-24 11:40:51', '2014-10-25 08:05:29');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('480', 3, 486, 55, '2016-07-19 03:05:36', '2017-08-07 06:45:08');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('481', 1, 438, 56, '2015-08-11 00:03:48', '2014-10-14 03:23:44');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('482', 2, 312, 57, '2013-11-30 23:38:57', '2014-09-28 23:34:37');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('483', 3, 387, 58, '2020-10-06 10:44:00', '2020-11-02 10:31:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('484', 1, 321, 59, '2016-09-20 06:07:19', '2017-07-23 04:27:02');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('485', 2, 179, 60, '2021-06-03 18:11:07', '2020-07-24 03:36:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('486', 3, 227, 61, '2012-04-27 20:28:19', '2021-05-11 14:27:32');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('487', 1, 380, 62, '2019-05-06 03:41:10', '2018-10-30 01:55:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('488', 2, 211, 63, '2012-10-09 01:32:32', '2020-01-07 08:10:26');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('489', 3, 1, 64, '2018-02-27 04:06:20', '2018-04-19 03:18:28');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('490', 1, 207, 65, '2018-07-15 08:14:01', '2015-06-08 21:15:27');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('491', 2, 53, 66, '2014-01-13 14:53:35', '2018-08-31 13:58:56');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('492', 3, 133, 67, '2013-03-05 09:47:59', '2019-02-27 08:13:12');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('493', 1, 17, 68, '2013-03-27 13:54:39', '2020-08-09 10:21:42');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('494', 2, 439, 69, '2021-01-19 21:13:03', '2016-05-21 16:01:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('495', 3, 134, 70, '2020-06-13 10:16:03', '2015-09-13 08:42:48');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('496', 1, 200, 71, '2013-03-10 19:18:05', '2012-10-24 18:51:52');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('497', 2, 264, 72, '2021-03-02 06:26:31', '2014-04-11 01:02:21');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('498', 3, 49, 73, '2012-05-03 07:21:48', '2021-01-13 08:51:31');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('499', 1, 83, 74, '2015-05-19 14:15:38', '2016-12-03 01:35:50');
INSERT INTO `addresses` (`house_id`, `prperty_type_id`, `number_apartments`, `region_id`, `created_at`, `updated_at`) VALUES ('500', 2, 187, 75, '2021-01-22 22:34:08', '2013-06-26 13:24:16');


#
# TABLE STRUCTURE FOR: eqiupment_technical_statuses
#

DROP TABLE IF EXISTS `eqiupment_technical_statuses`;

CREATE TABLE `eqiupment_technical_statuses` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ???????? ???????????? ????????? ????????????';

INSERT INTO `eqiupment_technical_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, ' \'Демонтирован\'', '2021-12-01 10:57:10', '2021-07-25 15:03:06');
INSERT INTO `eqiupment_technical_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, '\'Исправен\'', '2013-08-08 09:22:09', '2012-09-01 00:34:54');
INSERT INTO `eqiupment_technical_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, ' \'Неисправен\'', '2021-08-30 09:13:42', '2021-04-28 14:15:14');


#
# TABLE STRUCTURE FOR: equipment_types
#

DROP TABLE IF EXISTS `equipment_types`;

CREATE TABLE `equipment_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ????? ????????????';

INSERT INTO `equipment_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, ' \'Маршрутизатор\'', '2013-03-26 23:26:49', '2016-04-28 16:17:48');
INSERT INTO `equipment_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, ' \'Сплиттер\'', '2016-11-11 17:19:43', '2012-02-23 01:03:40');
INSERT INTO `equipment_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, '\'Коммутатор\'', '2015-10-17 13:09:49', '2020-09-23 04:03:23');


#
# TABLE STRUCTURE FOR: ports_technical_statuses
#

DROP TABLE IF EXISTS `ports_technical_statuses`;

CREATE TABLE `ports_technical_statuses` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ???????? ???????????? ????????? ??????';

INSERT INTO `ports_technical_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, ' \'Неиправен\'', '2021-07-27 00:15:34', '2017-08-19 04:24:45');
INSERT INTO `ports_technical_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, '\'Занят\'', '2014-11-28 22:41:49', '2020-07-06 16:30:09');
INSERT INTO `ports_technical_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, ' \'Свободен\'', '2016-02-28 03:25:42', '2015-06-03 15:52:32');


#
# TABLE STRUCTURE FOR: property_types
#

DROP TABLE IF EXISTS `property_types`;

CREATE TABLE `property_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ????? ????????????';

INSERT INTO `property_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, '  \'Здание\'', '2015-04-08 02:04:11', '2019-06-25 23:00:16');
INSERT INTO `property_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, '\'МКД\'', '2016-09-21 21:12:13', '2013-09-08 13:41:54');
INSERT INTO `property_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, ' \'Ч/С\'', '2015-03-23 01:25:27', '2021-05-01 02:09:34');


#
# TABLE STRUCTURE FOR: regions
#

DROP TABLE IF EXISTS `regions`;

CREATE TABLE `regions` (
  `id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '???????? ???????',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ????????';

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'SouthCarolina', '2020-08-09 04:23:06', '2021-05-30 20:23:29');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'Illinois', '2019-12-29 15:50:56', '2012-05-24 19:11:03');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'Maryland', '2019-04-28 21:54:16', '2021-09-13 21:05:20');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'Missouri', '2013-12-25 10:08:29', '2019-05-18 04:25:38');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'Wisconsin', '2012-05-31 19:22:52', '2016-09-27 08:46:57');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'Utah', '2020-05-17 15:01:54', '2015-10-27 09:13:44');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'Florida', '2015-02-18 09:28:10', '2021-06-10 20:16:04');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'Oregon', '2017-05-21 08:08:36', '2020-07-18 18:58:24');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'Minnesota', '2017-01-31 07:40:34', '2020-01-28 03:21:29');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'Maryland', '2012-10-02 22:54:56', '2017-06-28 01:50:47');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'Alabama', '2021-08-13 22:56:52', '2021-12-04 11:21:27');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'Oregon', '2013-03-17 14:47:10', '2013-05-21 00:17:04');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'WestVirginia', '2019-01-31 14:45:56', '2016-11-27 14:34:17');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'Ohio', '2020-03-24 18:34:42', '2012-01-24 10:54:15');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'WestVirginia', '2020-07-27 03:06:14', '2020-06-11 08:49:00');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'Massachusetts', '2012-02-20 06:47:39', '2012-12-10 18:24:31');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'RhodeIsland', '2020-09-13 19:12:35', '2017-07-29 07:21:32');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'Wyoming', '2016-01-20 20:06:30', '2013-07-01 19:16:05');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'Illinois', '2018-08-19 00:07:22', '2015-10-03 11:26:41');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'Wyoming', '2013-04-01 21:31:53', '2016-08-22 16:20:39');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'Georgia', '2018-01-06 17:00:14', '2014-04-18 17:55:02');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'Maine', '2014-09-23 00:53:19', '2016-11-05 17:51:40');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'California', '2018-07-09 22:23:01', '2014-10-13 17:17:45');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'Maryland', '2018-08-02 18:46:45', '2013-03-26 07:57:04');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'Georgia', '2020-10-30 02:27:02', '2016-11-13 03:19:38');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'Montana', '2016-05-27 11:51:47', '2015-12-28 14:08:22');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'Virginia', '2014-12-17 07:23:21', '2021-05-21 01:12:25');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'Ohio', '2018-04-20 16:00:34', '2014-08-13 21:37:10');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'Alabama', '2014-03-02 11:36:09', '2019-07-08 23:25:11');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'Arkansas', '2014-09-12 00:24:31', '2021-11-27 17:41:20');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (31, 'Wisconsin', '2021-06-24 15:12:50', '2018-10-14 01:02:18');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (32, 'Georgia', '2021-06-10 19:24:39', '2017-01-13 12:29:27');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (33, 'Oklahoma', '2014-11-28 05:47:22', '2020-08-01 01:36:39');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (34, 'Michigan', '2020-08-01 06:36:28', '2019-08-13 17:30:33');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (35, 'Hawaii', '2020-12-05 07:24:08', '2019-03-10 22:53:02');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (36, 'Vermont', '2019-12-24 14:22:07', '2015-07-12 00:21:06');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (37, 'Arizona', '2020-03-02 18:33:56', '2013-12-12 09:14:03');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (38, 'Louisiana', '2017-07-01 19:00:43', '2021-09-04 01:37:15');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (39, 'WestVirginia', '2019-02-12 21:06:56', '2014-06-03 06:31:17');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (40, 'Illinois', '2021-07-30 07:58:17', '2015-03-14 19:04:02');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (41, 'RhodeIsland', '2017-03-26 01:42:48', '2019-05-19 04:48:54');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (42, 'Arkansas', '2015-10-18 02:59:58', '2014-01-13 19:33:43');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (43, 'Minnesota', '2020-03-28 23:42:14', '2017-05-20 21:23:15');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (44, 'Arizona', '2021-03-28 22:22:23', '2021-12-15 23:56:14');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (45, 'Arkansas', '2012-07-15 20:24:34', '2018-03-21 07:30:22');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (46, 'Massachusetts', '2020-11-15 00:27:52', '2017-08-12 20:58:13');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (47, 'Kansas', '2015-04-10 18:12:50', '2016-05-16 13:11:21');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (48, 'Idaho', '2017-02-24 18:12:20', '2020-01-09 11:10:04');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (49, 'Maryland', '2014-02-16 01:00:24', '2021-08-28 05:40:50');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (50, 'Connecticut', '2020-02-15 04:51:36', '2012-12-26 23:23:11');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (51, 'Connecticut', '2020-12-22 04:03:09', '2014-07-05 01:45:04');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (52, 'Nebraska', '2014-08-04 05:21:11', '2021-04-12 00:42:39');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (53, 'NorthDakota', '2017-06-08 10:49:03', '2014-09-16 14:53:03');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (54, 'SouthCarolina', '2016-03-21 20:28:53', '2014-04-05 10:56:20');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (55, 'NorthCarolina', '2020-09-12 15:54:45', '2015-06-23 18:48:27');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (56, 'NorthDakota', '2021-05-07 17:13:55', '2015-11-10 05:11:39');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (57, 'Massachusetts', '2012-07-14 23:34:24', '2012-01-04 02:20:38');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (58, 'RhodeIsland', '2016-03-18 05:38:59', '2018-08-14 07:39:34');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (59, 'Maryland', '2017-10-17 18:08:21', '2013-10-29 06:37:16');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (60, 'Oklahoma', '2016-07-11 16:45:26', '2020-09-13 12:10:17');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (61, 'Minnesota', '2018-11-07 04:54:53', '2017-12-28 20:29:11');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (62, 'Montana', '2014-11-06 02:16:13', '2020-11-11 08:33:06');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (63, 'Hawaii', '2015-11-19 19:21:15', '2021-09-06 10:51:40');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (64, 'NewMexico', '2014-02-08 02:11:08', '2016-08-24 16:50:29');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (65, 'NorthCarolina', '2016-07-23 17:47:51', '2016-08-25 11:36:35');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (66, 'Vermont', '2014-02-28 11:24:17', '2019-12-12 04:19:50');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (67, 'Delaware', '2016-05-25 09:07:58', '2015-04-17 00:37:41');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (68, 'NewJersey', '2017-11-10 11:26:28', '2012-03-20 07:48:56');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (69, 'Maryland', '2015-03-20 15:10:46', '2017-04-01 05:46:27');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (70, 'Ohio', '2019-07-08 01:36:04', '2016-10-07 16:16:25');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (71, 'NewMexico', '2013-03-13 00:44:36', '2014-05-12 07:00:38');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (72, 'Virginia', '2019-08-10 07:12:21', '2021-09-13 17:25:31');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (73, 'Mississippi', '2015-01-15 07:24:42', '2016-08-03 19:37:59');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (74, 'Florida', '2015-03-20 07:51:59', '2019-05-23 15:46:18');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (75, 'Wisconsin', '2019-06-24 03:34:49', '2021-06-24 14:38:27');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (76, 'Georgia', '2015-03-31 23:05:26', '2013-09-10 13:49:15');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (77, 'District of Columbia', '2016-07-12 14:31:17', '2016-08-15 16:12:26');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (78, 'Delaware', '2012-11-12 12:56:46', '2016-12-12 07:10:25');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (79, 'Colorado', '2020-04-22 23:54:32', '2014-10-02 09:48:29');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (80, 'Arizona', '2016-02-04 23:48:27', '2017-04-07 20:48:43');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (81, 'Michigan', '2018-07-10 05:10:49', '2017-10-20 07:56:18');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (82, 'Massachusetts', '2018-02-08 14:13:34', '2016-12-07 22:41:25');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (83, 'Minnesota', '2018-01-30 04:00:46', '2013-08-30 10:41:07');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (84, 'Ohio', '2016-04-27 21:51:08', '2016-09-03 17:53:26');
INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES (85, 'Delaware', '2016-11-10 17:45:30', '2016-10-30 14:19:04');


#
# TABLE STRUCTURE FOR: sale_statuses
#

DROP TABLE IF EXISTS `sale_statuses`;

CREATE TABLE `sale_statuses` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ???????? ??? ??????? ????? ?? ????????????';

INSERT INTO `sale_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, '\'Готов к продаже\'', '2013-07-07 23:00:35', '2015-05-16 14:51:24');
INSERT INTO `sale_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, ' \'Проект\'', '2015-03-26 09:21:18', '2017-02-07 10:06:56');
INSERT INTO `sale_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, ' \'Запрет на продажу\'', '2021-03-07 12:34:52', '2020-11-25 16:41:01');


#
# TABLE STRUCTURE FOR: service_types
#

DROP TABLE IF EXISTS `service_types`;

CREATE TABLE `service_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='??????? ????? ???????????? ??????';

INSERT INTO `service_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, '\'осн\'', '2013-12-09 09:33:45', '2012-09-07 02:48:48');
INSERT INTO `service_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, ' \'доп\'', '2020-01-27 11:23:01', '2021-09-18 08:09:41');


