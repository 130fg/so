DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `registered_users`;
CREATE TABLE `registered_users`(registered_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '注册用户ID',
`user_no` varchar(64) comment '用户编号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (registered_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '注册用户';

DROP TABLE IF EXISTS `tourism_sharing`;
CREATE TABLE `tourism_sharing`(tourism_sharing_id int(11) NOT NULL AUTO_INCREMENT COMMENT '旅游分享ID',
`title` varchar(64) comment '标题',
`cover` varchar(255) comment '封面',
`type` varchar(64) comment '类型',
`tourist_location` varchar(64) comment '旅游地点',
`release_time` date comment '发布时间',
`user_no` int(11) DEFAULT 0 comment '用户编号',
`full_name` varchar(64) comment '姓名',
`related_videos` varchar(255) comment '相关视频',
`resource_acquisition` varchar(255) comment '资源获取',
`details` longtext comment '详情介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (tourism_sharing_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '旅游分享';
insert into `tourism_sharing` values (1,'标题1','/api/upload/1566801151515426816.jpg','类型1','旅游地点1','2023-05-11',0,'姓名1','','www.xn---xn--2br-jy1pw899a.com','此处可上传文字、图片、视频、超链接、表格等内容区1',68,653,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (2,'标题2','/api/upload/1566801087095111681.jpg','类型2','旅游地点2','2023-05-11',0,'姓名2','','www.xn---xn--qpr-c24os58l.co','此处可上传文字、图片、视频、超链接、表格等内容区2',592,465,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (3,'标题3','/api/upload/1567336038332891136.jpg','类型3','旅游地点3','2023-05-11',0,'姓名3','','www.xn---xn--nw5a-pe5s.net','此处可上传文字、图片、视频、超链接、表格等内容区3',641,204,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (4,'标题4','/api/upload/1566801289206038529.jpg','类型4','旅游地点4','2023-05-11',0,'姓名4','','www.xn---xn--mrv-6z9mp85v.org','此处可上传文字、图片、视频、超链接、表格等内容区4',566,548,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (5,'标题5','/api/upload/1566801029398265856.jpg','类型5','旅游地点5','2023-05-11',0,'姓名5','','www.xn---xn--2yw-815qw893a.co','此处可上传文字、图片、视频、超链接、表格等内容区5',848,986,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (6,'标题6','/api/upload/1566801214711005184.jpg','类型6','旅游地点6','2023-05-11',0,'姓名6','','www.xn---xn--m8s-2t5ot47f.com','此处可上传文字、图片、视频、超链接、表格等内容区6',812,277,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (7,'标题7','/api/upload/1567336118179856385.jpg','类型7','旅游地点7','2023-05-11',0,'姓名7','','www.xn---xn--lm6a-kn5w663t.com','此处可上传文字、图片、视频、超链接、表格等内容区7',580,280,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `tourism_sharing` values (8,'标题8','/api/upload/1566800951921082369.jpg','类型8','旅游地点8','2023-05-11',0,'姓名8','','www.xn---xn--69s-wb8rme.com','此处可上传文字、图片、视频、超链接、表格等内容区8',317,430,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');

DROP TABLE IF EXISTS `thematic_activities`;
CREATE TABLE `thematic_activities`(thematic_activities_id int(11) NOT NULL AUTO_INCREMENT COMMENT '主题活动ID',
`activity_name` varchar(64) comment '活动名称',
`picture` varchar(255) comment '图片',
`activity_type` varchar(64) comment '活动类型',
`event_location` varchar(64) comment '活动地点',
`activity_time` date comment '活动时间',
`event_details` longtext comment '活动详情',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (thematic_activities_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '主题活动';
insert into `thematic_activities` values (1,'活动名称1','/api/upload/1582204527036071937.jpg','活动类型1','活动地点1','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区1',178,307,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (2,'活动名称2','/api/upload/1582204415496945665.jpg','活动类型2','活动地点2','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区2',116,570,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (3,'活动名称3','/api/upload/1582204481213300736.jpg','活动类型3','活动地点3','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区3',941,39,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (4,'活动名称4','/api/upload/1582204252682452993.jpg','活动类型4','活动地点4','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区4',735,511,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (5,'活动名称5','/api/upload/1582204312686166017.jpg','活动类型5','活动地点5','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区5',763,383,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (6,'活动名称6','/api/upload/1582204207161671681.jpg','活动类型6','活动地点6','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区6',235,368,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (7,'活动名称7','/api/upload/1582204360031469569.jpg','活动类型7','活动地点7','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区7',850,525,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');
insert into `thematic_activities` values (8,'活动名称8','/api/upload/1582204147157958656.jpg','活动类型8','活动地点8','2023-05-11','此处可上传文字、图片、视频、超链接、表格等内容区8',150,685,0,'2023-05-11 14:45:42','2023-05-11 14:45:42');

DROP TABLE IF EXISTS `registration_record`;
CREATE TABLE `registration_record`(registration_record_id int(11) NOT NULL AUTO_INCREMENT COMMENT '报名记录ID',
`activity_name` varchar(64) comment '活动名称',
`picture` varchar(255) comment '图片',
`activity_type` varchar(64) comment '活动类型',
`event_location` varchar(64) comment '活动地点',
`activity_time` varchar(64) comment '活动时间',
`user_no` int(11) DEFAULT 0 comment '用户编号',
`full_name` varchar(64) comment '姓名',
`registration_time` date comment '报名时间',
`number_of_applicants` int(11) DEFAULT 0 comment '报名人数',
`contact_number` varchar(64) comment '联系电话',
`additional_notes` varchar(64) comment '附加说明',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (registration_record_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '报名记录';
insert into `registration_record` values (1,'活动名称1','/api/upload/1582204252682452993.jpg','活动类型1','活动地点1','活动时间1',0,'姓名1','2023-05-11',1,'联系电话1','附加说明1',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (2,'活动名称2','/api/upload/1582204527036071937.jpg','活动类型2','活动地点2','活动时间2',0,'姓名2','2023-05-11',2,'联系电话2','附加说明2',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (3,'活动名称3','/api/upload/1582204207161671681.jpg','活动类型3','活动地点3','活动时间3',0,'姓名3','2023-05-11',3,'联系电话3','附加说明3',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (4,'活动名称4','/api/upload/1582204415496945665.jpg','活动类型4','活动地点4','活动时间4',0,'姓名4','2023-05-11',4,'联系电话4','附加说明4',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (5,'活动名称5','/api/upload/1582204481213300736.jpg','活动类型5','活动地点5','活动时间5',0,'姓名5','2023-05-11',5,'联系电话5','附加说明5',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (6,'活动名称6','/api/upload/1582204312686166017.jpg','活动类型6','活动地点6','活动时间6',0,'姓名6','2023-05-11',6,'联系电话6','附加说明6',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (7,'活动名称7','/api/upload/1582204360031469569.jpg','活动类型7','活动地点7','活动时间7',0,'姓名7','2023-05-11',7,'联系电话7','附加说明7',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `registration_record` values (8,'活动名称8','/api/upload/1582204147157958656.jpg','活动类型8','活动地点8','活动时间8',0,'姓名8','2023-05-11',8,'联系电话8','附加说明8',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

DROP TABLE IF EXISTS `home_stay_information`;
CREATE TABLE `home_stay_information`(home_stay_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '民宿信息ID',
`title` varchar(64) comment '标题',
`cover` varchar(255) comment '封面',
`type` varchar(64) comment '类型',
`house_type` varchar(64) comment '户型',
`square` varchar(64) comment '平方',
`price` varchar(64) comment '价格',
`supporting_facilities` varchar(64) comment '配套设施',
`advance_deposit` int(11) DEFAULT 0 comment '预付定金',
`home_address` varchar(64) comment '民宿地址',
`details` longtext comment '详情介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (home_stay_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '民宿信息';
insert into `home_stay_information` values (1,'标题1','/api/upload/1580812636965044225.jpg','类型1','户型1','平方1','价格1','配套设施1',1,'民宿地址1','此处可上传文字、图片、视频、超链接、表格等内容区1',415,399,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (2,'标题2','/api/upload/1580812747514314753.jpg','类型2','户型2','平方2','价格2','配套设施2',2,'民宿地址2','此处可上传文字、图片、视频、超链接、表格等内容区2',232,271,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (3,'标题3','/api/upload/1580812537169969152.jpg','类型3','户型3','平方3','价格3','配套设施3',3,'民宿地址3','此处可上传文字、图片、视频、超链接、表格等内容区3',375,540,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (4,'标题4','/api/upload/1580812488918695936.jpg','类型4','户型4','平方4','价格4','配套设施4',4,'民宿地址4','此处可上传文字、图片、视频、超链接、表格等内容区4',10,27,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (5,'标题5','/api/upload/1580812700605218816.jpg','类型5','户型5','平方5','价格5','配套设施5',5,'民宿地址5','此处可上传文字、图片、视频、超链接、表格等内容区5',342,31,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (6,'标题6','/api/upload/1580812590471184384.jpg','类型6','户型6','平方6','价格6','配套设施6',6,'民宿地址6','此处可上传文字、图片、视频、超链接、表格等内容区6',65,839,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (7,'标题7','/api/upload/1580812803919314945.jpg','类型7','户型7','平方7','价格7','配套设施7',7,'民宿地址7','此处可上传文字、图片、视频、超链接、表格等内容区7',772,607,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `home_stay_information` values (8,'标题8','/api/upload/1580812434413715457.jpg','类型8','户型8','平方8','价格8','配套设施8',8,'民宿地址8','此处可上传文字、图片、视频、超链接、表格等内容区8',860,615,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

DROP TABLE IF EXISTS `reservation_information`;
CREATE TABLE `reservation_information`(reservation_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '预订信息ID',
`title` varchar(64) comment '标题',
`cover` varchar(255) comment '封面',
`house_type` varchar(64) comment '户型',
`supporting_facilities` varchar(64) comment '配套设施',
`advance_deposit` varchar(64) comment '预付定金',
`user_no` int(11) DEFAULT 0 comment '用户编号',
`full_name` varchar(64) comment '姓名',
`check_in_time` date comment '入住时间',
`contact_number` varchar(64) comment '联系电话',
`remarks` varchar(64) comment '备注',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (reservation_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '预订信息';
insert into `reservation_information` values (1,'标题1','/api/upload/1580812537169969152.jpg','户型1','配套设施1','预付定金1',0,'姓名1','2023-05-11','联系电话1','备注1','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (2,'标题2','/api/upload/1580812636965044225.jpg','户型2','配套设施2','预付定金2',0,'姓名2','2023-05-11','联系电话2','备注2','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (3,'标题3','/api/upload/1580812700605218816.jpg','户型3','配套设施3','预付定金3',0,'姓名3','2023-05-11','联系电话3','备注3','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (4,'标题4','/api/upload/1580812488918695936.jpg','户型4','配套设施4','预付定金4',0,'姓名4','2023-05-11','联系电话4','备注4','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (5,'标题5','/api/upload/1580812590471184384.jpg','户型5','配套设施5','预付定金5',0,'姓名5','2023-05-11','联系电话5','备注5','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (6,'标题6','/api/upload/1580812803919314945.jpg','户型6','配套设施6','预付定金6',0,'姓名6','2023-05-11','联系电话6','备注6','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (7,'标题7','/api/upload/1580812747514314753.jpg','户型7','配套设施7','预付定金7',0,'姓名7','2023-05-11','联系电话7','备注7','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `reservation_information` values (8,'标题8','/api/upload/1580812434413715457.jpg','户型8','配套设施8','预付定金8',0,'姓名8','2023-05-11','联系电话8','备注8','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

DROP TABLE IF EXISTS `specialty_information`;
CREATE TABLE `specialty_information`(specialty_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '特产信息ID',
`number` varchar(64) comment '编号',
`name` varchar(64) comment '名称',
`picture` varchar(255) comment '图片',
`type` varchar(64) comment '类型',
`price` int(11) DEFAULT 0 comment '价格',
`details` longtext comment '详情',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (specialty_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '特产信息';
insert into `specialty_information` values (1,'编号1','名称1','/api/upload/1585445162216062976.jpg','类型1',1,'此处可上传文字、图片、视频、超链接、表格等内容区1',843,882,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (2,'编号2','名称2','/api/upload/1585445111259463680.jpg','类型2',2,'此处可上传文字、图片、视频、超链接、表格等内容区2',969,266,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (3,'编号3','名称3','/api/upload/1585444967113818113.jpg','类型3',3,'此处可上传文字、图片、视频、超链接、表格等内容区3',78,790,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (4,'编号4','名称4','/api/upload/1585445065608658944.jpg','类型4',4,'此处可上传文字、图片、视频、超链接、表格等内容区4',185,839,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (5,'编号5','名称5','/api/upload/1585445303006265344.jpg','类型5',5,'此处可上传文字、图片、视频、超链接、表格等内容区5',896,411,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (6,'编号6','名称6','/api/upload/1585445356252954625.jpg','类型6',6,'此处可上传文字、图片、视频、超链接、表格等内容区6',49,783,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (7,'编号7','名称7','/api/upload/1585445214707777536.jpg','类型7',7,'此处可上传文字、图片、视频、超链接、表格等内容区7',856,337,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `specialty_information` values (8,'编号8','名称8','/api/upload/1585444910973059073.jpg','类型8',8,'此处可上传文字、图片、视频、超链接、表格等内容区8',848,928,0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

DROP TABLE IF EXISTS `order_settlement`;
CREATE TABLE `order_settlement`(order_settlement_id int(11) NOT NULL AUTO_INCREMENT COMMENT '订单结算ID',
`number` varchar(64) comment '编号',
`name` varchar(64) comment '名称',
`picture` varchar(255) comment '图片',
`price` int(11) DEFAULT 0 comment '价格',
`user_no` int(11) DEFAULT 0 comment '用户编号',
`full_name` varchar(64) comment '姓名',
`purchase_time` date comment '购买时间',
`purchase_quantity` varchar(64) comment '购买数量',
`total_amount` varchar(64) comment '合计金额',
`annotation_notes` varchar(64) comment '标注说明',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (order_settlement_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '订单结算';
insert into `order_settlement` values (1,'编号1','名称1','/api/upload/1585445214707777536.jpg',1,0,'姓名1','2023-05-11','购买数量1','合计金额1','标注说明1','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (2,'编号2','名称2','/api/upload/1585445162216062976.jpg',2,0,'姓名2','2023-05-11','购买数量2','合计金额2','标注说明2','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (3,'编号3','名称3','/api/upload/1585445065608658944.jpg',3,0,'姓名3','2023-05-11','购买数量3','合计金额3','标注说明3','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (4,'编号4','名称4','/api/upload/1585445356252954625.jpg',4,0,'姓名4','2023-05-11','购买数量4','合计金额4','标注说明4','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (5,'编号5','名称5','/api/upload/1585445303006265344.jpg',5,0,'姓名5','2023-05-11','购买数量5','合计金额5','标注说明5','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (6,'编号6','名称6','/api/upload/1585444967113818113.jpg',6,0,'姓名6','2023-05-11','购买数量6','合计金额6','标注说明6','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (7,'编号7','名称7','/api/upload/1585445111259463680.jpg',7,0,'姓名7','2023-05-11','购买数量7','合计金额7','标注说明7','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `order_settlement` values (8,'编号8','名称8','/api/upload/1585444910973059073.jpg',8,0,'姓名8','2023-05-11','购买数量8','合计金额8','标注说明8','未支付','支付宝',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

DROP TABLE IF EXISTS `access_data`;
CREATE TABLE `access_data`(access_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '访问数据ID',
`title` varchar(64) comment '标题',
`access_period` date comment '访问时段',
`user_location` varchar(64) comment '用户位置',
`number_of_visitors` int(11) DEFAULT 0 comment '访问人数',
`notes` varchar(64) comment '备注说明',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (access_data_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '访问数据';
insert into `access_data` values (1,'标题1','2023-05-11','用户位置1',1,'备注说明1',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (2,'标题2','2023-05-11','用户位置2',2,'备注说明2',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (3,'标题3','2023-05-11','用户位置3',3,'备注说明3',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (4,'标题4','2023-05-11','用户位置4',4,'备注说明4',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (5,'标题5','2023-05-11','用户位置5',5,'备注说明5',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (6,'标题6','2023-05-11','用户位置6',6,'备注说明6',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (7,'标题7','2023-05-11','用户位置7',7,'备注说明7',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `access_data` values (8,'标题8','2023-05-11','用户位置8',8,'备注说明8',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

DROP TABLE IF EXISTS `type_of_homestay`;
CREATE TABLE `type_of_homestay`(type_of_homestay_id int(11) NOT NULL AUTO_INCREMENT COMMENT '民宿类型ID',
`type_name` varchar(64) comment '类型名称',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (type_of_homestay_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '民宿类型';
insert into `type_of_homestay` values (1,'类型名称1',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (2,'类型名称2',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (3,'类型名称3',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (4,'类型名称4',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (5,'类型名称5',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (6,'类型名称6',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (7,'类型名称7',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');
insert into `type_of_homestay` values (8,'类型名称8',0,'2023-05-11 14:45:43','2023-05-11 14:45:43');

insert into `auth` values ('1','管理员','注册用户','registered_users','注册用户','/registered_users/table','','_blank','1','1','1','1','user_no,full_name,gender','user_no,full_name,gender','user_no,full_name,gender',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('2','管理员','注册用户','registered_users','用户详情','/registered_users/view','','_blank','1','1','1','1','user_no,full_name,gender','user_no,full_name,gender','user_no,full_name,gender',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('3','管理员','旅游分享','tourism_sharing','旅游分享','/tourism_sharing/table','','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('4','管理员','旅游分享','tourism_sharing','分享详情','/tourism_sharing/view','','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('5','管理员','旅游分享','tourism_sharing','旅游分享','/tourism_sharing/list','top','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('6','管理员','旅游分享','tourism_sharing','分享详情','/tourism_sharing/details','','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('7','管理员','主题活动','thematic_activities','主题活动','/thematic_activities/table','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('8','管理员','主题活动','thematic_activities','活动详情','/thematic_activities/view','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('9','管理员','主题活动','thematic_activities','主题活动','/thematic_activities/list','top','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('10','管理员','主题活动','thematic_activities','活动详情','/thematic_activities/details','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('11','管理员','报名记录','registration_record','报名记录','/registration_record/table','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('12','管理员','报名记录','registration_record','报名详情','/registration_record/view','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('13','管理员','报名记录','registration_record','报名记录','/registration_record/edit','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('14','管理员','民宿信息','home_stay_information','民宿信息','/home_stay_information/table','','_blank','1','1','1','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('15','管理员','民宿信息','home_stay_information','民宿详情','/home_stay_information/view','','_blank','1','1','1','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('16','管理员','民宿信息','home_stay_information','民宿信息','/home_stay_information/list','top','_blank','1','1','1','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('17','管理员','民宿信息','home_stay_information','民宿详情','/home_stay_information/details','','_blank','1','1','1','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('18','管理员','预订信息','reservation_information','预订信息','/reservation_information/table','','_blank','1','1','1','1','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{"pay":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('19','管理员','预订信息','reservation_information','预订详情','/reservation_information/view','','_blank','1','1','1','1','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('20','管理员','预订信息','reservation_information','预订信息','/reservation_information/edit','','_blank','1','1','1','1','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('21','管理员','特产信息','specialty_information','特产信息','/specialty_information/table','','_blank','1','1','1','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('22','管理员','特产信息','specialty_information','特产详情','/specialty_information/view','','_blank','1','1','1','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('23','管理员','特产信息','specialty_information','特产信息','/specialty_information/list','top','_blank','1','1','1','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('24','管理员','特产信息','specialty_information','特产详情','/specialty_information/details','','_blank','1','1','1','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('25','管理员','订单结算','order_settlement','订单信息','/order_settlement/table','','_blank','1','1','1','1','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{"pay":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('26','管理员','订单结算','order_settlement','订单详情','/order_settlement/view','','_blank','1','1','1','1','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('27','管理员','订单结算','order_settlement','订单结算','/order_settlement/edit','','_blank','1','1','1','1','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('28','管理员','访问数据','access_data','访问数据','/access_data/table','','_blank','1','1','1','1','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes',null,'0','{"figure":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('29','管理员','访问数据','access_data','数据详情','/access_data/view','','_blank','1','1','1','1','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('30','管理员','民宿类型','type_of_homestay','民宿类型','/type_of_homestay/table','','_blank','1','1','1','1','type_name','type_name','type_name',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('31','管理员','民宿类型','type_of_homestay','类型详情','/type_of_homestay/view','','_blank','1','1','1','1','type_name','type_name','type_name',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('32','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('33','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('34','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('35','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('36','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('37','管理员','新闻','article','旅游资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('38','管理员','新闻','article','资讯详情','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('39','管理员','新闻','article','旅游资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('40','管理员','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('41','管理员','新闻分类','article_type','资讯分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('42','管理员','新闻分类','article_type','分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('43','管理员','公告','notice','公告消息','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('44','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('45','管理员','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('46','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('47','游客','注册用户','registered_users','注册用户','/registered_users/table','','_blank','1','0','0','0','user_no,full_name,gender','user_no,full_name,gender','user_no,full_name,gender',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('48','游客','注册用户','registered_users','用户详情','/registered_users/view','','_blank','1','0','0','0','user_no,full_name,gender','user_no,full_name,gender','user_no,full_name,gender',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('49','游客','旅游分享','tourism_sharing','旅游分享','/tourism_sharing/table','','_blank','0','0','0','0','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('50','游客','旅游分享','tourism_sharing','旅游分享详情','/tourism_sharing/view','','_blank','0','0','0','0','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('51','游客','旅游分享','tourism_sharing','旅游分享','/tourism_sharing/list','top','_blank','0','0','0','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('52','游客','旅游分享','tourism_sharing','分享详情','/tourism_sharing/details','','_blank','0','0','0','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('53','游客','主题活动','thematic_activities','主题活动','/thematic_activities/table','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('54','游客','主题活动','thematic_activities','主题活动详情','/thematic_activities/view','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('55','游客','主题活动','thematic_activities','主题活动','/thematic_activities/list','top','_blank','0','0','0','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('56','游客','主题活动','thematic_activities','活动详情','/thematic_activities/details','','_blank','0','0','0','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('57','游客','报名记录','registration_record','报名记录','/registration_record/table','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('58','游客','报名记录','registration_record','报名记录详情','/registration_record/view','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('59','游客','报名记录','registration_record','报名记录','/registration_record/edit','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('60','游客','民宿信息','home_stay_information','民宿信息','/home_stay_information/table','','_blank','0','0','0','0','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('61','游客','民宿信息','home_stay_information','民宿信息详情','/home_stay_information/view','','_blank','0','0','0','0','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('62','游客','民宿信息','home_stay_information','民宿信息','/home_stay_information/list','top','_blank','0','0','0','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('63','游客','民宿信息','home_stay_information','民宿详情','/home_stay_information/details','','_blank','0','0','0','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('64','游客','预订信息','reservation_information','预订信息','/reservation_information/table','','_blank','0','0','0','0','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{"pay":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('65','游客','预订信息','reservation_information','预订信息详情','/reservation_information/view','','_blank','0','0','0','0','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('66','游客','预订信息','reservation_information','预订信息','/reservation_information/edit','','_blank','0','0','0','0','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('67','游客','特产信息','specialty_information','特产信息','/specialty_information/table','','_blank','0','0','0','0','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('68','游客','特产信息','specialty_information','特产信息详情','/specialty_information/view','','_blank','0','0','0','0','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('69','游客','特产信息','specialty_information','特产信息','/specialty_information/list','top','_blank','0','0','0','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('70','游客','特产信息','specialty_information','特产详情','/specialty_information/details','','_blank','0','0','0','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('71','游客','订单结算','order_settlement','订单结算','/order_settlement/table','','_blank','0','0','0','0','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{"pay":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('72','游客','订单结算','order_settlement','订单结算详情','/order_settlement/view','','_blank','0','0','0','0','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('73','游客','订单结算','order_settlement','订单结算','/order_settlement/edit','','_blank','0','0','0','0','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('74','游客','访问数据','access_data','访问数据','/access_data/table','','_blank','0','0','0','0','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes',null,'0','{"figure":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('75','游客','访问数据','access_data','访问数据详情','/access_data/view','','_blank','0','0','0','0','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('76','游客','民宿类型','type_of_homestay','民宿类型','/type_of_homestay/table','','_blank','0','0','0','0','type_name','type_name','type_name',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('77','游客','民宿类型','type_of_homestay','民宿类型详情','/type_of_homestay/view','','_blank','0','0','0','0','type_name','type_name','type_name',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('78','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('79','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('80','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('81','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('82','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('83','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('84','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('85','游客','新闻','article','旅游资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('86','游客','新闻','article','资讯详情','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('87','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('88','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('89','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('90','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('91','游客','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('92','游客','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('93','注册用户','注册用户','registered_users','注册用户','/registered_users/table','','_blank','0','0','0','0','user_no,full_name,gender','user_no,full_name,gender','user_no,full_name,gender',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('94','注册用户','注册用户','registered_users','注册用户详情','/registered_users/view','','_blank','0','0','0','0','user_no,full_name,gender','user_no,full_name,gender','user_no,full_name,gender',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('95','注册用户','旅游分享','tourism_sharing','旅游分享','/tourism_sharing/table','','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('96','注册用户','旅游分享','tourism_sharing','分享详情','/tourism_sharing/view','','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('97','注册用户','旅游分享','tourism_sharing','旅游分享','/tourism_sharing/list','top','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('98','注册用户','旅游分享','tourism_sharing','分享详情','/tourism_sharing/details','','_blank','1','1','1','1','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details','title,cover,type,tourist_location,release_time,user_no,full_name,related_videos,resource_acquisition,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('99','注册用户','主题活动','thematic_activities','主题活动','/thematic_activities/table','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('100','注册用户','主题活动','thematic_activities','主题活动详情','/thematic_activities/view','','_blank','0','0','0','0','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('101','注册用户','主题活动','thematic_activities','主题活动','/thematic_activities/list','top','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('102','注册用户','主题活动','thematic_activities','活动详情','/thematic_activities/details','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details','activity_name,picture,activity_type,event_location,activity_time,event_details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('103','注册用户','报名记录','registration_record','报名记录','/registration_record/table','','_blank','0','1','0','1','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('104','注册用户','报名记录','registration_record','报名详情','/registration_record/view','','_blank','0','1','0','1','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('105','注册用户','报名记录','registration_record','报名记录','/registration_record/edit','','_blank','1','1','1','1','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes','activity_name,picture,activity_type,event_location,activity_time,user_no,full_name,registration_time,number_of_applicants,contact_number,additional_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('106','注册用户','民宿信息','home_stay_information','民宿信息','/home_stay_information/table','','_blank','0','0','0','0','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('107','注册用户','民宿信息','home_stay_information','民宿信息详情','/home_stay_information/view','','_blank','0','0','0','0','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('108','注册用户','民宿信息','home_stay_information','民宿信息','/home_stay_information/list','top','_blank','1','1','1','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('109','注册用户','民宿信息','home_stay_information','民宿详情','/home_stay_information/details','','_blank','1','1','1','1','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details','title,cover,type,house_type,square,price,supporting_facilities,advance_deposit,home_address,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('110','注册用户','预订信息','reservation_information','预订信息','/reservation_information/table','','_blank','0','1','0','1','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{"pay":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('111','注册用户','预订信息','reservation_information','预订详情','/reservation_information/view','','_blank','0','1','0','1','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('112','注册用户','预订信息','reservation_information','预订信息','/reservation_information/edit','','_blank','1','1','1','1','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks','title,cover,house_type,supporting_facilities,advance_deposit,user_no,full_name,check_in_time,contact_number,remarks',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('113','注册用户','特产信息','specialty_information','特产信息','/specialty_information/table','','_blank','0','0','0','0','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{"can_show_comment":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('114','注册用户','特产信息','specialty_information','特产信息详情','/specialty_information/view','','_blank','0','0','0','0','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('115','注册用户','特产信息','specialty_information','特产信息','/specialty_information/list','top','_blank','1','1','1','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('116','注册用户','特产信息','specialty_information','特产详情','/specialty_information/details','','_blank','1','1','1','1','number,name,picture,type,price,details','number,name,picture,type,price,details','number,name,picture,type,price,details',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('117','注册用户','订单结算','order_settlement','订单结算','/order_settlement/table','','_blank','0','1','0','1','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{"pay":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('118','注册用户','订单结算','order_settlement','结算详情','/order_settlement/view','','_blank','0','1','0','1','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('119','注册用户','订单结算','order_settlement','订单结算','/order_settlement/edit','','_blank','1','1','1','1','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes','number,name,picture,price,user_no,full_name,purchase_time,purchase_quantity,total_amount,annotation_notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('120','注册用户','访问数据','access_data','访问数据','/access_data/table','','_blank','0','0','0','0','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes',null,'0','{"figure":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('121','注册用户','访问数据','access_data','访问数据详情','/access_data/view','','_blank','0','0','0','0','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes','title,access_period,user_location,number_of_visitors,notes',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('122','注册用户','民宿类型','type_of_homestay','民宿类型','/type_of_homestay/table','','_blank','0','0','0','0','type_name','type_name','type_name',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('123','注册用户','民宿类型','type_of_homestay','民宿类型详情','/type_of_homestay/view','','_blank','0','0','0','0','type_name','type_name','type_name',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('124','注册用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('125','注册用户','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('126','注册用户','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('127','注册用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('128','注册用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('129','注册用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('130','注册用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('131','注册用户','新闻','article','旅游资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('132','注册用户','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('133','注册用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('134','注册用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('135','注册用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('136','注册用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('137','注册用户','公告','notice','公告消息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `auth` values ('138','注册用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `user_group` values ('3','100','注册用户',null,'registered_users','registered_users_id','0','3','2023-05-11 14:45:43.0','2023-05-11 14:45:43.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1575771429746507777.jpg','97','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1575771560294219776.jpg','822','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1575771492908531713.jpg','63','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0');
insert into `article` values ('1','永春介绍','旅游','48','0','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0',null,null,null,'<p>永春境内蕴藏着丰富的旅游资源。闽南绝无仅有的长廊屋盖梁式桥东关桥;登高望远、云叠雾嶂的百丈岩;山重水复、鸟啼泉鸣的乌髻岩;福建惟一的宋代炎帝庙、风景绚丽的仙洞山;被南宋理学家朱熹称之为"月蓬第一峰"的岱山岩;誉为"避暑圣地"的雪山，乃至成为全国"农村两个文明建设典型"的美岭，都是人们留连忘返的地方。除了名胜古迹，山林生态景观更是永春最具特色的旅游项目。牛姆林，这一处匿藏于深山之中的绿色明珠，是闽南第一个省级自然保护区和泉州市一处重点生态旅游区，境内奇花异树，争奇斗艳;群鸟欢唱，彩蝶飞舞;百兽云集，曲径通幽;清澈小溪，流水潺潺，瀑布飞挂，真可谓"松涛竹舞花竞开，蝶飞鸟欢春常在"，成为人们回归自然的绝好去处。</p><p>永春县不仅名胜奇景众多，而且旅游商品琳琅满目。东方佳果芦柑，芳香扑鼻的乌龙茶，名闻遐迩的纸织画，蜚声世界的永春老醋，独具特色的风味小吃，威镇四海的白鹤拳，被称为东方古代音乐"活化石"的南音等等，都是颇具鉴赏的珍品和技艺。</p><p>永春旅游基础设施日臻完善，形成了以县城为中心，外连机场、港口、铁路，内向各乡镇、村、景点辐射的交通网络。遍布全县的通讯网络，实现了村村通电话。目前，共有旅行社3家，旅游饭店、宾馆40多家，还有夜总会、歌舞厅数十家，保龄球馆2家，形成了小商品一条街，风味小吃一条街等等，为旅游者提供了完善的食、住、行、游、购、娱一条龙服务。</p><p>永春，正以绚丽多姿的形象，迎迓五湖四海的朋友!</p><p>永春由来“四时多燠”(永春的气候素有“万紫千红花不谢，冬暖夏凉四序春”的美誉)，故称永春。</p><p>桃源由来“众水会于桃溪一源”，故名桃源。政区自然特征福建省第二大山脉戴云山脉自德化南伸本县，绵延全境。地势由西北向东南倾斜，海拔100米左右至1000多米，最高处是位于呈祥的雪山，海拔1366米。全境呈长带形状，东西长84.7公里，南北宽37.2公里。西半部属中亚热带，东半部属南亚热带，而千米以上山地则属北亚热带。全年无霜期320天，平均气温20.4℃，降水量1600-2100毫米，气候温和，湿润多雨，素有“万紫千红花不谢，冬暖夏凉四序春”之称。</p><p>政区资源特点自然资源丰富，主要有农林产品、药材、水力、矿藏等资源优势。全县林地面积151.21万亩，林木蓄积量358万立方米，生态公益林48.4万亩，是全省重点林区县之一。农产品主要有芦柑、茶叶、食用菌、毛麻竹、枇杷等。野生中草药材资源十分丰富，全县有地道药用植物1000多种，是福建省著名南药出口基地县。境内溪流纵横，有桃溪、湖洋、坑仔口、一都溪四大水系，水资源总量18.21亿立方米;矿藏资源有煤、铁、锰、锌、铜、花岗岩、高岭土、石灰石、叶腊石、矿泉水、地热水等。</p><p>生态环境境内山清水秀，景色宜人。有林地151.21万亩，森林覆盖率68.8%，绿化程度94.5%，是全国城市环境综合整治优秀县城、全省绿化模范县、林业十佳县和环境保护先进县、生态示范区。县城大气质量100%达到功能区标准，城区环境质量由90年的7级上升为2级。人文自然景观晚唐著名诗人韩屋，客居数年。南宋理学家朱熹，数到永春，留下了“千浔瀑布如飞练，一簇人烟似画图”的传世佳句。明末惠安诗人黄吾野，为永春文人颜延榘挚友，曾泛舟夜游桃溪。牛姆林是闽南面积最大、最富内涵、最具吸引力的生态旅游区，被誉为“闽南西双版纳”，为国家4A级景区，有国家3A级风景区百丈岩、魁星岩、乌髻岩、仙洞-普济寺，国家农业旅游示范点北溪、观山，省级森林公园魁星岩、碧卿，省级文物保护单位东关桥、魁星岩、巽来庄、县文庙，省最美乡村-优秀乡村之一、“森林人家”北溪旅游村;还有风雅颂、东溪大峡谷、岱山岩、雪山岩、留安塔、沈家大院等风景名胜风光旖旎。</p><p>特色产品芦柑是永春的大宗产品，蝉联全国、全省优质水果评选四联冠，屡获金牌，畅销国内外，在海外享有“永春芦柑甲天下”的美誉。茶叶历史悠久，早在宋代便有雪山绿茶名闻国中，“闽南水仙”、“永春佛手”、“铁观音”荣获全国金奖，永春佛手茶被认定为2008年全国农运会的指定用茶，被授予“中国申奥第一茶”称号。永春芦柑、永春佛手、永春篾香、永春老醋获得国家地理标志产品保护，其中永春老醋为中国四大名醋之一，还有蜜柚、陶瓷、养脾散、灵应茶饼等产品享有盛誉。文化历史文化积淀深厚，地灵人杰，人文荟萃，英才辈出，绿树村边合，青山郭外斜。</p>','/api/upload/1567404198876676097.jpg','古称“桃源”，地处闽南金三角，历史悠久，人文荟萃，地灵人杰，风景秀丽，被南宋蔡襄誉之为：“万紫千红花不谢，冬暖夏凉四序春”。');
insert into `article` values ('2','厦门游玩亮点','旅游','389','0','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0',null,null,null,'<p>鼓浪屿&nbsp;——&nbsp;有纵横交错的巷道、开满鲜花的小洋房，无数漂亮的老建筑，还有每一条充满惊喜的街道；</p><p>&nbsp;</p><p>厦门大学&nbsp;——&nbsp;厦门大学依海而建，依山傍水的地理环境让厦大素有“中国醉美校园”的美誉。</p><p>&nbsp;</p><p>&nbsp;<span style="color: rgb(51, 51, 51);">云水谣土楼</span>——&nbsp;因电影《云水谣》而出名。村中幽长古道、百年老榕、神奇土楼，还有那灵山碧水，无不给人以超然的感觉。</p><p>&nbsp;</p><p>&nbsp;集美学村&nbsp;——&nbsp;安静的嘉庚式建筑。如果碰巧选择了旅游旺季来，而又不想人挤人，推荐去集美学村看看。</p><p>&nbsp;</p><p>&nbsp;南普陀&nbsp;——&nbsp;南普陀寺坐落于厦门大学旁，一墙之隔塑成两种截然不同的意境。</p>','/api/upload/1567325447933394945.jpg','鼓浪屿，厦门大学，云水谣土，南普陀 ， 集美学村 楼，');
insert into `article` values ('3','泉州景色','旅游','738','0','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0',null,null,null,'<p>爱，原本是不需要理由的，爱泉州，我却有太多理由了。</p><p>我爱泉州，首先因为我生于此，长于此，因为我是泉州人!</p><p>我爱泉州，她素有“海滨邹鲁”美称。我不仅爱她那湛蓝的泉州湾、苍郁的清源山、……更爱她曾是“海上丝绸之路”的起点、“涨海声中万国商”的古港商埠……在“四序有花长见雨”、“满街都是圣人”的神奇热土上，每一处美丽迷人的风景名胜都那么让人怦然心动、神思万千;每一页辉煌的历史篇章都那么令人深感骄傲，引以为豪。</p><p>我爱泉州，爱那晋江依伴，刺桐花飘香，还有那雄伟的东塔和西塔，那开元寺紫云大殿后面希腊哥林多式的廊柱雕刻，大殿前面平台基石上古埃及式的人面兽身的浮雕，那具有古叙利亚建筑风味的清真寺，那令人叹为观止的清源山，那四季分明的德化九仙山，那高耸入云的戴云山、石牛山，更有那闽南西双版纳之称的永春牛姆林，还有那德化的桃花游林、水口的自然漂流，更有那号称天下第一瀑的岱仙瀑布……无不令人陶醉。</p><p><br></p>','/api/upload/1567327194152173569.jpg','泉州——这片美丽的地方，叫我如何不爱她!');
insert into `article` values ('4','张家界景点推荐','旅游','810','0','2023-05-11 14:45:44.0','2023-05-11 14:45:44.0',null,null,null,'<p><strong>【张家界国家森林公园</strong>】第一个国家级森林公园，植被茂密，是亲近自然的不二之选。金鞭溪被誉为“最美峡谷”，是《西游记》三打白骨精的取景地，沿路有很多野生猴子，一定注意不要挑逗它们，否则被抓伤，破坏旅游心情。乘坐百龙天梯穿山而上，看《阿凡达》的取景地乾坤柱，视觉震撼。</p><p><img src="http://25458.itzjj.cn/uploads/userfiles/1/images/pageimg/20200716/1-200G6163Q32.jpg"></p><p><strong>【张家界天门山</strong>】天门山是来张家界必打卡的地方之一，天门山索道是亚洲&nbsp;第一长索道，乘坐索道可以俯瞰整个张家界的城市风貌，&nbsp;同时可以看到雄伟壮丽的九十九道弯。登临山顶，可以体验惊险刺激的鬼谷栈道，挑战雄伟壮观的999道台阶。</p>','/api/upload/1567324294755647489.jpg','张家界必玩景点：天门山、国家森林公园、大峡谷玻璃桥、芙蓉镇、凤凰古城！');
insert into `article_type` values ('1','100','旅游','0',null,null,null,'2023-05-11 14:45:44.0','2023-05-11 14:45:44.0');
