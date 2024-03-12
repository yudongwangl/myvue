-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-11-27 23:22:57
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `text`
--

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `del` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `del`) VALUES
(1, '张老师', '张老师是一位充满激情和热爱的教育者，她用心灵和智慧点亮了学生的求知之火。', 0),
(2, '李老师', '李老师的教学方法独特而富有创意，她总能以生动有趣的方式吸引学生的注意力。', 0),
(3, '王老师', '王老师不仅在学术上给予学生充分的指导和支持，更关心学生的个人发展和成长。', 0),
(4, '赵老师', '赵老师始终保持耐心和关怀，无论学生遇到什么困难，她都会不厌其烦地给予帮助。', 0),
(5, '钱老师', '钱老师的课堂氛围总是充满活力和互动，学生们在他的引领下积极参与并展示自己的才华。', 0),
(6, '孙老师', '孙老师善于激发学生的学习兴趣和好奇心，他总是能够引导学生主动探索知识。', 0),
(7, '周老师', '周老师对学生的要求严格但公正，她不仅关注学生的学习成绩，更注重培养他们的综合素质。', 0),
(8, '吴老师', '吴老师在教学中注重培养学生的创新思维和解决问题的能力，让学生在实践中不断成长和进步。', 0),
(9, '杨老师', '杨老师经常鼓励学生超越自我，勇敢面对挑战，他的激励让学生充满自信和勇气。\r\n', 0),
(10, '于老师', '于老师不仅是一位优秀的教师，更是一位良师益友，他与学生建立了深厚的师生关系。', 0),
(11, '江老师', '江老师善于与学生建立良好的沟通和信任关系，让学生敢于表达自己的想法和观点。', 0),
(12, '叶老师', '叶老师在教学中注重实践和实际应用，让学生能够将所学知识运用到实际生活中。', 0),
(13, '宋老师', '宋老师激励学生追求卓越，她的榜样作用激发学生的努力和追求。\r\n', 0),
(14, '何老师', '何老师注重培养学生的团队合作精神和沟通能力，让他们在团队中发挥自己的优势。', 0),
(15, '黄老师', '黄老师对学生的学业规划和职业发展给予了很多的指导和支持，帮助他们找到适合自己的道路。', 0),
(16, '沈老师', '沈老师注重培养学生的自主学习能力，她鼓励学生主动探索和独立思考。', 0),
(17, '孔老师', '孔老师善于与学生建立良好的沟通和信任关系，让学生敢于表达自己的想法和观点。', 0),
(18, '丁老师', '丁老师在教学中注重实践和实际应用，让学生能够将所学知识运用到实际生活中。', 0),
(19, '康老师', '康老师激励学生追求卓越，她的榜样作用激发学生的努力和追求。\r\n', 0),
(20, '武老师', '武老师注重培养学生的团队合作精神和沟通能力，让他们在团队中发挥自己的优势。', 0),
(21, '孟老师', '孟老师对学生的学业规划和职业发展给予了很多的指导和支持，帮助他们找到适合自己的道路。', 0);

-- --------------------------------------------------------

--
-- 表的结构 `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `location` varchar(100) NOT NULL,
  `experience` text,
  `qualification` text,
  `del` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `information`
--

INSERT INTO `information` (`id`, `name`, `age`, `gender`, `subject`, `price`, `location`, `experience`, `qualification`, `del`) VALUES
(1, '张老师', 25, '男', '数学', 50, '北京', '有3年家教经验', '数学教师资格证书', 0),
(2, '李老师', 30, '女', '英语', 60, '上海', '有5年家教经验', '英语教师资格证书', 0),
(3, '王老师', 28, '男', '物理', 70, '广州', '有4年家教经验', '物理教师资格证书', 0),
(4, '赵老师', 32, '女', '化学', 55, '深圳', '有6年家教经验', '化学教师资格证书', 0),
(5, '钱老师', 27, '男', '语文', 45, '成都', '有2年家教经验', '语文教师资格证书', 0),
(6, '孙老师', 29, '女', '地理', 50, '重庆', '有3年家教经验', '地理教师资格证书', 0),
(7, '周老师', 26, '男', '历史', 60, '武汉', '有4年家教经验', '历史教师资格证书', 0),
(8, '吴老师', 31, '女', '生物', 65, '南京', '有5年家教经验', '生物教师资格证书', 0),
(9, '郑老师', 33, '男', '政治', 55, '西安', '有3年家教经验', '政治教师资格证书', 0),
(10, '王老师', 27, '女', '音乐', 40, '杭州', '有2年家教经验', '音乐教师资格证书', 0),
(11, '孙老师', 30, '女', '地理', 70, '重庆', '有3年家教经验', '地理教师资格证书', 0),
(12, '周老师', 27, '男', '历史', 65, '武汉', '有4年家教经验', '历史教师资格证书', 0),
(13, '吴老师', 32, '女', '生物', 60, '南京', '有5年家教经验', '生物教师资格证书', 0),
(14, '郑老师', 38, '男', '政治', 58, '西安', '有3年家教经验', '政治教师资格证书', 0),
(15, '王老师', 28, '女', '音乐', 44, '杭州', '有2年家教经验', '音乐教师资格证书', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE `reply` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `data` varchar(30) NOT NULL DEFAULT '开始聊天吧！',
  `date` varchar(30) DEFAULT NULL,
  `tid` int(10) NOT NULL,
  `uimg` varchar(30) DEFAULT NULL,
  `timg` varchar(30) DEFAULT NULL,
  `pass` int(10) NOT NULL DEFAULT '0',
  `del` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reply`
--

