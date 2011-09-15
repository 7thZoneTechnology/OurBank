-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2011 at 03:03 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `latestidf`
--

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_accountfee`
--

CREATE TABLE IF NOT EXISTS `ourbank_accountfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  `feeamount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_accountfee`
--

INSERT INTO `ourbank_accountfee` (`id`, `account_id`, `fee_id`, `feeamount`) VALUES
(1, 4, 1, 5.00),
(2, 5, 1, 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_accounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tag_account` tinyint(4) NOT NULL,
  `member_id` int(10) NOT NULL,
  `product_id` smallint(5) NOT NULL,
  `begin_date` date NOT NULL,
  `close_date` date NOT NULL,
  `membertype_id` int(10) NOT NULL,
  `accountcreated_date` date NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `status_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_accounts`
--

INSERT INTO `ourbank_accounts` (`id`, `account_number`, `tag_account`, `member_id`, `product_id`, `begin_date`, `close_date`, `membertype_id`, `accountcreated_date`, `created_date`, `created_by`, `status_id`, `status_description`) VALUES
(1, '0040301S000001', 1, 1, 1, '2011-09-13', '0000-00-00', 3, '2011-09-13', '2011-09-13 13:08:52', 1, 1, ''),
(2, '0040101S000002', 1, 1, 1, '2011-09-13', '0000-00-00', 1, '2011-09-13', '2011-09-13 13:08:52', 1, 1, ''),
(3, '0040102S000003', 0, 1, 2, '2011-09-13', '0000-00-00', 1, '2011-09-13', '2011-09-13 13:31:17', 1, 1, ''),
(4, '0040101L000004', 0, 1, 1, '2011-01-01', '2020-09-13', 1, '2011-09-13', '2011-09-13 13:38:53', 1, 1, ''),
(5, '0040301L000005', 0, 1, 1, '2011-01-01', '2020-09-13', 3, '2011-09-13', '2011-09-13 13:39:54', 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_activities`
--

CREATE TABLE IF NOT EXISTS `ourbank_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `activity` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_activities`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_activities_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_activities_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `activity` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_activities_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_address`
--

CREATE TABLE IF NOT EXISTS `ourbank_address` (
  `submodule_id` tinyint(4) NOT NULL,
  `id` mediumint(9) NOT NULL,
  `address1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hobli` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `village` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_address`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_address_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_address_log` (
  `record_id` int(11) NOT NULL,
  `submodule_id` tinyint(4) NOT NULL,
  `id` mediumint(9) NOT NULL,
  `address1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hobli` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `village` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_address_log`
--

INSERT INTO `ourbank_address_log` (`record_id`, `submodule_id`, `id`, `address1`, `address2`, `address3`, `hobli`, `village`, `city`, `district`, `state`, `zipcode`, `created_by`, `created_date`) VALUES
(0, 18, 2, 'temple', '', '', 'kadapa', 'konemadanahalli', 'gubbi', 'Tumkur', 'Karnataka', '', 1, '2011-07-07 00:29:02'),
(0, 18, 1, 'Kadaba road', '', '', 'Kadaba', 'Halenahalli', 'Gubbi', 'Tumkur', 'Karnataka', '', 1, '2011-07-07 20:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_agriculture`
--

CREATE TABLE IF NOT EXISTS `ourbank_agriculture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `landowner_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `land_id` int(11) NOT NULL,
  `acquistion_id` int(50) NOT NULL,
  `villagename` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `survey_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `acre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gunta` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `agreement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_agriculture`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_agriculture_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_agriculture_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `landowner_id` int(11) NOT NULL,
  `landowner_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `land_id` int(11) NOT NULL,
  `acquistion_id` int(50) NOT NULL,
  `villagename` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `survey_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `acre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gunta` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `value` float(10,2) NOT NULL,
  `agreement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=204 ;

--
-- Dumping data for table `ourbank_agriculture_log`
--

INSERT INTO `ourbank_agriculture_log` (`record_id`, `id`, `family_id`, `landowner_id`, `landowner_name`, `land_id`, `acquistion_id`, `villagename`, `survey_no`, `acre`, `gunta`, `value`, `agreement`, `created_by`, `created_date`) VALUES
(1, 1, 1, 0, '7', 1, 1, '7', '59/1', '1', '', 0.00, '', 0, '2011-07-05 19:36:02'),
(2, 3, 11, 0, '13', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-05 19:43:55'),
(3, 4, 11, 0, '11', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-05 19:44:09'),
(4, 5, 11, 0, '11', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-05 19:52:39'),
(5, 6, 11, 0, '11', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-05 20:04:25'),
(6, 7, 11, 0, '11', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-05 20:05:03'),
(7, 8, 9, 0, '23', 1, 2, '5', '19', '2', '15', 0.00, '', 0, '2011-07-05 20:06:09'),
(8, 13, 14, 0, '27', 1, 1, '7', '45', '3', '', 0.00, '', 0, '2011-07-05 20:23:23'),
(9, 14, 14, 0, '14', 1, 1, '7', '45', '3', '', 0.00, '', 0, '2011-07-05 20:23:53'),
(10, 15, 14, 0, '14', 1, 1, '7', '45', '3', '', 0.00, '', 0, '2011-07-05 20:24:31'),
(11, 16, 14, 0, '14', 1, 1, '7', '45', '3', '', 0.00, '', 0, '2011-07-05 20:25:22'),
(12, 17, 13, 0, '36', 1, 1, '11', '13/2', '5', '', 0.00, '', 0, '2011-07-05 20:25:28'),
(13, 20, 13, 0, '13', 1, 1, '11', '13/2', '5', '', 0.00, '', 0, '2011-07-05 20:50:25'),
(14, 23, 13, 0, '13', 1, 1, '11', '13/2', '5', '', 0.00, '', 0, '2011-07-05 21:11:11'),
(15, 9, 11, 0, '11', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-05 20:06:19'),
(16, 35, 54, 0, '134', 1, 2, '7', '', '0', '', 0.00, '', 0, '2011-07-06 18:46:13'),
(17, 39, 66, 0, '174', 1, 2, '6', '57', '5', '', 0.00, '', 0, '2011-07-06 19:27:16'),
(18, 52, 105, 0, '309', 1, 2, '6', '', '4', '20', 0.00, '', 0, '2011-07-06 21:10:55'),
(19, 66, 124, 0, '2', 1, 3, '6', '', '6', '', 0.00, '', 0, '2011-07-07 15:10:52'),
(20, 91, 149, 0, '1', 1, 1, '3', '18', '4', '', 0.00, '', 0, '2011-07-07 17:30:25'),
(21, 30, 11, 0, '11', 2, 1, '6', '', '2', '20', 0.00, '', 0, '2011-07-06 14:55:40'),
(22, 29, 25, 0, '70', 1, 2, '6', '42', '5', '20', 0.00, '', 0, '2011-07-05 21:38:50'),
(23, 31, 49, 0, '110', 1, 2, '6', '', '2', '', 0.00, '', 0, '2011-07-06 17:56:24'),
(24, 34, 50, 0, '111', 1, 2, '6', '', '0', '22', 0.00, '', 0, '2011-07-06 18:09:33'),
(25, 122, 50, 0, '2', 1, 2, '6', '', '0', '22', 0.00, '', 0, '2011-07-07 19:57:33'),
(26, 43, 70, 0, '194', 1, 2, '6', '2', '4', '20', 0.00, '', 0, '2011-07-06 19:47:55'),
(27, 48, 80, 0, '250', 1, 2, '6', '', '4', '', 0.00, '', 0, '2011-07-06 20:21:21'),
(28, 49, 85, 0, '258', 1, 2, '6', '2', '4', '20', 0.00, '', 0, '2011-07-06 20:30:57'),
(29, 50, 91, 0, '278', 1, 2, '6', '', '3', '20', 0.00, '', 0, '2011-07-06 20:45:04'),
(30, 51, 100, 0, '303', 1, 2, '6', '', '3', '20', 0.00, '', 0, '2011-07-06 20:56:58'),
(31, 27, 26, 0, '66', 1, 1, '7', '45', '5', '', 0.00, '', 0, '2011-07-05 21:34:53'),
(32, 28, 26, 0, '67', 3, 1, '7', '46', '0', '', 0.00, '', 0, '2011-07-05 21:34:53'),
(33, 36, 54, 0, '54', 1, 2, '7', '', '0', '', 0.00, '', 0, '2011-07-06 18:52:01'),
(34, 37, 59, 0, '140', 1, 1, '7', '5', '2', '', 0.00, '', 0, '2011-07-06 18:57:11'),
(35, 10, 9, 0, '9', 1, 2, '5', '19', '2', '15', 0.00, '', 0, '2011-07-05 20:07:02'),
(36, 38, 61, 0, '161', 1, 1, '7', '57', '', '20', 0.00, '', 0, '2011-07-06 19:13:32'),
(37, 45, 67, 0, '196', 1, 1, '7', '5', '4', '', 0.00, '', 0, '2011-07-06 20:02:21'),
(38, 22, 21, 0, '52', 1, 4, '5', '29/2', '5', '20', 0.00, '', 0, '2011-07-05 21:04:13'),
(39, 32, 28, 0, '86', 3, 1, '5', '18', '1', '2', 0.00, '', 0, '2011-07-06 17:57:38'),
(40, 180, 71, 0, '1', 1, 3, '7', '', '10', '', 0.00, '', 0, '2011-07-08 17:39:49'),
(41, 181, 71, 0, '1', 2, 3, '7', '', '20', '', 0.00, '', 0, '2011-07-08 17:39:49'),
(42, 182, 71, 0, '1', 3, 3, '7', '', '30', '', 0.00, '', 0, '2011-07-08 17:39:49'),
(43, 183, 71, 0, '1', 1, 3, '7', '', '10', '', 0.00, '', 0, '2011-07-08 17:39:49'),
(44, 184, 71, 0, '1', 2, 3, '7', '', '20', '', 0.00, '', 0, '2011-07-08 17:39:49'),
(45, 185, 71, 0, '1', 3, 3, '7', '', '30', '', 0.00, '', 0, '2011-07-08 17:39:49'),
(46, 24, 13, 0, '13', 1, 1, '11', '13/2', '5', '', 0.00, '', 0, '2011-07-05 21:11:42'),
(47, 240, 229, 0, '1', 2, 2, '24', '126', '5', '20', 0.00, '', 0, '2011-07-08 21:21:15'),
(48, 312, 283, 0, '1', 1, 1, '12', '95', '3', '10', 0.00, '', 0, '2011-07-09 19:16:20'),
(49, 339, 301, 0, '1', 1, 1, '12', '102/3', '1', '10', 0.00, '', 0, '2011-07-09 21:16:12'),
(50, 340, 301, 0, '1', 1, 1, '12', '', '1', '10', 0.00, '', 0, '2011-07-09 21:16:12'),
(51, 363, 310, 0, '1', 1, 1, '7', '', '3', '', 0.00, '', 0, '2011-07-11 15:20:59'),
(52, 364, 310, 0, '4', 3, 1, '7', '', '3', '20', 0.00, '', 0, '2011-07-11 15:20:59'),
(53, 365, 310, 0, '1', 4, 1, '7', '', '2', '', 0.00, '', 0, '2011-07-11 15:20:59'),
(54, 366, 310, 0, '1', 1, 1, '7', '47', '3', '', 0.00, '', 0, '2011-07-11 15:21:18'),
(55, 367, 310, 0, '4', 3, 1, '7', '', '3', '20', 0.00, '', 0, '2011-07-11 15:21:18'),
(56, 368, 310, 0, '1', 4, 1, '7', '', '2', '', 0.00, '', 0, '2011-07-11 15:21:18'),
(57, 377, 313, 0, '1', 1, 1, '7', '', '2', '20', 0.00, '', 0, '2011-07-11 15:44:45'),
(58, 432, 351, 0, '1', 1, 1, '7', '55/2', '2', '', 0.00, '', 0, '2011-07-11 21:27:47'),
(59, 433, 351, 0, '1', 4, 1, '7', '', '1', '28', 0.00, '', 0, '2011-07-11 21:27:47'),
(60, 526, 314, 0, '1', 2, 1, '22', '', '1', '', 0.00, '', 0, '2011-07-13 15:24:27'),
(61, 736, 596, 0, '2', 1, 1, '12', '', '4', '', 0.00, '', 0, '2011-07-15 16:39:59'),
(62, 812, 653, 0, '1', 1, 1, '15', '', '1', '', 0.00, '', 0, '2011-07-15 21:14:07'),
(63, 887, 730, 0, '2', 1, 2, '25', '', '0', '5', 0.00, '', 0, '2011-07-16 19:03:20'),
(64, 1377, 1197, 0, '1', 1, 3, '5', '67/35', '2', '', 0.00, '', 0, '2011-07-22 15:15:04'),
(65, 1378, 1197, 0, '1', 2, 3, '5', '', '1', '', 0.00, '', 0, '2011-07-22 15:15:04'),
(66, 1379, 1197, 0, '1', 3, 3, '5', '', '2', '', 0.00, '', 0, '2011-07-22 15:15:04'),
(67, 1391, 1225, 0, '2', 1, 1, '85', '', '0', '20', 0.00, '', 0, '2011-07-22 16:20:06'),
(68, 1403, 1245, 0, '1', 2, 1, '85', '', '1', '20', 0.00, '', 0, '2011-07-22 17:35:34'),
(69, 1534, 1472, 0, '1', 2, 1, '143', '', '1', '2', 0.00, '', 0, '2011-07-25 14:51:26'),
(70, 1535, 1472, 0, '1', 2, 1, '143', '', '1', '2', 0.00, '', 0, '2011-07-25 14:52:40'),
(71, 1585, 1585, 0, '1', 1, 1, '69', '', '1', '', 0.00, '', 0, '2011-07-26 15:12:16'),
(72, 1604, 1583, 0, '1', 1, 3, '45', '', '4', '10', 0.00, '', 0, '2011-07-26 16:37:44'),
(73, 1627, 1667, 0, '1', 3, 1, '45', '10/5', '1', '32', 0.00, '', 0, '2011-07-27 14:31:46'),
(74, 1628, 1667, 0, '1', 4, 1, '45', '', '', '6', 0.00, '', 0, '2011-07-27 14:31:46'),
(75, 1629, 1667, 0, '1', 1, 1, '45', '42/2', '', '15', 0.00, '', 0, '2011-07-27 14:31:46'),
(76, 1630, 1667, 0, '1', 1, 1, '45', '51', '', '20', 0.00, '', 0, '2011-07-27 14:31:46'),
(77, 1639, 1672, 0, '1', 1, 3, '28', '60/1', '', '30', 0.00, '', 0, '2011-07-27 15:08:21'),
(78, 1640, 1672, 0, '1', 2, 3, '28', '100', '', '30', 0.00, '', 0, '2011-07-27 15:08:22'),
(79, 1641, 1672, 0, '1', 3, 3, '28', '179', '', '20', 0.00, '', 0, '2011-07-27 15:08:22'),
(80, 1642, 1672, 0, '1', 4, 3, '28', '51', '', '10', 0.00, '', 0, '2011-07-27 15:08:22'),
(81, 1674, 1664, 0, '1', 1, 1, '144', '', '2', '', 0.00, '', 0, '2011-07-27 16:10:42'),
(82, 1675, 1664, 0, '1', 2, 1, '144', '', '1', '', 0.00, '', 0, '2011-07-27 16:10:42'),
(83, 1687, 1704, 0, '1', 1, 1, '66', '', '01', '', 0.00, '', 0, '2011-07-27 17:48:30'),
(84, 1789, 1825, 0, '1', 1, 1, '45', '48', '1', '11', 0.00, '', 0, '2011-07-28 15:17:15'),
(85, 1875, 1957, 0, '1', 1, 1, '66', '', '2', '', 0.00, '', 0, '2011-07-29 14:28:16'),
(86, 1911, 2012, 0, '1', 1, 1, '69', '', '', '20', 0.00, '', 0, '2011-07-29 19:07:21'),
(87, 1936, 2048, 0, '4', 1, 1, '25', '', '1', '24', 0.00, '', 0, '2011-07-29 21:27:18'),
(88, 2077, 2418, 0, '1', 1, 1, '6', '', '1', '20', 0.00, '', 0, '2011-08-01 21:28:06'),
(89, 2090, 2438, 0, '1', 1, 1, '38', '', '1', '', 0.00, '', 0, '2011-08-02 13:50:19'),
(90, 2091, 2438, 0, '1', 1, 1, '38', '', '1', '', 0.00, '', 0, '2011-08-02 13:50:21'),
(91, 2125, 2472, 0, '1', 1, 1, '66', '', '', '20', 0.00, '', 0, '2011-08-02 15:51:50'),
(92, 2148, 2457, 0, '1', 4, 1, '69', '', '', '20', 0.00, '', 0, '2011-08-02 17:21:28'),
(93, 2155, 2512, 0, '1', 1, 1, '14', '', '1', '', 0.00, '', 0, '2011-08-02 17:44:55'),
(94, 2156, 2512, 0, '1', 2, 1, '14', '', '1', '', 0.00, '', 0, '2011-08-02 17:44:56'),
(95, 2217, 2603, 0, '1', 1, 3, '14', '', '1', '', 0.00, '', 0, '2011-08-02 21:57:34'),
(96, 2218, 2603, 0, '1', 2, 3, '14', '', '1', '', 0.00, '', 0, '2011-08-02 21:57:35'),
(97, 2219, 2603, 0, '1', 2, 3, '14', '', '1', '', 0.00, '', 0, '2011-08-02 21:57:35'),
(98, 2252, 2623, 0, '1', 1, 1, '40', '', '6', '20', 0.00, '', 0, '2011-08-03 15:23:36'),
(99, 2325, 2764, 0, '1', 1, 1, '44', '43', '2', '30', 0.00, '', 0, '2011-08-04 14:05:41'),
(100, 2326, 2764, 0, '1', 3, 1, '44', '44', '2', '15', 0.00, '', 0, '2011-08-04 14:05:41'),
(101, 2327, 2764, 0, '1', 1, 1, '44', '43', '2', '30', 0.00, '', 0, '2011-08-04 14:05:43'),
(102, 2328, 2764, 0, '1', 3, 1, '44', '44', '2', '15', 0.00, '', 0, '2011-08-04 14:05:43'),
(103, 2324, 2763, 0, '1', 1, 2, '44', '', '1', '', 0.00, '', 0, '2011-08-04 14:04:44'),
(104, 2329, 2764, 0, '1', 1, 1, '44', '43', '2', '30', 0.00, '', 0, '2011-08-04 14:05:43'),
(105, 2330, 2764, 0, '1', 3, 1, '44', '44', '2', '15', 0.00, '', 0, '2011-08-04 14:05:43'),
(106, 2396, 2830, 0, '1', 1, 1, '29', '', '', '20', 0.00, '', 0, '2011-08-04 20:45:05'),
(107, 2397, 2830, 0, '1', 2, 1, '29', '', '', '20', 0.00, '', 0, '2011-08-04 20:45:05'),
(108, 2432, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:35'),
(109, 2433, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:35'),
(110, 2434, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:36'),
(111, 2435, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:37'),
(112, 2436, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:37'),
(113, 2437, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:38'),
(114, 2438, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:39'),
(115, 2439, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:39'),
(116, 2440, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:40'),
(117, 2441, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:41'),
(118, 2442, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:41'),
(119, 2443, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:42'),
(120, 2444, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:42'),
(121, 2445, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:43'),
(122, 2446, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:43'),
(123, 2447, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:43'),
(124, 2448, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:44'),
(125, 2449, 2878, 0, '2', 3, 1, '66', '77', '', '30', 0.00, '', 0, '2011-08-05 15:22:44'),
(126, 2478, 2911, 0, '1', 1, 3, '75', '153', '1', '', 0.00, '', 0, '2011-08-05 17:52:37'),
(127, 2587, 3045, 0, '1', 3, 1, '44', '', '2', '', 0.00, '', 0, '2011-08-06 16:04:03'),
(128, 2588, 3045, 0, '1', 1, 1, '44', '', '1', '20', 0.00, '', 0, '2011-08-06 16:04:03'),
(129, 2589, 3045, 0, '1', 3, 1, '44', '', '', '20', 0.00, '', 0, '2011-08-06 16:04:03'),
(130, 2590, 3045, 0, '1', 3, 1, '44', '', '', '20', 0.00, '', 0, '2011-08-06 16:04:03'),
(131, 2615, 3065, 0, '1', 3, 1, '44', '', '1', '5', 0.00, '', 0, '2011-08-06 17:26:32'),
(132, 2616, 3065, 0, '1', 1, 1, '44', '', '2', '21', 0.00, '', 0, '2011-08-06 17:26:32'),
(133, 2617, 3065, 0, '1', 2, 1, '44', '', '', '21', 0.00, '', 0, '2011-08-06 17:26:33'),
(134, 2636, 3083, 0, '1', 1, 1, '66', '', '', '20', 0.00, '', 0, '2011-08-06 18:27:04'),
(135, 2651, 3103, 0, '1', 1, 1, '66', '', '1', '', 0.00, '', 0, '2011-08-06 19:10:18'),
(136, 2652, 3103, 0, '1', 3, 1, '66', '', '', '20', 0.00, '', 0, '2011-08-06 19:10:18'),
(137, 2659, 3105, 0, '1', 1, 1, '44', '69/2', '', '16', 0.00, '', 0, '2011-08-06 19:19:52'),
(138, 2670, 3109, 0, '2', 3, 1, '63', '2', '00', '15', 0.00, '', 0, '2011-08-06 19:29:24'),
(139, 2684, 3117, 0, '1', 3, 3, '75', '181/1', '1', '10', 0.00, '', 0, '2011-08-06 20:35:35'),
(140, 2686, 3121, 0, '1', 1, 1, '29', '', '10', '', 0.00, '', 0, '2011-08-06 21:00:54'),
(141, 2687, 3121, 0, '1', 2, 1, '29', '', '5', '', 0.00, '', 0, '2011-08-06 21:00:54'),
(142, 2759, 3225, 0, '1', 3, 1, '44', '', '2', '', 0.00, '', 0, '2011-08-08 15:07:12'),
(143, 2924, 3455, 0, '1', 1, 1, '12', '86/2', '4', '', 0.00, '', 0, '2011-08-10 16:40:14'),
(144, 2925, 3455, 0, '1', 2, 1, '12', '', '1', '', 0.00, '', 0, '2011-08-10 16:40:14'),
(145, 2926, 3455, 0, '1', 3, 1, '12', '', '5', '', 0.00, '', 0, '2011-08-10 16:40:14'),
(146, 2945, 3484, 0, '1', 2, 3, '26', '', '1', '', 0.00, '', 0, '2011-08-10 18:03:48'),
(147, 2970, 3540, 0, '1', 1, 3, '28', '', '2', '', 0.00, '', 0, '2011-08-10 21:41:08'),
(148, 2971, 3540, 0, '1', 2, 3, '28', '', '1', '', 0.00, '', 0, '2011-08-10 21:41:08'),
(149, 3050, 3706, 0, '1', 1, 3, '26', '', '1', '', 0.00, '', 0, '2011-08-11 20:35:57'),
(150, 3051, 3706, 0, '1', 2, 3, '26', '', '', '20', 0.00, '', 0, '2011-08-11 20:35:58'),
(151, 3052, 3706, 0, '1', 2, 3, '26', '', '', '20', 0.00, '', 0, '2011-08-11 20:38:12'),
(152, 3182, 3966, 0, '1', 4, 1, '67', '19/4', '1', '3', 0.00, '', 0, '2011-08-13 19:25:30'),
(153, 3217, 4075, 0, '1', 1, 1, '67', '46', '1', '00', 0.00, '', 0, '2011-08-14 16:54:45'),
(154, 3218, 4075, 0, '1', 1, 1, '67', '46', '1', '00', 0.00, '', 0, '2011-08-14 16:54:45'),
(155, 3220, 4079, 0, '1', 4, 1, '67', '61', '1', '00', 0.00, '', 0, '2011-08-14 17:18:01'),
(156, 3226, 4080, 0, '2', 1, 1, '63', '55', '01', '21', 0.00, '', 0, '2011-08-14 17:34:59'),
(157, 3242, 4113, 0, '1', 3, 1, '67', '109', '00', '30', 0.00, '', 0, '2011-08-14 19:06:50'),
(158, 3267, 4143, 0, '1', 1, 3, '75', '', '2', '', 0.00, '', 0, '2011-08-14 21:16:58'),
(159, 3299, 4235, 0, '2', 1, 1, '70', '', '1', '', 0.00, '', 0, '2011-08-15 17:57:51'),
(160, 3359, 4330, 0, '1', 1, 3, '75', '', '1', '', 0.00, '', 0, '2011-08-16 16:40:57'),
(161, 3396, 4386, 0, '1', 1, 3, '75', '', '1', '', 0.00, '', 0, '2011-08-16 19:33:53'),
(162, 3434, 4431, 0, '2', 4, 1, '67', '6/1', '1', '06', 0.00, '', 0, '2011-08-17 14:07:36'),
(163, 3455, 4452, 0, '1', 1, 1, '22', '', '1', '', 0.00, '', 0, '2011-08-17 15:28:04'),
(164, 3456, 4452, 0, '1', 2, 1, '22', '', '', '20', 0.00, '', 0, '2011-08-17 15:28:05'),
(165, 3457, 4452, 0, '1', 3, 1, '22', '', '', '20', 0.00, '', 0, '2011-08-17 15:28:05'),
(166, 3562, 4601, 0, '1', 1, 1, '15', '', '2', '', 0.00, '', 0, '2011-08-18 15:43:14'),
(167, 3563, 4601, 0, '1', 2, 1, '15', '', '2', '', 0.00, '', 0, '2011-08-18 15:43:16'),
(168, 3564, 4601, 0, '1', 1, 1, '15', '', '2', '', 0.00, '', 0, '2011-08-18 15:43:48'),
(169, 3565, 4601, 0, '1', 2, 1, '15', '', '2', '', 0.00, '', 0, '2011-08-18 15:43:49'),
(170, 3600, 4640, 0, '1', 1, 1, '148', '153', '1', '', 0.00, '', 0, '2011-08-18 18:59:10'),
(171, 3601, 4640, 0, '1', 2, 1, '148', '', '', '22', 0.00, '', 0, '2011-08-18 18:59:10'),
(172, 3602, 4640, 0, '1', 3, 1, '148', '', '', '15', 0.00, '', 0, '2011-08-18 18:59:10'),
(173, 3606, 4647, 0, '1', 1, 3, '75', '', '', '20', 0.00, '', 0, '2011-08-18 19:11:13'),
(174, 3607, 4647, 0, '1', 3, 3, '75', '', '', '10', 0.00, '', 0, '2011-08-18 19:11:13'),
(175, 4001, 5043, 0, '2', 4, 1, '7', '15', '2', '0', 0.00, '', 0, '2011-08-22 11:28:51'),
(176, 4106, 5116, 0, '2', 4, 1, '61', '', '00', '20', 0.00, '', 0, '2011-08-22 13:52:00'),
(177, 4282, 5267, 0, '1', 1, 1, '31', '', '1', '', 0.00, '', 0, '2011-08-23 11:11:12'),
(178, 4283, 5267, 0, '1', 2, 1, '31', '', '', '30', 0.00, '', 0, '2011-08-23 11:11:12'),
(179, 4290, 5271, 0, '1', 1, 1, '148', '', '20', '', 0.00, '', 0, '2011-08-23 11:30:19'),
(180, 4325, 5310, 0, '1', 1, 1, '61', '', '03', '00', 0.00, '', 0, '2011-08-23 12:35:44'),
(181, 4388, 5403, 0, '1', 1, 1, '31', '', '', '20', 0.00, '', 0, '2011-08-23 15:15:15'),
(182, 4397, 5402, 0, '1', 1, 3, '75', '', '1', '', 0.00, '', 0, '2011-08-23 15:34:32'),
(183, 4405, 5414, 0, '1', 1, 3, '75', '', '1', '10', 0.00, '', 0, '2011-08-23 15:45:51'),
(184, 4559, 5551, 0, '1', 1, 3, '75', '', '3', '', 0.00, '', 0, '2011-08-24 13:11:27'),
(185, 4560, 5551, 0, '1', 1, 3, '75', '', '3', '', 0.00, '', 0, '2011-08-24 13:11:29'),
(186, 5183, 6153, 0, '1', 3, 1, '66', '', '1', '', 0.00, '', 0, '2011-08-27 12:14:34'),
(187, 5184, 6153, 0, '1', 2, 1, '66', '', '', '20', 0.00, '', 0, '2011-08-27 12:14:34'),
(188, 5185, 6153, 0, '1', 3, 1, '66', '', '1', '', 0.00, '', 0, '2011-08-27 12:14:34'),
(189, 5186, 6153, 0, '1', 2, 1, '66', '', '', '20', 0.00, '', 0, '2011-08-27 12:14:34'),
(190, 5329, 6590, 0, '1', 4, 1, '73', '', '', '30', 0.00, '', 0, '2011-08-28 16:36:43'),
(191, 5387, 6738, 0, '1', 2, 3, '25', '', '4', '', 0.00, '', 0, '2011-08-29 13:54:42'),
(192, 5388, 6738, 0, '1', 3, 3, '25', '', '', '20', 0.00, '', 0, '2011-08-29 13:54:42'),
(193, 5419, 6807, 0, '1', 1, 3, '25', '', '4', '', 0.00, '', 0, '2011-08-29 15:40:08'),
(194, 5574, 6998, 0, '1', 1, 1, '25', '', '', '30', 0.00, '', 0, '2011-08-30 13:57:44'),
(195, 5652, 7087, 0, '2', 1, 1, '15', '', '2', '', 0.00, '', 0, '2011-08-30 17:41:18'),
(196, 5653, 7087, 0, '2', 2, 1, '15', '', '1', '', 0.00, '', 0, '2011-08-30 17:41:18'),
(197, 5654, 7087, 0, '2', 3, 1, '15', '', '3', '', 0.00, '', 0, '2011-08-30 17:41:18'),
(198, 5913, 7735, 0, '1', 1, 3, '76', '', '', '13', 0.00, '', 0, '2011-09-03 17:13:05'),
(199, 5914, 7735, 0, '1', 1, 3, '76', '', '', '29', 0.00, '', 0, '2011-09-03 17:13:05'),
(200, 6048, 8023, 0, '1', 1, 3, '25', '', '1', '', 0.00, '', 0, '2011-09-05 13:09:47'),
(201, 6060, 8059, 0, '1', 1, 3, '25', '', '2', '', 0.00, '', 0, '2011-09-05 14:58:01'),
(202, 6163, 8197, 0, '1', 1, 1, '7', '', '1', '', 0.00, '', 0, '2011-09-06 12:56:38'),
(203, 6208, 8224, 0, '1', 1, 3, '25', '', '', '20', 0.00, '', 0, '2011-09-06 13:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Assets`
--

CREATE TABLE IF NOT EXISTS `ourbank_Assets` (
  `Assets_id` int(10) NOT NULL AUTO_INCREMENT,
  `office_id` int(10) NOT NULL,
  `glsubcode_id_from` int(10) NOT NULL,
  `glsubcode_id_to` int(10) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `credit` float(10,2) NOT NULL,
  `debit` float(10,2) NOT NULL,
  `record_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Assets_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_Assets`
--

INSERT INTO `ourbank_Assets` (`Assets_id`, `office_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_id`, `credit`, `debit`, `record_status`) VALUES
(1, 4, 0, 20, 1, 1000.00, 0.00, 3),
(2, 4, 0, 19, 2, 0.00, 9500.00, 3),
(3, 4, 0, 21, 2, 0.00, 10000.00, 3),
(4, 4, 0, 19, 3, 0.00, 9500.00, 3),
(5, 4, 0, 21, 3, 0.00, 10000.00, 3),
(6, 4, 0, 20, 4, 500.00, 0.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_attendance`
--

CREATE TABLE IF NOT EXISTS `ourbank_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `week_no` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resolution` longtext COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_attendance`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_attendancetypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_attendancetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_attendancetypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_attendance_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_attendance_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `week_no` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resolution` longtext COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_attendance_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_category`
--

CREATE TABLE IF NOT EXISTS `ourbank_category` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_category`
--

INSERT INTO `ourbank_category` (`id`, `name`, `description`, `created_by`, `created_date`) VALUES
(1, 'Savings', 'For savings products', 1, '2011-09-13'),
(2, 'Loan', 'For loan products', 1, '2011-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_category_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_category_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_category_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_contact`
--

CREATE TABLE IF NOT EXISTS `ourbank_contact` (
  `submodule_id` mediumint(9) NOT NULL,
  `id` int(11) NOT NULL,
  `contact_person` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_contact`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_contact_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_contact_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` mediumint(9) NOT NULL,
  `id` int(11) NOT NULL,
  `contact_person` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_contact_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_cropdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_cropdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `land_id` int(50) NOT NULL,
  `season_id` int(50) NOT NULL,
  `acre` int(11) NOT NULL,
  `gunta` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `quantity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `marketed` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `realised` int(11) NOT NULL,
  `sold_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_cropdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_cropdetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_cropdetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `crop_id` int(11) NOT NULL,
  `land_id` int(50) NOT NULL,
  `season_id` int(50) NOT NULL,
  `acre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gunta` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `quantity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `marketed` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `realised` int(11) NOT NULL,
  `sold_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Dumping data for table `ourbank_cropdetails_log`
--

INSERT INTO `ourbank_cropdetails_log` (`record_id`, `id`, `submodule_id`, `family_id`, `crop_id`, `land_id`, `season_id`, `acre`, `gunta`, `unit`, `quantity`, `marketed`, `price`, `realised`, `sold_date`, `created_by`, `created_date`) VALUES
(1, 380, 0, 314, 2, 2, 4, '1', 0, 2, '2', '', 1.00, 0, '0000-00-00', 0, '2011-07-13 15:27:28'),
(2, 381, 0, 314, 1, 3, 4, '0', 20, 2, '3', '', 1.00, 0, '0000-00-00', 0, '2011-07-13 15:27:28'),
(3, 382, 0, 314, 3, 1, 4, '0', 20, 1, '5', '', 1.00, 0, '0000-00-00', 0, '2011-07-13 15:27:28'),
(4, 406, 0, 480, 2, 3, 4, '1', 0, 2, '1', '', 1.00, 0, '0000-00-00', 0, '2011-07-13 21:05:01'),
(5, 407, 0, 480, 1, 2, 4, '0', 20, 2, '1', '', 1.00, 0, '0000-00-00', 0, '2011-07-13 21:05:01'),
(6, 408, 0, 480, 3, 1, 4, '1', 0, 2, '2', '', 1.00, 0, '0000-00-00', 0, '2011-07-13 21:05:01'),
(7, 656, 0, 674, 2, 1, 2, '0', 30, 2, '5', '', 1.00, 0, '0000-00-00', 0, '2011-07-16 15:10:27'),
(8, 1063, 0, 1086, 2, 1, 1, '1', 0, 2, '40', '20', 1000.00, 0, '0000-00-00', 0, '2011-07-21 15:04:23'),
(9, 1315, 0, 1541, 2, 3, 1, '0', 30, 2, '2', '4000', 4000.00, 0, '0000-00-00', 0, '2011-07-25 18:54:28'),
(10, 1466, 0, 1744, 2, 1, 1, '2', 25, 2, '600', '', 0.00, 0, '0000-00-00', 0, '2011-07-27 20:00:49'),
(11, 1467, 0, 1744, 2, 1, 1, '2', 25, 2, '600', '', 0.00, 0, '0000-00-00', 0, '2011-07-27 20:02:46'),
(12, 1612, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:57:13'),
(13, 1613, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:49'),
(14, 1614, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:49'),
(15, 1615, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:50'),
(16, 1616, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:51'),
(17, 1617, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:51'),
(18, 1618, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:52'),
(19, 1619, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:52'),
(20, 1620, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:52'),
(21, 1621, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:53'),
(22, 1622, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:53'),
(23, 1623, 0, 1931, 3, 3, 3, '0', 28, 2, '2', '', 0.00, 0, '0000-00-00', 0, '2011-07-29 16:59:53'),
(24, 1871, 0, 2570, 4, 1, 1, '0', 20, 2, '5', '10000', 10000.00, 0, '0000-00-00', 0, '2011-08-02 20:45:58'),
(25, 2156, 0, 2977, 1, 1, 4, '1', 0, 2, '20', '30', 45.00, 0, '0000-00-00', 0, '2011-08-05 19:36:47'),
(26, 2157, 0, 2977, 1, 3, 4, '1', 0, 2, '10', '10', 78.00, 0, '0000-00-00', 0, '2011-08-05 19:36:47'),
(27, 2158, 0, 2977, 1, 1, 4, '1', 0, 2, '20', '30', 45.00, 0, '0000-00-00', 0, '2011-08-05 19:36:49'),
(28, 2159, 0, 2977, 1, 3, 4, '1', 0, 2, '10', '10', 78.00, 0, '0000-00-00', 0, '2011-08-05 19:36:49'),
(29, 2726, 0, 3848, 2, 1, 2, '0', 23, 2, '100', '', 0.00, 0, '0000-00-00', 0, '2011-08-12 21:04:52'),
(30, 2727, 0, 3848, 2, 1, 2, '1', 0, 0, '200', '', 0.00, 0, '0000-00-00', 0, '2011-08-12 21:04:52'),
(31, 2823, 0, 4075, 2, 1, 1, '1', 0, 2, '5', '', 850.00, 0, '0000-00-00', 0, '2011-08-14 16:55:59'),
(32, 2878, 0, 4185, 1, 1, 1, '1', 2, 1, '13', '', 0.00, 0, '0000-00-00', 0, '2011-08-15 16:53:31'),
(33, 2879, 0, 4185, 2, 3, 2, '1', 2, 2, '10', '', 0.00, 0, '0000-00-00', 0, '2011-08-15 16:53:31'),
(34, 2936, 0, 3722, 1, 2, 2, '1', 0, 2, '2', '', 800.00, 0, '0000-00-00', 0, '2011-08-16 14:36:28'),
(35, 3015, 0, 4431, 2, 4, 1, '1', 0, 2, '5', '', 850.00, 0, '0000-00-00', 0, '2011-08-17 14:09:49'),
(36, 3069, 0, 4499, 3, 3, 1, '1', 20, 2, '10', '', 7000.00, 0, '0000-00-00', 0, '2011-08-17 18:43:26'),
(37, 3962, 0, 5484, 3, 3, 1, '3', 2, 2, '15', '2', 5000.00, 0, '0000-00-00', 0, '2011-08-24 10:19:26'),
(38, 4120, 0, 5653, 3, 3, 1, '2', 0, 2, '5', '5', 6000.00, 0, '0000-00-00', 0, '2011-08-24 16:09:20'),
(39, 4749, 0, 6347, 3, 3, 3, '0', 3, 2, '5', '5', 5000.00, 0, '0000-00-00', 0, '2011-08-27 15:21:52'),
(40, 5311, 0, 7435, 2, 1, 1, '1', 0, 2, '1', '', 0.00, 0, '2011-09-03', 0, '2011-09-03 10:29:44'),
(41, 5312, 0, 7435, 1, 2, 4, '5', 0, 2, '1', '', 0.00, 0, '2011-09-03', 0, '2011-09-03 10:29:44'),
(42, 5365, 0, 7586, 3, 3, 2, '1', 15, 2, '1', '', 0.00, 0, '2011-09-03', 0, '2011-09-03 13:52:59'),
(43, 5366, 0, 7586, 3, 3, 2, '1', 15, 2, '1', '', 0.00, 0, '2011-09-03', 0, '2011-09-03 13:53:01'),
(44, 5614, 0, 8171, 2, 1, 2, '0', 30, 2, '5', '', 0.00, 0, '2011-09-06', 0, '2011-09-06 11:55:34'),
(45, 5641, 0, 8186, 2, 1, 2, '0', 30, 2, '5', '', 0.00, 0, '2011-09-06', 0, '2011-09-06 12:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_decision`
--

CREATE TABLE IF NOT EXISTS `ourbank_decision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_id` int(11) NOT NULL,
  `decision_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_decision`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_decision_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_decision_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `decision_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_decision_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_declaration`
--

CREATE TABLE IF NOT EXISTS `ourbank_declaration` (
  `id` int(50) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `son` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `period` int(4) NOT NULL,
  `names` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_declaration`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_declaration_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_declaration_log` (
  `id` int(50) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `son` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `period` int(4) NOT NULL,
  `names` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_declaration_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_discussion`
--

CREATE TABLE IF NOT EXISTS `ourbank_discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_discussion`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_discussion_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_discussion_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_discussion_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Expenditure`
--

CREATE TABLE IF NOT EXISTS `ourbank_Expenditure` (
  `Expenditure_id` int(10) NOT NULL AUTO_INCREMENT,
  `office_id` int(10) NOT NULL,
  `glsubcode_id_from` int(10) NOT NULL,
  `glsubcode_id_to` int(10) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `credit` float(10,2) NOT NULL,
  `debit` float(10,2) NOT NULL,
  `recordstatus_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`Expenditure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_Expenditure`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_expensedetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_expensedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_expensedetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_expensedetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_expensedetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_expensedetails_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_family`
--

CREATE TABLE IF NOT EXISTS `ourbank_family` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `family_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sujeevana` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `house_no` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(5) NOT NULL,
  `Koota_id` int(11) NOT NULL,
  `rev_village_id` int(11) NOT NULL,
  `mobile` double NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `familytype_id` int(5) NOT NULL,
  `minority_id` int(11) NOT NULL,
  `caste_id` int(5) NOT NULL,
  `subcaste_id` int(5) NOT NULL,
  `ration_id` int(5) NOT NULL,
  `nregs_jobno` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `income_id` int(5) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `family_id` (`family_id`),
  KEY `rev_village_id` (`rev_village_id`),
  KEY `Koota_id` (`Koota_id`),
  KEY `village_id` (`village_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_family`
--

INSERT INTO `ourbank_family` (`id`, `code`, `family_id`, `sujeevana`, `house_no`, `street`, `village_id`, `Koota_id`, `rev_village_id`, `mobile`, `phone`, `familytype_id`, `minority_id`, `caste_id`, `subcaste_id`, `ration_id`, `nregs_jobno`, `income_id`, `created_by`, `created_date`) VALUES
(1, '004000001', '', '128', '', '', 1, 3, 4, 867673883, '', 1, 1, 2, 0, 2, '', 2, 1, '2011-09-13 13:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familymember`
--

CREATE TABLE IF NOT EXISTS `ourbank_familymember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(10) NOT NULL,
  `familycode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `father_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_inregional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `alias_inregional` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `breadwinner_id` tinyint(1) NOT NULL DEFAULT '0',
  `head_id` tinyint(1) NOT NULL DEFAULT '0',
  `gender_id` tinyint(1) NOT NULL,
  `dob` date NOT NULL,
  `age` tinyint(2) NOT NULL,
  `relationship_id` tinyint(2) NOT NULL,
  `physicalstatus_id` tinyint(20) NOT NULL,
  `maritalstatus_id` tinyint(2) NOT NULL,
  `eductaion_id` tinyint(4) NOT NULL,
  `employment_status` int(11) NOT NULL,
  `promoter_id` int(11) NOT NULL,
  `cbo_id` int(11) NOT NULL,
  `accouttype_id` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `branch_po` int(11) NOT NULL,
  `bank_ac` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `blood_id` int(11) NOT NULL,
  `sign` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` blob NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `family_id` (`family_id`),
  KEY `village_id` (`village_id`),
  KEY `head_id` (`head_id`),
  KEY `breadwinner_id` (`breadwinner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_familymember`
--

INSERT INTO `ourbank_familymember` (`id`, `family_id`, `familycode`, `village_id`, `name`, `father_name`, `name_inregional`, `alias`, `alias_inregional`, `uid`, `breadwinner_id`, `head_id`, `gender_id`, `dob`, `age`, `relationship_id`, `physicalstatus_id`, `maritalstatus_id`, `eductaion_id`, `employment_status`, `promoter_id`, `cbo_id`, `accouttype_id`, `bank`, `branch_po`, `bank_ac`, `blood_id`, `sign`, `mobile_number`, `photo`, `created_by`, `created_date`) VALUES
(1, 1, '00401000001', 4, 'Sundar', '', '', 'Sundar', '', '', 1, 1, 1, '1954-09-13', 57, 19, 0, 1, 2, 3, 1, 1, 4, 1, 1, '', 8, '0', '', '', 1, '2011-09-13 13:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familymember_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_familymember_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `family_id` int(10) NOT NULL,
  `familycode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `father_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_inregional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `alias_inregional` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `breadwinner_id` tinyint(1) NOT NULL DEFAULT '0',
  `head_id` tinyint(1) NOT NULL DEFAULT '0',
  `gender_id` tinyint(1) NOT NULL,
  `dob` date NOT NULL,
  `age` tinyint(2) NOT NULL,
  `relationship_id` tinyint(2) NOT NULL,
  `physicalstatus_id` tinyint(20) NOT NULL,
  `maritalstatus_id` tinyint(2) NOT NULL,
  `eductaion_id` tinyint(4) NOT NULL,
  `employment_status` int(11) NOT NULL,
  `promoter_id` int(11) NOT NULL,
  `cbo_id` int(11) NOT NULL,
  `accouttype_id` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `branch_po` int(11) NOT NULL,
  `bank_ac` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `blood_id` int(11) NOT NULL,
  `sign` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` blob NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_familymember_log`
--

INSERT INTO `ourbank_familymember_log` (`record_id`, `id`, `family_id`, `familycode`, `village_id`, `name`, `father_name`, `name_inregional`, `alias`, `alias_inregional`, `uid`, `breadwinner_id`, `head_id`, `gender_id`, `dob`, `age`, `relationship_id`, `physicalstatus_id`, `maritalstatus_id`, `eductaion_id`, `employment_status`, `promoter_id`, `cbo_id`, `accouttype_id`, `bank`, `branch_po`, `bank_ac`, `blood_id`, `sign`, `mobile_number`, `photo`, `created_by`, `created_date`) VALUES
(1, 1, 1, '00401000001', 4, 'Balaji', '', '', 'Balaji', '', '', 1, 1, 1, '1956-09-09', 55, 5, 0, 1, 1, 1, 1, 1, 4, 1, 1, '', 8, '', '', '', 1, '2011-09-09 17:51:39'),
(2, 2, 2, '00401000002', 4, 'Hari', '', '', 'Hari', '', '', 1, 1, 1, '1956-09-09', 55, 16, 0, 1, 2, 1, 1, 1, 4, 1, 1, '', 8, '0', '', '', 1, '2011-09-09 18:07:57');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_family_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_family_log` (
  `record_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `code` int(16) NOT NULL,
  `family_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sujeevana` int(11) NOT NULL,
  `house_no` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(5) NOT NULL,
  `Koota_id` int(11) NOT NULL,
  `rev_village_id` int(11) NOT NULL,
  `mobile` double NOT NULL,
  `phone` double NOT NULL,
  `familytype_id` int(5) NOT NULL,
  `minority_id` int(11) NOT NULL,
  `caste_id` int(5) NOT NULL,
  `subcaste_id` int(5) NOT NULL,
  `ration_id` int(5) NOT NULL,
  `health_ins_id` int(5) NOT NULL,
  `nregs_jobno` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `income_id` int(5) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_family_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_fee`
--

CREATE TABLE IF NOT EXISTS `ourbank_fee` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `hierarchy_id` int(50) NOT NULL,
  `category_id` smallint(50) NOT NULL,
  `feetype_id` int(50) NOT NULL,
  `glsubcode_id` int(20) NOT NULL,
  `amountype_id` int(50) NOT NULL,
  `created_by` int(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_fee`
--

INSERT INTO `ourbank_fee` (`id`, `name`, `description`, `value`, `hierarchy_id`, `category_id`, `feetype_id`, `glsubcode_id`, `amountype_id`, `created_by`, `created_date`) VALUES
(1, 'Registration', 'for Registration', 5.00, 3, 0, 1, 27, 2, 1, '2011-09-13 13:01:54'),
(2, 'service charge', 'for service charge', 2.00, 3, 2, 2, 28, 2, 1, '2011-09-13 13:02:24');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_feeamounttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_feeamounttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_feeamounttypes`
--

INSERT INTO `ourbank_feeamounttypes` (`id`, `name`) VALUES
(1, 'Flat'),
(2, 'Percentage');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_feetype`
--

CREATE TABLE IF NOT EXISTS `ourbank_feetype` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_feetype`
--

INSERT INTO `ourbank_feetype` (`id`, `name`) VALUES
(1, 'Registration fee'),
(2, 'Service fee');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_fee_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_fee_log` (
  `record_id` int(50) NOT NULL AUTO_INCREMENT,
  `id` int(50) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `hierarchy_id` int(50) NOT NULL,
  `category_id` smallint(50) NOT NULL,
  `feetype_id` int(50) NOT NULL,
  `amountype_id` int(50) NOT NULL,
  `glsubcode_id` int(11) NOT NULL,
  `created_by` int(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_fee_log`
--

INSERT INTO `ourbank_fee_log` (`record_id`, `id`, `name`, `description`, `value`, `hierarchy_id`, `category_id`, `feetype_id`, `amountype_id`, `glsubcode_id`, `created_by`, `created_date`) VALUES
(1, 2, 'service fee', 'fee for service', 7.00, 2, 2, 2, 1, 24, 1, '2011-06-10 04:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_fixedaccounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_fixedaccounts` (
  `fixedaccount_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `mature_date` date NOT NULL,
  `fixed_amount` float(10,2) NOT NULL,
  `timefrequncy_id` smallint(5) NOT NULL,
  `fixed_interest` float(5,2) NOT NULL,
  `premature_interest` float(5,2) NOT NULL,
  `fixedaccountstatus_id` tinyint(1) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`fixedaccount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_fixedaccounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_fixed_payment`
--

CREATE TABLE IF NOT EXISTS `ourbank_fixed_payment` (
  `fixed_paymentserial_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `fixed_paymentpaid_date` date NOT NULL,
  `fixed_amount` float(10,2) NOT NULL,
  `fixed_interst_amount` float(10,2) NOT NULL,
  `fixed_penalty_amount` float(10,2) NOT NULL,
  `fixed_other_deduction_amount` float(10,2) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`fixed_paymentserial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_fixed_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_funder`
--

CREATE TABLE IF NOT EXISTS `ourbank_funder` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(2) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `glcode_id` int(20) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_funder`
--

INSERT INTO `ourbank_funder` (`id`, `code`, `type`, `name`, `glcode_id`, `status`, `created_by`, `created_date`) VALUES
(1, '0', 1, 'Vijayan', 16, '0', 1, '2011-09-13 12:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_funder_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_funder_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `type` int(2) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `glcode_id` int(50) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ob_funders' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_funder_log`
--

INSERT INTO `ourbank_funder_log` (`record_id`, `id`, `type`, `name`, `code`, `glcode_id`, `status`, `created_by`, `created_date`) VALUES
(1, 1, 2, 'IDBI', '0', 14, '1', NULL, '2011-06-10 03:37:08'),
(2, 1, 1, 'IDBI', '0', 14, '1', NULL, '2011-06-10 03:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_funding`
--

CREATE TABLE IF NOT EXISTS `ourbank_funding` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `institution_id` int(10) NOT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `glsubcode_id` int(11) NOT NULL,
  `interest` int(50) NOT NULL,
  `exchangerate` decimal(10,2) NOT NULL,
  `accounting_line` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `beginingdate` date NOT NULL,
  `closingdate` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_funding`
--

INSERT INTO `ourbank_funding` (`id`, `name`, `funder_id`, `institution_id`, `currency_id`, `amount`, `glsubcode_id`, `interest`, `exchangerate`, `accounting_line`, `recordstatus_id`, `beginingdate`, `closingdate`, `created_by`, `created_date`) VALUES
(1, 'Meenatchi', 1, 0, 1, 1000.00, 25, 5, 50.00, 0, 0, '2011-01-01', '2020-09-13', 1, '2011-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_funding_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_funding_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `institution_id` int(10) NOT NULL,
  `intrest` int(10) NOT NULL,
  `currency_id` int(5) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `exchangerate` decimal(10,2) NOT NULL,
  `glsubcode_id` int(50) NOT NULL,
  `interest` int(11) NOT NULL,
  `accounting_line` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `beginingdate` date NOT NULL,
  `closingdate` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_funding_log`
--

INSERT INTO `ourbank_funding_log` (`record_id`, `id`, `name`, `funder_id`, `institution_id`, `intrest`, `currency_id`, `amount`, `exchangerate`, `glsubcode_id`, `interest`, `accounting_line`, `recordstatus_id`, `beginingdate`, `closingdate`, `created_by`, `created_date`) VALUES
(1, 1, 'ramzan', 1, 0, 0, 4, 90.00, 2.00, 50, 8, 0, 0, '2011-06-01', '2011-06-16', 1, '2011-06-09'),
(2, 1, 'ramzan', 1, 0, 0, 6, 90.00, 2.00, 50, 8, 0, 0, '2011-06-01', '2011-06-16', 1, '2011-06-09'),
(3, 2, 'mahiti', 1, 0, 0, 7, 500.00, 23.00, 2, 8, 0, 0, '2011-06-06', '2011-06-14', 1, '2011-06-14'),
(4, 1, 'Meenatchi', 1, 0, 0, 1, 1000.00, 50.00, 25, 5, 0, 0, '2011-09-13', '2020-09-13', 1, '2011-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_glcode`
--

CREATE TABLE IF NOT EXISTS `ourbank_glcode` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `glcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ledgertype_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `header` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ourbank_glcode`
--

INSERT INTO `ourbank_glcode` (`id`, `glcode`, `ledgertype_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 'A01000', '3', 'Bank', 'Bank', 1, '2011-09-08 13:32:53'),
(2, 'A02000', '3', 'Cash', 'Cash', 1, '2011-09-08 13:32:53'),
(3, 'A03000', '3', 'Loans', 'Loans', 1, '2011-09-08 13:32:53'),
(4, 'L01000', '4', 'Savings', 'Savings', 1, '2011-09-08 13:32:53'),
(5, 'I01000', '1', 'Interest', 'Interest', 1, '2011-09-08 13:32:53'),
(6, 'I02000', '1', 'Fee', 'Fee', 1, '2011-09-08 13:32:53'),
(7, 'I03000', '1', 'SrvChrg', 'ServiceCharge', 1, '2011-09-08 13:32:53'),
(8, 'I04000', '1', 'Penalty', 'Penalty', 1, '2011-09-08 13:32:53'),
(9, 'I05000', '1', 'IntOnLoan', 'InterestOnLoans', 1, '2011-09-08 13:32:53'),
(10, 'E01000', '2', 'MeetingExpenses', 'MeetingExpenses', 1, '2011-09-08 13:32:53'),
(11, 'E02000', '2', 'OtherExpenses', 'OtherExpenses', 1, '2011-09-08 13:32:53'),
(12, 'E03000', '2', 'IntOnSavings', 'InterestOnSavings', 1, '2011-09-08 13:32:53'),
(13, 'A04000', '3', 'loan', 'for loan', 1, '2011-09-08 00:00:00'),
(14, 'L02000', '4', 'Vijayan', 'Vijayan', 1, '2011-09-09 17:39:59'),
(15, 'L01000', '4', 'recurring deposit', 'recurring deposit', 1, '2011-09-09 17:57:56'),
(16, 'L02000', '4', 'Vijayan', 'Vijayan', 1, '2011-09-13 12:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_glcode_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_glcode_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(5) NOT NULL,
  `glcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ledgertype_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `header` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_glcode_log`
--

INSERT INTO `ourbank_glcode_log` (`record_id`, `id`, `glcode`, `ledgertype_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 1, 'A01000', '3', 'Bank', 'Bank in assets', 1, '2011-02-10 23:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_glsubcode`
--

CREATE TABLE IF NOT EXISTS `ourbank_glsubcode` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) NOT NULL,
  `glsubcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `glcode_id` int(5) NOT NULL,
  `subledger_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `header` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `ourbank_glsubcode`
--

INSERT INTO `ourbank_glsubcode` (`id`, `office_id`, `glsubcode`, `glcode_id`, `subledger_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 1, 'A01001', 1, '3', 'bank1', 'bank1', 1, '2011-09-13'),
(2, 1, 'A02001', 2, '3', 'cash1', 'cash1', 1, '2011-09-13'),
(3, 1, 'A03001', 3, '3', 'loans1', 'loans1', 1, '2011-09-13'),
(4, 1, 'L01001', 4, '4', 'savings1', 'savings1', 1, '2011-09-13'),
(5, 1, 'I01001', 5, '1', 'interest1', 'interest1', 1, '2011-09-13'),
(6, 1, 'I02001', 6, '1', 'fee1', 'fee1', 1, '2011-09-13'),
(7, 2, 'A01002', 1, '3', 'bank2', 'bank2', 1, '2011-09-13'),
(8, 2, 'A02002', 2, '3', 'cash2', 'cash2', 1, '2011-09-13'),
(9, 2, 'A03002', 3, '3', 'loans2', 'loans2', 1, '2011-09-13'),
(10, 2, 'L01002', 4, '4', 'savings2', 'savings2', 1, '2011-09-13'),
(11, 2, 'I01002', 5, '1', 'interest2', 'interest2', 1, '2011-09-13'),
(12, 2, 'I02002', 6, '1', 'fee2', 'fee2', 1, '2011-09-13'),
(13, 3, 'A01003', 1, '3', 'bank3', 'bank3', 1, '2011-09-13'),
(14, 3, 'A02003', 2, '3', 'cash3', 'cash3', 1, '2011-09-13'),
(15, 3, 'A03003', 3, '3', 'loans3', 'loans3', 1, '2011-09-13'),
(16, 3, 'L01003', 4, '4', 'savings3', 'savings3', 1, '2011-09-13'),
(17, 3, 'I01003', 5, '1', 'interest3', 'interest3', 1, '2011-09-13'),
(18, 3, 'I02003', 6, '1', 'fee3', 'fee3', 1, '2011-09-13'),
(19, 4, 'A01004', 1, '3', 'bank4', 'bank4', 1, '2011-09-13'),
(20, 4, 'A02004', 2, '3', 'cash4', 'cash4', 1, '2011-09-13'),
(21, 4, 'A03004', 3, '3', 'loans4', 'loans4', 1, '2011-09-13'),
(22, 4, 'L01004', 4, '4', 'savings4', 'savings4', 1, '2011-09-13'),
(23, 4, 'I01004', 5, '1', 'interest4', 'interest4', 1, '2011-09-13'),
(24, 4, 'I02004', 6, '1', 'fee4', 'fee4', 1, '2011-09-13'),
(25, 1, 'L02001', 16, '4', 'Meenatchi', 'Meenatchi', 1, '2011-09-13'),
(26, 0, 'A03005', 3, '3', 'Agri loan', 'for Agriculture loan', 1, '2011-09-13'),
(27, 3, 'L02002', 16, '4', 'Registration', 'for Registration', 1, '0000-00-00'),
(28, 3, 'L02003', 16, '4', 'service charge', 'for service charge', 1, '0000-00-00'),
(29, 4, 'L01001', 15, '4', 'Absense', 'Penalty for absense', 1, '2011-09-13'),
(30, 4, 'L01002', 15, '4', 'Late', 'Penalty for late', 1, '2011-09-13'),
(31, 0, 'A03006', 3, '3', 'Seeds loan', 'for seeds loan', 1, '2011-09-13'),
(32, 1, 'L001', 4, '4', 'Savings', 'Savings', 1, '2011-09-13'),
(33, 0, 'L001', 0, '', 'Fixed Savings', 'for fixed savings', 1, '2011-09-13'),
(34, 0, 'L01003', 15, '15', 'Recurring Savings', 'for Recurring Savings', 1, '2011-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_glsubcode_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_glsubcode_log` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `office_id` int(11) NOT NULL,
  `glsubcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `glcode_id` int(5) NOT NULL,
  `subledger_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `header` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_glsubcode_log`
--

INSERT INTO `ourbank_glsubcode_log` (`id`, `office_id`, `glsubcode`, `glcode_id`, `subledger_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 7, 'A01007', 1, '3', 'Bank7', 'Bank7', 1, '2011-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grant`
--

CREATE TABLE IF NOT EXISTS `ourbank_grant` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_grant`
--

INSERT INTO `ourbank_grant` (`id`, `name`, `created_date`, `created_by`) VALUES
(1, 'administrator', '2011-06-07 20:48:44', '1'),
(2, 'Clerk', '2011-06-22 04:59:00', '1'),
(3, 'Block officer', '2011-06-22 04:59:20', '1'),
(4, 'Asst Manager', '2011-06-22 04:59:53', '1'),
(5, 'Manager', '2011-06-22 05:00:19', '1'),
(6, 'Testing', '2011-06-22 05:05:26', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grantactivity`
--

CREATE TABLE IF NOT EXISTS `ourbank_grantactivity` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `grant_id` smallint(5) NOT NULL,
  `module_id` int(10) NOT NULL,
  `add` tinyint(4) NOT NULL,
  `edit` tinyint(4) NOT NULL,
  `view` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Both fields combined together for a primary key' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_grantactivity`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grantactivity_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_grantactivity_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `grant_id` smallint(5) NOT NULL,
  `module_id` int(10) NOT NULL,
  `add` tinyint(4) NOT NULL,
  `edit` tinyint(4) NOT NULL,
  `view` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Both fields combined together for a primary key' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_grantactivity_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grant_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_grant_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` date NOT NULL,
  `created_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_grant_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group`
--

CREATE TABLE IF NOT EXISTS `ourbank_group` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(6) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `head` mediumint(9) NOT NULL,
  `saving_perweek` int(11) NOT NULL,
  `penalty_latecoming` int(11) NOT NULL,
  `penalty_notcoming` int(11) NOT NULL,
  `late_subglcode` int(11) NOT NULL,
  `absent_subglcode` int(11) NOT NULL,
  `place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `days` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `rateinterest` int(11) NOT NULL,
  `groupcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `group_created_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `village_id` (`village_id`),
  KEY `bank_id` (`bank_id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_group`
--

INSERT INTO `ourbank_group` (`id`, `village_id`, `bank_id`, `branch_id`, `name`, `head`, `saving_perweek`, `penalty_latecoming`, `penalty_notcoming`, `late_subglcode`, `absent_subglcode`, `place`, `time`, `days`, `rateinterest`, `groupcode`, `latitude`, `longitude`, `group_created_date`, `created_by`, `created_date`) VALUES
(1, 4, 1, 1, 'Prince JLG', 1, 20, 5, 5, 29, 30, 'Temple', '08:30:00', '1', 22, '00403000001', 0, 0, '2011-09-13', 1, '2011-09-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grouploan_disbursement`
--

CREATE TABLE IF NOT EXISTS `ourbank_grouploan_disbursement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `disbursement_date` date NOT NULL,
  `transacted_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loanamount` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_grouploan_disbursement`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grouploan_repayment`
--

CREATE TABLE IF NOT EXISTS `ourbank_grouploan_repayment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `member_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `installment_number` smallint(5) NOT NULL,
  `installmentpaid_date` date NOT NULL,
  `installmentpaid_amount` float(10,2) NOT NULL,
  `loaninstallmentpaid_interst` float(10,2) NOT NULL,
  `installmentpaid_other_amount` float(10,2) NOT NULL,
  `installmentpaid_mode` smallint(5) NOT NULL,
  `installmentpaid_details` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_grouploan_repayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_groupmembers`
--

CREATE TABLE IF NOT EXISTS `ourbank_groupmembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `groupmember_status` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_groupmembers`
--

INSERT INTO `ourbank_groupmembers` (`id`, `group_id`, `member_id`, `groupmember_status`) VALUES
(1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_groupmembers_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_groupmembers_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `group_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `groupmember_status` smallint(5) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `ourbank_groupmembers_log`
--

INSERT INTO `ourbank_groupmembers_log` (`record_id`, `id`, `group_id`, `member_id`, `groupmember_status`) VALUES
(1, 23, 3, 209, 3),
(2, 24, 3, 179, 3),
(3, 25, 3, 207, 3),
(4, 26, 3, 232, 3),
(5, 27, 3, 249, 3),
(6, 28, 3, 254, 3),
(7, 29, 3, 261, 3),
(8, 30, 3, 269, 3),
(9, 31, 3, 270, 3),
(10, 32, 3, 283, 3),
(11, 33, 3, 284, 3),
(12, 34, 3, 302, 3),
(13, 35, 3, 308, 3),
(14, 36, 3, 469, 3),
(15, 82, 7, 8, 3),
(16, 83, 8, 13558, 3),
(17, 84, 8, 13559, 3),
(18, 85, 8, 13560, 3),
(19, 86, 8, 13561, 3),
(20, 87, 8, 13562, 3),
(21, 88, 8, 13563, 3),
(22, 89, 8, 13659, 3),
(23, 90, 8, 13666, 3),
(24, 91, 8, 13810, 3),
(25, 92, 8, 13825, 3),
(26, 93, 8, 13831, 3),
(27, 94, 8, 13886, 3),
(28, 188, 16, 16832, 3),
(29, 189, 16, 16841, 3),
(30, 190, 16, 16847, 3),
(31, 191, 16, 16848, 3),
(32, 192, 16, 16871, 3),
(33, 193, 16, 16873, 3),
(34, 194, 16, 16914, 3),
(35, 195, 16, 16924, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_grouppenalty_transaction`
--

CREATE TABLE IF NOT EXISTS `ourbank_grouppenalty_transaction` (
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `amount_to_bank` float(10,2) NOT NULL,
  `amount_from_bank` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_grouppenalty_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_acccounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_acccounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `product_id` smallint(5) NOT NULL,
  `status` smallint(5) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group_acccounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_fixedtransaction`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_fixedtransaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` smallint(5) NOT NULL,
  `transaction_amount` float(10,2) NOT NULL,
  `transaction_interest` float(10,2) NOT NULL,
  `transaction_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group_fixedtransaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` mediumint(9) NOT NULL,
  `village_id` smallint(6) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `head` mediumint(9) NOT NULL,
  `saving_perweek` int(11) NOT NULL,
  `penalty_latecoming` int(11) NOT NULL,
  `penalty_notcoming` int(11) NOT NULL,
  `late_subglcode` int(11) NOT NULL,
  `absent_subglcode` int(11) NOT NULL,
  `place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `days` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `rateinterest` int(11) NOT NULL,
  `groupcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `group_created_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_group_log`
--

INSERT INTO `ourbank_group_log` (`record_id`, `id`, `village_id`, `bank_id`, `branch_id`, `name`, `head`, `saving_perweek`, `penalty_latecoming`, `penalty_notcoming`, `late_subglcode`, `absent_subglcode`, `place`, `time`, `days`, `rateinterest`, `groupcode`, `latitude`, `longitude`, `group_created_date`, `created_by`, `created_date`) VALUES
(1, 3, 91, 17, 23, 'shree laxmi Narasimha JLG', 179, 10, 0, 5, 2, 3, 'lord siva temple', '08:00:00', '5', 22, '09103000003', 13.2915594684289, 76.9259341430663, '2011-07-07', 1, '2011-05-19 09:30:00'),
(2, 7, 56, 1, 1, 'test1', 8, 1000, 1, 1, 1891, 1892, 'Temple', '08:45:00', '1', 1, '05602000007', 0, 0, '2011-08-10', 1, '2011-07-20 09:30:00'),
(3, 8, 347, 820, 672, 'Gramadevathe', 13558, 10, 5, 5, 1891, 1892, 'Hosuru', '00:00:08', '7', 2, '34702000008', 0, 0, '2011-08-17', 1, '2011-04-17 09:30:00'),
(4, 16, 347, 820, 672, 'Shree sidhalingeshwara JLG', 16832, 10, 5, 5, 1891, 1892, 'Hosuru', '00:00:08', '1', 2, '34703000016', 0, 0, '2011-08-18', 1, '2010-05-03 09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_recurringtransaction`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_recurringtransaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` smallint(5) NOT NULL,
  `transaction_amount` float(10,2) NOT NULL,
  `transaction_interest` float(10,2) NOT NULL,
  `transaction_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group_recurringtransaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_representatives`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_representatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL,
  `representative_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_group_representatives`
--

INSERT INTO `ourbank_group_representatives` (`id`, `group_id`, `representative_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_representatives_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_representatives_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `group_id` int(10) NOT NULL,
  `representative_id` int(10) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group_representatives_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_savingstransaction`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_savingstransaction` (
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` smallint(5) NOT NULL,
  `transaction_amount` float(10,2) NOT NULL,
  `transaction_interest` float(10,2) NOT NULL,
  `transacted_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_group_savingstransaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_healthdiseasedetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_healthdiseasedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `healthdisease` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_healthdiseasedetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_healthdiseasedetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_healthdiseasedetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `healthdisease` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_healthdiseasedetails_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_healthhabitdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_healthhabitdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `habit_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_healthhabitdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_healthhabitdetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_healthhabitdetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `habit_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_healthhabitdetails_log`
--

INSERT INTO `ourbank_healthhabitdetails_log` (`record_id`, `id`, `submodule_id`, `family_id`, `member_id`, `habit_id`, `created_by`, `created_date`) VALUES
(1, 66, 17, 224, 8, 1, 1, '2011-07-09 01:55:38'),
(2, 94, 17, 295, 1, 4, 1, '2011-07-10 02:29:26'),
(3, 95, 17, 295, 1, 4, 1, '2011-07-10 02:29:26'),
(4, 96, 17, 295, 1, 4, 1, '2011-07-10 02:29:26'),
(5, 807, 17, 5529, 2, 5, 1, '2011-08-24 21:21:04'),
(6, 1042, 17, 7865, 2, 5, 1, '2011-09-04 23:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_healthphychallenge`
--

CREATE TABLE IF NOT EXISTS `ourbank_healthphychallenge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `phychallenge_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_healthphychallenge`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_healthphychallenge_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_healthphychallenge_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `phychallenge_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_healthphychallenge_log`
--

INSERT INTO `ourbank_healthphychallenge_log` (`record_id`, `id`, `submodule_id`, `family_id`, `member_id`, `phychallenge_id`, `created_by`, `created_date`) VALUES
(1, 15, 17, 295, 1, 4, 1, '2011-07-10 02:29:26'),
(2, 126, 17, 5310, 1, 7, 1, '2011-08-23 22:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_health_problem`
--

CREATE TABLE IF NOT EXISTS `ourbank_health_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `health_problem` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_health_problem`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_hoblies`
--

CREATE TABLE IF NOT EXISTS `ourbank_hoblies` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_hoblies`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_holiday`
--

CREATE TABLE IF NOT EXISTS `ourbank_holiday` (
  `id` smallint(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `office_id` smallint(50) NOT NULL,
  `holiday_from` date NOT NULL,
  `holiday_upto` date NOT NULL,
  `repayment_date` date NOT NULL,
  `created_by` smallint(50) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_holiday`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_holiday_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_holiday_log` (
  `record_id` smallint(50) NOT NULL AUTO_INCREMENT,
  `id` smallint(50) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `office_id` smallint(50) NOT NULL,
  `holiday_from` date NOT NULL,
  `holiday_upto` date NOT NULL,
  `repayment_date` date NOT NULL,
  `created_by` smallint(50) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_holiday_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Income`
--

CREATE TABLE IF NOT EXISTS `ourbank_Income` (
  `Income_id` int(10) NOT NULL AUTO_INCREMENT,
  `office_id` int(10) NOT NULL,
  `glsubcode_id_from` int(10) NOT NULL,
  `glsubcode_id_to` int(10) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `credit` float(10,2) NOT NULL,
  `debit` float(10,2) NOT NULL,
  `recordstatus_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`Income_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_Income`
--

INSERT INTO `ourbank_Income` (`Income_id`, `office_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_id`, `credit`, `debit`, `recordstatus_id`) VALUES
(1, 4, 0, 27, 2, 500.00, 0.00, 3),
(2, 4, 0, 24, 2, 500.00, 0.00, 3),
(3, 4, 0, 27, 3, 500.00, 0.00, 3),
(4, 4, 0, 24, 3, 500.00, 0.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_incomedetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_incomedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `income_id` int(11) NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_incomedetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_incomedetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_incomedetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `income_id` int(11) NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=338 ;

--
-- Dumping data for table `ourbank_incomedetails_log`
--

INSERT INTO `ourbank_incomedetails_log` (`record_id`, `id`, `submodule_id`, `member_id`, `income_id`, `value`, `created_by`, `created_date`) VALUES
(1, 26, 17, 21, 1, '1000', 1, '2011-07-06 02:42:39'),
(2, 27, 17, 21, 2, '6000', 1, '2011-07-06 02:42:39'),
(3, 28, 17, 21, 3, '2000', 1, '2011-07-06 02:42:39'),
(4, 29, 17, 21, 4, '25000', 1, '2011-07-06 02:42:39'),
(5, 30, 17, 21, 7, '10000', 1, '2011-07-06 02:42:39'),
(6, 70, 17, 51, 4, '160000', 1, '2011-07-07 00:15:46'),
(7, 71, 17, 51, 10, '5000', 1, '2011-07-07 00:15:46'),
(8, 212, 17, 124, 2, '25000', 1, '2011-07-07 20:47:27'),
(9, 213, 17, 124, 4, '20000', 1, '2011-07-07 20:47:27'),
(10, 214, 17, 124, 9, '40000', 1, '2011-07-07 20:47:27'),
(11, 245, 17, 130, 9, '40000', 1, '2011-07-07 21:28:56'),
(12, 246, 17, 130, 12, '100000', 1, '2011-07-07 21:28:56'),
(13, 247, 17, 130, 9, '400000', 1, '2011-07-07 21:29:33'),
(14, 248, 17, 130, 12, '100000', 1, '2011-07-07 21:29:33'),
(15, 252, 17, 130, 9, '400000', 1, '2011-07-07 21:30:41'),
(16, 253, 17, 130, 12, '100000', 1, '2011-07-07 21:30:41'),
(17, 278, 17, 140, 9, '10000', 1, '2011-07-07 22:33:07'),
(18, 279, 17, 140, 9, '70000', 1, '2011-07-07 22:33:39'),
(19, 420, 17, 187, 9, '70000', 1, '2011-07-08 02:42:23'),
(20, 421, 17, 187, 11, '13', 1, '2011-07-08 02:42:23'),
(21, 422, 17, 187, 9, '70000', 1, '2011-07-08 02:43:31'),
(22, 423, 17, 187, 11, '13', 1, '2011-07-08 02:43:31'),
(23, 624, 17, 245, 2, '20000', 1, '2011-07-09 20:58:03'),
(24, 625, 17, 245, 5, '5000', 1, '2011-07-09 20:58:03'),
(25, 626, 17, 245, 7, '2000', 1, '2011-07-09 20:58:03'),
(26, 627, 17, 245, 12, '1000', 1, '2011-07-09 20:58:03'),
(27, 1033, 17, 364, 9, '4000', 1, '2011-07-12 20:40:48'),
(28, 1034, 17, 364, 10, '16000', 1, '2011-07-12 20:40:48'),
(29, 1035, 17, 364, 11, '5000', 1, '2011-07-12 20:40:48'),
(30, 1307, 17, 477, 2, '10000', 1, '2011-07-14 02:36:53'),
(31, 1308, 17, 477, 3, '5000', 1, '2011-07-14 02:36:53'),
(32, 1309, 17, 477, 5, '12000', 1, '2011-07-14 02:36:53'),
(33, 1310, 17, 477, 9, '4000', 1, '2011-07-14 02:36:53'),
(34, 1390, 17, 506, 4, '5000', 1, '2011-07-14 21:45:58'),
(35, 1451, 17, 524, 9, '6000', 1, '2011-07-15 00:07:22'),
(36, 1452, 17, 524, 10, '6000', 1, '2011-07-15 00:07:22'),
(37, 1453, 17, 524, 12, '6000', 1, '2011-07-15 00:07:22'),
(38, 1531, 17, 542, 1, '25000', 1, '2011-07-15 02:00:33'),
(39, 1532, 17, 542, 2, '6000', 1, '2011-07-15 02:00:33'),
(40, 1533, 17, 542, 3, '10000', 1, '2011-07-15 02:00:33'),
(41, 1674, 17, 572, 1, '15000', 1, '2011-07-15 20:49:12'),
(42, 1675, 17, 572, 2, '10000', 1, '2011-07-15 20:49:12'),
(43, 1676, 17, 572, 3, '5000', 1, '2011-07-15 20:49:12'),
(44, 1677, 17, 572, 4, '10000', 1, '2011-07-15 20:49:12'),
(45, 1678, 17, 572, 5, '3000', 1, '2011-07-15 20:49:12'),
(46, 1679, 17, 572, 6, '4000', 1, '2011-07-15 20:49:12'),
(47, 1897, 17, 623, 1, '6', 1, '2011-07-16 01:01:52'),
(48, 1898, 17, 623, 1, '6', 1, '2011-07-16 01:01:52'),
(49, 2106, 17, 692, 9, '20000', 1, '2011-07-16 21:45:20'),
(50, 2107, 17, 692, 11, '1000', 1, '2011-07-16 21:45:20'),
(51, 2809, 17, 967, 2, '10000', 1, '2011-07-20 21:18:21'),
(52, 2810, 17, 967, 4, '25000', 1, '2011-07-20 21:18:21'),
(53, 2835, 17, 978, 12, '65000', 1, '2011-07-20 21:57:09'),
(54, 3218, 17, 1083, 1, '7000', 1, '2011-07-21 20:17:24'),
(55, 3219, 17, 1083, 2, '3', 1, '2011-07-21 20:17:24'),
(56, 3220, 17, 1083, 3, '00', 1, '2011-07-21 20:17:24'),
(57, 3221, 17, 1083, 1, '7000', 1, '2011-07-21 20:17:24'),
(58, 3222, 17, 1083, 2, '3', 1, '2011-07-21 20:17:24'),
(59, 3223, 17, 1083, 3, '00', 1, '2011-07-21 20:17:24'),
(60, 3539, 17, 1141, 9, '4000', 1, '2011-07-22 03:17:25'),
(61, 3608, 17, 1239, 9, '10000', 1, '2011-07-22 22:41:28'),
(62, 3609, 17, 1239, 11, '10000', 1, '2011-07-22 22:41:28'),
(63, 3654, 17, 1265, 9, '4000', 1, '2011-07-23 00:47:27'),
(64, 3655, 17, 1265, 10, '50000', 1, '2011-07-23 00:47:27'),
(65, 4020, 17, 1471, 9, '20000', 1, '2011-07-25 20:47:29'),
(66, 4021, 17, 1471, 10, '10000', 1, '2011-07-25 20:47:29'),
(67, 4022, 17, 1471, 12, '5000', 1, '2011-07-25 20:47:29'),
(68, 4023, 17, 1471, 9, '20000', 1, '2011-07-25 20:48:00'),
(69, 4024, 17, 1471, 10, '10000', 1, '2011-07-25 20:48:00'),
(70, 4025, 17, 1471, 12, '5000', 1, '2011-07-25 20:48:00'),
(71, 4537, 17, 1681, 4, '25000', 1, '2011-07-27 23:12:02'),
(72, 4538, 17, 1681, 5, '20000', 1, '2011-07-27 23:12:03'),
(73, 4539, 17, 1681, 12, '5000', 1, '2011-07-27 23:12:04'),
(74, 4540, 17, 1681, 4, '25000', 1, '2011-07-27 23:12:43'),
(75, 4541, 17, 1681, 5, '20000', 1, '2011-07-27 23:12:43'),
(76, 4542, 17, 1681, 12, '5000', 1, '2011-07-27 23:12:43'),
(77, 4805, 17, 1796, 2, '15000', 1, '2011-07-28 02:48:55'),
(78, 4806, 17, 1796, 3, '25000', 1, '2011-07-28 02:48:55'),
(79, 4807, 17, 1796, 4, '30000', 1, '2011-07-28 02:48:55'),
(80, 4808, 17, 1796, 7, '10000', 1, '2011-07-28 02:48:55'),
(81, 4809, 17, 1796, 11, '10000', 1, '2011-07-28 02:48:55'),
(82, 4842, 17, 1811, 1, '5000', 1, '2011-07-28 03:14:57'),
(83, 4843, 17, 1811, 2, '15000', 1, '2011-07-28 03:14:58'),
(84, 4844, 17, 1811, 4, '10000', 1, '2011-07-28 03:14:58'),
(85, 4845, 17, 1811, 6, '15000', 1, '2011-07-28 03:14:59'),
(86, 4846, 17, 1811, 8, '3500', 1, '2011-07-28 03:14:59'),
(87, 4847, 17, 1811, 9, '36000', 1, '2011-07-28 03:14:59'),
(88, 4848, 17, 1811, 1, '5000', 1, '2011-07-28 03:16:16'),
(89, 4849, 17, 1811, 2, '15000', 1, '2011-07-28 03:16:16'),
(90, 4850, 17, 1811, 4, '10000', 1, '2011-07-28 03:16:18'),
(91, 4851, 17, 1811, 6, '15000', 1, '2011-07-28 03:16:18'),
(92, 4852, 17, 1811, 8, '3500', 1, '2011-07-28 03:16:18'),
(93, 4853, 17, 1811, 9, '36000', 1, '2011-07-28 03:16:18'),
(94, 5040, 17, 1868, 1, '1000', 1, '2011-07-28 22:58:14'),
(95, 5041, 17, 1868, 2, '5000', 1, '2011-07-28 22:58:15'),
(96, 5042, 17, 1868, 4, '15000', 1, '2011-07-28 22:58:15'),
(97, 5043, 17, 1868, 8, '3000', 1, '2011-07-28 22:58:17'),
(98, 5044, 17, 1868, 1, '1000', 1, '2011-07-28 22:58:57'),
(99, 5045, 17, 1868, 2, '5000', 1, '2011-07-28 22:58:58'),
(100, 5046, 17, 1868, 4, '15000', 1, '2011-07-28 22:59:00'),
(101, 5047, 17, 1868, 8, '3000', 1, '2011-07-28 22:59:00'),
(102, 5054, 17, 1868, 1, '1000', 1, '2011-07-28 22:59:50'),
(103, 5055, 17, 1868, 2, '5000', 1, '2011-07-28 22:59:50'),
(104, 5056, 17, 1868, 4, '15000', 1, '2011-07-28 22:59:50'),
(105, 5057, 17, 1868, 8, '3000', 1, '2011-07-28 22:59:50'),
(106, 5058, 17, 1868, 1, '1000', 1, '2011-07-28 22:59:51'),
(107, 5059, 17, 1868, 2, '5000', 1, '2011-07-28 22:59:51'),
(108, 5060, 17, 1868, 4, '15000', 1, '2011-07-28 22:59:51'),
(109, 5061, 17, 1868, 8, '3000', 1, '2011-07-28 22:59:51'),
(110, 5253, 17, 1956, 2, '2500', 1, '2011-07-29 20:12:30'),
(111, 5254, 17, 1956, 9, '2500', 1, '2011-07-29 20:12:30'),
(112, 5255, 17, 1956, 12, '1000', 1, '2011-07-29 20:12:30'),
(113, 5343, 17, 1936, 1, '5000', 1, '2011-07-29 22:55:01'),
(114, 5518, 17, 2078, 11, '25000', 1, '2011-07-30 20:37:12'),
(115, 5519, 17, 2078, 9, '6000', 1, '2011-07-30 20:37:49'),
(116, 5533, 17, 2087, 9, '50000', 1, '2011-07-30 20:51:56'),
(117, 5559, 17, 2100, 11, '50000', 1, '2011-07-30 21:47:27'),
(118, 5560, 17, 2100, 12, '50000', 1, '2011-07-30 21:47:27'),
(119, 5622, 17, 2134, 9, '5000', 1, '2011-07-30 22:55:07'),
(120, 5623, 17, 2134, 12, '5000', 1, '2011-07-30 22:55:07'),
(121, 5659, 17, 2158, 9, '40000', 1, '2011-07-31 00:03:50'),
(122, 5660, 17, 2158, 10, '30000', 1, '2011-07-31 00:03:50'),
(123, 5831, 17, 2267, 9, '30000', 1, '2011-08-01 21:44:02'),
(124, 5970, 17, 2369, 2, '6000', 1, '2011-08-02 01:32:26'),
(125, 5971, 17, 2369, 9, '2000', 1, '2011-08-02 01:32:26'),
(126, 6052, 17, 2393, 2, '5000', 1, '2011-08-02 04:16:38'),
(127, 6053, 17, 2393, 9, '5000', 1, '2011-08-02 04:16:38'),
(128, 6054, 17, 2393, 12, '2000', 1, '2011-08-02 04:16:38'),
(129, 6055, 17, 2393, 2, '5000', 1, '2011-08-02 04:16:41'),
(130, 6056, 17, 2393, 9, '5000', 1, '2011-08-02 04:16:41'),
(131, 6057, 17, 2393, 12, '2000', 1, '2011-08-02 04:16:41'),
(132, 6058, 17, 2393, 2, '5000', 1, '2011-08-02 04:19:01'),
(133, 6059, 17, 2393, 9, '5000', 1, '2011-08-02 04:19:01'),
(134, 6060, 17, 2393, 12, '2000', 1, '2011-08-02 04:19:01'),
(135, 6061, 17, 2393, 2, '5000', 1, '2011-08-02 04:19:04'),
(136, 6062, 17, 2393, 9, '5000', 1, '2011-08-02 04:19:05'),
(137, 6063, 17, 2393, 12, '2000', 1, '2011-08-02 04:19:05'),
(138, 6217, 17, 2487, 1, '30000', 1, '2011-08-02 21:58:39'),
(139, 6218, 17, 2487, 2, '10000', 1, '2011-08-02 21:58:40'),
(140, 6219, 17, 2487, 3, '10000', 1, '2011-08-02 21:58:42'),
(141, 6220, 17, 2487, 4, '40000', 1, '2011-08-02 21:58:43'),
(142, 6221, 17, 2487, 5, '10000', 1, '2011-08-02 21:58:43'),
(143, 6236, 17, 2492, 9, '5', 1, '2011-08-02 22:16:45'),
(144, 6237, 17, 2492, 12, '2000', 1, '2011-08-02 22:16:46'),
(145, 6581, 17, 2637, 9, '20000', 1, '2011-08-03 21:00:52'),
(146, 6596, 17, 2637, 9, '20000', 1, '2011-08-03 21:06:31'),
(147, 6672, 17, 2680, 3, '10000', 1, '2011-08-03 23:04:19'),
(148, 6673, 17, 2680, 4, '8000', 1, '2011-08-03 23:04:19'),
(149, 6674, 17, 2680, 9, '5000', 1, '2011-08-03 23:04:19'),
(150, 6831, 17, 2759, 9, '1000', 1, '2011-08-04 19:06:13'),
(151, 6832, 17, 2759, 12, '2000', 1, '2011-08-04 19:06:14'),
(152, 7122, 17, 2877, 4, '30000', 1, '2011-08-05 21:05:23'),
(153, 7123, 17, 2877, 5, '40000', 1, '2011-08-05 21:05:23'),
(154, 7124, 17, 2877, 4, '30000', 1, '2011-08-05 21:11:29'),
(155, 7125, 17, 2877, 5, '40000', 1, '2011-08-05 21:11:29'),
(156, 7355, 17, 2996, 1, '5000', 1, '2011-08-06 02:12:54'),
(157, 7356, 17, 2996, 2, '10000', 1, '2011-08-06 02:12:54'),
(158, 7357, 17, 2996, 3, '5000', 1, '2011-08-06 02:12:54'),
(159, 7358, 17, 2996, 4, '23000', 1, '2011-08-06 02:12:54'),
(160, 7359, 17, 2996, 5, '3000', 1, '2011-08-06 02:12:54'),
(161, 7360, 17, 2996, 6, '2000', 1, '2011-08-06 02:12:54'),
(162, 7389, 17, 3003, 2, '10000', 1, '2011-08-06 02:44:07'),
(163, 7390, 17, 3003, 4, '70000', 1, '2011-08-06 02:44:07'),
(164, 7391, 17, 3003, 5, '20000', 1, '2011-08-06 02:44:07'),
(165, 7392, 17, 3003, 11, '100000', 1, '2011-08-06 02:44:07'),
(166, 7662, 17, 3104, 1, '8000', 1, '2011-08-07 00:43:43'),
(167, 7663, 17, 3104, 2, '4000', 1, '2011-08-07 00:43:43'),
(168, 7664, 17, 3104, 4, '8000', 1, '2011-08-07 00:43:43'),
(169, 7804, 17, 3147, 2, '2000', 1, '2011-08-07 20:11:16'),
(170, 7805, 17, 3147, 9, '5000', 1, '2011-08-07 20:11:16'),
(171, 7806, 17, 3147, 12, '15000', 1, '2011-08-07 20:11:16'),
(172, 7954, 17, 3209, 9, '40000', 1, '2011-08-08 01:14:38'),
(173, 8381, 17, 3339, 1, '2000', 1, '2011-08-09 21:15:18'),
(174, 8408, 17, 3339, 1, '2000', 1, '2011-08-09 21:44:39'),
(175, 8409, 17, 3339, 2, '2000', 1, '2011-08-09 21:44:39'),
(176, 8410, 17, 3339, 5, '10000', 1, '2011-08-09 21:44:39'),
(177, 8411, 17, 3339, 9, '15000', 1, '2011-08-09 21:44:39'),
(178, 8492, 17, 3343, 2, '2', 1, '2011-08-10 00:55:59'),
(179, 8493, 17, 3343, 9, '15000', 1, '2011-08-10 00:55:59'),
(180, 8494, 17, 3343, 2, '2000', 1, '2011-08-10 00:56:34'),
(181, 8495, 17, 3343, 9, '15000', 1, '2011-08-10 00:56:34'),
(182, 8496, 17, 3343, 2, '2000', 1, '2011-08-10 00:56:35'),
(183, 8497, 17, 3343, 9, '15000', 1, '2011-08-10 00:56:35'),
(184, 8716, 17, 3601, 9, '5000', 1, '2011-08-11 20:08:18'),
(185, 8717, 17, 3601, 11, '2000', 1, '2011-08-11 20:08:18'),
(186, 8718, 17, 3601, 12, '2000', 1, '2011-08-11 20:08:18'),
(187, 8719, 17, 3601, 9, '5000', 1, '2011-08-11 20:10:48'),
(188, 8720, 17, 3601, 11, '2000', 1, '2011-08-11 20:10:50'),
(189, 8721, 17, 3601, 12, '2000', 1, '2011-08-11 20:10:51'),
(190, 8770, 17, 3628, 1, '300', 1, '2011-08-11 21:15:52'),
(191, 8771, 17, 3628, 9, '5000', 1, '2011-08-11 21:15:52'),
(192, 8772, 17, 3628, 12, '2000', 1, '2011-08-11 21:15:52'),
(193, 8795, 17, 3640, 2, '5000', 1, '2011-08-11 21:46:23'),
(194, 8796, 17, 3640, 4, '10000', 1, '2011-08-11 21:46:23'),
(195, 8797, 17, 3640, 9, '10000', 1, '2011-08-11 21:46:23'),
(196, 8798, 17, 3640, 10, '2000', 1, '2011-08-11 21:46:23'),
(197, 8972, 17, 3731, 1, '4000', 1, '2011-08-12 02:59:58'),
(198, 8973, 17, 3731, 9, '20000', 1, '2011-08-12 02:59:58'),
(199, 8997, 17, 3735, 4, '10000', 1, '2011-08-12 20:00:48'),
(200, 9044, 17, 3806, 2, '3000', 1, '2011-08-12 22:57:44'),
(201, 9045, 17, 3806, 4, '45000', 1, '2011-08-12 22:57:45'),
(202, 9046, 17, 3806, 9, '20000', 1, '2011-08-12 22:57:45'),
(203, 9047, 17, 3806, 12, '5000', 1, '2011-08-12 22:57:45'),
(204, 9178, 17, 3893, 9, '2000', 1, '2011-08-13 21:11:24'),
(205, 9229, 17, 3920, 4, '10000', 1, '2011-08-13 22:41:12'),
(206, 9230, 17, 3920, 5, '12000', 1, '2011-08-13 22:41:12'),
(207, 9231, 17, 3920, 6, '10000', 1, '2011-08-13 22:41:12'),
(208, 9232, 17, 3920, 11, '10000', 1, '2011-08-13 22:41:12'),
(209, 9326, 17, 3975, 6, '2000', 1, '2011-08-14 01:47:31'),
(210, 9327, 17, 3975, 9, '2000', 1, '2011-08-14 01:47:31'),
(211, 9328, 17, 3975, 12, '2000', 1, '2011-08-14 01:47:31'),
(212, 9456, 17, 4081, 2, '72000', 1, '2011-08-14 23:13:34'),
(213, 9457, 17, 4081, 5, '25000', 1, '2011-08-14 23:13:34'),
(214, 9458, 17, 4081, 10, '20000', 1, '2011-08-14 23:13:34'),
(215, 9459, 17, 4081, 2, '72000', 1, '2011-08-14 23:13:45'),
(216, 9460, 17, 4081, 5, '25000', 1, '2011-08-14 23:13:45'),
(217, 9461, 17, 4081, 10, '20000', 1, '2011-08-14 23:13:46'),
(218, 9478, 17, 4098, 9, '200000', 1, '2011-08-14 23:55:20'),
(219, 9514, 17, 4122, 9, '80000', 1, '2011-08-15 01:07:31'),
(220, 9637, 17, 4226, 9, '20000', 1, '2011-08-15 22:55:40'),
(221, 9638, 17, 4226, 11, '10000', 1, '2011-08-15 22:55:40'),
(222, 9742, 17, 4287, 1, '4000', 1, '2011-08-16 02:01:04'),
(223, 9743, 17, 4287, 2, '4000', 1, '2011-08-16 02:01:04'),
(224, 9744, 17, 4287, 5, '25000', 1, '2011-08-16 02:01:04'),
(225, 9745, 17, 4287, 6, '5000', 1, '2011-08-16 02:01:04'),
(226, 9846, 17, 4335, 10, '60000', 1, '2011-08-16 22:07:10'),
(227, 10252, 17, 4406, 9, '10000', 1, '2011-08-17 22:42:12'),
(228, 10253, 17, 4406, 9, '10000', 1, '2011-08-17 22:46:20'),
(229, 10529, 17, 4604, 4, '12000', 1, '2011-08-18 22:19:49'),
(230, 10530, 17, 4604, 9, '5000', 1, '2011-08-18 22:19:49'),
(231, 10617, 17, 4669, 2, '4000', 1, '2011-08-19 00:43:45'),
(232, 10618, 17, 4669, 9, '30000', 1, '2011-08-19 00:43:45'),
(233, 11002, 17, 4829, 2, '10000', 1, '2011-08-20 03:11:36'),
(234, 11003, 17, 4829, 4, '45000', 1, '2011-08-20 03:11:36'),
(235, 11004, 17, 4829, 5, '5000', 1, '2011-08-20 03:11:36'),
(236, 11206, 17, 4897, 1, '2000', 1, '2011-08-20 22:10:02'),
(237, 11207, 17, 4897, 2, '2000', 1, '2011-08-20 22:10:02'),
(238, 11323, 17, 4933, 1, '3000', 1, '2011-08-20 23:25:50'),
(239, 11324, 17, 4933, 2, '3000', 1, '2011-08-20 23:25:50'),
(240, 11325, 17, 4933, 4, '10000', 1, '2011-08-20 23:25:50'),
(241, 11832, 17, 5086, 1, '10000', 1, '2011-08-22 22:32:04'),
(242, 11833, 17, 5086, 2, '15000', 1, '2011-08-22 22:32:04'),
(243, 11834, 17, 5086, 4, '20000', 1, '2011-08-22 22:32:04'),
(244, 11841, 17, 5086, 1, '10000', 1, '2011-08-22 22:32:18'),
(245, 11842, 17, 5086, 2, '15000', 1, '2011-08-22 22:32:18'),
(246, 11843, 17, 5086, 4, '20000', 1, '2011-08-22 22:32:18'),
(247, 12070, 17, 5121, 4, '1500', 1, '2011-08-23 00:43:33'),
(248, 12071, 17, 5121, 9, '50000', 1, '2011-08-23 00:43:33'),
(249, 12072, 17, 5121, 12, '16000', 1, '2011-08-23 00:43:33'),
(250, 12516, 17, 5310, 2, '4000', 1, '2011-08-23 22:11:09'),
(251, 12517, 17, 5310, 9, '60000', 1, '2011-08-23 22:11:09'),
(252, 12656, 17, 5365, 9, '10000', 1, '2011-08-23 23:42:49'),
(253, 12816, 17, 5414, 2, '2000', 1, '2011-08-24 01:26:46'),
(254, 12817, 17, 5414, 4, '10000', 1, '2011-08-24 01:26:46'),
(255, 12818, 17, 5414, 9, '20000', 1, '2011-08-24 01:26:46'),
(256, 13124, 17, 5513, 5, '3000', 1, '2011-08-24 20:54:19'),
(257, 13125, 17, 5513, 9, '6000', 1, '2011-08-24 20:54:19'),
(258, 13126, 17, 5513, 11, '10000', 1, '2011-08-24 20:54:19'),
(259, 13127, 17, 5513, 5, '3000', 1, '2011-08-24 20:54:38'),
(260, 13128, 17, 5513, 9, '6000', 1, '2011-08-24 20:54:38'),
(261, 13129, 17, 5513, 11, '10000', 1, '2011-08-24 20:54:38'),
(262, 13144, 17, 5514, 2, '8000', 1, '2011-08-24 21:03:34'),
(263, 13145, 17, 5514, 11, '300', 1, '2011-08-24 21:03:34'),
(264, 13146, 17, 5514, 12, '100', 1, '2011-08-24 21:03:34'),
(265, 13210, 17, 5538, 9, '35000', 1, '2011-08-24 21:50:08'),
(266, 13262, 17, 5552, 9, '5000', 1, '2011-08-24 22:11:32'),
(267, 13263, 17, 5552, 12, '500', 1, '2011-08-24 22:11:32'),
(268, 13285, 17, 5555, 4, '21', 1, '2011-08-24 22:22:34'),
(269, 13377, 17, 5566, 2, '2000', 1, '2011-08-24 23:34:13'),
(270, 13378, 17, 5566, 4, '30000', 1, '2011-08-24 23:34:13'),
(271, 13379, 17, 5566, 5, '10000', 1, '2011-08-24 23:34:13'),
(272, 13380, 17, 5566, 6, '1000', 1, '2011-08-24 23:34:13'),
(273, 13381, 17, 5566, 12, '5000', 1, '2011-08-24 23:34:13'),
(274, 13436, 17, 5615, 9, '40000', 1, '2011-08-25 00:13:33'),
(275, 13782, 17, 5725, 2, '20000', 1, '2011-08-25 21:21:56'),
(276, 13783, 17, 5725, 4, '1000', 1, '2011-08-25 21:21:56'),
(277, 13784, 17, 5725, 7, '5000', 1, '2011-08-25 21:21:56'),
(278, 13785, 17, 5725, 9, '25000', 1, '2011-08-25 21:21:56'),
(279, 13786, 17, 5725, 12, '10000', 1, '2011-08-25 21:21:56'),
(280, 13961, 17, 5870, 2, '15000', 1, '2011-08-26 01:03:51'),
(281, 13962, 17, 5870, 4, '2000', 1, '2011-08-26 01:03:51'),
(282, 13963, 17, 5870, 5, '1000', 1, '2011-08-26 01:03:51'),
(283, 13964, 17, 5870, 7, '2000', 1, '2011-08-26 01:03:51'),
(284, 13965, 17, 5870, 2, '15000', 1, '2011-08-26 01:03:52'),
(285, 13966, 17, 5870, 4, '2000', 1, '2011-08-26 01:03:52'),
(286, 13967, 17, 5870, 5, '1000', 1, '2011-08-26 01:03:52'),
(287, 13968, 17, 5870, 7, '20000', 1, '2011-08-26 01:03:52'),
(288, 14516, 17, 6028, 9, '9000', 1, '2011-08-26 22:51:41'),
(289, 14726, 17, 4659, 9, '10000', 1, '2011-08-27 01:24:47'),
(290, 15039, 17, 6210, 2, '2000', 1, '2011-08-27 21:59:25'),
(291, 15040, 17, 6210, 4, '100000', 1, '2011-08-27 21:59:25'),
(292, 15041, 17, 6210, 9, '12000', 1, '2011-08-27 21:59:25'),
(293, 15200, 17, 6329, 10, '1100000', 1, '2011-08-28 00:09:43'),
(294, 15201, 17, 6329, 11, '50000', 1, '2011-08-28 00:09:43'),
(295, 15202, 17, 6329, 12, '10000', 1, '2011-08-28 00:09:43'),
(296, 15225, 17, 6337, 1, '10000', 1, '2011-08-28 00:35:26'),
(297, 15226, 17, 6337, 2, '20000', 1, '2011-08-28 00:35:26'),
(298, 15227, 17, 6337, 4, '900000', 1, '2011-08-28 00:35:26'),
(299, 15228, 17, 6337, 5, '10000', 1, '2011-08-28 00:35:26'),
(300, 15235, 17, 6344, 7, '30000', 1, '2011-08-28 00:40:44'),
(301, 15236, 17, 6344, 8, '10000', 1, '2011-08-28 00:40:44'),
(302, 15237, 17, 6344, 10, '3000', 1, '2011-08-28 00:40:44'),
(303, 15571, 17, 6558, 2, '10000', 1, '2011-08-29 00:00:31'),
(304, 15572, 17, 6558, 3, '10000', 1, '2011-08-29 00:00:31'),
(305, 15573, 17, 6558, 4, '2000', 1, '2011-08-29 00:00:31'),
(306, 16046, 17, 6798, 9, '2000', 1, '2011-08-30 00:50:10'),
(307, 16047, 17, 6798, 10, '5000', 1, '2011-08-30 00:50:10'),
(308, 16305, 17, 6943, 9, '48000', 1, '2011-08-30 21:41:10'),
(309, 17330, 17, 7452, 9, '70', 1, '2011-09-03 20:38:10'),
(310, 16182, 17, 6849, 9, '15000', 1, '2011-08-30 02:56:48'),
(311, 17623, 17, 7643, 9, '24000', 1, '2011-09-04 01:17:35'),
(312, 17624, 17, 7643, 10, '8', 1, '2011-09-04 01:17:35'),
(313, 17928, 17, 7886, 11, '10000', 1, '2011-09-05 00:04:05'),
(314, 18023, 17, 7943, 11, '50000', 1, '2011-09-05 19:16:18'),
(315, 18259, 17, 8054, 9, '4000', 1, '2011-09-06 00:10:03'),
(316, 18353, 17, 8122, 9, '480000', 1, '2011-09-06 02:30:22'),
(317, 18452, 17, 8173, 4, '7500', 1, '2011-09-06 21:41:24'),
(318, 18453, 17, 8173, 12, '500', 1, '2011-09-06 21:41:24'),
(319, 18497, 17, 8197, 9, '1', 1, '2011-09-06 22:29:17'),
(320, 18510, 17, 8199, 9, '36000', 1, '2011-09-06 22:36:19'),
(321, 18511, 17, 8199, 10, '18000', 1, '2011-09-06 22:36:19'),
(322, 18929, 17, 8390, 1, '2000', 1, '2011-09-07 21:34:17'),
(323, 18930, 17, 8390, 2, '2000', 1, '2011-09-07 21:34:17'),
(324, 18931, 17, 8390, 3, '1000', 1, '2011-09-07 21:34:17'),
(325, 18932, 17, 8390, 4, '4000', 1, '2011-09-07 21:34:17'),
(326, 18933, 17, 8390, 5, '2000', 1, '2011-09-07 21:34:17'),
(327, 18934, 17, 8390, 9, '1000', 1, '2011-09-07 21:34:17'),
(328, 18935, 17, 8390, 12, '10000', 1, '2011-09-07 21:34:17'),
(329, 18936, 17, 8390, 1, '2000', 1, '2011-09-07 21:34:18'),
(330, 18937, 17, 8390, 2, '2000', 1, '2011-09-07 21:34:18'),
(331, 18938, 17, 8390, 3, '1000', 1, '2011-09-07 21:34:18'),
(332, 18939, 17, 8390, 4, '4000', 1, '2011-09-07 21:34:18'),
(333, 18940, 17, 8390, 5, '2000', 1, '2011-09-07 21:34:18'),
(334, 18941, 17, 8390, 9, '1000', 1, '2011-09-07 21:34:18'),
(335, 18942, 17, 8390, 12, '10000', 1, '2011-09-07 21:34:18'),
(336, 19191, 17, 8486, 5, '1000', 1, '2011-09-08 01:41:20'),
(337, 19192, 17, 8486, 10, '5000', 1, '2011-09-08 01:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_infrastructure`
--

CREATE TABLE IF NOT EXISTS `ourbank_infrastructure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `housetype_id` int(11) NOT NULL,
  `ownership_id` int(11) NOT NULL,
  `fuel_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_infrastructure`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_infrastructure_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_infrastructure_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `housetype_id` int(11) NOT NULL,
  `ownership_id` int(11) NOT NULL,
  `fuel_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=79 ;

--
-- Dumping data for table `ourbank_infrastructure_log`
--

INSERT INTO `ourbank_infrastructure_log` (`record_id`, `id`, `member_id`, `housetype_id`, `ownership_id`, `fuel_id`, `created_by`, `created_date`) VALUES
(1, 23, 26, 4, 1, 6, 0, '2011-06-24 01:27:22'),
(2, 4, 7, 3, 3, 6, 0, '2011-06-25 21:47:44'),
(3, 2, 8, 2, 3, 6, 0, '2011-06-25 21:29:40'),
(4, 41, 72, 1, 2, 1, 0, '2011-06-29 21:06:44'),
(5, 14, 28, 4, 1, 4, 0, '2011-06-27 20:15:03'),
(6, 1, 1, 3, 3, 6, 0, '2011-06-25 01:25:58'),
(7, 7, 11, 1, 3, 4, 0, '2011-06-25 22:09:56'),
(8, 3, 9, 4, 2, 3, 0, '2011-06-25 21:35:21'),
(9, 9, 14, 2, 3, 1, 0, '2011-06-25 22:32:37'),
(10, 8, 13, 2, 1, 2, 0, '2011-06-25 22:27:11'),
(11, 11, 17, 2, 1, 6, 0, '2011-06-25 23:16:56'),
(12, 70, 20, 1, 3, 1, 0, '2011-07-04 23:38:05'),
(13, 71, 23, 1, 1, 6, 0, '2011-07-05 00:17:11'),
(14, 13, 26, 3, 3, 6, 0, '2011-06-27 20:06:18'),
(15, 72, 25, 1, 3, 1, 0, '2011-07-05 00:30:19'),
(16, 87, 25, 3, 2, 1, 0, '2011-07-06 03:07:44'),
(17, 23, 49, 2, 3, 6, 0, '2011-06-28 22:53:55'),
(18, 73, 28, 4, 1, 4, 0, '2011-07-05 00:48:21'),
(19, 24, 50, 2, 3, 1, 0, '2011-06-29 00:54:50'),
(20, 15, 29, 2, 3, 1, 0, '2011-06-27 20:16:04'),
(21, 25, 52, 2, 3, 1, 0, '2011-06-29 01:24:38'),
(22, 26, 51, 1, 2, 6, 0, '2011-06-29 01:26:25'),
(23, 29, 57, 1, 2, 3, 0, '2011-06-29 02:12:46'),
(24, 32, 60, 2, 3, 1, 0, '2011-06-29 02:39:18'),
(25, 33, 65, 1, 1, 1, 0, '2011-06-29 02:59:18'),
(26, 34, 66, 1, 2, 6, 0, '2011-06-29 03:04:46'),
(27, 37, 68, 2, 3, 6, 0, '2011-06-29 20:21:38'),
(28, 38, 69, 3, 3, 4, 0, '2011-06-29 20:44:24'),
(29, 39, 70, 3, 2, 1, 0, '2011-06-29 20:51:42'),
(30, 36, 67, 1, 3, 2, 0, '2011-06-29 20:15:01'),
(31, 46, 97, 4, 3, 6, 0, '2011-06-30 21:35:57'),
(32, 49, 105, 1, 1, 3, 0, '2011-06-30 23:49:22'),
(33, 53, 111, 2, 2, 3, 0, '2011-07-01 01:01:22'),
(34, 55, 112, 1, 5, 6, 0, '2011-07-01 01:09:30'),
(35, 57, 114, 3, 3, 3, 0, '2011-07-01 01:27:58'),
(36, 58, 115, 4, 3, 6, 0, '2011-07-01 01:39:14'),
(37, 126, 115, 2, 4, 1, 0, '2011-07-07 03:08:48'),
(38, 59, 117, 1, 2, 1, 0, '2011-07-01 01:54:20'),
(39, 60, 118, 4, 3, 6, 0, '2011-07-01 01:56:43'),
(40, 61, 119, 3, 3, 3, 0, '2011-07-01 02:04:39'),
(41, 62, 120, 4, 3, 6, 0, '2011-07-01 02:12:58'),
(42, 453, 451, 5, 1, 4, 0, '2011-07-13 02:52:57'),
(43, 578, 576, 5, 3, 1, 0, '2011-07-15 20:58:15'),
(44, 604, 602, 5, 3, 1, 0, '2011-07-15 22:37:50'),
(45, 606, 602, 5, 3, 1, 0, '2011-07-15 23:40:49'),
(46, 740, 735, 1, 3, 1, 0, '2011-07-17 00:58:59'),
(47, 779, 773, 4, 3, 1, 0, '2011-07-18 22:12:33'),
(48, 976, 966, 2, 3, 1, 0, '2011-07-20 21:22:54'),
(49, 1150, 1150, 2, 3, 1, 0, '2011-07-22 01:34:40'),
(50, 1392, 1405, 4, 1, 6, 0, '2011-07-24 00:13:35'),
(51, 1667, 1688, 3, 3, 1, 0, '2011-07-27 21:13:14'),
(52, 1668, 1688, 3, 3, 1, 0, '2011-07-27 21:13:14'),
(53, 1796, 1820, 3, 3, 1, 0, '2011-07-28 19:58:12'),
(54, 1886, 1906, 2, 4, 1, 0, '2011-07-29 00:23:21'),
(55, 1887, 1906, 2, 4, 1, 0, '2011-07-29 00:25:10'),
(56, 2074, 2088, 3, 3, 6, 0, '2011-07-30 21:05:21'),
(57, 2075, 2088, 3, 3, 6, 0, '2011-07-30 21:07:35'),
(58, 2076, 2088, 3, 3, 6, 0, '2011-07-30 21:07:37'),
(59, 2077, 2088, 3, 3, 6, 0, '2011-07-30 21:07:37'),
(60, 2078, 2088, 3, 3, 6, 0, '2011-07-30 21:07:38'),
(61, 2079, 2088, 3, 3, 6, 0, '2011-07-30 21:07:39'),
(62, 2080, 2088, 3, 3, 6, 0, '2011-07-30 21:07:39'),
(63, 2081, 2088, 3, 3, 6, 0, '2011-07-30 21:07:39'),
(64, 2082, 2088, 3, 3, 6, 0, '2011-07-30 21:07:39'),
(65, 2083, 2088, 3, 3, 6, 0, '2011-07-30 21:07:40'),
(66, 2084, 2088, 3, 3, 6, 0, '2011-07-30 21:07:40'),
(67, 2085, 2088, 3, 3, 6, 0, '2011-07-30 21:07:40'),
(68, 2307, 2333, 3, 4, 1, 0, '2011-08-02 00:03:41'),
(69, 2308, 2333, 3, 4, 1, 0, '2011-08-02 00:03:42'),
(70, 2852, 2992, 2, 3, 1, 0, '2011-08-06 02:09:31'),
(71, 2876, 2969, 3, 3, 1, 0, '2011-08-06 19:57:00'),
(72, 4628, 5227, 2, 3, 1, 0, '2011-08-23 02:49:33'),
(73, 4919, 5524, 1, 4, 1, 0, '2011-08-24 21:12:33'),
(74, 4963, 5564, 2, 3, 1, 0, '2011-08-24 22:29:42'),
(75, 5057, 5658, 2, 3, 6, 0, '2011-08-25 01:49:18'),
(76, 5411, 6107, 3, 3, 4, 0, '2011-08-27 01:33:49'),
(77, 5564, 6305, 3, 3, 6, 0, '2011-08-27 23:45:07'),
(78, 6912, 8053, 4, 3, 1, 0, '2011-09-06 00:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_installmentdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_installmentdetails` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `installment_id` smallint(5) NOT NULL,
  `installment_date` date NOT NULL,
  `installment_amount` float(10,2) NOT NULL,
  `installment_interest_amount` float(10,2) NOT NULL,
  `installment_principal_amount` float(10,2) NOT NULL,
  `reduced_prinicipal_balance` float(10,2) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `balance` float(10,2) NOT NULL,
  `installment_status` tinyint(4) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_installmentdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_installmentstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_installmentstatus` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_installmentstatus`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_insurance`
--

CREATE TABLE IF NOT EXISTS `ourbank_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `insurance_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_insurance`
--

INSERT INTO `ourbank_insurance` (`id`, `family_id`, `insurance_id`) VALUES
(1, 1, 2),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_interesttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_interesttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_interesttypes`
--

INSERT INTO `ourbank_interesttypes` (`id`, `description`) VALUES
(1, 'Declained capital'),
(2, 'EMI'),
(3, 'EMI - N');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_interest_periods`
--

CREATE TABLE IF NOT EXISTS `ourbank_interest_periods` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `period_ofrange_monthfrom` smallint(6) NOT NULL,
  `period_ofrange_monthto` smallint(6) NOT NULL,
  `period_ofrange_description` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `offerproduct_id` smallint(5) NOT NULL,
  `Interest` float(5,2) NOT NULL,
  `intereststatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_interest_periods`
--

INSERT INTO `ourbank_interest_periods` (`id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(1, 1, 6, '1-6', 5, 1.00, 3),
(2, 7, 12, '7-12', 5, 2.00, 3),
(3, 1, 6, '1-6', 1, 1.00, 3),
(4, 7, 12, '7-12', 1, 2.00, 3),
(5, 1, 2, '1-1 Months', 2, 1.00, 3),
(6, 1, 12, '1-12months', 3, 2.00, 3),
(7, 13, 24, '13-24months', 3, 3.00, 3),
(8, 1, 12, '1-12months', 4, 1.00, 3),
(9, 13, 24, '13-24months', 4, 2.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_interest_periods_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_interest_periods_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `period_ofrange_monthfrom` smallint(6) NOT NULL,
  `period_ofrange_monthto` smallint(6) NOT NULL,
  `period_ofrange_description` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `offerproduct_id` smallint(5) NOT NULL,
  `Interest` float(5,2) NOT NULL,
  `intereststatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_interest_periods_log`
--

INSERT INTO `ourbank_interest_periods_log` (`record_id`, `id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(1, 2, 0, 0, '0', 2, 0.00, 3),
(2, 3, 1, 12, '1-12', 3, 22.00, 3),
(3, 4, 1, 12, '1-12', 3, 22.00, 3),
(4, 5, 1, 12, '1-12', 3, 22.00, 3),
(5, 6, 1, 12, '1-12', 3, 22.00, 3),
(6, 9, 1, 12, '1-12', 3, 22.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_koota`
--

CREATE TABLE IF NOT EXISTS `ourbank_koota` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `koota_id` smallint(6) NOT NULL,
  `penalty_latecoming` int(11) NOT NULL,
  `penalty_notcoming` int(11) NOT NULL,
  `rateinterest` int(11) NOT NULL,
  `register_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_koota`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_kootamembers`
--

CREATE TABLE IF NOT EXISTS `ourbank_kootamembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `koota_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_kootamembers`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_kootamembers_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_kootamembers_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `koota_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_kootamembers_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_koota_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_koota_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` mediumint(9) NOT NULL,
  `koota_id` smallint(6) NOT NULL,
  `penalty_latecoming` int(11) NOT NULL,
  `penalty_notcoming` int(11) NOT NULL,
  `rateinterest` int(11) NOT NULL,
  `register_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_koota_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_language`
--

CREATE TABLE IF NOT EXISTS `ourbank_language` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_language`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_ledgertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_ledgertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_ledgertypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Liabilities`
--

CREATE TABLE IF NOT EXISTS `ourbank_Liabilities` (
  `Liabilities_id` int(10) NOT NULL AUTO_INCREMENT,
  `office_id` int(10) NOT NULL,
  `glsubcode_id_from` int(10) NOT NULL,
  `glsubcode_id_to` int(10) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `credit` float(10,2) NOT NULL,
  `debit` float(10,2) NOT NULL,
  `record_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Liabilities_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_Liabilities`
--

INSERT INTO `ourbank_Liabilities` (`Liabilities_id`, `office_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_id`, `credit`, `debit`, `record_status`) VALUES
(1, 4, 0, 32, 1, 1000.00, 0.00, 3),
(2, 4, 0, 32, 4, 500.00, 0.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_liveassetdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_liveassetdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `liveasset_id` int(11) NOT NULL,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_value` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_liveassetdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_liveassetdetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_liveassetdetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `liveasset_id` int(11) NOT NULL,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_value` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=60 ;

--
-- Dumping data for table `ourbank_liveassetdetails_log`
--

INSERT INTO `ourbank_liveassetdetails_log` (`record_id`, `id`, `submodule_id`, `family_id`, `liveasset_id`, `number`, `value`, `date_of_value`, `created_by`, `created_date`) VALUES
(1, 5, 17, 17, 5, '25', '0', '0000-00-00', 0, '2011-07-05 20:40:05'),
(2, 28, 17, 51, 3, '2', '0', '0000-00-00', 0, '2011-07-06 18:36:43'),
(3, 274, 17, 239, 1, '1', '0', '0000-00-00', 0, '2011-07-09 14:50:42'),
(4, 339, 17, 265, 2, '2', '0', '0000-00-00', 0, '2011-07-09 17:14:25'),
(5, 340, 17, 265, 1, '3', '0', '0000-00-00', 0, '2011-07-09 17:14:25'),
(6, 631, 17, 470, 4, '2', '0', '0000-00-00', 0, '2011-07-13 16:26:21'),
(7, 632, 17, 470, 3, '2', '0', '0000-00-00', 0, '2011-07-13 16:26:21'),
(8, 633, 17, 470, 5, '25', '0', '0000-00-00', 0, '2011-07-13 16:26:21'),
(9, 702, 17, 509, 3, '2', '0', '0000-00-00', 0, '2011-07-14 16:28:28'),
(10, 780, 17, 547, 2, '2', '0', '0000-00-00', 0, '2011-07-14 20:51:09'),
(11, 884, 17, 580, 5, '4', '0', '0000-00-00', 0, '2011-07-15 15:44:02'),
(12, 927, 17, 591, 4, '2', '0', '0000-00-00', 0, '2011-07-15 16:49:33'),
(13, 1052, 17, 659, 1, '1', '0', '0000-00-00', 0, '2011-07-15 21:29:45'),
(14, 1053, 17, 659, 2, '2', '0', '0000-00-00', 0, '2011-07-15 21:29:45'),
(15, 1094, 17, 691, 1, '2', '0', '0000-00-00', 0, '2011-07-16 16:05:50'),
(16, 1394, 17, 928, 4, '2', '0', '0000-00-00', 0, '2011-07-19 20:36:06'),
(17, 1540, 17, 1036, 2, '2', '0', '0000-00-00', 0, '2011-07-20 20:00:42'),
(18, 1822, 17, 1335, 7, '8', '0', '0000-00-00', 0, '2011-07-23 15:16:03'),
(19, 1952, 17, 1680, 4, '2', '0', '0000-00-00', 0, '2011-07-27 15:39:59'),
(20, 1953, 17, 1680, 4, '2', '0', '0000-00-00', 0, '2011-07-27 15:40:34'),
(21, 1975, 17, 1706, 1, '2', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(22, 1976, 17, 1706, 2, '2', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(23, 1977, 17, 1706, 4, '2', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(24, 1978, 17, 1706, 5, '12', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(25, 1979, 17, 1706, 7, '8', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(26, 1980, 17, 1706, 1, '2', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(27, 1981, 17, 1706, 2, '2', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(28, 1982, 17, 1706, 4, '2', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(29, 1983, 17, 1706, 5, '12', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(30, 1984, 17, 1706, 7, '8', '0', '0000-00-00', 0, '2011-07-27 17:50:37'),
(31, 2099, 17, 1848, 5, '15', '0', '0000-00-00', 0, '2011-07-28 16:12:23'),
(32, 2100, 17, 1848, 7, '4', '0', '0000-00-00', 0, '2011-07-28 16:12:24'),
(33, 2101, 17, 1848, 5, '15', '0', '0000-00-00', 0, '2011-07-28 16:14:32'),
(34, 2102, 17, 1848, 7, '4', '0', '0000-00-00', 0, '2011-07-28 16:14:32'),
(35, 2138, 17, 1887, 1, '8', '0', '0000-00-00', 0, '2011-07-28 17:51:08'),
(36, 2139, 17, 1887, 2, '2', '0', '0000-00-00', 0, '2011-07-28 17:51:09'),
(37, 2140, 17, 1887, 5, '4', '0', '0000-00-00', 0, '2011-07-28 17:51:11'),
(38, 2141, 17, 1887, 7, '15', '0', '0000-00-00', 0, '2011-07-28 17:51:11'),
(39, 2142, 17, 1887, 1, '8', '0', '0000-00-00', 0, '2011-07-28 17:52:58'),
(40, 2143, 17, 1887, 2, '2', '0', '0000-00-00', 0, '2011-07-28 17:52:58'),
(41, 2144, 17, 1887, 5, '4', '0', '0000-00-00', 0, '2011-07-28 17:52:58'),
(42, 2145, 17, 1887, 7, '15', '0', '0000-00-00', 0, '2011-07-28 17:52:58'),
(43, 2819, 17, 2823, 5, '2', '0', '0000-00-00', 0, '2011-08-04 19:29:26'),
(44, 2883, 17, 2852, 2, '2', '0', '0000-00-00', 0, '2011-08-05 16:34:23'),
(45, 3731, 17, 4401, 2, '2', '0', '0000-00-00', 0, '2011-08-16 20:24:41'),
(46, 3767, 17, 4437, 2, '04', '0', '0000-00-00', 0, '2011-08-17 14:24:35'),
(47, 3930, 17, 4736, 2, '1', '0', '0000-00-00', 0, '2011-08-19 11:53:26'),
(48, 4128, 17, 4888, 1, '3', '0', '0000-00-00', 0, '2011-08-20 12:15:21'),
(49, 4950, 17, 5582, 1, '01', '0', '0000-00-00', 0, '2011-08-24 13:29:18'),
(50, 5083, 17, 5669, 3, '1', '0', '0000-00-00', 0, '2011-08-24 16:41:01'),
(51, 6002, 17, 6879, 2, '2', '0', '0000-00-00', 0, '2011-08-29 18:41:34'),
(52, 6003, 17, 6879, 3, '1', '0', '0000-00-00', 0, '2011-08-29 18:41:34'),
(53, 6083, 17, 6973, 2, '06', '0', '0000-00-00', 0, '2011-08-30 12:58:11'),
(54, 6084, 17, 6973, 1, '02', '0', '0000-00-00', 0, '2011-08-30 12:58:11'),
(55, 6248, 17, 7194, 3, '1', '0', '2011-09-01', 0, '2011-09-01 16:48:41'),
(56, 6392, 17, 7482, 2, '2', '0', '2011-09-03', 0, '2011-09-03 11:57:32'),
(57, 6393, 17, 7482, 5, '2', '0', '2011-09-03', 0, '2011-09-03 11:57:32'),
(58, 6517, 17, 7817, 1, '2', '0', '2011-09-04', 0, '2011-09-04 11:36:20'),
(59, 6518, 17, 7817, 7, '222222', '0', '2011-09-04', 0, '2011-09-04 11:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loanaccounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_loanaccounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `loanofficer_id` int(11) NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `loansanctioned_date` date NOT NULL,
  `loanbegin_date` date NOT NULL,
  `loanclose_date` date NOT NULL,
  `loan_amount` float(10,2) NOT NULL,
  `loan_installments` int(11) NOT NULL,
  `loan_interest` int(11) NOT NULL,
  `interesttype_id` smallint(5) NOT NULL,
  `savingsaccount_id` int(11) DEFAULT NULL,
  `securityaccount_id` int(11) DEFAULT NULL,
  `tieup_flag` tinyint(1) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_loanaccounts`
--

INSERT INTO `ourbank_loanaccounts` (`id`, `account_id`, `loanofficer_id`, `funder_id`, `loansanctioned_date`, `loanbegin_date`, `loanclose_date`, `loan_amount`, `loan_installments`, `loan_interest`, `interesttype_id`, `savingsaccount_id`, `securityaccount_id`, `tieup_flag`, `created_by`, `created_date`) VALUES
(1, 4, 0, 0, '2011-09-13', '0000-00-00', '0000-00-00', 10000.00, 12, 4, 1, NULL, NULL, 0, 1, '2011-09-13 13:38:28'),
(2, 5, 0, 0, '2011-09-13', '0000-00-00', '0000-00-00', 10000.00, 12, 4, 1, NULL, NULL, 0, 1, '2011-09-13 13:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loandetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_loandetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `loanamount` decimal(10,2) NOT NULL,
  `purpose_id` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `outstanding_amount` float(10,2) NOT NULL,
  `deposit` float(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loandetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loandetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_loandetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `loanamount` decimal(10,2) NOT NULL,
  `purpose_id` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `outstanding_amount` float(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loandetails_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loanprocess`
--

CREATE TABLE IF NOT EXISTS `ourbank_loanprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `membertype` smallint(6) NOT NULL,
  `purpose` tinyint(4) NOT NULL,
  `request_amount` double NOT NULL,
  `loan_duration` tinyint(4) NOT NULL,
  `expecting_inperiod` int(4) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_loanprocess`
--

INSERT INTO `ourbank_loanprocess` (`id`, `member_id`, `membertype`, `purpose`, `request_amount`, `loan_duration`, `expecting_inperiod`, `created_date`, `created_by`, `status`) VALUES
(1, 1, 1, 1, 10000, 1, 1, '2011-09-13 13:38:28', 1, '0'),
(2, 1, 3, 7, 10000, 0, 1, '2011-09-13 13:39:35', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loanprocess_details`
--

CREATE TABLE IF NOT EXISTS `ourbank_loanprocess_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_group_id` int(11) NOT NULL,
  `type` int(2) NOT NULL,
  `status` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `process_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loanprocess_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loan_disbursement`
--

CREATE TABLE IF NOT EXISTS `ourbank_loan_disbursement` (
  `loandisbursement_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `loandisbursement_date` date NOT NULL,
  `accountdisbursement_id` int(11) NOT NULL,
  `disbursed_by` int(10) NOT NULL,
  `amount_disbursed` float(10,2) NOT NULL,
  `transaction_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`loandisbursement_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_loan_disbursement`
--

INSERT INTO `ourbank_loan_disbursement` (`loandisbursement_id`, `transaction_id`, `account_id`, `loandisbursement_date`, `accountdisbursement_id`, `disbursed_by`, `amount_disbursed`, `transaction_description`, `recordstatus_id`) VALUES
(1, 2, 4, '2011-09-13', 1, 1, 10000.00, 'ok', 3),
(2, 3, 5, '2011-09-13', 1, 1, 10000.00, 'ok', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_loan_repayment`
--

CREATE TABLE IF NOT EXISTS `ourbank_loan_repayment` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(40) NOT NULL,
  `account_id` int(30) NOT NULL,
  `installment_id` smallint(5) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `paid_principal` float(10,2) NOT NULL,
  `paid_interest` float(10,2) NOT NULL,
  `paid_other_amount` float(10,2) NOT NULL,
  `balanceamount` float(10,2) DEFAULT NULL,
  `monthend_tag` int(3) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loan_repayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_accountype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_accountype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_accountype`
--

INSERT INTO `ourbank_master_accountype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Savings', 'ಉಳಿತಾಯ', 1, '2011-05-25 16:52:50'),
(2, 'Current', 'ಚಾಲ್ತಿ', 1, '2011-05-25 16:52:50'),
(3, 'Others', 'ಇತರೆ', 1, '2011-05-25 16:52:50'),
(4, 'None', 'ಯಾವುದೂ ಇಲ್ಲ', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_bank`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_bank` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `accounttype_id` smallint(6) NOT NULL,
  `village_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `village_id` (`village_id`),
  KEY `accounttype_id` (`accounttype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_bank`
--

INSERT INTO `ourbank_master_bank` (`id`, `accounttype_id`, `village_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 4, 4, 'SBI - Bank', 'SBI - Bank', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_bloodtype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_bloodtype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_bloodtype`
--

INSERT INTO `ourbank_master_bloodtype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'O−', '', 1, '2011-05-25 13:32:55'),
(2, 'O+', '', 1, '2011-05-25 13:32:55'),
(3, 'A−', '', 1, '2011-05-25 13:32:55'),
(4, 'A+', '', 1, '2011-05-25 13:32:55'),
(5, 'B−', '', 1, '2011-05-25 13:32:55'),
(6, 'B+', '', 1, '2011-05-25 13:32:55'),
(7, 'AB−', '', 1, '2011-05-25 13:32:55'),
(8, 'AB+', '', 1, '2011-05-25 13:32:55'),
(9, 'Not Known', '', 1, '2011-05-25 13:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_branch`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_branch` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bank_id` smallint(11) NOT NULL,
  `village_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `bank_id` (`bank_id`),
  KEY `village_id` (`village_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_branch`
--

INSERT INTO `ourbank_master_branch` (`id`, `bank_id`, `village_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 4, 'SBI - Branch', 'SBI - Branch', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_businesstype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_businesstype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_master_businesstype`
--

INSERT INTO `ourbank_master_businesstype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Self-employed', 'ಸ್ವಯಂ ಉದ್ಯೋಗಿ', 1, '2011-05-25 13:34:24'),
(2, 'Employed - Govt sector - salaried', 'ಉದ್ಯೋಗಿ - ಸರ್ಕಾರಿ ವಲಯ - ಸಂಬಳ', 1, '2011-05-25 13:34:24'),
(3, 'Employed - Govt sector - daily wage', 'ಉದ್ಯೋಗಿ - ಸರ್ಕಾರಿ ವಲಯ - ದಿನಗೂಲಿ', 1, '2011-05-25 13:34:24'),
(4, 'Employed - Private sector - salaried', 'ಉದ್ಯೋಗಿ - ಖಾಸಗಿ ವಲಯ - ಸಂಬಳ', 1, '2011-05-25 13:34:24'),
(5, 'Employed - Private sector - temporary', 'ಉದ್ಯೋಗಿ - ಖಾಸಗಿ ವಲಯ - ದಿನಗೂಲಿ', 1, '2011-05-25 13:34:24'),
(6, 'Daily wage worker', 'ದಿನಗೂಲಿ ನೌಕರ', 1, '2011-05-25 13:34:24'),
(7, 'Housewife/within house worker', 'ಗೃಹಿಣಿ / ತನ್ನ ಮನೆಗಾಗಿಯಷ್ಟೇ ದುಡೀಯುವವರು', 1, '2011-05-25 13:34:24'),
(8, 'Unemployed', 'ನಿರುದ್ಯೋಗಿ', 1, '2011-05-25 13:34:24'),
(9, 'Student', 'ವಿದ್ಯಾರ್ಥಿ', 1, '2011-05-25 13:34:24'),
(10, 'Student out of school/discontinued', 'ವಿದ್ಯಾರ್ಥಿ ಆಗಿರಬೇಕಿತ್ತು, ಈಗ ಓದುತ್ತಿಲ್ಲ', 1, '2011-05-25 13:34:24'),
(11, 'Idle, unable', 'ಏನೂ ಮಾಡುತ್ತಿಲ್ಲ/ಕೈಲಾಗುತ್ತಿಲ್ಲ', 1, '2011-05-25 13:34:24'),
(12, 'Others', 'ಇತರೆ', 1, '2011-05-25 13:34:24'),
(13, 'TESTING', 'TESTING', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_castetype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_castetype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_castetype`
--

INSERT INTO `ourbank_master_castetype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'SC', 'ಪ.ಜಾತಿ', 1, '2011-05-25 13:35:24'),
(2, 'ST', 'ಪ.ಪಂ', 1, '2011-05-25 13:35:24'),
(3, 'OBC', 'ಹಿಂ.ವ', 1, '2011-05-25 13:35:24'),
(4, 'Others', 'ಇತರೆ', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cbopromoter`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cbopromoter` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `koota_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `koota_id` (`koota_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_cbopromoter`
--

INSERT INTO `ourbank_master_cbopromoter` (`id`, `name`, `name_regional`, `koota_id`, `created_by`, `created_date`) VALUES
(1, 'CBO promoter -1', 'CBO promoter -1', 3, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cbos`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cbos` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cbopromoter_id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `cbopromoter_id` (`cbopromoter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_cbos`
--

INSERT INTO `ourbank_master_cbos` (`id`, `cbopromoter_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 'cbo -1', 'cbo -1', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cookingfuel`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cookingfuel` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_cookingfuel`
--

INSERT INTO `ourbank_master_cookingfuel` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Wood', 'ಕಟ್ಟಿಗೆ', 1, '2011-05-25 13:37:20'),
(2, 'Cow Dung', 'ಭೆರಣಿ', 1, '2011-05-25 13:37:20'),
(3, 'Kerosene', 'ಸೀಮೆ ಹೆಣ್ಣೆ', 1, '2011-05-25 13:37:20'),
(4, 'Biogas', 'ಗೋಬರ ಗ್ಯಾಸ್', 1, '2011-05-25 13:37:20'),
(5, 'Electricity', 'ವಿದ್ಯುತ್', 1, '2011-05-25 13:37:20'),
(6, 'LPG', 'ಗ್ಯಾಸ್ ಸಿಲೆಂಡರ್', 1, '2011-05-25 13:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_countrylist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_countrylist` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currencyname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currencysymbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `currencyshortname` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `default` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_master_countrylist`
--

INSERT INTO `ourbank_master_countrylist` (`id`, `name`, `name_regional`, `country_code`, `currencyname`, `currencysymbol`, `currencyshortname`, `timezone`, `default`, `created_by`, `created_date`) VALUES
(1, 'India', '', 'IND', 'Indian Rupee', 'Rs', 'Rupee', 'asia', '1', 1, '2011-05-25 23:10:22'),
(2, 'America', '', 'USA', 'US Dollar', '$', 'USD', '', '', 1, '2011-05-25 23:10:22'),
(3, 'Russia', '', 'USR', 'Rouble', 'RUB', 'RUB', '', '', 1, '2011-05-25 23:10:22'),
(4, 'Japan', '', 'JAP', 'YEN', '¥', 'JPY', '', '', 1, '2011-05-25 23:10:22'),
(5, 'South Africa', '', 'SA', 'ZAR', 'ZAR', 'ZAR', '', '', 1, '2011-05-25 23:10:22'),
(6, 'United Kingdom', '', 'UK', 'Punds', '₤', 'GBP', '', '', 1, '2011-05-25 23:10:22'),
(7, 'Brazil', '', 'BRZ', 'BRL', 'R$', 'Real', '', '', 1, '2011-05-25 23:10:22'),
(8, 'France', '', 'FRN', 'EURO', '€', 'euro', '', '', 1, '2011-05-25 23:10:22'),
(9, 'Germany', '', 'GRM', 'Deutsche Mark', 'DM', 'DM', '', '', 1, '2011-05-25 23:10:22'),
(10, 'Qatar', '', 'QAT', 'Qatari Rial', 'Rial', 'Rial', '', '', 1, '2011-05-25 23:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_crop`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_crop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ourbank_master_crop`
--

INSERT INTO `ourbank_master_crop` (`id`, `name`, `name_regional`, `unit_id`, `created_by`, `created_date`) VALUES
(1, 'Paddy', 'ಬತ್ತ', 2, 1, '2011-05-25 14:29:06'),
(2, 'Ragi', 'ರಾಗಿ', 2, 1, '2011-05-25 14:29:06'),
(3, 'Coconut', 'ತೆಂಗು', 4, 1, '2011-05-25 14:29:06'),
(4, 'Arecanut', 'ಅಡಿಕೆ', 1, 1, '2011-05-25 14:29:06'),
(5, 'Gram', 'ಕಾಳು', 1, 1, '2011-05-25 14:29:06'),
(6, 'Sunflower', 'ಸೂರ್ಯ ಕಾಂತಿ', 1, 1, '2011-05-25 14:29:06'),
(7, 'Groundnut', 'ಕಡಲೆಕಾಯಿ/ಶೇಂಗಾ', 2, 1, '2011-05-25 14:29:06'),
(8, 'Maize/Corn', 'ಜೋಳ', 2, 1, '2011-05-25 14:29:06'),
(9, 'Dal', 'ಬೇಳೆ', 1, 1, '2011-05-25 14:29:06'),
(10, 'Castor', 'ಹರಳೆ', 1, 1, '2011-05-26 13:44:03'),
(11, 'Niger', 'ಉಚ್ಚೆಳ್ಳು', 1, 1, '2011-05-26 13:44:03'),
(12, 'Vegetables', 'ತರಕಾರಿ', 1, 1, '2011-05-26 13:44:03'),
(13, 'Green leafy vegetables', 'ಸೊಪ್ಪು', 5, 1, '2011-05-26 13:44:03'),
(14, 'Fruits', 'ಹಣ್ಣು', 1, 1, '2011-05-26 13:44:03'),
(15, 'Flowers', 'ಹೂವು', 1, 1, '2011-05-26 13:44:03'),
(16, 'Others', 'ಇತರೆ', 5, 1, '2011-05-26 13:44:03'),
(17, 'None ', 'ಇಲ್ಲ', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cropseason`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cropseason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_master_cropseason`
--

INSERT INTO `ourbank_master_cropseason` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Pre Monsoon', 'Pre Monsoon', 1, '2011-05-25 16:05:45'),
(2, 'Monsoon', 'ಮುಂಗಾರು', 1, '2011-05-25 16:05:45'),
(3, 'Post Monsoon', 'ಹಿಂಗಾರು', 1, '2011-05-25 16:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_currency`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_currency` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `name_regional` varchar(30) NOT NULL,
  `currencysymbol` varchar(5) DEFAULT NULL,
  `currencyshortname` varchar(5) DEFAULT NULL,
  `country_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_currency`
--

INSERT INTO `ourbank_master_currency` (`id`, `name`, `name_regional`, `currencysymbol`, `currencyshortname`, `country_id`) VALUES
(1, 'Indian Rupee', '', 'Rs', 'INR', 1),
(2, 'US Dollar', '', '$', 'USD', 0),
(3, 'YEN', '', 'Ye', 'YEN', 0),
(4, 'Britain Pounds', '', 'L', 'P', 0),
(5, 'United Arab Emirates dirhams', '', 'D', 'UAE D', 0),
(6, 'Euro', '', 'EU', 'EUR', 0),
(7, 'Australian Dollar', '', '$', 'AU D', 0),
(8, 'Oman Riyals', '', 'R', 'ORY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_department`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_department` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_department`
--

INSERT INTO `ourbank_master_department` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Administration', '', 1, '2011-05-26 00:04:22'),
(2, 'Accounts', '', 1, '2011-05-26 00:04:22'),
(3, 'Field staff', '', 1, '2011-05-26 00:04:22'),
(4, 'Loan department', '', 1, '2011-05-26 00:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_deposit`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_deposit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_deposit`
--

INSERT INTO `ourbank_master_deposit` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Banks', '', 1, '2011-05-25 14:31:34'),
(2, 'SHGs / CBOs', '', 1, '2011-05-25 14:31:34'),
(3, 'Chit Funds', '', 1, '2011-05-25 14:31:34'),
(4, 'MFI', '', 1, '2011-05-25 14:31:34'),
(5, 'Cooperative Banks', '', 1, '2011-05-25 14:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_designation`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_designation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` smallint(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_designation`
--

INSERT INTO `ourbank_master_designation` (`id`, `name`, `name_regional`, `department_id`, `created_by`, `created_date`) VALUES
(1, 'Manager', 'Manager', 1, 1, '2011-09-12 12:18:50'),
(2, 'Clerk', '', 2, 1, '2011-05-26 00:05:32'),
(3, 'Field officer', '', 3, 1, '2011-05-26 00:05:32'),
(4, 'Loan officer', '', 4, 1, '2011-05-26 00:05:32'),
(5, 'Block officer', '', 4, 1, '2011-05-26 00:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_diseasetypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_diseasetypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_master_diseasetypes`
--

INSERT INTO `ourbank_master_diseasetypes` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Immune system [viral and bacterial infections] ', 'ವೈರಸ್ ಮತ್ತು ಬ್ಯಾಕ್ಟಿರಿಯಾಗೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(2, 'Musculoskeletal(fractures,swelling,sprain,wound)', 'ಮೂಳೆ ಹಾಗು ಮಾಂಸಖಂಡಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(3, 'Cardiovascular (heart & blood circulation related)', 'ಹೃದಯ ಮತ್ತು ರಕ್ತ ಸಂಚಾಲನೆಗೆ ಸಂಬಂಧಿಸಿದ್ದು ', 1, '2011-05-25 14:36:38'),
(4, 'Digestive system (Dental, Oesophageal, Gastrointes', 'ಜೀರ್ಣಾಂಗಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು (ಹಲ್ಲು, ಗಂಟಲು, ಅನ್ನನಾಳ, ', 1, '2011-05-25 14:36:38'),
(5, 'Nervous system ', 'ನರಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(6, 'ENT (Ear, Nose, Throat, head related)', 'ಕಿವಿ, ಮೂಗು, ಗಂಟಲು, ತಲೆಗೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(7, 'Ophthalmology (eye related)', 'ಕಣ್ಣಿಗೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(8, 'Dermatology  (Skin related)', 'ಚರ್ಮಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(9, 'Urinary system', 'ಮೂತ್ರಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-25 14:36:38'),
(10, 'Others', 'ಇತರೆ', 1, '2011-05-25 14:36:38'),
(11, 'Harmone System Eg. Diabetes', 'ಹಾರ್ಮೊನ್ ಗೆ ಸಂಬಂಧಿಸಿದ್ದು, ಸಕ್ಕರೆ ಕಾಹಿಲೆ', 1, '2011-05-24 17:19:36'),
(12, 'Dental', 'ಹಲ್ಲಿಗೆ ಸಂಬಂಧಿಸಿದ್ದು', 1, '2011-05-24 17:19:36'),
(13, 'Respiratory System (including Asthma, pneumonia)', 'ಸ್ವಾಶಕೋಶಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು (ಅಸ್ತಮ, ನ್ಯುಮೊನಿಯ ಇತ್ಯಾದ', 1, '2011-05-24 17:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_districtlist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_districtlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_master_districtlist`
--

INSERT INTO `ourbank_master_districtlist` (`id`, `name`, `name_regional`, `state_id`, `created_by`, `Created_date`) VALUES
(3, 'Tumkur', 'ತುಮಕೂರು', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_districtlist-test`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_districtlist-test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `ourbank_master_districtlist-test`
--

INSERT INTO `ourbank_master_districtlist-test` (`id`, `name`, `name_regional`, `state_id`, `created_by`, `Created_date`) VALUES
(1, 'Bagalkot', '', 1, 1, '2011-05-25 14:37:34'),
(2, 'Bangalore Rural', '', 1, 1, '2011-05-25 14:37:34'),
(3, 'Bangalore Urban', '', 1, 1, '2011-05-25 14:37:34'),
(4, 'Belagavi', '', 1, 1, '2011-05-25 14:37:34'),
(5, 'Bellary', '', 1, 1, '2011-05-25 14:37:34'),
(6, 'Bidar', '', 1, 1, '2011-05-25 14:37:34'),
(7, 'Bijapur', '', 1, 1, '2011-05-25 14:37:34'),
(8, 'Chamarajanagar', '', 1, 1, '2011-05-25 14:37:34'),
(9, 'Chikmagalur', '', 1, 1, '2011-05-25 14:37:34'),
(10, 'Chitradurga', '', 1, 1, '2011-05-25 14:37:34'),
(11, 'Dakshina Kannada', '', 1, 1, '2011-05-25 14:37:34'),
(12, 'Davanagere', '', 1, 1, '2011-05-25 14:37:34'),
(13, 'Dharwad', '', 1, 1, '2011-05-25 14:37:34'),
(14, 'Gadag', '', 1, 1, '2011-05-25 14:37:34'),
(15, 'Gulbarga', '', 1, 1, '2011-05-25 14:37:34'),
(16, 'Hassan', '', 1, 1, '2011-05-25 14:37:34'),
(17, 'Haveri', '', 1, 1, '2011-05-25 14:37:34'),
(18, 'Kodagu', '', 1, 1, '2011-05-25 14:37:34'),
(19, 'Kolar', '', 1, 1, '2011-05-25 14:37:34'),
(20, 'Koppal', '', 1, 1, '2011-05-25 14:37:34'),
(21, 'Mandya', '', 1, 1, '2011-05-25 14:37:34'),
(22, 'Mysore', '', 1, 1, '2011-05-25 14:37:34'),
(23, 'Raichur', '', 1, 1, '2011-05-25 14:37:34'),
(24, 'Shimoga', '', 1, 1, '2011-05-25 14:37:34'),
(25, 'Tumkur', '', 1, 1, '2011-05-25 14:37:34'),
(26, 'Udupi', '', 1, 1, '2011-05-25 14:37:34'),
(27, 'Uttara Kannada', '', 1, 1, '2011-05-25 14:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_educationtype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_educationtype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ourbank_master_educationtype`
--

INSERT INTO `ourbank_master_educationtype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Illiterate', 'ಅನಕ್ಷರಸ್ಥ', 1, '2011-05-25 14:39:11'),
(2, 'Literate (Without Educational ', 'ಅಕ್ಷರಸ್ಥ (ವಿಧ್ಯಾಭ್ಯಾಸ ಇಲ್ಲದೆ)', 1, '2011-05-25 14:39:11'),
(3, 'Matriculation/SSLC', 'ಮೆಟ್ರಿಕ್ಯುಲೇಟ್/ಎಸ್ ಎಸ್ ಎಲ್ ಸಿ', 1, '2011-05-25 14:39:11'),
(4, 'Pre- University', 'ಪಿಯುಸಿ', 1, '2011-05-25 14:39:11'),
(5, 'ITI/Certificate', 'ಐಟಿಐ/ಸರ್ಟಿಫಿಕೇಟ್', 1, '2011-05-25 14:39:11'),
(6, 'Diploma in Engineering', 'ಇಂಜಿನಿಯರಿಂಗ್ ಡಿಪ್ಲೋಮ', 1, '2011-05-25 14:39:11'),
(7, 'Graduate', 'ಪದವಿಧರ', 1, '2011-05-25 14:39:11'),
(8, 'Post Graduate', 'ಸ್ನಾತಕೋತ್ತರ ಪದವಿಧರ', 1, '2011-05-25 14:39:11'),
(9, 'Others', 'ಇತರೆ', 1, '2011-05-25 14:39:11'),
(10, 'Primary', 'ಪ್ರಾಥಮಿಕ (1-4 ನೇ ತರಗತಿ)', 1, '2011-05-25 14:39:11'),
(11, 'Middle', 'ಮಾಧ್ಯಮಿಕ (4-7ನೇ ತರಗತಿ)', 1, '2011-05-25 14:39:11'),
(12, 'High', 'ಪ್ರೌಡ (8-9ನೇ ತರಗತಿ)', 1, '2011-05-25 14:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_employmenttype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_employmenttype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ourbank_master_employmenttype`
--

INSERT INTO `ourbank_master_employmenttype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Self-Employed', 'ಸ್ವಯಂ ಉದ್ಯೋಗಿ', 1, '2011-05-25 14:40:18'),
(2, 'Employed - Govt sector - salaried', 'ಉದ್ಯೋಗಿ - ಸರ್ಕಾರಿ ವಲಯ - ಸಂಬಳ', 1, '2011-05-25 14:40:18'),
(3, 'Employed - Govt sector - daily wage', 'ಉದ್ಯೋಗಿ - ಸರ್ಕಾರಿ ವಲಯ - ದಿನಗೂಲಿ', 1, '2011-05-25 14:40:18'),
(4, 'Employed - Private sector - salaried', 'ಉದ್ಯೋಗಿ - ಖಾಸಗಿ ವಲಯ - ಸಂಬಳ', 1, '2011-05-25 14:40:18'),
(5, 'Employed - Private sector - temporary', 'ಉದ್ಯೋಗಿ - ಖಾಸಗಿ ವಲಯ - ದಿನಗೂಲಿ', 1, '2011-05-25 14:40:18'),
(6, 'Daily wage worker', 'ದಿನಗೂಲಿ ನೌಕರ', 1, '2011-05-25 14:40:18'),
(7, 'Housewife/within house worker', 'ಗೃಹಿಣಿ / ತನ್ನ ಮನೆಗಾಗಿಯಷ್ಟೇ ದುಡೀಯುವವರು', 1, '2011-05-25 14:40:18'),
(8, 'Unemployed', 'ನಿರುದ್ಯೋಗಿ', 1, '2011-05-25 14:40:18'),
(9, 'Student', 'ವಿದ್ಯಾರ್ಥಿ', 1, '2011-05-25 14:40:18'),
(10, 'Student out of school/discontinued', 'ವಿದ್ಯಾರ್ಥಿ ಆಗಿರಬೇಕಿತ್ತು, ಈಗ ಓದುತ್ತಿಲ್ಲ', 1, '2011-05-25 14:40:18'),
(11, 'Idle, unable', 'ಏನೂ ಮಾಡುತ್ತಿಲ್ಲ/ಕೈಲಾಗುತ್ತಿಲ್ಲ', 1, '2011-05-25 14:40:18'),
(12, 'Others', 'ಇತರೆ', 1, '2011-05-25 14:40:18'),
(13, 'other', 'other', 0, '0000-00-00 00:00:00'),
(14, 'self', 'self', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_entitlements`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_entitlements` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_entitlements`
--

INSERT INTO `ourbank_master_entitlements` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Old Age pension', 'ವೃದ್ದಾಪ್ಯ ವೇತನ (ಈಗ ಬರುತ್ತಿದೆ)', 1, '2011-05-25 14:41:28'),
(2, 'Widow pension', 'ವಿಧವಾ ವೇತನ (ಈಗ ಬರುತ್ತಿದೆ)', 1, '2011-05-25 14:41:28'),
(3, 'Physically handicapped Pension @ Rs 400 per month', 'ಅಂಗವಿಕಲ ವೇತನ (ಈಗ 400 ರೂ ತಿಂಗಳಿಗೆ ಬರುತ್ತಿದೆ)', 1, '2011-05-25 14:41:28'),
(4, 'Physically handicapped Pension @ Rs 1000 per month', 'ಅಂಗವಿಕಲ ವೇತನ (ಈಗ 1000 ರೂ ತಿಂಗಳಿಗೆ ಬರುತ್ತಿದೆ)', 1, '2011-05-25 14:41:28'),
(5, 'None', '', 1, '2011-05-25 14:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_expense`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ourbank_master_expense`
--

INSERT INTO `ourbank_master_expense` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Rabi agricultural expenses', 'ಮುಂಗಾರು ಕೃಷಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(2, 'Kharif agricultural expenses', 'ಹಿಂಗಾರು ಕೃಷಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(3, 'Summer agricultural expenses', 'ಬೇಸಿಗೆ ಕೃಷಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(4, 'Perrinial crops expenses', 'ವಾರ್ಷಿಕ ಬೆಳೆ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(5, 'Expenses of the animal husband', 'ಜಾನುವಾರು ಸಾಕಾಣಿಕೆ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(6, 'Expenses of the Grossary', 'ಪಡಿತರ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(7, 'Expenses of the vegetables', 'ತರಕಾರಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(8, 'Expenses of the transport', 'ಸಾರಿಗೆ/ಸಂಪರ್ಕ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(9, 'Interst on loans', 'ಸಾಲದ ಮೇಲಿನ ಬಡ್ಡಿ', 1, '2011-06-28 19:52:09'),
(10, 'Educational expenses', 'ಶಿಕ್ಷಣಕಾಗಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(11, 'Medical expenses', 'ಆರೋಗ್ಯದ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(12, 'Fuel', 'ಇಂಧನದ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(13, 'Festivals', 'ಹಬ್ಬಗಳಿಗಾಗಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(14, 'Clothes', 'ಬಟ್ತೆ ಖರೀಧಿಗಾಗಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(15, 'Habbits', 'ದುಶ್ಚಟಗಳಿಗಾಗಿ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(16, 'Phone/mobile', 'ಮೊಬೈಲ್ ಬಳಕೆ ಖರ್ಚು', 1, '2011-06-28 19:52:09'),
(17, 'others', 'ಇತರೆ ಖರ್ಚು', 1, '2011-06-28 19:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familyexpense`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familyexpense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_master_familyexpense`
--

INSERT INTO `ourbank_master_familyexpense` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Festivals', '', 1, '2011-05-25 14:45:39'),
(2, 'Clothes', '', 1, '2011-05-25 14:45:39'),
(3, 'crops expense', '', 1, '2011-05-25 14:45:39'),
(4, 'Expense of the grossary', '', 1, '2011-05-25 14:45:39'),
(5, 'Expense of the vegetables', '', 1, '2011-05-25 14:45:39'),
(6, 'Expense of the transport', '', 1, '2011-05-25 14:45:39'),
(7, 'interest on loans', '', 1, '2011-05-25 14:45:39'),
(8, 'Educational expenses', '', 1, '2011-05-25 14:45:39'),
(9, 'Fuel', '', 1, '2011-05-25 14:45:39'),
(10, 'Habbits', '', 1, '2011-05-25 14:45:39'),
(11, 'Phone/Mobile', '', 1, '2011-05-25 14:45:39'),
(12, 'Others', '', 1, '2011-05-25 14:45:39'),
(13, 'Summer agriculture expense', '', 1, '2011-05-25 14:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familyincome`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familyincome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_familyincome`
--

INSERT INTO `ourbank_master_familyincome` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'rabi agricultural income', 'rabi agricultural income', 1, '2011-05-25 15:24:55'),
(2, 'kharif agricultural income', '', 1, '2011-05-25 15:24:55'),
(3, 'summer agricultural income', '', 1, '2011-05-25 15:24:55'),
(4, 'perrinial crops income', '', 1, '2011-05-25 15:24:55'),
(5, 'diary/goat/sheep/poultry incom', '', 1, '2011-05-25 15:24:55'),
(6, 'wages', '', 1, '2011-05-25 15:24:55'),
(7, 'sub callings', '', 1, '2011-05-25 15:24:55'),
(8, 'employment', '', 1, '2011-05-25 15:24:55'),
(9, 'others', '', 1, '2011-05-25 15:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familytype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familytype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_familytype`
--

INSERT INTO `ourbank_master_familytype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Nuclear/Small Family', 'ವಿಭಕ್ತ/ಸಣ್ಣ', 1, '2011-05-24 14:11:13'),
(2, 'Joint Family', 'ಅವಿಭಕ್ತ ಕುಟುಂಬ', 1, '2011-05-24 14:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_frequencypayment`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_frequencypayment` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_frequencypayment`
--

INSERT INTO `ourbank_master_frequencypayment` (`id`, `name`, `name_regional`, `value`) VALUES
(1, 'One time', '', 1),
(2, 'Daily', '', 1),
(3, 'Weekly', '', 7),
(4, 'Monthly', '', 30),
(5, 'Quarterly', '', 90),
(6, 'Half Yearly', '', 180),
(7, 'Yearly', '', 365),
(8, 'Any time', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_fundertype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_fundertype` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_fundertype`
--

INSERT INTO `ourbank_master_fundertype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Individual', '', 1, '2011-05-25 16:51:18'),
(2, 'Organization', '', 1, '2011-05-25 16:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_gender`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_gender`
--

INSERT INTO `ourbank_master_gender` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Male', 'ಗಂಡು', 1, '2011-06-24 22:52:54'),
(2, 'Female', 'ಹೆಣ್ಣು ', 1, '2011-06-28 19:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_gillapanchayath`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_gillapanchayath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hobli_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `hobli_id` (`hobli_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_gillapanchayath`
--

INSERT INTO `ourbank_master_gillapanchayath` (`id`, `name`, `name_regional`, `hobli_id`, `created_by`, `Created_date`) VALUES
(1, 'Krishnaraja Gilla', 'Krishnaraja Gilla', 1, 0, '2011-09-09 17:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_habit`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_habit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_habit`
--

INSERT INTO `ourbank_master_habit` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Drinking', 'ಧೂಮಪಾನ', 1, '2011-06-30 11:31:39'),
(2, 'Tobacco', 'ಮದ್ಯಪಾನ', 1, '2011-06-30 11:31:39'),
(3, 'others', 'ತಮ್ಬಾಕು', 1, '2011-06-30 11:31:39'),
(4, 'Smoking', 'ಇತರೆ', 1, '2011-06-30 11:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_habitation`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_habitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `village_id` (`village_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_habitation`
--

INSERT INTO `ourbank_master_habitation` (`id`, `name`, `name_regional`, `village_id`, `created_by`, `created_date`) VALUES
(1, 'Vandalur Habitation', 'Vandalur Habitation', 4, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_hoblilist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_hoblilist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `taluk_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `taluk_id` (`taluk_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_hoblilist`
--

INSERT INTO `ourbank_master_hoblilist` (`id`, `name`, `name_regional`, `taluk_id`, `created_by`, `created_date`) VALUES
(1, 'Samrajnagar Hobli', 'Samrajnagar Hobli', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_houseownership`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_houseownership` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_houseownership`
--

INSERT INTO `ourbank_master_houseownership` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Rented', '', 1, '2011-05-25 15:33:16'),
(2, 'Sahred family', '', 1, '2011-05-25 15:33:16'),
(3, 'owned with title', '', 1, '2011-05-25 15:33:16'),
(4, 'IAY/Govt scheme', '', 1, '2011-05-25 15:33:16'),
(5, 'Owned no title', '', 1, '2011-05-25 15:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_housingtype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_housingtype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_housingtype`
--

INSERT INTO `ourbank_master_housingtype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Hut', 'ಗುಡಿಸಲು/ ಕಚ್ಹಾ ಮನೆ', 1, '2011-05-25 15:34:12'),
(2, 'Sheet', 'ಶೀಟ್ ಮನೆ', 1, '2011-05-25 15:34:12'),
(3, 'Tiled', 'ಹೆಂಚಿನ ಮನೆ', 1, '2011-05-25 15:34:12'),
(4, 'RCC', 'ಆರ್. ಸಿ. ಸಿ', 1, '2011-05-25 15:34:12'),
(5, 'Others', 'ಇತರೆ', 1, '2011-05-25 15:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_income`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ourbank_master_income`
--

INSERT INTO `ourbank_master_income` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Rabi agricultural income', 'ಮುಂಗಾರು ಕೃಷಿ ಆದಾಯ', 1, '2011-06-28 19:56:06'),
(2, 'Kharif agricultural income', 'ಹಿಂಗಾರು ಕೃಷಿ ಆದಾಯ', 1, '2011-06-28 19:56:06'),
(3, 'Summer agricultural income', 'ಬೇಸಿಗೆ ಕೃಷಿ ಆದಾಯ', 1, '2011-06-28 19:56:06'),
(4, 'Perrinial crops income', 'ವಾರ್ಷಿಕ ಬೆಳೆ ಆದಾಯ', 1, '2011-06-28 19:56:06'),
(5, 'Diary income', 'ಹಾಲು ಉತ್ಪನ್ನದ ಮಾರಾಟ', 1, '2011-06-28 19:56:06'),
(6, 'goat income', 'ಮೇಕೆ ಮಾರಾಟ', 1, '2011-06-28 19:56:06'),
(7, 'sheep income', 'ಕುರಿ ಮಾರಟ', 1, '2011-06-28 19:56:06'),
(8, 'income from poultry', 'ಕೋಳಿ ಮಾರಟ', 1, '2011-06-28 19:56:06'),
(9, 'hen', 'ಕೂಲಿ', 1, '2011-06-28 19:56:06'),
(10, 'income from other sources', 'ಉಪ ಕಸುಬು', 1, '2011-06-28 19:58:31'),
(11, 'income due to profession', 'ವೃತ್ತಿ', 1, '2011-06-28 19:58:31'),
(12, 'others', 'ಇತರೆ', 1, '2011-06-28 19:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_instalstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_instalstatus` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_instalstatus`
--

INSERT INTO `ourbank_master_instalstatus` (`id`, `name`, `name_regional`) VALUES
(1, 'Open', ''),
(2, 'Paid', ''),
(3, 'Due', ''),
(4, 'Next due', ''),
(5, 'Over due', ''),
(6, 'Hold', ''),
(7, 'Closed', ''),
(8, 'Partial', '');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_institutions`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_institutions` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_institutions`
--

INSERT INTO `ourbank_master_institutions` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Grameena Welfare', '', 1, '2011-05-25 15:36:51'),
(2, 'Health clinic', '', 1, '2011-05-25 15:36:51'),
(3, 'Gubbi Women care society', '', 1, '2011-05-25 15:36:51'),
(4, 'Govt Hospital Gubbi', '', 1, '2011-05-25 15:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_insurance`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_insurance` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_insurance`
--

INSERT INTO `ourbank_master_insurance` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'None', 'ಇಲ್ಲ', 1, '2011-02-16 18:34:48'),
(2, 'Yeshaswini', 'ಯಶಸ್ವಿನಿ', 1, '2011-03-16 15:44:08'),
(3, 'Arogyashree', 'ಆರೊಗ್ಯ ಶ್ರೀ', 1, '2011-03-16 15:44:08'),
(4, 'RSBY', 'RSBY', 1, '2011-03-16 15:44:08'),
(5, 'Private', 'ಖಾಸಗಿ', 1, '2011-03-16 15:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_interest`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_interest` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_interest`
--

INSERT INTO `ourbank_master_interest` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'PM', '', 1, '2011-05-26 02:19:06'),
(2, 'PA', '', 1, '2011-05-26 02:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_interesttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_interesttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_interesttypes`
--

INSERT INTO `ourbank_master_interesttypes` (`id`, `description`, `name_regional`) VALUES
(2, 'Declining capital', '');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_kootas`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_kootas` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ourbank_master_kootas`
--

INSERT INTO `ourbank_master_kootas` (`id`, `name`, `name_regional`, `group_id`, `created_by`, `created_date`) VALUES
(1, 'Bilidevalaya', '', 0, 0, '0000-00-00 00:00:00'),
(2, 'Alappanagudde', '', 0, 0, '0000-00-00 00:00:00'),
(3, 'Ammanahatti', '', 0, 0, '0000-00-00 00:00:00'),
(4, 'Boralinganapalya', '', 0, 0, '0000-00-00 00:00:00'),
(5, 'Choudarypalya', '', 0, 0, '0000-00-00 00:00:00'),
(6, 'Doddamadure', '', 0, 0, '0000-00-00 00:00:00'),
(7, 'Gowdagere', '', 0, 0, '0000-00-00 00:00:00'),
(8, 'Hadonahalli', '', 0, 0, '0000-00-00 00:00:00'),
(9, 'Holalagunda ', '', 0, 0, '0000-00-00 00:00:00'),
(10, 'Hosahalli', '', 0, 0, '0000-00-00 00:00:00'),
(11, 'Jaladigere', '', 0, 0, '0000-00-00 00:00:00'),
(12, 'Kaggere', '', 0, 0, '0000-00-00 00:00:00'),
(13, 'Kannaguni', '', 0, 0, '0000-00-00 00:00:00'),
(14, 'Kattigehalli', '', 0, 0, '0000-00-00 00:00:00'),
(15, 'Kittaghatta', '', 0, 0, '0000-00-00 00:00:00'),
(16, 'Kodagihalli', '', 0, 0, '0000-00-00 00:00:00'),
(17, 'Muttugadahalli', '', 0, 0, '0000-00-00 00:00:00'),
(18, 'Siddapura ', '', 0, 0, '0000-00-00 00:00:00'),
(19, 'Sondekoppa', '', 0, 0, '0000-00-00 00:00:00'),
(20, 'Timmegowdanapalya', '', 0, 0, '0000-00-00 00:00:00'),
(21, 'Tubinakere', '', 0, 0, '0000-00-00 00:00:00'),
(22, 'Urkehalli', '', 0, 0, '0000-00-00 00:00:00'),
(23, 'Yadiyur', '', 0, 0, '0000-00-00 00:00:00'),
(24, '', '', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_kvs`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_kvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `koota_id` int(11) NOT NULL,
  `koota` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `village` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `shg` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=402 ;

--
-- Dumping data for table `ourbank_master_kvs`
--

INSERT INTO `ourbank_master_kvs` (`id`, `koota_id`, `koota`, `name_regional`, `village`, `shg`, `created_by`, `created_date`) VALUES
(1, 0, '', '', 'Amruthur', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(2, 0, '', '', 'Amruthur', 'Shri Veerabhadreshwar', 0, '0000-00-00 00:00:00'),
(3, 0, '', '', 'Amruthur', 'Shri Anjaneya', 0, '0000-00-00 00:00:00'),
(4, 0, '', '', 'Amruthur', 'Shri Kalabhairaveshwara', 0, '0000-00-00 00:00:00'),
(5, 0, '', '', 'Amruthur', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(6, 0, '', '', 'Amruthur', 'Lalitha ', 0, '0000-00-00 00:00:00'),
(7, 0, '', '', 'Amruthur', 'Umamaheshwari', 0, '0000-00-00 00:00:00'),
(8, 0, '', '', 'Amruthur', 'Shri Annapurneshwari', 0, '0000-00-00 00:00:00'),
(9, 0, '', '', 'Amruthur', 'Jaimaruti', 0, '0000-00-00 00:00:00'),
(10, 0, '', '', 'Amruthur', 'Veerabhadreswara', 0, '0000-00-00 00:00:00'),
(11, 0, '', '', 'Amruthur', 'Maruti JLG', 0, '0000-00-00 00:00:00'),
(12, 0, '', '', 'Amruthur', 'Lakshmivenkateswara JLG', 0, '0000-00-00 00:00:00'),
(13, 0, '', '', 'Amruthur', 'Ambabhavani', 0, '0000-00-00 00:00:00'),
(14, 0, '', '', 'Amruthur', 'Bairaveswara', 0, '0000-00-00 00:00:00'),
(15, 0, '', '', 'Amruthur', 'Vigneswara', 0, '0000-00-00 00:00:00'),
(16, 0, '', '', 'Renukanagara', 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(17, 0, '', '', 'kuvempunagar', 'Chalapati', 0, '0000-00-00 00:00:00'),
(18, 0, '', '', 'Indiranagara', 'Kalikamba', 0, '0000-00-00 00:00:00'),
(19, 0, '', '', 'Indiranagara', 'Sri Jagadeshwari', 0, '0000-00-00 00:00:00'),
(20, 0, '', '', 'Yachanahalli', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(21, 0, '', '', 'Shanuboganahalli', 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(22, 0, '', '', 'Shanuboganahalli', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(23, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Jai Karnataka ', 0, '0000-00-00 00:00:00'),
(24, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Ondematharam', 0, '0000-00-00 00:00:00'),
(25, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Kenkeramma', 0, '0000-00-00 00:00:00'),
(26, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Nurani', 0, '0000-00-00 00:00:00'),
(27, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Suryodaya', 0, '0000-00-00 00:00:00'),
(28, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Ambedkar', 0, '0000-00-00 00:00:00'),
(29, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Surya', 0, '0000-00-00 00:00:00'),
(30, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(31, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Pakija', 0, '0000-00-00 00:00:00'),
(32, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Subhash', 0, '0000-00-00 00:00:00'),
(33, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Shri Sharada', 0, '0000-00-00 00:00:00'),
(34, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Gagana', 0, '0000-00-00 00:00:00'),
(35, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(36, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Varalaxmi', 0, '0000-00-00 00:00:00'),
(37, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Bismilla', 0, '0000-00-00 00:00:00'),
(38, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'yarub', 0, '0000-00-00 00:00:00'),
(39, 1, 'Bilidevalaya', '', 'Bilidevalaya', 'Yallamma', 0, '0000-00-00 00:00:00'),
(40, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Bismilla', 0, '0000-00-00 00:00:00'),
(41, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(42, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(43, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Shri Mulakattamma', 0, '0000-00-00 00:00:00'),
(44, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Neralamma', 0, '0000-00-00 00:00:00'),
(45, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(46, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Jai Hanuman', 0, '0000-00-00 00:00:00'),
(47, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Shri Raghavendra', 0, '0000-00-00 00:00:00'),
(48, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Ilahi', 0, '0000-00-00 00:00:00'),
(49, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Sri Ranganatha', 0, '0000-00-00 00:00:00'),
(50, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Adhishakthi', 0, '0000-00-00 00:00:00'),
(51, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Sri Jaibhuvaneshwari', 0, '0000-00-00 00:00:00'),
(52, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(53, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Balaji', 0, '0000-00-00 00:00:00'),
(54, 2, 'Boralinganapalya', '', 'Boralinganapalya', 'Gagana', 0, '0000-00-00 00:00:00'),
(55, 3, 'Choudarypalya', '', 'Choudarypalya', 'Shri Manjunatha', 0, '0000-00-00 00:00:00'),
(56, 3, 'Choudarypalya', '', 'Choudarypalya', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(57, 3, 'Choudarypalya', '', 'Choudarypalya', 'Sri Ranga', 0, '0000-00-00 00:00:00'),
(58, 4, 'Muttugadahalli', '', 'Muttugadahalli', 'Shri Vighneshwara', 0, '0000-00-00 00:00:00'),
(59, 4, 'Muttugadahalli', '', 'Muttugadahalli', 'Thirumala', 0, '0000-00-00 00:00:00'),
(60, 5, 'Urkehalli', '', 'Urkehalli', 'Sri Ranganatha', 0, '0000-00-00 00:00:00'),
(61, 5, 'Urkehalli', '', 'Urkehalli', 'Sri Laxmiranganathaswami', 0, '0000-00-00 00:00:00'),
(62, 5, 'Urkehalli', '', 'Chottanahalli ', 'Maruthi', 0, '0000-00-00 00:00:00'),
(63, 5, 'Urkehalli', '', 'Chottanahalli ', 'Shri Lakshmi', 0, '0000-00-00 00:00:00'),
(64, 0, '', '', 'Jinnaagara', 'Sri Doddammadevi', 0, '0000-00-00 00:00:00'),
(65, 0, '', '', 'Jinnaagara', 'Sri Vinayaka ', 0, '0000-00-00 00:00:00'),
(66, 0, '', '', 'Jinnaagara', 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(67, 0, '', '', 'Jinnaagara', 'Akashaya', 0, '0000-00-00 00:00:00'),
(68, 0, '', '', 'Jinnaagara', 'Bagatsingh', 0, '0000-00-00 00:00:00'),
(69, 0, '', '', 'Jinnaagara', 'Sri Chaluvarayaswamy', 0, '0000-00-00 00:00:00'),
(70, 0, '', '', 'Jinnaagara', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(71, 0, '', '', 'Jinnaagara', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(72, 0, '', '', 'Jinnaagara', 'Guliraya', 0, '0000-00-00 00:00:00'),
(73, 0, '', '', 'Jinnaagara', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(74, 0, '', '', 'Jinnaagara', 'Shri Bhoomithayi', 0, '0000-00-00 00:00:00'),
(75, 0, '', '', 'Jinnaagara', 'Sri Boredevaru', 0, '0000-00-00 00:00:00'),
(76, 0, '', '', 'Jinnaagara', 'Vivekananda', 0, '0000-00-00 00:00:00'),
(77, 0, '', '', 'Sanaba', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(78, 0, '', '', 'Sanaba', 'Sri Gaddehuchamma', 0, '0000-00-00 00:00:00'),
(79, 0, '', '', 'Sanaba', 'Sri Huttadamayamma', 0, '0000-00-00 00:00:00'),
(80, 0, '', '', 'Sanaba', 'Sri Cheluvarayaswamy', 0, '0000-00-00 00:00:00'),
(81, 0, '', '', 'Sanaba', 'Gangaparameshwari', 0, '0000-00-00 00:00:00'),
(82, 0, '', '', 'Sanaba', 'Sri Channakeshva', 0, '0000-00-00 00:00:00'),
(83, 0, '', '', 'Sanaba', 'Shri Varadevi', 0, '0000-00-00 00:00:00'),
(84, 0, '', '', 'Sanaba', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(85, 0, '', '', 'Sanaba', 'Shri Laxmammadevi', 0, '0000-00-00 00:00:00'),
(86, 0, '', '', 'Sanaba', 'Shri Chamundeshwari', 0, '0000-00-00 00:00:00'),
(87, 0, '', '', 'Hosakere', 'Sri Kalabairaveshwara', 0, '0000-00-00 00:00:00'),
(88, 0, '', '', 'Hosakere', 'Sri Gangadhareshwara', 0, '0000-00-00 00:00:00'),
(89, 0, '', '', 'Hosakere', 'Sri Honnereluhuchamma', 0, '0000-00-00 00:00:00'),
(90, 0, '', '', 'Hosakere', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(91, 0, '', '', 'Hosakere', 'Sri Sharadambe', 0, '0000-00-00 00:00:00'),
(92, 0, '', '', 'Hosakere', 'Sri Boredevara', 0, '0000-00-00 00:00:00'),
(93, 0, '', '', 'Kuppe', 'Sri Kadagalingeshwara', 0, '0000-00-00 00:00:00'),
(94, 0, '', '', 'Kuppe', 'Kempegowda', 0, '0000-00-00 00:00:00'),
(95, 0, '', '', 'Kuppe', 'Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(96, 0, '', '', 'Belligere', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(97, 0, '', '', 'Handalagere', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(98, 6, 'Kaggere', '', 'Kaggere', 'Dandinamma', 0, '0000-00-00 00:00:00'),
(99, 6, 'Kaggere', '', 'Kaggere', 'Dandinamma adhti', 0, '0000-00-00 00:00:00'),
(100, 6, 'Kaggere', '', 'Kaggere', 'Suryodaya', 0, '0000-00-00 00:00:00'),
(101, 6, 'Kaggere', '', 'Kaggere', 'Shri Narashimhaswamy JLG', 0, '0000-00-00 00:00:00'),
(102, 6, 'Kaggere', '', 'Kaggere', 'Pragathi JLG', 0, '0000-00-00 00:00:00'),
(103, 6, 'Kaggere', '', 'Kaggere', 'Shri Laksmi JLG', 0, '0000-00-00 00:00:00'),
(104, 6, 'Kaggere', '', 'Kaggere', 'Navodaya', 0, '0000-00-00 00:00:00'),
(105, 6, 'Kaggere', '', 'Venkategowdanapalya', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(106, 6, 'Kaggere', '', 'Venkategowdanapalya', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(107, 7, 'Timmegowdanapalya', '', 'Timmegowdanapalya', 'Padmavathi', 0, '0000-00-00 00:00:00'),
(108, 7, 'Timmegowdanapalya', '', 'Timmegowdanapalya', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(109, 7, 'Timmegowdanapalya', '', 'Timmegowdanapalya', 'Vigneshwara', 0, '0000-00-00 00:00:00'),
(110, 7, 'Timmegowdanapalya', '', 'Timmegowdanapalya', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(111, 8, 'Gowdagere', '', 'Gowdagere', 'Chaluvarayaswamy', 0, '0000-00-00 00:00:00'),
(112, 9, 'Kattigehalli', '', 'Kattigehalli', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(113, 9, 'Kattigehalli', '', 'Dombarahatti', 'Shri Kollapuradamma', 0, '0000-00-00 00:00:00'),
(114, 9, 'Kattigehalli', '', 'Giriyappanapalya', 'Shri Kollapuradamma', 0, '0000-00-00 00:00:00'),
(115, 9, 'Kattigehalli', '', 'Rangegoudanapalya', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(116, 0, '', '', 'KH halli', 'Gangadhareshwara', 0, '0000-00-00 00:00:00'),
(117, 0, '', '', 'KH halli', 'Sri Rama', 0, '0000-00-00 00:00:00'),
(118, 0, '', '', 'KH halli', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(119, 0, '', '', 'KH halli', 'Sri Beemrao', 0, '0000-00-00 00:00:00'),
(120, 0, '', '', 'KH halli', 'Sri Channakeshava', 0, '0000-00-00 00:00:00'),
(121, 0, '', '', 'KH halli', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(122, 0, '', '', 'KH halli', 'Sri Kalabairaveshwara JLG', 0, '0000-00-00 00:00:00'),
(123, 0, '', '', 'KH halli', 'Sri Kalabairaveshwara', 0, '0000-00-00 00:00:00'),
(124, 0, '', '', 'KH halli', 'Shri Kodilakkamma', 0, '0000-00-00 00:00:00'),
(125, 0, '', '', 'Korati', 'Basaveshwara', 0, '0000-00-00 00:00:00'),
(126, 0, '', '', 'Puttanapalya', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(127, 0, '', '', 'Puttanapalya', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(128, 0, '', '', 'Puttanapalya', 'Veeranjaneya', 0, '0000-00-00 00:00:00'),
(129, 0, '', '', 'Puttanapalya', 'Kalabhairaveshwara', 0, '0000-00-00 00:00:00'),
(130, 0, '', '', 'Gajjanapalya', 'Shri Laxminarasimhaswami', 0, '0000-00-00 00:00:00'),
(131, 0, '', '', 'Gajjanapalya', 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(132, 0, '', '', 'Halagere', 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(133, 0, '', '', 'Halagere', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(134, 0, '', '', 'Halagere', 'Laxmi Venkateshwara', 0, '0000-00-00 00:00:00'),
(135, 0, '', '', 'Halagere', 'Kempegouda', 0, '0000-00-00 00:00:00'),
(136, 0, '', '', 'Halagere', 'Huyyalamma', 0, '0000-00-00 00:00:00'),
(137, 0, '', '', 'Halagere', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(138, 0, '', '', 'Halagere', 'Ankanatheshwara', 0, '0000-00-00 00:00:00'),
(139, 0, '', '', 'Sanabagatta', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(140, 0, '', '', 'Sanabagatta', 'Gomathe', 0, '0000-00-00 00:00:00'),
(141, 0, '', '', 'Sanabagatta', 'Huliyuramma', 0, '0000-00-00 00:00:00'),
(142, 0, '', '', 'Sanabagatta', 'Jai Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(143, 0, '', '', 'Sanabagatta', 'Bhumathe', 0, '0000-00-00 00:00:00'),
(144, 0, '', '', 'Bydagere', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(145, 0, '', '', 'Bydagere', 'Kalikhamba', 0, '0000-00-00 00:00:00'),
(146, 0, '', '', 'Bydagere', 'Srinivasa', 0, '0000-00-00 00:00:00'),
(147, 0, '', '', 'Bydagere', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(148, 10, 'Kodagihalli', '', 'Mallapura', 'Shri Bandhamma', 0, '0000-00-00 00:00:00'),
(149, 11, 'Tubinakere', '', 'Devarayanapalya', 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(150, 11, 'Tubinakere', '', 'Tubinakere', 'Sri Annapurneshwari', 0, '0000-00-00 00:00:00'),
(151, 11, 'Tubinakere', '', 'Tubinakere', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(152, 11, 'Tubinakere', '', 'Tubinakere', 'Sri Jai Maruthi', 0, '0000-00-00 00:00:00'),
(153, 11, 'Tubinakere', '', 'Tubinakere', 'Shri Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(154, 11, 'Tubinakere', '', 'Tubinakere', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(155, 11, 'Tubinakere', '', 'Tubinakere', 'Sri Mahadeshwara', 0, '0000-00-00 00:00:00'),
(156, 11, 'Tubinakere', '', 'Tubinakere', 'Sri Sharadamba', 0, '0000-00-00 00:00:00'),
(157, 12, 'Sondekoppa', '', 'Sondekoppa', 'Sri Chiranjeevi', 0, '0000-00-00 00:00:00'),
(158, 12, 'Sondekoppa', '', 'Sondekoppa', 'Sri Jaimaruthi', 0, '0000-00-00 00:00:00'),
(159, 12, 'Sondekoppa', '', 'Sondekoppa', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(160, 13, 'Hosahalli', '', 'Hosahalli', 'Shri Adishakti', 0, '0000-00-00 00:00:00'),
(161, 14, 'Holalagunda ', '', 'Holalagunda ', 'Shri Siddhalingeshwara', 0, '0000-00-00 00:00:00'),
(162, 14, 'Holalagunda ', '', 'Holalagunda ', 'Sri Umamaheshwari', 0, '0000-00-00 00:00:00'),
(163, 14, 'Holalagunda ', '', 'Holalagunda ', 'Sri Bhagyalakshmi', 0, '0000-00-00 00:00:00'),
(164, 14, 'Holalagunda ', '', 'Holalagunda ', 'Sri Nandhini', 0, '0000-00-00 00:00:00'),
(165, 14, 'Holalagunda ', '', 'Holalagunda ', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(166, 14, 'Holalagunda ', '', 'Holalagunda ', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(167, 14, 'Holalagunda ', '', 'Madihalli', 'Shri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(168, 14, 'Holalagunda ', '', 'Madihalli', 'Shri Basaveshwara ', 0, '0000-00-00 00:00:00'),
(169, 14, 'Holalagunda ', '', 'Bidarakattepalya ', 'Shri Pattaladamma ', 0, '0000-00-00 00:00:00'),
(170, 0, '', '', 'Thippur', 'Shri Bettada Thimmappaswami', 0, '0000-00-00 00:00:00'),
(171, 0, '', '', 'Koppa', 'Shri Anjaneyaswami', 0, '0000-00-00 00:00:00'),
(172, 0, '', '', 'Gollarahatti', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(173, 0, '', '', 'Hulivana', 'Sri Bumithayi', 0, '0000-00-00 00:00:00'),
(174, 0, '', '', 'Hulivana', 'Sri Devi', 0, '0000-00-00 00:00:00'),
(175, 0, '', '', 'Hulivana', 'Sri Bhumithayi', 0, '0000-00-00 00:00:00'),
(176, 0, '', '', 'Hulivana', 'Bhoodevi', 0, '0000-00-00 00:00:00'),
(177, 0, '', '', 'Kantanahalli', 'Shri Bhuredevaru', 0, '0000-00-00 00:00:00'),
(178, 0, '', '', 'Markonahalli', 'Sri Timmarayaswamy', 0, '0000-00-00 00:00:00'),
(179, 0, '', '', 'Markonahalli', 'Subaschandrabos', 0, '0000-00-00 00:00:00'),
(180, 0, '', '', 'Markonahalli', 'Sir.M Vishweshwaraiah', 0, '0000-00-00 00:00:00'),
(181, 0, '', '', 'Markonahalli', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(182, 0, '', '', 'Markonahalli', 'Sri Mayammadevi', 0, '0000-00-00 00:00:00'),
(183, 0, '', '', 'Markonahalli', 'MPA', 0, '0000-00-00 00:00:00'),
(184, 0, '', '', 'Markonahalli', 'Sri Siddeshwara', 0, '0000-00-00 00:00:00'),
(185, 0, '', '', 'Markonahalli', 'Bargavi', 0, '0000-00-00 00:00:00'),
(186, 0, '', '', 'Markonahalli', 'Sri Srinivasa', 0, '0000-00-00 00:00:00'),
(187, 0, '', '', 'Markonahalli', 'Ambedkar', 0, '0000-00-00 00:00:00'),
(188, 0, '', '', 'Markonahalli', 'Spoorthi', 0, '0000-00-00 00:00:00'),
(189, 0, '', '', 'Markonahalli', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(190, 0, '', '', 'Tippuru', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(191, 0, '', '', 'Tippuru', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(192, 0, '', '', 'Tippuru', 'Anjaneya', 0, '0000-00-00 00:00:00'),
(193, 0, '', '', 'Mantya', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(194, 0, '', '', 'Mantya', 'Sri Lakshidevi', 0, '0000-00-00 00:00:00'),
(195, 0, '', '', 'Mantya', 'Sri Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(196, 0, '', '', 'Mantya', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(197, 0, '', '', 'Mantya', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(198, 0, '', '', 'Mantya', 'Sri Balaji', 0, '0000-00-00 00:00:00'),
(199, 0, '', '', 'Mantya', 'Channakeshava', 0, '0000-00-00 00:00:00'),
(200, 0, '', '', 'Mantya', 'Shri Adishakti', 0, '0000-00-00 00:00:00'),
(201, 0, '', '', 'Kiranguru', 'Jaimaruthi', 0, '0000-00-00 00:00:00'),
(202, 0, '', '', 'Hanumapura', 'Ambedkar', 0, '0000-00-00 00:00:00'),
(203, 0, '', '', 'Kiranguru', 'Saraswati', 0, '0000-00-00 00:00:00'),
(204, 0, '', '', 'Kiranguru', 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(205, 0, '', '', 'Bisinele', 'Sitapathi', 0, '0000-00-00 00:00:00'),
(206, 0, '', '', 'Bisinele', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(207, 0, '', '', 'Kadashettihalli', 'Shri Channakeshava', 0, '0000-00-00 00:00:00'),
(208, 15, 'Alappanagudde', '', 'Alappanagudde', 'Jafar Sadhif', 0, '0000-00-00 00:00:00'),
(209, 15, 'Alappanagudde', '', 'Alappanagudde', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(210, 15, 'Alappanagudde', '', 'Alappanagudde', 'Gangotri', 0, '0000-00-00 00:00:00'),
(211, 16, 'Kannaguni', '', 'Kalasegowdanapalya', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(212, 16, 'Kannaguni', '', 'Kannaguni', 'Shri Ranganatha', 0, '0000-00-00 00:00:00'),
(213, 16, 'Kannaguni', '', 'Kannaguni', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(214, 16, 'Kannaguni', '', 'Kannaguni', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(215, 16, 'Kannaguni', '', 'Nagegowdanapalya', 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(216, 16, 'Kannaguni', '', 'Kodipalya', 'Mujameel', 0, '0000-00-00 00:00:00'),
(217, 16, 'Kannaguni', '', 'Kodipalya', 'Sulthana', 0, '0000-00-00 00:00:00'),
(218, 16, 'Kannaguni', '', 'Kodipalya', 'Shaphiya', 0, '0000-00-00 00:00:00'),
(219, 16, 'Kannaguni', '', 'Kodipalya', 'Shri  Vinayaka', 0, '0000-00-00 00:00:00'),
(220, 16, 'Kannaguni', '', 'Kodipalya', 'Shri Mahalaxmi', 0, '0000-00-00 00:00:00'),
(221, 16, 'Kannaguni', '', 'Megalaplya', 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(222, 16, 'Kannaguni', '', 'Nagegowdanapalya', 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(223, 16, 'Kannaguni', '', 'Hadonahalli', 'Sri muttinammadevi', 0, '0000-00-00 00:00:00'),
(224, 16, 'Kannaguni', '', 'Hadonahalli', 'Sri Ranganathaswamy JLG', 0, '0000-00-00 00:00:00'),
(225, 16, 'Kannaguni', '', 'Hadonahalli', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(226, 17, 'Siddapura ', '', 'Nagegowdanapalya', 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(227, 17, 'Siddapura ', '', 'Nagegowdanapalya', 'Chamundeshwari', 0, '0000-00-00 00:00:00'),
(228, 17, 'Siddapura ', '', 'Siddapura ', 'Tippu', 0, '0000-00-00 00:00:00'),
(229, 17, 'Siddapura ', '', 'Siddapura ', 'Jai Bharat', 0, '0000-00-00 00:00:00'),
(230, 17, 'Siddapura ', '', 'Siddapura ', 'Indian', 0, '0000-00-00 00:00:00'),
(231, 18, 'Hadonahalli', '', 'Hadonahalli', 'Sri Timmarayaswamy', 0, '0000-00-00 00:00:00'),
(232, 18, 'Hadonahalli', '', 'Hadonahalli', 'Sri muttinammadevi', 0, '0000-00-00 00:00:00'),
(233, 18, 'Hadonahalli', '', 'Hadonahalli', 'Sri Ranganathaswamy JLG', 0, '0000-00-00 00:00:00'),
(234, 18, 'Hadonahalli', '', 'Hadonahalli', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(235, 0, '', '', 'Nagasandra', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(236, 0, '', '', 'Nagasandra', 'Sri Anjaneya', 0, '0000-00-00 00:00:00'),
(237, 0, '', '', 'Nagasandra', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(238, 0, '', '', 'Nagasandra', 'Sri Hattimaramma', 0, '0000-00-00 00:00:00'),
(239, 0, '', '', 'Nagasandra', 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(240, 0, '', '', 'Nagasandra', 'Sri Varalakshmi', 0, '0000-00-00 00:00:00'),
(241, 0, '', '', 'Nagasandra', 'Sri Lakshmiranganathaswamy', 0, '0000-00-00 00:00:00'),
(242, 0, '', '', 'Nagasandra', 'Sri Kannikaparameshwari', 0, '0000-00-00 00:00:00'),
(243, 0, '', '', 'Nagasandra', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(244, 0, '', '', 'Nagasandra', 'Shri Bhairaveshwara', 0, '0000-00-00 00:00:00'),
(245, 0, '', '', 'Nagasandra', 'Sowmya Shree', 0, '0000-00-00 00:00:00'),
(246, 0, '', '', 'Nagasandra', 'Sri Kannadambe', 0, '0000-00-00 00:00:00'),
(247, 0, '', '', 'Devarakanasandra', 'Shri Chaluvarayaswami', 0, '0000-00-00 00:00:00'),
(248, 0, '', '', 'Kanchagalapura', 'Sri Malleshwaraswamy', 0, '0000-00-00 00:00:00'),
(249, 0, '', '', 'Shettibidu', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(250, 0, '', '', 'Shettibidu', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(251, 0, '', '', 'Shettibidu', 'Pranathi', 0, '0000-00-00 00:00:00'),
(252, 0, '', '', 'Hosuru', 'Sri Vijayalakshmi', 0, '0000-00-00 00:00:00'),
(253, 0, '', '', 'Hosuru', 'Sri Gramadevathe', 0, '0000-00-00 00:00:00'),
(254, 0, '', '', 'Jivajihatti', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(255, 0, '', '', 'Helavarahatti', 'Savyasachi', 0, '0000-00-00 00:00:00'),
(256, 0, '', '', 'Helavarahatti', 'Shri Renukamba', 0, '0000-00-00 00:00:00'),
(257, 0, '', '', 'Helavarahatti', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(258, 0, '', '', 'Tenginamaradapalya', 'Shri Kempammadevi', 0, '0000-00-00 00:00:00'),
(259, 0, '', '', 'Jiddigere', 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(260, 0, '', '', 'Jiddigere', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(261, 0, '', '', 'Jiddigere', 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(262, 0, '', '', 'Jiddigere', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(263, 0, '', '', 'Jiddigere', 'Shri Kempammadevi', 0, '0000-00-00 00:00:00'),
(264, 0, '', '', 'Jiddigere', 'Sri Timmappaswamy', 0, '0000-00-00 00:00:00'),
(265, 0, '', '', 'Megala Tenginmaradapalya', 'Shri Venkateshwar', 0, '0000-00-00 00:00:00'),
(266, 0, '', '', 'Megala Tenginmaradapalya', 'Shri Marammadevi', 0, '0000-00-00 00:00:00'),
(267, 0, '', '', 'Megala Tenginmaradapalya', 'Shri Nidhi', 0, '0000-00-00 00:00:00'),
(268, 0, '', '', 'Heddigere', 'Sri Huchammadevi', 0, '0000-00-00 00:00:00'),
(269, 0, '', '', 'Heddigere', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(270, 0, '', '', 'Turuganuru', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(271, 0, '', '', 'Turuganuru', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(272, 0, '', '', 'Turuganuru', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(273, 0, '', '', 'Turuganuru', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(274, 0, '', '', 'Turuganuru', 'Sri Bettadaranganathaswamy', 0, '0000-00-00 00:00:00'),
(275, 0, '', '', 'Kottegere', 'Shri Siddhalingeshwara', 0, '0000-00-00 00:00:00'),
(276, 0, '', '', 'Kottegere', 'Shri Veereshwara ', 0, '0000-00-00 00:00:00'),
(277, 0, '', '', 'Paduvagere', 'Sri Kollapurasamma', 0, '0000-00-00 00:00:00'),
(278, 0, '', '', 'Paduvagere', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(279, 0, '', '', 'Paduvagere', 'Sri Lakshminarasimhaswamy', 0, '0000-00-00 00:00:00'),
(280, 0, '', '', 'Paduvagere', 'Sri Hattimaramma', 0, '0000-00-00 00:00:00'),
(281, 0, '', '', 'Paduvagere', 'Sri  Rama', 0, '0000-00-00 00:00:00'),
(282, 0, '', '', 'Paduvagere', 'Sri Vinaaka', 0, '0000-00-00 00:00:00'),
(283, 0, '', '', 'Paduvagere', 'Sri Chowdamma', 0, '0000-00-00 00:00:00'),
(284, 0, '', '', 'Paduvagere', 'Sri Channakeshva', 0, '0000-00-00 00:00:00'),
(285, 0, '', '', 'Paduvagere', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(286, 0, '', '', 'Paduvagere', 'Laxmidevi', 0, '0000-00-00 00:00:00'),
(287, 0, '', '', 'Paduvagere', 'Sri Doddamma', 0, '0000-00-00 00:00:00'),
(288, 0, '', '', 'Chikka Arjunahalli', 'Huchhammadevi', 0, '0000-00-00 00:00:00'),
(289, 0, '', '', 'Bettahalli', 'Shri Laxmi-Venkateshwara', 0, '0000-00-00 00:00:00'),
(290, 0, '', '', 'Doddakallahalli', 'Sri Ganapathi', 0, '0000-00-00 00:00:00'),
(291, 0, '', '', 'Doddakallahalli', 'Chikkamma', 0, '0000-00-00 00:00:00'),
(292, 0, '', '', 'Doddakallahalli', 'Dr.B R ambedkar', 0, '0000-00-00 00:00:00'),
(293, 0, '', '', 'Doddakallahalli', 'Shri Durgeshwari', 0, '0000-00-00 00:00:00'),
(294, 0, '', '', 'Doddakallahalli', 'Shri Shrinivasaswami', 0, '0000-00-00 00:00:00'),
(295, 0, '', '', 'Doddakallahalli', 'Shri Anjaneyaswami', 0, '0000-00-00 00:00:00'),
(296, 0, '', '', 'Doddakallahalli', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(297, 0, '', '', 'Doddakallahalli', 'Parvathi', 0, '0000-00-00 00:00:00'),
(298, 0, '', '', 'Doddakallahalli', 'Sri Siddalingeshwara', 0, '0000-00-00 00:00:00'),
(299, 0, '', '', 'Doddakallahalli', 'Sharade', 0, '0000-00-00 00:00:00'),
(300, 0, '', '', 'Valagerepura', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(301, 0, '', '', 'Valagerepura', 'Sri Basaweshwara', 0, '0000-00-00 00:00:00'),
(302, 0, '', '', 'Valagerepura', 'Sri Anthashayana', 0, '0000-00-00 00:00:00'),
(303, 0, '', '', 'Valagerepura', 'Sri Tirupathivenkateshwaraswamy', 0, '0000-00-00 00:00:00'),
(304, 0, '', '', 'Valagerepura', 'Sri  Laxmidevi  ', 0, '0000-00-00 00:00:00'),
(305, 0, '', '', 'Valagerepura', 'Sri Manjunatha', 0, '0000-00-00 00:00:00'),
(306, 0, '', '', 'Valagerepura', 'Sri siddalingeshwara', 0, '0000-00-00 00:00:00'),
(307, 0, '', '', 'Valagerepura', 'Sri Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(308, 0, '', '', 'Valagerepura', 'Sri Aravinamaramma', 0, '0000-00-00 00:00:00'),
(309, 0, '', '', 'Valagerepura', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(310, 0, '', '', 'Valagerepura', 'Madheshwara', 0, '0000-00-00 00:00:00'),
(311, 0, '', '', 'Valagerepura', 'Mulakattamma', 0, '0000-00-00 00:00:00'),
(312, 0, '', '', 'Valagerepura', 'Shri Bhairaveshwarswami', 0, '0000-00-00 00:00:00'),
(313, 0, '', '', 'Valagerepura', 'Shri Laxminarasimhaswami', 0, '0000-00-00 00:00:00'),
(314, 0, '', '', 'Valagerepura', 'Sharadambe', 0, '0000-00-00 00:00:00'),
(315, 0, '', '', 'Valagerepura', 'Hanumantharaya', 0, '0000-00-00 00:00:00'),
(316, 0, '', '', 'Valagerepura', 'Sri Aravinamaramma', 0, '0000-00-00 00:00:00'),
(317, 0, '', '', 'Janatha Coloni', 'Bhagyalakshmi', 0, '0000-00-00 00:00:00'),
(318, 0, '', '', 'Benavara', 'Dr.B R ambedkar', 0, '0000-00-00 00:00:00'),
(319, 0, '', '', 'Benavara', 'Channakeshava', 0, '0000-00-00 00:00:00'),
(320, 0, '', '', 'Benavara', 'Aravinamaramma', 0, '0000-00-00 00:00:00'),
(321, 0, '', '', 'Benavara', 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(322, 0, '', '', 'Bettahalli', 'Hanumantharaya', 0, '0000-00-00 00:00:00'),
(323, 0, '', '', 'Yadavani', 'Sri Kalikhamba', 0, '0000-00-00 00:00:00'),
(324, 0, '', '', 'Yadavani', 'Eshwara', 0, '0000-00-00 00:00:00'),
(325, 0, '', '', 'Yadavani', 'Sri Vinayaka ', 0, '0000-00-00 00:00:00'),
(326, 0, '', '', 'Yadavani', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(327, 0, '', '', 'Yadavani', 'Sri Kuvempu', 0, '0000-00-00 00:00:00'),
(328, 0, '', '', 'Yadavani', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(329, 0, '', '', 'Yadavani', 'Aramba', 0, '0000-00-00 00:00:00'),
(330, 0, '', '', 'Yadavani', 'Bhumithayi', 0, '0000-00-00 00:00:00'),
(331, 0, '', '', 'Yadavani', 'Masthamma', 0, '0000-00-00 00:00:00'),
(332, 0, '', '', 'Yadavani', 'Basaveshwara', 0, '0000-00-00 00:00:00'),
(333, 0, '', '', 'Yadavani', 'Manchamma', 0, '0000-00-00 00:00:00'),
(334, 0, '', '', 'Yadavani', 'Kalamma', 0, '0000-00-00 00:00:00'),
(335, 0, '', '', 'Yadavani', 'Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(336, 0, '', '', 'Yadavani', 'Sinchana', 0, '0000-00-00 00:00:00'),
(337, 0, '', '', 'Yadavani', 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(338, 0, '', '', 'Yadavani', 'Huchhamma', 0, '0000-00-00 00:00:00'),
(339, 0, '', '', 'Yadavani', 'Adarsha ', 0, '0000-00-00 00:00:00'),
(340, 0, '', '', 'Kagganahalli', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(341, 0, '', '', 'Kagganahalli', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(342, 0, '', '', 'Hanchipura', 'Da.ra Bendre', 0, '0000-00-00 00:00:00'),
(343, 0, '', '', 'Hanchipura', 'Annapurneshwari', 0, '0000-00-00 00:00:00'),
(344, 0, '', '', 'Hanchipura', 'Sri Vaibhavalakshmi', 0, '0000-00-00 00:00:00'),
(345, 0, '', '', 'Hanchipura', 'Triveni Sangama', 0, '0000-00-00 00:00:00'),
(346, 0, '', '', 'Hanchipura', 'Bettadatimmappa', 0, '0000-00-00 00:00:00'),
(347, 0, '', '', 'Chandanahalli', 'Mailaralingeshwara', 0, '0000-00-00 00:00:00'),
(348, 0, '', '', 'Ungara', 'Madeshwara', 0, '0000-00-00 00:00:00'),
(349, 0, '', '', 'Ungara', 'Varadaraja', 0, '0000-00-00 00:00:00'),
(350, 0, '', '', 'Ungara', 'Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(351, 0, '', '', 'Ungara', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(352, 0, '', '', 'Ungara', 'Tapaswiraya', 0, '0000-00-00 00:00:00'),
(353, 0, '', '', 'Ungara', 'Sapthagiri', 0, '0000-00-00 00:00:00'),
(354, 0, '', '', 'Ungara', 'Shri Muttinamma', 0, '0000-00-00 00:00:00'),
(355, 0, '', '', 'Pallerayanahalli', 'Sri Varadappa', 0, '0000-00-00 00:00:00'),
(356, 0, '', '', 'Pallerayanahalli', 'Chunchanagiriyappa', 0, '0000-00-00 00:00:00'),
(357, 0, '', '', 'Pallerayanahalli', 'Sri Manchamma', 0, '0000-00-00 00:00:00'),
(358, 0, '', '', 'Pallerayanahalli', 'Kalabhairava', 0, '0000-00-00 00:00:00'),
(359, 0, '', '', 'Pallerayanahalli', 'Maramma', 0, '0000-00-00 00:00:00'),
(360, 0, '', '', 'Ammanahatti', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(361, 19, 'Yadiyur', '', 'Yadiyur', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(362, 19, 'Yadiyur', '', 'Yadiyur', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(363, 19, 'Yadiyur', '', 'Yadiyur', 'Parvathi', 0, '0000-00-00 00:00:00'),
(364, 19, 'Yadiyur', '', 'Beeraganahalli', 'Maheshwari', 0, '0000-00-00 00:00:00'),
(365, 19, 'Yadiyur', '', 'Beeraganahalli', 'Sri Vigneshwara', 0, '0000-00-00 00:00:00'),
(366, 19, 'Yadiyur', '', 'Beeraganahalli', 'Shri Vishweshwara', 0, '0000-00-00 00:00:00'),
(367, 19, 'Yadiyur', '', 'Beeraganahalli', 'Bhargavi', 0, '0000-00-00 00:00:00'),
(368, 19, 'Yadiyur', '', 'Beeraganahalli', 'Shri Maheshwari', 0, '0000-00-00 00:00:00'),
(369, 19, 'Yadiyur', '', 'Beeraganahalli', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(370, 20, 'Kittaghatta', '', 'Hosuru', 'Sri Siddalingeshwara', 0, '0000-00-00 00:00:00'),
(371, 20, 'Kittaghatta', '', 'Shattihalli', 'Shri Manchammadevii', 0, '0000-00-00 00:00:00'),
(372, 20, 'Kittaghatta', '', 'Hosuru', 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(373, 20, 'Kittaghatta', '', 'Y.Hampapura', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(374, 20, 'Kittaghatta', '', 'Y.Hampapura', 'Shri Mariyamma ', 0, '0000-00-00 00:00:00'),
(375, 20, 'Kittaghatta', '', 'Kittaghatta', 'Shri Bhairaveshwara', 0, '0000-00-00 00:00:00'),
(376, 21, 'Jaladigere', '', 'Jaladigere', 'Shri  Jaladigereyamma', 0, '0000-00-00 00:00:00'),
(377, 21, 'Jaladigere', '', 'Jaladigere', 'Shri Chikkamma', 0, '0000-00-00 00:00:00'),
(378, 21, 'Jaladigere', '', 'Jaladigere', 'Shri Adishakthi', 0, '0000-00-00 00:00:00'),
(379, 21, 'Jaladigere', '', 'Jaladigere', 'Shri Sharada', 0, '0000-00-00 00:00:00'),
(380, 21, 'Jaladigere', '', 'Jaladigere', 'Doddamma', 0, '0000-00-00 00:00:00'),
(381, 21, 'Jaladigere', '', 'Jaladigere', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(382, 21, 'Jaladigere', '', 'Jaladigere', 'Shri Byatarayaswami', 0, '0000-00-00 00:00:00'),
(383, 21, 'Jaladigere', '', 'Jaladigere', 'Shri Laxmi Venkateshwara', 0, '0000-00-00 00:00:00'),
(384, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Huchammadevi', 0, '0000-00-00 00:00:00'),
(385, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Mulukattammadevi', 0, '0000-00-00 00:00:00'),
(386, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Channakeshvaswamy', 0, '0000-00-00 00:00:00'),
(387, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Hattilakkamma', 0, '0000-00-00 00:00:00'),
(388, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Kempegowda', 0, '0000-00-00 00:00:00'),
(389, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Mallikarjunaswamy', 0, '0000-00-00 00:00:00'),
(390, 22, 'Doddamadure', '', 'Doddamadure', 'Sri Hebbagilubairava', 0, '0000-00-00 00:00:00'),
(391, 22, 'Doddamadure', '', 'Doddamadure', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(392, 22, 'Doddamadure', '', 'Madurepalya', 'Shri Vishwanatha', 0, '0000-00-00 00:00:00'),
(393, 22, 'Doddamadure', '', 'Madurepalya', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(394, 22, 'Doddamadure', '', 'Doddamadure', 'Shri Saraswatidevi', 0, '0000-00-00 00:00:00'),
(395, 22, 'Doddamadure', '', 'Doddamadure', 'Kamadhenu', 0, '0000-00-00 00:00:00'),
(396, 23, 'Ammanahatti', '', 'H.B.Shettihalli', 'Shri Beereshwar', 0, '0000-00-00 00:00:00'),
(397, 23, 'Ammanahatti', '', 'Thathayyanapalya', 'Venkateshwara', 0, '0000-00-00 00:00:00'),
(398, 23, 'Ammanahatti', '', 'Ammanahatti', 'Sri Saraswathidevi', 0, '0000-00-00 00:00:00'),
(399, 23, 'Ammanahatti', '', 'Singatihalli', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(400, 23, 'Ammanahatti', '', 'Kodipalya', 'Shri Thirumala', 0, '0000-00-00 00:00:00'),
(401, 23, 'Ammanahatti', '', 'Kodipalya', 'Shridevi', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_landacquisition`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_landacquisition` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_landacquisition`
--

INSERT INTO `ourbank_master_landacquisition` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Owned', 'ಸ್ವಂತದ್ದು', 1, '2011-05-25 15:38:46'),
(2, 'Taken on lease', 'ಭೋಗ್ಯಕ್ಕೆ/ವಾರಕ್ಕೆ ತೆಗೆದುಕೊಂಡಿರ', 1, '2011-05-25 15:38:46'),
(3, 'Taken on sharecropping', 'ಬೆಳೆ ಪಾಲುದಾರಿಕೆಗೆ ತೆಗೆದುಕೊಂಡಿರ', 1, '2011-05-25 15:38:46'),
(4, 'Others ', 'ಇತರೆ', 1, '2011-05-25 15:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_landtypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_landtypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_landtypes`
--

INSERT INTO `ourbank_master_landtypes` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Dry', 'ಖುಷ್ಕಿ', 1, '2011-05-25 15:39:44'),
(2, 'Wet', 'ತರಿ', 1, '2011-05-25 15:39:44'),
(3, 'Garden Land', 'ಬಾಗಾಯ್ತು', 1, '2011-05-25 15:39:44'),
(4, 'Uncultivated', 'ಬೀಳು', 1, '2011-05-25 15:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_ledgertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_ledgertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_ledgertypes`
--

INSERT INTO `ourbank_master_ledgertypes` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Income', '', 1, '2011-05-25 15:40:05'),
(2, 'Expenditure', '', 1, '2011-05-25 15:40:05'),
(3, 'Assets', '', 1, '2011-05-25 15:40:05'),
(4, 'Liabilities', '', 1, '2011-05-25 15:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_liveassets`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_liveassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_liveassets`
--

INSERT INTO `ourbank_master_liveassets` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Cross breed cows', 'ಸೀಮೆ ಹಸು', 1, '2011-05-25 15:41:42'),
(2, 'Local cows', 'ನಾಟಿ ಹಸು', 1, '2011-05-25 15:41:42'),
(3, 'Buffaloes', 'ಎಮ್ಮೆ', 1, '2011-05-25 15:41:42'),
(4, 'Bullocks', 'ಎತ್ತುಗಳು', 1, '2011-05-25 15:41:42'),
(5, 'Sheep', 'ಕುರಿ/ ಮೆಕೆ', 1, '2011-05-25 15:41:42'),
(6, 'Pigs', 'ಹಂದಿ', 1, '2011-05-25 15:41:42'),
(7, 'Poultry', 'ಕೋಳಿ', 1, '2011-05-25 15:41:42'),
(8, 'Others', 'ಇತರೆ', 1, '2011-05-25 15:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_loanpurpose`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_loanpurpose` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_loanpurpose`
--

INSERT INTO `ourbank_master_loanpurpose` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Personal ', 'ವೈಯಕ್ತಿಕ ', 1, '2011-05-25 15:42:44'),
(2, 'Repaying high cost debt ', 'ಹೆಚ್ಚಿನ ಬಡ್ಡಿ ಸಾಲ ತೀರಿಸಲು ', 1, '2011-05-25 15:42:44'),
(3, 'Family (education/marriage etc)', 'ಕುಟುಂಬಕ್ಕಾಗಿ (ಓದು, ಮದುವೆ, ಇತ್ಯ', 1, '2011-05-25 15:42:44'),
(4, 'To meet healthcare costs', 'ಆರೋಗ್ಯ ಉಪಚಾರಕ್ಕೆ ', 1, '2011-05-25 15:42:44'),
(5, 'Agriculture improvement', 'ಕೃಷಿ ಅಭಿವೃದ್ದಿಗಾಗಿ ', 1, '2011-05-25 15:42:44'),
(6, 'Starting business/Business improvement', 'ವ್ಯಾಪಾರ ಶುರುಮಾಡಲ/           ವ್', 1, '2011-05-25 15:42:44'),
(7, 'Others', 'ಇತರೆ ', 1, '2011-05-25 15:42:44');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_loansource`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_loansource` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_loansource`
--

INSERT INTO `ourbank_master_loansource` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Bank', 'ಬ್ಯಾಂಕ್', 1, '2011-05-25 15:43:03'),
(2, 'Self help groups SHG', 'ಸ್ವ ಸಹಾಯ ಸಂಘ', 1, '2011-05-25 15:43:03'),
(3, 'JLG (mens) ', 'ರೈತರ ಸಂಘ', 1, '2011-05-25 15:43:03'),
(4, 'Money lenders ', 'ಲೇವಾದೇವಿದಾರರು', 1, '2011-05-25 15:43:03'),
(5, 'Chit funds', 'ಚೀಟಿ', 1, '2011-05-25 15:43:03'),
(6, 'Friends/Family', 'ಸ್ನೇಹಿತರು/ ಕುಟುಂಬದ ಸದಸ್ಯರು', 1, '2011-05-25 15:43:03'),
(7, 'MFI', 'ಕಿರು ಹಣಕಾಸು ಸೇವೆ', 1, '2011-05-25 15:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_loanstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_loanstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `officehierarchy_id` smallint(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_loanstatus`
--

INSERT INTO `ourbank_master_loanstatus` (`id`, `name`, `name_regional`, `officehierarchy_id`, `created_by`, `created_date`) VALUES
(1, 'New', '', 0, 1, '2011-02-26 13:46:58'),
(2, 'Verification', '', 4, 1, '2011-02-26 13:46:58'),
(3, 'Grading', '', 3, 1, '2011-02-26 13:47:25'),
(4, 'Field visit', '', 2, 1, '2011-02-26 13:47:45'),
(5, 'Approved', '', 1, 1, '0000-00-00 00:00:00'),
(6, 'Reject', '', 99, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_maritalstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_maritalstatus` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_maritalstatus`
--

INSERT INTO `ourbank_master_maritalstatus` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Currently Married', 'ಮದುವೆ ಆಗಿದೆ', 1, '2011-05-25 15:46:54'),
(2, 'Unmarried', 'ಮದುವೆ ಆಗಿಲ್ಲ', 1, '2011-05-25 15:46:54'),
(3, 'Widow/widower', 'ವಿಧವೆ/ ವಿಧುರ', 1, '2011-05-25 15:46:54'),
(4, 'Divorced', 'ವಿಚ್ಚೇಧಿತರು', 1, '2011-05-25 15:46:54'),
(5, 'Separated', 'ಬೇರೆಯಾಗಿದ್ದಾರೆ', 1, '2011-05-25 15:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_mastertables`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_mastertables` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptions` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `ourbank_master_mastertables`
--

INSERT INTO `ourbank_master_mastertables` (`id`, `name_regional`, `name`, `descriptions`, `created_by`, `created_date`) VALUES
(1, 'ಖಾಯಲೆ ವಿಧಗಳು', 'ourbank_master_accountype', 'Account type', 1, '2011-06-28 02:21:58'),
(2, 'ಬ್ಯಾಂಕ್ ', 'ourbank_master_bank', 'Bank', 1, '2011-06-28 02:21:58'),
(3, 'ವ್ಯಾವಹಾರಿಕ ವಿಧಗಳು', 'ourbank_master_businesstype', 'Businesstype', 1, '2011-06-28 02:21:58'),
(4, 'ಜಾತಿ', 'ourbank_master_castetype', 'Caste type', 1, '2011-06-28 02:21:58'),
(5, 'ಸಂಘದ ಹೆಸರುಗಳು', 'ourbank_master_cbopromoter', 'CBO promoter', 1, '2011-06-28 02:21:58'),
(6, 'ಸಂಘಗಳು', 'ourbank_master_cbos', 'CBOs', 1, '2011-06-28 02:21:58'),
(7, 'ಅಡುಗೆ ಇಂಧನಗಳು', 'ourbank_master_cookingfuel', 'Cooking fuel', 1, '2011-06-28 02:21:58'),
(8, 'ಬೆಳೆಗಳು', 'ourbank_master_crop', 'Crop', 1, '2011-06-28 02:21:58'),
(9, 'Designation', 'ourbank_master_designation', 'Designation', 1, '2011-06-23 18:35:33'),
(10, 'ಖಾಯಲೆ ವಿಧಗಳು', 'ourbank_master_diseasetypes', 'Disease types', 1, '2011-06-28 02:21:58'),
(11, 'ಜಿಲ್ಲೆಗಳು  ', 'ourbank_master_districtlist', 'District list', 1, '2011-06-28 03:14:47'),
(12, 'ವಿಧ್ಯಾಬ್ಯಾಸದ ಮಟ್ಟ', 'ourbank_master_educationtype', 'Education type', 1, '2011-06-28 02:30:13'),
(13, 'ಉಧ್ಯೋಗ ಸ್ಥಿತಿ', 'ourbank_master_employmenttype', 'Employment type', 1, '2011-06-28 02:31:49'),
(14, 'ಸವಲತ್ತುಗಳು ', 'ourbank_master_entitlements', 'Entitlements', 1, '2011-06-28 02:32:31'),
(15, 'ಖರ್ಚುಗಳು ', 'ourbank_master_expense', 'Expense', 1, '2011-06-28 02:24:45'),
(16, 'ಕುಟುಂಬದ ಖರ್ಚುಗಳು ', 'ourbank_master_familyexpense', 'Family Expense', 1, '2011-06-28 02:24:45'),
(17, 'ಕುಟುಂಬದ ಆದಾಯಗಳು ', 'ourbank_master_familyincome', 'Family Income', 1, '2011-06-28 02:24:45'),
(18, 'ಕುಟುಂಬದ ವಿಧ ', 'ourbank_master_familytype', 'Family Type', 1, '2011-06-28 02:24:45'),
(19, 'Frequency payment', 'ourbank_master_frequencypayment', 'Frequency payment', 1, '2011-06-23 18:35:33'),
(20, 'ಹೋಬಳಿ ', 'ourbank_master_hoblilist', 'Hoblilist', 1, '2011-06-28 02:24:45'),
(21, 'ಖರ್ಚುಗಳು ', 'ourbank_master_income', 'Income', 1, '2011-06-28 02:24:45'),
(22, 'Institutions', 'ourbank_master_institutions', 'Institutions', 1, '2011-06-23 18:35:33'),
(23, 'ಭೂಮಾಲೀಕತ್ವ ವಿಧಗಳು', 'ourbank_master_landacquisition', 'Land acquisition', 1, '2011-06-28 02:24:45'),
(24, 'ಭೂಮಿ ವಿಧಗಳು', 'ourbank_master_landtypes', 'Land types', 1, '2011-06-28 02:28:50'),
(25, 'ಜಾನುವಾರು ಸ್ವತ್ತುಗಳು', 'ourbank_master_liveassets', 'Live assets', 1, '2011-06-28 02:28:50'),
(26, 'ಸಾಲದ ಉದ್ದೇಶಗಳು ', 'ourbank_master_loanpurpose', 'Loan purpose', 1, '2011-06-28 03:16:59'),
(27, 'ಸಾಲದ ಮೂಲಗಳು  ', 'ourbank_master_loansource', 'Loan source', 1, '2011-06-28 02:28:50'),
(28, 'ಇತರೇ ಸ್ವತ್ತುಗಳು', 'ourbank_master_nonliveassets', 'Nonliving Assets', 1, '2011-06-28 02:28:50'),
(29, 'ಸ್ವತ್ತಿನ ಮಾಲಿಕತ್ವ ', 'ourbank_master_ownershiptype', 'Ownership Type', 1, '2011-06-28 02:28:50'),
(30, 'Poverty Type', 'ourbank_master_povertytype', 'Poverty Type', 1, '2011-06-23 18:35:33'),
(31, 'ವೃತ್ತಿ', 'ourbank_master_profession', 'Profession', 1, '2011-06-28 03:11:56'),
(32, 'ಕುಟುಂಬದ ಮುಖ್ಯಸ್ತರೊಂದಿ ಸಂಬಂಧಗಳು', 'ourbank_master_realtionshiptype', 'Relationship Type', 1, '2011-06-28 03:09:51'),
(33, 'Service Sectors', 'ourbank_master_servicesectors', 'Service Sectors', 1, '2011-06-23 18:35:33'),
(34, 'Skills', 'ourbank_master_skills', 'Skills', 1, '2011-06-23 18:35:33'),
(35, 'ಆದಾಯದ ಮೂಲಗಳು ', 'ourbank_master_sourceofincome', 'Source of Income', 1, '2011-06-28 03:08:48'),
(36, 'ತಾಲ್ಲೂಕುಗಳು ', 'ourbank_master_taluklist', 'Taluk List', 1, '2011-06-28 03:08:48'),
(37, 'ಗ್ರಾಮ ಪಂಚಾಯತಿ ', 'ourbank_master_gillapanchayath', 'Grama Panchayath', 1, '2011-06-28 03:08:48'),
(38, 'ಮಜಿರೆ', 'ourbank_master_habitation', 'Habitation', 1, '2011-06-28 03:10:34'),
(39, 'ಋತುಗಳು ', 'ourbank_master_seasons', 'Seasons', 1, '2011-06-28 03:08:48'),
(40, 'ಬ್ರಾಂಚ್ ', 'ourbank_master_branch', 'Branch', 1, '2011-06-28 03:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_mastertables-old`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_mastertables-old` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptions` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

--
-- Dumping data for table `ourbank_master_mastertables-old`
--

INSERT INTO `ourbank_master_mastertables-old` (`id`, `name`, `descriptions`, `created_by`, `created_date`) VALUES
(1, 'ourbank_master_accountype', 'Account type', 0, '0000-00-00 00:00:00'),
(2, 'ourbank_master_bank', 'Bank', 0, '0000-00-00 00:00:00'),
(3, 'ourbank_master_businesstype', 'Businesstype', 0, '0000-00-00 00:00:00'),
(4, 'ourbank_master_castetype', 'Caste type', 0, '0000-00-00 00:00:00'),
(5, 'ourbank_master_cbopromoter', 'CBO promoter', 0, '0000-00-00 00:00:00'),
(6, 'ourbank_master_cbos', 'CBOs', 0, '0000-00-00 00:00:00'),
(7, 'ourbank_master_cookingfuel', 'Cooking fuel', 0, '0000-00-00 00:00:00'),
(8, 'ourbank_master_countrylist', 'Country list', 0, '0000-00-00 00:00:00'),
(9, 'ourbank_master_crop', 'Crop', 0, '0000-00-00 00:00:00'),
(10, 'ourbank_master_currency', 'Currency', 0, '0000-00-00 00:00:00'),
(11, 'ourbank_master_designation', 'Designation', 0, '0000-00-00 00:00:00'),
(12, 'ourbank_master_diseasetypes', 'Disease types', 0, '0000-00-00 00:00:00'),
(13, 'ourbank_master_districtlist', 'District list', 0, '0000-00-00 00:00:00'),
(14, 'ourbank_master_educationtype', 'Education type', 0, '0000-00-00 00:00:00'),
(15, 'ourbank_master_employmenttype', 'Employment type', 0, '0000-00-00 00:00:00'),
(16, 'ourbank_master_entitlements', 'Entitlements', 0, '0000-00-00 00:00:00'),
(17, 'ourbank_master_expense', 'Expense', 0, '0000-00-00 00:00:00'),
(18, 'ourbank_master_familyexpense', 'Family Expense', 0, '0000-00-00 00:00:00'),
(19, 'ourbank_master_familyincome', 'Family Income', 0, '0000-00-00 00:00:00'),
(20, 'ourbank_master_familytype', 'Family Type', 0, '0000-00-00 00:00:00'),
(21, 'ourbank_master_frequencypayment', 'Frequency payment', 0, '0000-00-00 00:00:00'),
(22, 'ourbank_master_fundertype', 'Funder type', 0, '0000-00-00 00:00:00'),
(23, 'ourbank_master_gender', 'Gender', 0, '0000-00-00 00:00:00'),
(24, 'ourbank_master_hoblilist', 'Hoblilist', 0, '0000-00-00 00:00:00'),
(25, 'ourbank_master_income', 'Income', 0, '0000-00-00 00:00:00'),
(26, 'ourbank_master_instalstatus', 'Installment  status', 0, '0000-00-00 00:00:00'),
(27, 'ourbank_master_institutions', 'Institutions', 0, '0000-00-00 00:00:00'),
(28, 'ourbank_master_kootas', 'Kootas', 0, '0000-00-00 00:00:00'),
(29, 'ourbank_master_kvs', 'Kvs', 0, '0000-00-00 00:00:00'),
(30, 'ourbank_master_landacquisition', 'Land acquisition', 0, '0000-00-00 00:00:00'),
(31, 'ourbank_master_landtypes', 'Land types', 0, '0000-00-00 00:00:00'),
(32, 'ourbank_master_ledgertypes', 'Ledger types', 0, '0000-00-00 00:00:00'),
(33, 'ourbank_master_liveassets', 'Live assets', 0, '0000-00-00 00:00:00'),
(34, 'ourbank_master_loanpurpose', 'Loan purpose', 0, '0000-00-00 00:00:00'),
(35, 'ourbank_master_loansource', 'Loan source', 0, '0000-00-00 00:00:00'),
(36, 'ourbank_master_maritalstatus', 'marital status', 0, '0000-00-00 00:00:00'),
(38, 'ourbank_master_nonliveassets', 'Nonliving Assets', 0, '0000-00-00 00:00:00'),
(39, 'ourbank_master_ownershiptype', 'Ownership Type', 0, '0000-00-00 00:00:00'),
(40, 'ourbank_master_paymenttypes', 'Payment Types', 0, '0000-00-00 00:00:00'),
(41, 'ourbank_master_povertytype', 'Poverty Type', 0, '0000-00-00 00:00:00'),
(42, 'ourbank_master_profession', 'Profession', 0, '0000-00-00 00:00:00'),
(43, 'ourbank_master_realtionshiptype', 'Relationship Type', 0, '0000-00-00 00:00:00'),
(44, 'ourbank_master_servicesectors', 'Service Sectors', 0, '0000-00-00 00:00:00'),
(45, 'ourbank_master_shgs', 'SHGS', 0, '0000-00-00 00:00:00'),
(46, 'ourbank_master_skills', 'Skills', 0, '0000-00-00 00:00:00'),
(47, 'ourbank_master_sourceofincome', 'Source of Income', 0, '0000-00-00 00:00:00'),
(48, 'ourbank_master_taluklist', 'Taluk List', 0, '0000-00-00 00:00:00'),
(49, 'ourbank_master_villagelist', 'Village List - General ', 0, '0000-00-00 00:00:00'),
(50, 'ourbank_master_gillapanchayath', 'Grama Panchayath', 0, '0000-00-00 00:00:00'),
(51, 'ourbank_master_habitation', 'Habitation', 0, '0000-00-00 00:00:00'),
(52, 'ourbank_master_mastertables', 'master tables', 0, '0000-00-00 00:00:00'),
(53, 'ourbank_master_seasons', 'Seasons', 0, '0000-00-00 00:00:00'),
(54, 'ourbank_master_branch', 'Branch', 0, '2011-06-03 05:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_membertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_membertypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_membertypes`
--

INSERT INTO `ourbank_master_membertypes` (`id`, `type`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Individual', 'Individual', 1, '2011-05-25 16:46:41'),
(2, 'SHG', 'SHG', 1, '2011-05-25 16:46:41'),
(3, 'JLG', 'JLG', 1, '2011-05-25 16:46:41'),
(4, 'All', 'All', 1, '2011-05-25 16:46:41'),
(5, 'None', 'ಯಾವುದೂ ಇಲ್ಲ', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_nonliveassets`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_nonliveassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `ourbank_master_nonliveassets`
--

INSERT INTO `ourbank_master_nonliveassets` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Sycle', 'ಸೈಕಲ್', 0, '0000-00-00 00:00:00'),
(2, 'Bike', 'ದ್ವಿಚಕ್ರ ವಾಹನ', 0, '0000-00-00 00:00:00'),
(3, 'Tracter', 'ಟ್ರ್ಯಾಕ್ಟರ್/ಟಿಲ್ಲರ್', 0, '0000-00-00 00:00:00'),
(4, 'car/ other', 'ಕಾರ್/ ಇತರೆ', 0, '0000-00-00 00:00:00'),
(5, 'Lowary', 'ಲಾರಿ/ ಸರಕು ವಾಹನ', 0, '0000-00-00 00:00:00'),
(6, 'Coart', 'ಎತ್ತಿನಗಾಡಿ', 0, '0000-00-00 00:00:00'),
(7, 'Tailoring ', 'ಹೊಲಿಗೆ ಯಂತ್ರ', 0, '0000-00-00 00:00:00'),
(8, 'Pump set', 'ಪಂಪ್ ಸೆಟ್', 0, '0000-00-00 00:00:00'),
(9, 'TV', 'ಟಿವಿ', 0, '0000-00-00 00:00:00'),
(10, 'Dressing table', 'ಡ್ರೆಸ್ಸಿಂಗ್ ಟೇಬಲ್', 0, '0000-00-00 00:00:00'),
(11, 'Coocker', 'ಕುಕ್ಕರ್', 0, '0000-00-00 00:00:00'),
(12, 'Almera', 'ಅಲ್ಮೆರ', 0, '0000-00-00 00:00:00'),
(13, 'Fan', 'ಫ್ಯಾನ್', 0, '0000-00-00 00:00:00'),
(14, 'Charess', 'ಕುರ್ಚಿಗಳು', 0, '0000-00-00 00:00:00'),
(15, 'cattle house', 'ದನದ ಕೊಟ್ಟಿಗೆ', 0, '0000-00-00 00:00:00'),
(16, 'Agriculture instruments', 'ಕೃಷಿ ಉಪಕರಣ', 0, '0000-00-00 00:00:00'),
(17, 'Other assets', 'ಕುಶಲಕರ್ಮಿ ಉಪಕರಣ', 0, '0000-00-00 00:00:00'),
(18, 'solar', 'ಸೋಲಾರ್', 0, '0000-00-00 00:00:00'),
(19, 'Fridj', 'ಫ್ರಿಡ್ಜ್', 0, '0000-00-00 00:00:00'),
(20, 'Others ', 'ಇತರೆ', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_ownershiptype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_ownershiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_ownershiptype`
--

INSERT INTO `ourbank_master_ownershiptype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Rented', 'ಬಾಡಿಗೆ', 1, '2011-05-25 15:48:19'),
(2, 'Shared family', 'ಅವಿಭಕ್ತ ಕುಟುಂಬ', 1, '2011-05-25 15:48:19'),
(3, 'Owned with title', 'ಸ್ವಂತ, ದಾಕಲೆ ಇದೆ', 1, '2011-05-25 15:48:19'),
(4, ' Owned no title', 'ಸ್ವಂತ , ದಾಖಲೆ ಇಲ್ಲ', 1, '2011-05-25 15:48:19'),
(5, 'IAY/govt.scheme', 'ಸರ್ಕಾರಿ ಯೋಜನೆ', 1, '2011-05-25 15:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_paymenttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_paymenttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_paymenttypes`
--

INSERT INTO `ourbank_master_paymenttypes` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Cash', '', 1, '2011-05-25 15:49:13'),
(2, 'Cheque', '', 1, '2011-05-25 15:49:13'),
(3, 'Voucher', '', 1, '2011-05-25 15:49:13'),
(4, 'Draft', '', 1, '2011-05-25 15:49:13'),
(5, 'E-transfer', '', 1, '2011-05-25 15:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_phychallenge`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_phychallenge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_phychallenge`
--

INSERT INTO `ourbank_master_phychallenge` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Physical', 'ದೈಹಿಕ', 1, '2011-06-30 21:13:53'),
(2, 'Blind', 'ಕುರುಡು', 1, '2011-06-30 21:13:53'),
(3, 'Deaf', 'ಕಿವುಡು', 1, '2011-06-30 21:13:53'),
(4, 'Dumb', 'ಮೂಕ', 1, '2011-06-30 21:13:53'),
(5, 'Others', 'ಇತರೆ', 1, '2011-06-30 21:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_povertytype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_povertytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_povertytype`
--

INSERT INTO `ourbank_master_povertytype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Homeless / Ordinary house', '', 1, '2011-05-25 15:52:17'),
(2, 'Landless / marginal farmer', '', 1, '2011-05-25 15:52:17'),
(3, 'Wage employed', '', 1, '2011-05-25 15:52:17'),
(4, 'Managed by women', '', 1, '2011-05-25 15:52:17'),
(5, 'Not available', '', 1, '2011-05-25 15:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_profession`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_profession` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profession_ID` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ourbank_master_profession`
--

INSERT INTO `ourbank_master_profession` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Farm Worker', 'ಕೃಷಿ ಕಾರ್ಮಿಕ', 1, '2011-05-25 15:53:11'),
(2, 'Agriculturalist', 'ಕೃಷಿಕ', 1, '2011-05-25 15:53:11'),
(3, 'Fishermen', 'ಮೀನುಗಾರ', 1, '2011-05-25 15:53:11'),
(4, 'Weaver', 'ನೇಯ್ಕಾರ', 1, '2011-05-25 15:53:11'),
(5, 'Mechanic', 'ಮೆಕ್ಯಾನಿಕ್', 1, '2011-05-25 15:53:11'),
(6, 'Carpenter', 'ಮರಗೆಲಸ', 1, '2011-05-25 15:53:11'),
(7, 'Mason', 'ಗಾರೆಕೆಲಸ', 1, '2011-05-25 15:53:11'),
(8, 'Blacksmith', 'ಕಮ್ಮಾರ/ಕಬ್ಬಿಣದ ಕೆಲಸ', 1, '2011-05-25 15:53:11'),
(9, 'Tailor', 'ಟೇಲರ್', 1, '0000-00-00 00:00:00'),
(10, 'Teacher', 'ಶಿಕ್ಷಕ', 1, '0000-00-00 00:00:00'),
(11, 'Construction Worker', 'ಕಟ್ಟಡ ನಿರ್ಮಾಣ ಕಾರ್ಮಿಕ', 1, '0000-00-00 00:00:00'),
(12, 'Retail business', 'ಚಿಲ್ಲರೆ ಅಂಗಡಿ', 1, '0000-00-00 00:00:00'),
(13, 'Driver', 'ಚಾಲಕ', 1, '0000-00-00 00:00:00'),
(14, 'Business/Trade', 'ವ್ಯಾಪಾರ ವಾಹಿವಾಟು', 1, '0000-00-00 00:00:00'),
(15, 'General daily wage worker', 'ಸಾಮಾನ್ಯ ದಿನಗೂಲಿ', 1, '0000-00-00 00:00:00'),
(16, 'Others', 'ಇತರೆ', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_rationcard`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_rationcard` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_rationcard`
--

INSERT INTO `ourbank_master_rationcard` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'None', 'ಇಲ್ಲ', 1, '2011-02-16 18:34:48'),
(2, 'APL', 'ಯೆ ಪೀ ಎಲ್', 1, '2011-02-16 00:00:00'),
(3, 'BPL', 'ಬೀ ಪೀ ಎಲ್', 1, '2011-02-16 00:00:00'),
(4, 'AAY', 'ಯೆ ಯೆ ವೈ', 1, '2011-02-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_realtionshiptype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_realtionshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ourbank_master_realtionshiptype`
--

INSERT INTO `ourbank_master_realtionshiptype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Self', 'ತಾನು', 1, '2011-05-25 16:02:31'),
(2, 'Spouse', 'ಗಂಡ/ಹೆಂಡತಿ', 1, '2011-05-25 16:02:31'),
(3, 'Father', 'ತಂದೆ', 1, '2011-05-25 16:02:31'),
(4, 'Mother', 'ತಾಯಿ', 1, '2011-05-25 16:02:31'),
(5, 'Son', 'ಮಗ', 1, '2011-05-25 16:02:31'),
(6, 'Daughter', 'ಮಗಳು', 1, '2011-05-25 16:02:31'),
(7, 'Brother', 'ಅಣ್ಣ/ ತಮ್ಮ', 1, '2011-05-25 16:02:31'),
(8, 'Sister', 'ಅಕ್ಕ/ ತಂಗಿ', 1, '2011-05-25 16:02:31'),
(9, 'Daughter-in-law', 'ಸೊಸೆ', 1, '2011-05-25 16:02:31'),
(10, 'Son-in-law', 'ಅಳಿಯ', 1, '2011-05-25 16:02:31'),
(11, 'Father-in-law', 'ಮಾವ', 1, '2011-05-25 16:02:31'),
(12, 'Mother-in-law', 'ಅತ್ತೆ', 1, '2011-05-25 16:02:31'),
(13, 'Brother-in-law', 'ಮೈದುನ', 1, '2011-05-25 16:02:31'),
(14, 'Sister-in-law', 'ಓರಗಿತ್ತಿ', 1, '2011-05-25 16:02:31'),
(15, 'Nephew', 'ಸಹೋದರ/ಸಹೋದರಿಯ ಮಗ ', 1, '2011-05-25 16:02:31'),
(16, 'Niece', 'ಸಹೋದರ/ಸಹೋದರಿಯ ಮಗಳು', 1, '2011-05-25 16:02:31'),
(17, 'Grandson', 'ಮೊಮ್ಮಗ  ', 1, '2011-05-25 16:02:31'),
(18, 'Granddaughter', 'ಮೊಮ್ಮಗಳು ', 1, '2011-05-25 16:02:31'),
(19, 'Grandfather', 'ತಾತ  ', 1, '2011-05-25 16:02:31'),
(20, 'Grandmother', 'ಅಜ್ಜಿ ', 1, '2011-05-25 16:02:31'),
(21, 'Uncle', 'ಸೋದರ ಮಾವ/ ಚಿಕ್ಕಪ್ಪ/ ದೊಡ್ಡಪ್ಪ  ', 1, '2011-05-25 16:02:31'),
(22, 'Aunt ', 'ಸೋದರತ್ತೆ, ಚಿಕ್ಕಮ್ಮ, ದೊಡ್ಡಮ್ಮ ', 1, '2011-05-25 16:02:31'),
(23, 'Others ', 'ಇತರೆ ', 0, '0000-00-00 00:00:00'),
(24, 'Sister-in-law', 'ಅತ್ತಿಗೆ', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_seasons`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_seasons`
--

INSERT INTO `ourbank_master_seasons` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Pre monsoon', 'ಹಿಂಗಾರು ', 1, '2011-05-25 16:05:45'),
(2, 'Monsoon', 'ಮುಂಗಾರು', 1, '2011-05-25 16:05:45'),
(3, 'Winter', 'ಸೊನೆಕಾಲ', 1, '2011-05-25 16:05:45'),
(4, 'Rainy', 'ಮಳೆಕಾಲ', 1, '2011-05-25 16:05:45'),
(5, 'Harvest', 'ಸುಗ್ಗಿಕಾಲ ', 1, '2011-05-25 16:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_servicesectors`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_servicesectors` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_master_servicesectors`
--

INSERT INTO `ourbank_master_servicesectors` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Widow Pension', 'ವಿಧವಾ ವೇತನ', 1, '2011-05-25 16:10:26'),
(2, 'Housing construction/repair', 'ವಸತಿ ನಿರ್ಮಾಣ/ರಿಪೆರಿ', 1, '2011-05-25 16:10:26'),
(3, 'Ration card', 'ಪಡಿತರಚೀಟಿ', 1, '2011-05-25 16:10:26'),
(4, 'Old age pension', 'ವೃದ್ದ್ಯಪ್ಯ ವೇತನ', 1, '2011-05-25 16:10:26'),
(5, 'Disability Pension', 'ಅಂಗವಿಕಲರ ವೇತನ', 1, '2011-05-25 16:10:26'),
(6, 'NREGS Job Card', 'ಉದ್ಯೊಗ ಖಾತ್ರಿ ಚೀಟಿ', 1, '2011-05-25 16:10:26'),
(7, 'Skills Training', 'ಕೌಶಲ್ಯ ತರಭೇತಿ', 1, '2011-05-25 16:10:26'),
(8, 'J2G', 'ಬಾಹ್ಯ ಉದ್ಯೊಗ', 1, '2011-05-25 16:10:26'),
(9, 'Health Insurance', 'ಆರೊಗ್ಯ ವಿಮೆ', 1, '2011-05-25 16:10:26'),
(10, 'Sanitation', 'ಶೌಚ ವ್ಯವಸ್ತೆ', 1, '2011-05-25 16:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_skills`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_skills` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ourbank_master_skills`
--

INSERT INTO `ourbank_master_skills` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Farm worker', 'ಕೃಷಿ ಕಾರ್ಮಿಕ', 1, '2011-05-25 16:11:16'),
(2, 'Agriculturalist', 'ಕೃಷಿಕ', 1, '2011-05-25 16:11:16'),
(3, 'Fishermen', 'ಮೀನುಗಾರ', 1, '2011-05-25 16:11:16'),
(4, 'Weaver', 'ನೇಯ್ಕಾರ', 1, '2011-05-25 16:11:16'),
(5, 'Mechanic', 'ಮೆಕ್ಯಾನಿಕ್', 1, '2011-05-25 16:11:16'),
(6, 'Carpenter', 'ಮರಗೆಲಸ', 1, '2011-05-25 16:11:16'),
(7, 'Mason', 'ಗಾರೆಕೆಲಸ', 1, '2011-05-25 16:11:16'),
(8, 'Blacksmith', 'ಕಮ್ಮಾರ/ಕಬ್ಬಿಣದ ಕೆಲಸ', 1, '2011-05-25 16:11:16'),
(9, 'Tailor', 'ಟೇಲರ್', 1, '2011-05-25 16:11:16'),
(10, 'Teacher', 'ಶಿಕ್ಷಕ', 1, '2011-05-25 16:11:16'),
(11, 'Construction Worker', 'ಕಟ್ಟಡ ನಿರ್ಮಾಣ ಕಾರ್ಮಿಕ', 1, '2011-05-25 16:11:16'),
(12, 'Retail business', 'ಚಿಲ್ಲರೆ ಅಂಗಡಿ', 1, '2011-05-25 16:11:16'),
(13, 'Driver', 'ಚಾಲಕ', 1, '2011-05-25 16:11:16'),
(14, 'Business/Trade', 'ವ್ಯಾಪಾರ ವಾಹಿವಾಟು', 1, '2011-05-25 16:11:16'),
(15, 'General daily wage worker', 'ಸಾಮಾನ್ಯ ದಿನಗೂಲಿ', 1, '2011-05-25 16:11:16'),
(16, 'Others', 'ಇತರೆ', 1, '2011-05-25 16:11:16');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_sourceofincome`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_sourceofincome` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_sourceofincome`
--

INSERT INTO `ourbank_master_sourceofincome` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Daily Wage', 'ದಿನಗೂಲಿ', 1, '2011-05-25 16:12:02'),
(2, 'Cultivation', 'ಬೇಸಾಯ', 1, '2011-05-25 16:12:02'),
(3, 'Salary', 'ಸಂಬಳ', 1, '2011-05-25 16:12:02'),
(4, 'Others', 'ಇತರೆ', 1, '2011-05-25 16:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_state`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_state`
--

INSERT INTO `ourbank_master_state` (`id`, `name`, `name_regional`, `created_by`, `Created_date`) VALUES
(1, 'Karnataka', 'ಕರ್ನಾಟಕ', 1, '2011-06-28 21:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_subcaste`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_subcaste` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `caste_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_subcaste`
--

INSERT INTO `ourbank_master_subcaste` (`id`, `name`, `name_regional`, `caste_id`, `created_by`, `created_date`) VALUES
(1, 'SC', '', 1, 1, '2011-06-23 04:44:54'),
(3, 'ST', '', 2, 1, '2011-06-23 04:44:54'),
(5, 'OBC', '', 3, 1, '2011-06-23 04:44:54'),
(7, 'OTHERS', '', 4, 1, '2011-06-23 04:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_taluklist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_taluklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_taluklist`
--

INSERT INTO `ourbank_master_taluklist` (`id`, `name`, `name_regional`, `district_id`, `created_by`, `Created_date`) VALUES
(1, 'Mandiya taluk', 'Mandiya taluk', 3, 0, '2011-09-13 12:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_units`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_units`
--

INSERT INTO `ourbank_master_units` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'KG', 'ಕೆ ಜಿ', 1, '2011-05-25 16:24:38'),
(2, 'Quintal', 'ಕ್ವಿಂಟಾಲ್ (100 kg)', 1, '2011-05-25 16:24:38'),
(3, 'Litre', 'ಲೀಟರ್', 1, '2011-05-25 16:24:38'),
(4, 'Number', 'ಸಂಖ್ಯೆ', 1, '2011-05-25 16:24:38'),
(5, 'Others', 'ಇತರೆ', 1, '2011-05-25 16:24:38'),
(6, 'Not applicable', 'ಅನ್ವಯಿಸುವುದಿಲ್ಲ', 1, '2011-05-25 16:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_village`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_village` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `panchayath_id` int(11) NOT NULL,
  `hobli_id` int(11) NOT NULL,
  `taluk_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `state_id` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `village_id` (`village_id`),
  KEY `panchayath_id` (`panchayath_id`),
  KEY `hobli_id` (`hobli_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_village`
--

INSERT INTO `ourbank_master_village` (`id`, `village_id`, `panchayath_id`, `hobli_id`, `taluk_id`, `district_id`, `state_id`, `created_by`, `created_date`) VALUES
(1, 4, 1, 1, 1, 3, 0, 1, '2011-09-13 12:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_villagelist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_villagelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `panchayath_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `village_id` (`village_id`),
  KEY `panchayath_id` (`panchayath_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_villagelist`
--

INSERT INTO `ourbank_master_villagelist` (`id`, `village_id`, `name`, `name_regional`, `panchayath_id`, `created_by`, `created_date`) VALUES
(1, 4, 'Vidhyanagar village', 'Vidhyanagar village', 1, 1, '2011-09-13 12:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_weekdays`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_weekdays` (
  `id` int(3) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_master_weekdays`
--

INSERT INTO `ourbank_master_weekdays` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Monday', '', 1, '2011-05-26 02:15:23'),
(2, 'Tuesday', '', 1, '2011-05-26 02:15:23'),
(3, 'Wednesday', '', 1, '2011-05-26 02:15:23'),
(4, 'Thursday', '', 1, '2011-05-26 02:15:23'),
(5, 'Friday', '', 1, '2011-05-26 02:15:23'),
(6, 'Saturday', '', 1, '2011-05-26 02:15:23'),
(7, 'Sunday', '', 1, '2011-05-26 02:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_meeting`
--

CREATE TABLE IF NOT EXISTS `ourbank_meeting` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `grouphead_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_meeting`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_meeting_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_meeting_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `grouphead_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_meeting_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_member`
--

CREATE TABLE IF NOT EXISTS `ourbank_member` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `office_id` smallint(6) NOT NULL,
  `membercode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` double NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_member`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberattendance`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberattendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `attendance_type` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_memberattendance`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberattendance_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberattendance_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `attendance_type` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_memberattendance_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberentitlememnt`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberentitlememnt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `entitlement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_memberentitlememnt`
--

INSERT INTO `ourbank_memberentitlememnt` (`id`, `member_id`, `entitlement_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberprofession`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberprofession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `profession_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_memberprofession`
--

INSERT INTO `ourbank_memberprofession` (`id`, `member_id`, `profession_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_modules`
--

CREATE TABLE IF NOT EXISTS `ourbank_modules` (
  `module_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `module_description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `parent` tinyint(4) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `ourbank_modules`
--

INSERT INTO `ourbank_modules` (`module_id`, `module_description`, `parent`) VALUES
(1, 'Management', 0),
(2, 'Membership', 0),
(3, 'Meeting', 0),
(4, 'Transaction', 0),
(5, 'Accounting', 0),
(6, 'Setting', 0),
(7, 'Officehierarchy', 1),
(8, 'Office', 1),
(9, 'Roles', 1),
(10, 'Funder', 1),
(11, 'Funding', 1),
(12, 'Ledger', 1),
(13, 'Category', 1),
(14, 'Product', 1),
(15, 'Saving', 1),
(16, 'Loans', 1),
(17, 'Family', 2),
(18, 'Group', 2),
(19, 'Meeting', 3),
(20, 'Attendance', 3),
(21, 'Savings', 4),
(22, 'Loans', 4),
(23, 'Recurring', 4),
(24, 'Fixed', 4),
(25, 'Personal savings', 5),
(26, 'Fixed savings', 5),
(27, 'Recurring savings', 5),
(28, 'Loan account', 5),
(29, 'Dropdown', 6),
(30, 'User', 1),
(31, 'individual', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_monthend`
--

CREATE TABLE IF NOT EXISTS `ourbank_monthend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `year` smallint(4) NOT NULL,
  `processed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_monthend`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_nonlivingassetsdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_nonlivingassetsdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `nonliveasset_id` int(11) NOT NULL,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_value` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_nonlivingassetsdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_nonlivingassetsdetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_nonlivingassetsdetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `nonliveasset_id` int(11) NOT NULL,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_value` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_nonlivingassetsdetails_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_office`
--

CREATE TABLE IF NOT EXISTS `ourbank_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `officetype_id` smallint(5) NOT NULL,
  `parentoffice_id` smallint(5) NOT NULL,
  `createddate` date NOT NULL,
  `createdby` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Parent_Office_ID` (`parentoffice_id`),
  KEY `Office_Type_ID` (`officetype_id`),
  KEY `Created_By` (`createdby`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_office`
--

INSERT INTO `ourbank_office` (`id`, `name`, `short_name`, `officetype_id`, `parentoffice_id`, `createddate`, `createdby`) VALUES
(1, 'HEAD OFFICE', 'HDO', 1, 1, '2011-09-13', 1),
(2, 'Federation', 'FDA', 2, 1, '2011-09-13', 1),
(3, 'KLN Koota', 'KLN', 3, 2, '2011-09-13', 1),
(4, 'Vidhyanagar village', 'VLV', 4, 3, '2011-09-13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_officehierarchy`
--

CREATE TABLE IF NOT EXISTS `ourbank_officehierarchy` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Hierarchy_level` smallint(5) NOT NULL,
  `created_userid` int(10) NOT NULL,
  `createddate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `officetype` (`type`),
  UNIQUE KEY `officeshort_name` (`short_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_officehierarchy`
--

INSERT INTO `ourbank_officehierarchy` (`id`, `type`, `short_name`, `Hierarchy_level`, `created_userid`, `createddate`) VALUES
(1, 'Head Office', 'HD', 1, 1, '2011-09-13'),
(2, 'Federation', 'FD', 2, 1, '2011-09-13'),
(3, 'Koota', 'KT', 3, 1, '2011-09-13'),
(4, 'Village', 'VL', 4, 1, '2011-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_officemeeting`
--

CREATE TABLE IF NOT EXISTS `ourbank_officemeeting` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `officelevel` int(4) NOT NULL,
  `office_id` int(11) NOT NULL,
  `frequency` int(4) NOT NULL,
  `place` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_officemeeting`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_officemeeting_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_officemeeting_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `officelevel` int(4) NOT NULL,
  `office_id` int(11) NOT NULL,
  `frequency` int(4) NOT NULL,
  `place` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_officemeeting_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_office_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_office_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `officetype_id` smallint(5) NOT NULL,
  `parentoffice_id` smallint(5) NOT NULL,
  `createddate` date NOT NULL,
  `createdby` int(10) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_office_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_paymenttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_paymenttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_paymenttypes`
--

INSERT INTO `ourbank_paymenttypes` (`id`, `description`) VALUES
(1, 'Cash'),
(2, 'Cheque'),
(3, 'Voucher'),
(4, 'Draft'),
(5, 'E-transfer');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_physicalstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_physicalstatus` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `physicalstatus` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_physicalstatus`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_praservice`
--

CREATE TABLE IF NOT EXISTS `ourbank_praservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_praservice`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_praservice_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_praservice_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `ourbank_praservice_log`
--

INSERT INTO `ourbank_praservice_log` (`record_id`, `id`, `source_id`, `member_id`, `family_id`, `created_by`, `created_date`) VALUES
(1, 13, 2, 27, 14, 1, '2011-07-05'),
(2, 14, 6, 27, 14, 1, '2011-07-05'),
(3, 15, 9, 27, 14, 1, '2011-07-05'),
(4, 16, 10, 27, 14, 1, '2011-07-05'),
(5, 50, 1, 110, 49, 1, '2011-07-06'),
(6, 51, 4, 110, 49, 1, '2011-07-06'),
(7, 52, 10, 110, 49, 1, '2011-07-06'),
(8, 63, 6, 78, 27, 1, '2011-07-06'),
(9, 64, 10, 78, 27, 1, '2011-07-06'),
(10, 231, 4, 472, 141, 1, '2011-07-07'),
(11, 237, 1, 480, 144, 1, '2011-07-07'),
(12, 238, 10, 480, 144, 1, '2011-07-07'),
(13, 949, 2, 1969, 497, 1, '2011-07-14'),
(14, 950, 4, 1969, 497, 1, '2011-07-14'),
(15, 1081, 4, 2215, 558, 1, '2011-07-14'),
(16, 1082, 9, 2215, 558, 1, '2011-07-14'),
(17, 1083, 10, 2215, 558, 1, '2011-07-14'),
(18, 2580, 9, 4814, 1205, 1, '2011-07-22'),
(19, 2581, 9, 4815, 1205, 1, '2011-07-22'),
(20, 3350, 2, 6672, 1661, 1, '2011-07-26'),
(21, 3351, 6, 6672, 1661, 1, '2011-07-26'),
(22, 3352, 9, 6672, 1661, 1, '2011-07-26'),
(23, 3353, 10, 6672, 1661, 1, '2011-07-26'),
(24, 3601, 2, 7159, 1773, 1, '2011-07-27'),
(25, 3840, 3, 7514, 1858, 1, '2011-07-28'),
(26, 3841, 7, 7515, 1858, 1, '2011-07-28'),
(27, 3842, 6, 7517, 1858, 1, '2011-07-28'),
(28, 6400, 2, 12447, 3190, 1, '2011-08-07'),
(29, 6401, 4, 12447, 3190, 1, '2011-08-07'),
(30, 6402, 9, 12447, 3190, 1, '2011-08-07'),
(31, 6403, 10, 12447, 3190, 1, '2011-08-07'),
(32, 7142, 1, 13823, 3665, 1, '2011-08-11'),
(33, 7143, 3, 13823, 3665, 1, '2011-08-11'),
(34, 7144, 4, 13823, 3665, 1, '2011-08-11'),
(35, 7219, 5, 14023, 3715, 1, '2011-08-11'),
(36, 7220, 5, 14024, 3715, 1, '2011-08-11'),
(37, 7543, 8, 14488, 3871, 1, '2011-08-13'),
(38, 8273, 7, 15202, 4093, 1, '2011-08-14'),
(39, 8988, 2, 16121, 4418, 1, '2011-08-16'),
(40, 9666, 6, 17435, 4768, 1, '2011-08-19'),
(41, 9667, 9, 17435, 4768, 1, '2011-08-19'),
(42, 9668, 10, 17435, 4768, 1, '2011-08-19'),
(43, 9669, 6, 17435, 4768, 1, '2011-08-19'),
(44, 9670, 9, 17435, 4768, 1, '2011-08-19'),
(45, 9671, 10, 17435, 4768, 1, '2011-08-19'),
(46, 10547, 5, 19350, 5226, 1, '2011-08-22'),
(47, 11002, 6, 20141, 5423, 1, '2011-08-23'),
(48, 11003, 9, 20141, 5423, 1, '2011-08-23'),
(49, 11004, 10, 20141, 5423, 1, '2011-08-23'),
(50, 13279, 3, 26054, 7057, 1, '2011-08-30'),
(51, 13280, 5, 26054, 7057, 1, '2011-08-30'),
(52, 13281, 3, 26055, 7057, 1, '2011-08-30'),
(53, 13014, 1, 25312, 6849, 1, '2011-08-29'),
(54, 13015, 2, 25312, 6849, 1, '2011-08-29'),
(55, 13016, 3, 25312, 6849, 1, '2011-08-29');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_product`
--

CREATE TABLE IF NOT EXISTS `ourbank_product` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` smallint(5) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Category_ID` (`category_id`),
  KEY `product_id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_product`
--

INSERT INTO `ourbank_product` (`id`, `name`, `shortname`, `category_id`, `description`, `created_by`, `created_date`) VALUES
(1, 'personal saving', 'ps', 1, 'for Personal savings', 1, '2011-09-13'),
(2, 'fixed deposit', 'fd', 1, 'for fixed deposit', 1, '2011-09-13'),
(3, 'recurring deposit', 'rd', 1, 'for recurring deposit', 1, '2011-09-13'),
(4, 'Agriculture Loan', 'AGR', 2, 'For Agriculture Loan', 1, '2011-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsloan`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsloan` (
  `productsoffer_id` int(11) NOT NULL,
  `minmumloanamount` int(100) NOT NULL,
  `maximunloanamount` int(10) NOT NULL,
  `interesttype_id` smallint(5) NOT NULL,
  `minimumloaninterest` decimal(10,2) NOT NULL,
  `maximunloaninterest` decimal(10,2) NOT NULL,
  `penal_Interest` float(10,2) NOT NULL,
  `installmenttype_id` smallint(5) NOT NULL,
  `minimumfrequency` int(10) NOT NULL,
  `maximumfrequency` int(10) NOT NULL,
  `fee_id` int(10) NOT NULL,
  `graceperiodtype_id` smallint(5) NOT NULL,
  `graceperiodnumber` int(10) NOT NULL,
  `fund_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `glsubcode` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_productsloan`
--

INSERT INTO `ourbank_productsloan` (`productsoffer_id`, `minmumloanamount`, `maximunloanamount`, `interesttype_id`, `minimumloaninterest`, `maximunloaninterest`, `penal_Interest`, `installmenttype_id`, `minimumfrequency`, `maximumfrequency`, `fee_id`, `graceperiodtype_id`, `graceperiodnumber`, `fund_id`, `glsubcode`) VALUES
(5, 1000, 500000, 2, 0.00, 0.00, 22.00, 0, 1, 12, 0, 0, 9, '', 0),
(1, 1000, 500000, 2, 0.00, 0.00, 22.00, 0, 1, 12, 0, 0, 9, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsloan_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsloan_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `productsoffer_id` int(11) NOT NULL,
  `minmumloanamount` int(100) NOT NULL,
  `maximunloanamount` int(10) NOT NULL,
  `interesttype_id` smallint(5) NOT NULL,
  `minimumloaninterest` decimal(10,2) NOT NULL,
  `maximunloaninterest` decimal(10,2) NOT NULL,
  `penal_Interest` float(10,2) NOT NULL,
  `installmenttype_id` smallint(5) NOT NULL,
  `minimumfrequency` int(10) NOT NULL,
  `maximumfrequency` int(10) NOT NULL,
  `fee_id` int(10) NOT NULL,
  `graceperiodtype_id` smallint(5) NOT NULL,
  `graceperiodnumber` int(10) NOT NULL,
  `fund_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `glsubcode` int(10) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_productsloan_log`
--

INSERT INTO `ourbank_productsloan_log` (`record_id`, `productsoffer_id`, `minmumloanamount`, `maximunloanamount`, `interesttype_id`, `minimumloaninterest`, `maximunloaninterest`, `penal_Interest`, `installmenttype_id`, `minimumfrequency`, `maximumfrequency`, `fee_id`, `graceperiodtype_id`, `graceperiodnumber`, `fund_id`, `glsubcode`) VALUES
(1, 2, 1000, 15000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(2, 2, 1000, 15000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(3, 2, 1000, 15000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(4, 3, 1000, 15000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(5, 3, 1000, 15000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(6, 3, 1000, 15000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(7, 3, 1000, 250000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0),
(8, 3, 100, 250000, 2, 0.00, 0.00, 0.01, 0, 1, 12, 0, 0, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsoffer`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsoffer` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` smallint(5) NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `begindate` date NOT NULL,
  `closedate` date NOT NULL,
  `applicableto` smallint(5) NOT NULL,
  `glsubcode_id` int(5) NOT NULL,
  `capital_glsubcode_id` int(5) NOT NULL,
  `Interest_glsubcode_id` int(5) NOT NULL,
  `fee_glsubcode_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_productsoffer`
--

INSERT INTO `ourbank_productsoffer` (`id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(1, 'Seeds loan', 'SDL', 4, 'for seeds loan', '2011-01-01', '2020-09-13', 4, 31, 0, 0, 0),
(2, 'Savings', 'sb', 1, 'For savings products', '2011-09-13', '0000-00-00', 4, 32, 0, 0, 0),
(3, 'Fixed Savings', 'FDS', 2, 'for fixed savings', '2011-01-01', '2020-09-13', 4, 33, 0, 0, 0),
(4, 'Recurring Savings', 'RGS', 3, 'for Recurring Savings', '2011-01-01', '2020-09-13', 4, 34, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsoffer_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsoffer_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` smallint(5) NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `begindate` date NOT NULL,
  `closedate` date NOT NULL,
  `applicableto` smallint(5) NOT NULL,
  `glsubcode_id` int(5) NOT NULL,
  `capital_glsubcode_id` int(5) NOT NULL,
  `Interest_glsubcode_id` int(5) NOT NULL,
  `fee_glsubcode_id` int(5) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_productsoffer_log`
--

INSERT INTO `ourbank_productsoffer_log` (`record_id`, `id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(1, 2, 'crop loan', 'CL1', 4, 'to grow different crops', '2011-05-10', '2012-07-20', 1, 4, 0, 0, 0),
(2, 2, 'Crop loan', 'CL1', 4, 'to grow different crops', '2011-05-10', '2012-07-20', 4, 4, 0, 0, 0),
(3, 2, 'Crop loan', 'CL1', 4, 'to grow different crops', '2011-05-10', '2012-07-20', 4, 4, 0, 0, 0),
(4, 3, 'Seed loan', 'SL1', 4, 'for purchase of seeds', '2011-05-01', '2012-04-30', 4, 5, 0, 0, 0),
(5, 3, 'Seed loan', 'SL1', 4, 'for purchase of seeds', '2011-05-01', '2012-04-30', 1, 5, 0, 0, 0),
(6, 3, 'Seed loan', 'SL1', 4, 'for purchase of seeds', '2011-05-01', '2012-04-30', 4, 5, 0, 0, 0),
(7, 3, 'Seed loan', 'SL1', 4, 'for purchase of seeds', '2011-05-01', '2012-04-30', 4, 5, 0, 0, 0),
(8, 3, 'Seed loan', 'SL1', 4, 'for purchase of seeds', '2011-05-01', '2012-04-30', 4, 5, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productssaving`
--

CREATE TABLE IF NOT EXISTS `ourbank_productssaving` (
  `productsoffer_id` int(11) NOT NULL,
  `savingsindividualgroup` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `frequencyofdeposit` int(10) NOT NULL,
  `depo_timefrequency_id` int(10) NOT NULL,
  `minmumdeposit` decimal(10,2) NOT NULL,
  `maximumwithdrawal` decimal(10,2) NOT NULL,
  `rateofinterest` decimal(10,2) NOT NULL,
  `minimumbalanceforinterest` decimal(10,2) NOT NULL,
  `minimumperiodforinterest` smallint(5) NOT NULL,
  `frequencyofinterestupdating` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Int_timefrequency_id` int(10) NOT NULL,
  `amountusedforcalculateinterest` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_productssaving`
--

INSERT INTO `ourbank_productssaving` (`productsoffer_id`, `savingsindividualgroup`, `frequencyofdeposit`, `depo_timefrequency_id`, `minmumdeposit`, `maximumwithdrawal`, `rateofinterest`, `minimumbalanceforinterest`, `minimumperiodforinterest`, `frequencyofinterestupdating`, `Int_timefrequency_id`, `amountusedforcalculateinterest`) VALUES
(2, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productssaving_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_productssaving_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `productsoffer_id` int(11) NOT NULL,
  `savingsindividualgroup` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `frequencyofdeposit` int(10) NOT NULL,
  `depo_timefrequency_id` int(10) NOT NULL,
  `minmumdeposit` decimal(10,2) NOT NULL,
  `maximumwithdrawal` decimal(10,2) NOT NULL,
  `rateofinterest` decimal(10,2) NOT NULL,
  `minimumbalanceforinterest` decimal(10,2) NOT NULL,
  `minimumperiodforinterest` smallint(5) NOT NULL,
  `frequencyofinterestupdating` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Int_timefrequency_id` int(10) NOT NULL,
  `amountusedforcalculateinterest` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_productssaving_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_product_fixedrecurring`
--

CREATE TABLE IF NOT EXISTS `ourbank_product_fixedrecurring` (
  `productsoffer_id` smallint(5) NOT NULL,
  `minimum_deposit_amount` float(10,2) NOT NULL,
  `maximum_deposit_amount` float(10,2) NOT NULL,
  `minimum_periodof_deposit` int(10) NOT NULL,
  `maximum_periodof_deposit` int(10) NOT NULL,
  `frequency_of_deposit` int(10) NOT NULL,
  `penal_Interest` float(10,2) NOT NULL,
  `other_charges` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_product_fixedrecurring`
--

INSERT INTO `ourbank_product_fixedrecurring` (`productsoffer_id`, `minimum_deposit_amount`, `maximum_deposit_amount`, `minimum_periodof_deposit`, `maximum_periodof_deposit`, `frequency_of_deposit`, `penal_Interest`, `other_charges`) VALUES
(3, 1000.00, 100000.00, 0, 0, 8, 22.00, 0.00),
(4, 1000.00, 100000.00, 0, 0, 8, 22.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_product_fixedrecurring_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_product_fixedrecurring_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `productsoffer_id` smallint(5) NOT NULL,
  `minimum_deposit_amount` float(10,2) NOT NULL,
  `maximum_deposit_amount` float(10,2) NOT NULL,
  `minimum_periodof_deposit` int(10) NOT NULL,
  `maximum_periodof_deposit` int(10) NOT NULL,
  `frequency_of_deposit` int(10) NOT NULL,
  `penal_Interest` float(10,2) NOT NULL,
  `other_charges` float(10,2) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_product_fixedrecurring_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_product_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_product_log` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `id` smallint(50) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` smallint(50) NOT NULL,
  `created_by` smallint(50) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_product_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Recordstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_Recordstatus` (
  `recordstatus_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `recordstatusdescription` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`recordstatus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_Recordstatus`
--

INSERT INTO `ourbank_Recordstatus` (`recordstatus_id`, `recordstatusdescription`) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Open'),
(4, 'Delete'),
(5, 'Close');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_recurringaccounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_recurringaccounts` (
  `recurringaccount_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `mature_date` date NOT NULL,
  `recurring_amount` float(10,2) NOT NULL,
  `timefrequncy_id` smallint(5) NOT NULL,
  `fixed_interest` float(5,2) NOT NULL,
  `premature_interest` float(5,2) NOT NULL,
  `fixedaccountstatus_id` tinyint(1) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`recurringaccount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_recurringaccounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_recurringpaydetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_recurringpaydetails` (
  `paymentserial_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `rec_payment_id` smallint(5) NOT NULL,
  `rec_payment_date` date NOT NULL,
  `rec_payment_amount` float(10,2) NOT NULL,
  `rec_payment_penalty_amount` float(10,2) NOT NULL,
  `rec_principal_amount` float(10,2) NOT NULL,
  `rec_payment_status` tinyint(4) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`paymentserial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_recurringpaydetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_recurring_payment`
--

CREATE TABLE IF NOT EXISTS `ourbank_recurring_payment` (
  `rec_paymentserial_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `rec_payment_number` smallint(5) NOT NULL,
  `rec_paymentpaid_date` date NOT NULL,
  `rec_paid_amount` float(10,2) NOT NULL,
  `rec_paid_interst` float(10,2) NOT NULL,
  `rec_paid_other_amount` float(10,2) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`rec_paymentserial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_recurring_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_savingdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_savingdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `deposit_amount` decimal(10,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_savingdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_savings_transaction`
--

CREATE TABLE IF NOT EXISTS `ourbank_savings_transaction` (
  `transaction_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `transactiontype_id` smallint(5) NOT NULL,
  `glsubcode_id_from` int(5) NOT NULL,
  `glsubcode_id_to` int(5) NOT NULL,
  `amount_to_bank` float(10,2) NOT NULL,
  `amount_from_bank` float(10,2) NOT NULL,
  `balance` float(10,2) NOT NULL,
  `transactioncount` tinyint(4) NOT NULL,
  `monthend` int(11) NOT NULL,
  `paymenttype_id` int(10) NOT NULL,
  `paymenttype_details` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_interest` float(10,2) NOT NULL,
  `transaction_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_savings_transaction`
--

INSERT INTO `ourbank_savings_transaction` (`transaction_id`, `account_id`, `transaction_date`, `transactiontype_id`, `glsubcode_id_from`, `glsubcode_id_to`, `amount_to_bank`, `amount_from_bank`, `balance`, `transactioncount`, `monthend`, `paymenttype_id`, `paymenttype_details`, `transaction_description`, `transaction_interest`, `transaction_by`, `created_date`) VALUES
(1, 3, '2011-09-13', 1, 0, 32, 1000.00, 0.00, 1000.00, 1, 0, 1, '', 'Opening amount', 0.00, 1, '2011-09-13 13:31:17'),
(4, 3, '2011-09-13', 1, 0, 32, 500.00, 0.00, 0.00, 0, 0, 1, '0', 'ok', 0.00, 1, '2011-09-13 15:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_servicedetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_servicedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `to_whom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `own_land` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `recuired_loan_help` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_servicedetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_servicedetails_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_servicedetails_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `to_whom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `own_land` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `recuired_loan_help` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_servicedetails_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_transaction`
--

CREATE TABLE IF NOT EXISTS `ourbank_transaction` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `glsubcode_id_from` int(5) NOT NULL,
  `glsubcode_id_to` int(5) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount_to_bank` float(10,2) DEFAULT NULL,
  `amount_from_bank` float(10,2) DEFAULT NULL,
  `paymenttype_id` smallint(5) NOT NULL,
  `paymenttype_details` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `transactiontype_id` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `reffering_vouchernumber` int(11) NOT NULL,
  `transaction_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `balance` float(10,2) NOT NULL,
  `confirmation_flag` tinyint(1) NOT NULL,
  `transaction_remarks` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_transaction`
--

INSERT INTO `ourbank_transaction` (`transaction_id`, `account_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_date`, `amount_to_bank`, `amount_from_bank`, `paymenttype_id`, `paymenttype_details`, `transactiontype_id`, `recordstatus_id`, `reffering_vouchernumber`, `transaction_description`, `balance`, `confirmation_flag`, `transaction_remarks`, `created_by`, `created_date`) VALUES
(1, 3, 0, 32, '2011-09-13', 1000.00, NULL, 1, '', 1, 3, 0, 'Opening amount', 1000.00, 0, '', 1, '2011-09-13 13:31:17'),
(2, 4, 0, 31, '2011-09-13', NULL, 10000.00, 1, '', 2, 3, 0, '(Disbursement) ok', 0.00, 0, '', 1, '2011-09-13 13:38:53'),
(3, 5, 0, 31, '2011-09-13', NULL, 10000.00, 1, '', 2, 3, 0, '(Disbursement) ok', 0.00, 0, '', 1, '2011-09-13 13:39:54'),
(4, 3, 0, 32, '2011-09-13', 500.00, NULL, 1, '0', 1, 3, 0, 'ok', 500.00, 0, '', 1, '2011-09-13 15:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_transactionB`
--

CREATE TABLE IF NOT EXISTS `ourbank_transactionB` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `glsubcode_id_from` int(5) NOT NULL,
  `glsubcode_id_to` int(5) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount_to_bank` float(10,2) DEFAULT NULL,
  `amount_from_bank` float(10,2) DEFAULT NULL,
  `paymenttype_id` smallint(5) NOT NULL,
  `paymenttype_details` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `transactiontype_id` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `reffering_vouchernumber` int(11) NOT NULL,
  `transaction_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `balance` float(10,2) NOT NULL,
  `confirmation_flag` tinyint(1) NOT NULL,
  `transaction_remarks` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_transactionB`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_transactiontype`
--

CREATE TABLE IF NOT EXISTS `ourbank_transactiontype` (
  `id` int(10) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_transactiontype`
--

INSERT INTO `ourbank_transactiontype` (`id`, `name`) VALUES
(1, 'credit'),
(2, 'debit');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_user`
--

CREATE TABLE IF NOT EXISTS `ourbank_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(10) NOT NULL,
  `designation` int(10) NOT NULL,
  `department` int(11) NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` int(11) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_user`
--

INSERT INTO `ourbank_user` (`id`, `bank_id`, `name`, `gender`, `designation`, `department`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 1, 'admin', 1, 1, 1, 'idf', 'idf', 1, 1, '2011-09-09 17:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_user_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_user_log` (
  `record_id` int(50) NOT NULL AUTO_INCREMENT,
  `id` int(50) NOT NULL,
  `bank_id` int(50) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(50) NOT NULL,
  `designation` int(50) NOT NULL,
  `department` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` int(50) NOT NULL,
  `created_by` int(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_user_log`
--

