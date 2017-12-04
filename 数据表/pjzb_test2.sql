/*
Navicat MySQL Data Transfer

Source Server         : pjzb
Source Server Version : 50634
Source Host           : rm-wz9lpy3i4438b5w68o.mysql.rds.aliyuncs.com:3306
Source Database       : pjzb_test2

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-11-10 15:45:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bak_t_apply_copy
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_apply_copy`;
CREATE TABLE `bak_t_apply_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '借款金额',
  `borrowAmount` decimal(18,2) DEFAULT NULL,
  `deadline` int(11) DEFAULT NULL COMMENT '借款期限',
  `identityType` int(11) DEFAULT NULL COMMENT '身份类型（1：个人 2：企业）',
  `tname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别 (男/ 女）',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '联系邮箱',
  `address` varchar(200) DEFAULT NULL COMMENT '通讯地址',
  `state` int(11) DEFAULT '0' COMMENT '处理状态（0 未处理 1 已处理）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_article_manage
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_article_manage`;
CREATE TABLE `bak_t_article_manage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `title` varchar(225) DEFAULT NULL COMMENT '标题',
  `userId` int(11) DEFAULT '-1' COMMENT '发布人',
  `ltpic` varchar(225) DEFAULT NULL COMMENT '图片',
  `itemize` varchar(225) DEFAULT NULL COMMENT '分类名称',
  `content` text COMMENT '内容',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `parentID` int(20) DEFAULT '0' COMMENT '所属分类( 0 表示 跟目录)',
  `sorts` int(11) DEFAULT '0' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态(1.发布 2.隐藏)',
  `visits` int(11) DEFAULT '0' COMMENT '访问量',
  `issection` int(11) DEFAULT '1' COMMENT '是否为文章（0 分类栏目 ，1 文章）',
  PRIMARY KEY (`id`),
  KEY `index_am_id` (`id`) USING BTREE,
  KEY `index_am_sort` (`sorts`) USING BTREE,
  KEY `index_am_pid` (`parentID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_autobid_task
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_autobid_task`;
CREATE TABLE `bak_t_autobid_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `autobid_id` bigint(20) DEFAULT NULL COMMENT '自动投标设置id',
  `borrow_id` bigint(20) DEFAULT NULL COMMENT '借款id',
  `exe_mode` int(11) DEFAULT NULL COMMENT '执行模式(1 非任务 2 待处理任务 3 处理完毕任务)',
  `bid_sort` int(11) DEFAULT NULL COMMENT '用户投标排序',
  `borrow_sort` int(11) DEFAULT NULL COMMENT '借款排序',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `bid_amount` decimal(18,2) DEFAULT '0.00' COMMENT '投标金额',
  `remain_amount` decimal(18,2) DEFAULT '0.00' COMMENT '账户保留金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_award
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_award`;
CREATE TABLE `bak_t_award` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号（投资人）',
  `level2userId` bigint(20) DEFAULT '-1' COMMENT '经纪人编号',
  `level2money` decimal(18,2) DEFAULT '0.00' COMMENT '经纪人所得奖金',
  `level1userId` bigint(20) DEFAULT '-1' COMMENT '团队长编号',
  `level1money` decimal(18,2) DEFAULT '0.00' COMMENT '团队长所得奖金',
  `iorId` bigint(20) DEFAULT NULL COMMENT '投资/还款明细编号',
  `status` int(11) DEFAULT NULL COMMENT '标的状态，1奖金未使用2奖金已使用',
  `addDate` datetime DEFAULT NULL COMMENT '添加时间',
  `mx` decimal(18,2) DEFAULT NULL COMMENT '最大值/最小值',
  `mxType` int(11) DEFAULT NULL COMMENT '变量类型1最大值(奖励机制1)2最小值(奖励机制2)',
  `month` int(20) DEFAULT NULL COMMENT '用户在第几月进行进贡的，',
  `level` int(11) DEFAULT NULL COMMENT '用户角色，3投资人4理财人',
  `iorType` int(11) DEFAULT NULL COMMENT '投资/还款类型1投资2还款',
  PRIMARY KEY (`id`),
  KEY `index_award_id` (`id`) USING BTREE,
  KEY `index_award_user` (`userId`) USING BTREE,
  KEY `index_award_lev1` (`level1userId`) USING BTREE,
  KEY `index_award_lev2` (`level2userId`) USING BTREE,
  KEY `index_award_iorId` (`iorId`) USING BTREE,
  KEY `index_award_date` (`addDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_award_detail
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_award_detail`;
CREATE TABLE `bak_t_award_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '团队长/经纪人ID',
  `handleSum` decimal(18,2) DEFAULT NULL COMMENT '操作金额',
  `checkId` bigint(20) DEFAULT NULL COMMENT '审核人员ID',
  `checkTime` date DEFAULT NULL COMMENT '结算时间',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `index_awadetail_id` (`id`) USING BTREE,
  KEY `index_awadetail_user` (`userId`) USING BTREE,
  KEY `index_awadetail_check` (`checkId`) USING BTREE,
  KEY `index_awaddetail_checktime` (`checkTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_award_level4
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_award_level4`;
CREATE TABLE `bak_t_award_level4` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号(理财人)',
  `level3userId` bigint(20) DEFAULT NULL COMMENT '投资人编号',
  `money` decimal(18,2) DEFAULT NULL COMMENT '奖励金额',
  `addDate` datetime DEFAULT NULL COMMENT '奖励时间',
  PRIMARY KEY (`id`),
  KEY `index_award_lev_id` (`id`) USING BTREE,
  KEY `index_award_lev_uid` (`userId`) USING BTREE,
  KEY `index_award_lev_lev3id` (`level3userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_award_moth
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_award_moth`;
CREATE TABLE `bak_t_award_moth` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pepoleid` bigint(11) DEFAULT NULL COMMENT '团队长id/经济人id',
  `moneys` decimal(18,4) DEFAULT NULL COMMENT '月统计金额',
  `type` int(11) DEFAULT NULL COMMENT '1 为团队长，2为经济人',
  `applystatus` int(11) DEFAULT '1' COMMENT '是否月结,1未月结，2已月结',
  `addtime` date DEFAULT NULL COMMENT '添加时间',
  `moth` date DEFAULT NULL COMMENT '第几个月',
  PRIMARY KEY (`id`),
  KEY `index_award_moth_id` (`id`) USING BTREE,
  KEY `index_award_moth_pid` (`pepoleid`) USING BTREE,
  KEY `index_award_moth_status` (`applystatus`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_borrow_base_info
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_borrow_base_info`;
CREATE TABLE `bak_t_borrow_base_info` (
  `id` int(20) NOT NULL COMMENT '主键ID',
  `back` varchar(10) DEFAULT NULL COMMENT '布尔值',
  `contract_give` int(20) DEFAULT NULL COMMENT '订单号',
  `title` varchar(50) DEFAULT NULL COMMENT '标的名称',
  `imgPath` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `borrowWayInt` int(10) DEFAULT NULL COMMENT '借款方式',
  `purposeInt` int(10) DEFAULT NULL COMMENT '建议',
  `deadLineInt` int(10) DEFAULT NULL COMMENT '标的状态',
  `paymentModeInt` int(10) DEFAULT NULL COMMENT '还款方式',
  `amountDouble` double(18,2) DEFAULT NULL COMMENT '借款总额',
  `platUseFeetDouble` double(18,2) DEFAULT NULL COMMENT '平台使用费',
  `borrowFeeDouble` double(18,2) DEFAULT NULL COMMENT '借款手续费',
  `borrowManageFeeDouble` double(18,2) DEFAULT NULL COMMENT '借款管理费',
  `InstGuaranteeFeeDouble` double(18,2) DEFAULT NULL COMMENT '机构担保费',
  `annualRateDouble` double(18,2) DEFAULT NULL COMMENT '年利率',
  `minTenderedSumInt` int(18) DEFAULT NULL COMMENT '最新投标金额',
  `maxTenderedSumInt` int(18) DEFAULT NULL COMMENT '最大投标金额',
  `raiseTermInt` int(6) DEFAULT NULL,
  `excitationTypeInt` int(6) DEFAULT NULL,
  `sumInt` double(18,2) DEFAULT NULL COMMENT '奖励金额',
  `detail` varchar(200) DEFAULT NULL COMMENT '借款详情',
  `retsource` varchar(200) DEFAULT NULL COMMENT '还款来源',
  `projectIntro` varchar(200) DEFAULT NULL COMMENT '项目介绍',
  `safeMeasures` varchar(200) DEFAULT NULL COMMENT '保障措施',
  `investPWD` varchar(18) DEFAULT NULL COMMENT '交易密码的值',
  `hasPWDInt` int(10) DEFAULT NULL COMMENT '是否设置交易密码',
  `remoteIP` varchar(20) DEFAULT NULL COMMENT '发布IP地址',
  `publisherId` int(11) DEFAULT NULL COMMENT '发布借款人的ID',
  `frozenMargin` double(18,2) DEFAULT NULL COMMENT '冻结保证金',
  `daytheInt` int(10) DEFAULT NULL COMMENT '是否天标',
  `userName` varchar(30) DEFAULT NULL COMMENT '用户名',
  `subscribe` varchar(20) DEFAULT NULL COMMENT '认购单位（元）',
  `circulationNumber` int(10) DEFAULT NULL COMMENT '认购总分份数',
  `subscribe_status` int(10) DEFAULT NULL COMMENT '是否启用认购模式',
  `identifier` varchar(100) DEFAULT NULL COMMENT '标的分类标识',
  `json` varchar(200) DEFAULT NULL COMMENT '借款费用描述',
  `jsonState` varchar(200) DEFAULT NULL COMMENT '借款费用描述',
  `borrowType` int(20) DEFAULT NULL COMMENT '借款类型',
  `publishDate` datetime DEFAULT NULL COMMENT '发布时间',
  `applyId` int(20) DEFAULT NULL COMMENT '企业ID',
  `userId` int(20) DEFAULT NULL COMMENT '用户ID',
  `agent` varchar(64) DEFAULT NULL COMMENT '一级担保机构',
  `sagent` varchar(64) DEFAULT NULL COMMENT '二级担保机构',
  `subborrowTypeInt` int(6) DEFAULT NULL COMMENT '标的类型',
  `projectScorename` varchar(25) DEFAULT NULL COMMENT '项目评级',
  `bidTimeFeeDate` datetime DEFAULT NULL COMMENT '可投标时间',
  `projectAddress` varchar(200) DEFAULT NULL COMMENT '项目地址',
  `showRate` varchar(20) DEFAULT NULL COMMENT '展示利率',
  `amount` varchar(20) DEFAULT NULL COMMENT '发标金额',
  `annualRate` varchar(20) DEFAULT NULL COMMENT '发标年化利率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bak_t_concern
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_concern`;
CREATE TABLE `bak_t_concern` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `moduleType` int(11) DEFAULT NULL COMMENT '关注模块类型（1 好友用户 2 借款,3基金信托）\r\n            ',
  `moduleId` bigint(20) DEFAULT NULL COMMENT '模块id',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `index_concern_id` (`id`) USING BTREE,
  KEY `index_concern_user` (`userId`) USING BTREE,
  KEY `index_concern_model` (`moduleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_creditinfo
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_creditinfo`;
CREATE TABLE `bak_t_creditinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号\r\n            ',
  `creditAmount` decimal(18,2) DEFAULT NULL COMMENT '债权总额是投资人借款待收金额\r\n            ',
  `minBidPrice` decimal(18,2) DEFAULT NULL COMMENT '竞拍底价\r\n            ',
  `maxBidPrice` decimal(18,2) DEFAULT NULL COMMENT '竞拍最高价\r\n            ',
  `creditPeriod` int(11) DEFAULT NULL COMMENT '债权期限\r\n            ',
  `bidType` int(11) DEFAULT NULL COMMENT '竞拍模式(1 明拍、2 暗拍)\r\n            ',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间\r\n            ',
  `bidCount` int(11) DEFAULT NULL COMMENT '竞拍数',
  `visiters` int(11) DEFAULT '0' COMMENT '浏览量，默认0\r\n            ',
  `timeRemain` datetime DEFAULT NULL COMMENT '剩余时间\r\n            ',
  `transferDesc` text COMMENT '转让描述\r\n            ',
  `creditStatus` int(11) DEFAULT '1' COMMENT '债权状态(1 默认申请中 2 转让失败 3 竞拍中 4 竞拍成功)\r\n            ',
  `creditFTSatus` int(11) DEFAULT NULL COMMENT '债权转让失败类型(1 申请不通过 2 提前还款 3 撤回 )\r\n            ',
  `creditor` bigint(20) DEFAULT NULL COMMENT '债权人',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `bider` bigint(20) DEFAULT NULL COMMENT '中标者',
  `lateStatus` int(10) unsigned DEFAULT NULL COMMENT '逾期状态(1 没有逾期 2 逾期)',
  `creditImg` varchar(200) DEFAULT NULL COMMENT '债权图片',
  PRIMARY KEY (`id`),
  KEY `index_creditinfo_borrow` (`borrowId`) USING BTREE,
  KEY `index_creditinfo_user1` (`creditor`) USING BTREE,
  KEY `index_creditinfo_user2` (`bider`) USING BTREE,
  KEY `index_creditinfo_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_download
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_download`;
CREATE TABLE `bak_t_download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序(按时间进行排序)',
  `userId` int(20) DEFAULT NULL COMMENT '发布者',
  `visits` int(11) DEFAULT NULL COMMENT '访问量',
  `state` int(11) DEFAULT NULL COMMENT '删除状态(默认1 未删除 2 删除)',
  `attachment` varchar(200) DEFAULT NULL COMMENT '附件路径',
  `seqNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_download_id` (`id`) USING BTREE,
  KEY `index_download_user` (`userId`) USING BTREE,
  KEY `index_download_time` (`publishTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bak_t_education_cost
-- ----------------------------
DROP TABLE IF EXISTS `bak_t_education_cost`;
CREATE TABLE `bak_t_education_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `freeEducation` decimal(20,0) DEFAULT '0' COMMENT '扣除学历审核费用',
  `userId` bigint(11) DEFAULT NULL COMMENT '用户id',
  `status` int(11) DEFAULT '1' COMMENT '是否扣费(1 未扣费 ， 2 扣费）默认未扣费',
  PRIMARY KEY (`id`),
  KEY `index_educost_id` (`id`) USING BTREE,
  KEY `index_educost_user` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bt_config
-- ----------------------------
DROP TABLE IF EXISTS `bt_config`;
CREATE TABLE `bt_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `var` text,
  PRIMARY KEY (`id`),
  KEY `index_config_id` (`id`) USING BTREE,
  KEY `index_config_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bt_rights
-- ----------------------------
DROP TABLE IF EXISTS `bt_rights`;
CREATE TABLE `bt_rights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `action` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `isLog` int(11) DEFAULT '1' COMMENT '是否记录日志1：是2：否',
  `isIntercept` int(11) DEFAULT '1' COMMENT '是否权限拦截1：是2：否',
  `summary` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '介简',
  `parentID` bigint(20) DEFAULT NULL COMMENT '父编号',
  `isQuery` int(11) DEFAULT NULL COMMENT '是否是查询',
  `indexs` int(11) DEFAULT NULL COMMENT '排序',
  `menuId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rights_id` (`id`) USING BTREE,
  KEY `index_rights_is_intercept` (`isIntercept`) USING BTREE,
  KEY `index_rights_parentid` (`parentID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for test_c3p0
-- ----------------------------
DROP TABLE IF EXISTS `test_c3p0`;
CREATE TABLE `test_c3p0` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `testid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cep0_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_account_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_account_payment`;
CREATE TABLE `t_account_payment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `nid` varchar(100) DEFAULT NULL,
  `status` bigint(3) unsigned DEFAULT '0',
  `litpic` varchar(100) DEFAULT NULL,
  `style` int(2) DEFAULT NULL,
  `config` longtext,
  `description` longtext,
  `orders` int(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_acc_pay_id` (`id`) USING BTREE,
  KEY `index_acc_pay_orders` (`orders`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `publishTime` datetime DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `linkAddress` varchar(255) DEFAULT NULL,
  `imgPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_common
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_common`;
CREATE TABLE `t_activity_common` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '投资人',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `investAmount` bigint(20) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  `insertTime` datetime DEFAULT NULL COMMENT '采集时间',
  `investTimeRange` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '活动时间范围',
  `status` int(2) DEFAULT NULL COMMENT '发放状态；1：未发放；2已发放',
  `awardTime` datetime DEFAULT NULL COMMENT '奖励发放时间',
  `type` int(3) DEFAULT NULL COMMENT '1、邀请好友投资奖励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_cumulateinviteaward
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_cumulateinviteaward`;
CREATE TABLE `t_activity_cumulateinviteaward` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '用户Id',
  `investAmount` decimal(18,2) DEFAULT NULL COMMENT '用户的投资金额',
  `awardDescribe` varchar(255) DEFAULT NULL COMMENT '奖励描述',
  `cumulateAwardType` int(10) DEFAULT NULL COMMENT '累计投资,奖励的类型,1：5万元及以上；2：10万元及以上；3：20万元及以上；4：30万元及以上；5：40万元及以上',
  `status` int(10) DEFAULT '1' COMMENT '领取状态；1：未领取；2已领取',
  `awardTime` datetime DEFAULT NULL COMMENT '奖励发放时间',
  `phase` varchar(8) DEFAULT '1' COMMENT '活动期数，用于区分活动数据，1：第一期，2：第二期，以此类推。',
  `investTimeRange` varchar(64) DEFAULT NULL COMMENT '投资时间范围，用于记录统计的金额是什么时期的投资金额？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='用户累计投资奖励表';

-- ----------------------------
-- Table structure for t_activity_grabinvestaward
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_grabinvestaward`;
CREATE TABLE `t_activity_grabinvestaward` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '用户Id',
  `borrowId` int(10) DEFAULT NULL COMMENT '用户投标的id',
  `investAmount` decimal(18,2) DEFAULT NULL COMMENT '用户的投资金额',
  `money` decimal(18,2) DEFAULT NULL COMMENT '用户得到的现金券金额',
  `awardType` int(10) DEFAULT NULL COMMENT '奖励的类型：1首投奖；2标王奖；3尾投奖',
  `status` int(10) DEFAULT '1' COMMENT '领取状态；1：未领取；2已领取',
  `awardTime` datetime DEFAULT NULL COMMENT '奖励发放时间',
  `phase` int(10) DEFAULT '1' COMMENT '活动期数，用于区分活动数据，1：第一期，2：第二期，以此类推。',
  `investTimeRange` varchar(64) DEFAULT NULL COMMENT '投资时间范围，用于记录统计的金额是什么时期的投资金额？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5079 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_investwingift
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_investwingift`;
CREATE TABLE `t_activity_investwingift` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '用户Id',
  `investAmount` decimal(18,0) DEFAULT NULL COMMENT '用户的投资金额',
  `awardDescribe` varchar(255) DEFAULT NULL COMMENT '奖励描述',
  `awardType` int(10) DEFAULT NULL COMMENT '奖励的类型,1：3万元及以上；2：7万元及以上；3：15万元及以上；4：30万元及以上；5：40万元及以上；6：60万元及以上；7：70万元及以上；8：100万元及以上',
  `startTime` datetime DEFAULT NULL COMMENT '活动开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '活动结束时间',
  `money` decimal(18,0) DEFAULT NULL COMMENT '奖品价值',
  `discountMoney` decimal(18,0) DEFAULT NULL COMMENT '8折后的折扣价',
  `state` int(2) DEFAULT '1' COMMENT '奖励发放：1：未发放 2：已发放',
  `awardTime` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_inviteaward
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_inviteaward`;
CREATE TABLE `t_activity_inviteaward` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '被推荐人编号',
  `recommendUserId` int(20) DEFAULT NULL COMMENT '推荐人编号',
  `investAmount` decimal(18,2) DEFAULT NULL COMMENT '用户的投资金额',
  `money` decimal(18,2) DEFAULT NULL COMMENT '奖励金额',
  `investTimeRange` varchar(64) DEFAULT NULL COMMENT '投资时间范围，用于记录统计的金额是什么时期的投资金额？',
  `status` int(10) DEFAULT '1' COMMENT '领取状态；1：未领取；2已领取',
  `awardTime` datetime DEFAULT NULL COMMENT '奖励发放时间',
  `phase` int(10) DEFAULT '1' COMMENT '活动期数，用于区分活动数据，1：第一期，2：第二期，以此类推。',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_newinvestaward
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_newinvestaward`;
CREATE TABLE `t_activity_newinvestaward` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '用户Id',
  `borrowId` int(10) DEFAULT NULL COMMENT '用户投标的id',
  `investAmount` decimal(18,2) DEFAULT NULL COMMENT '用户的投资金额',
  `money` decimal(18,2) DEFAULT NULL COMMENT '用户得到的现金券金额',
  `month` int(10) DEFAULT '0' COMMENT '标的期限，几个月的标',
  `status` int(10) DEFAULT '1' COMMENT '用户领取现金券状态;1未领取；2已领取',
  `awardTime` datetime DEFAULT NULL COMMENT '发放奖励的时间',
  `phase` int(10) DEFAULT '1' COMMENT '活动期数，用于区分活动数据，1：第一期，2：第二期，以此类推。',
  `investTimeRange` varchar(64) DEFAULT NULL COMMENT '投资时间范围，用于记录统计的金额是什么时期的投资金额？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COMMENT='新用户投资奖励表';

-- ----------------------------
-- Table structure for t_activity_oldinvestaward
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_oldinvestaward`;
CREATE TABLE `t_activity_oldinvestaward` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '用户Id',
  `borrowId` int(10) DEFAULT NULL,
  `deadline` int(10) DEFAULT '1' COMMENT '1：3个月以内（包括3个月） ，2：3个月以上的标',
  `investAmount` decimal(18,2) DEFAULT NULL COMMENT '用户规定时间内的投资金额',
  `money` decimal(18,2) DEFAULT NULL COMMENT '用户得到的现金券金额',
  `status` int(10) DEFAULT '1' COMMENT '用户领取现金券状态;1未领取；2已领取',
  `awardTime` datetime DEFAULT NULL COMMENT '发放奖励的时间',
  `phase` int(10) DEFAULT '1' COMMENT '活动期数，用于区分活动数据，1：第一期，2：第二期，以此类推。',
  `investTimeRange` varchar(64) DEFAULT NULL COMMENT '投资时间范围，用于记录统计的金额是什么时期的投资金额？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=782 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_recommendinvestaward
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_recommendinvestaward`;
CREATE TABLE `t_activity_recommendinvestaward` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '被推荐人用户id',
  `recommendUserId` bigint(20) DEFAULT NULL COMMENT '推荐人用户id',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `investAmount` decimal(12,2) DEFAULT NULL COMMENT '投资总额',
  `deadline` int(2) DEFAULT NULL COMMENT '借款期限（几月）',
  `money` decimal(12,2) DEFAULT NULL COMMENT '奖励金额',
  `auditTime` datetime DEFAULT NULL COMMENT '满标时间',
  `insertTime` datetime DEFAULT NULL COMMENT '生成时间',
  `investTimeRange` varchar(255) DEFAULT NULL COMMENT '活动时间范围',
  `status` int(2) DEFAULT NULL COMMENT '发放状态；1：未发放；2已发放',
  `awardTime` datetime DEFAULT NULL COMMENT '奖励发放时间',
  `phase` int(3) DEFAULT NULL COMMENT '1表示邀请奖第一期，2表示邀请奖第二期、3表示双节累计投资、4表示双节单笔投资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `enable` int(11) DEFAULT '1' COMMENT '状态 1：启用2：禁用',
  `lastTime` datetime DEFAULT NULL,
  `lastIP` varchar(50) DEFAULT NULL,
  `roleId` bigint(11) DEFAULT NULL COMMENT '角色编号',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `telphone` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `img` text,
  `isLeader` varchar(11) DEFAULT 'false' COMMENT '是否为组长( 默认false 否 true 是)',
  `sex` int(1) DEFAULT NULL COMMENT '性别0女1男',
  `card` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `summary` varchar(1000) DEFAULT NULL COMMENT '描述',
  `nativePlacePro` int(11) DEFAULT '-1' COMMENT '身份（默认为-1）',
  `nativePlaceCity` int(11) DEFAULT '-1' COMMENT '城市（默认为-1）',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `addDate` datetime DEFAULT NULL COMMENT '创建时间',
  `moneys` decimal(18,2) DEFAULT '0.00' COMMENT '奖励提成',
  `loginErrorCount` int(10) DEFAULT '0',
  `isLoginLimit` int(10) DEFAULT '1',
  `isFirstLogin` int(10) DEFAULT '2' COMMENT '首次登录（1是，2不是）',
  `loanUserId` bigint(20) DEFAULT '-1' COMMENT '贷后维护经理UserId',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_index_id` (`id`) USING BTREE,
  UNIQUE KEY `admin_index_username` (`userName`) USING BTREE,
  KEY `index_admin_role` (`roleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_agreement
-- ----------------------------
DROP TABLE IF EXISTS `t_agreement`;
CREATE TABLE `t_agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `agreementType` int(11) DEFAULT NULL COMMENT '协议类型（1.条款编辑 2.债权转让协议 3.借款协议 4.本金保障协议）',
  `provisionType` int(11) DEFAULT NULL COMMENT '条款类型（1.使用条款 2.隐私条款）',
  `agreementDesc` varchar(255) DEFAULT NULL COMMENT '协议说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='协议条款';

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(200) DEFAULT NULL COMMENT '企业名称',
  `registnumber` varchar(200) DEFAULT NULL COMMENT '注册号',
  `tname` varchar(50) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `cityaddress` varchar(200) DEFAULT NULL COMMENT '城市所在地',
  `borrowAmount` decimal(20,0) DEFAULT NULL COMMENT '借款金额',
  `deadline` int(11) DEFAULT NULL COMMENT '借款期限',
  `borrowPurpose` varchar(100) DEFAULT NULL COMMENT '借款用途',
  `state` int(11) DEFAULT '0' COMMENT '处理状态（0 未处理 1 已处理）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_approve_notice_style
-- ----------------------------
DROP TABLE IF EXISTS `t_approve_notice_style`;
CREATE TABLE `t_approve_notice_style` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notice_style` int(20) DEFAULT NULL COMMENT '提醒方式( 1站内信 2 邮件 3 短信)',
  `notice_type` int(20) DEFAULT NULL COMMENT '提醒类型( 1 资金设置 2 贷款者设置  3 投资者设置)',
  `title` varchar(225) DEFAULT NULL COMMENT '提醒类型名称',
  `nid` varchar(100) DEFAULT NULL COMMENT '唯一标识',
  `status` int(11) DEFAULT '1' COMMENT '状态(默认 1 开启 2 关闭)',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `index_ans_id` (`id`) USING BTREE,
  KEY `index_ans_sort` (`sort`) USING BTREE,
  KEY `index_ans_style` (`notice_style`) USING BTREE,
  KEY `index-ans_type` (`notice_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='提醒方式记录';

-- ----------------------------
-- Table structure for t_approve_notice_template
-- ----------------------------
DROP TABLE IF EXISTS `t_approve_notice_template`;
CREATE TABLE `t_approve_notice_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notice_id` bigint(20) DEFAULT NULL COMMENT '提醒方式',
  `name` varchar(200) DEFAULT NULL COMMENT '提醒类型',
  `template` longtext COMMENT '提醒模版',
  `nid` varchar(100) DEFAULT NULL COMMENT '标识名',
  `status` int(11) DEFAULT '1' COMMENT '开启状态(默认 1 开启 2 关闭)',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `index_ant_id` (`id`) USING BTREE,
  KEY `index_ant_notice` (`notice_id`) USING BTREE,
  KEY `index_ant_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='提醒模版记录';

-- ----------------------------
-- Table structure for t_app_inviteactivity
-- ----------------------------
DROP TABLE IF EXISTS `t_app_inviteactivity`;
CREATE TABLE `t_app_inviteactivity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '邀请好友投资活动创建时间',
  `activityTime` varchar(50) DEFAULT NULL COMMENT '显示的活动时间',
  `activityObject` varchar(200) DEFAULT NULL COMMENT '显示的活动对象',
  `activityDescribe` varchar(500) DEFAULT NULL COMMENT '显示的活动说明',
  `exampleDescribe` varchar(500) DEFAULT NULL COMMENT '举例说明',
  `awardDescribe` varchar(500) DEFAULT NULL COMMENT '奖励说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_app_version
-- ----------------------------
DROP TABLE IF EXISTS `t_app_version`;
CREATE TABLE `t_app_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `type` int(11) DEFAULT NULL COMMENT '版本类型 1表示安卓 2表示苹果',
  `publishTime` date DEFAULT NULL COMMENT '发布时间',
  `isUpdate` int(11) DEFAULT NULL COMMENT '是否必须更新 1表示必须更新 2表示非必须更新',
  `versionName` varchar(255) DEFAULT NULL COMMENT '版本名称',
  `downloadPath` varchar(255) DEFAULT NULL COMMENT '版本下载路径',
  `descript` varchar(255) DEFAULT NULL COMMENT '版本更新说明',
  `fileName` varchar(255) DEFAULT NULL COMMENT '版本文件名称',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_assignment_debt
-- ----------------------------
DROP TABLE IF EXISTS `t_assignment_debt`;
CREATE TABLE `t_assignment_debt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `debtSum` decimal(18,2) DEFAULT '0.00' COMMENT '债权总额',
  `auctionBasePrice` decimal(18,2) DEFAULT '0.00' COMMENT '转让金额',
  `debtLimit` int(11) DEFAULT NULL COMMENT '债权期限',
  `auctionMode` int(11) DEFAULT '1' COMMENT '竞拍模式（1为明拍，2为暗拍）',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间（管理员审核时间）',
  `viewCount` int(11) DEFAULT '0' COMMENT '浏览量',
  `details` text COMMENT '转让描述',
  `auctionDays` int(11) DEFAULT NULL COMMENT '竞拍天数',
  `debtStatus` int(11) DEFAULT '1' COMMENT '转让状态(1审核中，2为竞拍中，3竞拍成功，4，竞拍失败，5，撤销,6审核失败,7提前还款)',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款Id',
  `alienatorId` bigint(20) DEFAULT NULL COMMENT '转让人',
  `auctionerId` bigint(20) DEFAULT NULL COMMENT '最高竞拍者Id',
  `auctionHighPrice` decimal(18,2) DEFAULT NULL COMMENT '最高竞拍价',
  `auctionEndTime` datetime DEFAULT NULL COMMENT '竞拍结束时间',
  `applyTime` datetime DEFAULT NULL COMMENT '申请时间',
  `manageFee` decimal(18,2) DEFAULT '0.00' COMMENT '手续费',
  `investId` bigint(20) DEFAULT NULL COMMENT '投资Id',
  `buyTime` datetime DEFAULT NULL COMMENT '债权购买时间',
  `ordId` varchar(40) DEFAULT NULL COMMENT '汇付返回交易流水号',
  `pageType` varchar(40) DEFAULT '0' COMMENT '转让渠道',
  `download_url` varchar(255) DEFAULT NULL COMMENT '签署后文件下载地址',
  `viewpdf_url` varchar(255) DEFAULT NULL COMMENT '在线查看已签署地址',
  `contract_id` varchar(200) DEFAULT NULL COMMENT '合同编号',
  PRIMARY KEY (`id`),
  KEY `index_ad_id` (`id`) USING BTREE,
  KEY `index_ad_status` (`debtStatus`) USING BTREE,
  KEY `index_ad_bid` (`borrowId`) USING BTREE,
  KEY `index_ad_iid` (`investId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_assurance
-- ----------------------------
DROP TABLE IF EXISTS `t_assurance`;
CREATE TABLE `t_assurance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `borrowId` bigint(11) DEFAULT NULL COMMENT '借款表ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '担保用户ID',
  `assuranceAmount` decimal(18,2) DEFAULT '0.00' COMMENT '担保金额',
  `realityAmount` decimal(18,2) DEFAULT '0.00' COMMENT '实际担保金额',
  `freezeMargin` decimal(18,2) DEFAULT '0.00' COMMENT '冻结保证金',
  `unfreezeMargin` decimal(18,2) DEFAULT '0.00' COMMENT '已解冻冻结保证金',
  `marginGap` decimal(18,2) DEFAULT '0.00' COMMENT '保证金缺口',
  `charge` decimal(18,2) DEFAULT '0.00' COMMENT '担保费/率 %',
  `isSucceed` int(4) DEFAULT NULL COMMENT '担保是否成功(0.等待确认，1,已经确认)',
  `assurTime` datetime DEFAULT NULL COMMENT '担保时间',
  `fee` int(1) DEFAULT '1' COMMENT '担保费模式（0：费率；1：费用）',
  `isDeduction` int(1) DEFAULT NULL COMMENT '是否在线扣除担保管理费（1：否；2：是）',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  `trxId` varchar(20) DEFAULT NULL COMMENT '冻结保证金流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_auction_debt
-- ----------------------------
DROP TABLE IF EXISTS `t_auction_debt`;
CREATE TABLE `t_auction_debt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '竞拍者Id',
  `debtId` bigint(20) DEFAULT NULL COMMENT '债权转让Id',
  `auctionTime` datetime DEFAULT NULL COMMENT '竞拍时间',
  `auctionPrice` decimal(18,2) DEFAULT '0.00' COMMENT '竞拍价格',
  `autiontimes` int(11) DEFAULT '1' COMMENT '竞标次数（最多为2）',
  `pageType` varchar(40) DEFAULT '0' COMMENT '转让渠道',
  PRIMARY KEY (`id`),
  KEY `index_adebt_id` (`id`) USING BTREE,
  KEY `index_adebt_uid` (`userId`) USING BTREE,
  KEY `index_adebt_did` (`debtId`) USING BTREE,
  KEY `index_adebt_price` (`auctionPrice`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_automaticbid
-- ----------------------------
DROP TABLE IF EXISTS `t_automaticbid`;
CREATE TABLE `t_automaticbid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `bidAmount` decimal(18,2) DEFAULT NULL COMMENT '投标金额',
  `rateStart` decimal(18,2) DEFAULT NULL COMMENT '利率范围开始',
  `rateEnd` decimal(18,2) DEFAULT NULL COMMENT '利率范围结束',
  `deadlineStart` int(11) DEFAULT NULL COMMENT '借款期限开始',
  `deadlineEnd` int(11) DEFAULT NULL COMMENT '借款期限开始',
  `creditStart` bigint(20) DEFAULT NULL COMMENT '信用积分开始',
  `creditEnd` bigint(20) DEFAULT NULL COMMENT '信用积分结束',
  `remandAmount` decimal(18,2) DEFAULT NULL COMMENT '保留金额',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `bidStatus` int(11) DEFAULT '1' COMMENT '投标状态( 1 停用 2 启用)',
  `bidSetTime` datetime DEFAULT NULL COMMENT '投标设置时间',
  `borrowWay` varchar(200) DEFAULT NULL COMMENT '借款类型',
  PRIMARY KEY (`id`),
  KEY `index_amb_id` (`id`) USING BTREE,
  KEY `index_amb_user` (`userId`) USING BTREE,
  KEY `index_amb_time` (`bidSetTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_automaticbid_user
-- ----------------------------
DROP TABLE IF EXISTS `t_automaticbid_user`;
CREATE TABLE `t_automaticbid_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `index_ambu_id` (`id`) USING BTREE,
  KEY `index_ambu_borrow` (`borrowId`) USING BTREE,
  KEY `index_ambu_user` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_automaticrepayment
-- ----------------------------
DROP TABLE IF EXISTS `t_automaticrepayment`;
CREATE TABLE `t_automaticrepayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `bidStatus` int(11) DEFAULT '1' COMMENT '状态( 1 停用 2 启用)',
  `bidSetTime` datetime DEFAULT NULL COMMENT '设置时间',
  PRIMARY KEY (`id`),
  KEY `index_amb_id` (`id`) USING BTREE,
  KEY `index_amb_user` (`userId`) USING BTREE,
  KEY `index_amb_time` (`bidSetTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `t_bankcard`;
CREATE TABLE `t_bankcard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `cardUserName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `bankName` varchar(50) DEFAULT NULL COMMENT '开户行',
  `branchBankName` varchar(50) DEFAULT NULL COMMENT '支行',
  `cardNo` varchar(50) DEFAULT NULL COMMENT '卡号',
  `cardMode` int(11) DEFAULT NULL COMMENT '1 快捷支付  2普通支付       ',
  `modifiedCardNo` varchar(19) DEFAULT NULL COMMENT '变更后的银行卡号',
  `modifiedBankName` varchar(50) DEFAULT NULL COMMENT '变更后的银行卡开户行',
  `modifiedBranchBankName` varchar(50) DEFAULT NULL COMMENT '变更后的银行卡开户支行',
  `commitTime` datetime DEFAULT NULL COMMENT '申请时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '更换时间',
  `modifiedCardStatus` int(11) DEFAULT NULL COMMENT '变更后的银行卡状态（1 成功 2正在审核  3 失败）',
  `cardStatus` int(11) DEFAULT '1' COMMENT '卡状态( 默认申请中 1 已绑定 2 申请中 3 失败 ',
  `checkTime` datetime DEFAULT NULL COMMENT '审核时间',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `checkUser` bigint(20) DEFAULT NULL COMMENT '审核人',
  `remark` varchar(200) DEFAULT NULL COMMENT '审核意见',
  `openBankId` varchar(100) DEFAULT NULL COMMENT '银行代号',
  PRIMARY KEY (`id`),
  KEY `fk_bankcard_user` (`userId`) USING BTREE,
  KEY `index_bankcard_status` (`cardStatus`) USING BTREE,
  KEY `index_bankcard_checkuser` (`checkUser`) USING BTREE,
  KEY `index_bankcard_commit` (`commitTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bannerPath` varchar(255) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `bannerName` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型：1表示PC端，2表示wap端，3表示app端',
  `sort` int(11) DEFAULT NULL,
  `isShow` int(2) DEFAULT '1' COMMENT '是否显示 1:显示，2:隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_billcode
-- ----------------------------
DROP TABLE IF EXISTS `t_billcode`;
CREATE TABLE `t_billcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pMerBillNo` varchar(40) DEFAULT NULL COMMENT '订单号',
  `pIpsBillNo` varchar(40) DEFAULT NULL COMMENT '汇付充值订单号',
  `paramMap` varchar(4000) DEFAULT NULL COMMENT '参数列表',
  `borrowId` bigint(11) DEFAULT NULL COMMENT '借款id',
  `investAmount` decimal(11,2) DEFAULT NULL COMMENT '投资金额',
  `inserTime` datetime DEFAULT NULL COMMENT '插入时间',
  `status` int(2) DEFAULT NULL COMMENT '状态： 1表示投标初始化，2表示投标成功，3表示过期',
  PRIMARY KEY (`id`),
  KEY `index_billcode_id` (`id`) USING BTREE,
  KEY `index_billcode_borrowId` (`borrowId`) USING BTREE,
  KEY `index_billcode_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=907411 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow`;
CREATE TABLE `t_borrow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrowTitle` varchar(200) DEFAULT NULL COMMENT '借款标题',
  `imgPath` varchar(200) DEFAULT NULL COMMENT '借款图片',
  `borrowWay` int(11) DEFAULT NULL COMMENT '借款方式(1 净值借款 2 秒还借款 3 普通借款 4 实地考察借款 5 机构担保借款 6 流转标)\r\n            ',
  `hetong` int(11) DEFAULT NULL COMMENT '合同模板',
  `borrowInfo` text COMMENT '借款信息',
  `deadline` int(11) DEFAULT NULL COMMENT '借款期限',
  `paymentMode` int(11) DEFAULT NULL COMMENT '还款方式(1 按月等额本息还款 2 按先息后本还款 4 一次性还款)\r\n            \r\n            ',
  `borrowAmount` decimal(18,2) DEFAULT NULL COMMENT '借款总额',
  `annualRate` decimal(18,2) DEFAULT NULL COMMENT '年利率',
  `minTenderedSum` decimal(18,2) DEFAULT NULL COMMENT '最低投标金额',
  `maxTenderedSum` decimal(18,2) DEFAULT NULL COMMENT '最多投标金额',
  `raiseTerm` int(11) DEFAULT NULL COMMENT '筹标期限',
  `detail` text COMMENT '借款详情',
  `tradeType` int(11) DEFAULT '1' COMMENT '交易类型 (1 线上交易 2 线下交易)',
  `publisher` bigint(20) DEFAULT NULL COMMENT '发布人',
  `excitationType` int(11) DEFAULT NULL COMMENT '奖励类型(1 不设置奖励 2 按固定比例金额分摊 3 按投标金额比例)',
  `visitors` int(11) DEFAULT '0' COMMENT '浏览量,默认0',
  `remainTimeStart` datetime DEFAULT NULL COMMENT '剩余时间开始',
  `auditOpinion` text COMMENT '审核意见',
  `borrowStatus` int(11) DEFAULT '1' COMMENT '借款状态(1 默认等待资料 2 正在招标中 3 已满标 4还款中 5 已还完 6 流标7未开放)\r\n            ',
  `excitationSum` decimal(18,2) DEFAULT NULL COMMENT '奖励金额',
  `excitationMode` int(11) DEFAULT NULL COMMENT '奖励方式（1 成功奖励 ）',
  `hasInvestAmount` decimal(18,2) DEFAULT '0.00' COMMENT '已投总额，默认0',
  `investNum` int(11) DEFAULT '0' COMMENT '总投标数,默认是0',
  `purpose` int(11) DEFAULT NULL COMMENT '借款目的',
  `hasPWD` int(11) DEFAULT '-1' COMMENT '是否设置投标密码(-1 默认不设置 1 设置)',
  `investPWD` varchar(50) DEFAULT NULL COMMENT '投标密码',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `publishIP` varchar(100) DEFAULT NULL COMMENT '发布IP',
  `remainTimeEnd` datetime DEFAULT NULL COMMENT '剩余时间结束',
  `auditTime` datetime DEFAULT NULL COMMENT '满标复审审核通过日期',
  `hasDeadline` int(11) DEFAULT '0' COMMENT '已还期数',
  `isAutoBid` int(11) DEFAULT '1' COMMENT '自动投标( 默认 1 手动 2 自动)',
  `manageFee` decimal(18,2) DEFAULT '0.00' COMMENT '借款管理费',
  `isDayThe` int(11) DEFAULT '1' COMMENT '是否为天标( 默认 1 否，2 是)',
  `autoBidEnableTime` datetime DEFAULT NULL COMMENT '允许自动投标时间',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `frozen_margin` decimal(18,2) DEFAULT '0.00' COMMENT '冻结保证金',
  `smallestFlowUnit` decimal(18,2) DEFAULT '1.00' COMMENT '最小认购单位',
  `circulationNumber` int(11) DEFAULT '0' COMMENT '总份数（流转标专用）',
  `hasCirculationNumber` int(11) DEFAULT '0' COMMENT '已认购份数',
  `nid_log` varchar(50) DEFAULT NULL COMMENT '标题种类的唯一标识',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `feestate` text COMMENT '费用说明',
  `feelog` text COMMENT '平台收费历史记录',
  `businessDetail` text COMMENT '商业详情',
  `assets` text COMMENT '资产情况',
  `moneyPurposes` text COMMENT '资金用途',
  `circulationMode` int(11) DEFAULT '1' COMMENT '流转标发布模式(1 前台用户 2 后台特权用户)',
  `circulationStatus` int(11) DEFAULT '1' COMMENT '流转标审核状态(1 待审核 2 审核成功 3 审核失败)',
  `undertaker` bigint(20) DEFAULT NULL COMMENT '代发人',
  `borrowShow` int(11) DEFAULT '1' COMMENT '借款显示类型(1 一般借款 2 流转标借款)',
  `hasRepoNumber` int(11) DEFAULT '0' COMMENT '已回购份数',
  `agent` varchar(200) DEFAULT NULL COMMENT '担保机构',
  `counterAgent` varchar(200) DEFAULT NULL COMMENT '二级担保公司',
  `amount_scale` decimal(18,4) DEFAULT NULL COMMENT '借款进度比例',
  `borrowType` int(11) DEFAULT '1' COMMENT '借款类型（1：个人借款 2：企业借款）',
  `publisherWay` int(11) DEFAULT '1' COMMENT '发布方式 （1：前台发布，2：后台发布），默认1',
  `authCount` int(11) DEFAULT '0' COMMENT '企业发标时，该用户通过的认证的数量',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  `trxId` varchar(20) DEFAULT NULL COMMENT '汇付冻结保证金流水号',
  `loansOk` int(5) DEFAULT NULL COMMENT '汇付放款成功个数',
  `unfreeOk` int(5) DEFAULT NULL COMMENT '汇付成功解冻个数',
  `borrowTypeSubId` int(11) DEFAULT NULL COMMENT '借款类型：2体验标;3多金宝;4普金保;5新手标;6恒金宝',
  `projectScore` varchar(20) DEFAULT NULL COMMENT '项目评级',
  `retsource` text COMMENT '还款来源',
  `batch_id` bigint(20) DEFAULT NULL COMMENT '授权交易号',
  `contract_id` varchar(50) DEFAULT NULL COMMENT '发标借款的合同编号',
  `isShow` tinyint(2) DEFAULT '1' COMMENT '是否显示（0不显示，1显示）',
  `projectIntro` text COMMENT '项目介绍',
  `safeMeasures` text COMMENT '保障措施',
  `bidTime` datetime DEFAULT NULL,
  `showRate` varchar(100) DEFAULT NULL COMMENT '展示利率',
  `projectAddress` varchar(200) DEFAULT NULL COMMENT '项目地址',
  `behalfUserId` bigint(20) DEFAULT NULL COMMENT '投资人代表UserId',
  `loanUserId` bigint(20) DEFAULT NULL COMMENT '贷后维护经理UserId',
  `groupid` int(11) DEFAULT '1' COMMENT '企业分组，属于哪个企业的资料信息',
  `loan2UserId` bigint(20) DEFAULT NULL COMMENT '贷后维护经理UserId2',
  `pushdate` datetime DEFAULT NULL COMMENT '推送给融途网的时间',
  `pushstate` varchar(10) DEFAULT '1' COMMENT '推送融途网的状态 1：未推送 2：成功 3：失败',
  `recommend` int(2) DEFAULT '0' COMMENT '0未推荐，1已推荐',
  `transferable` int(2) DEFAULT '0' COMMENT '0是不可转让，1是可转让',
  `auditStatus` int(10) DEFAULT '1' COMMENT '审核状态 1：未审核  2：审核处理中 3：成功 4：失败',
  `auditRemark` varchar(200) DEFAULT '' COMMENT '审核结果描述',
  `adminId` int(10) DEFAULT NULL COMMENT '审核员的ID',
  `billId` bigint(20) DEFAULT '-1' COMMENT '票据id',
  PRIMARY KEY (`id`),
  KEY `index_borrow_id` (`id`) USING BTREE,
  KEY `index_borrow_user` (`publisher`) USING BTREE,
  KEY `index_borrow_time` (`publishTime`) USING BTREE,
  KEY `index_borrow_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow_amount_type
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_amount_type`;
CREATE TABLE `t_borrow_amount_type` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '借款额度类型名称',
  `nid` varchar(100) DEFAULT NULL COMMENT '借款标识名',
  `once_status` int(11) DEFAULT NULL COMMENT '一次性额度',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT NULL COMMENT '开启状态(默认 1 开启 2 关闭)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `init_credit` decimal(18,0) DEFAULT '0' COMMENT '初始化额度',
  PRIMARY KEY (`id`),
  KEY `index_bat_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_bill`;
CREATE TABLE `t_borrow_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `insertTime` datetime DEFAULT NULL COMMENT '插入时间',
  `billName` varchar(255) DEFAULT NULL COMMENT '票据名称',
  `outBillDate` date DEFAULT NULL COMMENT '出票日',
  `expireDate` date DEFAULT NULL COMMENT '票据到期日期',
  `drawer` varchar(20) DEFAULT NULL COMMENT '开票人',
  `drawee` varchar(20) DEFAULT NULL COMMENT '受票人',
  `confirmer` varchar(255) DEFAULT NULL COMMENT '保兑人',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `lastRepayDate` date DEFAULT NULL COMMENT '最后还款日',
  `status` int(2) DEFAULT NULL COMMENT '状态 1资料录入中、2财务待审核、3财务审核通过、4财务审核不通过（流标）、5已付款给供应商、6已发标、7票据保管中、8邮寄中（保理公司）、9保理公司已收、10已托收至银行、11已回款、12已还款给客户，13撤回重新',
  `acceptanceTime` datetime DEFAULT NULL COMMENT '受理时间',
  `adminId` int(11) DEFAULT NULL COMMENT '保理公司用户id（即 t_admin 表的 id）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrow_bill_record
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_bill_record`;
CREATE TABLE `t_borrow_bill_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billId` bigint(20) DEFAULT NULL COMMENT '票据id',
  `processor` varchar(255) DEFAULT NULL COMMENT '操作人',
  `processTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `proStatus` int(2) DEFAULT NULL COMMENT '操作状态(1资料录入中、2财务待审核、3审核通过、4审核不通过（流标）、5已付款、6已发标、7已满标、8邮寄中（保理公司）、9保利公司已收、10银行已托收、11已回款、12已还款)',
  `describe` text COMMENT '操作描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrow_inspection
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_inspection`;
CREATE TABLE `t_borrow_inspection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowId` bigint(20) DEFAULT NULL,
  `borrowTitle` varchar(255) DEFAULT NULL,
  `loanUserId` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `dealWithStatus` int(2) DEFAULT NULL COMMENT '0表示未处理，1表示已处理，2表示已过期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrow_loan_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_loan_manager`;
CREATE TABLE `t_borrow_loan_manager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款ID',
  `borrowTitle` varchar(200) DEFAULT NULL COMMENT '借款标题',
  `visitTime` datetime DEFAULT NULL COMMENT '拜访时间',
  `loanUserId` bigint(20) DEFAULT NULL COMMENT '维护经理ID',
  `loanMaintenance` varchar(100) DEFAULT NULL COMMENT '维护经理/前去拜访的人',
  `mainVisitName` varchar(100) DEFAULT NULL COMMENT '主要约谈人姓名',
  `minorVisitName` varchar(100) DEFAULT NULL COMMENT '次要约谈人姓名',
  `collectMaterialId` varchar(22) DEFAULT '0' COMMENT '收集资料的ID',
  `materDescription` varchar(500) DEFAULT NULL COMMENT '收集资料的描述',
  `description` varchar(500) DEFAULT NULL COMMENT '问题描述',
  `status` int(2) DEFAULT '1' COMMENT '状态, 正常：1， 关注：2， 较严重：3，严重：4',
  `sitePhotos` varchar(22) DEFAULT NULL COMMENT '现场照片Id',
  `sitePhotoId` varchar(22) DEFAULT '0' COMMENT '现场照片',
  `operatingTime` datetime DEFAULT NULL COMMENT '操作时间',
  `corpusIncome` varchar(300) DEFAULT NULL COMMENT '本息催收',
  `isIncome` int(2) DEFAULT NULL COMMENT '是否收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_borrow_manage_fee
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_manage_fee`;
CREATE TABLE `t_borrow_manage_fee` (
  `borrowId` bigint(20) NOT NULL COMMENT '标的编码',
  `borrowTitle` varchar(200) DEFAULT NULL COMMENT '标的名称',
  `customerCode` varchar(100) DEFAULT NULL COMMENT '客户编码',
  `customerName` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `costType` int(11) DEFAULT NULL COMMENT '费用类型(1.平台使用费2.借款手续费3.借款管理费4.机构担保费',
  `costAmount` decimal(18,2) DEFAULT NULL COMMENT '费用金额)',
  `paymentStatus` varchar(20) DEFAULT '1000' COMMENT '汇付是否扣款成功, 初始化：1000，成功：1001，失败：1002',
  `state` int(20) DEFAULT '1' COMMENT '是否有效 1 有效  2 无效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_borrow_role
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_role`;
CREATE TABLE `t_borrow_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `applyId` bigint(20) DEFAULT NULL COMMENT '申请ID',
  `borrowId` text COMMENT '借款ID列表',
  `authStep` int(11) DEFAULT NULL COMMENT '认证步骤(1 基本信息完整  2 认证资料完整)',
  `isFirst` int(11) DEFAULT '0' COMMENT '是否是第一次发布借款（0：是，1：否）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow_style
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_style`;
CREATE TABLE `t_borrow_style` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标示名',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用( 默认1 启用 2 禁用)',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT NULL COMMENT '名称，可改',
  `contents` longtext COMMENT '算法公式',
  `remark` longtext COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `index_bstyle_id` (`id`) USING BTREE,
  KEY `index_bstyle_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow_sub_type
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_sub_type`;
CREATE TABLE `t_borrow_sub_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '二级标的名称',
  `typeId` bigint(20) DEFAULT NULL COMMENT 't_borrow_type 的 Id',
  `state` int(4) NOT NULL DEFAULT '0' COMMENT '状态：默认0开启  1关闭',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `borrow_sub_type` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow_type
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_type`;
CREATE TABLE `t_borrow_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nid` varchar(50) DEFAULT NULL COMMENT '型标识名',
  `status` int(11) DEFAULT '1' COMMENT '状态(默认 1 开启 2 关闭)',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `description` text COMMENT '描述',
  `account_multiple` decimal(18,0) DEFAULT NULL COMMENT '借款金额的倍数',
  `password_status` int(11) DEFAULT '2' COMMENT '是否启用借款密码(1开启 2 关闭)',
  `amount_type` int(11) DEFAULT NULL COMMENT '借款额度类型',
  `amount_first` decimal(18,0) DEFAULT '0' COMMENT '最低借款额度 (0 没有限制)',
  `amount_end` decimal(18,0) DEFAULT '0' COMMENT '最高借款额度 (0 没有限制)',
  `frost_scale_vip` decimal(18,2) DEFAULT '0.00' COMMENT 'vip冻结比例',
  `apr_first` decimal(18,2) DEFAULT '0.00' COMMENT '开始年利率',
  `apr_end` decimal(18,2) DEFAULT '0.00' COMMENT '结束年利率',
  `check_first` int(11) DEFAULT '1' COMMENT '审核最短时间',
  `check_end` int(11) DEFAULT '3' COMMENT '审核最长时间',
  `tender_account_min` varchar(255) DEFAULT NULL COMMENT '最低投标金额',
  `tender_account_max` varchar(255) DEFAULT NULL COMMENT '最高投标金额',
  `period_month` varchar(255) DEFAULT NULL COMMENT '借款期限,按月',
  `period_day` varchar(255) DEFAULT NULL COMMENT '借款期限,按天',
  `validate` varchar(255) DEFAULT NULL COMMENT '有效期( 0 无限期)',
  `award_status` int(11) DEFAULT '1' COMMENT '是否启用奖励( 默认 1 开启 2 关闭)',
  `award_scale_first` decimal(18,2) DEFAULT '0.00' COMMENT '奖励比例的最小值',
  `award_scale_end` decimal(18,2) DEFAULT '100.00' COMMENT '奖励比例的最大值',
  `award_account_first` decimal(18,2) DEFAULT '0.00' COMMENT '不能小于此奖励金额',
  `award_account_end` decimal(18,2) DEFAULT '0.00' COMMENT '不能大于此奖励金额 (0 无最大限制)',
  `subscribe_status` int(11) DEFAULT '2' COMMENT '是否启用认购模式( 1 开启 2 关闭)',
  `verify_auto_status` int(11) DEFAULT '2' COMMENT '初审自动通过(1 开启 2 关闭)',
  `verify_auto_remark` varchar(255) DEFAULT NULL COMMENT '初审自动通过备注',
  `styles` varchar(255) DEFAULT NULL COMMENT '还款方式',
  `vip_frost_scale` decimal(18,2) unsigned DEFAULT '0.00' COMMENT 'VIP冻结保证金比例',
  `late_days_month` int(11) DEFAULT '0' COMMENT '多久开始进行垫付按月标',
  `late_days_day` int(11) DEFAULT '0' COMMENT '多久开始进行垫付按天标',
  `vip_late_scale` decimal(18,2) DEFAULT '100.00' COMMENT 'vip逾期垫付本息比例',
  `all_late_scale` decimal(18,2) DEFAULT '100.00' COMMENT '普通会员垫付本金比例',
  `all_frost_scale` decimal(18,2) DEFAULT '0.00' COMMENT '普通会员冻结保证金比例',
  `version` int(11) DEFAULT '1' COMMENT '版本控制',
  `identifier` varchar(100) DEFAULT NULL COMMENT '唯一标识列',
  `counter_guarantee` varchar(255) DEFAULT NULL COMMENT '反担保方式',
  `institution` varchar(255) DEFAULT NULL COMMENT '担保机构',
  `locan_fee` decimal(18,2) DEFAULT '0.00' COMMENT '借款管理费',
  `locan_month` int(18) DEFAULT '0' COMMENT '限定借款期限',
  `locan_fee_month` decimal(18,2) DEFAULT '0.00' COMMENT '超出限定期限的借款管理费',
  `day_fee` decimal(18,2) DEFAULT '0.00' COMMENT '天标借款费',
  `show_type` int(18) DEFAULT '1' COMMENT '控制显示隐藏  1  显示  2 隐藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shove_borrow_type_identifier` (`identifier`) USING BTREE,
  KEY `index_btype_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_borrow_type_log
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_type_log`;
CREATE TABLE `t_borrow_type_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nid` varchar(50) DEFAULT NULL COMMENT '型标识名',
  `status` int(11) DEFAULT '1' COMMENT '状态(默认 1 开启 2 关闭)',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `account_multiple` decimal(18,0) DEFAULT NULL COMMENT '借款金额的倍数',
  `password_status` int(11) DEFAULT '2' COMMENT '是否启用借款密码(1开启 2 关闭)',
  `amount_type` int(11) DEFAULT NULL COMMENT '借款额度类型',
  `amount_first` decimal(18,0) DEFAULT '0' COMMENT '最低借款额度 (0 没有限制)',
  `amount_end` decimal(18,0) DEFAULT '0' COMMENT '最高借款额度 (0 没有限制)',
  `frost_scale_vip` decimal(18,2) DEFAULT '0.00' COMMENT 'vip冻结比例',
  `apr_first` decimal(18,2) DEFAULT '0.00' COMMENT '开始年利率',
  `apr_end` decimal(18,2) DEFAULT '0.00' COMMENT '结束年利率',
  `check_first` int(11) DEFAULT '1' COMMENT '审核最短时间',
  `check_end` int(11) DEFAULT '3' COMMENT '审核最长时间',
  `tender_account_min` varchar(255) DEFAULT NULL COMMENT '最低投标金额',
  `tender_account_max` varchar(255) DEFAULT NULL COMMENT '最高投标金额',
  `period_month` varchar(255) DEFAULT NULL COMMENT '借款期限,按月',
  `period_day` varchar(255) DEFAULT NULL COMMENT '借款期限,按天',
  `validate` varchar(255) DEFAULT NULL COMMENT '有效期( 0 无限期)',
  `award_status` int(11) DEFAULT '1' COMMENT '是否启用奖励( 默认 1 开启 2 关闭)',
  `award_scale_first` decimal(18,2) DEFAULT '0.00' COMMENT '奖励比例的最小值',
  `award_scale_end` decimal(18,2) DEFAULT '100.00' COMMENT '奖励比例的最大值',
  `award_account_first` decimal(18,2) DEFAULT '0.00' COMMENT '不能小于此奖励金额',
  `award_account_end` decimal(18,2) DEFAULT '0.00' COMMENT '不能大于此奖励金额 (0 无最大限制)',
  `subscribe_status` int(11) DEFAULT '2' COMMENT '是否启用认购模式( 1 开启 2 关闭)',
  `verify_auto_status` int(11) DEFAULT '2' COMMENT '初审自动通过(1 开启 2 关闭)',
  `verify_auto_remark` varchar(255) DEFAULT NULL COMMENT '初审自动通过备注',
  `styles` varchar(255) DEFAULT NULL COMMENT '还款方式',
  `vip_frost_scale` decimal(18,2) unsigned DEFAULT '0.00' COMMENT 'VIP冻结保证金比例',
  `late_days_month` int(11) DEFAULT '0' COMMENT '多久开始进行垫付按月标',
  `late_days_day` int(11) DEFAULT '0' COMMENT '多久开始进行垫付按天标',
  `vip_late_scale` decimal(18,2) DEFAULT '100.00' COMMENT 'vip逾期垫付本息比例',
  `all_late_scale` decimal(18,2) DEFAULT '100.00' COMMENT '普通会员逾期垫付本金比例',
  `all_frost_scale` decimal(18,2) DEFAULT '0.00' COMMENT '普通会员冻结保证金比例',
  `user_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `update_ip` varchar(255) DEFAULT NULL COMMENT '更新ip',
  `identifier` varchar(100) DEFAULT NULL COMMENT '唯一标识(对应发布的借款)',
  `counter_guarantee` varchar(255) DEFAULT NULL COMMENT '反担保方式',
  `institution` varchar(255) DEFAULT NULL COMMENT '担保机构',
  `locan_fee` decimal(18,2) DEFAULT '0.00' COMMENT '借款管理费',
  `locan_month` int(18) DEFAULT '0' COMMENT '限定借款期限',
  `locan_fee_month` decimal(18,2) DEFAULT '0.00' COMMENT '超出限定期限的借款管理费',
  `day_fee` decimal(18,2) DEFAULT '0.00' COMMENT '天标借款费',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_borrow_type_log_identifier` (`identifier`) USING BTREE,
  KEY `index_btl_id` (`id`) USING BTREE,
  KEY `index_btl_user` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_cash_reconciliation
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_reconciliation`;
CREATE TABLE `t_cash_reconciliation` (
  `OrdId` varchar(32) NOT NULL COMMENT '订单号',
  `MerCustId` varchar(32) DEFAULT NULL COMMENT '商户客户号',
  `UsrCustId` varchar(32) DEFAULT NULL COMMENT '用户客户号',
  `CardId` varchar(32) DEFAULT NULL COMMENT '开户银行账号',
  `TransAmt` decimal(18,2) DEFAULT NULL COMMENT '交易金额',
  `TransStat` varchar(2) DEFAULT NULL COMMENT '汇付交易状态',
  `PnrDate` varchar(8) DEFAULT NULL COMMENT '汇付交易日期',
  `PnrSeqId` varchar(32) DEFAULT NULL COMMENT '汇付交易流水',
  `ServFee` decimal(18,2) DEFAULT NULL COMMENT '商户收取服务费金额',
  `ServFeeAcctId` varchar(32) DEFAULT NULL COMMENT '商户子账户号',
  `FeeAmt` decimal(18,2) DEFAULT NULL COMMENT '手续费金额',
  `FeeCustId` varchar(32) DEFAULT NULL COMMENT '手续费客户号',
  `FeeAcctId` varchar(32) DEFAULT NULL COMMENT '手续费账户号',
  `InDate` datetime DEFAULT NULL,
  `FeeObj` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`OrdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_closenetwork
-- ----------------------------
DROP TABLE IF EXISTS `t_closenetwork`;
CREATE TABLE `t_closenetwork` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '主键',
  `status` int(11) DEFAULT '1' COMMENT '状态(1 默认 开启  2 关闭)',
  `content` text COMMENT '提示语',
  PRIMARY KEY (`id`),
  KEY `index_cnw_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `collectionDate` datetime DEFAULT NULL COMMENT '催收日期',
  `colResult` text COMMENT '催收结果',
  `repayId` bigint(20) DEFAULT NULL COMMENT '还款id',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `index_collect_id` (`id`) USING BTREE,
  KEY `index_collect_repay` (`repayId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_crediting
-- ----------------------------
DROP TABLE IF EXISTS `t_crediting`;
CREATE TABLE `t_crediting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `creditingName` varchar(100) DEFAULT '信用额度' COMMENT '类型名称',
  `applyAmount` decimal(18,2) DEFAULT NULL COMMENT '申请资金',
  `applyDetail` text COMMENT '申请详情',
  `applyer` bigint(20) DEFAULT NULL COMMENT '申请人',
  `applyTime` datetime DEFAULT NULL COMMENT '申请时间',
  `reviewer` bigint(20) DEFAULT NULL COMMENT '审核人',
  `reviewTime` datetime DEFAULT NULL COMMENT '审核时间',
  `status` int(11) DEFAULT '1' COMMENT '状态(1 默认审核中 2 审核不通过 3 审核通过)',
  `checkMsg` text COMMENT '审批原因',
  `agreeAmount` decimal(18,2) DEFAULT NULL COMMENT '同意额度',
  PRIMARY KEY (`id`),
  KEY `index_credit_id` (`id`) USING BTREE,
  KEY `index_credit_user1` (`applyer`) USING BTREE,
  KEY `index_credit_user2` (`reviewer`) USING BTREE,
  KEY `index_credit_time` (`applyTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_csc_bankcode
-- ----------------------------
DROP TABLE IF EXISTS `t_csc_bankcode`;
CREATE TABLE `t_csc_bankcode` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `bankName` varchar(32) DEFAULT NULL COMMENT '银行名称',
  `bankCode` varchar(12) DEFAULT NULL COMMENT '银行代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_csc_gate_busi
-- ----------------------------
DROP TABLE IF EXISTS `t_csc_gate_busi`;
CREATE TABLE `t_csc_gate_busi` (
  `id` varchar(32) DEFAULT NULL,
  `busiName` varchar(32) DEFAULT NULL,
  `busiCode` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_csc_money_red
-- ----------------------------
DROP TABLE IF EXISTS `t_csc_money_red`;
CREATE TABLE `t_csc_money_red` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `minAmt` decimal(18,2) DEFAULT NULL,
  `maxAmt` decimal(18,2) DEFAULT NULL,
  `money` decimal(18,2) DEFAULT NULL,
  `rbName` varchar(32) DEFAULT NULL,
  `isMonth` int(20) DEFAULT '1' COMMENT '新注册用户首次投资3月以下标（含3月标）为1；3月标以上为2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_csm_ipay_datadiff
-- ----------------------------
DROP TABLE IF EXISTS `t_csm_ipay_datadiff`;
CREATE TABLE `t_csm_ipay_datadiff` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `taskType` int(1) NOT NULL COMMENT '任务类型 1、商户扣款 2、取现 3、充值',
  `date` datetime DEFAULT NULL COMMENT '日期（昨天）',
  `OrdId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `difMoney` decimal(20,2) DEFAULT NULL COMMENT '差异金额',
  `describeText` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述 1、双方都有记录但金额不相同 2、只有普金资本平台有记录 3、只有汇付天下有记录',
  `handlingState` int(1) DEFAULT '1' COMMENT '是否处理差异 1：未处理 2：已处理',
  `handlingProcessDescribe` varchar(255) DEFAULT NULL COMMENT '处理过程的文字描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_csm_ipay_sum
-- ----------------------------
DROP TABLE IF EXISTS `t_csm_ipay_sum`;
CREATE TABLE `t_csm_ipay_sum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `taskType` int(1) NOT NULL COMMENT '任务类型 1、商户扣款 2、取现 3、充值',
  `date` datetime DEFAULT NULL COMMENT '日期（昨天）',
  `chinapnrMoney` decimal(20,2) DEFAULT NULL COMMENT '汇付交易总金额',
  `chinapnrCount` bigint(6) DEFAULT NULL COMMENT '汇付成交数',
  `pjMoney` decimal(20,2) DEFAULT NULL COMMENT '普金交易总金额',
  `pjCount` bigint(6) DEFAULT NULL COMMENT '普金成交数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_csm_ipay_task
-- ----------------------------
DROP TABLE IF EXISTS `t_csm_ipay_task`;
CREATE TABLE `t_csm_ipay_task` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `taskType` int(1) NOT NULL COMMENT '任务类型 1、商户扣款 2、取现 3、充值',
  `state` int(1) NOT NULL COMMENT '任务状态 1、数据采集完成 2、汇总完成 3、差异对比完成',
  `collectTime` datetime DEFAULT NULL COMMENT '数据采集完成时间',
  `countTime` datetime DEFAULT NULL COMMENT '汇总完成时间',
  `difTime` datetime DEFAULT NULL COMMENT '差异对比完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_csm_news
-- ----------------------------
DROP TABLE IF EXISTS `t_csm_news`;
CREATE TABLE `t_csm_news` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `标题` text,
  `发布人` text,
  `信息来源` text,
  `发布日期` datetime DEFAULT NULL,
  `阅读次数` text,
  `内容` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_divide_account
-- ----------------------------
DROP TABLE IF EXISTS `t_divide_account`;
CREATE TABLE `t_divide_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordId` varchar(30) DEFAULT NULL COMMENT '订单号，根据此订单号与t_release_also_reconciliation表进行关联，此表为多方',
  `divCustId` varchar(16) DEFAULT NULL COMMENT '分账客户号',
  `divAcctId` varchar(9) DEFAULT NULL COMMENT '分账账户号',
  `divAmt` decimal(14,0) DEFAULT NULL COMMENT '分账金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empNo` varchar(30) DEFAULT NULL COMMENT '员工编号',
  `empName` varchar(45) DEFAULT NULL COMMENT '员工姓名',
  `empSex` varchar(6) DEFAULT '' COMMENT '员工性别',
  `empBirthday` date DEFAULT NULL COMMENT '出生日期',
  `empIdentityCard` varchar(20) DEFAULT NULL COMMENT '员工身份证号',
  `empTelephone` varchar(20) DEFAULT NULL COMMENT '员工手机号',
  `empEmail` varchar(100) DEFAULT NULL COMMENT '员工邮箱',
  `empDepartment` varchar(64) DEFAULT NULL COMMENT '员工所属部门',
  `empJobs` varchar(200) DEFAULT '' COMMENT '员工职位',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise`;
CREATE TABLE `t_enterprise` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) DEFAULT NULL,
  `legalPerson` varchar(50) DEFAULT NULL,
  `registeredTime` datetime DEFAULT NULL,
  `registeredCapital` decimal(10,0) DEFAULT NULL,
  `businessCode` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(200) DEFAULT NULL,
  `companyPhone` varchar(50) DEFAULT NULL,
  `borrowCause` text,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `auditStatus` int(11) DEFAULT '3' COMMENT '认证状态(1 默认审核中或等待审核 2 审核不通过 3 审核通过)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_exgoin
-- ----------------------------
DROP TABLE IF EXISTS `t_exgoin`;
CREATE TABLE `t_exgoin` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `invmAmount` decimal(18,2) DEFAULT '0.00' COMMENT '投资金额',
  `term` int(11) DEFAULT '0' COMMENT '期数',
  `interest` decimal(18,2) DEFAULT '0.00' COMMENT '利息',
  `buildTimev` datetime DEFAULT NULL COMMENT '建立时间',
  `invmTime` datetime DEFAULT NULL COMMENT '投资时间',
  `wToRepay` int(11) DEFAULT '1' COMMENT '是否还款（1 默认未偿还 2 已偿还）',
  `rpmTime` datetime DEFAULT NULL COMMENT '还款时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_exgo_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_exgo_borrow`;
CREATE TABLE `t_exgo_borrow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrowTitle` varchar(200) DEFAULT NULL COMMENT '借款标题',
  `imgPath` varchar(200) DEFAULT NULL COMMENT '借款图片',
  `borrowWay` int(11) DEFAULT NULL COMMENT '借款方式(1 净值借款 2 秒还借款 3 普通借款 4 实地考察借款 5 机构担保借款 6 流转标)\r\n            ',
  `borrowInfo` text COMMENT '借款信息',
  `deadline` int(11) DEFAULT NULL COMMENT '借款期限',
  `paymentMode` int(11) DEFAULT NULL COMMENT '还款方式(1 按月等额本息还款 2 按先息后本还款)\r\n            \r\n            ',
  `borrowAmount` decimal(18,2) DEFAULT NULL COMMENT '借款总额',
  `annualRate` decimal(18,2) DEFAULT NULL COMMENT '年利率',
  `minTenderedSum` decimal(18,2) DEFAULT NULL COMMENT '最低投标金额',
  `maxTenderedSum` decimal(18,2) DEFAULT NULL COMMENT '最多投标金额',
  `raiseTerm` int(11) DEFAULT NULL COMMENT '筹标期限',
  `detail` text COMMENT '借款详情',
  `tradeType` int(11) DEFAULT '1' COMMENT '交易类型 (1 线上交易 2 线下交易)',
  `publisher` bigint(20) DEFAULT NULL COMMENT '发布人',
  `excitationType` int(11) DEFAULT NULL COMMENT '奖励类型(1 不设置奖励 2 按固定比例金额分摊 3 按投标金额比例)',
  `visitors` int(11) DEFAULT '0' COMMENT '浏览量,默认0',
  `remainTimeStart` datetime DEFAULT NULL COMMENT '剩余时间开始',
  `auditOpinion` text COMMENT '审核意见',
  `borrowStatus` int(11) DEFAULT '1' COMMENT '借款状态(1 默认等待资料 2 正在招标中 3 已满标 4还款中 5 已还完 6 流标7未开放)\r\n            ',
  `excitationSum` decimal(18,2) DEFAULT NULL COMMENT '奖励金额',
  `excitationMode` int(11) DEFAULT NULL COMMENT '奖励方式（1 成功奖励 ）',
  `hasInvestAmount` decimal(18,2) DEFAULT '0.00' COMMENT '已投总额，默认0',
  `investNum` int(11) DEFAULT '0' COMMENT '总投标数,默认是0',
  `purpose` int(11) DEFAULT NULL COMMENT '借款目的',
  `hasPWD` int(11) DEFAULT '-1' COMMENT '是否设置投标密码(-1 默认不设置 1 设置)',
  `investPWD` varchar(50) DEFAULT NULL COMMENT '投标密码',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `publishIP` varchar(100) DEFAULT NULL COMMENT '发布IP',
  `remainTimeEnd` datetime DEFAULT NULL COMMENT '剩余时间结束',
  `auditTime` date DEFAULT NULL COMMENT '满标复审审核通过日期',
  `hasDeadline` int(11) DEFAULT '0' COMMENT '已还期数',
  `isAutoBid` int(11) DEFAULT '1' COMMENT '自动投标( 默认 1 手动 2 自动)',
  `manageFee` decimal(18,2) DEFAULT '0.00' COMMENT '借款管理费',
  `isDayThe` int(11) DEFAULT '1' COMMENT '是否为天标( 默认 1 否，2 是)',
  `autoBidEnableTime` datetime DEFAULT NULL COMMENT '允许自动投标时间',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `frozen_margin` decimal(18,2) DEFAULT '0.00' COMMENT '冻结保证金',
  `smallestFlowUnit` decimal(18,2) DEFAULT '1.00' COMMENT '最小认购单位',
  `circulationNumber` int(11) DEFAULT '0' COMMENT '总份数（流转标专用）',
  `hasCirculationNumber` int(11) DEFAULT '0' COMMENT '已认购份数',
  `nid_log` varchar(50) DEFAULT NULL COMMENT '标题种类的唯一标识',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `feestate` text COMMENT '费用说明',
  `feelog` text COMMENT '平台收费历史记录',
  `businessDetail` text COMMENT '商业详情',
  `assets` text COMMENT '资产情况',
  `moneyPurposes` text COMMENT '资金用途',
  `circulationMode` int(11) DEFAULT '1' COMMENT '流转标发布模式(1 前台用户 2 后台特权用户)',
  `circulationStatus` int(11) DEFAULT '1' COMMENT '流转标审核状态(1 待审核 2 审核成功 3 审核失败)',
  `undertaker` bigint(20) DEFAULT NULL COMMENT '代发人',
  `borrowShow` int(11) DEFAULT '1' COMMENT '借款显示类型(1 一般借款 2 流转标借款)',
  `hasRepoNumber` int(11) DEFAULT '0' COMMENT '已回购份数',
  `agent` varchar(200) DEFAULT NULL COMMENT '担保机构',
  `counterAgent` varchar(200) DEFAULT NULL COMMENT '二级担保公司',
  `amount_scale` decimal(18,4) DEFAULT NULL COMMENT '借款进度比例',
  `borrowType` int(11) DEFAULT '1' COMMENT '借款类型（1：个人借款 2：企业借款）',
  `publisherWay` int(11) DEFAULT '1' COMMENT '发布方式 （1：前台发布，2：后台发布），默认1',
  `authCount` int(11) DEFAULT '0' COMMENT '企业发标时，该用户通过的认证的数量',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  `trxId` varchar(20) DEFAULT NULL COMMENT '汇付冻结保证金流水号',
  `loansOk` int(5) DEFAULT NULL COMMENT '汇付放款成功个数',
  `unfreeOk` int(5) DEFAULT NULL COMMENT '汇付成功解冻个数',
  `borrowTypeSubId` int(11) DEFAULT NULL,
  `projectScore` varchar(20) DEFAULT NULL COMMENT '项目评级',
  `borrowSum` decimal(18,2) DEFAULT NULL COMMENT '发布体验金总和',
  `invmAmount` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_borrow_id` (`id`) USING BTREE,
  KEY `index_borrow_user` (`publisher`) USING BTREE,
  KEY `index_borrow_time` (`publishTime`) USING BTREE,
  KEY `index_borrow_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_exgo_invest
-- ----------------------------
DROP TABLE IF EXISTS `t_exgo_invest`;
CREATE TABLE `t_exgo_invest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `investAmount` decimal(18,4) DEFAULT '0.0000' COMMENT '投资金额',
  `monthRate` decimal(18,4) DEFAULT '0.0000' COMMENT '月利率',
  `investor` bigint(20) DEFAULT NULL COMMENT '投资人',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款ID',
  `investTime` datetime DEFAULT NULL COMMENT '投资时间',
  `oriInvestor` bigint(20) DEFAULT NULL COMMENT '原始投资人',
  `realAmount` decimal(18,4) DEFAULT '0.0000' COMMENT '实际投资金额（用于债权转让是的投资金额）',
  `hasPI` decimal(18,4) DEFAULT '0.0000' COMMENT '已收本息',
  `deadline` int(11) DEFAULT '0' COMMENT '期数',
  `hasDeadline` int(11) DEFAULT '0' COMMENT '已还款期数',
  `recivedPrincipal` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '应收本金',
  `recievedInterest` decimal(18,2) DEFAULT '0.00' COMMENT '应收利息',
  `hasPrincipal` decimal(18,2) DEFAULT '0.00' COMMENT '已收本金',
  `hasInterest` decimal(18,2) DEFAULT '0.00' COMMENT '已收利息',
  `recivedFI` decimal(18,2) DEFAULT '0.00' COMMENT '应收罚金',
  `hasFI` decimal(18,2) DEFAULT '0.00' COMMENT '已收罚金',
  `manageFee` decimal(18,2) DEFAULT '0.00' COMMENT '管理费',
  `reward` decimal(18,2) DEFAULT '0.00' COMMENT '奖励',
  `repayStatus` int(11) DEFAULT '1' COMMENT '还款状态（1 默认未偿还 2 已偿还）',
  `flag` varchar(200) DEFAULT NULL COMMENT '标识',
  `isAutoBid` int(11) DEFAULT '1' COMMENT '自动投标( 默认 1 手动 2 自动)',
  `isDebt` int(11) DEFAULT '1' COMMENT '是否转让(1,没有转让，2转让)',
  `circulationInterest` double(18,2) DEFAULT '0.00' COMMENT '流转标利息',
  `circulationForpayStatus` int(11) DEFAULT '-1' COMMENT '流转标收款状态(默认 -1 不受理 1 待收 2 已收)',
  `reason` text COMMENT '购买理由',
  `repayDate` date DEFAULT NULL COMMENT '还款日期',
  `check_principal` decimal(18,4) DEFAULT '0.0000' COMMENT '校验本金',
  `check_interest` decimal(18,4) DEFAULT '0.0000' COMMENT '校验利息',
  `min_invest_id` bigint(20) DEFAULT NULL COMMENT '最小投资id',
  `max_invest_id` bigint(20) DEFAULT NULL COMMENT '最大投资id',
  `adjust_principal` decimal(18,4) DEFAULT '0.0000' COMMENT '调整本金',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  `trxId` varchar(20) DEFAULT NULL COMMENT '投标汇付返回唯一流水号',
  PRIMARY KEY (`id`),
  KEY `index_invest_id` (`id`) USING BTREE,
  KEY `index_invest_investor` (`investor`) USING BTREE,
  KEY `index_invest_borrow` (`borrowId`) USING BTREE,
  KEY `index_invest_time` (`investTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_exgo_repayment
-- ----------------------------
DROP TABLE IF EXISTS `t_exgo_repayment`;
CREATE TABLE `t_exgo_repayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `repayDate` date DEFAULT NULL COMMENT '还款日期',
  `realRepayDate` date DEFAULT NULL COMMENT '实际还款日期',
  `repayPeriod` varchar(20) DEFAULT NULL COMMENT '还款期数',
  `hasPI` decimal(18,2) DEFAULT '0.00' COMMENT '已还本息',
  `stillPrincipal` decimal(18,2) DEFAULT '0.00' COMMENT '待还本金',
  `stillInterest` decimal(18,2) DEFAULT '0.00' COMMENT '待还利息',
  `hasFI` decimal(18,2) DEFAULT '0.00' COMMENT '已还罚息',
  `lateFI` decimal(18,2) DEFAULT '0.00' COMMENT '待还罚息',
  `lateDay` int(11) DEFAULT '0' COMMENT '逾期天数',
  `repayStatus` int(11) DEFAULT '1' COMMENT '还款状态（1 默认未偿还 \r\n\r\n2 已偿还）\r\n            ',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `isLate` int(11) DEFAULT '1' COMMENT '是否逾期( 默认 1 否 2 是)',
  `isWebRepay` int(11) DEFAULT '1' COMMENT '是否网站待还(默认1 否 2 \r\n\r\n是)',
  `investorForpayFI` decimal(18,2) DEFAULT '0.00' COMMENT '投资人待\r\n\r\n收罚息',
  `investorHaspayFI` decimal(18,2) DEFAULT '0.00' COMMENT '投资人已\r\n\r\n收罚息',
  `principalBalance` decimal(18,2) DEFAULT '0.00' COMMENT '本金余额',
  `interestBalance` decimal(18,2) DEFAULT '0.00' COMMENT '利息余额',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `executeTime` date DEFAULT NULL COMMENT '逾期执行时间',
  `identify` varchar(255) DEFAULT NULL COMMENT '唯一标识符',
  `orId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_repayment_id` (`id`) USING BTREE,
  KEY `index_repayment_date` (`repayDate`) USING BTREE,
  KEY `index_repayent_borrowid` (`borrowId`) USING BTREE,
  KEY `index_repayment` (`repayStatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_fadada
-- ----------------------------
DROP TABLE IF EXISTS `t_fadada`;
CREATE TABLE `t_fadada` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户',
  `contract_id` varchar(200) DEFAULT NULL COMMENT '合同编号',
  `doc_type` varchar(200) DEFAULT NULL COMMENT 'doc文件类型',
  `file` varchar(200) DEFAULT NULL COMMENT '文件',
  `customer_id` varchar(200) DEFAULT NULL COMMENT '客户编号',
  `transation_id` varchar(200) DEFAULT NULL COMMENT '交易号',
  `contract_id_end` varchar(200) DEFAULT NULL COMMENT '发标时候的合同编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_uid` (`uid`) USING BTREE,
  KEY `index_redbag_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '反馈编号',
  `content` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `user_id` bigint(20) DEFAULT NULL COMMENT '反馈用户编号',
  `publish_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`),
  KEY `index_feedback_id` (`id`) USING BTREE,
  KEY `index_feedback_user` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_flow_repayment
-- ----------------------------
DROP TABLE IF EXISTS `t_flow_repayment`;
CREATE TABLE `t_flow_repayment` (
  `invest_id` bigint(18) NOT NULL COMMENT '投资id(用于判断流转标是否还款)',
  PRIMARY KEY (`invest_id`),
  KEY `index_fr_id` (`invest_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_fundrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_fundrecord`;
CREATE TABLE `t_fundrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户',
  `fundMode` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `handleSum` decimal(18,2) DEFAULT NULL COMMENT '操作金额',
  `usableSum` decimal(18,2) DEFAULT NULL COMMENT '可用金额',
  `freezeSum` decimal(18,2) DEFAULT NULL COMMENT '冻结金额',
  `dueinSum` decimal(18,2) DEFAULT NULL COMMENT '待收金额',
  `trader` bigint(20) DEFAULT NULL COMMENT '交易者',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间',
  `dueoutSum` decimal(18,2) DEFAULT NULL COMMENT '待还金额',
  `remarks` varchar(300) DEFAULT NULL,
  `operateType` int(11) DEFAULT '-1' COMMENT '操作类型  110、所有转账交易类型',
  `oninvest` decimal(18,2) DEFAULT NULL,
  `paynumber` varchar(20) DEFAULT NULL COMMENT '支付流水号（订单号）',
  `paybank` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `cost` decimal(18,2) DEFAULT '0.00' COMMENT '服务费',
  `income` decimal(18,2) DEFAULT '0.00' COMMENT '收入金额',
  `spending` decimal(18,2) DEFAULT '0.00' COMMENT '支出金额',
  `borrow_id` bigint(20) DEFAULT '-1' COMMENT '借款编号',
  `repayment_id` bigint(20) DEFAULT '-1' COMMENT '还款编号',
  `accountSum` decimal(18,2) DEFAULT NULL,
  `pageType` varchar(40) DEFAULT '0' COMMENT '转让渠道',
  PRIMARY KEY (`id`),
  KEY `index_fundrecord_user1` (`userId`) USING BTREE,
  KEY `index_fundrecord_user2` (`trader`) USING BTREE,
  KEY `index_fundrecord_id` (`id`) USING BTREE,
  KEY `index_fundrecord_time` (`recordTime`) USING BTREE,
  KEY `index_fundrecord_repay` (`repayment_id`) USING BTREE,
  KEY `index_fundrecord_borrow` (`borrow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19903 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_fund_messageboard
-- ----------------------------
DROP TABLE IF EXISTS `t_fund_messageboard`;
CREATE TABLE `t_fund_messageboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `replyContent` text COMMENT '回复内容',
  `adminId` bigint(20) DEFAULT NULL COMMENT '客服ID',
  `replyTime` datetime DEFAULT NULL COMMENT '回复时间',
  `fundId` bigint(20) DEFAULT NULL COMMENT '基金信托ID',
  PRIMARY KEY (`id`),
  KEY `index_fmb_id` (`id`) USING BTREE,
  KEY `index_fmb_user` (`userId`) USING BTREE,
  KEY `index_fmb_admin` (`adminId`) USING BTREE,
  KEY `index_fmb_fund` (`fundId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_gestures_password
-- ----------------------------
DROP TABLE IF EXISTS `t_gestures_password`;
CREATE TABLE `t_gestures_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint(20) NOT NULL COMMENT '用户ID',
  `insertTime` datetime DEFAULT NULL COMMENT '第一次设置时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最近的更改时间',
  `password` varchar(60) DEFAULT NULL COMMENT '手势密码值',
  `status` int(2) DEFAULT '1' COMMENT '使用状态，1：开启，2：关闭，3：失效',
  `verifyErrorCount` int(10) DEFAULT '0' COMMENT '记录手势密码错误次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `groupName` varchar(100) DEFAULT NULL COMMENT '组名称',
  `groupRemark` text COMMENT '组备注',
  `cashStatus` int(11) DEFAULT '1' COMMENT '提现状态(默认1 启动 2 禁止)',
  `adminId` bigint(20) DEFAULT NULL COMMENT '管理员Id',
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`id`) USING BTREE,
  KEY `index_group_admin` (`adminId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_group_user
-- ----------------------------
DROP TABLE IF EXISTS `t_group_user`;
CREATE TABLE `t_group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupId` bigint(20) DEFAULT NULL COMMENT '用户组ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `index_groupu_id` (`id`) USING BTREE,
  KEY `index_groupu_user` (`userId`) USING BTREE,
  KEY `index_groupu_group` (`groupId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_help_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_help_answer`;
CREATE TABLE `t_help_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `helpQuestionId` bigint(20) NOT NULL COMMENT '所属帮助问题id',
  `helpAnswer` text COMMENT '答案描述',
  PRIMARY KEY (`id`),
  KEY `index_hanswer_id` (`id`) USING BTREE,
  KEY `index_hanswer_question` (`helpQuestionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_help_question
-- ----------------------------
DROP TABLE IF EXISTS `t_help_question`;
CREATE TABLE `t_help_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `questionDescribe` varchar(200) DEFAULT NULL COMMENT '问题描述',
  `helpTypeId` bigint(20) NOT NULL COMMENT '所属帮助中心类型id',
  `publisher` bigint(20) DEFAULT NULL COMMENT '发布人',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `browseCount` bigint(20) DEFAULT '0' COMMENT '浏览量，默认0',
  `sortid` bigint(20) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `index_hquestion_id` (`id`) USING BTREE,
  KEY `index_hquestion_type` (`helpTypeId`) USING BTREE,
  KEY `index_hquestion_publish` (`publisher`) USING BTREE,
  KEY `index_hquestion_sort` (`sortid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_help_type
-- ----------------------------
DROP TABLE IF EXISTS `t_help_type`;
CREATE TABLE `t_help_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `helpDescribe` varchar(20) DEFAULT NULL COMMENT '帮助类型中文描述',
  `sortId` int(11) DEFAULT NULL COMMENT '排序编号',
  PRIMARY KEY (`id`),
  KEY `index_helptype_id` (`id`) USING BTREE,
  KEY `index_helptype_sort` (`sortId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_intention_fund
-- ----------------------------
DROP TABLE IF EXISTS `t_intention_fund`;
CREATE TABLE `t_intention_fund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `fundId` bigint(20) DEFAULT NULL,
  `intentionMoney` decimal(18,2) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态（0，认购中，1，成功认购中，2，放弃认购）',
  `adminId` bigint(20) DEFAULT NULL COMMENT '处理人',
  `dealTime` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `index_if_id` (`id`) USING BTREE,
  KEY `index_if_user` (`userId`) USING BTREE,
  KEY `index_if_fund` (`fundId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_invest
-- ----------------------------
DROP TABLE IF EXISTS `t_invest`;
CREATE TABLE `t_invest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `investAmount` decimal(18,4) DEFAULT '0.0000' COMMENT '投资金额',
  `moneyRecord` decimal(18,4) DEFAULT '0.0000' COMMENT '代金券金额，投资用的代金券金额',
  `voucherId` bigint(20) DEFAULT NULL COMMENT '代金卷id',
  `monthRate` decimal(18,4) DEFAULT '0.0000' COMMENT '月利率',
  `investor` bigint(20) DEFAULT NULL COMMENT '投资人',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款ID',
  `investTime` datetime DEFAULT NULL COMMENT '投资时间',
  `oriInvestor` bigint(20) DEFAULT NULL COMMENT '原始投资人',
  `realAmount` decimal(18,4) DEFAULT '0.0000' COMMENT '实际投资金额（用于债权转让是的投资金额）',
  `hasPI` decimal(18,4) DEFAULT '0.0000' COMMENT '已收本息',
  `deadline` int(11) DEFAULT '0' COMMENT '期数',
  `hasDeadline` int(11) DEFAULT '0' COMMENT '已还款期数',
  `recivedPrincipal` decimal(18,4) unsigned DEFAULT '0.0000' COMMENT '应收本金',
  `recievedInterest` decimal(18,4) DEFAULT '0.0000' COMMENT '应收利息',
  `hasPrincipal` decimal(18,4) DEFAULT '0.0000' COMMENT '已收本金',
  `hasInterest` decimal(18,4) DEFAULT '0.0000' COMMENT '已收利息',
  `recivedFI` decimal(18,4) DEFAULT '0.0000' COMMENT '应收罚金',
  `hasFI` decimal(18,4) DEFAULT '0.0000' COMMENT '已收罚金',
  `manageFee` decimal(18,4) DEFAULT '0.0000' COMMENT '管理费',
  `reward` decimal(18,4) DEFAULT '0.0000' COMMENT '奖励',
  `repayStatus` int(11) DEFAULT '1' COMMENT '还款状态（1 默认未偿还 2 已偿还）',
  `flag` varchar(200) DEFAULT NULL COMMENT '标识',
  `isAutoBid` int(11) DEFAULT '1' COMMENT '自动投标( 默认 1 手动 2 自动)',
  `isDebt` int(11) DEFAULT '1' COMMENT '是否转让(1,没有转让，2转让)',
  `circulationInterest` double(18,2) DEFAULT '0.00' COMMENT '流转标利息',
  `circulationForpayStatus` int(11) DEFAULT '-1' COMMENT '流转标收款状态(默认 -1 不受理 1 待收 2 已收)',
  `reason` text COMMENT '购买理由',
  `repayDate` date DEFAULT NULL COMMENT '还款日期',
  `check_principal` decimal(18,4) DEFAULT '0.0000' COMMENT '校验本金',
  `check_interest` decimal(18,4) DEFAULT '0.0000' COMMENT '校验利息',
  `min_invest_id` bigint(20) DEFAULT NULL COMMENT '最小投资id',
  `max_invest_id` bigint(20) DEFAULT NULL COMMENT '最大投资id',
  `adjust_principal` decimal(18,4) DEFAULT '0.0000' COMMENT '调整本金',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  `trxId` varchar(20) DEFAULT NULL COMMENT '投标汇付返回唯一流水号',
  `download_url` varchar(255) DEFAULT NULL COMMENT '签署后文件下载地址',
  `viewpdf_url` varchar(255) DEFAULT NULL COMMENT '在线查看已签署地址',
  `investId` varchar(200) DEFAULT NULL COMMENT '投标汇付流水',
  `contract_id` varchar(200) DEFAULT NULL COMMENT '合同编号',
  `pageType` varchar(20) DEFAULT NULL,
  `firstInvest` int(10) DEFAULT '1' COMMENT '是否为首投 1：否，2：是',
  `lastInvest` int(10) DEFAULT '1' COMMENT '是否为尾投 1：否，2：是',
  `maxInvest` int(10) DEFAULT '1' COMMENT '是否为标王 1：否，2：是',
  `pushdate` datetime DEFAULT NULL COMMENT '推送给融途网的时间',
  `pushstate` varchar(10) DEFAULT '1' COMMENT '推送融途网的状态 1：未推送 2：成功 3：失败',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_trxId_uniq` (`trxId`),
  KEY `index_invest_id` (`id`) USING BTREE,
  KEY `index_invest_investor` (`investor`) USING BTREE,
  KEY `index_invest_borrow` (`borrowId`) USING BTREE,
  KEY `index_invest_time` (`investTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3313 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_invest_history
-- ----------------------------
DROP TABLE IF EXISTS `t_invest_history`;
CREATE TABLE `t_invest_history` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `investAmount` decimal(18,2) DEFAULT '0.00' COMMENT '投资金额',
  `monthRate` decimal(18,2) DEFAULT '0.00' COMMENT '月利率',
  `investor` bigint(20) DEFAULT NULL COMMENT '投资人',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款ID',
  `investTime` datetime DEFAULT NULL COMMENT '投资时间',
  `oriInvestor` bigint(20) DEFAULT NULL COMMENT '原始投资人',
  `realAmount` decimal(18,2) DEFAULT '0.00' COMMENT '实际投资金额',
  `hasPI` decimal(18,2) DEFAULT '0.00' COMMENT '已收本息',
  `deadline` int(11) DEFAULT '0' COMMENT '期数',
  `hasDeadline` int(11) DEFAULT '0' COMMENT '已还款期数',
  `recivedPrincipal` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '应收本金',
  `recievedInterest` decimal(18,2) DEFAULT '0.00' COMMENT '应收利息',
  `hasPrincipal` decimal(18,2) DEFAULT '0.00' COMMENT '已收本金',
  `hasInterest` decimal(18,2) DEFAULT '0.00' COMMENT '已收利息',
  `recivedFI` decimal(18,2) DEFAULT '0.00' COMMENT '应收罚金',
  `hasFI` decimal(18,2) DEFAULT '0.00' COMMENT '已收罚金',
  `manageFee` decimal(18,2) DEFAULT '0.00' COMMENT '管理费',
  `reward` decimal(18,2) DEFAULT '0.00' COMMENT '奖励',
  `repayStatus` int(11) DEFAULT '1' COMMENT '还款状态（1 默认未偿还 2 已偿还）',
  `flag` varchar(200) DEFAULT NULL COMMENT '标识',
  `isAutoBid` int(11) DEFAULT '1' COMMENT '自动投标( 默认 1 手动 2 自动)',
  `isDebt` int(11) DEFAULT '1' COMMENT '是否转让(1,没有转让，2转让)',
  `check_principal` decimal(18,2) DEFAULT '0.00' COMMENT '校验本金',
  `check_interest` decimal(18,2) DEFAULT '0.00' COMMENT '校验利息',
  `min_invest_id` bigint(20) DEFAULT NULL COMMENT '最小投资id',
  `max_invest_id` bigint(20) DEFAULT NULL COMMENT '最大投资id',
  `adjust_principal` decimal(18,2) DEFAULT '0.00' COMMENT '调整本金',
  `download_url` varchar(255) DEFAULT NULL COMMENT '签署后文件下载地址',
  `viewpdf_url` varchar(255) DEFAULT NULL COMMENT '在线查看已签署地址',
  `firstInvest` int(10) DEFAULT '1' COMMENT '是否为首投 1：否，2：是',
  `lastInvest` int(10) DEFAULT '1' COMMENT '是否为尾投 1：否，2：是',
  `maxInvest` int(10) DEFAULT '1' COMMENT '是否为标王 1：否，2：是',
  `pushdate` datetime DEFAULT NULL COMMENT '推送给融途网的时间',
  `pushstate` varchar(10) DEFAULT '1' COMMENT '推送融途网的状态 1：未推送 2：成功 3：失败',
  `moneyRecord` decimal(18,4) DEFAULT '0.0000' COMMENT '代金券金额，投资用的代金券金额',
  `voucherId` bigint(20) DEFAULT NULL COMMENT '代金卷id',
  `circulationInterest` double(18,2) DEFAULT '0.00' COMMENT '流转标利息',
  `circulationForpayStatus` int(11) DEFAULT '-1' COMMENT '流转标收款状态(默认 -1 不受理 1 待收 2 已收)',
  `reason` text COMMENT '购买理由',
  `repayDate` date DEFAULT NULL COMMENT '还款日期',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  `trxId` varchar(20) DEFAULT NULL COMMENT '投标汇付返回唯一流水号',
  `investId` varchar(200) DEFAULT NULL COMMENT '投标汇付流水',
  `contract_id` varchar(200) DEFAULT NULL COMMENT '合同编号',
  `pageType` varchar(20) DEFAULT NULL,
  KEY `index_ihistory_id` (`id`) USING BTREE,
  KEY `index_ihistory_investor` (`investor`) USING BTREE,
  KEY `index_ihistory_borrow` (`borrowId`) USING BTREE,
  KEY `index_ihistory_time` (`investTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_invest_repayment
-- ----------------------------
DROP TABLE IF EXISTS `t_invest_repayment`;
CREATE TABLE `t_invest_repayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `repayId` bigint(20) DEFAULT NULL COMMENT '还款id',
  `repayPeriod` varchar(255) DEFAULT NULL COMMENT '还款期数',
  `repayDate` date DEFAULT NULL COMMENT '还款时间',
  `realRepayDate` date DEFAULT NULL COMMENT '实际还款时间',
  `recivedPrincipal` decimal(18,4) DEFAULT '0.0000' COMMENT '应收本金',
  `recivedInterest` decimal(18,4) DEFAULT '0.0000' COMMENT '应收利息',
  `hasPrincipal` decimal(18,4) DEFAULT '0.0000' COMMENT '已收本金',
  `hasInterest` decimal(18,4) DEFAULT '0.0000' COMMENT '已收利息',
  `interestOwner` int(11) DEFAULT '1' COMMENT '利息归属者( 1 默认 VIP会员 2 网站)',
  `recivedFI` decimal(18,4) DEFAULT '0.0000' COMMENT '应收罚息',
  `isLate` int(11) DEFAULT '1' COMMENT '是否逾期( 默认 1 未逾期 2 逾期)',
  `lateDay` int(11) DEFAULT '0' COMMENT '逾期天数',
  `isWebRepay` int(11) DEFAULT '1' COMMENT '是否网站垫付(1 非网站垫付 2 网站垫付)',
  `principalBalance` decimal(18,4) DEFAULT '0.0000' COMMENT '剩余本金',
  `interestBalance` decimal(18,4) DEFAULT '0.0000' COMMENT '剩余利息',
  `invest_id` bigint(20) DEFAULT NULL COMMENT '投资id',
  `owner` bigint(20) DEFAULT NULL COMMENT '还款拥有者',
  `ownerlist` varchar(255) DEFAULT NULL COMMENT '还款记录拥有者列表',
  `repayStatus` int(11) DEFAULT '1' COMMENT '还款状态( 默认 1 未偿还 2 已偿还)',
  `iManageFee` decimal(18,4) DEFAULT '0.0000' COMMENT '投资管理费',
  `iManageFeeRate` decimal(18,4) DEFAULT '0.0000' COMMENT '投资管理费比率',
  `isDebt` int(11) DEFAULT '1' COMMENT '是否债权转让(默认1 否 2 是)',
  `borrow_id` bigint(20) DEFAULT NULL COMMENT '借款id',
  `circulationForpayStatus` int(11) DEFAULT '-1' COMMENT '流转标收款状态(默认 -1 不受理 1 待收 2 已收)',
  `hasFI` decimal(18,2) DEFAULT '0.00' COMMENT '已收罚息',
  PRIMARY KEY (`id`),
  KEY `index_irepay_id` (`id`) USING BTREE,
  KEY `index_irepay_repay` (`repayId`) USING BTREE,
  KEY `index_irepay_date` (`repayDate`) USING BTREE,
  KEY `index_irepay_invest` (`invest_id`) USING BTREE,
  KEY `index_irepay_owner` (`owner`) USING BTREE,
  KEY `index_irepay_borrow` (`borrow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10298 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_invest_repaymessage
-- ----------------------------
DROP TABLE IF EXISTS `t_invest_repaymessage`;
CREATE TABLE `t_invest_repaymessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `investRepayId` bigint(20) DEFAULT NULL COMMENT '还款信息表id',
  `messageContent` varchar(300) DEFAULT NULL,
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款信息Id',
  `dataType` int(10) DEFAULT NULL COMMENT '发送时间类型7天、3天、1天',
  `sendTime` datetime DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL COMMENT '借款人Id，或 贷后维护经理Id',
  `userType` int(10) DEFAULT NULL COMMENT '标识用户类型，1是借款人，2表示贷后维护经理',
  `mesageSendStatus` int(2) DEFAULT NULL COMMENT '1表示成功，2表示失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_keywords
-- ----------------------------
DROP TABLE IF EXISTS `t_keywords`;
CREATE TABLE `t_keywords` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT '' COMMENT '关键字',
  `isuse` tinyint(255) DEFAULT '1' COMMENT '是否启用，0：不启用，1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_links
-- ----------------------------
DROP TABLE IF EXISTS `t_links`;
CREATE TABLE `t_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `serialCount` bigint(20) DEFAULT NULL COMMENT '序号',
  `companyName` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `companyImg` varchar(200) DEFAULT NULL COMMENT '图片',
  `companyURL` varchar(200) DEFAULT NULL COMMENT '网站地址',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `type` bigint(20) DEFAULT '1' COMMENT '类型（1:合作伙伴 2：友情链接 3:投资广告 4: 首页图片 默认1）',
  `ordershort` bigint(20) DEFAULT '1' COMMENT '排序（可以根据字段来控制广告图片的前后排序 默认值为1）',
  PRIMARY KEY (`id`),
  KEY `index_links_id` (`id`) USING BTREE,
  KEY `index_links_sort` (`ordershort`) USING BTREE,
  KEY `index_links_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_loanmanage_file
-- ----------------------------
DROP TABLE IF EXISTS `t_loanmanage_file`;
CREATE TABLE `t_loanmanage_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filePath` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `loanmanagerId` bigint(20) DEFAULT NULL COMMENT '贷后管理ID',
  `uploadTime` datetime DEFAULT NULL COMMENT '上传时间',
  `fileName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '类型: 1表示文件、2表示图片，3表示票据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_loanmanage_img
-- ----------------------------
DROP TABLE IF EXISTS `t_loanmanage_img`;
CREATE TABLE `t_loanmanage_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagePath` varchar(255) DEFAULT NULL COMMENT '图片路劲',
  `loanmanagerId` bigint(20) DEFAULT NULL COMMENT '贷后管理ID',
  `uploadTime` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_loan_inspect
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_inspect`;
CREATE TABLE `t_loan_inspect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inspectTime` datetime DEFAULT NULL COMMENT '检查时间',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `loanManager` varchar(255) DEFAULT NULL COMMENT '借后管理人员',
  `loanFullName` varchar(255) DEFAULT NULL COMMENT '借款人全称',
  `saleIncome` varchar(255) DEFAULT NULL COMMENT '销售收入',
  `flowRate` varchar(255) DEFAULT NULL COMMENT '流动比率',
  `totalAsset` varchar(255) DEFAULT NULL COMMENT '总资产',
  `quickRate` varchar(255) DEFAULT NULL COMMENT '速动比率',
  `profit` varchar(255) DEFAULT NULL COMMENT '利润',
  `assetLiabilitiesRate` varchar(255) DEFAULT NULL COMMENT '资产负债率',
  `saleRate` varchar(255) DEFAULT NULL COMMENT '销售利润率',
  `accountTurnoverRate` varchar(255) DEFAULT NULL COMMENT '应收账款周转率',
  `fixedAssetChange` varchar(255) DEFAULT NULL COMMENT '借款期固定资产变动情况',
  `inventoryTurnoverRate` varchar(255) DEFAULT NULL COMMENT '存货周转率',
  `externalInvesChange` varchar(255) DEFAULT NULL COMMENT '借款期对外投资变动情况',
  `currentLiabilitiesChange` varchar(255) DEFAULT NULL COMMENT '借款期流动负债变动情况',
  `manageAnaly` text COMMENT '经营情况分析',
  `prodManageAnaly` varchar(255) DEFAULT NULL COMMENT '保证人生产经营情况情况分析',
  `pledgeKeepOpinion` varchar(255) DEFAULT NULL COMMENT '抵、质押物保管情况检查意见',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间',
  `status` int(2) DEFAULT NULL COMMENT '风控部审核状态 ：0表示审核通过，1表示风控部待审核，2表示总经理待审核，3表示风控部审核失败，4表示总经理审核失败',
  `inspectAdvise` text COMMENT '存在的主要问题及处理建议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_loan_inspect_advise
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_inspect_advise`;
CREATE TABLE `t_loan_inspect_advise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loanInspectId` bigint(20) DEFAULT NULL COMMENT '贷后检查id，即t_loan_inspect表的id',
  `advise` text COMMENT '总意见',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间',
  `type` int(11) DEFAULT NULL COMMENT '审核类型 ：1表示风控部，2表示总经理',
  `adminId` bigint(20) DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mailTitle` varchar(200) DEFAULT NULL COMMENT '站内信标题',
  `mailContent` text COMMENT '站内信内容',
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `sender` bigint(20) DEFAULT NULL COMMENT '发件人ID',
  `reciver` bigint(20) DEFAULT NULL COMMENT '收件人',
  `mailType` int(11) DEFAULT NULL COMMENT '站内信类型(1 一般信息 2 系统信息)\r\n            ',
  `mailStatus` int(11) DEFAULT '1' COMMENT '站内信状态(1 默认未读 2 删除 3 已读)\r\n            ',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款ID',
  `mailMode` int(11) DEFAULT '2' COMMENT '站内信模式(1 前台 默认2 后台)',
  `backgroundStatus` int(11) DEFAULT '1' COMMENT '后台状态（1.默认 显示，2.删除，）',
  PRIMARY KEY (`id`),
  KEY `index_mail_user1` (`sender`) USING BTREE,
  KEY `index_mail_user2` (`reciver`) USING BTREE,
  KEY `index_mail_id` (`id`) USING BTREE,
  KEY `index_mail_time` (`sendTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11005 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_mailset
-- ----------------------------
DROP TABLE IF EXISTS `t_mailset`;
CREATE TABLE `t_mailset` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `mailaddress` varchar(50) DEFAULT NULL COMMENT '邮箱地址',
  `mailpassword` varchar(50) DEFAULT NULL COMMENT '邮箱密码',
  `sendmail` varchar(50) DEFAULT NULL COMMENT '发件人emal',
  `sendname` varchar(50) DEFAULT NULL COMMENT '发送人昵称',
  `port` varchar(50) DEFAULT NULL COMMENT '端口号',
  `host` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发送邮件服务端',
  PRIMARY KEY (`id`),
  KEY `index_mailset_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_materialimagedetal
-- ----------------------------
DROP TABLE IF EXISTS `t_materialimagedetal`;
CREATE TABLE `t_materialimagedetal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imagePath` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `materialsauthid` bigint(20) DEFAULT NULL COMMENT '图片审核主表id',
  `option` text COMMENT '单个证件的审核意见',
  `checktime` datetime DEFAULT NULL COMMENT '单个证件审核时间',
  `uploadingTime` datetime DEFAULT NULL COMMENT '上传时间',
  `auditStatus` int(11) DEFAULT '1' COMMENT '审核状态（1为等待审核，2为审核失败，3为审核成功）默认1',
  `visiable` int(11) DEFAULT '1' COMMENT '图片是否被用户选择是否可见(1为被选,2为不勾选)默认被选可见',
  PRIMARY KEY (`id`),
  KEY `index_mld_id` (`id`) USING BTREE,
  KEY `index_mld_msid` (`materialsauthid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_materialsauth
-- ----------------------------
DROP TABLE IF EXISTS `t_materialsauth`;
CREATE TABLE `t_materialsauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `materAuthTypeId` bigint(20) DEFAULT NULL COMMENT '认证类别id(关联认证类别表)\r\n            ',
  `imgPath` varchar(200) DEFAULT NULL COMMENT '认证图片地址',
  `auditStatus` int(11) DEFAULT NULL COMMENT '认证状态(默认NULL，表示未上传，1 默认审核中或等待审核 2 审核不通过 3 审核通过)',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `authTime` datetime DEFAULT NULL COMMENT '认证通过时间',
  `passTime` datetime DEFAULT NULL COMMENT '上传资料时间',
  `option` text COMMENT '证件的审核观点',
  `pastTime` datetime DEFAULT NULL COMMENT '过期时间(当确认状态为审核失败（2）的时候这个时间有值)',
  `materaldetalId` bigint(20) DEFAULT NULL COMMENT '可见图片的id',
  `criditing` int(11) DEFAULT '0' COMMENT '单个证件的信用积分 默认积分为0',
  `groupid` int(11) DEFAULT '1' COMMENT '企业分组，属于哪个企业的资料信息',
  `companyname` varchar(50) DEFAULT NULL COMMENT '企业分组，哪个企业的名称',
  PRIMARY KEY (`id`),
  KEY `index_ma_matype` (`materAuthTypeId`) USING BTREE,
  KEY `index_ma_user` (`userId`) USING BTREE,
  KEY `index_ma_id` (`id`) USING BTREE,
  KEY `index_ma_auditStatus` (`auditStatus`) USING BTREE,
  KEY `index_ma_materaldetal` (`materaldetalId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12308 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_materialsauthtype
-- ----------------------------
DROP TABLE IF EXISTS `t_materialsauthtype`;
CREATE TABLE `t_materialsauthtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '认证名称',
  `isMust` int(11) DEFAULT '1' COMMENT '是否必须(1 默认非必须 2 必须)\r\n            ',
  PRIMARY KEY (`id`),
  KEY `index_mat_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_mediareport
-- ----------------------------
DROP TABLE IF EXISTS `t_mediareport`;
CREATE TABLE `t_mediareport` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '媒体报道表-主键',
  `sort` int(11) unsigned DEFAULT NULL COMMENT '序号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `imgPath` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `content` text COMMENT '新闻简述',
  `publishTime` datetime DEFAULT NULL COMMENT '新闻发布时间',
  `state` int(11) DEFAULT '1' COMMENT '新闻状态',
  `stick` int(11) DEFAULT '1' COMMENT '是否置顶  ( 1.默认   2.置顶 )',
  `newsType` int(2) DEFAULT NULL COMMENT '新闻类型 1 公司动态  2，媒体报道',
  PRIMARY KEY (`id`),
  KEY `index_mreport_id` (`id`) USING BTREE,
  KEY `index_mreport_ss` (`sort`,`stick`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `columName` varchar(30) DEFAULT NULL COMMENT '栏目名称',
  `content` text COMMENT '内容',
  `sort` int(20) DEFAULT NULL COMMENT '序号',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `typeId` int(11) DEFAULT NULL COMMENT '所属信息类型ID',
  PRIMARY KEY (`id`),
  KEY `index_message_id` (`id`) USING BTREE,
  KEY `index_message_sort` (`sort`) USING BTREE,
  KEY `index_mesage_type` (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_messageset
-- ----------------------------
DROP TABLE IF EXISTS `t_messageset`;
CREATE TABLE `t_messageset` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `enable` int(11) DEFAULT '1' COMMENT '是否开启（1：为开启，0为不开启，默认开启）',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `url` varchar(200) DEFAULT NULL COMMENT '短信地址接口',
  PRIMARY KEY (`id`),
  KEY `index_mset_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_message_type
-- ----------------------------
DROP TABLE IF EXISTS `t_message_type`;
CREATE TABLE `t_message_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `typeId` int(11) NOT NULL COMMENT '信息类型',
  `typeDesc` varchar(50) NOT NULL COMMENT '信息描述',
  PRIMARY KEY (`id`),
  KEY `index_message_id` (`id`) USING BTREE,
  KEY `index_message_type` (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_model_referral
-- ----------------------------
DROP TABLE IF EXISTS `t_model_referral`;
CREATE TABLE `t_model_referral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `columName` varchar(30) DEFAULT NULL COMMENT '栏目名称',
  `content` text COMMENT '内容',
  `sort` int(20) DEFAULT NULL COMMENT '序号',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `typeId` int(11) DEFAULT NULL COMMENT '所属信息类型ID',
  PRIMARY KEY (`id`),
  KEY `index_mreferral_id` (`id`) USING BTREE,
  KEY `index_mreferral_type` (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_money
-- ----------------------------
DROP TABLE IF EXISTS `t_money`;
CREATE TABLE `t_money` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `money` int(18) DEFAULT NULL COMMENT '金额',
  `status` int(11) DEFAULT '1' COMMENT '状态（1.未处理，2.已处理,3.删除）',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `addData` datetime DEFAULT NULL COMMENT '添加时间',
  `endData` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `index_money_id` (`id`) USING BTREE,
  KEY `index_money_user` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_msgboard
-- ----------------------------
DROP TABLE IF EXISTS `t_msgboard`;
CREATE TABLE `t_msgboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `msgboardType` int(11) DEFAULT NULL COMMENT '留言板类型(1 借款中的留言 2 债权转让中的留言)\r\n            ',
  `modeId` bigint(20) DEFAULT NULL COMMENT '模块id是相对于留言板类型中的\r\n            ',
  `msger` bigint(20) DEFAULT NULL COMMENT '留言者',
  `msgContent` text COMMENT '留言内容',
  `msgTime` datetime DEFAULT NULL COMMENT '留言时间',
  `replayer` bigint(20) DEFAULT NULL COMMENT '回复者',
  `replayContent` text COMMENT '回复内容',
  `replayTime` datetime DEFAULT NULL COMMENT '回复时间',
  `enable` int(11) DEFAULT '1' COMMENT '显示状态(1 默认显示 2 屏蔽)\r\n            ',
  PRIMARY KEY (`id`),
  KEY `index_msgboard_id` (`id`) USING BTREE,
  KEY `index_msgboard_model` (`modeId`) USING BTREE,
  KEY `index_msgboard_time` (`msgTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `userId` int(20) DEFAULT NULL COMMENT '发布者Id(关联用户表)',
  `visits` int(11) DEFAULT '0' COMMENT '访问量',
  `state` int(11) DEFAULT '1' COMMENT '删除状态(默认1 未删除 2 删除)',
  `announcementType` varchar(200) DEFAULT 'platform' COMMENT '公告类型 1.平台公告, 2.新标预告，3.活动公告 , 4.公司动态',
  PRIMARY KEY (`id`),
  KEY `index_news_id` (`id`) USING BTREE,
  KEY `inex_news_user` (`userId`) USING BTREE,
  KEY `index_news_time` (`publishTime`) USING BTREE,
  KEY `index_news_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mailNoticeEnable` int(11) DEFAULT '1' COMMENT '站内信通知状态(1 默认关闭 2 开启)\r\n            ',
  `emailNoticeEnable` int(11) DEFAULT '2' COMMENT '邮件通知状态(1 关闭 2 默认开启)\r\n            ',
  `noteNoticeEnable` int(11) DEFAULT '1' COMMENT '短信通知状态(1 默认关闭 2 开启)\r\n            ',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `index_notice_user` (`userId`) USING BTREE,
  KEY `index_notice_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_noticecon
-- ----------------------------
DROP TABLE IF EXISTS `t_noticecon`;
CREATE TABLE `t_noticecon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `noticeMode` int(11) DEFAULT NULL COMMENT '通知方式(1 邮件 2 站内信 3 短信)\r\n            ',
  `reciveRepayEnable` int(11) DEFAULT '1' COMMENT '收到还款(1 默认关闭 2 开启) 通知方式为邮件则默认开启\r\n            ',
  `showSucEnable` int(11) DEFAULT '1' COMMENT '提现成功(1 默认关闭 2 开启) 通知方式为邮件则默认开启\r\n            ',
  `loanSucEnable` int(11) DEFAULT '1' COMMENT '借款成功(1 默认关闭 2 开启) 通知方式为邮件则默认开启\r\n            ',
  `rechargeSucEnable` int(11) DEFAULT '1' COMMENT '充值成功(1 默认关闭 2 开启) 通知方式为邮件则默认开启\r\n            ',
  `capitalChangeEnable` int(11) DEFAULT '1' COMMENT '资金变化(1 默认关闭 2 开启) 通知方式为邮件则默认开启\r\n            ',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `index_noticecon_user` (`userId`) USING BTREE,
  KEY `index_noticecon_id` (`id`) USING BTREE,
  KEY `index_noticecon_mode` (`noticeMode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1831 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_notice_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_msg`;
CREATE TABLE `t_notice_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `msgTitle` varchar(1024) DEFAULT NULL COMMENT '消息标题',
  `msgCotent` text COMMENT '消息内容',
  `userId` bigint(20) DEFAULT NULL COMMENT '接收者',
  `userEmail` varchar(200) DEFAULT NULL COMMENT '接收者邮箱地址',
  `userTelPhone` varchar(200) DEFAULT NULL COMMENT '接收者手机号码',
  `addTime` datetime DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`),
  KEY `index_nmsg_id` (`id`) USING BTREE,
  KEY `index_nmsg_user` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_notice_task
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_task`;
CREATE TABLE `t_notice_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `telphone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `mail_info` text COMMENT '站内信信息',
  `email_info` text COMMENT '邮件信息',
  `sms_info` text COMMENT '短信信息',
  `operate_id` bigint(20) DEFAULT NULL COMMENT '操作id',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件(多个附件路径用,隔开)',
  `add_time` datetime DEFAULT NULL COMMENT '日期时间',
  `operate_identify` varchar(20) DEFAULT NULL COMMENT '操作类型标识',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `s_nid` varchar(255) DEFAULT NULL COMMENT '功能的标识名',
  `sendtitle` varchar(255) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`),
  KEY `index_ntask_id` (`id`) USING BTREE,
  KEY `index_btask_user` (`user_id`) USING BTREE,
  KEY `index_ntask_operate` (`operate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8869 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_notice_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_task_log`;
CREATE TABLE `t_notice_task_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `sendtitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `s_nid` varchar(255) DEFAULT NULL COMMENT '通知类名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `telphone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `mail_info` text COMMENT '站内信信息',
  `email_info` text COMMENT '邮件信息',
  `sms_info` text COMMENT '短信信息',
  `operate_id` bigint(20) DEFAULT NULL COMMENT '操作id',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件(多个附件路径用,隔开)',
  `add_time` datetime DEFAULT NULL COMMENT '日期时间',
  `operate_identify` varchar(20) DEFAULT NULL COMMENT '操作类型标识',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  KEY `index_ntlog_id` (`id`) USING BTREE,
  KEY `index_ntlog_user` (`user_id`) USING BTREE,
  KEY `index_ntlog_operator` (`operate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11409 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_operate_report
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_report`;
CREATE TABLE `t_operate_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) DEFAULT NULL COMMENT '月份',
  `createTime` datetime DEFAULT NULL,
  `totalInvestAmount` decimal(10,2) DEFAULT NULL COMMENT '平台交易总额',
  `totalMonthAmount` decimal(10,2) DEFAULT NULL COMMENT '月交易总额',
  `totalYearAmount` decimal(10,2) DEFAULT NULL COMMENT '截止年交易总额',
  `investorPercent` varchar(8) DEFAULT NULL COMMENT '前十大投资人待收金额占比',
  `borrowCount` bigint(20) DEFAULT NULL COMMENT '开业以来累计贷款笔数',
  `borrowMonthCount` bigint(20) DEFAULT NULL COMMENT '当月累计贷款笔数',
  `borrowAmountEnd` decimal(12,2) DEFAULT NULL COMMENT '开业以来累计贷款金额',
  `borrowAmountMonth` decimal(12,2) DEFAULT NULL COMMENT '当月新增贷款金额总计',
  `less50WBorrowAmount` decimal(12,2) DEFAULT NULL COMMENT '当月新增贷款金额单笔50万以下',
  `o50to150WBorrowAmount` decimal(12,2) DEFAULT NULL COMMENT '当月新增贷款金额单笔50-100万以内',
  `exc100WBorrowAmount` decimal(12,2) DEFAULT NULL COMMENT '当月新增贷款金额单笔100万以上',
  `borrowerCount` bigint(20) DEFAULT NULL COMMENT '开业以来累计贷款人总数',
  `borrowerMonthCount` bigint(20) DEFAULT NULL COMMENT '当月贷款人总数',
  `overdueAmount` decimal(12,2) DEFAULT NULL COMMENT '逾期贷款金额',
  `overdueAmountCount` bigint(20) DEFAULT NULL COMMENT '逾期贷款笔数',
  `fundLeverage` varchar(255) DEFAULT NULL COMMENT '资金杠杆',
  `monthUnRepayAmount` decimal(10,2) DEFAULT NULL COMMENT '截止待还款总金额',
  `totalIncome` decimal(10,2) DEFAULT NULL COMMENT '总收益',
  `monthIncome` decimal(10,2) DEFAULT NULL COMMENT '月收益',
  `totalUser` bigint(20) DEFAULT NULL COMMENT '总用户数',
  `monthUser` bigint(20) DEFAULT NULL COMMENT '月注册人数',
  `totalInvestUser` bigint(20) DEFAULT NULL COMMENT '截止总投资人数',
  `monthInvestUser` bigint(20) DEFAULT NULL COMMENT '月投资人数',
  `monthAvgAmount` decimal(10,2) DEFAULT NULL COMMENT '月人均投资金额',
  `penAvgAmount` decimal(10,2) DEFAULT NULL COMMENT '月笔均投资金额',
  `manProp` varchar(255) DEFAULT NULL COMMENT '男性投资所占投资人数的性别比',
  `womanProp` varchar(255) DEFAULT NULL COMMENT '女性投资所占投资人数的性别比',
  `hjbUnrepay` decimal(10,2) DEFAULT NULL COMMENT '截止恒金宝待收本金',
  `pjbUnrepay` decimal(10,2) DEFAULT NULL COMMENT '截止普金宝待收本金',
  `djbUnrepay` decimal(10,2) DEFAULT NULL COMMENT '截止多金宝待收本金',
  `less18` varchar(255) DEFAULT NULL COMMENT '截止投资人小于18岁占比',
  `o1824` varchar(255) DEFAULT NULL COMMENT '截止投资人小于18-24岁占比',
  `o2529` varchar(255) DEFAULT NULL COMMENT '截止投资人小于25-29岁占比',
  `o3034` varchar(255) DEFAULT NULL COMMENT '截止投资人小于30-34岁占比',
  `o3539` varchar(255) DEFAULT NULL COMMENT '截止投资人小于35-39岁占比',
  `o4049` varchar(255) DEFAULT NULL,
  `exc50` varchar(255) DEFAULT NULL COMMENT '截止投资人超过50岁占比',
  `beijing` varchar(255) DEFAULT NULL COMMENT '投资人北京区域分布所占比',
  `tianjin` varchar(255) DEFAULT NULL COMMENT '投资人天津区域分布所占比',
  `hebei` varchar(255) DEFAULT NULL COMMENT '投资人河北省区域分布所占比',
  `shanxi` varchar(255) DEFAULT NULL COMMENT '投资人山西省区域分布所占比',
  `neimenggu` varchar(255) DEFAULT NULL COMMENT '投资人内蒙古区域分布所占比',
  `liaoning` varchar(255) DEFAULT NULL COMMENT '投资人辽宁省区域分布所占比',
  `jilin` varchar(255) DEFAULT NULL COMMENT '投资人吉林省区域分布所占比',
  `heilongjiang` varchar(255) DEFAULT NULL COMMENT '投资人黑龙江区域分布所占比',
  `shanghai` varchar(255) DEFAULT NULL COMMENT '投资人上海区域分布所占比',
  `jiangsu` varchar(255) DEFAULT NULL COMMENT '投资人江苏省区域分布所占比',
  `zhejiang` varchar(255) DEFAULT NULL COMMENT '投资人浙江省区域分布所占比',
  `anhui` varchar(255) DEFAULT NULL COMMENT '投资人安徽省区域分布所占比',
  `jiangxi` varchar(255) DEFAULT NULL COMMENT '投资人江西省区域分布所占比',
  `fujian` varchar(255) DEFAULT NULL COMMENT '投资人福建省区域分布所占比',
  `shandong` varchar(255) DEFAULT NULL COMMENT '投资人山东省区域分布所占比',
  `taiwan` varchar(255) DEFAULT NULL COMMENT '投资人台湾省区域分布所占比',
  `henan` varchar(255) DEFAULT NULL COMMENT '投资人河南省区域分布所占比',
  `hubei` varchar(255) DEFAULT NULL COMMENT '投资人湖北省区域分布所占比',
  `hunan` varchar(255) DEFAULT NULL COMMENT '投资人湖南省区域分布所占比',
  `guangdong` varchar(255) DEFAULT NULL COMMENT '投资人广东省省区域分布所占比',
  `guangxi` varchar(255) DEFAULT NULL,
  `hainan` varchar(255) DEFAULT NULL,
  `hongkong` varchar(255) DEFAULT NULL,
  `macao` varchar(255) DEFAULT NULL,
  `chongqing` varchar(255) DEFAULT NULL,
  `sichuan` varchar(255) DEFAULT NULL,
  `yunan` varchar(255) DEFAULT NULL,
  `tibet` varchar(255) DEFAULT NULL,
  `guizhou` varchar(255) DEFAULT NULL,
  `shaanxi` varchar(255) DEFAULT NULL,
  `gansu` varchar(255) DEFAULT NULL,
  `qinghai` varchar(255) DEFAULT NULL,
  `ningxia` varchar(255) DEFAULT NULL,
  `xinjiang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_operate_report_page
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_report_page`;
CREATE TABLE `t_operate_report_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) DEFAULT NULL COMMENT '月份',
  `imgPath` varchar(255) DEFAULT NULL COMMENT '路径',
  `uploadTime` datetime DEFAULT NULL COMMENT '上传时间',
  `imgType` int(11) DEFAULT NULL COMMENT '运营图片类型1：月份图片 2：月份封面',
  `imgName` varchar(255) DEFAULT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '操作编号',
  `operation_table` varchar(255) DEFAULT NULL COMMENT '操作表',
  `operation_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  `operation_type` int(18) DEFAULT NULL COMMENT '1 增加 2 修改  3 删除 4 下载 5 excel',
  `operation_ip` varchar(255) DEFAULT NULL COMMENT '操作人IP',
  `operation_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operation_money` double(18,4) DEFAULT NULL COMMENT '操作金额',
  `operation_remarks` varchar(1024) DEFAULT NULL COMMENT '操作备注',
  `operation_around` int(18) DEFAULT '1' COMMENT ' 1  前台 2 后台',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户Id',
  PRIMARY KEY (`id`),
  KEY `index_operatelog_id` (`id`) USING BTREE,
  KEY `index_operaelog_user` (`operation_user`) USING BTREE,
  KEY `index_operatelog_ar` (`operation_around`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36947 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `id` smallint(6) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `paramname` varchar(255) DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL,
  `value` varchar(7000) DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `is_can_edit` tinyint(1) DEFAULT '1',
  `is_password` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`group_id`),
  KEY `index_option_id` (`id`) USING BTREE,
  KEY `index_option_group` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `cellPhone` varchar(50) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL COMMENT '性别(男 女)',
  `birthday` date DEFAULT NULL COMMENT '出生日期 \r\n            ',
  `highestEdu` varchar(20) DEFAULT NULL COMMENT '最高学历 \r\n            ',
  `eduStartDay` date DEFAULT NULL COMMENT '入学年份\r\n            ',
  `school` varchar(200) DEFAULT NULL COMMENT '毕业院校 \r\n            ',
  `maritalStatus` varchar(8) DEFAULT NULL COMMENT '婚姻状况(已婚 未婚)\r\n            ',
  `hasChild` varchar(2) DEFAULT NULL COMMENT '有无子女(有 无)\r\n            ',
  `hasHourse` varchar(2) DEFAULT NULL COMMENT '是否有房(有 无)\r\n            ',
  `hasHousrseLoan` varchar(2) DEFAULT NULL COMMENT '有无房贷(有 无)\r\n            ',
  `hasCar` varchar(2) DEFAULT NULL COMMENT '是否有车 (有 无)\r\n            ',
  `hasCarLoan` varchar(2) DEFAULT NULL COMMENT '有无车贷 (有 无)\r\n            \r\n            ',
  `nativePlacePro` int(11) DEFAULT '-1' COMMENT '籍贯省份(默认为-1) \r\n            ',
  `nativePlaceCity` int(11) DEFAULT '-1' COMMENT '籍贯城市 (默认为-1)\r\n            ',
  `registedPlacePro` int(11) DEFAULT '-1' COMMENT '户口所在地省份(默认为-1)\r\n            ',
  `registedPlaceCity` int(11) DEFAULT '-1' COMMENT '户口所在地城市(默认为-1)\r\n            ',
  `address` varchar(200) DEFAULT NULL COMMENT '居住地址\r\n            ',
  `telephone` varchar(50) DEFAULT NULL COMMENT '居住电话 \r\n            ',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `personalHead` varchar(200) DEFAULT 'images/default-img.jpg' COMMENT '个人头像 ',
  `idNo` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `auditStatus` int(11) DEFAULT '1' COMMENT '认证状态(1 默认审核中或等待审核 2 审核不通过 3 审核通过)',
  `flag` int(11) DEFAULT '1',
  `qq` varchar(50) DEFAULT NULL,
  `idNoPositiveImg` varchar(200) DEFAULT NULL COMMENT '身份证正面 ',
  `idNoReverseImg` varchar(200) DEFAULT NULL COMMENT '身份证反面 ',
  `authTime` datetime DEFAULT NULL COMMENT '授权时间',
  `viewpdf_url` varchar(255) DEFAULT NULL COMMENT '查看授权书地址',
  `download_url` varchar(255) DEFAULT NULL COMMENT '下载授权书地址',
  `transaction_id` bigint(11) DEFAULT NULL COMMENT '授权书交易号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_person_id` (`id`) USING BTREE,
  UNIQUE KEY `index_user_cellphone` (`cellPhone`) USING BTREE,
  UNIQUE KEY `index_person_cellphone` (`cellPhone`) USING BTREE,
  KEY `index_person_user` (`userId`) USING BTREE,
  KEY `index_person_status` (`auditStatus`) USING BTREE,
  KEY `index_person_` (`realName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_person_other_idno
-- ----------------------------
DROP TABLE IF EXISTS `t_person_other_idno`;
CREATE TABLE `t_person_other_idno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `idNo` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_phone_binding_info
-- ----------------------------
DROP TABLE IF EXISTS `t_phone_binding_info`;
CREATE TABLE `t_phone_binding_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobilePhone` varchar(11) NOT NULL COMMENT '手机号码',
  `userId` bigint(20) NOT NULL COMMENT '用户编号',
  `status` int(11) NOT NULL COMMENT '状态(1已绑定  2 正在审核 3 取消 4 审核不通过)',
  `requsetTime` datetime DEFAULT NULL COMMENT '申请时间',
  `reason` text COMMENT '变更原因',
  `option` text COMMENT '审批意见',
  `oldPhone` varchar(20) DEFAULT NULL COMMENT '原来绑定的手机号码',
  `type` int(11) DEFAULT '2' COMMENT '1：表示在填写基本资料时候插入的变更信息；（默认：2）2：为在申请填写手机变更时候填写 ',
  PRIMARY KEY (`id`),
  KEY `index_pbi_id` (`id`) USING BTREE,
  KEY `index_pbi_user` (`userId`) USING BTREE,
  KEY `index_pbi_date` (`requsetTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_phone_info
-- ----------------------------
DROP TABLE IF EXISTS `t_phone_info`;
CREATE TABLE `t_phone_info` (
  `id` bigint(20) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL COMMENT '登录时间 ',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `mobilePhone` varchar(255) DEFAULT NULL COMMENT ' 手机号码',
  `phoneIMEI` varchar(255) DEFAULT NULL COMMENT ' IMEI',
  `softwareVersion` varchar(255) DEFAULT NULL COMMENT '返回移动终端的软件版本，例如：GSM手机的IMEI/SV码',
  `sdkVersion` varchar(255) DEFAULT NULL COMMENT 'SDK号 ',
  `phoneModel` varchar(255) DEFAULT NULL COMMENT '手机型号',
  `ipAddress` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `versionName` varchar(255) DEFAULT NULL COMMENT '版本名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型，android表示安卓，ios表示苹果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_platform_cost
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_cost`;
CREATE TABLE `t_platform_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `costName` varchar(200) DEFAULT NULL COMMENT '收费名称',
  `costFee` decimal(18,2) DEFAULT NULL COMMENT '费用',
  `costMode` int(11) DEFAULT NULL COMMENT '费用模式(1 比率 2 金额)',
  `remark` text COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `types` int(20) DEFAULT NULL COMMENT '费用类型(1.奖励费用管理   2.借款费用管理 3.其他费用管理)',
  `show_view` int(20) DEFAULT '1' COMMENT '显示/隐藏 1 显示  2 隐藏',
  PRIMARY KEY (`id`),
  KEY `index_platcost_id` (`id`) USING BTREE,
  KEY `index_platcost_type` (`types`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_pre_repayment
-- ----------------------------
DROP TABLE IF EXISTS `t_pre_repayment`;
CREATE TABLE `t_pre_repayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `repayPeriod` varchar(50) DEFAULT NULL COMMENT '还款期数',
  `repayDate` varchar(50) DEFAULT NULL COMMENT '还款日期',
  `stillPrincipal` decimal(18,2) DEFAULT '0.00' COMMENT '应还本金',
  `stillInterest` decimal(18,2) DEFAULT '0.00' COMMENT '应还利息',
  `principalBalance` decimal(18,2) DEFAULT '0.00' COMMENT '剩余本金',
  `interestBalance` decimal(18,2) DEFAULT '0.00' COMMENT '剩余利息',
  `mRate` decimal(18,4) DEFAULT '0.0000' COMMENT '月利率',
  `totalSum` decimal(18,2) DEFAULT '0.00' COMMENT '本息余额',
  `totalAmount` decimal(18,2) DEFAULT '0.00' COMMENT '还款总额',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `identify` varchar(200) DEFAULT NULL COMMENT '唯一标识',
  `sort` int(1) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `index_pr_id` (`id`) USING BTREE,
  KEY `index_pr_borrow` (`borrowId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1300 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_pwd_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_pwd_answer`;
CREATE TABLE `t_pwd_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `questionOne` varchar(200) DEFAULT NULL,
  `questionTwo` varchar(200) DEFAULT NULL,
  `questionThree` varchar(200) DEFAULT NULL,
  `answerOne` varchar(200) DEFAULT NULL,
  `answerTwo` varchar(200) DEFAULT NULL,
  `answerThree` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_pwd_requestion
-- ----------------------------
DROP TABLE IF EXISTS `t_pwd_requestion`;
CREATE TABLE `t_pwd_requestion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `requestion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_question_survey
-- ----------------------------
DROP TABLE IF EXISTS `t_question_survey`;
CREATE TABLE `t_question_survey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `age` varchar(100) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别(男 女)',
  `area` varchar(100) DEFAULT NULL COMMENT '所在地区',
  `livingArea` varchar(32) DEFAULT NULL COMMENT '出生日期 \r\n            ',
  `professional` varchar(50) DEFAULT NULL COMMENT '目前的职业类别',
  `houseHoldIncome` varchar(50) DEFAULT NULL COMMENT '您的家庭年收入',
  `financialTime` varchar(32) DEFAULT NULL COMMENT '您通过P2P网络借贷理财有多久',
  `financialNum` varchar(20) DEFAULT NULL COMMENT '您目前参与投入资金的P2P网络借贷平台数量有多少',
  `financialLong` varchar(20) DEFAULT NULL COMMENT '你目前投资的理财产品，期限是多长',
  `knowNetworkPlatform` varchar(32) DEFAULT NULL COMMENT '您通过什么途径了解网贷这些平台',
  `financialMoney` varchar(32) DEFAULT NULL COMMENT '平均理财金额',
  `financialMoneyRatio` varchar(32) DEFAULT NULL COMMENT '您在P2P网络借贷市场的理财资金占您整个理财资金的比例大概是',
  `financialMoneySource` varchar(32) DEFAULT NULL COMMENT '您目前在P2P网络借贷市场理财资金的主要来源是',
  `financialReason` varchar(32) DEFAULT NULL COMMENT '是什么因素吸引您通过P2P网络借贷投资',
  `financialThinkValue` varchar(64) DEFAULT NULL COMMENT '您所投P2P网络借贷平台你最看重哪方面？（可多项选择）',
  `majorFocus` varchar(64) DEFAULT NULL COMMENT '下列关于借款人的资料信息，您主要关注下列哪些要素？（可多项选择）',
  `financialEarning` varchar(64) DEFAULT NULL COMMENT '你投资网贷目前获利情况如何',
  `investWilling` varchar(64) DEFAULT NULL COMMENT '您会继续在p2p网贷平台上投资理财吗',
  `financialConvenient` varchar(255) DEFAULT NULL COMMENT '您觉得p2p网贷平台是否给您的理财带来多大的便利？满意度低到高',
  `knowPujinziben` varchar(100) DEFAULT NULL COMMENT '你是通过什么途径知道普金资本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_survey_id` (`id`) USING BTREE,
  KEY `index_survey_user` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_recharge
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `opertorId` bigint(20) DEFAULT NULL COMMENT '管理员补单',
  `rechargeMoney` decimal(18,2) DEFAULT '0.00' COMMENT '充值金额',
  `cost` decimal(18,2) DEFAULT '0.00' COMMENT '费用',
  `addTime` datetime DEFAULT NULL COMMENT '充值时间',
  `result` int(11) DEFAULT NULL COMMENT '处理结果（0，未成功，1，已成功）',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `index_recharge_user` (`userId`) USING BTREE,
  KEY `index_recharge_id` (`id`) USING BTREE,
  KEY `index_recharge_operator` (`opertorId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_rechargebank
-- ----------------------------
DROP TABLE IF EXISTS `t_rechargebank`;
CREATE TABLE `t_rechargebank` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `bankname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '银行名称',
  `Account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '账号',
  `accountbank` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '开户行',
  `bankimage` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '银行图片',
  `accountname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '开户行真实姓名',
  `addOperator` bigint(18) DEFAULT '-100' COMMENT '添加操作管理员id',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `addIp` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '添加ip',
  `delOperator` bigint(18) DEFAULT '-100' COMMENT '删除操作管理员',
  `delTime` datetime DEFAULT NULL COMMENT '删除时间',
  `delIp` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '删除ip',
  `isDel` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `index_rechargebank_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_rechargenumberlist
-- ----------------------------
DROP TABLE IF EXISTS `t_rechargenumberlist`;
CREATE TABLE `t_rechargenumberlist` (
  `PayNumber` bigint(20) NOT NULL,
  `Money` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`PayNumber`),
  KEY `index_rnl_id` (`PayNumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_recharge_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge_detail`;
CREATE TABLE `t_recharge_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rechargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  `rechargeType` int(50) DEFAULT NULL COMMENT '充值类型(1,为支付宝 2 环迅支付 3国付宝 4 线下充值 51手动充值 52虚拟充值 53奖励充值)',
  `bankName` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `rechargeMoney` decimal(18,2) DEFAULT '0.00' COMMENT '充值金额',
  `cost` decimal(18,2) DEFAULT '0.00' COMMENT '费用',
  `result` int(11) DEFAULT NULL COMMENT '处理结果（0，未成功，1，已成功）',
  `paynumber` varchar(100) DEFAULT NULL COMMENT '支付流水号',
  `rechargeNumber` varchar(100) DEFAULT NULL COMMENT '充值编号',
  `buyerEmail` varchar(50) DEFAULT NULL COMMENT '支付帐号',
  `rechargeId` bigint(20) DEFAULT NULL COMMENT '充值ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `ipAddress` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `award` decimal(20,2) DEFAULT '0.00' COMMENT '线下充值奖励系数',
  `operatorId` bigint(20) DEFAULT '-1' COMMENT '操作员，如果是后台管理员操作，记录管理员的ID',
  `billcode` varchar(40) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY `index_rd_user` (`userId`) USING BTREE,
  KEY `index_rd_id` (`id`) USING BTREE,
  KEY `index_rd_time` (`rechargeTime`) USING BTREE,
  KEY `index_rd_rechergeid` (`rechargeId`) USING BTREE,
  KEY `index_rd_operator` (`operatorId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1494 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_recharge_info
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge_info`;
CREATE TABLE `t_recharge_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `rechargeType` tinyint(4) DEFAULT NULL COMMENT '充值类型(1网上充值  2 线下充值)',
  `bankName` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `rechargeMoney` decimal(18,2) DEFAULT NULL COMMENT '充值金额',
  `account` decimal(18,2) DEFAULT NULL COMMENT '到账金额',
  `rechargeTime` datetime DEFAULT NULL COMMENT '充值时间',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '状态(1正在充值  2 已到账)',
  `poundage` float DEFAULT NULL COMMENT '手续费',
  PRIMARY KEY (`id`),
  KEY `index_rechargeinfo_id` (`id`) USING BTREE,
  KEY `index_rechargeinfo_user` (`userId`) USING BTREE,
  KEY `index_rechargeinfo_date` (`rechargeTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_recharge_withdraw_info
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge_withdraw_info`;
CREATE TABLE `t_recharge_withdraw_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1 手动充值  2 手动扣费)',
  `dealMoney` decimal(18,2) DEFAULT NULL COMMENT '操作金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `checkUser` bigint(20) DEFAULT NULL COMMENT '操作员ID',
  `checkTime` datetime DEFAULT NULL COMMENT '操作时间',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `index_rwi_id` (`id`) USING BTREE,
  KEY `index_rwi_userid` (`userId`) USING BTREE,
  KEY `index_rwi_checkuser` (`checkUser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_recommend_user
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend_user`;
CREATE TABLE `t_recommend_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '被推荐人编号',
  `recommendUserId` bigint(20) DEFAULT NULL COMMENT '推荐人编号',
  `moneyTypeId` bigint(20) DEFAULT NULL COMMENT '金额Id（钱的大小）关联t_money',
  `rewardMoney` decimal(18,2) DEFAULT NULL COMMENT '奖励金额',
  `rewardTime` datetime DEFAULT NULL COMMENT '奖励时间',
  `maintenanceman` bigint(20) DEFAULT NULL COMMENT '维护人ID',
  PRIMARY KEY (`id`),
  KEY `index_ru_id` (`id`) USING BTREE,
  KEY `indx_ru_userid` (`userId`) USING BTREE,
  KEY `index_ru_ruId` (`recommendUserId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_redbag_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_redbag_manage`;
CREATE TABLE `t_redbag_manage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `rbName` varchar(200) DEFAULT NULL COMMENT '红包名称',
  `rbFee` decimal(18,2) DEFAULT NULL COMMENT '红包',
  `rbMode` int(11) DEFAULT NULL COMMENT '红包模式(1 比率 2 金额)',
  `remark` text COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '添加时间',
  `rbtypes` int(20) DEFAULT NULL COMMENT '红包类型(1.注册红包   2.投资红包)',
  `state` int(4) DEFAULT '1' COMMENT '1开启，2关闭',
  PRIMARY KEY (`id`),
  KEY `index_redbag_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_redmoneyrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_redmoneyrecord`;
CREATE TABLE `t_redmoneyrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `money` decimal(18,2) DEFAULT '0.00' COMMENT '代金券金额(5元）',
  `rbName` varchar(200) DEFAULT NULL COMMENT '代金券名称',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `inserttime` datetime DEFAULT NULL COMMENT '添加时间',
  `activesatus` int(4) DEFAULT '1' COMMENT '1开启，2关闭',
  `activetime` datetime DEFAULT NULL COMMENT '激活时间',
  `usestatus` int(4) DEFAULT '1' COMMENT '1未使用，2使用，3过期',
  `usetime` datetime DEFAULT NULL COMMENT '使用时间',
  `islock` int(4) DEFAULT '1' COMMENT '1被锁，2未被锁',
  `lockendtime` datetime DEFAULT NULL COMMENT '锁定时间',
  `redmoneytype` varchar(200) DEFAULT NULL COMMENT '1表示代金券用  2表示现金券用',
  `loansignid` bigint(20) DEFAULT NULL,
  `recivecode` varchar(200) DEFAULT NULL,
  `loanrcordid` bigint(20) DEFAULT NULL,
  `isshow` varchar(200) DEFAULT NULL,
  `mintendMoney` decimal(18,2) DEFAULT '0.00' COMMENT '备用金额',
  `redmoneytype2` decimal(18,2) DEFAULT '0.00' COMMENT '备用金额',
  `useendtime` datetime DEFAULT NULL COMMENT '使用截止时间',
  `ismoneysatus` int(4) DEFAULT NULL COMMENT '代金券的金额类型(1为5元，2位10元，3为20元等)',
  `handleMoney` decimal(20,2) DEFAULT '0.00' COMMENT '操作金额',
  `rechargeUid` bigint(20) DEFAULT '0' COMMENT '充值人ID',
  `deadline` int(2) DEFAULT '0' COMMENT '限定代金券可使用的标的期限,0为不限制',
  `investAmount` decimal(11,2) DEFAULT '100.00' COMMENT '达到投资金额才能使用代金券,0为不限制',
  `borrowFlag` int(2) DEFAULT '3' COMMENT '标的，1表示新手标老标都可投，2表示新手标可投，3表示老标可投，',
  PRIMARY KEY (`id`),
  KEY `index_redbag_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12227 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_referral_bonuses
-- ----------------------------
DROP TABLE IF EXISTS `t_referral_bonuses`;
CREATE TABLE `t_referral_bonuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typedesc` varchar(255) DEFAULT NULL COMMENT '类型描述',
  `type` int(11) DEFAULT NULL COMMENT '奖励类型（团队长，投资人，理财人）',
  `general` decimal(10,0) DEFAULT NULL COMMENT '普通借款奖励提成',
  `fieldVisit` decimal(10,0) DEFAULT NULL COMMENT '实地考察奖励提成',
  `organization` decimal(10,0) DEFAULT NULL COMMENT '机构担保奖励提成',
  `netWorth` decimal(10,0) DEFAULT NULL COMMENT '净值借款',
  `desc` varchar(255) DEFAULT NULL COMMENT '奖励说明情况',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_referral_id` (`id`) USING BTREE,
  KEY `index_referral_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `regionId` bigint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` bigint(5) unsigned NOT NULL DEFAULT '0',
  `regionName` varchar(120) NOT NULL DEFAULT '',
  `regionType` int(1) NOT NULL DEFAULT '2',
  `agencyId` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`regionId`),
  UNIQUE KEY `index_region_id` (`regionId`) USING BTREE,
  KEY `index_region_parentid` (`parentId`) USING BTREE,
  KEY `index_region_type` (`regionType`) USING BTREE,
  KEY `index_region_agencyid` (`agencyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_relation`;
CREATE TABLE `t_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `peopleId` bigint(20) DEFAULT NULL COMMENT '角色编号',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父编号',
  `level` int(11) DEFAULT NULL COMMENT '级别：1团队长2经纪人3投资人4理财人',
  `enable` int(11) DEFAULT '1' COMMENT '关系情况：1未解除关系2已解除关系',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relation_id` (`id`) USING BTREE,
  KEY `index_relation_people` (`peopleId`) USING BTREE,
  KEY `index_relation_parent` (`parentId`) USING BTREE,
  KEY `index_relation_level` (`level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_release_also_reconciliation
-- ----------------------------
DROP TABLE IF EXISTS `t_release_also_reconciliation`;
CREATE TABLE `t_release_also_reconciliation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordId` varchar(30) DEFAULT NULL COMMENT '订单号',
  `ordDate` datetime DEFAULT NULL COMMENT '订单日期',
  `merCustId` varchar(16) DEFAULT NULL COMMENT '商户客户号',
  `investCustId` varchar(16) DEFAULT NULL COMMENT '投资人客户号',
  `borrCustId` varchar(16) DEFAULT NULL COMMENT '借款人客户号',
  `transAmt` decimal(14,2) DEFAULT NULL COMMENT '交易金额',
  `transStat` varchar(1) DEFAULT '' COMMENT '汇付交易状态,I--初始,P--部分成功',
  `pnrDate` datetime DEFAULT NULL COMMENT '汇付交易日期',
  `pnrSeqId` varchar(10) DEFAULT NULL COMMENT '汇付交易流水',
  `queryTransType` varchar(255) DEFAULT NULL COMMENT 'LOANS：放款交易查询 REPAYMENT：还款交易',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4353 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_repayment
-- ----------------------------
DROP TABLE IF EXISTS `t_repayment`;
CREATE TABLE `t_repayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `repayDate` date DEFAULT NULL COMMENT '还款日期',
  `realRepayDate` date DEFAULT NULL COMMENT '实际还款日期',
  `repayPeriod` varchar(20) DEFAULT NULL COMMENT '还款期数',
  `hasPI` decimal(18,2) DEFAULT '0.00' COMMENT '已还本息',
  `stillPrincipal` decimal(18,2) DEFAULT '0.00' COMMENT '待还本金',
  `stillInterest` decimal(18,2) DEFAULT '0.00' COMMENT '待还利息',
  `hasFI` decimal(18,2) DEFAULT '0.00' COMMENT '已还罚息',
  `lateFI` decimal(18,2) DEFAULT '0.00' COMMENT '待还罚息',
  `lateDay` int(11) DEFAULT '0' COMMENT '逾期天数',
  `repayStatus` int(11) DEFAULT '1' COMMENT '还款状态（1 默认未偿还 2 已偿还）\r\n            ',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `isLate` int(11) DEFAULT '1' COMMENT '是否逾期( 默认 1 否 2 是)',
  `isWebRepay` int(11) DEFAULT '1' COMMENT '是否网站待还(默认1 否 2 是)',
  `investorForpayFI` decimal(18,2) DEFAULT '0.00' COMMENT '投资人待收罚息',
  `investorHaspayFI` decimal(18,2) DEFAULT '0.00' COMMENT '投资人已收罚息',
  `principalBalance` decimal(18,2) DEFAULT '0.00' COMMENT '本金余额',
  `interestBalance` decimal(18,2) DEFAULT '0.00' COMMENT '利息余额',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `executeTime` date DEFAULT NULL COMMENT '逾期执行时间',
  `identify` varchar(255) DEFAULT NULL COMMENT '唯一标识符',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_repayment_id` (`id`) USING BTREE,
  KEY `index_repayment_date` (`repayDate`) USING BTREE,
  KEY `index_repayent_borrowid` (`borrowId`) USING BTREE,
  KEY `index_repayment` (`repayStatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2437 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_repayment_record
-- ----------------------------
DROP TABLE IF EXISTS `t_repayment_record`;
CREATE TABLE `t_repayment_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `repayId` bigint(20) DEFAULT NULL COMMENT '还款id',
  `repayAmount` decimal(18,2) DEFAULT NULL COMMENT '还款金额',
  `oporator` bigint(20) DEFAULT NULL COMMENT '操作员',
  `remark` text COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_repayrecord_id` (`id`) USING BTREE,
  KEY `index_repayrecord_repayid` (`repayId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_repayment_service
-- ----------------------------
DROP TABLE IF EXISTS `t_repayment_service`;
CREATE TABLE `t_repayment_service` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `serviceContent` varchar(500) DEFAULT NULL COMMENT '沟通内容',
  `serviceTime` datetime DEFAULT NULL COMMENT '沟通时间',
  `repayId` bigint(20) DEFAULT NULL COMMENT '还款编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_repayservice_id` (`id`) USING BTREE,
  KEY `index_repayservice_repayid` (`repayId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_report
-- ----------------------------
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `reportTitle` varchar(200) DEFAULT NULL COMMENT '举报标题',
  `reportContent` text COMMENT '举报内容',
  `reportTime` datetime DEFAULT NULL COMMENT '举报时间',
  `reporter` bigint(20) DEFAULT NULL COMMENT '举报人(被举报的人)',
  `user` bigint(20) DEFAULT NULL COMMENT '举报的用户(举报人)',
  `status` int(20) DEFAULT '1' COMMENT '处理状态(1.等待处理 2.举报成功 3.举报失败)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `reportType` int(11) DEFAULT '1' COMMENT '举报类型(1.违约，2.）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_report_id` (`id`) USING BTREE,
  KEY `index_report_user1` (`reporter`) USING BTREE,
  KEY `index_report_user2` (`user`) USING BTREE,
  KEY `index_report_time` (`reportTime`) USING BTREE,
  KEY `index_report_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_risk_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_risk_detail`;
CREATE TABLE `t_risk_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `riskInCome` decimal(18,2) DEFAULT '0.00' COMMENT '风险保证金收入',
  `riskSpending` decimal(18,2) DEFAULT '0.00' COMMENT '风险保证金支出',
  `riskDate` datetime DEFAULT NULL COMMENT '记录日期',
  `riskBalance` decimal(18,2) DEFAULT NULL COMMENT '保障金余额',
  `riskType` varchar(20) DEFAULT NULL COMMENT '保证金类型',
  `resource` varchar(20) DEFAULT NULL COMMENT '来源',
  `trader` bigint(20) DEFAULT NULL COMMENT '交易对方',
  `borrowId` bigint(20) DEFAULT NULL COMMENT '借款id',
  `remark` text COMMENT '备注',
  `operator` bigint(20) DEFAULT NULL COMMENT '操作人员，针对后台用户',
  UNIQUE KEY `index_riskdetail_id` (`id`) USING BTREE,
  KEY `index_riskdetail_date` (`riskDate`) USING BTREE,
  KEY `index_riskdetail_borrow` (`borrowId`) USING BTREE,
  KEY `index_riskdetail_operator` (`operator`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1410 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_role_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_role_rights
-- ----------------------------
DROP TABLE IF EXISTS `t_role_rights`;
CREATE TABLE `t_role_rights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色编号',
  `rightsId` bigint(20) DEFAULT NULL COMMENT '限权编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rolerights_id` (`id`) USING BTREE,
  KEY `index_rolerights_roleId` (`roleId`) USING BTREE,
  KEY `index_rolerights_rightsId` (`rightsId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8335 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_rongtuwang
-- ----------------------------
DROP TABLE IF EXISTS `t_rongtuwang`;
CREATE TABLE `t_rongtuwang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间，每天一条记录',
  `apr_data` varchar(200) DEFAULT '0' COMMENT '每天的标的平均年利率，没有为0.',
  `count_data` varchar(200) DEFAULT '0' COMMENT '每天对应发布借款的金额，没有则为0.',
  `dcount_data` int(11) DEFAULT '0' COMMENT '每天借款成功的借款金额，没有则为0。',
  `time_data1_3` decimal(18,2) DEFAULT '0.00' COMMENT '1-3个月的所有标的总额',
  `time_data4_6` decimal(18,2) DEFAULT '0.00' COMMENT '4-6个月的所有标的总额',
  `time_data7_12` decimal(18,2) DEFAULT '0.00' COMMENT '7-12个月的所有标的总额',
  `time_data12_` decimal(18,2) DEFAULT '0.00' COMMENT '12个月以上的所有标的总额',
  `cj_data` decimal(18,2) DEFAULT '0.00' COMMENT '平台总成交量，单位万元，保留2位小数',
  `dh_data` decimal(18,2) DEFAULT '0.00' COMMENT '平台总待还金额，单位万元，保留2位小数',
  `avg_apr` decimal(18,2) DEFAULT '0.00' COMMENT '前一天平均年利率，如果对应前一天没有数据的，对应值为平均年利率即可，保留2位小数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_save_reconciliation
-- ----------------------------
DROP TABLE IF EXISTS `t_save_reconciliation`;
CREATE TABLE `t_save_reconciliation` (
  `OrdId` varchar(32) NOT NULL COMMENT '订单号',
  `MerCustId` varchar(32) DEFAULT NULL COMMENT '商户客户号',
  `UsrCustId` varchar(32) DEFAULT NULL COMMENT '用户客户号',
  `OrdDate` varchar(32) DEFAULT NULL COMMENT '订单时间',
  `TransAmt` decimal(18,2) DEFAULT NULL COMMENT '交易金额',
  `TransStat` varchar(2) DEFAULT NULL COMMENT '汇付交易状态',
  `GateBusiId` varchar(32) DEFAULT NULL COMMENT '支付网关业务代号',
  `OpenBankId` varchar(32) DEFAULT NULL COMMENT '开户银行代号',
  `OpenAcctId` varchar(32) DEFAULT NULL COMMENT '开户银行账号',
  `FeeAmt` decimal(18,2) DEFAULT NULL COMMENT '手续费金额',
  `FeeCustId` varchar(32) DEFAULT NULL COMMENT '手续费扣款客户号',
  `FeeAcctId` varchar(32) DEFAULT NULL COMMENT '手续费扣款子账户号',
  `InDate` datetime DEFAULT NULL,
  PRIMARY KEY (`OrdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_select
-- ----------------------------
DROP TABLE IF EXISTS `t_select`;
CREATE TABLE `t_select` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `typeId` bigint(20) DEFAULT NULL COMMENT '列表类型id',
  `selectValue` int(18) DEFAULT NULL COMMENT '下拉值',
  `selectName` varchar(50) DEFAULT NULL COMMENT '下拉名称',
  `description` longtext COMMENT '为担保公司新增（担保公司描述）',
  `deleted` int(11) DEFAULT '1' COMMENT '删除状态(默认1 未删除 2 删除)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_select_id` (`id`) USING BTREE,
  KEY `index_select_deleteid` (`deleted`) USING BTREE,
  KEY `index_select_typeid` (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_selecttype
-- ----------------------------
DROP TABLE IF EXISTS `t_selecttype`;
CREATE TABLE `t_selecttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '下拉列表类型名称',
  PRIMARY KEY (`id`),
  KEY `index_selecttype_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_sendsms
-- ----------------------------
DROP TABLE IF EXISTS `t_sendsms`;
CREATE TABLE `t_sendsms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（主键）',
  `content` varchar(255) DEFAULT NULL COMMENT '信息内容',
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `splitId` varchar(255) DEFAULT NULL COMMENT '收短信人的ID拼接（用，隔开）',
  `splitPhone` varchar(255) DEFAULT NULL COMMENT '收短信人的电话拼接(用；隔开)',
  `status` int(11) DEFAULT '1' COMMENT '状态（1，未发送，2，已发送）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sendsms_id` (`id`) USING BTREE,
  KEY `index_sendsms_time` (`sendTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2904 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_seoconfig
-- ----------------------------
DROP TABLE IF EXISTS `t_seoconfig`;
CREATE TABLE `t_seoconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `otherTags` varchar(500) DEFAULT NULL,
  `siteMap` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_seo_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_serviceman
-- ----------------------------
DROP TABLE IF EXISTS `t_serviceman`;
CREATE TABLE `t_serviceman` (
  `userId` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serviceManName` varchar(50) DEFAULT NULL COMMENT '客服名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_serviceman_id` (`id`) USING BTREE,
  KEY `index_serviceman_user` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_site_information
-- ----------------------------
DROP TABLE IF EXISTS `t_site_information`;
CREATE TABLE `t_site_information` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `siteName` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `companyName` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `postcode` varchar(255) DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `principal` varchar(255) DEFAULT NULL COMMENT '负责人',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `cellphone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `fax` varchar(255) DEFAULT NULL COMMENT '传真',
  `emial` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ号码',
  `servicePhone` varchar(255) DEFAULT NULL COMMENT '服务电话',
  `certificate` varchar(255) DEFAULT NULL COMMENT 'ICP证书号',
  `regionName` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `adminUrl` varchar(255) DEFAULT NULL COMMENT '后台namespace地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_siteinfo_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_slbao_earnings
-- ----------------------------
DROP TABLE IF EXISTS `t_slbao_earnings`;
CREATE TABLE `t_slbao_earnings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户',
  `usableSum` decimal(18,2) DEFAULT NULL COMMENT '可用金额',
  `income` decimal(18,2) DEFAULT '0.00' COMMENT '收入金额',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间',
  `remarks` varchar(300) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_slbao_record
-- ----------------------------
DROP TABLE IF EXISTS `t_slbao_record`;
CREATE TABLE `t_slbao_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户',
  `fundMode` int(2) DEFAULT NULL COMMENT '类型名称：1表示转入，2表示转出',
  `handleSum` decimal(18,2) DEFAULT '0.00' COMMENT '操作金额',
  `usableSum` decimal(18,2) DEFAULT '0.00' COMMENT '可用金额',
  `income` decimal(18,2) DEFAULT '0.00' COMMENT '收入金额',
  `spending` decimal(18,2) DEFAULT '0.00' COMMENT '支出金额',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间',
  `paynumber` varchar(30) DEFAULT NULL COMMENT '支付流水号',
  `remarks` varchar(300) DEFAULT NULL COMMENT '备注说明：转入 转出',
  `tradeStatus` int(11) DEFAULT '1' COMMENT '交易状态(0表示成功，1表示初始化， 2：失败)',
  `pageType` int(11) DEFAULT NULL COMMENT '0:PC, 1:WAP, 2:APP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sms
-- ----------------------------
DROP TABLE IF EXISTS `t_sms`;
CREATE TABLE `t_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `UserID` varchar(255) DEFAULT NULL COMMENT '账号',
  `Account` varchar(255) DEFAULT NULL COMMENT '子账号',
  `Password` varchar(255) DEFAULT NULL COMMENT '密码',
  `url` varchar(255) DEFAULT NULL COMMENT '短信接口地址',
  `status` int(11) DEFAULT NULL COMMENT '状态（1.默认开启。2.关闭）',
  `type` int(2) DEFAULT NULL COMMENT '类型：1表示配置信息，2骏媒，3表示创蓝',
  `SMSOperator` varchar(50) DEFAULT NULL COMMENT '短信运营商',
  `configTime` datetime DEFAULT NULL COMMENT '启用时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sms_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_smscontent
-- ----------------------------
DROP TABLE IF EXISTS `t_smscontent`;
CREATE TABLE `t_smscontent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（主键）',
  `content` varchar(255) DEFAULT NULL COMMENT '信息内容',
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `status` int(11) DEFAULT '1' COMMENT '状态（1，投标，2，取现，3、满标提醒，4，回款，5，还款提醒,6，债券转让，7，体验金）',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sendsms_id` (`id`) USING BTREE,
  KEY `index_sendsms_time` (`sendTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='短信发送记录表（后台管理员发送给用户的短信记录）';

-- ----------------------------
-- Table structure for t_successstory
-- ----------------------------
DROP TABLE IF EXISTS `t_successstory`;
CREATE TABLE `t_successstory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `imgPath` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `publisher` varchar(255) DEFAULT NULL COMMENT '发布人',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `browseNum` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_successstory_id` (`id`) USING BTREE,
  KEY `index_successstory_time` (`publishTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_sysimages
-- ----------------------------
DROP TABLE IF EXISTS `t_sysimages`;
CREATE TABLE `t_sysimages` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `imagePath` varchar(200) DEFAULT NULL COMMENT '图片保存路径',
  `enable` int(11) DEFAULT '1' COMMENT '1为能使用 2 为禁用 默认为1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysimages_id` (`id`) USING BTREE,
  KEY `index_sysimages_enable` (`enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_sys_task
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_task`;
CREATE TABLE `t_sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `time_task` bigint(20) DEFAULT '0' COMMENT '任务时间戳',
  `time_type` int(11) DEFAULT NULL COMMENT '时间类型(0 年 1 月 2 日 3 时 4 分 5 秒 6 星期)',
  `time_execute` bigint(20) DEFAULT '0' COMMENT '执行时间',
  `status` int(11) DEFAULT '0' COMMENT '执行状态( 0 未执行 1 已执行)',
  `task_mode` int(11) DEFAULT NULL COMMENT '任务类别，自定义',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_team
-- ----------------------------
DROP TABLE IF EXISTS `t_team`;
CREATE TABLE `t_team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `intro` text COMMENT '简介',
  `sort` int(20) DEFAULT NULL COMMENT '序号',
  `imgPath` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `userName` varchar(30) DEFAULT NULL,
  `state` int(10) DEFAULT '1' COMMENT '团队信息状态 默认为1，表示正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_team_id` (`id`) USING BTREE,
  KEY `index_team_sort` (`sort`) USING BTREE,
  KEY `index_team_state` (`state`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_trf_reconciliation
-- ----------------------------
DROP TABLE IF EXISTS `t_trf_reconciliation`;
CREATE TABLE `t_trf_reconciliation` (
  `OrdId` varchar(32) NOT NULL COMMENT '订单号',
  `InDate` datetime DEFAULT NULL COMMENT '数据采集时间',
  `MerCustId` varchar(32) DEFAULT NULL COMMENT '商户客户号',
  `UsrCustId` varchar(32) DEFAULT NULL COMMENT '投资人客户号',
  `BorrCustId` varchar(32) DEFAULT NULL COMMENT '借款人客户号',
  `TransAmt` decimal(18,2) DEFAULT NULL COMMENT '交易金额',
  `TransStat` varchar(2) DEFAULT NULL COMMENT '汇付交易状态',
  `PnrDate` varchar(8) DEFAULT NULL COMMENT '汇付交易日期',
  `PnrSeqId` varchar(32) DEFAULT NULL COMMENT '汇付交易流水',
  PRIMARY KEY (`OrdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(100) DEFAULT NULL COMMENT '用户email',
  `username` varchar(45) DEFAULT NULL COMMENT '用户名',
  `vipStatus` int(2) DEFAULT '1' COMMENT 'VIP会员状态(1 默认 非VIP 2 VIP 3 待续费VIP)',
  `authStep` int(11) DEFAULT '1' COMMENT '认证步骤(默认是1  个人详细信息 2  工作认证 3上传 资料)',
  `enable` int(11) DEFAULT '1' COMMENT '是否禁用 1、启用 2、禁用 3.黑名单 默认1',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `dealpwd` varchar(100) DEFAULT NULL COMMENT '交易密码(初始密码为用户密码)',
  `mobilePhone` varchar(20) DEFAULT NULL COMMENT '用户移动电话',
  `refferee` varchar(20) DEFAULT NULL COMMENT '推荐人',
  `rating` int(11) DEFAULT '0' COMMENT '网站积分',
  `creditrating` int(11) DEFAULT '0' COMMENT '信用积分',
  `lastIP` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `lastDate` datetime DEFAULT NULL COMMENT '最后登录时间',
  `vipCreateTime` datetime DEFAULT NULL COMMENT 'VIP创建时间',
  `creditLimit` bigint(11) DEFAULT '3000' COMMENT '信用额度',
  `headImg` varchar(200) DEFAULT NULL COMMENT '头像',
  `createTime` datetime DEFAULT NULL COMMENT '帐号创建时间',
  `content` text COMMENT '用户vip申请会员时候填写的备注',
  `usableSum` decimal(18,2) DEFAULT '0.00' COMMENT '可用金额',
  `freezeSum` decimal(18,2) DEFAULT '0.00' COMMENT '冻结金额',
  `dueinSum` decimal(18,2) DEFAULT '0.00' COMMENT '待收金额',
  `dueoutSum` decimal(18,2) DEFAULT '0.00' COMMENT '待还金额',
  `kefuId` bigint(20) DEFAULT NULL COMMENT '客服Id',
  `adminId` bigint(11) DEFAULT NULL COMMENT '后台审核员id',
  `groupId` bigint(20) DEFAULT NULL COMMENT '组ID',
  `usableCreditLimit` bigint(20) DEFAULT '3000' COMMENT '可用信用额度',
  `creditlimtor` bigint(11) DEFAULT NULL COMMENT '额度审核审核员id',
  `vipFee` decimal(18,2) DEFAULT '0.00' COMMENT 'vip会费',
  `feeStatus` int(11) unsigned DEFAULT '1' COMMENT '费用扣除状态( 1 待扣 2 已扣)',
  `loginCount` bigint(20) DEFAULT '0' COMMENT '登录次数',
  `lockTime` datetime DEFAULT NULL COMMENT '锁定时间',
  `cashStatus` int(11) DEFAULT '1' COMMENT '提现状态(默认1 启动 2 禁止)',
  `xmax` decimal(18,2) DEFAULT '0.00' COMMENT '最大待收本金',
  `x` decimal(18,2) DEFAULT '0.00' COMMENT '系数',
  `xmin` decimal(18,2) DEFAULT '0.00' COMMENT '最小值',
  `isFirstVip` int(11) DEFAULT '1' COMMENT '是否首次成为VIP(默认 1 是 2 否)',
  `sign` varchar(50) DEFAULT NULL,
  `sign2` varchar(50) DEFAULT NULL,
  `loginErrorCount` int(10) DEFAULT '0' COMMENT '错误登录次数，默认0',
  `isLoginLimit` int(10) DEFAULT '1' COMMENT '1.不限制登录 2.限制登录',
  `isApplyPro` int(10) DEFAULT '1',
  `ipayAccount` varchar(50) DEFAULT NULL COMMENT '用户在汇付注册的账户号',
  `regRedBag` decimal(18,2) DEFAULT '0.00' COMMENT '注册红包',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `accountSum` decimal(18,2) DEFAULT '0.00' COMMENT '体验金',
  `accountNum` int(10) DEFAULT '0' COMMENT '体验金弹框次数',
  `isEmployeeReferral` int(11) DEFAULT '1' COMMENT '是否内部员工推荐(1 默认 非员工推荐 2 是员工推荐)',
  `vocherAmt` decimal(20,2) DEFAULT '0.00' COMMENT '代金券金额',
  `fiVocherAmt` decimal(20,2) DEFAULT '0.00' COMMENT '五元代金券',
  `teVocherAmt` decimal(20,2) DEFAULT '0.00' COMMENT '10元代金券',
  `twVocherAmt` decimal(20,2) DEFAULT '0.00' COMMENT '20元代金卷',
  `busiCode` varchar(200) DEFAULT NULL COMMENT '注册号',
  `legalName` varchar(45) DEFAULT NULL COMMENT '企业法人姓名',
  `legalIdNo` varchar(20) DEFAULT NULL COMMENT '企业法人身份证',
  `loginLimitTime` datetime DEFAULT NULL COMMENT '锁定时间',
  `authTime` datetime DEFAULT NULL COMMENT '授权时间',
  `viewpdf_url` varchar(255) DEFAULT NULL COMMENT '查看授权书地址',
  `download_url` varchar(255) DEFAULT NULL COMMENT '下载授权书地址',
  `transaction_id` varchar(50) DEFAULT NULL COMMENT '授权书交易号',
  `isBehalf` int(10) DEFAULT '1' COMMENT '是否投资人代表：1：不是投资人代表 2：是投资人代表',
  `isLoanManager` int(10) DEFAULT '1' COMMENT '是否贷后维护经理：1：不是维护经理 2：是维护经理',
  `registerSource` varchar(32) DEFAULT NULL COMMENT '注册来源',
  `isAccountSum` int(10) DEFAULT '1' COMMENT '是否领取过体验金  1：未领取，2：已领取',
  `IpArea` varchar(100) DEFAULT NULL COMMENT 'IP地址所属区域',
  `isInvestAmt` int(10) DEFAULT '1' COMMENT '是否有资格领取；1否；2是',
  `android_version` varchar(20) DEFAULT NULL COMMENT '安卓版本号',
  `ios_version` varchar(20) DEFAULT NULL COMMENT 'ios版本号',
  `slbaoTotalAmt` decimal(20,2) DEFAULT '0.00' COMMENT '生利宝内的总金额',
  `slbaoAccumulatedIncome` decimal(20,2) DEFAULT '0.00' COMMENT '生利宝个人历史累计收益',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_id` (`id`) USING BTREE,
  UNIQUE KEY `index_user_username` (`username`) USING BTREE,
  UNIQUE KEY `index_user_mobilePhone` (`mobilePhone`) USING BTREE,
  KEY `index_user_adminid` (`adminId`) USING BTREE,
  KEY `index_user_vipstatus` (`vipStatus`) USING BTREE,
  KEY `index_user_usablesum` (`usableSum`) USING BTREE,
  KEY `index_user_kefuId` (`kefuId`) USING BTREE,
  KEY `index_user_groupid` (`groupId`) USING BTREE,
  KEY `index_user_ipayAccount` (`ipayAccount`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1223567232 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_userintegraldetail
-- ----------------------------
DROP TABLE IF EXISTS `t_userintegraldetail`;
CREATE TABLE `t_userintegraldetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `intergraltype` varchar(50) DEFAULT NULL COMMENT '积分类型',
  `remark` text COMMENT '备注',
  `changetype` varchar(50) DEFAULT NULL COMMENT '变动类型',
  `changerecore` varchar(50) DEFAULT NULL COMMENT '变动分值',
  `time` datetime DEFAULT NULL COMMENT '操作时间',
  `type` int(11) DEFAULT NULL COMMENT '积分类型（1为信用积分，2为会员积分）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_userInD_id` (`id`) USING BTREE,
  KEY `index_userInD_user` (`userid`) USING BTREE,
  KEY `index_userInD_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1926722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_user_check
-- ----------------------------
DROP TABLE IF EXISTS `t_user_check`;
CREATE TABLE `t_user_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` bigint(20) DEFAULT NULL COMMENT '审核员Id',
  `perrecode` varchar(50) DEFAULT NULL COMMENT '修改前分数',
  `afterrecode` varchar(50) DEFAULT NULL COMMENT '修改后分数',
  `userId` bigint(20) DEFAULT NULL,
  `checkdate` datetime DEFAULT NULL COMMENT '审核确认时间',
  `materialType` int(11) DEFAULT NULL COMMENT '管理员更改类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_usercheck_id` (`id`) USING BTREE,
  KEY `index_usercheck_user` (`userId`) USING BTREE,
  KEY `index_usercheck_admin` (`adminId`) USING BTREE,
  KEY `index_usercheck_date` (`checkdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_user_finance
-- ----------------------------
DROP TABLE IF EXISTS `t_user_finance`;
CREATE TABLE `t_user_finance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) NOT NULL COMMENT '用户编号',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `idNo` varchar(20) DEFAULT NULL COMMENT '身份证号 ',
  `cellPhone` varchar(11) DEFAULT NULL COMMENT '手机号码 ',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态(1 非理财人  2 理财人)',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`userId`),
  UNIQUE KEY `index_userfinance_id` (`id`) USING BTREE,
  KEY `index_userfinance_user` (`userId`) USING BTREE,
  KEY `index_userfinance_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_user_kefu
-- ----------------------------
DROP TABLE IF EXISTS `t_user_kefu`;
CREATE TABLE `t_user_kefu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '客服名称',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `kefuImage` varchar(200) DEFAULT NULL COMMENT '客服头像',
  `QQ` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_userkefu_id` (`id`) USING BTREE,
  KEY `index_userkefu_user` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_user_recorelist
-- ----------------------------
DROP TABLE IF EXISTS `t_user_recorelist`;
CREATE TABLE `t_user_recorelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户动态id',
  `title` varchar(200) DEFAULT NULL COMMENT '记录标题',
  `userId` bigint(20) DEFAULT NULL COMMENT '发布记录id',
  `url` varchar(200) DEFAULT NULL COMMENT '连接到详细查看信息的url',
  `time` datetime DEFAULT NULL COMMENT '插入记录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_recorel_id` (`id`) USING BTREE,
  KEY `index_recorel_user` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1355 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_user_rename
-- ----------------------------
DROP TABLE IF EXISTS `t_user_rename`;
CREATE TABLE `t_user_rename` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `rename` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_sendcode
-- ----------------------------
DROP TABLE IF EXISTS `t_user_sendcode`;
CREATE TABLE `t_user_sendcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `ipArea` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `content` text COMMENT '消息内容',
  `status` int(11) DEFAULT NULL COMMENT '发送状态0：成功，1：失败',
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_voucher
-- ----------------------------
DROP TABLE IF EXISTS `t_user_voucher`;
CREATE TABLE `t_user_voucher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `rewardMoney` decimal(18,2) DEFAULT NULL COMMENT '奖励金额',
  `rewardTime` datetime DEFAULT NULL COMMENT '奖励时间',
  `minMoney` decimal(18,2) DEFAULT NULL COMMENT '投资金额范围：最小金额',
  `maxMoney` decimal(18,2) DEFAULT NULL COMMENT '投资金额范围：最大金额',
  `rbName` varchar(32) DEFAULT NULL COMMENT '代金券名称',
  `passDate` int(12) DEFAULT NULL COMMENT '过期天数',
  `realMoney` decimal(18,2) DEFAULT NULL COMMENT '实际送的代金券金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1269 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utool
-- ----------------------------
DROP TABLE IF EXISTS `t_utool`;
CREATE TABLE `t_utool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isOpen` int(11) DEFAULT NULL COMMENT '是否开启U盾：1为开启，2为关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_vipsum
-- ----------------------------
DROP TABLE IF EXISTS `t_vipsum`;
CREATE TABLE `t_vipsum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `vipFee` int(11) DEFAULT NULL COMMENT 'vip会费支付金额',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_vip_id` (`id`) USING BTREE,
  KEY `index_vip_user` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `t_withdraw`;
CREATE TABLE `t_withdraw` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `cellPhone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `acount` varchar(50) DEFAULT NULL COMMENT '提现帐号',
  `sum` decimal(18,2) DEFAULT NULL COMMENT '提现金额',
  `poundage` decimal(18,2) DEFAULT NULL COMMENT '手续费',
  `applyTime` datetime DEFAULT NULL COMMENT '申请时间',
  `status` int(11) DEFAULT '1' COMMENT '状态(1 默认审核中  2 已提现 3 取消 4转账中 5 失败)\r\n            ',
  `bankId` varchar(50) DEFAULT NULL COMMENT '银行卡ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `checkId` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `checkTime` datetime DEFAULT NULL COMMENT '审核时间',
  `ipAddress` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `versoin` int(11) DEFAULT '0' COMMENT '版本控制',
  `billcode` varchar(40) DEFAULT NULL,
  `trxId` varchar(20) DEFAULT NULL COMMENT '汇付返回唯一流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_withdraw_id` (`id`) USING BTREE,
  KEY `index_withdraw_user` (`userId`) USING BTREE,
  KEY `index_withdraw_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_workauth
-- ----------------------------
DROP TABLE IF EXISTS `t_workauth`;
CREATE TABLE `t_workauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `orgName` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `occStatus` varchar(10) DEFAULT NULL COMMENT '职业状态',
  `workPro` int(11) DEFAULT '-1' COMMENT '工作城市省份(默认-1)',
  `workCity` int(11) DEFAULT '-1' COMMENT '工作城市(默认-1)',
  `companyType` varchar(50) DEFAULT NULL COMMENT '公司类别',
  `companyLine` varchar(50) DEFAULT NULL COMMENT '公司行业',
  `companyScale` varchar(50) DEFAULT NULL COMMENT '公司规模',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  `monthlyIncome` varchar(20) DEFAULT NULL COMMENT '月收入',
  `workYear` varchar(20) DEFAULT NULL COMMENT '现单位工作年限',
  `companyTel` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `workEmail` varchar(50) DEFAULT NULL COMMENT '工作邮箱',
  `companyAddress` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `directedName` varchar(20) DEFAULT NULL COMMENT '直系人姓名 \r\n            ',
  `directedRelation` varchar(20) DEFAULT NULL COMMENT '直系人关系\r\n            ',
  `directedTel` varchar(20) DEFAULT NULL COMMENT '直系人电话\r\n            ',
  `otherName` varchar(20) DEFAULT NULL COMMENT '其他人姓名 \r\n            ',
  `otherRelation` varchar(20) DEFAULT NULL COMMENT '其他人关系\r\n            ',
  `otherTel` varchar(20) DEFAULT NULL COMMENT '其他人电话\r\n            ',
  `moredName` varchar(20) DEFAULT NULL COMMENT '另外人姓名 \r\n            ',
  `moredRelation` varchar(20) DEFAULT NULL COMMENT '另外人关系\r\n            ',
  `moredTel` varchar(20) DEFAULT NULL COMMENT '另外人电话\r\n            ',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id\r\n            ',
  `auditStatus` int(10) DEFAULT '1' COMMENT '认证状态(1 默认审核中或等待审核 2 审核不通过 3 审核通过)',
  `directedStatus` int(11) DEFAULT '1' COMMENT '直系亲属认证1默认等待审核2审核不通过3审核通过',
  `otherStatus` int(11) DEFAULT '1' COMMENT '其他人联系审核状态1默认等待审核2审核不通过3审核通过',
  `moredStatus` int(11) DEFAULT '1' COMMENT '联系审核状态1默认等待审核2审核不通过3审核通过',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_workauth_id` (`id`) USING BTREE,
  KEY `index_workauth_user` (`userId`) USING BTREE,
  KEY `index_workauth_status` (`auditStatus`,`directedStatus`,`otherStatus`,`moredStatus`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_yybg
-- ----------------------------
DROP TABLE IF EXISTS `t_yybg`;
CREATE TABLE `t_yybg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filePath` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `fileName` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `userName` varchar(255) DEFAULT NULL COMMENT '上传人',
  `dateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `imgPath` varchar(255) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户登录日志表',
  `logindate` date DEFAULT NULL COMMENT '用户登录时间',
  `userid` bigint(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `index_userloginid` (`id`) USING BTREE,
  KEY `index_userlogin_date` (`logindate`) USING BTREE,
  KEY `index_userlogin_userid` (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11860 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- View structure for t_bankcard_lists
-- ----------------------------
DROP VIEW IF EXISTS `t_bankcard_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_bankcard_lists` AS select `a`.`id` AS `id`,`a`.`cardUserName` AS `cardUserName`,`a`.`bankName` AS `bankName`,`a`.`branchBankName` AS `branchBankName`,`a`.`cardNo` AS `cardNo`,`a`.`cardMode` AS `cardMode`,`a`.`modifiedCardNo` AS `modifiedCardNo`,`a`.`modifiedBankName` AS `modifiedBankName`,`a`.`modifiedBranchBankName` AS `modifiedBranchBankName`,`a`.`commitTime` AS `commitTime`,`a`.`modifiedTime` AS `modifiedTime`,`a`.`modifiedCardStatus` AS `modifiedCardStatus`,`a`.`cardStatus` AS `cardStatus`,`a`.`checkTime` AS `checkTime`,`a`.`userId` AS `userId`,`a`.`checkUser` AS `checkUser`,`a`.`remark` AS `remark`,`a`.`id` AS `bankId`,`b`.`realName` AS `realName`,`b`.`idNo` AS `idNo`,`b`.`cellPhone` AS `cellPhone`,`d`.`mobilePhone` AS `mobilePhone`,`c`.`username` AS `username` from (((`t_bankcard` `a` left join `t_person` `b` on((`a`.`userId` = `b`.`userId`))) left join `t_user` `c` on((`a`.`userId` = `c`.`id`))) left join `t_phone_binding_info` `d` on((`a`.`userId` = `d`.`userId`))) ;

-- ----------------------------
-- View structure for t_borrow_success_list
-- ----------------------------
DROP VIEW IF EXISTS `t_borrow_success_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_borrow_success_list` AS select `c`.`id` AS `id`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`borrowWay` AS `borrowWay`,`c`.`borrowAmount` AS `borrowAmount`,`c`.`annualRate` AS `annualRate`,`c`.`deadline` AS `deadline`,`c`.`publishTime` AS `publishTime`,`c`.`publisher` AS `publisher`,`c`.`borrowStatus` AS `borrowStatus`,`c`.`paymentMode` AS `paymentMode`,`c`.`isDayThe` AS `isDayThe`,`a`.`borrowId` AS `borrowId`,`c`.`borrowShow` AS `borrowShow`,`c`.`borrowTypeSubId` AS `borrowTypeSubId`,`b`.`name` AS `borrowWayName`,sum((`a`.`stillPrincipal` + `a`.`stillInterest`)) AS `stillTotalSum`,sum(`a`.`hasPI`) AS `hasPI`,sum(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`)) AS `hasSum`,`a`.`hasFI` AS `hasFI`,`c`.`auditTime` AS `auditTime` from ((`t_borrow` `c` left join `t_repayment` `a` on((`c`.`id` = `a`.`borrowId`))) left join `t_borrow_sub_type` `b` on((`c`.`borrowTypeSubId` = `b`.`id`))) group by `c`.`id` ;

-- ----------------------------
-- View structure for t_fundrecord_list
-- ----------------------------
DROP VIEW IF EXISTS `t_fundrecord_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_fundrecord_list` AS select `a`.`id` AS `id`,`a`.`userId` AS `userId`,`a`.`fundMode` AS `fundMode`,`a`.`handleSum` AS `handleSum`,`a`.`usableSum` AS `usableSum`,`a`.`freezeSum` AS `freezeSum`,`a`.`dueinSum` AS `dueinSum`,`a`.`trader` AS `trader`,`a`.`recordTime` AS `recordTime`,`a`.`dueoutSum` AS `dueoutSum`,`b`.`username` AS `username` from (`t_fundrecord` `a` left join `t_user` `b` on((`a`.`trader` = `b`.`id`))) ;

-- ----------------------------
-- View structure for t_success_borrow_details
-- ----------------------------
DROP VIEW IF EXISTS `t_success_borrow_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_success_borrow_details` AS select `c`.`publisher` AS `publisher`,`c`.`borrowTitle` AS `borrowTitle`,`b`.`borrowId` AS `borrowId`,`a`.`investor` AS `investor`,`a`.`realAmount` AS `realAmount`,sum((`b`.`stillInterest` + `b`.`stillPrincipal`)) AS `payTotal`,sum(((`b`.`stillInterest` + `b`.`stillPrincipal`) - `b`.`hasPI`)) AS `remainTotal` from ((`t_invest` `a` left join `t_borrow` `c` on((`c`.`id` = `a`.`borrowId`))) left join `t_repayment` `b` on((`c`.`id` = `b`.`borrowId`))) group by `c`.`id` ;

-- ----------------------------
-- View structure for t_success_paying_all_details
-- ----------------------------
DROP VIEW IF EXISTS `t_success_paying_all_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_success_paying_all_details` AS select `a`.`id` AS `id`,`b`.`id` AS `payId`,`a`.`publisher` AS `publisher`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`publishTime` AS `publishTime`,`b`.`repayPeriod` AS `repayPeriod`,((`b`.`stillInterest` + `b`.`stillPrincipal`) - `b`.`hasPI`) AS `totalPay`,((`b`.`stillInterest` * ((`b`.`stillInterest` + `b`.`stillPrincipal`) - `b`.`hasPI`)) / (`b`.`stillInterest` + `b`.`stillPrincipal`)) AS `rate`,`b`.`lateDay` AS `lateDay`,`b`.`repayStatus` AS `repayStatus`,`b`.`repayDate` AS `repayDate`,`b`.`realRepayDate` AS `realRepayDate`,`b`.`lateFI` AS `lateFI` from (`t_borrow` `a` join `t_repayment` `b` on((`a`.`id` = `b`.`borrowId`))) ;

-- ----------------------------
-- View structure for t_success_paying_details
-- ----------------------------
DROP VIEW IF EXISTS `t_success_paying_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_success_paying_details` AS select `t_repayment`.`id` AS `id`,date_format(`t_repayment`.`repayDate`,'%Y-%m-%d') AS `repayDate`,`t_repayment`.`borrowId` AS `borrowId`,((`t_repayment`.`stillInterest` + `t_repayment`.`stillPrincipal`) - `t_repayment`.`hasPI`) AS `repayTotal`,date_format(`t_repayment`.`realRepayDate`,'%Y-%m-%d') AS `realRepayDate`,`t_repayment`.`lateDay` AS `lateDay`,`t_repayment`.`hasPI` AS `hasPI`,(`t_repayment`.`lateFI` - `t_repayment`.`hasFI`) AS `lateTotal`,((((`t_repayment`.`stillInterest` + `t_repayment`.`stillPrincipal`) - `t_repayment`.`hasPI`) + `t_repayment`.`lateFI`) - `t_repayment`.`hasFI`) AS `total`,`t_repayment`.`repayStatus` AS `repayStatus`,`t_repayment`.`repayPeriod` AS `repayPeriod`,(`t_repayment`.`stillInterest` + `t_repayment`.`stillPrincipal`) AS `forPI`,`t_repayment`.`isLate` AS `isLate` from `t_repayment` ;

-- ----------------------------
-- View structure for t_usercard_lists
-- ----------------------------
DROP VIEW IF EXISTS `t_usercard_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_usercard_lists` AS select `a`.`id` AS `id`,`a`.`cardUserName` AS `cardUserName`,`a`.`bankName` AS `bankName`,`a`.`branchBankName` AS `branchBankName`,`a`.`cardNo` AS `cardNo`,`a`.`cardMode` AS `cardMode`,`a`.`modifiedCardNo` AS `modifiedCardNo`,`a`.`modifiedBankName` AS `modifiedBankName`,`a`.`modifiedBranchBankName` AS `modifiedBranchBankName`,`a`.`commitTime` AS `commitTime`,`a`.`modifiedTime` AS `modifiedTime`,`a`.`cardStatus` AS `cardStatus`,`a`.`checkTime` AS `checkTime`,`a`.`userId` AS `userId`,`a`.`checkUser` AS `checkUser`,`b`.`realName` AS `realName`,`b`.`idNo` AS `idNo`,`b`.`cellPhone` AS `cellPhone`,`d`.`mobilePhone` AS `mobilePhone`,`c`.`username` AS `username` from (((`t_bankcard` `a` left join `t_person` `b` on((`a`.`userId` = `b`.`userId`))) left join `t_user` `c` on((`a`.`userId` = `c`.`id`))) left join `t_phone_binding_info` `d` on((`a`.`userId` = `d`.`userId`))) group by `c`.`username` ;

-- ----------------------------
-- View structure for t_user_person_info
-- ----------------------------
DROP VIEW IF EXISTS `t_user_person_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_user_person_info` AS select `a`.`id` AS `userId`,`a`.`username` AS `uername`,`b`.`realName` AS `realName` from (`t_user` `a` left join `t_person` `b` on((`a`.`id` = `b`.`userId`))) ;

-- ----------------------------
-- View structure for t_user_withdraw_info
-- ----------------------------
DROP VIEW IF EXISTS `t_user_withdraw_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `t_user_withdraw_info` AS select `a`.`userId` AS `userId`,`a`.`realName` AS `realName`,`a`.`cellPhone` AS `cellPhone`,`b`.`mobilePhone` AS `bindingPhone`,`b`.`status` AS `status`,`d`.`handleSum` AS `handleSum`,`d`.`usableSum` AS `usableSum`,`d`.`freezeSum` AS `freezeSum` from ((`t_person` `a` left join `t_phone_binding_info` `b` on((`a`.`userId` = `b`.`userId`))) left join `t_fundrecord` `d` on((`a`.`userId` = `d`.`userId`))) ;

-- ----------------------------
-- View structure for v_admin_assignment_debt_borrow
-- ----------------------------
DROP VIEW IF EXISTS `v_admin_assignment_debt_borrow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_admin_assignment_debt_borrow` AS select `t_assignment_debt`.`id` AS `id`,`t_assignment_debt`.`debtSum` AS `debtSum`,`t_assignment_debt`.`auctionBasePrice` AS `auctionBasePrice`,`t_invest`.`realAmount` AS `realAmount`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_assignment_debt`.`publishTime` AS `publishTime`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_user`.`username` AS `alienatorName`,`t_user`.`vipStatus` AS `vipStatus`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`id` AS `borrowId`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`annualRate` AS `annualRate`,`borrower`.`username` AS `borrowerName`,`auctioner`.`username` AS `auctionerName`,`t_assignment_debt`.`auctionEndTime` AS `auctionEndTime`,(`t_assignment_debt`.`publishTime` + interval `t_assignment_debt`.`auctionDays` day) AS `remainAuctionTime`,`t_assignment_debt`.`auctionHighPrice` AS `auctionHighPrice` from (((((`t_assignment_debt` left join `t_invest` on((`t_assignment_debt`.`investId` = `t_invest`.`id`))) left join `t_user` on((`t_assignment_debt`.`alienatorId` = `t_user`.`id`))) left join `t_borrow` on((`t_assignment_debt`.`borrowId` = `t_borrow`.`id`))) left join `t_user` `borrower` on((`t_borrow`.`publisher` = `borrower`.`id`))) left join `t_user` `auctioner` on((`auctioner`.`id` = `t_assignment_debt`.`auctionerId`))) ;

-- ----------------------------
-- View structure for v_blacklist_list
-- ----------------------------
DROP VIEW IF EXISTS `v_blacklist_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_blacklist_list` AS select `u`.`username` AS `username`,`u`.`id` AS `id`,`u`.`creditrating` AS `creditrating`,`u`.`rating` AS `rating`,`u`.`enable` AS `enable`,`p`.`idNo` AS `idNo`,`p`.`auditStatus` AS `p_auditStatus`,`w`.`auditStatus` AS `w_auditStatus`,`w`.`directedStatus` AS `directedStatus`,`w`.`otherStatus` AS `otherStatus`,`w`.`moredStatus` AS `moredStatus`,`b`.`cardStatus` AS `cardStatus` from (((`t_user` `u` left join `t_person` `p` on((`u`.`id` = `p`.`userId`))) left join `t_workauth` `w` on((`w`.`userId` = `u`.`id`))) left join `t_bankcard` `b` on((`b`.`userId` = `u`.`id`))) ;

-- ----------------------------
-- View structure for v_borrow
-- ----------------------------
DROP VIEW IF EXISTS `v_borrow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_borrow` AS select `t_borrow`.`id` AS `id`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`imgPath` AS `imgPath`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`hetong` AS `hetong`,`t_borrow`.`borrowInfo` AS `borrowInfo`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_borrow`.`borrowAmount` AS `borrowAmount`,`t_borrow`.`annualRate` AS `annualRate`,`t_borrow`.`minTenderedSum` AS `minTenderedSum`,`t_borrow`.`maxTenderedSum` AS `maxTenderedSum`,`t_borrow`.`raiseTerm` AS `raiseTerm`,`t_borrow`.`detail` AS `detail`,`t_borrow`.`tradeType` AS `tradeType`,`t_borrow`.`publisher` AS `publisher`,`t_borrow`.`excitationType` AS `excitationType`,`t_borrow`.`visitors` AS `visitors`,`t_borrow`.`remainTimeStart` AS `remainTimeStart`,`t_borrow`.`auditOpinion` AS `auditOpinion`,`t_borrow`.`borrowStatus` AS `borrowStatus`,`t_borrow`.`excitationSum` AS `excitationSum`,`t_borrow`.`excitationMode` AS `excitationMode`,`t_borrow`.`hasInvestAmount` AS `hasInvestAmount`,`t_borrow`.`investNum` AS `investNum`,`t_borrow`.`purpose` AS `purpose`,`t_borrow`.`hasPWD` AS `hasPWD`,`t_borrow`.`investPWD` AS `investPWD`,`t_borrow`.`publishTime` AS `publishTime`,`t_borrow`.`publishIP` AS `publishIP`,`t_borrow`.`remainTimeEnd` AS `remainTimeEnd`,`t_borrow`.`auditTime` AS `auditTime`,`t_borrow`.`hasDeadline` AS `hasDeadline`,`t_borrow`.`isAutoBid` AS `isAutoBid`,`t_borrow`.`manageFee` AS `manageFee`,`t_borrow`.`isDayThe` AS `isDayThe`,`t_borrow`.`autoBidEnableTime` AS `autoBidEnableTime`,`t_borrow`.`version` AS `version`,`t_borrow`.`frozen_margin` AS `frozen_margin`,`t_borrow`.`smallestFlowUnit` AS `smallestFlowUnit`,`t_borrow`.`circulationNumber` AS `circulationNumber`,`t_borrow`.`hasCirculationNumber` AS `hasCirculationNumber`,`t_borrow`.`nid_log` AS `nid_log`,`t_borrow`.`sort` AS `sort`,`t_borrow`.`feestate` AS `feestate`,`t_borrow`.`feelog` AS `feelog`,`t_borrow`.`businessDetail` AS `businessDetail`,`t_borrow`.`assets` AS `assets`,`t_borrow`.`moneyPurposes` AS `moneyPurposes`,`t_borrow`.`circulationMode` AS `circulationMode`,`t_borrow`.`circulationStatus` AS `circulationStatus`,`t_borrow`.`undertaker` AS `undertaker`,`t_borrow`.`borrowShow` AS `borrowShow`,`t_borrow`.`hasRepoNumber` AS `hasRepoNumber`,`t_borrow`.`agent` AS `agent`,`t_borrow`.`counterAgent` AS `counterAgent`,`t_borrow`.`amount_scale` AS `amount_scale`,`t_borrow`.`borrowType` AS `borrowType`,`t_borrow`.`publisherWay` AS `publisherWay`,`t_borrow`.`authCount` AS `authCount`,`t_borrow`.`billcode` AS `billcode`,`t_borrow`.`trxId` AS `trxId`,`t_borrow`.`loansOk` AS `loansOk`,`t_borrow`.`unfreeOk` AS `unfreeOk`,`t_borrow`.`borrowTypeSubId` AS `borrowTypeSubId`,`t_borrow`.`projectScore` AS `projectScore`,`t_borrow`.`retsource` AS `retsource`,`t_borrow`.`batch_id` AS `batch_id`,`t_borrow`.`contract_id` AS `contract_id`,`t_borrow`.`isShow` AS `isShow`,`t_borrow`.`projectIntro` AS `projectIntro`,`t_borrow`.`safeMeasures` AS `safeMeasures`,`t_borrow`.`bidTime` AS `bidTime`,`t_borrow`.`showRate` AS `showRate`,`t_borrow`.`projectAddress` AS `projectAddress`,`t_borrow`.`behalfUserId` AS `behalfUserId`,`t_borrow`.`loanUserId` AS `loanUserId`,`t_borrow`.`groupid` AS `groupid`,`t_borrow`.`loan2UserId` AS `loan2UserId`,`t_borrow`.`pushdate` AS `pushdate`,`t_borrow`.`pushstate` AS `pushstate`,`t_borrow`.`recommend` AS `recommend` from `t_borrow` ;

-- ----------------------------
-- View structure for v_borrow_hetong_list
-- ----------------------------
DROP VIEW IF EXISTS `v_borrow_hetong_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_borrow_hetong_list` AS select `ti`.`id` AS `id`,`ti`.`investor` AS `investor`,`ti`.`borrowId` AS `borrowId`,`ti`.`investTime` AS `investTime`,`ti`.`investAmount` AS `investAmount`,`tp1`.`realName` AS `investName`,`tb`.`publisher` AS `publisher`,(case when (`tu2`.`busiCode` is not null) then `tu2`.`username` else `tp2`.`realName` end) AS `publishName`,`tb`.`borrowTitle` AS `borrowTitle`,`ti`.`viewpdf_url` AS `viewpdf_url`,`ti`.`download_url` AS `download_url` from ((((`t_invest` `ti` join `t_borrow` `tb`) join `t_person` `tp1`) join `t_user` `tu2`) join `t_person` `tp2`) where ((`ti`.`borrowId` = `tb`.`id`) and (`ti`.`investor` = `tp1`.`userId`) and (`tb`.`publisher` = `tu2`.`id`) and (`tb`.`publisher` = `tp2`.`userId`)) ;

-- ----------------------------
-- View structure for v_cash_reconciliation_user
-- ----------------------------
DROP VIEW IF EXISTS `v_cash_reconciliation_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_cash_reconciliation_user` AS select `tcr`.`OrdId` AS `OrdId`,`tcr`.`MerCustId` AS `MerCustId`,`tcr`.`UsrCustId` AS `UsrCustId`,`tcr`.`CardId` AS `CardId`,`tcr`.`TransAmt` AS `TransAmt`,`tcr`.`TransStat` AS `TransStat`,`tcr`.`PnrDate` AS `PnrDate`,`tcr`.`PnrSeqId` AS `PnrSeqId`,`tcr`.`FeeAmt` AS `FeeAmt`,`tcr`.`FeeObj` AS `FeeObj`,`t`.`username` AS `username`,`tcr`.`InDate` AS `InDate` from (`t_cash_reconciliation` `tcr` join `t_user` `t`) where (`tcr`.`UsrCustId` = `t`.`ipayAccount`) ;

-- ----------------------------
-- View structure for v_debt_aucting_borrow
-- ----------------------------
DROP VIEW IF EXISTS `v_debt_aucting_borrow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_debt_aucting_borrow` AS select `t_auction_debt`.`userId` AS `userId`,`t_auction_debt`.`debtId` AS `debtId`,`t_auction_debt`.`auctionTime` AS `auctionTime`,`t_auction_debt`.`auctionPrice` AS `auctionPrice`,`t_assignment_debt`.`alienatorId` AS `alienatorId`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_assignment_debt`.`debtSum` AS `debtSum`,`t_assignment_debt`.`auctionHighPrice` AS `auctionHighPrice`,`t_assignment_debt`.`auctionBasePrice` AS `auctionBasePrice`,`alienator`.`username` AS `username`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_user`.`username` AS `borrowerName`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_borrow`.`annualRate` AS `annualRate`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`borrowAmount` AS `borrowAmount`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`id` AS `borrowId`,(select count(1) AS `count(1)` from `t_auction_debt` `t_a` where ((`t_a`.`debtId` = `t_auction_debt`.`debtId`) and (`t_a`.`userId` = `t_auction_debt`.`userId`))) AS `auctionCount`,(`t_assignment_debt`.`publishTime` + interval `t_assignment_debt`.`auctionDays` day) AS `remainAuctionTime` from ((((`t_auction_debt` left join `t_assignment_debt` on((`t_auction_debt`.`debtId` = `t_assignment_debt`.`id`))) left join `t_borrow` on((`t_assignment_debt`.`borrowId` = `t_borrow`.`id`))) left join `t_user` on((`t_borrow`.`publisher` = `t_user`.`id`))) left join `t_user` `alienator` on((`t_assignment_debt`.`alienatorId` = `alienator`.`id`))) ;

-- ----------------------------
-- View structure for v_debt_invest
-- ----------------------------
DROP VIEW IF EXISTS `v_debt_invest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_debt_invest` AS select `t_repayment`.`repayDate` AS `repayDate`,`t_repayment`.`realRepayDate` AS `realRepayDate`,round((`t_repayment`.`hasFI` * (`t_invest`.`investAmount` / `t_borrow`.`borrowAmount`)),2) AS `hasFI`,round((`t_repayment`.`investorForpayFI` * (`t_invest`.`investAmount` / `t_borrow`.`borrowAmount`)),2) AS `investorForpayFI`,round((`t_repayment`.`investorHaspayFI` * (`t_invest`.`investAmount` / `t_borrow`.`borrowAmount`)),2) AS `investorHaspayFI`,round((`t_repayment`.`hasPI` * (`t_invest`.`investAmount` / `t_borrow`.`borrowAmount`)),2) AS `hasPI`,`t_repayment`.`borrowId` AS `borrowId`,`t_invest`.`investor` AS `investor`,`t_invest`.`id` AS `investId`,round(((`t_repayment`.`stillPrincipal` + `t_repayment`.`stillInterest`) * (`t_invest`.`investAmount` / `t_borrow`.`borrowAmount`)),2) AS `stillPI` from ((`t_repayment` left join `t_borrow` on((`t_borrow`.`id` = `t_repayment`.`borrowId`))) left join `t_invest` on((`t_invest`.`borrowId` = `t_repayment`.`borrowId`))) where isnull(`t_repayment`.`realRepayDate`) ;

-- ----------------------------
-- View structure for v_has_invest
-- ----------------------------
DROP VIEW IF EXISTS `v_has_invest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_has_invest` AS select `t`.`id` AS `id`,`t`.`borrowId` AS `borrowId`,`tb`.`borrowTitle` AS `borrowTitle`,`tb`.`borrowAmount` AS `borrowAmount`,`t`.`investAmount` AS `investAmount`,`tu`.`username` AS `username`,`tb`.`annualRate` AS `annualRate`,`t`.`isAutoBid` AS `isAutoBid`,`t`.`billcode` AS `billcode`,`t`.`investTime` AS `investTime` from ((`t_borrow` `tb` join `t_invest` `t`) join `t_user` `tu`) where ((`tb`.`id` = `t`.`borrowId`) and (`tb`.`borrowStatus` in (4,5)) and (`t`.`investor` = `tu`.`id`)) ;

-- ----------------------------
-- View structure for v_invest
-- ----------------------------
DROP VIEW IF EXISTS `v_invest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_invest` AS select `t_invest`.`id` AS `id`,`t_invest`.`investAmount` AS `investAmount`,`t_invest`.`monthRate` AS `monthRate`,`t_invest`.`investor` AS `investor`,`t_invest`.`borrowId` AS `borrowId`,`t_invest`.`investTime` AS `investTime`,`t_invest`.`oriInvestor` AS `oriInvestor`,`t_invest`.`realAmount` AS `realAmount`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`borrowAmount` AS `borrowAmount`,`t_borrow`.`borrowStatus` AS `borrowStatus` from (`t_invest` join `t_borrow` on((`t_invest`.`borrowId` = `t_borrow`.`id`))) ;

-- ----------------------------
-- View structure for v_investor_message
-- ----------------------------
DROP VIEW IF EXISTS `v_investor_message`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_investor_message` AS select `e`.`investTime` AS `investTime`,`a`.`IpArea` AS `area`,left(`a`.`IpArea`,2) AS `IpArea`,`b`.`idNo` AS `idNo`,(date_format(now(),'%Y') - date_format(concat(right(left(`b`.`idNo`,10),4),'-',right(left(`b`.`idNo`,12),2),'-',right(left(`b`.`idNo`,14),2)),'%Y')) AS `age` from ((`t_user` `a` left join `t_person` `b` on((`a`.`id` = `b`.`userId`))) left join `t_invest` `e` on((`a`.`id` = `e`.`investor`))) group by `e`.`investor` ;

-- ----------------------------
-- View structure for v_pay_repayment
-- ----------------------------
DROP VIEW IF EXISTS `v_pay_repayment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_pay_repayment` AS select `tu`.`id` AS `id`,`tu`.`ipayAccount` AS `ipayAccount`,`tir`.`recivedPrincipal` AS `recivedPrincipal`,`tir`.`recivedInterest` AS `recivedInterest`,`tir`.`owner` AS `investorId`,`tir`.`invest_id` AS `invest_id`,`tir`.`id` AS `repaymentId`,`tu`.`password` AS `password`,`tu`.`username` AS `username`,`tb`.`id` AS `borrowId`,`tb`.`borrowTitle` AS `borrowTitle` from ((`t_user` `tu` join `t_borrow` `tb`) join `t_invest_repayment` `tir`) where ((`tu`.`id` = `tb`.`publisher`) and (`tb`.`id` = `tir`.`borrow_id`) and (`tir`.`repayStatus` = 1)) ;

-- ----------------------------
-- View structure for v_pr_user
-- ----------------------------
DROP VIEW IF EXISTS `v_pr_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_pr_user` AS select count(0) AS `counts`,sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `investor` from (`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where (`b`.`borrowStatus` in (4,5)) group by `a`.`investor` ;

-- ----------------------------
-- View structure for v_query_reconciliation
-- ----------------------------
DROP VIEW IF EXISTS `v_query_reconciliation`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_query_reconciliation` AS select `a`.`id` AS `id`,`a`.`ordId` AS `ordId`,`b`.`username` AS `merCustId`,`c`.`username` AS `investCustId`,`d`.`username` AS `borrCustId`,`a`.`transAmt` AS `transAmt`,`a`.`transStat` AS `transStat`,`a`.`pnrDate` AS `pnrDate`,`a`.`pnrSeqId` AS `pnrSeqId`,`a`.`queryTransType` AS `queryTransType`,`a`.`ordDate` AS `ordDate` from (((`t_release_also_reconciliation` `a` left join `t_user` `b` on((`a`.`merCustId` = `b`.`ipayAccount`))) left join `t_user` `c` on((`a`.`investCustId` = `c`.`ipayAccount`))) left join `t_user` `d` on((`a`.`borrCustId` = `d`.`ipayAccount`))) ;

-- ----------------------------
-- View structure for v_save_reconciliation_user
-- ----------------------------
DROP VIEW IF EXISTS `v_save_reconciliation_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_save_reconciliation_user` AS select `tsr`.`OrdId` AS `OrdId`,`tsr`.`MerCustId` AS `MerCustId`,`tsr`.`UsrCustId` AS `UsrCustId`,`tsr`.`OrdDate` AS `OrdDate`,`tsr`.`TransAmt` AS `TransAmt`,`tsr`.`TransStat` AS `TransStat`,`tsr`.`GateBusiId` AS `GateBusiId`,`tcgb`.`busiName` AS `busiName`,`tsr`.`OpenBankId` AS `OpenBankId`,`tcb`.`bankName` AS `bankName`,`tsr`.`OpenAcctId` AS `OpenAcctId`,`tsr`.`FeeAmt` AS `FeeAmt`,`t`.`username` AS `username`,`tsr`.`InDate` AS `InDate` from (((`t_save_reconciliation` `tsr` left join `t_user` `t` on((`tsr`.`UsrCustId` = `t`.`ipayAccount`))) left join `t_csc_bankcode` `tcb` on((`tsr`.`OpenBankId` = `tcb`.`bankCode`))) left join `t_csc_gate_busi` `tcgb` on((`tsr`.`GateBusiId` = `tcgb`.`busiCode`))) ;

-- ----------------------------
-- View structure for v_trf_reconciliation_user
-- ----------------------------
DROP VIEW IF EXISTS `v_trf_reconciliation_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_trf_reconciliation_user` AS select `ttr`.`OrdId` AS `OrdId`,`ttr`.`InDate` AS `InDate`,`ttr`.`MerCustId` AS `MerCustId`,`ttr`.`UsrCustId` AS `UsrCustId`,`ttr`.`BorrCustId` AS `BorrCustId`,`ttr`.`TransAmt` AS `TransAmt`,`ttr`.`TransStat` AS `TransStat`,`ttr`.`PnrDate` AS `PnrDate`,`ttr`.`PnrSeqId` AS `PnrSeqId`,`t`.`username` AS `username` from (`t_trf_reconciliation` `ttr` join `t_user` `t`) where (`ttr`.`UsrCustId` = `t`.`ipayAccount`) ;

-- ----------------------------
-- View structure for v_tyj_reconciliation_user
-- ----------------------------
DROP VIEW IF EXISTS `v_tyj_reconciliation_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_tyj_reconciliation_user` AS select `ttr`.`orId` AS `orId`,`ttr`.`stillInterest` AS `stillInterest`,`ttr`.`repayDate` AS `repayDate`,`ttr`.`stillPrincipal` AS `stillPrincipal`,`t`.`username` AS `username` from (`t_exgo_repayment` `ttr` join `t_user` `t`) where (`ttr`.`borrowId` = `t`.`id`) ;

-- ----------------------------
-- View structure for v_t_admin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_admin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_admin` AS select `ta`.`id` AS `id`,`ta`.`enable` AS `enable`,`ta`.`lastIP` AS `lastIP`,`ta`.`lastTime` AS `lastTime`,`ta`.`password` AS `password`,`ta`.`roleId` AS `roleId`,`ta`.`userName` AS `userName`,`tr`.`name` AS `roleName` from (`t_admin` `ta` left join `t_role` `tr` on((`ta`.`roleId` = `tr`.`id`))) ;

-- ----------------------------
-- View structure for v_t_admin_credit_msg
-- ----------------------------
DROP VIEW IF EXISTS `v_t_admin_credit_msg`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_admin_credit_msg` AS select `te`.`companyName` AS `companyName`,`te`.`userId` AS `id`,`tm1`.`auditStatus` AS `auditStatus1`,`tm2`.`auditStatus` AS `auditStatus2`,`tm3`.`auditStatus` AS `auditStatus3`,`tm4`.`auditStatus` AS `auditStatus4`,`tm5`.`auditStatus` AS `auditStatus5`,`tm6`.`auditStatus` AS `auditStatus6` from ((((((`t_enterprise` `te` left join `t_materialsauth` `tm1` on(((`te`.`userId` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 17)))) left join `t_materialsauth` `tm2` on(((`te`.`userId` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 18)))) left join `t_materialsauth` `tm3` on(((`te`.`userId` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 19)))) left join `t_materialsauth` `tm4` on(((`te`.`userId` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 20)))) left join `t_materialsauth` `tm5` on(((`te`.`userId` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 21)))) left join `t_materialsauth` `tm6` on(((`te`.`userId` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 22)))) ;

-- ----------------------------
-- View structure for v_t_amount_record
-- ----------------------------
DROP VIEW IF EXISTS `v_t_amount_record`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_amount_record` AS select `a`.`id` AS `id`,(`a`.`usableSum` + `a`.`freezeSum`) AS `totalSum`,`a`.`usableSum` AS `usableSum`,`a`.`freezeSum` AS `freezeSum`,ifnull(sum((((`b`.`recivedPrincipal` + `b`.`recievedInterest`) - `b`.`hasPrincipal`) - `b`.`hasInterest`)),0) AS `forPI` from (`t_user` `a` left join `t_invest` `b` on((`a`.`id` = `b`.`investor`))) group by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_assignment_debt_audit
-- ----------------------------
DROP VIEW IF EXISTS `v_t_assignment_debt_audit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_assignment_debt_audit` AS select `t_assignment_debt`.`id` AS `id`,`t_assignment_debt`.`borrowId` AS `borrowId`,`t_assignment_debt`.`debtSum` AS `debtSum`,`t_assignment_debt`.`auctionBasePrice` AS `auctionBasePrice`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_user`.`username` AS `borrowerName`,`alinator`.`username` AS `alienatorName`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`annualRate` AS `annualRate`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_borrow`.`borrowWay` AS `borrowWay`,(case when ((select count(1) AS `count(1)` from `t_repayment` where ((`t_repayment`.`borrowId` = `t_assignment_debt`.`borrowId`) and (`t_repayment`.`isLate` = 2))) > 0) then 2 else 1 end) AS `isLate`,(select min(`t_repayment`.`repayDate`) AS `min(``t_repayment``.``repayDate``)` from `t_repayment` where ((`t_repayment`.`borrowId` = `t_assignment_debt`.`borrowId`) and isnull(`t_repayment`.`realRepayDate`))) AS `repayDate`,`d`.`id` AS `borrowTypeSubId`,`d`.`name` AS `borrowWayName` from ((((`t_assignment_debt` left join `t_borrow` on((`t_assignment_debt`.`borrowId` = `t_borrow`.`id`))) left join `t_user` on((`t_borrow`.`publisher` = `t_user`.`id`))) left join `t_user` `alinator` on((`t_assignment_debt`.`alienatorId` = `alinator`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `t_borrow`.`borrowTypeSubId`))) ;

-- ----------------------------
-- View structure for v_t_assignment_debt_success
-- ----------------------------
DROP VIEW IF EXISTS `v_t_assignment_debt_success`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_assignment_debt_success` AS select `t_assignment_debt`.`id` AS `id`,`t_assignment_debt`.`debtSum` AS `debtSum`,`t_assignment_debt`.`auctionBasePrice` AS `auctionBasePrice`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_assignment_debt`.`auctionerId` AS `auctionerId`,date_format(`t_assignment_debt`.`auctionEndTime`,'%Y-%m-%d %H:%i:%s') AS `auctionEndTime`,`t_assignment_debt`.`auctionHighPrice` AS `auctionHighPrice`,`t_assignment_debt`.`viewpdf_url` AS `viewpdf_url`,`t_assignment_debt`.`download_url` AS `download_url`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_user`.`username` AS `borrowerName`,`alineator`.`username` AS `username`,`t_assignment_debt`.`alienatorId` AS `alienatorId`,`t_borrow`.`annualRate` AS `annualRate`,`auctioner`.`username` AS `auctionerName`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_borrow`.`borrowAmount` AS `borrowAmount`,`t_assignment_debt`.`borrowId` AS `borrowId`,date_format(`t_assignment_debt`.`buyTime`,'%Y-%m-%d %H:%i:%s') AS `buyTime` from ((((`t_assignment_debt` left join `t_borrow` on((`t_assignment_debt`.`borrowId` = `t_borrow`.`id`))) left join `t_user` on((`t_borrow`.`publisher` = `t_user`.`id`))) left join `t_user` `alineator` on((`t_assignment_debt`.`alienatorId` = `alineator`.`id`))) left join `t_user` `auctioner` on((`t_assignment_debt`.`auctionerId` = `auctioner`.`id`))) where (`t_assignment_debt`.`debtStatus` = 3) ;

-- ----------------------------
-- View structure for v_t_assignment_debt_username
-- ----------------------------
DROP VIEW IF EXISTS `v_t_assignment_debt_username`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_assignment_debt_username` AS select `a`.`id` AS `id`,`a`.`debtSum` AS `debtSum`,`a`.`debtStatus` AS `debtStatus`,`a`.`borrowId` AS `borrowId`,`a`.`alienatorId` AS `alienatorId`,`b`.`idNo` AS `idNo`,`b`.`realName` AS `realName`,`c`.`username` AS `username`,`c`.`id` AS `cid`,`f`.`id` AS `fid`,`d`.`idNo` AS `dbisno`,`d`.`realName` AS `dbrealName`,`f`.`username` AS `dbusername`,`a`.`auctionerId` AS `dbauctionerId`,`a`.`investId` AS `investId`,`a`.`auctionEndTime` AS `auctionEndTime`,`a`.`debtLimit` AS `debtLimit`,`a`.`auctionHighPrice` AS `auctionHighPrice`,`a`.`manageFee` AS `manageFee` from ((((`t_assignment_debt` `a` left join `t_person` `b` on((`a`.`alienatorId` = `b`.`userId`))) left join `t_user` `c` on((`a`.`alienatorId` = `c`.`id`))) left join `t_person` `d` on((`a`.`auctionerId` = `d`.`userId`))) left join `t_user` `f` on((`a`.`auctionerId` = `f`.`id`))) where (`a`.`debtStatus` = 3) ;

-- ----------------------------
-- View structure for v_t_auction_assignmentdebt
-- ----------------------------
DROP VIEW IF EXISTS `v_t_auction_assignmentdebt`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_auction_assignmentdebt` AS select `t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`id` AS `borrowId`,`t_borrow`.`annualRate` AS `annualRate`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`borrowAmount` AS `borrowAmount`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_user`.`username` AS `borrowerName`,date_format(`t_assignment_debt`.`auctionEndTime`,'%Y-%m-%d %H:%i:%s') AS `auctionEndTime`,`t_invest`.`realAmount` AS `realAmount`,`t_assignment_debt`.`debtSum` AS `debtSum`,`t_assignment_debt`.`id` AS `debtId`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_assignment_debt`.`alienatorId` AS `alienatorId`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_assignment_debt`.`auctionDays` AS `auctionDays`,`t_assignment_debt`.`auctionBasePrice` AS `auctionBasePrice`,`t_assignment_debt`.`auctionHighPrice` AS `auctionHighPrice`,`t_assignment_debt`.`viewpdf_url` AS `viewpdf_url`,`t_assignment_debt`.`viewpdf_url` AS `download_url`,`auctioner`.`username` AS `auctionName`,date_format((`t_assignment_debt`.`publishTime` + interval `t_assignment_debt`.`auctionDays` day),'%Y-%m-%d %H:%i:%s') AS `remainAuctionTime`,`t_invest`.`investor` AS `investor` from ((((`t_assignment_debt` left join `t_borrow` on((`t_assignment_debt`.`borrowId` = `t_borrow`.`id`))) left join `t_user` on((`t_borrow`.`publisher` = `t_user`.`id`))) left join `t_invest` on((`t_invest`.`id` = `t_assignment_debt`.`investId`))) left join `t_user` `auctioner` on((`t_assignment_debt`.`auctionerId` = `auctioner`.`id`))) ;

-- ----------------------------
-- View structure for v_t_auction_debt_user
-- ----------------------------
DROP VIEW IF EXISTS `v_t_auction_debt_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_auction_debt_user` AS select `t_auction_debt`.`id` AS `id`,`t_auction_debt`.`debtId` AS `debtId`,date_format(`t_auction_debt`.`auctionTime`,'%Y-%m-%d %T') AS `auctionTime`,`t_auction_debt`.`auctionPrice` AS `auctionPrice`,`t_user`.`username` AS `username`,`t_auction_debt`.`userId` AS `userId` from (`t_auction_debt` left join `t_user` on((`t_auction_debt`.`userId` = `t_user`.`id`))) ;

-- ----------------------------
-- View structure for v_t_autobid_borrow
-- ----------------------------
DROP VIEW IF EXISTS `v_t_autobid_borrow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_autobid_borrow` AS select `a`.`id` AS `id`,`a`.`deadline` AS `deadline`,`a`.`annualRate` AS `annualRate`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`hasInvestAmount` AS `hasInvestAmount`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`a`.`borrowWay` AS `borrowWay`,`a`.`isDayThe` AS `isDayThe`,`a`.`autoBidEnableTime` AS `autoBidEnableTime`,(`a`.`borrowAmount` - `a`.`hasInvestAmount`) AS `remainamount`,`a`.`publisher` AS `publisher`,`a`.`borrowTitle` AS `borrowTitle` from ((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_borrow_type_log` `c` on((`a`.`nid_log` = `c`.`identifier`))) where ((`c`.`subscribe_status` = 2) and (round((`a`.`hasInvestAmount` / `a`.`borrowAmount`),2) < 0.95) and (`a`.`borrowWay` <> 2) and (`a`.`borrowStatus` = 2) and (`a`.`autoBidEnableTime` is not null) and (`a`.`borrowWay` <> 6) and (isnull(`a`.`investPWD`) = 1)) order by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_award_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_detail` AS select `a`.`id` AS `id`,`c`.`username` AS `username`,`d`.`realName` AS `level2realName`,`d`.`userName` AS `level2userName`,`f`.`realName` AS `level1realName`,`f`.`userName` AS `level1userName`,`a`.`level2money` AS `level2money`,`a`.`level1money` AS `level1money`,`a`.`level1userId` AS `level1userId`,`a`.`level2userId` AS `level2userId`,`a`.`level` AS `level`,`a`.`iorId` AS `iorId`,`a`.`iorType` AS `iorType` from ((((`t_award` `a` left join `t_invest` `b` on((`a`.`iorId` = `b`.`id`))) left join `t_user` `c` on((`a`.`userId` = `c`.`id`))) left join `t_admin` `d` on((`a`.`level2userId` = `d`.`id`))) left join `t_admin` `f` on((`a`.`level1userId` = `f`.`id`))) where ((`a`.`level1money` > 0) and (`a`.`iorType` = 1)) union all select `a`.`id` AS `id`,`c`.`username` AS `username`,`d`.`realName` AS `level2realName`,`d`.`userName` AS `level2userName`,`f`.`realName` AS `level1realName`,`f`.`userName` AS `level1userName`,`a`.`level2money` AS `level2money`,`a`.`level1money` AS `level1money`,`a`.`level1userId` AS `level1userId`,`a`.`level2userId` AS `level2userId`,`a`.`level` AS `level`,`a`.`iorId` AS `iorId`,`a`.`iorType` AS `iorType` from ((((`t_award` `a` left join `t_invest` `b` on((`a`.`iorId` = `b`.`id`))) left join `t_user` `c` on((`a`.`userId` = `c`.`id`))) left join `t_admin` `d` on((`a`.`level2userId` = `d`.`id`))) left join `t_admin` `f` on((`a`.`level1userId` = `f`.`id`))) where ((`a`.`level1money` > 0) and (`a`.`iorType` = 2)) ;

-- ----------------------------
-- View structure for v_t_award_ior_info
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_ior_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_ior_info` AS select `a`.`id` AS `id`,`a`.`level2money` AS `level2money`,`a`.`userId` AS `userId`,`a`.`level2userId` AS `level2userId`,`d`.`username` AS `userName`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`borrowWay` AS `borrowWay`,`c`.`borrowAmount` AS `borrowAmount`,`c`.`annualRate` AS `annualRate`,`c`.`raiseTerm` AS `raiseTerm`,`c`.`publishTime` AS `publishTime`,`c`.`deadline` AS `deadline`,`b`.`investAmount` AS `investAmount`,`b`.`investTime` AS `investTime` from (((`t_award` `a` join `t_invest` `b` on(((`a`.`iorId` = `b`.`id`) and (`a`.`iorType` = 1)))) left join `t_borrow` `c` on((`b`.`borrowId` = `c`.`id`))) left join `t_user` `d` on((`c`.`publisher` = `d`.`id`))) ;

-- ----------------------------
-- View structure for v_t_award_ior_repayinfo
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_ior_repayinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_ior_repayinfo` AS select `a`.`id` AS `id`,`a`.`level2money` AS `level2money`,`a`.`userId` AS `userId`,`a`.`level2userId` AS `level2userId`,`d`.`username` AS `userName`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`borrowWay` AS `borrowWay`,`c`.`borrowAmount` AS `borrowAmount`,`c`.`annualRate` AS `annualRate`,`c`.`raiseTerm` AS `raiseTerm`,`c`.`publishTime` AS `publishTime`,`c`.`deadline` AS `deadline` from (((`t_award` `a` join `t_repayment` `b` on(((`a`.`iorId` = `b`.`id`) and (`a`.`iorType` = 2)))) left join `t_borrow` `c` on((`b`.`borrowId` = `c`.`id`))) left join `t_user` `d` on((`c`.`publisher` = `d`.`id`))) ;

-- ----------------------------
-- View structure for v_t_award_leve1
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_leve1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_leve1` AS select `b`.`id` AS `id`,`b`.`userName` AS `userName`,sum(`a`.`level1money`) AS `level1money`,`b`.`realName` AS `realName`,`b`.`card` AS `card` from (`t_award` `a` left join `t_admin` `b` on((`a`.`level1userId` = `b`.`id`))) group by `b`.`id` ;

-- ----------------------------
-- View structure for v_t_award_leve2_sum_money
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_leve2_sum_money`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_leve2_sum_money` AS select `b`.`id` AS `id`,`b`.`userName` AS `userName`,sum(`a`.`level2money`) AS `level2money`,`b`.`realName` AS `realName`,`b`.`card` AS `card` from (`t_award` `a` left join `t_admin` `b` on((`a`.`level2userId` = `b`.`id`))) group by `b`.`id` ;

-- ----------------------------
-- View structure for v_t_award_level2
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_level2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_level2` AS select `a`.`userId` AS `userId`,`a`.`level1userId` AS `level1userId`,`a`.`level2userId` AS `level2userId`,sum(`a`.`level2money`) AS `level2moneys`,`a`.`level` AS `level`,`b`.`creditrating` AS `creditrating`,`b`.`rating` AS `rating`,`b`.`username` AS `userName`,`c`.`realName` AS `realName`,`c`.`idNo` AS `idNo`,`d`.`realName` AS `level2realName`,`d`.`userName` AS `level2userName` from (((`t_award` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) left join `t_admin` `d` on((`a`.`level2userId` = `d`.`id`))) group by `a`.`level2userId`,`a`.`userId` ;

-- ----------------------------
-- View structure for v_t_award_month
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_month`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_month` AS select `a`.`id` AS `id`,`b`.`userName` AS `userName`,`b`.`realName` AS `realName`,`b`.`card` AS `card`,`a`.`moth` AS `moth`,`a`.`moneys` AS `moneys`,`a`.`applystatus` AS `applystatus`,`a`.`type` AS `type`,date_format(`a`.`moth`,'%Y年%m月') AS `mothstr` from (`t_award_moth` `a` left join `t_admin` `b` on((`a`.`pepoleid` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_award_mxtype
-- ----------------------------
DROP VIEW IF EXISTS `v_t_award_mxtype`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_award_mxtype` AS select `a`.`userId` AS `userId`,`a`.`level2userId` AS `level2userId`,`a`.`addDate` AS `addDate`,`a`.`level2money` AS `level2money`,`a`.`mx` AS `mx`,`a`.`month` AS `month`,`a`.`mxType` AS `mxType`,`a`.`level` AS `level`,`b`.`username` AS `userName`,`c`.`realName` AS `realName` from ((`t_award` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_backacmount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_backacmount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_backacmount` AS select `t_borrow`.`id` AS `id`,`t_borrow`.`borrowTitle` AS `borrowTitle` from `t_borrow` ;

-- ----------------------------
-- View structure for v_t_backacount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_backacount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_backacount` AS select `t_borrow`.`id` AS `id`,`t_borrow`.`borrowTitle` AS `borrowTitle` from `t_borrow` where ((`t_borrow`.`borrowStatus` = 4) and (`t_borrow`.`borrowTitle` like '%%')) ;

-- ----------------------------
-- View structure for v_t_backamount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_backamount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_backamount` AS select `c`.`username` AS `borrower`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`annualRate` AS `annualRate`,`b`.`deadline` AS `deadline`,`a`.`realAmount` AS `realAmount`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `hasPI`,(((`a`.`recivedPrincipal` + `a`.`recievedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) AS `forPI` from ((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) where ((((`a`.`recivedPrincipal` + `a`.`recievedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) > 0) ;

-- ----------------------------
-- View structure for v_t_bacount_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_bacount_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_bacount_detail` AS select `c`.`username` AS `username`,`a`.`borrowId` AS `borrowId`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`publisher` AS `publisher`,round(sum(`a`.`realAmount`),2) AS `realAmount`,`b`.`borrowAmount` AS `borrowAmount`,round(sum((`a`.`recivedPrincipal` + `a`.`recievedInterest`)),2) AS `recivedPI`,round(sum(`a`.`hasPrincipal`),2) AS `hasPrincipal`,round(sum(`a`.`hasInterest`),2) AS `hasInterest`,round(sum((`a`.`recivedPrincipal` - `a`.`hasPrincipal`)),2) AS `forPrincipal`,round(sum((`a`.`recievedInterest` - `a`.`hasInterest`)),2) AS `forInterest` from ((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) where (`b`.`borrowStatus` in (4,5)) group by `c`.`username`,`a`.`borrowId`,`b`.`publisher`,`b`.`borrowAmount` ;

-- ----------------------------
-- View structure for v_t_bacount_history_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_bacount_history_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_bacount_history_detail` AS select `c`.`username` AS `username`,`a`.`borrowId` AS `borrowId`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`publisher` AS `publisher`,round(sum(`a`.`realAmount`),2) AS `realAmount`,`b`.`borrowAmount` AS `borrowAmount`,round(sum((`a`.`recivedPrincipal` + `a`.`recievedInterest`)),2) AS `recivedPI`,round(sum(`a`.`hasPrincipal`),2) AS `hasPrincipal`,round(sum(`a`.`hasInterest`),2) AS `hasInterest`,round(sum((`a`.`recivedPrincipal` - `a`.`hasPrincipal`)),2) AS `forPrincipal`,round(sum((`a`.`recievedInterest` - `a`.`hasInterest`)),2) AS `forInterest` from ((`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) group by `c`.`username`,`a`.`borrowId`,`b`.`borrowAmount` ;

-- ----------------------------
-- View structure for v_t_base_check
-- ----------------------------
DROP VIEW IF EXISTS `v_t_base_check`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_base_check` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,ifnull(`tperson`.`realName`,'未知姓名') AS `realname`,(case `tma`.`auditStatus` when 1 then '等待审核' when 2 then '审核不通过' when 3 then '审核通过' else '未申请' end) AS `identifyv`,(case `tma1`.`auditStatus` when 1 then '等待审核' when 2 then '审核不通过' when 3 then '审核通过' else '未申请' end) AS `workv`,(case `tma2`.`auditStatus` when 1 then '等待审核' when 2 then '审核不通过' when 3 then '审核通过' else '未申请' end) AS `addressv`,(case `tma3`.`auditStatus` when 1 then '等待审核' when 2 then '审核不通过' when 3 then '审核通过' else '未申请' end) AS `responsev`,(case `tma4`.`auditStatus` when 1 then '等待审核' when 2 then '审核不通过' when 3 then '审核通过' else '未申请' end) AS `incomev`,ifnull(`tsm`.`serviceManName`,'等待分配') AS `findandcheck` from (((((((`t_user` `tuser` left join `t_person` `tperson` on((`tuser`.`id` = `tperson`.`userId`))) left join `t_materialsauth` `tma` on(((`tma`.`userId` = `tuser`.`id`) and (`tma`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tma1` on(((`tma1`.`userId` = `tuser`.`id`) and (`tma1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tma2` on(((`tma2`.`userId` = `tuser`.`id`) and (`tma2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tma3` on(((`tma3`.`userId` = `tuser`.`id`) and (`tma3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tma4` on(((`tma3`.`userId` = `tuser`.`id`) and (`tma4`.`materAuthTypeId` = 5)))) left join `t_serviceman` `tsm` on((`tsm`.`userId` = `tuser`.`id`))) ;

-- ----------------------------
-- View structure for v_t_billcode
-- ----------------------------
DROP VIEW IF EXISTS `v_t_billcode`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_billcode` AS select sum(`t`.`investAmount`) AS `investAmount`,`t`.`borrowId` AS `borrowId` from `t_billcode` `t` where ((`t`.`borrowId` > 0) and (`t`.`status` = 1)) group by `t`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_borrow_all_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_all_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_all_list` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime`,`a`.`publisherWay` AS `publisherWay`,`a`.`authCount` AS `authCount`,`a`.`borrowShow` AS `borrowShow`,`a`.`manageFee` AS `manageFee`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`d`.`name` AS `borrowWayName`,`a`.`auditTime` AS `auditTime` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_backstage_info
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_backstage_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_backstage_info` AS select `tu`.`id` AS `id`,`tu`.`email` AS `email`,`tu`.`username` AS `username`,`tu`.`vipStatus` AS `vipStatus`,`tu`.`authStep` AS `authStep`,`tu`.`enable` AS `enable`,`tu`.`password` AS `password`,`tu`.`dealpwd` AS `dealpwd`,`tu`.`mobilePhone` AS `mobilePhone`,`tu`.`refferee` AS `refferee`,`tu`.`rating` AS `rating`,`tu`.`creditrating` AS `creditrating`,`tu`.`lastIP` AS `lastIP`,`tu`.`lastDate` AS `lastDate`,`tu`.`vipCreateTime` AS `vipCreateTime`,`tu`.`creditLimit` AS `creditLimit`,`tu`.`headImg` AS `headImg`,`tu`.`createTime` AS `createTime`,`tu`.`content` AS `content`,`tu`.`usableSum` AS `usableSum`,`tu`.`freezeSum` AS `freezeSum`,`tu`.`dueinSum` AS `dueinSum`,`tu`.`dueoutSum` AS `dueoutSum`,`tu`.`kefuId` AS `kefuId`,`tu`.`adminId` AS `adminId`,`tu`.`groupId` AS `groupId`,`tu`.`usableCreditLimit` AS `usableCreditLimit`,`tu`.`creditlimtor` AS `creditlimtor`,`tu`.`vipFee` AS `vipFee`,`tu`.`feeStatus` AS `feeStatus`,`tu`.`loginCount` AS `loginCount`,`tu`.`lockTime` AS `lockTime`,`tu`.`cashStatus` AS `cashStatus`,`tu`.`xmax` AS `xmax`,`tu`.`x` AS `x`,`tu`.`xmin` AS `xmin`,`tu`.`isFirstVip` AS `isFirstVip`,`tu`.`sign` AS `sign`,`tu`.`sign2` AS `sign2`,`tu`.`loginErrorCount` AS `loginErrorCount`,`tu`.`isLoginLimit` AS `isLoginLimit`,`tu`.`isApplyPro` AS `isApplyPro`,`tp`.`cellPhone` AS `cellPhone`,`tp`.`realName` AS `realName`,`tp`.`idNo` AS `idNo` from (`t_user` `tu` left join `t_person` `tp` on((`tp`.`userId` = `tu`.`id`))) where ((1 = 1) and (`tu`.`id` > 1)) ;

-- ----------------------------
-- View structure for v_t_borrow_collection
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_collection`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_collection` AS select `b`.`repayPeriod` AS `repayPeriod`,(`b`.`stillPrincipal` + `b`.`stillInterest`) AS `forPI`,`a`.`colResult` AS `colResult`,date_format(`a`.`collectionDate`,'%Y-%m-%d %T') AS `collectionDate`,`b`.`borrowId` AS `borrowId` from (`t_collection` `a` left join `t_repayment` `b` on((`a`.`repayId` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_concern
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_concern`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_concern` AS select `a`.`id` AS `id`,`b`.`id` AS `borrowId`,`a`.`userId` AS `userId`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`borrowWay` AS `borrowWay`,`b`.`paymentMode` AS `paymentMode`,`b`.`borrowAmount` AS `borrowAmount`,`b`.`annualRate` AS `annualRate`,`b`.`deadline` AS `deadline`,`b`.`isDayThe` AS `isDayThe`,`d`.`name` AS `borrowWayName`,date_format(`b`.`publishTime`,'%Y-%m-%d %T') AS `publishTime`,`f_injectPoint`(((`b`.`hasInvestAmount` / `b`.`borrowAmount`) * 100)) AS `schedules`,time_format(timediff(`b`.`remainTimeEnd`,`b`.`remainTimeStart`),'%H小时%i分%s秒') AS `times`,`f_credit_rating`(`c`.`creditrating`) AS `credit`,`c`.`creditrating` AS `creditrating` from (((`t_concern` `a` left join `t_borrow` `b` on((`a`.`moduleId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `b`.`borrowTypeSubId`))) where (`a`.`moduleType` = 2) ;

-- ----------------------------
-- View structure for v_t_borrow_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_detail` AS select `a`.`id` AS `id`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`imgPath` AS `imgPath`,`f_convertAmount`(`a`.`borrowAmount`) AS `borrowAmount`,`a`.`borrowAmount` AS `borrowSum`,`a`.`annualRate` AS `annualRate`,`f_injectPoint`((`a`.`annualRate` / 12)) AS `monthRate`,`a`.`paymentMode` AS `paymentMode`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`detail` AS `detail`,`a`.`showRate` AS `showRate`,`a`.`projectAddress` AS `projectAddress`,(`a`.`publishTime` + interval `a`.`raiseTerm` day) AS `raiseTime`,`a`.`tradeType` AS `tradeType`,`a`.`auditTime` AS `auditTime`,`a`.`excitationType` AS `excitationType`,`a`.`publisher` AS `publisher`,`a`.`publishTime` AS `publishTime`,`f_injectPoint`((((`a`.`hasInvestAmount` + ifnull(`vb`.`investAmount`,0)) / `a`.`borrowAmount`) * 100)) AS `schedules`,cast(`a`.`minTenderedSum` as char(20) charset utf8) AS `minTenderedSum`,cast(`a`.`maxTenderedSum` as char(20) charset utf8) AS `maxTenderedSum`,`f_convertAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `investAmount`,cast(`f_convertAmount`(((`a`.`borrowAmount` - `a`.`hasInvestAmount`) - ifnull(`vb`.`investAmount`,0))) as char(20) charset utf8) AS `residue`,`f_convertAmount`(`a`.`hasInvestAmount`) AS `hasInvestAmount`,`a`.`visitors` AS `visitors`,(unix_timestamp(`a`.`remainTimeEnd`) - unix_timestamp(`a`.`remainTimeStart`)) AS `remainTime`,`a`.`auditOpinion` AS `auditOpinion`,`a`.`detail` AS `borrowInfo`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`investNum` AS `investNum`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`circulationStatus` AS `circulationStatus`,`a`.`borrowShow` AS `borrowShow`,`a`.`smallestFlowUnit` AS `smallestFlowUnit`,`a`.`circulationNumber` AS `circulationNumber`,`a`.`hasCirculationNumber` AS `hasCirculationNumber`,(`a`.`circulationNumber` - `a`.`hasCirculationNumber`) AS `remainCirculationNumber`,`a`.`businessDetail` AS `businessDetail`,`a`.`assets` AS `assets`,`a`.`moneyPurposes` AS `moneyPurposes`,`a`.`excitationSum` AS `excitationSum`,`a`.`nid_log` AS `nid_log`,`a`.`agent` AS `agent`,`a`.`counterAgent` AS `counterAgent`,`s`.`selectName` AS `purpose`,`a`.`borrowType` AS `borrowType`,`a`.`hasPWD` AS `hasPWD`,`a`.`publisherWay` AS `publisherWay`,`a`.`retsource` AS `retsource`,`a`.`projectIntro` AS `projectIntro`,`a`.`safeMeasures` AS `safeMeasures`,`a`.`bidTime` AS `bidTime`,`a`.`groupid` AS `groupid`,`b`.`name` AS `borrowWayName` from (((`t_borrow` `a` left join `t_select` `s` on(((`a`.`purpose` = `s`.`selectValue`) and (`s`.`typeId` = 1)))) left join `v_t_billcode` `vb` on((`a`.`id` = `vb`.`borrowId`))) left join `t_borrow_sub_type` `b` on((`a`.`borrowTypeSubId` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_enterpriseuser_info
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_enterpriseuser_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_enterpriseuser_info` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`b`.`vipStatus` AS `vipStatus`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,date_format(`b`.`createTime`,'%Y-%m-%d') AS `createTime`,`b`.`lastDate` AS `lastDate`,`b`.`creditLimit` AS `creditLimit`,`c`.`companyName` AS `companyName`,`c`.`companyAddress` AS `companyAddress`,`c`.`companyPhone` AS `companyPhone`,`c`.`legalPerson` AS `legalPerson`,`c`.`registeredTime` AS `registeredTime`,`c`.`registeredCapital` AS `registeredCapital`,`c`.`businessCode` AS `businessCode`,`c`.`borrowCause` AS `borrowCause`,`p`.`realName` AS `realName` from ((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_borrow_role` `tb` on((`a`.`id` = `tb`.`borrowId`))) left join `t_enterprise` `c` on((`tb`.`userId` = `c`.`userId`))) left join `t_person` `p` on((`c`.`userId` = `p`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime`,`a`.`borrowShow` AS `borrowShow`,`a`.`publisherWay` AS `publisherWay`,`a`.`authCount` AS `authCount`,`a`.`auditStatus` AS `auditStatus`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`loanUserId` AS `loanUserId`,`d`.`name` AS `borrowWayName`,`a`.`recommend` AS `recommend` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_h_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_detail` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`d`.`selectName` AS `purpose`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowWay` AS `borrowWay`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`a`.`excitationType` AS `excitationType`,`a`.`excitationSum` AS `excitationSum`,`a`.`excitationMode` AS `excitationMode`,`a`.`hasPWD` AS `hasPWD`,`a`.`publishTime` AS `publishTime`,`a`.`publishIP` AS `publishIP`,`a`.`detail` AS `detail`,`a`.`borrowStatus` AS `borrowStatus`,`g`.`userId` AS `userId_admin`,`a`.`publisherWay` AS `publisherWay`,`a`.`auditOpinion` AS `auditOpinion` from (((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_select` `d` on((`a`.`purpose` = `d`.`id`))) left join `t_selecttype` `e` on((`d`.`typeId` = `e`.`id`))) left join `t_borrow_role` `g` on((`g`.`borrowId` = `a`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_h_firstaudit
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_firstaudit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_firstaudit` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime`,`a`.`borrowShow` AS `borrowShow`,`a`.`publisherWay` AS `publisherWay`,`a`.`authCount` AS `authCount`,`c`.`auditStatus` AS `auditStatus`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`d`.`name` AS `borrowWayName` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) where (`a`.`borrowStatus` = 1) ;

-- ----------------------------
-- View structure for v_t_borrow_h_firstaudit_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_firstaudit_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_firstaudit_detail` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`d`.`selectName` AS `purpose`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowWay` AS `borrowWay`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`a`.`excitationType` AS `excitationType`,`a`.`excitationSum` AS `excitationSum`,`a`.`excitationMode` AS `excitationMode`,`a`.`hasPWD` AS `hasPWD`,`a`.`publishTime` AS `publishTime`,`a`.`publishIP` AS `publishIP`,`a`.`detail` AS `detail`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`auditOpinion` AS `auditOpinion`,`f`.`mailContent` AS `mailContent`,`a`.`smallestFlowUnit` AS `smallestFlowUnit`,`a`.`circulationNumber` AS `circulationNumber`,`a`.`nid_log` AS `nid_log`,`a`.`borrowShow` AS `borrowShow`,`a`.`businessDetail` AS `businessDetail`,`a`.`assets` AS `assets`,`a`.`counterAgent` AS `counterAgent`,`g`.`userId` AS `userId_admin`,`a`.`publisherWay` AS `publisherWay`,`a`.`moneyPurposes` AS `moneyPurposes`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`h`.`name` AS `borrowWayName` from (((((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_select` `d` on((`a`.`purpose` = `d`.`selectValue`))) left join `t_selecttype` `e` on((`d`.`typeId` = `e`.`id`))) left join `t_mail` `f` on((`f`.`borrowId` = `a`.`id`))) left join `t_borrow_role` `g` on((`g`.`borrowId` = `a`.`id`))) left join `t_borrow_sub_type` `h` on((`h`.`id` = `a`.`borrowTypeSubId`))) where ((`a`.`borrowStatus` = 1) and (`d`.`typeId` = 1)) ;

-- ----------------------------
-- View structure for v_t_borrow_h_flowmark
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_flowmark`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_flowmark` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime`,`a`.`publisherWay` AS `publisherWay`,`a`.`authCount` AS `authCount`,`a`.`borrowShow` AS `borrowShow`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`loanUserId` AS `loanUserId`,`d`.`name` AS `borrowWayName` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) where (`a`.`borrowStatus` = 6) ;

-- ----------------------------
-- View structure for v_t_borrow_h_flowmark_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_flowmark_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_flowmark_detail` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`d`.`selectName` AS `purpose`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowWay` AS `borrowWay`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`a`.`excitationType` AS `excitationType`,`a`.`excitationSum` AS `excitationSum`,`a`.`excitationMode` AS `excitationMode`,`a`.`hasPWD` AS `hasPWD`,`a`.`publishTime` AS `publishTime`,`a`.`publishIP` AS `publishIP`,`a`.`detail` AS `detail`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`auditOpinion` AS `auditOpinion`,`f`.`mailContent` AS `mailContent`,`a`.`smallestFlowUnit` AS `smallestFlowUnit`,`a`.`circulationNumber` AS `circulationNumber`,`a`.`hasCirculationNumber` AS `hasCirculationNumber`,`a`.`nid_log` AS `nid_log`,`a`.`borrowShow` AS `borrowShow`,`a`.`businessDetail` AS `businessDetail`,`a`.`assets` AS `assets`,`a`.`counterAgent` AS `counterAgent`,`g`.`userId` AS `userId_admin`,`a`.`publisherWay` AS `publisherWay`,`a`.`moneyPurposes` AS `moneyPurposes`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`h`.`name` AS `borrowWayName` from (((((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_select` `d` on((`a`.`purpose` = `d`.`selectValue`))) left join `t_selecttype` `e` on((`d`.`typeId` = `e`.`id`))) left join `t_mail` `f` on((`f`.`borrowId` = `a`.`id`))) left join `t_borrow_role` `g` on((`g`.`borrowId` = `a`.`id`))) left join `t_borrow_sub_type` `h` on((`h`.`id` = `a`.`borrowTypeSubId`))) where ((`a`.`borrowStatus` = 6) and (`d`.`typeId` = 1)) ;

-- ----------------------------
-- View structure for v_t_borrow_h_fullscale
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_fullscale`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_fullscale` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publisherWay` AS `publisherWay`,`a`.`authCount` AS `authCount`,`a`.`publishTime` AS `publishTime`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`loanUserId` AS `loanUserId`,`a`.`auditStatus` AS `auditStatus`,`a`.`adminId` AS `adminId`,`a`.`auditOpinion` AS `auditOpinion`,`d`.`name` AS `borrowWayName` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) where (`a`.`borrowStatus` = 3) ;

-- ----------------------------
-- View structure for v_t_borrow_h_fullscale_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_fullscale_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_fullscale_detail` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`d`.`selectName` AS `purpose`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowWay` AS `borrowWay`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`a`.`excitationType` AS `excitationType`,`a`.`excitationSum` AS `excitationSum`,`a`.`excitationMode` AS `excitationMode`,`a`.`hasPWD` AS `hasPWD`,`a`.`publishTime` AS `publishTime`,`a`.`publishIP` AS `publishIP`,`a`.`detail` AS `detail`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`auditOpinion` AS `auditOpinion`,`f`.`mailContent` AS `mailContent`,`a`.`smallestFlowUnit` AS `smallestFlowUnit`,`a`.`circulationNumber` AS `circulationNumber`,`a`.`hasCirculationNumber` AS `hasCirculationNumber`,`a`.`nid_log` AS `nid_log`,`a`.`borrowShow` AS `borrowShow`,`a`.`businessDetail` AS `businessDetail`,`a`.`assets` AS `assets`,`a`.`counterAgent` AS `counterAgent`,`g`.`userId` AS `userId_admin`,`a`.`publisherWay` AS `publisherWay`,`a`.`auditStatus` AS `auditStatus`,`a`.`moneyPurposes` AS `moneyPurposes` from ((((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_select` `d` on((`a`.`purpose` = `d`.`selectValue`))) left join `t_selecttype` `e` on((`d`.`typeId` = `e`.`id`))) left join `t_mail` `f` on((`f`.`borrowId` = `a`.`id`))) left join `t_borrow_role` `g` on((`g`.`borrowId` = `a`.`id`))) where ((`a`.`borrowStatus` = 3) and (`d`.`typeId` = 1)) group by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_borrow_h_tenderin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_tenderin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_tenderin` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime`,`a`.`publisherWay` AS `publisherWay`,`a`.`authCount` AS `authCount`,`a`.`borrowShow` AS `borrowShow`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`loanUserId` AS `loanUserId`,`d`.`name` AS `borrowWayName` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) where (`a`.`borrowStatus` = 2) ;

-- ----------------------------
-- View structure for v_t_borrow_h_tenderin_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_h_tenderin_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_h_tenderin_detail` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`d`.`selectName` AS `purpose`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowWay` AS `borrowWay`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`a`.`excitationType` AS `excitationType`,`a`.`excitationSum` AS `excitationSum`,`a`.`excitationMode` AS `excitationMode`,`a`.`hasPWD` AS `hasPWD`,`a`.`publishTime` AS `publishTime`,`a`.`publishIP` AS `publishIP`,`a`.`detail` AS `detail`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`auditOpinion` AS `auditOpinion`,`f`.`mailContent` AS `mailContent`,`a`.`smallestFlowUnit` AS `smallestFlowUnit`,`a`.`circulationNumber` AS `circulationNumber`,`a`.`hasCirculationNumber` AS `hasCirculationNumber`,`a`.`nid_log` AS `nid_log`,`a`.`borrowShow` AS `borrowShow`,`a`.`businessDetail` AS `businessDetail`,`a`.`assets` AS `assets`,`a`.`counterAgent` AS `counterAgent`,`g`.`userId` AS `userId_admin`,`a`.`publisherWay` AS `publisherWay`,`a`.`moneyPurposes` AS `moneyPurposes`,`a`.`borrowTypeSubId` AS `borrowTypeSubId` from ((((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_select` `d` on((`a`.`purpose` = `d`.`selectValue`))) left join `t_selecttype` `e` on((`d`.`typeId` = `e`.`id`))) left join `t_mail` `f` on((`f`.`borrowId` = `a`.`id`))) left join `t_borrow_role` `g` on((`g`.`borrowId` = `a`.`id`))) where ((`a`.`borrowStatus` = 2) and (`d`.`typeId` = 1)) ;

-- ----------------------------
-- View structure for v_t_borrow_index
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_index`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_index` AS select `a`.`id` AS `id`,`a`.`transferable` AS `transferable`,`a`.`publishTime` AS `publishTime`,`a`.`imgPath` AS `imgPath`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`sort` AS `sorts`,`f_formatAmount`(`a`.`borrowAmount`) AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`f_injectPoint`((((`a`.`hasInvestAmount` + ifnull(`vb`.`investAmount`,0)) / `a`.`borrowAmount`) * 100)) AS `schedules`,`f_formatAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `investNum`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`excitationType` AS `excitationType`,`a`.`excitationSum` AS `excitationSum`,`a`.`hasPWD` AS `hasPWD`,`c`.`auditStatus` AS `auditStatus`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowShow` AS `borrowShow`,`a`.`projectScore` AS `projectScore`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`showRate` AS `showRate`,`d`.`name` AS `borrowWayName` from ((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `v_t_billcode` `vb` on((`a`.`id` = `vb`.`borrowId`))) left join `t_materialsauth` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) where ((`a`.`borrowStatus` < 6) and (`a`.`isShow` = 1) and (`c`.`materAuthTypeId` = 14)) order by `a`.`publishTime` desc ;

-- ----------------------------
-- View structure for v_t_borrow_invest
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_invest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_invest` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`projectIntro` AS `projectIntro`,`a`.`bidTime` AS `bidTime`,`f_injectPoint`(((`a`.`hasInvestAmount` / `a`.`borrowAmount`) * 100)) AS `schedules`,`f_convertAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `investNum`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`paymentMode` AS `paymentMode`,`a`.`tradeType` AS `tradeType`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`b`.`username` AS `username`,`c`.`personalHead` AS `personalHead`,`c`.`address` AS `address`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,`b`.`createTime` AS `createTime`,`e`.`regionName` AS `nativePro`,`f`.`regionName` AS `nativeCity`,`b`.`ipayAccount` AS `ipayAccount`,(`a`.`borrowAmount` - `a`.`hasInvestAmount`) AS `residue`,`g`.`name` AS `borrowWayName` from (((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`b`.`id` = `c`.`userId`))) left join `t_region` `e` on((`c`.`nativePlacePro` = `e`.`regionId`))) left join `t_region` `f` on((`c`.`nativePlaceCity` = `f`.`regionId`))) left join `t_borrow_sub_type` `g` on((`a`.`borrowTypeSubId` = `g`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_investrecord
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_investrecord`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_investrecord` AS select `a`.`id` AS `id`,`a`.`borrowId` AS `borrowId`,`b`.`username` AS `username`,`f_convertAmount`(`a`.`investAmount`) AS `investAmount`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime`,`a`.`investor` AS `investor`,`a`.`isDebt` AS `creditedStatus`,`a`.`pageType` AS `pageType` from (`t_invest` `a` left join `t_user` `b` on((`a`.`investor` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_invest_user
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_invest_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_invest_user` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`f_injectPoint`(((`a`.`hasInvestAmount` / `a`.`borrowAmount`) * 100)) AS `schedules`,`f_convertAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `investNum`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`paymentMode` AS `paymentMode`,`a`.`tradeType` AS `tradeType`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`b`.`username` AS `username`,`c`.`personalHead` AS `personalHead`,`c`.`address` AS `address`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,`f_vip`(`b`.`rating`) AS `vip`,`b`.`createTime` AS `createTime`,`e`.`regionName` AS `nativePro`,`f`.`regionName` AS `nativeCity`,(`b`.`usableSum` + `b`.`freezeSum`) AS `totalSum`,`b`.`usableSum` AS `usableSum` from ((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`b`.`id` = `c`.`userId`))) left join `t_region` `e` on((`c`.`nativePlacePro` = `e`.`regionId`))) left join `t_region` `f` on((`c`.`nativePlaceCity` = `f`.`regionId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_list` AS select (1 * `a`.`id`) AS `ord`,`a`.`recommend` AS `recommend`,`a`.`id` AS `id`,`a`.`sort` AS `sorts`,`a`.`imgPath` AS `imgPath`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`b`.`username` AS `username`,`b`.`vipStatus` AS `vipStatus`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,`f_vip`(`b`.`rating`) AS `vip`,`f_formatAmount`(`a`.`borrowAmount`) AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`showRate` AS `showRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`excitationType` AS `excitationType`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`excitationSum` AS `excitationSum`,`a`.`borrowShow` AS `borrowShow`,`a`.`borrowTypeSubId` AS `borrowTypeSubId`,`a`.`publishTime` AS `publishTime`,`e`.`name` AS `borrowWayName`,`e`.`id` AS `wayId`,`f_formatAmount`(((`a`.`borrowAmount` - `a`.`hasInvestAmount`) - ifnull(`vb`.`investAmount`,0))) AS `investNum`,`f_injectPoint`((((`a`.`hasInvestAmount` + ifnull(`vb`.`investAmount`,0)) / `a`.`borrowAmount`) * 100)) AS `schedules`,((`a`.`hasInvestAmount` / `a`.`borrowAmount`) * 100) AS `schedule`,`a`.`purpose` AS `purpose`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowAmount` AS `amount`,`a`.`hasPWD` AS `hasPWD`,`d`.`auditStatus` AS `auditStatus`,(unix_timestamp(`a`.`remainTimeEnd`) - unix_timestamp(`a`.`remainTimeStart`)) AS `remainTime`,`a`.`borrowType` AS `borrowType` from ((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `v_t_billcode` `vb` on((`a`.`id` = `vb`.`borrowId`))) left join `t_materialsauth` `d` on((`d`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `e` on((`a`.`borrowTypeSubId` = `e`.`id`))) where ((`a`.`borrowStatus` < 6) and (`a`.`isShow` = 1) and (`d`.`materAuthTypeId` = 14)) ;

-- ----------------------------
-- View structure for v_t_borrow_msgbord
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_msgbord`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_msgbord` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`c`.`personalHead` AS `personalHead`,`b`.`username` AS `username`,`a`.`msgContent` AS `msgContent`,`a`.`msgTime` AS `msgTime`,`a`.`modeId` AS `modeId` from ((`t_msgboard` `a` left join `t_user` `b` on((`a`.`msger` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) where (`a`.`msgboardType` = 1) ;

-- ----------------------------
-- View structure for v_t_borrow_publish
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_publish`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_publish` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`paymentMode` AS `paymentMode`,`a`.`borrowWay` AS `borrowWay`,date_format(`a`.`publishTime`,'%Y-%m-%d %H:%i:%s') AS `publishTime`,`a`.`borrowStatus` AS `borrowStatus`,`d`.`name` AS `borrowWayName`,`f_injectPoint`(((`a`.`hasInvestAmount` / `a`.`borrowAmount`) * 100)) AS `schedules` from (((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `a`.`borrowTypeSubId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_repayment
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_repayment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_repayment` AS select `a`.`repayPeriod` AS `repayPeriod`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,date_format(`a`.`realRepayDate`,'%Y-%m-%d') AS `realRepayDate`,`a`.`hasPI` AS `hasPI`,((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) AS `stillPI`,`a`.`hasFI` AS `hasFI`,`a`.`lateFI` AS `lateFI`,`a`.`repayStatus` AS `repayStatus`,`a`.`borrowId` AS `borrowId` from `t_repayment` `a` ;

-- ----------------------------
-- View structure for v_t_borrow_role
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_role` AS select distinct `t_borrow_role`.`userId` AS `userId` from `t_borrow_role` ;

-- ----------------------------
-- View structure for v_t_borrow_statis
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_statis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_statis` AS select `a`.`id` AS `id`,`b`.`username` AS `borrower`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`borrowWay` AS `borrowWay`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`manageFee` AS `manageFee`,`a`.`auditTime` AS `auditTime`,`c`.`id` AS `borrowTypeSubId`,`c`.`name` AS `borrowWayName` from ((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_borrow_sub_type` `c` on((`c`.`id` = `a`.`borrowTypeSubId`))) order by `a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_borrow_user_info
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_user_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_user_info` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`ipayAccount` AS `ipayAccount`,`b`.`username` AS `username`,`b`.`vipStatus` AS `vipStatus`,`f_rating`(`b`.`rating`) AS `rating`,`c`.`personalHead` AS `personalHead`,`c`.`address` AS `address`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,date_format(`b`.`createTime`,'%Y-%m-%d') AS `createTime`,`b`.`lastDate` AS `lastDate`,`b`.`creditLimit` AS `creditLimit`,`f_vip`(`b`.`rating`) AS `vip`,`c`.`sex` AS `sex`,(year(curdate()) - year(`c`.`birthday`)) AS `age`,`c`.`maritalStatus` AS `maritalStatus`,`e`.`regionName` AS `workPro`,`f`.`regionName` AS `workCity`,`d`.`companyLine` AS `companyLine`,`d`.`companyScale` AS `companyScale`,`d`.`job` AS `job`,`c`.`school` AS `school`,`c`.`highestEdu` AS `highestEdu`,date_format(`c`.`eduStartDay`,'%Y-%m-%d') AS `eduStartDay`,`c`.`hasHourse` AS `hasHourse`,`c`.`hasCar` AS `hasCar`,`c`.`hasHousrseLoan` AS `hasHousrseLoan`,`c`.`hasCarLoan` AS `hasCarLoan`,`c`.`auditStatus` AS `auditperson`,`d`.`auditStatus` AS `auditwork`,`j`.`regionId` AS `nativePlacePro`,`k`.`regionId` AS `nativePlaceCity`,concat(`j`.`regionName`,`k`.`regionName`) AS `nativePlace` from (((((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`b`.`id` = `c`.`userId`))) left join `t_workauth` `d` on((`b`.`id` = `d`.`userId`))) left join `t_region` `e` on((`d`.`workPro` = `e`.`regionId`))) left join `t_region` `f` on((`d`.`workCity` = `f`.`regionId`))) left join `t_region` `j` on((`c`.`nativePlacePro` = `j`.`regionId`))) left join `t_region` `k` on((`c`.`nativePlaceCity` = `k`.`regionId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_user_info_byadmin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_user_info_byadmin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_user_info_byadmin` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`b`.`vipStatus` AS `vipStatus`,`f_rating`(`b`.`rating`) AS `rating`,`c`.`personalHead` AS `personalHead`,`c`.`address` AS `address`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating`,date_format(`b`.`createTime`,'%Y-%m-%d') AS `createTime`,`b`.`lastDate` AS `lastDate`,`b`.`creditLimit` AS `creditLimit`,`f_vip`(`b`.`rating`) AS `vip`,`c`.`sex` AS `sex`,(year(curdate()) - year(`c`.`birthday`)) AS `age`,`c`.`maritalStatus` AS `maritalStatus`,`e`.`regionName` AS `workPro`,`f`.`regionName` AS `workCity`,`d`.`companyLine` AS `companyLine`,`d`.`companyScale` AS `companyScale`,`d`.`job` AS `job`,`c`.`school` AS `school`,`c`.`highestEdu` AS `highestEdu`,date_format(`c`.`eduStartDay`,'%Y-%m-%d') AS `eduStartDay`,`c`.`hasHourse` AS `hasHourse`,`c`.`hasCar` AS `hasCar`,`c`.`hasHousrseLoan` AS `hasHousrseLoan`,`c`.`hasCarLoan` AS `hasCarLoan`,`c`.`auditStatus` AS `auditperson`,`d`.`auditStatus` AS `auditwork`,`j`.`regionId` AS `nativePlacePro`,`k`.`regionId` AS `nativePlaceCity`,concat(`j`.`regionName`,`k`.`regionName`) AS `nativePlace` from ((((((((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_borrow_role` `tb` on((`a`.`id` = `tb`.`borrowId`))) left join `t_person` `c` on((`tb`.`userId` = `c`.`userId`))) left join `t_workauth` `d` on((`tb`.`userId` = `d`.`userId`))) left join `t_region` `e` on((`d`.`workPro` = `e`.`regionId`))) left join `t_region` `f` on((`d`.`workCity` = `f`.`regionId`))) left join `t_region` `j` on((`c`.`nativePlacePro` = `j`.`regionId`))) left join `t_region` `k` on((`c`.`nativePlaceCity` = `k`.`regionId`))) ;

-- ----------------------------
-- View structure for v_t_borrow_user_materauth_img
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_user_materauth_img`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_user_materauth_img` AS select `a`.`userId` AS `userId`,`a`.`materAuthTypeId` AS `materAuthTypeId`,`c`.`name` AS `name`,`b`.`checktime` AS `checktime`,`b`.`visiable` AS `visiable`,substr(`b`.`imagePath`,4) AS `imgPath`,`a`.`groupid` AS `groupid` from ((`t_materialsauth` `a` left join `t_materialimagedetal` `b` on((`b`.`materialsauthid` = `a`.`id`))) left join `t_materialsauthtype` `c` on((`a`.`materAuthTypeId` = `c`.`id`))) where (`b`.`auditStatus` = 3) ;

-- ----------------------------
-- View structure for v_t_borrow_user_materialsauth
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_user_materialsauth`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_user_materialsauth` AS select `a`.`name` AS `name`,`d`.`imagePath` AS `imgPath`,`b`.`auditStatus` AS `auditStatus`,date_format(`b`.`authTime`,'%Y-%m-%d') AS `passTime`,`b`.`materAuthTypeId` AS `materAuthTypeId`,`b`.`userId` AS `userId`,`d`.`visiable` AS `visiable`,`c`.`id` AS `id` from (((`t_materialsauthtype` `a` left join `t_materialsauth` `b` on((`b`.`materAuthTypeId` = `a`.`id`))) left join `t_borrow` `c` on((`c`.`publisher` = `b`.`userId`))) left join `t_materialimagedetal` `d` on((`d`.`materialsauthid` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_user_materialsauth_byadmin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_user_materialsauth_byadmin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_user_materialsauth_byadmin` AS select `a`.`name` AS `name`,substr(`d`.`imagePath`,4) AS `imgPath`,`b`.`auditStatus` AS `auditStatus`,date_format(`b`.`authTime`,'%Y-%m-%d') AS `passTime`,`b`.`materAuthTypeId` AS `materAuthTypeId`,`b`.`userId` AS `userId`,`d`.`visiable` AS `visiable`,`c`.`id` AS `id`,`b`.`groupid` AS `groupid` from (((`t_materialsauthtype` `a` left join `t_materialsauth` `b` on((`b`.`materAuthTypeId` = `a`.`id`))) left join `t_borrow` `c` on(((`c`.`publisher` = `b`.`userId`) and (`c`.`groupid` = `b`.`groupid`)))) left join `t_materialimagedetal` `d` on((`d`.`materialsauthid` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_borrow_user_materialsauth_img
-- ----------------------------
DROP VIEW IF EXISTS `v_t_borrow_user_materialsauth_img`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_borrow_user_materialsauth_img` AS select `a`.`userId` AS `userId`,`a`.`materAuthTypeId` AS `materAuthTypeId`,`c`.`name` AS `name`,`b`.`checktime` AS `checktime`,`b`.`imagePath` AS `imagePath` from ((`t_materialsauth` `a` left join `t_materialimagedetal` `b` on((`b`.`materialsauthid` = `a`.`id`))) left join `t_materialsauthtype` `c` on((`a`.`materAuthTypeId` = `c`.`id`))) where (`b`.`auditStatus` = 3) ;

-- ----------------------------
-- View structure for v_t_callcenter_help_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_callcenter_help_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_callcenter_help_list` AS select `a`.`id` AS `questionId`,`a`.`helpTypeId` AS `typeId`,`b`.`helpDescribe` AS `typeDescribe`,`a`.`questionDescribe` AS `question`,`c`.`helpAnswer` AS `anwer`,`a`.`publishTime` AS `publishTime`,`a`.`browseCount` AS `browseCount`,`d`.`userName` AS `publisher` from (((`t_help_question` `a` left join `t_help_type` `b` on((`a`.`helpTypeId` = `b`.`id`))) left join `t_help_answer` `c` on((`a`.`id` = `c`.`helpQuestionId`))) left join `t_admin` `d` on((`d`.`id` = `a`.`publisher`))) ;

-- ----------------------------
-- View structure for v_t_can_assignment_borrow
-- ----------------------------
DROP VIEW IF EXISTS `v_t_can_assignment_borrow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_can_assignment_borrow` AS select `t_borrow`.`id` AS `borrowId`,`t_borrow`.`borrowAmount` AS `borrowAmount`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`annualRate` AS `annualRate`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_user`.`username` AS `borrowerName`,`t_invest`.`realAmount` AS `realAmount`,`t_invest`.`investAmount` AS `investAmount`,date_format(`t_borrow`.`publishTime`,'%Y-%m-%d') AS `publishTime`,`t_assignment_debt`.`alienatorId` AS `alienatorId`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_assignment_debt`.`auctionDays` AS `auctionDays`,`t_assignment_debt`.`id` AS `debtId`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_assignment_debt`.`debtSum` AS `debtSum`,`t_invest`.`id` AS `investId`,`t_invest`.`investor` AS `investor`,(select count(1) from `t_invest_repayment` `tir` where ((`tir`.`invest_id` = `t_invest`.`id`) and (`tir`.`repayStatus` = 1))) AS `remainBorrowLimit`,(select count(1) from `t_invest_repayment` `tir` where ((`tir`.`invest_id` = `t_invest`.`id`) and (`tir`.`repayStatus` = 2))) AS `hasRepaymentMonth`,(to_days((select min(`t_repayment`.`repayDate`) AS `min(``t_repayment``.``repayDate``)` from `t_repayment` where ((`t_repayment`.`borrowId` = `t_invest`.`borrowId`) and (`t_repayment`.`repayStatus` = 1)))) - to_days(now())) AS `remainDay`,`t_invest`.`hasPrincipal` AS `hasPrincipal`,round(`t_invest`.`recivedPrincipal`,2) AS `recivedPrincipal`,round((`t_invest`.`hasPrincipal` + `t_invest`.`hasInterest`),2) AS `hasPI`,round((`t_invest`.`recievedInterest` + `t_invest`.`recivedPrincipal`),2) AS `recievedPI` from (((`t_invest` left join `t_borrow` on((`t_invest`.`borrowId` = `t_borrow`.`id`))) left join `t_user` on((`t_borrow`.`publisher` = `t_user`.`id`))) left join `t_assignment_debt` on(((`t_invest`.`id` = `t_assignment_debt`.`investId`) and (`t_assignment_debt`.`alienatorId` = `t_invest`.`investor`) and (`t_assignment_debt`.`debtStatus` not in (4,5,6,7))))) where ((((`t_invest`.`recievedInterest` + `t_invest`.`recivedPrincipal`) - (`t_invest`.`hasPrincipal` + `t_invest`.`hasInterest`)) >= 5000) and (`t_borrow`.`isDayThe` = 1) and (isnull(`t_assignment_debt`.`debtStatus`) or (`t_assignment_debt`.`debtStatus` = 1))) order by `t_invest`.`id` ;

-- ----------------------------
-- View structure for v_t_chianpnr_repay
-- ----------------------------
DROP VIEW IF EXISTS `v_t_chianpnr_repay`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_chianpnr_repay` AS select `repayment`.`id` AS `payId`,`invest_repay`.`id` AS `ordId`,`outor`.`ipayAccount` AS `outCustId`,`innor`.`ipayAccount` AS `inCustId`,`invest`.`billcode` AS `subOrdId`,`invest`.`id` AS `invest_id`,`invest`.`investTime` AS `subOrdDate`,`invest_repay`.`isWebRepay` AS `isWebRepay`,`repayment`.`principalBalance` AS `principalBalance`,`borrow`.`id` AS `borrowId`,`repayment`.`repayPeriod` AS `repayPeriod`,`borrow`.`manageFee` AS `accountManageFee`,((((`repayment`.`stillInterest` + `repayment`.`stillPrincipal`) + `repayment`.`lateFI`) - `repayment`.`hasPI`) - `repayment`.`hasFI`) AS `repaySum`,round((((((`invest_repay`.`recivedPrincipal` + `invest_repay`.`recivedInterest`) + `invest_repay`.`recivedFI`) - `invest_repay`.`hasPrincipal`) - `invest_repay`.`hasInterest`) - `invest_repay`.`hasFI`),2) AS `inSum`,round((((`invest_repay`.`recivedPrincipal` + `invest_repay`.`recivedInterest`) - `invest_repay`.`hasPrincipal`) - `invest_repay`.`hasInterest`),2) AS `backSum`,round((`invest_repay`.`recivedInterest` + `invest_repay`.`recivedPrincipal`),2) AS `compensatorySum`,(select ifnull(`t`.`id`,-(1)) AS `id` from `t_assignment_debt` `t` where (`t`.`investId` = `invest_repay`.`invest_id`) order by `t`.`applyTime` desc limit 0,1) AS `debtId`,ifnull(round((((`borrow`.`borrowAmount` * `borrow`.`annualRate`) * 0.01) / 12),2),0) AS `interest`,`borrow`.`trxId` AS `trxId`,ifnull(round(`invest_repay`.`iManageFee`,2),0) AS `iManageFee`,`repayment`.`lateFI` AS `repayment_lateFI`,`repayment`.`hasFI` AS `repayment_hasFI`,`invest_repay`.`recivedFI` AS `invest_recivedFI`,`invest_repay`.`hasFI` AS `invest_hasFI`,`innor`.`username` AS `invest_username` from (((((`t_repayment` `repayment` left join `t_invest_repayment` `invest_repay` on(((`repayment`.`id` = `invest_repay`.`repayId`) and (`repayment`.`borrowId` = `invest_repay`.`borrow_id`)))) left join `t_borrow` `borrow` on((`repayment`.`borrowId` = `borrow`.`id`))) left join `t_user` `outor` on((`borrow`.`publisher` = `outor`.`id`))) left join `t_invest` `invest` on((`invest_repay`.`invest_id` = `invest`.`id`))) left join `t_user` `innor` on((`invest`.`investor` = `innor`.`id`))) ;

-- ----------------------------
-- View structure for v_t_crediting_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_crediting_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_crediting_list` AS select `t_crediting`.`id` AS `id`,`t_crediting`.`creditingName` AS `creditingName`,`t_crediting`.`applyAmount` AS `applyAmount`,`t_crediting`.`applyDetail` AS `applyDetail`,`t_crediting`.`applyer` AS `applyer`,`t_crediting`.`applyTime` AS `applyTime`,`t_crediting`.`reviewer` AS `reviewer`,`t_crediting`.`reviewTime` AS `reviewTime`,`t_crediting`.`status` AS `status` from `t_crediting` ;

-- ----------------------------
-- View structure for v_t_criditpicture
-- ----------------------------
DROP VIEW IF EXISTS `v_t_criditpicture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_criditpicture` AS select `tuser`.`id` AS `id`,`f_credit_rating`(`tuser`.`creditrating`) AS `credit` from `t_user` `tuser` ;

-- ----------------------------
-- View structure for v_t_debt_borrow_person
-- ----------------------------
DROP VIEW IF EXISTS `v_t_debt_borrow_person`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_debt_borrow_person` AS select `t_assignment_debt`.`id` AS `id`,`t_assignment_debt`.`debtSum` AS `debtSum`,`alienatoruser`.`username` AS `alienatorName`,`t_assignment_debt`.`auctionBasePrice` AS `auctionBasePrice`,`t_assignment_debt`.`debtLimit` AS `debtLimit`,`t_assignment_debt`.`auctionMode` AS `auctionMode`,`t_assignment_debt`.`alienatorId` AS `alienatorId`,`t_assignment_debt`.`auctionerId` AS `auctionerId`,`t_assignment_debt`.`publishTime` AS `publishTime`,`t_assignment_debt`.`auctionDays` AS `auctionDays`,`t_assignment_debt`.`debtStatus` AS `debtStatus`,`t_assignment_debt`.`borrowId` AS `borrowId`,`t_borrow`.`borrowTitle` AS `borrowTitle`,`t_borrow`.`borrowWay` AS `borrowWay`,`t_borrow`.`publisher` AS `publisher`,`t_borrow`.`annualRate` AS `annualRate`,`t_borrow`.`showRate` AS `showRate`,`t_borrow`.`deadline` AS `deadline`,`t_borrow`.`isDayThe` AS `isDayThe`,`t_borrow`.`paymentMode` AS `paymentMode`,`t_user`.`username` AS `borrowerName`,`auctioner`.`username` AS `auctionerName`,`t_assignment_debt`.`auctionHighPrice` AS `auctionHighPrice`,`f_credit_rating`(`t_user`.`creditrating`) AS `creditratingIco`,`t_user`.`creditrating` AS `creditrating`,`alienatoruser`.`creditrating` AS `alienatorCreditrating`,`f_credit_rating`(`alienatoruser`.`creditrating`) AS `alienatorCreditratingIco`,(case when ((select count(1) AS `count(1)` from `t_repayment` where ((`t_repayment`.`borrowId` = `t_assignment_debt`.`borrowId`) and (`t_repayment`.`isLate` = 2))) > 0) then 2 else 1 end) AS `isLate`,(`t_assignment_debt`.`publishTime` + interval `t_assignment_debt`.`auctionDays` day) AS `actionTime`,`t_person`.`personalHead` AS `personalHead`,`s`.`id` AS `borrowTypeSubId`,`s`.`name` AS `borrowWayName` from ((((((`t_assignment_debt` left join `t_borrow` on((`t_assignment_debt`.`borrowId` = `t_borrow`.`id`))) left join `t_user` on((`t_borrow`.`publisher` = `t_user`.`id`))) left join `t_person` on((`t_borrow`.`publisher` = `t_person`.`userId`))) left join `t_user` `alienatoruser` on((`t_assignment_debt`.`alienatorId` = `alienatoruser`.`id`))) left join `t_user` `auctioner` on((`auctioner`.`id` = `t_assignment_debt`.`auctionerId`))) left join `t_borrow_sub_type` `s` on((`s`.`id` = `t_borrow`.`borrowTypeSubId`))) ;

-- ----------------------------
-- View structure for v_t_debt_msgbord
-- ----------------------------
DROP VIEW IF EXISTS `v_t_debt_msgbord`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_debt_msgbord` AS select `a`.`id` AS `id`,`b`.`id` AS `userId`,`c`.`personalHead` AS `personalHead`,`b`.`username` AS `username`,`a`.`msgContent` AS `msgContent`,`a`.`msgTime` AS `msgTime`,`a`.`modeId` AS `modeId` from ((`t_msgboard` `a` left join `t_user` `b` on((`a`.`msger` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) where (`a`.`msgboardType` = 2) ;

-- ----------------------------
-- View structure for v_t_deuin_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_deuin_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_deuin_list` AS select `a`.`repayId` AS `id`,`c`.`auditStatus` AS `auditStatus`,`c`.`auditRemark` AS `auditRemark`,`a`.`repayPeriod` AS `repayPeriod`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,`d`.`username` AS `investor`,`c`.`id` AS `borrowId`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`borrowWay` AS `borrowWay`,`e`.`username` AS `username`,`f`.`realName` AS `realName`,`j`.`realName` AS `realNames`,`c`.`isDayThe` AS `isDayThe`,sum(round((((`a`.`recivedPrincipal` + `a`.`recivedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`),2)) AS `forTotalSum`,`d`.`usableSum` AS `usableSum`,`d`.`freezeSum` AS `freezeSum`,`d`.`rating` AS `rating`,`d`.`creditrating` AS `creditrating`,`b`.`deadline` AS `deadline`,`g`.`groupId` AS `groupId`,`h`.`groupName` AS `groupName`,`b`.`investTime` AS `investTime`,`b`.`investAmount` AS `investAmount`,`c`.`borrowAmount` AS `borrowAmount`,`c`.`loanUserId` AS `loanUserId`,((`b`.`investAmount` / `c`.`borrowAmount`) * 100) AS `scale`,date_format(`c`.`publishTime`,'%Y-%m-%d') AS `publishTime`,`k`.`id` AS `borrowTypeSubId`,`k`.`name` AS `borrowWayName` from (((((((((`t_invest_repayment` `a` left join `t_invest` `b` on((`a`.`invest_id` = `b`.`id`))) left join `t_borrow` `c` on((`b`.`borrowId` = `c`.`id`))) left join `t_user` `d` on((`b`.`investor` = `d`.`id`))) left join `t_user` `e` on((`c`.`publisher` = `e`.`id`))) left join `t_person` `f` on((`f`.`userId` = `d`.`id`))) left join `t_group_user` `g` on((`b`.`investor` = `g`.`userId`))) left join `t_group` `h` on((`g`.`groupId` = `h`.`id`))) left join `t_person` `j` on((`j`.`userId` = `c`.`publisher`))) left join `t_borrow_sub_type` `k` on((`k`.`id` = `c`.`borrowTypeSubId`))) where ((((`a`.`recivedPrincipal` + `a`.`recivedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) > 0) group by `a`.`repayId` ;

-- ----------------------------
-- View structure for v_t_download_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_download_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_download_detail` AS select `pjzb_test2`.`t_download`.`id` AS `id`,`pjzb_test2`.`t_download`.`title` AS `title`,`pjzb_test2`.`t_download`.`content` AS `content`,`pjzb_test2`.`t_download`.`publishTime` AS `publishTime`,`pjzb_test2`.`t_download`.`sort` AS `sort`,`pjzb_test2`.`t_download`.`userId` AS `userId`,`pjzb_test2`.`t_download`.`visits` AS `visits`,`pjzb_test2`.`t_download`.`state` AS `state`,`pjzb_test2`.`t_download`.`attachment` AS `attachment`,`pjzb_test2`.`t_download`.`seqNum` AS `seqNum`,ifnull(`pjzb_test2`.`t_user`.`username`,'admin') AS `username` from (`t_download` left join `t_user` on((`pjzb_test2`.`t_download`.`userId` = `pjzb_test2`.`t_user`.`id`))) ;

-- ----------------------------
-- View structure for v_t_download_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_download_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_download_list` AS select `pjzb_test2`.`t_download`.`sort` AS `sort`,`pjzb_test2`.`t_download`.`publishTime` AS `publishTime`,`pjzb_test2`.`t_download`.`content` AS `content`,`pjzb_test2`.`t_download`.`title` AS `title`,`pjzb_test2`.`t_download`.`id` AS `id`,`pjzb_test2`.`t_download`.`seqNum` AS `seqNum`,`pjzb_test2`.`t_download`.`attachment` AS `attachment`,`pjzb_test2`.`t_download`.`state` AS `state`,`pjzb_test2`.`t_download`.`visits` AS `visits`,`pjzb_test2`.`t_download`.`userId` AS `userId`,`pjzb_test2`.`t_admin`.`userName` AS `userName` from (`t_download` left join `t_admin` on((`pjzb_test2`.`t_download`.`userId` = `pjzb_test2`.`t_admin`.`id`))) ;

-- ----------------------------
-- View structure for v_t_enterprise_apply
-- ----------------------------
DROP VIEW IF EXISTS `v_t_enterprise_apply`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_enterprise_apply` AS select `a`.`id` AS `id`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`deadline` AS `deadline`,`a`.`tname` AS `tname`,`a`.`telephone` AS `telephone`,`a`.`cityaddress` AS `address`,`a`.`state` AS `state`,`a`.`companyname` AS `companyname`,`b`.`authStep` AS `authStep`,`b`.`userId` AS `userId`,`c`.`viewpdf_url` AS `viewpdfUrl` from ((`t_apply` `a` left join `t_borrow_role` `b` on((`a`.`id` = `b`.`applyId`))) left join `t_user` `c` on((`b`.`userId` = `c`.`id`))) where (`a`.`state` = 1) group by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_enterprise_user_verypictur
-- ----------------------------
DROP VIEW IF EXISTS `v_t_enterprise_user_verypictur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_enterprise_user_verypictur` AS select `tuser`.`userId` AS `id`,((((ifnull(`tm1`.`auditStatus`,0) + ifnull(`tm2`.`auditStatus`,0)) + ifnull(`tm3`.`auditStatus`,0)) + ifnull(`tm4`.`auditStatus`,0)) + ifnull(`tm5`.`auditStatus`,0)) AS `ccc` from (((((`v_t_borrow_role` `tuser` left join `t_materialsauth` `tm1` on(((`tuser`.`userId` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 17)))) left join `t_materialsauth` `tm2` on(((`tuser`.`userId` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 18)))) left join `t_materialsauth` `tm3` on(((`tuser`.`userId` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 19)))) left join `t_materialsauth` `tm4` on(((`tuser`.`userId` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 20)))) left join `t_materialsauth` `tm5` on(((`tuser`.`userId` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 21)))) group by `tuser`.`userId` ;

-- ----------------------------
-- View structure for v_t_exgo_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_exgo_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_exgo_detail` AS select `a`.`id` AS `id`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`imgPath` AS `imgPath`,`a`.`borrowSum` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`f_injectPoint`((`a`.`annualRate` / 12)) AS `monthRate`,`a`.`paymentMode` AS `paymentMode`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`tradeType` AS `tradeType`,`a`.`excitationType` AS `excitationType`,`a`.`publisher` AS `publisher`,`a`.`publishTime` AS `publishTime`,`f_injectPoint`(((`a`.`hasInvestAmount` / `a`.`borrowAmount`) * 100)) AS `schedules`,`a`.`minTenderedSum` AS `minTenderedSum`,`a`.`maxTenderedSum` AS `maxTenderedSum`,`f_convertAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `investAmount`,`f_convertAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `residue`,`f_convertAmount`(`a`.`hasInvestAmount`) AS `hasInvestAmount`,`a`.`visitors` AS `visitors`,(unix_timestamp(`a`.`remainTimeEnd`) - unix_timestamp(`a`.`remainTimeStart`)) AS `remainTime`,`a`.`auditOpinion` AS `auditOpinion`,`a`.`detail` AS `borrowInfo`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`investNum` AS `investNum`,`a`.`borrowWay` AS `borrowWay`,`a`.`circulationStatus` AS `circulationStatus`,`a`.`borrowShow` AS `borrowShow`,`a`.`smallestFlowUnit` AS `smallestFlowUnit`,`a`.`circulationNumber` AS `circulationNumber`,`a`.`hasCirculationNumber` AS `hasCirculationNumber`,(`a`.`circulationNumber` - `a`.`hasCirculationNumber`) AS `remainCirculationNumber`,`a`.`businessDetail` AS `businessDetail`,`a`.`assets` AS `assets`,`a`.`moneyPurposes` AS `moneyPurposes`,`a`.`excitationSum` AS `excitationSum`,`a`.`nid_log` AS `nid_log`,`a`.`agent` AS `agent`,`a`.`counterAgent` AS `counterAgent`,`s`.`selectName` AS `purpose`,`a`.`borrowType` AS `borrowType`,`a`.`hasPWD` AS `hasPWD`,`a`.`publisherWay` AS `publisherWay`,`d`.`description` AS `description`,`f`.`description` AS `sdescription`,`b`.`name` AS `borrowWayName` from ((((`t_exgo_borrow` `a` left join `t_select` `s` on(((`a`.`purpose` = `s`.`selectValue`) and (`s`.`typeId` = 1)))) left join `t_select` `d` on((`a`.`agent` = `d`.`selectName`))) left join `t_select` `f` on((`a`.`counterAgent` = `d`.`selectName`))) left join `t_borrow_sub_type` `b` on((`a`.`borrowTypeSubId` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_forpayment_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_forpayment_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_forpayment_h` AS select `a`.`id` AS `id`,`a`.`repayPeriod` AS `repayPeriod`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,`d`.`username` AS `investor`,`c`.`id` AS `borrowId`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`borrowWay` AS `borrowWay`,`e`.`username` AS `username`,`f`.`realName` AS `realName`,`j`.`realName` AS `realNames`,`c`.`isDayThe` AS `isDayThe`,round((((`a`.`recivedPrincipal` + `a`.`recivedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`),2) AS `forTotalSum`,`d`.`usableSum` AS `usableSum`,`d`.`freezeSum` AS `freezeSum`,`d`.`rating` AS `rating`,`d`.`creditrating` AS `creditrating`,`b`.`deadline` AS `deadline`,`g`.`groupId` AS `groupId`,`h`.`groupName` AS `groupName`,`c`.`loanUserId` AS `loanUserId`,date_format(`b`.`investTime`,'%Y-%m-%d %H:%i:%s') AS `investTime`,`b`.`investAmount` AS `investAmount`,`c`.`borrowAmount` AS `borrowAmount`,((`b`.`investAmount` / `c`.`borrowAmount`) * 100) AS `scale`,date_format(`c`.`publishTime`,'%Y-%m-%d') AS `publishTime`,`k`.`id` AS `borrowTypeSubId`,`k`.`name` AS `borrowWayName` from (((((((((`t_invest_repayment` `a` left join `t_invest` `b` on((`a`.`invest_id` = `b`.`id`))) left join `t_borrow` `c` on((`b`.`borrowId` = `c`.`id`))) left join `t_user` `d` on((`b`.`investor` = `d`.`id`))) left join `t_user` `e` on((`c`.`publisher` = `e`.`id`))) left join `t_person` `f` on((`f`.`userId` = `d`.`id`))) left join `t_group_user` `g` on((`b`.`investor` = `g`.`userId`))) left join `t_group` `h` on((`g`.`groupId` = `h`.`id`))) left join `t_person` `j` on((`j`.`userId` = `c`.`publisher`))) left join `t_borrow_sub_type` `k` on((`k`.`id` = `c`.`borrowTypeSubId`))) where ((((`a`.`recivedPrincipal` + `a`.`recivedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) > 0) ;

-- ----------------------------
-- View structure for v_t_forpayment_h_interest
-- ----------------------------
DROP VIEW IF EXISTS `v_t_forpayment_h_interest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_forpayment_h_interest` AS select `a`.`borrowId` AS `borrowId`,(sum(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasFI`)) * (sum(`a`.`stillInterest`) / (sum(`a`.`stillPrincipal`) + sum(`a`.`stillInterest`)))) AS `totalInterest`,sum(`a`.`stillInterest`) AS `SUM(a.stillInterest)` from `t_repayment` `a` group by `a`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_forpayment_h_total
-- ----------------------------
DROP VIEW IF EXISTS `v_t_forpayment_h_total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_forpayment_h_total` AS select `d`.`id` AS `id`,`d`.`groupId` AS `groupId`,`d`.`username` AS `investor`,`e`.`realName` AS `realName`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`deadline` AS `deadline`,`c`.`isDayThe` AS `isDayThe`,`b`.`repayPeriod` AS `repayPeriod`,`c`.`borrowWay` AS `borrowWay`,date_format(`b`.`repayDate`,'%Y-%m-%d') AS `repayDate`,round(((((`b`.`stillPrincipal` + `b`.`stillInterest`) - `b`.`hasPI`) * (`a`.`investAmount` / `c`.`borrowAmount`)) * ((`a`.`realAmount` - `a`.`hasPI`) / `a`.`realAmount`)),2) AS `forTotalSum`,round((`a`.`realAmount` + (`t`.`totalInterest` * (`a`.`realAmount` / `c`.`borrowAmount`))),2) AS `forPI`,round((((`a`.`realAmount` + (`t`.`totalInterest` * (`a`.`realAmount` / `c`.`borrowAmount`))) + `d`.`usableSum`) + `d`.`freezeSum`),2) AS `amount`,`d`.`usableSum` AS `usableSum`,`d`.`rating` AS `rating`,`d`.`creditrating` AS `creditrating` from (((((`t_invest` `a` left join `t_repayment` `b` on((`a`.`borrowId` = `b`.`borrowId`))) left join `t_borrow` `c` on((`b`.`borrowId` = `c`.`id`))) left join `t_user` `d` on((`a`.`investor` = `d`.`id`))) left join `v_t_forpayment_h_interest` `t` on((`b`.`borrowId` = `t`.`borrowId`))) left join `t_person` `e` on((`e`.`userId` = `d`.`id`))) where (`b`.`repayStatus` = 1) order by `c`.`id` desc,`b`.`id`,`a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_full_invest
-- ----------------------------
DROP VIEW IF EXISTS `v_t_full_invest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_full_invest` AS select `u`.`ipayAccount` AS `OutCustId`,`i`.`id` AS `investId`,`i`.`billcode` AS `OrdId`,round(`i`.`investAmount`,2) AS `TransAmt`,ifnull(round((case `b`.`excitationType` when 2 then ((`i`.`investAmount` / `b`.`borrowAmount`) * `b`.`excitationSum`) when 3 then ((`b`.`borrowAmount` * `b`.`excitationSum`) * 0.01) else 0 end),2),0) AS `reward`,ifnull(round(`b`.`manageFee`,2),0) AS `totalFee`,ifnull(round(`b`.`manageFee`,2),0) AS `manageFee`,ifnull(round((case `d`.`isDeduction` when 1 then 0 when 2 then (case `d`.`fee` when 0 then ((`d`.`realityAmount` * `d`.`charge`) * 0.01) when 1 then `d`.`charge` end) end),2),0) AS `assuranceCharge`,`b`.`id` AS `subOrdId`,cast(`b`.`publishTime` as date) AS `SubOrdDate`,`c`.`ipayAccount` AS `InCustId`,cast(`i`.`investTime` as date) AS `OrdDate`,`i`.`trxId` AS `trxId`,`i`.`moneyRecord` AS `moneyRecord`,`i`.`investor` AS `investor`,`i`.`contract_id` AS `contract_id`,`g`.`ipayAccount` AS `assCustId`,`b`.`borrowWay` AS `borrowWay`,`b`.`annualRate` AS `annualRate`,`b`.`trxId` AS `freezeTrxId`,`b`.`frozen_margin` AS `frozen_margin`,`b`.`borrowAmount` AS `borrowAmount`,`b`.`publisher` AS `publisher` from (((((`t_invest` `i` left join `t_borrow` `b` on((`i`.`borrowId` = `b`.`id`))) left join `t_user` `u` on((`u`.`id` = `i`.`investor`))) left join `t_user` `c` on((`c`.`id` = `b`.`publisher`))) left join `t_assurance` `d` on(((`d`.`borrowId` = `b`.`id`) and (`d`.`realityAmount` > 0)))) left join `t_user` `g` on((`g`.`id` = `d`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_fundrecord_index
-- ----------------------------
DROP VIEW IF EXISTS `v_t_fundrecord_index`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_fundrecord_index` AS select `f`.`id` AS `id`,`f`.`userId` AS `userId`,`d`.`username` AS `username`,`f`.`fundMode` AS `fundMode`,`f`.`handleSum` AS `handleSum`,`f`.`usableSum` AS `usableSum`,`f`.`freezeSum` AS `freezeSum`,`f`.`dueinSum` AS `dueinSum`,date_format(`f`.`recordTime`,'%Y-%m-%d %H:%i:%s') AS `recordTime`,`f`.`dueoutSum` AS `dueoutSum`,ifnull(`tb`.`bankName`,`f`.`remarks`) AS `remarks`,`f`.`operateType` AS `operateType`,`f`.`oninvest` AS `oninvest`,`f`.`paynumber` AS `paynumber`,`f`.`paybank` AS `paybank`,`f`.`cost` AS `cost`,`f`.`income` AS `income`,`f`.`spending` AS `spending`,round(((`f`.`usableSum` + `f`.`freezeSum`) + `f`.`dueinSum`),2) AS `sum`,ifnull(`c`.`username`,'平台') AS `trader` from (((`t_fundrecord` `f` left join `t_user` `c` on((`f`.`trader` = `c`.`id`))) left join `t_user` `d` on((`d`.`id` = `f`.`userId`))) left join `t_csc_bankcode` `tb` on((`tb`.`bankCode` = `f`.`remarks`))) ;

-- ----------------------------
-- View structure for v_t_fundrecord_user
-- ----------------------------
DROP VIEW IF EXISTS `v_t_fundrecord_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_fundrecord_user` AS select `a`.`id` AS `id`,`a`.`userId` AS `userId`,`a`.`fundMode` AS `fundMode`,`a`.`handleSum` AS `handleSum`,`a`.`usableSum` AS `usableSum`,`a`.`freezeSum` AS `freezeSum`,`a`.`dueinSum` AS `dueinSum`,((`a`.`usableSum` + `a`.`freezeSum`) + `a`.`dueinSum`) AS `sum`,`a`.`recordTime` AS `recordTime`,`a`.`dueoutSum` AS `dueoutSum`,ifnull(`b`.`username`,'平台') AS `username` from (`t_fundrecord` `a` left join `t_user` `b` on((`a`.`trader` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_groupuser_user_person
-- ----------------------------
DROP VIEW IF EXISTS `v_t_groupuser_user_person`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_groupuser_user_person` AS select `t_group_user`.`id` AS `id`,`t_group_user`.`groupId` AS `groupId`,`t_group_user`.`userId` AS `userId`,`t_group`.`groupName` AS `groupName`,`t_user`.`username` AS `username`,`t_user`.`usableSum` AS `usableSum`,(`t_user`.`freezeSum` + `t_user`.`usableSum`) AS `allSum`,`t_user`.`dueinSum` AS `dueinSum`,`t_person`.`idNo` AS `idNo`,`t_person`.`realName` AS `realName`,`t_person`.`cellPhone` AS `cellPhone`,`t_user`.`email` AS `email` from (((`t_group_user` left join `t_group` on((`t_group_user`.`groupId` = `t_group`.`id`))) left join `t_user` on((`t_group_user`.`userId` = `t_user`.`id`))) left join `t_person` on((`t_group_user`.`userId` = `t_person`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_group_admin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_group_admin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_group_admin` AS select `t_group`.`id` AS `id`,`t_group`.`groupName` AS `groupName`,`t_group`.`groupRemark` AS `groupRemark`,`t_group`.`cashStatus` AS `cashStatus`,(select count(1) AS `count(1)` from `t_group_user` where (`t_group_user`.`groupId` = `t_group`.`id`)) AS `groupCount`,`t_admin`.`userName` AS `adminName` from (`t_group` left join `t_admin` on((`t_group`.`adminId` = `t_admin`.`id`))) ;

-- ----------------------------
-- View structure for v_t_group_for_amount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_group_for_amount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_group_for_amount` AS select sum((((`t_invest`.`recivedPrincipal` + `t_invest`.`recievedInterest`) - `t_invest`.`hasPrincipal`) - `t_invest`.`hasInterest`)) AS `forPI`,sum((`t_invest`.`recievedInterest` - `t_invest`.`hasInterest`)) AS `forInterest`,`t_invest`.`investor` AS `userId` from `t_invest` group by `t_invest`.`investor` ;

-- ----------------------------
-- View structure for v_t_group_managefee
-- ----------------------------
DROP VIEW IF EXISTS `v_t_group_managefee`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_group_managefee` AS select sum(`t_borrow`.`manageFee`) AS `manageFee`,`t_borrow`.`publisher` AS `userId` from `t_borrow` group by `t_borrow`.`publisher` ;

-- ----------------------------
-- View structure for v_t_group_user_amount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_group_user_amount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_group_user_amount` AS select (`t_user`.`usableSum` + `t_user`.`freezeSum`) AS `totalSum`,`t_user`.`usableSum` AS `usableSum`,`t_user`.`freezeSum` AS `freezeSum`,`t_user`.`id` AS `userId` from `t_user` ;

-- ----------------------------
-- View structure for v_t_group_vip
-- ----------------------------
DROP VIEW IF EXISTS `v_t_group_vip`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_group_vip` AS select sum(`t_vipsum`.`vipFee`) AS `vipFee`,`t_vipsum`.`userId` AS `userId` from `t_vipsum` group by `t_vipsum`.`userId` ;

-- ----------------------------
-- View structure for v_t_hasrepay_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_hasrepay_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_hasrepay_h` AS select `a`.`id` AS `id`,`c`.`username` AS `username`,`d`.`realName` AS `realName`,`b`.`publishTime` AS `publishTime`,`b`.`id` AS `borrowId`,`b`.`borrowTitle` AS `borrowTitle`,`a`.`repayPeriod` AS `repayPeriod`,`b`.`borrowWay` AS `borrowWay`,`b`.`isDayThe` AS `isDayThe`,`e`.`id` AS `borrowTypeSubId`,`e`.`name` AS `borrowWayName`,`b`.`loanUserId` AS `loanUserId`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,date_format(`a`.`realRepayDate`,'%Y-%m-%d') AS `realRepayDate`,`a`.`lateDay` AS `lateDay`,((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) AS `totalSum`,`a`.`lateFI` AS `lateFI`,`a`.`hasPI` AS `hasPI`,(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) + `a`.`lateFI`) AS `repaySum`,`a`.`isWebRepay` AS `isWebRepay`,`a`.`repayStatus` AS `repayStatus` from ((((`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) left join `t_borrow_sub_type` `e` on((`e`.`id` = `b`.`borrowTypeSubId`))) where ((`a`.`repayStatus` = 2) and (`b`.`borrowWay` < 6)) order by `c`.`id` desc,`b`.`id`,`a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_has_amount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_has_amount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_has_amount` AS select sum(`a`.`hasPI`) AS `hasPI`,`b`.`publisher` AS `userId` from (`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where (`a`.`repayStatus` = 2) group by `b`.`publisher` ;

-- ----------------------------
-- View structure for v_t_investtotal
-- ----------------------------
DROP VIEW IF EXISTS `v_t_investtotal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_investtotal` AS select `ti`.`investor` AS `investor`,sum(`ti`.`investAmount`) AS `totalAmount` from `t_invest` `ti` group by `ti`.`investor` ;

-- ----------------------------
-- View structure for v_t_invest_amount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_amount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_amount` AS select sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `userId` from (`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where (`b`.`borrowStatus` in (4,5)) group by `a`.`investor` union all select sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `userId` from (`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where (`b`.`borrowStatus` in (4,5)) group by `a`.`investor` ;

-- ----------------------------
-- View structure for v_t_invest_backaccount_list_
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_backaccount_list_`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_backaccount_list_` AS select `b`.`investor` AS `investor`,`b`.`id` AS `investorId`,`a`.`repayDate` AS `repayDate`,`d`.`username` AS `username`,`c`.`borrowTitle` AS `borrowTitle`,`c`.`id` AS `borrowId`,`c`.`borrowWay` AS `borrowWay`,`a`.`repayPeriod` AS `repayPeriod`,`c`.`annualRate` AS `annualRate`,`b`.`realAmount` AS `realAmount`,`c`.`isDayThe` AS `isDayThe`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `hasPay`,(((`a`.`recivedPrincipal` + `a`.`recivedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) AS `forPay` from (((`t_invest_repayment` `a` left join `t_invest` `b` on((`a`.`invest_id` = `b`.`id`))) left join `t_borrow` `c` on((`b`.`borrowId` = `c`.`id`))) left join `t_user` `d` on((`c`.`publisher` = `d`.`id`))) where ((`a`.`repayStatus` = 1) and (`a`.`isWebRepay` = 1)) order by `a`.`invest_id`,`d`.`username`,`c`.`borrowTitle`,`a`.`repayDate`,`a`.`repayPeriod` ;

-- ----------------------------
-- View structure for v_t_invest_backacount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_backacount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_backacount` AS select `a`.`borrowId` AS `borrowId`,sum(((((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) + `a`.`investorForpayFI`) - `a`.`investorHaspayFI`)) AS `forTotalSum`,sum((`a`.`hasPI` + `a`.`investorHaspayFI`)) AS `forHasSum` from `t_repayment` `a` group by `a`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_invest_backacount_sum
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_backacount_sum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_backacount_sum` AS select `b`.`investor` AS `investor`,`b`.`borrowId` AS `borrowId`,sum(`b`.`realAmount`) AS `realAmount`,sum(truncate(((`b`.`realAmount` / `d`.`borrowAmount`) * `c`.`forTotalSum`),4)) AS `forTotalSum`,sum(truncate(((`b`.`realAmount` / `d`.`borrowAmount`) * `c`.`forHasSum`),4)) AS `forHasSum` from ((`t_invest` `b` left join `v_t_invest_backacount` `c` on((`b`.`borrowId` = `c`.`borrowId`))) left join `v_t_invest_borrow_list` `d` on((`b`.`borrowId` = `d`.`id`))) where (`c`.`borrowId` is not null) group by `b`.`investor`,`b`.`borrowId` union all select `b`.`investor` AS `investor`,`b`.`borrowId` AS `borrowId`,sum(`b`.`realAmount`) AS `realAmount`,sum(truncate(((`b`.`realAmount` / `d`.`borrowAmount`) * `c`.`forTotalSum`),4)) AS `forTotalSum`,sum(truncate(((`b`.`realAmount` / `d`.`borrowAmount`) * `c`.`forHasSum`),4)) AS `forHasSum` from ((`t_invest_history` `b` left join `v_t_invest_backacount` `c` on((`b`.`borrowId` = `c`.`borrowId`))) left join `v_t_invest_borrow_list` `d` on((`b`.`borrowId` = `d`.`id`))) where (`c`.`borrowId` is not null) group by `b`.`investor`,`b`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_invest_borrow
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_borrow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_borrow` AS select `a`.`id` AS `id`,`a`.`investor` AS `investor`,`a`.`borrowId` AS `borrowId`,`a`.`investAmount` AS `investAmount`,`a`.`download_url` AS `download_url`,`a`.`viewpdf_url` AS `viewpdf_url`,`a`.`investTime` AS `investTime` from `t_invest` `a` union all select `a`.`id` AS `id`,`a`.`investor` AS `investor`,`a`.`borrowId` AS `borrowId`,`a`.`investAmount` AS `investAmount`,`a`.`download_url` AS `download_url`,`a`.`viewpdf_url` AS `viewpdf_url`,`a`.`investTime` AS `investTime` from `t_invest_history` `a` ;

-- ----------------------------
-- View structure for v_t_invest_borrow_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_borrow_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_borrow_list` AS select `b`.`id` AS `id`,`c`.`username` AS `borrower`,`b`.`borrowAmount` AS `borrowAmount`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`borrowWay` AS `borrowWay`,`b`.`borrowStatus` AS `borrowStatus`,`b`.`paymentMode` AS `paymentMode`,`b`.`annualRate` AS `annualRate`,`b`.`deadline` AS `deadline`,`b`.`isDayThe` AS `isDayThe`,`b`.`borrowShow` AS `borrowShow`,`b`.`borrowTypeSubId` AS `borrowTypeSubId`,`b`.`showRate` AS `showRate`,`d`.`name` AS `borrowWayName`,date_format(`b`.`publishTime`,'%Y-%m-%d %T') AS `publishTime`,`f_credit_rating`(`c`.`creditrating`) AS `credit`,`c`.`creditrating` AS `creditrating`,`f_injectPoint`(((`b`.`hasInvestAmount` / `b`.`borrowAmount`) * 100)) AS `schedules`,time_format(timediff(`b`.`remainTimeEnd`,`b`.`remainTimeStart`),'%H小时%i分%s秒') AS `times` from ((`t_borrow` `b` left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `b`.`borrowTypeSubId`))) order by `b`.`remainTimeEnd` ;

-- ----------------------------
-- View structure for v_t_invest_borrow_sum_trun
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_borrow_sum_trun`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_borrow_sum_trun` AS select `a`.`id` AS `investid`,`a`.`investor` AS `investor`,`a`.`borrowId` AS `borrowId`,`a`.`realAmount` AS `realAmount`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `forTotalSum` from `t_invest` `a` where (`a`.`repayStatus` = 2) ;

-- ----------------------------
-- View structure for v_t_invest_flow
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_flow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_flow` AS select `a`.`id` AS `id`,`a`.`investor` AS `investor`,`a`.`borrowId` AS `borrowid`,`a`.`realAmount` AS `realamount`,`a`.`viewpdf_url` AS `viewpdf_url`,`a`.`download_url` AS `download_url`,`a`.`isDebt` AS `isdebt`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `fortotalsum` from `t_invest` `a` where (`a`.`circulationForpayStatus` = 2) ;

-- ----------------------------
-- View structure for v_t_invest_forpay_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_forpay_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_forpay_detail` AS select `a`.`borrowId` AS `borrowId`,`a`.`repayPeriod` AS `repayPeriod`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) * (`a`.`stillPrincipal` / (`a`.`stillPrincipal` + `a`.`stillInterest`))) AS `forpayPrincipal`,(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) * (`a`.`stillInterest` / (`a`.`stillPrincipal` + `a`.`stillInterest`))) AS `forpayInterest`,`a`.`principalBalance` AS `principalBalance`,(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) * ((`a`.`stillInterest` / (`a`.`stillPrincipal` + `a`.`stillInterest`)) * 0.1)) AS `manage`,`a`.`isLate` AS `isLate`,`a`.`lateDay` AS `lateDay`,(`a`.`investorForpayFI` - `a`.`investorHaspayFI`) AS `forFI`,(((((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) * (`a`.`stillInterest` / (`a`.`stillPrincipal` + `a`.`stillInterest`))) * (1 - 0.1)) + (`a`.`investorForpayFI` - `a`.`investorHaspayFI`)) AS `earn`,`c`.`username` AS `username`,`a`.`isWebRepay` AS `isWebRepay` from ((`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) where (`a`.`repayStatus` <> 2) ;

-- ----------------------------
-- View structure for v_t_invest_haspay_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_haspay_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_haspay_detail` AS select `a`.`borrowId` AS `borrowId`,`a`.`repayPeriod` AS `repayPeriod`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,(`a`.`hasPI` * (`a`.`stillPrincipal` / (`a`.`stillPrincipal` + `a`.`stillInterest`))) AS `forpayPrincipal`,(`a`.`hasPI` * (`a`.`stillInterest` / (`a`.`stillPrincipal` + `a`.`stillInterest`))) AS `forpayInterest`,`a`.`principalBalance` AS `principalBalance`,(`a`.`hasPI` * ((`a`.`stillInterest` / (`a`.`stillPrincipal` + `a`.`stillInterest`)) * 0.008)) AS `manage`,`a`.`isLate` AS `isLate`,`a`.`lateDay` AS `lateDay`,`a`.`investorHaspayFI` AS `forFI`,(((`a`.`hasPI` * (`a`.`stillInterest` / (`a`.`stillPrincipal` + `a`.`stillInterest`))) * (1 - 0.008)) + `a`.`investorHaspayFI`) AS `earn`,`c`.`username` AS `username`,`a`.`isWebRepay` AS `isWebRepay` from ((`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) where (`a`.`repayStatus` = 2) ;

-- ----------------------------
-- View structure for v_t_invest_interest_statis
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_interest_statis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_interest_statis` AS (select `c`.`id` AS `id`,`c`.`username` AS `investor`,`d`.`realName` AS `realName`,`a`.`manageFee` AS `manageFee`,(`a`.`manageFee` + `a`.`recievedInterest`) AS `manageFI`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `hasPI`,`a`.`hasInterest` AS `hasInterest`,(`a`.`recievedInterest` - `a`.`hasInterest`) AS `forInterest`,(((`a`.`recivedPrincipal` + `a`.`recievedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) AS `forPI`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime` from (((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`)))) union all (select `c`.`id` AS `id`,`c`.`username` AS `investor`,`d`.`realName` AS `realName`,`a`.`manageFee` AS `manageFee`,(`a`.`manageFee` + `a`.`recievedInterest`) AS `manageFI`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `hasPI`,`a`.`hasInterest` AS `hasInterest`,(`a`.`recievedInterest` - `a`.`hasInterest`) AS `forInterest`,(((`a`.`recivedPrincipal` + `a`.`recievedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`) AS `forPI`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime` from (((`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`)))) ;

-- ----------------------------
-- View structure for v_t_invest_rank
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_rank`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_rank` AS (select `a`.`id` AS `id`,`b`.`id` AS `borrowId`,`a`.`investor` AS `userId`,`e`.`groupId` AS `groupId`,`f`.`groupName` AS `groupName`,`c`.`username` AS `investor`,`d`.`realName` AS `realName`,sum(`a`.`realAmount`) AS `realAmount`,(`c`.`usableSum` + `c`.`freezeSum`) AS `totalSum`,`c`.`usableSum` AS `usableSum`,round(sum((((`a`.`recivedPrincipal` + `a`.`recievedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`)),2) AS `forPI`,`c`.`rating` AS `rating`,`c`.`creditrating` AS `creditrating`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime` from (((((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) left join `t_group_user` `e` on((`a`.`investor` = `e`.`userId`))) left join `t_group` `f` on((`e`.`groupId` = `f`.`id`))) group by `a`.`investor`) union all (select `a`.`id` AS `id`,`b`.`id` AS `borrowId`,`a`.`investor` AS `userId`,`e`.`groupId` AS `groupId`,`f`.`groupName` AS `groupName`,`c`.`username` AS `investor`,`d`.`realName` AS `realName`,sum(`a`.`realAmount`) AS `realAmount`,(`c`.`usableSum` + `c`.`freezeSum`) AS `totalSum`,`c`.`usableSum` AS `usableSum`,round(sum((((`a`.`recivedPrincipal` + `a`.`recievedInterest`) - `a`.`hasPrincipal`) - `a`.`hasInterest`)),2) AS `forPI`,`c`.`rating` AS `rating`,`c`.`creditrating` AS `creditrating`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime` from (((((`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) left join `t_group_user` `e` on((`a`.`investor` = `e`.`userId`))) left join `t_group` `f` on((`e`.`groupId` = `f`.`id`))) group by `a`.`investor`) ;

-- ----------------------------
-- View structure for v_t_invest_recycled
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_recycled`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_recycled` AS select `a`.`borrowId` AS `borrowId`,sum((`a`.`hasPI` + `a`.`investorHaspayFI`)) AS `forTotalSum` from `t_repayment` `a` where (`a`.`repayStatus` = 2) group by `a`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_invest_recycled_
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_recycled_`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_recycled_` AS select `a`.`borrowId` AS `borrowId`,sum((`a`.`hasPI` + `a`.`investorHaspayFI`)) AS `forTotalSum` from `t_repayment` `a` where ((`a`.`repayStatus` = 2) or (`a`.`isWebRepay` = 2)) group by `a`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_invest_recycled_sum_
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_recycled_sum_`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_recycled_sum_` AS select `b`.`id` AS `bid`,`b`.`investor` AS `investor`,`b`.`borrowId` AS `borrowid`,`b`.`realAmount` AS `realamount`,`b`.`viewpdf_url` AS `viewpdf_url`,`b`.`download_url` AS `download_url`,`b`.`isDebt` AS `isdebt`,(select sum((case when ((`t_invest_repayment`.`isWebRepay` = 1) and (`t_invest_repayment`.`repayStatus` = 2)) then ((`t_invest_repayment`.`hasPrincipal` + `t_invest_repayment`.`hasInterest`) + `t_invest_repayment`.`recivedFI`) else (`t_invest_repayment`.`hasPrincipal` + `t_invest_repayment`.`hasInterest`) end)) AS `totalsum` from `t_invest_repayment` where ((`t_invest_repayment`.`owner` = `b`.`investor`) and (`t_invest_repayment`.`invest_id` = `b`.`id`))) AS `fortotalsum` from ((`t_invest` `b` left join `v_t_invest_recycled_` `c` on((`b`.`borrowId` = `c`.`borrowId`))) left join `v_t_invest_borrow_list` `d` on((`b`.`borrowId` = `d`.`id`))) where (`c`.`borrowId` is not null) union select `b`.`id` AS `id`,`b`.`investor` AS `investor`,`b`.`borrowId` AS `borrowid`,`b`.`realAmount` AS `realamount`,`b`.`viewpdf_url` AS `viewpdf_url`,`b`.`download_url` AS `download_url`,`b`.`isDebt` AS `isdebt`,(select sum((case when ((`t_invest_repayment`.`isWebRepay` = 1) and (`t_invest_repayment`.`repayStatus` = 2)) then ((`t_invest_repayment`.`hasPrincipal` + `t_invest_repayment`.`hasInterest`) + `t_invest_repayment`.`recivedFI`) else (`t_invest_repayment`.`hasPrincipal` + `t_invest_repayment`.`hasInterest`) end)) AS `totalsum` from `t_invest_repayment` where ((`t_invest_repayment`.`owner` = `b`.`investor`) and (`t_invest_repayment`.`invest_id` = `b`.`id`))) AS `fortotalsum` from ((`t_invest_history` `b` left join `v_t_invest_recycled_` `c` on((`b`.`borrowId` = `c`.`borrowId`))) left join `v_t_invest_borrow_list` `d` on((`b`.`borrowId` = `d`.`id`))) where (`c`.`borrowId` is not null) ;

-- ----------------------------
-- View structure for v_t_invest_recycling
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_recycling`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_recycling` AS select `a`.`borrowId` AS `borrowId`,sum((`a`.`hasPI` + `a`.`investorHaspayFI`)) AS `forTotalSum` from `t_repayment` `a` where (`a`.`repayStatus` <> 2) group by `a`.`borrowId` ;

-- ----------------------------
-- View structure for v_t_invest_recycling_my
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_recycling_my`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_recycling_my` AS select `a`.`investor` AS `investor`,`a`.`borrowId` AS `borrowId`,(select date_format(`e`.`repayDate`,'%Y-%m-%d') AS `repayDate` from `t_repayment` `e` where ((`e`.`borrowId` = `a`.`borrowId`) and isnull(`e`.`realRepayDate`)) group by `e`.`repayDate` limit 0,1) AS `recentlyRepayDate`,round(`a`.`realAmount`,2) AS `realAmount`,`a`.`id` AS `aid`,`a`.`download_url` AS `download_url`,`a`.`viewpdf_url` AS `viewpdf_url`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`deadline` AS `deadline`,`b`.`annualRate` AS `annualRate`,`b`.`isDayThe` AS `isDayThe`,date_format(`b`.`publishTime`,'%Y-%m-%d %T') AS `publishTime`,sum(round((`a`.`hasPrincipal` + `a`.`hasInterest`),2)) AS `forTotalSum`,sum(round((`a`.`recivedPrincipal` + `a`.`recievedInterest`),2)) AS `forTotalRecived`,`d`.`name` AS `borrowWayName` from (((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_borrow_sub_type` `d` on((`d`.`id` = `b`.`borrowTypeSubId`))) where ((`b`.`borrowStatus` = 4) and (`a`.`repayStatus` = 1)) group by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_invest_recycling_sum
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_recycling_sum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_recycling_sum` AS select `a`.`id` AS `id`,`a`.`investor` AS `investor`,`a`.`borrowId` AS `borrowId`,`c`.`username` AS `borrower`,`f_credit_rating`(`c`.`creditrating`) AS `credit`,`c`.`creditrating` AS `creditrating`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`borrowWay` AS `borrowWay`,`b`.`annualRate` AS `annualRate`,`b`.`isDayThe` AS `isDayThe`,`a`.`isDebt` AS `isDebt`,`a`.`realAmount` AS `realAmount`,`b`.`borrowStatus` AS `borrowStatus`,(`a`.`hasPrincipal` + `a`.`hasInterest`) AS `forTotalSum` from ((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) ;

-- ----------------------------
-- View structure for v_t_invest_statis
-- ----------------------------
DROP VIEW IF EXISTS `v_t_invest_statis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_invest_statis` AS (select `a`.`firstInvest` AS `firstInvest`,`a`.`lastInvest` AS `lastInvest`,`a`.`maxInvest` AS `maxInvest`,`a`.`viewpdf_url` AS `viewpdf_url`,`a`.`download_url` AS `download_url`,`c`.`id` AS `userId`,`c`.`isInvestAmt` AS `isInvestAmt`,`person`.`realName` AS `realName`,`a`.`id` AS `id`,`e`.`groupId` AS `groupid`,`f`.`groupName` AS `groupName`,`c`.`username` AS `investor`,`a`.`realAmount` AS `realAmount`,`d`.`username` AS `borrower`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`borrowWay` AS `borrowWay`,`b`.`deadline` AS `deadline`,`b`.`borrowStatus` AS `borrowStatus`,`b`.`isAutoBid` AS `isAutoBid`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime`,`g`.`id` AS `borrowTypeSubId`,`g`.`name` AS `borrowWayName`,`tru`.`username` AS `recommendUsername`,`tp`.`realName` AS `recommendrealName` from (((((((((`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) left join `t_person` `person` on((`c`.`id` = `person`.`userId`))) left join `v_t_user_recommend` `tru` on((`c`.`id` = `tru`.`userId`))) left join `t_person` `tp` on((`tru`.`recommendUserId` = `tp`.`userId`))) left join `t_user` `d` on((`b`.`publisher` = `d`.`id`))) left join `t_group_user` `e` on((`a`.`investor` = `e`.`userId`))) left join `t_group` `f` on((`e`.`groupId` = `f`.`id`))) left join `t_borrow_sub_type` `g` on((`g`.`id` = `b`.`borrowTypeSubId`)))) union all (select `a`.`firstInvest` AS `firstInvest`,`a`.`lastInvest` AS `lastInvest`,`a`.`maxInvest` AS `maxInvest`,`a`.`viewpdf_url` AS `viewpdf_url`,`a`.`download_url` AS `download_url`,`c`.`id` AS `userId`,`c`.`isInvestAmt` AS `isInvestAmt`,`person`.`realName` AS `realName`,`a`.`id` AS `id`,`e`.`groupId` AS `groupid`,`f`.`groupName` AS `groupName`,`c`.`username` AS `investor`,`a`.`realAmount` AS `realAmount`,`d`.`username` AS `borrower`,`b`.`borrowTitle` AS `borrowTitle`,`b`.`borrowWay` AS `borrowWay`,`b`.`deadline` AS `deadline`,`b`.`borrowStatus` AS `borrowStatus`,`b`.`isAutoBid` AS `isAutoBid`,date_format(`a`.`investTime`,'%Y-%m-%d %T') AS `investTime`,`g`.`id` AS `borrowTypeSubId`,`g`.`name` AS `borrowWayName`,`tru`.`username` AS `recommendUsername`,`tp`.`realName` AS `recommendrealName` from (((((((((`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`a`.`investor` = `c`.`id`))) left join `t_person` `person` on((`c`.`id` = `person`.`userId`))) left join `v_t_user_recommend` `tru` on((`c`.`id` = `tru`.`userId`))) left join `t_person` `tp` on((`tru`.`recommendUserId` = `tp`.`userId`))) left join `t_user` `d` on((`b`.`publisher` = `d`.`id`))) left join `t_group_user` `e` on((`a`.`investor` = `e`.`userId`))) left join `t_group` `f` on((`e`.`groupId` = `f`.`id`))) left join `t_borrow_sub_type` `g` on((`g`.`id` = `b`.`borrowTypeSubId`)))) ;

-- ----------------------------
-- View structure for v_t_laterepay_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_laterepay_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_laterepay_h` AS select `a`.`id` AS `id`,`c`.`username` AS `username`,`d`.`realName` AS `realName`,`b`.`id` AS `borrowId`,`b`.`borrowTitle` AS `borrowTitle`,`a`.`repayPeriod` AS `repayPeriod`,`b`.`borrowTypeSubId` AS `borrowWay`,`b`.`loanUserId` AS `loanUserId`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,`a`.`lateDay` AS `lateDay`,((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) AS `totalSum`,`a`.`lateFI` AS `lateFI`,(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) + `a`.`lateFI`) AS `repaySum`,`a`.`isWebRepay` AS `isWebRepay`,`a`.`repayStatus` AS `repayStatus` from (((`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) where ((`a`.`isLate` = 2) and (`b`.`borrowWay` < 6)) order by `c`.`id` desc,`b`.`id`,`a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_level1_34
-- ----------------------------
DROP VIEW IF EXISTS `v_t_level1_34`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_level1_34` AS select `a`.`userId` AS `userId`,`a`.`level1userId` AS `level1userId`,`a`.`level2userId` AS `level2userId`,sum(`a`.`level2money`) AS `level2moneys`,`a`.`level` AS `level`,`b`.`creditrating` AS `creditrating`,`b`.`rating` AS `rating`,`b`.`username` AS `userName`,`c`.`realName` AS `realName`,`c`.`idNo` AS `idNo`,`d`.`realName` AS `level2realName`,`d`.`userName` AS `level2userName`,`d`.`addDate` AS `addDate` from (((`t_award` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) left join `t_admin` `d` on((`a`.`level2userId` = `d`.`id`))) group by `a`.`level1userId`,`a`.`level2userId`,`a`.`userId` ;

-- ----------------------------
-- View structure for v_t_level2_award
-- ----------------------------
DROP VIEW IF EXISTS `v_t_level2_award`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_level2_award` AS select `a`.`peopleId` AS `peopleId`,`a`.`parentId` AS `parentId`,`c`.`userName` AS `userName`,`c`.`realName` AS `relaName`,`c`.`card` AS `card`,`c`.`addDate` AS `addDate`,`c`.`enable` AS `enable`,sum(`b`.`level2money`) AS `level2moneys` from ((`t_relation` `a` left join `t_award` `b` on(((`a`.`peopleId` = `b`.`level2userId`) and (`a`.`level` = 2)))) left join `t_admin` `c` on((`a`.`peopleId` = `c`.`id`))) where (`a`.`level` = 2) group by `a`.`peopleId` ;

-- ----------------------------
-- View structure for v_t_login_session_verify
-- ----------------------------
DROP VIEW IF EXISTS `v_t_login_session_verify`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_login_session_verify` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tm1`.`auditStatus` AS `identyauditStatus`,`tm2`.`auditStatus` AS `workauditStatus`,`tm3`.`auditStatus` AS `addryauditStatus`,`tm4`.`auditStatus` AS `responsauditStatus`,`tm5`.`auditStatus` AS `incomeauditStatus`,`tm6`.`auditStatus` AS `fcyauditStatus`,`tm7`.`auditStatus` AS `gcauditStatus`,`tm8`.`auditStatus` AS `jhauditStatus`,`tm9`.`auditStatus` AS `xlauditStatus`,`tm10`.`auditStatus` AS `jsauditStatus`,`tm11`.`auditStatus` AS `sjauditStatus`,`tm12`.`auditStatus` AS `wbauditStatus`,`tm13`.`auditStatus` AS `spauditStatus`,`tm14`.`auditStatus` AS `xcauditStatus`,`tm15`.`auditStatus` AS `dbauditStatus`,`tm16`.`auditStatus` AS `dyauditStatus` from ((((((((((((((((`t_user` `tuser` left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 5)))) left join `t_materialsauth` `tm6` on(((`tuser`.`id` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 6)))) left join `t_materialsauth` `tm7` on(((`tuser`.`id` = `tm7`.`userId`) and (`tm7`.`materAuthTypeId` = 7)))) left join `t_materialsauth` `tm8` on(((`tuser`.`id` = `tm8`.`userId`) and (`tm8`.`materAuthTypeId` = 8)))) left join `t_materialsauth` `tm9` on(((`tuser`.`id` = `tm9`.`userId`) and (`tm9`.`materAuthTypeId` = 9)))) left join `t_materialsauth` `tm10` on(((`tuser`.`id` = `tm10`.`userId`) and (`tm10`.`materAuthTypeId` = 10)))) left join `t_materialsauth` `tm11` on(((`tuser`.`id` = `tm11`.`userId`) and (`tm11`.`materAuthTypeId` = 11)))) left join `t_materialsauth` `tm12` on(((`tuser`.`id` = `tm12`.`userId`) and (`tm12`.`materAuthTypeId` = 12)))) left join `t_materialsauth` `tm13` on(((`tuser`.`id` = `tm13`.`userId`) and (`tm13`.`materAuthTypeId` = 13)))) left join `t_materialsauth` `tm14` on(((`tuser`.`id` = `tm14`.`userId`) and (`tm14`.`materAuthTypeId` = 14)))) left join `t_materialsauth` `tm15` on(((`tuser`.`id` = `tm15`.`userId`) and (`tm15`.`materAuthTypeId` = 15)))) left join `t_materialsauth` `tm16` on(((`tuser`.`id` = `tm16`.`userId`) and (`tm16`.`materAuthTypeId` = 16)))) group by `tuser`.`id` ;

-- ----------------------------
-- View structure for v_t_login_statis
-- ----------------------------
DROP VIEW IF EXISTS `v_t_login_statis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_login_statis` AS select `a`.`id` AS `id`,`a`.`username` AS `username`,`b`.`realName` AS `realName`,date_format(`a`.`lastDate`,'%Y-%m-%d %T') AS `lastDate`,`a`.`lastIP` AS `lastIP`,`a`.`loginCount` AS `loginCount` from (`t_user` `a` left join `t_person` `b` on((`a`.`id` = `b`.`userId`))) order by `a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_mail_user
-- ----------------------------
DROP VIEW IF EXISTS `v_t_mail_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_mail_user` AS select `m`.`id` AS `id`,`m`.`mailTitle` AS `mailTitle`,`m`.`sendTime` AS `sendTime`,ifnull(`send`.`username`,'admin') AS `sendName`,ifnull(`re`.`username`,'admin') AS `reviceName`,`m`.`mailType` AS `mailType`,`m`.`mailStatus` AS `mailStatus`,`m`.`sender` AS `sender`,`m`.`reciver` AS `reciver` from ((`t_mail` `m` left join `t_user` `send` on((`m`.`sender` = `send`.`id`))) left join `t_user` `re` on((`m`.`reciver` = `re`.`id`))) ;

-- ----------------------------
-- View structure for v_t_mail_user_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_mail_user_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_mail_user_detail` AS select `m`.`id` AS `id`,`m`.`mailTitle` AS `mailTitle`,`m`.`sendTime` AS `sendTime`,ifnull(`send`.`username`,'admin') AS `sendName`,ifnull(`re`.`username`,'admin') AS `reviceName`,`m`.`mailType` AS `mailType`,`m`.`mailStatus` AS `mailStatus`,`m`.`mailContent` AS `mailContent`,`m`.`sender` AS `sender`,`m`.`reciver` AS `reciver` from ((`t_mail` `m` left join `t_user` `send` on((`m`.`sender` = `send`.`id`))) left join `t_user` `re` on((`m`.`reciver` = `re`.`id`))) ;

-- ----------------------------
-- View structure for v_t_news_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_news_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_news_list` AS select `t_news`.`id` AS `id`,`t_news`.`title` AS `title`,`t_news`.`content` AS `content`,date_format(`t_news`.`publishTime`,'%Y-%m-%d %H:%s:%m') AS `publishTime`,`t_news`.`sort` AS `sort`,`t_news`.`userId` AS `userId`,`t_news`.`visits` AS `visits`,`t_news`.`state` AS `state`,`t_news`.`announcementType` AS `announcementType`,`t_admin`.`userName` AS `userName` from (`t_news` left join `t_admin` on((`t_news`.`userId` = `t_admin`.`id`))) ;

-- ----------------------------
-- View structure for v_t_newusercheck
-- ----------------------------
DROP VIEW IF EXISTS `v_t_newusercheck`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_newusercheck` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tuser`.`creditrating` AS `creditrating`,`tm`.`passTime` AS `passTime`,count((case when (`tm`.`auditStatus` = 1) then `tm`.`auditStatus` end)) AS `nocheck`,`ta`.`userName` AS `tausername` from ((`t_user` `tuser` left join `t_materialsauth` `tm` on((`tuser`.`id` = `tm`.`userId`))) left join `t_admin` `ta` on((`ta`.`id` = `tuser`.`adminId`))) where isnull(`ta`.`userName`) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_new_invest_statis
-- ----------------------------
DROP VIEW IF EXISTS `v_t_new_invest_statis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_new_invest_statis` AS select `a`.`id` AS `id`,`c`.`username` AS `investor`,`d`.`realName` AS `realName`,`a`.`investTime` AS `investTime`,round(sum((`b`.`hasInterest` - `b`.`iManageFee`)),2) AS `manageFI`,round(sum((`b`.`hasPrincipal` + `b`.`hasInterest`)),2) AS `hasPI`,round(sum(`b`.`hasInterest`),2) AS `hasInterest`,round(sum(`b`.`iManageFee`),2) AS `manageFee`,round(sum((`b`.`recivedInterest` - `b`.`hasInterest`)),2) AS `forInterest`,round(sum((((`b`.`recivedInterest` + `b`.`recivedPrincipal`) - `b`.`hasInterest`) - `b`.`recivedPrincipal`)),2) AS `forPI` from (((`t_invest` `a` join `t_invest_repayment` `b` on((`a`.`id` = `b`.`invest_id`))) left join `t_user` `c` on((`b`.`owner` = `c`.`id`))) left join `t_person` `d` on((`c`.`id` = `d`.`userId`))) group by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_noshangchuan
-- ----------------------------
DROP VIEW IF EXISTS `v_t_noshangchuan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_noshangchuan` AS select count(0) AS `noshangchuan`,`tuser`.`id` AS `id`,`tuser`.`username` AS `username` from (`t_materialsauth` `tm` left join `t_user` `tuser` on((`tuser`.`id` = `tm`.`userId`))) where (isnull(`tm`.`auditStatus`) and (`tm`.`materAuthTypeId` > 5)) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_overduepayment_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_overduepayment_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_overduepayment_h` AS select `a`.`id` AS `id`,`c`.`username` AS `username`,`d`.`realName` AS `realName`,`b`.`id` AS `borrowId`,`b`.`borrowTitle` AS `borrowTitle`,`a`.`repayPeriod` AS `repayPeriod`,`b`.`borrowWay` AS `borrowWay`,`e`.`id` AS `borrowTypeSubId`,`e`.`name` AS `borrowWayName`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,`a`.`lateDay` AS `lateDay`,`b`.`loanUserId` AS `loanUserId`,((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) AS `totalSum`,`a`.`lateFI` AS `lateFI`,(((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) + `a`.`lateFI`) AS `repaySum`,`a`.`isWebRepay` AS `isWebRepay`,`a`.`repayStatus` AS `repayStatus` from ((((`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) left join `t_borrow_sub_type` `e` on((`e`.`id` = `b`.`borrowTypeSubId`))) where ((`a`.`isLate` = 2) and (`a`.`repayStatus` = 1) and (`b`.`borrowWay` < 6)) order by `c`.`id` desc,`b`.`id`,`a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_pasttime
-- ----------------------------
DROP VIEW IF EXISTS `v_t_pasttime`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_pasttime` AS select count(0) AS `pass`,`tuser`.`id` AS `id` from (`t_materialsauth` `tm` left join `t_user` `tuser` on((`tuser`.`id` = `tm`.`userId`))) where ((`tm`.`auditStatus` = 2) and (now() > `tm`.`passTime`)) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_personage_apply
-- ----------------------------
DROP VIEW IF EXISTS `v_t_personage_apply`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_personage_apply` AS select `a`.`id` AS `id`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`deadline` AS `deadline`,`a`.`tname` AS `tname`,`a`.`telephone` AS `telephone`,`a`.`cityaddress` AS `address`,`a`.`state` AS `state`,`b`.`authStep` AS `authStep`,`b`.`userId` AS `userId` from (`t_apply` `a` left join `t_borrow_role` `b` on((`a`.`id` = `b`.`applyId`))) where (`a`.`state` = 1) group by `a`.`id` ;

-- ----------------------------
-- View structure for v_t_personcheck
-- ----------------------------
DROP VIEW IF EXISTS `v_t_personcheck`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_personcheck` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tuser`.`email` AS `email`,`tp`.`realName` AS `realName`,`tp`.`idNo` AS `idNo`,`tuser`.`createTime` AS `createTime`,`tp`.`auditStatus` AS `personauditStatus`,`tp`.`cellPhone` AS `cellPhone`,`tw`.`auditStatus` AS `workauditStatus`,`tw`.`directedStatus` AS `directedStatus`,`tw`.`otherStatus` AS `otherStatus`,`tw`.`moredStatus` AS `moredStatus`,`ta`.`userName` AS `service`,ifnull(((`tw`.`directedStatus` + `tw`.`otherStatus`) + `tw`.`moredStatus`),0) AS `cccc` from (((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_workauth` `tw` on((`tuser`.`id` = `tw`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) ;

-- ----------------------------
-- View structure for v_t_per_picture
-- ----------------------------
DROP VIEW IF EXISTS `v_t_per_picture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_per_picture` AS select `tuser`.`id` AS `id`,`tm`.`materAuthTypeId` AS `materAuthTypeId`,`tuser`.`username` AS `username`,`tmd`.`id` AS `tmdid`,`tmd`.`imagePath` AS `imagePath`,`tmd`.`option` AS `tmdoption`,`tmd`.`visiable` AS `visiable`,`tmy`.`name` AS `tmyname`,`tmd`.`auditStatus` AS `auditStatus`,`tm`.`id` AS `tmid` from (((`t_materialimagedetal` `tmd` left join `t_materialsauth` `tm` on((`tmd`.`materialsauthid` = `tm`.`id`))) left join `t_user` `tuser` on((`tuser`.`id` = `tm`.`userId`))) left join `t_materialsauthtype` `tmy` on((`tm`.`materAuthTypeId` = `tmy`.`id`))) ;

-- ----------------------------
-- View structure for v_t_phone_banding_review
-- ----------------------------
DROP VIEW IF EXISTS `v_t_phone_banding_review`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_phone_banding_review` AS select `tp`.`auditStatus` AS `auditStatus`,`tpbi`.`id` AS `tpbiid`,`tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`a`.`co` AS `amountall`,`tp`.`realName` AS `realName`,`tp`.`cellPhone` AS `cellPhone`,`tpbi`.`requsetTime` AS `requsetTime` from (((`t_person` `tp` left join `t_user` `tuser` on((`tuser`.`id` = `tp`.`userId`))) left join `t_phone_binding_info` `tpbi` on((`tp`.`userId` = `tpbi`.`userId`))) left join `v_t_phone_invsert` `a` on((`a`.`tiv` = `tp`.`userId`))) where (`tuser`.`id` is not null) group by `tp`.`userId` ;

-- ----------------------------
-- View structure for v_t_phone_invsert
-- ----------------------------
DROP VIEW IF EXISTS `v_t_phone_invsert`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_phone_invsert` AS select sum(`ti`.`investAmount`) AS `co`,`ti`.`investor` AS `tiv` from `t_invest` `ti` group by `ti`.`investor` ;

-- ----------------------------
-- View structure for v_t_recharge_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_recharge_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_recharge_detail` AS select `a`.`userId` AS `userId`,`a`.`id` AS `id`,`a`.`rechargeMoney` AS `rechargeMoney`,`a`.`result` AS `result`,`a`.`rechargeNumber` AS `rechargeNumber`,`a`.`rechargeTime` AS `rechargeTime`,`a`.`rechargeType` AS `rechargeType`,`a`.`remark` AS `remark`,`b`.`username` AS `username`,`b`.`mobilePhone` AS `mobilePhone`,`c`.`realName` AS `realName`,`c`.`idNo` AS `idNo`,`a`.`bankName` AS `bankName` from ((`t_recharge_detail` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_recommendfriend_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_recommendfriend_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_recommendfriend_list` AS select `t_user`.`username` AS `username`,`t_user`.`isEmployeeReferral` AS `isEmployeeReferral`,date_format(`t_user`.`vipCreateTime`,'%Y-%m-%d %H:%m:%s') AS `vipCreateTime`,date_format(`t_user`.`createTime`,'%Y-%m-%d %H:%m:%s') AS `createTime`,`t_money`.`money` AS `money`,`t_recommend_user`.`recommendUserId` AS `recommendUserId`,`t_recommend_user`.`userId` AS `userId`,`t_recommend_user`.`rewardMoney` AS `rewardMoney`,date_format(`t_recommend_user`.`rewardTime`,'%Y-%m-%d %H:%m:%s') AS `rewardTime`,`t_money`.`id` AS `mId`,`t_money`.`userId` AS `muid` from ((`t_recommend_user` left join `t_user` on((`t_recommend_user`.`userId` = `t_user`.`id`))) left join `t_money` on((`t_recommend_user`.`moneyTypeId` = `t_money`.`id`))) order by `t_user`.`createTime` desc ;

-- ----------------------------
-- View structure for v_t_relation_award_level3
-- ----------------------------
DROP VIEW IF EXISTS `v_t_relation_award_level3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_relation_award_level3` AS select `a`.`id` AS `id`,`a`.`peopleId` AS `userId`,`a`.`parentId` AS `level2userId`,`a`.`enable` AS `level2enable`,`a`.`level` AS `level`,`b`.`parentId` AS `level1userId`,`b`.`enable` AS `level1enable`,`c`.`x` AS `x`,`c`.`xmin` AS `xmin`,`c`.`createTime` AS `addDate`,`d`.`enable` AS `level1status`,`e`.`enable` AS `level2status` from ((((`t_relation` `a` left join `t_relation` `b` on(((`a`.`parentId` = `b`.`peopleId`) and (`a`.`enable` = 1)))) left join `t_user` `c` on((`a`.`peopleId` = `c`.`id`))) left join `t_admin` `d` on((`b`.`parentId` = `d`.`id`))) left join `t_admin` `e` on((`a`.`parentId` = `e`.`id`))) ;

-- ----------------------------
-- View structure for v_t_relation_award_level4
-- ----------------------------
DROP VIEW IF EXISTS `v_t_relation_award_level4`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_relation_award_level4` AS select `a`.`id` AS `id`,`a`.`peopleId` AS `userId`,`a`.`level` AS `level`,`b`.`parentId` AS `level2userId`,`b`.`enable` AS `level2enable`,`c`.`parentId` AS `level1userId`,`c`.`enable` AS `level1enable`,`d`.`x` AS `x`,`d`.`xmin` AS `xmin`,`d`.`createTime` AS `addDate`,`e`.`enable` AS `level2status`,`f`.`enable` AS `level1status` from (((((`t_relation` `a` left join `t_relation` `b` on(((`a`.`parentId` = `b`.`peopleId`) and (`a`.`enable` = 1)))) left join `t_relation` `c` on(((`b`.`parentId` = `c`.`peopleId`) and (`b`.`enable` = 1)))) left join `t_user` `d` on((`a`.`peopleId` = `d`.`id`))) left join `t_admin` `e` on((`c`.`peopleId` = `e`.`id`))) left join `t_admin` `f` on((`c`.`parentId` = `f`.`id`))) ;

-- ----------------------------
-- View structure for v_t_relation_enable
-- ----------------------------
DROP VIEW IF EXISTS `v_t_relation_enable`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_relation_enable` AS select `a`.`id` AS `id`,`a`.`peopleId` AS `level2userId`,`a`.`parentId` AS `level1userId`,`a`.`enable` AS `enable`,`b`.`enable` AS `level2enable`,`c`.`enable` AS `level1enable` from ((`t_relation` `a` left join `t_admin` `b` on((`a`.`peopleId` = `b`.`id`))) left join `t_admin` `c` on((`a`.`parentId` = `c`.`id`))) where (`a`.`level` = 2) ;

-- ----------------------------
-- View structure for v_t_relation_level2
-- ----------------------------
DROP VIEW IF EXISTS `v_t_relation_level2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_relation_level2` AS select `a`.`id` AS `id`,`a`.`parentId` AS `parentId`,`a`.`peopleId` AS `peopleId`,`a`.`level` AS `level`,`a`.`enable` AS `enable`,`b`.`userName` AS `userName2`,`b`.`realName` AS `realName2`,`b`.`card` AS `card`,`b`.`telphone` AS `telphone`,`b`.`summary` AS `summary`,date_format(`b`.`addDate`,'%Y-%m-%d %H:%i:%s') AS `addDate`,`b`.`enable` AS `adminEnable`,`c`.`userName` AS `userName1`,`c`.`realName` AS `realName1` from ((`t_relation` `a` left join `t_admin` `b` on((`a`.`peopleId` = `b`.`id`))) left join `t_admin` `c` on(((`a`.`parentId` = `c`.`id`) and (`a`.`enable` = 1)))) ;

-- ----------------------------
-- View structure for v_t_relation_level3
-- ----------------------------
DROP VIEW IF EXISTS `v_t_relation_level3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_relation_level3` AS select `a`.`id` AS `id`,`a`.`enable` AS `enable`,`a`.`parentId` AS `parentId`,`a`.`peopleId` AS `peopleId`,`a`.`level` AS `level`,`c`.`username` AS `userName3`,`c`.`id` AS `userId3`,`c`.`creditrating` AS `creditrating`,`c`.`rating` AS `rating`,date_format(`c`.`createTime`,'%Y-%m-%d %H:%i:%s') AS `addDate`,`d`.`idNo` AS `idNo`,`d`.`realName` AS `realName3`,`e`.`userName` AS `userName2`,`e`.`realName` AS `realName2`,`f`.`userName` AS `userName1`,`f`.`realName` AS `realName1` from (((((`t_relation` `a` left join `t_relation` `b` on(((`a`.`parentId` = `b`.`peopleId`) and (`a`.`enable` = 1)))) left join `t_user` `c` on((`a`.`peopleId` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) left join `t_admin` `e` on(((`a`.`parentId` = `e`.`id`) and (`a`.`enable` = 1)))) left join `t_admin` `f` on(((`b`.`parentId` = `f`.`id`) and (`b`.`enable` = 1)))) ;

-- ----------------------------
-- View structure for v_t_relation_level4
-- ----------------------------
DROP VIEW IF EXISTS `v_t_relation_level4`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_relation_level4` AS select `a`.`id` AS `id`,`a`.`enable` AS `enable`,`a`.`parentId` AS `parentId`,`a`.`peopleId` AS `peopleId`,`a`.`level` AS `level`,`d`.`username` AS `userName4`,`d`.`creditrating` AS `creditrating`,`d`.`rating` AS `rating`,date_format(`d`.`createTime`,'%Y-%m-%d %H:%i:%s') AS `addDate`,`e`.`idNo` AS `idNo`,`e`.`realName` AS `realName4`,`f`.`username` AS `userName3`,`g`.`realName` AS `realName3`,`h`.`userName` AS `userName2`,`h`.`realName` AS `realName2`,`i`.`userName` AS `userName1`,`i`.`realName` AS `realName1` from ((((((((`t_relation` `a` left join `t_relation` `b` on(((`a`.`parentId` = `b`.`peopleId`) and (`a`.`enable` = 1)))) left join `t_relation` `c` on(((`b`.`parentId` = `c`.`peopleId`) and (`b`.`enable` = 1)))) left join `t_user` `d` on((`a`.`peopleId` = `d`.`id`))) left join `t_person` `e` on((`e`.`userId` = `d`.`id`))) left join `t_user` `f` on((`b`.`peopleId` = `f`.`id`))) left join `t_person` `g` on((`g`.`userId` = `f`.`id`))) left join `t_admin` `h` on((`c`.`peopleId` = `h`.`id`))) left join `t_admin` `i` on(((`c`.`parentId` = `i`.`id`) and (`c`.`enable` = 1)))) ;

-- ----------------------------
-- View structure for v_t_repayment_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_t_repayment_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_repayment_detail` AS select `b`.`id` AS `id`,`b`.`borrowTitle` AS `borrowTitle`,`a`.`repayPeriod` AS `repayPeriod`,`a`.`id` AS `payId`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,date_format(`a`.`realRepayDate`,'%Y-%m-%d') AS `realRepayDate`,(`a`.`stillPrincipal` + `a`.`stillInterest`) AS `forPI`,`a`.`stillInterest` AS `stillInterest`,`a`.`lateFI` AS `lateFI`,`a`.`lateDay` AS `lateDay`,`a`.`repayStatus` AS `repayStatus`,date_format(`b`.`publishTime`,'%Y-%m-%d') AS `publishTime`,`b`.`publisher` AS `publisher` from (`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) order by `a`.`id`,`a`.`repayStatus` ;

-- ----------------------------
-- View structure for v_t_repayment_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_repayment_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_repayment_h` AS select `a`.`id` AS `id`,`c`.`username` AS `username`,`d`.`realName` AS `realName`,`b`.`id` AS `borrowId`,`b`.`borrowTitle` AS `borrowTitle`,`a`.`repayPeriod` AS `repayPeriod`,`b`.`borrowWay` AS `borrowWay`,date_format(`a`.`repayDate`,'%Y-%m-%d') AS `repayDate`,((`a`.`stillPrincipal` + `a`.`stillInterest`) - `a`.`hasPI`) AS `totalSum`,date_format(`a`.`realRepayDate`,'%Y-%m-%d') AS `realRepayDate`,`e`.`userName` AS `servier`,`a`.`repayStatus` AS `repayStatus`,`f`.`id` AS `borrowTypeSubId`,`f`.`name` AS `borrowWayName`,`b`.`loanUserId` AS `loanUserId` from (((((`t_repayment` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) left join `t_user` `c` on((`b`.`publisher` = `c`.`id`))) left join `t_person` `d` on((`d`.`userId` = `c`.`id`))) left join `t_admin` `e` on((`c`.`kefuId` = `e`.`id`))) left join `t_borrow_sub_type` `f` on((`f`.`id` = `b`.`borrowTypeSubId`))) ;

-- ----------------------------
-- View structure for v_t_risk_detail_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_risk_detail_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_risk_detail_h` AS select `a`.`id` AS `id`,(`a`.`riskInCome` + `a`.`riskSpending`) AS `amount`,`a`.`riskBalance` AS `riskBalance`,`a`.`riskType` AS `riskType`,`a`.`resource` AS `resource`,`b`.`username` AS `trader`,`c`.`borrowTitle` AS `borrowTitle`,`a`.`borrowId` AS `borrowId`,date_format(`a`.`riskDate`,'%Y-%m-%d') AS `riskDate`,`d`.`userName` AS `operator`,`a`.`remark` AS `remark` from (((`t_risk_detail` `a` left join `t_user` `b` on((`a`.`trader` = `b`.`id`))) left join `t_borrow` `c` on((`a`.`borrowId` = `c`.`id`))) left join `t_admin` `d` on((`a`.`operator` = `d`.`id`))) where (`a`.`id` > 0) ;

-- ----------------------------
-- View structure for v_t_risk_list_h
-- ----------------------------
DROP VIEW IF EXISTS `v_t_risk_list_h`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_risk_list_h` AS select `a`.`id` AS `id`,(`a`.`riskInCome` + `a`.`riskSpending`) AS `amount`,`c`.`realName` AS `realName`,`a`.`riskType` AS `riskType`,`a`.`resource` AS `resource`,`a`.`riskDate` AS `riskDate` from ((`t_risk_detail` `a` left join `t_user` `b` on((`a`.`trader` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) where (`a`.`id` > 0) order by `a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_role_rights_menu
-- ----------------------------
DROP VIEW IF EXISTS `v_t_role_rights_menu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_role_rights_menu` AS select `trr`.`id` AS `id`,`trr`.`roleId` AS `roleId`,`trr`.`rightsId` AS `rightsId`,`btr`.`action` AS `action`,`btr`.`parentID` AS `parentId`,`btr`.`summary` AS `summary`,`btr`.`isQuery` AS `isQuery`,`btr`.`indexs` AS `indexs`,`btr`.`id` AS `btrightsId` from (`t_role_rights` `trr` left join `bt_rights` `btr` on((`trr`.`rightsId` = `btr`.`id`))) ;

-- ----------------------------
-- View structure for v_t_sum_invesamount
-- ----------------------------
DROP VIEW IF EXISTS `v_t_sum_invesamount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_sum_invesamount` AS select `a`.`investTime` AS `investTime`,`a`.`investor` AS `investor`,sum(`a`.`investAmount`) AS `sumAmount`,`b`.`username` AS `username`,`b`.`creditrating` AS `creditrating`,`b`.`rating` AS `rating` from (`t_invest` `a` left join `t_user` `b` on((`a`.`investor` = `b`.`id`))) group by `a`.`investor` order by sum(`a`.`investAmount`) desc ;

-- ----------------------------
-- View structure for v_t_usercard_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usercard_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usercard_lists` AS select `a`.`id` AS `id`,`a`.`cardUserName` AS `cardUserName`,`a`.`bankName` AS `bankName`,`a`.`branchBankName` AS `branchBankName`,`a`.`cardNo` AS `cardNo`,`a`.`cardMode` AS `cardMode`,`a`.`modifiedCardNo` AS `modifiedCardNo`,`a`.`modifiedBankName` AS `modifiedBankName`,`a`.`modifiedBranchBankName` AS `modifiedBranchBankName`,`a`.`commitTime` AS `commitTime`,`a`.`modifiedTime` AS `modifiedTime`,`a`.`cardStatus` AS `cardStatus`,`a`.`checkTime` AS `checkTime`,`a`.`userId` AS `userId`,`a`.`checkUser` AS `checkUser`,`a`.`remark` AS `remark`,`b`.`realName` AS `realName`,`b`.`idNo` AS `idNo`,`b`.`cellPhone` AS `cellPhone`,`d`.`mobilePhone` AS `mobilePhone`,`c`.`username` AS `username` from (((`t_bankcard` `a` left join `t_person` `b` on((`a`.`userId` = `b`.`userId`))) left join `t_user` `c` on((`a`.`userId` = `c`.`id`))) left join `t_phone_binding_info` `d` on((`a`.`userId` = `d`.`userId`))) group by `c`.`username` ;

-- ----------------------------
-- View structure for v_t_usermanage_baseinfo
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_baseinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_baseinfo` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tuser`.`vipCreateTime` AS `vipCreateTime`,(`tuser`.`vipCreateTime` + interval 1 year) AS `vip`,`tp`.`realName` AS `realName`,`tp`.`idNo` AS `idNo`,`tuser`.`creditrating` AS `creditrating`,`tuser`.`rating` AS `rating`,`tp`.`auditStatus` AS `tpauditStatus`,`tw`.`auditStatus` AS `twauditStatus`,ifnull(`tii`.`totalAmount`,0.00) AS `totalAmount` from (((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_workauth` `tw` on((`tuser`.`id` = `tw`.`userId`))) left join `v_t_investtotal` `tii` on((`tuser`.`id` = `tii`.`investor`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_baseinfoinner
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_baseinfoinner`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_baseinfoinner` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tuser`.`email` AS `email`,`tp`.`idNo` AS `idNo`,`tp`.`cellPhone` AS `telephone` from (`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_info
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_info` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tuser`.`lastIP` AS `lastIP`,`tuser`.`lastDate` AS `lastDate`,`tuser`.`createTime` AS `createTime`,`tuser`.`ipayAccount` AS `ipayAccount`,`tp`.`cellPhone` AS `cellPhone`,`tuser`.`email` AS `email`,`tuser`.`isEmployeeReferral` AS `isEmployeeReferral`,`tp`.`qq` AS `qq`,`tf`.`customer_id` AS `customer_id` from ((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_fadada` `tf` on((`tuser`.`id` = `tf`.`uid`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_info_recommend
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_info_recommend`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_info_recommend` AS select `tup`.`id` AS `id`,`tup`.`username` AS `username`,`tup`.`realName` AS `realName`,`tup`.`lastIP` AS `lastIP`,date_format(`tup`.`lastDate`,'%Y-%m-%d %H:%i:%S') AS `lastDate`,date_format(`tup`.`createTime`,'%Y-%m-%d %H:%i:%S') AS `createTime`,`tup`.`cellPhone` AS `cellPhone`,`tup`.`email` AS `email`,`tup`.`isEmployeeReferral` AS `isEmployeeReferral`,`tup`.`ipayAccount` AS `ipayAccount`,`tup`.`qq` AS `qq`,`tup`.`customer_id` AS `customer_id`,`tru`.`username` AS `recommendUsername`,`tp`.`realName` AS `recommendrealName` from ((`v_t_usermanage_info` `tup` left join `v_t_user_recommend` `tru` on((`tup`.`id` = `tru`.`userId`))) left join `t_person` `tp` on((`tp`.`userId` = `tru`.`recommendUserId`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_integralinfo
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_integralinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_integralinfo` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tuser`.`creditrating` AS `creditrating`,`tuser`.`rating` AS `rating`,`tp`.`realName` AS `realName` from (`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_integralinner
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_integralinner`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_integralinner` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tuid`.`intergraltype` AS `intergraltype`,`tuid`.`changetype` AS `changetype`,`tuid`.`remark` AS `remark`,`tuid`.`changerecore` AS `changerecore`,`tuid`.`time` AS `changtime`,`tuid`.`type` AS `type` from ((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_userintegraldetail` `tuid` on((`tuser`.`id` = `tuid`.`userid`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_invest
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_invest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_invest` AS select `ti`.`investor` AS `investor`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tp`.`cellPhone` AS `cellPhone`,`ti`.`investTime` AS `investTime`,`tb`.`paymentMode` AS `paymentMode`,`ti`.`deadline` AS `deadline`,`tb`.`borrowTitle` AS `borrowTitle`,`ti`.`investAmount` AS `investAmount`,`tb`.`isDayThe` AS `isDayThe` from (((`t_invest` `ti` left join `t_person` `tp` on((`ti`.`investor` = `tp`.`userId`))) left join `t_user` `tuser` on((`ti`.`investor` = `tuser`.`id`))) left join `t_borrow` `tb` on((`ti`.`borrowId` = `tb`.`id`))) ;

-- ----------------------------
-- View structure for v_t_usermanage_viprecordinfo
-- ----------------------------
DROP VIEW IF EXISTS `v_t_usermanage_viprecordinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_usermanage_viprecordinfo` AS select `tuser`.`username` AS `username`,`tuser`.`vipCreateTime` AS `vipCreateTime`,(`tuser`.`vipCreateTime` + interval 1 year) AS `vip`,`tp`.`realName` AS `realName`,`tuser`.`feeStatus` AS `feeStatus` from (`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_address
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_address`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_address` AS select `t_user`.`username` AS `username`,`t_user`.`lastDate` AS `lastDate`,`t_user`.`createTime` AS `createTime`,`t_user`.`id` AS `id`,`t_person`.`address` AS `address`,`t_user`.`rating` AS `rating`,`f_credit_rating`(`t_user`.`creditrating`) AS `creditratingIco`,`f_rating`(`t_user`.`rating`) AS `ratingIco`,`t_user`.`creditrating` AS `creditrating`,`t_person`.`personalHead` AS `personalHead` from (`t_user` left join `t_person` on((`t_user`.`id` = `t_person`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_adminchecklist
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_adminchecklist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_adminchecklist` AS select `tuc`.`id` AS `id`,`tuc`.`userId` AS `userId`,`tuc`.`checkdate` AS `checkdate`,`ta`.`userName` AS `adminName`,`tuc`.`perrecode` AS `perrecode`,`tuc`.`afterrecode` AS `afterrecode`,`tuc`.`materialType` AS `materialType` from (`t_user_check` `tuc` left join `t_admin` `ta` on((`ta`.`id` = `tuc`.`adminId`))) ;

-- ----------------------------
-- View structure for v_t_user_amountofrecords
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_amountofrecords`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_amountofrecords` AS select `b`.`id` AS `id`,`b`.`username` AS `username`,`c`.`cellPhone` AS `cellPhone`,`c`.`realName` AS `realname`,(`b`.`usableSum` + `b`.`freezeSum`) AS `totalSum`,`b`.`usableSum` AS `usableSum`,sum(`a`.`realAmount`) AS `realAmount` from ((`t_user` `b` left join `t_invest` `a` on((`a`.`investor` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) group by `b`.`id`,`b`.`username`,`c`.`realName`,(`b`.`usableSum` + `b`.`freezeSum`),`b`.`usableSum` union all select `b`.`id` AS `id`,`b`.`username` AS `username`,`c`.`cellPhone` AS `cellPhone`,`c`.`realName` AS `realname`,(`b`.`usableSum` + `b`.`freezeSum`) AS `totalSum`,`b`.`usableSum` AS `usableSum`,sum(`a`.`realAmount`) AS `realAmount` from ((`t_invest_history` `a` left join `t_user` `b` on((`a`.`investor` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) group by `b`.`id`,`b`.`username`,`c`.`realName`,(`b`.`usableSum` + `b`.`freezeSum`),`b`.`usableSum` ;

-- ----------------------------
-- View structure for v_t_user_approve_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_approve_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_approve_lists` AS select distinct `a`.`userId` AS `uid` from ((`t_person` `a` join `t_workauth` `b` on((`a`.`userId` = `b`.`userId`))) join `t_materialsauth` `c` on((`a`.`userId` = `c`.`userId`))) where ((`a`.`auditStatus` = 3) and (`b`.`auditStatus` = 3) and (`b`.`directedStatus` = 3) and (`b`.`otherStatus` = 3) and (`b`.`moredStatus` = 3) and (`c`.`auditStatus` = 3) and (`c`.`materAuthTypeId` < 6)) ;

-- ----------------------------
-- View structure for v_t_user_auth
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_auth`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_auth` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `usrename`,`tp`.`realName` AS `realName`,`tuser`.`creditrating` AS `creditrating`,`tuser`.`creditLimit` AS `creditLimit`,`tp`.`auditStatus` AS `tpauditStatus`,`tw`.`auditStatus` AS `twauditStatus`,`tw`.`directedStatus` AS `twdirectedStatus`,`tw`.`otherStatus` AS `twotherStatus`,`tw`.`moredStatus` AS `twmoredStatus`,`tm`.`auditStatus` AS `tmIdentityauditStatus`,ifnull(`tm`.`criditing`,0) AS `tmidentiycriditing`,`tm1`.`auditStatus` AS `tmworkauditStatus`,ifnull(`tm1`.`criditing`,0) AS `tmworkcriditing`,`tm2`.`auditStatus` AS `tmaddressauditStatus`,ifnull(`tm2`.`criditing`,0) AS `tmaddresscriditing`,`tm3`.`auditStatus` AS `tmresponseauditStatus`,ifnull(`tm3`.`criditing`,0) AS `tmresponsecriditing`,`tm4`.`auditStatus` AS `tmincomeeauditStatus`,ifnull(`tm4`.`criditing`,0) AS `tmincomeecriditing`,`ta`.`userName` AS `serviceManName` from ((((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_workauth` `tw` on((`tuser`.`id` = `tw`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 5)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_backrw_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_backrw_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_backrw_lists` AS select `a`.`id` AS `id`,`a`.`userId` AS `userId`,`a`.`type` AS `type`,`a`.`dealMoney` AS `dealMoney`,`a`.`remark` AS `remark`,`a`.`checkUser` AS `checkUser`,`a`.`checkTime` AS `checkTime`,`b`.`username` AS `uname`,`c`.`userName` AS `userName`,`d`.`realName` AS `realName` from (((`t_recharge_withdraw_info` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_admin` `c` on((`a`.`checkUser` = `c`.`id`))) left join `t_person` `d` on((`a`.`userId` = `d`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_base_approve_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_base_approve_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_base_approve_lists` AS select `t_person`.`userId` AS `uuid`,`t_person`.`auditStatus` AS `auditStatus` from `t_person` ;

-- ----------------------------
-- View structure for v_t_user_cash_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_cash_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_cash_lists` AS select `a`.`id` AS `userId`,`a`.`username` AS `username`,(`a`.`usableSum` + `a`.`freezeSum`) AS `totalSum`,`a`.`usableSum` AS `usableSum`,`a`.`freezeSum` AS `freezeSum`,`a`.`dueinSum` AS `dueinSum`,`a`.`dueoutSum` AS `dueoutSum`,`b`.`realName` AS `realName` from (`t_user` `a` left join `t_person` `b` on((`a`.`id` = `b`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_concern_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_concern_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_concern_lists` AS select `a`.`id` AS `id`,`a`.`moduleType` AS `moduleType`,`a`.`moduleId` AS `moduleId`,`a`.`userId` AS `userId`,`b`.`username` AS `username` from (`t_concern` `a` left join `t_user` `b` on((`a`.`moduleId` = `b`.`id`))) where (`a`.`moduleType` = 1) ;

-- ----------------------------
-- View structure for v_t_user_creditlimit_apply
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_creditlimit_apply`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_creditlimit_apply` AS select `tuser`.`id` AS `id`,`tc`.`id` AS `tcid`,`tuser`.`username` AS `uername`,`tuser`.`creditLimit` AS `creditLimit`,`tc`.`applyAmount` AS `applyAmount`,`tc`.`applyTime` AS `applyTime`,`ta`.`userName` AS `tausername`,`tc`.`status` AS `applystatus` from ((`t_user` `tuser` left join `t_crediting` `tc` on((`tuser`.`id` = `tc`.`applyer`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) where (`tc`.`applyAmount` is not null) ;

-- ----------------------------
-- View structure for v_t_user_credit_apply_msgas
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_credit_apply_msgas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_credit_apply_msgas` AS select `tuser`.`username` AS `username`,`tc`.`id` AS `tcid`,`tuser`.`id` AS `id`,`tuser`.`creditLimit` AS `creditLimit`,`tc`.`applyTime` AS `applyTime`,`tc`.`applyDetail` AS `applyDetail`,`tc`.`applyAmount` AS `applyAmount`,`ta`.`userName` AS `tausername`,`ta1`.`userName` AS `creditlimtor`,`tcr`.`status` AS `tcstatus`,`tc`.`checkMsg` AS `checkMsg`,`tc`.`agreeAmount` AS `agreeAmount` from ((((`t_user` `tuser` left join `t_crediting` `tc` on((`tuser`.`id` = `tc`.`applyer`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_admin` `ta1` on((`tuser`.`creditlimtor` = `ta1`.`id`))) left join `t_crediting` `tcr` on((`tuser`.`id` = `tcr`.`applyer`))) ;

-- ----------------------------
-- View structure for v_t_user_credit_msg
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_credit_msg`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_credit_msg` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `usrename`,`tp`.`realName` AS `realName`,`tuser`.`creditrating` AS `creditrating`,`tuser`.`creditLimit` AS `creditLimit`,`tp`.`auditStatus` AS `tpauditStatus`,`tw`.`auditStatus` AS `twauditStatus`,`tw`.`directedStatus` AS `twdirectedStatus`,`tw`.`otherStatus` AS `twotherStatus`,`tw`.`moredStatus` AS `twmoredStatus`,`tm`.`auditStatus` AS `tmIdentityauditStatus`,ifnull(`tm`.`criditing`,0) AS `tmidentiycriditing`,`tm1`.`auditStatus` AS `tmworkauditStatus`,ifnull(`tm1`.`criditing`,0) AS `tmworkcriditing`,`tm2`.`auditStatus` AS `tmaddressauditStatus`,ifnull(`tm2`.`criditing`,0) AS `tmaddresscriditing`,`tm3`.`auditStatus` AS `tmresponseauditStatus`,ifnull(`tm3`.`criditing`,0) AS `tmresponsecriditing`,`tm4`.`auditStatus` AS `tmincomeeauditStatus`,ifnull(`tm4`.`criditing`,0) AS `tmincomeecriditing`,`tm5`.`auditStatus` AS `tmhouseauditStatus`,ifnull(`tm5`.`criditing`,0) AS `tmhousecriditing`,`tm6`.`auditStatus` AS `tmcarauditStatus`,ifnull(`tm6`.`criditing`,0) AS `tmcarcriditing`,`tm7`.`auditStatus` AS `tmmerrayauditStatus`,ifnull(`tm7`.`criditing`,0) AS `tmmerraycriditing`,`tm8`.`auditStatus` AS `tmxueliauditStatus`,ifnull(`tm8`.`criditing`,0) AS `tmxuelicriditing`,`tm9`.`auditStatus` AS `tmjishuauditStatus`,ifnull(`tm9`.`criditing`,0) AS `tmjishucriditing`,`tm10`.`auditStatus` AS `tmtelephoneauditStatus`,ifnull(`tm10`.`criditing`,0) AS `tmtelephonecriditing`,`tm11`.`auditStatus` AS `tmweiboauditStatus`,ifnull(`tm11`.`criditing`,0) AS `tmweibocriditing`,`tm12`.`auditStatus` AS `tmxcauditStatus`,ifnull(`tm12`.`criditing`,0) AS `tmxcriditing`,`tm13`.`auditStatus` AS `tmdiyaauditStatus`,ifnull(`tm13`.`criditing`,0) AS `tmdiyacriditing`,`tm14`.`auditStatus` AS `tmdanbaoauditStatus`,ifnull(`tm14`.`criditing`,0) AS `tmdanbaocriditing`,`tm15`.`auditStatus` AS `tmotherauditStatus`,ifnull(`tm15`.`criditing`,0) AS `tmothercriditing`,`ta`.`userName` AS `serviceManName` from (((((((((((((((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_workauth` `tw` on((`tuser`.`id` = `tw`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 5)))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 6)))) left join `t_materialsauth` `tm6` on(((`tuser`.`id` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 7)))) left join `t_materialsauth` `tm7` on(((`tuser`.`id` = `tm7`.`userId`) and (`tm7`.`materAuthTypeId` = 8)))) left join `t_materialsauth` `tm8` on(((`tuser`.`id` = `tm8`.`userId`) and (`tm8`.`materAuthTypeId` = 9)))) left join `t_materialsauth` `tm9` on(((`tuser`.`id` = `tm9`.`userId`) and (`tm9`.`materAuthTypeId` = 10)))) left join `t_materialsauth` `tm10` on(((`tuser`.`id` = `tm10`.`userId`) and (`tm10`.`materAuthTypeId` = 11)))) left join `t_materialsauth` `tm11` on(((`tuser`.`id` = `tm11`.`userId`) and (`tm11`.`materAuthTypeId` = 12)))) left join `t_materialsauth` `tm12` on(((`tuser`.`id` = `tm12`.`userId`) and (`tm12`.`materAuthTypeId` = 13)))) left join `t_materialsauth` `tm13` on(((`tuser`.`id` = `tm13`.`userId`) and (`tm13`.`materAuthTypeId` = 14)))) left join `t_materialsauth` `tm14` on(((`tuser`.`id` = `tm14`.`userId`) and (`tm14`.`materAuthTypeId` = 15)))) left join `t_materialsauth` `tm15` on(((`tuser`.`id` = `tm15`.`userId`) and (`tm15`.`materAuthTypeId` = 16)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_credit_msg_agin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_credit_msg_agin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_credit_msg_agin` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `usrename`,`tp`.`realName` AS `realName`,`tuser`.`creditrating` AS `creditrating`,`tuser`.`creditLimit` AS `creditLimit`,`tp`.`auditStatus` AS `tpauditStatus`,`tw`.`auditStatus` AS `twauditStatus`,`tw`.`directedStatus` AS `twdirectedStatus`,`tw`.`otherStatus` AS `twotherStatus`,`tw`.`moredStatus` AS `twmoredStatus`,`tm`.`auditStatus` AS `tmIdentityauditStatus`,`tm1`.`auditStatus` AS `tmworkauditStatus`,`tm2`.`auditStatus` AS `tmaddressauditStatus`,`tm3`.`auditStatus` AS `tmresponseauditStatus`,`tm4`.`auditStatus` AS `tmincomeeauditStatus`,`tm5`.`auditStatus` AS `tmhouseauditStatus`,`tm6`.`auditStatus` AS `tmcarauditStatus`,`tm7`.`auditStatus` AS `tmmerrayauditStatus`,`tm8`.`auditStatus` AS `tmxueliauditStatus`,`tm9`.`auditStatus` AS `tmjishuauditStatus`,`tm10`.`auditStatus` AS `tmtelephoneauditStatus`,`tm11`.`auditStatus` AS `tmweiboauditStatus`,`tm12`.`auditStatus` AS `tmshipingauditStatus`,`tm13`.`auditStatus` AS `tmxcauditStatus`,`tm14`.`auditStatus` AS `tmdiyaauditStatus`,`tm15`.`auditStatus` AS `tmdanbaoauditStatus`,`ta`.`userName` AS `serviceManName` from (((((((((((((((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_workauth` `tw` on((`tuser`.`id` = `tw`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 5)))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 6)))) left join `t_materialsauth` `tm6` on(((`tuser`.`id` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 7)))) left join `t_materialsauth` `tm7` on(((`tuser`.`id` = `tm7`.`userId`) and (`tm7`.`materAuthTypeId` = 8)))) left join `t_materialsauth` `tm8` on(((`tuser`.`id` = `tm8`.`userId`) and (`tm8`.`materAuthTypeId` = 9)))) left join `t_materialsauth` `tm9` on(((`tuser`.`id` = `tm9`.`userId`) and (`tm9`.`materAuthTypeId` = 10)))) left join `t_materialsauth` `tm10` on(((`tuser`.`id` = `tm10`.`userId`) and (`tm10`.`materAuthTypeId` = 11)))) left join `t_materialsauth` `tm11` on(((`tuser`.`id` = `tm11`.`userId`) and (`tm11`.`materAuthTypeId` = 12)))) left join `t_materialsauth` `tm12` on(((`tuser`.`id` = `tm12`.`userId`) and (`tm12`.`materAuthTypeId` = 13)))) left join `t_materialsauth` `tm13` on(((`tuser`.`id` = `tm13`.`userId`) and (`tm13`.`materAuthTypeId` = 14)))) left join `t_materialsauth` `tm14` on(((`tuser`.`id` = `tm14`.`userId`) and (`tm14`.`materAuthTypeId` = 15)))) left join `t_materialsauth` `tm15` on(((`tuser`.`id` = `tm15`.`userId`) and (`tm15`.`materAuthTypeId` = 16)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_frends
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_frends`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_frends` AS select `tc`.`moduleId` AS `tcmoduleId`,`tuser`.`username` AS `username`,`tc`.`userId` AS `id`,`tpp`.`personalHead` AS `personalHead` from (((`t_concern` `tc` left join `t_user` `tuser` on((`tuser`.`id` = `tc`.`userId`))) left join `t_person` `tp` on((`tp`.`userId` = `tc`.`userId`))) left join `t_person` `tpp` on((`tc`.`moduleId` = `tpp`.`userId`))) where (`tc`.`moduleType` = 1) ;

-- ----------------------------
-- View structure for v_t_user_frontmeg
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_frontmeg`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_frontmeg` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tuser`.`createTime` AS `createTime`,`tr`.`regionName` AS `regCityregionName`,`tr1`.`regionName` AS `regProregionName`,`tr2`.`regionName` AS `nativePro`,`tr3`.`regionName` AS `nativeCity`,`tuser`.`lastDate` AS `lastDate`,(`tuser`.`vipCreateTime` + interval 1 year) AS `vip`,`tp`.`personalHead` AS `personalHead`,`tuser`.`creditLimit` AS `creditLimit`,`tuser`.`lastIP` AS `lastIP`,`tuser`.`creditrating` AS `creditrating` from (((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_region` `tr` on((`tp`.`registedPlaceCity` = `tr`.`regionId`))) left join `t_region` `tr1` on((`tp`.`registedPlacePro` = `tr1`.`regionId`))) left join `t_region` `tr2` on((`tp`.`nativePlacePro` = `tr2`.`regionId`))) left join `t_region` `tr3` on((`tp`.`nativePlaceCity` = `tr3`.`regionId`))) ;

-- ----------------------------
-- View structure for v_t_user_frontpictur
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_frontpictur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_frontpictur` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tm`.`auditStatus` AS `tmIdentityauditStatus`,`tm`.`imgPath` AS `IdentityimgPath`,`tm1`.`auditStatus` AS `tmworkauditStatus`,`tm1`.`imgPath` AS `tmworkimgPath`,`tm2`.`auditStatus` AS `tmaddressauditStatus`,`tm2`.`imgPath` AS `tmaddressimgPath`,`tm3`.`auditStatus` AS `tmresponseauditStatus`,`tm3`.`imgPath` AS `tmresponseimgPath`,`tm4`.`auditStatus` AS `tmincomeeauditStatus`,`tm4`.`imgPath` AS `tmincomeemgPath`,`tm5`.`auditStatus` AS `houseStatus`,`tm5`.`imgPath` AS `housepath`,`tm6`.`auditStatus` AS `carStatus`,`tm6`.`imgPath` AS `carpath`,`tm7`.`auditStatus` AS `merryStatus`,`tm7`.`imgPath` AS `merrypath`,`tm8`.`auditStatus` AS `xuliStatus`,`tm8`.`imgPath` AS `xulipath`,`tm9`.`auditStatus` AS `jsStatus`,`tm9`.`imgPath` AS `jspath`,`tm10`.`auditStatus` AS `telStatus`,`tm10`.`imgPath` AS `telpath`,`tm11`.`auditStatus` AS `weiboStatus`,`tm11`.`imgPath` AS `weibopath`,`tm12`.`auditStatus` AS `shipingStatus`,`tm12`.`imgPath` AS `shipingpath`,`tm13`.`auditStatus` AS `xcStatus`,`tm13`.`imgPath` AS `xcpath`,`tm14`.`auditStatus` AS `dyStatus`,`tm14`.`imgPath` AS `dypath`,`tm15`.`auditStatus` AS `dbStatus`,`tm15`.`imgPath` AS `dbpath` from (((((((((((((((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_workauth` `tw` on((`tuser`.`id` = `tw`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 5)))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 6)))) left join `t_materialsauth` `tm6` on(((`tuser`.`id` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 7)))) left join `t_materialsauth` `tm7` on(((`tuser`.`id` = `tm7`.`userId`) and (`tm7`.`materAuthTypeId` = 8)))) left join `t_materialsauth` `tm8` on(((`tuser`.`id` = `tm8`.`userId`) and (`tm8`.`materAuthTypeId` = 9)))) left join `t_materialsauth` `tm9` on(((`tuser`.`id` = `tm9`.`userId`) and (`tm9`.`materAuthTypeId` = 10)))) left join `t_materialsauth` `tm10` on(((`tuser`.`id` = `tm10`.`userId`) and (`tm10`.`materAuthTypeId` = 11)))) left join `t_materialsauth` `tm11` on(((`tuser`.`id` = `tm11`.`userId`) and (`tm11`.`materAuthTypeId` = 12)))) left join `t_materialsauth` `tm12` on(((`tuser`.`id` = `tm12`.`userId`) and (`tm12`.`materAuthTypeId` = 13)))) left join `t_materialsauth` `tm13` on(((`tuser`.`id` = `tm13`.`userId`) and (`tm13`.`materAuthTypeId` = 14)))) left join `t_materialsauth` `tm14` on(((`tuser`.`id` = `tm14`.`userId`) and (`tm14`.`materAuthTypeId` = 15)))) left join `t_materialsauth` `tm15` on(((`tuser`.`id` = `tm15`.`userId`) and (`tm15`.`materAuthTypeId` = 16)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_frontpictur_t
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_frontpictur_t`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_frontpictur_t` AS select `tm`.`userId` AS `id`,`tuser`.`username` AS `username`,`tmy`.`name` AS `tmyname`,`tm`.`auditStatus` AS `auditStatus`,`tm`.`id` AS `tmid`,`tmy`.`id` AS `tmyid`,`vts`.`imagePath` AS `imagePath` from (((`t_materialsauth` `tm` left join `t_materialsauthtype` `tmy` on((`tm`.`materAuthTypeId` = `tmy`.`id`))) left join `t_user` `tuser` on((`tuser`.`id` = `tm`.`userId`))) left join `v_t_user_showfirstpicture` `vts` on((`vts`.`tmid` = `tm`.`id`))) where ((`tmy`.`id` > 5) and (`tuser`.`id` = 151)) ;

-- ----------------------------
-- View structure for v_t_user_fundrecord_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_fundrecord_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_fundrecord_lists` AS select `a`.`id` AS `id`,`a`.`userId` AS `userId`,`a`.`fundMode` AS `fundMode`,`a`.`handleSum` AS `handleSum`,`a`.`usableSum` AS `usableSum`,`a`.`freezeSum` AS `freezeSum`,`a`.`dueinSum` AS `dueinSum`,`a`.`trader` AS `trader`,`a`.`recordTime` AS `recordTime`,`a`.`dueoutSum` AS `dueoutSum`,`a`.`income` AS `income`,`a`.`spending` AS `spending`,`a`.`remarks` AS `remarks`,((`a`.`usableSum` + `a`.`freezeSum`) + `a`.`dueinSum`) AS `totalSum`,ifnull(`b`.`username`,'admin') AS `traderName` from (`t_fundrecord` `a` left join `t_user` `b` on((`a`.`trader` = `b`.`id`))) ;

-- ----------------------------
-- View structure for v_t_user_fundwithdraw_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_fundwithdraw_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_fundwithdraw_lists` AS select `a`.`id` AS `wid`,`a`.`status` AS `status`,`c`.`username` AS `username`,`d`.`realName` AS `realName`,`b`.`cardNo` AS `acount`,`b`.`bankName` AS `bankName`,`b`.`branchBankName` AS `branchBankName`,`a`.`sum` AS `sum`,(`a`.`sum` - `a`.`poundage`) AS `realAccount`,`a`.`poundage` AS `poundage`,`a`.`applyTime` AS `applyTime`,`a`.`userId` AS `userId` from (((`t_withdraw` `a` left join `t_bankcard` `b` on((`a`.`bankId` = `b`.`cardNo`))) left join `t_user` `c` on((`a`.`userId` = `c`.`id`))) left join `t_person` `d` on((`a`.`userId` = `d`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_fund_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_fund_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_fund_lists` AS select `a`.`id` AS `userId`,`a`.`username` AS `username`,(`a`.`usableSum` + `a`.`freezeSum`) AS `totalSum`,`a`.`usableSum` AS `usableSum`,`a`.`freezeSum` AS `freezeSum`,`a`.`dueinSum` AS `dueinSum`,`a`.`dueoutSum` AS `dueoutSum`,`b`.`realName` AS `realName` from (`t_user` `a` left join `t_person` `b` on((`a`.`id` = `b`.`userId`))) where (`b`.`realName` is not null) ;

-- ----------------------------
-- View structure for v_t_user_lock
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_lock`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_lock` AS select `t_user`.`id` AS `id`,`t_user`.`username` AS `username`,`t_user`.`createTime` AS `createTime`,`t_user`.`enable` AS `enable`,`t_user`.`loginLimitTime` AS `lockTime`,`t_person`.`realName` AS `realName`,`t_person`.`cellPhone` AS `cellPhone`,`t_person`.`idNo` AS `idNo` from (`t_user` left join `t_person` on((`t_user`.`id` = `t_person`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_loginsession_user
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_loginsession_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_loginsession_user` AS select `tuser`.`id` AS `id`,`tuser`.`dealpwd` AS `dealpwd`,`tuser`.`username` AS `username`,`tuser`.`nickname` AS `nickname`,`tuser`.`authStep` AS `authStep`,`tuser`.`createTime` AS `createTime`,`tuser`.`usableCreditLimit` AS `usableCreditLimit`,`tuser`.`enable` AS `enable`,`tuser`.`password` AS `password`,`tuser`.`vipStatus` AS `vipStatus`,`tuser`.`headImg` AS `headImg`,`tuser`.`email` AS `email`,`tuser`.`ipayAccount` AS `ipayAccount`,`tuser`.`busiCode` AS `busiCode`,`tp`.`realName` AS `realName`,`tuk`.`name` AS `kefuname`,`tuk`.`id` AS `tukid`,`tp`.`personalHead` AS `personalHead`,`tp`.`auditStatus` AS `tpauditStatus`,(((`tw`.`auditStatus` + `tw`.`directedStatus`) + `tw`.`otherStatus`) + `tw`.`moredStatus`) AS `twsum` from (((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_user_kefu` `tuk` on((`tuser`.`kefuId` = `tuk`.`id`))) left join `t_workauth` `tw` on((`tw`.`userId` = `tuser`.`id`))) group by `tuser`.`id` ;

-- ----------------------------
-- View structure for v_t_user_myborrowlist
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_myborrowlist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_myborrowlist` AS select `a`.`id` AS `id`,`a`.`imgPath` AS `imgPath`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowStatus` AS `borrowStatus`,`b`.`id` AS `uid`,`a`.`borrowTitle` AS `borrowTitle`,`f_convertAmount`(`a`.`borrowAmount`) AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`f_injectPoint`(((`a`.`hasInvestAmount` / `a`.`borrowAmount`) * 100)) AS `schedules`,`f_convertAmount`((`a`.`borrowAmount` - `a`.`hasInvestAmount`)) AS `investNum`,`a`.`deadline` AS `deadline`,`f_credit_rating`(`b`.`creditrating`) AS `credit`,`b`.`creditrating` AS `creditrating` from (`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) where (`a`.`borrowStatus` > 1) order by `a`.`publishTime` desc ;

-- ----------------------------
-- View structure for v_t_user_myborrowrecorde
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_myborrowrecorde`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_myborrowrecorde` AS select `a`.`id` AS `id`,`b`.`id` AS `uid`,`f_convertAmount`(`ti`.`investAmount`) AS `investAmount`,date_format(`ti`.`investTime`,'%Y-%m-%T') AS `investTime`,`b`.`username` AS `username`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`borrowTitle` AS `borrowTitle` from ((`t_invest` `ti` left join `t_borrow` `a` on((`ti`.`borrowId` = `a`.`id`))) left join `t_user` `b` on((`b`.`id` = `ti`.`investor`))) order by `a`.`publishTime` desc ;

-- ----------------------------
-- View structure for v_t_user_newuser
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_newuser`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_newuser` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tuser`.`creditrating` AS `creditrating`,`tm`.`passTime` AS `passTime`,count((`tm`.`auditStatus` = 1)) AS `nocheck`,`ta`.`userName` AS `tausername` from ((`t_user` `tuser` left join `t_materialsauth` `tm` on((`tuser`.`id` = `tm`.`userId`))) left join `t_admin` `ta` on((`ta`.`id` = `tuser`.`adminId`))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_person_work
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_person_work`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_person_work` AS select `t_user`.`id` AS `id`,`t_user`.`username` AS `username`,`t_user`.`cashStatus` AS `cashStatus`,(`t_user`.`freezeSum` + `t_user`.`usableSum`) AS `allSum`,`t_user`.`usableSum` AS `usableSum`,`t_person`.`realName` AS `realName`,`t_person`.`idNo` AS `idNo`,`t_person`.`auditStatus` AS `personAuditStatus`,`t_workauth`.`auditStatus` AS `workAuditStatus` from ((`t_user` left join `t_person` on((`t_user`.`id` = `t_person`.`userId`))) left join `t_workauth` on((`t_user`.`id` = `t_workauth`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_picture
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_picture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_picture` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tm`.`materAuthTypeId` AS `materAuthTypeId`,`tmt`.`name` AS `tmtname`,`tm`.`auditStatus` AS `auditStatus`,`tmd`.`uploadingTime` AS `passTime`,`tm`.`option` AS `tmoption`,`tm`.`imgPath` AS `imgPath`,`ta`.`userName` AS `checkperson` from (((((`t_user` `tuser` left join `t_materialsauth` `tm` on((`tuser`.`id` = `tm`.`userId`))) left join `t_materialsauthtype` `tmt` on((`tm`.`materAuthTypeId` = `tmt`.`id`))) left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_materialimagedetal` `tmd` on((`tm`.`id` = `tmd`.`materialsauthid`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) ;

-- ----------------------------
-- View structure for v_t_user_picture_base
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_picture_base`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_picture_base` AS select `tm`.`id` AS `tmid`,`tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tm`.`materAuthTypeId` AS `materAuthTypeId`,`tmt`.`name` AS `tmtname`,`tm`.`auditStatus` AS `auditStatus`,`tm`.`passTime` AS `passTime`,`tm`.`option` AS `tmoption`,`tm`.`imgPath` AS `imgPath`,`ta`.`userName` AS `checkperson` from ((((`t_materialsauth` `tm` left join `t_user` `tuser` on((`tm`.`userId` = `tuser`.`id`))) left join `t_person` `tp` on((`tm`.`userId` = `tp`.`userId`))) left join `t_materialsauthtype` `tmt` on((`tm`.`materAuthTypeId` = `tmt`.`id`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) where (`tm`.`materAuthTypeId` <= 5) ;

-- ----------------------------
-- View structure for v_t_user_picture_msg
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_picture_msg`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_picture_msg` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `usrename`,`tp`.`realName` AS `realName`,`tuser`.`creditrating` AS `creditrating`,`tuser`.`creditLimit` AS `creditLimit`,`tm`.`auditStatus` AS `tmIdentityauditStatus`,`tm`.`option` AS `Identityoption`,`tm`.`passTime` AS `IdentitypassTime`,`tm`.`imgPath` AS `IdentityimgPath`,`tm1`.`auditStatus` AS `tmworkauditStatus`,`tm1`.`option` AS `tmworkoption`,`tm1`.`passTime` AS `tmworkpassTime`,`tm1`.`imgPath` AS `tmworkimgPath`,`tm2`.`auditStatus` AS `tmaddressauditStatus`,`tm2`.`option` AS `tmaddressoption`,`tm2`.`passTime` AS `tmaddresspassTime`,`tm2`.`imgPath` AS `tmaddressimgPath`,`tm3`.`auditStatus` AS `tmresponseauditStatus`,`tm3`.`option` AS `tmresponseoption`,`tm3`.`passTime` AS `tmresponsepassTime`,`tm3`.`imgPath` AS `tmresponseimgPath`,`tm4`.`auditStatus` AS `tmincomeeauditStatus`,`tm4`.`option` AS `tmincomeeoption`,`tm4`.`passTime` AS `tmincomeepassTime`,`tm4`.`imgPath` AS `tmincomeemgPath` from (((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm`.`userId`) and (`tm1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm`.`userId`) and (`tm2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm`.`userId`) and (`tm3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm`.`userId`) and (`tm4`.`materAuthTypeId` = 5)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_picture_select
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_picture_select`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_picture_select` AS select `tm`.`id` AS `tmid`,`tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tm`.`materAuthTypeId` AS `materAuthTypeId`,`tmt`.`name` AS `tmtname`,`tm`.`auditStatus` AS `auditStatus`,`tm`.`passTime` AS `passTime`,`tm`.`option` AS `tmoption`,`tm`.`imgPath` AS `imgPath`,`ta`.`userName` AS `checkperson` from ((((`t_materialsauth` `tm` left join `t_user` `tuser` on((`tm`.`userId` = `tuser`.`id`))) left join `t_person` `tp` on((`tm`.`userId` = `tp`.`userId`))) left join `t_materialsauthtype` `tmt` on((`tm`.`materAuthTypeId` = `tmt`.`id`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) where (`tm`.`materAuthTypeId` > 5) ;

-- ----------------------------
-- View structure for v_t_user_picture_select_2
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_picture_select_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_picture_select_2` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `usrename`,`tp`.`realName` AS `realName`,`tm5`.`auditStatus` AS `tmhouseauditStatus`,`tm6`.`auditStatus` AS `tmcarauditStatus`,`tm7`.`auditStatus` AS `tmmerrayauditStatus`,`tm8`.`auditStatus` AS `tmxueliauditStatus`,`tm9`.`auditStatus` AS `tmjishuauditStatus`,`tm10`.`auditStatus` AS `tmtelephoneauditStatus`,`tm11`.`auditStatus` AS `tmweiboauditStatus`,`tm12`.`auditStatus` AS `tmshipingauditStatus`,`tm13`.`auditStatus` AS `tmxcauditStatus`,`tm14`.`auditStatus` AS `tmdiyaauditStatus`,`tm15`.`auditStatus` AS `tmdanbaoauditStatus`,`tuser`.`adminId` AS `adminId`,`ta`.`userName` AS `tausername` from (((((((((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 6)))) left join `t_materialsauth` `tm6` on(((`tuser`.`id` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 7)))) left join `t_materialsauth` `tm7` on(((`tuser`.`id` = `tm7`.`userId`) and (`tm7`.`materAuthTypeId` = 8)))) left join `t_materialsauth` `tm8` on(((`tuser`.`id` = `tm8`.`userId`) and (`tm8`.`materAuthTypeId` = 9)))) left join `t_materialsauth` `tm9` on(((`tuser`.`id` = `tm9`.`userId`) and (`tm9`.`materAuthTypeId` = 10)))) left join `t_materialsauth` `tm10` on(((`tuser`.`id` = `tm10`.`userId`) and (`tm10`.`materAuthTypeId` = 11)))) left join `t_materialsauth` `tm11` on(((`tuser`.`id` = `tm11`.`userId`) and (`tm11`.`materAuthTypeId` = 12)))) left join `t_materialsauth` `tm12` on(((`tuser`.`id` = `tm12`.`userId`) and (`tm12`.`materAuthTypeId` = 13)))) left join `t_materialsauth` `tm13` on(((`tuser`.`id` = `tm13`.`userId`) and (`tm13`.`materAuthTypeId` = 14)))) left join `t_materialsauth` `tm14` on(((`tuser`.`id` = `tm14`.`userId`) and (`tm14`.`materAuthTypeId` = 15)))) left join `t_materialsauth` `tm15` on(((`tuser`.`id` = `tm15`.`userId`) and (`tm15`.`materAuthTypeId` = 16)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_picture_select_3
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_picture_select_3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_picture_select_3` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`ta`.`userName` AS `tausername`,ifnull(count(`tm`.`auditStatus`),0) AS `wait`,ifnull(count(`tm1`.`auditStatus`),0) AS `fail`,ifnull(count(`tm2`.`auditStatus`),0) AS `success` from (((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`auditStatus` = 1) and (`tm`.`materAuthTypeId` > 5)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`auditStatus` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`auditStatus` = 3)))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_rechargeall_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_rechargeall_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_rechargeall_lists` AS select `a`.`id` AS `id`,`a`.`userId` AS `userId`,`b`.`username` AS `username`,`a`.`rechargeType` AS `type`,`a`.`rechargeMoney` AS `rechargeMoney`,`a`.`cost` AS `poundage`,(`a`.`rechargeMoney` - `a`.`cost`) AS `realMoney`,`a`.`rechargeTime` AS `rechargeTime`,`a`.`result` AS `result` from (`t_recharge_detail` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) order by `a`.`id` desc ;

-- ----------------------------
-- View structure for v_t_user_rechargedetails_list
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_rechargedetails_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_rechargedetails_list` AS select `a`.`id` AS `id`,`a`.`rechargeType` AS `rechargeType`,`a`.`bankName` AS `bankName`,`a`.`rechargeMoney` AS `rechargeMoney`,`a`.`cost` AS `cost`,`a`.`rechargeTime` AS `rechargeTime`,`a`.`result` AS `result`,`a`.`userId` AS `userId`,`a`.`paynumber` AS `paynumber`,`a`.`rechargeNumber` AS `rechargeNumber`,`a`.`buyerEmail` AS `buyerEmail`,`a`.`rechargeId` AS `rechargeId`,`a`.`remark` AS `remark`,`a`.`ipAddress` AS `ipAddress`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,(`a`.`rechargeMoney` - `a`.`cost`) AS `realMoney`,`a`.`id` AS `reId`,`a`.`billcode` AS `billcode` from ((`t_recharge_detail` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_rechargefirst_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_rechargefirst_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_rechargefirst_lists` AS select `a`.`id` AS `id`,`a`.`rechargeType` AS `rechargeType`,`a`.`bankName` AS `bankName`,`a`.`rechargeMoney` AS `rechargeMoney`,`a`.`cost` AS `cost`,`a`.`rechargeTime` AS `rechargeTime`,`a`.`result` AS `result`,`a`.`userId` AS `userId`,`a`.`paynumber` AS `paynumber`,`a`.`rechargeNumber` AS `rechargeNumber`,`a`.`buyerEmail` AS `buyerEmail`,`a`.`rechargeId` AS `rechargeId`,`a`.`remark` AS `remark`,`a`.`ipAddress` AS `ipAddress`,min(`a`.`rechargeTime`) AS `first_recharge`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,(`a`.`rechargeMoney` - `a`.`cost`) AS `realMoney`,`a`.`id` AS `reId` from ((`t_recharge_detail` `a` left join `t_user` `b` on((`a`.`userId` = `b`.`id`))) left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) group by `a`.`userId` ;

-- ----------------------------
-- View structure for v_t_user_recommend
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_recommend`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_recommend` AS select `t`.`username` AS `username`,`tu`.`userId` AS `userId`,`tu`.`recommendUserId` AS `recommendUserId` from (`t_user` `t` join `t_recommend_user` `tu`) where (`t`.`id` = `tu`.`recommendUserId`) ;

-- ----------------------------
-- View structure for v_t_user_rescher
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_rescher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_rescher` AS select count(0) AS `co`,`vtc`.`usrename` AS `usrename`,`vtc`.`realName` AS `realName`,`vtc`.`serviceManName` AS `serviceManName` from `v_t_user_credit_msg` `vtc` where ((`vtc`.`tmIdentityauditStatus` = 1) or (`vtc`.`tmworkauditStatus` = 1) or (`vtc`.`tmincomeeauditStatus` = 1) or (`vtc`.`tmaddressauditStatus` = 1) or (`vtc`.`tmresponseauditStatus` = 1)) group by `vtc`.`id` ;

-- ----------------------------
-- View structure for v_t_user_selectpicture
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_selectpicture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_selectpicture` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tp`.`realName` AS `realName`,`tm`.`auditStatus` AS `identifyStatus`,`tm1`.`auditStatus` AS `workStatus`,`tm2`.`auditStatus` AS `addrressStatus`,`tm3`.`auditStatus` AS `responseStatus`,`tm4`.`auditStatus` AS `incomeStatus`,`ta`.`userName` AS `tausername` from (((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_materialsauth` `tm` on(((`tuser`.`id` = `tm`.`userId`) and (`tm`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 5)))) left join `t_admin` `ta` on((`tuser`.`adminId` = `ta`.`id`))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_select_credit
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_select_credit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_select_credit` AS select `tuser`.`id` AS `id`,`tm5`.`auditStatus` AS `tmhouseauditStatus`,`tm5`.`option` AS `houseoption`,`tm5`.`criditing` AS `tmhousecriditing`,`tm5`.`authTime` AS `houseauthTime`,`tm6`.`auditStatus` AS `tmcarauditStatus`,`tm6`.`option` AS `caroption`,`tm6`.`criditing` AS `carcriditing`,`tm6`.`authTime` AS `carauthTime`,`tm7`.`auditStatus` AS `tmmerrayauditStatus`,`tm7`.`option` AS `merrayoption`,`tm7`.`criditing` AS `merraycriditing`,`tm7`.`authTime` AS `merrayauthTime`,`tm8`.`auditStatus` AS `tmxueliauditStatus`,`tm8`.`option` AS `xuelioption`,`tm8`.`criditing` AS `xuelicriditing`,`tm8`.`authTime` AS `xueliauthTime`,`tm9`.`auditStatus` AS `tmjishuauditStatus`,`tm9`.`option` AS `jishuoption`,`tm9`.`criditing` AS `jishucriditing`,`tm9`.`authTime` AS `jishuauthTime`,`tm10`.`auditStatus` AS `tmtelephoneauditStatus`,`tm10`.`option` AS `telephoneoption`,`tm10`.`criditing` AS `telephonecriditing`,`tm10`.`authTime` AS `telephoneauthTime`,`tm11`.`auditStatus` AS `tmweiboauditStatus`,`tm11`.`option` AS `weibooption`,`tm11`.`criditing` AS `weibocriditing`,`tm11`.`authTime` AS `weiboauthTime`,`tm12`.`auditStatus` AS `tmxcauditStatus`,`tm12`.`option` AS `xcoption`,`tm12`.`criditing` AS `xccriditing`,`tm12`.`authTime` AS `xcauthTime`,`tm13`.`auditStatus` AS `tmdiyaauditStatus`,`tm13`.`option` AS `diyaoption`,`tm13`.`criditing` AS `diyacriditing`,`tm13`.`authTime` AS `diyaauthTime`,`tm14`.`auditStatus` AS `tmdanbaoauditStatus`,`tm14`.`option` AS `danbaooption`,`tm14`.`criditing` AS `danbaocriditing`,`tm14`.`authTime` AS `danbaoauthTime`,`tm15`.`auditStatus` AS `tmqitaauditStatus`,`tm15`.`option` AS `qitaoption`,`tm15`.`criditing` AS `qitacriditing`,`tm15`.`authTime` AS `qitaauthTime` from ((((((((((((`t_user` `tuser` left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 6)))) left join `t_materialsauth` `tm6` on(((`tuser`.`id` = `tm6`.`userId`) and (`tm6`.`materAuthTypeId` = 7)))) left join `t_materialsauth` `tm7` on(((`tuser`.`id` = `tm7`.`userId`) and (`tm7`.`materAuthTypeId` = 8)))) left join `t_materialsauth` `tm8` on(((`tuser`.`id` = `tm8`.`userId`) and (`tm8`.`materAuthTypeId` = 9)))) left join `t_materialsauth` `tm9` on(((`tuser`.`id` = `tm9`.`userId`) and (`tm9`.`materAuthTypeId` = 10)))) left join `t_materialsauth` `tm10` on(((`tuser`.`id` = `tm10`.`userId`) and (`tm10`.`materAuthTypeId` = 11)))) left join `t_materialsauth` `tm11` on(((`tuser`.`id` = `tm11`.`userId`) and (`tm11`.`materAuthTypeId` = 12)))) left join `t_materialsauth` `tm12` on(((`tuser`.`id` = `tm12`.`userId`) and (`tm12`.`materAuthTypeId` = 13)))) left join `t_materialsauth` `tm13` on(((`tuser`.`id` = `tm13`.`userId`) and (`tm13`.`materAuthTypeId` = 14)))) left join `t_materialsauth` `tm14` on(((`tuser`.`id` = `tm14`.`userId`) and (`tm14`.`materAuthTypeId` = 15)))) left join `t_materialsauth` `tm15` on(((`tuser`.`id` = `tm15`.`userId`) and (`tm15`.`materAuthTypeId` = 16)))) group by `tuser`.`username` ;

-- ----------------------------
-- View structure for v_t_user_select_credit_last
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_select_credit_last`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_select_credit_last` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tm`.`materAuthTypeId` AS `tmtId`,`tm`.`auditStatus` AS `tmStatus`,`tmt`.`name` AS `tmtname`,`tm`.`option` AS `option` from ((`t_materialsauth` `tm` left join `t_user` `tuser` on((`tuser`.`id` = `tm`.`userId`))) left join `t_materialsauthtype` `tmt` on((`tmt`.`id` = `tm`.`materAuthTypeId`))) where (`tm`.`materAuthTypeId` > 5) ;

-- ----------------------------
-- View structure for v_t_user_showfirstpicture
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_showfirstpicture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_showfirstpicture` AS select `tmd`.`id` AS `tmdid`,`tm`.`userId` AS `id`,`tmd`.`imagePath` AS `imagePath`,`tm`.`materAuthTypeId` AS `materAuthTypeId`,`tm`.`id` AS `tmid` from (`t_materialimagedetal` `tmd` left join `t_materialsauth` `tm` on((`tmd`.`materialsauthid` = `tm`.`id`))) group by `tm`.`userId`,`tm`.`materAuthTypeId`,`tm`.`groupid` order by `tmd`.`id` ;

-- ----------------------------
-- View structure for v_t_user_successtotalbid_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_successtotalbid_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_successtotalbid_lists` AS select sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `investor` from (`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where ((`b`.`borrowStatus` in (4,5)) and (`b`.`id` is not null)) group by `a`.`investor` union all select sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `investor` from (`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where ((`b`.`borrowStatus` in (4,5)) and (`b`.`id` is not null)) group by `a`.`investor` ;

-- ----------------------------
-- View structure for v_t_user_totalbiddone_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_totalbiddone_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_totalbiddone_lists` AS select sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `investor` from (`t_invest` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where ((`b`.`borrowStatus` = 5) and (`b`.`id` is not null)) group by `a`.`investor` union all select sum(`a`.`realAmount`) AS `realAmount`,`a`.`investor` AS `investor` from (`t_invest_history` `a` left join `t_borrow` `b` on((`a`.`borrowId` = `b`.`id`))) where ((`b`.`borrowStatus` = 5) and (`b`.`id` is not null)) group by `a`.`investor` ;

-- ----------------------------
-- View structure for v_t_user_un_approve_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_un_approve_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_un_approve_lists` AS select distinct `a`.`userId` AS `uid` from ((`t_person` `a` join `t_workauth` `b` on((`a`.`userId` = `b`.`userId`))) join `t_materialsauth` `c` on((`a`.`userId` = `c`.`userId`))) where ((`a`.`auditStatus` <> 3) or (`b`.`auditStatus` <> 3) or (`b`.`directedStatus` <> 3) or (`b`.`otherStatus` <> 3) or (`b`.`moredStatus` <> 3) or ((`c`.`auditStatus` <> 3) and (`c`.`materAuthTypeId` < 6))) ;

-- ----------------------------
-- View structure for v_t_user_usertel
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_usertel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_usertel` AS select `tuser`.`id` AS `id`,`tuser`.`username` AS `username`,`tpi`.`mobilePhone` AS `mobilePhone`,`tpi`.`requsetTime` AS `requsetTime`,`tp`.`cellPhone` AS `cellPhone`,`tpi`.`reason` AS `reason`,`tpi`.`status` AS `tpistatus`,`tpi`.`option` AS `option`,`tpi`.`id` AS `tpiid` from ((`t_user` `tuser` left join `t_phone_binding_info` `tpi` on((`tuser`.`id` = `tpi`.`userId`))) left join `t_person` `tp` on((`tuser`.`id` = `tp`.`userId`))) ;

-- ----------------------------
-- View structure for v_t_user_verypictur
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_verypictur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_verypictur` AS select `tuser`.`id` AS `id`,((((ifnull(`tm1`.`auditStatus`,0) + ifnull(`tm2`.`auditStatus`,0)) + ifnull(`tm3`.`auditStatus`,0)) + ifnull(`tm4`.`auditStatus`,0)) + ifnull(`tm5`.`auditStatus`,0)) AS `ccc` from (((((`t_user` `tuser` left join `t_materialsauth` `tm1` on(((`tuser`.`id` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm2` on(((`tuser`.`id` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm3` on(((`tuser`.`id` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm4` on(((`tuser`.`id` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm5` on(((`tuser`.`id` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 5)))) group by `tuser`.`id` ;

-- ----------------------------
-- View structure for v_t_user_verypictur_admin
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_verypictur_admin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_verypictur_admin` AS select `tuser`.`userId` AS `id`,((((ifnull(`tm1`.`auditStatus`,0) + ifnull(`tm2`.`auditStatus`,0)) + ifnull(`tm3`.`auditStatus`,0)) + ifnull(`tm4`.`auditStatus`,0)) + ifnull(`tm5`.`auditStatus`,0)) AS `ccc` from (((((`t_borrow_role` `tuser` left join `t_materialsauth` `tm1` on(((`tuser`.`userId` = `tm1`.`userId`) and (`tm1`.`materAuthTypeId` = 1)))) left join `t_materialsauth` `tm2` on(((`tuser`.`userId` = `tm2`.`userId`) and (`tm2`.`materAuthTypeId` = 2)))) left join `t_materialsauth` `tm3` on(((`tuser`.`userId` = `tm3`.`userId`) and (`tm3`.`materAuthTypeId` = 3)))) left join `t_materialsauth` `tm4` on(((`tuser`.`userId` = `tm4`.`userId`) and (`tm4`.`materAuthTypeId` = 4)))) left join `t_materialsauth` `tm5` on(((`tuser`.`userId` = `tm5`.`userId`) and (`tm5`.`materAuthTypeId` = 5)))) group by `tuser`.`userId` ;

-- ----------------------------
-- View structure for v_t_user_withdraw_lists
-- ----------------------------
DROP VIEW IF EXISTS `v_t_user_withdraw_lists`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_user_withdraw_lists` AS select `a`.`id` AS `id`,`a`.`name` AS `name`,`a`.`cellPhone` AS `cellPhone`,`a`.`acount` AS `acount`,`a`.`sum` AS `sum`,`a`.`poundage` AS `poundage`,`a`.`applyTime` AS `applyTime`,`a`.`status` AS `status`,`a`.`bankId` AS `bankId`,`a`.`userId` AS `userId`,`a`.`remark` AS `remark`,`a`.`checkId` AS `checkId`,`a`.`checkTime` AS `checkTime`,`a`.`ipAddress` AS `ipAddress`,`a`.`id` AS `wid`,`c`.`realName` AS `realName`,`d`.`bankName` AS `bankName`,`d`.`branchBankName` AS `branchBankName`,(`a`.`sum` - `a`.`poundage`) AS `realMoney`,`a`.`trxId` AS `trxId`,`u`.`usableSum` AS `usableSum`,`u`.`freezeSum` AS `freezeSum`,`u`.`ipayAccount` AS `usrCustId`,`a`.`billcode` AS `billcode` from (((`t_withdraw` `a` left join `t_person` `c` on((`a`.`userId` = `c`.`userId`))) left join `t_bankcard` `d` on((`a`.`bankId` = `d`.`cardNo`))) left join `t_user` `u` on((`a`.`userId` = `u`.`id`))) ;

-- ----------------------------
-- View structure for v_t_vippicture
-- ----------------------------
DROP VIEW IF EXISTS `v_t_vippicture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dbdev`@`%` SQL SECURITY DEFINER VIEW `v_t_vippicture` AS select `tuser`.`id` AS `id`,`tuser`.`vipStatus` AS `vipStatus`,`tuser`.`username` AS `username`,`f_vip`(`tuser`.`rating`) AS `vip` from `t_user` `tuser` ;

-- ----------------------------
-- Procedure structure for pro10
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro10`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pro10`()
BEGIN
	#Routine body goes here...
	  declare i int;
		set i=100000;
		 while i<100555 do
				insert into t_user_voucher(userid,rewardMoney,rewardTime,minMoney,maxMoney,rbname) VALUES(i,null,null,500,2000,'20元代金券');
				insert into t_user_voucher(userid,rewardMoney,rewardTime,minMoney,maxMoney,rbname) VALUES(i,null,null,2000,5000,'50元代金券');
				insert into t_user_voucher(userid,rewardMoney,rewardTime,minMoney,maxMoney,rbname) VALUES(i,null,null,5000,10000,'50元代金券');
				insert into t_user_voucher(userid,rewardMoney,rewardTime,minMoney,maxMoney,rbname) VALUES(i,null,null,10000,20000000,'88元代金券');
				set i=i+1;
		end while;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_examine
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_examine`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_examine`(IN `adminId`  bigint)
BEGIN
		#等待资料审核的借款
	 DECLARE ddcount INT default 0; 
		#借款初审审核
	 DECLARE pcount INT default 0; 
		#借款满标审核
	 DECLARE fcount int  default 0;
   #债权初审
	 DECLARE zccount INT default 0;
	 #债权转让中
	 DECLARE zacount INT default 0;
	#基本信息审核
	 DECLARE jbxxcount int default 0;
   #基本资料审核
	 DECLARE jbzlcount INT default 0;
	 #银行卡变更
	 DECLARE yhbgcount INT default 0;
	 #提现申请审核
	 DECLARE ddtxcount int default 0;
   #转账中的提现
	 DECLARE zctxcount int default 0;
	 #额度申请变更
	 DECLARE edcount int default 0;
	 #手机申请变更
	 DECLARE sjcount int default 0;
   DECLARE kxcount int default 0;
	#等待资料审核的借款权限
	 DECLARE ddcountright INT default 0; 
		#借款初审审核权限权限
	 DECLARE pcountright INT default 0; 
		#借款满标审核权限
	 DECLARE fcountright int  default 0;
   #债权初审权限
	 DECLARE zccountright INT default 0;
	 #债权转让中权限
	 DECLARE zacountright INT default 0;
	#基本信息审核权限
	 DECLARE jbxxcountright int default 0;
   #基本资料审核权限
	 DECLARE jbzlcountright INT default 0;
	 #银行卡变更权限
	 DECLARE yhbgcountright INT default 0;
	 #提现申请审核权限
	 DECLARE ddtxcountright int default 0;
   #转账中的提现权限
	 DECLARE zctxcountright int default 0;
	 #额度申请变更权限
	 DECLARE edcountright int default 0;
	 #手机申请变更权限
	 DECLARE sjcountright int default 0;
   DECLARE kxcountright int default 0;
				#等待资料审核的借款
		SELECT  COUNT(1) into @deidai  FROM ( SELECT a.id, a.userId, a.username, a.realName, b.counts AS counts, a.borrowWay, a.borrowTitle, a.borrowAmount, a.annualRate, a.deadline, a.raiseTerm, a.isDayThe, a.borrowShow FROM v_t_borrow_h_firstaudit a LEFT JOIN ( SELECT userid, COUNT(1) AS counts FROM t_materialsauth WHERE auditStatus = 3 GROUP BY userid ) b ON a.userId = b.userid INNER JOIN v_t_user_un_approve_lists c ON a.userid = c.uid WHERE a.borrowway > 2 UNION ALL SELECT a.id, a.userId, a.username, a.realName, b.counts AS counts, a.borrowWay, a.borrowTitle, a.borrowAmount, a.annualRate, a.deadline, a.raiseTerm, a.isDayThe, a.borrowShow FROM v_t_borrow_h_firstaudit a LEFT JOIN ( SELECT userid, count(1) AS counts FROM t_materialsauth WHERE auditstatus = 3 GROUP BY userid ) b ON a.userid = b.userid INNER JOIN v_t_user_base_approve_lists d ON a.userid = d.uuid WHERE a.borrowway < 3 AND d.auditstatus = 1 ) t;
		set  ddcount = IFNULL(@deidai,0);
		SELECT COUNT(1) into @deidairight  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id= 72;
		set  ddcountright = IFNULL(@deidairight,0);
	 #基本信息审核
   select COUNT(DISTINCT id ) INTO @jbxx  from  v_t_personcheck where (personauditStatus =1 and personauditStatus is not null)  or ( workauditStatus =1  and workauditStatus is not null) or (directedStatus =1 and directedStatus is not null) or (otherStatus =1 and otherStatus is not null) or  ( moredStatus = 1 and moredStatus is not null);
	 set jbxxcount = IFNULL(@jbxx,0);
		SELECT COUNT(1) into @jbxxright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 1;
		set  jbxxcountright = IFNULL(@jbxxright,0);
		#基本资料审核
		SELECT COUNT( DISTINCT u.id) INTO @jbzl FROM t_materialsauth t LEFT JOIN t_user u  ON t.userId = u.id  WHERE (t.materAuthTypeId = 1 AND auditStatus =1) OR( t.materAuthTypeId = 2 AND auditStatus =1 ) OR( t.materAuthTypeId = 3 AND auditStatus =1 ) OR ( t.materAuthTypeId = 4 AND auditStatus =1) OR (t.materAuthTypeId = 5 AND auditStatus =1 );
		set jbzlcount = IFNULL(@jbzl,0);
		SELECT COUNT(1) into @jbzlcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 2;
		set  jbzlcountright = IFNULL(@jbzlcountright,0);
		#借款初审审核
		select COUNT(1) INTO @chus from (SELECT a.*, b.counts	FROM(	select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime` from ((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) where (`a`.`borrowStatus` = 1)) a	LEFT JOIN(	SELECT		userid,		COUNT(1)AS counts	FROM		t_materialsauth	WHERE		auditStatus = 3	GROUP BY	userid	)b ON a.userId = b.userid	INNER JOIN (select distinct `a`.`userId` AS `uid` from ((`t_person` `a` join `t_workauth` `b` on((`a`.`userId` = `b`.`userId`))) join `t_materialsauth` `c` on((`a`.`userId` = `c`.`userId`))) where ((`a`.`auditStatus` = 3) and (`b`.`auditStatus` = 3) and (`b`.`directedStatus` = 3) and (`b`.`otherStatus` = 3) and (`b`.`moredStatus` = 3) and (`c`.`auditStatus` = 3) and (`c`.`materAuthTypeId` < 6))) c ON a.userId = c.uid	WHERE		a.borrowWay > 2	UNION ALL	SELECT		a.*, b.counts	FROM	(select `a`.`id` AS `id`,`b`.`id` AS `userId`,`b`.`username` AS `username`,`c`.`realName` AS `realName`,`a`.`borrowWay` AS `borrowWay`,`a`.`borrowTitle` AS `borrowTitle`,`a`.`borrowAmount` AS `borrowAmount`,`a`.`annualRate` AS `annualRate`,`a`.`deadline` AS `deadline`,`a`.`isDayThe` AS `isDayThe`,`a`.`raiseTerm` AS `raiseTerm`,`a`.`borrowStatus` AS `borrowStatus`,`a`.`publishTime` AS `publishTime` from ((`t_borrow` `a` left join `t_user` `b` on((`a`.`publisher` = `b`.`id`))) left join `t_person` `c` on((`c`.`userId` = `b`.`id`))) where (`a`.`borrowStatus` = 1)) a	LEFT JOIN(	SELECT		userid,		COUNT(1)AS counts		FROM		t_materialsauth	WHERE	auditStatus = 3	GROUP BY		userid	)b ON a.userId = b.userid		INNER JOIN (select `t_person`.`userId` AS `uuid`,`t_person`.`auditStatus` AS `auditStatus` from `t_person`) d ON a.userId = d.uuid	WHERE	a.borrowWay < 3		AND d.auditStatus = 3)t ;
		set pcount = IFNULL(@chus,0); 
		SELECT COUNT(1) into @pcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 79;
		set  pcountright = IFNULL(@pcountright,0);
		#借款满标审核
		select count(1) into @chushen from  t_borrow t  WHERE t.borrowStatus = 3 ;
		set fcount = IFNULL(@chushen,0);
		SELECT COUNT(1) into @fcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 81;
		set  fcountright = IFNULL(@fcountright,0);
		#债权初审
    SELECT  COUNT(1)  into @cassignment from t_assignment_debt where debtStatus =1;
		set zccount = IFNULL(@cassignment,0);
		SELECT COUNT(1) into @zccountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 432;
		set  zccountright = IFNULL(@zccountright,0);
		#债权成交
    SELECT  COUNT(1)  into @zassignment from t_assignment_debt where debtStatus =2;
		set zacount = IFNULL(@zassignment,0);
		SELECT COUNT(1) into @zacountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 433;
		set  zacountright = IFNULL(@zacountright,0);
    #等待审核的提现
		SELECT COUNT(1) INTO @ddtx  FROM (	(	`t_withdraw` `a`	LEFT JOIN `t_person` `c` ON((`a`.`userId` = `c`.`userId`)	)	)LEFT JOIN `t_bankcard` `d` ON((`a`.`bankId` = `d`.`id`)))where  a.status =1;
		set ddtxcount = IFNULL(@ddtx,0);
		SELECT COUNT(1) into @ddtxcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 556;
		set  ddtxcountright = IFNULL(@ddtxcountright,0);
		#转账中的提现
		SELECT COUNT(1) INTO @zctx  FROM (	(	`t_withdraw` `a`	LEFT JOIN `t_person` `c` ON((`a`.`userId` = `c`.`userId`)	)	)LEFT JOIN `t_bankcard` `d` ON((`a`.`bankId` = `d`.`id`)))where  a.status =4;
		set zctxcount = IFNULL(@zctx,0);
		SELECT COUNT(1) into @zctxcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 557;
		set  zctxcountright = IFNULL(@zctxcountright,0);
		#银行卡变更审核
		SELECT COUNT(1) INTO @yhbg FROM((	(		`t_bankcard` `a`	LEFT JOIN `t_person` `b` ON((`a`.`userId` = `b`.`userId`)))LEFT JOIN `t_user` `c` ON((`a`.`userId` = `c`.`id`))	)	LEFT JOIN `t_phone_binding_info` `d` ON((`a`.`userId` = `d`.`userId`)	) ) where a.modifiedCardStatus =2;
		set yhbgcount = IFNULL(@yhbg,0);
		SELECT COUNT(1) into @yhbgcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 443;
		set  yhbgcountright = IFNULL(@yhbgcountright,0);
		#额度申请
		SELECT COUNT(1) INTO @ed FROM((	`t_user` `tuser`	LEFT JOIN `t_crediting` `tc` ON(		(	`tuser`.`id` = `tc`.`applyer`	)	)	)	LEFT JOIN `t_admin` `ta` ON((`tuser`.`adminId` = `ta`.`id`)))WHERE(`tc`.`applyAmount` IS NOT NULL and status =1);
	  set edcount = IFNULL(@ed ,0);
		SELECT COUNT(1) into @edcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 464;
		set  edcountright = IFNULL(@edcountright,0);
		#手机变更申请
		select COUNT(1) into @sj from  t_phone_binding_info tpbi left join  t_user tuser   on tuser.id = tpbi.userId   left join t_person tp on tuser.id = tp.userId  left join  (select SUM(investAmount) as co, ti.investor as tiv from t_invest ti GROUP BY ti.investor) a  on  a.tiv = tuser.id   where tpbi.status =2 and tpbi.type =2 ;
		set sjcount = IFNULL(@sj ,0);
		SELECT COUNT(1) into @sjcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 463;
		set  sjcountright = IFNULL(@sjcountright,0);
    #可选资料认证
		SELECT COUNT(DISTINCT u.id) INTO  @kxuan FROM t_materialsauth t LEFT JOIN t_user u ON t.userId = u.id WHERE(	t.materAuthTypeId = 6	AND auditStatus < 3	)OR(	t.materAuthTypeId = 7	AND auditStatus < 3 )OR(	t.materAuthTypeId = 8	AND auditStatus < 3)OR(	t.materAuthTypeId = 9	AND auditStatus < 3)OR(	t.materAuthTypeId = 10	AND auditStatus < 3)OR(	t.materAuthTypeId = 11	AND auditStatus < 3)OR(	t.materAuthTypeId = 12	AND auditStatus < 3)OR(	t.materAuthTypeId = 13	AND auditStatus < 3 )OR(	t.materAuthTypeId = 14 AND auditStatus < 3) OR (	t.materAuthTypeId = 15	AND auditStatus < 3  )OR(t.materAuthTypeId = 16 AND auditStatus < 3);
		set kxcount = IFNULL(@kxuan ,0);
		SELECT COUNT(1) into @kxcountright  FROM t_admin a LEFT JOIN t_role b ON b.id = a.roleId LEFT JOIN t_role_rights c ON c.roleId = b.id LEFT JOIN bt_rights d ON d.id = c.rightsId WHERE a.id = adminId AND d.id = 4;
		set  kxcountright = IFNULL(@kxcountright,0);
    select pcount,fcount ,ddcount, zccount,zacount,jbzlcount,ddtxcount,zctxcount ,yhbgcount ,edcount ,sjcount ,kxcount,jbxxcount,
		pcountright,fcountright ,ddcountright, zccountright,zacountright,jbzlcountright,ddtxcountright,zctxcountright ,yhbgcountright ,edcountright ,sjcountright ,kxcountright,jbxxcountright;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getBackAcountStatis
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getBackAcountStatis`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getBackAcountStatis`(IN `startTime` varchar(50),IN `endTime` varchar(50),IN `title` varchar(1024),IN `in_uid` bigint)
BEGIN
   #借款ID
	 declare borrowId BIGINT default -1;
   #借款发布时间
   declare borrowTime  varchar(30) default '';
   #全部待收本息总额
   declare allForPI DECIMAL(18,2) default 0;
   #待收本息
   declare forpayPI DECIMAL(18,2) default 0;
   #一年内待收本息总额
   declare allForPIYear DECIMAL(18,2) default 0;
   #一年内待收本息
   declare forpayPIYear DECIMAL(18,2) default 0;
   #3个月内待收本息总额
   declare allForPIThreeMonth DECIMAL(18,2) default 0;
   #3个月内待收本息
   declare forpayPIThreeMonth DECIMAL(18,2) default 0;
   #1个月内待收本息总额
   declare allForPIOneMonth DECIMAL(18,2) default 0;
   #1个月内待收本息
   declare forpayPIOneMonth DECIMAL(18,2) default 0;
   declare sqlStr varchar(1024) default '';
   #计数器
   declare counts int default 0; 
   DECLARE  _done INT DEFAULT 0;
   DECLARE cursor_borrrow CURSOR FOR select b.id,b.auditTime from t_invest a left join t_borrow b on a.borrowId = b.id
   where a.investor = in_uid and b.borrowStatus = 4 group by b.id;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _done = 1;#错误定义，标记循环结束
   if( startTime = '') THEN
       set sqlStr = concat(sqlStr,"");
   else
       set sqlStr = concat(sqlStr," and c.publishTime >='",startTime,"'");
   end if;
   if(endTime = '') THEN
       set sqlStr = concat(sqlStr,"");
   else
       set sqlStr = concat(sqlStr," and c.publishTime <='",endTime,"'");
   end if;
   if(title = '') THEN
       set sqlStr = concat(sqlStr,"");
   else
       set sqlStr = concat(sqlStr," and c.borrowTitle like '%",title,"%'");
   end if;
   OPEN cursor_borrrow;
       FETCH cursor_borrrow INTO borrowId,borrowTime; 
       while _done <> 1 do
            set counts = counts +1;
            set borrowId = borrowId;
            set borrowTime = concat('',borrowTime);
            
            #全部待收本息
            set @forpayPI = 0;
            SET @allForPI_sql=CONCAT("SELECT SUM(a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) forpayAmount into @forpayPI FROM t_invest_repayment a");
            SET @allForPI_sql=CONCAT(@allForPI_sql,"  left join t_invest b on a.invest_id = b.id LEFT JOIN t_borrow c ON b.borrowId=c.id WHERE (a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) > 0 and b.borrowId=",borrowId);
            SET @allForPI_sql=CONCAT(@allForPI_sql," and b.investor = ",in_uid,sqlStr);
            PREPARE allForPISql FROM @allForPI_sql;  
            EXECUTE allForPISql;
            DEALLOCATE PREPARE allForPISql;
            set forpayPI = IFNULL(@forpayPI,0);
            set allForPI = IFNULL(allForPI,0) + IFNULL(forpayPI,0);
            #未来一年待收本息
            set @forpayPIYear = 0;
            SET @allForPIYear_sql=CONCAT("SELECT SUM(a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) forpayAmount into @forpayPIYear FROM t_invest_repayment a");
            SET @allForPIYear_sql=CONCAT(@allForPIYear_sql," left join t_invest b on a.invest_id = b.id LEFT JOIN t_borrow c ON b.borrowId=c.id WHERE (a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) > 0 and b.borrowId=",borrowId);
            SET @allForPIYear_sql=CONCAT(@allForPIYear_sql," AND a.repayDate >= '",borrowTime,"' AND a.repayDate <= DATE_ADD('",borrowTime,"',INTERVAL 1 YEAR)");
            SET @allForPIYear_sql=CONCAT(@allForPIYear_sql," and b.investor = ",in_uid,sqlStr);
            PREPARE allForPIYearSql FROM @allForPIYear_sql;  
            EXECUTE allForPIYearSql;  
            DEALLOCATE PREPARE allForPIYearSql;
            set forpayPIYear = IFNULL(@forpayPIYear,0);
            set allForPIYear = IFNULL(allForPIYear,0) + IFNULL(forpayPIYear,0);
           
            #3个月内待收本息
            set @forpayPIThreeMonth = 0;
            SET @allForPIThreeMonth_sql=CONCAT("SELECT SUM(a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) forpayAmount into @forpayPIThreeMonth FROM t_invest_repayment a");
            SET @allForPIThreeMonth_sql=CONCAT(@allForPIThreeMonth_sql," left join t_invest b on a.invest_id = b.id LEFT JOIN t_borrow c ON b.borrowId=c.id WHERE (a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) > 0 and b.borrowId=",borrowId);
            SET @allForPIThreeMonth_sql=CONCAT(@allForPIThreeMonth_sql," AND a.repayDate >= '",borrowTime,"' AND a.repayDate <= DATE_ADD('",borrowTime,"',INTERVAL 3 MONTH)");
            SET @allForPIThreeMonth_sql=CONCAT(@allForPIThreeMonth_sql," and b.investor = ",in_uid,sqlStr);
            PREPARE allForPIThreeMonthSql FROM @allForPIThreeMonth_sql; 
            EXECUTE allForPIThreeMonthSql;  
            DEALLOCATE PREPARE allForPIThreeMonthSql;
            set forpayPIThreeMonth = IFNULL(@forpayPIThreeMonth,0);
            set allForPIThreeMonth = IFNULL(allForPIThreeMonth,0) + IFNULL(forpayPIThreeMonth,0);
            #1个月内待收本息
            set @forpayPIOneMonth = 0;
            SET @allForPIOneMonth_sql=CONCAT("SELECT SUM(a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) forpayAmount into @forpayPIOneMonth FROM t_invest_repayment a");
            SET @allForPIOneMonth_sql=CONCAT(@allForPIOneMonth_sql," left join t_invest b on a.invest_id = b.id LEFT JOIN t_borrow c ON b.borrowId=c.id WHERE (a.recivedPrincipal+a.recivedInterest-a.hasPrincipal-a.hasInterest) > 0 and b.borrowId=",borrowId);
            SET @allForPIOneMonth_sql=CONCAT(@allForPIOneMonth_sql," AND a.repayDate >= '",borrowTime,"' AND a.repayDate <= DATE_ADD('",borrowTime,"',INTERVAL 1 MONTH)");
            SET @allForPIOneMonth_sql=CONCAT(@allForPIOneMonth_sql," and b.investor = ",in_uid,sqlStr);
            PREPARE allForPIOneMonthSql FROM @allForPIOneMonth_sql; 
            EXECUTE allForPIOneMonthSql;  
            DEALLOCATE PREPARE allForPIOneMonthSql;
            set forpayPIOneMonth = IFNULL(@forpayPIOneMonth,0);
            set allForPIOneMonth = IFNULL(allForPIOneMonth,0) + IFNULL(forpayPIOneMonth,0);
           
          fetch  cursor_borrrow INTO borrowId,borrowTime;                
       end while; #当_done=1时退出被循
   CLOSE cursor_borrrow;
   select allForPIOneMonth,allForPIThreeMonth,allForPIYear,allForPI;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getBorrowRecord
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getBorrowRecord`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getBorrowRecord`(IN `borrowId` bigint,IN `date` date)
BEGIN
     #总借款额
     declare borrowAmount DECIMAL(18,2) default 0;
     #发布借款笔数
     declare publishBorrow int default 0;
     #已还本息
     declare hasPI DECIMAL(18,2) default 0;
     #成功借款笔数
     declare successBorrow int default 0;
     #待还本息
     declare forRepayPI DECIMAL(18,2) default 0;
     #正常还清笔数
     declare repayBorrow int default 0;
     #提前还清笔数
     declare beforeRepayBorrow int default 0;
     #未还清笔数
     declare forRepayBorrow int default 0;
     #逾期本息
     declare hasFI DECIMAL(18,2) default 0;
     #逾期次数
     declare hasFICount int default 0;
     #逾期罚款
     declare hasI DECIMAL(18,2) default 0;
     #严重逾期次数
     declare badFICount int default 0;
     #总借出金额
     declare investAmount DECIMAL(18,2) default 0;
     #总借出笔数
     declare investCount int default 0;
     #待回收本息
     declare forPI DECIMAL(18,2) default 0;
     #借款发布者
     declare user bigint default -1;
       #查询借款发布者
       set @user = 0;
       SET @u_sql=CONCAT("select publisher into @user FROM t_borrow where id=",borrowId);  
       PREPARE uSql FROM @u_sql;  
       EXECUTE uSql;  
       DEALLOCATE PREPARE uSql;
       set user = @user;
       #总借出金额和借出笔数
       set @investCount = 0;
       set @investAmount = 0;
       SET @invest_sql=CONCAT("SELECT COUNT(*) counts,SUM(a.realAmount) realAmount into @investCount,@investAmount FROM t_invest a LEFT JOIN t_borrow b ON ");
       SET @invest_sql=CONCAT(@invest_sql," a.borrowId=b.id WHERE b.borrowStatus in(4,5) AND a.investor =",user," GROUP BY a.investor ");   
       PREPARE investSql FROM @invest_sql;  
       EXECUTE investSql;  
       DEALLOCATE PREPARE investSql;
       set investCount = @investCount;
       set investAmount = @investAmount;
       
       #待回收本息
       set @forPI = 0;
       SET @forPI_sql=CONCAT("SELECT  SUM((c.stillPrincipal+c.stillInterest-c.hasPI)*(a.realAmount/b.borrowAmount)) AS forPI into @forPI");
       SET @forPI_sql=CONCAT(@forPI_sql," FROM t_invest a LEFT JOIN t_borrow b ON a.borrowId=b.id ");
       SET @forPI_sql=CONCAT(@forPI_sql," LEFT JOIN t_repayment c ON c.borrowId=b.id WHERE  a.investor =",user," GROUP BY a.investor ");
       PREPARE forPISql FROM @forPI_sql;  
       EXECUTE forPISql;  
       DEALLOCATE PREPARE forPISql;
       set forPI = @forPI;
       #发布借款笔数
       set @publishBorrow = 0;
       SET @publishBorrow_sql=CONCAT("SELECT COUNT(*) counts into @publishBorrow FROM t_borrow WHERE publisher =",user);
       PREPARE publishBorrowSql FROM @publishBorrow_sql;    
       EXECUTE publishBorrowSql;  
       DEALLOCATE PREPARE publishBorrowSql;
       set publishBorrow = @publishBorrow;
       
       #成功借款笔数和金额
       set @successBorrow = 0;
       set @borrowAmount = 0;
       SET @successBorrow_sql=CONCAT("SELECT COUNT(*) counts,SUM(borrowAmount) into @successBorrow,@borrowAmount FROM t_borrow WHERE borrowStatus in(4,5) and publisher =",user);
       PREPARE successBorrowSql FROM @successBorrow_sql;  
       EXECUTE successBorrowSql;  
       DEALLOCATE PREPARE successBorrowSql;
       set successBorrow = @successBorrow;
       set borrowAmount = @borrowAmount;
       
       #已还本息
       set @hasPI = 0;
       SET @hasPI_sql=CONCAT("SELECT  SUM(a.hasPI) AS hasPI into @hasPI FROM t_repayment a LEFT JOIN t_borrow b");
       SET @hasPI_sql=CONCAT(@hasPI_sql," ON a.borrowId = b.id WHERE b.publisher=",user," GROUP BY b.publisher");
       PREPARE hasPISql FROM @hasPI_sql;  
       EXECUTE hasPISql;  
       DEALLOCATE PREPARE hasPISql;
       set hasPI = @hasPI;
       #待还本息
       set @forRepayPI = 0;
       SET @forRepayPI_sql=CONCAT("SELECT  SUM(a.stillPrincipal+a.stillInterest-a.hasPI) AS forRepayPI into @forRepayPI FROM t_repayment a LEFT JOIN t_borrow b");
       SET @forRepayPI_sql=CONCAT(@forRepayPI_sql," ON a.borrowId = b.id WHERE b.publisher=",user," GROUP BY b.publisher");
       PREPARE forRepayPISql FROM @forRepayPI_sql;  
       EXECUTE forRepayPISql;  
       DEALLOCATE PREPARE forRepayPISql;
       set forRepayPI = @forRepayPI;
       #正常还清笔数
       set @repayBorrow = 0;
       SET @repayBorrow_sql=CONCAT("SELECT count(d.counts) counts INTO @repayBorrow FROM t_borrow c LEFT JOIN  (SELECT COUNT(a.borrowId) counts,a.borrowId FROM");
       SET @repayBorrow_sql=CONCAT(@repayBorrow_sql,"  t_repayment a LEFT JOIN t_borrow b ON a.borrowId=b.id");
       SET @repayBorrow_sql=CONCAT(@repayBorrow_sql," WHERE repayStatus =2 GROUP BY a.borrowId) d ON c.id=d.borrowId WHERE  c.publisher = ",user," AND d.borrowId IS NOT null");
       PREPARE repayBorrowSql FROM @repayBorrow_sql;  
       EXECUTE repayBorrowSql;  
       DEALLOCATE PREPARE repayBorrowSql;
       set repayBorrow = @repayBorrow;
       
       #逾期的罚款
       set @hasFI = 0;
       set @hasFICount = 0;
       set @hasI = 0;
       SET @hasFI_sql=CONCAT("SELECT SUM(counts) counts,SUM(forPI) forPI,SUM(lateFI) lateFI into @hasFICount,@hasFI,@hasI FROM t_borrow c LEFT JOIN (SELECT COUNT(a.borrowId) counts,");
       SET @hasFI_sql=CONCAT(@hasFI_sql," SUM(a.stillPrincipal+a.stillInterest-a.hasPI) AS forPI,SUM(a.lateFI) AS lateFI,a.borrowId  FROM t_repayment a LEFT JOIN t_borrow b ON a.borrowId=b.id ");
       SET @hasFI_sql=CONCAT(@hasFI_sql," WHERE a.isLate = 2 GROUP BY a.borrowId) d ON c.id=d.borrowId WHERE  c.publisher = ",user," AND d.borrowId IS NOT NULL");
       PREPARE hasFISql FROM @hasFI_sql;  
       EXECUTE hasFISql;  
       DEALLOCATE PREPARE hasFISql;
       set hasFI = @hasFI;
       set hasFICount = @hasFICount;
       set hasI = @hasI;
       #严重逾期次数
       set @badFICount = 0;
       SET @badFICount_sql=CONCAT("SELECT count(d.counts) counts INTO @badFICount FROM t_borrow c LEFT JOIN  (SELECT COUNT(a.borrowId) counts,a.borrowId FROM t_repayment a LEFT JOIN t_borrow b ON a.borrowId=b.id");
       SET @badFICount_sql=CONCAT(@badFICount_sql," WHERE a.isLate = 2 AND DATEDIFF(DATE_FORMAT(",date,",'%Y-%c-%d'),DATE_FORMAT(a.repayDate,'%Y-%c-%d')) >30");
       SET @badFICount_sql=CONCAT(@badFICount_sql," GROUP BY a.borrowId) d ON c.id=d.borrowId WHERE  c.publisher = ",user," AND d.borrowId IS NOT NULL");
       PREPARE badFICountSql FROM @badFICount_sql;  
       EXECUTE badFICountSql;  
       DEALLOCATE PREPARE badFICountSql;
       set badFICount = @badFICount;
       #统计结果
       select borrowAmount,publishBorrow,hasPI,successBorrow,forRepayPI,repayBorrow,beforeRepayBorrow,
       forRepayBorrow,hasFI,hasFICount,hasI,badFICount,investCount,investAmount,forPI;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getBorrowStatis
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getBorrowStatis`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getBorrowStatis`(IN `user` bigint,IN `date` date)
BEGIN
     #总借款额
     declare borrowAmount DECIMAL(18,2) default 0;
     #发布借款笔数
     declare publishBorrow int default 0;
     #已还本息
     declare hasPI DECIMAL(18,2) default 0;
     #成功借款笔数
     declare successBorrow int default 0;
     #待还本息
     declare forRepayPI DECIMAL(18,2) default 0;
     #正常还清笔数
     declare repayBorrow int default 0;
     #提前还清笔数
     declare beforeRepayBorrow int default 0;
     #未还清笔数
     declare forRepayBorrow int default 0;
     #逾期本息
     declare hasFI DECIMAL(18,2) default 0;
     #逾期次数
     declare hasFICount int default 0;
     #逾期罚款
     declare hasI DECIMAL(18,2) default 0;
     #严重逾期次数
     declare badFICount int default 0;
     #借款总笔数
		 DECLARE allPublishRepay int  DEFAULT 0;
       #发布借款笔数
       set @publishBorrow = 0;
       SET @publishBorrow_sql=CONCAT(" SELECT COUNT(*) counts  into @publishBorrow FROM t_borrow WHERE  publisher =",user,"");
       PREPARE publishBorrowSql FROM @publishBorrow_sql;    
       EXECUTE publishBorrowSql;  
       DEALLOCATE PREPARE publishBorrowSql;
       set publishBorrow = @publishBorrow;
       
       #成功借款笔数和金额
       set @successBorrow = 0;
       set @borrowAmount = 0;
       SET @successBorrow_sql=CONCAT("SELECT COUNT(*) counts,SUM(borrowAmount) into @successBorrow,@borrowAmount FROM ");
       SET @successBorrow_sql=CONCAT(@successBorrow_sql," t_borrow WHERE borrowStatus in(4,5) and publisher =",user,' limit 0,1');
       PREPARE successBorrowSql FROM @successBorrow_sql;  
       EXECUTE successBorrowSql;  
       DEALLOCATE PREPARE successBorrowSql;
       set successBorrow = @successBorrow;
       set borrowAmount = @borrowAmount;
       
       #已还本息
       set @hasPI = 0;
       SET @hasPI_sql=CONCAT("SELECT  SUM(a.hasPI) AS hasPI into @hasPI FROM t_repayment a LEFT JOIN t_borrow b");
       SET @hasPI_sql=CONCAT(@hasPI_sql," ON a.borrowId = b.id WHERE b.publisher=",user," GROUP BY b.publisher"," limit 0,1");
       PREPARE hasPISql FROM @hasPI_sql;  
       EXECUTE hasPISql;  
       DEALLOCATE PREPARE hasPISql;
       set hasPI = @hasPI;
       #待还本息
       set @forRepayPI = 0;
       SET @forRepayPI_sql=CONCAT("SELECT  SUM(a.stillPrincipal+a.stillInterest-a.hasPI) AS forRepayPI into @forRepayPI FROM t_repayment a LEFT JOIN t_borrow b");
       SET @forRepayPI_sql=CONCAT(@forRepayPI_sql," ON a.borrowId = b.id WHERE b.publisher=",user," GROUP BY b.publisher",' limit 0,1');
       PREPARE forRepayPISql FROM @forRepayPI_sql;  
       EXECUTE forRepayPISql;  
       DEALLOCATE PREPARE forRepayPISql;
       set forRepayPI = @forRepayPI;
       #正常还清笔数
       set @repayBorrow = 0;
       SET @repayBorrow_sql=CONCAT("select count(1) counts into @repayBorrow  from t_repayment a LEFT JOIN t_borrow on t_borrow.id = a.borrowId ");
       SET @repayBorrow_sql=CONCAT(@repayBorrow_sql," WHERE DATE_FORMAT(a.repayDate,'%Y-%c-%d') = DATE_FORMAT(a.realRepayDate,'%Y-%c-%d')");
       SET @repayBorrow_sql=CONCAT(@repayBorrow_sql,"and repayStatus=2 and t_borrow.publisher = ",user," ");
       PREPARE repayBorrowSql FROM @repayBorrow_sql;  
       EXECUTE repayBorrowSql;  
       DEALLOCATE PREPARE repayBorrowSql;
       set repayBorrow = @repayBorrow;
       #提前还清笔数
       set @beforeRepayBorrow = 0;
       SET @beforeRepayBorrow_sql=CONCAT("select count(1) counts  into @beforeRepayBorrow from t_repayment a LEFT JOIN t_borrow on t_borrow.id = a.borrowId  ");
       SET @beforeRepayBorrow_sql=CONCAT(@beforeRepayBorrow_sql," WHERE DATE_FORMAT(a.repayDate,'%Y-%c-%d') > DATE_FORMAT(a.realRepayDate,'%Y-%c-%d')");
       SET @beforeRepayBorrow_sql=CONCAT(@beforeRepayBorrow_sql," and repayStatus=2 and t_borrow.publisher = ",user," ");
       PREPARE beforeRepayBorrowSql FROM @beforeRepayBorrow_sql;  
       EXECUTE beforeRepayBorrowSql;  
       DEALLOCATE PREPARE beforeRepayBorrowSql;
       set beforeRepayBorrow = @beforeRepayBorrow;
       #未还清笔数
       set @forRepayBorrow = 0;
       SET @forRepayBorrow_sql=CONCAT("select count(1) counts into @forRepayBorrow from t_repayment a LEFT JOIN t_borrow on t_borrow.id = a.borrowId ");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," WHERE a.repayStatus !=2 and t_borrow.publisher = ",user," ");
       PREPARE forRepayBorrowSql FROM @forRepayBorrow_sql;  
       EXECUTE forRepayBorrowSql;  
       DEALLOCATE PREPARE forRepayBorrowSql;
       set forRepayBorrow = @forRepayBorrow;
      
       #逾期的罚款
       set @hasFI = 0;
       set @hasFICount = 0;
       set @hasI = 0;
       SET @hasFI_sql=CONCAT("SELECT SUM(c.counts) counts,SUM(c.forPI) forPI,SUM(c.lateFI) lateFI into @hasFICount,@hasFI,@hasI FROM (SELECT COUNT(a.borrowId) counts,");
       SET @hasFI_sql=CONCAT(@hasFI_sql," SUM(a.stillPrincipal+a.stillInterest-a.hasPI) AS forPI,SUM(a.lateFI) AS lateFI,b.publisher FROM t_repayment a LEFT JOIN ");
       SET @hasFI_sql=CONCAT(@hasFI_sql,"  t_borrow b ON a.borrowId=b.id WHERE b.publisher = ",user," and a.isLate = 2 GROUP BY a.borrowId) c GROUP BY c.publisher  LIMIT 0,1");
       PREPARE hasFISql FROM @hasFI_sql;  
       EXECUTE hasFISql;  
       DEALLOCATE PREPARE hasFISql;
       set hasFI = @hasFI;
       set hasFICount = @hasFICount;
       set hasI = @hasI;
       #严重逾期次数
       set @badFICount = 0;
       SET @badFICount_sql=CONCAT("SELECT SUM(c.counts) counts into @badFICount FROM (SELECT COUNT(a.borrowId) counts,b.publisher FROM t_repayment a LEFT JOIN t_borrow b ON a.borrowId=b.id");
       SET @badFICount_sql=CONCAT(@badFICount_sql," WHERE a.isLate = 2 AND DATEDIFF(DATE_FORMAT(",date,",'%Y-%c-%d'),DATE_FORMAT(a.repayDate,'%Y-%c-%d')) >30");
       SET @badFICount_sql=CONCAT(@badFICount_sql," and b.publisher = ",user," GROUP BY a.borrowId) c GROUP BY c.publisher limit 0,1");
       PREPARE badFICountSql FROM @badFICount_sql;  
       EXECUTE badFICountSql;  
       DEALLOCATE PREPARE badFICountSql;
       set badFICount = @badFICount;
			 #发布总笔数
			 set @allPublishRepay=0;
			 set @allPublishRepay_sql=CONCAT(" select count(1) counts into @allPublishRepay from t_repayment a LEFT JOIN t_borrow b on b.id = a.borrowId ");
       set @allPublishRepay_sql=CONCAT(@allPublishRepay_sql," where b.publisher = ",user," ");
			 PREPARE allPublishRepaysql FROM @allPublishRepay_sql;  
       EXECUTE allPublishRepaysql;  
       DEALLOCATE PREPARE allPublishRepaysql;
       set allPublishRepay = @allPublishRepay; 
			
		
       #统计结果
       select borrowAmount,publishBorrow,hasPI,successBorrow,forRepayPI,repayBorrow,beforeRepayBorrow,
       forRepayBorrow,hasFI,hasFICount,hasI,badFICount,allPublishRepay;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getBorrowTypeNet
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getBorrowTypeNet`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getBorrowTypeNet`(IN `user` bigint,`borrowSum` decimal(18,2))
BEGIN
     #净值金额
     declare amount DECIMAL(18,2) default 0;
     #可用余额
     declare usableAmount DECIMAL(18,2) default 0;
     #待收总额
     declare forPaySum DECIMAL(18,4) default 0;
     #待还总额
     declare forRePaySum DECIMAL(18,4) default 0;
       #待收借款统计
       set @forPayPrincipal = 0;
       set @forPayInterest = 0;
       set @forPaySum = 0;
       SET @forpayBorrow_sql=CONCAT("SELECT t4.* INTO @id,@forPayPrincipal,@forPayInterest,@forPaySum FROM (SELECT t3.investor,SUM(t3.forPayPrincipal) AS forPayPrincipal,");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," SUM(t3.interest) AS forPayInterest,SUM(t3.forpaySum) AS forpaySum");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," FROM (SELECT t1.investor,SUM(t2.forPayPrincipal*(t1.realAmount/t2.borrowAmount)) AS forPayPrincipal,");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," SUM(t2.forPayInterest*(t1.realAmount/t2.borrowAmount)) AS forPayInterest,");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," SUM(t2.forPayInterest*(t1.realAmount/t2.borrowAmount)) AS interest,SUM(t2.forpaySum*(t1.realAmount/t2.borrowAmount)) AS forpaySum");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," FROM t_invest t1 LEFT JOIN (SELECT a.borrowId,b.borrowAmount,");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," SUM((a.stillPrincipal/(a.stillPrincipal+a.stillInterest))*(a.stillPrincipal+a.stillInterest-a.hasPI+a.investorForpayFI-a.investorHaspayFI)) AS forPayPrincipal,");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," SUM((a.stillInterest/(a.stillPrincipal+a.stillInterest))*(a.stillPrincipal+a.stillInterest-a.hasPI+a.investorForpayFI-a.investorHaspayFI)) AS forPayInterest,");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," SUM((a.stillPrincipal+a.stillInterest-a.hasPI+a.investorForpayFI-a.investorHaspayFI)) AS forpaySum");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," FROM t_repayment a LEFT JOIN t_borrow b ON a.borrowId = b.id  GROUP BY a.borrowId) t2");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," ON t1.borrowId=t2.borrowId WHERE t2.borrowId IS NOT NULL GROUP BY t1.investor) t3 GROUP BY t3.investor) t4 WHERE t4.investor =",user);
       PREPARE forpayBorrowSql FROM @forpayBorrow_sql;    
       EXECUTE forpayBorrowSql;  
       DEALLOCATE PREPARE forpayBorrowSql;
       set forPaySum = IFNULL(@forPaySum,0);
       
       #待还借款
       set @forRePaySum = 0; 
       set @forRePayPrincipal = 0;
       set @forRePayInterest = 0;
       SET @forRepayBorrow_sql=CONCAT(" select t.* into @id,@forRePayPrincipal,@forRePayInterest,@forRePaySum from (select b.publisher, sum((a.stillPrincipal/(a.stillPrincipal+a.stillInterest))*(a.stillPrincipal+a.stillInterest-a.hasPI+a.lateFI-a.hasFI)) as stillPrincipal,");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," sum((a.stillInterest/(a.stillPrincipal+a.stillInterest))*(a.stillPrincipal+a.stillInterest-a.hasPI+a.lateFI-a.hasFI)) AS stillInterest,");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," sum((a.stillPrincipal+a.stillInterest-a.hasPI+a.lateFI-a.hasFI)) as forpaySum ");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," from t_repayment a left join t_borrow b on a.borrowId = b.id where a.repayStatus = 1 and b.publisher) t WHERE t.publisher = ",user);
       PREPARE forRepayBorrowSql FROM @forRepayBorrow_sql;    
       EXECUTE forRepayBorrowSql;  
       DEALLOCATE PREPARE forRepayBorrowSql;
       set forRePaySum = IFNULL(@forRePaySum,0);
       #用户可用金额 
       set @usableAmount = 0;
       SET @creditlimit_sql=CONCAT('SELECT usableSum into @usableAmount FROM t_user WHERE id = ',user);
       PREPARE creditlimitSql FROM @creditlimit_sql;    
       EXECUTE creditlimitSql;  
       DEALLOCATE PREPARE creditlimitSql;
       set usableAmount = IFNULL(@usableAmount,0); 
       set amount = IFNULL(usableAmount,0) + IFNULL(forPaySum,0) - IFNULL(forRePaySum,0);
       #净值金额大于10000才可以发布
       if(amount >= 10000) THEN
          if(borrowSum >0) THEN
              #发布借款的上限额
              set amount = amount*0.7;
              if(borrowSum <=amount) THEN
                  select 1 as result;
              ELSE
                  select 0 as result;
              end if;
          ELSE
              select 1 as result;
          end if;
          
       else 
          select 0 as result;
       end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getFinanceEarnStatis
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getFinanceEarnStatis`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getFinanceEarnStatis`(IN `timeStart` varchar(1024),IN `timeEnd` varchar(1024))
BEGIN
     #投资成功待收金额
     declare investForAmount DECIMAL(18,2) default 0;
     #投资奖励金额
     declare investRewardAmount  DECIMAL(18,2) default 0;
     #借款人逾期罚金金额
     declare borrowLateFAmount  DECIMAL(18,2) default 0;
     declare inviteReward DECIMAL(18,2) default 0;
     #用户邀请好友金额
     #借款成功总额
     declare borrowAmount DECIMAL(18,2) default 0;
     #借款管理费总额
     declare borrowManageFee DECIMAL(18,2) default 0; 
     #借款利息总额
     declare borrowInterestAmount  DECIMAL(18,2) default 0;
     #借款奖励总额
     declare borrowRewardAmount  DECIMAL(18,2) default 0;
     #借款逾期罚息总额
     declare borrowLateFI  DECIMAL(18,2) default 0;
     
     #投资成功待收金额和投资奖励金额
     set @investForAmount = 0;
     set @investRewardAmount = 0;
     SET @invest_sql=CONCAT("select SUM(recivedPrincipal+recievedInterest-hasPrincipal-hasInterest) investForAmount,SUM(moneyRecord) investRewardAmount");
     SET @invest_sql=CONCAT(@invest_sql,"  into @investForAmount,@investRewardAmount from t_invest where 1=1 ");
     if(timeStart !='')then
        SET @invest_sql=CONCAT(@invest_sql," and investTime >='",timeStart,"'");
     end if;
     if(timeEnd !='') THEN
        SET @invest_sql=CONCAT(@invest_sql," and investTime <='",timeEnd,"'");
     end if;
     PREPARE investSql FROM @invest_sql;    
     EXECUTE investSql;  
     DEALLOCATE PREPARE investSql;
     set investForAmount = IFNULL(@investForAmount,0);
     set investRewardAmount = IFNULL(@investRewardAmount,0);
     set borrowRewardAmount =  IFNULL(@investRewardAmount,0);
     #借款人逾期罚金金额
     set @borrowLateFAmount = 0;
     SET @borrowLate_sql=CONCAT("select sum(lateFI) lateFI into @borrowLateFAmount from t_repayment where 1=1 ");
     if(timeStart !='')then
        SET @borrowLate_sql=CONCAT(@borrowLate_sql," and repayDate >='",timeStart,"'");
     end if;
     if(timeEnd !='') THEN
        SET @borrowLate_sql=CONCAT(@borrowLate_sql," and repayDate <='",timeEnd,"'");
     end if;
     PREPARE borrowLateSql FROM @borrowLate_sql;    
     EXECUTE borrowLateSql;  
     DEALLOCATE PREPARE borrowLateSql;
     set borrowLateFAmount = IFNULL(@borrowLateFAmount,0);
     set borrowLateFI =  IFNULL(@borrowLateFAmount,0);
     #用户邀请好友金额
     set @inviteReward = 0;
     SET @inviteReward_sql=CONCAT("select SUM(rewardMoney) rewardMoney into @inviteReward from t_recommend_user where 1=1");
     if(timeStart !='')then
        SET @inviteReward_sql=CONCAT(@inviteReward_sql," and rewardTime >='",timeStart,"'");
     end if;
     if(timeEnd !='') THEN
        SET @inviteReward_sql=CONCAT(@inviteReward_sql," and rewardTime <='",timeEnd,"'");
     end if;
     PREPARE inviteRewardSql FROM @inviteReward_sql;    
     EXECUTE inviteRewardSql;  
     DEALLOCATE PREPARE inviteRewardSql;
     set inviteReward = IFNULL(@inviteReward,0);
     #借款成功总额和借款管理费
     set @borrowAmount = 0;
     set @borrowManageFee = 0;
     SET @borrow_sql=CONCAT("select SUM(borrowAmount) borrowAmount,SUM(manageFee) borrowManageFee");
     SET @borrow_sql=CONCAT(@borrow_sql,"  into @borrowAmount,@borrowManageFee from t_borrow where 1=1 and borrowStatus in (3,4,5)");
     if(timeStart !='')then
        SET @borrow_sql=CONCAT(@borrow_sql," and auditTime >='",timeStart,"'");
     end if;
     if(timeEnd !='') THEN
        SET @borrow_sql=CONCAT(@borrow_sql," and auditTime <='",timeEnd,"'");
     end if;
     PREPARE borrowSql FROM @borrow_sql;    
     EXECUTE borrowSql;  
     DEALLOCATE PREPARE borrowSql;
     set borrowAmount = IFNULL(@borrowAmount,0);
     set borrowManageFee = IFNULL(@borrowManageFee,0);
     #借款利息
     set @borrowInterestAmount = 0;
     SET @borrowInterest_sql=CONCAT("select sum(stillInterest) stillInterest into @borrowInterestAmount from t_repayment where 1=1 ");
     if(timeStart !='')then
        SET @borrowInterest_sql=CONCAT(@borrowInterest_sql," and repayDate >='",timeStart,"'");
     end if;
     if(timeEnd !='') THEN
        SET @borrowInterest_sql=CONCAT(@borrowInterest_sql," and repayDate <='",timeEnd,"'");
     end if;
     PREPARE borrowInterestSql FROM @borrowInterest_sql;    
     EXECUTE borrowInterestSql;  
     DEALLOCATE PREPARE borrowInterestSql;
     set borrowInterestAmount = IFNULL(@borrowInterestAmount,0);
     select investForAmount,investRewardAmount,borrowLateFAmount,inviteReward,borrowAmount,borrowManageFee,borrowInterestAmount,borrowRewardAmount,borrowLateFI;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getFinanceStatis
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getFinanceStatis`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getFinanceStatis`(IN `uId` bigint)
BEGIN
     #已赚利息
     declare earnInterest DECIMAL(18,2) default 0;
     #奖励收入总额
     declare rewardIncome DECIMAL(18,2) default 0;
     #已赚逾期罚息
     declare hasFI DECIMAL(18,2) DEFAULT 0;
     #总借出金额
     declare investAmount DECIMAL(18,2) default 0;
     #总借出笔数
     declare investCount int default 0;
     #已回收本息
     declare hasPI DECIMAL(18,2) default 0;
     #已回收笔数
     declare hasCount int default 0;
     #待回收本息
     declare forPI DECIMAL(18,2) default 0;
     #待回收笔数
     declare forCount int default 0;
     
     #清除临时变量
     set @investCount = 0;
     set @investAmount = 0;
     set @forPI  = 0;
     set @forCount = 0;
     set @hasPI = 0;
     set @hasCount = 0;
     set @hasFI  = 0;
     set @earnInterest = 0;
     set @rewardIncome = 0;
       #总借出金额和借出笔数
       SET @invest_sql=CONCAT("SELECT COUNT(*) counts,SUM(a.realAmount) realAmount into @investCount,@investAmount FROM t_invest a LEFT JOIN t_borrow b ON ");
       SET @invest_sql=CONCAT(@invest_sql," a.borrowId=b.id WHERE b.borrowStatus in(4,5) AND a.investor =",uId," GROUP BY a.investor ");   
       PREPARE investSql FROM @invest_sql;  
       EXECUTE investSql;  
       DEALLOCATE PREPARE investSql;
       set investCount = @investCount;
       set investAmount = @investAmount;
       
       #待回收本息
       SET @forPI_sql=CONCAT("SELECT SUM(a.recivedPrincipal+a.recievedInterest-a.hasPrincipal-a.hasInterest) forPI INTO @forPI FROM t_invest a");
       SET @forPI_sql=CONCAT(@forPI_sql," WHERE  a.investor =",uId," GROUP BY a.investor ");
       PREPARE forPISql FROM @forPI_sql;  
       EXECUTE forPISql;  
       DEALLOCATE PREPARE forPISql;
       set forPI = @forPI;
       #待回收笔数
       SET @forCount_sql=CONCAT("SELECT SUM(c.counts) counts INTO @forCount FROM( SELECT a.investor, COUNT(a.id) counts FROM t_invest a WHERE (a.recivedPrincipal+a.recievedInterest-a.hasPrincipal-a.hasInterest) >0");
       SET @forCount_sql=CONCAT(@forCount_sql,"  GROUP BY a.investor) c where c.investor =",uId," GROUP BY c.investor");
       PREPARE forCountSql FROM @forCount_sql;  
       EXECUTE forCountSql;  
       DEALLOCATE PREPARE forCountSql;
       set forCount = @forCount;
 
       #已回收本息
       SET @hasPI_sql=CONCAT("SELECT SUM(c.hasPI) hasPI INTO @hasPI FROM( SELECT a.investor, SUM(a.hasPrincipal+a.hasInterest) hasPI FROM t_invest a  GROUP BY a.investor");
       SET @hasPI_sql=CONCAT(@hasPI_sql," UNION ALL SELECT a.investor,SUM(a.hasPrincipal+a.hasInterest) hasPI FROM t_invest_history a  GROUP BY a.investor) c ");
       SET @hasPI_sql=CONCAT(@hasPI_sql,"WHERE  c.investor =",uId," GROUP BY c.investor");
       PREPARE hasPISql FROM @hasPI_sql;  
       EXECUTE hasPISql;  
       DEALLOCATE PREPARE hasPISql;
       set hasPI = @hasPI;
       #已回收笔数
       SET @hasCount_sql=CONCAT("SELECT SUM(c.counts) counts INTO @hasCount FROM( SELECT a.investor, COUNT(a.id) counts FROM t_invest a WHERE a.repayStatus = 2  GROUP BY a.investor");
       SET @hasCount_sql=CONCAT(@hasCount_sql," UNION ALL SELECT a.investor,COUNT(a.id) counts FROM t_invest_history a  GROUP BY a.investor) c where c.investor =",uId," GROUP BY c.investor");
       PREPARE hasCountSql FROM @hasCount_sql;  
       EXECUTE hasCountSql;  
       DEALLOCATE PREPARE hasCountSql;
       set hasCount = @hasCount;
  
       #已赚逾期罚息
       SET @hasFI_sql=CONCAT("SELECT SUM(a.hasFI) hasFI into @hasFI FROM t_invest a WHERE  a.investor =",uId,"  GROUP BY a.investor");
       PREPARE hasFISql FROM @hasFI_sql;  
       EXECUTE hasFISql;  
       DEALLOCATE PREPARE hasFISql;
       set hasFI = @hasFI;
       
       #已赚利息
       SET @earnInterest_sql=CONCAT("SELECT SUM(c.hasInterest) hasPrincipal INTO @earnInterest FROM( SELECT a.investor, SUM(a.hasInterest) hasInterest FROM t_invest a  GROUP BY a.investor");
       SET @earnInterest_sql=CONCAT(@earnInterest_sql," UNION ALL SELECT a.investor,SUM(a.hasInterest) hasInterest FROM t_invest_history a  GROUP BY a.investor) c ");
       SET @earnInterest_sql=CONCAT(@earnInterest_sql,"WHERE  c.investor =",uId," GROUP BY c.investor");
       PREPARE earnInterestSql FROM @earnInterest_sql;    
       EXECUTE earnInterestSql;  
       DEALLOCATE PREPARE earnInterestSql;
       set earnInterest = @earnInterest;
       #已赚奖励总额
       SET @rewardIncome_sql=CONCAT("SELECT SUM(c.reward) reward INTO @rewardIncome FROM( SELECT a.investor, SUM(a.reward) reward FROM t_invest a  GROUP BY a.investor");
       SET @rewardIncome_sql=CONCAT(@rewardIncome_sql," UNION ALL SELECT a.investor,SUM(a.reward) reward FROM t_invest_history a  GROUP BY a.investor) c ");
       SET @rewardIncome_sql=CONCAT(@rewardIncome_sql,"WHERE  c.investor =",uId," GROUP BY c.investor");
       PREPARE rewardIncomeSql FROM @rewardIncome_sql;    
       EXECUTE rewardIncomeSql;  
       DEALLOCATE PREPARE rewardIncomeSql;
       set rewardIncome = @rewardIncome;
       #统计结果
       select  earnInterest as earnInterest,rewardIncome as rewardIncome,hasFI as hasFI,investAmount as investAmount,
       investCount as investCount,hasPI as hasPI,hasCount as hasCount,forPI as forPI,forCount as forCount;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getUserAmountSumary
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getUserAmountSumary`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getUserAmountSumary`(IN `userId` bigint)
BEGIN
     #账户总额
     DECLARE allTotal DECIMAL(18,2) default 0;
     #账户总额
     DECLARE accountSum DECIMAL(18,2) default 0;
     #可用余额
     declare usableAmount DECIMAL(18,2) default 0;
     #冻结金额
     declare freezeAmount DECIMAL(18,2) default 0;
     #提现冻结金额
     declare cashFreezeAmount DECIMAL(18,2) default 0;
     #总收益
     declare earnSum DECIMAL(18,2) default 0;
     #利息收益
     declare rateEarnAmount DECIMAL(18,2) default 0;
     #其他收益
     declare otherEarnAmount DECIMAL(18,2) default 0;
     #体验金收益
     declare tiyanjinAmount DECIMAL(18,2) default 0;
     #已收总额
     declare hasPaySum DECIMAL(18,2) default 0;
     #已收本金
     declare hasPayPrincipal DECIMAL(18,2) default 0;
     #已收利息
     declare hasPayInterest DECIMAL(18,2) default 0;
     #待收总额
     declare forPaySum DECIMAL(18,2) default 0;
     #待收本金
     declare forPayPrincipal DECIMAL(18,2) default 0;
     #待收利息
     declare forPayInterest DECIMAL(18,2) default 0;
     #已还总额
     declare hasRePaySum DECIMAL(18,2) default 0;
     #已还本金
     declare hasRePayPrincipal DECIMAL(18,2) default 0;
     #已还利息
     declare hasRePayInterest DECIMAL(18,2) default 0;
     #待还总额
     declare forRePaySum DECIMAL(18,2) default 0;
     #待还本金
     declare forRePayPrincipal DECIMAL(18,2) default 0;
     #待还利息
     declare forRePayInterest DECIMAL(18,2) default 0;
     #信用额度总额
     declare creditLimit DECIMAL(18,2) default 0;
     #可用信用额度
     declare usableCreditLimit DECIMAL(18,2) default 0;
     #充值总额
     declare tRechargeDetailSum DECIMAL(18,2) default 0;
     #投标中的代金券总额
     declare tRedmoneyrecordSum DECIMAL(18,2) default 0;

     #提现总额
     declare tWithdrawSum DECIMAL(18,2) default 0;
     #提现手续费
     declare tWithdrawPoundage DECIMAL(18,2) default 0;
     #汇付账号
     declare tIpayAccount DECIMAL(20) default 0;
 
     declare id int default 1;
       #投资总汇
       #待收借款统计
       set @forPayPrincipal = 0;
       set @forPayInterest = 0;
       set @forPaySum = 0;
       SET @forpayBorrow_sql=CONCAT("SELECT SUM(a.recivedPrincipal-a.hasPrincipal) forPayPrincipal,SUM(a.recievedInterest-a.hasInterest) forPayInterest,SUM(a.recivedPrincipal+a.recievedInterest-a.hasPrincipal-a.hasInterest) forPaySum INTO @forPayPrincipal,@forPayInterest,@forPaySum FROM t_invest a");
       SET @forpayBorrow_sql=CONCAT(@forpayBorrow_sql," WHERE  a.investor =",userId," GROUP BY a.investor ");
       PREPARE forpayBorrowSql FROM @forpayBorrow_sql;  
       EXECUTE forpayBorrowSql;  
       DEALLOCATE PREPARE forpayBorrowSql;
       set forPayPrincipal = IFNULL(@forPayPrincipal,0);
       set forPayInterest = IFNULL(@forPayInterest,0);
       set forPaySum = IFNULL(@forPaySum,0);
       
       
       
       #已收借款统计
       set @hasPayPrincipal = 0;
       set @hasPayInterest = 0;
       set @hasPaySum = 0;
       SET @hasPayBorrow_sql=CONCAT("SELECT SUM(c.hasPayPrincipal) hasPayPrincipal,SUM(c.hasPayInterest) hasPayInterest, SUM(c.hasPaySum) hasPaySum INTO @hasPayPrincipal,@hasPayInterest,@hasPaySum FROM( SELECT a.investor,SUM(a.hasPrincipal) hasPayPrincipal,SUM(a.hasInterest) hasPayInterest, SUM(a.hasPrincipal+a.hasInterest) hasPaySum FROM t_invest a  GROUP BY a.investor");
       SET @hasPayBorrow_sql=CONCAT(@hasPayBorrow_sql," UNION ALL SELECT a.investor,SUM(a.hasPrincipal) hasPayPrincipal,SUM(a.hasInterest) hasPayInterest, SUM(a.hasPrincipal+a.hasInterest) hasPaySum FROM t_invest_history a  GROUP BY a.investor) c ");
       SET @hasPayBorrow_sql=CONCAT(@hasPayBorrow_sql,"WHERE  c.investor =",userId," GROUP BY c.investor");
       PREPARE hasPayBorrow FROM @hasPayBorrow_sql;    
       EXECUTE hasPayBorrow;  
       DEALLOCATE PREPARE hasPayBorrow;
       set hasPayPrincipal = IFNULL(@hasPayPrincipal,0);
       set hasPayInterest = IFNULL(@hasPayInterest,0);
       set hasPaySum = IFNULL(@hasPaySum,0);
       #借款总汇
       #已还借款统计
       set @hasRePayPrincipal = 0;
       set @hasRePayInterest = 0;
       set @hasRePaySum = 0;
       SET @hasRePayBorrow_sql=CONCAT("select t.* into @id,@hasRePayPrincipal,@hasRePayInterest,@hasRePaySum  from (SELECT b.publisher, SUM(((a.stillPrincipal/(a.stillPrincipal+a.stillInterest))*(a.hasPI+a.hasFI))) AS haspayPrincipal,");
       SET @hasRePayBorrow_sql=CONCAT(@hasRePayBorrow_sql," SUM(((a.stillInterest/(a.stillPrincipal+a.stillInterest))*(a.hasPI+a.hasFI))) AS haspayInterest,SUM((a.hasPI+a.hasFI)) AS haspaySum ");
       SET @hasRePayBorrow_sql=CONCAT(@hasRePayBorrow_sql,"FROM t_repayment a LEFT JOIN t_borrow b");
       SET @hasRePayBorrow_sql=CONCAT(@hasRePayBorrow_sql," ON a.borrowId = b.id GROUP BY b.publisher) t WHERE t.publisher = ",userId);
       PREPARE hasRePayBorrowSql FROM @hasRePayBorrow_sql;    
       EXECUTE hasRePayBorrowSql;  
       DEALLOCATE PREPARE hasRePayBorrowSql;
       set hasRePayPrincipal = IFNULL(@hasRePayPrincipal,0);
       set hasRePayInterest = IFNULL(@hasRePayInterest,0);
       set hasRePaySum = IFNULL(@hasRePaySum,0);
       #待还借款统计
       set @forRePayPrincipal = 0;
       set @forRePayInterest = 0;
       set @forRePaySum = 0;
       SET @forRepayBorrow_sql=CONCAT(" select t.* into @id,@forRePayPrincipal,@forRePayInterest,@forRePaySum from (select b.publisher, sum((a.stillPrincipal/(a.stillPrincipal+a.stillInterest))*(a.stillPrincipal+a.stillInterest-a.hasPI+a.lateFI-a.hasFI)) as stillPrincipal,");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," sum((a.stillInterest/(a.stillPrincipal+a.stillInterest))*(a.stillPrincipal+a.stillInterest-a.hasPI+a.lateFI-a.hasFI)) AS stillInterest,");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," sum((a.stillPrincipal+a.stillInterest-a.hasPI+a.lateFI-a.hasFI)) as forpaySum ");
       SET @forRepayBorrow_sql=CONCAT(@forRepayBorrow_sql," from t_repayment a left join t_borrow b on a.borrowId = b.id where a.repayStatus = 1 GROUP BY b.publisher) t WHERE t.publisher = ",userId);
       PREPARE forRepayBorrowSql FROM @forRepayBorrow_sql;    
       EXECUTE forRepayBorrowSql;  
       DEALLOCATE PREPARE forRepayBorrowSql;
       set forRePayPrincipal = IFNULL(@forRePayPrincipal,0);
       set forRePayInterest = IFNULL(@forRePayInterest,0);
       set forRePaySum = IFNULL(@forRePaySum,0);
       
       #信用额度统计
       set @creditLimit = 0;
			 set @tIpayAccount = 0;
       set @usableCreditLimit = 0;
       SET @creditlimit_sql=CONCAT('SELECT usableSum,freezeSum,creditLimit,usableCreditLimit,ipayAccount into @usableAmount,@freezeAmount');
       set @creditlimit_sql=CONCAT(@creditlimit_sql,',@creditLimit,@usableCreditLimit,@tIpayAccount FROM t_user WHERE id = ',userId);
       PREPARE creditlimitSql FROM @creditlimit_sql;    
       EXECUTE creditlimitSql;  
       DEALLOCATE PREPARE creditlimitSql;
       set creditLimit = IFNULL(@creditLimit,0);
       set usableCreditLimit = IFNULL(@usableCreditLimit,0);
       set tIpayAccount = IFNULL(@tIpayAccount,0);
	   
	   
       #充值总额 
       set @tRechargeDetail = 0; 
       SET @tRechargeDetail_sql=CONCAT('select sum(trd.rechargeMoney)  into @tRechargeDetail from t_recharge_detail trd where trd.result=1 and trd.userId = ',userId);  
	   
       PREPARE tRechargeDetailSql FROM @tRechargeDetail_sql;    
       EXECUTE tRechargeDetailSql;  
       DEALLOCATE PREPARE tRechargeDetailSql;
       set tRechargeDetailSum = IFNULL(@tRechargeDetail,0); 
	   
       #投标中的代金券总额 
       set @redmoneyrecord = 0; 
       SET @redmoneyrecord_sql=CONCAT('select sum(moneyRecord) into @redmoneyrecord from t_invest  where  download_url is null and  investor = ',userId);  
	    
       PREPARE tredmoneyrecordSql FROM @redmoneyrecord_sql;    
       EXECUTE tredmoneyrecordSql;  
       DEALLOCATE PREPARE tredmoneyrecordSql;
       set tRedmoneyrecordSum = IFNULL(@redmoneyrecord,0); 

	     #提现总额 
       set @tWithdrawSum = 0; 
       set @tWithdrawPoundage = 0;
       SET @tRechargeDetailSum_sql=CONCAT('select sum(tw.sum),sum(tw.poundage) into  @tWithdrawSum,@tWithdrawPoundage from t_withdraw tw where tw.`status` in (2,4) and tw.userId = ',userId);  
	   
       PREPARE tRechargeDetailSumSql FROM @tRechargeDetailSum_sql;    
       EXECUTE tRechargeDetailSumSql;  
       DEALLOCATE PREPARE tRechargeDetailSumSql; 
       set tWithdrawSum = IFNULL(@tWithdrawSum,0);
       set tWithdrawPoundage = IFNULL(@tWithdrawPoundage,0);
       #提现冻结金额
       set usableAmount = IFNULL(@usableAmount,0);
       set freezeAmount = IFNULL(@freezeAmount,0)+IFNULL(cashFreezeAmount,0);
       set allTotal = IFNULL(usableAmount,0) + IFNULL(freezeAmount,0) + IFNULL(forPaySum,0)+IFNULL(tRedmoneyrecordSum,0);
       set accountSum = IFNULL(usableAmount,0) + IFNULL(freezeAmount,0) + IFNULL(forPaySum,0)+IFNULL(tRedmoneyrecordSum,0);
       #利息收益
       set rateEarnAmount = IFNULL(hasPayInterest,0)+IFNULL(forPayInterest,0);
       #其他收益
       set @otherEarnAmount = 0;
			 SET @rewardIncome_sql=CONCAT("SELECT SUM(t.handleSum) reward INTO @otherEarnAmount FROM t_fundrecord t where ((t.fundMode like '%奖励%' and t.fundMode not like '%体验金%' ) OR (  t.fundMode LIKE '%券%' and t.remarks like '%您消费了%') or (t.handleSum < 100 and t.fundMode like '%体验金%')) and userId =",userId," ");
       
       PREPARE rewardIncomeSql FROM @rewardIncome_sql;    
       EXECUTE rewardIncomeSql;  
       DEALLOCATE PREPARE rewardIncomeSql;
       set otherEarnAmount = @otherEarnAmount;       

			 #体验金收益
       set @tiyanjinAmount = 0;
			 SET @tiyanjinIncome_sql=CONCAT("SELECT SUM(t.handleSum) reward INTO @tiyanjinAmount FROM t_fundrecord t where (t.handleSum < 100 and t.fundMode like '%体验金%') and userId =",userId," ");
       
       PREPARE tiyanjinIncome FROM @tiyanjinIncome_sql;    
       EXECUTE tiyanjinIncome;  
       DEALLOCATE PREPARE tiyanjinIncome;
       set tiyanjinAmount = @tiyanjinAmount;
       #总收益
       set earnSum = IFNULL(rateEarnAmount,0) + IFNULL(tiyanjinAmount,0);
       
       #统计结果
       select allTotal,accountSum,usableAmount,freezeAmount,cashFreezeAmount,
       earnSum,rateEarnAmount,otherEarnAmount,hasPaySum,
       hasPayPrincipal,hasPayInterest,forPaySum,forPayPrincipal,
       forPayInterest,hasRePaySum,hasRePayPrincipal,hasRePayInterest,
       forRePaySum,forRePayPrincipal,forRePayInterest,creditLimit,usableCreditLimit,tIpayAccount,tRechargeDetailSum,tWithdrawSum,tWithdrawPoundage;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getUserInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getUserInfo`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getUserInfo`(IN `user` bigint,IN `timeStart` varchar(50),IN `timeEnd` varchar(50))
BEGIN
     #注册时间s
     declare createTime date default null;
     #vip到期时间
     declare vipCreateTime datetime default null;
     #最后访问时间
     declare lastDate datetime default null;
     #借款条数
     declare borrowNum varchar(50) default null;
      
     #投资条数
     declare investNum varchar(50) default null;
     #未读站内信
     declare unReadCount varchar(50) default null;
		 declare a varchar(50) default null;
		 declare b varchar(50) default null;
		 declare c varchar(50) default null;
		 declare d varchar(50) default null;
		 declare e varchar(50) default null;
		 declare f varchar(50) default null;
		 declare g varchar(50) default null;
		 declare h varchar(50) default null;
		 declare i varchar(50) default null;
		 declare j varchar(50) default null;
		 declare k varchar(50) default null;
     #个人信息
       set @createTime = '';
       set @vipCreateTime = '';
       set @lastDate = '';
       set @idNo = '';
       SET @user_sql='SELECT a.username,a.createTime,f_rating(a.rating) as rating,f_rating(a.rating) as vip,f_credit_rating(a.creditrating) AS credit,';
       SET @user_sql=CONCAT(@user_sql,'a.creditrating,a.creditLimit,a.lastIP,DATE_ADD(a.vipCreateTime, INTERVAL 1 YEAR) AS vipCreateTime,');
       SET @user_sql=CONCAT(@user_sql,'a.vipStatus,b.personalHead,b.realName,a.lastDate,b.idNo into @username,@createTime,@rating,@vip,@credit,@crediting,@creditLimit,');
       set @user_sql=concat(@user_sql,'@lastIP,@vipCreateTime,@vipStatus,@personalHead,@realName,@lastDate,@idNo');
       SET @user_sql=CONCAT(@user_sql,' FROM t_user a LEFT JOIN t_person b ON  a.id = b.userId where a.id=',user);
       PREPARE userSql FROM @user_sql;    
       EXECUTE userSql;  
       DEALLOCATE PREPARE userSql;
       set createTime = @createTime;
       set vipCreateTime = @vipCreateTime;
       set lastDate = @lastDate; 
       #借款记录统计
       set @borrowNum = 0;
       SET @borrow_sql=CONCAT('SELECT COUNT(*) counts into @borrowNum FROM t_borrow a WHERE a.publisher = ',user,' GROUP BY a.publisher');
       PREPARE borrowSql FROM @borrow_sql;    
       EXECUTE borrowSql;  
       DEALLOCATE PREPARE borrowSql;
       set borrowNum = @borrowNum;
       #投资记录统计
       set @investNum = 0;
       SET @invest_sql=CONCAT('SELECT COUNT(*) counts into @investNum FROM t_invest a WHERE a.investor = ',user,' GROUP BY a.investor');
       PREPARE investSql FROM @invest_sql;    
       EXECUTE investSql;  
       DEALLOCATE PREPARE investSql;
       set investNum = @investNum;
       #未读站内信
       set @unReadCount = 0;
       SET @mail_sql=CONCAT('select count(*) counts into @unReadCount from  t_mail a where a.mailStatus = 1 and a.reciver = ',user,' group by a.reciver');
       PREPARE mailSql FROM @mail_sql;    
       EXECUTE mailSql;  
       DEALLOCATE PREPARE mailSql; 
       set unReadCount = @unReadCount;
       #等待审核借款
       set @waitBorrowCount = 0;
       SET @waitborrow_sql=CONCAT('select count(*) counts into @waitBorrowCount from  t_borrow a where a.borrowStatus = 1 and a.publisher = ',user,' group by a.publisher');
       PREPARE waitborrowSql FROM @waitborrow_sql;    
       EXECUTE waitborrowSql;  
       DEALLOCATE PREPARE waitborrowSql;
       #本月代还款
       set @repayCount = 0;
       SET @repay_sql=CONCAT(" select sum(t.counts) counts into @repayCount from (select count(*) counts,b.publisher from t_repayment a left join t_borrow b on a.borrowId=b.id where b.borrowStatus = 4");
       SET @repay_sql=CONCAT(@repay_sql," and b.publisher = ",user," and a.repayDate>='",timeStart,"'and a.repayDate <='",timeEnd,"' and a.repayStatus = 1 group by b.publisher) t group by t.publisher");
       PREPARE repaySql FROM @repay_sql;    
       EXECUTE repaySql; 
       DEALLOCATE PREPARE repaySql;
       #本月待收还款
       set @forpayCount = 0;
       SET @forpay_sql=CONCAT(" select sum(t.counts) counts into @forpayCount from (select count(*) counts,a.investor FROM t_invest a LEFT JOIN t_repayment b ON a.borrowId = b.borrowId LEFT JOIN t_borrow c ON b.borrowId = c.id");
       SET @forpay_sql=CONCAT(@forpay_sql," LEFT JOIN t_user d ON a.investor = d.id WHERE b.repayStatus = 1 and a.investor =",user);
       SET @forpay_sql=CONCAT(@forpay_sql," and b.repayDate>='",timeStart,"'and b.repayDate <='",timeEnd,"' group by a.investor) t group by t.investor");
       PREPARE forpaySql FROM @forpay_sql;    
       EXECUTE forpaySql; 
       DEALLOCATE PREPARE forpaySql;
       #本月逾期代还款
       set @lateRepayCount = 0;
       SET @laterepay_sql=CONCAT(" select sum(t.counts) counts into @lateRepayCount from (select count(*) counts,b.publisher from t_repayment a left join t_borrow b on a.borrowId=b.id where b.borrowStatus = 4");
       SET @laterepay_sql=CONCAT(@laterepay_sql," and b.publisher = ",user," and a.repayDate>='",timeStart,"'and a.repayDate <='",timeEnd,"' and a.repayStatus = 1");
       set @laterepay_sql=CONCAT(@laterepay_sql," and a.isLate = 2 group by a.borrowId) t group by t.publisher");
       PREPARE laterepaySql FROM @laterepay_sql;    
       EXECUTE laterepaySql; 
       DEALLOCATE PREPARE laterepaySql;
       #上传资料
       set @materis = 0;
       SET @maters_sql=CONCAT(" select count(*) counts into @materis from t_materialsauth where imgPath is not null and userId =",user,"  group by userId;");
       PREPARE matersSql FROM @maters_sql;    
       EXECUTE matersSql; 
       DEALLOCATE PREPARE matersSql;
			 set a = @rating;
			 set b = @vip;
			 set c = @credit;
			 set d = @crediting;
			 set e = @creditLimit;
			 set f = @vipStatus;
			 set g = @waitBorrowCount;
       set h = @repayCount;
       set i = @forpayCount;
       set j = @lateRepayCount;
       set k = @materis;
       #统计结果
       select @username as username,DATE_FORMAT(createTime,'%Y-%m-%d') as createTime,a as rating,b as vip,c as credit,d as crediting,e as creditLimit,@lastIP as lastIP,
       DATE_FORMAT(vipCreateTime,'%Y-%m-%d %T')AS vipCreateTime,f as vipStatus,@personalHead as personalHead,@realName as realName,@idNo as idNo,DATE_FORMAT(lastDate,'%Y-%m-%d %T') as lastDate,borrowNum as borrowNum,investNum as investNum,
       unReadCount as unReadCount,g as waitBorrowCount,h as repayCount,i as forpayCount,j as lateRepayCount,k as materis;   
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_getWebStatis
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_getWebStatis`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_getWebStatis`(IN `id` bigint)
BEGIN
     #网站会员总金额
     declare webUserAmount DECIMAL(18,2) default 0;
     #网站会员总冻结金额
     declare webUserFreezeAmount DECIMAL(18,2) default 0;
     #网站会员总待收金额
     declare webUserForPI DECIMAL(18,2) default 0;
     #网站收入总金额
     declare webComeInAmount DECIMAL(18,2) default 0;
     #网站总VIP金额
     declare webVIPAmount DECIMAL(18,2) default 0;
     #网站总学历认证金额
     declare webXLAmount DECIMAL(18,2) default 0;
     #网站总学历认证已付金额
     declare webXLHasAmount DECIMAL(18,2) default 0;
     #网站总借款管理费金额
     declare borrowManageFee DECIMAL(18,2) default 0;
     #网站总投资管理费金额
     declare investManageFee DECIMAL(18,2) default 0;
     #网站总借款逾期罚息金额
     declare borrowFI DECIMAL(18,2) default 0;
     #网站总借款已付逾期罚息金额
     declare borrowHasFI DECIMAL(18,2) default 0;
     #网站总债权转让手续费
     declare creditManageFee DECIMAL(18,2) default 0;
     #后台手动添加费用
     declare backAddAmount DECIMAL(18,2) default 0;
     #后台手动扣除费用
     declare backDelAmount DECIMAL(18,2) default 0;
     #网站成功充值总额
     declare webSucPrepaid DECIMAL(18,2) default 0;
     #网站线上充值总额
     declare onlinePrepaid DECIMAL(18,2) default 0;
     #网站线下充值总额
     declare downlinePrepaid DECIMAL(18,2) default 0;
     #网站提现总额
     declare cashWith DECIMAL(18,2) default 0;
     #网站提现手续费总额
     declare cashWithFee DECIMAL(18,2) default 0;
     #所有借款未还总额
     declare borrowForPI DECIMAL(18,2) default 0;
     #所有逾期网站垫付未还金额
     declare webAdvinceForP DECIMAL(18,2) default 0;
     #借款逾期网站未垫付未还款金额
     declare borrowForAmount DECIMAL(18,2) default 0;
     #所有借款已还款总额
     declare borrowHasAmount DECIMAL(18,2) default 0;
     #所有借款正常还款总额
     declare borrowNomalRepayAmount DECIMAL(18,2) default 0;
     #借款逾期网站垫付后已还款总额
     declare webAdvinceHasP DECIMAL(18,2) default 0;
     #借款逾期网站未垫付已还款金额
     declare webNoAdvinceHasP DECIMAL(18,2) default 0;
     #借款逾期网站垫付总额
     declare webAdviceAmount DECIMAL(18,2) default 0;
     #网站会员总待收金额
     set @webUserForPI = 0;
     SET @webUserForPI_sql=CONCAT("select SUM(recivedPrincipal+recievedInterest-hasPrincipal-hasInterest) webUserForPI into @webUserForPI from t_invest");
     PREPARE webUserForPISql FROM @webUserForPI_sql;    
     EXECUTE webUserForPISql;  
     DEALLOCATE PREPARE webUserForPISql;
     set webUserForPI = IFNULL(@webUserForPI,0);
     #网站会员总金额
     set @webUserAmount = 0;
     SET @webUserAmount_sql=CONCAT("select sum(usableSum+freezeSum) totalSum into @webUserAmount from t_user");
     PREPARE webUserAmountSql FROM @webUserAmount_sql;    
     EXECUTE webUserAmountSql;  
     DEALLOCATE PREPARE webUserAmountSql;
     set webUserAmount = IFNULL(@webUserAmount,0) +webUserForPI;
     #网站会员总冻结金额
     set @webUserFreezeAmount = 0;
     SET @webUserFreezeAmount_sql=CONCAT("select sum(freezeSum) freezeSum into @webUserFreezeAmount from t_user");
     PREPARE webUserFreezeAmountSql FROM @webUserFreezeAmount_sql;    
     EXECUTE webUserFreezeAmountSql;  
     DEALLOCATE PREPARE webUserFreezeAmountSql;
     set webUserFreezeAmount = IFNULL(@webUserFreezeAmount,0);
     #网站总VIP金额
     set @webVIPAmount = 0;
     SET @webVIPAmount_sql=CONCAT("select sum(vipFee) vipFee into @webVIPAmount from t_vipsum");
     PREPARE webVIPAmountSql FROM @webVIPAmount_sql;    
     EXECUTE webVIPAmountSql;  
     DEALLOCATE PREPARE webVIPAmountSql;
     set webVIPAmount = IFNULL(@webVIPAmount,0);
     #网站总学历认证金额
     set @webXLAmount = 0;
     SET @webXLAmount_sql=CONCAT("select sum(freeEducation) freeEducation into @webXLAmount from t_education_cost");
     PREPARE webXLAmountSql FROM @webXLAmount_sql;    
     EXECUTE webXLAmountSql;  
     DEALLOCATE PREPARE webXLAmountSql;
     set webXLAmount = IFNULL(@webXLAmount,0);
     #网站总学历认证已付金额
     set @webXLHasAmount = 0;
     SET @webXLHasAmount_sql=CONCAT("select sum(freeEducation) freeEducation into @webXLHasAmount from t_education_cost where status = 2");
     PREPARE webXLHasAmountSql FROM @webXLHasAmount_sql;    
     EXECUTE webXLHasAmountSql;  
     DEALLOCATE PREPARE webXLHasAmountSql;
     set webXLHasAmount = IFNULL(@webXLHasAmount,0);
     #网站总借款管理费金额
     set @borrowManageFee = 0;
     SET @borrowManageFee_sql=CONCAT("select sum(manageFee) manageFee into @borrowManageFee from t_borrow");
     PREPARE borrowManageFeeSql FROM @borrowManageFee_sql;    
     EXECUTE borrowManageFeeSql;  
     DEALLOCATE PREPARE borrowManageFeeSql;
     set borrowManageFee = IFNULL(@borrowManageFee,0);
     #网站总投资管理费金额
     set @investManageFee = 0;
     SET @investManageFee_sql=CONCAT("select sum(t.manageFee) manageFee into @investManageFee from (select sum(a.manageFee) manageFee from t_invest a union all (select sum(b.manageFee) manageFee from t_invest_history b)) t");
     PREPARE investManageFeeSql FROM @investManageFee_sql;    
     EXECUTE investManageFeeSql;  
     DEALLOCATE PREPARE investManageFeeSql;
     set investManageFee = IFNULL(@investManageFee,0);
     #网站总借款逾期罚息金额
     set @borrowFI = 0;
     SET @borrowFI_sql=CONCAT("select sum(lateFI) lateFI into @borrowFI from t_repayment");
     PREPARE borrowFISql FROM @borrowFI_sql;    
     EXECUTE borrowFISql;  
     DEALLOCATE PREPARE borrowFISql;
     set borrowFI = IFNULL(@borrowFI,0);
     #网站总借款已付逾期罚息金额
     set @borrowHasFI = 0;
     SET @borrowHasFI_sql=CONCAT("select sum(lateFI) lateFI into @borrowFI from t_repayment where repayStatus = 2");
     PREPARE borrowHasFISql FROM @borrowFI_sql;    
     EXECUTE borrowHasFISql;  
     DEALLOCATE PREPARE borrowHasFISql;
     set borrowHasFI = IFNULL(@borrowHasFI,0);
     #网站总债权转让手续费
     set @creditManageFee = 0;
     SET @creditManageFee_sql=CONCAT("select sum(manageFee) manageFee into @creditManageFee from t_assignment_debt");
     PREPARE creditManageFeeSql FROM @creditManageFee_sql;    
     EXECUTE creditManageFeeSql;  
     DEALLOCATE PREPARE creditManageFeeSql;
     set creditManageFee = IFNULL(@creditManageFee,0);
     #后台手动添加费用
     set @backAddAmount = 0;
     SET @backAddAmount_sql=CONCAT("SELECT sum(dealMoney) as total_recharge into @backAddAmount from t_recharge_withdraw_info where type=1");
     PREPARE backAddAmountSql FROM @backAddAmount_sql;    
     EXECUTE backAddAmountSql;  
     DEALLOCATE PREPARE backAddAmountSql;
     set backAddAmount = IFNULL(@backAddAmount,0);
     #后台手动扣除费用
     set @backDelAmount = 0;
     SET @backDelAmount_sql=CONCAT("SELECT sum(dealMoney) as total_del into @backDelAmount from t_recharge_withdraw_info where type=2");
     PREPARE backDelAmountSql FROM @backDelAmount_sql;    
     EXECUTE backDelAmountSql;  
     DEALLOCATE PREPARE backDelAmountSql;
     set backDelAmount = IFNULL(@backDelAmount,0);
     #网站成功充值总额
     set @webSucPrepaid = 0;
     SET @webSucPrepaid_sql=CONCAT("SELECT sum(rechargeMoney) as total_recharge into @webSucPrepaid from t_recharge_detail WHERE result = 1");
     PREPARE webSucPrepaidSql FROM @webSucPrepaid_sql;    
     EXECUTE webSucPrepaidSql;  
     DEALLOCATE PREPARE webSucPrepaidSql;
     set webSucPrepaid = IFNULL(@webSucPrepaid,0);
     #网站线上充值总额
     set @onlinePrepaid = 0;
     SET @onlinePrepaid_sql=CONCAT("SELECT sum(rechargeMoney) as total_recharge into @onlinePrepaid from t_recharge_detail WHERE result = 1 and rechargeType !=4");
     PREPARE onlinePrepaidSql FROM @onlinePrepaid_sql;    
     EXECUTE onlinePrepaidSql;  
     DEALLOCATE PREPARE onlinePrepaidSql;
     set onlinePrepaid = IFNULL(@onlinePrepaid,0);
     #网站线下充值总额
     set @downlinePrepaid = 0;
     SET @downlinePrepaid_sql=CONCAT("SELECT sum(rechargeMoney) as total_recharge into @downlinePrepaid from t_recharge_detail WHERE result = 1 and rechargeType =4");
     PREPARE downlinePrepaidSql FROM @downlinePrepaid_sql;    
     EXECUTE downlinePrepaidSql;  
     DEALLOCATE PREPARE downlinePrepaidSql;
     set downlinePrepaid = IFNULL(@downlinePrepaid,0);
     #网站提现总额
     set @cashWith = 0;
     SET @cashWith_sql=CONCAT("SELECT sum(sum) as total_withdraw into @cashWith from t_withdraw where status=2");
     PREPARE cashWithSql FROM @cashWith_sql;    
     EXECUTE cashWithSql;  
     DEALLOCATE PREPARE cashWithSql;
     set cashWith = IFNULL(@cashWith,0);
     #网站提现手续费总额
     set @cashWithFee = 0;
     SET @cashWithFee_sql=CONCAT("SELECT sum(poundage) as total_poundage into @cashWithFee from t_withdraw where status=2");
     PREPARE cashWithFeeSql FROM @cashWithFee_sql;
     EXECUTE cashWithFeeSql;
     DEALLOCATE PREPARE cashWithFeeSql;
     set cashWithFee = IFNULL(@cashWithFee,0);
     #所有借款未还总额
     set @borrowForPI = 0;
     SET @borrowForPI_sql=CONCAT("select sum(stillPrincipal+stillInterest-hasPI) forPI into @borrowForPI from t_repayment where repayStatus = 1");
     PREPARE borrowForPISql FROM @borrowForPI_sql;
     EXECUTE borrowForPISql;
     DEALLOCATE PREPARE borrowForPISql;
     set borrowForPI = IFNULL(@borrowForPI,0);
     #所有逾期网站垫付未还金额
     set @webAdvinceForP = 0;
     SET @webAdvinceForP_sql=CONCAT("select sum(stillPrincipal+stillInterest-hasPI) forPI into @webAdvinceForP from t_repayment where isLate = 1 and isWebRepay = 2 and repayStatus=1");
     PREPARE webAdvinceForPSql FROM @webAdvinceForP_sql;
     EXECUTE webAdvinceForPSql;
     DEALLOCATE PREPARE webAdvinceForPSql;
     set webAdvinceForP = IFNULL(@webAdvinceForP,0);
     #借款逾期网站未垫付未还款金额
     set @borrowForAmount = 0;
     SET @borrowForAmount_sql=CONCAT("select sum(stillPrincipal+stillInterest-hasPI) forPI into @borrowForAmount from t_repayment where isLate = 1 and isWebRepay = 1  and repayStatus=1");
     PREPARE borrowForAmountSql FROM @borrowForAmount_sql;
     EXECUTE borrowForAmountSql;
     DEALLOCATE PREPARE borrowForAmountSql;
     set borrowForAmount = IFNULL(@borrowForAmount,0);
     #所有借款已还款总额
     set @borrowHasAmount = 0;
     SET @borrowHasAmount_sql=CONCAT("select sum(hasPI) hasPI into @borrowHasAmount from t_repayment where repayStatus=2");
     PREPARE borrowHasAmountSql FROM @borrowHasAmount_sql;
     EXECUTE borrowHasAmountSql;
     DEALLOCATE PREPARE borrowHasAmountSql;
     set borrowHasAmount = IFNULL(@borrowHasAmount,0);
     #所有借款正常还款总额
     set @borrowNomalRepayAmount = 0;
     SET @borrowNomalRepayAmount_sql=CONCAT("select sum(hasPI) hasPI into @borrowNomalRepayAmount from t_repayment where repayStatus=2 and repayDate = realRepayDate");
     PREPARE borrowNomalRepayAmountSql FROM @borrowNomalRepayAmount_sql;
     EXECUTE borrowNomalRepayAmountSql;
     DEALLOCATE PREPARE borrowNomalRepayAmountSql;
     set borrowNomalRepayAmount = IFNULL(@borrowNomalRepayAmount,0);
     #借款逾期网站垫付后已还款总额
     set @webAdvinceHasP = 0;
     SET @webAdvinceHasP_sql=CONCAT("select sum(hasPI) hasPI into @webAdvinceHasP from t_repayment where isLate = 2 and isWebRepay = 2  and repayStatus=2");
     PREPARE webAdvinceHasPSql FROM @webAdvinceHasP_sql;
     EXECUTE webAdvinceHasPSql;
     DEALLOCATE PREPARE webAdvinceHasPSql;
     set webAdvinceHasP = IFNULL(@webAdvinceHasP,0);
     #借款逾期网站未垫付已还款金额
     set @webNoAdvinceHasP = 0;
     SET @webNoAdvinceHasP_sql=CONCAT("select sum(hasPI) hasPI into @webNoAdvinceHasP from t_repayment where isLate = 2 and isWebRepay = 1  and repayStatus=2");
     PREPARE webNoAdvinceHasPSql FROM @webNoAdvinceHasP_sql;
     EXECUTE webNoAdvinceHasPSql;
     DEALLOCATE PREPARE webNoAdvinceHasPSql;
     set webNoAdvinceHasP = IFNULL(@webNoAdvinceHasP,0);
     #借款逾期网站垫付总额
     set @webAdviceAmount = 0;
     SET @webAdviceAmount_sql=CONCAT("select sum(hasPI) hasPI into @webAdviceAmount from t_repayment where isLate = 2 and isWebRepay =2");
     PREPARE webAdviceAmountSql FROM @webAdviceAmount_sql;
     EXECUTE webAdviceAmountSql;
     DEALLOCATE PREPARE webAdviceAmountSql;
     set webAdviceAmount = IFNULL(@webAdviceAmount,0);
     #网站收入总金额=借款管理费、投资管理费用、VIP会费、逾期罚息、提现手续费、债权转让手续费、学历审核费
     set webComeInAmount = borrowManageFee+investManageFee+webVIPAmount+borrowHasFI+cashWithFee+creditManageFee+webXLHasAmount;
     select webUserAmount,webUserFreezeAmount,webUserForPI,webComeInAmount,webVIPAmount,webXLAmount,borrowManageFee,borrowFI,
     creditManageFee,backAddAmount,backDelAmount,webSucPrepaid,onlinePrepaid,downlinePrepaid,cashWith,cashWithFee,borrowForPI,webAdvinceForP,
     borrowForAmount,borrowHasAmount,borrowNomalRepayAmount,webAdvinceHasP,webNoAdvinceHasP,webAdviceAmount;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_investStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_investStatistics`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_investStatistics`(IN `adminId`  bigint)
BEGIN
	  	#总投资金额
	    declare totalInvestment varchar(255) default '0';
      #待收金额
      declare dueinfund varchar(255) default '0';
      #逾期罚金
      declare exceedInvest  varchar(255) default '0';
			#总投资金额
			select sum(investAmount) INTO @ztouz  from t_invest;
			#set totalInvestment = IFNULL(@ztouz ,0);
			select f_formatAmount(IFNULL(@ztouz ,0))  into totalInvestment;
			#待收金额
			select sum((recivedPrincipal +recievedInterest - hasPrincipal-hasInterest)) into @duein from t_invest;
			#set dueinfund = IFNULL(@duein ,0);
			select f_formatAmount(IFNULL(@duein ,0))  into dueinfund;
			#逾期罚金
			select sum(stillPrincipal+stillInterest - hasFI) into @excee  from t_repayment where isLate=2 and repayStatus<>2;
			#set exceedInvest = IFNULL(@excee ,0);
			select f_formatAmount(IFNULL(@excee ,0))  into exceedInvest;
		select totalInvestment ,dueinfund ,exceedInvest;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_inviteFriendsReward

-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_inviteFriendsReward
`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_inviteFriendsReward
`(IN `rewardTime` datetime)
BEGIN
  #奖励id
  declare awardId bigint default 0;
  #用户id 
  declare uId BIGINT default 0;
  #奖励金额
  declare award DECIMAL(18,2) default 0;
	DECLARE  _done INT DEFAULT 0;
  DECLARE  _dones INT DEFAULT 0;
  #处理过期的VIP会员的续费问题
  DECLARE cursor_name CURSOR FOR (select id,money,userId from t_money where status =1);
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _done = 1;#错误定义，标记循环结束
  OPEN cursor_name;
        #循环执行  
       FETCH cursor_name INTO awardId,award,uId; 
       while _done <> 1 do
            set awardId = awardId;
            set uId = uId;
            set award = award;
           
            #查询风险保障金余额
            set @riskBalance = 0;
            SET @riskBalance_sql=CONCAT("SELECT (sum(riskInCome)-sum(riskSpending)) riskBalance into @riskBalance FROM t_risk_detail");
            PREPARE riskBalanceSql FROM @riskBalance_sql;  
            EXECUTE riskBalanceSql;  
            DEALLOCATE PREPARE riskBalanceSql;
            set @riskBalance = 1000000+ IFNULL(@riskBalance,0);
            #扣除风险保障金
            insert into t_risk_detail (riskBalance,riskSpending,riskDate,riskType,resource)
            values(@riskBalance,needSum,rewardTime,'支出','邀请好友奖励');
            #更新已奖励状态为已奖励
            update t_money set status = 2,endData=rewardTime where id = awardId and userId = uId;
            #邀请奖励发给邀请人
            update t_user set usableSum = usableSum + award  where id = uId;
            #发送站内信
            set @mail=f_sysMail('会员邀请奖励',CONCAT('您邀请的好友已成为VIP会员,在此奖励￥',award,'元,再接再厉!'),uId,rewardTime);
       
          fetch  cursor_name INTO awardId,award,uId;                
       end while; #当_done=1时退出被循
   CLOSE cursor_name;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_page
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_page`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_page`(in p_table_name varchar(1024),in p_fields varchar(1024),in p_page_size bigint , in p_page_now bigint, in P_order_string varchar(128),in p_where_string varchar(3000),out p_out_rows bigint)
BEGIN
		 /*定义变量*/
	    DECLARE m_begin_row INT DEFAULT 0;
	    DECLARE m_limit_string CHAR(64);
		  DECLARE m_sqlwhere VARCHAR(3000);
			DECLARE m_fields VARCHAR(3000);
	      
	    /*构造语句*/     
	    SET m_begin_row = (p_page_now - 1) * p_page_size;
	    SET m_limit_string = CONCAT(' LIMIT ', m_begin_row, ', ', p_page_size);
			SET m_sqlwhere=replace(replace(p_where_string,'|',''''),'$w$','where');  
			SET m_fields=replace(replace(p_fields,'|',''''),'$w$','where');  
	    SET @COUNT_STRING = CONCAT('SELECT COUNT(*) INTO @ROWS_TOTAL FROM ', p_table_name, ' where 1=1 ', m_sqlwhere);
	    SET @MAIN_STRING = CONCAT('SELECT ', m_fields, ' FROM ', p_table_name,' where 1=1 ' , m_sqlwhere ,' ', P_order_string , m_limit_string);
			PREPARE count_stmt FROM @COUNT_STRING;
	    EXECUTE count_stmt;
	    DEALLOCATE PREPARE count_stmt;
	    SET p_out_rows = @ROWS_TOTAL;
			
	    PREPARE main_stmt FROM @MAIN_STRING;
	    EXECUTE main_stmt;
	    DEALLOCATE PREPARE main_stmt;  
	  #call pr_pager("v_news","InfoId",10,1, "order by InfoId desc"," ParentParentPartId=4",@result);
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pr_refreshBorrowTime
-- ----------------------------
DROP PROCEDURE IF EXISTS `pr_refreshBorrowTime`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `pr_refreshBorrowTime`(IN `currentTime` DATETIME)
BEGIN
	 DECLARE bId BIGINT DEFAULT -1; #borrowId
   DECLARE uId BIGINT DEFAULT -1; #uId
   DECLARE  borrowContent VARCHAR(1024) DEFAULT NULL;
   DECLARE  _done INT DEFAULT 0;
   DECLARE cursor_borrrow CURSOR FOR (SELECT id FROM t_borrow WHERE remainTimeStart < remainTimeEnd AND borrowStatus = 2);
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _done = 1;#错误定义，标记循环结束
   OPEN cursor_borrrow;
        /* 循环执行 */  
       FETCH cursor_borrrow INTO bId; 
       WHILE _done <> 1 DO
            SET  bId = bId;
            #当前时间小于剩余结束时间,剩余开始时间为当前时间 
            IF EXISTS(SELECT id FROM t_borrow WHERE remainTimeEnd > currentTime  AND id = bId) THEN
               UPDATE t_borrow SET remainTimeStart = currentTime WHERE id = bId;
            END IF;
            #当前时间大于剩余结束时间,剩余开始时间为剩余结束时间 
            IF EXISTS(SELECT COUNT(1) FROM t_borrow WHERE remainTimeEnd < currentTime  AND id = bId) THEN
               SELECT publisher,borrowTitle INTO @publisher,@borrowTitle FROM t_borrow WHERE remainTimeEnd < currentTime  AND id = bId;
							SET uId = @publisher;
               SET borrowContent = @borrowTitle; 
               #借款总额等于投资总额,则为满标,否则流标
               IF EXISTS(SELECT id FROM t_borrow WHERE borrowAmount = hasInvestAmount AND id = bId) THEN
                   UPDATE t_borrow SET remainTimeStart = remainTimeEnd,borrowStatus = 3 WHERE id = bId;
               ELSE
                   SET borrowContent = CONCAT('借款标题：[',borrowContent,']已超期,轮为流标.');
                   UPDATE t_borrow SET remainTimeStart = remainTimeEnd,borrowStatus = 6 WHERE id = bId;
                   #调用返还用户金额存储过程
                   CALL pr_reback_user_amount(bId,borrowContent,currentTime);
                   #发送站内信通知
                   INSERT INTO t_mail(mailTitle,mailContent,sendTime,sender,reciver,mailType)
                   VALUES('招标中借款报告',borrowContent,currentTime,14,uId,2);
                END IF;
               
            END IF;
          FETCH  cursor_borrrow INTO bId;                
       END WHILE; #当_done=1时退出被循
   CLOSE cursor_borrrow;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_account_borrow_join
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_account_borrow_join`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_account_borrow_join`(IN `in_bid` BIGINT,IN `in_uid` BIGINT,IN `in_basepath` VARCHAR(255),IN `in_invest_amount` DECIMAL(18,2),IN `in_invest_time` DATETIME, IN `in_status` INT , IN `in_num` INT , IN  `in_billcode`      VARCHAR(255),OUT out_ret INT, OUT out_desc VARCHAR(100), OUT out_ordid VARCHAR(100))
_return:BEGIN
  #投资标旳
  DECLARE t_mail_template  VARCHAR(2048) DEFAULT '';
  DECLARE t_email_template VARCHAR(2048) DEFAULT '';
  DECLARE t_sms_template   VARCHAR(2048) DEFAULT '';
  DECLARE t_content        VARCHAR(1024) DEFAULT '';
  DECLARE _error           INT DEFAULT 0;
  DECLARE sbs              VARCHAR(20) DEFAULT ''; #字符串截取
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
  SET out_ordid = '-1';
  SET out_ret = -1;
  SET out_desc = '执行失败';
  SET @user_accountSum = NULL; #可用余额是否符合投标金额
  SET @dealpwd = ''; #交易密码是否正确
  SELECT accountSum
       , dealpwd
  INTO
    @user_accountSum, @dealpwd
  FROM
    t_user
  WHERE
    id = in_uid;
  IF @user_accountSum IS NULL THEN
    SET out_ret = -2;
    SET out_desc = '用户不存在';
    LEAVE _return;
  END IF;
  IF @user_accountSum < in_invest_amount THEN
    SET out_ret = -3;
    SET out_desc = CONCAT('可用体验金额为[', @user_accountSum, ']元,不满足本轮投标,请添加体验金');
    LEAVE _return;
  END IF;
  #if(in_dealpwd != @dealpwd) then
  #	set out_ret = -4;
  #set out_desc = '交易密码错误';
  #leave _return;
  #end if;
  #招标中的借款才可以进行投标
  SET @id = 0;
  SET @t_frozen_margin = 0;
  SET @borrowAmount = 0;
  SET @hasInvestAmount = 0;
  SET @borrowStatus = 1;
  SET @minTenderedSum = NULL;
  SET @maxTenderedSum = NULL;
  SET @publisher = -1;
  SET @version = 0;
  SET @borrowTitle = NULL;
  SET @borrowWay = 1;
  SET @auditTime = NULL;
  SET @excitationType = 0;
  SET @excitationSum = 0;
  SET @circulationNumber = 0;
  SET @hasCirculationNumber = 0;
  SET @annualRate = NULL;
  SET @monthRate = 0;
  SET @t_deadline = 0;
  SET @isDayThe = 1;
  SET @borrowerName = NULL;
  SET @totalInterest = 0; #流转标应得本息
  SET @maxInvest = 0; #合和年最多投标人数
  SET @investNum = 0; #实际投标人数
  SET @isDayThe = 1;
  #select id, borrowAmount, hasInvestAmount, borrowStatus, minTenderedSum, maxTenderedSum, publisher,version,borrowTitle
  #into @id, @borrowAmount, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @publisher,@version,@borrowTitle
  #from	t_borrow	where id = in_bid;
  SELECT a.id
       , a.hasInvestAmount
       , a.borrowStatus
       , a.minTenderedSum
       , a.maxTenderedSum
       , a.borrowWay
       , a.auditTime
       , a.excitationType
       , a.excitationSum
       , a.circulationNumber
       , a.version
       , a.annualRate
       , (a.annualRate / 12)
       , a.borrowAmount
       , a.deadline
       , a.borrowTitle
       , a.publisher
       , a.isDayThe
       , b.username
       , a.frozen_margin
       , a.hasCirculationNumber
       , a.isDayThe
  INTO
    @id, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @borrowWay, @auditTime, @excitationType, @excitationSum, @circulationNumber, @version, @annualRate, @monthRate, @borrowAmount, @t_deadline, @borrowTitle, @publisher, @isDayThe, @borrowerName, @t_frozen_margin, @hasCirculationNumber, @isDayThe
  FROM
    t_borrow a
  LEFT JOIN t_user b
  ON a.publisher = b.id
  WHERE
    a.id = in_bid;
  SELECT COUNT(DISTINCT investor)
  INTO
    @investNum
  FROM
    t_invest
  WHERE
    borrowId = in_bid; #实际投标人数
  SELECT COUNT(1)
  INTO
    @investorFlag
  FROM
    t_invest
  WHERE
    borrowId = in_bid
    AND investor = in_uid
    AND investor IN (SELECT investor
                     FROM
                       t_invest
                     WHERE
                       borrowId = in_bid
                     GROUP BY
                       investor);
  SET @creditrang = 0;
  SET @manageFee = 0;
  SELECT costFee
  INTO
    @manageFee
  FROM
    t_platform_cost
  WHERE
    alias = 'investFeeRate';
  IF @id IS NULL THEN
    SET out_ret = -5;
    SET out_desc = '不存在的借款';
    LEAVE _return;
  END IF;
  IF @maxInvest > 0 AND @maxInvest = @investNum AND @investorFlag = 0 THEN
    SET out_ret = -9527;
    SET out_desc = '已超过投资人限定的最大投标人数';
    LEAVE _return;
  END IF;
  IF @borrowStatus <> 2 THEN
    SET out_ret = -6;
    SET out_desc = '非招标中的借款';
    LEAVE _return;
  END IF;
  IF @hasInvestAmount >= @borrowAmount THEN
    SET out_ret = -7;
    SET out_desc = '投标异常的借款';
    LEAVE _return;
  END IF;
  IF @publisher = in_uid THEN
    SET out_ret = -99;
    SET out_desc = '不能投自己发布的标的';
    LEAVE _return;
  END IF;
  SET @remainAmount = IFNULL(@borrowAmount, 0) - IFNULL(@hasInvestAmount, 0);
  IF in_invest_amount > @remainAmount THEN
    SET out_ret = -8;
    SET out_desc = '投标金额超过本轮剩余投标金额';
    LEAVE _return;
  END IF;
  #当剩余金额小于最新投标金额，直接跳过验证
  IF @remainAmount > @minTenderedSum THEN
    IF in_invest_amount > @maxTenderedSum && @maxTenderedSum <> -1 THEN
      SET out_ret = -9;
      SET out_desc = '投标金额超过本轮最多投标金额';
      LEAVE _return;
    END IF;
    IF in_invest_amount < @minTenderedSum && @minTenderedSum <> -1 THEN
      SET out_ret = -10;
      SET out_desc = '投标金额不足本轮最低投标金额';
      LEAVE _return;
    END IF;
  END IF;
  SET @total = in_invest_amount + @hasInvestAmount; #投资总额=本次投资金额+已投标金额
  IF @total > @borrowAmount THEN
    SET out_ret = -11;
    SET out_desc = '投标金额超出借款总额';
    LEAVE _return;
  END IF;
  START TRANSACTION;
  UPDATE t_borrow
  SET
    VERSION = VERSION + 1
  WHERE
    id = in_bid
    AND borrowStatus = 2
    AND borrowAmount > hasInvestAmount
    AND VERSION = @version;
  SET @ret_update = ROW_COUNT();
  IF @ret_update = 0 THEN
    ROLLBACK;
    SET out_ret = -12;
    SET out_desc = '抢投的借款';
    LEAVE _return;
  END IF;
  #更新借款信息中的已投资总额和数量
  #update t_borrow set investNum	=	investNum	+	1	,hasInvestAmount = hasInvestAmount	+	in_invest_amount where id = in_bid  and borrowStatus = 2	and borrowAmount	>	hasInvestAmount	;
  #增加投资记录
  INSERT INTO t_billcode (pMerBillNo) VALUES (in_billcode);
  #INSERT INTO t_invest (investAmount, realAmount, investTime, deadline, monthRate, billcode) VALUES (in_invest_amount, in_invest_amount, in_invest_time, @t_deadline, @monthRate, in_billcode);
  #SET out_ordid = LAST_INSERT_ID();
  IF _error <> 0 THEN
    ROLLBACK;
    SET out_ret = -13;
    SET out_desc = '执行异常';
    LEAVE _return;
  END IF;
  COMMIT;
  SET out_ret = 1;
  SET out_desc = in_billcode;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_account_join_call_back
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_account_join_call_back`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_account_join_call_back`(IN `in_bid` BIGINT,IN `in_ordid` BIGINT,IN `in_uid` BIGINT,IN `in_basepath` VARCHAR(255),IN `in_invest_amount` DECIMAL(18,2),IN `vocherAmt` DECIMAL(18,2),IN `in_invest_time` DATETIME, IN `in_status` INT , IN `in_num` INT , IN  `in_pMerBillNo`    VARCHAR(255),IN  `in_pIpsBillNo`  VARCHAR(255), IN  `investId`  VARCHAR(255),IN `in_isAutoBid`  INT, IN `in_voucherId`  BIGINT,IN  `in_pageType`  VARCHAR(20),OUT out_ret INT, OUT out_desc VARCHAR(100))
_return:
BEGIN
  #投资标旳
  DECLARE t_mail_template  VARCHAR(2048) DEFAULT '';
  DECLARE t_email_template VARCHAR(2048) DEFAULT '';
  DECLARE t_sms_template   VARCHAR(2048) DEFAULT '';
  DECLARE t_content        VARCHAR(1024) DEFAULT '';
  DECLARE _error           INT DEFAULT 0;
  DECLARE sbs              VARCHAR(20) DEFAULT ''; #字符串截取
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
  SET out_ret = -1;
  SET out_desc = '执行失败';
  SET @user_usableSum = NULL; #可用余额是否符合投标金额
  SET @dealpwd = ''; #交易密码是否正确
  SELECT usableSum
       , dealpwd
  INTO
    @user_usableSum, @dealpwd
  FROM
    t_user
  WHERE
    id = in_uid;
  IF @user_usableSum IS NULL THEN
    SET out_ret = -2;
    SET out_desc = '用户不存在';
    LEAVE _return;
  END IF;
  IF @user_usableSum < (in_invest_amount-vocherAmt) THEN
    SET out_ret = -3;
    SET out_desc = CONCAT('可用余额为[', @user_usableSum, ']元,不满足本轮投标,请充值');
    LEAVE _return;
  END IF;
  #招标中的借款才可以进行投标
  SET @id = 0;
  SET @t_frozen_margin = 0;
  SET @borrowAmount = 0;
  SET @hasInvestAmount = 0;
  SET @borrowStatus = 1;
  SET @minTenderedSum = NULL;
  SET @maxTenderedSum = NULL;
  SET @publisher = -1;
  SET @version = 0;
  SET @borrowTitle = NULL;
  SET @borrowWay = 1;
  SET @auditTime = NULL;
  SET @excitationType = 0;
  SET @excitationSum = 0;
  SET @circulationNumber = 0;
  SET @hasCirculationNumber = 0;
  SET @annualRate = NULL;
  SET @monthRate = 0;
  SET @t_deadline = 0;
  SET @isDayThe = 1;
  SET @borrowerName = NULL;
  SET @totalInterest = 0; #流转标应得本息
  SET @maxInvest = 0; #合和年最多投标人数
  SET @investNum = 0; #实际投标人数
  SELECT a.id
     , a.hasInvestAmount
     , a.borrowStatus
     , a.minTenderedSum
     , a.maxTenderedSum
     , a.borrowWay
     , a.auditTime
     , a.excitationType
     , a.excitationSum
     , a.circulationNumber
     , a.version
     , a.annualRate
     , (a.annualRate / 12)
     , a.borrowAmount
     , a.deadline
     , a.borrowTitle
     , a.publisher
     , a.isDayThe
     , b.username
     , a.hasCirculationNumber
INTO
  @id, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @borrowWay, @auditTime, @excitationType, @excitationSum, @circulationNumber, @version, @annualRate, @monthRate, @borrowAmount, @t_deadline, @borrowTitle, @publisher, @isDayThe, @borrowerName, @hasCirculationNumber
FROM
  t_borrow a
LEFT JOIN t_user b
ON a.publisher = b.id
WHERE
  a.id = in_bid;
  SELECT COUNT(DISTINCT investor)
  INTO
    @investNum
  FROM
    t_invest
  WHERE
    borrowId = in_bid; #实际投标人数
  SELECT COUNT(1)
  INTO
    @investorFlag
  FROM
    t_invest
  WHERE
    borrowId = in_bid
    AND investor = in_uid
    AND investor IN (SELECT investor
                     FROM
                       t_invest
                     WHERE
                       borrowId = in_bid
                     GROUP BY
                       investor);
  IF @id IS NULL THEN
    SET out_ret = -5;
    SET out_desc = '不存在的借款';
    LEAVE _return;
  END IF;
  IF @borrowStatus <> 2 THEN
    SET out_ret = -6;
    SET out_desc = '非招标中的借款';
    LEAVE _return;
  END IF;
  IF @hasInvestAmount >= @borrowAmount THEN
    SET out_ret = -7;
    SET out_desc = '投标异常的借款';
    LEAVE _return;
  END IF;
  SET @remainAmount = IFNULL(@borrowAmount, 0) - IFNULL(@hasInvestAmount, 0);
  IF in_invest_amount > @remainAmount THEN
    SET out_ret = -8;
    SET out_desc = '投标金额超过本轮剩余投标金额';
    LEAVE _return;
  END IF;
  #当剩余金额小于最新投标金额，直接跳过验证
  IF @remainAmount > @minTenderedSum THEN
    IF in_invest_amount > @maxTenderedSum && @maxTenderedSum <> -1 THEN
      SET out_ret = -9;
      SET out_desc = '投标金额超过本轮最多投标金额';
      LEAVE _return;
    END IF;
    IF in_invest_amount < @minTenderedSum && @minTenderedSum <> -1 THEN
      SET out_ret = -10;
      SET out_desc = '投标金额不足本轮最低投标金额';
      LEAVE _return;
    END IF;
  END IF;
  SET @total = in_invest_amount + @hasInvestAmount; #投资总额=本次投资金额+已投标金额
  IF @total > @borrowAmount THEN
    SET out_ret = -11;
    SET out_desc = '投标金额超出借款总额';
    LEAVE _return;
  END IF;
  START TRANSACTION;
  #更新借款信息中的已投资总额和数量
  UPDATE t_borrow
  SET
    investNum = investNum + 1, hasInvestAmount = hasInvestAmount + in_invest_amount
  WHERE
    id = in_bid
    AND borrowStatus = 2
    AND borrowAmount > hasInvestAmount;
  #更新投资记录	
   #UPDATE t_invest
  #SET
   # borrowId = in_bid, investor = in_uid, oriInvestor = in_uid, assurer = in_assId
  #WHERE
   # id = in_ordid;
  #INSERT INTO t_invest (investAmount, realAmount, investTime, deadline, monthRate, billcode) VALUES (in_invest_amount, in_invest_amount, in_invest_time, @t_deadline, @monthRate, in_billcode);
  
  INSERT INTO t_invest (investAmount, realAmount, investor, oriInvestor, investTime, borrowId, deadline, monthRate, billcode, trxId, investId,isAutoBid,moneyRecord,voucherId,pageType) VALUES (
  in_invest_amount, in_invest_amount, in_uid, in_uid, in_invest_time, in_bid, @t_deadline, @monthRate, in_pMerBillNo,in_pIpsBillNo,investId,in_isAutoBid,vocherAmt,in_voucherId,in_pageType
  );
  
  #投资人投资成功资金冻结
  UPDATE t_user
  SET
    usableSum = usableSum - in_invest_amount+vocherAmt , freezeSum = freezeSum + in_invest_amount-vocherAmt
  WHERE
    id = in_uid;
  #更新借款比例
  UPDATE t_borrow
  SET
    amount_scale = hasInvestAmount / borrowAmount * 100
  WHERE
    id = in_bid;
  SET t_mail_template = f_get_notice_template('tender');
  SET t_mail_template = REPLACE(t_mail_template, 'title', @borrowTitle);
  SET t_mail_template = REPLACE(t_mail_template, '[voluntarily]', '');
  SET t_mail_template = REPLACE(t_mail_template, 'date', NOW());
  SET t_mail_template = REPLACE(t_mail_template, 'investAmount', in_invest_amount);
  SET t_email_template = f_get_notice_template('e_tender');
  SET t_email_template = REPLACE(t_email_template, 'title', @borrowTitle);
  SET t_email_template = REPLACE(t_email_template, '[voluntarily]', '');
  SET t_email_template = REPLACE(t_email_template, 'date', NOW());
  SET t_email_template = REPLACE(t_email_template, 'investAmount', in_invest_amount);
  #插入通知任务
  SET @username = '';
  SET @email = '';
  SET @telphone = '';
  SELECT a.cellphone
       , b.username
       , b.email
  INTO
    @telphone, @username, @email
  FROM
    t_user b
  LEFT JOIN
  t_person a
  ON a.userId = b.id
  WHERE
    b.id = in_uid;
  SET t_sms_template = f_get_notice_template('s_tender');
  SET t_sms_template = REPLACE(t_sms_template, 'username', @username);
  SET t_sms_template = REPLACE(t_sms_template, 'title', @borrowTitle);
  SET t_sms_template = REPLACE(t_sms_template, '[voluntarily]', '');
  SET t_sms_template = REPLACE(t_sms_template, 'date', NOW());
  SET t_sms_template = REPLACE(t_sms_template, 'investAmount', in_invest_amount);
  INSERT INTO t_notice_task (user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify) VALUES (in_uid, '理财投资报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, in_bid, NOW(), 'borrow');
  SET t_content = f_link(in_basepath, in_bid, @borrowTitle, '', '', '');
  SET t_content = CONCAT('投标借款[', t_content, '],冻结投标金额');
  SET @a = in_pIpsBillNo;
  IF in_pIpsBillNo = '' THEN
    SET @a = in_pMerBillNo;
  END IF;
  UPDATE t_billcode
  SET
    pIpsBillNo = @a
  WHERE
    pMerBillNo = in_pMerBillNo;
  #添加资金记录
  INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum, trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost, spending, borrow_id)
  SELECT in_uid
       , NOW()
       , 653
       , f_moneyDecode(653)
       , in_invest_amount
       , a.usableSum AS usableSum
       , a.freezeSum AS freezeSum
       , SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest)
       , -1
       , 0
       , t_content
       , 0
       , in_bid
       , ''
       , 0
       , in_invest_amount
       , b.borrowId
  FROM
    t_user a
  LEFT JOIN t_invest b
  ON a.id = b.investor
  WHERE
    a.id = in_uid
  GROUP BY
    a.id;
  #本次投标如果达到满标条件就更新为满标状态
  UPDATE t_borrow
  SET
    borrowStatus = 3, remainTimeStart = remainTimeEnd, sort = 5
  WHERE
    id = in_bid
    AND borrowAmount = hasInvestAmount
    AND borrowStatus = 2;
  IF _error <> 0 THEN
    ROLLBACK;
    SET out_ret = -13;
    SET out_desc = '执行异常';
    LEAVE _return;
  END IF;
  COMMIT;
  SET out_ret = 1;
  SET out_desc = 'ok';
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_admin_init
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_admin_init`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_admin_init`(IN `in_uname` varchar(100),IN `in_password` varchar(100),OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:begin
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	set	@num = 0;
	select count(1) into @num from t_admin;
  if @num = 1 then
		update t_admin set `password` = in_password where username = in_uname and `password` is null and id = -1;
	end	if;
	if	_error	<>	0	then
		rollback;
		set out_ret = -2;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_amount_withdraw
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_amount_withdraw`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_amount_withdraw`(IN `in_uid` BIGINT,IN `in_dealpwd`  VARCHAR(200),IN  `in_money` DECIMAL(18, 2),IN  `in_bank_id`  VARCHAR(50),IN  `in_type` VARCHAR(20),IN  `in_ip` VARCHAR(50),IN `in_billcode` VARCHAR(200),IN in_trxId VARCHAR(200),IN in_feeAmt DECIMAL(18, 2),OUT `out_ret` BIGINT,OUT `out_desc` VARCHAR(255))
_return:
BEGIN
  DECLARE maxWithDrawSum DECIMAL(18, 2) DEFAULT 50000; #最大提现金额
  DECLARE overMoney      DECIMAL(18, 2) DEFAULT 0; #超出金额
  DECLARE poundage       DECIMAL(18, 2) DEFAULT 0; #提现超出手续费
  DECLARE addPoundage    DECIMAL(18, 4) DEFAULT 0; #提现手续费
  DECLARE rechargeOut15  DECIMAL(18, 2) DEFAULT 0; #15天外金额
  DECLARE dealMoney      DECIMAL(18, 2) DEFAULT 0; #处理金额
	DECLARE withdrawId     BIGINT         DEFAULT 0; #提现记录ID
  DECLARE _error         INT DEFAULT 0; #异常标记
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1; #sqlexception返回值
  SET out_ret = -1;
  SET out_desc = '执行失败';
  SET @cashStatus = NULL;
  SELECT cashStatus
  INTO
    @cashStatus
  FROM
    t_group a
  LEFT JOIN t_group_user b
  ON a.id = b.groupId
  WHERE
    userId = in_uid
    AND cashStatus = 2;
  IF @cashStatus IS NOT NULL THEN
    SET out_ret = -2;
    SET out_desc = '用户提现被禁用';
    LEAVE _return;
  END IF;
  SET @dealpwd = NULL;
  SET @loginpwd = NULL;
  SET @usableSum = 0;
  SET @username = NULL;
  SET @cellPhone = NULL;
  SET @enables = 2;
  SELECT a.`enable`
       , a.`password`
       , a.dealpwd
       , a.usableSum
       , a.username
       , b.cellPhone
  INTO
    @enables, @loginpwd, @dealpwd, @usableSum, @username, @cellPhone
  FROM
    t_user a
  LEFT JOIN t_person b
  ON b.userId = a.id
  WHERE
    a.id = in_uid;
  SET @usableSum = IFNULL(@usableSum, 0);
  IF @username IS NULL THEN
    SET out_ret = -3;
    SET out_desc = '无此用户';
    LEAVE _return;
  END IF;
  IF @enables = 2 THEN
    SET out_ret = -4;
    SET out_desc = '禁用用户';
    LEAVE _return;
  END IF;
  IF @enables = 3 THEN
    SET out_ret = -5;
    SET out_desc = '黑名单用户';
    LEAVE _return;
  END IF;
  IF in_money <= 0 THEN
    SET out_ret = -6;
    SET out_desc = '金额错误';
    LEAVE _return;
  END IF;
  IF @usableSum <= 0 THEN
    SET out_ret = -7;
    SET out_desc = '账户余额不足';
    LEAVE _return;
  END IF;
  IF in_money > @usableSum THEN
    SET out_ret = -8;
    SET out_desc = CONCAT('账户余额:￥', @usableSum, '元');
    LEAVE _return;
  END IF;
  /*IF in_money > maxWithDrawSum THEN
    SET out_ret = -9;
    SET out_desc = CONCAT('最高提现金额:￥', maxWithDrawSum, '元');
    LEAVE _return;
  END IF;*/
  #若未设置交易密码默认登录密码
  IF @dealpwd IS NULL THEN
    SET @dealpwd = @loginpwd;
  END IF;
  /*IF in_dealpwd <> @dealpwd THEN
    SET out_ret = -10;
    SET out_desc = '交易密码错误';
    LEAVE _return;
  END IF;*/
  #计算15天外的金额
  SET @withDrawFee = 0;
  SELECT costFee
  INTO
    @withDrawFee
  FROM
    t_platform_cost
  WHERE
    id = 9;
  SET @withDrawFee = IFNULL(@withDrawFee, 0);
  /**IF in_money > maxWithDrawSum THEN
    #首先超出的部分进行手续费的计算，然后未超出的部分看是否在15天内提取并且没有进行投标的
    SET overMoney = in_money - maxWithDrawSum;
    SET poundage = overMoney * @withDrawFee * 0.01;
    SET dealMoney = in_money - overMoney;
  ELSE
    SET dealMoney = in_money;
    SET poundage = 0;
  END IF;*/
  SET dealMoney = in_money;
  SET poundage = 0;
  SET @rechargeMoney = 0;
  SET @rechargeTime = DATE_SUB(NOW(), INTERVAL 15 DAY);
  SELECT SUM(rechargeMoney)
  INTO
    @rechargeMoney
  FROM
    t_recharge_detail
  WHERE
    result = 1
    AND userId = in_uid
    AND rechargeTime >= @rechargeTime;
  SET @rechargeMoney = IFNULL(@rechargeMoney, 0);
  SET rechargeOut15 = @usableSum - @rechargeMoney;
  IF rechargeOut15 < 0 THEN
    SET rechargeOut15 = 0;
  END IF;
  #查看15天以内成功获得的还款
  SET @tradeIn15 = 0;
  SELECT SUM(a.hasPrincipal + a.hasInterest) hasPI
  INTO
    @tradeIn15
  FROM
    t_invest a
  LEFT JOIN
  t_borrow b
  ON a.borrowId = b.id
  LEFT JOIN t_repayment c
  ON c.borrowId = b.id
  WHERE
    c.realRepayDate >= @rechargeTime
    AND a.investor = in_uid
    AND b.id IS NOT NULL
  GROUP BY
    a.investor;
  SET @tradeIn15 = IFNULL(@tradeIn15, 0);
  SET @cardNo = '';
  SELECT cardNo
  INTO
    @cardNo
  FROM
    t_bankcard
  WHERE
    id = in_bank_id;
  START TRANSACTION;
  IF in_money <= rechargeOut15 THEN
    INSERT INTO t_withdraw (`name`, cellPhone, acount, SUM, poundage, `status`, applyTime, userId, bankId, ipAddress, billcode,trxId) VALUES (@username, @cellPhone, @cardNo, in_money+in_feeAmt, in_feeAmt, 1, NOW(), in_uid, in_bank_id, in_ip, in_billcode,in_trxId);
    SET withdrawId = LAST_INSERT_ID();
    SET out_ret = LAST_INSERT_ID();
    IF out_ret <= 0 THEN
      ROLLBACK;
      SET out_ret = -2;
      SET out_desc = '提现记录无效21';
      LEAVE _return;
    END IF;
  ELSE
    IF in_money <= (rechargeOut15 + @tradeIn15) THEN
      INSERT INTO t_withdraw (`name`, cellPhone, acount, `sum`, poundage, `status`, applyTime, userId, bankId, ipAddress, billcode,trxId) VALUES (@username, @cellPhone, @cardNo, in_money+in_feeAmt, in_feeAmt, 1, NOW(), in_uid, in_bank_id, in_ip, in_billcode,in_trxId);
      SET withdrawId = LAST_INSERT_ID();
      SET out_ret = LAST_INSERT_ID();
      IF out_ret <= 0 THEN
        ROLLBACK;
        SET out_ret = -2;
        SET out_desc = '提现记录无效1';
        LEAVE _return;
      END IF;
    ELSE
      SET dealMoney = in_money - rechargeOut15 - @tradeIn15;
      SET addPoundage = dealMoney * @withDrawFee * 0.01;
      SET poundage = poundage + addPoundage;
      INSERT INTO t_withdraw (`name`, cellPhone, acount, `sum`, poundage, `status`, applyTime, userId, bankId, ipAddress, billcode,trxId) VALUES (@username, @cellPhone, @cardNo, in_money+in_feeAmt, in_feeAmt, 1, NOW(), in_uid, in_bank_id, in_ip, in_billcode,in_trxId);
      SET withdrawId = LAST_INSERT_ID();      
      SET out_ret = LAST_INSERT_ID();
      #添加操作日志
      SELECT lastIP
      INTO
        @t_lastIP
      FROM
        t_user
      WHERE
        id = in_uid;
      INSERT INTO t_operation_log (operation_table, operation_user, operation_type, operation_ip, operation_money, operation_remarks, operation_around) VALUES ('t_withdraw', @username, 1, @t_lastIPm, in_money+in_feeAmt, '申请提现冻结金额', 1);
    END IF;
  END IF;
  IF out_ret <= 0 THEN
    ROLLBACK;
    SET out_ret = -2;
    SET out_desc = '提现记录无效';
    LEAVE _return;
  END IF;
  #执行扣费操作
  #插入提现记录之后，则用户表里面的可用余额减少，冻结余额增加
  UPDATE t_user
  SET
    usableSum = usableSum - in_money - in_feeAmt , freezeSum = freezeSum + in_money + in_feeAmt
  WHERE
    id = in_uid
    AND 0 <= (usableSum - in_money - in_feeAmt);
  SET out_ret = ROW_COUNT();
  IF out_ret <= 0 THEN
    ROLLBACK;
    SET out_ret = -12;
    SET out_desc = '提现失败';
    LEAVE _return;
  END IF;
  INSERT INTO t_billcode (pMerBillNo,borrowId,`status`) VALUES (in_billcode,-1,3);
  INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum, trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost, spending)
  SELECT in_uid, NOW(), -1, '提现冻结金额', in_money+in_feeAmt, a.usableSum AS usableSum, a.freezeSum AS freezeSum
       , SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest)
       , -1, 0, CONCAT('冻结提现和提现手续费金额[', in_money+in_feeAmt, ']元'), 0, out_ret, ''
      , 0, in_money+in_feeAmt FROM  t_user a LEFT JOIN t_invest b ON a.id = b.investor  WHERE  a.id = in_uid GROUP BY a.id;
  IF _error <> 0 THEN
    ROLLBACK;
    SET out_ret = -3;
    SET out_desc = '执行异常';
    LEAVE _return;
  ELSE
    COMMIT;
    SET out_ret = withdrawId;
    SET out_desc = '';
  END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_amount_withdraw_auth
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_amount_withdraw_auth`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_amount_withdraw_auth`(IN `in_uid` bigint,IN `in_aid` bigint,IN `in_wid` bigint,IN `in_money` decimal(18,2),IN `in_poundage` decimal(18,2),IN `in_status` int,IN `in_ip` varchar(20),IN `in_remark` varchar(2048),IN `in_date` varchar(30),OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:begin
	declare	t_freeze_amount	decimal(18,2) default	0;	#冻结金额
	declare	t_freeze_fee	decimal(18,2) default	0;	#冻结手续费
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	set	@wid	=	-1;
	set	@withDrawSum	=	0;
	set	@poundage	=	0; 
  set	@wStatus = 5;
	set	@userId	=	0;
	set	@version	=	0;
	select id,sum,	poundage,	`status`,	userId,	versoin into	@wid,	@withDrawSum,	@poundage,	@wStatus,	@userId,	@version
	from t_withdraw a where id = in_wid;
	set	@wStatus = ifnull(@wStatus,5);
	set	t_freeze_amount	=	ifnull(@withDrawSum,0);
	set	t_freeze_fee	=	ifnull(@poundage,0);
	if	in_wid	<>  @wid	then
		set out_ret = -2;
		set out_desc = '编号不存在';
		leave _return;
	end	if;
	#状态(1 默认审核中  2 已提现 3 取消 4转账中 5 失败)
	if	@wStatus	=	2 then
		set out_ret = -3;
		set out_desc = '该笔提现款已完成';
		leave _return;
	end	if;
	if	@wStatus	=	3 then
		set out_ret = -4;
		set out_desc = '该笔提现款已取消';
		leave _return;
	end	if;
	if	@wStatus	=	4 then
		set out_ret = -5;
		set out_desc = '该笔提现款正在转账中';
		leave _return;
	end	if;
	if	@wStatus	=	5 then
		set out_ret = -6;
		set out_desc = '该笔提现款已受理';
		leave _return;
	end	if;
	if	in_uid	<>	@userId then
		set out_ret = -7;
		set out_desc = '用户信息错误';
		leave _return;
	end	if;
	if	in_money	<=0	then
		set out_ret = -8;
		set out_desc = '提现金额错误';
		leave _return;
	end	if;
	if	in_poundage <0	then
		set out_ret = -9;
		set out_desc = '手续费错误';
		leave _return;
	end	if;
/*
	if	(in_money	+	in_poundage) <>	@withDrawSum	then
		set out_ret = -10;
		set out_desc = '(到账金额+手续费)不匹配提现总额';
		leave _return;
	end	if;
*/
	if	in_status	<>	4	&&	in_status	<>	5	then
		set out_ret = -11;
		set out_desc = '未知状态';
		leave _return;
	end	if;
	start transaction;
 
		#防止并发处理
		update t_withdraw set versoin	=	versoin	+	1 where id	=	in_wid and `status`=1	and	userId	=	in_uid	and versoin	=	@version;
		set out_ret = ROW_COUNT();	
		if	out_ret	<=0	then
			rollback;	
			set out_ret = -12;
			set out_desc = '提现审核失败';
			leave _return;
		end	if;
    SET @witndrawSum = in_money +in_poundage;
		update t_withdraw set `status`	=	in_status,	sum	=	in_money,	remark	=	in_remark,	poundage	=	in_poundage,	checkId	=	in_aid,
		checkTime	=	now() where id	=	in_wid and `status`=1	and	userId	=	in_uid;
		if	in_status	=	5	then
			#审核不通过要返还用户冻结的资金
			update t_user set usableSum = usableSum	+	t_freeze_amount+t_freeze_fee,	freezeSum	=	freezeSum	-	t_freeze_amount-t_freeze_fee where id	=	in_uid;
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income)	select in_uid, now(), -1, '提现失败', t_freeze_amount+t_freeze_fee,
			a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
			-1,0, concat('提现失败,解冻金额[',t_freeze_amount+t_freeze_fee,']元'), 0, in_wid, '', 0	,t_freeze_amount+t_freeze_fee from t_user a left join t_invest b on a.id = b.investor where a.id = in_uid group by a.id;
		end	if;
	if	_error	<>	0	then
		rollback;
		set out_ret = -13;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_amount_withdraw_cancel
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_amount_withdraw_cancel`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_amount_withdraw_cancel`(IN `in_uid` bigint,IN `in_wid` bigint,IN `in_ip` varchar(20),IN `in_date` varchar(30),OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:begin
declare t_freeze_amount decimal(18,2) default 0; 
declare t_freeze_fee decimal(18,2) default 0;
declare _error int default 0; #异常标记
declare continue handler for sqlexception set _error = 1; #sqlexception返回值
set out_ret = -1;
set out_desc = '执行失败';
set @wid = -1;
set @withDrawSum = 0;
set @poundage = 0;
  set @wStatus = 5;
set @userId = 0;
set @version = 0;
select id, sum, poundage, `status`, userId, versoin into @wid, @withDrawSum, @poundage, 
@wStatus, @userId, @version from t_withdraw a where id = in_wid;
set @wStatus = ifnull(@wStatus,5);
set t_freeze_amount = ifnull(@withDrawSum,0);
set t_freeze_fee = ifnull(@poundage,0);
if in_wid <> @wid then
set out_ret = -2;
set out_desc = '提现编号错误';
leave _return;
end if;
if @wStatus = 2 then
set out_ret = -3;
set out_desc = '您已完成该笔提现款';
leave _return;
end if;
if @wStatus = 3 then
set out_ret = -4;
set out_desc = '您已取消该笔提现款';
leave _return;
end if;
if @wStatus = 4 then
set out_ret = -5;
set out_desc = '客服人员正在转账该笔提现款,无法取消';
leave _return;
end if;
if @wStatus = 5 then
set out_ret = -6;
set out_desc = '该笔提现款已受理';
leave _return;
end if;
if in_uid <> @userId then
set out_ret = -7;
set out_desc = '用户信息错误';
leave _return;
end if;
start transaction;
UPDATE t_withdraw SET `status`=3  where id = in_wid and `status`=1 and userId = in_uid;
set out_ret = ROW_COUNT(); 
if out_ret <=0 then
rollback; 
set out_ret = -1;
set out_desc = '执行失败';
leave _return;
end if;
update t_user set usableSum = usableSum + t_freeze_amount + t_freeze_fee, freezeSum = freezeSum - t_freeze_amount - t_freeze_fee where id = in_uid;
insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income) select in_uid, now(), -1, '取消提现', t_freeze_amount+t_freeze_fee,
a.usableSum as usableSum, a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
-1,0, concat('返还取消提现金额[',t_freeze_amount+t_freeze_fee,']元'), 0, in_wid, '', 0,t_freeze_amount+t_freeze_fee from t_user a left join t_invest b on a.id = b.investor where a.id = in_uid group by a.id;
if _error <> 0 then
rollback;
set out_ret = -13;
set out_desc = '执行异常';
leave _return;
else 
commit;
set out_ret = 1;
set out_desc = '';
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_amount_withdraw_transfer
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_amount_withdraw_transfer`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_amount_withdraw_transfer`(IN `in_aid` BIGINT,IN `in_wid` BIGINT,IN `in_status` BIGINT,IN `in_ip` VARCHAR(20),IN `in_date` VARCHAR(30),IN `in_pMerBillNo` VARCHAR(30),IN `in_pIpsBillNo` VARCHAR(30),OUT `out_ret` INT,OUT `out_desc` VARCHAR(255))
_return:begin
	DECLARE t_freeze_amount DECIMAL(18,2) DEFAULT 0;
	DECLARE t_freeze_fee DECIMAL(18,2) DEFAULT 0;
 
DECLARE t_content VARCHAR(1024) DEFAULT ''; #信息
 
DECLARE t_mail_template VARCHAR(2048) DEFAULT ''; #站内信模版
 
DECLARE t_email_template VARCHAR(2048) DEFAULT ''; #邮件模版
 
DECLARE t_sms_template VARCHAR(2048) DEFAULT ''; #短信模版
 
DECLARE t_payment_mode VARCHAR(100) DEFAULT ''; #还款方式
 
DECLARE t_invest_fee DECIMAL(18,4) DEFAULT 0; #投资手续费
 
DECLARE t_date VARCHAR(20) DEFAULT ''; #日期
 
DECLARE t_other VARCHAR(100) DEFAULT ''; #其他
 
DECLARE _error INT DEFAULT 0; #异常标记
 
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1; #sqlexception返回值
 
 
 
SET out_ret = -1;
 
SET out_desc = '执行失败';
 
 
 
SET @wid = -1;
 
SET @withDrawSum = 0;
 
SET @poundage = 0;
 
  SET @wStatus = 5;
 
SET @userId = 0;
 
SET @version = 0;
 
 
 
SELECT id, SUM, poundage, `status`, userId, versoin INTO @wid, @withDrawSum, @poundage,
 
@wStatus, @userId, @version FROM t_withdraw a WHERE id = in_wid;
 
SET @wStatus = IFNULL(@wStatus,5);
 
SET t_freeze_amount = IFNULL(@withDrawSum,0);
SET t_freeze_fee = IFNULL(@poundage,0);
 
 
IF in_wid <> @wid THEN
 
SET out_ret = -2;
 
SET out_desc = '提现编号错误';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
 
IF @wStatus = 1 THEN
 
SET out_ret = -3;
 
SET out_desc = '该笔提现款正在审核中';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
IF @wStatus = 2 THEN
 
SET out_ret = -4;
 
SET out_desc = '该笔提现款已完成';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
IF @wStatus = 3 THEN
 
SET out_ret = -5;
 
SET out_desc = '该笔提现款已取消';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
IF @wStatus = 5 THEN
 
SET out_ret = -6;
 
SET out_desc = '该笔提现款已受理';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
IF t_freeze_amount <=0 THEN
 
SET out_ret = -7;
 
SET out_desc = '转账金额错误';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
IF in_status <> 2 && in_status <> 5 THEN
 
SET out_ret = -8;
 
SET out_desc = '未知状态';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
START TRANSACTION;
 
 
 
 
UPDATE t_withdraw SET versoin = versoin + 1 WHERE id = in_wid AND `status`=4 AND userId = @userId AND versoin = @version;
 
 
 
SET out_ret = ROW_COUNT();
 
IF out_ret <=0 THEN
 
ROLLBACK;
 
SET out_ret = -1;
 
SET out_desc = '执行失败';
 
 
 
LEAVE _return;
 
END IF;
 
 
 
 
UPDATE t_withdraw SET `status` = in_status, checkId = in_aid,
 
checkTime = NOW() WHERE id = in_wid AND `status`=4 AND userId = @userId;
 
 
 
SET @foundMode = '';
 
SET @remark = '';
 
 
 
IF in_status = 5 THEN
 
SET @foundMode = '提现失败';
 
SET @remark = CONCAT('提现失败,返还金额[',t_freeze_amount+t_freeze_fee,']元');
 
 
UPDATE t_user SET usableSum = usableSum + t_freeze_amount+t_freeze_fee, freezeSum = freezeSum - t_freeze_amount-t_freeze_fee WHERE id = @userId;
INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
 
trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income) SELECT @userId, NOW(), -1, @foundMode, ROUND(t_freeze_amount+t_freeze_fee,2),
 
a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
 
-1,0, @remark, 0, in_wid, '', 0,ROUND(t_freeze_amount+t_freeze_fee,2) FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @userId GROUP BY a.id;
 
ELSEIF in_status = 2 THEN
 
SET @foundMode = '提现成功';
SET @poundage=0;
SELECT poundage INTO @poundage FROM t_withdraw WHERE id = in_wid; 
 
SET @remark = CONCAT('提现成功,账户扣除[',t_freeze_amount+t_freeze_fee,']元,','银行卡入账 [',FORMAT((t_freeze_amount),2),']元,','手续费[',ROUND(@poundage,2),']元 ');
 
 
UPDATE t_user SET freezeSum = freezeSum - t_freeze_amount-t_freeze_fee WHERE id = @userId; #扣除冻结金额
SET t_mail_template = f_get_notice_template('cash_success');
 
SET t_mail_template = REPLACE(t_mail_template, '[date]', NOW());
 
SET t_mail_template = REPLACE(t_mail_template, '[money]', t_freeze_amount+t_freeze_fee);
 
SET t_mail_template = REPLACE(t_mail_template, '[<br/>]', '<br />');
 
 
 
SET t_email_template = f_get_notice_template('e_cash_success');
 
SET t_email_template = REPLACE(t_email_template, '[date]', NOW());
 
SET t_email_template = REPLACE(t_email_template, '[money]', t_freeze_amount+t_freeze_fee);
 
SET t_email_template = REPLACE(t_email_template, '[<br/>]', '<br />');
 
 
 
 
SET @username = '';
 
SET @email = '';
 
SET @telphone = '';
 
SELECT a.cellphone, b.username, b.email INTO @telphone, @username, @email FROM t_user b LEFT JOIN
 
t_person a ON a.userId = b.id WHERE b.id =  @userId;
 
 
 
SET t_sms_template = f_get_notice_template('s_cash_success');
 
SET t_sms_template = REPLACE(t_sms_template, '[userName]', @username);
 
SET t_sms_template = REPLACE(t_sms_template, '[date]', NOW());
 
SET t_sms_template = REPLACE(t_sms_template, '[money]', @withDrawSum);
 
SET t_sms_template = REPLACE(t_sms_template, '[<br/>]', '<br />');
 
 
INSERT INTO t_notice_task(user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
 
VALUES(@userId, '提现成功报告', 'showSucEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, in_aid, NOW(), 'withdraw');
 
INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
 
trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending) SELECT @userId, NOW(), -1, @foundMode, ROUND(t_freeze_amount+@poundage,2),
 
a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
 
-1,0, @remark, 0, in_wid, '', 0,ROUND(t_freeze_amount+t_freeze_fee,2) FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @userId GROUP BY a.id;
 
END IF;
 
 
 
 
IF _error <> 0 THEN
 
ROLLBACK;
 
SET out_ret = -13;
 
SET out_desc = '执行异常';
 
 
 
LEAVE _return;
 
ELSE
 
 
 
COMMIT;
 
SET out_ret = 1;
 
SET out_desc = '操作成功';
 
END IF;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_autobid
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_autobid`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_autobid`(IN `in_basepath` varchar(100), out out_ret int, out out_desc varchar(100))
_return:begin
 
declare t_bid bigint default -1;   #标的id
declare t_amount decimal(18,2) default 0;     #借款金额
declare t_has_invest_amount decimal(18,2) default 0; #已投资金额
declare t_borrow_way int default -1;      #借款方式(1 净值 2 秒还 3 信用 4 实地 5 担保)
declare t_is_day_the int default -1;      #是否天标 (1 月标 2 天标)
declare t_remain_amount decimal(18,2) default 0;    #剩余借款金额
declare t_credit bigint default -1;    #信用等级 (1 E 2 D 3 C 4 B 5 A 6 AA 7 AAA)
declare t_deadline bigint default -1;  #借款期限
declare t_annualrate decimal(18,2) default 0;  #年利率
declare t_publisher bigint default -1; #借款人id
declare t_uid bigint default -1; #用户id
declare t_bid_amount decimal(18,2) default 0; #投标金额
declare t_bid_remain decimal(18,2) default 0; #投标保留金额
declare t_user_amount decimal(18,2) default 0; #账户金额
declare t_enable_amount decimal(18,2) default 0; #可用的金额
declare t_bided_amount decimal(18,2) default 0; #已投标金额
declare t_borrow_title varchar(100) default ''; #借款标题
declare t_url varchar(500) default ''; #链接内容
declare t_mail_template varchar(2048) default '';
declare t_email_template varchar(2048) default '';
declare t_sms_template varchar(2048) default '';
declare t_num bigint default -1; #计数器
declare t_execute bigint default 1; #执行状态(非-1 可执行)
declare _error int default 0; #异常标记
declare _done int default 0;
declare bid_done int default 0;
declare t_content varchar(1024) default '';
declare cursor_bid cursor for (select user_id,bid_amount,remain_amount,borrow_id from t_autobid_task where exe_mode = 2 order by borrow_sort asc);
declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
declare continue handler for sqlexception set _error = 1; #sqlexception返回值
 
set out_ret = -1;
set out_desc = '执行失败';
start transaction;
  #统计本次执行的标的
call p_autobid_task(in_basepath,@a,@b);
 
open cursor_bid;
 
 
      fetch cursor_bid into t_uid, t_bid_amount, t_bid_remain, t_bid;
 
while _done <> 1 do
              set t_execute = 1;
set @t_num = -1;
 
update t_automaticbid_user set userId = t_uid where userid = t_uid and borrowid = t_bid;
set @ret_update = ROW_COUNT();
  if @ret_update <> 0 then
		set t_execute = -1;
		set out_ret = -2;
		set out_desc = '标的已投标';
	end if;
set @t_user_amount = 0;
select usableSum into @t_user_amount from t_user where id = t_uid;
set t_user_amount = @t_user_amount;
           set t_enable_amount = t_bid_amount + t_bid_remain - t_user_amount;
           if t_enable_amount > t_user_amount then
              set t_execute  = -1;
              set out_ret  = -3;
              set out_desc = '剩余金额不足';
           end if;
 
set @t_amount = 0;
set @t_has_invest_amount = 0;
           set @t_borrow_title = 0;
set @t_deadline = 0;
set @t_annualrate = 0;
set @t_publisher = 0;
select borrowAmount,hasInvestAmount,borrowTitle,deadline,annualRate,publisher into @t_amount,@t_has_invest_amount,
           @t_borrow_title,@t_deadline,@t_annualrate,@t_publisher from v_t_autobid_borrow where id = t_bid limit 1;
set t_amount = ifnull(@t_amount,0);
set t_has_invest_amount = ifnull(@t_has_invest_amount,0);
           set t_borrow_title = ifnull(@t_borrow_title,0);
set t_deadline = ifnull(@t_deadline,0);
set t_annualrate = ifnull(@t_annualrate,0);
set t_publisher = ifnull(@t_publisher,0);
 
           set t_bided_amount = t_bid_amount + t_has_invest_amount;
           if t_bided_amount > t_amount then
              set t_execute = -1;
              set out_ret = -4;
              set out_desc = '投标超出';
           end if;
 
update t_borrow SET version = version+1 WHERE id = t_bid and hasInvestAmount < borrowAmount and 0.95 > (hasInvestAmount/borrowAmount);
set @ret_update = ROW_COUNT();
if @ret_update = 0 then
set t_execute = -1;
set out_ret = -5;
set out_desc = '超出可投标';
end if;
 
           update t_user set lastIP = lastIP where id = t_uid and 0 <= (usableSum -t_bid_amount);
set @ret_update = ROW_COUNT();
if @ret_update = 0 then
set t_execute = -1;
set out_ret = -6;
set out_desc = '投标后金额错误';
end if;
           if t_bid_amount < 50  then
              set t_execute = -1;
              set out_ret = -7;
              set out_desc = '投标金额错误';
           end if;
 
 
           if t_execute > -1 then
 
update t_borrow SET hasInvestAmount = hasInvestAmount+ t_bid_amount,investNum=investNum+1
WHERE id = t_bid and hasInvestAmount < borrowAmount and 0.95 > (hasInvestAmount/borrowAmount);
 
update t_user set usableSum = usableSum -t_bid_amount,freezeSum = freezeSum + t_bid_amount
where id = t_uid and 0 <= (usableSum -t_bid_amount);
 
set t_url = concat('自动投标了借款[<a href=',in_basepath,'/financeDetail.do?id=',t_bid,' target=_blank >',t_borrow_title,'</a>]');
 
set t_content = f_link(in_basepath,t_bid,t_borrow_title,'','','');
set t_content = concat('自动投标借款[', t_content, '],冻结投标金额');
                
insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,trader, dueoutSum, remarks,
oninvest, paynumber, paybank, cost,spending,borrow_id) (select t_uid, now(), 653, f_moneyDecode(653), t_bid_amount,
a.usableSum as usableSum, a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
-1,0, t_content, 0, t_bid, '', 0 ,t_bid_amount,b.borrowId from t_user a left join t_invest b on a.id = b.investor
where a.id = t_uid group by a.id);
 
update t_borrow set sort = 4, borrowStatus = 3,remainTimeStart = remainTimeEnd
where borrowAmount = hasInvestAmount AND borrowStatus = 2 AND id = t_bid;
 
insert into t_user_recorelist(userId,url,time) values(t_uid,t_url,now());
 
insert into t_invest(investamount,realamount,monthrate,investor,oriinvestor,borrowid,deadline,investtime,isautobid)
values(t_bid_amount,t_bid_amount,(t_annualrate/12.0),t_uid,t_uid,t_bid,t_deadline,now(),2);
 
set @invest_id = last_insert_id();
 
set t_mail_template = f_get_notice_template('tender');
set t_mail_template = replace(t_mail_template, 'title', t_borrow_title);
set t_mail_template = replace(t_mail_template, '[voluntarily]', '自动');
set t_mail_template = replace(t_mail_template, 'date', now());
set t_mail_template = replace(t_mail_template, 'investAmount', t_bid_amount);
 
set t_email_template = f_get_notice_template('e_tender');
set t_email_template = replace(t_email_template, 'title', t_borrow_title);
set t_email_template = replace(t_email_template, '[voluntarily]', '自动');
set t_email_template = replace(t_email_template, 'date', now());
set t_email_template = replace(t_email_template, 'investAmount', t_bid_amount);
 
set t_sms_template = f_get_notice_template('s_tender');
set t_sms_template = replace(t_sms_template, 'title', t_borrow_title);
set t_sms_template = replace(t_sms_template, '[voluntarily]', '自动');
set t_sms_template = replace(t_sms_template, 'date', now());
set t_sms_template = replace(t_sms_template, 'investAmount', t_bid_amount);
 
set @username = '';
set @email = '';
set @telphone = '';
select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
t_person a on a.userId = b.id where b.id = t_uid;
insert into t_notice_task(user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id,
add_time, operate_identify) values(t_uid, '理财投资成功报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template,
t_email_template, t_sms_template, @invest_id, now(), 'invest');
 
insert into t_automaticbid_user(borrowid,userid) values(t_bid,t_uid);
           end if;
 
fetch cursor_bid into t_uid, t_bid_amount, t_bid_remain, t_bid;
end while;
close cursor_bid;
 
  update t_automaticbid set bidsettime = now() where exists(select user_id from t_autobid_task where exe_mode = 2);
 
  #处理完毕清除任务
  delete from t_autobid_task;
 
if _error <> 0 then
rollback;
set out_ret = -9;
  set out_desc = '执行异常';
leave _return;
else
commit;
set out_ret = 1;
set out_desc = '';
end if;
 
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_autobid_task
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_autobid_task`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_autobid_task`(IN `in_basepath` varchar(100), out out_ret int, out out_desc varchar(100))
_return:begin
declare t_bid bigint default -1;   #标的id
declare t_amount decimal(18,2) default 0;     #借款金额
declare t_has_invest_amount decimal(18,2) default 0; #已投资金额
declare t_borrow_way int default -1;      #借款方式(1 净值 2 秒还 3 信用 4 实地 5 担保)
declare t_is_day_the int default -1;      #是否天标 (1 月标 2 天标)
declare t_remain_amount decimal(18,2) default 0;    #剩余借款金额
declare t_credit bigint default -1;    #信用等级 (1 E 2 D 3 C 4 B 5 A 6 AA 7 AAA)
declare t_deadline bigint default -1;  #借款期限
declare t_annualrate decimal(18,2) default 0;  #年利率
declare t_publisher bigint default -1; #借款人id
declare t_uid bigint default -1; #用户id
declare t_bid_amount decimal(18,2) default 0; #投标金额
declare t_bid_remain decimal(18,2) default 0; #投标保留金额
declare t_user_amount decimal(18,2) default 0; #账户金额
declare t_enable_amount decimal(18,2) default 0; #可用的金额
declare t_bided_amount decimal(18,2) default 0; #已投标金额
declare t_borrow_title varchar(100) default ''; #借款标题
declare t_url varchar(500) default ''; #链接内容
declare t_mail_template varchar(2048) default '';
declare t_email_template varchar(2048) default '';
declare t_sms_template varchar(2048) default '';
declare t_num bigint default -1; #计数器
declare t_execute bigint default 1; #执行状态(非-1 可执行)
declare _error int default 0; #异常标记
declare _done int default 0;
declare t_content varchar(1024) default '';
declare cursor_name cursor for (select id,borrowAmount,hasInvestAmount,borrowWay,isDayThe,remainamount,credit,deadline,
  annualrate,publisher from v_t_autobid_borrow where autoBidEnableTime <= now());
declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
declare continue handler for sqlexception set _error = 1; #sqlexception返回值
set out_ret = -1;
set out_desc = '执行失败';
 
  insert into t_autobid_task(autobid_id,exe_mode) (select a.id,1 from t_automaticbid a left join t_user b on a.userid=b.id where
a.bidsettime is not null and a.bidstatus = 2 and a.bidamount > 0 and a.remandamount < b.usablesum  and b.usablesum > 0);
 
  #统计本次执行的标的
open cursor_name;
      fetch cursor_name into t_bid, t_amount, t_has_invest_amount, t_borrow_way, t_is_day_the, t_remain_amount, t_credit, t_deadline,
t_annualrate, t_publisher;
  /*if 1>0 then
rollback;
set out_ret = t_deadline;
  set out_desc =t_deadline;
leave _return;
end if;*/
 
while _done <> 1 do
if t_is_day_the = 2 then
              set t_deadline = -t_deadline;
           end if;
insert into t_autobid_task(autobid_id,borrow_id,exe_mode,bid_sort,borrow_sort,user_id,user_name,bid_amount,remain_amount) (select t.id,t_bid,2,1,1,
t.userid,t.username,t.bidamount,t.remandamount from ( select b.id,b.userid,c.username,f_caculate_bidamount(b.bidamount,t_amount,t_has_invest_amount)
as bidamount,b.remandamount from t_autobid_task a left join t_automaticbid b on a.autobid_id = b.id left join t_user c on b.userid = c.id where
a.exe_mode = 1 and b.ratestart <= t_annualrate and b.rateend >= t_annualrate and b.deadlinestart <= t_deadline and b.deadlineend >= t_deadline and
  0 < instr(borrowWay,t_borrow_way) and b.bidamount <= t_remain_amount  and b.bidamount <= c.usablesum
   and b.remandamount <= c.usablesum and b.userid != t_publisher) t left join t_automaticbid_user t1 on t.userid != t1.userid and t1.borrowid = t_bid);
 
fetch cursor_name into t_bid, t_amount, t_has_invest_amount, t_borrow_way, t_is_day_the, t_remain_amount, t_credit, t_deadline,
t_annualrate, t_publisher;
 
end while;
close cursor_name;
set out_ret = 1;
set out_desc = '';
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_automatic_payment
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_automatic_payment`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_automatic_payment`(IN `in_bid` bigint,out out_ret int, out out_desc varchar(100))
BEGIN
	
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare  _done INT default  0;
	declare	_error	int	default	0;
	declare exit handler for sqlexception set _error	=	1;
	#创建临临时表
	DROP TABLE IF EXISTS  temp_flow_payment;
	create TEMPORARY table temp_flow_payment(t_iv_id bigint,t_iv_investor bigint,t_iv_invest_amount decimal(18,4),t_iv_rep decimal (18,4) , t_iv_reI decimal (18,4),t_u_username varchar(255),t_iv_real_amount decimal(18,4),t_iv_oriInvestor bigint,t_iv_repayStatus  int);
  insert into temp_flow_payment  select a.id,a.investor,a.investAmount,a.recivedPrincipal,a.recievedInterest,b.username ,a.realAmount as realAmount,a.oriInvestor,a.repayStatus from t_invest a left join t_user b on a.investor=b.id where  a.circulationForpayStatus=1 and a.repayDate is not null  and a.repayDate <=now() and a.borrowId=in_bid;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_auto_firstvip
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_auto_firstvip`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_auto_firstvip`(out out_ret int, out out_desc varchar(100))
BEGIN
	declare u_id BIGINT default 0;	#用户
	declare user_name varchar(1024) DEFAULT '';	#用户名
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare  _done INT default  0;
	declare	_error	int	default	0;
	declare exit handler for sqlexception set _error	=	1;
	#创建临临时表
	DROP TABLE IF EXISTS `vip_first_table`;
	create TEMPORARY table vip_first_table(id int,username VARCHAR(255));
	
	insert into vip_first_table select IFNULL(id,-1),username from t_user where vipStatus =2 and feeStatus=1 and isFirstVip = 1;
	select IFNULL(id,-1), username into u_id, user_name from vip_first_table ORDER BY id LIMIT 0,1;
	select costFee  into @vip_Fee from  t_platform_cost where alias = 'vipFee';
	start transaction;
		#循环执行  
		while u_id > -1 do
			#//查询vip会费	
			#查询首次成为VIP时，用户是否有钱
			select usableSum into @usables from t_user where id= u_id and usableSum > @vip_Fee;
			set	@usables	=	ifnull(@usables,-1);
			if @usables <> -1	then 
				#扣除VIP会费
				update t_user set usableSum = usableSum - @vip_Fee ,feeStatus=2,vipStatus=2,isFirstVip = 2,vipCreateTime = now() where id =u_id;
				#添加VIP会费记录
				insert into t_vipsum (vipFee,userId)	values (@vip_Fee,u_id);
				#添加资金记录
				insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending)	select u_id, now(), 804, f_moneyDecode(804), @vip_Fee,
				a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				-1,0, '扣除VIP会员费', 0, u_id, '', 0	,@vip_Fee from t_user a left join t_invest b on a.id = b.investor where a.id = u_id group by a.id;
 
				#站内信
				set	t_mail_template	=	f_get_notice_template('vip_success_xu');
				set t_mail_template = replace(t_mail_template,'vipFee',@vip_Fee);
				#邮件
				set	t_email_template	=	f_get_notice_template('e_vip_success_xu'); 
				set t_email_template = replace(t_email_template,'vipFee',@vip_Fee);
				#插入通知任务
				set	@username	=	'';
				set	@email	=	'';
				set	@telphone	=	'';
				select a.cellphone,	b.username,	b.email	into	@telphone,	@username,	@email from	 t_user	b 
				left	join	t_person	a	on	a.userId	=	b.id	where	b.id	=	u_id;
				#短信
				set	t_sms_template	=	f_get_notice_template('s_vip_success_xu');
				set	t_sms_template = replace(t_sms_template,'username', @username);
				set t_sms_template = replace(t_sms_template,'vipFee',@vip_Fee);
				#插入记录
				insert	into	t_notice_task(user_id,sendtitle,s_nid,username,	email,	telphone,	mail_info,	email_info,	sms_info,	add_time,	operate_identify)
				values(u_id, 'VIP会员成功扣费','capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,		now(),	'vip');
				set @usables = -1;
			end if; 		  
			DELETE from vip_first_table where id = u_id; 
			set u_id = -1;
			select IFNULL(id,-1), username into u_id, user_name from vip_first_table ORDER BY u_id LIMIT 0,1;
      end while; #当_done=1时退出被循 )
		DROP TABLE IF EXISTS `vip_first_table`;
 
	if	_error	<>	0	then
		rollback;
	else	
		commit;
	end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_auto_pastvipfee
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_auto_pastvipfee`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_auto_pastvipfee`(out out_ret int, out out_desc varchar(100))
BEGIN
	declare u_id BIGINT default -1;	#用户id
	declare  user_name varchar(1024) DEFAULT '';	#用户名
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	#创建临临时表
	DROP TABLE IF EXISTS `vip_past_table`;
	create TEMPORARY table vip_past_table(id int,username VARCHAR(255));
	insert into vip_past_table select id,username  from t_user where vipStatus =2 and DATE_FORMAT(vipCreateTime,'%Y-%m-%d') < DATE_FORMAT(date_sub(now(), interval 1 year),'%Y-%m-%d');
	#处理首次成为VIP的用户
	select IFNULL(id,-1), username into u_id, user_name from vip_past_table ORDER BY id LIMIT 0,1;
	start transaction;
		while u_id > -1 do
			#更新用户的VIP续费状态
			update t_user  set t_user.vipStatus = 3, feeStatus =1  where id = u_id;
			#站内信
			set	t_mail_template	=	f_get_notice_template('vip_false_xu');
			#邮件
			set	t_email_template	=	f_get_notice_template('e_vip_false_xu');
		
			#插入通知任务
			set	@username	=	'';
			set	@email	=	'';
			set	@telphone	=	'';
		
			select a.cellphone,	b.username,	b.email	into	@telphone,	@username,	@email from	 t_user	b left	join
			t_person	a	on	a.userId	=	b.id	where	b.id	=	u_id;
			#短信
			set	t_sms_template	=	f_get_notice_template('s_vip_false_xu');
			set	t_sms_template = replace(t_sms_template,  'username', @username);
			#插入记录
			insert	into	t_notice_task(user_id,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	add_time,	operate_identify)
			values(u_id,	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,		now(),	'vip');		
			delete  from vip_past_table where id = u_id;
			set u_id = -1;
			select IFNULL(id,-1), username into u_id, user_name from vip_past_table ORDER BY id LIMIT 0,1;
		end while; 
   DROP TABLE IF EXISTS `vip_past_table`;
	if	_error	<>	0	then
		rollback;
	else	
		commit;
	end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_bevip
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_bevip`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_bevip`(IN `in_uid` bigint,IN `in_server` bigint,IN `in_vip_fee` decimal(18,2),IN `in_friend_fee` decimal(18,2),OUT `out_ret` int,OUT `out_desc` varchar(100),OUT `out_vip_desc` varchar(100),OUT `out_friend_desc` varchar(100))
_return:BEGIN
	
	declare	_error	int	default	0;	#异常标记
  declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	
	set	out_ret	=	-1;
	set	out_desc	=	"执行失败";
	set	out_vip_desc	=	"-1";
	set	out_friend_desc	=	"-1";
	set	@vip_status	=	-1;
	set	@useable_sum	=	0;
	set	@username	=	'';
	select	vipStatus,	usableSum,	username,  isEmployeeReferral	into	@vip_status,	@useable_sum,	@username, @isEmployeeReferral	from t_user	where id	=	in_uid;
	if	@vip_status	is null	then
		set out_ret = -2;
		set out_desc = "未知用户";
		leave _return;
	end	if;
	if	@vip_status = 2	then
		set out_ret = -3;
		set out_desc = "您已是VIP,无须再次申请";
		leave _return;
	end	if;
	start	transaction;
		set	@rid	=	-1;
		set	@t_userId	=	-1;
		select	id,	recommendUserId	into	@rid,	@t_userId	from	t_recommend_user	where	userId	=	in_uid;
		update	t_user	set	kefuId	=	in_server,	vipCreateTime	=	now(),	vipStatus	=	2,
		vipFee	=	in_vip_fee,	feeStatus	=	1	where	id	=	in_uid;
		update	t_user	set	authStep	=	4	where	authStep	=	3	and	id	=	in_uid;
		
		#当推荐人不存在或不在t_user表中时
		if @t_userId <> -1 then 
		#添加好友邀请金额记录
		insert	into	t_money(userId,money,addData) values(@t_userId,in_friend_fee,now());
		set	@mId	=	LAST_INSERT_ID();
		
		
		update	t_recommend_user	set	moneyTypeId	=	@mId where	id	=	@rid;
		end IF;
		#vip扣费
		if	@useable_sum	>	0	then
		if @useable_sum < in_vip_fee then
					   
			 set out_ret = -4;
			 set out_desc = "账户余额不足";
			 leave _return;
			   end if;
			
			update t_user set usableSum = usableSum - in_vip_fee,	feeStatus=2,	vipStatus=2,
			isFirstVip = 2,	vipCreateTime = now() where id =	in_uid;
			#vip扣费记录
			insert	into	t_vipsum(vipFee,userId) values(in_vip_fee,in_uid);
			insert into t_fundrecord (userId, recordTime, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks,operateType,spending)	select in_uid, now(), '申请VIP会员', in_vip_fee, a.usableSum as usableSum, a.freezeSum as freezeSum,
			ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
			-1,0, concat('您的VIP会员付费成功,本次产生费用[',in_vip_fee,']元'),804, in_vip_fee	from t_user a left join t_invest b on a.id = b.investor where a.id = in_uid group by a.id;
			
			set out_vip_desc = concat('尊敬的[',@username,']	您的VIP会员付费成功,本次产生费用[',in_vip_fee,']元');
			
			update	t_money	set	`status`	=	2	where	userId	=	@t_userId	and	`status`	=	1;
			set	@friend_status	=	ROW_COUNT();
			if	@friend_status	>	0	then
				# 1:非员工推荐的用户， 2：员工内部推荐用户 
				if @isEmployeeReferral = 1 then
						
					#扣除风险保障金
					select (sum(riskInCome)-sum(riskSpending)) into @t_riskBalance from t_risk_detail;
					insert into t_risk_detail (riskBalance,riskSpending,riskDate,riskType,resource,trader)
					values (@t_riskBalance,in_friend_fee,now(),'支出','好友邀请奖励',@t_userId);
					#邀请奖励发送给邀请人
					update t_user set usableSum = usableSum + in_friend_fee where id = @t_userId;
					insert into t_fundrecord (userId, recordTime, fundMode, handleSum, usableSum, freezeSum, dueinSum,
					trader, dueoutSum, remarks,income)	select @t_userId, now(), '好友邀请奖励', in_friend_fee, a.usableSum as usableSum, a.freezeSum as freezeSum,
					ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),-1,0, concat('好友邀请奖励[',in_friend_fee,']元'),in_friend_fee 
					from t_user a left join t_invest b on a.id = b.investor where a.id = @t_userId group by a.id;
					set out_friend_desc = concat(@t_userId,'#您邀请的用户[',@username,']已成为VIP会员,在此奖励￥',in_friend_fee,'元,再接再厉!');		
										
				ELSEIF  @isEmployeeReferral = 2 then
					set out_friend_desc = concat(@t_userId,'#您邀请的用户[',@username,']已成为VIP会员,内部员工推荐的用户不再额外奖励,请知悉!');	
				end if;
				
	
      end if;
		end	if;
	if	_error	<>	0	then
		rollback; 
		set out_ret = -4;
	  set out_desc = '执行异常'; 
 
		leave _return;
	else	
		commit; 
		set out_ret = 1;
		set out_desc = '';
	end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_audit
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_audit`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_audit`(IN `in_bid` bigint,IN `in_uid` bigint,IN `in_status` int,IN `in_msg` varchar(2048),IN `in_audit_opinion` varchar(2048),IN `in_base_path` varchar(200),IN `in_deal_time` datetime,out out_ret int, out out_desc varchar(100))
_return:BEGIN
	#标旳审核
	declare t_content varchar(1024)	default	'';	#信息
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare t_uid int default 0;
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1; 
	set out_desc = '执行失败';
  set @borrow_status = 0;
	set	@borrow_way	=	-1;
	set	@borrowTitle	=	null;
	set	@publisher	=	-1;
	set @borrowShow  = 0;
	set @borrowAmount = 0;
	set @annualRate = 0;
	set @deadline =0;
	set @isDayThe =1;
	set @version = 0;
  select borrowStatus,	borrowWay,	borrowTitle,	publisher,borrowShow,borrowAmount,annualRate,deadline,isDayThe,version
	into @borrow_status,	@borrow_way,	@borrowTitle,	@publisher ,@borrowShow,@borrowAmount,@annualRate,@deadline,@isDayThe,@version
  from t_borrow where id	=	in_bid	and	borrowStatus =	1;
  if @borrow_status	is null then
		set out_ret = -2; 
		set out_desc = '该借款已审核过';
		leave _return;
  end if;
  if @borrow_way	is	null then
		set out_ret = -3; 
		set out_desc = '未知标的';
		leave _return;
  end if;
  #处理业务逻辑
  start transaction;
	#并发处理
		update t_borrow set version	=	version	+	1	where id = in_bid	and	borrowStatus	=	1	and version	=	@version;
		set out_ret = ROW_COUNT();	
		if	out_ret	<=0	then
			rollback;	
			set out_ret = -4;
			set out_desc = '审核失败';
			leave _return;
		end	if;
	  if in_status	not	in(2,6) then
			set out_ret = -5; 
			set out_desc = '未知状态';
			leave _return;
		end if;
		if	in_status	=	2	then
			#流转标 
			if @borrow_way = 6 then 
				#更新借款状态
				update t_borrow set borrowStatus =2,auditOpinion= in_audit_opinion,circulationStatus= 2 ,sort= 10 ,auditTime= now(),
				autoBidEnableTime = DATE_ADD(now() ,INTERVAL 15 MINUTE)
				where borrowStatus=1 and id=in_bid;
				#插入还款记录
				insert into t_repayment(repayPeriod,stillPrincipal,stillInterest,borrowId,principalBalance,interestBalance,repayDate)
				values('1/1',0,0,in_bid,0,0, DATE_ADD(now(),INTERVAL @deadline MONTH));
			else 
				#更新借款状态
				update t_borrow set borrowStatus	=	2,	sort	=	10,	remainTimeStart	=	in_deal_time,
				
				
 
				auditOpinion	=	in_audit_opinion,	remainTimeEnd = DATE_ADD(in_deal_time,	INTERVAL raiseTerm DAY),
				
 
 
				autoBidEnableTime = DATE_ADD(in_deal_time,	INTERVAL 15 MINUTE)	where id	=	in_bid;
			end if;
		
			set	t_mail_template	=	f_get_notice_template('borrow_first_success');
			set	t_mail_template = replace(t_mail_template,	'title', @borrowTitle);
			set	t_mail_template = replace(t_mail_template,	'content', in_msg);
			
			set	t_email_template	=	f_get_notice_template('e_borrow_first_success');
			set	t_email_template = replace(t_email_template,	'title', @borrowTitle);
			set	t_email_template = replace(t_email_template,	'content', in_msg);
			#插入通知任务
			set	@username	=	'';
			set	@email	=	'';
			set	@telphone	=	'';
			select a.cellphone,	b.username,	b.email	into	@telphone,	@username,	@email from	 t_user	b left	join
			t_person	a	on	a.userId	=	b.id	where	b.id	=	@publisher;
			set	t_sms_template	=	f_get_notice_template('s_borrow_first_success');
			set	t_sms_template = replace(t_sms_template,'title', @borrowTitle);
			set	t_sms_template = replace(t_sms_template,'username', @username);
			set	t_sms_template = replace(t_sms_template,'date', now());
			set	t_sms_template = replace(t_sms_template,'content',in_msg);
			insert	into	t_notice_task(user_id,sendtitle,s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
			values(@publisher,	'借款初审报告','capitalChangeEnable',@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_bid,	now(),	'first_auth');
	
		elseif	in_status	=	6	then
			#审核失败
			#处理投资人的资金变动
			set	@ret	=	-6;
			set	@ret_desc	=	'处理撤消失败';
			call p_borrow_cancel(in_bid,	in_aid,	in_status,	in_audit_opinion,	in_basepath,	@ret,	@ret_desc);
			if	@ret	<	0	then
				rollback;	
				set out_ret = @ret;
				set out_desc = concat('p_borrow_cancel:',@ret_desc);
				leave _return;
			end	if;
		end	if;
		
	if	_error	<>	0	then 
		rollback;
		set out_ret = -7;
		set out_desc = '执行异常';
 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_auth_fullscale
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_auth_fullscale`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_auth_fullscale`(IN `in_bid` bigint,IN `in_status` bigint, out out_ret int, out out_desc varchar(100), out out_amount decimal(18,2), out out_annualrate decimal(18,2), out out_deadline int, out out_isdaythe int, out out_payment_mode int)
_return:begin
	declare	t_freeze_amount	decimal(18,2) default	0;
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	set	@borrowId	=	-1;
  set	@bStatus = -1;
	set	@borrowAmount	=	0;
	set	@hasInvestAmount	=	0;
	select id,	borrowStatus,	borrowAmount,	hasInvestAmount	into	@borrowId,	@bStatus,	@borrowAmount,@hasInvestAmount
	from t_borrow where id = in_bid;
	set	@borrowId	=	ifnull(@borrowId,-1);
	set	@bStatus = ifnull(@bStatus,-1);
	set	@borrowAmount	=	ifnull(@borrowAmount,0);
	set	@hasInvestAmount	=	ifnull(@hasInvestAmount,0);
	if	@borrowId	=	-1	then
		set out_ret = -2;
		set out_desc = '编号不存在';
		leave _return;
	end	if;
	#状态(1 初审中  2 招标中 3 复审中 4还款中 5已还完 -1 未知状态)
	if	@bStatus	=	-1	then
		set out_ret = -3;
		set out_desc = '未知状态';
		leave _return;
	end	if;
	if	@bStatus	=	1 then
		set out_ret = -4;
		set out_desc = '该笔借款正在初审中';
		leave _return;
	end	if;
	if	@bStatus	=	2 then
		set out_ret = -5;
		set out_desc = '该笔借款正在招标中';
		leave _return;
	end	if;
	if	@bStatus	=	4 then
		set out_ret = -6;
		set out_desc = '该笔借款正在还款中';
		leave _return;
	end	if;
	if	@bStatus	=	5 then
		set out_ret = -7;
		set out_desc = '该笔借款已还完';
		leave _return;
	end	if;
	if	@bStatus	=	6 then
		set out_ret = -8;
		set out_desc = '该笔借款已流标';
		leave _return;
	end	if;
	if	in_status	not	in(4,6)	then
		set out_ret = -9;
		set out_desc = '未知状态';
		leave _return;
	end	if;
	if	@borrowAmount	<>	@hasInvestAmount	then
		set out_ret = -10;
		set out_desc = concat('借款金额与投标金额不等:借[',@borrowAmount,'],投[',@hasInvestAmount,']');
		leave _return;
	end	if;
	if	in_status	=	4	then
		#审核成功
		set out_ret = 4;
		set out_desc = '处理审核成功';
	elseif	in_status	=6	then
		#审核失败
		set out_ret = 6;
		set out_desc = '处理审核失败';
	end	if;
	set	@bAmount	=	0;
	set	@aRate	=	0;
	set	@deadline	=	0;
	set	@isDayThe	=	1;
	set	@paymentMode	=	1;
	select borrowAmount, annualRate,	deadline, isDayThe,	paymentMode	into	@bAmount,	@aRate,	@deadline,	@isDayThe,
	@paymentMode	from t_borrow where id = in_bid;
	set	out_amount	=	ifnull(@bAmount,0);
	set	out_annualrate	=	ifnull(@aRate,0);
	set	out_deadline	=	ifnull(@deadline,0);
	set	out_isdaythe	=	ifnull(@isDayThe,1);
	set	out_payment_mode	=	ifnull(@paymentMode,1);
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_autobid
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_autobid`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_autobid`(OUT `out_ret` int,OUT `out_desc` varchar(255))
BEGIN
		
	declare b_id bigint default 0; #借款ID
	declare borrow_Amount decimal(18,4) default 0.00;#借款金额
	declare hasInvest_Amount decimal(18,4) default 0.00;
 	declare borrow_Way  int default 0;
	declare isday_the int default 0;
 
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	
	declare _error int default 0;
	declare exit handler for sqlexception set  _error = 1;
	#创建临时表
	drop  table  if exists temp_autobid_table;
	create  temporary table temp_autobid_table( id int,deadline int, borrowAmount decimal(18,4), hasInvestAmount decimal(18,4),credit varchar (255) ,borrowWay int ,isDayThe int ,autoBidEnableTime varchar(255) );
	insert into autobid_table select  a . id , a . deadline  , a . annualRate  e , a . borrowAmount  , a . hasInvestAmount  , f_credit_rating ( b . creditrating ) , a . borrowWay   , a . isDayThe  , a . autoBidEnableTime   from ( t_borrow   a  left join  t_user   b  on(( a . publisher  =  b . id ))) where ((round(( a . hasInvestAmount  /  a . borrowAmount ),2) < 0.95) and ( a . borrowWay  <> 2) and ( a . borrowStatus  = 2) and ( a . autoBidEnableTime  is not null)) order by  a . id ;
	#得到所有投标精度低于95%的借款
	select ifnull(id,0),borrowAmount,hasInvestAmount,borrowWay,isDayThe 
	into  b_id,borrow_Amount,hasInvest_Amount ,borrow_Way ,isday_the  
	from temp_autobid_table ORDER BY id LIMIT 0,1;
	
	start transaction ;
	_return1:while b_id >0 do 
			#创建临时表 临时用于装载设置了自动投标的用户
			drop table if exists temp_auto_user;
			create temporary table temp_atuo_user(userId bigint);
			insert into temp_auto_user	select userId from t_automaticbid  where  bidSetTime is not null and bidStatus =2 order by bidSetTime  asc;
			
			select ifnull(userId,0) into @temp_userId from temp_auto_user order by userId limit 0,1;
			_return2:while @temp_userId >0 do 
					# 如果该借款是发布者的标,则发布者不能投标,用户自动排队到后面
					select ifnull(id,0) into @temp_id from t_borrow where id= b_id and publisher= @temp_userId;
					if  id<=0  then 
						#是发布者的标,退出本次投标,用户自动排队到后面
						update t_automaticbid set bidSetTime = now() where userId = @temp_userId;
						delete from temp_auto_user where userId = @temp_userId;
						select ifnull(userId,0) into @temp_userId from temp_auto_user order by userId limit 0,1;
						leave _return2;
				end if;
		
				select rateStart,rateEnd,deadlineStart,deadlineEnd,creditStart,creditEnd,bidAmount,remandAmount,ifnull(borrowWay,0) 
				into @rateStart ,@rateEnd,@deadlineStart,@deadlineEnd ,@creditStart,@creditEnd,@bidAmount,@remandAmount,@borrow_Way from t_automaticbid  where userId = @temp_userId;
			#判断是不是天标
			if isday_the =2 then 
							 if @deadLineStart < 0 then  #是天标 将期限改成天
									  select ABS(@deadlineStart) into @deadlineStart;
									  select ABS(@deadlineEnd ) into @deadlineEnd;
								end if;
				end if;
			
			#判断用户是否设置自动投标
				if @borrowWay <> 0 then 
						#查询用户已经投标的标的
						select ifnull(id,0) into @t_auto_id from t_automaticbid_user  where borrowId=b_id  and userId= @temp_userId;
						if @t_atuo_id > 0  then
								update t_automaticbid set bidSetTime = now()  where userId = @temp_userId;
								delete from temp_auto_user where userId = @temp_userId;
								select ifnull(userId,0) into @temp_userId from temp_auto_user order by userId limit 0,1;
								leave _return2; #跳出本次循环，进入下次循环
						end if;
						#用户设置的借款类型
						if @borrowWay in (@borrow_Way) then 
								#获取投标的标的
								select ifnull(id,0) into @t_ids from ( select  a . id , a . deadline  , a . annualRate  e , a . borrowAmount  , a . hasInvestAmount  , f_credit_rating ( b . creditrating ) , a . borrowWay   , a . isDayThe  , a . autoBidEnableTime   from ( t_borrow   a  left join  t_user   b  on(( a . publisher  =  b . id ))) where ((round(( a . hasInvestAmount  /  a . borrowAmount ),2) < 0.95) and ( a . borrowWay  <> 2) and ( a . borrowStatus  = 2) and ( a . autoBidEnableTime  is not null)) order by  a . id )s 
								where annualRate>=@rateStart and annualRate<=@rateEnd and deadline>=@deadLineStart and deadline<=@deadLineEnd and credit >= @creditStart and credit<= @creditEnd and id= b_id;
							#if @t_ids >0 then 
										
							#end if;
						end if;
			end if;
			end while;
  end while; #当b_id<=0时退出被循 )
	commit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_cancel
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_cancel`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_cancel`(IN `in_bid` bigint,IN `in_aid` bigint,IN `in_status` int,IN `in_audit_opinion` varchar(2048),IN `in_basepath` varchar(100), out out_ret int, out out_desc varchar(100))
_return:begin 
	declare	t_freeze_amount	decimal(18,2) default	0;	#冻结金额
	declare t_content varchar(1024)	default	'';	#信息
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
 
	set	@borrowId	=	-1;
  set	@bStatus = -1;
	set	@borrowAmount	=	0;
	set	@hasInvestAmount	=	0;
	set	@borrowWay	=	1;
	set	@frozen_margin	=	0;
	set	@publisher	=	-1;
	set	@annualRate	=	0;
	set	@borrowTitle	=	'';
	set	@paymentMode	=	1;
	set	@version	=	0;	#版本控制
	set @feelog = null;
	select id,	borrowStatus,	borrowAmount,	hasInvestAmount,	borrowWay,	paymentMode,	frozen_margin,	publisher,	annualRate,	borrowTitle,
	version ,feelog ,nid_log	into	@borrowId,	@bStatus,	@borrowAmount,@hasInvestAmount,	@borrowWay,	@paymentMode,	@frozen_margin,	@publisher,	@annualRate,
	@borrowTitle,	@version,@feelog ,@t_nid_log	from t_borrow where id = in_bid;
	set	@borrowId	=	ifnull(@borrowId,-1);
	set	@bStatus = ifnull(@bStatus,-1);
	set	@borrowAmount	=	ifnull(@borrowAmount,0);
	set	@hasInvestAmount	=	ifnull(@hasInvestAmount,0);
	set	@borrowWay	=	ifnull(@borrowWay,1);
	set	@frozen_margin	=	ifnull(@frozen_margin,0);
	set	@publisher	=	ifnull(@publisher,-1);
	set	@paymentMode	=	ifnull(@paymentMode,-1);
	if	@borrowId	=	-1	then
		set out_ret = -2;
		set out_desc = '编号不存在';
		leave _return;
	end	if;
	if	in_status	<>	6	then
		set out_ret = -3;
		set out_desc = '撤消状态无效';
		leave _return;
	end	if;
	#状态(1 初审中  2 招标中 3 复审中 4还款中 5已还完 -1 未知状态)
	if	@bStatus	=	-1	then
		set out_ret = -4;
		set out_desc = '未知状态';
		leave _return;
	end	if;
	if	@bStatus	=	4 then
		set out_ret = -5;
		set out_desc = '该笔借款正在还款中';
		leave _return;
	end	if;
	if	@bStatus	=	5 then
		set out_ret = -6;
		set out_desc = '该笔借款已还完';
		leave _return;
	end	if;
	if	@bStatus	=	6 then
		set out_ret = -7;
		set out_desc = '该笔借款已流标';
		leave _return;
	end	if;
	if	@borrowWay	=	6 then
		if	@bStatus	>	1	then
			set out_ret = -8;
			set out_desc = '流转标不可撤消';
			leave _return;
		end	if;
	end	if;
	start	transaction;
		#并发处理
		update t_borrow set version	=	version	+	1	where id = in_bid	and version	=	@version;
		set out_ret = ROW_COUNT();	
		if	out_ret	<=0	then
			rollback;	
			set out_ret = -9;
			set out_desc = '撤消失败';
			leave _return;
		end	if;
 
		#更新借款状态
		update t_borrow set borrowStatus	=	6,	sort	=	0 where id	=	in_bid;
	
		if	@bStatus	in(1,2,3)	then
			if	@borrowWay	=	2	then
				
				select locan_fee into @bfeerate_one
			from t_borrow_type_log  where identifier = @t_nid_log;
			#	select  f_parsing_json(@t_feelog,'borrowFeeRateOne') into @bfeerate_one ;
				
				set	@fee	=	@borrowAmount*(((@annualRate*0.01)/12.0)+@bfeerate_one/100);
				#set	@fee	=	@borrowAmount*((@annualRate*0.01)/12.0);
				if	@fee	>	0	then
					set	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
					set	t_content	=	concat('秒还借款[',	t_content,	']已撤消,');
					set	t_content	=	concat(t_content,	f_moneyDecode(105),	'[',round(@fee,2),']元');
					#解冻秒还冻结资金
					update t_user set usableSum = usableSum	+	@fee,	freezeSum	=	freezeSum	-	@fee	where id	=	@publisher;
					insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
					trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,borrow_id)	select @publisher, now(), 105, f_moneyDecode(105), @fee,
					(a.usableSum) as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
					0,-1, t_content, 0, in_bid, '', 0, @fee,@borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = @publisher group by a.id;
				end	if;
				if	@borrowWay	=	6	then
						update t_borrow set circulationStatus	=	3  where id	=	in_bid;
				end if;
		end	if;
			if	@frozen_margin	>	0	then
				set	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
				set	t_content	=	concat('借款[',	t_content,	']已撤消,');
				set	t_content	=	concat(t_content,	f_moneyDecode(104),	'[',@frozen_margin,']元');
				#返还发布借款时的冻结金额
				update t_user set usableSum = usableSum	+	@frozen_margin,	freezeSum	=	freezeSum	-	@frozen_margin	where id	=	@publisher;
				insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				dueoutSum,trader, remarks, oninvest, paynumber, paybank, cost,income,borrow_id)	select @publisher, now(), 104, f_moneyDecode(104), @frozen_margin,
				(a.usableSum) as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				0,-1, t_content, 0, in_bid, '', 0, @frozen_margin,@borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = @publisher group by a.id;
			end	if;
			set	@t_payment_mode = case	@borrowWay	
														when	1	then	'净值借款'
														when	2	then	'秒还借款'
														when	3	then	'普通借款'
														when	4	then	'实地考察借款'		
														when	5	then   '机构担保借款'
														when	6	then   '流转标借款'
														else	''	end;
			set	t_mail_template	=	f_get_notice_template('borrow_over');
			set	t_mail_template = replace(t_mail_template,	'秒还', @t_payment_mode);
			set	t_mail_template = replace(t_mail_template,	'title', @borrowTitle);
			set	t_email_template	=	f_get_notice_template('e_borrow_over');
			set	t_email_template = replace(t_email_template,	'秒还', @t_payment_mode);
			set	t_email_template = replace(t_email_template,	'title', @borrowTitle);
			#插入通知任务
			set	@username	=	'';
			set	@email	=	'';
			set	@telphone	=	'';
			select a.cellphone,	b.username,	b.email	into	@telphone,	@username,	@email from	 t_user	b left	join
			t_person	a	on	a.userId	=	b.id	where	b.id	=	@publisher;
			set	t_sms_template	=	f_get_notice_template('s_borrow_over');
			set	t_sms_template = replace(t_sms_template,'username', @username);
			set	t_sms_template = replace(t_sms_template,'date',now());
			set	t_sms_template = replace(t_sms_template,'秒还', @t_payment_mode);
			set	t_sms_template = replace(t_sms_template,'title', @borrowTitle);
			if @borrowWay in (1,2,6) then
				set	t_sms_template = replace(t_sms_template,'borrowAmount', '0');		
				set	t_email_template = replace(t_email_template,'borrowAmount', '0');	
				set	t_mail_template = replace(t_mail_template,'borrowAmount', '0');	
				if @borrowWay = 2 then
					set	t_email_template = replace(t_email_template,	'fee', round(@frozen_margin+@fee,2));
					set	t_sms_template = replace(t_sms_template,'fee',round(@frozen_margin+@fee,2));	
					set	t_mail_template = replace(t_mail_template,	'fee', round(@frozen_margin+@fee,2));
				ELSE
					set	t_email_template = replace(t_email_template,	'fee', round(@frozen_margin,2));
					set	t_sms_template = replace(t_sms_template,'fee',round(@frozen_margin,2));	
					set	t_mail_template = replace(t_mail_template,	'fee', round(@frozen_margin,2));
				end if;
				 
			else
					set	t_sms_template = replace(t_sms_template,'borrowAmount', @borrowAmount);		
					set	t_email_template = replace(t_email_template,'borrowAmount', @borrowAmount);	
					set	t_mail_template = replace(t_mail_template,'borrowAmount', @borrowAmount);	
					set	t_mail_template = replace(t_mail_template,	'fee', @frozen_margin);
					set	t_email_template = replace(t_email_template,	'fee', @frozen_margin);
					set	t_sms_template = replace(t_sms_template,'fee', @frozen_margin);	
					#修改可用额度
					update  t_user set usableCreditLimit = usableCreditLimit + @borrowAmount where  id = @publisher;
			end if ;
			insert	into	t_notice_task(user_id,sendtitle,s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
			values(@publisher,	'借款撤消报告','capitalChangeEnable',@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_bid,	now(),	'borrow');
			
			#处理投资人的资金变动
			set	@ret	=	-10;
			set	@ret_desc	=	'执行失败';
			call p_invest_action(in_bid,	-1,	3,	1,	0,	0, @borrowAmount,	0,	'',	'',	0,	0,	0,	0,	0, 0,	in_basepath,	@ret,	@ret_desc);
			if	@ret	<	0	then
				rollback;	
				set out_ret = @ret;
				set out_desc = @ret_desc;
 
				leave _return;
			end	if;
	end	if;
	if	_error	<>	0	then
	rollback; 
		set out_ret = -11;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_deal_fullscale
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_deal_fullscale`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_deal_fullscale`(IN `in_bid` BIGINT,IN `in_aid` BIGINT,IN `in_status` BIGINT,IN `in_auth_time` DATETIME,IN `in_audit_opinion` VARCHAR(2048),IN `in_identify` VARCHAR(200),IN `in_basepath` VARCHAR(100),IN `in_ifeerate` DECIMAL(18,6), OUT out_ret INT, OUT out_desc VARCHAR(100))
_return:BEGIN
	DECLARE	t_excitation_sum	DECIMAL(18,4) DEFAULT	0;	#奖励
	DECLARE t_b_mfee	DECIMAL(18,4)	DEFAULT	0;	#借款手续费
	DECLARE	t_real_amount	DECIMAL(18,4)	DEFAULT	0;	#投标金额
	DECLARE	t_repay_period	VARCHAR(50)	DEFAULT	'';	#还款期数
	DECLARE	t_repay_date	VARCHAR(50)	DEFAULT	'';	#还款日期
	DECLARE	t_still_principal	DECIMAL(18,4)	DEFAULT	0;	#应还本金
	DECLARE	t_still_interest	DECIMAL(18,4)	DEFAULT	0;	#应还利息
	DECLARE	t_principal_balance	DECIMAL(18,4)	DEFAULT	0;	#剩余本金
	DECLARE	t_interest_balance	DECIMAL(18,4)	DEFAULT	0;	#剩余利息
	DECLARE	t_mrate	DECIMAL(18,4)	DEFAULT	0;	#月利率
	DECLARE	t_total_sum	DECIMAL(18,4)	DEFAULT	0;#本息余额
	DECLARE	t_total_amount	DECIMAL(18,4)	DEFAULT	0;#还款总额
	DECLARE t_repay_id	BIGINT	DEFAULT	-1;	#还款id
	DECLARE t_risk_amount	DECIMAL(18,4)	DEFAULT 0;	#风险保障金
	DECLARE	t_resource	VARCHAR(50)	DEFAULT '';	#风险保障金来源
	DECLARE t_content VARCHAR(1024)	DEFAULT	'';	#信息
	DECLARE	t_mail_template	VARCHAR(2048)	DEFAULT	'';	#站内信模版
	DECLARE	t_email_template	VARCHAR(2048)	DEFAULT	'';	#邮件模版
	DECLARE	t_sms_template	VARCHAR(2048)	DEFAULT	'';	#短信模版
	DECLARE	t_payment_mode	VARCHAR(100)	DEFAULT	'';	#还款方式
	DECLARE	t_invest_fee	DECIMAL(18,4)	DEFAULT	0;	#投资手续费
	DECLARE	t_date	VARCHAR(20)	DEFAULT	'';	#日期
	DECLARE	t_other	VARCHAR(100)	DEFAULT	'';	#其他
	DECLARE	_error	INT	DEFAULT	0;	#异常标记
	
	
	#-------------修复资金定义--------------------------
	declare t_repairPrincipal decimal(18,4) default 0;
	 
	declare t_repairInterest decimal(18,4) default 0;
	 
	declare t_comparePrincipal decimal(18,4) default 0;
	declare t_compareInterest decimal(18,4) default 0;
	 
	declare t_repairCount int default 0;
	 
	declare t_repairId bigint default -1;
	 
	declare t_updateCount int default 0;
	 
	declare t_updatePrincipal decimal(18,4) default 0;
	 
	declare t_updateInterest decimal(18,4) default 0;
	declare t_maxRepaymentId  bigint default -1;
	declare t_repaymentCount  bigint default -1;
	declare t_invest_repaymentCount  bigint default -1;
	 
	 
	 declare  _done int default 0; 
	 
	declare cursor_name cursor for (select id,stillPrincipal,stillInterest from t_repayment where borrowId = in_bid);
	  
	declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
  
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error	=	1;	#sqlexception返回值
	
	SET out_ret = -1;
	SET out_desc = '执行失败';
	SET @ret = -2;
	SET @ret_desc = '校验失败';
	#再次校验审核处理
	CALL p_borrow_auth_fullscale(in_bid, in_status, @ret,@ret_desc, @a, @b, @c, @d,@e);
	IF @ret <=	0 THEN
		SET out_ret = @ret;
		SET out_desc = @ret_desc;
		LEAVE _return;
	END IF;
	SELECT	totalSum,	totalAmount,	stillInterest,stillPrincipal,	mRate	,repayPeriod,repayDate,principalBalance,interestBalance
	INTO	@total_sum,	@total_amount,	@still_interest,@stillPrincipal,@rmate,@repayPeriod,@repayDate,@principalBalance,@interestBalance
	FROM t_pre_repayment	WHERE	identify	=	in_identify	LIMIT	0,1;
	SET	t_total_sum	=	IFNULL(@total_sum,0);
	SET	t_total_amount	=	IFNULL(@total_amount,0);
	SET	t_still_interest	=	IFNULL(@still_interest,0);
	SET	t_mrate	=	IFNULL(@rmate,0);
	SET t_still_principal  =  IFNULL(@stillPrincipal,0);
	SET t_repay_period  =  @repayPeriod;
	SET t_repay_date  =  @repayDate;
	SET t_principal_balance  =  IFNULL(@principalBalance,0); 
	SET	t_interest_balance  =  IFNULL(@interestBalance,0);
	SET	@publisher	=	-1;	#借款人
	SET	@borrowTitle	=	'';	#借款标题
	SET	@annualRate	=	0;	#年利率
	SET	@paymentMode	=	1;	#还款方式
	SET	@borrowAmount	=	0;	#借款金额
	SET	@deadline	=	1;	#借款期限
	SET	@borrowWay	=	1;	#借款类型
	SET	@excitationType	=	1;	#奖励类型
	SET	@excitationSum	=	0;	#奖励金额
	SET	@isDayThe	=	0;	#标的类型天标、月标
	SET	@username	=	'';	#用户名
	SET	@frozen_margin	=	0;	#冻结资金
	SET	@version	=	0;	#版本控制
	SET	@nid_log	=	0;	#标的种类
	SELECT  a.publisher,	a.borrowTitle,	a.annualRate,	a.paymentMode,	a.borrowAmount,	a.deadline,	a.borrowWay,	a.excitationType,
	a.excitationSum,	a.isDayThe,	b.username,	a.frozen_margin,	a.version ,nid_log INTO 	@publisher,	@borrowTitle,	@annualRate,	@paymentMode,
	@borrowAmount,	@deadline,	@borrowWay,	@excitationType,	@excitationSum,	@isDayThe,	@username,	@frozen_margin,	@version,@nid_log
	FROM t_borrow a LEFT JOIN t_user b ON a.publisher	=	b.id WHERE a.id	=	in_bid;
	SET	@publisher	=	IFNULL(@publisher,-1);
	SET	@annualRate	=	IFNULL(@annualRate,0);
	SET	@paymentMode	=	IFNULL(@paymentMode,1);
	SET	@borrowAmount	=	IFNULL(@borrowAmount,0);
	SET	@deadline	=	IFNULL(@deadline,1);
	SET	@borrowWay	=	IFNULL(@borrowWay,1);
	SET	@excitationType	=	IFNULL(@excitationType,1);
	SET	@excitationSum	=	IFNULL(@excitationSum,0);
	SET	@isDayThe	=	IFNULL(@isDayThe,1);
	SET	@frozen_margin	=	IFNULL(@frozen_margin,0);
	SET	@version	=	IFNULL(@version,0);
	IF	@borrowWay	NOT	IN(1,2,3,4,5,6)	THEN
		SET out_ret = -3;
		SET out_desc = "未知标的类型";
		LEAVE _return;
	END	IF;
	START TRANSACTION;	#主函数中设置事务为手动提交，次函数不要设置也不要commit
 
		#并发判断处理
		UPDATE t_borrow SET VERSION	=	VERSION	+	1	WHERE id = in_bid AND borrowStatus	= 3	AND VERSION	=	@version;
		SET @ret_update = ROW_COUNT();
		IF @ret_update = 0 THEN
			ROLLBACK;
			SET out_ret = -4;
			SET out_desc = '复审失败';
			LEAVE _return;
		END IF;
		#处理审核通过
		IF	in_status	=	4	THEN
			#更新借款状态
			UPDATE t_borrow SET borrowStatus	=	in_status,	auditTime	=	in_auth_time 	WHERE id = in_bid AND borrowStatus	= 3;
			#计算奖励
			IF	@excitationType	=	2	THEN
				SET	t_excitation_sum	=	@excitationSum;	
			ELSEIF	@excitationType	=	3	THEN
				SET	t_excitation_sum	=	@borrowAmount*@excitationSum*0.01;
			ELSE	
				SET	t_excitation_sum	=	0;
			END	IF;
/**
			#初始化手续费
			SET	@borrowFeeRate	=	0;
			IF	@deadline	<=	2	THEN
				SET	@borrowFeeRate	=	0.02;
			ELSE
				SET	@borrowFeeRate	=	0.02	+	(@deadline-2)*0.002;
			END	IF;
			#计算借款手续费(@isDayThe 1 月标 2 天标)
	  	SELECT locan_fee,locan_month,locan_fee_month,day_fee INTO @locan_fee,@locan_month,@locan_fee_month,@day_fee FROM t_borrow_type_log  WHERE identifier = @nid_log;
			IF @isDayThe =2 THEN 
				SET @borrowFeeRate = (@day_fee / 365)/100;
			ELSE 
				 IF @deadline > @locan_month THEN 
					SET @borrowFeeRate = (@locan_fee + (@deadline - @locan_month) * @locan_fee_month)/100;
				 ELSE 
					SET @borrowFeeRate =  @locan_fee /100;
					END IF;
			END IF;
*/
			#计算借款手续费
			select costAmount into @platUseFee from t_borrow_manage_fee  where  costType = 1 and borrowId = in_bid;
			select costAmount into @borrowFee from t_borrow_manage_fee  where costType = 2 and borrowId = in_bid;
			select costAmount into @borrowManageFee from t_borrow_manage_fee  where costType = 3 and borrowId = in_bid;
			select costAmount into @InstGuaranteeFee from t_borrow_manage_fee  where costType = 4 and borrowId = in_bid;
 
			#SET	t_b_mfee	=	@borrowAmount * @borrowFeeRate;
			SET	t_b_mfee	=	(@platUseFee + @borrowFee + @borrowManageFee + @InstGuaranteeFee); #平台使用费+借款手续费+借款管理费+机构担保费
			SET	t_real_amount	=	@borrowAmount	-	t_b_mfee	-	t_excitation_sum;
			IF	t_b_mfee > 0	THEN
				SET t_risk_amount = t_b_mfee;
				SET t_resource="借款管理费";
				INSERT INTO t_risk_detail(riskBalance,	riskInCome,	riskDate,	riskType,	resource,	trader,	borrowId) 
				SELECT riskBalance+t_risk_amount,	t_risk_amount,	NOW(),	'收入',	t_resource,	@publisher,	in_bid FROM t_risk_detail WHERE id=(select MAX(b.id) from t_risk_detail b);
 
			END	IF; 
		
			#生成还款记录
			INSERT	INTO	t_repayment(repayPeriod,	stillPrincipal,	stillInterest,	borrowId,	principalBalance,
			interestBalance,	repayDate,	identify) SELECT repayPeriod,	stillPrincipal,	stillInterest,	borrowId,	principalBalance,
			interestBalance,	repayDate,	identify FROM t_pre_repayment WHERE identify	=	in_identify ORDER BY sort ASC;
			#生成投资收款记录
			INSERT	INTO	t_invest_repayment(repayId,	repayPeriod,	repayDate,	recivedPrincipal,	recivedInterest, 
			principalBalance,	interestBalance,	invest_id,`owner`,	ownerlist,	iManageFee,	iManageFeeRate,borrow_id)
			SELECT b.id,	b.repayPeriod,	b.repayDate,	((a.investAmount/@borrowAmount)	*	b.stillPrincipal),
			((a.investAmount/@borrowAmount)	*	b.stillInterest),	((a.investAmount/@borrowAmount)	*	b.principalBalance),
			((a.investAmount/@borrowAmount)	*	b.interestBalance),	a.id,	a.investor,	a.investor,
			(((a.investAmount/@borrowAmount)	*	b.stillInterest)	*	in_ifeerate),	in_ifeerate ,b.borrowId FROM t_invest a LEFT JOIN t_repayment b 
			ON a.borrowId = b.borrowId WHERE b.id IS NOT NULL AND a.circulationForpayStatus = -1 AND b.borrowId = in_bid; 
			#纠偏投资应收款明细资金
			UPDATE t_invest_repayment t1,(SELECT c.minId,	(a.stillPrincipal-b.recivedPrincipal) check_principal,	(a.stillInterest-b.recivedInterest) check_interest
			FROM (SELECT id,	repayPeriod,	stillPrincipal,	stillInterest	FROM t_repayment	WHERE borrowId	=	in_bid) a LEFT JOIN (SELECT a.repayId,
			SUM(a.recivedPrincipal) recivedPrincipal,	SUM(a.recivedInterest) recivedInterest FROM t_invest_repayment a WHERE a.borrow_id	=	in_bid	GROUP BY a.repayId)
			b ON a.id	=	b.repayId LEFT JOIN (SELECT MIN(a.id) minId,a.repayId FROM t_invest_repayment a WHERE a.borrow_id	=	in_bid	GROUP BY a.repayId) c ON 
			b.repayId=c.repayId) t2 SET	t1.recivedPrincipal	=	t1.recivedPrincipal	+	t2.check_principal,	t1.recivedInterest	=	t1.recivedInterest	+	t2.check_interest
			WHERE t1.id = t2.minId;
			#处理投资应收款
			UPDATE t_invest	a,(SELECT invest_id,SUM(recivedInterest) AS recivedInterest FROM t_invest_repayment a WHERE a.borrow_id	=	in_bid	GROUP BY a.invest_id) b
			SET a.check_principal = a.realAmount, a.check_interest = b.recivedInterest WHERE a.id = b.invest_id;
			
			#纠偏投资收款
			UPDATE t_invest a,(SELECT MAX(a.id) max_id,a.invest_id FROM t_invest_repayment a	WHERE a.borrow_id	=	in_bid	GROUP BY
			a.invest_id) b SET a.max_invest_id = b.max_id WHERE a.id=b.invest_id;
			UPDATE t_invest a,(SELECT a.invest_id,	SUM(a.recivedPrincipal) recivedPrincipal FROM t_invest_repayment a WHERE a.borrow_id	=	in_bid
			GROUP BY a.invest_id) b SET a.adjust_principal = b.recivedPrincipal WHERE a.id=b.invest_id;
			UPDATE t_invest_repayment	t1,(SELECT (check_principal-adjust_principal)	check_principal,max_invest_id	FROM	t_invest	WHERE	borrowId	=	in_bid)	t2 
			SET	recivedPrincipal	=	recivedPrincipal	+	check_principal	WHERE t1.id = t2.max_invest_id;
	
			#纠偏投资管理费
			#update t_invest_repayment set iManageFee = recivedInterest*in_ifeerate;
			UPDATE t_invest_repayment SET iManageFee = recivedInterest*in_ifeerate WHERE borrow_id = in_bid;
			
			#处理借款人的资金变动
			IF	@borrowWay	=	2	THEN
				SET	@fee	=	@borrowAmount*(((@annualRate*0.01)/12.0)+@borrowFeeRate);
				IF	@fee	>	0	THEN
					SET	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
					SET	t_content	=	CONCAT('秒还借款[',	t_content,	']复审通过,');
					SET	t_content	=	CONCAT(t_content,	f_moneyDecode(105),	'[',ROUND(@fee,2),']元');
					
					#解冻秒还冻结资金
					UPDATE t_user SET usableSum = usableSum	+	@fee,	freezeSum	=	freezeSum	-	@fee	WHERE id	=	@publisher;
					INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
					trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost , income,borrow_id)	SELECT @publisher, NOW(), 105, f_moneyDecode(105), @fee,
					a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
					-1,0, t_content, 0, in_bid, '', 0 , @fee,b.borrowId	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor  WHERE a.id = @publisher GROUP BY a.id;
				END	IF;
			END	IF;
			IF	@frozen_margin	>	0	THEN
				SET	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
				SET	t_content	=	CONCAT('借款[',	t_content,	']复审通过,');
				SET	t_content	=	CONCAT(t_content,	f_moneyDecode(104),	'[',ROUND(@frozen_margin,2),']元');
				#返还发布借款时的冻结金额
				UPDATE t_user SET usableSum = usableSum	+	@frozen_margin,	freezeSum	=	freezeSum	-	@frozen_margin	WHERE id	=	@publisher;
				INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost ,income,borrow_id)	SELECT @publisher, NOW(), 104, f_moneyDecode(104), ROUND(@frozen_margin),
				a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				-1,0, t_content, 0, in_bid, '', 0 , ROUND(@frozen_margin),b.borrowId 	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @publisher GROUP BY a.id;
			END	IF;
			IF	@borrowAmount	>	0	THEN
				SET	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
				SET	t_content	=	CONCAT('借款[',	t_content,	']复审通过,');
				SET	t_content	=	CONCAT(t_content,	f_moneyDecode(101),	'筹到资金[',@borrowAmount,']元');
				#借款成功
				UPDATE t_user SET usableSum = usableSum	+	@borrowAmount	WHERE id	=	@publisher;
				INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,borrow_id)	SELECT @publisher, NOW(), 101, f_moneyDecode(101), @borrowAmount,
				a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				-1,0, t_content, 0, in_bid, '', 0 , @borrowAmount,b.borrowId	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @publisher GROUP BY a.id;
			END	IF;
			IF	t_b_mfee	>	0	THEN
				SET	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
				SET	t_content	=	CONCAT('借款[',	t_content,	']复审通过,');
				SET	t_content	=	CONCAT(t_content,	f_moneyDecode(601),	'[',ROUND(t_b_mfee,2),']元');
				#扣除借款人借款管理费
				UPDATE t_user SET usableSum = usableSum	-	t_b_mfee	WHERE id	=	@publisher;
				INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost , spending,borrow_id)	SELECT @publisher, NOW(), 601, f_moneyDecode(601), t_b_mfee,
				a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				-1,0, t_content, 0, in_bid, '', 0 ,t_b_mfee,b.borrowId 	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @publisher GROUP BY a.id;
				#更新借款管理费
				UPDATE t_borrow SET manageFee	=	t_b_mfee	WHERE id = in_bid;
			END	IF;
			IF	t_excitation_sum	>	0	THEN
				SET	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
				SET	t_content	=	CONCAT('借款[',	t_content,	']复审通过,');
				SET	t_content	=	CONCAT(t_content,	f_moneyDecode(751),'[',ROUND(@fee,2),']元');
				#扣除借款奖励
				UPDATE t_user SET usableSum = usableSum	-	t_excitation_sum WHERE id	=	@publisher;
				INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost, spending,borrow_id)	SELECT @publisher, NOW(), 751, f_moneyDecode(751), t_excitation_sum,
				a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				-1,0, t_content, 0, in_bid, '', 0 ,t_excitation_sum,b.borrowId	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @publisher GROUP BY a.id;
			END	IF;
			SET	@ret	=	-7;
			SET	@ret_desc	=	'处理投资人资金失败';
			CALL p_invest_action(in_bid,	-1,	2,	1,	0,	@borrowWay,	@borrowAmount,	in_ifeerate,	t_repay_period,	in_auth_time,	t_still_principal,
			t_still_interest,	t_principal_balance,	t_interest_balance,	t_excitation_sum,	FORMAT(t_mrate,2),	in_basepath,	@ret,	@ret_desc);
			IF	@ret	<	0	THEN
				ROLLBACK;	
				SET out_ret = @ret;
				SET out_desc = CONCAT('p_invest_action:',@ret_desc);
				LEAVE _return;
			END	IF;
			
			
			#--------------------------------------------------------------资金纠偏-------------------------------
IF	@isDayThe	=	1	THEN
	#-- 资金修正开始-wbb 2014-12-9-------
	 UPDATE t_invest set recievedInterest=TRUNCATE(recievedInterest,2) where borrowId=in_bid;
	set _done = 0;
		
	 
	open cursor_name;
	fetch cursor_name into t_repairId,t_repairPrincipal,t_repairInterest;-- !!
	while _done <> 1 do
	select sum(recivedPrincipal),sum(recivedInterest),count(1) into t_comparePrincipal,t_compareInterest,t_repairCount from t_invest_repayment where repayId = IFNULL(t_repairId,-1);
	set t_repairPrincipal = IFNULL(t_repairPrincipal,0);
	 
	set t_repairInterest = IFNULL(t_repairInterest,0);
	 
	set t_comparePrincipal = IFNULL(t_comparePrincipal,0);
	 
	set t_compareInterest = IFNULL(t_compareInterest,0);
	 
	set t_repairCount = IFNULL(t_repairCount,0);
	 
	select id into t_updateCount from t_invest_repayment where repayId = IFNULL(t_repairId,-1) order by id desc limit 1;
	select id into t_maxRepaymentId from t_repayment where borrowId = in_bid  order by id desc limit 1;
	select COUNT(1) into t_repaymentCount from t_repayment where borrowId = in_bid ;
	SELECT COUNT(1) into t_invest_repaymentCount from t_invest_repayment where borrow_id=in_bid ;
	IF t_repaymentCount>1 THEN
	#分期还款
			IF t_maxRepaymentId = t_repairId and t_repairCount>1 THEN
						call  p_borrow_deal_full_invest(in_bid,t_repairId,@ret,	@ret_desc);
						if @ret < 0 then  #操作不成功回滚处理
													rollback;
													set out_ret = -8;
													set out_desc = '纠正投资人金额出错';
													leave _return;
											end if;
			END IF;
			 
			if  t_repairCount>1 then 
			 
			-- set t_updateCount = (t_repairCount - 1);
			 
			select sum(recivedPrincipal) into t_updatePrincipal from t_invest_repayment where repayId = IFNULL(t_repairId,-1) and id != t_updateCount;-- t_updateCount
			 
			update t_invest_repayment set recivedPrincipal = t_repairPrincipal - t_updatePrincipal where repayId = IFNULL(t_repairId,-1) and id=t_updateCount;
			 
			end if;
			 
			if t_repairCount>1 then 
			 
			#-- set t_updateCount = (t_repairCount - 1);
			 
			select sum(recivedInterest) into t_updateInterest from t_invest_repayment where repayId = IFNULL(t_repairId,-1) and id != t_updateCount;-- t_updateCount
			 
			update t_invest_repayment set recivedInterest = t_repairInterest - t_updateInterest where repayId = IFNULL(t_repairId,-1) and id=t_updateCount;
			 
			end if;
	end IF;
	IF t_repaymentCount=1 THEN
	#一次性还款
			if t_invest_repaymentCount>1 THEN
				#多人投资
					select sum(recivedInterest) into t_updateInterest from t_invest_repayment where repayId = IFNULL(t_repairId,-1) and id != t_updateCount;
					update t_invest_repayment set recivedInterest = t_repairInterest - t_updateInterest where repayId = IFNULL(t_repairId,-1) and id=t_updateCount;
			END if ;
	END IF;
			 
	set _done = 0;
	fetch cursor_name into t_repairId,t_repairPrincipal,t_repairInterest;
	 
	end while;
	close cursor_name;
	UPDATE t_invest a, (select invest_id, sum(recivedInterest) as sum,sum(recivedPrincipal) as sumPrincipal from t_invest_repayment where borrow_id=in_bid group by invest_id) b set a.recievedInterest = b.sum,a.check_interest = b.sum where a.id = b.invest_id;
	 end if;
	call p_invest_action_inform(in_bid,2,@borrowAmount,	t_excitation_sum,	FORMAT(t_mrate,2),	in_basepath,	@ret,	@ret_desc);
				IF	@ret	<	0	THEN
					ROLLBACK;	
					SET out_ret = @ret;
					SET out_desc = CONCAT('p_invest_action_inform:',@ret_desc);
					LEAVE _return;
				END	IF;
	#-- 资金修正结束-wbb 2014-12-9-------------------
			
			#生成通知模版
			SET	t_payment_mode = CASE	@paymentMode	
														WHEN	1	THEN	'按月等额还款'
														WHEN	2	THEN	'按月先息后本'
														WHEN	3	THEN	'秒还'
														WHEN	4	THEN	'一次性'	
														ELSE	'未定义'	END;		
			SET	t_other = CASE	@paymentMode	
														WHEN	1	THEN	CONCAT('每个月将偿还金额[',	ROUND(t_total_sum,2),']元')
														WHEN	2	THEN	CONCAT('每个月将偿还利息[',	ROUND(t_still_interest,2),']元') 
														ELSE	''	END;
			SET	t_date = CASE	@isDayThe	
														WHEN	1	THEN	'个月'
														WHEN	2	THEN	'天'	
														ELSE	''	END;
			SET	t_mail_template	=	f_get_notice_template('borrow_full_success');
			SET	t_mail_template = REPLACE(t_mail_template,	'title', 	@borrowTitle);
			SET	t_mail_template = REPLACE(t_mail_template,	'borrowAmount', @borrowAmount);
			SET	t_mail_template = REPLACE(t_mail_template,	'excitationSum', ROUND(t_excitation_sum,2));
			SET	t_mail_template = REPLACE(t_mail_template,	'realAmount', ROUND(t_real_amount,2));
			SET	t_mail_template = REPLACE(t_mail_template,	'totalAmount', ROUND(t_total_amount,2));
			SET	t_mail_template = REPLACE(t_mail_template,	'mRate', t_mrate);
			SET	t_mail_template = REPLACE(t_mail_template,	'[deadline]', @deadline);
			SET	t_mail_template = REPLACE(t_mail_template,	'[yue]', t_date);
			SET	t_mail_template = REPLACE(t_mail_template,	'moshi', t_payment_mode);
			SET	t_mail_template = REPLACE(t_mail_template,	'[month]', t_other);
			SET	t_mail_template = REPLACE(t_mail_template,	'bManageFee', ROUND(t_b_mfee,2));
			SET	t_mail_template = REPLACE(t_mail_template,	'[<br/>]', '<br />');
			SET	t_email_template	=	f_get_notice_template('e_borrow_full_success');
			SET	t_email_template = REPLACE(t_email_template,	'title', @borrowTitle);
			SET	t_email_template = REPLACE(t_email_template,	'borrowAmount', @borrowAmount);
			SET	t_email_template = REPLACE(t_email_template,	'excitationSum', t_excitation_sum);
			SET	t_email_template = REPLACE(t_email_template,	'realAmount', t_real_amount);
			SET	t_email_template = REPLACE(t_email_template,	'totalAmount', t_total_amount);
			SET	t_email_template = REPLACE(t_email_template,	'mRate', t_mrate);
			SET	t_email_template = REPLACE(t_email_template,	'[deadline]', @deadline);
			SET	t_email_template = REPLACE(t_email_template,	'[yue]', t_date);
			SET	t_email_template = REPLACE(t_email_template,	'moshi', t_payment_mode);
			SET	t_email_template = REPLACE(t_email_template,	'[month]', t_other);
			SET	t_email_template = REPLACE(t_mail_template,	'bManageFee', t_b_mfee);
			SET	t_email_template = REPLACE(t_mail_template,	'[<br/>]', '<br />');
			#插入通知任务
			SET	@username	=	'';
			SET	@email	=	'';
			SET	@telphone	=	'';
			SELECT a.cellphone, b.username, b.email INTO @telphone, @username, @email FROM t_user b LEFT JOIN
			t_person a ON a.userId = b.id WHERE b.id = 	@publisher;
			SET	t_sms_template	=	f_get_notice_template('s_borrow_full_success');
			SET	t_sms_template = REPLACE(t_sms_template,	'title', @borrowTitle);
			SET	t_sms_template = REPLACE(t_sms_template,	'borrowAmount', @borrowAmount);
			SET	t_sms_template = REPLACE(t_sms_template,	'excitationSum', t_excitation_sum);
			SET	t_sms_template = REPLACE(t_sms_template,	'realAmount', t_real_amount);
			SET	t_sms_template = REPLACE(t_sms_template,	'totalAmount', t_total_amount);
			SET	t_sms_template = REPLACE(t_sms_template,	'mRate', t_mrate);
			SET	t_sms_template = REPLACE(t_sms_template,	'[deadline]', @deadline);
			SET	t_sms_template = REPLACE(t_sms_template,	'[yue]', t_date);
			SET	t_sms_template = REPLACE(t_sms_template,	'moshi', t_payment_mode);
			SET	t_sms_template = REPLACE(t_sms_template,	'[month]', t_other);
			SET	t_sms_template = REPLACE(t_sms_template,	'username', @username);
			SET	t_sms_template = REPLACE(t_sms_template,	'date', NOW());
			SET	t_sms_template = REPLACE(t_sms_template,	'bManageFee', t_b_mfee);
			SET	t_sms_template = REPLACE(t_sms_template,	'[<br/>]', '<br />');
 
			IF	@isDayThe	=	2	THEN
				SET	t_mail_template = REPLACE(t_mail_template,	'[month]', '');
				SET	t_email_template = REPLACE(t_email_template,	'[month]', '');
				SET	t_sms_template = REPLACE(t_sms_template,	'[month]', '');
			END	IF;
			INSERT	INTO	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
			VALUES(@publisher,	'借款成功报告',	'loanSucEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_bid,	NOW(),	'borrow');
			IF	@borrowWay	=	2	THEN
				#模拟秒还借款还款操作
				UPDATE t_borrow SET borrowStatus = 5,	hasInvestAmount	=	borrowAmount,	sort	=	3,	hasDeadline=deadline WHERE id =	in_bid;
				UPDATE	t_repayment	SET	hasPI	=	stillPrincipal	+	stillInterest,	repayStatus	=	2,	realRepayDate	=	in_auth_time	WHERE	borrowId	=	in_bid;
				UPDATE	t_invest_repayment	SET	realRepayDate	=	in_auth_time,	hasPrincipal	=	recivedPrincipal,	hasInterest	=	recivedInterest,
				interestOwner	=	`owner`,	repayStatus	=	2	WHERE	borrow_id	=	in_bid;
				UPDATE t_user SET usableSum =	usableSum	-	t_total_sum	WHERE	id	=	@publisher;
				SET	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');
				SET	t_content	=	CONCAT('借款[',	t_content,	']还款完成,');
				
				SET	t_content	=	CONCAT(t_content,	f_moneyDecode(604),	'[',t_total_sum,']元');
				INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
				trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost ,spending,borrow_id)	SELECT @publisher, NOW(), 604, f_moneyDecode(604), t_total_sum,
				a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
				-1,0, t_content, 0, in_bid, '', 0,t_total_sum,b.borrowId	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = @publisher GROUP BY a.id;
				#发送通知
				SET	t_mail_template	=	f_get_notice_template('repay_success');
				SET	t_mail_template = REPLACE(t_mail_template,	'title', 	@borrowTitle);
				SET	t_mail_template = REPLACE(t_mail_template,	'date', NOW());
				SET	t_mail_template = REPLACE(t_mail_template,	'totalAmount', t_total_sum);
				SET	t_email_template	=	f_get_notice_template('e_repay_success');
				SET	t_email_template = REPLACE(t_email_template,	'title', 	@borrowTitle);
				SET	t_email_template = REPLACE(t_email_template,	'date', NOW());
				SET	t_email_template = REPLACE(t_email_template,	'totalAmount', t_total_sum);
				SET	t_sms_template	=	f_get_notice_template('s_repay_success');
				SET	t_sms_template = REPLACE(t_sms_template,	'username', 	@username);
				SET	t_sms_template = REPLACE(t_sms_template,	'title', 	@borrowTitle);
				SET	t_sms_template = REPLACE(t_sms_template,	'date', NOW());
				SET	t_sms_template = REPLACE(t_sms_template,	'totalAmount', t_total_sum);
				INSERT	INTO	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
				VALUES(@publisher,	'借款还款报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_bid,	NOW(),	'borrow');
			END	IF;
		ELSEIF	in_status	=	6	THEN
			#审核失败
			#处理投资人的资金变动
			SET	@ret	=	-8;
			SET	@ret_desc	=	'处理投资人资金失败';
			CALL p_borrow_cancel(in_bid,	in_aid,	in_status,	in_audit_opinion,	in_basepath,	@ret,	@ret_desc);
			IF	@ret	<	0	THEN
				ROLLBACK;	
				SET out_ret = @ret;
				SET out_desc = CONCAT('p_borrow_cancel:',@ret_desc);
				LEAVE _return; 
			END	IF;
		END	IF;
	IF	_error	<>	0	THEN
		ROLLBACK; 
		SET out_ret = -9;
	  SET out_desc = '执行异常'; 
 
	LEAVE _return;
	ELSE	
		COMMIT;
		SET out_ret = 1;
		SET out_desc = '';
	END	IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_deal_full_invest
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_deal_full_invest`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_deal_full_invest`(IN `in_borrowId` bigint,IN `in_maxRepaymentId` bigint, out out_ret int, out out_desc varchar(100))
_return:BEGIN
	
	declare  _done int default 0; 
		declare _error int default 0;
		declare t_recivedPrincipal  decimal(18,4) default 0; #最后一笔还款的本金
		declare t_sumRecivedPrincipal  decimal(18,4) default 0; #除最后一笔还款外的本金和
 
		declare t_sumRecievedInterest  decimal(18,4) default 0; #除最后一笔还款外的利息和
		declare t_investAmount  decimal(18,4) default 0; #投资金额
		declare t_recievedInterest  decimal(18,4) default 0; #投资利息
		declare t_invest_id bigint default -1;#最后一笔还款的投资ID
		declare t_invest_repaymentId	bigint default -1;#还款明细ID
			
		declare cursor_name cursor for (select id,recivedPrincipal,invest_id from t_invest_repayment where borrow_id=in_borrowId and repayId =in_maxRepaymentId );
		declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
		declare continue handler for sqlexception set _error = 1;
		set out_ret = -1;
		set out_desc = '执行失败';
		open cursor_name;
				fetch cursor_name into t_invest_repaymentId,t_recivedPrincipal,t_invest_id;
				while _done <> 1 do
					UPDATE t_invest set recievedInterest=ROUND(recievedInterest,2) where id=t_invest_id;
	
					select SUM(recivedPrincipal),SUM(recivedInterest) into t_sumRecivedPrincipal,t_sumRecievedInterest  from t_invest_repayment where borrow_id=in_borrowId and repayId != IFNULL(in_maxRepaymentId,-1) and invest_id =t_invest_id;
					SELECT investAmount,recievedInterest into t_investAmount,t_recievedInterest from t_invest where id= t_invest_id;
				
					UPDATE t_invest_repayment set recivedPrincipal=t_investAmount-t_sumRecivedPrincipal,recivedInterest=t_recievedInterest-t_sumRecievedInterest where id=t_invest_repaymentId;
	/*
					select SUM(recivedPrincipal) into t_sumRecivedPrincipal  from t_invest_repayment where borrow_id=in_borrowId and repayId != IFNULL(in_maxRepaymentId,-1) and invest_id =t_invest_id;
					SELECT investAmount into t_investAmount from t_invest where id= t_invest_id;
				
					UPDATE t_invest_repayment set recivedPrincipal=t_investAmount-t_sumRecivedPrincipal where id=t_invest_repaymentId;
			*/
				fetch cursor_name into t_invest_repaymentId,t_recivedPrincipal,t_invest_id;
				end while;
		close cursor_name;
		if _error <> 0 then 
				rollback;
				set out_ret = -3;
				set out_desc = '执行异常';
				leave _return; 
		else 
				
				set out_ret = 1;
				set out_desc = '';
		end if;
	
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_debt_action
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_debt_action`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_debt_action`(IN `in_debt_id` bigint,IN `in_auction_id` bigint,IN `in_auctioner_id` bigint, out out_ret int, out out_desc varchar(100))
_return:begin
	declare	t_id	bigint	default	-1;
	declare	t_debt_id	bigint	default	-1;
	declare	t_auction_time date	default	null;
	declare	t_auction_price	decimal(18,2)	default	0;
	declare	t_uname	varchar(100)	default	'';
	declare	t_uid	bigint	default	-1;
	declare	t_mail_template	varchar(2048)	default	'';
	declare	t_email_template	varchar(2048)	default	'';
	declare	t_sms_template	varchar(2048)	default	'';
	declare t_content varchar(1024)	default	'';
	declare  _done int default 0;
	declare	_error	int	default	0;
  declare cursor_name cursor for (select id,	debtId,	auctionTime,	auctionPrice,	f_formatting_username(username) as username,	userId
	from	v_t_auction_debt_user	where	debtId	=	in_debt_id);
  declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
	declare continue handler for sqlexception set _error	=	1;
	set out_ret = -1;
	set out_desc = '执行失败';
	open cursor_name;
	#循环执行  
		fetch cursor_name into	t_id,	t_debt_id,	t_auction_time,	t_auction_price,	t_uname,	t_uid;
			while _done <> 1 do
					if	t_id	<>	in_auction_id	and	t_uid	<>	in_auctioner_id	then
							
							set	@max_id	=	-1;
							set	@old_auction_price	=	0;
							select max(id)	into	@max_id	from	t_auction_debt	where	id	<	t_id;
							set	@max_id	=	ifnull(@max_id,-1);
							set	@old_auction_price	=	ifnull(@old_auction_price,	0);
							if	@max_id	>	0	then
								if	@old_auction_price	<	t_auction_price	then
									set	t_auction_price	=	t_auction_price	-	@old_auction_price;
								end	if;
							end	if;
							update t_user set usableSum	=	usableSum	+	t_auction_price,	freezeSum	=	freezeSum	-	t_auction_price	where id	=	t_uid;
							set	t_content	=	concat(f_moneyDecode(202),	'[',t_auction_price,']元');
							insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,	trader, dueoutSum, remarks,
							oninvest, paynumber, paybank, cost,	income,	borrow_id)	select t_uid, now(), 202, f_moneyDecode(202), t_auction_price,a.usableSum as usableSum,
							a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),	t_alienator_id,0, t_content, 0, t_invest_id,
							'', 0,	t_auction_price,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = t_uid group by a.id;
							set	t_mail_template	=	f_get_notice_template('fail_bid');
							set	t_mail_template = replace(t_mail_template,	'date', now());
							set	t_mail_template = replace(t_mail_template,	'money', t_auction_price);
							set	t_email_template	=	f_get_notice_template('e_fail_bid');
							set	t_email_template = replace(t_email_template,	'date', now());
							set	t_email_template = replace(t_email_template,	'money', t_auction_price);
							#插入通知任务
							set	@username	=	'';
							set	@email	=	'';
							set	@telphone	=	'';
							select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
							t_person a on a.userId = b.id where b.id = 	t_alienator_id;
							set	t_sms_template	=	f_get_notice_template('s_fail_bid');
							set	t_sms_template = replace(t_sms_template,	'date', now());
							set	t_sms_template = replace(t_sms_template,	'money', t_auction_price);
							set	t_sms_template = replace(t_sms_template,	'userName', @username);
							insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
							values(t_uid,	'债权转让竞拍报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	t_debt_id,	now(),	'credit_trans');
							
					end	if;
					fetch cursor_name into	t_id,	t_debt_id,	t_auction_time,	t_auction_price,	t_uname,	t_uid;
			end	while;
	close	cursor_name;
	if	_error	<>	0	then
		rollback;
		set out_ret = -2;
		set out_desc = '执行异常';
		leave _return; 
	else	
		set out_ret = 1;
		set out_desc = '';
  end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_debt_add
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_debt_add`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_debt_add`(IN `in_debt_id` BIGINT,IN `in_uid` BIGINT ,IN `in_aucion_price` DECIMAL(18,4)  ,IN `in_debt_pwd` VARCHAR(255),IN `in_basePath` VARCHAR(1024),IN `in_investId` VARCHAR(1024), IN `trxId` VARCHAR(1024),IN `in_pageType` VARCHAR(40), OUT `out_ret` INT,OUT `out_desc` VARCHAR(255))
_return:BEGIN
/*
	declare	t_mail_template	varchar(2048)	default	'';
	declare	t_email_template	varchar(2048)	default	'';
	declare	t_sms_template	varchar(2048)	default	''; 
	declare t_content varchar(1024)	default	'';
	declare	_error	int	default	0;
	declare continue handler for sqlexception set _error	=	1;
	#默认为失败
	set out_ret  =-1;
	set out_desc ='';
	#得到债权信息
	select  ifnull(alienatorId,0),borrowId,debtSum,auctionBasePrice,ifnull(auctionHighPrice,0) ,debtStatus 
	into @alienatorId ,@borrowId,@debtSum,@auctionBasePrice,@auctionHighPrice,@debtStatus  
	from t_assignment_debt  where id = in_debt_id;
	#得到竞拍人信息
	select ifnull(id,0),username,dealpwd,ifnull(usableSum,0),ifnull(freezeSum,0),dueinSum 
	into @t_uid ,@t_username,@t_dealpwd,@t_usableSum,@t_freezeSum,@t_dueinSum
	from t_user where id = in_uid;
	#得到还款人信息
	select publisher into @t_publisher from t_borrow where id = @borrowId;
	if @alienatorId <=0 || @t_uid<=0 then 
	 set out_ret = -7;
	 set out_desc ='操作失败';
	 leave _return;
	end if;
	
	if @alienatorId =in_uid then 
	 set out_ret = -2;
	 set out_desc ='不能竞拍自己转让的债权';
	 leave _return;
	end if;
	if in_uid = @t_publisher then 
	 set out_ret = -9;
	 set out_desc ='借款者不能竞拍该债权';
	 leave _return;
	end if;
	if  in_debt_pwd <> @t_dealpwd then 
	 set out_ret = -3;
	 set out_desc ='交易密码错误';
	 leave _return;
	end if;
	
	select id , ifnull(max(auctionPrice),0)into @t_ap_id, @t_auctionPrice from t_auction_debt  where debtId= in_debt_id and userId=in_uid;
	
	if   @t_auctionPrice > 0  then 
		if @t_usableSum <   in_aucion_price - @t_auctionPrice then 
		set out_ret = -4;
		set out_desc ='可用余额不足';
		leave _return;
		end if;
	end if ;
	if @t_auctionPrice  =  0  then 
		if @t_usableSum < in_aucion_price then 
		set out_ret = -4;
		set out_desc ='可用余额不足';
		leave _return;
		end if ;
	end if;
	
	if @debtSum < in_aucion_price then 
	 set out_ret = -5;
	 set out_desc = '竞拍金额不能大于债权总额';
	 leave _return;
	end if;
	if @auctionBasePrice > in_aucion_price then 
	 set out_ret = -6;
	 set out_desc = '竞拍金额不能小于转让者设置的最小竞拍金额';
	 leave _return;
	end if;
	#得到债权竞拍次数
	select  count(1)  into @t_autiontimes  from t_auction_debt  where debtId = in_debt_id  and userId = in_uid;
	if @t_autiontimes >= 2 then 
	 set out_ret = -8;
	 set out_desc = '对不起,该债权您只能竞拍两次';
	 leave _return;
	end if ;
		
	if  @t_auctionPrice >= in_aucion_price  then 
		set out_ret = -10;
	 set out_desc = '第二次竞拍金额应大于第一次竞拍金额';
	 leave _return;
	end if;
	if @auctionHighPrice > 0 && @auctionHighPrice > in_aucion_price then 
		set out_ret = -11;
	 set out_desc = '竞拍金额要大于最高竞拍金额';
	 leave _return;
	end if;
	if   @debtStatus <> 2 then 
	set out_ret = -7;
	set out_desc = '竞拍失败';
	leave _return;
	end if;
 
	start transaction ;
	
			#获得借款标题
			select borrowTitle into @t_borrow_title from t_borrow  where id = @borrowId;
			#是否为第一次竞拍
			if @t_autiontimes =0 then
				set @djMoney = in_aucion_price ;
			else 
				set @djMoney = in_aucion_price - @t_auctionPrice;
			end if;
			update t_user  set usableSum =  usableSum - @djMoney ,freezeSum = @t_freezeSum +@djMoney where id = in_uid;
			set out_ret = ROW_COUNT();	
			if out_ret <=0 then 
				set out_ret = -7;
				set out_desc = '竞拍失败';
				leave _return;
			end if ;
			#添加用户动态
			set t_content = '';
			set	t_content	=	f_link_debt(in_basepath,in_debt_id,@t_borrow_title,'','','');	
		  if @t_autiontimes =0 then 
				set	t_content	=	concat('竞拍[',	t_content,	']资金冻结');
				insert into t_auction_debt(userId,debtId,auctionTime,auctionPrice)
				values(in_uid,in_debt_id,now(),in_aucion_price);
			else
				set	t_content	=	concat('您第二次竞拍了债权[',	t_content,	']资金冻结');
				insert into t_auction_debt(userId,debtId,auctionTime,auctionPrice,autiontimes)
				values(in_uid,in_debt_id,now(),in_aucion_price,2);
			end if;
			#添加资金记录
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending)	
			select in_uid, now(), 702, f_moneyDecode(702), @djMoney,a.usableSum as usableSum, a.freezeSum as freezeSum, a.dueinSum as dueinSum,
			-1,0, t_content, 0, in_debt_id, '', 0 ,@djMoney	from t_user a left join t_auction_debt  b on a.id = b.userId 
			where a.id = in_uid group by a.id;
			set t_content = '';
			set	t_content	=	f_link_debt(in_basepath,@borrowId,@t_borrow_title,'','','');	
			#发送短信 
			#站内信
			set	t_mail_template	=	f_get_notice_template('freeze_bid');
			set	t_mail_template = replace(t_mail_template,	'date', now());
			set	t_mail_template = replace(t_mail_template,	'describe', t_content);
			set	t_mail_template = replace(t_mail_template,	'money',in_aucion_price);
			#邮件
			set	t_email_template	=	f_get_notice_template('e_freeze_bid');
			set	t_email_template = replace(t_email_template,	'date', now());
			set	t_email_template = replace(t_email_template,	'describe', t_content);
			set	t_email_template = replace(t_email_template,	'money',in_aucion_price);
		#插入通知任务
			set	@username	=	'';
			set	@email	=	'';
			set	@telphone	=	'';
			select a.cellphone,	b.username,	b.email	into	@telphone,	@username,	@email from	 t_user	b left	join
						t_person	a	on	a.userId	=	b.id	where	b.id	=	in_uid;
			#短信
			set	t_sms_template	=	f_get_notice_template('s_freeze_bid');
			set	t_sms_template = replace(t_sms_template,	'date', now());
			set	t_sms_template = replace(t_sms_template,	'userName', @username);
			set	t_sms_template = replace(t_sms_template,	'describe', t_content);
			set	t_sms_template = replace(t_sms_template,	'money',in_aucion_price);
		
			insert	into	t_notice_task(user_id,sendtitle,s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
			values(in_uid, '债权转让竞拍报告','capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_debt_id,	now(),	'borrow');
			
		  select  userId,auctionPrice into   @userId,@maxAuctionPrice from t_auction_debt where  debtId = in_debt_id order by auctionPrice desc limit 0,1;
			
			update t_assignment_debt  set auctionHighPrice  = @maxAuctionPrice,auctionerId = @userId
			where  id = in_debt_id and debtStatus =2;
	 
	if	_error	<>	0	then 
				rollback;
					set out_ret = -14;
					set out_desc = '执行异常';
					leave _return;
				else	
					commit;
					set out_ret = 1; 
					set out_desc = '';   
		END if;
*/
DECLARE	t_mail_template	VARCHAR(2048)	DEFAULT	'';
	DECLARE	t_email_template	VARCHAR(2048)	DEFAULT	'';
	DECLARE	t_sms_template	VARCHAR(2048)	DEFAULT	''; 
	DECLARE t_content VARCHAR(1024)	DEFAULT	'';
	DECLARE	_error	INT	DEFAULT	0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error	=	1;
	#默认为失败
	SET out_ret  =-1;
	SET out_desc ='';
	/*回购使用债权转让接口,当in_debt_pwd为9527时,处理回购业务*/
	IF  in_debt_pwd = '9527' THEN
			SELECT investor,borrowId INTO @investor,@borrowId FROM t_invest WHERE id=in_investId;#原投资人
			SELECT borrowTitle INTO @borrowTitle FROM t_borrow WHERE id=@borrowId;
			UPDATE t_invest_repayment SET `owner`=in_uid,ownerlist=in_uid,isDebt=2 WHERE invest_id=in_investId;
			UPDATE t_invest SET investor = in_uid WHERE id=in_investId;
			UPDATE t_user SET usableSum=usableSum+in_aucion_price WHERE id=@investor;
			UPDATE t_backbuy SET investList=CONCAT(investList,in_investId,',') WHERE borrowId=@borrowId;
			
			SET t_content =  CONCAT('系统在',NOW(),'回购了借款',@borrowTitle,'回收价格为:',in_aucion_price,'元');
			#被回购投资人资金记录
			INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,pageType)	
			SELECT @investor, NOW(), 702, '债权回购', in_aucion_price,a.usableSum AS usableSum, a.freezeSum AS freezeSum, a.dueinSum AS dueinSum,
			-1,0, t_content, 0, in_debt_id, '', 0 ,in_aucion_price,in_pageType	FROM t_user a LEFT JOIN t_auction_debt  b ON a.id = b.userId 
			WHERE a.id = in_uid GROUP BY a.id;
	/*当in_debt_pwd不为9527时,处理债权购买业务*/
	ELSE
			#得到债权信息
			SELECT  IFNULL(alienatorId,0),borrowId,debtSum,auctionBasePrice,IFNULL(auctionHighPrice,0) ,debtStatus 
			INTO @alienatorId ,@borrowId,@debtSum,@auctionBasePrice,@auctionHighPrice,@debtStatus  
			FROM t_assignment_debt  WHERE id = in_debt_id;
			#得到购买人信息
			SELECT IFNULL(id,0),username,dealpwd,IFNULL(usableSum,0),IFNULL(freezeSum,0),dueinSum 
			INTO @t_uid ,@t_username,@t_dealpwd,@t_usableSum,@t_freezeSum,@t_dueinSum
			FROM t_user WHERE id = in_uid;
			#得到还款人信息
			SELECT publisher INTO @t_publisher FROM t_borrow WHERE id = @borrowId;
			IF @alienatorId <=0 || @t_uid<=0 THEN 
			 SET out_ret = -7;
			 SET out_desc ='操作失败';
			 LEAVE _return;
			END IF;
			
			IF @alienatorId =in_uid THEN 
			 SET out_ret = -2;
			 SET out_desc ='不能购买自己转让的债权';
			 LEAVE _return;
			END IF;
			IF in_uid = @t_publisher THEN 
			 SET out_ret = -9;
			 SET out_desc ='借款者不能购买该债权';
			 LEAVE _return;
			END IF;
			
			SELECT id , IFNULL(MAX(auctionPrice),0)INTO @t_ap_id, @t_auctionPrice FROM t_auction_debt  WHERE debtId= in_debt_id AND userId=in_uid;
			
			IF   @t_auctionPrice > 0  THEN 
				IF @t_usableSum <   in_aucion_price - @t_auctionPrice THEN 
				SET out_ret = -4;
				SET out_desc ='可用余额不足';
				LEAVE _return;
				END IF;
			END IF ;
			IF @t_auctionPrice  =  0  THEN 
				IF @t_usableSum < in_aucion_price THEN 
				SET out_ret = -4;
				SET out_desc ='可用余额不足';
				LEAVE _return;
				END IF ;
			END IF;
			
			IF   @debtStatus <> 2 THEN 
			SET out_ret = -7;
			SET out_desc = '购买失败,债权不在转让中';
			LEAVE _return;
			END IF;
		 
			#start transaction ;
	
			#获得借款标题
			SELECT borrowTitle INTO @t_borrow_title FROM t_borrow  WHERE id = @borrowId;
			SET @djMoney = in_aucion_price ;
			UPDATE t_user  SET usableSum =  usableSum - @djMoney ,freezeSum = @t_freezeSum +@djMoney WHERE id = in_uid;
			SET out_ret = ROW_COUNT();	
			IF out_ret <=0 THEN 
				SET out_ret = -7;
				SET out_desc = '购买失败';
				LEAVE _return;
			END IF ;
			#添加用户动态
			SET t_content = '';
			SET	t_content	=	f_link_debt(in_basepath,in_debt_id,@t_borrow_title,'','','');	
	
			SET	t_content	=	CONCAT('购买债权[',	t_content,	']资金冻结');
			INSERT INTO t_auction_debt(userId,debtId,auctionTime,auctionPrice,pageType)
			VALUES(in_uid,in_debt_id,NOW(),in_aucion_price,in_pageType);
			#添加资金记录
/*
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending)	
			select in_uid, now(), 702, f_moneyDecode(702), @djMoney,a.usableSum as usableSum, a.freezeSum as freezeSum, a.dueinSum as dueinSum,
			-1,0, t_content, 0, in_debt_id, '', 0 ,@djMoney	from t_user a left join t_auction_debt  b on a.id = b.userId 
			where a.id = in_uid group by a.id;
*/
			SET t_content = '';
			SET	t_content	=	f_link_debt(in_basepath,@borrowId,@t_borrow_title,'','','');	
			/*#发送短信 
			#站内信
			set	t_mail_template	=	f_get_notice_template('freeze_bid');
			set	t_mail_template = replace(t_mail_template,	'date', now());
			set	t_mail_template = replace(t_mail_template,	'describe', t_content);
			set	t_mail_template = replace(t_mail_template,	'money',in_aucion_price);
			#邮件
			set	t_email_template	=	f_get_notice_template('e_freeze_bid');
			set	t_email_template = replace(t_email_template,	'date', now());
			set	t_email_template = replace(t_email_template,	'describe', t_content);
			set	t_email_template = replace(t_email_template,	'money',in_aucion_price);*/
			#插入通知任务
			SET	@username	=	'';
			SET	@email	=	'';
			SET	@telphone	=	'';
			SELECT a.cellphone,	b.username,	b.email	INTO	@telphone,	@username,	@email FROM	 t_user	b LEFT	JOIN
						t_person	a	ON	a.userId	=	b.id	WHERE	b.id	=	in_uid;
			/*#短信
			set	t_sms_template	=	f_get_notice_template('s_freeze_bid');
			set	t_sms_template = replace(t_sms_template,	'date', now());
			set	t_sms_template = replace(t_sms_template,	'userName', @username);
			set	t_sms_template = replace(t_sms_template,	'describe', t_content);
			set	t_sms_template = replace(t_sms_template,	'money',in_aucion_price);
		
			insert	into	t_notice_task(user_id,sendtitle,s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
			values(in_uid, '债权转让报告','capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_debt_id,	now(),	'borrow');*/
			
		   SELECT  userId,auctionPrice INTO   @userId,@maxAuctionPrice FROM t_auction_debt WHERE  debtId = in_debt_id ORDER BY auctionPrice DESC LIMIT 0,1;
			
			UPDATE t_assignment_debt  SET auctionHighPrice  = @maxAuctionPrice,auctionerId = @userId,buyTime = NOW(), ordId = trxId,pageType=in_pageType
			WHERE  id = in_debt_id AND debtStatus =2;
	END IF;
	IF	_error	<>	0	THEN 
				SET out_ret = -14;
				SET out_desc = '执行异常';
				LEAVE _return;
			ELSE
				SET out_ret = 1; 
				SET out_desc = '';   
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_debt_time_deal
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_debt_time_deal`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_debt_time_deal`(out out_ret int, out out_desc varchar(100))
_return:begin
	declare t_id bigint	default -1;
	declare t_alienator_id bigint	default -1;
	declare	t_borrow_id bigint	default -1;
	declare	t_auctioner_id bigint	default -1;
	declare	t_invest_id bigint	default -1;
	declare	t_debt_sum decimal(18,2)	default 0;
	declare	t_mail_template	varchar(2048)	default	'';
	declare	t_email_template	varchar(2048)	default	'';
	declare	t_sms_template	varchar(2048)	default	'';
	declare t_content varchar(1024)	default	'';
	declare _done int default 0;
	declare	_error	int	default	0;
 
	declare cursor_name cursor for (select id,	alienatorId,	borrowId,	auctionerId,	investId,	debtSum from t_assignment_debt
	where	date_add(publishTime, interval 1 day)	<=	now() and debtStatus	=	2);
	declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
	declare continue handler for sqlexception set _error	=	1;
	set out_ret = -1;
	set out_desc = '执行失败';
	
	start transaction;	#主函数中设置事务为手动提交，次函数不要设置也不要commit
		open cursor_name;
			#循环执行  
      fetch cursor_name into	t_id,	t_alienator_id,	t_borrow_id,	t_auctioner_id,	t_invest_id,	t_debt_sum;
			while _done <> 1 do
					
					set	@id	=	-1;
					set	@userId	=	-1;
					set	@auctionPrice = 0;
					set	@count	=	-1;
					select id,	userId,	max(auctionPrice)	into	@id,	@userId,	@auctionPrice from t_auction_debt	where	debtId	=	t_id;
					select count(1)	into	@count from t_auction_debt	where	debtId	=	t_id;
					set	@count	=	ifnull(@count,-1);
					if	@count	>	0	then
						set	@t_feelog	= '';
						select feelog into @t_feelog from t_borrow where id = t_borrow_id;
						set	@creditTransferFeeRate	= 0;
						select  f_parsing_json(@t_feelog,'creditTransferFeeRate') into @creditTransferFeeRate;
						set	@creditTransferFeeRate	=	ifnull(@creditTransferFeeRate,0);
						#修改债权转让
						update	t_assignment_debt	set	auctionEndTime	=	now(),	debtStatus	=	3,	manageFee	=	t_debt_sum*@creditTransferFeeRate
						where	id	=	t_id	and	debtStatus	=	2;
						set out_ret = ROW_COUNT();	
						if	out_ret	> 0	then
							#更新投资还款记录是债权转让的状态
							update t_invest_repayment set `owner` = t_auctioner_id,	ownerlist	=	concat(ownerlist,',',t_auctioner_id),	isDebt=2 where 
							invest_id	=	t_invest_id and repayStatus	=	1;
			
							insert into t_invest_history(id,	investAmount,	monthRate,	investor,	borrowId,	investTime,	oriInvestor,	realAmount,
							hasPI,	deadline,	hasDeadline,	recivedPrincipal,	recievedInterest,	hasPrincipal,	hasInterest,	recivedFI,	hasFI,
							manageFee,	reward,	repayStatus,	flag,	check_principal,	check_interest,	min_invest_id,	max_invest_id,	adjust_principal)
							select id,	investAmount,	monthRate,	investor,	borrowId,	investTime,	oriInvestor,	realAmount,	hasPI,	deadline,
							hasDeadline,	hasPrincipal,	hasInterest,	hasPrincipal,	hasInterest,	hasFI,	hasFI,	manageFee,	reward,	2,	flag,	check_principal,
							check_interest,	min_invest_id,	max_invest_id,	adjust_principal from t_invest_history where id	=	t_invest_id;
							
							update t_user set freezeSum	=	freezeSum	-	t_debt_sum	where id	=	t_auctioner_id;
							set	t_content	=	concat(f_moneyDecode(726),	'[',t_debt_sum,']元');
							insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,	trader, dueoutSum, remarks,
							oninvest, paynumber, paybank, cost,	spending,	borrow_id)	select t_auctioner_id, now(), 726, f_moneyDecode(726), t_debt_sum,a.usableSum as usableSum,
							a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),	t_alienator_id,0, t_content, 0, t_invest_id,
							'', 0,	t_debt_sum,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = t_auctioner_id group by a.id;
							update t_invest	set	investor	=	t_auctioner_id,	hasPI	=	0,	realAmount	=	recivedPrincipal	-	hasPrincipal,
							recivedPrincipal	=	recivedPrincipal	-	hasPrincipal,	recievedInterest	=	recievedInterest	-	hasInterest,	hasPrincipal	=	0,
							hasInterest	=	0,	isDebt	=	2,	manageFee	=	0,	recivedFI	=	recivedFI	-	hasFI	where	id	=	t_invest_id;
							set	t_content	=	concat(f_moneyDecode(1005),	'[',t_debt_sum,']元');
							insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,	trader, dueoutSum, remarks,
							oninvest, paynumber, paybank, cost,	spending,	borrow_id)	select t_auctioner_id, now(), 1005, f_moneyDecode(1005), 0,a.usableSum as usableSum,
							a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),	t_alienator_id,0, t_content, 0, t_invest_id,
							'', 0,	0,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = t_auctioner_id group by a.id;
							set	t_mail_template	=	f_get_notice_template('success_bid');
							set	t_mail_template = replace(t_mail_template,	'date', now());
							set	t_mail_template = replace(t_mail_template,	'money', t_debt_sum);
							set	t_email_template	=	f_get_notice_template('e_success_bid');
							set	t_email_template = replace(t_email_template,	'date', now());
							set	t_email_template = replace(t_email_template,	'money', t_debt_sum);
							#插入通知任务
							set	@username	=	'';
							set	@email	=	'';
							set	@telphone	=	'';
							select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
							t_person a on a.userId = b.id where b.id = 	t_auctioner_id;
							set	t_sms_template	=	f_get_notice_template('s_success_bid');
							set	t_sms_template = replace(t_sms_template,	'date', now());
							set	t_sms_template = replace(t_sms_template,	'money', t_debt_sum);
							set	t_sms_template = replace(t_sms_template,	'userName', @username);
							insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
							values(t_auctioner_id,	'债权转让竞拍报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	t_id,	now(),	'credit_trans');
							
							#处理未中拍的用户
							call p_borrow_debt_action(t_id,	@id,	t_auctioner_id,	@ret,	@ret_desc);
							#转让者资金处理
							set	t_content	=	concat(f_moneyDecode(1003),	'[',t_debt_sum,']元');
							insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,	trader, dueoutSum, remarks,
							oninvest, paynumber, paybank, cost,	spending,	borrow_id)	select t_alienator_id, now(), 1003, f_moneyDecode(1003), 0,a.usableSum as usableSum,
							a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),	-1,0, t_content, 0, t_invest_id,
							'', 0,	0,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = t_alienator_id group by a.id;
							update t_user set usableSum	=	usableSum	+	t_debt_sum	where id	=	t_alienator_id;
							set	t_content	=	concat(f_moneyDecode(201),	'[',t_debt_sum,']元');
							insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,	trader, dueoutSum, remarks,
							oninvest, paynumber, paybank, cost,	income,	borrow_id)	select t_alienator_id, now(), 201, f_moneyDecode(201), t_debt_sum,a.usableSum as usableSum,
							a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),	t_alienator_id,0, t_content, 0, t_invest_id,
							'', 0,	t_debt_sum,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = t_alienator_id group by a.id;
							set	@manage_fee = ifnull((t_debt_sum*@creditTransferFeeRate),0);
							if	@manage_fee	>	0	then
								update t_user set usableSum	=	usableSum	-	@manage_fee	where id	=	t_alienator_id;
								set	t_content	=	concat(f_moneyDecode(701),	'[',@manage_fee,']元');
								insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,	trader, dueoutSum, remarks,
								oninvest, paynumber, paybank, cost,	spending,	borrow_id)	select t_alienator_id, now(), 701, f_moneyDecode(701), @manage_fee,a.usableSum as usableSum,
								a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),	t_alienator_id,0, t_content, 0, t_invest_id,
								'', 0,	@manage_fee,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor where a.id = t_alienator_id group by a.id;
	
								insert into t_risk_detail(riskBalance,	riskInCome,	riskDate,	riskType,	resource,	trader,	borrowId) 
								select (sum(riskInCome)-sum(riskSpending)),	@manage_fee,	now(),	'收入',	'债权转让手续费',	t_alienator_id,	-1 from t_risk_detail;
							end	if;
							set	t_mail_template	=	f_get_notice_template('success_credit');
							set	t_mail_template = replace(t_mail_template,	'date', now());
							set	t_mail_template = replace(t_mail_template,	'money', t_debt_sum);
							set	t_email_template	=	f_get_notice_template('e_success_credit');
							set	t_email_template = replace(t_email_template,	'date', now());
							set	t_email_template = replace(t_email_template,	'money', t_debt_sum);
							#插入通知任务
							set	@username	=	'';
							set	@email	=	'';
							set	@telphone	=	'';
							select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
							t_person a on a.userId = b.id where b.id = 	t_alienator_id;
							set	t_sms_template	=	f_get_notice_template('s_success_credit');
							set	t_sms_template = replace(t_sms_template,	'date', now());
							set	t_sms_template = replace(t_sms_template,	'money', t_debt_sum);
							set	t_sms_template = replace(t_sms_template,	'userName', @username);
							insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
							values(t_alienator_id,	'债权转让竞拍报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	t_id,	now(),	'credit_trans');
							
						end	if;
					else
							update	t_assignment_debt	set	auctionEndTime	=	now(),	debtStatus	=	5	where	id	=	t_id	and	debtStatus	=	2;
					end	if;
				fetch cursor_name into	t_id,	t_alienator_id,	t_borrow_id,	t_auctioner_id,	t_invest_id,	t_debt_sum;
			end	while;
		close	cursor_name;
	
	if	_error	<>	0	then
		rollback; 
		set out_ret = -9;
	  set out_desc = '执行异常'; 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_initialization
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_initialization`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_initialization`(IN in_uid bigint, IN in_borrow_title varchar(200), IN in_img_path varchar(200), IN in_borrow_way int, IN in_borrow_info varchar(2048), IN in_deadline int, IN in_payment_mode int, IN in_borrow_amount decimal(18, 2), IN in_annual_rate decimal(18, 2), IN in_min_tendered_sum decimal(18, 2), IN in_max_tendered_sum decimal(18, 2), IN in_raise_term decimal(18, 2), IN in_detail varchar(2048), IN in_trade_type int, IN in_publisher bigint, IN in_excitation_type int, IN in_excitation_sum decimal(18, 2), IN in_excitation_mode int, IN in_purpose int, IN in_haspwd int, IN in_investpwd varchar(50), IN in_publish_time datetime, IN in_publiship varchar(100), IN in_isdaythe int, IN in_smallest_flow_unit decimal(18, 2), IN in_circulation_number int, IN in_nid_log varchar(50), IN in_frozen_margin decimal(18, 2), IN in_url varchar(200), IN in_bathpath varchar(200), IN in_cost_fee decimal(18, 2),  IN in_feelog varchar(2048),IN in_feestate varchar(2048),IN in_agent varchar(1024),IN in_counter_agent varchar(1024),IN in_borrow_subType int,IN in_projectScorename varchar(20),IN in_business_detail varchar(1024),IN in_assets varchar(1024),IN in_money_purposes varchar(1024),IN in_borrow_show int ,OUT out_ret int, OUT out_desc varchar(100))
_return: begin
	#发布借款
	declare in_borrow_credit bigint default 0;
	declare t_content varchar(1024)	default	'';	#信息
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	
	DECLARE t_b_mfee	DECIMAL(18,4)	DEFAULT	0;	#借款手续费
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	#用户状态 1、启用 2、禁用 3.黑名单
	set @user_enable = 2;
	set @vipstatus = 1;
	set	@authstep	=	1;
	select `enable`, vipStatus,	authStep ,lastIP into @user_enable, @vipstatus,	@authstep ,@lastIP from t_user where id = in_uid;
	if @user_enable is null then
		set out_ret = -2;
		set out_desc = '不存在用户';
		leave _return;
	elseif @user_enable = 2 then
		set out_ret = -3;
		set out_desc = '已禁用用户';
		leave _return;
	elseif @user_enable = 3 then
		set out_ret = -4;
		set out_desc = '黑名单用户';
		leave _return;
	end if;
	/*
	#用户VIP状态
	if @vipstatus = 1 then
		set out_ret = -5;
		set out_desc = '非VIP不能发布借款';
		leave _return;
	elseif @vipstatus = 3 then
		set out_ret = -6;
		set out_desc = 'VIP会员过期待续费';
		leave _return;
	end if;
	*/
	#用户认证状态
	if	@authstep	=	1 then
		set out_ret = -7;
		set out_desc = '未通过个人信息认证';
		leave _return;
	elseif	( @authstep	=	2	and in_borrow_way not in (1,2,6) )then
		set out_ret = -8;
		set out_desc = '未通过工作认证';
		#leave _return;
	elseif	@authstep	=	3	then
		set out_ret = -9;
		set out_desc = '未通过资料认证';
		leave _return;
	end	if;
	set @borrow_status = 2; #标的类型开启状态( 1 开启 2 关闭)
	set @account_multiple = null; #借款金额的倍数
	set @amount_first = 0; #最低借款额度 (0 没有限制)
	set @amount_end = 0; #最高借款额度 (0 没有限制)
	set @apr_first = 0; #开始年利率
	set @apr_end = 0; #结束年利率
	select `status`, ifnull(account_multiple, 0), amount_first, amount_end, apr_first, apr_end 
	into @borrow_status,@account_multiple, @amount_first, @amount_end, @apr_first, @apr_end from t_borrow_type where nid = f_borrow_type_decode(in_borrow_way);
	if @borrow_status = 2 then
		set out_ret = -10;
		set out_desc = '该标的已关闭';
		leave _return;
	end if;
	#必要验证项
	if ifnull(in_borrow_title, '') = '' then
		set out_ret = -11;
		set out_desc = '标的标题为空';
		leave _return;
	end if;
	if ifnull(in_img_path, '') = '' then
		set out_ret = -12;
		set out_desc = '标的头像为空';
		leave _return;
	end if;
	if in_borrow_amount <= 0 then
		set out_ret = -13;
		set out_desc = '借款总额小于等于0';
		leave _return;
	end if;
	if in_annual_rate <= 0 then
		set out_ret = -14;
		set out_desc = '借款年利率小于等于0';
		leave _return;
	end if;
	if @account_multiple > 0 then
		if (@account_multiple > in_borrow_amount) then
			set out_ret = -15;
			set out_desc = concat('借款金额最少为[', @account_multiple, ']');
			leave _return;
		end if;
#		set @account_num = in_borrow_amount % @account_multiple;
#		if (@account_num <> 0) then
#			set out_ret = -16;
#			set out_desc = concat('借款金额必须是[', @account_multiple, ']的倍数');
#			leave _return;
#		end if;
	end if;
	set in_borrow_credit = in_borrow_amount;
	if @amount_first > 0 && @amount_first > in_borrow_credit then
		set out_ret = -17;
		set out_desc = concat('借款额度范围[', @amount_first, ']-[', @amount_end, ']');
		leave _return;
	end if;
	if @amount_end > 0 && @amount_end < in_borrow_credit then
		set out_ret = -18;
		set out_desc = concat('借款额度范围[', @amount_first, ']-[', @amount_end, ']');
		leave _return;
	end if;
	if @apr_first > 0 && @apr_first > in_annual_rate then
		set out_ret = -19;
		set out_desc = concat('借款年利率范围[', @apr_first, '%]-[', @apr_end, '%]');
		leave _return;
	end if;
	if @apr_end > 0 && @apr_end < in_annual_rate then
		set out_ret = -20;
		set out_desc = concat('借款年利率范围[', @apr_first, '%]-[', @apr_end, '%]');
		leave _return;
	end if;
	
	#处理业务逻辑
	#发布借款
	start transaction;
		insert into t_borrow (borrowTitle, imgPath, borrowWay, borrowInfo, deadline, paymentMode,
		borrowAmount, annualRate, minTenderedSum, maxTenderedSum, raiseTerm, detail, tradeType, publisher, excitationType,
		excitationSum,excitationMode, purpose, hasPWD, investPWD, publishTime, publishIP, isDayThe, smallestFlowUnit, 
		circulationNumber, nid_log, frozen_margin,feestate,feelog,businessDetail,assets,moneyPurposes,agent,counterAgent,borrowShow,borrowTypeSubId,projectScore)	
		values (in_borrow_title, in_img_path, in_borrow_way, in_borrow_info, in_deadline, in_payment_mode, 
		in_borrow_amount, in_annual_rate, in_min_tendered_sum, in_max_tendered_sum, in_raise_term, in_detail, in_trade_type, in_publisher, in_excitation_type,
		in_excitation_sum, in_excitation_mode, in_purpose, in_haspwd, in_investpwd, in_publish_time, in_publiship, in_isdaythe, in_smallest_flow_unit, 
		in_circulation_number, in_nid_log, in_frozen_margin,in_feestate,in_feelog,in_business_detail,in_assets,in_money_purposes,in_agent,in_counter_agent,in_borrow_show,in_borrow_subType,in_projectScorename);
		#得到添加的借款ID
		set @borrow_id = last_insert_id();
		#生成通知模版
		set	t_mail_template	=	f_get_notice_template('borrow_cancel');
		set	t_mail_template = replace(t_mail_template,	'title', 	in_borrow_title);
		set	t_mail_template = replace(t_mail_template,	'date', now());
		set	t_mail_template = replace(t_mail_template,	'amount', in_borrow_amount); 
	
		set	t_email_template	=	f_get_notice_template('e_borrow_cancel');
		set	t_email_template = replace(t_email_template,	'title', in_borrow_title);
		set	t_email_template = replace(t_email_template,	'date', now());
		set	t_email_template = replace(t_email_template,	'amount', in_borrow_amount);
		#插入通知任务
		set	@username	=	'';
		set	@email	=	'';
		set	@telphone	=	'';
		select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
		t_person a on a.userId = b.id where b.id = in_publisher;
		set	t_sms_template	=	f_get_notice_template('s_borrow_cancel');
		set	t_sms_template = replace(t_sms_template,	'username', @username);
		set	t_sms_template = replace(t_sms_template,	'title', in_borrow_title);
		set	t_sms_template = replace(t_sms_template,	'date', now());
		set	t_sms_template = replace(t_sms_template,	'amount', in_borrow_amount);
		#借款路径
		set	t_content	=	f_link(in_bathpath,@borrow_id,in_borrow_title,'','','');
		#借款方式
		if in_borrow_way = 2 then
			#秒还借款要冻结借款利息+借款手续费+冻结保证金
			#计算借款手续费(@isDayThe 1 月标 2 天标)
			set	@locan_fee =0;
			set	@locan_month = 0;
			set	@locan_fee_month = 0;
			set	@day_fee	=	0;
			set	@borrowFeeRate = 0;
	  	select locan_fee,	locan_month,	locan_fee_month,	day_fee into @locan_fee,	@locan_month,	@locan_fee_month,	@day_fee
			from t_borrow_type_log  where identifier = in_nid_log;
			if @isDayThe =2 then 
				set @borrowFeeRate = (@day_fee / 365)/100;
			else 
				 if in_deadline > @locan_month then 
					set @borrowFeeRate = (@locan_fee + (in_deadline - @locan_month) * @locan_fee_month)/100;
				 else 
					set @borrowFeeRate =  @locan_fee /100;
				 end if;
			end if;
			set @fee = 0;
			set @interest = 0;
			set @cost_fee = 0;
			set @interest = (in_borrow_amount * in_annual_rate * 0.01) / 12.0;
			set @cost_fee = (in_borrow_amount * @borrowFeeRate);
			set @fee = @interest  +@cost_fee+ in_frozen_margin;
			update t_user  set  usableSum = usableSum - @fee , freezeSum = freezeSum + @fee where id = in_publisher;
			set	t_content	=	concat('发布秒还借款[',	t_content,	'],冻结借款费(保证金+秒还借款费)');
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	
			select in_publisher, now(), 602, f_moneyDecode(602), @fee,a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
			-1,0, t_content, 0, '', '',0, @fee,b.borrowId  	from t_user a left join t_invest b on a.id = b.investor  where a.id = in_publisher group by a.id;
			#站内信
			set	t_mail_template = replace(t_mail_template,	'[秒还]', '秒还');
			set	t_mail_template = replace(t_mail_template,	'lines', '0');
			set	t_mail_template = replace(t_mail_template,	'fee', round(@fee,2));
			#邮件
			set	t_email_template = replace(t_email_template,	'[秒还]', '秒还');
			set	t_email_template = replace(t_email_template,	'lines', '0');
			set	t_email_template = replace(t_email_template,	'fee', round(@fee,2));
			#短信
			set	t_sms_template = replace(t_sms_template,	'[秒还]', '秒还');
			set	t_sms_template = replace(t_sms_template,	'lines', '0');
			set	t_sms_template = replace(t_sms_template,	'fee', round(@fee,2));
	elseif in_borrow_way <> 2 then
	
	
		#借款要冻结借款手续费+冻结保证金
			#计算借款手续费(@isDayThe 1 月标 2 天标)
			SET	@locan_fee =0;
			SET	@locan_month = 0;
			SET	@locan_fee_month = 0;
			SET	@day_fee	=	0;
			SET	@borrowFeeRate = 0;
	  	SELECT locan_fee,	locan_month,	locan_fee_month,	day_fee INTO @locan_fee,	@locan_month,	@locan_fee_month,	@day_fee
			FROM t_borrow_type_log  WHERE identifier = in_nid_log;
			IF @isDayThe =2 THEN 
				SET @borrowFeeRate = (@day_fee / 365)/100;
			ELSE 
				 IF in_deadline > @locan_month THEN 
					SET @borrowFeeRate = (@locan_fee + (in_deadline - @locan_month) * @locan_fee_month)/100;
				 ELSE 
					SET @borrowFeeRate =  @locan_fee /100;
				 END IF;
			END IF;
			SET @fee = 0;
			SET @cost_fee = 0;
			SET @cost_fee = (in_borrow_amount * @borrowFeeRate);
			SET @fee = @cost_fee+ in_frozen_margin;
			
		if @fee > 0 then 
			#修改用户资金
			update t_user  set  usableSum = usableSum - in_frozen_margin , freezeSum = freezeSum + in_frozen_margin where id = in_publisher;
			
			#UPDATE t_borrow set	manageFee = manageFee + @cost_fee WHERE publisher = in_publisher;	#这样用用户id选择有问题-会更新所有的借款
			UPDATE t_borrow set	manageFee = manageFee + @cost_fee WHERE id = @borrow_id;		#指定id更新	edit by cqm 2015-4-3
			
			set	t_content	=	concat('发布借款[',	t_content,	'],冻结保证金');
			#添加资金记录
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	select in_publisher, now(), 605, f_moneyDecode(605), in_frozen_margin,
			a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
			-1,0, t_content, 0, '', '', 0 ,in_frozen_margin,b.borrowId 	from t_user a left join t_invest b on a.id = b.investor  where a.id = in_uid group by a.id;
		end if ;
	
		if in_borrow_way =6 then 
			#站内信
			set	t_mail_template = replace(t_mail_template,	'[秒还]', '流转标');
			set	t_mail_template = replace(t_mail_template,	'lines', 0);
			#邮件
			set	t_email_template = replace(t_email_template,	'[秒还]','流转标');
			set	t_email_template = replace(t_email_template,	'lines', 0);
			#短信
			set	t_sms_template = replace(t_sms_template,	'[秒还]', '流转标');
			set	t_sms_template = replace(t_sms_template,	'lines', 0);
		else 
			#站内信
			set	t_mail_template = replace(t_mail_template,	'[秒还]', '');
			set	t_mail_template = replace(t_mail_template,	'lines', in_borrow_amount);
			#邮件
			set	t_email_template = replace(t_email_template,	'[秒还]','');
			set	t_email_template = replace(t_email_template,	'lines', in_borrow_amount);
			#短信
			set	t_sms_template = replace(t_sms_template,	'[秒还]', '');
			set	t_sms_template = replace(t_sms_template,	'lines', in_borrow_amount);
		end if;
			set	t_mail_template = replace(t_mail_template,	'fee', ifnull(in_frozen_margin,0));
			set	t_sms_template = replace(t_sms_template,	'fee', ifnull(in_frozen_margin,0));
			set	t_email_template = replace(t_email_template,	'fee', ifnull(in_frozen_margin,0));
		
		
	end if;
		#添加用户发布借款动态
		if in_borrow_way not in (1,2,6) then 
			set	t_content	=	f_link(in_bathpath,@borrow_id,in_borrow_title,'','','');
		end if; 
    #除了净值借款和秒还借款其他借款是要扣除可用信用额度
   if in_borrow_way not in (1,2,6) then 
		update t_user set usableCreditLimit = usableCreditLimit - in_borrow_amount  where id = in_uid;
   end if; 
		insert into t_user_recorelist(userId,  url, time)	values (in_uid, t_content, in_publish_time);
		insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
		values(in_uid,	'借款发布报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	@borrow_id,	now(),'initialization');
	
if	_error	<>	0	then
		rollback;
		set out_ret = -111;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_initialization_admin
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_initialization_admin`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_initialization_admin`(IN contract_id varchar(50),IN in_uid bigint, IN in_borrow_title varchar(200), IN in_img_path varchar(200), IN in_borrow_way int,IN in_hetong int, IN in_borrow_info varchar(2048), IN in_deadline int, IN in_payment_mode int, IN in_borrow_amount decimal(18, 2),  IN in_platUseFee decimal(18, 2), IN in_borrowFee decimal(18, 2), IN in_borrowManageFee decimal(18, 2), IN in_InstGuaranteeFee decimal(18, 2), IN in_username varchar(40), IN in_annual_rate decimal(18, 2), IN in_min_tendered_sum decimal(18, 2), IN in_max_tendered_sum decimal(18, 2), IN in_raise_term decimal(18, 2), IN in_detail varchar(2048),IN in_retsource varchar(2048), IN in_projectIntro varchar(2048), IN in_safeMeasures varchar(2048), IN in_trade_type int, IN in_publisher bigint, IN in_excitation_type int, IN in_excitation_sum decimal(18, 2), IN in_excitation_mode int, IN in_purpose int,IN in_loanUserId int,IN in_behalfUserId int, IN in_haspwd int, IN in_investpwd varchar(50), IN in_publish_time datetime, IN in_publiship varchar(100), IN in_isdaythe int, IN in_smallest_flow_unit decimal(18, 2), IN in_circulation_number int, IN in_nid_log varchar(50), IN in_frozen_margin decimal(18, 2), IN in_url varchar(200), IN in_bathpath varchar(200), IN in_cost_fee decimal(18, 2),  IN in_feelog varchar(2048),IN in_feestate varchar(2048),IN in_agent varchar(1024),IN in_counter_agent varchar(1024),IN in_borrow_subType int, IN in_projectScorename varchar(20),IN in_business_detail varchar(1024),IN in_assets varchar(1024),IN in_money_purposes varchar(1024),IN in_borrow_show int ,IN in_borrow_type int,IN in_applyId bigint,IN in_userId bigint,IN inbidTime datetime, IN inProjectAddress varchar(200), IN inShowRate varchar(100),IN inGroupid int,OUT out_ret int, OUT out_desc varchar(100))
_return: begin
	#发布借款
	declare in_borrow_credit bigint default 0;
  declare in_borrow_status bigint default 0; #借款状态
	declare t_content varchar(1024)	default	'';	#信息
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	#用户状态 1、启用 2、禁用 3.黑名单
	set @user_enable = 2;
	set @vipstatus = 1;
	set	@authstep	=	1;
	select `enable`, vipStatus,	authStep ,lastIP into @user_enable, @vipstatus,	@authstep ,@lastIP from t_user where id = in_uid;
	if @user_enable is null then
		set out_ret = -2;
		set out_desc = '不存在用户';
		leave _return;
	elseif @user_enable = 2 then
		set out_ret = -3;
		set out_desc = '已禁用用户';
		leave _return;
	elseif @user_enable = 3 then
		set out_ret = -4;
		set out_desc = '黑名单用户';
		leave _return;
	end if;
	#用户VIP状态
/*	if @vipstatus = 1 then
		set out_ret = -5;
		set out_desc = '非VIP不能发布借款';
		leave _return;
	elseif @vipstatus = 3 then
		set out_ret = -6;
		set out_desc = 'VIP会员过期待续费';
		leave _return;
	end if;
*/
	#用户认证状态
/*
	if	@authstep	=	1 then
		set out_ret = -7;
		set out_desc = '未通过个人信息认证';
		leave _return;
	elseif	( @authstep	=	2	and in_borrow_way not in (1,2,6) )then
		set out_ret = -8;
		set out_desc = '未通过工作认证';
		#leave _return;
	elseif	@authstep	=	3	then
		set out_ret = -9;
		set out_desc = '未通过资料认证';
		leave _return;
	end	if;
*/
	set @borrow_status = 2; #标的类型开启状态( 1 开启 2 关闭)
	set @account_multiple = null; #借款金额的倍数
	set @amount_first = 0; #最低借款额度 (0 没有限制)
	set @amount_end = 0; #最高借款额度 (0 没有限制)
	set @apr_first = 0; #开始年利率
	set @apr_end = 0; #结束年利率
	set @countM = 0; #认证审核通过树
	select `status`, ifnull(account_multiple, 0), amount_first, amount_end, apr_first, apr_end 
	into @borrow_status,@account_multiple, @amount_first, @amount_end, @apr_first, @apr_end from t_borrow_type where nid = f_borrow_type_decode(in_borrow_way);
	if @borrow_status = 2 then
		set out_ret = -10;
		set out_desc = '该标的已关闭';
		leave _return;
	end if;
	#必要验证项
	if ifnull(in_borrow_title, '') = '' then
		set out_ret = -11;
		set out_desc = '标的标题为空';
		leave _return;
	end if;
	if ifnull(in_img_path, '') = '' then
		set out_ret = -12;
		set out_desc = '标的头像为空';
		leave _return;
	end if;
	if in_borrow_amount <= 0 then
		set out_ret = -13;
		set out_desc = '借款总额小于等于0';
		leave _return;
	end if;
	if in_annual_rate <= 0 then
		set out_ret = -14;
		set out_desc = '借款年利率小于等于0';
		leave _return;
	end if;
	if @account_multiple > 0 then
		if (@account_multiple > in_borrow_amount) then
			set out_ret = -15;
			set out_desc = concat('借款金额最少为[', @account_multiple, ']');
			leave _return;
		end if;
#		set @account_num = in_borrow_amount % @account_multiple;
#		if (@account_num <> 0) then
#			set out_ret = -16;
#			set out_desc = concat('借款金额必须是[', @account_multiple, ']的倍数');
#			leave _return;
#		end if;
	end if;
	set in_borrow_credit = in_borrow_amount;
	if @apr_first > 0 && @apr_first > in_annual_rate then
		set out_ret = -19;
		set out_desc = concat('借款年利率范围[', @apr_first, '%]-[', @apr_end, '%]');
		leave _return;
	end if;
	if @apr_end > 0 && @apr_end < in_annual_rate then
		set out_ret = -20;
		set out_desc = concat('借款年利率范围[', @apr_first, '%]-[', @apr_end, '%]');
		leave _return;
	end if;
  #if curdate() >  in_publish_time then
		#set out_ret = -21;
	#	set out_desc = concat('发布时间必须大于或等于当前时间');
	#	leave _return;
  #if in_publish_time > curdate() then 
		#		set in_borrow_status = 7;
		#	else 
      
       set in_borrow_status = 2;
				
	#处理业务逻辑
	#发布借款
	start transaction;
		SELECT COUNT(1) as countM  into @countM FROM t_materialsauth where auditStatus = 3 and userid = in_userId;
		insert into t_borrow (borrowTitle, imgPath, borrowWay,hetong, borrowInfo, deadline, paymentMode,
		borrowAmount, annualRate, minTenderedSum, maxTenderedSum, raiseTerm, detail,retsource,isShow,projectIntro,safeMeasures, tradeType, publisher, excitationType,
		excitationSum,excitationMode, purpose, loanUserId, behalfUserId, hasPWD, investPWD, publishTime, publishIP, isDayThe, smallestFlowUnit, 
		circulationNumber, nid_log, frozen_margin,feestate,feelog,businessDetail,assets,moneyPurposes,agent,counterAgent,borrowShow,borrowType,publisherWay,borrowStatus,sort,authCount,borrowTypeSubId,projectScore,contract_id,bidTime,projectAddress,showRate,groupid,recommend)	
		values (in_borrow_title, in_img_path, in_borrow_way,in_hetong, in_borrow_info, in_deadline, in_payment_mode, 
		in_borrow_amount, in_annual_rate, in_min_tendered_sum, in_max_tendered_sum, in_raise_term, in_detail,in_retsource,0,in_projectIntro,in_safeMeasures, in_trade_type, in_publisher, in_excitation_type,
		in_excitation_sum, in_excitation_mode, in_purpose,in_loanUserId,in_behalfUserId, in_haspwd, in_investpwd, in_publish_time, in_publiship, in_isdaythe, in_smallest_flow_unit, 
		in_circulation_number, in_nid_log, in_frozen_margin,in_feestate,in_feelog,in_business_detail,in_assets,in_money_purposes,in_agent,in_counter_agent,in_borrow_show,in_borrow_type,2,in_borrow_status,10,@countM,in_borrow_subType,in_projectScorename,contract_id,inbidTime,inProjectAddress,inShowRate,inGroupid,0);
		#得到添加的借款ID
		set @borrow_id = last_insert_id();
		#借款管理费用表增加记录
    insert into t_borrow_manage_fee(borrowId, borrowTitle, customerCode, customerName, costType, costAmount, paymentStatus)
                values(@borrow_id,in_borrow_title,in_publisher,in_username,1,in_platUseFee, '1000');#平台使用费
    insert into t_borrow_manage_fee(borrowId, borrowTitle, customerCode, customerName, costType, costAmount, paymentStatus)
                values(@borrow_id,in_borrow_title,in_publisher,in_username,2,in_borrowFee, '1000');#借款手续费
    insert into t_borrow_manage_fee(borrowId, borrowTitle, customerCode, customerName, costType, costAmount, paymentStatus)
                values(@borrow_id,in_borrow_title,in_publisher,in_username,3,in_borrowManageFee, '1000');#借款管理费
    insert into t_borrow_manage_fee(borrowId, borrowTitle, customerCode, customerName, costType, costAmount, paymentStatus)
                values(@borrow_id,in_borrow_title,in_publisher,in_username,4,in_InstGuaranteeFee, '1000');#机构担保费
		if in_borrow_way = 6 then 
				#更新借款状态
				update t_borrow set circulationStatus= 2 ,auditTime= now(),
				autoBidEnableTime = DATE_ADD(now() ,INTERVAL 15 MINUTE)
				where  id = @borrow_id;
				#插入还款记录
				insert into t_repayment(repayPeriod,stillPrincipal,stillInterest,borrowId,principalBalance,interestBalance,repayDate)
				values('1/1',0,0,@borrow_id,0,0, DATE_ADD(now(),INTERVAL in_deadline MONTH));
			else 
				#更新借款状态
				update t_borrow set remainTimeStart	=	now(),	remainTimeEnd = DATE_ADD(now(),	INTERVAL raiseTerm DAY),
				autoBidEnableTime = DATE_ADD(now(),	INTERVAL 15 MINUTE)	where id	=	@borrow_id;
			end if;
		#生成通知模版
		set	t_mail_template	=	f_get_notice_template('borrow_cancel');
		set	t_mail_template = replace(t_mail_template,	'title', 	in_borrow_title);
		set	t_mail_template = replace(t_mail_template,	'date', now());
		set	t_mail_template = replace(t_mail_template,	'amount', in_borrow_amount); 
	
		set	t_email_template	=	f_get_notice_template('e_borrow_cancel');
		set	t_email_template = replace(t_email_template,	'title', in_borrow_title);
		set	t_email_template = replace(t_email_template,	'date', now());
		set	t_email_template = replace(t_email_template,	'amount', in_borrow_amount);
		#插入通知任务
		set	@username	=	'';
		set	@email	=	'';
		set	@telphone	=	'';
		select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
		t_person a on a.userId = b.id where b.id = in_publisher;
		set	t_sms_template	=	f_get_notice_template('s_borrow_cancel');
		set	t_sms_template = replace(t_sms_template,	'username', @username);
		set	t_sms_template = replace(t_sms_template,	'title', in_borrow_title);
		set	t_sms_template = replace(t_sms_template,	'date', now());
		set	t_sms_template = replace(t_sms_template,	'amount', in_borrow_amount);
		#借款路径
		set	t_content	=	f_link(in_bathpath,@borrow_id,in_borrow_title,'','','');
		#借款方式
		if in_borrow_way = 2 then
			#秒还借款要冻结借款利息+借款手续费+冻结保证金
			#计算借款手续费(@isDayThe 1 月标 2 天标)
			/**
			set	@locan_fee =0;
			set	@locan_month = 0;
			set	@locan_fee_month = 0;
			set	@day_fee	=	0;
			set	@borrowFeeRate = 0;
	  	select locan_fee,	locan_month,	locan_fee_month,	day_fee into @locan_fee,	@locan_month,	@locan_fee_month,	@day_fee
			from t_borrow_type_log  where identifier = in_nid_log;
			if @isDayThe =2 then 
				set @borrowFeeRate = (@day_fee / 365)/100;
			else 
				 if in_deadline > @locan_month then 
					set @borrowFeeRate = (@locan_fee + (in_deadline - @locan_month) * @locan_fee_month)/100;
				 else 
					set @borrowFeeRate =  @locan_fee /100;
				 end if;
			end if;
*/
			set @fee = 0;
			set @interest = 0;
			set @cost_fee = 0;
			set @interest = (in_borrow_amount * in_annual_rate * 0.01) / 12.0;
			#set @cost_fee = (in_borrow_amount * @borrowFeeRate);
			set @cost_fee = (in_platUseFee + in_borrowFee + in_borrowManageFee + in_InstGuaranteeFee); #平台使用费+借款手续费+借款管理费+机构担保费
			#set @fee = @interest  +@cost_fee+ in_frozen_margin;
			set @fee = @cost_fee+ in_frozen_margin;
			#update t_user  set  usableSum = usableSum - @fee , freezeSum = freezeSum + @fee where id = in_publisher; #modify by  cheney  2015-04-22
			update t_borrow set manageFee = manageFee + @cost_fee  where id = @borrow_id;
			set	t_content	=	concat('发布秒还借款[',	t_content,	'],冻结借款费(保证金+秒还借款费)');
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	
			select in_publisher, now(), 602, f_moneyDecode(602), @fee,a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
			-1,0, t_content, 0, '', '',0, @fee,b.borrowId  	from t_user a left join t_invest b on a.id = b.investor  where a.id = in_publisher group by a.id;
			#站内信
			set	t_mail_template = replace(t_mail_template,	'[秒还]', '秒还');
			set	t_mail_template = replace(t_mail_template,	'lines', '0');
			set	t_mail_template = replace(t_mail_template,	'fee', round(@fee,2));
			#邮件
			set	t_email_template = replace(t_email_template,	'[秒还]', '秒还');
			set	t_email_template = replace(t_email_template,	'lines', '0');
			set	t_email_template = replace(t_email_template,	'fee', round(@fee,2));
			#短信
			set	t_sms_template = replace(t_sms_template,	'[秒还]', '秒还');
			set	t_sms_template = replace(t_sms_template,	'lines', '0');
			set	t_sms_template = replace(t_sms_template,	'fee', round(@fee,2));
	elseif in_borrow_way <> 2 then
	#计算借款手续费(@isDayThe 1 月标 2 天标)
			set	@locan_fee =0;
			set	@locan_month = 0;
			set	@locan_fee_month = 0;
			set	@day_fee	=	0;
			set	@borrowFeeRate = 0;
	  	select locan_fee,	locan_month,	locan_fee_month,	day_fee into @locan_fee,	@locan_month,	@locan_fee_month,	@day_fee
			from t_borrow_type_log  where identifier = in_nid_log;
			if @isDayThe =2 then 
				set @borrowFeeRate = (@day_fee / 365)/100;
			else 
				 if in_deadline > @locan_month then 
					set @borrowFeeRate = (@locan_fee + (in_deadline - @locan_month) * @locan_fee_month)/100;
				 else 
					set @borrowFeeRate =  @locan_fee /100;
				 end if;
			end if;
			set @fee = 0;
			set @interest = 0;
			set @cost_fee = 0;
			set @interest = (in_borrow_amount * in_annual_rate * 0.01) / 12.0;
			#set @cost_fee = (in_borrow_amount * @borrowFeeRate);
			set @cost_fee = (in_platUseFee + in_borrowFee + in_borrowManageFee + in_InstGuaranteeFee); #平台使用费+借款手续费+借款管理费+机构担保费
			#set @fee = @interest  +@cost_fee+ in_frozen_margin;
			set @fee = @cost_fee+ in_frozen_margin;
			#update t_user  set  usableSum = usableSum - @fee , freezeSum = freezeSum + @fee where id = in_publisher; #modify by  cheney  2015-04-22
			update t_borrow  set manageFee = manageFee + @cost_fee  where id = @borrow_id;
	/*
		if in_frozen_margin > 0 then 
			#修改用户资金
			update t_user  set  usableSum = usableSum - in_frozen_margin , freezeSum = freezeSum + in_frozen_margin where id = in_publisher;
			set	t_content	=	concat('发布借款[',	t_content,	'],冻结保证金');
			#添加资金记录
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
			trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	select in_publisher, now(), 605, f_moneyDecode(605), in_frozen_margin,
			a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
			-1,0, t_content, 0, '', '', 0 ,in_frozen_margin,b.borrowId 	from t_user a left join t_invest b on a.id = b.investor  where a.id = in_uid group by a.id;
		end if ;
	*/
		if in_borrow_way =6 then 
			#站内信
			set	t_mail_template = replace(t_mail_template,	'[秒还]', '流转标');
			set	t_mail_template = replace(t_mail_template,	'lines', 0);
			#邮件
			set	t_email_template = replace(t_email_template,	'[秒还]','流转标');
			set	t_email_template = replace(t_email_template,	'lines', 0);
			#短信
			set	t_sms_template = replace(t_sms_template,	'[秒还]', '流转标');
			set	t_sms_template = replace(t_sms_template,	'lines', 0);
		else 
			#站内信
			set	t_mail_template = replace(t_mail_template,	'[秒还]', '');
			set	t_mail_template = replace(t_mail_template,	'lines', in_borrow_amount);
			#邮件
			set	t_email_template = replace(t_email_template,	'[秒还]','');
			set	t_email_template = replace(t_email_template,	'lines', in_borrow_amount);
			#短信
			set	t_sms_template = replace(t_sms_template,	'[秒还]', '');
			set	t_sms_template = replace(t_sms_template,	'lines', in_borrow_amount);
		end if;
			set	t_mail_template = replace(t_mail_template,	'fee', ifnull(in_frozen_margin,0));
			set	t_sms_template = replace(t_sms_template,	'fee', ifnull(in_frozen_margin,0));
			set	t_email_template = replace(t_email_template,	'fee', ifnull(in_frozen_margin,0));
		
		
	end if;
		#添加用户发布借款动态
		if in_borrow_way not in (1,2,6) then 
			set	t_content	=	f_link(in_bathpath,@borrow_id,in_borrow_title,'','','');
		end if; 
    #除了净值借款和秒还借款其他借款是要扣除可用信用额度
 #  if in_borrow_way not in (1,2,6) then 
	
 #  end if; 
		insert into t_user_recorelist(userId,  url, time)	values (in_uid, t_content, in_publish_time);
		insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
		values(in_uid,	'借款发布报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	@borrow_id,	now(),'initialization');
	 #更新申请、用户、借款关联表
   select DISTINCT isFirst INTO @isFirst FROM t_borrow_role where applyId = in_applyId; 
   if @isFirst = 0 then
     update t_borrow_role set borrowId =@borrow_id,isFirst = 1  where applyId = in_applyId;
   else 
     insert into t_borrow_role (userId,applyId,borrowId,isFirst) VALUES(in_userId,in_applyId,@borrow_id,1);
   end if;
if	_error	<>	0	then
		rollback;
		set out_ret = -111;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_join
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_join`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_join`(IN `in_bid` BIGINT,IN `in_uid` BIGINT,IN `in_basepath` VARCHAR(255),IN `in_invest_amount` DECIMAL(18,2),IN `in_invest_time` DATETIME, IN `in_status` INT , IN `in_num` INT , IN  `in_billcode`      VARCHAR(255),IN `in_voucher_amount` DECIMAL(18,2),OUT out_ret INT, OUT out_desc VARCHAR(100), OUT out_ordid VARCHAR(100))
_return:BEGIN
  #投资标旳
  DECLARE t_mail_template  VARCHAR(2048) DEFAULT '';
  DECLARE t_email_template VARCHAR(2048) DEFAULT '';
  DECLARE t_sms_template   VARCHAR(2048) DEFAULT '';
  DECLARE t_content        VARCHAR(1024) DEFAULT '';
  DECLARE _error           INT DEFAULT 0;
  DECLARE sbs              VARCHAR(20) DEFAULT ''; #字符串截取
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
  SET out_ordid = '-1';
  SET out_ret = -1;
  SET out_desc = '执行失败';
  SET @user_usableSum = NULL; #可用余额是否符合投标金额
  SET @dealpwd = ''; #交易密码是否正确
  SELECT usableSum
       , dealpwd
  INTO
    @user_usableSum, @dealpwd
  FROM
    t_user
  WHERE
    id = in_uid;
  IF @user_usableSum IS NULL THEN
    SET out_ret = -2;
    SET out_desc = '用户不存在';
    LEAVE _return;
  END IF;
  IF @user_usableSum < in_invest_amount THEN
    SET out_ret = -3;
    SET out_desc = CONCAT('可用余额为[', @user_usableSum, ']元,不满足本轮投标,请充值');
    LEAVE _return;
  END IF;
  #if(in_dealpwd != @dealpwd) then
  #	set out_ret = -4;
  #set out_desc = '交易密码错误';
  #leave _return;
  #end if;
  #招标中的借款才可以进行投标
  SET @id = 0;
  SET @t_frozen_margin = 0;
  SET @borrowAmount = 0;
  SET @hasInvestAmount = 0;
  SET @borrowStatus = 1;
  SET @minTenderedSum = NULL;
  SET @maxTenderedSum = NULL;
  SET @publisher = -1;
  SET @version = 0;
  SET @borrowTitle = NULL;
  SET @borrowWay = 1;
  SET @auditTime = NULL;
  SET @excitationType = 0;
  SET @excitationSum = 0;
  SET @circulationNumber = 0;
  SET @hasCirculationNumber = 0;
  SET @annualRate = NULL;
  SET @monthRate = 0;
  SET @t_deadline = 0;
  SET @isDayThe = 1;
  SET @borrowerName = NULL;
  SET @totalInterest = 0; #流转标应得本息
  SET @maxInvest = 0; #合和年最多投标人数
  SET @investNum = 0; #实际投标人数
  SET @isDayThe = 1;
  #select id, borrowAmount, hasInvestAmount, borrowStatus, minTenderedSum, maxTenderedSum, publisher,version,borrowTitle
  #into @id, @borrowAmount, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @publisher,@version,@borrowTitle
  #from	t_borrow	where id = in_bid;
  SELECT a.id
       , a.hasInvestAmount
       , a.borrowStatus
       , a.minTenderedSum
       , a.maxTenderedSum
       , a.borrowWay
       , a.auditTime
       , a.excitationType
       , a.excitationSum
       , a.circulationNumber
       , a.version
       , a.annualRate
       , (a.annualRate / 12)
       , a.borrowAmount
       , a.deadline
       , a.borrowTitle
       , a.publisher
       , a.isDayThe
       , b.username
       , a.frozen_margin
       , a.hasCirculationNumber
       , a.isDayThe
  INTO
    @id, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @borrowWay, @auditTime, @excitationType, @excitationSum, @circulationNumber, @version, @annualRate, @monthRate, @borrowAmount, @t_deadline, @borrowTitle, @publisher, @isDayThe, @borrowerName, @t_frozen_margin, @hasCirculationNumber, @isDayThe
  FROM
    t_borrow a
  LEFT JOIN t_user b
  ON a.publisher = b.id
  WHERE
    a.id = in_bid;
  SELECT COUNT(DISTINCT investor)
  INTO
    @investNum
  FROM
    t_invest
  WHERE
    borrowId = in_bid; #实际投标人数
  SELECT COUNT(1)
  INTO
    @investorFlag
  FROM
    t_invest
  WHERE
    borrowId = in_bid
    AND investor = in_uid
    AND investor IN (SELECT investor
                     FROM
                       t_invest
                     WHERE
                       borrowId = in_bid
                     GROUP BY
                       investor);
  SET @creditrang = 0;
  SET @manageFee = 0;
  SELECT costFee
  INTO
    @manageFee
  FROM
    t_platform_cost
  WHERE
    alias = 'investFeeRate';
  IF @id IS NULL THEN
    SET out_ret = -5;
    SET out_desc = '不存在的借款';
    LEAVE _return;
  END IF;
  IF @maxInvest > 0 AND @maxInvest = @investNum AND @investorFlag = 0 THEN
    SET out_ret = -9527;
    SET out_desc = '已超过投资人限定的最大投标人数';
    LEAVE _return;
  END IF;
  IF @borrowStatus <> 2 THEN
    SET out_ret = -6;
    SET out_desc = '非招标中的借款';
    LEAVE _return;
  END IF;
  IF @hasInvestAmount >= @borrowAmount THEN
    SET out_ret = -7;
    SET out_desc = '投标异常的借款';
    LEAVE _return;
  END IF;
  IF @publisher = in_uid THEN
    SET out_ret = -99;
    SET out_desc = '不能投自己发布的标的';
    LEAVE _return;
  END IF;
  SET @remainAmount = IFNULL(@borrowAmount, 0) - IFNULL(@hasInvestAmount, 0);
  IF in_invest_amount > @remainAmount THEN
    SET out_ret = -8;
    SET out_desc = '投标金额超过本轮剩余投标金额';
    LEAVE _return;
  END IF;
  #当剩余金额小于最新投标金额，直接跳过验证
  IF @remainAmount > @minTenderedSum THEN
    IF in_invest_amount > @maxTenderedSum && @maxTenderedSum <> -1 THEN
      SET out_ret = -9;
      SET out_desc = '投标金额超过本轮最多投标金额';
      LEAVE _return;
    END IF;
    IF in_invest_amount < @minTenderedSum && @minTenderedSum <> -1 THEN
      SET out_ret = -10;
      SET out_desc = '投标金额不足本轮最低投标金额';
      LEAVE _return;
    END IF;
  END IF;
  SET @total = in_invest_amount + @hasInvestAmount; #投资总额=本次投资金额+已投标金额
  IF @total > @borrowAmount THEN
    SET out_ret = -11;
    SET out_desc = '投标金额超出借款总额';
    LEAVE _return;
  END IF;
  START TRANSACTION;
  UPDATE t_borrow
  SET
    VERSION = VERSION + 1
  WHERE
    id = in_bid
    AND borrowStatus = 2
    AND borrowAmount > hasInvestAmount
    AND VERSION = @version;
  SET @ret_update = ROW_COUNT();
  IF @ret_update = 0 THEN
    ROLLBACK;
    SET out_ret = -12;
    SET out_desc = '抢投的借款';
    LEAVE _return;
  END IF;
  #更新借款信息中的已投资总额和数量
  #update t_borrow set investNum	=	investNum	+	1	,hasInvestAmount = hasInvestAmount	+	in_invest_amount where id = in_bid  and borrowStatus = 2	and borrowAmount	>	hasInvestAmount	;
  #增加投资记录
  INSERT INTO t_billcode (pMerBillNo,inserTime,borrowId,`status`,investAmount) VALUES (in_billcode,in_invest_time,in_bid,1,in_invest_amount+in_voucher_amount);
  #INSERT INTO t_invest (investAmount, realAmount, investTime, deadline, monthRate, billcode) VALUES (in_invest_amount, in_invest_amount, in_invest_time, @t_deadline, @monthRate, in_billcode);
  #SET out_ordid = LAST_INSERT_ID();
  /*
			#投资人投资成功资金冻结
			#update t_user set usableSum = usableSum - in_invest_amount where id = in_uid;
			#更新借款比例
			update t_borrow  set amount_scale = hasInvestAmount  / borrowAmount  * 100  where  id = in_bid;
			set	t_mail_template	=	f_get_notice_template('tender');
			set	t_mail_template = replace(t_mail_template,	'title', @borrowTitle);
			set	t_mail_template = replace(t_mail_template,	'[voluntarily]', '');
			set	t_mail_template = replace(t_mail_template,	'date', now());
			set	t_mail_template = replace(t_mail_template,	'investAmount', in_invest_amount);
	
			set	t_email_template	=	f_get_notice_template('e_tender');
			set	t_email_template = replace(t_email_template,	'title', @borrowTitle);
			set	t_email_template = replace(t_email_template,	'[voluntarily]', '');
			set	t_email_template = replace(t_email_template,	'date', now());
			set	t_email_template = replace(t_email_template,	'investAmount', in_invest_amount);
		
			#插入通知任务
			set	@username	=	'';
			set	@email	=	'';
			set	@telphone	=	'';
			select a.cellphone,	b.username,	b.email	into	@telphone,	@username,	@email from	 t_user	b left	join
				t_person	a	on	a.userId	=	b.id	where	b.id	=	in_uid;
			set	t_sms_template	=	f_get_notice_template('s_tender');
			set	t_sms_template = replace(t_sms_template,  'username', @username);
			set	t_sms_template = replace(t_sms_template,	'title', @borrowTitle);
			set	t_sms_template = replace(t_sms_template,	'[voluntarily]', '');
			set	t_sms_template = replace(t_sms_template,	'date', now());
			set	t_sms_template = replace(t_sms_template,	'investAmount', in_invest_amount);
			insert	into	t_notice_task(user_id,sendtitle,s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
			values(in_uid, '理财投资报告','capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_bid,	now(),	'borrow');
			set	t_content	=	f_link(in_basepath,in_bid,@borrowTitle,'','','');	
			set	t_content	=	concat('投标借款[',	t_content,	'],冻结投标金额');
			                 
			#添加资金记录
			insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
					trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	select in_uid, now(), 653, f_moneyDecode(653), in_invest_amount,
					a.usableSum as usableSum, a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
					-1,0, t_content, 0, in_bid, '', 0 ,in_invest_amount,b.borrowId	from t_user a left join t_invest b on a.id = b.investor 
					where a.id = in_uid group by a.id;
		#本次投标如果达到满标条件就更新为满标状态
		update t_borrow set borrowStatus =3, remainTimeStart = remainTimeEnd ,sort =5  where id = in_bid and borrowAmount = hasInvestAmount and borrowStatus = 2;
*/
  IF _error <> 0 THEN
    ROLLBACK;
    SET out_ret = -13;
    SET out_desc = '执行异常'; 
    LEAVE _return;
  END IF;
  COMMIT;
  SET out_ret = 1;
  SET out_desc = in_billcode;
  SET out_ordid = "";
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_join_call_back
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_join_call_back`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_join_call_back`(IN `in_bid` BIGINT,IN `in_ordid` BIGINT,IN `in_uid` BIGINT,IN `in_basepath` VARCHAR(255),IN `in_invest_amount` DECIMAL(18,2),IN `in_invest_time` DATETIME, IN `in_status` INT , IN `in_num` INT , IN  `in_pMerBillNo`    VARCHAR(255),IN  `in_pIpsBillNo`  VARCHAR(255), IN `in_isAutoBid`  INT, OUT out_ret INT, OUT out_desc VARCHAR(100))
_return:
BEGIN
  #投资标旳
  DECLARE t_mail_template  VARCHAR(2048) DEFAULT '';
  DECLARE t_email_template VARCHAR(2048) DEFAULT '';
  DECLARE t_sms_template   VARCHAR(2048) DEFAULT '';
  DECLARE t_content        VARCHAR(1024) DEFAULT '';
  DECLARE _error           INT DEFAULT 0;
  DECLARE sbs              VARCHAR(20) DEFAULT ''; #字符串截取
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
  SET out_ret = -1;
  SET out_desc = '执行失败';
  SET @user_usableSum = NULL; #可用余额是否符合投标金额
  SET @dealpwd = ''; #交易密码是否正确
  SELECT usableSum
       , dealpwd
  INTO
    @user_usableSum, @dealpwd
  FROM
    t_user
  WHERE
    id = in_uid;
  IF @user_usableSum IS NULL THEN
    SET out_ret = -2;
    SET out_desc = '用户不存在';
    LEAVE _return;
  END IF;
  IF @user_usableSum < in_invest_amount THEN
    SET out_ret = -3;
    SET out_desc = CONCAT('可用余额为[', @user_usableSum, ']元,不满足本轮投标,请充值');
    LEAVE _return;
  END IF;
  #招标中的借款才可以进行投标
  SET @id = 0;
  SET @t_frozen_margin = 0;
  SET @borrowAmount = 0;
  SET @hasInvestAmount = 0;
  SET @borrowStatus = 1;
  SET @minTenderedSum = NULL;
  SET @maxTenderedSum = NULL;
  SET @publisher = -1;
  SET @version = 0;
  SET @borrowTitle = NULL;
  SET @borrowWay = 1;
  SET @auditTime = NULL;
  SET @excitationType = 0;
  SET @excitationSum = 0;
  SET @circulationNumber = 0;
  SET @hasCirculationNumber = 0;
  SET @annualRate = NULL;
  SET @monthRate = 0;
  SET @t_deadline = 0;
  SET @isDayThe = 1;
  SET @borrowerName = NULL;
  SET @totalInterest = 0; #流转标应得本息
  SET @maxInvest = 0; #合和年最多投标人数
  SET @investNum = 0; #实际投标人数
  SELECT a.id
     , a.hasInvestAmount
     , a.borrowStatus
     , a.minTenderedSum
     , a.maxTenderedSum
     , a.borrowWay
     , a.auditTime
     , a.excitationType
     , a.excitationSum
     , a.circulationNumber
     , a.version
     , a.annualRate
     , (a.annualRate / 12)
     , a.borrowAmount
     , a.deadline
     , a.borrowTitle
     , a.publisher
     , a.isDayThe
     , b.username
     , a.hasCirculationNumber
INTO
  @id, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @borrowWay, @auditTime, @excitationType, @excitationSum, @circulationNumber, @version, @annualRate, @monthRate, @borrowAmount, @t_deadline, @borrowTitle, @publisher, @isDayThe, @borrowerName, @hasCirculationNumber
FROM
  t_borrow a
LEFT JOIN t_user b
ON a.publisher = b.id
WHERE
  a.id = in_bid;
  SELECT COUNT(DISTINCT investor)
  INTO
    @investNum
  FROM
    t_invest
  WHERE
    borrowId = in_bid; #实际投标人数
  SELECT COUNT(1)
  INTO
    @investorFlag
  FROM
    t_invest
  WHERE
    borrowId = in_bid
    AND investor = in_uid
    AND investor IN (SELECT investor
                     FROM
                       t_invest
                     WHERE
                       borrowId = in_bid
                     GROUP BY
                       investor);
  IF @id IS NULL THEN
    SET out_ret = -5;
    SET out_desc = '不存在的借款';
    LEAVE _return;
  END IF;
  IF @borrowStatus <> 2 THEN
    SET out_ret = -6;
    SET out_desc = '非招标中的借款';
    LEAVE _return;
  END IF;
  IF @hasInvestAmount >= @borrowAmount THEN
    SET out_ret = -7;
    SET out_desc = '投标异常的借款';
    LEAVE _return;
  END IF;
  SET @remainAmount = IFNULL(@borrowAmount, 0) - IFNULL(@hasInvestAmount, 0);
  IF in_invest_amount > @remainAmount THEN
    SET out_ret = -8;
    SET out_desc = '投标金额超过本轮剩余投标金额';
    LEAVE _return;
  END IF;
  #当剩余金额小于最新投标金额，直接跳过验证
  IF @remainAmount > @minTenderedSum THEN
    IF in_invest_amount > @maxTenderedSum && @maxTenderedSum <> -1 THEN
      SET out_ret = -9;
      SET out_desc = '投标金额超过本轮最多投标金额';
      LEAVE _return;
    END IF;
    IF in_invest_amount < @minTenderedSum && @minTenderedSum <> -1 THEN
      SET out_ret = -10;
      SET out_desc = '投标金额不足本轮最低投标金额';
      LEAVE _return;
    END IF;
  END IF;
  SET @total = in_invest_amount + @hasInvestAmount; #投资总额=本次投资金额+已投标金额
  IF @total > @borrowAmount THEN
    SET out_ret = -11;
    SET out_desc = '投标金额超出借款总额';
    LEAVE _return;
  END IF;
  START TRANSACTION;
  #更新借款信息中的已投资总额和数量
  UPDATE t_borrow
  SET
    investNum = investNum + 1, hasInvestAmount = hasInvestAmount + in_invest_amount
  WHERE
    id = in_bid
    AND borrowStatus = 2
    AND borrowAmount > hasInvestAmount;
  #更新投资记录	
   #UPDATE t_invest
  #SET
   # borrowId = in_bid, investor = in_uid, oriInvestor = in_uid, assurer = in_assId
  #WHERE
   # id = in_ordid;
  #INSERT INTO t_invest (investAmount, realAmount, investTime, deadline, monthRate, billcode) VALUES (in_invest_amount, in_invest_amount, in_invest_time, @t_deadline, @monthRate, in_billcode);
  
  INSERT INTO t_invest (investAmount, realAmount, investor, oriInvestor, investTime, borrowId, deadline, monthRate, billcode, trxId, isAutoBid) VALUES (
  in_invest_amount, in_invest_amount, in_uid, in_uid, in_invest_time, in_bid, @t_deadline, @monthRate, in_pMerBillNo,in_pIpsBillNo,in_isAutoBid
  );
  
  #投资人投资成功资金冻结
  UPDATE t_user
  SET
    usableSum = usableSum - in_invest_amount, freezeSum = freezeSum + in_invest_amount
  WHERE
    id = in_uid;
  #更新借款比例
  UPDATE t_borrow
  SET
    amount_scale = hasInvestAmount / borrowAmount * 100
  WHERE
    id = in_bid;
  SET t_mail_template = f_get_notice_template('tender');
  SET t_mail_template = REPLACE(t_mail_template, 'title', @borrowTitle);
  SET t_mail_template = REPLACE(t_mail_template, '[voluntarily]', '');
  SET t_mail_template = REPLACE(t_mail_template, 'date', NOW());
  SET t_mail_template = REPLACE(t_mail_template, 'investAmount', in_invest_amount);
  SET t_email_template = f_get_notice_template('e_tender');
  SET t_email_template = REPLACE(t_email_template, 'title', @borrowTitle);
  SET t_email_template = REPLACE(t_email_template, '[voluntarily]', '');
  SET t_email_template = REPLACE(t_email_template, 'date', NOW());
  SET t_email_template = REPLACE(t_email_template, 'investAmount', in_invest_amount);
  #插入通知任务
  SET @username = '';
  SET @email = '';
  SET @telphone = '';
  SELECT a.cellphone
       , b.username
       , b.email
  INTO
    @telphone, @username, @email
  FROM
    t_user b
  LEFT JOIN
  t_person a
  ON a.userId = b.id
  WHERE
    b.id = in_uid;
  SET t_sms_template = f_get_notice_template('s_tender');
  SET t_sms_template = REPLACE(t_sms_template, 'username', @username);
  SET t_sms_template = REPLACE(t_sms_template, 'title', @borrowTitle);
  SET t_sms_template = REPLACE(t_sms_template, '[voluntarily]', '');
  SET t_sms_template = REPLACE(t_sms_template, 'date', NOW());
  SET t_sms_template = REPLACE(t_sms_template, 'investAmount', in_invest_amount);
  INSERT INTO t_notice_task (user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify) VALUES (in_uid, '理财投资报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, in_bid, NOW(), 'borrow');
  SET t_content = f_link(in_basepath, in_bid, @borrowTitle, '', '', '');
  SET t_content = CONCAT('投标借款[', t_content, '],冻结投标金额');
  SET @a = in_pIpsBillNo;
  IF in_pIpsBillNo = '' THEN
    SET @a = in_pMerBillNo;
  END IF;
  UPDATE t_billcode
  SET
    pIpsBillNo = @a
  WHERE
    pMerBillNo = in_pMerBillNo;
  #添加资金记录
  INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum, trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost, spending, borrow_id)
  SELECT in_uid
       , NOW()
       , 653
       , f_moneyDecode(653)
       , in_invest_amount
       , a.usableSum AS usableSum
       , a.freezeSum AS freezeSum
       , SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest)
       , -1
       , 0
       , t_content
       , 0
       , in_bid
       , ''
       , 0
       , in_invest_amount
       , b.borrowId
  FROM
    t_user a
  LEFT JOIN t_invest b
  ON a.id = b.investor
  WHERE
    a.id = in_uid
  GROUP BY
    a.id;
  #本次投标如果达到满标条件就更新为满标状态
  UPDATE t_borrow
  SET
    borrowStatus = 3, remainTimeStart = remainTimeEnd, sort = 5
  WHERE
    id = in_bid
    AND borrowAmount = hasInvestAmount
    AND borrowStatus = 2;
  IF _error <> 0 THEN
    ROLLBACK;
    SET out_ret = -13;
    SET out_desc = '执行异常';
    LEAVE _return;
  END IF;
  COMMIT;
  SET out_ret = 1;
  SET out_desc = 'ok';
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_overdue_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_overdue_update`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_overdue_update`(out out_ret int, out out_desc varchar(100))
_return:begin
	declare	_error	int	default	0;
	declare continue handler for sqlexception set _error	=	1;
	set out_ret = -1;
	set out_desc = '执行失败';
	
	start transaction;	#主函数中设置事务为手动提交，次函数不要设置也不要commit
		
		#更新逾期标的
		update t_repayment a,t_borrow b set a.isLate = 2,a.lateDay =DATEDIFF(now(),a.repayDate),
		a.lateFI =(DATEDIFF(now(),a.repayDate))*(a.stillPrincipal+a.stillInterest)*(ifnull(f_parsing_json(b.feelog,'overdueFeeRate'),0)),
		executeTime = now() where DATE_FORMAT(a.repayDate,'%Y-%m-%d') < now() and a.repayStatus = 1 and a.borrowid=b.id and b.borrowWay <> 6;
		
		#更新收款的逾期标的
		update t_invest_repayment a,(select b.id,b.repayDate,c.feelog from t_invest_repayment a left join t_repayment b on a.repayid=b.id left join t_borrow c 
		on b.borrowid=c.id where a.repayStatus=1 and c.borrowWay <> 6) b set a.isLate = 2,a.lateDay =DATEDIFF(now(),a.repayDate),
		a.recivedFI =(DATEDIFF(now(),a.repayDate))*(a.recivedPrincipal+a.recivedInterest)*(ifnull(f_parsing_json(b.feelog,'overdueFeeRate'),0))
		where DATE_FORMAT(b.repayDate,'%Y-%m-%d') < now() and a.repayStatus = 1 and a.repayId=b.id;
		
	if	_error	<>	0	then
		rollback; 
		set out_ret = -9;
	  set out_desc = '执行异常'; 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_repayment
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_repayment`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_repayment`(IN `in_pid` BIGINT,IN `in_uid` BIGINT,IN `in_dealpwd` VARCHAR(200),IN `in_basepath` VARCHAR(100),IN `in_pay_time` DATETIME,IN `in_ifeerate` DECIMAL(18,6),IN in_payType BIGINT, OUT out_ret INT, OUT out_desc VARCHAR(100))
    DETERMINISTIC
_return:BEGIN
		DECLARE t_content VARCHAR(1024)	DEFAULT	'';	#信息
		DECLARE	t_mail_template	VARCHAR(2048)	DEFAULT	'';	#站内信模版
		DECLARE	t_email_template	VARCHAR(2048)	DEFAULT	'';	#邮件模版
		DECLARE	t_sms_template	VARCHAR(2048)	DEFAULT	'';	#短信模版
		DECLARE	t_payment_mode	VARCHAR(100)	DEFAULT	'';	#还款方式
		DECLARE	t_principal	DECIMAL(18)	DEFAULT	0;	#本金
		DECLARE	_error	INT	DEFAULT	0;	#错误定义
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error	=	1;	#异常标识
		#标旳还款
		SET out_ret = -1; 
		SET out_desc = '执行失败';
		SET @repay_status = NULL;	#还款状态
		SET @needPI = 0;	#应还本金#
		SET	@lateFI = 0;	#逾期罚息
		SET @needSum = 0;	#应还金额
		SET @deadline = 0;	#借款期数
		SET @hasDeadline = 0;	#已还期数
		SET	@version	=	0;	#版本控制
		SET @isWebRepay	= 1;	#是否网站垫付
		SET @borrowId	= -1;	#借款ID
		SET @ret_update = -1;	#更新状态码
		SET	@borrowTitle	=	'';	#借款标题
		SET	@borrowWay	=	1;	#借款类型
		SET	@stillPrincipal	=	0;	#应还本金
		SET	@stillInterest	=	0;	#应还利息
		SET	@isDayThe	=	1;	#天标、月标
		SET	@borrowAmount	=	0;	#借款金额
		SET	@repayPeriod	=	'';	#还款期数
		SET	@borrower	=	-1;	#借款人
		SET @repaydate='';#还款时间
		SET @crediting=0;#用户信用积分
		SET	@paymentMode = -1; #还款方式
		SELECT	a.id,	(a.stillPrincipal	+	a.stillInterest	-	a.hasPI)	needPI,	a.lateFI,	a.version,	b.deadline,	b.hasDeadline,
				a.isWebRepay,	a.borrowId , a.repayStatus,	 	b.borrowTitle,	b.borrowWay,	a.stillPrincipal,	a.stillInterest,	b.isDayThe,
				b.borrowAmount,	a.repayPeriod,	b.publisher,a.repayDate,b.paymentMode	INTO @aid,	@needPI,	@lateFI,	@version,	@deadline,	@hasDeadline,	@isWebRepay,	@borrowId,	
				@repay_status, 	@borrowTitle,	@borrowWay,	@stillPrincipal,	@stillInterest,	@isDayThe,	@borrowAmount,	@repayPeriod,	@borrower,@repaydate,@paymentMode
				FROM t_repayment	a	LEFT	JOIN	t_borrow	b	ON	a.borrowId	=	b.id WHERE a.repayStatus = 1 AND a.id =	in_pid;
		SET @needPI	= IFNULL(@needPI,0);
		SET @lateFI	= IFNULL(@lateFI,0);
		SET @needSum	=	@needPI	+	@lateFI;
		SET	t_principal	=	@stillPrincipal;
		IF @repay_status IS NULL	||	@needSum <=0	||	@deadline	<=	@hasDeadline THEN
				SET out_ret = -2;
				SET out_desc = '该笔还款已处理';
				LEAVE _return;
		END IF;
		IF	@borrower	<>	in_uid	THEN
				SET out_ret = -3; 
				SET out_desc = '还款用户错误';
				LEAVE _return;
		END	IF;
		SET @amount = 0;
		SELECT usableSum INTO @amount FROM t_user WHERE id	=	in_uid;
		IF @amount	<	@needSum THEN
				SET out_ret = -4; 
				SET out_desc = CONCAT('还款金额[',@needSum,'],可用金额[',@amount,'],请充值.');
				LEAVE _return;
		END IF;
		SET @dealpwd = NULL;
		SELECT dealpwd INTO @dealpwd FROM t_user WHERE id =	in_uid;
   #前台还款需校验交易密码，后台还款无需交易密码
#   IF in_payType = 1 THEN 
#		IF @dealpwd IS NULL THEN
#				SET out_ret = -5; 
#				SET out_desc = '交易密码为空错误';
#				LEAVE _return;
#		END IF;
#		IF @dealpwd <> in_dealpwd THEN
#				SET out_ret = -6; 
#				SET out_desc = '交易密码错误';
#				LEAVE _return;
#		END IF;
#   END IF;
		#处理业务逻辑
		START TRANSACTION;
				#防止重复提交
				UPDATE t_repayment SET VERSION	=	VERSION	+	1	WHERE id = in_pid AND repayStatus	= 1	AND VERSION	=	@version;
				SET @ret_update = ROW_COUNT();
				IF @ret_update = 0 THEN
						ROLLBACK;
						SET out_ret = -7;
						SET out_desc = '已处理的还款';
						LEAVE _return;
				END IF;
				IF	@isWebRepay = 1 THEN
						IF @borrowWay < 6  THEN 
								#需还款给投资人的罚息 = 罚息
								SET @late_fi_invest= @lateFI;
								#更新投资人的资金动向
								SET @ret = -1;
								SET @ret_desc = '';
								CALL p_invest_action(@borrowId,	in_pid,	4,	1,	@late_fi_invest,	@borrowWay,	@borrowAmount,	in_ifeerate,	@repayPeriod,	in_pay_time,	@stillPrincipal,
										@stillInterest,	0,	0,	0,	0,	in_basepath,	@ret,	@ret_desc);
								IF @ret < 0 THEN  #操作不成功回滚处理
										ROLLBACK;
										SET out_ret = -8;
										SET out_desc = '还款投资人出错';
										LEAVE _return;
								END IF;
						END IF;
				ELSEIF	@isWebRepay = 2 THEN
						#需还款给投资人的罚息 = 罚息
						SET @late_fi_invest= @lateFI;
						#更新投资人的资金动向
						SET @ret = -1;
						SET @ret_desc = '';
 
						CALL p_invest_action(@borrowId, in_pid, 4, 1, @late_fi_invest, @borrowWay, @borrowAmount, in_ifeerate, @repayPeriod, in_pay_time, @stillPrincipal,
						@stillInterest, 0, 0, 0, 0, in_basepath, @ret, @ret_desc);
						IF @ret < 0 THEN  #操作不成功回滚处理
							ROLLBACK;
							SET out_ret = -8;
							SET out_desc = '还款投资人出错';
							
							LEAVE _return;
						END IF;
						#偿还给网站累加到风险保障金中
						INSERT INTO t_risk_detail(riskBalance,	riskInCome,	riskDate,	riskType,	resource,	trader,	borrowId)
								SELECT (sum(riskInCome)-sum(riskSpending)),	@needSum,	NOW(),	'收入',	'逾期垫付网站收入',	in_uid,	@borrowId FROM t_risk_detail;
				END IF;
				#更新还款状态
				UPDATE t_repayment SET hasPI = @needPI,	repayStatus	=	2,	realRepayDate	=	in_pay_time,	hasFI = @lateFI	WHERE id = in_pid;
				#更新借款人的资金
				#扣除还款金额
				UPDATE t_user SET usableSum = usableSum - @needPI WHERE id = in_uid;
				SET	t_content	=	f_link(in_basepath,@borrowId,@borrowTitle,'','','');
				SET	t_content	=	CONCAT('对借款[',	t_content,	']还款');
				SET	t_content	=	CONCAT(t_content,	f_moneyDecode(604),	'[',@needPI,']元');
				INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
						trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	SELECT in_uid, NOW(), 604, f_moneyDecode(604), @needPI,
						a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
						-1,0, t_content, 0, in_pid, '', 0	,@needPI,@borrowId FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor  WHERE a.id = in_uid GROUP BY a.id;
				IF	@lateFI	>0	THEN
						#扣除还款罚息金额
						UPDATE t_user SET usableSum = usableSum - @lateFI WHERE id = in_uid;
						SET	t_content	=	f_link(in_basepath,@borrowId,@borrowTitle,'','','');
						SET	t_content	=	CONCAT('对借款[',	t_content,	']支付逾期罚息');
						SET	t_content	=	CONCAT(t_content,	f_moneyDecode(603),	'[',@lateFI,']元');
						INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
								trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id)	SELECT in_uid, NOW(), 603, f_moneyDecode(603), @lateFI,
								a.usableSum AS usableSum, a.freezeSum AS freezeSum, IFNULL(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
								-1,0, t_content, 0, in_pid, '', 0  ,@lateFI,@borrowId	FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor  WHERE a.id = in_uid GROUP BY a.id;
				END	IF; 
				#生成通知模版
				SET	t_mail_template	=	f_get_notice_template('repayment_success');
				SET	t_mail_template = REPLACE(t_mail_template,	'title', 	@borrowTitle);
				SET	t_mail_template = REPLACE(t_mail_template,	'date', NOW());
				SET	t_mail_template = REPLACE(t_mail_template,	'needSum', @needSum);
				SET	t_email_template	=	f_get_notice_template('e_repayment_success');
				SET	t_email_template = REPLACE(t_email_template,	'title', @borrowTitle);
				SET	t_email_template = REPLACE(t_email_template,	'date', NOW());
				SET	t_email_template = REPLACE(t_email_template,	'needSum', @needSum);
				#插入通知任务
				SET	@username	=	'';
				SET	@email	=	'';
				SET	@telphone	=	'';
				SELECT a.cellphone, b.username, b.email INTO @telphone, @username, @email FROM t_user b LEFT JOIN
						t_person a ON a.userId = b.id WHERE b.id = in_uid;
				SET	t_sms_template	=	f_get_notice_template('s_repayment_success');
				SET	t_sms_template = REPLACE(t_sms_template,	'username', @username);
				SET	t_sms_template = REPLACE(t_sms_template,	'title', @borrowTitle);
				SET	t_sms_template = REPLACE(t_sms_template,	'date', NOW());
				SET	t_sms_template = REPLACE(t_sms_template,	'needSum', @needSum);
			/*	#返还信用额度,(除了净值借款)---------------------modiffy  by cheney 2015-06-29
				IF	@borrowWay	NOT IN (1,2,6)	THEN
						SET	t_principal	=	@stillPrincipal;
					#	UPDATE t_user SET usableCreditLimit = usableCreditLimit	+	t_principal	WHERE	id	=	in_uid;
						SET	t_mail_template = REPLACE(t_mail_template,	'stillPrincipal', t_principal);
						SET	t_email_template = REPLACE(t_email_template,	'stillPrincipal', t_principal);
						SET	t_sms_template = REPLACE(t_sms_template,	'stillPrincipal', t_principal);
				#ELSE	
						SET	t_mail_template = REPLACE(t_mail_template,	'stillPrincipal', 0);
						SET	t_email_template = REPLACE(t_email_template,	'stillPrincipal', 0);
						SET	t_sms_template = REPLACE(t_sms_template,	'stillPrincipal', 0);
			#	END	IF;
		*/
				INSERT	INTO	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
						VALUES(in_uid,	'借款还款报告',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	in_pid,	NOW(),	'repay');
				IF @borrowWay  = 6  THEN 
						UPDATE t_borrow SET borrowStatus=5 ,sort = 2  WHERE id=@borrowId AND borrowStatus =4;
				ELSE
						#更新借款还款期数	
						IF @isDayThe = 2 THEN
								UPDATE t_borrow SET borrowStatus = 5 ,sort = 3, hasDeadline = deadline WHERE borrowStatus = 4 AND id =	@borrowId;
						ELSE
								UPDATE t_borrow SET hasDeadline = hasDeadline+1 WHERE id = @borrowId;
								IF @paymentMode = 4 THEN
										UPDATE t_borrow SET borrowStatus = 5 ,sort = 3, hasDeadline = deadline WHERE borrowStatus = 4 AND id =	@borrowId;
								ELSE
										UPDATE t_borrow SET borrowStatus = 5,	sort = 3,	hasDeadline = hasDeadline+1 WHERE deadline	<= hasDeadline AND	borrowStatus = 4 AND id =	@borrowId;
								END IF;
						END	IF;
				END IF;
				SELECT creditrating INTO @crediting FROM t_user WHERE id=in_uid;
				IF _error	<> 0 THEN
						ROLLBACK;
						SET out_ret = -9; 
						SET out_desc = '执行异常';
						LEAVE _return;
				ELSE	
				SELECT  IFNULL(COUNT(*),0) counts INTO @counts FROM t_repayment a LEFT JOIN t_borrow b ON a.borrowId=b.id WHERE 
						0 <= DATEDIFF(repayDate,NOW()) AND 15 >= DATEDIFF(repayDate,NOW()) AND a.id =	in_pid;
				IF @counts >0 THEN
						UPDATE t_user SET creditrating = @crediting+1 WHERE id=in_uid;
				END IF;
				SELECT  IFNULL(COUNT(*),0) counts INTO @counts FROM t_repayment a LEFT JOIN t_borrow b 
						ON a.borrowId=b.id WHERE 16 < DATEDIFF(repayDate,NOW())  AND a.id =	in_pid;
				IF @counts >0 THEN
						UPDATE t_user SET creditrating = @crediting+3 WHERE id=in_uid;
				END IF;
				SELECT IFNULL(COUNT(*),0) counts  INTO @counts FROM t_repayment a LEFT JOIN t_borrow b 
						ON a.borrowId=b.id WHERE a.lateDay  BETWEEN 1 AND 10  AND a.id =	in_pid;
				IF @counts >0 THEN
						UPDATE t_user SET creditrating = @crediting-3 WHERE id=in_uid;
				END IF;
				SELECT IFNULL(COUNT(*),0) counts  INTO @counts FROM t_repayment a LEFT JOIN t_borrow b 
						ON a.borrowId=b.id WHERE a.lateDay  BETWEEN 11 AND 30  AND a.id =	in_pid;
				IF @counts >0 THEN
					 UPDATE t_user SET creditrating = @crediting-10 WHERE id=in_uid;
				END IF;
				SELECT IFNULL(COUNT(*),0) counts INTO @counts FROM t_repayment a LEFT JOIN t_borrow b 
						ON a.borrowId=b.id WHERE a.lateDay  BETWEEN 31 AND 90  AND a.id =	in_pid;
				IF @counts >0 THEN
					 UPDATE t_user SET creditrating = @crediting-30 WHERE id=in_uid;
				END IF;
				SELECT IFNULL(COUNT(*),0) counts INTO @counts FROM t_repayment a LEFT JOIN t_borrow b 
						ON a.borrowId=b.id WHERE a.lateDay > 90 AND a.id =	in_pid;
				IF @counts >0 THEN
						UPDATE t_user SET creditrating = @crediting-50 WHERE id=in_uid;
				END IF;
				COMMIT;
				SET out_ret = @ret; 
				SET out_desc = @ret_desc;
		END	IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_repaymentinit
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_repaymentinit`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_repaymentinit`(IN `in_bid` BIGINT,OUT out_ret INT, OUT out_desc VARCHAR(100))
_return:BEGIN
		DECLARE	_error	INT	DEFAULT	0;	#异常标记
	  
	#-------------修复资金定义--------------------------
	declare t_repairPrincipal decimal(18,4) default 0;
	 
	declare t_repairInterest decimal(18,4) default 0;
	 
	declare t_comparePrincipal decimal(18,4) default 0;
	declare t_compareInterest decimal(18,4) default 0;
	  
	declare t_repairCount int default 0;
	 
	declare t_repairId bigint default -1;
	 
	declare t_updateCount int default 0;
	 
	declare t_updatePrincipal decimal(18,4) default 0;
	 
	declare t_updateInterest decimal(18,4) default 0;
	declare t_maxRepaymentId  bigint default -1;
	declare t_repaymentCount  bigint default -1;
	declare t_invest_repaymentCount  bigint default -1;
	 
	 
	 declare  _done int default 0; 
	 
	declare cursor_name cursor for (select id,stillPrincipal,stillInterest from t_repayment where borrowId = in_bid);
	  
	declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
	#-------------修复资金定义--------------------------
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error	=	1;	#sqlexception返回值
	 
	#--------------------------------------------------------------资金纠偏-------------------------------
	#-- 资金修正开始-wbb 2014-12-9-------
	 UPDATE t_invest set recievedInterest=TRUNCATE(recievedInterest,2) where borrowId=in_bid;
	UPDATE t_invest_repayment SET recivedInterest = TRUNCATE(recivedInterest, 2), recivedPrincipal = TRUNCATE(recivedPrincipal, 2) WHERE borrow_id = in_bid;
	set _done = 0;
		
	 
	open cursor_name;
	fetch cursor_name into t_repairId,t_repairPrincipal,t_repairInterest;-- !!
	while _done <> 1 do
	select sum(recivedPrincipal),sum(recivedInterest),count(1) into t_comparePrincipal,t_compareInterest,t_repairCount from t_invest_repayment where repayId = IFNULL(t_repairId,-1);
	set t_repairPrincipal = IFNULL(t_repairPrincipal,0);
	 
	set t_repairInterest = IFNULL(t_repairInterest,0);
	 
	set t_comparePrincipal = IFNULL(t_comparePrincipal,0);
	 
	set t_compareInterest = IFNULL(t_compareInterest,0);
	 
	set t_repairCount = IFNULL(t_repairCount,0);
	 
	select id into t_updateCount from t_invest_repayment where repayId = IFNULL(t_repairId,-1) order by id desc limit 1;
	select id into t_maxRepaymentId from t_repayment where borrowId = in_bid  order by id desc limit 1;
	select COUNT(1) into t_repaymentCount from t_repayment where borrowId = in_bid ;
	SELECT COUNT(1) into t_invest_repaymentCount from t_invest_repayment where borrow_id=in_bid ;
	IF t_repaymentCount>1 THEN
	#分期还款
			IF t_maxRepaymentId = t_repairId and t_repairCount>1 THEN
						call  p_borrow_deal_full_invest(in_bid,t_repairId,@ret,	@ret_desc);
						if @ret < 0 then  #操作不成功回滚处理
													rollback;
													set out_ret = -8;
													set out_desc = '纠正投资人金额出错';
													leave _return;
											end if;
			END IF;
			 
			if  t_repairCount>1 then 
			 
			-- set t_updateCount = (t_repairCount - 1);
			 
			select sum(recivedPrincipal) into t_updatePrincipal from t_invest_repayment where repayId = IFNULL(t_repairId,-1) and id != t_updateCount;-- t_updateCount
			 
			update t_invest_repayment set recivedPrincipal = t_repairPrincipal - t_updatePrincipal where repayId = IFNULL(t_repairId,-1) and id=t_updateCount;
			 
			end if;
			 
			if t_repairCount>1 then 
			 
			-- set t_updateCount = (t_repairCount - 1);
			 
			select sum(recivedInterest) into t_updateInterest from t_invest_repayment where repayId = IFNULL(t_repairId,-1) and id != t_updateCount;-- t_updateCount
			 
			update t_invest_repayment set recivedInterest = t_repairInterest - t_updateInterest where repayId = IFNULL(t_repairId,-1) and id=t_updateCount;
			 
			end if;
	end IF;
	IF t_repaymentCount=1 THEN
	#一次性还款
			if t_invest_repaymentCount>1 THEN
				#多人投资
					select sum(recivedInterest) into t_updateInterest from t_invest_repayment where repayId = IFNULL(t_repairId,-1) and id != t_updateCount;
					update t_invest_repayment set recivedInterest = t_repairInterest - t_updateInterest where repayId = IFNULL(t_repairId,-1) and id=t_updateCount;
			END if ;
	END IF;
	 
			 
	set _done = 0;
	fetch cursor_name into t_repairId,t_repairPrincipal,t_repairInterest;
	 
	end while;
	close cursor_name;
	UPDATE t_invest a, (select invest_id, sum(recivedInterest) as sum,sum(recivedPrincipal) as sumPrincipal from t_invest_repayment where borrow_id=in_bid group by invest_id) b set a.recievedInterest = b.sum,a.check_interest = b.sum where a.id = b.invest_id;
	#-- 资金修正结束-wbb 2014-12-9-------------------
	IF	_error	<>	0	THEN
			ROLLBACK; 
			SET out_ret = -9;
		  SET out_desc = '系统执行异常'; 
	 
		LEAVE _return;
		ELSE	
			SET out_ret = 1;
			SET out_desc = '';
		END	IF;
	
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_repayment_overdue
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_repayment_overdue`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_repayment_overdue`(IN `in_pid` bigint,IN `in_aid` bigint,IN `in_basepath` varchar(100),IN `in_pay_time` datetime,IN `in_ifeerate` decimal(18,6), out out_ret int, out out_desc varchar(100))
_return:BEGIN
	declare t_content varchar(1024)	default	'';	#信息
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare	t_payment_mode	varchar(100)	default	'';	#还款方式
	declare	t_principal	decimal(18)	default	0;	#本金
	declare	_error	int	default	0;	#错误定义
	declare continue handler for sqlexception set _error	=	1;	#异常标识
	#标旳还款
	set out_ret = -1; 
	set out_desc = '执行失败';
  set @repay_status = Null;	#还款状态
  set @needPI = 0;	#还款本息
  set	@lateFI = 0;	#逾期罚息
  set @needSum = 0;	#还款金额
	set @deadline = 0;	#借款期限
	set @hasDeadline = 0;	#已还期数
	set	@version	=	0;	#版本控制
	set @isWebRepay	= 1;	#是否网站垫付
	set @borrowId	= -1;	#借款ID
	set @ret_update = -1;	#更新状态码
	set	@borrowTitle	=	'';	#借款标题
	set	@borrowWay	=	1;	#借款类型
	set	@stillPrincipal	=	0;	#应还本金
	set	@stillInterest	=	0;	#应还利息
	set	@isDayThe	=	1;	#天标、月标
	set	@borrowAmount	=	0;	#借款金额
	set	@repayPeriod	=	'';	#还款期数
	set	@nid_log	=	'';	#费用标识
	set	@lateDay	=	0;	#逾期天数
	set	@borrower	=	-1;	#借款id
  select	a.id,	(a.stillPrincipal	+	a.stillInterest	-	a.hasPI)	needPI,	a.lateFI,	a.version,	b.deadline,	b.hasDeadline,
	a.isWebRepay,	a.borrowId , a.repayStatus,	b.id,	b.borrowTitle,	b.borrowWay,	a.stillPrincipal,	a.stillInterest,	b.isDayThe,
  b.borrowAmount,	a.repayPeriod,	b.nid_log,	a.lateDay,	b.publisher	into @aid,	@needPI,	@lateFI,	@version,	@deadline,	@hasDeadline,	@isWebRepay,
	@borrowId,	@repay_status,	@borrowId,	@borrowTitle,	@borrowWay,	@stillPrincipal,	@stillInterest,	@isDayThe,	@borrowAmount,	@repayPeriod,
	@nid_log,	@lateDay,	@borrower	from	t_repayment	a	left	join	t_borrow	b	on	a.borrowId	=	b.id where a.repayStatus = 1 and a.id =	in_pid;
	set @needPI	= ifnull(@needPI,0);
	set @lateFI	= ifnull(@lateFI,0);
	set @needSum	=	@needPI	+	@lateFI;
	set	t_principal	=	@stillPrincipal;
  if @repay_status is Null	||	@needSum <=0	||	@deadline	<=	@hasDeadline then
		set out_ret = -2; 
		set out_desc = '该笔还款已处理';
		leave _return;
  end if;
	set	@late_days_month	=	0;
	set	@late_days_day	=	0;
	select late_days_month,late_days_day into @late_days_month,@late_days_day from t_borrow_type_log where identifier = @nid_log;
	if	@borrowWay	<>	2	then
		if	@isDayThe	=	1	then
			if	@lateDay	<	@late_days_month	then
				set out_ret = -3;
				set out_desc = concat('离垫付时间还差[',(@late_days_month-@lateDay),']天');
				leave _return;
			end	if;
		else
			if	@lateDay	<	@late_days_day	then
				set out_ret = -4;
				set out_desc = concat('离垫付时间还差[',(@late_days_day-@lateDay),']天');
				leave _return;
			end	if;
		end	if;
	else
		set out_ret = -5;
		set out_desc = '该标的无需垫付';
		leave _return;
	end	if;
  #处理业务逻辑
  start transaction;
		#更新投资人的资金动向
		set @ret = -1;
		set @ret_desc = '';
		call p_invest_action(@borrowId,	in_pid,	4,	2,	0,	@borrowWay,	@borrowAmount,	in_ifeerate,	@repayPeriod,	in_pay_time,	@stillPrincipal,
		@stillInterest,	0,	0,	0,	0,	in_basepath,	@ret,	@ret_desc);
		if	@ret < 0 then  #操作不成功回滚处理
			rollback;
			set out_ret = -6;
			set out_desc = '还款投资人失败';
			leave _return;
		end if;
		#垫付借款扣除风险保障金
		insert into t_risk_detail(riskBalance,	riskSpending,	riskDate,	riskType,	resource,	trader,	borrowId) 
		select (sum(riskInCome)-sum(riskSpending)),	(@stillPrincipal	+	@stillInterest),	now(),	'支出',	'垫付逾期借款',	@borrower,
		@borrowId from t_risk_detail;
		#更新还款状态为网站垫付
		update	t_repayment	set	isWebRepay	=	2	where	id	=	in_pid;
		if	_error	<>	0	then
			rollback;
			set out_ret = -7;
			set out_desc = '执行异常';
			leave _return;
		else	
			commit;
			set out_ret = 1;
			set out_desc = '';
		end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_borrow_time_deal
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_borrow_time_deal`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_borrow_time_deal`(out out_ret int, out out_desc varchar(100))
_return:begin
	declare t_id bigint	default -1;
	declare t_borrow_amount	decimal(18,2) default	0;
	declare	t_has_amount	decimal(18,2)	default	0;
	declare _done int default 0;
	declare	_error	int	default	0;
 
	declare cursor_name cursor for (select id from t_assignment_debt where date_add(publishTime, interval 1 day)<=now() and debtStatus=2);
	declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
	declare continue handler for sqlexception set _error	=	1;
	set out_ret = -1;
	set out_desc = '执行失败';
	
	start transaction;	#主函数中设置事务为手动提交，次函数不要设置也不要commit
		#当前时间小于剩余结束时间,剩余开始时间为当前时间
		update t_borrow set remainTimeStart = now() where remainTimeStart < remainTimeEnd and borrowStatus = 2	and remainTimeEnd > now();
		
		open cursor_name;
			#循环执行  
      fetch cursor_name into	t_id,	t_borrow_amount,	t_has_amount;
			while _done <> 1 do
					
					if	t_has_amount	=	t_borrow_amount	and	t_has_amount	>	0	then
						update t_borrow set remainTimeStart = remainTimeEnd,	borrowStatus =	3,	sort =	5	where	id	=	t_id;
					else	
						set	@web_root	=	'';
						select `value`	into	@web_root from t_options where id=-1;
						call p_invest_action(t_id,	-1,	6,	'标的超期未满标',	@web_root,	@ret,	@ret_desc);
					end	if;
				fetch cursor_name into	t_id,	t_borrow_amount,	t_has_amount;
			end	while;
		close	cursor_name;
	
	if	_error	<>	0	then
		rollback; 
		set out_ret = -9;
	  set out_desc = '执行异常'; 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_credit_static
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_credit_static`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_credit_static`(IN `in_uid` bigint)
BEGIN
	declare t_crediting varchar(200) default '0';
	declare t_credit varchar(200) default '0';
	declare t_username varchar(200) default '';
	declare	t_personalHead	varchar(200) default '';
	declare t_createTime varchar(200) default '';
	declare t_vipCreateTime varchar(200) default '';
	declare t_lastDate varchar(200) default '';
	declare t_nativePlacePro varchar(200) default '';
	declare t_nativePlaceCity varchar(200) default '';
	declare t_registedPlacePro varchar(200) default '';
	declare t_registedPlaceCity varchar(200) default '';
	declare t_pre_count	varchar(200) default '0';
	declare	t_pre_score	varchar(200) default '0';
	declare t_pre_16_count	varchar(200) default '0';
	declare	t_pre_16_score	varchar(200) default '0';
	declare t_over_10_count	varchar(200) default '0';
	declare	t_over_10_score	varchar(200) default '0';
	declare t_over_30_count	varchar(200) default '0';
	declare	t_over_30_score	varchar(200) default '0';
	declare t_over_90_count	varchar(200) default '0'; 
	declare	t_over_90_score	varchar(200) default '0';
	declare t_over_91_count	varchar(200) default '0';
	declare	t_over_91_score	varchar(200) default '0';
	declare t_nomal_count	varchar(200) default '0';
	declare	t_nomal_score	varchar(200) default '0';
	declare t_materrial_1_status varchar(10) default '';
	declare	t_materrial_1_score	varchar(200) default '';
	declare t_materrial_2_status varchar(10) default '';
	declare	t_materrial_2_score	varchar(200) default '';
	declare t_materrial_3_status varchar(10) default '';
	declare	t_materrial_3_score	varchar(200) default '';
	declare t_materrial_4_status varchar(10) default '';
	declare	t_materrial_4_score	varchar(200) default '';
	declare t_materrial_5_status varchar(10) default '';
	declare	t_materrial_5_score	varchar(200) default '';
	declare t_materrial_6_status varchar(10) default '';
	declare	t_materrial_6_score	varchar(200) default '';
	declare t_materrial_7_status varchar(10) default '';
	declare	t_materrial_7_score	varchar(200) default '';
	declare t_materrial_8_status varchar(10) default '';
	declare	t_materrial_8_score	varchar(200) default '';
	declare t_materrial_9_status varchar(10) default '';
	declare	t_materrial_9_score	varchar(200) default '';
	declare t_materrial_10_status varchar(10) default '';
	declare	t_materrial_10_score	varchar(200) default '';
	declare t_materrial_11_status varchar(10) default '';
	declare	t_materrial_11_score	varchar(200) default '';
	declare t_materrial_12_status varchar(10) default '';
	declare	t_materrial_12_score	varchar(200) default '';
	declare t_materrial_13_status varchar(10) default '';
	declare	t_materrial_13_score	varchar(200) default '';
	declare t_materrial_14_status varchar(10) default '';
	declare	t_materrial_14_score	varchar(200) default '';
	declare t_materrial_15_status varchar(10) default '';
	declare	t_materrial_15_score	varchar(200) default '';
	declare t_materrial_16_status varchar(10) default '';
	declare	t_materrial_16_score	varchar(200) default '';
	declare t_person_status varchar(10) default '';
	declare	t_person_score	varchar(200) default '';
	declare t_work_status varchar(10) default '';
	declare	t_work_score	varchar(200) default '';
	declare t_borrow_count	varchar(200)	default	'0';
	declare	t_invest_count	varchar(200)	default	'0';
	#declare	_error	int	default	0;	#异常标记
	#declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	#用户额度信息
	set	@creditrating = 0;
	set	@credit	= 0;
	select creditrating,f_credit_rating(creditrating) credit into @creditrating,@credit from t_user where id = in_uid;
	set	t_crediting	= @creditrating;
	set	t_credit = @credit;
	#提前还款
	set	@counts = 0;
	set	@score = 0;
	select  IFNULL(count(*),0) counts, IFNULL(count(*),0) * 1 score  into @counts,	@score from t_repayment a left join t_borrow b on a.borrowId=b.id where 
	0 <= DATEDIFF(repayDate,realRepayDate) and 15 >= DATEDIFF(repayDate,realRepayDate) and b.publisher= in_uid;
	set	t_pre_count	=	@counts;
	set	t_pre_score = @score;
	#提前还款超过16天的还款统计和分数
	set	@counts = 0;
	set	@score = 0;
	select  IFNULL(count(*),0) counts, IFNULL(count(*),0) * 3 score into @counts, @score from t_repayment a left join t_borrow b 
	on a.borrowId=b.id where 16 < DATEDIFF(repayDate,realRepayDate)  and b.publisher= in_uid ;
	set	t_pre_16_count 	= @counts;
	set	t_pre_16_score	=	@score;
	#逾期还款的统计 和分数1-10天
	set	@counts = 0;
	set	@score = 0;
	select IFNULL(count(*),0) counts ,IFNULL(count(*),0) * -3 score into @counts, @score from t_repayment a left join t_borrow b 
	on a.borrowId=b.id where a.lateDay  BETWEEN 1 and 10  and b.publisher= in_uid and a.repayStatus=2;
	set	t_over_10_count 	= @counts;
	set	t_over_10_score		=	@score;
	#逾期还款的统计 和分数11-30天
	set	@counts = 0;
	set	@score = 0;
	select IFNULL(count(*),0) counts ,IFNULL(count(*),0) * -10 score into @counts, @score from t_repayment a left join t_borrow b 
	on a.borrowId=b.id where a.lateDay  BETWEEN 11 and 30  and b.publisher= in_uid and a.repayStatus=2;
	set	t_over_30_count 	= @counts;
	set	t_over_30_score		=	@score;
	#逾期还款的统计 和分数31-90天
	set	@counts = 0;
	set	@score = 0;
	select IFNULL(count(*),0) counts ,IFNULL(count(*),0) * -30 score into @counts, @score from t_repayment a left join t_borrow b 
	on a.borrowId=b.id where a.lateDay  BETWEEN 31 and 90  and b.publisher= in_uid and a.repayStatus=2;
	set	t_over_90_count 	= @counts;
	set	t_over_90_score		=	@score;
	#逾期还款的统计 和分数91天
	set	@counts = 0;
	set	@score = 0;
	select IFNULL(count(*),0) counts ,IFNULL(count(*),0) * -50 score into @counts, @score from t_repayment a left join t_borrow b 
	on a.borrowId=b.id where a.lateDay  BETWEEN 31 and 90  and b.publisher= in_uid and a.repayStatus=2;
	set	t_over_91_count 	= @counts;
	set	t_over_91_score		=	@score;
	#身份证
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 1;
	set	t_materrial_1_status	=	@auditStatus;
	set	t_materrial_1_score	=	@criditing;
	#工作认证
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 2;
	set	t_materrial_2_status	=	@auditStatus;
	set	t_materrial_2_score	=	@criditing;
	#居住地认证
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 3;
	set	t_materrial_3_status	=	@auditStatus;
	set	t_materrial_3_score	=	@criditing;
	#信用报告
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 4;
	set	t_materrial_4_status	=	@auditStatus;
	set	t_materrial_4_score	=	@criditing;
	#收入认证
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 5;
	set	t_materrial_5_status	=	@auditStatus;
	set	t_materrial_5_score	=	@criditing;
	#房产
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 6;
	set	t_materrial_6_status	=	@auditStatus;
	set	t_materrial_6_score	=	@criditing;
	#购车
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 7;
	set	t_materrial_7_status	=	@auditStatus;
	set	t_materrial_7_score	=	@criditing;
	#结婚
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 8;
	set	t_materrial_8_status	=	@auditStatus;
	set	t_materrial_8_score	=	@criditing;
	#学历
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 9;
	set	t_materrial_9_status	=	@auditStatus;
	set	t_materrial_9_score	=	@criditing;
	#技术
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 10;
	set	t_materrial_10_status	=	@auditStatus;
	set	t_materrial_10_score	=	@criditing;
	#手机
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 11;
	set	t_materrial_11_status	=	@auditStatus;
	set	t_materrial_11_score	=	@criditing;
	#微博
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 12;
	set	t_materrial_12_status	=	@auditStatus;
	set	t_materrial_12_score	=	@criditing;
	#现场
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 13;
	set	t_materrial_13_status	=	@auditStatus;
	set	t_materrial_13_score	=	@criditing;
	#抵押认证
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 14;
	set	t_materrial_14_status	=	@auditStatus;
	set	t_materrial_14_score	=	@criditing;
	#机构担保
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 15;
	set	t_materrial_15_status	=	@auditStatus;
	set	t_materrial_15_score	=	@criditing;
	#其他资料
	set	@auditStatus = '';
	set	@criditing = 0;
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '待上传' end auditStatus,
	ifnull(criditing,0) criditing into	@auditStatus,	@criditing from t_materialsauth where userId = in_uid and materAuthTypeId = 16;
	set	t_materrial_16_status	=	@auditStatus;
	set	t_materrial_16_score	=	@criditing;
	#个人信息
	set	@auditStatus = '';
	set	@credit	=	'0';
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '未填写' end auditStatus,
	case auditStatus when 3 then 10 else 0 end credit	into	@auditStatus,	@credit	from t_person where userId = in_uid;
	set	t_person_status = @auditStatus;
	set	t_person_score	=	@credit;
	#工作认证
	set	@auditStatus = '';
	set	@credit	=	'0';
	select case auditStatus when 1 then '审核中' when 2 then '审核失败' when 3 then '通过' else '未填写' end auditStatus,
	case auditStatus when 3 then 10 else 0 end credit	into	@auditStatus,	@credit	from t_workauth where userId = in_uid;
	set	t_work_status = @auditStatus;
  set t_work_score = @credit;
	set	@credit1	=	'0';
	select case directedStatus when 3 then 10 else 0 end credit1	into @credit1	from t_workauth where userId = in_uid;
  set t_work_score = @credit1 + t_work_score;
	set	@credit2	=	'0';
	select case otherStatus when 3 then 10 else 0 end credit2	into @credit2	from t_workauth where userId = in_uid;
  set t_work_score = @credit2 + t_work_score;
  set	@credit3	=	'0';
	select case moredStatus when 3 then 10 else 0 end credit1	into @credit3	from t_workauth where userId = in_uid;
  set t_work_score = @credit3 + t_work_score;
  
	#个人信息汇总
	set	@username	=	'';
	set	@createtime	=	'';
	set	@vipCreateTime	=	'';
	set	@lastDate	=	'';
	set	@nativePlacePro	=	'';
	set	@nativePlaceCity	=	'';
	set	@registedPlacePro	=	'';
	set	@registedPlaceCity	=	'';
	set	@personalHead	=	'';
	select a.username, a.createtime,DATE_ADD(a.vipCreateTime,INTERVAL 1 year)	vipCreateTime,a.lastDate,c.regionName nativePlacePro,d.regionName nativePlaceCity
	,e.regionName  registedPlacePro,f.regionName registedPlaceCity,	b.personalHead into	@username,	@createtime,	@vipCreateTime,	@lastDate,	@nativePlacePro,
	@nativePlaceCity,	@registedPlacePro,	@registedPlaceCity,	@personalHead	from t_user	a left join t_person b on b.userId = a.id	left join t_region c on
	b.nativePlacePro = c.regionId left join t_region d on b.nativePlaceCity = d.regionId	left join t_region e on b.registedPlacePro = e.regionId left join
	t_region f on b.registedPlaceCity = f.regionId where a.id = in_uid;
	set t_username =	@username;
	set	t_personalHead	=	@personalHead;
	set t_createTime =	@createtime;
	set t_vipCreateTime =	@vipCreateTime;
	set t_lastDate =	@lastDate;
	set t_nativePlacePro =	@nativePlacePro;
	set t_nativePlaceCity =	@nativePlaceCity;
	set t_registedPlacePro =	@registedPlacePro;
	set t_registedPlaceCity =	@registedPlaceCity;
	#借款总数
	set	@borrow_count	=	0;
	select count(1) into	@borrow_count	from t_borrow where publisher =	in_uid;
	set	t_borrow_count	=	@borrow_count;
	#投资总数
	set	@invest_count	=	0;
	select count(1) into	@invest_count	from t_invest where investor =	in_uid;
	set	t_invest_count	=	@invest_count;
	
	select t_crediting, t_credit, t_pre_count, t_pre_score,	t_pre_16_count,	t_pre_16_score,	t_over_10_count,	t_over_10_score,	
	t_over_30_count,	t_over_30_score,	t_over_90_count,	t_over_90_score,	t_over_91_count,	t_over_91_score,	t_materrial_1_status,
	t_materrial_1_score,	t_materrial_2_status,	t_materrial_2_score,	t_materrial_3_status,	t_materrial_3_score,	t_materrial_4_status,
	t_materrial_4_score,	t_materrial_5_status,	t_materrial_5_score,	t_materrial_6_status,	t_materrial_6_score,	t_materrial_7_status,
	t_materrial_7_score,	t_materrial_8_status,	t_materrial_8_score,	t_materrial_9_status,	t_materrial_9_score,	t_materrial_10_status,
	t_materrial_10_score,	t_materrial_11_status,	t_materrial_11_score,	t_materrial_12_status,	t_materrial_12_score,	t_materrial_13_status,
	t_materrial_13_score,	t_materrial_14_status,	t_materrial_14_score,	t_materrial_15_status,	t_materrial_15_score,	t_materrial_16_status,
	t_materrial_16_score,	t_person_status,	t_person_score,	t_work_status,	t_work_score,	t_username,	t_createTime,	t_vipCreateTime,	t_lastDate,
	t_nativePlacePro,	t_nativePlaceCity,	t_registedPlacePro,	t_registedPlaceCity,	t_borrow_count,	t_invest_count;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_deleteKefu
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_deleteKefu`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_deleteKefu`(IN f_string varchar(1000),IN f_delimiter varchar(5))
BEGIN
		#Routine body goes here...
		DECLARE cnt int DEFAULT 0;
		DECLARE i int DEFAULT 0; 
		#拆分得到长度
		SET cnt = f_split_TotalLength(f_string,f_delimiter); 
		WHILE i < cnt 
			DO    
			SET i = i + 1;  
				DELETE FROM t_user_kefu WHERE id = f_split(f_string,f_delimiter,i);
		END WHILE;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_deleteMailBox
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_deleteMailBox`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_deleteMailBox`(IN f_string varchar(1000),IN f_delimiter varchar(5))
BEGIN
		#Routine body goes here...
		DECLARE cnt int DEFAULT 0;
		DECLARE i int DEFAULT 0; 
		#拆分得到长度
		SET cnt = f_split_TotalLength(f_string,f_delimiter); 
		WHILE i < cnt 
			DO    
			SET i = i + 1;  
				UPDATE t_mail set backgroundStatus=2 WHERE id = f_split(f_string,f_delimiter,i);
		END WHILE;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_deleteMediaReport
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_deleteMediaReport`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_deleteMediaReport`(IN f_string varchar(1000),IN f_delimiter varchar(5))
    COMMENT '通过字符串的拼接和拆分，实现多个删除新闻报道'
BEGIN
		#Routine body goes here...
		DECLARE cnt int DEFAULT 0;
		DECLARE i int DEFAULT 0; 
		#拆分得到长度
		SET cnt = f_split_TotalLength(f_string,f_delimiter); 
		WHILE i < cnt 
			DO    
			SET i = i + 1;  
				DELETE FROM t_mediareport WHERE id = f_split(f_string,f_delimiter,i);
		END WHILE;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_deleteNews
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_deleteNews`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_deleteNews`(IN f_string varchar(1000),IN f_delimiter varchar(5))
BEGIN
		#Routine body goes here...
		DECLARE cnt int DEFAULT 0;
		DECLARE i int DEFAULT 0; 
		#拆分得到长度
		SET cnt = f_split_TotalLength(f_string,f_delimiter); 
		WHILE i < cnt 
			DO    
			SET i = i + 1;  
				DELETE FROM t_news WHERE id = f_split(f_string,f_delimiter,i);
		END WHILE;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_deleteStory
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_deleteStory`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_deleteStory`(IN f_string varchar(1000),IN f_delimiter varchar(5))
BEGIN
		#Routine body goes here...
		DECLARE cnt int DEFAULT 0;
		DECLARE i int DEFAULT 0; 
		#拆分得到长度
		SET cnt = f_split_TotalLength(f_string,f_delimiter); 
		WHILE i < cnt 
			DO    
			SET i = i + 1;  
				DELETE FROM t_successStory WHERE id = f_split(f_string,f_delimiter,i);
		END WHILE;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_deleteTeam
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_deleteTeam`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_deleteTeam`(IN f_string varchar(1000),IN f_delimiter varchar(5))
BEGIN
		#Routine body goes here...
		DECLARE cnt int DEFAULT 0;
		DECLARE i int DEFAULT 0; 
		#拆分得到长度
		SET cnt = f_split_TotalLength(f_string,f_delimiter); 
		WHILE i < cnt 
			DO    
			SET i = i + 1;  
				DELETE FROM t_team WHERE id = f_split(f_string,f_delimiter,i);
		END WHILE;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_education_fee_deducte
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_education_fee_deducte`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_education_fee_deducte`(out out_ret int, out out_desc varchar(100))
_return:begin
	declare t_id bigint	default -1;
	declare t_money	decimal(18,2) default	0;
	declare	t_uid	bigint	default	-1;
	declare	t_uname	varchar(200) default	'';
	declare t_usable_sum	decimal(18,2) default	0;
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare	t_content	varchar(200)	default	'';
	declare _done int default 0;
	declare	_error	int	default	0;
 
	declare cursor_name cursor for (select a.id,a.userId,a.freeEducation,b.username,b.usableSum from t_education_cost a
	left join t_user b on a.userId=b.id where a.status = 1	and	b.usableSum >= a.freeEducation);
	declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
	declare continue handler for sqlexception set _error	=	1;
	set out_ret = -1;
	set out_desc = '执行失败';
	
	start transaction;	#主函数中设置事务为手动提交，次函数不要设置也不要commit
		open cursor_name;
			#循环执行  
      fetch cursor_name into	t_id,	t_uid,	t_money,	t_uname,	t_usable_sum;
			while _done <> 1 do
					if	t_usable_sum > 0 then
						#更新学历认证费用为已付
            update t_education_cost set status = 2 where id = t_id;
            #扣除学历认证费
            update t_user set usableSum = usableSum - t_money  where id = t_uid;
						
						set	t_content	=	concat('管理员已对您的学历进行了审核，本次产生的费用为[',t_money,']元');
						insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
						trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost , spending,borrow_id)	select t_uid, now(), 802, f_moneyDecode(802), t_money,
						a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
						-1, 0, t_content, 0, t_id, '', 0 , t_money, b.borrowId	from t_user a left join t_invest b on a.id = b.investor  where a.id = t_uid group by a.id;
						
						set	t_mail_template	=	f_get_notice_template('approve_edu_success');
						set	t_mail_template = replace(t_mail_template,	'freeEducation', t_money);
						set	t_email_template	=	f_get_notice_template('e_approve_edu_success');
						set	t_email_template = replace(t_email_template,	'username', t_uname);
						set	t_email_template = replace(t_email_template,	'freeEducation', t_money);
						#插入通知任务
						set	@username	=	'';
						set	@email	=	'';
						set	@telphone	=	'';
						select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
						t_person a on a.userId = b.id where b.id = 	t_uid;
						set	t_sms_template	=	f_get_notice_template('s_approve_edu_success');
						set	t_mail_template = replace(t_mail_template,	'freeEducation', t_money);
						insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
						values(t_uid,	'学历认证费',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	t_id,	now(),	'education');
					end	if;
				fetch cursor_name into	t_id,	t_uid,	t_money,	t_uname,	t_usable_sum;
			end	while;
		close	cursor_name;
	
	if	_error	<>	0	then
		rollback; 
		set out_ret = -9;
	  set out_desc = '执行异常'; 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_enterprise_userInfo_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_enterprise_userInfo_update`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_enterprise_userInfo_update`(IN in_userId BIGINT,IN `in_companyName` varchar(20),IN `in_legalPerson` varchar(20),IN in_registeredTime VARCHAR(20),IN `in_registeredCapital` varchar(20),IN `in_businessCode` varchar(50),IN `in_companyAddress` varchar(200),IN `in_companyPhone` varchar(20),IN `in_borrowCause` varchar(200),IN in_applyId bigint,OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:BEGIN
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	SET @u_num = 0;
  SET @r_num = 0;
  SET @num = 1;
	
	SELECT COUNT(1) INTO @u_num from t_enterprise WHERE userId = in_userId;
	start transaction;
	
	IF @u_num = 0 THEN
	
	INSERT into t_enterprise (companyName, legalPerson, registeredTime, registeredCapital, businessCode, companyAddress, companyPhone,
						borrowCause, userId) 
						VALUES (in_companyName,in_legalPerson,in_registeredTime,in_registeredCapital,in_businessCode,in_companyAddress,in_companyPhone,
						in_borrowCause,in_userId);
		
	INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
						VALUES ("t_enterprise","",1,"",NOW(),"填写企业详细资料",1);
	/*	#添加借款、申请、用户关联表
			 insert into t_borrow_role (userId,applyId,authStep) VALUES(in_userId,in_applyId,1);
*/
				#更新借款、申请、用户关联表
				update t_borrow_role set authStep =1 where applyId = in_applyId;
		
			select COUNT(1) into @r_num from t_materialsauthtype where id >16;
			set @mTypeId = 17;
			if @r_num > 0 then
				
				WHILE @num <= @r_num DO
					
					insert into t_materialsauth (userId,materAuthTypeId) 
						values(in_userId,@mTypeId);
					set @mTypeId = @mTypeId + 1;
					set @num = @num + 1;
					
				END WHILE;
			end if;
	ELSE
		
		UPDATE t_enterprise SET companyName = in_companyName,legalPerson=in_legalPerson,registeredTime=in_registeredTime,registeredCapital=in_registeredCapital
     ,businessCode=in_businessCode,companyAddress=in_companyAddress,companyPhone=in_companyPhone,
		  borrowCause=in_borrowCause,userId=in_userId WHERE userId = in_userId;
		
		INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
								VALUES ("t_person","",1,"",NOW(),"更新企业详细资料",1);
	end IF;
	if	_error	<>	0	then
		rollback;
		set out_ret = -2;
		set out_desc = '执行异常';
 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_exGo_borrow_join
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_exGo_borrow_join`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_exGo_borrow_join`(IN `in_bid` BIGINT,IN `in_uid` BIGINT,IN `in_basepath` VARCHAR(255),IN `in_invest_amount` DECIMAL(18,2),IN `in_invest_time` DATETIME, IN `in_status` INT , IN `in_num` INT , IN  `in_billcode`      VARCHAR(255),OUT out_ret INT, OUT out_desc VARCHAR(100), OUT out_ordid VARCHAR(100))
_return:BEGIN
  #投资标旳
  DECLARE t_mail_template  VARCHAR(2048) DEFAULT '';
  DECLARE t_email_template VARCHAR(2048) DEFAULT '';
  DECLARE t_sms_template   VARCHAR(2048) DEFAULT '';
  DECLARE t_content        VARCHAR(1024) DEFAULT '';
  DECLARE _error           INT DEFAULT 0;
  DECLARE sbs              VARCHAR(20) DEFAULT ''; #字符串截取
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _error = 1;
  SET out_ordid = '-1';
  SET out_ret = -1;
  SET out_desc = '执行失败';
  SET @user_accountSum = NULL; #可用余额是否符合投标金额
  SET @dealpwd = ''; #交易密码是否正确
  SELECT accountSum
       , dealpwd
  INTO
    @user_accountSum, @dealpwd
  FROM
    t_user
  WHERE
    id = in_uid;
  IF @user_accountSum IS NULL THEN
    SET out_ret = -2;
    SET out_desc = '用户不存在';
    LEAVE _return;
  END IF;
  IF @user_accountSum < in_invest_amount THEN
    SET out_ret = -3;
    SET out_desc = CONCAT('可用体验金额为[', @user_accountSum, ']元,不满足本轮投标,请添加体验金');
    LEAVE _return;
  END IF;
  #if(in_dealpwd != @dealpwd) then
  #	set out_ret = -4;
  #set out_desc = '交易密码错误';
  #leave _return;
  #end if;
  #招标中的借款才可以进行投标
  SET @id = 0;
  SET @t_frozen_margin = 0;
  SET @borrowAmount = 0;
  SET @hasInvestAmount = 0;
  SET @borrowStatus = 1;
  SET @minTenderedSum = NULL;
  SET @maxTenderedSum = NULL;
  SET @publisher = -1;
  SET @version = 0;
  SET @borrowTitle = NULL;
  SET @borrowWay = 1;
  SET @auditTime = NULL;
  SET @excitationType = 0;
  SET @excitationSum = 0;
  SET @circulationNumber = 0;
  SET @hasCirculationNumber = 0;
  SET @annualRate = NULL;
  SET @monthRate = 0;
  SET @t_deadline = 0;
  SET @isDayThe = 1;
  SET @borrowerName = NULL;
  SET @totalInterest = 0; #流转标应得本息
  SET @maxInvest = 0; #合和年最多投标人数
  SET @investNum = 0; #实际投标人数
  SET @isDayThe = 1;
  #select id, borrowAmount, hasInvestAmount, borrowStatus, minTenderedSum, maxTenderedSum, publisher,version,borrowTitle
  #into @id, @borrowAmount, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @publisher,@version,@borrowTitle
  #from	t_exGo_borrow	where id = in_bid;
  SELECT a.id
       , a.hasInvestAmount
       , a.borrowStatus
       , a.minTenderedSum
       , a.maxTenderedSum
       , a.borrowWay
       , a.auditTime
       , a.excitationType
       , a.excitationSum
       , a.circulationNumber
       , a.version
       , a.annualRate
       , (a.annualRate / 12)
       , a.borrowAmount
       , a.deadline
       , a.borrowTitle
       , a.publisher
       , a.isDayThe
       , b.username
       , a.frozen_margin
       , a.hasCirculationNumber
       , a.isDayThe
  INTO
    @id, @hasInvestAmount, @borrowStatus, @minTenderedSum, @maxTenderedSum, @borrowWay, @auditTime, @excitationType, @excitationSum, @circulationNumber, @version, @annualRate, @monthRate, @borrowAmount, @t_deadline, @borrowTitle, @publisher, @isDayThe, @borrowerName, @t_frozen_margin, @hasCirculationNumber, @isDayThe
  FROM
    t_exGo_borrow a
  LEFT JOIN t_user b
  ON a.publisher = b.id
  WHERE
    a.id = in_bid;
  SELECT COUNT(DISTINCT investor)
  INTO
    @investNum
  FROM
    t_exGo_invest
  WHERE
    borrowId = in_bid; #实际投标人数
  SELECT COUNT(1)
  INTO
    @investorFlag
  FROM
    t_exGo_invest
  WHERE
    borrowId = in_bid
    AND investor = in_uid
    AND investor IN (SELECT investor
                     FROM
                       t_exGo_invest
                     WHERE
                       borrowId = in_bid
                     GROUP BY
                       investor);
  SET @creditrang = 0;
  SET @manageFee = 0;
  SELECT costFee
  INTO
    @manageFee
  FROM
    t_platform_cost
  WHERE
    alias = 'investFeeRate';
  IF @id IS NULL THEN
    SET out_ret = -5;
    SET out_desc = '不存在的借款';
    LEAVE _return;
  END IF;
  IF @maxInvest > 0 AND @maxInvest = @investNum AND @investorFlag = 0 THEN
    SET out_ret = -9527;
    SET out_desc = '已超过投资人限定的最大投标人数';
    LEAVE _return;
  END IF;
  IF @borrowStatus <> 2 THEN
    SET out_ret = -6;
    SET out_desc = '非招标中的借款';
    LEAVE _return;
  END IF;
  IF @hasInvestAmount >= @borrowAmount THEN
    SET out_ret = -7;
    SET out_desc = '投标异常的借款';
    LEAVE _return;
  END IF;
  IF @publisher = in_uid THEN
    SET out_ret = -99;
    SET out_desc = '不能投自己发布的标的';
    LEAVE _return;
  END IF;
  SET @remainAmount = IFNULL(@borrowAmount, 0) - IFNULL(@hasInvestAmount, 0);
  IF in_invest_amount > @remainAmount THEN
    SET out_ret = -8;
    SET out_desc = '投标金额超过本轮剩余投标金额';
    LEAVE _return;
  END IF;
  #当剩余金额小于最新投标金额，直接跳过验证
  IF @remainAmount > @minTenderedSum THEN
    IF in_invest_amount > @maxTenderedSum && @maxTenderedSum <> -1 THEN
      SET out_ret = -9;
      SET out_desc = '投标金额超过本轮最多投标金额';
      LEAVE _return;
    END IF;
    IF in_invest_amount < @minTenderedSum && @minTenderedSum <> -1 THEN
      SET out_ret = -10;
      SET out_desc = '投标金额不足本轮最低投标金额';
      LEAVE _return;
    END IF;
  END IF;
  SET @total = in_invest_amount + @hasInvestAmount; #投资总额=本次投资金额+已投标金额
  IF @total > @borrowAmount THEN
    SET out_ret = -11;
    SET out_desc = '投标金额超出借款总额';
    LEAVE _return;
  END IF;
  START TRANSACTION;
  UPDATE t_exGo_borrow
  SET
    VERSION = VERSION + 1
  WHERE
    id = in_bid
    AND borrowStatus = 2
    AND borrowAmount > hasInvestAmount
    AND VERSION = @version;
  SET @ret_update = ROW_COUNT();
  IF @ret_update = 0 THEN
    ROLLBACK;
    SET out_ret = -12;
    SET out_desc = '抢投的借款';
    LEAVE _return;
  END IF;
  #更新借款信息中的已投资总额和数量
  #update t_exGo_borrow set investNum	=	investNum	+	1	,hasInvestAmount = hasInvestAmount	+	in_invest_amount where id = in_bid  and borrowStatus = 2	and borrowAmount	>	hasInvestAmount	;
  #增加投资记录
  INSERT INTO t_billcode (pMerBillNo,borrowId,`status`) VALUES (in_billcode,-1,3);
  #INSERT INTO t_exGo_invest (investAmount, realAmount, investTime, deadline, monthRate, billcode) VALUES (in_invest_amount, in_invest_amount, in_invest_time, @t_deadline, @monthRate, in_billcode);
  #SET out_ordid = LAST_INSERT_ID();
  IF _error <> 0 THEN
    ROLLBACK;
    SET out_ret = -13;
    SET out_desc = '执行异常';
    LEAVE _return;
  END IF;
  COMMIT;
  SET out_ret = 1;
  SET out_desc = in_billcode;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_getnewpaynumber
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_getnewpaynumber`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_getnewpaynumber`(IN in_userid BIGINT, IN in_rechargetype INT, IN in_bankname VARCHAR(20), IN in_rechargemoney DOUBLE(18, 2), IN in_cost DOUBLE(18, 2), IN  in_billcode VARCHAR(20),OUT returnNewPayNumber BIGINT, OUT returnDescription VARCHAR(100))
_return:BEGIN
	DECLARE tmpuserid INT;
	SET returnNewPayNumber = 0;
	SET returnDescription = '';
	SET tmpuserid = -1;
	SELECT id INTO tmpuserid FROM t_user WHERE id = in_userid;
	IF (tmpuserid <= 0) THEN
		SET returnNewPayNumber = -1; 
		SET returnDescription = '用户不存在';
		LEAVE _return;		
	END IF;
		INSERT INTO t_billcode (pMerBillNo,borrowId,`status`) VALUES(in_billcode,-1,3);
  INSERT INTO t_recharge_detail (userid, rechargeTime, rechargeType, bankName, rechargeMoney, cost, result, billcode) VALUES (in_userid, NOW(), in_rechargetype, in_bankname, in_rechargemoney, in_cost, 0, in_billcode);
  SET returnNewPayNumber = LAST_INSERT_ID();
  SET returnDescription = in_billcode;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_gettopinvestment
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_gettopinvestment`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_gettopinvestment`(in in_type int, in in_count int, out out_ret int, out out_desc varchar(100))
begin
	set out_ret = 0;
	set out_desc = '';
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_get_cur_task
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_cur_task`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_get_cur_task`(out out_ret int, out out_desc varchar(100))
_return:begin
	declare	_error int	default	0;
	declare exit handler for sqlexception set _error	=	1;
	select * from t_user;
	if	_error	<>	0	then
		rollback;
	else	
		commit;
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_get_topinvestment
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_topinvestment`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_get_topinvestment`(in in_type int,in in_count int)
    DETERMINISTIC
_return:BEGIN 
	#获取投资排行榜
	#in_type：0 表示全部；1 表示年投资排行； 2 表示季度投资排行 3 表示月投资排行；4 表示周投资排行；5 表示日投资排行
	declare sCondition varchar(800);
	declare sSql varchar(4000);
	#borrowStatus 借款状态(1 默认等待资料 2 正在招标中 3 已满标 4还款中 5 已还完 6 流标) 
	#按年查询条件：year(investTime) = year(now())
	#按季查询条件：year(investTime) = year(now()) and quarter(investTime) = quarter(now())
	#按月查询条件：year(investTime) = year(now()) and month(investTime) = month(now())
	#按周查询条件：year(investTime) = year(now()) and week(investTime) = week(now())
	#按日查询条件：0 = datediff(investTime, now())
	set sCondition = concat(' where 1 = 1 and borrowStatus in (4, 5)', case in_type 
	when 0 		then ''
	when 1 		then ' and year(investTime) = year(now())'
	when 2 		then ' and year(investTime) = year(now()) and quarter(investTime) = quarter(now())'
	when 3 		then ' and year(investTime) = year(now()) and month(investTime) = month(now())'
	when 4 		then ' and year(investTime) = year(now()) and week(investTime) = week(now())'
	else ' and 0 = datediff(investTime, now())' end);
	set sSql = concat('select v.investor, f_formatting_username(u.username) as username, round(v.sumMoney,2) as sumMoney    from (', concat('select investor, sumMoney from (select investor, sum(realAmount) as sumMoney from v_invest', sCondition, ' group by investor) a order by a.sumMoney desc limit ', in_count), ') v left join t_user u on v.investor = u.id');
	
	#SELECT sSql;
	set @sQuery = sSql;
    prepare stmt from @sQuery;
    execute stmt;
	deallocate prepare stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_init
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_init`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_init`(OUT `out_ret` int,OUT `out_desc` varchar(100))
_return:BEGIN
	#Routine body goes here...
	declare	_error	int	default	0;	#异常标记
  declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set	out_ret	=	-1;
	set	out_desc	=	"执行失败";
  start	transaction;
  TRUNCATE TABLE t_borrow;
	TRUNCATE TABLE t_article_manage;
	TRUNCATE TABLE t_assignment_debt;
	TRUNCATE TABLE t_auction_debt;
	TRUNCATE TABLE t_automaticbid;
	TRUNCATE TABLE t_automaticbid_user;
	TRUNCATE TABLE t_automaticbid_user;
	TRUNCATE TABLE t_award;
	TRUNCATE TABLE t_award_detail;
	TRUNCATE TABLE t_award_level4;
	TRUNCATE TABLE t_award_moth;
	TRUNCATE TABLE t_bankcard;
	TRUNCATE TABLE t_collection;
	TRUNCATE TABLE t_concern;
	TRUNCATE TABLE t_creditinfo;
	TRUNCATE TABLE t_crediting;
	TRUNCATE TABLE t_education_cost;
	TRUNCATE TABLE t_feedback;
	TRUNCATE TABLE t_flow_repayment;
	TRUNCATE TABLE t_fund_messageboard;
	TRUNCATE TABLE t_fundrecord;
	TRUNCATE TABLE t_intention_fund;
	TRUNCATE TABLE t_invest;
	TRUNCATE TABLE t_invest_history;
	TRUNCATE TABLE t_invest_repayment;
	TRUNCATE TABLE t_mail;
	TRUNCATE TABLE t_materialimagedetal;
	TRUNCATE TABLE t_materialsauth;
	TRUNCATE TABLE t_money;
	TRUNCATE TABLE t_msgboard;
	TRUNCATE TABLE t_notice;
	TRUNCATE TABLE t_notice_msg;
	TRUNCATE TABLE t_notice_task;
	TRUNCATE TABLE t_notice_task_log;
	TRUNCATE TABLE t_noticecon;
	TRUNCATE TABLE t_operation_log;
	TRUNCATE TABLE t_person;
	TRUNCATE TABLE t_phone_binding_info;
	TRUNCATE TABLE t_pre_repayment;
	TRUNCATE TABLE t_recharge;
	TRUNCATE TABLE t_recharge_detail;
	TRUNCATE TABLE t_recharge_info;
	TRUNCATE TABLE t_recharge_withdraw_info;
	TRUNCATE TABLE t_rechargenumberlist;
	TRUNCATE TABLE t_recommend_user;
	TRUNCATE TABLE t_relation;
	TRUNCATE TABLE t_repayment;
	TRUNCATE TABLE t_repayment_service;
	TRUNCATE TABLE t_report;
	TRUNCATE TABLE t_risk_detail;
	TRUNCATE TABLE t_sendsms;
	TRUNCATE TABLE t_user;
	TRUNCATE TABLE t_user_check;
	TRUNCATE TABLE t_user_recorelist;
	TRUNCATE TABLE t_userintegraldetail;
	TRUNCATE TABLE t_vipsum;
	TRUNCATE TABLE t_withdraw;
	TRUNCATE TABLE t_workauth;
	TRUNCATE TABLE user_login_log; 
	TRUNCATE TABLE t_pwd_answer;
	DELETE FROM t_role_rights where roleId <> -1;
	DELETE FROM t_admin where id > 0;
	update t_admin set isFirstLogin = 1, loginErrorCount = 0, isLoginLimit = 1 where id < 0;
	if	_error	<>	0	then
		set	out_ret	=	-1;
		set	out_desc	=	"执行失败";
		rollback; 
		
		leave _return;
	else	
		
		set	out_ret	=	1;
		set	out_desc	=	"执行成功";
		commit; 
	end	if; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_invest_action
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_invest_action`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_invest_action`(IN `in_bid` bigint,IN `in_rid` bigint,IN `in_type` bigint,IN `in_web_pay` int,IN `in_late_fee` decimal(18,2),IN `in_borrow_way` bigint,IN `in_amount` decimal(18,2),IN `in_ifeerate` decimal(18,6),IN `in_repay_period` varchar(20),IN `in_repay_date` varchar(20),IN `in_still_principal` decimal(18,2),IN `in_still_interest` decimal(18,2),IN `in_principal_balance` decimal(18,2),IN `in_interest_balance` decimal(18,2),IN `in_excitation_sum` decimal(18,2),IN `in_mrate` decimal(18,4),IN `in_basepath` varchar(100), out out_ret int, out out_desc varchar(100))
_return:begin
		 
		declare t_invest_id bigint default -1;
		declare t_invest_amount decimal(18,2) default 0;
		declare t_real_amount decimal(18,2) default 0;
		declare t_investor bigint default -1;
		declare t_vip_status int default 1;
		declare t_recived_principal decimal(18,2) default 0;
		declare t_recived_interest decimal(18,2) default 0;
		declare t_principal_balance decimal(18,2) default 0;
		declare t_interest_balance decimal(18,2) default 0;
		declare t_mfee decimal(18,2) default 0;
		declare t_award_amount decimal(18,2) default 0;
		declare t_late_fee decimal(18,2) default 0;
		declare t_content varchar(1024) default '';
		declare t_payment_mode varchar(500) default '';
		declare t_date varchar(20) default '';
		declare t_mail_template varchar(2048) default '';
		declare t_email_template varchar(2048) default '';
		declare t_sms_template varchar(2048) default '';
		declare t_iprincipal decimal(18,2) default 0;
		declare t_iinterest decimal(18,2) default 0;
		declare t_check_principal decimal(18,2) default 0;
		declare t_check_interest decimal(18,4) default 0;
		declare t_invest_fee decimal(18,2) default 0;
		declare  _done int default 0;
		declare _error int default 0;
			
		declare cursor_name cursor for (select a.id, a.investAmount, a.realAmount, a.investor, b.vipStatus, a.recivedPrincipal,
				a.recievedInterest, a.check_principal, a.check_interest  from t_invest a left join t_user b on a.investor = b.id  where a.borrowId = in_bid);
		declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
		declare continue handler for sqlexception set _error = 1;
		set out_ret = -1;
		set out_desc = '执行失败';
		set @borrowTitle = '';
		set @paymentMode = 1;
		set @isDayThe = 1;
		set @deadline = 1;
		set @borrower = -1;
		select a.borrowTitle, a.paymentMode, a.isDayThe, a.deadline, a.publisher into @borrowTitle, @paymentMode, @isDayThe, @deadline,
				@borrower from t_borrow a left join t_user b on a.publisher = b.id where a.id = in_bid;
		open cursor_name;
				fetch cursor_name into t_invest_id, t_invest_amount, t_real_amount, t_investor, t_vip_status, t_iprincipal, t_iinterest, t_check_principal, t_check_interest;
				while _done <> 1 do
						set t_recived_principal = (t_invest_amount/in_amount)*in_still_principal;
						set t_recived_interest = (t_invest_amount/in_amount)*in_still_interest;
						set t_principal_balance = (t_invest_amount/in_amount)*in_principal_balance;
						set t_interest_balance = (t_invest_amount/in_amount)*in_interest_balance;
						set t_mfee = t_recived_interest*in_ifeerate;
						set t_award_amount = (t_invest_amount/in_amount)*in_excitation_sum;
						set t_late_fee = (t_invest_amount/in_amount)*in_late_fee;
				if in_type = 2 then
				#满标的信息发送拿出去单独做
						if t_invest_amount > 0 then
								update t_invest set recivedPrincipal = check_principal, recievedInterest = check_interest where id = t_invest_id;
								set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
								set t_content = concat('借款[', t_content, ']审核通过,');
								set t_content = concat(t_content, f_moneyDecode(654), '[',t_invest_amount,']元');
								update t_user set freezeSum = freezeSum - t_invest_amount where id = t_investor;
				/*BY CHENEY
								insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
										trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id) select t_investor, now(), 654, f_moneyDecode(654), t_invest_amount,
										a.usableSum as usableSum, a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
										@borrower,0, t_content, 0, t_invest_id, '', 0,t_invest_amount,b.borrowId from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
							*/			
				
								update t_user a,(select sum(investAmount) sum,investor,borrowId from t_invest where borrowId=in_bid group by investor, borrowId ) b 
								set a.rating = (a.rating + b.sum/20) where a.id=b.investor;
								insert into t_userintegraldetail (userid, intergraltype, remark, changetype, changerecore, time ,type) 
								select investor, "投资积分", "投资积分", "增加", ROUND(sum(investAmount)/20, 0), NOW(), 2 from t_invest where  id = t_invest_id ;
						end if;
						if t_award_amount > 0 then
								set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
								set t_content = concat('借款[', t_content, ']审核通过,收到');
								set t_content = concat(t_content, f_moneyDecode(253), '[',t_award_amount,']元');
								update t_user set usableSum = usableSum + t_award_amount where id = t_investor;
								update t_invest set reward = t_award_amount where id = t_invest_id;
								insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
										trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,borrow_id ) select t_investor, now(), 253, f_moneyDecode(253), t_award_amount,
										a.usableSum as usableSum, a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
										@borrower,0, t_content, 0, t_invest_id, '', 0,t_award_amount,b.borrowId  from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
						end if;
						set t_mfee = t_check_interest*in_ifeerate;
						set t_date = case @isDayThe 
						when 1 then '个月'
						when 2 then '天'
						else '' end;
						set t_payment_mode = '投资期数';
						set t_payment_mode = concat(t_payment_mode,@deadline,t_date,',月利率：',in_mrate);
						set t_payment_mode = concat(t_payment_mode,'%<br/>投资金额[',t_invest_amount,']元<br/>到期收益利息[');
						set t_payment_mode = concat(t_payment_mode,round(t_check_interest,2),']元<br/>到期扣除投资管理费[');
						set t_payment_mode = concat(t_payment_mode,t_mfee,']元<br/>到期收益总额[',round((t_check_principal + t_check_interest - t_mfee),2),']元');
						set t_mail_template = f_get_notice_template('tender_success');
						set t_mail_template = replace(t_mail_template, 'title',  @borrowTitle);
						set t_mail_template = replace(t_mail_template, 'excitationSum', t_award_amount);
						set t_mail_template = replace(t_mail_template, '[msg]', t_payment_mode);
						set t_email_template = f_get_notice_template('e_tender_success');
						set t_email_template = replace(t_email_template, 'title',  @borrowTitle);
						set t_email_template = replace(t_email_template, 'excitationSum', t_award_amount);
						set t_email_template = replace(t_email_template, '[msg]', t_payment_mode);
						set t_sms_template = f_get_notice_template('s_tender_success');
						set t_sms_template = replace(t_sms_template, 'title',  @borrowTitle);
						set t_sms_template = replace(t_sms_template, 'excitationSum', t_award_amount);
						set t_sms_template = replace(t_sms_template, '[msg]', t_payment_mode);
						set @username = '';
						set @email = '';
						set @telphone = '';
						select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
								t_person a on a.userId = b.id where b.id = t_investor;
								
						/*
						insert into t_notice_task(user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
								values(t_investor, '理财投资成功报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, t_invest_id, now(), 'invest');
								
						*/
						if in_borrow_way = 2 then
								update t_invest set hasPrincipal = t_check_principal, hasInterest = t_check_interest, manageFee = t_mfee, repayStatus = 2 where id = t_invest_id;
								set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
								set t_content = concat('借款[', t_content, ']已还款,');
								set t_content = concat(t_content, f_moneyDecode(151), '[',round((t_check_principal + t_check_interest),2),']元');
								update t_user set usableSum = usableSum + t_check_principal + t_check_interest where id = t_investor;
								insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
										trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,borrow_id) select t_investor, now(), 151, f_moneyDecode(151), round((t_check_principal + t_check_interest),2),
										a.usableSum as usableSum, a.freezeSum as freezeSum, SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
										@borrower,0, t_content, 0, t_invest_id, '', 0,  round((t_check_principal + t_check_interest),2),b.borrowId from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
								if t_mfee > 0 then
										set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
										set t_content = concat('借款[', t_content, ']已还款,');
										set t_content = concat(t_content, f_moneyDecode(651), '[',t_mfee,']元');
										update t_user set usableSum = usableSum - t_mfee where id = t_investor;
										insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
												trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id) select t_investor, now(), 651, f_moneyDecode(651), t_mfee,
												a.usableSum as usableSum, a.freezeSum as freezeSum, round(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),2),
												-1,0, t_content, 0, t_invest_id, '', 0,t_mfee,b.borrowId from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
								end if;
								set t_payment_mode = '投资秒还借款月利率：';
								set t_payment_mode = concat(t_payment_mode, in_mrate, '%<br/>投资金额[', t_invest_amount, ']元<br/>收益利息[');
								set t_payment_mode = concat(t_payment_mode, round(t_check_interest,2), ']元<br/>扣除投资管理费[');
								set t_payment_mode = concat(t_payment_mode, t_mfee, ']元<br/>收益总额[', round((t_check_principal + t_check_interest - t_mfee),2), ']元');
								set t_mail_template = f_get_notice_template('recover_success');
								set t_mail_template = replace(t_mail_template, 'title',  @borrowTitle);
								set t_mail_template = replace(t_mail_template, '[msg]', t_payment_mode);
								set t_email_template = f_get_notice_template('e_recover_success');
								set t_email_template = replace(t_email_template, 'title',  @borrowTitle);
								set t_email_template = replace(t_email_template, '[msg]', t_payment_mode);
								set @username = '';
								set @email = '';
								set @telphone = '';
								select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
										t_person a on a.userId = b.id where b.id = t_investor;
								set t_sms_template = f_get_notice_template('s_recover_success');
								set t_sms_template = replace(t_sms_template, 'username',  @username);
								set t_sms_template = replace(t_sms_template, 'title',  @borrowTitle);
								set t_sms_template = replace(t_sms_template, '[msg]', t_payment_mode);
								set t_sms_template = replace(t_sms_template, 'date', now());
								insert into t_notice_task(user_id,sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
										values(t_investor, '用户还款资金收入报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, t_invest_id, now(), 'invest_recived');
						end if;
				elseif in_type = 3 then
						set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
						set t_content = concat('借款[', t_content, ']已撤消,');
						set t_content = concat(t_content, f_moneyDecode(154), '[',round(t_real_amount,2),']元');
						update t_user set usableSum = usableSum + t_real_amount, freezeSum = freezeSum - t_real_amount where id = t_investor;
						insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
								trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,borrow_id,income) select t_investor, now(), 154, f_moneyDecode(154), t_real_amount,
								a.usableSum as usableSum, a.freezeSum as freezeSum, round(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),2),
								-1,0, t_content, 0, t_invest_id, '', 0,b.borrowId, t_real_amount as income from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
						set t_mail_template = f_get_notice_template('tender_over');
						set t_mail_template = replace(t_mail_template, 'title',  @borrowTitle);
						set t_mail_template = replace(t_mail_template, 'rebackAmount', t_real_amount);
						set t_email_template = f_get_notice_template('e_tender_over');
						set t_email_template = replace(t_email_template, 'title',  @borrowTitle);
						set t_email_template = replace(t_email_template, 'rebackAmount', t_real_amount);
						set @username = '';
						set @email = '';
						set @telphone = '';
						select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
												t_person a on a.userId = b.id where b.id = t_investor;
						set t_sms_template = f_get_notice_template('s_tender_over');
						set t_sms_template = replace(t_sms_template,'username', @username);
						set t_sms_template = replace(t_sms_template,'date', now());
						set t_sms_template = replace(t_sms_template, 'title',  @borrowTitle);
						set t_sms_template = replace(t_sms_template, 'rebackAmount', t_real_amount);
						insert into t_notice_task(user_id,sendtitle,s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
								values(t_investor,'理财投资撤消报告','capitalChangeEnable' ,@username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, t_investor, now(), 'tender_over');
				elseif in_type = 4 then
 
					#用于实际操作
					set @recived_principal = 0;#应收本金
					set @recived_interest = 0;#应收利息
					set @invest_fee = 0;#利息管理费
					set @recived_fi = 0;#应收罚息
					#用于逻辑操作
					set @recived_principal_switch = 0;#应收本金
					set @recived_interest_switch = 0;#应收利息
					set @invest_fee_switch = 0;#利息管理费
					set @recived_fi_switch = 0;#应收罚息
					set @recived_interest_back = 0;#垫付利息扣除
					set @isWebRepay_switch = 1; #网站是否代还
 
					select sum(recivedPrincipal), sum(recivedInterest), sum(iManageFee), sum(recivedFI) ,isWebRepay  into @recived_principal,
					@recived_interest, @invest_fee, @recived_fi  ,@isWebRepay_switch  from t_invest_repayment  where invest_id = t_invest_id and repayId = in_rid;
					set @invest_fee = round(@invest_fee,2); 
					if in_web_pay = 1 then #用户还款
						#网站未代还 还本金利息罚息，扣投资管理费
						#网站已代还 
						if @isWebRepay = 2 then 
							#本金已还
							set @recived_principal = 0;
							#非vip 还利息罚息,扣投资管理费
							#vip 网站代还时已还本息，现只还罚息
							if t_vip_status = 2 then 
								#利息已还
								set @recived_interest = 0;
								#投资管理费已还
								set @invest_fee = 0;
							end if;
						end if;
					elseif in_web_pay = 2 then #网站代还
						#不还逾期罚息
						set @recived_fi = 0;
 
						#非vip 还本息、扣除利息
						if t_vip_status = 1 then
							#扣除利息
							set @recived_interest_back = @recived_interest;
							#不扣投资管理费
							set @invest_fee = 0;
						end if;
 
						#vip 还本息、扣利息管理费
					end if;
 
					#更新投资还款表
					update t_invest_repayment set hasPrincipal = recivedPrincipal,hasInterest = recivedInterest, realRepayDate = in_repay_date,
					interestOwner =  t_investor, ownerlist = concat(ownerlist,',',t_investor), isWebRepay = in_web_pay, repayStatus = 2
					where invest_id = t_invest_id and `owner` = t_investor and repayId = in_rid;
 
					#更新投资表 本次还款金额
					update t_invest set hasPrincipal = hasPrincipal + @recived_principal, hasInterest = hasInterest + @recived_interest,
					hasFI = hasFI + @recived_fi, manageFee = manageFee + @invest_fee where id = t_invest_id;
 
					#还完状态更新
					update t_invest set repayStatus = 2 where round(recivedPrincipal + recievedInterest,2) = round(hasPrincipal + hasInterest,2) and id = t_invest_id;
 
					#关闭自动投标？
					#update t_automaticbid set  bidStatus = 1 where userId = t_investor;
 
					#更新投资者资金
					update t_user set usableSum = usableSum + (@recived_principal + @recived_interest)  where id = t_investor;
 
					#资金记录
					set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
					set t_content = concat('借款[', t_content, ']已还款,');
					set t_content = concat(t_content, f_moneyDecode(151), '[',round((@recived_principal + @recived_interest),2),']元');
					insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
					trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,borrow_id) select t_investor, now(), 151, f_moneyDecode(151), 
					round((@recived_principal + @recived_interest),2),a.usableSum as usableSum, a.freezeSum as freezeSum, 
					SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
					@borrower,0, t_content, 0, t_invest_id, '', 0,round((@recived_principal + @recived_interest),2),b.borrowId  
					from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
 
 
					#非vip逾期不垫付利息
					if @recived_interest_back > 0 then 
 
						#更新投资还款表
						update t_invest_repayment set hasInterest = hasInterest - @recived_interest_back
						where invest_id = t_invest_id and `owner` = t_investor and repayId = in_rid;
						#更新投资表 本次还款金额
						update t_invest set hasInterest = hasInterest - @recived_interest_back	where id = t_invest_id;
 
						#更新用户金额
						update t_user set usableSum = usableSum - @recived_interest_back  where id = t_investor;
						set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
						set t_content = concat('逾期垫付');
						set t_content = concat(t_content, f_moneyDecode(652), '[',round(@recived_interest_back,2),']元');
						insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
						trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id) 
						select t_investor, now(), 652, f_moneyDecode(652), round(@recived_interest_back,2),a.usableSum as usableSum, a.freezeSum as freezeSum, 
						SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),@borrower,0, t_content, 0, t_invest_id, '', 
						0, @recived_interest_back, b.borrowId  from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
					end if;
 
					#利息管理费
					if @invest_fee>0 then
						update t_user set usableSum = usableSum - @invest_fee where id = t_investor;
						insert into t_risk_detail(riskBalance, riskInCome, riskDate, riskType, resource, trader, borrowId) 
						select (sum(riskInCome)-sum(riskSpending)), @invest_fee, now(), '收入', '投资管理费', t_investor, t_invest_id from t_risk_detail;
						set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
						set t_content = concat('借款[', t_content, ']已还款,');
						set t_content = concat(t_content, f_moneyDecode(651), '[',round(@invest_fee,2),']元');
						insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
						trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id ) select t_investor, now(), 651, f_moneyDecode(651), round(@invest_fee,2),
						a.usableSum as usableSum, a.freezeSum as freezeSum, ROUND(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),2),
						-1,0, t_content, 0, t_invest_id, '', 0 ,round(@invest_fee,2),b.borrowId from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
					end if;
					#罚息#
					if @recived_fi>0 then
						set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
						set t_content = concat('借款[', t_content, ']已还款,');
						set t_content = concat(t_content, f_moneyDecode(156), '[',round(@recived_fi,2),']元');
						update t_user set usableSum = usableSum + @recived_fi where id = t_investor;
						insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
						trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income,borrow_id) select t_investor, now(), 156, f_moneyDecode(156), round(@recived_fi,2),
						a.usableSum as usableSum, a.freezeSum as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),
						@borrower,0, t_content, 0, t_invest_id, '', 0,round(@recived_fi,2),b.borrowId from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
					end if;
						set t_payment_mode = '';
						set t_mail_template = f_get_notice_template('recover_advance_success');
						set t_mail_template = replace(t_mail_template, 'title',  @borrowTitle);
						set t_mail_template = replace(t_mail_template, 'repayPeriod', in_repay_period);
						set t_mail_template = replace(t_mail_template, 'recivedSum', round((@recived_principal + @recived_interest + @recived_fi),2));
						set t_mail_template = replace(t_mail_template, 'hasP', round(@recived_principal,2));
						set t_mail_template = replace(t_mail_template, 'hasI', round(@recived_interest,2));
						set t_mail_template = replace(t_mail_template, 'hasLFI', round(@recived_fi,2));
						set t_mail_template = replace(t_mail_template, 'mFee', round(@invest_fee,2));
						set t_mail_template = replace(t_mail_template, 'msFee', round((@recived_principal + @recived_interest + @recived_fi - @invest_fee),2));
						set t_mail_template = replace(t_mail_template, '[paymentModeStr]', '');
						set t_email_template = f_get_notice_template('e_recover_advance_success');
						set t_email_template = replace(t_email_template, 'title',  @borrowTitle);
						set t_email_template = replace(t_email_template, 'repayPeriod', in_repay_period);
						set t_email_template = replace(t_email_template, 'recivedSum', round((@recived_principal + @recived_interest + @recived_fi),2));
						set t_email_template = replace(t_email_template, 'hasP', round(@recived_principal,2));
						set t_email_template = replace(t_email_template, 'hasI', round(@recived_interest,2));
						set t_email_template = replace(t_email_template, 'hasLFI', round(@recived_fi,2));
						set t_email_template = replace(t_email_template, 'mFee', round(@invest_fee,2));
						set t_email_template = replace(t_email_template, 'msFee', round((@recived_principal + @recived_interest + @recived_fi - @invest_fee),2));
						set t_email_template = replace(t_email_template, '[paymentModeStr]', '');
						set @username = '';
						set @email = '';
						set @telphone = '';
						select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
								t_person a on a.userId = b.id where b.id = t_investor;
						set t_sms_template = f_get_notice_template('s_recover_advance_success');
						set t_sms_template = replace(t_sms_template, 'username',  @username);
						set t_sms_template = replace(t_sms_template, 'title',  @borrowTitle);
						set t_sms_template = replace(t_sms_template, 'repayPeriod', in_repay_period);
						set t_sms_template = replace(t_sms_template, 'recivedSum', round((@recived_principal + @recived_interest + @recived_fi),2));
						set t_sms_template = replace(t_sms_template, 'hasP', round(@recived_principal,2));
						set t_sms_template = replace(t_sms_template, 'hasI', round(@recived_interest,2));
						set t_sms_template = replace(t_sms_template, 'hasLFI', round(@recived_fi,2));
						set t_sms_template = replace(t_sms_template, 'mFee', round(@invest_fee,2));
						set t_sms_template = replace(t_sms_template, 'msFee', round((@recived_principal + @recived_interest + @recived_fi - @invest_fee),2));
						set t_sms_template = replace(t_sms_template, '[paymentModeStr]', '');
						insert into t_notice_task(user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
								values(t_investor, '用户还款资金收入报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, t_invest_id, now(), 'invest_recived');
				end if; 
				fetch cursor_name into t_invest_id, t_invest_amount, t_real_amount, t_investor, t_vip_status, t_iprincipal, t_iinterest, t_check_principal, t_check_interest;
				end while;
		close cursor_name;
		if _error <> 0 then 
				rollback;
				set out_ret = -3;
				set out_desc = '执行异常';
				leave _return; 
		else 
				set out_ret = 1;
				set out_desc = '';
		end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_invest_action_inform
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_invest_action_inform`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_invest_action_inform`(IN `in_bid` bigint,IN `in_type` bigint,IN `in_amount` decimal(18,2),IN `in_excitation_sum` decimal(18,2),IN `in_mrate` decimal(18,4),IN `in_basepath` varchar(100),out out_ret int, out out_desc varchar(100))
_return:BEGIN
	declare t_invest_id bigint default -1;
		declare t_invest_amount decimal(18,2) default 0;
		declare t_sum_investAmount decimal(18,2) default 0;
	declare t_sum_recievedInterest decimal(18,4) default 0;
		declare t_content varchar(1024) default '';
		declare t_recieved_interest decimal(18,4) default 0;
		declare t_recieved_principal decimal(18,4) default 0;
		declare t_award_amount decimal(18,2) default 0;
		declare t_mfee decimal(18,2) default 0;
		declare  _done int default 0;
		declare _error int default 0;
		declare t_investor bigint default -1;
		
		declare t_payment_mode varchar(500) default '';
		declare t_date varchar(20) default '';
		declare t_mail_template varchar(2048) default '';
		declare t_email_template varchar(2048) default '';
		declare t_sms_template varchar(2048) default '';
	
		declare cursor_name cursor for (select a.id, a.investAmount,a.recievedInterest,a.manageFee,a.recivedPrincipal,a.investor from t_invest a left join t_user b on a.investor = b.id  where a.borrowId = in_bid ORDER BY a.id ASC);
		declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
		declare continue handler for sqlexception set _error = 1;
		set out_ret = -1;
		set out_desc = '执行失败';
		set @borrowTitle = '';
		set @paymentMode = 1;
		set @isDayThe = 1;
		set @deadline = 1;
		set @borrower = -1;
		select a.borrowTitle, a.paymentMode, a.isDayThe, a.deadline, a.publisher into @borrowTitle, @paymentMode, @isDayThe, @deadline,
				@borrower from t_borrow a left join t_user b on a.publisher = b.id where a.id = in_bid;
		open cursor_name;
			fetch cursor_name into t_invest_id, t_invest_amount,t_recieved_interest,t_mfee,t_recieved_principal,t_investor;
			
while _done <> 1 do
	if in_type = 2 then
								set t_sum_investAmount=0;
								set t_sum_recievedInterest=0;
								
								SELECT sum(investAmount),SUM(recievedInterest) into t_sum_investAmount,t_sum_recievedInterest from t_invest a where a.borrowId = in_bid and a.id >t_invest_id and investor=t_investor  ORDER BY a.id ASC;
								
								set t_sum_investAmount=IFNULL(t_sum_investAmount,0);
						
								set t_sum_recievedInterest=IFNULL(t_sum_recievedInterest,0);
		
								set t_content = f_link(in_basepath,in_bid,@borrowTitle,'','','');
								set t_content = concat('借款[', t_content, ']审核通过,');
								set t_content = concat(t_content, f_moneyDecode(654), '[',t_invest_amount,']元');
								insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
										trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending,borrow_id) select t_investor, now(), 654, f_moneyDecode(654), t_invest_amount,
										a.usableSum as usableSum, (a.freezeSum+t_sum_investAmount) as freezeSum, sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest)-t_sum_investAmount-t_sum_recievedInterest,
										@borrower,0, t_content, 0, t_invest_id, '', 0,t_invest_amount,b.borrowId from t_user a left join t_invest b on a.id = b.investor where a.id = t_investor group by a.id;
	
						set t_date = case @isDayThe 
						when 1 then '个月'
						when 2 then '天'
						else '' end;
						set t_award_amount = (t_invest_amount/in_amount)*in_excitation_sum;
		
						set t_award_amount=IFNULL(t_award_amount,0);
						set t_payment_mode = '投资期数';
						set t_payment_mode = concat(t_payment_mode,@deadline,t_date,',月利率：',in_mrate);
						set t_payment_mode = concat(t_payment_mode,'%<br/>投资金额[',t_invest_amount,']元<br/>到期收益利息[');
						set t_payment_mode = concat(t_payment_mode,round(t_recieved_interest,2),']元<br/>到期扣除投资管理费[');
						set t_payment_mode = concat(t_payment_mode,t_mfee,']元<br/>到期收益总额[',round((t_recieved_principal + t_recieved_interest - t_mfee),2),']元');
						set t_mail_template = f_get_notice_template('tender_success');
						set t_mail_template = replace(t_mail_template, 'title',  @borrowTitle);
						set t_mail_template = replace(t_mail_template, 'excitationSum', t_award_amount);
						set t_mail_template = replace(t_mail_template, '[msg]', t_payment_mode);
						set t_email_template = f_get_notice_template('e_tender_success');
						set t_email_template = replace(t_email_template, 'title',  @borrowTitle);
						set t_email_template = replace(t_email_template, 'excitationSum', t_award_amount);
						set t_email_template = replace(t_email_template, '[msg]', t_payment_mode);
						set t_sms_template = f_get_notice_template('s_tender_success');
						set t_sms_template = replace(t_sms_template, 'title',  @borrowTitle);
						set t_sms_template = replace(t_sms_template, 'excitationSum', t_award_amount);
						set t_sms_template = replace(t_sms_template, '[msg]', t_payment_mode);
						set @username = '';
						set @email = '';
						set @telphone = '';
						select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
								t_person a on a.userId = b.id where b.id = t_investor;
						insert into t_notice_task(user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
								values(t_investor, '理财投资成功报告', 'capitalChangeEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, t_invest_id, now(), 'invest');
end if;
				fetch cursor_name into t_invest_id, t_invest_amount,t_recieved_interest,t_mfee,t_recieved_principal,t_investor;
				end while;
		close cursor_name;
		if _error <> 0 then 
				rollback;
				set out_ret = -3;
				set out_desc = '执行异常';
				leave _return; 
		else 
				set out_ret = 1;
				set out_desc = '';
		end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_invite_friends_reward

-- ----------------------------
DROP PROCEDURE IF EXISTS `p_invite_friends_reward
`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_invite_friends_reward
`(out out_ret int, out out_desc varchar(100))
_return:begin
	declare t_id bigint	default -1;
	declare t_money	decimal(18,2) default	0;
	declare	t_uid	bigint	default	-1;
	declare	t_uname	varchar(200) default	'';
	declare	t_mail_template	varchar(2048)	default	'';	#站内信模版
	declare	t_email_template	varchar(2048)	default	'';	#邮件模版
	declare	t_sms_template	varchar(2048)	default	'';	#短信模版
	declare	t_content	varchar(200)	default	'';
	declare _done int default 0;
	declare	_error	int	default	0;
 
	declare cursor_name cursor for (select a.id,a.money,a.userId,b.username from t_money a left join t_user b on a.userId = b.id where a.status =1);
	declare continue handler for sqlstate '02000' set _done = 1;#错误定义，标记循环结束
	declare continue handler for sqlexception set _error	=	1;
	set out_ret = -1;
	set out_desc = '执行失败';
	
	start transaction;	#主函数中设置事务为手动提交，次函数不要设置也不要commit
		#清除异常数据
		delete from t_money where userId <=0;
		
		open cursor_name;
			#循环执行  
      fetch cursor_name into	t_id,	t_money,	t_uid,	t_uname;
			while _done <> 1 do
					
					set	@id	=-1;
					select tv.id into	@id from t_vipsum tv left join t_recommend_user tru on tru.userid=tv.userid where  tru.moneytypeid	=	t_id;
					set	@id	=	ifnull(@id,-1);
					if	@id > 0 then
						set	@friend_name	= '';
						select username into	@friend_name from v_t_recommendfriend_list where mId	= t_id and muid	=	t_uid;
						#扣除风险保障金
						insert into t_risk_detail(riskBalance,	riskSpending,	riskDate,	riskType,	resource,	trader,	borrowId) 
						select (sum(riskInCome)-sum(riskSpending)),	t_money,	now(),	'支出',	'好友邀请奖励',	t_uid,	-1 from t_risk_detail;
						#更新已奖励状态为已奖励
            update t_money set status = 2,	endData=now() where id = t_id and userId = t_uid;
            #邀请奖励发给邀请人
            update t_user set usableSum = usableSum + t_money  where id = t_uid;
						
						set	t_content	=	concat('您邀请的用户【',@friend_name,'】已成为VIP会员,在此奖励[');
						set	t_content	=	concat(t_content,t_money,']元,再接再厉!');
						insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
						trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost , income,borrow_id)	select t_uid, now(), 251, f_moneyDecode(251), t_money,
						a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
						-1, 0, t_content, 0, t_id, '', 0 , t_money,	b.borrowId	from t_user a left join t_invest b on a.id = b.investor  where a.id = t_uid group by a.id;
						
						
						set	t_mail_template	=	f_get_notice_template('good_invitation');
						set	t_mail_template = replace(t_mail_template,	'friendName', @friend_name);
						set	t_mail_template = replace(t_mail_template,	'money', t_money);
						set	t_email_template	=	f_get_notice_template('e_good_invitation');
						set	t_email_template = replace(t_email_template,	'friendName', @friend_name);
						set	t_email_template = replace(t_email_template,	'username', t_uname);
						set	t_email_template = replace(t_email_template,	'money', t_money);
						#插入通知任务
						set	@username	=	'';
						set	@email	=	'';
						set	@telphone	=	'';
						select a.cellphone, b.username, b.email into @telphone, @username, @email from t_user b left join
						t_person a on a.userId = b.id where b.id = 	t_uid;
						set	t_sms_template	=	f_get_notice_template('s_good_invitation');
						set	t_mail_template = replace(t_mail_template,	'friendName', @friend_name);
						set	t_mail_template = replace(t_mail_template,	'money', t_money);
						insert	into	t_notice_task(user_id,	sendtitle,	s_nid,	username,	email,	telphone,	mail_info,	email_info,	sms_info,	operate_id,	add_time,	operate_identify)
						values(t_uid,	'好友邀请奖励',	'capitalChangeEnable',	@username,	@email,	@telphone,	t_mail_template,	t_email_template,	t_sms_template,	t_id,	now(),	'friend');
					end	if;
				fetch cursor_name into	t_id,	t_money,	t_uid,	t_uname;
			end	while;
		close	cursor_name;
	
	if	_error	<>	0	then
		rollback; 
		set out_ret = -9;
	  set out_desc = '执行异常'; 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_rongtuwang_add_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_rongtuwang_add_data`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_rongtuwang_add_data`()
BEGIN 
declare _i int default 0; 
 #投资成功待收金额 

  SET @apr_data = '';  #每天的标的平均年利率，没有为0.
  SET @count_data = '';  #每天对应发布借款的金额，没有则为0.
  SET @dcount_data = '';  #每天借款成功的借款金额，没有则为0.
  SET @time_data1_3 = ''; #1-3个月的所有标的总额
  SET @time_data4_6 = ''; #4-6个月的所有标的总额
  SET @time_data7_12 = ''; #7-12个月的所有标的总额
  SET @time_data12_ = ''; #12个月以上的所有标的总额
  SET @cj_data = ''; #平台总成交量，单位万元，保留2位小数
  SET @dh_data = ''; #平台总待还金额，单位万元，保留2位小数
  SET @avg_apr = ''; #前一天平均年利率，如果对应前一天没有数据的，对应值为平均年利率即可，保留2位小数

 while _i < 88 do

 #每天的标的平均年利率，没有为0.  #每天对应发布借款的金额，没有则为0.
 select ROUND(AVG(tb.annualRate),2),ROUND(AVG(tb.borrowAmount),2)
  INTO @apr_data,@count_data
   from t_borrow tb where tb.publishTime BETWEEN DATE_ADD('2016-09-09',INTERVAL _i DAY) and DATE_ADD('2016-09-09',INTERVAL (1+_i) DAY);

 #每天借款成功的借款金额，没有则为0.
 select ROUND(AVG(tb.investAmount),2)
  INTO @dcount_data
   from t_invest tb where tb.investTime BETWEEN DATE_ADD('2016-09-09',INTERVAL _i DAY) and DATE_ADD('2016-09-09',INTERVAL (1+_i) DAY);

#1-3个月的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data1_3 FROM t_invest tb
 WHERE tb.investTime < DATE_ADD('2016-09-09', INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline < 4);

#4-6个月的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data4_6 FROM t_invest tb
 WHERE tb.investTime < DATE_ADD('2016-09-09', INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline BETWEEN 4 and 7);

#7-12个月的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data7_12 FROM t_invest tb
 WHERE tb.investTime < DATE_ADD('2016-09-09', INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline BETWEEN 7 and 12);

#12个月以上的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data12_ FROM t_invest tb
 WHERE tb.investTime < DATE_ADD('2016-09-09', INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline > 12);

 #平台总成交量
 select sum(tb.investAmount) INTO @cj_data from t_invest tb where tb.investTime <= DATE_ADD('2016-09-09',INTERVAL _i DAY);

 #平台总待还金额
 select SUM(recivedPrincipal+recievedInterest-hasPrincipal-hasInterest)
    into @dh_data from t_invest where 1=1;

#前一天平均年利率，如果对应前一天没有数据的，对应值为平均年利率即可，保留2位小数
 select ROUND(AVG(tb.annualRate),2) 
  INTO @avg_apr
   from t_borrow tb where tb.publishTime BETWEEN DATE_ADD('2016-09-09',INTERVAL (_i-1) DAY) and DATE_ADD('2016-09-09',INTERVAL (_i) DAY);

 select ROUND(AVG(tb.annualRate), 2) INTO @avg_apr2 FROM t_borrow tb ;

  insert into t_rongtuwang(recordTime,apr_data,count_data,dcount_data,time_data1_3,time_data4_6,time_data7_12,time_data12_,
		cj_data,dh_data,avg_apr) 
	values (DATE_ADD('2016-09-09',INTERVAL _i DAY),IFNULL(@apr_data,0.00),IFNULL(@count_data,0.00),IFNULL(@dcount_data,0.00),
		IFNULL(@time_data1_3,0.00),IFNULL(@time_data4_6,0.00),IFNULL(@time_data7_12,0.00),IFNULL(@time_data12_,0.00),
		IFNULL(@cj_data,0.00),IFNULL(@dh_data,0.00),IFNULL(@avg_apr,@avg_apr2)); 

  set _i = _i +1; 
 end while;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_rongtu_add_data_everydate
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_rongtu_add_data_everydate`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_rongtu_add_data_everydate`()
BEGIN 
declare _i int default -1; 
 #投资成功待收金额 

  SET @apr_data = '';  #每天的标的平均年利率，没有为0.
  SET @count_data = '';  #每天对应发布借款的金额，没有则为0.
  SET @dcount_data = '';  #每天借款成功的借款金额，没有则为0.
  SET @time_data1_3 = ''; #1-3个月的所有标的总额
  SET @time_data4_6 = ''; #4-6个月的所有标的总额
  SET @time_data7_12 = ''; #7-12个月的所有标的总额
  SET @time_data12_ = ''; #12个月以上的所有标的总额
  SET @cj_data = ''; #平台总成交量，单位万元，保留2位小数
  SET @dh_data = ''; #平台总待还金额，单位万元，保留2位小数
  SET @avg_apr = ''; #前一天平均年利率，如果对应前一天没有数据的，对应值为平均年利率即可，保留2位小数

 while _i < 0 do

 #每天的标的平均年利率，没有为0.  #每天对应发布借款的金额，没有则为0.
 select ROUND(AVG(tb.annualRate),2),ROUND(AVG(tb.borrowAmount),2)
  INTO @apr_data,@count_data
   from t_borrow tb where tb.publishTime BETWEEN DATE_ADD(CURDATE(),INTERVAL _i DAY) and DATE_ADD(CURDATE(),INTERVAL (1+_i) DAY);

 #每天借款成功的借款金额，没有则为0.
 select ROUND(AVG(tb.investAmount),2)
  INTO @dcount_data
   from t_invest tb where tb.investTime BETWEEN DATE_ADD(CURDATE(),INTERVAL _i DAY) and DATE_ADD(CURDATE(),INTERVAL (1+_i) DAY);

#1-3个月的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data1_3 FROM t_invest tb
 WHERE tb.investTime < DATE_ADD(CURDATE(), INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline < 4);

#4-6个月的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data4_6 FROM t_invest tb
 WHERE tb.investTime < DATE_ADD(CURDATE(), INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline BETWEEN 4 and 7);

#7-12个月的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data7_12 FROM t_invest tb
 WHERE tb.investTime < DATE_ADD(CURDATE(), INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline BETWEEN 7 and 12);

#12个月以上的所有标的总额
SELECT sum(tb.investAmount) INTO @time_data12_ FROM t_invest tb
 WHERE tb.investTime < DATE_ADD(CURDATE(), INTERVAL _i DAY)
 AND tb.borrowId IN (SELECT id FROM t_borrow t WHERE t.deadline > 12);

 #平台总成交量
 select sum(tb.investAmount) INTO @cj_data from t_invest tb where tb.investTime <= DATE_ADD(CURDATE(),INTERVAL _i DAY);

 #平台总待还金额
 select SUM(recivedPrincipal+recievedInterest-hasPrincipal-hasInterest)
    into @dh_data from t_invest where 1=1;

#前一天平均年利率，如果对应前一天没有数据的，对应值为平均年利率即可，保留2位小数
 select ROUND(AVG(tb.annualRate),2) 
  INTO @avg_apr
   from t_borrow tb where tb.publishTime BETWEEN DATE_ADD(CURDATE(),INTERVAL (_i-1) DAY) and DATE_ADD(CURDATE(),INTERVAL (_i) DAY);

SELECT
	ROUND(AVG(tb.annualRate), 2) INTO @avg_apr2
FROM
	t_borrow tb ;

  insert into t_rongtuwang(recordTime,apr_data,count_data,dcount_data,time_data1_3,time_data4_6,time_data7_12,time_data12_,
		cj_data,dh_data,avg_apr) 
	values (DATE_ADD(CURDATE(),INTERVAL _i DAY),IFNULL(@apr_data,0.00),IFNULL(@count_data,0.00),IFNULL(@dcount_data,0.00),
		IFNULL(@time_data1_3,0.00),IFNULL(@time_data4_6,0.00),IFNULL(@time_data7_12,0.00),IFNULL(@time_data12_,0.00),
		IFNULL(@cj_data,0.00),IFNULL(@dh_data,0.00),IFNULL(@avg_apr,@avg_apr2)); 

  set _i = _i +1; 
 end while;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_update_borrow_time
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_update_borrow_time`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_update_borrow_time`(IN `in_date` varchar(30),OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:begin
	declare maxWithDrawSum decimal(18,2) default 50000;	#最大提现金额
	declare overMoney	decimal(18,2)	default	0;	#超出金额
	declare poundage	decimal(18,2)	default	0;	#提现超出手续费
	declare addPoundage	decimal(18,4)	default	0;	#提现手续费
	declare rechargeOut15	decimal(18,2)	default	0;	#15天外金额
	declare dealMoney	decimal(18,2)	default	0;	#处理金额
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	set @cashStatus = null;
	select cashStatus into @cashStatus from t_group a left join  t_group_user b on a.id=b.groupId where userId=in_uid and cashStatus=2;
	if @cashStatus is not null then
		set out_ret = -2;
		set out_desc = '用户提现被禁用';
		leave _return;
	end if;
	set @dealpwd	=	null;
	set	@loginpwd	=	null;
	set	@usableSum = 0;
	set	@username	=	null;
	set	@cellPhone	=	null;
	set	@enables	=	2;
	select a.`enable`,	a.`password`,	a.dealpwd,	a.usableSum,	a.username,	b.cellPhone	into	@enables,	@loginpwd,
	@dealpwd,	@usableSum,	@username,@cellPhone from t_user	a	left	join	t_person	b	on	b.userId	=	a.id	where	
	a.id	=	in_uid;
  set @usableSum = ifnull(@usableSum,0);
	if	@username	is	null then
		set out_ret = -3;
		set out_desc = '无此用户';
		leave _return;
	end	if;
	if	@enables	=	2 then
		set out_ret = -4;
		set out_desc = '禁用用户';
		leave _return;
	end	if;
	if	@enables	=	3	then
		set out_ret = -5;
		set out_desc = '黑名单用户';
		leave _return;
	end	if;
	if	in_money	<=0	then
		set out_ret = -6;
		set out_desc = '金额错误';
		leave _return;
	end	if;
	if	@usableSum <=0	then
		set out_ret = -7;
		set out_desc = '账户余额不足';
		leave _return;
	end	if;
	if	in_money	>	@usableSum	then
		set out_ret = -8;
		set out_desc = concat('账户余额:￥',@usableSum,'元');
		leave _return;
	end	if;
	if	in_money	>	maxWithDrawSum	then
		set out_ret = -9;
		set out_desc = concat('最高提现金额:￥',maxWithDrawSum,'元');
		leave _return;
	end	if;
	#若未设置交易密码默认登录密码
	if	@dealpwd	is null	then
		set @dealpwd = @loginpwd;
	end	if;
	if	in_dealpwd	<>	@dealpwd	then
		set out_ret = -10;
		set out_desc = '交易密码错误';
		leave _return;
	end	if;
	#计算15天外的金额
	set	@withDrawFee	=	0;
	select costFee	into	@withDrawFee from t_platform_cost where id =9;
  set @withDrawFee = ifnull(@withDrawFee,0);
	if	in_money	>	maxWithDrawSum	then
		#首先超出的部分进行手续费的计算，然后未超出的部分看是否在15天内提取并且没有进行投标的
		set overMoney	=	in_money	-	maxWithDrawSum;
		set	poundage	=	overMoney*@withDrawFee*0.01;
		set	dealMoney	=	in_money	-	overMoney;
	else
		set	dealMoney	=	in_money;
		set	poundage	=	0;
	end	if;
	set	@rechargeMoney	=	0;
	set @rechargeTime	=	DATE_SUB(in_date,INTERVAL 15 day);
	select sum(rechargeMoney) into @rechargeMoney from t_recharge_detail where result=1
	and userId	=	in_uid	and rechargeTime	>=	@rechargeTime;
	set @rechargeMoney = ifnull(@rechargeMoney, 0);
	set	rechargeOut15	=	@usableSum	-	@rechargeMoney;
	if	rechargeOut15	<	0	then
		set	rechargeOut15	=	0;
	end	if;
	#查看15天以内成功获得的还款
	set	@tradeIn15	=	0;
	select sum(a.hasPrincipal+a.hasInterest) hasPI	into	@tradeIn15	from t_invest a left join 
	t_borrow b on  a.borrowId = b.id	left join t_repayment c on c.borrowId = b.id where
  c.realRepayDate >= @rechargeTime	and a.investor = in_uid and b.id is not null group by a.investor;
	set @tradeIn15 = ifnull(@tradeIn15, 0);
	set	@cardNo	=	'';
	select	cardNo	into	@cardNo	from	t_bankcard	where	id	=	in_bank_id;
	start transaction;
		if	in_money	<=	rechargeOut15	then
			insert	into	t_withdraw(`name`,	cellPhone,	acount,	sum,	poundage,	`status`,	applyTime,
			userId,	bankId,	ipAddress)	values(@username,	@cellPhone,	@cardNo,	in_money,	poundage,1,now(),	
			in_uid,	in_bank_id,in_ip);
			set out_ret = last_insert_id();
		else
			if	in_money	<=	(rechargeOut15+@tradeIn15)	then
				insert	into	t_withdraw(`name`,	cellPhone,	acount,	`sum`,	poundage,	`status`,	applyTime,
				userId,	bankId,	ipAddress)	values(@username,	@cellPhone,	@cardNo,	in_money,	poundage,1,now(),	
				in_uid,	in_bank_id,in_ip);
				set out_ret = last_insert_id();
			else
				set	dealMoney	=	in_money	- rechargeOut15	- @tradeIn15;
				set	addPoundage	=	dealMoney*@withDrawFee*0.01;
				set	poundage	=	poundage	+	addPoundage;
				insert	into	t_withdraw(`name`,	cellPhone,	acount,	`sum`,	poundage,	`status`,	applyTime,
				userId,	bankId,	ipAddress)	values(@username,	@cellPhone,	@cardNo,	in_money,	poundage,1,now(),	
				in_uid,	in_bank_id,in_ip);
				set out_ret = last_insert_id();
			#添加操作日志
			select lastIP into @t_lastIP from t_user where id = in_uid;
			insert into t_operation_log(operation_table,operation_user,operation_type,operation_ip,operation_money,operation_remarks,operation_around)
			values('t_withdraw',@username,1,@t_lastIPm,in_money,'申请提现冻结金额',1);
			end	if;	
		end	if;
		if	out_ret	<=0	then
			rollback;	
			set out_ret = -2;
			set out_desc = '提现记录无效';
			leave _return;
		end	if;
	#执行扣费操作
	#插入提现记录之后，则用户表里面的可用余额减少，冻结余额增加
	update t_user set usableSum = usableSum	-	in_money, freezeSum	=	freezeSum	+ in_money  where id	=	in_uid;
	insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum,
	trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,spending)	select in_uid, now(), -1, '冻结提现金额', in_money,
	a.usableSum as usableSum, a.freezeSum as freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0),
	-1,0, concat('冻结提现金额[',in_money,']元'), 0, out_ret, '', 0,in_money
	from t_user a left join t_invest b on a.id = b.investor where a.id = in_uid group by a.id;
	if	_error	<>	0	then
		rollback;
		set out_ret = -3;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_useraddmoney
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_useraddmoney`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_useraddmoney`(IN in_userid BIGINT(20), IN in_money DOUBLE(18, 2), IN in_paynumber VARCHAR(50), IN in_remarks VARCHAR(100),IN  in_pMerBillNo VARCHAR(100), IN  in_pIpsBillNo  VARCHAR(100), IN  in_pageType VARCHAR(40),OUT returnValue INT, OUT returnDescription VARCHAR(100))
_return:BEGIN
	DECLARE tmpuserid INT;
	DECLARE tmppayresult SMALLINT;
	DECLARE tmprelatedordertype INT;
	DECLARE tmprelatedorderid INT;
	DECLARE tmpoperatortype INT;
	DECLARE tmpPaymoney DECIMAL(18, 2);
	DECLARE tmppaynumber BIGINT;
	DECLARE tmpbankName VARCHAR(20);
	DECLARE tmpcost DECIMAL(18, 2);
	DECLARE tmprechargeType INT;
	DECLARE tmprechargeTypeName VARCHAR(20);
	DECLARE t_content VARCHAR(1024) DEFAULT ''; #信息
	DECLARE t_mail_template VARCHAR(2048) DEFAULT ''; #站内信模版
	DECLARE t_email_template VARCHAR(2048) DEFAULT ''; #邮件模版
	DECLARE t_sms_template VARCHAR(2048) DEFAULT ''; #短信模版
	SET returnValue = 0;
	SET returnDescription = '';
	SET tmpuserid = -1;
	SELECT id INTO tmpuserid FROM t_user WHERE id = in_userid;
	IF (tmpuserid <= 0) THEN
		SET returnValue = -1;
		SET returnDescription = '用户不存在';
		LEAVE _return;		
	END IF;
	SET tmppaynumber = CAST(in_paynumber AS SIGNED);
	#result 默认值为 0
	SET tmppayresult = -1;
	SELECT rechargeMoney, result, bankName, cost, rechargeType INTO tmpPaymoney, tmppayresult, tmpbankName, tmpcost, tmprechargeType  FROM t_recharge_detail WHERE id = tmppaynumber AND userid = in_userid;
	IF (tmppayresult < 0) THEN
		SET returnValue = -2;
		SET returnDescription = '支付号错误';
		LEAVE _return;	
	END IF;
	IF (tmppayresult = 1) THEN
		SET returnValue = -3;
		SET returnDescription = '充值成功了';
		LEAVE _return;	
	END IF;
	IF (tmpPaymoney <> in_money) THEN
		SET returnValue = -4;
		SET returnDescription = '充值金额与本地记录中的金额不一致';
		LEAVE _return;
	END IF;
	
  #开启事务
	START TRANSACTION;
	INSERT INTO t_rechargenumberlist(PayNumber, Money) VALUES (tmppaynumber, in_money);
	UPDATE t_recharge_detail SET result = 1 WHERE id = tmppaynumber;
	UPDATE t_user SET usableSum = usableSum + in_money  WHERE id = in_userid;
	#充值类型(1,为支付宝 2 环迅支付 3国付宝 4线下充值)
	SET tmprechargeTypeName = CASE tmprechargeType 
	WHEN 1 		THEN '双乾充值'
	WHEN 2 		THEN '汇付充值'
	WHEN 3 		THEN '国付宝充值'
	WHEN 4 		THEN '线下充值'
	ELSE '未知' END; 
	  UPDATE t_billcode
SET
  pIpsBillNo = in_pIpsBillNo
WHERE
  pMerBillNo = in_pMerBillNo;
	INSERT INTO t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum, trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost,income, pageType)
		SELECT in_userid, NOW(), -1, tmprechargeTypeName, in_money, a.usableSum, a.freezeSum, ifnull(SUM(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0.00), in_userid, a.dueoutSum, in_remarks, 0, tmppaynumber, tmpbankName, tmpcost ,in_money, in_pageType
			FROM t_user a LEFT JOIN t_invest b ON a.id = b.investor WHERE a.id = in_userid GROUP BY a.id;
	 
	SET @username = '';
	 
	SET @email = '';
	 
	SET @telphone = '';
	 
	SELECT a.cellphone, b.username, b.email INTO @telphone, @username, @email FROM t_user b LEFT JOIN
	 
	t_person a ON a.userId = b.id WHERE b.id =  in_userid;
    #生成通知模版
	SET t_mail_template = f_get_notice_template('recharge_success');
	 
	SET t_mail_template = REPLACE(t_mail_template, '[userName]', @username);
	SET t_mail_template = REPLACE(t_mail_template, '[date]', NOW());
	 
	SET t_mail_template = REPLACE(t_mail_template, '[money]', in_money);
	 
	SET t_mail_template = REPLACE(t_mail_template, '[<br/>]', '<br />');
	 
	 
	 
	SET t_email_template = f_get_notice_template('e_recharge_success');
	 
	SET t_email_template = REPLACE(t_email_template, '[date]', NOW());
	 
	SET t_email_template = REPLACE(t_email_template, '[money]', in_money);
	 
	SET t_email_template = REPLACE(t_email_template, '[<br/>]', '<br />');
	 
	SET t_sms_template = f_get_notice_template('s_recharge_success');
	 
	SET t_sms_template = REPLACE(t_sms_template, '[userName]', @username);
	 
	SET t_sms_template = REPLACE(t_sms_template, '[date]', NOW());
	 
	SET t_sms_template = REPLACE(t_sms_template, '[money]', in_money);
	 
	SET t_sms_template = REPLACE(t_sms_template, '[<br/>]', '<br />');
	 
	 
	INSERT INTO t_notice_task(user_id, sendtitle, s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
	 
	VALUES(in_userid, '充值成功报告', 'showSucEnable', @username, @email, @telphone, t_mail_template, t_email_template, t_sms_template, in_userid, NOW(), 'recharge');
	IF (LAST_INSERT_ID() <= 0) THEN 
		ROLLBACK;
		SET returnValue = -99999;
		SET returnDescription = '未知错误'; 
		LEAVE _return;
	END IF; 
	COMMIT; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_useraddmoneymanual
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_useraddmoneymanual`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_useraddmoneymanual`(in in_userid bigint(20), in in_rechargetype int, in in_money double(18, 2), in in_remarks varchar(100), in in_addIp varchar(100),in in_operatorid bigint, out returnValue int, out returnDescription varchar(100))
_return:BEGIN
	declare tmpuserid int;
	declare tmppayresult smallint;
	declare tmprelatedordertype int;
	declare tmprelatedorderid int;
	declare tmpoperatortype int;
	declare tmpPaymoney decimal(18, 2);
	declare tmppaynumber bigint;
	declare tmprechargeTypeName varchar(20);
	set returnValue = 0;
	set returnDescription = '';
	set tmpuserid = -1;
	select id into tmpuserid from t_user where id = in_userid;
	if (tmpuserid <= 0) then
		set returnValue = -1;
		set returnDescription = '用户不存在';
		leave _return;		
	end if; 
	
  #开启事务
	start transaction;
	if in_rechargetype = 5 then 
		set @save_type = 1;
	else 
		set @save_type = in_rechargetype;
	end if;
	insert into t_recharge_withdraw_info (userId, type, dealMoney, remark, checkUser, checkTime, `comment`) 
		values (in_userid, @save_type, in_money, in_remarks, in_operatorid, now(), in_remarks);
	insert into t_recharge_detail (userid, rechargeTime, rechargeType, bankName, rechargeMoney, cost, result, operatorId, ipAddress) 
		values (in_userid, now(), in_rechargetype, '', in_money, 0, 1, in_operatorid, in_addIp);
	set tmppaynumber = last_insert_id();
	insert into t_rechargenumberlist(PayNumber, Money) values (tmppaynumber, in_money);
	update t_user set usableSum = usableSum + in_money where id = in_userid;
	#(5 为手工充值 6 虚拟充值 7 奖励充值  )
	set tmprechargeTypeName = case in_rechargetype 
	when 5 		then '手工充值'
	when 6 		then '虚拟充值'
	when 7 		then '奖励充值'
	else '未知' end; 
	insert into t_fundrecord (userId, recordTime, operateType, fundMode, handleSum, usableSum, freezeSum, dueinSum, trader, dueoutSum, remarks, oninvest, paynumber, paybank, cost, income)
	select in_userid, now(), -1, tmprechargeTypeName, in_money, a.usableSum, a.freezeSum, ifnull(sum(b.recivedPrincipal + b.recievedInterest - b.hasPrincipal - b.hasInterest),0), -1,
	a.dueoutSum, in_remarks, 0, tmppaynumber, '', 0 ,in_money from t_user a left join t_invest b on a.id = b.investor where a.id = in_userid group by a.id;
	if (last_insert_id() <= 0) then 
		rollback;
		set returnValue = -99999;
		set returnDescription = '未知错误'; 
		leave _return;
	end if; 
	commit; 
	set returnValue = 1;
		set returnDescription = '添加成功'; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_userInfo_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_userInfo_update`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_userInfo_update`(IN `in_realname` varchar(20),IN `in_cellPhone` varchar(20),IN `in_sex` varchar(20),IN `in_birthday` varchar(20),IN `in_highestEdu` varchar(20),IN `in_eduStartDay` varchar(20),IN `in_school` varchar(20),IN `in_maritalStatus` varchar(20),IN `in_hasChild` varchar(20),IN `in_hasHourse` varchar(20),IN `in_hasHousrseLoan` varchar(20),IN `in_hasCar` varchar(20),IN `in_hasCarLoan` varchar(20),IN `in_nativePlacePro` bigint,IN `in_nativePlaceCity` bigint,IN `in_registedPlacePro` bigint,IN `in_registedPlaceCity` bigint,IN `in_address` varchar(200),IN `in_telephone` varchar(20),IN `in_personalHead` varchar(255),IN `in_userId` bigint,IN `in_idNo` varchar(20),IN `in_idNoPositiveImg` varchar(255),IN `in_idNoReverseImg` varchar(255),IN `in_username` varchar(20),IN `in_lastIP` varchar(50),IN `in_num` varchar(20),IN `in_flag` bigint, OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:BEGIN
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	SET @u_num = 0;
	SET @p_num = 0;
	
	SELECT COUNT(1) INTO @u_num from t_person WHERE userId = in_userId;
	SELECT COUNT(1) INTO @p_num FROM t_phone_binding_info WHERE userId = in_userId;
	select authStep into @u_authStep from t_user where id = in_userId;
	start transaction;
	
	IF @u_num = 0 THEN
	
			IF in_flag = 1 THEN
			INSERT into t_person (realName, cellphone, sex, birthday, highestEdu, eduStartDay, school,
						maritalStatus, hasChild, hasHourse, hasHousrseLoan, hasCar, hasCarLoan, nativePlacePro,
						nativePlaceCity, registedPlacePro, registedPlaceCity, address, telephone, userId, personalHead, idNo,idNoPositiveImg,idNoReverseImg, auditStatus,flag,qq) 
						VALUES (in_realname,in_cellphone,in_sex,in_birthday,in_highestEdu,in_eduStartDay,in_school,
						in_maritalStatus,in_hasChild,in_hasHourse,in_hasHousrseLoan,in_hasCar,in_hasCarLoan,in_nativePlacePro,
						in_nativePlaceCity,in_registedPlacePro,in_registedPlaceCity,in_address,in_telephone,in_userId,in_personalHead,in_idNo,in_idNoPositiveImg,in_idNoReverseImg,3,1,"");
		ELSE
			INSERT into t_person (realName, cellphone, sex, birthday, highestEdu, eduStartDay, school,
						maritalStatus, hasChild, hasHourse, hasHousrseLoan, hasCar, hasCarLoan, nativePlacePro,
						nativePlaceCity, registedPlacePro, registedPlaceCity, address, telephone, userId, personalHead, idNo,idNoPositiveImg,idNoReverseImg, auditStatus,flag,qq) 
						VALUES (in_realname,in_cellphone,in_sex,in_birthday,in_highestEdu,in_eduStartDay,in_school,
						in_maritalStatus,in_hasChild,in_hasHourse,in_hasHousrseLoan,in_hasCar,in_hasCarLoan,in_nativePlacePro,
						in_nativePlaceCity,in_registedPlacePro,in_registedPlaceCity,in_address,in_telephone,in_userId,in_personalHead,in_idNo,in_idNoPositiveImg,in_idNoReverseImg,1,1,"");		
		END IF;
		
	INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
						VALUES ("t_person",in_username,1,in_lastIP,NOW(),"填写个人详细资料",1);
	#在没有填写资料的情况下才修改用户的认证状态值
	#UPDATE t_user SET authStep = 2 WHERE id = in_userId;	
	ELSE
		
		UPDATE t_person SET realName = in_realname,cellphone=in_cellphone,sex=in_sex,birthday=in_birthday,highestEdu=in_highestEdu,eduStartDay=in_eduStartDay,school=in_school,
		maritalStatus=in_maritalStatus,hasChild=in_hasChild,hasHourse=in_hasHourse,hasHousrseLoan=in_hasHousrseLoan,hasCar=in_hasCar,hasCarLoan=in_hasCarLoan,nativePlacePro=in_nativePlacePro,
		nativePlaceCity=in_nativePlaceCity,registedPlacePro=in_registedPlacePro,registedPlaceCity=in_registedPlaceCity,address=in_address,telephone=in_telephone,userId=in_userId,personalHead=in_personalHead,idNo=in_idNo,idNoPositiveImg=in_idNoPositiveImg,idNoReverseImg=in_idNoReverseImg WHERE userId = in_userId;
		
		INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
								VALUES ("t_person",in_username,1,in_lastIP,NOW(),"更新个人详细资料",1);
	
	end IF;
	UPDATE t_user SET authStep = 2 WHERE id = in_userId and authStep = 1;
	INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_user",in_username,2,in_lastIP,NOW(),"填写个人详细资料",1);
	IF @p_num = 0 THEN 
		INSERT INTO t_phone_binding_info (mobilephone,userId,status,requsetTime,reason,type)
				VALUES(in_cellphone,in_userId,2,NOW(),"填写个人基本资料时绑定手机",1);
		INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_phone_binding_info",in_username,1,in_lastIP,NOW(),"填写个人详细资料时手机绑定",1);
	END IF;
	
	if	_error	<>	0	then
		rollback;
		set out_ret = -2;
		set out_desc = '执行异常';
 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_userInfo_update_admin
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_userInfo_update_admin`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_userInfo_update_admin`(IN `in_realname` varchar(20),IN `in_cellPhone` varchar(20),IN `in_sex` varchar(20),IN `in_birthday` varchar(20),IN `in_highestEdu` varchar(20),IN `in_eduStartDay` varchar(20),IN `in_school` varchar(20),IN `in_maritalStatus` varchar(20),IN `in_hasChild` varchar(20),IN `in_hasHourse` varchar(20),IN `in_hasHousrseLoan` varchar(20),IN `in_hasCar` varchar(20),IN `in_hasCarLoan` varchar(20),IN `in_workPro` bigint,IN `in_workCity` bigint,IN `in_companyType` varchar(100),IN `in_companyLine` varchar(100),IN `in_companyScale` varchar(100),IN `in_job` varchar(20),IN `in_userId` bigint,IN `in_idNo` varchar(20),IN `in_username` varchar(20),IN `in_lastIP` varchar(50),IN `in_num` varchar(20),IN in_applyId bigint,OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:BEGIN
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	SET @u_num = 0;
	SET @p_num = 0;
  SET @r_num = 0;
  SET @num = 1;
	
	SELECT COUNT(1) INTO @u_num from t_person WHERE userId = in_userId;
	SELECT COUNT(1) INTO @p_num FROM t_phone_binding_info WHERE userId = in_userId;
	start transaction;
	
	IF @u_num = 0 THEN
	
	INSERT into t_person (realName, cellphone, sex, birthday, highestEdu, eduStartDay, school,
						maritalStatus, hasChild, hasHourse, hasHousrseLoan, hasCar, hasCarLoan,
						userId, idNo, auditStatus,flag,qq) 
						VALUES (in_realname,in_cellphone,in_sex,in_birthday,in_highestEdu,in_eduStartDay,in_school,
						in_maritalStatus,in_hasChild,in_hasHourse,in_hasHousrseLoan,in_hasCar,in_hasCarLoan,
						in_userId,in_idNo,3,1,"");
		
	INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
						VALUES ("t_person",in_username,1,in_lastIP,NOW(),"填写个人详细资料",1);
	insert into t_workauth (workPro, workCity, companyType, companyLine, companyScale,
			job, userId,auditStatus,directedStatus,otherStatus,moredStatus)
			VALUES(in_workPro,in_workCity,in_companyType,
				in_companyLine,in_companyScale,in_job,in_userId,3,3,3,3);
INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_workauth",@uname,1,in_lastIP,NOW(),"填写个人工作资料",1);
			#添加借款、申请、用户关联表
				 insert into t_borrow_role (userId,applyId,authStep) VALUES(in_userId,in_applyId,1);
				select COUNT(1) into @r_num from t_materialsauthtype where id < 17;
				
				if @r_num > 0 then
					
					WHILE @num <= @r_num DO
						
						insert into t_materialsauth (userId,materAuthTypeId) 
							values(in_userId,@num);
						set @num = @num + 1;
						
					END WHILE;
				end if;
	ELSE
		
		UPDATE t_person SET realName = in_realname,cellphone=in_cellphone,sex=in_sex,birthday=in_birthday,highestEdu=in_highestEdu,eduStartDay=in_eduStartDay,school=in_school,
		maritalStatus=in_maritalStatus,hasChild=in_hasChild,hasHourse=in_hasHourse,hasHousrseLoan=in_hasHousrseLoan,hasCar=in_hasCar,hasCarLoan=in_hasCarLoan,userId=in_userId,idNo=in_idNo WHERE userId = in_userId;
		
		INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
								VALUES ("t_person",in_username,1,in_lastIP,NOW(),"更新个人详细资料",1);
    update t_workauth SET workPro=in_workPro,workCity=in_workCity,companyType=in_companyType,
			companyLine=in_companyLine,companyScale=in_companyScale,job=in_job,userId=in_userId where userId=in_userId;
			
			INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_workauth",@uname,2,in_lastIP,NOW(),"修改个人工作资料",1);	
	end IF;
	IF @p_num = 0 THEN 
		INSERT INTO t_phone_binding_info (mobilephone,userId,status,requsetTime,reason,type)
				VALUES(in_cellphone,in_userId,1,NOW(),"填写个人基本资料时绑定手机",1);
		INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_phone_binding_info",in_username,1,in_lastIP,NOW(),"填写个人详细资料时手机绑定",1);
	END IF;
   
	if	_error	<>	0	then
		rollback;
		set out_ret = -2;
		set out_desc = '执行异常';
 
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc = '';
	end	if;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_userWorkInfo_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_userWorkInfo_update`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_userWorkInfo_update`(IN `in_orgName` varchar(50),IN `in_occStatus` varchar(10),IN `in_workPro` bigint,IN `in_workCity` bigint,IN `in_companyType` varchar(50),IN `in_companyLine` varchar(50),IN `in_companyScale` varchar(50),IN `in_job` varchar(50),IN `in_monthlyIncome` varchar(50),IN `in_workYear` varchar(50),IN `in_companyTel` varchar(50),IN `in_workEmail` varchar(50),IN `in_companyAddress` varchar(200),IN `in_directedName` varchar(20),IN `in_directedRelation` varchar(20),IN `in_directedTel` varchar(20),IN `in_otherName` varchar(20),IN `in_otherRelation` varchar(20),IN `in_otherTel` varchar(20),IN `in_moredName` varchar(20),IN `in_moredRelation` varchar(20),IN `in_moredTel` varchar(20),IN `in_userId` bigint,IN `in_vipStatus` int,IN `in_newutostept` int,IN `in_lastIP` varchar(50),OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:BEGIN
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	set @u_num = 0;
	set @uname = '';
  
	select COUNT(1) into @u_num from t_workauth where userId = in_userId;
	select username into @uname from t_user where id = in_userId;
	
	start transaction;
	if @u_num = 0 then 
		insert into t_workauth (orgName, occStatus, workPro, workCity, companyType,
			companyLine, companyScale, job, monthlyIncome, workYear, companyTel,
			workEmail, companyAddress, directedName, directedRelation, directedTel, otherName,
			otherRelation, otherTel, moredName,	moredRelation, moredTel, userId,auditStatus,directedStatus,otherStatus,moredStatus)
			VALUES(in_orgName,in_occStatus,in_workPro,in_workCity,in_companyType,
				in_companyLine,in_companyScale,in_job,in_monthlyIncome,in_workYear,in_companyTel,
				in_workEmail,in_companyAddress,in_directedName,in_directedRelation,in_directedTel,in_otherName,
				in_otherRelation,in_otherTel,in_moredName,in_moredRelation,in_moredTel,in_userId,1,1,1,1);
			
			INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_workauth",@uname,1,in_lastIP,NOW(),"填写个人工作资料",1);
     #SELECT creditrating into @credit from t_user WHERE id=in_userId;
      #UPDATE t_user set creditrating=@credit+10 where id=in_userId;
	ELSEIF @u_num > 0 THEN
		update t_workauth SET orgName=in_orgName,occStatus=in_occStatus,workPro=in_workPro,workCity=in_workCity,companyType=in_companyType,
			companyLine=in_companyLine,companyScale=in_companyScale,job=in_job,monthlyIncome=in_monthlyIncome,workYear=in_workYear,companyTel=in_companyTel,
			workEmail=in_workEmail,companyAddress=in_companyAddress,directedName=in_directedName,directedRelation=in_directedRelation,directedTel=in_directedTel,otherName=in_otherName,
			otherRelation=in_otherRelation,otherTel=in_otherTel,moredName=in_moredName,moredRelation=in_moredRelation,moredTel=in_moredTel,userId=in_userId where userId=in_userId;
			
			INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
							VALUES ("t_workauth",@uname,2,in_lastIP,NOW(),"修改个人工作资料",1);
	END IF;
	IF in_newutostept = 2 THEN
		UPDATE t_user SET authStep = 3 WHERE id = in_userId;
	END IF;
	
	IF in_newutostept <> 1 THEN
		IF in_newutostept <= 3 THEN
			UPDATE t_user SET authStep = 4 WHERE id = in_userId;
		END IF;
	END IF;
	
	if	_error	<>	0	then
		rollback;
		set out_ret = -2;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = 1;
		set out_desc ="";
	end	if;
	
	
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_user_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_user_login`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_user_login`(IN `in_userName` varchar(50),IN `in_passWord` varchar(50),IN `in_lastIP` varchar(50),OUT `out_ret` int,OUT `out_desc` varchar(50))
_return:BEGIN
declare _error int default 0; #异常标记#
declare continue handler for sqlexception set _error = 1; #sqlexception返回值
set out_ret = -1;
set out_desc = '执行失败';
set @u_id = -1;
set @u_username = null;
set @u_rating = 0;
set @u_enable= 0;
set @u_login_count = 0;
set @u_loginNum = 0;
if in_userName = "" then 
set out_ret = -2 ;
set out_desc = '用户名或邮箱或手机号码为空';
leave _return;
end if;
if in_userName = "" then 
set out_ret = -3 ;
set out_desc = '密码为空';
leave _return;
end if;
select u.id, u.username, u.rating, u.`enable`, u.loginCount into @u_id, @u_username, @u_rating, @u_enable, @u_login_count from t_user u left 
          join t_person p on u.id = p.userId where (u.email = in_userName or u.username = in_userName or p.cellphone = in_userName) and u.`password` = in_passWord;
set @u_id = ifnull(@u_id,-1);
set @u_rating = ifnull(@u_rating,0);
set @u_enable= ifnull(@u_enable,0);
set @u_login_count = ifnull(@u_login_count,0);
set @u_loginNum = ifnull(@u_loginNum,0);
if @u_id = -1 then 
set out_ret = -4 ;
set out_desc = '用户名或密码错误';
leave _return;
end if;
if @u_enable = 2 then
set out_ret = -5 ;
set out_desc = '用户被禁用';
leave _return;
end if;
start transaction;
if @u_id > 0 then
call p_user_score(@u_id,@u_username,in_lastIP, @ret, @ret_desc);
end if;
if _error <> 0 then
rollback;
set out_ret = -11;
set out_desc = '执行异常';
leave _return;
else 
commit;
set out_ret = @u_id;
set out_desc = '';
end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_user_register
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_user_register`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_user_register`(IN `in_email` varchar(100),IN `in_username` varchar(20),IN `in_password` varchar(100),IN `in_refferee` varchar(20),IN `in_demo` int,OUT `out_ret` int,OUT `out_desc` varchar(100))
_return: BEGIN
	declare	_error	int	default	0;	#异常标记
	declare continue handler for sqlexception set _error	=	1;	#sqlexception返回值
	set out_ret = -1;
	set out_desc = '执行失败';
	
	SET @e_num = 0;
	SET @u_num = 0;
	SET @r_num = 0;
	SET @num = 1;
	SET @u_id = -1;
	SET @u_creditrating = 0;
	SET @u_enable = 2;
	SET @u_vipstatus = 1;
	SET @u_vipcreatetime = null;
	if ifnull(in_email, '') = '' then
		set out_ret = -2;
		set out_desc = '邮箱不能为空';
		leave _return;
	end if;
	if ifnull(in_username, '') = '' then
		set out_ret = -3;
		set out_desc = '用户名不能为空';
		leave _return;
	end if;
		if ifnull(in_password, '') = '' then
		set out_ret = -6;
		set out_desc = '用户密码不能为空';
		leave _return;
	end if;
	SELECT COUNT(1) INTO @e_num FROM t_user WHERE email = in_email;
	SELECT COUNT(1) INTO @u_num FROM t_user WHERE username = in_username;
	IF
		@e_num <> 0 THEN
			SET out_ret = -4;
			SET out_desc = '该邮箱已经被注册';
			
			leave _return;
	end if;
	IF 
		@u_num <> 0 THEN
			SET out_ret = -5;
			SET out_desc = '该用户名已存在';
			leave _return;
	END IF;
	
	start transaction;
	select init_credit into @u_creditrating from t_borrow_amount_type where nid = 'credit';
	if in_demo = 1 then 
		set @u_enable = 1;
		#set @u_vipstatus = 2;
		#set @u_vipcreatetime = NOW();
		#select init_credit into @u_creditrating from t_borrow_amount_type where nid = 'credit';
	end if;
		if in_demo = 2 then 
        select status into @u_status from t_borrow_amount_type where nid = 'credit';
        if @u_status = 1 THEN
            select init_credit into @u_creditrating from t_borrow_amount_type where nid = 'credit';
            
        end if;
    end if;
	
	insert into t_user (email,username,nickname,password,dealpwd,refferee,vipStatus,vipCreateTime,createTime,creditLimit,authStep,`enable`,usableCreditLimit) 
			values (in_email,in_username,in_username,in_password,in_password,in_refferee,@u_vipstatus,@u_vipcreatetime,NOW(),@u_creditrating,1,@u_enable,@u_creditrating);
	select id into @u_id from t_user where email = in_email;
	select COUNT(1) into @r_num from t_materialsauthtype where id < 17;
	
	if @r_num > 0 then
		
		WHILE @num <= @r_num DO
			
			insert into t_materialsauth (userId,materAuthTypeId) 
				values(@u_id,@num);
			set @num = @num + 1;
			
		END WHILE;
	end if;
	if	_error	<>	0	then
		rollback;
		set out_ret = -11;
		set out_desc = '执行异常';
		leave _return;
	else	
		commit;
		set out_ret = @u_id;
		set out_desc = '';
	end	if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_user_score
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_user_score`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` PROCEDURE `p_user_score`(IN `in_uid` bigint,IN `in_uname` varchar(50),IN `in_lastIP` varchar(50),OUT `out_ret` int,OUT `out_desc` varchar(255))
_return:begin
declare _error int default 0; #异常标记#
declare continue handler for sqlexception set _error = 1; #sqlexception返回值
set @u_loginNum = 0;
SELECT IFNULL(COUNT(1),0) into @u_loginNum from user_login_log where logindate = date(now()) AND userid = in_uid;
if @u_loginNum <= 2 then 
update t_user set rating = rating + 1 where id = in_uid;
insert into t_userintegraldetail(userid, intergraltype, remark, changetype, changerecore, time, type) values (in_uid,'登录','登录积分','增加',1,NOW(),2);
end if;
update t_user set lastDate = NOW(), lastIP = in_lastIP, loginCount = loginCount + 1 where id = in_uid;
insert into user_login_log(logindate, userid) values (date(now()),in_uid);
INSERT INTO t_operation_log (operation_table,operation_user,operation_type,operation_ip,operation_time,operation_remarks,operation_around) 
VALUES ('t_user',in_uname,2,in_lastIP,NOW(),'用户登录',1);
if _error <> 0 then
rollback;
set out_ret = -2;
set out_desc = '执行异常';
leave _return;
else 
commit;
set out_ret = 1;
set out_desc = '';
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_borrow_type_decode
-- ----------------------------
DROP FUNCTION IF EXISTS `f_borrow_type_decode`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_borrow_type_decode`(`in_borrow_way` int) RETURNS varchar(255) CHARSET utf8
BEGIN
	declare n_id varchar(100) default '';
 set n_id = case in_borrow_way
    when 1      then 'worth'
	  when 2       then 'seconds'
	  when 3       then 'ordinary'
	  when 4       then 'field'
	  when 5       then 'institutions'
	  when 6       then 'flow'
		end ; 
	RETURN  n_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_caculate_bidamount
-- ----------------------------
DROP FUNCTION IF EXISTS `f_caculate_bidamount`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_caculate_bidamount`(`in_bid_amount` decimal,`in_borrow_amount` decimal,`in_hasamount` decimal) RETURNS decimal(18,2)
BEGIN
	declare t_max_bid_amount decimal(18,2) default 0 ;
	declare	t_schedule	decimal(18,4)	default	0;
	declare	t_bid_amount	decimal(18,2)	default	0;
	declare	t_invest_amount	decimal(18,2)	default	0;
	set	t_max_bid_amount = in_borrow_amount*0.2;
  set	t_schedule = in_hasamount/in_borrow_amount;
  set	t_bid_amount = in_bid_amount;
  while t_bid_amount > t_max_bid_amount do
    set	t_bid_amount = t_bid_amount - 50;
  end while;
  if t_schedule < 0.9500 then
     set	t_invest_amount = in_hasamount + t_bid_amount;
     set	t_schedule = t_invest_amount/in_borrow_amount;
     if t_schedule > 0.9500 then
        set	t_bid_amount = t_bid_amount - 50;
     end if;
  else
    set	t_bid_amount = 0;
  end if;
  return t_bid_amount;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_convertAmount
-- ----------------------------
DROP FUNCTION IF EXISTS `f_convertAmount`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_convertAmount`(`amount` decimal(18,2)) RETURNS varchar(200) CHARSET utf8
BEGIN
 declare v_str varchar(200);
 declare v_result varchar(200);
 declare v_len int default 0;
 set v_str = concat(amount,'');
 set v_result = '';
 set v_len = length(v_str);
 if (v_len >=7 && v_len < 10) then
   /*1,000~1,000,000范围内计算方式*/
   set v_result = concat(substring(v_str,1,v_len-6),',');
   set v_result = concat(v_result,substring(v_str,v_len-5,v_len));
   return v_result;
 elseif (v_len >=10 && v_len < 13) then
   /*1,000,000~1,000,000,000范围内计算方式*/
   set v_result = concat(substring(v_str,1,v_len-9),',');
   set v_result = concat(v_result,substring(v_str,v_len-8,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-5,v_len));
   return v_result;
 elseif(v_len >=13 && v_len <16) then
   /*1,000,000,000~1,000,000,000,000范围内计算方式*/
   set v_result = concat(substring(v_str,1,v_len-12),',');
   set v_result = concat(v_result,substring(v_str,v_len-11,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-8,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-5,v_len));
   return v_result;
  elseif(v_len >=16 && v_len <19) then
   /*1,000,000,000,000~1,000,000,000,000范围内计算方式*/
   set v_result = concat(substring(v_str,1,v_len-15),',');
   set v_result = concat(v_result,substring(v_str,v_len-14,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-11,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-8,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-5,v_len));
   return v_result;
  elseif(v_len >=19 && v_len <22) then
   /*1,000,000,000,000~1,000,000,000,000范围内计算方式*/
   set v_result = concat(substring(v_str,1,v_len-18),',');
   set v_result = concat(v_result,substring(v_str,v_len-17,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-14,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-11,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-8,3),',');
   set v_result = concat(v_result,substring(v_str,v_len-5,v_len));
   return v_result;
end if;
 return amount;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_credit_rating
-- ----------------------------
DROP FUNCTION IF EXISTS `f_credit_rating`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_credit_rating`(`creditrating` bigint) RETURNS int(11)
BEGIN
	if(creditrating < 30) then
    return 1;
  elseif(creditrating < 50 && creditrating >= 30) then
   return 2;
  elseif(creditrating < 70 && creditrating >= 50) then
   return 3;
  elseif(creditrating < 80 && creditrating >= 70) then
   return 4;
  elseif(creditrating < 90 && creditrating >= 80) then
   return 5;
  elseif(creditrating < 99 && creditrating >= 90) then
   return 6;
  elseif(creditrating >= 100) then
   return 7;
  else
   return 1;
  end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_formatAmount
-- ----------------------------
DROP FUNCTION IF EXISTS `f_formatAmount`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_formatAmount`(`amount` decimal(18,2)) RETURNS varchar(200) CHARSET utf8
BEGIN
 declare v_str varchar(200);
 declare v_result varchar(200);
 declare v_len int default 0;
 declare v_conunt  decimal(18,2) default 0;
 set v_str = concat(amount,'');
 set v_result = '';
 set v_len = length(v_str);
if (v_len >=8) then 
	 set v_conunt = amount / 10000;
	 set v_str = concat(v_conunt,'');
   set v_len = length(v_str);
			
      if (v_len >=7 ) then 
					
					if(v_len>=8)  then  
						set v_result = concat(substring(v_str,1,v_len-7),'亿');
					end if;
				 set v_result = concat(v_result,substring(v_str,v_len-6,v_len));
			   set v_result = concat(v_result,'万元');
				return v_result;
			else 
				set  v_result = concat(v_conunt,'万元');
		   	return v_result;
			end if;
ELSE
					if (v_len >=7 && v_len < 10) then
						 set v_result = concat(substring(v_str,1,v_len-6),',');
						 set v_result = concat(v_result,substring(v_str,v_len-5,v_len));
						 set v_result = concat(v_result,' 元');
						 return v_result;
					end if;
end if;
	 set v_result = concat(amount,' 元');
   RETURN v_result; 
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_formatting_username
-- ----------------------------
DROP FUNCTION IF EXISTS `f_formatting_username`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_formatting_username`(`v_str` varchar(255)) RETURNS varchar(10) CHARSET utf8
BEGIN
set @v_result = concat(substring(v_str,1,2),'****');
	RETURN @v_result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_getoption
-- ----------------------------
DROP FUNCTION IF EXISTS `f_getoption`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_getoption`(`in_key` varchar(100)) RETURNS varchar(1000) CHARSET utf8
BEGIN
	Declare result VARCHAR(1000) DEFAULT '';
	SET  result = '';
	SELECT `value` INTO result FROM t_options WHERE `key` = `in_key`;
	
	RETURN  Result;
 
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_get_notice_template
-- ----------------------------
DROP FUNCTION IF EXISTS `f_get_notice_template`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_get_notice_template`(`in_nid` varchar(2048)) RETURNS varchar(2048) CHARSET utf8
BEGIN
	set	@template	=	'';
	select template	into	@template from t_approve_notice_template where nid = in_nid;
	RETURN @template;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_injectPoint
-- ----------------------------
DROP FUNCTION IF EXISTS `f_injectPoint`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_injectPoint`(`pointStr` varchar(200)) RETURNS varchar(200) CHARSET utf8
BEGIN
	#Routine body goes here...
  declare v_str varchar(200);
  declare v_len int default 0;
  set v_len = locate('.',pointStr,1);
  set v_str = substring(pointStr,1,v_len+2);
 	return v_str;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_link
-- ----------------------------
DROP FUNCTION IF EXISTS `f_link`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_link`(`in_basepath` varchar(100),`in_id` bigint,`title` varchar(100),`content` varchar(255),`other` varchar(100),`type` varchar(20)) RETURNS varchar(255) CHARSET utf8
begin
	declare out_desc	varchar(255)	default	'';
	set	out_desc	=	concat('<a href=',in_basepath,'/financeDetail.do?id=',in_id,'  target=_blank>',title,'</a>');
	return out_desc;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_link_debt
-- ----------------------------
DROP FUNCTION IF EXISTS `f_link_debt`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_link_debt`(`in_basepath` varchar(100),`in_id` bigint,`title` varchar(100),`content` varchar(255),`other` varchar(100),`type` varchar(20)) RETURNS varchar(255) CHARSET utf8
begin
	declare out_desc	varchar(255)	default	'';
	set	out_desc	=	concat('<a href=',in_basepath,'/queryDebtDetail.do?id=',in_id,'  target=_blank>',title,'</a>');
	return out_desc;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_moneyDecode
-- ----------------------------
DROP FUNCTION IF EXISTS `f_moneyDecode`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_moneyDecode`(`moneyStyle` int(11)) RETURNS varchar(100) CHARSET utf8
begin
	declare moneyValue varchar(100) default '';
    set moneyValue = case moneyStyle
		
    #资金不变，总额变化
    # 1001 待收增加,1002 待还增加,1003 待收减少,1004 待还减少
    when 1001            then '投资成功待收增加'
    when 1002            then '借款成功待还增加'
    when 1003            then '还款成功待收减少'
    when 1004            then '还款成功待还减少'
    when 1005            then '竞拍成功待收增加'
    when 1006            then '转让成功待收减少'
    #资金减少
    #501~550 充值
    #551~600 提现
    #601~650 借款
    #651~700 投资
    #701~750 债权转让
    #751~800 奖励
    #801~1000 其他
	when 501             then '扣除充值手续费'
    when 502 			 then '手动扣费'
    when 552			 then '扣除提现手续费'
    when 553		     then '冻结提现金额'
    when 554			 then '提现成功'
    when 576		     then '提现冻结资金流出'
    when 601			 then '扣除借款管理费'
    when 602		     then '冻结秒还借款费'
    when 603			 then '扣除逾期罚息'
		when 604			 then '扣除还款金额'
		when 605		    then '冻结借款保证金'
    when 626		     then '秒还冻结资金流出'
    when 651			 then '扣除投标管理费'
    when 652		     then '扣除非VIP会员垫付利息'
    when 653		     then '冻结投标金额'
 
	when 654		     then '扣除投标金额'
	when 655		     then '投资流转标扣除金额'
    when 676		     then '投标冻结资金流出'
	when 701 		     then '扣除债权转让服务费'
    when 702 		     then '冻结债权竞拍金额'
    when 726			 then '竞拍冻结资金流出'
    when 751 		     then '扣除借款奖励'
    when 801	         then '扣除短信服务费'
    when 802			 then '扣除学历认证费'
    when 803		     then 'VIP会员续费'
	when 804		     then '扣除VIP会费'
	when 805			 then	'借款还款'
	
	#资金增加 
    #1~50 充值
    #51~100 提现
    #101~150 借款
    #151~200 投资
    #201~250 债权转让
    #251~300 奖励
    #301~500 其他
 
    when 1				 then '手动充值'
	when 2			     then '线上充值'
	when 3			     then '线下充值'
	when 51		         then '解冻提现冻结资金'
    when 76				 then '提现冻结资金流入'
    when 101			 then '借款成功'
    when 102             then '流转标借款成功'
    when 103             then '解冻借款冻结资金'
    when 104             then '解冻保证金'
    when 105			 then '解冻秒还借款费'
    when 126             then '借款冻结资金流入'
	when 151		     then '投资收到还款'
    when 152			 then '认购收到还款'
    when 153			 then '认购成功待收增加'
    when 154			 then '解冻投资金额'
    when 155			 then '解冻认购冻结资金'
    when 156			 then '收到逾期罚息'
    when 176			 then '投资冻结资金流入'
    when 177			 then '认购冻结资金流入'
    when 178			 then '秒还冻结资金流入'
	when 201		     then '债权转让成功'
	when 202			 then '解冻债权竞拍资金'
    when 226			 then '竞拍冻结资金流入'
	when 251			 then '好友推荐奖励'	
	when 252			 then '推荐人奖励'
	when 253			 then '投标奖励'
    when 254			 then '投标流转标奖励'
    when 255			 then '续投奖励'
	when 256			 then	'投资收款'
		
	end;
return moneyValue;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_moneyEncode
-- ----------------------------
DROP FUNCTION IF EXISTS `f_moneyEncode`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_moneyEncode`(`moneyStyle` varchar(100)) RETURNS int(11)
begin
	declare moneyValue int(11) default 0;
	set moneyValue = case moneyStyle
	#资金不变，总额变化
	# 1001 待收增加,1002 待还增加,1003 待收减少,1004 待还减少
	when '投资成功待收增加'            then 1001
	when '借款成功待还增加'            then 1002
	when '还款成功待收减少'            then 1003
	when '还款成功待还减少'            then 1004
	when '竞拍成功待收增加'            then 1005
	when '转让成功待收减少'            then 1006
	#资金减少
	#501~550 充值
	#551~600 提现
	#601~650 借款
    #651~700 投资
    #701~750 债权转让
    #751~800 奖励
    #801~1000 其他
	when '扣除充值手续费' 			   then 501
    when '手动扣费' 				   then 502
    when '扣除提现手续费'			   then 552
    when '冻结提现金额'				   then 553
    when '提现成功'					  	 then 554
    when '提现冻结资金流出'			 then 576
    when '扣除借款管理费'			   then 601
    when '冻结秒还借款费'			   then 602
    when '扣除逾期罚息'				   then 603
	when '扣除还款金额'			       then 604
	when '冻结借款保证金'		       then 605
	when '秒还冻结资金流出'			   then 626
    when '扣除投标管理费'			   then 651
    when '扣除非VIP会员垫付利息'   then 652
    when '冻结投标金额'		           then 653
	
	when '扣除投标金额'		       then 654
	when '投资流转标扣除金额'		     then  655
	
	when '投标冻结资金流出'			   then 676
	when '扣除债权转让服务费' 		   then 701
    when '冻结债权竞拍金额' 		   then 702
    when '竞拍冻结资金流出'			   then 726
    when '扣除借款奖励' 		       then 751
	when '扣除短信服务费'			   then 801
    when '扣除学历认证费'			   then 802
	when 'VIP会员续费'				   then 803
	when '扣除VIP会费'			       then 804	
    #资金增加 
    #1~50 充值
    #51~100 提现
    #101~150 借款
    #151~200 投资
    #201~250 债权转让
    #251~300 奖励
    #301~500 其他
    when '手动充值'					   then 1
	when '线上充值'				       then 2
	when '线下充值'				       then 3
    when '解冻提现冻结资金'		       then 51
    when '提现冻结资金流入'			   then 76 
    when '借款成功'			           then 101
    when '流转标借款成功'                then 102
    when '解冻借款冻结资金'            then 103
    when '解冻保证金'                  then 104
    when '解冻秒还借款费'              then 105
	when '借款冻结资金流入'            then 126
	when '投资收到还款'			       then 151
    when '认购收到还款'				   then 152
    when '认购成功待收增加'			   then 153
    when '解冻投资金额'			   then 154
    when '解冻认购冻结资金'			   then 155
    when '收到逾期罚息'				   then 156
    when '投资冻结资金流入'			   then 176
    when '认购冻结资金流入'			   then 177
    when '秒还冻结资金流入'			   then 178
    when '债权转让成功'			 	   then 201
	when '解冻债权竞拍资金'			   then 202
    when '竞拍冻结资金流入'			   then 226
	when '好友推荐奖励'				   then 251
	when '推荐人奖励'				   then 252
	when '投标奖励'				       then 253
    when '投标流转标奖励'			   then 254
    when '续投奖励'				       then 255
	end;
  set moneyValue = ifnull(moneyValue,-1);#无法转码返回-1
return moneyValue;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_parsing_json
-- ----------------------------
DROP FUNCTION IF EXISTS `f_parsing_json`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_parsing_json`(in_str VARCHAR(1024), in_begin_str VARCHAR(1024)) RETURNS decimal(18,4)
BEGIN
DECLARE m_len INT DEFAULT 0;
  
DECLARE m_index INT DEFAULT 0; 
/*计算第一个匹配字符串的索引位置*/
set in_begin_str  = concat(in_begin_str ,'":');
select locate(in_begin_str ,in_str)+char_length(in_begin_str) into m_index;
/*计算第一个匹配字符串的长度*/
select locate(',',in_str,m_index) into m_len;
return CAST(SUBSTRING(in_str,m_index,m_len-m_index)as DECIMAL(18,4)) ;
 
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_rating
-- ----------------------------
DROP FUNCTION IF EXISTS `f_rating`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_rating`(`rating` bigint) RETURNS int(11)
BEGIN
	if(rating < 51) then
    return 1;
  elseif(rating < 200 && rating >= 51) then
   return 2;
  elseif(rating < 400 && rating >= 201) then
   return 3;
  elseif(rating < 700 && rating >= 401) then
   return 4;
  elseif(rating < 1000 && rating >= 701) then
   return 5;
  elseif(rating < 2000 && rating >= 1001) then
   return 6;
  elseif(rating < 3500 && rating >= 2001) then
   return 7;
  elseif(rating < 5500 && rating >= 3501) then
   return 8;
  elseif(rating < 7000 && rating >= 5501) then
   return 9;
  elseif(rating < 10000 && rating >= 7001) then
   return 10;
  elseif(rating < 15000 && rating >= 10001) then
   return 11;
  elseif(rating < 25000 && rating >= 15001) then
   return 12;
  elseif(rating < 40000 && rating >= 25001) then
   return 13;
  elseif(rating < 60000 && rating >= 40001) then
   return 14;
  elseif(rating < 100000 && rating >= 60001) then
   return 15;
  elseif(rating < 200000 && rating >= 100001) then
   return 16;
  elseif(rating < 400000 && rating >= 200001) then
   return 17;
  elseif(rating < 700000 && rating >= 400001) then
   return 18;
  elseif(rating < 1000000 && rating >= 700001) then
   return 19;
  elseif(rating >= 1000001) then
   return 20;
  else
   return 1;
  end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_send_temple
-- ----------------------------
DROP FUNCTION IF EXISTS `f_send_temple`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_send_temple`(in_id int) RETURNS int(11)
BEGIN
INSERT  into t_notice_task_log(user_id,sendtitle,s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id, add_time, operate_identify)
  SELECT  user_id,sendtitle,s_nid, username, email, telphone, mail_info, email_info, sms_info, operate_id,add_time, operate_identify  from t_notice_task  WHERE id = in_id;
DELETE  from  t_notice_task  WHERE  id = in_id;
  RETURN 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_split
-- ----------------------------
DROP FUNCTION IF EXISTS `f_split`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_split`(f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8
BEGIN    
	 # 拆分传入的字符串，返回拆分后的新字符串       
	  DECLARE result VARCHAR(255) DEFAULT "";     
	  SET result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));    
	  RETURN result; 
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_split_TotalLength
-- ----------------------------
DROP FUNCTION IF EXISTS `f_split_TotalLength`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_split_TotalLength`(f_string varchar(1000),f_delimiter varchar(5)) RETURNS int(11)
BEGIN     
	# 计算传入字符串的总length     
		RETURN 1+(length(f_string) - length(REPLACE(f_string,f_delimiter,""))); 
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_vip
-- ----------------------------
DROP FUNCTION IF EXISTS `f_vip`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` FUNCTION `f_vip`(`rating` bigint) RETURNS int(11)
BEGIN
	if(rating < 51) then
    return 1;
  elseif(rating < 1000 && rating >= 51) then
   return 2;
  elseif(rating < 25000 && rating >= 1001) then
   return 3;
  elseif(rating >= 2501) then
   return 4;
  else
   return 1;
  end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for e_rongtuwang_insert_day
-- ----------------------------
DROP EVENT IF EXISTS `e_rongtuwang_insert_day`;
DELIMITER ;;
CREATE DEFINER=`dbdev`@`%` EVENT `e_rongtuwang_insert_day` ON SCHEDULE EVERY 1 DAY STARTS '2017-12-09 08:01:00' ON COMPLETION PRESERVE ENABLE DO CALL  p_rongtu_add_data_everydate()
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
