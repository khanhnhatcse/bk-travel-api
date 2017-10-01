-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 30, 2017 lúc 11:58 AM
-- Phiên bản máy phục vụ: 10.1.25-MariaDB
-- Phiên bản PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `album_photo`
--

CREATE TABLE `album_photo` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `album_photo`
--

INSERT INTO `album_photo` (`ID`, `NAME`) VALUES
(1, 'Chung'),
(3, 'Album Wed Sep 06 2017 13:25:38 GMT+0700 (+07)'),
(4, 'Album Wed Sep 06 2017 13:32:33 GMT+0700 (+07)'),
(5, 'Album Wed Sep 06 2017 13:38:39 GMT+0700 (+07)'),
(6, 'Album Wed Sep 06 2017 13:39:34 GMT+0700 (+07)'),
(7, 'Album Wed Sep 06 2017 13:40:07 GMT+0700 (+07)'),
(8, 'Album Wed Sep 06 2017 13:53:14 GMT+0700 (+07)'),
(9, 'Album Wed Sep 06 2017 16:35:19 GMT+0700 (+07)'),
(10, 'Album Wed Sep 06 2017 17:11:02 GMT+0700 (+07)'),
(11, 'Album Wed Sep 06 2017 17:16:34 GMT+0700 (+07)'),
(12, 'Album Wed Sep 06 2017 17:20:34 GMT+0700 (+07)'),
(13, 'Album Sun Sep 10 2017 17:28:59 GMT+0700 (+07)'),
(14, 'Album Sun Sep 10 2017 17:30:33 GMT+0700 (+07)'),
(15, 'Album Sun Sep 10 2017 17:30:33 GMT+0700 (+07)'),
(16, 'Album Sun Sep 10 2017 17:31:02 GMT+0700 (+07)'),
(17, 'Album Sun Sep 10 2017 17:31:02 GMT+0700 (+07)'),
(18, 'Album Sun Sep 10 2017 17:31:02 GMT+0700 (+07)'),
(19, 'Album Sun Sep 10 2017 17:32:36 GMT+0700 (+07)'),
(20, 'Album Sun Sep 10 2017 17:32:36 GMT+0700 (+07)'),
(21, 'Album Sun Sep 10 2017 17:32:36 GMT+0700 (+07)'),
(22, 'Album Sun Sep 10 2017 17:32:36 GMT+0700 (+07)'),
(23, 'Album Sun Sep 10 2017 17:33:36 GMT+0700 (+07)'),
(24, 'Album Sun Sep 10 2017 17:33:36 GMT+0700 (+07)'),
(25, 'Album Sun Sep 10 2017 17:33:36 GMT+0700 (+07)'),
(26, 'Album Sun Sep 10 2017 17:33:36 GMT+0700 (+07)'),
(27, 'Album Sun Sep 10 2017 17:33:36 GMT+0700 (+07)'),
(28, 'Album Sun Sep 10 2017 17:47:30 GMT+0700 (+07)'),
(29, 'Album Sun Sep 10 2017 17:58:14 GMT+0700 (+07)'),
(30, 'Album Wed Sep 20 2017 08:48:59 GMT+0700 (+07)'),
(31, 'Album Wed Sep 20 2017 08:51:54 GMT+0700 (+07)'),
(32, 'Album Wed Sep 20 2017 08:51:54 GMT+0700 (+07)'),
(33, 'Album Wed Sep 20 2017 08:55:44 GMT+0700 (+07)'),
(34, 'Album Wed Sep 20 2017 08:55:44 GMT+0700 (+07)'),
(35, 'Album Wed Sep 20 2017 08:55:44 GMT+0700 (+07)'),
(36, 'Album Wed Sep 20 2017 08:58:51 GMT+0700 (+07)'),
(37, 'Album Wed Sep 20 2017 09:17:49 GMT+0700 (+07)'),
(38, 'Album Wed Sep 20 2017 09:21:43 GMT+0700 (+07)'),
(39, 'Album Wed Sep 20 2017 09:22:27 GMT+0700 (+07)'),
(40, 'Album Wed Sep 20 2017 09:22:27 GMT+0700 (+07)'),
(41, 'Album Wed Sep 20 2017 09:28:15 GMT+0700 (+07)'),
(42, 'Album Wed Sep 20 2017 09:28:15 GMT+0700 (+07)'),
(43, 'Album Wed Sep 20 2017 09:28:15 GMT+0700 (+07)'),
(44, 'Album Wed Sep 20 2017 09:32:05 GMT+0700 (+07)'),
(45, 'Album Wed Sep 20 2017 09:33:01 GMT+0700 (+07)'),
(46, 'Album Wed Sep 20 2017 09:33:01 GMT+0700 (+07)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL,
  `CREATE_AT` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_AT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTENT` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `landmark`
--

CREATE TABLE `landmark` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `TOTAL_RATE` double DEFAULT NULL,
  `LONGTITUDE` double DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `VISITED` char(1) DEFAULT NULL,
  `PROVINCE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like`
--

CREATE TABLE `like` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `like`
--

INSERT INTO `like` (`ID`, `USER_ID`, `STATUS_ID`, `STATUS`) VALUES
(125, 4, 33, 1),
(126, 4, 33, -1),
(127, 4, 33, -1),
(128, 4, 33, 1),
(129, 4, 33, -1),
(130, 4, 33, 1),
(131, 4, 33, 1),
(132, 4, 33, -1),
(133, 4, 33, 1),
(134, 4, 33, -1),
(135, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photo`
--

CREATE TABLE `photo` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `LINK` varchar(200) DEFAULT NULL,
  `ALBUM_ID` int(11) DEFAULT NULL,
  `CREATE_AT` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `photo`
--

INSERT INTO `photo` (`ID`, `NAME`, `LINK`, `ALBUM_ID`, `CREATE_AT`) VALUES
(80, '66HmsEQIUKzJHjAAAV1505874725032.png', 'http://192.168.43.236:3000/images/uploads/66HmsEQIUKzJHjAAAV1505874725032.png', 45, '2017-09-20 09:32:05'),
(81, '66HmsEQIUKzJHjAAAV1505874778097.png', 'http://192.168.43.236:3000/images/uploads/66HmsEQIUKzJHjAAAV1505874778097.png', 46, '2017-09-20 09:32:58'),
(82, '66HmsEQIUKzJHjAAAV1505874781588.png', 'http://192.168.43.236:3000/images/uploads/66HmsEQIUKzJHjAAAV1505874781588.png', 46, '2017-09-20 09:33:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `START_DATE` varchar(200) NOT NULL,
  `START_TIME` varchar(200) NOT NULL,
  `ALARM` char(1) DEFAULT NULL,
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `plan`
--

INSERT INTO `plan` (`ID`, `NAME`, `NOTE`, `START_DATE`, `START_TIME`, `ALARM`, `CREATE_AT`, `USER_ID`) VALUES
(8, 'fjk', '', '22/09/2017', '14:37', NULL, '2017-09-17 07:37:28', 4),
(9, 'xghj', '', '17/09/2017', '14:48', NULL, '2017-09-17 07:48:18', 4),
(10, 'ghj', '', '17/09/2017', '14:49', NULL, '2017-09-17 07:49:22', 4),
(41, 'vcb', '', '17/09/2017', '16:35', NULL, '2017-09-17 09:35:26', 4),
(42, 'cb', '', '17/09/2017', '16:39', NULL, '2017-09-17 09:40:17', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `PLAN_PROVINCE`
--

CREATE TABLE `PLAN_PROVINCE` (
  `ID` int(11) NOT NULL,
  `PLAN_ID` int(11) NOT NULL,
  `PROVINCE_ID` int(11) NOT NULL,
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `PLAN_PROVINCE`
--

INSERT INTO `PLAN_PROVINCE` (`ID`, `PLAN_ID`, `PROVINCE_ID`, `CREATE_AT`) VALUES
(15, 8, 15, '2017-09-17 07:37:28'),
(16, 8, 16, '2017-09-17 07:37:28'),
(17, 9, 17, '2017-09-17 07:48:18'),
(18, 9, 18, '2017-09-17 07:48:18'),
(19, 10, 19, '2017-09-17 07:49:22'),
(20, 10, 20, '2017-09-17 07:49:22'),
(21, 23, 38, '2017-09-17 08:50:20'),
(22, 23, 39, '2017-09-17 08:50:20'),
(23, 30, 52, '2017-09-17 09:10:23'),
(24, 30, 53, '2017-09-17 09:10:23'),
(25, 31, 54, '2017-09-17 09:11:19'),
(26, 31, 55, '2017-09-17 09:11:19'),
(27, 32, 56, '2017-09-17 09:12:53'),
(28, 32, 57, '2017-09-17 09:12:53'),
(29, 33, 58, '2017-09-17 09:15:22'),
(30, 33, 59, '2017-09-17 09:15:22'),
(31, 41, 72, '2017-09-17 09:35:26'),
(32, 41, 73, '2017-09-17 09:35:26'),
(33, 42, 74, '2017-09-17 09:40:17'),
(34, 42, 75, '2017-09-17 09:40:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `province`
--

CREATE TABLE `province` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `LONGTITUDE` double DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `TOTAL_RATE` double DEFAULT NULL,
  `START_DATE` varchar(200) NOT NULL,
  `START_TIME` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `province`
--

INSERT INTO `province` (`ID`, `NAME`, `LONGTITUDE`, `LATITUDE`, `TOTAL_RATE`, `START_DATE`, `START_TIME`) VALUES
(15, 'Gjusta, Los Angeles, CA, United States', 0, 0, 0, '', ''),
(16, 'FG, Italy', 0, 0, 0, '', ''),
(17, 'VHT Perth, William Street, Perth, Western Australia, Australia', 0, 0, 0, '', ''),
(18, 'FH JOANNEUM Graz, Alte Poststraße, Graz, Austria', 0, 0, 0, '', ''),
(19, 'FGCU Boulevard South, Fort Myers, FL, United States', 0, 0, 0, '', ''),
(20, 'Africa', 0, 0, 0, '', ''),
(38, 'VGP Golden Beach Resort, Chennai, Tamil Nadu, India', 0, 0, 0, '02/02/2017', '10:00'),
(39, 'HH Prince Aga Khan Road, Agarkar Nagar, Pune, Maharashtra, India', 0, 0, 0, '02/02/2017', '10:00'),
(48, 'AFH Salon, East Madison Street, Seattle, WA, United States', 0, 0, 0, '02/02/2017', '10:00'),
(49, 'VB, Italy', 0, 0, 0, '02/02/2017', '10:00'),
(50, 'vhjj, Paschimramnagar, West Bengal, India', 0, 0, 0, '02/02/2017', '10:00'),
(51, 'Ghaziabad, Uttar Pradesh, India', 0, 0, 0, '02/02/2017', '10:00'),
(52, 'FG, Italy', 0, 0, 0, '02/02/2017', '10:00'),
(53, 'Ghaziabad, Uttar Pradesh, India', 0, 0, 0, '02/02/2017', '10:00'),
(54, 'GGICO Metro Station - Garhoud - Dubai - United Arab Emirates', 0, 0, 0, '02/04/2017', '10:00'),
(55, 'HH Prince Aga Khan Road, Agarkar Nagar, Pune, Maharashtra, India', 0, 0, 0, '02/02/2017', '10:00'),
(56, 'Taloyoak Airport, Taloyoak, NU, Canada', 0, 0, 0, '02/03/2017', '10:00'),
(57, 'Fürstenfeldbruck, Germany', 0, 0, 0, '02/02/2017', '10:00'),
(58, 'Chicago, IL, United States', 0, 0, 0, '02/02/2017', '10:00'),
(59, 'FH JOANNEUM Graz, Alte Poststraße, Graz, Austria', 0, 0, 0, '02/02/2017', '10:00'),
(60, 'FG, Italy', 0, 0, 0, '02/02/2017', '10:00'),
(61, 'Ghaziabad, Uttar Pradesh, India', 0, 0, 0, '02/02/2017', '10:00'),
(62, 'CGO Complex, New Delhi, Delhi, India', 0, 0, 0, '02/02/2017', '10:00'),
(63, 'VV Puram, Bengaluru, Karnataka, India', 0, 0, 0, '02/02/2017', '10:00'),
(64, 'FG, Italy', 0, 0, 0, '02/02/2017', '10:00'),
(65, 'HH Prince Aga Khan Road, Agarkar Nagar, Pune, Maharashtra, India', 0, 0, 0, '02/02/2017', '10:00'),
(66, 'FG, Italy', 0, 0, 0, '02/02/2017', '10:00'),
(67, 'Ghaziabad, Uttar Pradesh, India', 0, 0, 0, '02/02/2017', '10:00'),
(68, 'CJJ Steel CC, Springs, Gauteng, South Africa', 0, 0, 0, '02/02/2017', '10:00'),
(69, 'FGCU Boulevard South, Fort Myers, FL, United States', 0, 0, 0, '02/02/2017', '10:00'),
(70, 'Zhijiang Airport, Huaihua, Hunan, China', 0, 0, 0, '02/02/2017', '10:00'),
(71, 'HH Prince Aga Khan Road, Agarkar Nagar, Pune, Maharashtra, India', 0, 0, 0, '02/02/2017', '10:00'),
(72, 'GG\'s Waterfront Bar & Grill, North Ocean Drive, Hollywood, FL, United States', 0, 0, 0, '02/02/2017', '10:00'),
(73, 'Albuquerque, NM, United States', 0, 0, 0, '02/02/2017', '10:00'),
(74, 'vhjj, Paschimramnagar, West Bengal, India', 0, 0, 0, '02/04/2017', '10:00'),
(75, 'Ghaziabad, Uttar Pradesh, India', 0, 0, 0, '02/02/2017', '10:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `province_landmark`
--

CREATE TABLE `province_landmark` (
  `ID` int(11) NOT NULL,
  `PROVINCE_ID` int(11) NOT NULL,
  `LANDMARK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `CONTENT` text,
  `CREATE_AT` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_AT` datetime DEFAULT CURRENT_TIMESTAMP,
  `PUBLIC` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`ID`, `CONTENT`, `CREATE_AT`, `UPDATE_AT`, `PUBLIC`, `USER_ID`) VALUES
(42, 'AAA', '2017-09-20 09:32:05', '2017-09-20 09:32:05', 0, 4),
(43, 'AAA', '2017-09-20 09:33:01', '2017-09-20 09:33:01', 0, 5),
(44, 'AAA', '2017-09-20 09:33:01', '2017-09-20 09:33:01', 0, 5),
(45, 'Chao cac ban', '2017-09-30 15:56:39', '2017-09-30 15:56:39', 0, 1),
(46, 'Tour nay chia se cho ban nao muon di du lich :))))', '2017-09-30 16:39:36', '2017-09-30 16:39:36', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_album`
--

CREATE TABLE `status_album` (
  `STATUS_ID` int(11) NOT NULL,
  `ALBUM_ID` int(11) NOT NULL,
  `COUNT` int(11) NOT NULL,
  `CREATE_AT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `status_album`
--

INSERT INTO `status_album` (`STATUS_ID`, `ALBUM_ID`, `COUNT`, `CREATE_AT`) VALUES
(42, 44, 1, '2017-09-20 09:32:05'),
(43, 45, 1, '2017-09-20 09:33:01'),
(44, 46, 2, '2017-09-20 09:33:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_tour`
--

CREATE TABLE `status_tour` (
  `ID` int(11) NOT NULL,
  `STATUS_ID` int(11) NOT NULL,
  `TOUR_ID` int(11) NOT NULL,
  `CREATE_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `status_tour`
--

INSERT INTO `status_tour` (`ID`, `STATUS_ID`, `TOUR_ID`, `CREATE_AT`) VALUES
(1, 45, 2, '2017-09-30 08:56:39'),
(2, 46, 2, '2017-09-30 09:39:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

CREATE TABLE `tour` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `NOTE` text,
  `CREATE_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  `PLAN_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tour`
--

INSERT INTO `tour` (`ID`, `NAME`, `NOTE`, `CREATE_DATE`, `START_DATE`, `STATUS`, `PLAN_ID`, `USER_ID`) VALUES
(2, 'Du lịch Hà Nội', '', NULL, '2017-09-22 07:00:00', '5', 8, 5),
(3, 'Du Lịch Thành phố Hồ Chí Minh', '', NULL, '2017-09-22 07:00:00', '2', 8, 5),
(4, 'Du Lịch Thái Lan', '', NULL, '2017-09-22 07:00:00', '3', 8, 5),
(5, 'Du Lịch Hà Quốc', '', NULL, '2017-09-22 07:00:00', '5', 8, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `FULL_NAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `TOKEN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`, `USERNAME`, `FULL_NAME`, `PASSWORD`, `BIRTHDAY`, `GENDER`, `EMAIL`, `PHONE`, `TOKEN`) VALUES
(1, 'test', NULL, '123456', NULL, NULL, '', NULL, 'rOGR2dWazpn3cv2F'),
(2, 'test1', NULL, '123456', NULL, NULL, 'nhat@test.com', NULL, 'p0ZpJ4SiKD4Z7Fdf'),
(3, 'xj', 'cnj', '123456', NULL, NULL, 'thjj@gmail.com', NULL, 'lVCXrGWDqWa8scPn'),
(4, 'thanh', 'thanh', '123456', NULL, NULL, 'bkfoodk13@gmail.com', NULL, 'YmYatr477AEFrps5'),
(5, 'nhat', 'cao khanhnhat', '123456', NULL, NULL, 'knhat2014@gmail.com', NULL, 'AZPoJmMyPrBYLBpE'),
(6, 'swiftios', 'Cao Khanh Nhat', '123456', NULL, NULL, 'knhat@gmail.com.vn', NULL, 'bv5lqx4nUvZ9jduz');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_follow`
--

CREATE TABLE `user_follow` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_FOLLOW` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_follow`
--

INSERT INTO `user_follow` (`ID`, `USER_ID`, `USER_FOLLOW`) VALUES
(3, 1, 1),
(4, 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `album_photo`
--
ALTER TABLE `album_photo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `landmark`
--
ALTER TABLE `landmark`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `PLAN_PROVINCE`
--
ALTER TABLE `PLAN_PROVINCE`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `province_landmark`
--
ALTER TABLE `province_landmark`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `status_album`
--
ALTER TABLE `status_album`
  ADD PRIMARY KEY (`STATUS_ID`,`ALBUM_ID`) USING BTREE;

--
-- Chỉ mục cho bảng `status_tour`
--
ALTER TABLE `status_tour`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`,`USERNAME`,`EMAIL`) USING BTREE;

--
-- Chỉ mục cho bảng `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `album_photo`
--
ALTER TABLE `album_photo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `landmark`
--
ALTER TABLE `landmark`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `like`
--
ALTER TABLE `like`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT cho bảng `photo`
--
ALTER TABLE `photo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT cho bảng `plan`
--
ALTER TABLE `plan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT cho bảng `PLAN_PROVINCE`
--
ALTER TABLE `PLAN_PROVINCE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT cho bảng `province`
--
ALTER TABLE `province`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT cho bảng `province_landmark`
--
ALTER TABLE `province_landmark`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT cho bảng `status_tour`
--
ALTER TABLE `status_tour`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `tour`
--
ALTER TABLE `tour`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `user_follow`
--
ALTER TABLE `user_follow`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
