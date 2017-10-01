-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 06, 2017 lúc 12:53 PM
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
(12, 'Album Wed Sep 06 2017 17:20:34 GMT+0700 (+07)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
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
  `VISITED` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like`
--

CREATE TABLE `like` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(11, 'mJ_s2HYVV7ecWEAAAA1504430722254.png', 'http://192.168.100.32:3000/images/uploads/mJ_s2HYVV7ecWEAAAA1504430722254.png', 8, '2017-09-06 16:37:06'),
(12, 'mJ_s2HYVV7ecWEAAAA1504430722281.png', 'http://192.168.100.32:3000/images/uploads/mJ_s2HYVV7ecWEAAAA1504430722281.png', 8, '2017-09-06 16:37:06'),
(13, 'mJ_s2HYVV7ecWEAAAA1504430728329.png', 'http://192.168.100.32:3000/images/uploads/mJ_s2HYVV7ecWEAAAA1504430728329.png', 8, '2017-09-06 16:37:06'),
(14, 'mJ_s2HYVV7ecWEAAAA1504430730557.png', 'http://192.168.100.32:3000/images/uploads/mJ_s2HYVV7ecWEAAAA1504430730557.png', 0, '2017-09-06 16:37:06'),
(15, 'mJ_s2HYVV7ecWEAAAA1504430732526.png', 'http://192.168.100.32:3000/images/uploads/mJ_s2HYVV7ecWEAAAA1504430732526.png', 0, '2017-09-06 16:37:06'),
(16, 'mJ_s2HYVV7ecWEAAAA1504430736530.png', 'http://192.168.100.32:3000/images/uploads/mJ_s2HYVV7ecWEAAAA1504430736530.png', 0, '2017-09-06 16:37:06'),
(17, '1eFCXcuqfUpBHgAAAA1504685124184.png', 'http://192.168.100.52:3000/images/uploads/1eFCXcuqfUpBHgAAAA1504685124184.png', NULL, '2017-09-06 16:37:06'),
(18, '1eFCXcuqfUpBHgAAAA1504685124620.png', 'http://192.168.100.52:3000/images/uploads/1eFCXcuqfUpBHgAAAA1504685124620.png', NULL, '2017-09-06 16:37:06'),
(19, '1eFCXcuqfUpBHgAAAA1504685129899.png', 'http://192.168.100.52:3000/images/uploads/1eFCXcuqfUpBHgAAAA1504685129899.png', NULL, '2017-09-06 16:37:06'),
(20, '1eFCXcuqfUpBHgAAAA1504685130640.png', 'http://192.168.100.52:3000/images/uploads/1eFCXcuqfUpBHgAAAA1504685130640.png', NULL, '2017-09-06 16:37:06'),
(21, 'TIO93TKhJL17KrAAAB1504689292224.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689292224.png', NULL, '2017-09-06 16:37:06'),
(22, 'TIO93TKhJL17KrAAAB1504689292601.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689292601.png', NULL, '2017-09-06 16:37:06'),
(23, 'TIO93TKhJL17KrAAAB1504689296382.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689296382.png', NULL, '2017-09-06 16:37:06'),
(24, 'TIO93TKhJL17KrAAAB1504689296937.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689296937.png', NULL, '2017-09-06 16:37:06'),
(25, 'TIO93TKhJL17KrAAAB1504689315576.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689315576.png', NULL, '2017-09-06 16:37:06'),
(26, 'TIO93TKhJL17KrAAAB1504689315772.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689315772.png', NULL, '2017-09-06 16:37:06'),
(27, 'TIO93TKhJL17KrAAAB1504689359266.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689359266.png', NULL, '2017-09-06 16:37:06'),
(28, 'TIO93TKhJL17KrAAAB1504689367160.png', 'http://192.168.100.52:3000/images/uploads/TIO93TKhJL17KrAAAB1504689367160.png', NULL, '2017-09-06 16:37:06'),
(29, 'NAAuabVFyV-andAAAA1504689420930.png', 'http://192.168.100.52:3000/images/uploads/NAAuabVFyV-andAAAA1504689420930.png', NULL, '2017-09-06 16:37:06'),
(30, 'NAAuabVFyV-andAAAA1504689421213.png', 'http://192.168.100.52:3000/images/uploads/NAAuabVFyV-andAAAA1504689421213.png', NULL, '2017-09-06 16:37:06'),
(31, 'cY7K1ibLpYFmUaAAAA1504689484819.png', 'http://192.168.100.52:3000/images/uploads/cY7K1ibLpYFmUaAAAA1504689484819.png', NULL, '2017-09-06 16:37:06'),
(32, 'cY7K1ibLpYFmUaAAAA1504689484892.png', 'http://192.168.100.52:3000/images/uploads/cY7K1ibLpYFmUaAAAA1504689484892.png', NULL, '2017-09-06 16:37:06'),
(33, 'pbNgbMH6gIXTd0AAAA1504689854429.png', 'http://192.168.100.52:3000/images/uploads/pbNgbMH6gIXTd0AAAA1504689854429.png', NULL, '2017-09-06 16:37:06'),
(34, 'pbNgbMH6gIXTd0AAAA1504689855092.png', 'http://192.168.100.52:3000/images/uploads/pbNgbMH6gIXTd0AAAA1504689855092.png', NULL, '2017-09-06 16:37:06'),
(35, 'ICG84S47hyHljcAAAA1504690071897.png', 'http://192.168.100.52:3000/images/uploads/ICG84S47hyHljcAAAA1504690071897.png', NULL, '2017-09-06 16:37:06'),
(36, 'ICG84S47hyHljcAAAA1504690073762.png', 'http://192.168.100.52:3000/images/uploads/ICG84S47hyHljcAAAA1504690073762.png', NULL, '2017-09-06 16:37:06'),
(37, '9oW23DBWyBhYzqAAAA1504690372019.png', 'http://192.168.100.52:3000/images/uploads/9oW23DBWyBhYzqAAAA1504690372019.png', NULL, '2017-09-06 16:37:06'),
(38, 'pDgUHB4JkSOJ7-AAAA1504690519163.png', 'http://192.168.100.52:3000/images/uploads/pDgUHB4JkSOJ7-AAAA1504690519163.png', NULL, '2017-09-06 16:37:06'),
(39, 'U4EkeZwjWuRBF4AAAA1504691206927.png', 'http://192.168.100.52:3000/images/uploads/U4EkeZwjWuRBF4AAAA1504691206927.png', NULL, '2017-09-06 16:46:46'),
(40, 'nH1e3QZEs0L6M0AAAA1504691620210.png', 'http://192.168.100.52:3000/images/uploads/nH1e3QZEs0L6M0AAAA1504691620210.png', NULL, '2017-09-06 16:53:40'),
(41, '0ZhG84CTEmFJeDAAAA1504692299458.png', 'http://192.168.100.52:3000/images/uploads/0ZhG84CTEmFJeDAAAA1504692299458.png', NULL, '2017-09-06 17:04:59'),
(42, 'ryfETLvRBUx-TGAAAB1504692605581.png', 'http://192.168.100.52:3000/images/uploads/ryfETLvRBUx-TGAAAB1504692605581.png', 10, '2017-09-06 17:10:05'),
(43, 'uGAjuti9NLY-nPAAAA1504692980685.png', 'http://192.168.100.52:3000/images/uploads/uGAjuti9NLY-nPAAAA1504692980685.png', 11, '2017-09-06 17:16:20'),
(44, 'uGAjuti9NLY-nPAAAA1504692985523.png', 'http://192.168.100.52:3000/images/uploads/uGAjuti9NLY-nPAAAA1504692985523.png', 11, '2017-09-06 17:16:25'),
(45, 'qVwxaSNAUQF3foAAAB1504693196522.png', 'http://192.168.100.52:3000/images/uploads/qVwxaSNAUQF3foAAAB1504693196522.png', 12, '2017-09-06 17:19:56'),
(46, 'qVwxaSNAUQF3foAAAB1504693232520.png', 'http://192.168.100.52:3000/images/uploads/qVwxaSNAUQF3foAAAB1504693232520.png', 12, '2017-09-06 17:20:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `ID` int(11) NOT NULL DEFAULT '1',
  `NAME` varchar(200) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `ALARM` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `province`
--

CREATE TABLE `province` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `LONGTITUDE` double DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `TOTAL_RATE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `CONTENT` text,
  `CREATE_AT` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_AT` datetime DEFAULT CURRENT_TIMESTAMP,
  `ROLE` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`ID`, `CONTENT`, `CREATE_AT`, `UPDATE_AT`, `ROLE`, `USER_ID`) VALUES
(1, 'chia se anh', '2017-09-06 13:25:38', '2017-09-06 13:25:38', 0, 1),
(2, 'chia se anh', '2017-09-06 13:32:33', '2017-09-06 13:32:33', 0, 1),
(3, 'chia se anh', '2017-09-06 13:38:39', '2017-09-06 13:38:39', 0, 1),
(4, 'chia se anh', '2017-09-06 13:39:34', '2017-09-06 13:39:34', 0, 1),
(5, 'chia se anh', '2017-09-06 13:40:07', '2017-09-06 13:40:07', 0, 1),
(6, 'chia se anh', '2017-09-06 13:53:14', '2017-09-06 13:53:14', 0, 1),
(7, 'AAA', '2017-09-06 16:35:19', '2017-09-06 16:35:19', 0, 1),
(8, 'AAA', '2017-09-06 17:11:02', '2017-09-06 17:11:02', 0, 1),
(9, 'AAA', '2017-09-06 17:16:34', '2017-09-06 17:16:34', 0, 1),
(10, 'AAA', '2017-09-06 17:20:34', '2017-09-06 17:20:34', 0, 1);

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
(0, 3, 3, '2017-09-06 16:36:28'),
(2, 4, 3, '2017-09-06 16:36:28'),
(3, 5, 3, '2017-09-06 16:36:28'),
(4, 6, 3, '2017-09-06 16:36:28'),
(5, 7, 3, '2017-09-06 16:36:28'),
(6, 8, 3, '2017-09-06 16:36:28'),
(7, 9, 1, '2017-09-06 16:36:28'),
(8, 10, 1, '2017-09-06 17:11:02'),
(9, 11, 3, '2017-09-06 17:16:34'),
(10, 12, 2, '2017-09-06 17:20:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

CREATE TABLE `tour` (
  `ID` int(11) NOT NULL DEFAULT '1',
  `NAME` varchar(200) DEFAULT NULL,
  `NOTE` text,
  `CREATE_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL DEFAULT '1',
  `USERNAME` varchar(100) DEFAULT NULL,
  `FULL_NAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`, `USERNAME`, `FULL_NAME`, `PASSWORD`, `BIRTHDAY`, `GENDER`, `EMAIL`, `PHONE`) VALUES
(1, 'Nguyễn Văn A', NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Chỉ mục cho bảng `province`
--
ALTER TABLE `province`
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
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `album_photo`
--
ALTER TABLE `album_photo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `photo`
--
ALTER TABLE `photo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT cho bảng `province`
--
ALTER TABLE `province`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
