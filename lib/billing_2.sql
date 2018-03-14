-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018-03-13 06:57:56
-- 伺服器版本: 10.1.29-MariaDB
-- PHP 版本： 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mysql`
--

-- --------------------------------------------------------

--
-- 資料表結構 `billing_member_4`
--

CREATE TABLE `billing_member_4` (
  `user_id` int(20) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_level` varchar(20) NOT NULL,
  `creat_user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `billing_member_4`
--

INSERT INTO `billing_member_4` (`user_id`, `user_name`, `user_email`, `user_password`, `user_level`, `creat_user`) VALUES
(1, 'sam80719', 'sam80719@gmail.com', '123456', 'admin', '0'),
(2, 'sammy', 'sammy1@gmail.com', '001', 'normal', ''),
(9, 'panda001', 'panda001@gmail.com', 'panda001', 'manager', ''),
(11, 'panda003', 'panda003@gmail.com', 'panda003', 'normal', ''),
(12, 'panda004', 'panda004@gmail.com', 'panda004', 'normal', ''),
(13, 'panda006', 'panda006@gmail.com', 'panda006', 'normal', ''),
(14, 'asaqw123', 'asaqw123@dfsasa', '001', 'normal', ''),
(15, 'jerry', 'jerry@gmail.com', '001', 'manager', ''),
(16, 'higa004', 'higa001@gmail.com', '001', 'normal', ''),
(18, 'sam807191', 'sam807191@gmail.com', '001', 'normal', ''),
(21, 'higi0306', 'higi0306@kjh', '123', 'normal', ''),
(31, 'ads21123', 'sa11m80719@gmail.com', '123', 'normal', ''),
(35, 'sam80719112', 'sam801719@gmail.com', 'a', 'normal', ''),
(37, 'sam80719112wew2', 'sam82201719@gmail.com', 'a', 'normal', ''),
(41, 'sam8q0719', 'sam8q0719@gmail.com', 'a', 'normal', ''),
(42, 'sam8q07191', '1sam8q0719@gmail.com', 'a', 'normal', ''),
(43, 'sam8q071911', '1sam81q0719@gmail.com', 'a', 'normal', ''),
(48, 'eewrewdf324', 'sam812120719@gmail.com', '002', 'normal', ''),
(50, 'sawre231123', 'as121dsadsa@dsfds.vcc', '002', 'normal', ''),
(51, 'as121', '12315361561@gmail.com', '0032', 'normal', '');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `billing_member_4`
--
ALTER TABLE `billing_member_4`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `billing_member_4`
--
ALTER TABLE `billing_member_4`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
