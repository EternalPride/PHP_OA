/*
MySQL Data Transfer
Source Host: localhost
Source Database: oa
Target Host: localhost
Target Database: oa
Date: 2018/6/14 15:59:05
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for oa_dept
-- ----------------------------
CREATE DATABASE oa DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use oa ;

DROP TABLE IF EXISTS `oa_dept`;
CREATE TABLE `oa_dept` (
  `dept_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '父部门id',
  `dept_desc` varchar(30) NOT NULL DEFAULT '' COMMENT '部门简介',
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_doc
-- ----------------------------
DROP TABLE IF EXISTS `oa_doc`;
CREATE TABLE `oa_doc` (
  `doc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `doc_title` varchar(20) NOT NULL,
  `doc_content` text NOT NULL,
  `doc_file` varchar(200) NOT NULL DEFAULT 'null',
  `doc_author` smallint(5) unsigned NOT NULL,
  `doc_ctime` datetime NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_title` (`doc_title`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_email
-- ----------------------------
DROP TABLE IF EXISTS `oa_email`;
CREATE TABLE `oa_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_title` varchar(20) NOT NULL COMMENT '邮件标题',
  `email_content` text NOT NULL COMMENT '邮件内容',
  `email_from` smallint(5) unsigned NOT NULL COMMENT '发件人',
  `email_to` smallint(5) unsigned NOT NULL COMMENT '收件人',
  `email_file` varchar(200) NOT NULL COMMENT '附件路径',
  `email_ctime` datetime NOT NULL COMMENT '发件时间',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `oa_knowledge`;
CREATE TABLE `oa_knowledge` (
  `k_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k_title` varchar(20) NOT NULL COMMENT '标题',
  `k_desc` varchar(200) NOT NULL COMMENT '描述',
  `k_content` text NOT NULL COMMENT '内容',
  `k_pic` varchar(200) NOT NULL COMMENT '原图路径',
  `k_smallpic` varchar(200) NOT NULL COMMENT '缩略图路径',
  `k_author` tinyint(3) unsigned NOT NULL COMMENT '作者id',
  `k_ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`k_id`),
  UNIQUE KEY `k_title` (`k_title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_node
-- ----------------------------
DROP TABLE IF EXISTS `oa_node`;
CREATE TABLE `oa_node` (
  `node_id` int(6) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(20) NOT NULL,
  `node_title` varchar(50) NOT NULL,
  `node_pid` smallint(6) unsigned NOT NULL,
  `node_module` varchar(20) NOT NULL DEFAULT 'null',
  `node_controller` varchar(20) NOT NULL DEFAULT 'null',
  `node_action` varchar(20) NOT NULL DEFAULT 'null',
  `node_path` varchar(255) NOT NULL,
  `node_level` tinyint(1) unsigned NOT NULL,
  `node_sort` smallint(5) unsigned NOT NULL,
  `node_show` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `node_name` (`node_name`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_role
-- ----------------------------
DROP TABLE IF EXISTS `oa_role`;
CREATE TABLE `oa_role` (
  `role_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `role_ids` varchar(200) NOT NULL,
  `role_path` text NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_user
-- ----------------------------
DROP TABLE IF EXISTS `oa_user`;
CREATE TABLE `oa_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(12) NOT NULL DEFAULT '' COMMENT '用户名，用来登录',
  `user_nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称,也可以是真实姓名',
  `user_passwd` char(32) NOT NULL DEFAULT '666666' COMMENT '用户密码',
  `user_roleid` tinyint(4) NOT NULL,
  `user_deptid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户所属部门',
  `user_sex` enum('男','女') NOT NULL DEFAULT '男',
  `user_birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_tel` char(11) NOT NULL DEFAULT '',
  `user_email` varchar(20) NOT NULL DEFAULT '',
  `user_ctime` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_nickname` (`user_nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `oa_dept` VALUES ('1', '人事部', '0', '人事部门...');
INSERT INTO `oa_dept` VALUES ('2', '财务部', '0', '财务部门...');
INSERT INTO `oa_dept` VALUES ('3', '技术部', '0', '技术部门，有3个子部门');
INSERT INTO `oa_dept` VALUES ('4', '开发部', '3', '项目研发...');
INSERT INTO `oa_dept` VALUES ('6', '运维部', '3', '网站运维...');
INSERT INTO `oa_dept` VALUES ('8', '设计部', '3', '项目UI设计部...');
INSERT INTO `oa_dept` VALUES ('12', '开发二部', '4', '项目开发二部');
INSERT INTO `oa_dept` VALUES ('9', '开发一部', '4', '海外开发一部...');
INSERT INTO `oa_doc` VALUES ('9', '公文测试123', '&lt;p&gt;公文测试123公文测试123公文测试123公文测试123公文测试123公文测试123公文测试123公文测试123公文测试123公文测试123&lt;/p&gt;', './Uploads/2017-08-05/5985893a5f016.docx', '1', '2017-08-05 17:00:43');
INSERT INTO `oa_doc` VALUES ('4', '公文测试444', '&lt;p&gt;公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444公文测试444&lt;/p&gt;', './Uploads/2017-08-05/59853dbb7b7c8.txt', '2', '2017-08-05 11:38:36');
INSERT INTO `oa_doc` VALUES ('6', '公文测试666-123', '&lt;p&gt;			&lt;/p&gt;&lt;p&gt;			&lt;/p&gt;&lt;p&gt;公文测试666公文测试666公文测试666公文测试666公文测试666公文测试666公文测试666公文测试666公文测试666公文测试666公文测试666-123123123&lt;/p&gt;&lt;p&gt;		&lt;/p&gt;&lt;p&gt;		&lt;/p&gt;', './Uploads/2017-08-05/59858dd298ef3.jpg', '1', '2017-08-05 17:20:19');
INSERT INTO `oa_doc` VALUES ('7', '牧马人Rubicon Recon将于8月', '&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; font-style: normal; font-size: 16px; line-height: 2em; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-weight: normal; white-space: normal;&quot;&gt;日前，我们从Jeep官方了解到，牧马人十年限量珍藏版Rubicon Recon车型将于8月18日正式上市。这一代牧马人作为牧马人的第三代车型，上市已有十年时间，而该特别版车型则是为纪念众多越野迷的“十年偶像”而推出。&lt;/p&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;margin-top: 40px; margin-bottom: 40px; font-style: normal; text-align: center; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://n.sinaimg.cn/auto/transform/20170804/B87w-fyitamv4983111.jpg&quot; alt=&quot;牧马人Rubicon Recon将于8月18日上市&quot; data-link=&quot;&quot; style=&quot;margin-right: auto; margin-left: auto; font-style: normal; display: block; max-width: 660px;&quot;/&gt;&lt;span class=&quot;img_descr&quot; style=&quot;margin-left: 0px; font-style: normal; line-height: 24px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;margin-top: 40px; margin-bottom: 40px; font-style: normal; text-align: center; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://n.sinaimg.cn/auto/transform/20170804/ezMA-fyitapv7522066.jpg&quot; alt=&quot;牧马人Rubicon Recon将于8月18日上市&quot; data-link=&quot;&quot; style=&quot;margin-right: auto; margin-left: auto; font-style: normal; display: block; max-width: 660px;&quot;/&gt;&lt;span class=&quot;img_descr&quot; style=&quot;margin-left: 0px; font-style: normal; line-height: 24px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;p&gt;&lt;ins class=&quot;sinaads sinaads-fail&quot; id=&quot;Sina_Plista_AD&quot; data-ad-pdps=&quot;PDPS000000059667&quot; data-ad-status=&quot;done&quot; style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; white-space: normal;&quot;&gt;&lt;/ins&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; font-style: normal; font-size: 16px; line-height: 2em; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-weight: normal; white-space: normal;&quot;&gt;　　新车曾在2017上海车展首发，外观方面，新车采用了灰绿色涂装，保险杠与进气格栅采用哑光喷涂，并采用软性敞篷设计，巨大的黑色轮拱和粗犷的AT轮胎，显得整个外观非常强悍硬朗。&lt;/p&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;margin-top: 40px; margin-bottom: 40px; font-style: normal; text-align: center; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal;&quot;&gt;&lt;img class=&quot;imgborder&quot; src=&quot;http://n.sinaimg.cn/auto/crawl/20170723/8HcV-fyiiahy7051483.jpg&quot; alt=&quot;牧马人Rubicon Recon将于8月18日上市&quot; style=&quot;margin-right: auto; margin-left: auto; font-style: normal; display: block; max-width: 660px;&quot;/&gt;&lt;span class=&quot;img_descr&quot; style=&quot;margin-left: 0px; font-style: normal; line-height: 24px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;margin-top: 40px; margin-bottom: 40px; font-style: normal; text-align: center; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal;&quot;&gt;&lt;img class=&quot;imgborder&quot; src=&quot;http://n.sinaimg.cn/auto/crawl/20170723/PJQK-fyiiahy7051495.jpg&quot; alt=&quot;牧马人Rubicon Recon将于8月18日上市&quot; style=&quot;margin-right: auto; margin-left: auto; font-style: normal; display: block; max-width: 660px;&quot;/&gt;&lt;span class=&quot;img_descr&quot; style=&quot;margin-left: 0px; font-style: normal; line-height: 24px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; font-style: normal; font-size: 16px; line-height: 2em; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-weight: normal; white-space: normal;&quot;&gt;　　内饰方面，特别版车型的整体内饰风格与普通版牧马人保持基本一致，特殊的地方在于新车的座椅采用红色缝线装饰，同时安全带也为红色配色，此外，在座椅上还镶有Rubicon的红色英文标识。&lt;/p&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;margin-top: 40px; margin-bottom: 40px; font-style: normal; text-align: center; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal;&quot;&gt;&lt;img class=&quot;imgborder&quot; src=&quot;http://n.sinaimg.cn/auto/crawl/20170723/8ai2-fyiiahy7051472.jpg&quot; alt=&quot;牧马人Rubicon Recon将于8月18日上市&quot; style=&quot;margin-right: auto; margin-left: auto; font-style: normal; display: block; max-width: 660px;&quot;/&gt;&lt;span class=&quot;img_descr&quot; style=&quot;margin-left: 0px; font-style: normal; line-height: 24px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;img_wrapper&quot; style=&quot;margin-top: 40px; margin-bottom: 40px; font-style: normal; text-align: center; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal;&quot;&gt;&lt;img class=&quot;imgborder&quot; src=&quot;http://n.sinaimg.cn/auto/crawl/20170723/zm1Q-fyiiahy7051476.jpg&quot; alt=&quot;牧马人Rubicon Recon将于8月18日上市&quot; style=&quot;margin-right: auto; margin-left: auto; font-style: normal; display: block; max-width: 660px;&quot;/&gt;&lt;span class=&quot;img_descr&quot; style=&quot;margin-left: 0px; font-style: normal; line-height: 24px; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;div id=&quot;ad_49438&quot; class=&quot;otherContent_01&quot; style=&quot;margin-top: 10px; margin-right: 20px; margin-bottom: 10px; padding: 4px; font-style: normal; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-size: 16px; font-weight: normal; white-space: normal; float: left; clear: both; overflow: hidden;&quot;&gt;&lt;ins class=&quot;sinaads sinaads-done&quot; id=&quot;sinaadsInsId&quot; data-ad-pdps=&quot;PDPS000000049438&quot; data-ad-status=&quot;done&quot; style=&quot;display: block; overflow: hidden; text-decoration-line: none; width: 300px; height: 250px;&quot;&gt;&lt;ins style=&quot;text-decoration-line: none; margin: 0px auto; width: 300px; display: block; position: relative; overflow: hidden;&quot;&gt;&lt;iframe width=&quot;300px&quot; height=&quot;250px&quot; frameborder=&quot;0&quot; marginwidth=&quot;0&quot; marginheight=&quot;0&quot; vspace=&quot;0&quot; hspace=&quot;0&quot; allowtransparency=&quot;true&quot; scrolling=&quot;no&quot; src=&quot;http://static-alias-1.360buyimg.com/jzt/tpl/sspPic.html?ad_ids=2425:5&amp;adflag=0&amp;clkmn=&amp;expose=&quot; name=&quot;clickTAG=http%3A%2F%2Fsaxn.sina.com.cn%2Fmfp%2Fclick%3Ftype%3D3%26t%3DMjAxNy0wOC0wNSAxNDozMToxNgkxMjQuMjA1LjIyOC4xMzAJMjExLjEwMy4xNDIuMjZfMTQ5NjczNDk1OS42MTcyODkJaHR0cDovL2F1dG8uc2luYS5jb20uY24vbmV3Y2FyLzIwMTctMDgtMDQvZGV0YWlsLWlmeWl0YW12NDk4Mzk0My5zaHRtbAlQRFBTMDAwMDAwMDQ5NDM4CWZhNTNkYTQ5LTVhMDUtNGU1Zi1iYWM5LWM0NzhhOTBjNTExMQkyQkQzRDkxNzZFRkEJMkJEM0Q5MTc2RUZBXzA5RDg5OEJFOTg2RQlhdXRvX2xldmVsOjE4MDEwMHx1c2VyX2dyb3VwOjkwNyw5MDJ8dXNlcl90YWc6MjEyNzUsMjA3MzYsMjA5NTV8cG9zOlBEUFMwMDAwMDAwNDk0Mzh8d2FwX29zOjcwMHx1c2VyX2FnZTo2MDMsNjA0LDYwMnx2X3pvbmU6MzAyMDAwLDMwMjAwMHx1c2VyX2dlbmRlcjo1MDF8X3Zfem9uZTozMDIwMDAsMzAyMDAwfGF1dG9fcHJpY2U6MTgwMjAwfG1vYmlsZV9icmFuZDoxMjA5fG1vYmlsZV9icm93c2VyOjgwNXx2ZXJzaW9uOmdsX2JwMV8xLHJ0OjIuMCxwYzoxLjAJCTMwMjAwMHwzMDIwMDAJNjhFNEQ1RjgzMjMyCUxZMTcwNDA5OTkJUERQUzAwMDAwMDA0OTQzOAk2OEU0RDVGODMyMzJfcG9ydGFsCUFFCS0JMTEJLQktCS0JLQktCS0JLQktCS0JMTQJc3RyYXRlZ3lfY2FycmllcgkwCTYJY2hhbm5lbDI6bmV3c19jfGlncnBfY3RyOjEuMjY4NTQ4MzIzNjQzNTY0MkUtNHxpZ3JwTnVtOjF8b3M6d2luZG93czd8YnJvd3NlcjpjaHJvbWV8cGxhdGZvcm06b3RoZXJ8ZGV2aWNlOm90aGVyfGFkUGxhdEZvcm06MA%253D%253D&amp;amp;viewTAG=%2F%2Fsaxn.sina.com.cn%2Fmfp%2Fview%3Ftype%3D3%26t%3DMjAxNy0wOC0wNSAxNDozMToxNgkxMjQuMjA1LjIyOC4xMzAJMjExLjEwMy4xNDIuMjZfMTQ5NjczNDk1OS42MTcyODkJaHR0cDovL2F1dG8uc2luYS5jb20uY24vbmV3Y2FyLzIwMTctMDgtMDQvZGV0YWlsLWlmeWl0YW12NDk4Mzk0My5zaHRtbAlQRFBTMDAwMDAwMDQ5NDM4CWZhNTNkYTQ5LTVhMDUtNGU1Zi1iYWM5LWM0NzhhOTBjNTExMQkyQkQzRDkxNzZFRkEJMkJEM0Q5MTc2RUZBXzA5RDg5OEJFOTg2RQlhdXRvX2xldmVsOjE4MDEwMHx1c2VyX2dyb3VwOjkwNyw5MDJ8dXNlcl90YWc6MjEyNzUsMjA3MzYsMjA5NTV8cG9zOlBEUFMwMDAwMDAwNDk0Mzh8d2FwX29zOjcwMHx1c2VyX2FnZTo2MDMsNjA0LDYwMnx2X3pvbmU6MzAyMDAwLDMwMjAwMHx1c2VyX2dlbmRlcjo1MDF8X3Zfem9uZTozMDIwMDAsMzAyMDAwfGF1dG9fcHJpY2U6MTgwMjAwfG1vYmlsZV9icmFuZDoxMjA5fG1vYmlsZV9icm93c2VyOjgwNXx2ZXJzaW9uOmdsX2JwMV8xLHJ0OjIuMCxwYzoxLjAJCTMwMjAwMHwzMDIwMDAJNjhFNEQ1RjgzMjMyCUxZMTcwNDA5OTkJUERQUzAwMDAwMDA0OTQzOAk2OEU0RDVGODMyMzJfcG9ydGFsCUFFCS0JMTEJLQktCS0JLQktCS0JLQktCS0JMTQJc3RyYXRlZ3lfY2FycmllcgkwCTYJY2hhbm5lbDI6bmV3c19jfGlncnBfY3RyOjEuMjY4NTQ4MzIzNjQzNTY0MkUtNHxpZ3JwTnVtOjF8b3M6d2luZG93czd8YnJvd3NlcjpjaHJvbWV8cGxhdGZvcm06b3RoZXJ8ZGV2aWNlOm90aGVyfGFkUGxhdEZvcm06MA%253D%253D%26userid%3D211.103.142.26_1496734959.617289%26viewlog%3Dfalse%26hashCode%3Dcb8e8938f40484b164bfd29c159b1a81&quot; style=&quot;font-style: normal;&quot;&gt;&lt;/iframe&gt;&lt;/ins&gt;&lt;/ins&gt;&lt;/div&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; font-style: normal; font-size: 16px; line-height: 2em; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-weight: normal; white-space: normal;&quot;&gt;　　动力方面，牧马人Rubicon Recon特别版搭载了一台3.6L V6自然吸气发动机，最大功率达到208千瓦，峰值扭矩达到347牛米。传动方面，新车匹配5速手自一体变速箱。此外新车还在越野能力方面有所加强，前后差速器进行强化，并加入FOX品牌的减震系统。&lt;/p&gt;&lt;p class=&quot;txt-right&quot; style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; font-style: normal; text-align: right; font-size: 16px; line-height: 2em; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Simsun; font-weight: normal; white-space: normal;&quot;&gt;责任编辑：郭睿&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'null', '1', '2017-08-05 14:31:36');
INSERT INTO `oa_doc` VALUES ('8', '买SUV车型需注意，这几款烧机油的SUV', '&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;首先科普什么是烧机油，烧机油指&lt;a href=&quot;http://auto.sina.cn/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;汽车&lt;/a&gt;在行驶过程中，本身用于润滑的机油进入了燃烧室，然后共同参与燃烧。我们在马路上见到的汽车排气筒冒蓝烟就是典型的烧机油现象。烧机油会导致发动机燃烧室内积碳增加，动力下降和排放污染等问题，严重的情况下可能对发动机造成致命伤害。&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://n.sinaimg.cn/sinacn/20170803/5826-fyitpmh1018430.jpg&quot; w=&quot;377&quot; h=&quot;665&quot; wh=&quot;0.57&quot; alt=&quot;买SUV车型需注意，这几款烧机油的SUV还是不碰为妙&quot; style=&quot;list-style: none; max-width: 630px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;提起烧机油我们首先想到德系车，确实如此，德系的&lt;a href=&quot;http://db.auto.sina.cn/tags/847/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;奥迪&lt;/a&gt;和&lt;a href=&quot;http://db.auto.sina.cn/tags/843/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;宝马&lt;/a&gt;烧机油问题普遍存在。在这个调查数据中，烧机油的&lt;a href=&quot;http://db.auto.sina.cn/list-0-5-0-0-0-0-0-0-9-0-1.html&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;SUV&lt;/a&gt;车型有：宝马&lt;a href=&quot;http://db.auto.sina.cn/411/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;X5&lt;/a&gt;、&lt;a href=&quot;http://db.auto.sina.cn/710/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;奥迪Q5&lt;/a&gt;、&lt;a href=&quot;http://db.auto.sina.cn/tags/671/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;保时捷&lt;/a&gt;&lt;a href=&quot;http://db.auto.sina.cn/372/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;卡宴&lt;/a&gt;、&lt;a href=&quot;http://db.auto.sina.cn/tags/917/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;斯巴鲁&lt;/a&gt;&lt;a href=&quot;http://db.auto.sina.cn/227/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;傲虎&lt;/a&gt;和&lt;a href=&quot;http://db.auto.sina.cn/229/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;森林人&lt;/a&gt;、&lt;a href=&quot;http://db.auto.sina.cn/2079/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;沃尔沃XC60&lt;/a&gt;。其中在国内关注度和销量最高的就是奥迪Q5、宝马X5。&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://n.sinaimg.cn/sinacn/20170803/64a8-fyitapp0271045.jpg&quot; w=&quot;1280&quot; h=&quot;859&quot; wh=&quot;1.49&quot; alt=&quot;买SUV车型需注意，这几款烧机油的SUV还是不碰为妙&quot; style=&quot;list-style: none; max-width: 630px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;为什么德系车烧机油比较严重？有两种说法，第一种是说发动机汽缸壁内有网状结构，目的是每次活塞运动都能在网状结构中存入少量机油，从而增加润滑效果，增加发动机寿命。第二种说法是：德系车烧机油完全是自身&lt;a href=&quot;http://auto.sina.cn/jishu/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;技术&lt;/a&gt;上的问题，是发动机不够成熟的表现。小编个人更赞同后者，因为站在消费者的角度来考虑，烧机油带来了诸多不便和养车费用的增加，而所谓的增加润滑和寿命完全是谬论，日系车不烧机油发动机寿命就低了？小编公司有07年行驶30万公里的奥迪A6和&lt;a href=&quot;http://db.auto.sina.cn/tags/887/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;丰田&lt;/a&gt;&lt;a href=&quot;http://db.auto.sina.cn/160/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;皇冠&lt;/a&gt;，奥迪因为烧机油太严重已经大修发动机（花费3万多），而皇冠至今三大件无任何故障。&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://n.sinaimg.cn/sinacn/20170803/d79e-fyitapv7310184.jpg&quot; w=&quot;1632&quot; h=&quot;1224&quot; wh=&quot;1.33&quot; alt=&quot;买SUV车型需注意，这几款烧机油的SUV还是不碰为妙&quot; style=&quot;list-style: none; max-width: 630px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;烧机油排行榜上的宝马X5属于纯&lt;a href=&quot;http://db.auto.sina.cn/tags/biaoqian/jinkouche/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;进口车&lt;/a&gt;型，奥迪Q5已经国产，两台车都是国内非常火爆的车型，但烧机油现象依旧很严重。还有一种理论讲：国内德系车烧机油比较严重，原因是国内拥堵路面经常走走停停，和车辆保养时使用质量不合格的机油所导致。这个原因有一定的说服力，因为一般人保养不会选择4S店，而在路边修理店保养的机油可靠性不能保障，调查显示长期使用粘性较稳定的机油对烧机油现象有一定遏制。&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;&lt;img src=&quot;http://n.sinaimg.cn/sinacn/20170803/fc78-fyitpmh1018513.jpg&quot; w=&quot;1600&quot; h=&quot;900&quot; wh=&quot;1.78&quot; alt=&quot;买SUV车型需注意，这几款烧机油的SUV还是不碰为妙&quot; style=&quot;list-style: none; max-width: 630px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 15px; margin-bottom: 15px; padding-left: 0px; list-style: none; font-size: 18px; line-height: 32px; color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;, 微软雅黑, SimSun, 宋体; font-style: normal; font-weight: normal; white-space: normal;&quot;&gt;排行榜上很奇怪的出现了斯巴鲁汽车，有斯巴鲁傲虎和斯巴鲁森林人两款SUV，这两款SUV在欧洲市场和北美市场销量是非常火爆的，最大的优点就是车辆皮实，斯巴鲁独有的四驱系统和高性能水平对置发动机非常优秀，成就了斯巴鲁较高的越野通过性和可靠性。但斯巴鲁一改日系车不烧机油的好形象，猜测原因可能是斯巴鲁比较擅长重工制造，车辆发动机不如丰田和&lt;a href=&quot;http://db.auto.sina.cn/tags/849/&quot; style=&quot;color: rgb(4, 84, 167);&quot;&gt;本田&lt;/a&gt;精密度高。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'null', '1', '2017-08-05 14:32:22');
INSERT INTO `oa_knowledge` VALUES ('1', '知识测试111', '知识测试111知识测试111知识测试111知识测试111知识测试111', '知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111知识测试111', './Uploads/2017-08-06/5986bd048abb9.jpg', './Uploads/2017-08-06/thumb_5986bd048abb9.jpg', '1', '2017-08-06 14:53:59');
INSERT INTO `oa_node` VALUES ('1', '日常办公', 'office', '0', 'kong', 'kong', 'kong', 'kong', '0', '1', '1');
INSERT INTO `oa_node` VALUES ('2', '组织结构', 'agency', '0', 'kong', 'kong', 'kong', 'kong', '0', '2', '1');
INSERT INTO `oa_node` VALUES ('3', '部门列表', 'kong', '2', 'Admin', 'Dept', 'index', 'Admin-Dept-index', '1', '21', '1');
INSERT INTO `oa_node` VALUES ('4', '删除部门', 'kong', '2', 'Admin', 'Dept', 'delDept', 'Admin-Dept-delDept', '1', '22', '0');
INSERT INTO `oa_node` VALUES ('5', '添加部门', 'kong', '2', 'Admin', 'Dept', 'add', 'Admin-Dept-add', '1', '23', '1');
INSERT INTO `oa_node` VALUES ('6', '编辑部门', 'kong', '2', 'Admin', 'Dept', 'editDept', 'Admin-Dept-editDept', '1', '24', '0');
INSERT INTO `oa_node` VALUES ('10', '职员管理', 'nav-info', '0', 'kong', 'kong', 'kong', 'kong', '0', '10', '1');
INSERT INTO `oa_node` VALUES ('11', '职员列表', '', '10', 'Admin', 'User', 'index', 'Admin-User-index', '1', '101', '1');
INSERT INTO `oa_node` VALUES ('12', '添加职员', '', '10', 'Admin', 'User', 'add', 'Admin-User-add', '1', '102', '1');
INSERT INTO `oa_node` VALUES ('13', '添加职员操作', '', '10', 'Admin', 'User', 'addOk', 'Admin-User-addOk', '1', '103', '0');
INSERT INTO `oa_node` VALUES ('14', 'ajax分页', '', '10', 'Admin', 'User', 'getUsers', 'Admin-User-getUsers', '1', '104', '0');
INSERT INTO `oa_node` VALUES ('15', '统计图', '', '10', 'Admin', 'User', 'charts', 'Admin-User-charts', '1', '105', '0');
INSERT INTO `oa_node` VALUES ('16', '编辑职员', '', '10', 'Admin', 'User', 'edit', 'Admin-User-edit', '1', '106', '0');
INSERT INTO `oa_node` VALUES ('17', '修改职员', '', '10', 'Admin', 'User', 'modify', 'Admin-User-modify', '1', '107', '0');
INSERT INTO `oa_node` VALUES ('18', '删除职员', '', '10', 'Admin', 'User', 'del', 'Admin-User-del', '1', '108', '0');
INSERT INTO `oa_node` VALUES ('19', '公文起草', 'gongwen', '0', 'kong', 'kong', 'kong', 'kong', '0', '19', '1');
INSERT INTO `oa_node` VALUES ('20', '公文管理', 'index', '19', 'Admin', 'Doc', 'index', 'Admin-Doc-index', '1', '191', '1');
INSERT INTO `oa_node` VALUES ('21', '添加公文', 'add', '19', 'Admin', 'Doc', 'add', 'Admin-Doc-add', '1', '192', '1');
INSERT INTO `oa_node` VALUES ('22', '知识管理', 'konwledge', '0', 'kong', 'kong', 'kong', 'kong', '0', '22', '1');
INSERT INTO `oa_node` VALUES ('23', '知识列表', 'index', '22', 'Admin', 'Knowledge', 'index', 'Admin-Knowledge-index', '1', '221', '1');
INSERT INTO `oa_node` VALUES ('24', '添加知识', 'add', '22', 'Admin', 'Knowledge', 'add', 'Admin-Knowledge-add', '1', '222', '1');
INSERT INTO `oa_node` VALUES ('25', '邮件管理', 'email', '0', 'kong', 'kong', 'kong', 'kong', '0', '25', '1');
INSERT INTO `oa_node` VALUES ('26', '收件箱', '', '25', 'Admin', 'Email', 'index', 'Admin-Email-index', '1', '251', '1');
INSERT INTO `oa_node` VALUES ('27', '写邮件', '', '25', 'Admin', 'Email', 'send', 'Admin-Email-add', '1', '252', '1');
INSERT INTO `oa_node` VALUES ('28', '系统管理', 'system', '0', 'kong', 'kong', 'kong', 'kong', '0', '7', '1');
INSERT INTO `oa_node` VALUES ('29', '角色管理', 'role', '28', 'Admin', 'Role', 'index', 'Admin-Role-index', '1', '281', '1');
INSERT INTO `oa_node` VALUES ('30', '节点管理', 'node', '28', 'Admin', 'Node', 'index', 'Admin-Node-index', '1', '282', '1');
INSERT INTO `oa_node` VALUES ('31', '分配权限', '', '28', 'Admin', 'Role', 'distribute', 'Admin-Role-distribute', '1', '283', '1');
INSERT INTO `oa_role` VALUES ('1', '超级管理员', '1,2,3,4,5,6,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31', 'Admin-Main-index,Admin-Main-home,Admin-Dept-index,Admin-Dept-delDept,Admin-Dept-add,Admin-Dept-editDept,Admin-User-index,Admin-User-add,Admin-User-addOk,Admin-User-getUsers,Admin-User-charts,Admin-User-edit,Admin-User-modify,Admin-User-del,Admin-Doc-index,Admin-Doc-add,Admin-Knowledge-index,Admin-Knowledge-add,Admin-Email-index,Admin-Email-add,Admin-Role-index,Admin-Node-index,Admin-Role-distribute');
INSERT INTO `oa_role` VALUES ('2', '系统管理员', '25,27,28,29,30,31', 'Admin-Main-index,Admin-Main-home,Admin-Email-add,Admin-Role-index,Admin-Node-index,Admin-Role-distribute');
INSERT INTO `oa_role` VALUES ('3', '总经理', '1,2,3,4,5,6,10,11,12,13,14,15,16,17,18', 'Admin-Main-index,Admin-Main-home,Admin-Dept-index,Admin-Dept-delDept,Admin-Dept-add,Admin-Dept-editDept,Admin-User-index,Admin-User-add,Admin-User-addOk,Admin-User-getUsers,Admin-User-charts,Admin-User-edit,Admin-User-modify,Admin-User-del');
INSERT INTO `oa_user` VALUES ('1', 'root', '超级管理员', '4297f44b13955235245b2497399d7a93', '1', '1', '男', '0000-00-00', '13312345678', 'root@abc.com', '0000-00-00');
INSERT INTO `oa_user` VALUES ('2', 'admin', '系统管理员', '4297f44b13955235245b2497399d7a93', '2', '1', '男', '0000-00-00', '13012345678', 'admin@abc.com', '0000-00-00');
INSERT INTO `oa_user` VALUES ('3', 'zhangfei', '张飞', '4297f44b13955235245b2497399d7a93', '3', '9', '男', '1992-08-06', '18012345678', 'zhangfei@abc.com', '2017-08-03');
INSERT INTO `oa_user` VALUES ('4', 'zhangsanfeng', '张三丰', '4297f44b13955235245b2497399d7a93', '3', '5', '男', '1982-08-04', '18112345678', 'zsf@abc.com', '2017-08-04');
INSERT INTO `oa_user` VALUES ('5', 'zhangwuji', '张无忌', '4297f44b13955235245b2497399d7a93', '3', '6', '男', '1994-08-04', '18212345678', 'zwj@abc.com', '2017-08-04');
INSERT INTO `oa_user` VALUES ('6', 'zhangxuefeng', '张雪峰', '4297f44b13955235245b2497399d7a93', '2', '2', '男', '1993-08-04', '18312345678', 'zxf@abc.com', '2017-08-04');
INSERT INTO `oa_user` VALUES ('7', 'zhangmin', '张敏', '4297f44b13955235245b2497399d7a93', '2', '1', '女', '1998-08-04', '13312312312', 'zm@abc.com', '2017-08-04');
INSERT INTO `oa_user` VALUES ('8', 'lilianjie', '李连杰', '4297f44b13955235245b2497399d7a93', '2', '12', '男', '1995-08-04', '13612345678', 'llj@abc.com', '2017-08-04');
INSERT INTO `oa_user` VALUES ('9', 'aabbdd', '无名氏', '4297f44b13955235245b2497399d7a93', '3', '9', '女', '1999-08-04', '15612345678', 'abd@abc.com', '2017-08-04');
