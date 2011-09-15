-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: db142f.pair.com
-- Generation Time: Sep 15, 2011 at 01:43 AM
-- Server version: 5.1.55
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `priso7h7_obdemo`
--
CREATE DATABASE `OurBank` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `OurBank`;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_Assets`
--

INSERT INTO `ourbank_Assets` (`Assets_id`, `office_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_id`, `credit`, `debit`, `record_status`) VALUES
(1, 4, 0, 37, 1, 0.00, 14999.00, 3),
(2, 4, 0, 39, 1, 0.00, 15000.00, 3),
(3, 4, 38, 0, 6, 1200.00, 0.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Expenditure`
--

CREATE TABLE IF NOT EXISTS `ourbank_Expenditure` (
  `Expenditure_id` int(10) NOT NULL AUTO_INCREMENT,
  `office_id` int(10) NOT NULL,
  `glsubcode_id_from` int(10) NOT NULL,
  `glsubcode_id_to` int(10) NOT NULL,
  `tranasction_id` int(10) NOT NULL,
  `credit` float(10,2) NOT NULL,
  `debit` float(10,2) NOT NULL,
  `recordstatus_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`Expenditure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ourbank_Income`
--

INSERT INTO `ourbank_Income` (`Income_id`, `office_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_id`, `credit`, `debit`, `recordstatus_id`) VALUES
(1, 4, 0, 1893, 1, 1.00, 0.00, 3),
(2, 4, 0, 42, 1, 1.00, 0.00, 3),
(3, 4, 0, 1893, 2, 1.00, 0.00, 3),
(4, 4, 0, 42, 2, 1.00, 0.00, 3),
(5, 4, 0, 1892, 3, 3.00, 0.00, 3),
(6, 4, 0, 1893, 3, 1.00, 0.00, 3),
(7, 4, 0, 42, 3, 4.00, 0.00, 3),
(8, 4, 0, 1892, 4, 3.00, 0.00, 3),
(9, 4, 0, 1893, 4, 1.00, 0.00, 3),
(10, 4, 0, 42, 4, 4.00, 0.00, 3),
(11, 4, 0, 1893, 5, 1.00, 0.00, 3),
(12, 4, 0, 42, 5, 1.00, 0.00, 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
-- Table structure for table `ourbank_accountfee`
--

CREATE TABLE IF NOT EXISTS `ourbank_accountfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  `feeamount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_accountfee`
--

INSERT INTO `ourbank_accountfee` (`id`, `account_id`, `fee_id`, `feeamount`) VALUES
(1, 5, 3, 10.00),
(2, 6, 3, 60.00),
(3, 7, 2, 180.00),
(4, 7, 3, 60.00),
(5, 8, 2, 480.00),
(6, 8, 3, 160.00),
(7, 9, 3, 30.00),
(8, 10, 3, 150.00);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_accounts`
--

INSERT INTO `ourbank_accounts` (`id`, `account_number`, `tag_account`, `member_id`, `product_id`, `begin_date`, `close_date`, `membertype_id`, `accountcreated_date`, `created_date`, `created_by`, `status_id`, `status_description`) VALUES
(1, '0040201S000001', 1, 1, 1, '2011-09-08', '0000-00-00', 2, '2011-09-08', '2011-09-08 10:14:03', 1, 1, ''),
(2, '0040101S000002', 1, 2, 1, '2011-09-08', '0000-00-00', 1, '2011-09-08', '2011-09-08 10:14:03', 1, 1, ''),
(3, '0040101S000003', 1, 3, 1, '2011-09-08', '0000-00-00', 1, '2011-09-08', '2011-09-08 10:14:03', 1, 1, ''),
(4, '0040101S000004', 1, 6, 1, '2011-09-08', '0000-00-00', 1, '2011-09-08', '2011-09-08 10:14:03', 1, 1, ''),
(9, '0040201L000009', 0, 1, 1, '2011-09-01', '2011-09-09', 2, '2011-09-09', '2011-09-09 11:13:35', 1, 3, ''),
(10, '0040202L000010', 0, 1, 2, '2011-09-09', '2011-09-21', 2, '2011-09-09', '2011-09-09 12:00:16', 1, 1, '');

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
(0, 18, 2, 'temple', '', '', 'kadapa', 'konemadanahalli', 'gubbi', 'Tumkur', 'Karnataka', '', 1, '2011-07-07 04:29:02'),
(0, 18, 1, 'Kadaba road', '', '', 'Kadaba', 'Halenahalli', 'Gubbi', 'Tumkur', 'Karnataka', '', 1, '2011-07-08 00:55:58');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_attendancetypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_attendancetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
(1, 'Savings', 'For savings products', 1, '2011-06-06'),
(2, 'Loan', 'For loan products', 1, '2011-06-06');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_family`
--

INSERT INTO `ourbank_family` (`id`, `code`, `family_id`, `sujeevana`, `house_no`, `street`, `village_id`, `Koota_id`, `rev_village_id`, `mobile`, `phone`, `familytype_id`, `minority_id`, `caste_id`, `subcaste_id`, `ration_id`, `nregs_jobno`, `income_id`, `created_by`, `created_date`) VALUES
(1, '004000001', '', '001', '01', 'Demo Street', 1, 3, 4, 9742872408, '919742872408', 1, 0, 4, 0, 3, '', 2, 1, '2011-09-07 23:37:09'),
(2, '004000002', '', '002', '02', 'Demo Street', 1, 3, 4, 9830112349, '', 1, 0, 4, 0, 3, '', 4, 1, '2011-09-08 08:15:33'),
(3, '004000003', '', '003', '03', 'Demo Street', 1, 3, 4, 9830078789, '', 1, 0, 4, 0, 3, '', 3, 1, '2011-09-08 08:27:15');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_family_log`
--

INSERT INTO `ourbank_family_log` (`record_id`, `id`, `code`, `family_id`, `sujeevana`, `house_no`, `street`, `village_id`, `Koota_id`, `rev_village_id`, `mobile`, `phone`, `familytype_id`, `minority_id`, `caste_id`, `subcaste_id`, `ration_id`, `health_ins_id`, `nregs_jobno`, `income_id`, `created_by`, `created_date`) VALUES
(1, 1, 4000001, '', 1, '01', 'Demo Street', 1, 3, 4, 9742872408, 919742872408, 1, 0, 4, 0, 3, 0, '', 2, 1, '2011-09-07 23:37:09');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_familymember`
--

INSERT INTO `ourbank_familymember` (`id`, `family_id`, `familycode`, `village_id`, `name`, `father_name`, `name_inregional`, `alias`, `alias_inregional`, `uid`, `breadwinner_id`, `head_id`, `gender_id`, `dob`, `age`, `relationship_id`, `physicalstatus_id`, `maritalstatus_id`, `eductaion_id`, `employment_status`, `promoter_id`, `cbo_id`, `accouttype_id`, `bank`, `branch_po`, `bank_ac`, `blood_id`, `sign`, `mobile_number`, `photo`, `created_by`, `created_date`) VALUES
(1, 1, '00401000001', 4, 'Main Member', 'Father', '', 'M Member', '', '', 0, 0, 1, '1970-01-01', 41, 1, 0, 1, 3, 1, 1, 1, 1, 1, 1, '0987654321', 6, '', '9742872408', '', 1, '2011-09-08 14:29:06'),
(2, 1, '00401000002', 4, 'Members Wife', 'Father inlaw', '', 'Wife', '', '', 1, 1, 2, '2008-09-08', 36, 2, 0, 1, 2, 6, 1, 1, 1, 1, 1, '0987654321', 4, '', '', '', 1, '2011-09-08 14:29:06'),
(3, 2, '00401000003', 4, 'Elder member', 'father one', '', 'elder', '', '', 1, 1, 2, '1976-01-01', 35, 1, 0, 2, 4, 4, 1, 1, 1, 1, 1, '1234567890', 2, '', '', '', 1, '2011-09-08 13:55:55'),
(4, 2, '00401000004', 4, 'Sister member', 'father one', '', 'sister', '', '', 0, 0, 2, '1978-09-08', 33, 8, 0, 2, 4, 4, 1, 1, 1, 1, 1, '1234567890', 5, '', '', '', 1, '2011-09-08 13:55:55'),
(5, 3, '00401000005', 4, 'Mother Member', 'Grand Father', '', 'mother', '', '', 0, 0, 2, '1950-01-01', 61, 4, 0, 3, 1, 7, 1, 1, 1, 1, 1, '000000006', 2, '', '', '', 1, '2011-09-08 14:30:20'),
(6, 3, '00401000006', 4, 'Daughter Member', 'Grand Father', '', 'Daughter', '', '', 1, 1, 2, '1972-09-08', 39, 1, 0, 1, 4, 4, 1, 1, 1, 1, 1, '2345678901', 2, '', '9830112349', '', 1, '2011-09-08 14:30:20'),
(7, 3, '00401000007', 4, 'Son in Law', 'fathertwo', '', 'SinL', '', '', 0, 0, 1, '1966-09-08', 45, 10, 0, 1, 2, 6, 1, 1, 1, 1, 1, '2345678901', 6, '', '9830112349', '', 1, '2011-09-08 14:30:20');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_familymember_log`
--

INSERT INTO `ourbank_familymember_log` (`record_id`, `id`, `family_id`, `familycode`, `village_id`, `name`, `father_name`, `name_inregional`, `alias`, `alias_inregional`, `uid`, `breadwinner_id`, `head_id`, `gender_id`, `dob`, `age`, `relationship_id`, `physicalstatus_id`, `maritalstatus_id`, `eductaion_id`, `employment_status`, `promoter_id`, `cbo_id`, `accouttype_id`, `bank`, `branch_po`, `bank_ac`, `blood_id`, `sign`, `mobile_number`, `photo`, `created_by`, `created_date`) VALUES
(1, 1, 1, '00401000001', 4, 'Main Member', 'Father', '', 'M Member', '', '', 1, 1, 1, '1970-01-01', 41, 1, 0, 1, 3, 1, 1, 1, 1, 1, 1, '0987654321', 6, '', '9742872408', '', 1, '2011-09-08 13:43:49'),
(2, 2, 1, '00401000002', 4, 'Members Wife', 'Father inlaw', '', 'Wife', '', '', 0, 0, 2, '2008-09-08', 36, 2, 0, 1, 2, 6, 1, 1, 1, 1, 1, '0987654321', 4, '', '', '', 1, '2011-09-08 13:43:49'),
(3, 1, 1, '00401000001', 4, 'Main Member', 'Father', '', 'M Member', '', '', 0, 1, 1, '1970-01-01', 41, 1, 0, 1, 3, 1, 1, 1, 1, 1, 1, '0987654321', 6, '', '9742872408', '', 1, '2011-09-08 14:16:14'),
(4, 2, 1, '00401000002', 4, 'Members Wife', 'Father inlaw', '', 'Wife', '', '', 1, 0, 2, '2008-09-08', 36, 2, 0, 1, 2, 6, 1, 1, 1, 1, 1, '0987654321', 4, '', '', '', 1, '2011-09-08 14:16:14'),
(5, 5, 3, '00401000005', 4, 'Mother Member', 'Grand Father', '', 'mother', '', '', 0, 1, 2, '1950-01-01', 61, 4, 0, 3, 1, 7, 1, 1, 1, 1, 1, '000000006', 2, '', '', '', 1, '2011-09-08 14:07:07'),
(6, 6, 3, '00401000006', 4, 'Daughter Member', 'Grand Father', '', 'Daughter', '', '', 1, 0, 2, '1972-09-08', 39, 1, 0, 1, 4, 4, 1, 1, 1, 1, 1, '2345678901', 2, '', '9830112349', '', 1, '2011-09-08 14:07:07'),
(7, 7, 3, '00401000007', 4, 'Son in Law', 'fathertwo', '', 'SinL', '', '', 0, 0, 1, '1966-09-08', 45, 10, 0, 1, 2, 6, 1, 1, 1, 1, 1, '2345678901', 6, '', '9830112349', '', 1, '2011-09-08 14:07:07');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_fee`
--

INSERT INTO `ourbank_fee` (`id`, `name`, `description`, `value`, `hierarchy_id`, `category_id`, `feetype_id`, `glsubcode_id`, `amountype_id`, `created_by`, `created_date`) VALUES
(1, 'Service charges', 'For Loan processing', '2.00', 3, 2, 2, 1891, 1, 1, '2011-08-07 00:16:05'),
(2, 'Service charges-K', 'For Loan processing', '3.00', 2, 2, 2, 1892, 1, 1, '2011-08-07 00:16:18'),
(3, 'Service charges-F', 'For Loan processing', '1.00', 4, 2, 2, 1893, 1, 1, '2011-08-07 00:16:32');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_funder`
--

INSERT INTO `ourbank_funder` (`id`, `code`, `type`, `name`, `glcode_id`, `status`, `created_by`, `created_date`) VALUES
(1, '0', 2, 'DEMO MFI', 15, '1', 1, '2011-09-08 22:05:21'),
(2, '0', 2, 'DEMO MFI', 16, '1', 1, '2011-09-08 22:05:28'),
(3, '0', 2, 'DEMO MFI', 17, '1', 1, '2011-09-08 22:05:44'),
(4, '0', 2, 'DEMO MFI', 18, '1', 1, '2011-09-08 22:06:14'),
(5, '0', 2, 'DEMO MFI', 19, '1', 1, '2011-09-08 22:09:50');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ob_funders' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ourbank_glcode`
--

INSERT INTO `ourbank_glcode` (`id`, `glcode`, `ledgertype_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 'A01000', '3', 'Bank', 'Bank', 1, '2011-08-17 04:22:02'),
(2, 'A02000', '3', 'Cash', 'Cash', 1, '2011-08-17 04:22:02'),
(3, 'A03000', '3', 'Loans', 'Loans', 1, '2011-08-17 04:22:02'),
(4, 'L01000', '4', 'Savings', 'Savings', 1, '2011-08-17 04:22:02'),
(5, 'I01000', '1', 'Interest', 'Interest', 1, '2011-08-17 04:22:02'),
(6, 'I02000', '1', 'Fee', 'Fee', 1, '2011-08-17 04:22:02'),
(7, 'I03000', '1', 'SrvChrg', 'ServiceCharge', 1, '2011-08-17 04:22:02'),
(8, 'I04000', '1', 'Penalty', 'Penalty', 1, '2011-08-17 04:22:02'),
(9, 'I05000', '1', 'IntOnLoan', 'InterestOnLoans', 1, '2011-08-17 04:22:02'),
(10, 'E01000', '2', 'MeetingExpenses', 'MeetingExpenses', 1, '2011-08-17 04:22:02'),
(11, 'E02000', '2', 'OtherExpenses', 'OtherExpenses', 1, '2011-08-17 04:22:02'),
(12, 'E03000', '2', 'IntOnSavings', 'InterestOnSavings', 1, '2011-08-17 04:22:02'),
(13, 'L01000', '4', 'recurring deposit', 'recurring deposit', 1, '2011-08-17 04:31:55'),
(14, 'A04000', '3', 'loan', 'for loan', 1, '2011-08-18 13:30:00'),
(15, 'L02000', '4', 'DEMO MFI', 'DEMO MFI', 1, '2011-09-08 22:05:21'),
(16, 'L03000', '4', 'DEMO MFI', 'DEMO MFI', 1, '2011-09-08 22:05:28'),
(17, 'L04000', '4', 'DEMO MFI', 'DEMO MFI', 1, '2011-09-08 22:05:44'),
(18, 'L05000', '4', 'DEMO MFI', 'DEMO MFI', 1, '2011-09-08 22:06:14'),
(19, 'L06000', '4', 'DEMO MFI', 'DEMO MFI', 1, '2011-09-08 22:09:50');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=54 ;

--
-- Dumping data for table `ourbank_glsubcode`
--

INSERT INTO `ourbank_glsubcode` (`id`, `office_id`, `glsubcode`, `glcode_id`, `subledger_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 1, 'A01001', 1, '3', 'Bank1', 'Bank1', 1, '2011-09-07'),
(2, 1, 'A02001', 2, '3', 'Cash1', 'Cash1', 1, '2011-09-07'),
(3, 1, 'A03001', 3, '3', 'Loans1', 'Loans1', 1, '2011-09-07'),
(4, 1, 'L01001', 4, '4', 'Savings1', 'Savings1', 1, '2011-09-07'),
(5, 1, 'I01001', 5, '1', 'Interest1', 'Interest1', 1, '2011-09-07'),
(6, 1, 'I02001', 6, '1', 'Fee1', 'Fee1', 1, '2011-09-07'),
(7, 1, 'I03001', 7, '1', 'SrvChrg1', 'SrvChrg1', 1, '2011-09-07'),
(8, 1, 'I04001', 8, '1', 'Penalty1', 'Penalty1', 1, '2011-09-07'),
(9, 1, 'I05001', 9, '1', 'IntOnLoan1', 'IntOnLoan1', 1, '2011-09-07'),
(10, 1, 'E01001', 10, '2', 'MeetingExpenses1', 'MeetingExpenses1', 1, '2011-09-07'),
(11, 1, 'E02001', 11, '2', 'OtherExpenses1', 'OtherExpenses1', 1, '2011-09-07'),
(12, 1, 'E03001', 12, '2', 'IntOnSavings1', 'IntOnSavings1', 1, '2011-09-07'),
(13, 2, 'A01002', 1, '3', 'Bank2', 'Bank2', 1, '2011-09-07'),
(14, 2, 'A02002', 2, '3', 'Cash2', 'Cash2', 1, '2011-09-07'),
(15, 2, 'A03002', 3, '3', 'Loans2', 'Loans2', 1, '2011-09-07'),
(16, 2, 'L01002', 4, '4', 'Savings2', 'Savings2', 1, '2011-09-07'),
(17, 2, 'I01002', 5, '1', 'Interest2', 'Interest2', 1, '2011-09-07'),
(18, 2, 'I02002', 6, '1', 'Fee2', 'Fee2', 1, '2011-09-07'),
(19, 2, 'I03002', 7, '1', 'SrvChrg2', 'SrvChrg2', 1, '2011-09-07'),
(20, 2, 'I04002', 8, '1', 'Penalty2', 'Penalty2', 1, '2011-09-07'),
(21, 2, 'I05002', 9, '1', 'IntOnLoan2', 'IntOnLoan2', 1, '2011-09-07'),
(22, 2, 'E01002', 10, '2', 'MeetingExpenses2', 'MeetingExpenses2', 1, '2011-09-07'),
(23, 2, 'E02002', 11, '2', 'OtherExpenses2', 'OtherExpenses2', 1, '2011-09-07'),
(24, 2, 'E03002', 12, '2', 'IntOnSavings2', 'IntOnSavings2', 1, '2011-09-07'),
(25, 3, 'A01003', 1, '3', 'Bank3', 'Bank3', 1, '2011-09-07'),
(26, 3, 'A02003', 2, '3', 'Cash3', 'Cash3', 1, '2011-09-07'),
(27, 3, 'A03003', 3, '3', 'Loans3', 'Loans3', 1, '2011-09-07'),
(28, 3, 'L01003', 4, '4', 'Savings3', 'Savings3', 1, '2011-09-07'),
(29, 3, 'I01003', 5, '1', 'Interest3', 'Interest3', 1, '2011-09-07'),
(30, 3, 'I02003', 6, '1', 'Fee3', 'Fee3', 1, '2011-09-07'),
(31, 3, 'I03003', 7, '1', 'SrvChrg3', 'SrvChrg3', 1, '2011-09-07'),
(32, 3, 'I04003', 8, '1', 'Penalty3', 'Penalty3', 1, '2011-09-07'),
(33, 3, 'I05003', 9, '1', 'IntOnLoan3', 'IntOnLoan3', 1, '2011-09-07'),
(34, 3, 'E01003', 10, '2', 'MeetingExpenses3', 'MeetingExpenses3', 1, '2011-09-07'),
(35, 3, 'E02003', 11, '2', 'OtherExpenses3', 'OtherExpenses3', 1, '2011-09-07'),
(36, 3, 'E03003', 12, '2', 'IntOnSavings3', 'IntOnSavings3', 1, '2011-09-07'),
(37, 4, 'A01004', 1, '3', 'Bank4', 'Bank4', 1, '2011-09-07'),
(38, 4, 'A02004', 2, '3', 'Cash4', 'Cash4', 1, '2011-09-07'),
(39, 4, 'A03004', 3, '3', 'Loans4', 'Loans4', 1, '2011-09-07'),
(40, 4, 'L01004', 4, '4', 'Savings4', 'Savings4', 1, '2011-09-07'),
(41, 4, 'I01004', 5, '1', 'Interest4', 'Interest4', 1, '2011-09-07'),
(42, 4, 'I02004', 6, '1', 'Fee4', 'Fee4', 1, '2011-09-07'),
(43, 4, 'I03004', 7, '1', 'SrvChrg4', 'SrvChrg4', 1, '2011-09-07'),
(44, 4, 'I04004', 8, '1', 'Penalty4', 'Penalty4', 1, '2011-09-07'),
(45, 4, 'I05004', 9, '1', 'IntOnLoan4', 'IntOnLoan4', 1, '2011-09-07'),
(46, 4, 'E01004', 10, '2', 'MeetingExpenses4', 'MeetingExpenses4', 1, '2011-09-07'),
(47, 4, 'E02004', 11, '2', 'OtherExpenses4', 'OtherExpenses4', 1, '2011-09-07'),
(48, 4, 'E03004', 12, '2', 'IntOnSavings4', 'IntOnSavings4', 1, '2011-09-07'),
(49, 4, 'L01001', 13, '4', 'Absense', 'Penalty for absense', 1, '2011-09-08'),
(50, 4, 'L01002', 13, '4', 'Late', 'Penalty for late', 1, '2011-09-08'),
(51, 0, 'A03005', 3, '3', 'B D Loan', 'demo', 1, '2011-09-08'),
(52, 0, 'A03006', 3, '3', 'Agri loan', 'loan for agriculture', 1, '2011-09-09'),
(53, 0, 'A03007', 3, '3', 'B D Loan', 'loan for BD', 1, '2011-09-09');

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
(1, 'administrator', '2011-06-08 00:48:44', '1'),
(2, 'Clerk', '2011-06-22 08:59:00', '1'),
(3, 'Block officer', '2011-06-22 08:59:20', '1'),
(4, 'Asst Manager', '2011-06-22 08:59:53', '1'),
(5, 'Manager', '2011-06-22 09:00:19', '1'),
(6, 'Testing', '2011-06-22 09:05:26', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_group`
--

INSERT INTO `ourbank_group` (`id`, `village_id`, `bank_id`, `branch_id`, `name`, `head`, `saving_perweek`, `penalty_latecoming`, `penalty_notcoming`, `late_subglcode`, `absent_subglcode`, `place`, `time`, `days`, `rateinterest`, `groupcode`, `latitude`, `longitude`, `group_created_date`, `created_by`, `created_date`) VALUES
(1, 4, 1, 1, 'DEMO GROUP', 2, 50, 5, 10, 49, 50, 'HOUSE', '10:00:00', '7', 10, '00402000001', 0, 0, '2011-09-08', 1, '2011-04-01 04:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_group_representatives`
--

CREATE TABLE IF NOT EXISTS `ourbank_group_representatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL,
  `representative_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_group_representatives`
--

INSERT INTO `ourbank_group_representatives` (`id`, `group_id`, `representative_id`) VALUES
(1, 1, 3),
(2, 1, 6);

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

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_groupmembers`
--

CREATE TABLE IF NOT EXISTS `ourbank_groupmembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `groupmember_status` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_groupmembers`
--

INSERT INTO `ourbank_groupmembers` (`id`, `group_id`, `member_id`, `groupmember_status`) VALUES
(1, 1, 2, 3),
(2, 1, 3, 3),
(3, 1, 6, 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_health_problem`
--

CREATE TABLE IF NOT EXISTS `ourbank_health_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `health_problem` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_hoblies`
--

CREATE TABLE IF NOT EXISTS `ourbank_hoblies` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  `balance` float(10,2) DEFAULT NULL,
  `installment_status` tinyint(4) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ourbank_installmentdetails`
--

INSERT INTO `ourbank_installmentdetails` (`id`, `account_id`, `installment_id`, `installment_date`, `installment_amount`, `installment_interest_amount`, `installment_principal_amount`, `reduced_prinicipal_balance`, `paid_amount`, `balance`, `installment_status`, `created_by`, `created_date`) VALUES
(1, 10, 1, '2011-10-09', 1318.74, 125.00, 1193.74, 13806.26, 1200.00, 118.74, 8, 1, '2011-09-09 12:02:22'),
(2, 10, 2, '2011-11-08', 1318.74, 115.05, 1203.69, 12602.58, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(3, 10, 3, '2011-12-08', 1318.74, 105.02, 1213.72, 11388.86, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(4, 10, 4, '2012-01-07', 1318.74, 94.91, 1223.83, 10165.03, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(5, 10, 5, '2012-02-06', 1318.74, 84.71, 1234.03, 8931.00, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(6, 10, 6, '2012-03-07', 1318.74, 74.42, 1244.31, 7686.68, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(7, 10, 7, '2012-04-06', 1318.74, 64.06, 1254.68, 6432.00, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(8, 10, 8, '2012-05-06', 1318.74, 53.60, 1265.14, 5166.86, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(9, 10, 9, '2012-06-05', 1318.74, 43.06, 1275.68, 3891.18, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(10, 10, 10, '2012-07-05', 1318.74, 32.43, 1286.31, 2604.87, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(11, 10, 11, '2012-08-04', 1318.74, 21.71, 1297.03, 1307.84, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16'),
(12, 10, 12, '2012-09-03', 1318.74, 10.90, 1307.84, 0.00, 0.00, 1318.74, 3, 1, '2011-09-09 12:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_installmentstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_installmentstatus` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_insurance`
--

CREATE TABLE IF NOT EXISTS `ourbank_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `insurance_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_insurance`
--

INSERT INTO `ourbank_insurance` (`id`, `family_id`, `insurance_id`) VALUES
(2, 1, 1),
(3, 2, 1),
(4, 3, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_interest_periods`
--

INSERT INTO `ourbank_interest_periods` (`id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(1, 1, 6, '1-6', 1, 12.50, 3),
(2, 7, 12, '7-12', 1, 15.00, 3),
(3, 1, 6, '1-6', 2, 11.00, 3),
(4, 7, 12, '7-12', 2, 10.00, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_interest_periods_log`
--

INSERT INTO `ourbank_interest_periods_log` (`record_id`, `id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(1, 2, 12, 15, '12-15', 2, 12.50, 3),
(2, 3, 12, 15, '12-15', 2, 12.50, 3),
(3, 4, 12, 15, '12-15', 2, 12.50, 3),
(4, 5, 12, 15, '12-15', 2, 12.50, 3),
(5, 6, 12, 15, '12-15', 2, 12.50, 3),
(6, 7, 12, 15, '12-15', 2, 12.50, 3),
(7, 8, 12, 15, '12-15', 2, 12.50, 3);

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

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_ledgertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_ledgertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_loan_disbursement`
--

INSERT INTO `ourbank_loan_disbursement` (`loandisbursement_id`, `transaction_id`, `account_id`, `loandisbursement_date`, `accountdisbursement_id`, `disbursed_by`, `amount_disbursed`, `transaction_description`, `recordstatus_id`) VALUES
(1, 5, 10, '2011-09-09', 1, 1, 15000.00, 'cash', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_loan_repayment`
--

INSERT INTO `ourbank_loan_repayment` (`id`, `transaction_id`, `account_id`, `installment_id`, `paid_date`, `paid_amount`, `paid_principal`, `paid_interest`, `paid_other_amount`, `balanceamount`, `monthend_tag`, `recordstatus_id`) VALUES
(1, 5, 10, 1, '2011-09-09', 0.00, 0.00, 15000.00, 0.00, 15000.00, 0, 0),
(2, 6, 10, 1, '2011-09-09', 1200.00, 1200.00, 0.00, 0.00, 13800.00, 0, 3);

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
(1, 9, 0, 2, '2011-09-09', '0000-00-00', '0000-00-00', 3000.00, 5, 1, 1, NULL, NULL, 0, 1, '2011-09-09 11:13:35'),
(2, 10, 0, 3, '2011-09-09', '0000-00-00', '0000-00-00', 15000.00, 12, 4, 3, NULL, NULL, 0, 1, '2011-09-09 11:59:17');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_loanprocess`
--

INSERT INTO `ourbank_loanprocess` (`id`, `member_id`, `membertype`, `purpose`, `request_amount`, `loan_duration`, `expecting_inperiod`, `created_date`, `created_by`, `status`) VALUES
(1, 2, 2, 7, 1000, 0, 1, '2011-09-09 11:13:35', 1, '0'),
(2, 3, 2, 1, 1000, 0, 1, '2011-09-09 11:13:35', 1, '0'),
(3, 6, 2, 5, 1000, 0, 1, '2011-09-09 11:13:35', 1, '0'),
(4, 2, 2, 6, 5000, 0, 1, '2011-09-09 11:59:17', 1, '0'),
(5, 3, 2, 6, 4000, 0, 1, '2011-09-09 11:59:17', 1, '0'),
(6, 6, 2, 6, 6000, 0, 1, '2011-09-09 11:59:17', 1, '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_bank`
--

INSERT INTO `ourbank_master_bank` (`id`, `accounttype_id`, `village_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 4, 'DEMO BANK', 'Demo Bank', 0, '0000-00-00 00:00:00');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_branch`
--

INSERT INTO `ourbank_master_branch` (`id`, `bank_id`, `village_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 4, 'DEMO BRANCH', 'Demo Branch', 1, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

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
(12, 'Others', 'ಇತರೆ', 1, '2011-05-25 13:34:24');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_cbopromoter`
--

INSERT INTO `ourbank_master_cbopromoter` (`id`, `name`, `name_regional`, `koota_id`, `created_by`, `created_date`) VALUES
(1, 'DEMO PROMOTER', 'Demo Promoter', 3, 0, '0000-00-00 00:00:00');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_cbos`
--

INSERT INTO `ourbank_master_cbos` (`id`, `cbopromoter_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 'DEMO CBO', 'Demo CBO', 0, '0000-00-00 00:00:00');

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
(1, 'India', '', 'IND', 'Indian Rupee', 'Rs', 'Rupee', 'asia', '1', 1, '2011-05-26 03:10:22'),
(2, 'America', '', 'USA', 'US Dollar', '$', 'USD', '', '', 1, '2011-05-26 03:10:22'),
(3, 'Russia', '', 'USR', 'Rouble', 'RUB', 'RUB', '', '', 1, '2011-05-26 03:10:22'),
(4, 'Japan', '', 'JAP', 'YEN', '¥', 'JPY', '', '', 1, '2011-05-26 03:10:22'),
(5, 'South Africa', '', 'SA', 'ZAR', 'ZAR', 'ZAR', '', '', 1, '2011-05-26 03:10:22'),
(6, 'United Kingdom', '', 'UK', 'Punds', '₤', 'GBP', '', '', 1, '2011-05-26 03:10:22'),
(7, 'Brazil', '', 'BRZ', 'BRL', 'R$', 'Real', '', '', 1, '2011-05-26 03:10:22'),
(8, 'France', '', 'FRN', 'EURO', '€', 'euro', '', '', 1, '2011-05-26 03:10:22'),
(9, 'Germany', '', 'GRM', 'Deutsche Mark', 'DM', 'DM', '', '', 1, '2011-05-26 03:10:22'),
(10, 'Qatar', '', 'QAT', 'Qatari Rial', 'Rial', 'Rial', '', '', 1, '2011-05-26 03:10:22');

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
(1, 'Administration', '', 1, '2011-05-26 04:04:22'),
(2, 'Accounts', '', 1, '2011-05-26 04:04:22'),
(3, 'Field staff', '', 1, '2011-05-26 04:04:22'),
(4, 'Loan department', '', 1, '2011-05-26 04:04:22');

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
(1, 'Manager', '', 1, 1, '2011-05-26 04:05:32'),
(2, 'Clerk', '', 2, 1, '2011-05-26 04:05:32'),
(3, 'Field officer', '', 3, 1, '2011-05-26 04:05:32'),
(4, 'Loan officer', '', 4, 1, '2011-05-26 04:05:32'),
(5, 'Block officer', '', 4, 1, '2011-05-26 04:05:32');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_districtlist`
--

INSERT INTO `ourbank_master_districtlist` (`id`, `name`, `name_regional`, `state_id`, `created_by`, `Created_date`) VALUES
(1, 'DEMO DISTRICT', 'Demo District', 11, 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

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
(12, 'Others', 'ಇತರೆ', 1, '2011-05-25 14:40:18');

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
(1, 'Rabi agricultural expenses', 'ಮುಂಗಾರು ಕೃಷಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(2, 'Kharif agricultural expenses', 'ಹಿಂಗಾರು ಕೃಷಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(3, 'Summer agricultural expenses', 'ಬೇಸಿಗೆ ಕೃಷಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(4, 'Perrinial crops expenses', 'ವಾರ್ಷಿಕ ಬೆಳೆ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(5, 'Expenses of the animal husband', 'ಜಾನುವಾರು ಸಾಕಾಣಿಕೆ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(6, 'Expenses of the Grossary', 'ಪಡಿತರ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(7, 'Expenses of the vegetables', 'ತರಕಾರಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(8, 'Expenses of the transport', 'ಸಾರಿಗೆ/ಸಂಪರ್ಕ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(9, 'Interst on loans', 'ಸಾಲದ ಮೇಲಿನ ಬಡ್ಡಿ', 1, '2011-06-28 23:52:09'),
(10, 'Educational expenses', 'ಶಿಕ್ಷಣಕಾಗಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(11, 'Medical expenses', 'ಆರೋಗ್ಯದ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(12, 'Fuel', 'ಇಂಧನದ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(13, 'Festivals', 'ಹಬ್ಬಗಳಿಗಾಗಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(14, 'Clothes', 'ಬಟ್ತೆ ಖರೀಧಿಗಾಗಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(15, 'Habbits', 'ದುಶ್ಚಟಗಳಿಗಾಗಿ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(16, 'Phone/mobile', 'ಮೊಬೈಲ್ ಬಳಕೆ ಖರ್ಚು', 1, '2011-06-28 23:52:09'),
(17, 'others', 'ಇತರೆ ಖರ್ಚು', 1, '2011-06-28 23:52:09');

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
(1, 'rabi agricultural income', '', 1, '2011-05-25 15:24:55'),
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
(1, 'Male', 'ಗಂಡು', 1, '2011-06-25 02:52:54'),
(2, 'Female', 'ಹೆಣ್ಣು ', 1, '2011-06-28 23:45:29');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_gillapanchayath`
--

INSERT INTO `ourbank_master_gillapanchayath` (`id`, `name`, `name_regional`, `hobli_id`, `created_by`, `Created_date`) VALUES
(1, 'DEMO PANCHAYAT', 'Demo Panchayat', 1, 0, '2011-09-07 13:39:03');

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
(1, 'Drinking', 'ಧೂಮಪಾನ', 1, '2011-07-01 01:01:39'),
(2, 'Tobacco', 'ಮದ್ಯಪಾನ', 1, '2011-07-01 01:01:39'),
(3, 'others', 'ತಮ್ಬಾಕು', 1, '2011-07-01 01:01:39'),
(4, 'Smoking', 'ಇತರೆ', 1, '2011-07-01 01:01:39');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_habitation`
--

INSERT INTO `ourbank_master_habitation` (`id`, `name`, `name_regional`, `village_id`, `created_by`, `created_date`) VALUES
(1, 'DEMO HABITAT', 'Demo Habitat', 4, 1, '0000-00-00 00:00:00');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_hoblilist`
--

INSERT INTO `ourbank_master_hoblilist` (`id`, `name`, `name_regional`, `taluk_id`, `created_by`, `created_date`) VALUES
(1, 'DEMO HOBLI', 'Demo Hobli', 1, 0, '0000-00-00 00:00:00');

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
(1, 'Rabi agricultural income', 'ಮುಂಗಾರು ಕೃಷಿ ಆದಾಯ', 1, '2011-06-28 23:56:06'),
(2, 'Kharif agricultural income', 'ಹಿಂಗಾರು ಕೃಷಿ ಆದಾಯ', 1, '2011-06-28 23:56:06'),
(3, 'Summer agricultural income', 'ಬೇಸಿಗೆ ಕೃಷಿ ಆದಾಯ', 1, '2011-06-28 23:56:06'),
(4, 'Perrinial crops income', 'ವಾರ್ಷಿಕ ಬೆಳೆ ಆದಾಯ', 1, '2011-06-28 23:56:06'),
(5, 'Diary income', 'ಹಾಲು ಉತ್ಪನ್ನದ ಮಾರಾಟ', 1, '2011-06-28 23:56:06'),
(6, 'goat income', 'ಮೇಕೆ ಮಾರಾಟ', 1, '2011-06-28 23:56:06'),
(7, 'sheep income', 'ಕುರಿ ಮಾರಟ', 1, '2011-06-28 23:56:06'),
(8, 'income from poultry', 'ಕೋಳಿ ಮಾರಟ', 1, '2011-06-28 23:56:06'),
(9, 'hen', 'ಕೂಲಿ', 1, '2011-06-28 23:56:06'),
(10, 'income from other sources', 'ಉಪ ಕಸುಬು', 1, '2011-06-28 23:58:31'),
(11, 'income due to profession', 'ವೃತ್ತಿ', 1, '2011-06-28 23:58:31'),
(12, 'others', 'ಇತರೆ', 1, '2011-06-28 23:59:13');

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
(1, 'PM', '', 1, '2011-05-26 06:19:06'),
(2, 'PA', '', 1, '2011-05-26 06:19:06');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `ourbank_master_mastertables`
--

INSERT INTO `ourbank_master_mastertables` (`id`, `name_regional`, `name`, `descriptions`, `created_by`, `created_date`) VALUES
(1, 'ಖಾಯಲೆ ವಿಧಗಳು', 'ourbank_master_accountype', 'Account type', 1, '2011-06-28 06:21:58'),
(2, 'ಬ್ಯಾಂಕ್ ', 'ourbank_master_bank', 'Bank', 1, '2011-06-28 06:21:58'),
(3, 'ವ್ಯಾವಹಾರಿಕ ವಿಧಗಳು', 'ourbank_master_businesstype', 'Businesstype', 1, '2011-06-28 06:21:58'),
(4, 'ಜಾತಿ', 'ourbank_master_castetype', 'Caste type', 1, '2011-06-28 06:21:58'),
(5, 'ಸಂಘದ ಹೆಸರುಗಳು', 'ourbank_master_cbopromoter', 'CBO promoter', 1, '2011-06-28 06:21:58'),
(6, 'ಸಂಘಗಳು', 'ourbank_master_cbos', 'CBOs', 1, '2011-06-28 06:21:58'),
(7, 'ಅಡುಗೆ ಇಂಧನಗಳು', 'ourbank_master_cookingfuel', 'Cooking fuel', 1, '2011-06-28 06:21:58'),
(8, 'ಬೆಳೆಗಳು', 'ourbank_master_crop', 'Crop', 1, '2011-06-28 06:21:58'),
(9, 'Designation', 'ourbank_master_designation', 'Designation', 1, '2011-06-23 22:35:33'),
(10, 'ಖಾಯಲೆ ವಿಧಗಳು', 'ourbank_master_diseasetypes', 'Disease types', 1, '2011-06-28 06:21:58'),
(11, 'ಜಿಲ್ಲೆಗಳು  ', 'ourbank_master_districtlist', 'District list', 1, '2011-06-28 07:14:47'),
(12, 'ವಿಧ್ಯಾಬ್ಯಾಸದ ಮಟ್ಟ', 'ourbank_master_educationtype', 'Education type', 1, '2011-06-28 06:30:13'),
(13, 'ಉಧ್ಯೋಗ ಸ್ಥಿತಿ', 'ourbank_master_employmenttype', 'Employment type', 1, '2011-06-28 06:31:49'),
(14, 'ಸವಲತ್ತುಗಳು ', 'ourbank_master_entitlements', 'Entitlements', 1, '2011-06-28 06:32:31'),
(15, 'ಖರ್ಚುಗಳು ', 'ourbank_master_expense', 'Expense', 1, '2011-06-28 06:24:45'),
(16, 'ಕುಟುಂಬದ ಖರ್ಚುಗಳು ', 'ourbank_master_familyexpense', 'Family Expense', 1, '2011-06-28 06:24:45'),
(17, 'ಕುಟುಂಬದ ಆದಾಯಗಳು ', 'ourbank_master_familyincome', 'Family Income', 1, '2011-06-28 06:24:45'),
(18, 'ಕುಟುಂಬದ ವಿಧ ', 'ourbank_master_familytype', 'Family Type', 1, '2011-06-28 06:24:45'),
(19, 'Frequency payment', 'ourbank_master_frequencypayment', 'Frequency payment', 1, '2011-06-23 22:35:33'),
(20, 'ಹೋಬಳಿ ', 'ourbank_master_hoblilist', 'Hoblilist', 1, '2011-06-28 06:24:45'),
(21, 'ಖರ್ಚುಗಳು ', 'ourbank_master_income', 'Income', 1, '2011-06-28 06:24:45'),
(22, 'Institutions', 'ourbank_master_institutions', 'Institutions', 1, '2011-06-23 22:35:33'),
(23, 'ಭೂಮಾಲೀಕತ್ವ ವಿಧಗಳು', 'ourbank_master_landacquisition', 'Land acquisition', 1, '2011-06-28 06:24:45'),
(24, 'ಭೂಮಿ ವಿಧಗಳು', 'ourbank_master_landtypes', 'Land types', 1, '2011-06-28 06:28:50'),
(25, 'ಜಾನುವಾರು ಸ್ವತ್ತುಗಳು', 'ourbank_master_liveassets', 'Live assets', 1, '2011-06-28 06:28:50'),
(26, 'ಸಾಲದ ಉದ್ದೇಶಗಳು ', 'ourbank_master_loanpurpose', 'Loan purpose', 1, '2011-06-28 07:16:59'),
(27, 'ಸಾಲದ ಮೂಲಗಳು  ', 'ourbank_master_loansource', 'Loan source', 1, '2011-06-28 06:28:50'),
(28, 'ಇತರೇ ಸ್ವತ್ತುಗಳು', 'ourbank_master_nonliveassets', 'Nonliving Assets', 1, '2011-06-28 06:28:50'),
(29, 'ಸ್ವತ್ತಿನ ಮಾಲಿಕತ್ವ ', 'ourbank_master_ownershiptype', 'Ownership Type', 1, '2011-06-28 06:28:50'),
(30, 'Poverty Type', 'ourbank_master_povertytype', 'Poverty Type', 1, '2011-06-23 22:35:33'),
(31, 'ವೃತ್ತಿ', 'ourbank_master_profession', 'Profession', 1, '2011-06-28 07:11:56'),
(32, 'ಕುಟುಂಬದ ಮುಖ್ಯಸ್ತರೊಂದಿ ಸಂಬಂಧಗಳು', 'ourbank_master_realtionshiptype', 'Relationship Type', 1, '2011-06-28 07:09:51'),
(33, 'Service Sectors', 'ourbank_master_servicesectors', 'Service Sectors', 1, '2011-06-23 22:35:33'),
(34, 'Skills', 'ourbank_master_skills', 'Skills', 1, '2011-06-23 22:35:33'),
(35, 'ಆದಾಯದ ಮೂಲಗಳು ', 'ourbank_master_sourceofincome', 'Source of Income', 1, '2011-06-28 07:08:48'),
(36, 'ತಾಲ್ಲೂಕುಗಳು ', 'ourbank_master_taluklist', 'Taluk List', 1, '2011-06-28 07:08:48'),
(37, 'ಗ್ರಾಮ ಪಂಚಾಯತಿ ', 'ourbank_master_gillapanchayath', 'Grama Panchayath', 1, '2011-06-28 07:08:48'),
(38, 'ಮಜಿರೆ', 'ourbank_master_habitation', 'Habitation', 1, '2011-06-28 07:10:34'),
(39, 'ಋತುಗಳು ', 'ourbank_master_seasons', 'Seasons', 1, '2011-06-28 07:08:48'),
(40, 'ಬ್ರಾಂಚ್ ', 'ourbank_master_branch', 'Branch', 1, '2011-06-28 07:08:48'),
(41, 'State', 'ourbank_master_state', 'State', 1, '2011-09-07 12:21:53'),
(42, 'Department', 'ourbank_master_department', 'Department', 1, '2011-09-08 11:04:52'),
(43, 'Fee Amount Type', 'ourbank_feeamounttypes', 'Fee Amount Type', 1, '2011-09-08 13:01:15'),
(44, 'Fee Type', 'ourbank_feetype', 'Fee Type', 1, '2011-09-08 13:01:15');

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
(1, 'Physical', 'ದೈಹಿಕ', 1, '2011-07-01 01:13:53'),
(2, 'Blind', 'ಕುರುಡು', 1, '2011-07-01 01:13:53'),
(3, 'Deaf', 'ಕಿವುಡು', 1, '2011-07-01 01:13:53'),
(4, 'Dumb', 'ಮೂಕ', 1, '2011-07-01 01:13:53'),
(5, 'Others', 'ಇತರೆ', 1, '2011-07-01 01:13:53');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ourbank_master_state`
--

INSERT INTO `ourbank_master_state` (`id`, `name`, `name_regional`, `created_by`, `Created_date`) VALUES
(1, 'Maharastra', 'Maharastra', 1, '2011-09-07 12:14:59'),
(2, 'Karnataka', 'Karnataka', 1, '2011-09-07 12:15:55'),
(3, 'Andra pradesh', 'Andra pradesh', 1, '2011-09-07 12:15:55'),
(4, 'Tamil Nadu', 'Tamil Nadu', 1, '2011-09-07 12:18:46'),
(5, 'Kerala', 'Kerala', 1, '2011-09-07 12:18:46'),
(6, 'Gujrat', 'Gujrat', 1, '2011-09-07 12:19:47'),
(7, 'West Bengal', 'West Bengal', 1, '2011-09-07 12:19:47'),
(8, 'Orissa', 'Orissa', 1, '2011-09-07 12:20:12'),
(9, 'Assam', 'Assam', 1, '2011-09-07 12:20:12'),
(10, 'North East State', 'North East State', 0, '2011-09-07 12:20:52'),
(11, 'DEMO STATE', 'Demo State', 0, '2011-09-07 13:32:53');

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
(1, 'SC', '', 1, 1, '2011-06-23 08:44:54'),
(3, 'ST', '', 2, 1, '2011-06-23 08:44:54'),
(5, 'OBC', '', 3, 1, '2011-06-23 08:44:54'),
(7, 'OTHERS', '', 4, 1, '2011-06-23 08:44:54');

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
(1, 'DEMO TALUK', 'Demo Taluk', 1, 0, '2011-09-07 13:36:53');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_village`
--

INSERT INTO `ourbank_master_village` (`id`, `village_id`, `panchayath_id`, `hobli_id`, `taluk_id`, `district_id`, `state_id`, `created_by`, `created_date`) VALUES
(1, 4, 1, 1, 1, 1, 0, 1, '2011-09-07 19:11:20');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_master_villagelist`
--

INSERT INTO `ourbank_master_villagelist` (`id`, `village_id`, `name`, `name_regional`, `panchayath_id`, `created_by`, `created_date`) VALUES
(1, 4, 'DEMO VILLAGE', 'DEMO VILLAGE', 1, 1, '2011-09-07 19:11:20');

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
(1, 'Monday', '', 1, '2011-05-26 06:15:23'),
(2, 'Tuesday', '', 1, '2011-05-26 06:15:23'),
(3, 'Wednesday', '', 1, '2011-05-26 06:15:23'),
(4, 'Thursday', '', 1, '2011-05-26 06:15:23'),
(5, 'Friday', '', 1, '2011-05-26 06:15:23'),
(6, 'Saturday', '', 1, '2011-05-26 06:15:23'),
(7, 'Sunday', '', 1, '2011-05-26 06:15:23');

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

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberentitlememnt`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberentitlememnt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `entitlement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ourbank_memberentitlememnt`
--

INSERT INTO `ourbank_memberentitlememnt` (`id`, `member_id`, `entitlement_id`) VALUES
(3, 3, 0),
(4, 4, 0),
(10, 1, 0),
(11, 2, 0),
(12, 5, 0),
(13, 6, 0),
(14, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberprofession`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberprofession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `profession_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ourbank_memberprofession`
--

INSERT INTO `ourbank_memberprofession` (`id`, `member_id`, `profession_id`) VALUES
(3, 3, 9),
(4, 4, 9),
(10, 1, 2),
(11, 2, 15),
(12, 5, 0),
(13, 6, 10),
(14, 7, 15);

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
(1, 'Configuration', 0),
(2, 'Membership', 0),
(3, 'Meeting', 0),
(4, 'Disbursement/Repayment', 0),
(5, 'New loan/savings', 0),
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
(1, 'Demo Head ', 'DHO', 1, 1, '2011-09-07', 1),
(2, 'Office One', 'OFO', 2, 1, '2011-09-07', 1),
(3, 'Demo Office Two', 'DOT', 3, 2, '2011-09-07', 1),
(4, 'DEMO VILLAGE', 'DVL', 4, 3, '2011-09-07', 1);

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
(1, 'State Office', 'SO', 1, 1, '2011-09-07'),
(2, 'District Office', 'DO', 2, 1, '2011-09-07'),
(3, 'Area Office', 'AO', 3, 1, '2011-09-07'),
(4, 'Local Office', 'LO', 4, 1, '2011-09-07');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_product`
--

INSERT INTO `ourbank_product` (`id`, `name`, `shortname`, `category_id`, `description`, `created_by`, `created_date`) VALUES
(1, 'personal saving', 'ps', 1, 'for Personal savings', 1, '2011-06-24'),
(2, 'fixed deposit', 'fd', 1, 'for fixed deposit', 1, '2011-06-24'),
(3, 'recurring deposit', 'rd', 1, 'for recurring deposit', 1, '2011-06-24'),
(4, 'Agriculture loan', 'AL1', 2, 'for different agricultural loan products', 1, '2011-07-07'),
(5, 'Business Development', 'B D', 2, 'for business development / new business', 1, '2011-09-08');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_product_log`
--

INSERT INTO `ourbank_product_log` (`record_id`, `id`, `name`, `shortname`, `description`, `category_id`, `created_by`, `created_date`) VALUES
(1, 6, 'Weekly Savings', 'W S', 'Deposit ev', 1, 1, '2011-09-08 19:25:31'),
(2, 6, 'Weekly Savings', 'W S', 'Deposit ev', 1, 1, '2011-09-08 19:31:44');

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
(1, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 1, 12, 0, 0, 9, '', 0),
(2, 1000, 300000, 2, '0.00', '0.00', 4.00, 0, 1, 12, 0, 0, 7, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_productsloan_log`
--

INSERT INTO `ourbank_productsloan_log` (`record_id`, `productsoffer_id`, `minmumloanamount`, `maximunloanamount`, `interesttype_id`, `minimumloaninterest`, `maximunloaninterest`, `penal_Interest`, `installmenttype_id`, `minimumfrequency`, `maximumfrequency`, `fee_id`, `graceperiodtype_id`, `graceperiodnumber`, `fund_id`, `glsubcode`) VALUES
(1, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0),
(2, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0),
(3, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0),
(4, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0),
(5, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0),
(6, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0),
(7, 2, 1000, 100000, 2, '0.00', '0.00', 4.00, 0, 12, 24, 0, 0, 7, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_productsoffer`
--

INSERT INTO `ourbank_productsoffer` (`id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(1, 'Agri loan', 'AL', 4, 'loan for agriculture', '2011-09-01', '2011-09-09', 4, 52, 0, 0, 0),
(2, 'B D Loan', 'BDL', 5, 'loan for BD', '2011-09-09', '2011-09-21', 4, 53, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_productsoffer_log`
--

INSERT INTO `ourbank_productsoffer_log` (`record_id`, `id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(1, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0),
(2, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0),
(3, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0),
(4, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0),
(5, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0),
(6, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0),
(7, 2, 'B D Loan', 'BDL', 4, 'demo', '2011-09-08', '2012-02-09', 4, 51, 0, 0, 0);

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
(1, '', 1, 0, '1.00', '0.00', '0.00', '1.00', 0, 'AvgBalance', 1, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_transaction`
--

INSERT INTO `ourbank_transaction` (`transaction_id`, `account_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_date`, `amount_to_bank`, `amount_from_bank`, `paymenttype_id`, `paymenttype_details`, `transactiontype_id`, `recordstatus_id`, `reffering_vouchernumber`, `transaction_description`, `balance`, `confirmation_flag`, `transaction_remarks`, `created_by`, `created_date`) VALUES
(1, 5, 0, 51, '2011-09-09', NULL, 1000.00, 1, '', 2, 3, 0, '(Disbursement) disbursed', 0.00, 0, '', 1, '2011-09-09 08:05:41'),
(2, 6, 0, 51, '2011-09-09', NULL, 6000.00, 1, '', 2, 3, 0, '(Disbursement) disbursed', 0.00, 0, '', 1, '2011-09-09 09:44:30'),
(3, 7, 0, 51, '2011-09-09', NULL, 6000.00, 1, '', 2, 3, 0, '(Disbursement) cash', 0.00, 0, '', 1, '2011-09-09 10:18:16'),
(4, 8, 0, 51, '2011-09-09', NULL, 10000.00, 1, '', 2, 3, 0, '(Disbursement) cash', 0.00, 0, '', 1, '2011-09-09 10:24:26'),
(5, 10, 0, 53, '2011-09-09', NULL, 15000.00, 1, '', 2, 3, 0, '(Disbursement) cash', 0.00, 0, '', 1, '2011-09-09 12:00:16'),
(6, 10, 0, 53, '2011-09-09', 1200.00, NULL, 1, '', 1, 3, 0, '(Repayment) cash', 0.00, 0, '', 1, '2011-09-09 12:02:22');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_user`
--

INSERT INTO `ourbank_user` (`id`, `bank_id`, `name`, `gender`, `designation`, `department`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 1, 'admin', 1, 1, 1, 'admin', 'admin', 1, 1, '2011-08-09 03:18:07'),
(2, 4, 'admin1', 1, 1, 1, 'admin1', 'admin1', 1, 0, '2011-09-08 11:01:02');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
