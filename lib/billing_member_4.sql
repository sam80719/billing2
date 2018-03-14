-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018-03-13 06:57:14
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
-- 資料表結構 `billing_2`
--

CREATE TABLE `billing_2` (
  `id` int(15) NOT NULL,
  `input_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `balance` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cash` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creat_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `billing_2`
--

INSERT INTO `billing_2` (`id`, `input_datetime`, `subject`, `balance`, `type`, `cash`, `update_datetime`, `creat_user`, `picture`) VALUES
(1, '2018-03-13 09:31:53', 'asda', 'income', 'education', '213', '2018-03-13 09:31:53', 'panda001', ''),
(154, '2018-03-08 09:01:59', 'asdadsa', 'income', 'education', '1212', '2018-03-08 09:01:59', 'sam80719', ''),
(155, '2018-03-08 09:02:07', '21312', 'income', 'food', '123213', '2018-03-08 09:02:07', 'sam80719', ''),
(156, '2018-03-08 09:27:04', 'asdasd', 'income', 'entertainment', '111', '2018-03-08 09:27:04', 'sam80719', ''),
(157, '2018-03-08 09:48:07', 'wqeqw', 'income', 'entertainment', '1', '2018-03-08 09:48:07', 'sam80719', ''),
(158, '2018-03-08 09:48:35', 'asdasd', 'income', 'clothes', '11', '2018-03-08 09:48:35', 'sam80719', ''),
(159, '2018-03-08 09:48:44', 'qewqe', 'income', 'food', '11', '2018-03-08 09:48:44', 'sam80719', ''),
(160, '2018-03-08 09:51:49', 'sadsad', 'income', 'clothes', '23', '2018-03-08 09:51:49', 'panda003', ''),
(161, '2018-03-08 11:34:30', 'rrrr', 'expence', 'education', '1', '2018-03-08 11:34:30', 'panda003', ''),
(166, '2018-03-12 13:40:04', '123', 'expence', 'clothes', '50', '2018-03-12 13:40:04', 'panda001', ''),
(167, '2018-03-12 13:40:22', 'asd', 'income', 'clothes', '123', '2018-03-12 13:40:22', 'panda001', ''),
(168, '2018-03-12 13:41:01', 'asda', 'income', 'clothes', '21', '2018-03-12 13:41:01', 'panda001', ''),
(169, '2018-03-12 13:43:55', 'asd', 'income', 'entertainment', '123', '2018-03-12 13:43:55', 'panda001', ''),
(170, '2018-03-12 13:44:23', '123', 'income', 'clothes', '345', '2018-03-12 13:44:23', 'panda001', ''),
(171, '2018-03-12 13:44:48', '12', 'expence', 'education', '12345', '2018-03-12 13:44:48', 'panda001', ''),
(172, '2018-03-12 13:45:09', '123312', 'income', 'clothes', '123', '2018-03-12 13:45:09', 'panda001', ''),
(173, '2018-03-12 14:38:13', 'sadsad', 'income', 'clothes', '123', '2018-03-12 14:38:13', 'panda001', ''),
(174, '2018-03-13 09:34:28', 'dasd', 'income', 'food', '123', '2018-03-13 09:34:28', 'panda001', ''),
(175, '2018-03-13 09:34:43', '123', 'income', 'education', '002', '2018-03-13 09:34:43', 'panda001', ''),
(176, '2018-03-13 09:40:55', 'asd', 'income', 'entertainment', '213', '2018-03-13 09:40:55', 'panda001', ''),
(177, '2018-03-13 10:10:02', 'dsa', 'income', 'education', '213', '2018-03-13 10:10:02', 'panda001', ''),
(178, '2018-03-13 10:52:41', 'sad', 'income', 'education', '123', '2018-03-13 10:52:41', 'panda001', ''),
(179, '2018-03-13 10:53:04', 'sad', 'income', 'education', '124', '2018-03-13 10:53:04', 'panda001', '');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `billing_2`
--
ALTER TABLE `billing_2`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `billing_2`
--
ALTER TABLE `billing_2`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
