/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.18-log : Database - maintenance
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_account` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '管理员登陆账号',
  `admin_password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '管理员登陆密码',
  `admin_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '管理员显示昵称',
  `admin_locked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否锁定 1未锁定 0已锁定无法登陆',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `UNIQUE` (`admin_account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`admin_id`,`admin_account`,`admin_password`,`admin_name`,`admin_locked`) values (1,'root','root','超级管理员',1),(2,'admin','admin','管理员1',1),(3,'king','king','管理员2',0);

/*Table structure for table `tb_appraise` */

DROP TABLE IF EXISTS `tb_appraise`;

CREATE TABLE `tb_appraise` (
  `appraise_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id号',
  `appraise_level` varchar(10) NOT NULL COMMENT '评价等级（技术一般，技术超群，太水了）',
  `appraise_details` varchar(1024) NOT NULL COMMENT '评价详情',
  PRIMARY KEY (`appraise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价信息表\r\n';

/*Data for the table `tb_appraise` */

/*Table structure for table `tb_emp` */

DROP TABLE IF EXISTS `tb_emp`;

CREATE TABLE `tb_emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `emp_number` varchar(20) NOT NULL COMMENT '管理员编号',
  `emp_name` varchar(25) NOT NULL COMMENT '姓名',
  `password` varchar(25) NOT NULL COMMENT '密码',
  `sex` varchar(5) NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `telephone` varchar(11) NOT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `emp_card` varchar(18) NOT NULL COMMENT '身份证',
  `address` varchar(50) NOT NULL COMMENT '住址',
  `emp_skils` varchar(25) NOT NULL COMMENT '技能',
  `emp_details` varchar(500) DEFAULT NULL COMMENT '详情',
  `create_date` date NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

/*Data for the table `tb_emp` */

/*Table structure for table `tb_emp_role` */

DROP TABLE IF EXISTS `tb_emp_role`;

CREATE TABLE `tb_emp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工角色中间表\r\n';

/*Data for the table `tb_emp_role` */

/*Table structure for table `tb_essay` */

DROP TABLE IF EXISTS `tb_essay`;

CREATE TABLE `tb_essay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '文章标题',
  `content` varchar(5000) COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `addTime` date DEFAULT NULL COMMENT '发表时间',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否展示  0  可显示  1不可显示',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '文章类型 1 电脑入门  2常见故障 3 IT资讯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_essay` */

insert  into `tb_essay`(`id`,`name`,`content`,`addTime`,`display`,`type`) values (1,'电脑','111111111','2020-01-06',1,1),(2,'手机','333333333333333','2020-01-23',1,2),(3,'故障','555555555555',NULL,1,3);

/*Table structure for table `tb_leader` */

DROP TABLE IF EXISTS `tb_leader`;

CREATE TABLE `tb_leader` (
  `leader_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '负责人id',
  `leader_account` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '负责人登陆账号',
  `leader_password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '负责人登陆密码',
  `leader_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '负责人显示昵称',
  `leader_locked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否锁定 1未锁定 0已锁定无法登陆',
  PRIMARY KEY (`leader_id`),
  UNIQUE KEY `UNIQUE` (`leader_account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_leader` */

insert  into `tb_leader`(`leader_id`,`leader_account`,`leader_password`,`leader_name`,`leader_locked`) values (1,'xiaowang','123456','小王',1),(2,'xiaoli','123456','小李',1),(3,'xiaoliu','123456','小刘',1),(4,'xiaowu','123456','小吴',0);

/*Table structure for table `tb_message` */

DROP TABLE IF EXISTS `tb_message`;

CREATE TABLE `tb_message` (
  `message_id` int(11) NOT NULL COMMENT '留言id号',
  `message_body` varchar(1024) NOT NULL COMMENT '留言信息',
  `message_date` date NOT NULL COMMENT '留言时间',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表';

/*Data for the table `tb_message` */

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报修单id',
  `machine_model` varchar(25) NOT NULL COMMENT '机器型号',
  `problem_lever` varchar(255) NOT NULL COMMENT '问题的优先级',
  `lianxi_user` varchar(10) NOT NULL COMMENT '联系人',
  `lianxi_tel` varchar(15) NOT NULL COMMENT '联系电话',
  `problem_desc` varchar(255) NOT NULL COMMENT '问题详情',
  `machine_address` varchar(255) NOT NULL COMMENT '机器所在地',
  `add_time` datetime DEFAULT NULL COMMENT '申请时间',
  `order_img1` varchar(5000) DEFAULT 'NULL' COMMENT '故障图片1',
  `order_img2` varchar(5000) DEFAULT 'NULL' COMMENT '故障图片2',
  `statu` varchar(11) NOT NULL DEFAULT '未指派' COMMENT '状态  -1未指派 0待处理 1处理中 2驳回 -2改派申请',
  `statu_desc` varchar(50) DEFAULT 'NULL' COMMENT '状态描述',
  `lid` int(11) DEFAULT NULL COMMENT '维修人id',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 未删除 1 删除',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='报修单表';

/*Data for the table `tb_order` */

insert  into `tb_order`(`order_id`,`machine_model`,`problem_lever`,`lianxi_user`,`lianxi_tel`,`problem_desc`,`machine_address`,`add_time`,`order_img1`,`order_img2`,`statu`,`statu_desc`,`lid`,`is_deleted`) values (1,'联想111','普通','小张1','13333333333','蓝屏','兰州','2021-01-07 00:00:00','NULL','NULL','驳回','该报修申请无需维修。',1,1),(2,'联想','普通','小张','13333333333','蓝屏','兰州','2020-01-07 00:00:00','NULL','NULL','维修中','已在处理该报修申请。',1,1),(3,'联想33','普通','小张','13333333333','蓝屏','兰州','2020-01-02 00:00:00','NULL','NULL','驳回','该报修申请无需维修。',1,0),(4,'联想','普通','小张','13333333333','蓝屏','兰州','2020-01-03 10:41:47','NULL','NULL','未指派','NULL',2,1),(5,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',2,1),(6,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',2,0),(7,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',3,0),(8,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',3,0),(9,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',3,0),(10,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',2,0),(11,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',1,0),(12,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',2,0),(13,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',3,0),(14,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',1,0),(15,'联想','普通','小张','13333333333','蓝屏','兰州',NULL,'NULL','NULL','未指派','NULL',2,0),(16,'联想','普通','小张1','13333333333','蓝屏','兰州','1972-01-01 00:00:00','NULL','NULL','未指派','NULL',1,0),(17,'联想331','立刻','小龙','110','大撒大撒','西安',NULL,NULL,NULL,'未指派','NULL',1,0),(18,'戴尔','优先','小龙','110','','西安',NULL,'','','未指派','NULL',NULL,0),(19,'戴尔','优先','小龙','110','','西安',NULL,'','','未指派','NULL',NULL,0),(20,'戴尔1','立刻','小龙','110112','二位','西安',NULL,'','','未指派','NULL',NULL,0),(21,'戴尔222','立刻','小龙1','1111111','121212121','甘肃',NULL,'','','未指派','NULL',NULL,0),(22,'戴尔111111','立刻','小龙','110','11212','西安',NULL,'','','未指派','NULL',NULL,0),(23,'戴尔111111','立刻','小龙','110','11212','西安',NULL,'','','未指派','NULL',NULL,0),(24,'联想331王五','立刻','小龙','','','西安',NULL,'upload/6349bc11e7924c8b9b47b81bc6d2e4c3_carousel-2.jpg.jpg','upload/d4ca7ab8c23c416b8600d73ba02f6f44_.','未指派','NULL',NULL,0),(25,'联想3322','立刻','小龙','110','','西安',NULL,'upload/aa2ab57e430c478fa0076a2c904dd873_carousel-2.jpg.jpg','upload/292796e35df347e890376f4f2e3ba98c_.','未指派','NULL',NULL,0),(26,'联想331','立刻','小龙','110','地方','西安',NULL,'upload/77e1e4f6312e435bbe1ac30f5a22e18c_carousel-3.jpg.jpg','upload/0f2da6a2659a402c8bab31138a0c238a_.','未指派','NULL',NULL,0),(27,'联想331请求','立刻','小龙','110','地王大厦','西安',NULL,'6c399379d4b1483d8a0df371c5a8fd8e_1 - 副本.jpg','8c79ef45f9f2447fb2a60c3f3161216d_','未指派','NULL',NULL,0),(28,'戴尔22323','立刻','小龙','110','23232323','甘肃',NULL,'22bac870f6d249ca9a55028f1602288f.jpg','8dd5da6858c343b3b06e1385e2688779.jpg','未指派','NULL',3,0),(29,'联想331555','立刻','小龙','110','we\'r','wer',NULL,'d7d37915ad6143899fedd07eb47b7ead.jpg','1d8df4fe36924e06a803348da01e4fe2.','未指派','NULL',NULL,0),(30,'联想331555','立刻','小龙','110','we\'r','wer',NULL,'c1eec82bfa9448eaa22da7b69e3e1cc7.','437778b7607d434c965fd0292f4a07c9.jpg','未指派','NULL',NULL,0),(31,'戴尔555','立刻','小龙','110','嗡嗡嗡','西安',NULL,'6d9fe63cd3d84e2d8c39525f524afcb6.jpg','80f842bdb51747da9f8d5ae7a9e22173.','未指派','NULL',NULL,0),(32,'戴尔55555','立刻','小龙','110','恢复鬼画符 ','西安',NULL,'d0ddda7cbb354172bc8087599a88e20b.jpg','19a782600fa14c1fb6c7015c470c9d31.','未指派','NULL',NULL,0),(33,'戴尔6666','立刻','小龙','110','66666','西安',NULL,'ab3ded0f833f434b8117d26dde62adb4.jpg','6b0b4c4eec8246878ae355c3b4f4b133.','未指派','NULL',NULL,0),(34,'戴尔1444','立刻','','110','42424','西安',NULL,'edea9e14d6e2405588a49ee927cb01fb.jpg','02e5b916414840fe9dff4cb5a7484d61.','未指派','NULL',NULL,0),(35,'联想2','立刻','小龙','110','','西安',NULL,'d9a6734d6a674ca58aec3370b1416fd4.jpg','9f4139a121704f0184199b8d213c1c95.','未指派','NULL',NULL,0),(36,'联想331','立刻','小龙','110','','',NULL,'3f9c9b576f9c42d49a8f2419a2693b72.jpg','d8eb10fd0ae4459ba73c47c1cde68f64.','未指派','NULL',NULL,0),(37,'联想331','立刻','小龙','110','','',NULL,'4ed6992bc29c4f2086b4e70461d34018.jpg','d40736daf5624cdaaa010b603284a978.','未指派','NULL',NULL,0),(38,'联想331','立刻','小龙','110','','西安',NULL,NULL,'2b9cfce5f4e3494d9f6b2b6a390afb1b.jpg','未指派','NULL',NULL,0),(39,'联想331','立刻','小龙','110','','西安',NULL,NULL,'5b55a61c0bf7465c835c223f6993b89b.png','未指派','NULL',NULL,0),(40,'联想331','立刻','小龙','110','','西安',NULL,NULL,'5f895067caf0452784557dc8d501793f.png','未指派','NULL',NULL,0),(41,'戴尔','立刻','小龙','110','','西安',NULL,'fe9e61cd385046d39b4fb16b19165416.jpg',NULL,'未指派','NULL',NULL,0),(42,'戴尔','立刻','小龙','110112','','西安',NULL,'efc1b2be489f44c8bad59c5a48306131_carousel-3.jpg.jpg',NULL,'未指派','NULL',NULL,0),(43,'华硕1234','优先','文龙','13000000','需要清灰','西安','2020-01-08 00:00:00','6b8c1740156a452a85685200a98856fe_IDEA.png',NULL,'未指派','NULL',1,1),(44,'联想331','立刻','小龙','110','','西安',NULL,'eed8335cb7c84b36a051128dc6d69683_IDEA.png',NULL,'未指派','NULL',NULL,0),(45,'联想331','立刻','小龙','110','','西安',NULL,'a5bfa48259d24179a24c26b27919e070_IDEA.png',NULL,'未指派','NULL',NULL,0),(46,'联想331','立刻','小龙','110','','西安',NULL,'28a32aa29a7d4dce911454921838841d_IDEA.png',NULL,'未指派','NULL',NULL,0),(47,'联想331','立刻','小龙','110','','西安',NULL,'cac0f0e29703434f9180457a577f93ad_IDEA.png',NULL,'未指派','NULL',NULL,0),(48,'联想331','立刻','小龙','110','','西安',NULL,'baf42ea57a994a96bf08fb2549e3a6fe_IDEA.png',NULL,'未指派','NULL',NULL,0),(49,'联想331','立刻','小龙','110','','西安',NULL,'2b29682551224296ab727b16ab7122f7_IDEA.png',NULL,'未指派','NULL',NULL,0),(50,'联想331','立刻','小龙','110','','西安',NULL,'529af137d9d444e8b867fc4ed30172c6_IDEA.png',NULL,'未指派','NULL',NULL,0),(51,'戴尔','立刻','小龙','110','','西安',NULL,'a07880716d9543818d4279e6d6b5da45_carousel-3.jpg','e77c184c064a4f90acbcb02cf3e3dbb8_carousel-2.jpg','未指派','NULL',NULL,0),(52,'联想331','立刻','小龙','110','','西安','2020-01-08 13:51:34','aedcc707b6824e81bf3b202d0ee5f01e_carousel-3.jpg','a8fa5b11d71441c3907530cf602f1c22_carousel-1.jpg','未指派','NULL',NULL,0),(53,'华硕','立刻','小龙','110','顶顶顶顶','西安','2020-01-09 00:17:18','e633ce464c844af38ab1007fd9c52672_carousel-2.jpg','96e4b25293504f6bbed216eee78ffaa5_carousel-3.jpg','未指派','NULL',NULL,0),(54,'华硕1','立刻','小龙','110','顶顶顶','西安','2020-01-09 00:20:57','e6c7aa53110b4508b05d117c190babd8_0.jpg',NULL,'未指派','NULL',NULL,0),(55,'华硕2','立刻','小龙','110','顶顶顶','西安','2020-01-09 00:22:57',NULL,NULL,'未指派','NULL',NULL,0),(56,'华硕3','立刻','小龙','110','顶顶顶','西安','2020-01-09 00:26:14',NULL,NULL,'未指派','NULL',NULL,0),(57,'','','','','','','2020-01-09 00:31:21',NULL,NULL,'未指派','NULL',NULL,0),(58,'','','','','','','2020-01-09 00:31:50',NULL,NULL,'未指派','NULL',NULL,0),(59,'','','','','','','2020-01-09 00:31:57',NULL,NULL,'未指派','NULL',NULL,0),(60,'华硕','立刻','小龙','110','顶顶','西安','2020-01-09 00:32:17','0b7e8695bdad4b76aeef00f76238c35f_0.jpg',NULL,'未指派','NULL',NULL,0),(61,'华硕34','立刻','小龙','110','顶顶顶顶','西安','2020-01-09 00:35:09','7149772afe8e4f25ae52a61663d0ebb7_carousel-3.jpg',NULL,'未指派','NULL',NULL,0);

/*Table structure for table `tb_permission` */

DROP TABLE IF EXISTS `tb_permission`;

CREATE TABLE `tb_permission` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表id',
  `perm_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '权限名称',
  `perm_url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '权限url',
  `perm_level` int(11) DEFAULT NULL COMMENT '权限级别',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '权限状态',
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_permission` */

/*Table structure for table `tb_problem_level` */

DROP TABLE IF EXISTS `tb_problem_level`;

CREATE TABLE `tb_problem_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优先级id',
  `level` varchar(11) NOT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优先级表';

/*Data for the table `tb_problem_level` */

insert  into `tb_problem_level`(`id`,`level`) values (1,'立刻'),(2,'优先'),(3,'普通'),(4,'允许暂缓');

/*Table structure for table `tb_receive` */

DROP TABLE IF EXISTS `tb_receive`;

CREATE TABLE `tb_receive` (
  `receive_id` int(11) NOT NULL COMMENT '领取id号',
  `receive_name` varchar(10) DEFAULT NULL COMMENT '领取人或代取人',
  `receive_date` date DEFAULT NULL COMMENT '领取日期',
  PRIMARY KEY (`receive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='领取人表';

/*Data for the table `tb_receive` */

/*Table structure for table `tb_record` */

DROP TABLE IF EXISTS `tb_record`;

CREATE TABLE `tb_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维修记录id号',
  `repair_status` varchar(10) NOT NULL COMMENT '维修状态（处理中，驳回）',
  `record_problem` varchar(255) NOT NULL COMMENT '维修常见问题(无需维修，处理中，维修完成)',
  `record_describe` varchar(255) NOT NULL COMMENT '具体描述',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='维修记录表';

/*Data for the table `tb_record` */

insert  into `tb_record`(`record_id`,`repair_status`,`record_problem`,`record_describe`) values (1,'维修中','处理中','已在处理该报修申请。'),(2,'驳回','无需维修','该报修申请无需维修'),(3,'已维修','维修完成','报修申请已完成维修。');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(10) DEFAULT NULL COMMENT '角色类别',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `tb_role` */

insert  into `tb_role`(`role_id`,`role_name`) values (1,'admin'),(2,'leader'),(3,'user');

/*Table structure for table `tb_role_perm` */

DROP TABLE IF EXISTS `tb_role_perm`;

CREATE TABLE `tb_role_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限关系表',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `perm_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_role_perm` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_account` varchar(25) NOT NULL COMMENT '用户登陆账号',
  `user_password` varchar(32) NOT NULL COMMENT '用户登陆密码',
  `username` varchar(25) NOT NULL COMMENT '用户显示名称',
  `user_tel` varchar(15) NOT NULL COMMENT '用户联系方式',
  `user_email` varchar(20) NOT NULL COMMENT '用户邮箱',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '注销标识字段(0-正常 1-已注销)',
  `user_locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态 1 审核通过的 0审核未通过的',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`user_account`,`user_password`,`username`,`user_tel`,`user_email`,`is_deleted`,`user_locked`,`create_time`) values (1,'zhangsan','111111111','张三','13888888888','king@163.com',0,1,NULL),(2,'lisi','123','李四','13888888888','king@163.com',0,1,NULL),(3,'wangwu','123','王五','22222222222','King@qq.com',0,1,NULL),(4,'zhaoliu','123','赵六','11111111111','King@qq.com ',0,1,NULL),(6,'20162110','111111111','zhangsan','1234567890','king@163.com',0,1,NULL),(7,'20162126','11111111','admin','1234567890','king@163.com',0,0,'2020-01-08 18:06:16'),(8,'20162130','11111111','zhangsan','12345678901','king@163.com',0,0,'2020-01-08 19:44:37');

/*Table structure for table `tb_user_role` */

DROP TABLE IF EXISTS `tb_user_role`;

CREATE TABLE `tb_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色关系表id',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `leader_id` int(11) NOT NULL DEFAULT '0' COMMENT '负责人id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tb_user_role` */

insert  into `tb_user_role`(`id`,`admin_id`,`leader_id`,`user_id`,`role_id`) values (1,1,0,0,1),(2,2,0,0,1),(3,3,0,0,1),(4,0,1,0,2),(5,0,2,0,2),(6,0,3,0,2),(7,0,4,0,2),(8,0,0,1,3),(9,0,0,2,3),(10,0,0,3,3),(11,0,0,4,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