INSERT INTO `reply` (`id`, `uid`, `data`, `date`, `tid`, `uimg`, `timg`, `pass`, `del`) VALUES
(71, 3, '开始聊天吧！', '2023/11/20 14:38:31', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(70, 3, '开始聊天吧！', '2023/11/20 14:38:31', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(69, 3, '22333', '2023/11/20 14:41:09', 2, 'tzxl.png', 'tzxl02.png', 0, 0),
(68, 3, '123', '2023/11/20 14:34:45', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(67, 3, '123', '2023/11/20 14:34:45', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(66, 3, '123', '2023/11/20 14:15:30', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(64, 3, '开始聊天吧！', '2023/11/20 14:15:22', 2, NULL, 'tzxl02.png', 0, 0),
(65, 3, '开始聊天吧！', '2023/11/20 14:15:30', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(72, 3, '开始聊天吧！', '2023/11/20 14:38:31', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(73, 3, '开始聊天吧！', '2023/11/20 14:38:31', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(74, 3, '666', '2023/11/20 14:49:32', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(75, 3, '666', '2023/11/20 14:49:32', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(76, 3, '666', '2023/11/20 14:49:32', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(77, 3, '666', '2023/11/20 14:49:32', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(78, 3, '666', '2023/11/20 14:49:32', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(79, 3, '999', '2023/11/20 14:54:28', 2, 'tzxl.png', 'tzxl02.png', 0, 0),
(80, 3, '999', '2023/11/20 14:49:32', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(81, 3, '开始聊天吧！', '2023/11/20 14:55:16', 2, 'tzxl.png', 'tzxl02.png', 0, 0),
(82, 3, '开始聊天吧！', '2023/11/20 14:55:14', 2, 'tzxl03.png', 'teacher02.png', 0, 0),
(83, 3, '开始聊天吧！', '2023/11/27 18:43:33', 3, 'tzxl03.png', 'teacher02.png', 0, 0),
(84, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(85, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(86, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(87, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(88, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(89, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(90, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(91, 3, '开始聊天吧！', '2023/11/27 18:43:56', 3, 'tzxl03.png', 'teacher03.png', 0, 0),
(92, 3, '开始聊天吧！', '2023/11/27 22:09:40', 1, 'tzxl03.png', 'teacher03.png', 0, 0),
(93, 3, '开始聊天吧！', '2023/11/27 22:09:40', 4, 'tzxl03.png', 'teacher01.png', 0, 0),
(94, 3, '开始聊天吧！', '2023/11/27 22:09:40', 5, 'tzxl03.png', 'teacher01.png', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sort`
--

CREATE TABLE `sort` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `img` varchar(25) NOT NULL COMMENT '照片',
  `workingtime` int(10) NOT NULL COMMENT '资历',
  `type` int(10) NOT NULL,
  `del` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sort`
--

INSERT INTO `sort` (`id`, `name`, `img`, `workingtime`, `type`, `del`) VALUES
(1, '张老师', 'teacher01.png', 10, 1, 0),
(2, '李老师', 'teacher02.png', 15, 1, 0),
(3, '王老师', 'teacher03.png', 15, 1, 0),
(4, '安老师', 'teacher04.png', 10, 1, 0),
(5, '黄老师', 'teacher05.png', 16, 1, 0),
(6, '秋老师', 'teacher06.png', 20, 1, 0),
(7, '刘老师', 'teacher07.png', 10, 1, 0),
(8, '叶老师', 'teacher08.png', 10, 1, 0),
(9, '石老师', 'teacher09.png', 12, 2, 0),
(10, '任老师', 'teacher10.png', 15, 2, 0),
(11, '云老师', 'teacher11.png', 10, 2, 0),
(12, '黄老师', 'teacher12.png', 16, 2, 0),
(13, '代老师', 'teacher13.png', 20, 2, 0),
(14, '张老师', 'teacher14.png', 10, 2, 0),
(15, '杭老师', 'teacher15.png', 10, 2, 0),
(16, '李老师', 'teacher16.png', 12, 2, 0),
(17, '江老师', 'teacher17.png', 15, 3, 0),
(18, '亮老师', 'teacher18.png', 10, 3, 0),
(19, '毛老师', 'teacher19.png', 16, 3, 0),
(20, '阮老师', 'teacher20.png', 20, 3, 0),
(21, '梦老师', 'teacher21.png', 16, 3, 0),
(22, '炽老师', 'teacher22.png', 20, 3, 0),
(23, '万老师', 'teacher01.png', 10, 3, 0),
(24, '李老师', 'teacher02.png', 12, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(124) DEFAULT NULL COMMENT '密码',
  `head_img` varchar(524) DEFAULT NULL COMMENT '头像',
  `del` int(10) NOT NULL DEFAULT '0',
  `type` int(10) NOT NULL DEFAULT '0',
  `pim` int(10) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL COMMENT '日期',
  `cause` varchar(30) DEFAULT NULL COMMENT '原因',
  `illegal` int(10) NOT NULL DEFAULT '0',
  `blacklist` int(10) NOT NULL DEFAULT '0' COMMENT '黑名单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `pwd`, `head_img`, `del`, `type`, `pim`, `date`, `cause`, `illegal`, `blacklist`) VALUES
(1, 'yu', '123', 'tzxl.png', 0, 3, NULL, NULL, NULL, 0, 0),
(2, 'yuu', '123', 'tzxl02.png', 0, 1, NULL, '2023-11-01', '不安全操作', 0, 0),
(3, '123', '123', 'tzxl03.png', 0, 0, NULL, '2023-10-01', '不安全操作', 1, 1),
(4, 'ydw', '123', 'tzxl04.png', 0, 0, NULL, NULL, NULL, 0, 0);

--
-- 转储表的索引
--

--
-- 表的索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `sort`
--
ALTER TABLE `sort`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- 使用表AUTO_INCREMENT `sort`
--
ALTER TABLE `sort`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
