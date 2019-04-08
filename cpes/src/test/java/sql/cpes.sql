/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.1.62-community : Database - cpes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cpes` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cpes`;

/*Table structure for table `t_acc_cert_img` */

DROP TABLE IF EXISTS `t_acc_cert_img`;

CREATE TABLE `t_acc_cert_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciid` int(11) DEFAULT NULL COMMENT '资质图片ID',
  `acctype` int(1) DEFAULT NULL COMMENT '账户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='账户资质图片（中间表）';

/*Data for the table `t_acc_cert_img` */

insert  into `t_acc_cert_img`(`id`,`ciid`,`acctype`) values (1,1,0),(2,2,0),(3,3,0),(4,5,0),(6,6,1),(7,6,2),(14,7,2),(15,1,1);

/*Table structure for table `t_cert_img` */

DROP TABLE IF EXISTS `t_cert_img`;

CREATE TABLE `t_cert_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='资质图片';

/*Data for the table `t_cert_img` */

insert  into `t_cert_img`(`id`,`name`) values (1,'营业执照副本'),(2,'税务登记证'),(3,'组织机构代码证'),(4,'单位登记证件'),(5,'法定代表人证件'),(6,'经营者证件'),(7,'手执身份证照片');

/*Table structure for table `t_member` */

DROP TABLE IF EXISTS `t_member`;

CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `loginacct` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `userpswd` char(32) DEFAULT NULL COMMENT '用户密码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `acctype` int(1) DEFAULT '2' COMMENT '0 - 商业公司， 1 - 工商户， 2 - 个人',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `truename` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `cardno` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `certstatus` int(1) DEFAULT '0' COMMENT '认证状态 （0 - 未认证， 1 - 已认证）',
  `seqno` varchar(255) DEFAULT NULL COMMENT '平台编码',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员';

/*Data for the table `t_member` */

insert  into `t_member`(`id`,`name`,`loginacct`,`userpswd`,`email`,`acctype`,`tel`,`truename`,`cardno`,`certstatus`,`seqno`,`version`) values (1,'落空的渲染','hemaochao','e10adc3949ba59abbe56e057f20f883e','hemaochao@163.com',1,'','','',1,'W523xLk3Z1Zm',NULL),(4,'我是大帅比','hemaochao1','e10adc3949ba59abbe56e057f20f883e','test@com.cn',0,'110','代笔','544',1,'3KtlcvmBIpjO',NULL),(5,'','newCompany','202cb962ac59075b964b07152d234b70','',2,'',NULL,NULL,0,NULL,NULL);

/*Table structure for table `t_member_cert_img` */

DROP TABLE IF EXISTS `t_member_cert_img`;

CREATE TABLE `t_member_cert_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `ciid` int(11) DEFAULT NULL,
  `iconpath` varchar(255) DEFAULT NULL COMMENT '资质图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='会员资质图片';

/*Data for the table `t_member_cert_img` */

insert  into `t_member_cert_img`(`id`,`memberid`,`ciid`,`iconpath`) values (29,1,1,'1483891983532.jpg'),(30,1,6,'1483891984687.jpg'),(31,4,1,'1483965857802.jpg'),(32,4,2,'1483965858735.jpg'),(33,4,3,'1483965859642.jpg'),(34,4,5,'1483965860524.jpg');

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `icon` varchar(255) DEFAULT NULL COMMENT '资源图标',
  `pid` int(11) DEFAULT NULL,
  `seqno` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='许可';

/*Data for the table `t_permission` */

insert  into `t_permission`(`id`,`name`,`url`,`icon`,`pid`,`seqno`) values (1,'CPES系统权限菜单',NULL,'fa fa-sitemap',0,0),(2,'控制面板','dashboard.htm','fa fa-desktop',1,0),(6,'消息管理','message/index.htm','fa fa-weixin',1,1),(7,'权限管理','','fa fa-cogs',1,1),(8,'用户管理','user/index.htm','fa fa-user',7,1),(9,'角色管理','role/index.htm','fa fa-graduation-cap',7,1),(10,'许可管理','permission/index.htm','fa fa-check-square-o',7,1),(11,'资质管理','','fa fa-certificate',1,1),(12,'分类管理','cert/type.htm','fa fa-th-list',11,1),(13,'资质管理','cert/index.htm','fa fa-certificate',11,1),(15,'流程管理','process/index.htm','fa fa-random',1,1),(16,'审核管理','','fa fa-check-square',1,1),(17,'实名认证人工审核','process/cert.htm','fa fa-check-circle-o',16,1),(18,'新增','','',16,2);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name`) values (1,'超级管理员'),(2,'系统管理员'),(3,'人工审核管理员'),(4,'abcde');

/*Table structure for table `t_role_permission` */

DROP TABLE IF EXISTS `t_role_permission`;

CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='角色许可表';

/*Data for the table `t_role_permission` */

insert  into `t_role_permission`(`id`,`roleid`,`permissionid`) values (12,5,1),(13,5,2),(14,5,5),(15,5,6),(16,5,7),(17,5,8),(18,5,9),(19,5,10),(37,7,1),(38,7,2),(39,7,6),(40,7,7),(41,7,8),(42,7,9),(43,7,10),(44,7,11),(45,7,12),(46,7,13),(47,7,15),(48,7,16),(49,7,17),(60,3,1),(61,3,6),(62,3,16),(63,3,17),(128,1,1),(129,1,2),(130,1,6),(131,1,7),(132,1,8),(133,1,9),(134,1,10),(135,1,11),(136,1,12),(137,1,13),(138,1,15),(139,1,16),(140,1,17),(141,1,18);

/*Table structure for table `t_ticket` */

DROP TABLE IF EXISTS `t_ticket`;

CREATE TABLE `t_ticket` (
  `memberid` int(11) DEFAULT NULL COMMENT '会员id',
  `piid` char(64) DEFAULT NULL COMMENT '流程实例的id',
  `status` char(1) DEFAULT NULL COMMENT '流程进度(0邮件已发送，1邮件已验证,2资质已审核,3资质审核失败)',
  `authcode` char(6) DEFAULT NULL COMMENT '验证码',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_ticket` */

insert  into `t_ticket`(`memberid`,`piid`,`status`,`authcode`,`id`) values (1,'5','2','norjeC',9),(4,'301','2','1LJIjg',10);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `loginacct` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `userpswd` char(32) DEFAULT NULL COMMENT '登录密码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `createtime` char(19) DEFAULT NULL COMMENT '用于排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`name`,`loginacct`,`userpswd`,`email`,`createtime`) values (1,'shuaibi','hemaochao','e10adc3949ba59abbe56e057f20f883e',NULL,NULL),(2,'username1','account1 new',NULL,'hmc@qq.com',NULL),(3,'username2','account2','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(4,'username3','account3','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(5,'username4','account4','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(6,'username5','account5','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(7,'user6','acc6','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(8,'user7','acc7','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(9,'user8','acc8','e10adc3949ba59abbe56e057f20f883e','hmc@qq.com',NULL),(12,'username','account','e10adc3949ba59abbe56e057f20f883e','hmc110@qq.com','2017-01-02 19:20:42'),(13,'ceshiren1','ceshi1','e10adc3949ba59abbe56e057f20f883e','110','2017-03-13 00:31:22');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`userid`,`roleid`) values (11,12,3),(13,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
