-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- Host: localhost
-- Generation Time: 2017-09-12 16:55:27
-- 服务器版本： 5.6.37-log
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- 表的结构 `tqk_items_cate`
--
DROP TABLE IF EXISTS `tqk_items_cate`;
CREATE TABLE IF NOT EXISTS `tqk_items_cate` (
  `id` smallint(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `ali_id` varchar(50) DEFAULT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `sort` varchar(50) NOT NULL DEFAULT 'id  desc',
  `wait_time` varchar(50) NOT NULL DEFAULT '0',
  `end_time` varchar(50) NOT NULL DEFAULT '0',
  `shop_type` varchar(11) NOT NULL COMMENT 'B:商城C:集市',
  `mix_price` decimal(11,2) DEFAULT NULL,
  `max_price` decimal(11,2) DEFAULT NULL,
  `mix_volume` int(11) DEFAULT NULL,
  `max_volume` int(11) DEFAULT NULL,
  `ems` varchar(50) NOT NULL DEFAULT '0',
  `thiscid` int(11) NOT NULL DEFAULT '0' COMMENT '是否当前分类',
  `add_time` int(10) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `cateimg` varchar(50) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tqk_items_cate`
--

INSERT INTO `tqk_items_cate` (`id`, `name`, `ali_id`, `tags`, `pid`, `spid`, `remark`, `sort`, `wait_time`, `end_time`, `shop_type`, `mix_price`, `max_price`, `mix_volume`, `max_volume`, `ems`, `thiscid`, `add_time`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc`, `cateimg`) VALUES
(1, '女装', '1', '', 0, '0', 'FASHION LADIES', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 1, 1, '', '', '', 'icon-nvzhuang'),
(2, '男装', '2', '', 0, '0', 'Boutique men', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 2, 1, '', '', '', 'icon-nanzhuang'),
(3, '鞋包', '3', '', 0, '0', 'Shoe accessories', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 3, 1, '', '', '', 'icon-xiemaoxiangbao'),
(6, '美妆', '6', '', 0, '0', 'Beauty care', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 4, 1, '', '', '', 'icon-meizhuang'),
(7, '母婴', '7', '', 0, '0', 'Muyingpin', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 5, 1, '', '', '', 'icon-muying01'),
(8, '食品', '8', '', 0, '0', 'Gourmet snacks', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 6, 1, '', '', '', 'icon-xiuxian'),
(9, '内衣', '9', '', 0, '0', 'Underwear tights', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 7, 1, '', '', '', 'icon-neiyi'),
(10, '数码', '10', '', 0, '0', 'Digital home', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 8, 1, '', '', '', 'icon-shuma'),
(12, '家居用品', '12', '', 0, '0', 'Housewear', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 14, 1, '', '', '', 'icon-jiaju'),
(18, '成人', '', '', 0, '0', 'Adult erotica ', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 11, 1, '', '', '', 'icon-chengren'),
(17, '宠物', '', '', 0, '0', 'Pet bonsai', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 12, 1, '', '', '', 'icon-chongwu'),
(16, '文体车品', '16', '', 0, '0', 'Automobile', 'volume desc', '0', '0', '', '0.00', '0.00', 0, 0, '0', 0, 0, 13, 1, '', '', '', 'icon-wenhua');

-- --------------------------------------------------------

--
-- 表的结构 `tqk_article_cate`
--
DROP TABLE IF EXISTS `tqk_article_cate`;
CREATE TABLE IF NOT EXISTS `tqk_article_cate` (
  `id` smallint(4) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tqk_article_cate`
--

INSERT INTO `tqk_article_cate` (`id`, `name`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc`) VALUES
(1, '优惠券头条', 0, '0', 255, 1, '淘宝优惠券头条', '淘宝优惠券头条', '淘宝优惠券头条'),
(2, '公告通知', 0, '0', 255, 1, '', '', ''),
(3, '居家生活', 0, '0', 255, 1, '', '', ''),
(4, '发现好物', 0, '0', 255, 1, '', '', ''),
(5, '电子数码', 0, '0', 255, 1, '', '', ''),
(6, '时尚运动', 0, '0', 255, 1, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tqk_order`
--
DROP TABLE IF EXISTS `tqk_order`;
CREATE TABLE IF NOT EXISTS `tqk_order` (
  `id` int(10) NOT NULL,
  `orderid` varchar(50) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `add_time` varchar(12) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `price` float(10,2) DEFAULT NULL,
  `integral` int(10) DEFAULT NULL,
  `up_time` varchar(12) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;




--
-- Indexes for table `tqk_items_cate`
--
ALTER TABLE `tqk_items_cate`
  ADD PRIMARY KEY (`id`);
  

--
-- Indexes for table `tqk_order`
--
ALTER TABLE `tqk_order`
  ADD PRIMARY KEY (`id`);
  
--
-- AUTO_INCREMENT for table `tqk_order`
--
ALTER TABLE `tqk_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tqk_items_cate`
--
ALTER TABLE `tqk_items_cate`
  MODIFY `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;

--
-- Indexes for table `tqk_article_cate`
--
ALTER TABLE `tqk_article_cate`
  ADD PRIMARY KEY (`id`);
 
--
-- AUTO_INCREMENT for table `tqk_article_cate`
--
ALTER TABLE `tqk_article_cate`
  MODIFY `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;