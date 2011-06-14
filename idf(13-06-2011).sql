-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2011 at 07:53 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `OurBank`
--

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_accountfee`
--

CREATE TABLE IF NOT EXISTS `ourbank_accountfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_accountfee`
--

INSERT INTO `ourbank_accountfee` (`id`, `account_id`, `fee_id`) VALUES
(1, 13, 1),
(2, 14, 1),
(3, 14, 2),
(4, 3, 1),
(5, 2, 1),
(6, 2, 2),
(7, 2, 1),
(8, 3, 1),
(9, 6, 1),
(10, 6, 2);

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
(1, '0070307S000001', 1, 1, 7, '2011-06-10', '0000-00-00', 3, '2011-06-10', '2011-06-10 12:02:46', 1, 1, ''),
(2, '0070107S000002', 1, 1, 7, '2011-06-10', '0000-00-00', 1, '2011-06-10', '2011-06-10 12:02:46', 1, 1, ''),
(3, '0070307S000003', 3, 2, 7, '2011-06-10', '0000-00-00', 3, '2011-06-10', '2011-06-10 12:05:12', 1, 1, ''),
(4, '0070107S000004', 3, 5, 7, '2011-06-10', '0000-00-00', 1, '2011-06-10', '2011-06-10 12:05:12', 1, 1, ''),
(5, '0070310F000005', 0, 1, 10, '2011-06-09', '0000-00-00', 3, '2011-06-10', '2011-06-10 12:18:43', 1, 1, ''),
(6, '0070310F000006', 0, 2, 10, '2011-06-10', '0000-00-00', 3, '2011-06-10', '2011-06-10 12:19:31', 1, 1, ''),
(7, '0070110F000007', 0, 1, 10, '2011-06-10', '0000-00-00', 1, '2011-06-10', '2011-06-10 12:55:20', 2, 1, ''),
(8, '0070310F000008', 0, 1, 10, '2011-06-10', '0000-00-00', 3, '2011-06-10', '2011-06-10 12:55:52', 2, 1, ''),
(9, '0070310F000009', 0, 1, 10, '2011-06-10', '0000-00-00', 3, '2011-06-10', '2011-06-10 12:56:39', 2, 1, ''),
(10, '0070311R000010', 0, 1, 11, '2011-01-01', '0000-00-00', 3, '2011-06-10', '2011-06-10 14:29:19', 1, 1, '');

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

INSERT INTO `ourbank_address` (`submodule_id`, `id`, `address1`, `address2`, `address3`, `hobli`, `village`, `city`, `district`, `state`, `zipcode`, `created_by`, `created_date`) VALUES
(18, 1, '#916,HRBR Layout,', 'Hennur cross', 'Outer ring road', '', '', 'Bangalore', '', '', '', 1, '2011-06-10 12:02:50');

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
(0, 18, 1, '#916,HRBR Layout,', 'Hennur cross', '', '', '', 'Bangalore', '', '', '', 1, '2011-06-07 16:22:31');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_agriculture`
--

INSERT INTO `ourbank_agriculture` (`id`, `family_id`, `landowner_name`, `land_id`, `acquistion_id`, `villagename`, `survey_no`, `acre`, `gunta`, `agreement`, `created_by`, `created_date`) VALUES
(1, 1, '1', 3, 4, '2', '109', '5', '3', '', 0, '2011-06-10 11:40:52'),
(2, 3, '5', 3, 3, '4', '321', '5', '3', '', 0, '2011-06-10 11:56:22'),
(3, 4, '7', 3, 2, '4', '23', '5', '3', '', 0, '2011-06-10 12:00:11');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_agriculture_log`
--

INSERT INTO `ourbank_agriculture_log` (`record_id`, `id`, `family_id`, `landowner_id`, `landowner_name`, `land_id`, `acquistion_id`, `villagename`, `survey_no`, `acre`, `gunta`, `value`, `agreement`, `created_by`, `created_date`) VALUES
(1, 1, 1, 0, '2', 2, 2, '1', '256', '4', '5', 0.00, '', 0, '2011-06-07 09:22:38');

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
(1, 7, 0, 72, 1, 2000.00, 0.00, 3),
(2, 7, 0, 72, 2, 3000.00, 0.00, 3),
(3, 7, 0, 72, 3, 350.00, 0.00, 3),
(4, 7, 0, 72, 4, 3000.00, 0.00, 3),
(5, 7, 0, 72, 5, 400.00, 0.00, 3),
(6, 7, 0, 73, 55, 10000.00, 0.00, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_attendance_log`
--

INSERT INTO `ourbank_attendance_log` (`record_id`, `id`, `transaction_id`, `week_no`, `meeting_id`, `meeting_date`, `notes`, `created_by`, `created_date`, `resolution`, `time`) VALUES
(1, 2, 0, 2, 1, '2011-06-08', '', 1, '2011-06-07 12:40:00', '', '12:23:35'),
(2, 1, 5, 1, 1, '2011-06-07', '', 1, '2011-06-07 09:52:36', '', '10:03:00');

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

INSERT INTO `ourbank_contact` (`submodule_id`, `id`, `contact_person`, `telephone`, `mobile`, `email`, `created_by`, `created_date`) VALUES
(18, 1, 'kumar', '044234574', '997662851', 'kumar@gmail.com', 1, '2011-06-10 12:03:06');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_cropdetails`
--

INSERT INTO `ourbank_cropdetails` (`id`, `submodule_id`, `family_id`, `crop_id`, `land_id`, `season_id`, `acre`, `gunta`, `unit`, `quantity`, `marketed`, `price`, `realised`, `sold_date`, `created_by`, `created_date`) VALUES
(1, 0, 1, 6, 3, 3, 5, 3, 1, '21', '7', '9000', 63000, '0000-00-00', 0, '2011-06-10 11:41:49');

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

--
-- Dumping data for table `ourbank_cropdetails_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_decision_log`
--

INSERT INTO `ourbank_decision_log` (`record_id`, `id`, `attendance_id`, `decision_id`, `created_date`) VALUES
(1, 2, 2, 1, '2011-06-07 12:40:00'),
(2, 1, 1, 0, '2011-06-07 09:52:36');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_discussion_log`
--

INSERT INTO `ourbank_discussion_log` (`record_id`, `id`, `attendance_id`, `discussion_id`, `created_date`) VALUES
(1, 2, 2, 1, '2011-06-07 12:40:00'),
(2, 1, 1, 0, '2011-06-07 09:52:36');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_expensedetails_log`
--

INSERT INTO `ourbank_expensedetails_log` (`record_id`, `id`, `submodule_id`, `family_id`, `expense_id`, `value`, `created_by`, `created_date`) VALUES
(1, 1, 17, 1, 1, '1000', 1, '2011-06-09 17:08:50');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_family`
--

INSERT INTO `ourbank_family` (`id`, `code`, `family_id`, `sujeevana`, `house_no`, `street`, `village_id`, `rev_village_id`, `mobile`, `phone`, `familytype_id`, `minority_id`, `caste_id`, `subcaste_id`, `ration_id`, `nregs_jobno`, `income_id`, `created_by`, `created_date`) VALUES
(1, '004000001', '23506', '15093', '132/5', 'Kamaraj Road', 4, 7, 997662851, '044-54543412', 2, 1, 3, 0, 3, '', 3, 1, '2011-06-10 11:22:46'),
(2, '004000002', '49812', '15093', '132/5', 'Nethaji Road', 4, 7, 9956783679, '044-54761390', 2, 1, 4, 0, 4, '', 3, 1, '2011-06-10 12:00:35'),
(3, '004000003', '98077', '78921', '32/89', 'Gandiji road', 4, 7, 997689854, '044-54543412', 2, 0, 3, 0, 4, '', 4, 1, '2011-06-10 11:51:25'),
(4, '004000004', '23461', '34579', '123B', 'BIAS Road', 4, 7, 997662851, '044-54543412', 2, 0, 4, 0, 4, '', 3, 1, '2011-06-10 11:57:29'),
(5, '004000005', '66', '12', '3332', 'R.K street', 4, 7, 9992563268, '', 1, 1, 3, 0, 3, '', 3, 1, '2011-06-13 11:55:28');

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
  `can_sign` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` blob NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_familymember`
--

INSERT INTO `ourbank_familymember` (`id`, `family_id`, `familycode`, `village_id`, `name`, `name_inregional`, `alias`, `alias_inregional`, `uid`, `breadwinner_id`, `head_id`, `gender_id`, `dob`, `age`, `relationship_id`, `physicalstatus_id`, `maritalstatus_id`, `eductaion_id`, `employment_status`, `promoter_id`, `cbo_id`, `accouttype_id`, `bank`, `branch_po`, `bank_ac`, `blood_id`, `can_sign`, `mobile_number`, `photo`, `created_by`, `created_date`) VALUES
(1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '122', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-13 16:29:56'),
(2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '122', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-13 16:29:56'),
(3, 2, '00701000003', 7, 'Ramesh kumar', 'Ramesh kumar', 'Ramesh kumar', 'Ramesh kumar', '251', 0, 1, 1, '1954-06-10', 57, 3, 0, 1, 7, 1, 2, 7, 3, 4, 10, '', 3, '', '', '', 1, '2011-06-10 11:49:11'),
(4, 2, '00701000004', 7, 'Karunakar', 'Karunakar', 'Karunakar', 'Karunakar', '125', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 2, 3, 8, 3, 7, 11, '', 6, '', '', '', 1, '2011-06-10 11:49:11'),
(5, 3, '00701000005', 7, 'Saravanan', 'Saravanan', 'Saravanan', 'Saravanan', '3211', 0, 1, 1, '1952-06-10', 59, 3, 0, 6, 12, 1, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-10 11:55:17'),
(6, 3, '00701000006', 7, 'Singara velan', 'Singara velan', 'Singara velan', 'Singara velan', '4325', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 2, 1, 9, 3, 4, 10, '', 6, '', '', '', 1, '2011-06-10 11:55:17'),
(7, 4, '00701000007', 7, 'Udhayan', 'Udhayan', 'Udhayan', 'Udhayan', '2134', 0, 1, 1, '1966-06-10', 45, 3, 0, 6, 12, 1, 6, 4, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-10 11:59:50'),
(8, 4, '00701000008', 7, 'Aravind', 'Aravind', 'Aravind', 'Aravind', '4323', 1, 0, 1, '1997-06-10', 14, 5, 0, 2, 11, 14, 1, 9, 1, 5, 6, '', 4, '', '', '', 1, '2011-06-10 11:59:50');

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
  `can_sign` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` blob NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=60 ;

--
-- Dumping data for table `ourbank_familymember_log`
--

INSERT INTO `ourbank_familymember_log` (`record_id`, `id`, `family_id`, `familycode`, `village_id`, `name`, `name_inregional`, `alias`, `alias_inregional`, `uid`, `breadwinner_id`, `head_id`, `gender_id`, `dob`, `age`, `relationship_id`, `physicalstatus_id`, `maritalstatus_id`, `eductaion_id`, `employment_status`, `promoter_id`, `cbo_id`, `accouttype_id`, `bank`, `branch_po`, `bank_ac`, `blood_id`, `can_sign`, `mobile_number`, `photo`, `created_by`, `created_date`) VALUES
(1, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 2, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-07 12:24:15'),
(2, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 2, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-07 12:25:38'),
(3, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-07 12:25:38'),
(4, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-07 19:49:26'),
(5, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-07 19:49:26'),
(6, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:09:45'),
(7, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '123', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:09:45'),
(8, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:10:02'),
(9, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:10:02'),
(10, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:11:31'),
(11, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '123', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:11:31'),
(12, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:12:09'),
(13, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:12:09'),
(14, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:22:50'),
(15, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:22:50'),
(16, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '124', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:22:50'),
(17, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:23:12'),
(18, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:23:13'),
(19, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '125', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:23:13'),
(20, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:33:20'),
(21, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(22, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '125', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(23, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(24, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '123', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:33:53'),
(25, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:33:53'),
(26, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '124', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:33:54'),
(27, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(28, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '124', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:34:19'),
(29, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:34:20'),
(30, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '124', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:34:20'),
(31, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(32, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '124', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:36:35'),
(33, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:36:35'),
(34, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '124', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:36:36'),
(35, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(36, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '125', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:36:55'),
(37, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '125', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:36:55'),
(38, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '124', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:36:55'),
(39, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(40, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '124', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:37:25'),
(41, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '126', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:37:25'),
(42, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '130', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:37:25'),
(43, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(44, 1, 1, '00501000001', 5, 'ram', '', 'ram', '', '124', 1, 1, 1, '1986-06-07', 25, 5, 0, 6, 8, 5, 5, 2, 1, 1, 4, '', 3, '', '', '', 1, '2011-06-09 17:43:32'),
(45, 2, 1, '00501000002', 5, 'murthy', '', 'murthy', '', '124', 0, 0, 1, '1966-06-07', 45, 3, 0, 6, 6, 7, 2, 7, 3, 4, 10, '', 2, '', '', '', 1, '2011-06-09 17:43:33'),
(46, 5, 1, '00501000005', 5, 'Kishore', '', 'Kishore', '', '130', 0, 0, 1, '1977-06-09', 34, 7, 0, 6, 4, 8, 6, 4, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-09 17:43:33'),
(47, 6, 1, '00501000006', 5, 'rohit', '', 'rohit', '', '125', 0, 0, 2, '2011-06-09', 0, 4, 0, 6, 1, 1, 6, 0, 3, 0, 0, '', 2, '', '', '', 1, '2011-06-09 17:33:20'),
(48, 1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '123', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-10 11:40:20'),
(49, 2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '231', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-10 11:40:20'),
(50, 1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '123', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-13 16:11:03'),
(51, 2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '123', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-13 16:11:03'),
(52, 1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '123', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-13 16:11:32'),
(53, 2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '12', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-13 16:11:32'),
(54, 1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '123', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-13 16:28:43'),
(55, 2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '123', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-13 16:28:43'),
(56, 1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '122', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-13 16:29:56'),
(57, 2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '122', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-13 16:29:56'),
(58, 1, 1, '00701000001', 7, 'Annamalai', 'Annamalai', 'Annamalai', 'Annamalai', '122', 0, 1, 1, '1956-06-10', 55, 3, 0, 6, 11, 1, 5, 2, 3, 4, 10, '', 4, '', '', '', 1, '2011-06-13 16:29:56'),
(59, 2, 1, '00701000002', 7, 'murthy', 'murthy', 'murthy', 'murthy', '122', 1, 0, 1, '1986-06-10', 25, 5, 0, 2, 8, 1, 2, 7, 3, 7, 11, '', 2, '', '', '', 1, '2011-06-13 16:29:56');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_family_log`
--

INSERT INTO `ourbank_family_log` (`record_id`, `id`, `code`, `family_id`, `sujeevana`, `house_no`, `street`, `village_id`, `rev_village_id`, `mobile`, `phone`, `familytype_id`, `minority_id`, `caste_id`, `subcaste_id`, `ration_id`, `health_ins_id`, `nregs_jobno`, `income_id`, `created_by`, `created_date`) VALUES
(1, 1, 62000001, '678', 7, '12-B', 'poyas garden street', 62, 5, 0, 0, 2, 1, 3, 0, 3, 0, '', 3, 1, '2011-06-07 12:16:37'),
(2, 1, 62000001, '678', 7, '12-B', 'poyas garden street', 62, 5, 997689854, 44, 2, 1, 3, 0, 3, 0, '', 3, 1, '2011-06-07 12:17:38'),
(3, 2, 65000002, '342', 23423, '132/5', 'Kamaraj Road', 65, 5, 997662851, 44, 2, 1, 3, 0, 3, 0, '', 3, 1, '2011-06-09 17:12:36'),
(4, 2, 65000002, '678', 23423, '132/5', 'Kamaraj Road', 65, 5, 997662851, 44, 2, 1, 3, 0, 3, 0, '', 3, 1, '2011-06-09 17:12:53'),
(5, 3, 63000003, '679', 234, '23', '23', 63, 5, 9878923234, 0, 2, 0, 4, 0, 3, 0, '', 3, 1, '2011-06-09 17:31:06'),
(6, 3, 63000003, '678', 234, '23', '23', 63, 5, 9878923234, 0, 2, 0, 4, 0, 3, 0, '', 3, 1, '2011-06-09 17:31:14'),
(7, 2, 4000002, '4981', 15093, '132/5', 'Nethaji Road', 4, 7, 9956783679, 44, 2, 1, 4, 0, 4, 0, '', 3, 1, '2011-06-10 12:00:35');

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
(2, 'service fee', 'fee for service', 7.00, 2, 2, 2, 24, 1, 1, '2011-06-09 18:21:37');

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
(1, 2, 'service fee', 'fee for service', 7.00, 2, 2, 2, 1, 24, 1, '2011-06-09 18:53:20');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_fixedaccounts`
--

INSERT INTO `ourbank_fixedaccounts` (`fixedaccount_id`, `account_id`, `begin_date`, `mature_date`, `fixed_amount`, `timefrequncy_id`, `fixed_interest`, `premature_interest`, `fixedaccountstatus_id`, `created_by`, `created_date`, `recordstatus_id`) VALUES
(1, 5, '2011-06-09', '2013-06-09', 2000.00, 0, 88.00, 1.00, 1, 1, '2011-06-10', 3),
(2, 6, '2011-06-10', '2013-06-10', 3000.00, 0, 88.00, 1.00, 1, 1, '2011-06-10', 3),
(3, 7, '2011-06-10', '2012-09-10', 350.00, 0, 88.00, 1.00, 1, 2, '2011-06-10', 3),
(4, 8, '2011-06-10', '2011-08-10', 3000.00, 0, 84.00, 1.00, 1, 2, '2011-06-10', 3),
(5, 9, '2011-06-10', '2011-10-10', 400.00, 0, 85.00, 1.00, 1, 2, '2011-06-10', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ob_funders' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_funder`
--

INSERT INTO `ourbank_funder` (`id`, `code`, `type`, `name`, `glcode_id`, `status`, `created_by`, `created_date`) VALUES
(1, '0', 2, 'IDBI', 14, '1', 1, '2011-06-09 17:54:51');

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
(1, 1, 2, 'IDBI', '0', 14, '1', NULL, '2011-06-09 18:07:08'),
(2, 1, 1, 'IDBI', '0', 14, '1', NULL, '2011-06-09 18:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_funding`
--

CREATE TABLE IF NOT EXISTS `ourbank_funding` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `institution_id` int(10) NOT NULL,
  `currency_id` int(5) NOT NULL,
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
(1, 'IDBI-health', 1, 0, 8, 80000.00, 50, 2, 1.00, 0, 0, '2011-06-01', '2011-06-30', 1, '2011-06-09');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_funding_log`
--

INSERT INTO `ourbank_funding_log` (`record_id`, `id`, `name`, `funder_id`, `institution_id`, `intrest`, `currency_id`, `amount`, `exchangerate`, `glsubcode_id`, `interest`, `accounting_line`, `recordstatus_id`, `beginingdate`, `closingdate`, `created_by`, `created_date`) VALUES
(1, 1, 'ramzan', 1, 0, 0, 4, 90.00, 2.00, 50, 8, 0, 0, '2011-06-01', '2011-06-16', 1, '2011-06-09'),
(2, 1, 'IDBI-Child', 1, 0, 0, 1, 80000.00, 1.00, 50, 2, 0, 0, '2011-06-01', '2011-06-30', 1, '2011-06-09'),
(3, 1, 'IDBI-Child', 1, 0, 0, 3, 80000.00, 1.00, 50, 2, 0, 0, '2011-06-01', '2011-06-30', 1, '2011-06-09'),
(4, 1, 'IDBI-Child', 1, 0, 0, 8, 80000.00, 1.00, 50, 2, 0, 0, '2011-06-01', '2011-06-30', 1, '2011-06-09'),
(5, 1, 'IDBI-health', 1, 0, 0, 8, 80000.00, 1.00, 50, 2, 0, 0, '2011-06-01', '2011-06-30', 1, '2011-06-09');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ourbank_glcode`
--

INSERT INTO `ourbank_glcode` (`id`, `glcode`, `ledgertype_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 'A01000', '3', 'Bank', 'Bank in assets', 1, '2011-02-10 12:31:13'),
(2, 'A02000', '3', 'Cash', 'Cash in assets', 1, '2011-02-10 12:31:13'),
(3, 'L01000', '4', 'group sb', 'group savings bank account', 1, '2011-02-22 13:35:01'),
(4, 'E01000', '2', 'shg expenditure', 'shg expenditure', 1, '2011-02-22 13:37:31'),
(5, 'I01000', '1', 'individual', 'indi', 1, '2011-02-23 10:22:53'),
(6, 'L02000', '4', 'personal saving', 'for Personal savings', 1, '2011-04-08 00:00:00'),
(7, 'L03000', '4', 'fixed deposit', 'for fixed deposit', 1, '2011-04-08 00:00:00'),
(8, 'L04000', '4', 'recurring deposit', 'for recurring deposit', 1, '2011-04-08 00:00:00'),
(9, 'A03000', '3', 'loan', 'for loan', 1, '2011-04-08 00:00:00'),
(10, 'I01000', '1', 'Fee', 'Fee in income', 1, '2011-06-07 09:07:03'),
(11, 'E02000', '2', 'expenditure 12', 'expenditure 12', 1, '2011-06-07 11:31:04'),
(12, 'L02000', '4', 'gaanthi', 'gaanthi', 1, '2011-06-09 17:48:45'),
(14, 'L02000', '4', 'IDBI', 'IDBI', 1, '2011-06-09 17:54:51');

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
(1, 1, 'A01000', '3', 'Bank', 'Bank in assets', 1, '2011-02-10 12:31:13');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=85 ;

--
-- Dumping data for table `ourbank_glsubcode`
--

INSERT INTO `ourbank_glsubcode` (`id`, `office_id`, `glsubcode`, `glcode_id`, `subledger_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 1, 'A01001', 1, '3', 'Bank1', 'Bank1', 1, '2011-05-24'),
(2, 1, 'A02001', 2, '3', 'Cash1', 'Cash1', 1, '2011-05-24'),
(3, 2, 'A01002', 1, '3', 'Bank2', 'Bank2', 1, '2011-05-24'),
(4, 2, 'A02002', 2, '3', 'Cash2', 'Cash2', 1, '2011-05-24'),
(5, 3, 'A01003', 1, '3', 'Bank3', 'Bank3', 1, '2011-05-24'),
(6, 3, 'A02003', 2, '3', 'Cash3', 'Cash3', 1, '2011-05-24'),
(7, 4, 'A01004', 1, '3', 'Bank4', 'Bank4', 1, '2011-05-24'),
(8, 4, 'A02004', 2, '3', 'Cash4', 'Cash4', 1, '2011-05-24'),
(9, 5, 'A01005', 1, '3', 'Bank5', 'Bank5', 1, '2011-05-24'),
(10, 5, 'A02005', 2, '3', 'Cash5', 'Cash5', 1, '2011-05-24'),
(11, 6, 'A01006', 1, '3', 'Bank6', 'Bank6', 1, '2011-05-24'),
(12, 6, 'A02006', 2, '3', 'Cash6', 'Cash6', 1, '2011-05-24'),
(13, 7, 'A01007', 1, '3', 'Bank7', 'Bank7', 1, '2011-05-24'),
(14, 7, 'A02007', 2, '3', 'Cash7', 'Cash7', 1, '2011-05-24'),
(15, 8, 'A01008', 1, '3', 'Bank8', 'Bank8', 1, '2011-05-24'),
(16, 8, 'A02008', 2, '3', 'Cash8', 'Cash8', 1, '2011-05-24'),
(17, 6, 'L02001', 6, '4', 'Savings', 'Savings', 4, '2011-06-06'),
(18, 0, 'A03001', 9, '9', 'crop loan', 'crop loan', 1, '2011-06-07'),
(19, 6, 'L04001', 8, '4', 'Absense', 'Penalty for absense', 1, '2011-06-07'),
(20, 6, 'L04002', 8, '4', 'Late', 'Penalty for late', 1, '2011-06-07'),
(21, 0, 'L03001', 7, '7', 'Fixed deposit for all', 'Fixed deposit for all', 1, '2011-06-07'),
(22, 2, 'A01001', 10, '1', 'registration', 'fee for registration', 1, '0000-00-00'),
(23, 0, 'L04003', 8, '8', 'Recurring Deposit for all', 'Recurring Deposit for all', 1, '2011-06-07'),
(24, 2, 'A01002', 10, '1', 'service fee', 'fee for service', 1, '0000-00-00'),
(25, 0, 'L02002', 6, '6', '', '', 1, '2011-06-07'),
(26, 1, 'A01009', 1, '3', 'Bank1', 'Bank1', 1, '2011-06-07'),
(27, 1, 'A02009', 2, '3', 'Cash1', 'Cash1', 1, '2011-06-07'),
(28, 2, 'A01010', 1, '3', 'Bank2', 'Bank2', 1, '2011-06-07'),
(29, 2, 'A02010', 2, '3', 'Cash2', 'Cash2', 1, '2011-06-07'),
(30, 3, 'A01011', 1, '3', 'Bank3', 'Bank3', 1, '2011-06-07'),
(31, 3, 'A02011', 2, '3', 'Cash3', 'Cash3', 1, '2011-06-07'),
(32, 4, 'A01012', 1, '3', 'Bank4', 'Bank4', 1, '2011-06-07'),
(33, 4, 'A02012', 2, '3', 'Cash4', 'Cash4', 1, '2011-06-07'),
(34, 5, 'A01013', 1, '3', 'Bank5', 'Bank5', 1, '2011-06-07'),
(35, 5, 'A02013', 2, '3', 'Cash5', 'Cash5', 1, '2011-06-07'),
(36, 6, 'A01014', 1, '3', 'Bank6', 'Bank6', 1, '2011-06-07'),
(37, 6, 'A02014', 2, '3', 'Cash6', 'Cash6', 1, '2011-06-07'),
(38, 7, 'A01015', 1, '3', 'Bank7', 'Bank7', 1, '2011-06-07'),
(39, 7, 'A02015', 2, '3', 'Cash7', 'Cash7', 1, '2011-06-07'),
(40, 0, 'A03002', 9, '9', 'crop loan', 'crop loan', 1, '2011-06-07'),
(41, 0, 'A03003', 9, '9', 'crop loan', 'crop loan', 1, '2011-06-07'),
(42, 0, 'A03004', 9, '9', 'Agriculture loan', 'For Agriculture loan', 1, '2011-06-07'),
(43, 0, 'A03005', 9, '9', 'Education loan', 'for Education loan', 1, '2011-06-07'),
(44, 5, 'L02003', 6, '4', 'Savings', 'Savings', 1, '2011-06-07'),
(45, 0, 'A03006', 9, '9', 'crop loan', 'crl', 1, '2011-06-07'),
(46, 0, 'A03007', 9, '9', 'Education loan', 'for Education loan', 1, '2011-06-07'),
(47, 0, 'A03008', 9, '9', 'other purpose loan', 'for other purpose loan', 1, '2011-06-07'),
(48, 0, 'L03002', 7, '7', 'Fixed deposit for All', 'Fixed deposit for All', 1, '2011-06-08'),
(49, 0, 'L03003', 7, '7', 'fd for all2', 'fd', 1, '2011-06-09'),
(50, 5, 'L02001', 14, '4', 'IDBI-Child', 'IDBI-Child', 1, '2011-06-09'),
(51, 5, 'L02004', 6, '4', 'Savings', 'Savings', 1, '2011-06-09'),
(52, 5, 'L02005', 6, '4', 'Savings', 'Savings', 1, '2011-06-09'),
(53, 5, 'L02006', 6, '4', 'Savings', 'Savings', 1, '2011-06-09'),
(54, 5, 'L02007', 6, '4', 'Savings', 'Savings', 1, '2011-06-09'),
(55, 5, 'L02008', 6, '4', 'Savings', 'Savings', 1, '2011-06-09'),
(56, 0, 'L03004', 7, '7', 'Fixed deposit for All', 'ffd', 1, '2011-06-09'),
(57, 0, 'L04004', 8, '8', 'recurring deposit', 'recurring deposit', 1, '2011-06-09'),
(58, 1, 'A01016', 1, '3', 'Bank1', 'Bank1', 1, '2011-06-10'),
(59, 1, 'A02016', 2, '3', 'Cash1', 'Cash1', 1, '2011-06-10'),
(60, 2, 'A01017', 1, '3', 'Bank2', 'Bank2', 1, '2011-06-10'),
(61, 2, 'A02017', 2, '3', 'Cash2', 'Cash2', 1, '2011-06-10'),
(62, 3, 'A01018', 1, '3', 'Bank3', 'Bank3', 1, '2011-06-10'),
(63, 3, 'A02018', 2, '3', 'Cash3', 'Cash3', 1, '2011-06-10'),
(64, 4, 'A01019', 1, '3', 'Bank4', 'Bank4', 1, '2011-06-10'),
(65, 4, 'A02019', 2, '3', 'Cash4', 'Cash4', 1, '2011-06-10'),
(66, 5, 'A01020', 1, '3', 'Bank5', 'Bank5', 1, '2011-06-10'),
(67, 5, 'A02020', 2, '3', 'Cash5', 'Cash5', 1, '2011-06-10'),
(68, 6, 'A01021', 1, '3', 'Bank6', 'Bank6', 1, '2011-06-10'),
(69, 6, 'A02021', 2, '3', 'Cash6', 'Cash6', 1, '2011-06-10'),
(70, 7, 'A01022', 1, '3', 'Bank7', 'Bank7', 1, '2011-06-10'),
(71, 7, 'A02022', 2, '3', 'Cash7', 'Cash7', 1, '2011-06-10'),
(72, 0, 'L03005', 7, '7', 'Fixed deposit for All', 'Fixed deposit for All', 2, '2011-06-10'),
(73, 0, 'L04005', 8, '8', 'Recurring Savings', 'for Recurring savings', 1, '2011-06-10'),
(74, 0, 'L02009', 6, '6', '', '', 1, '2011-06-10'),
(75, 0, 'L02010', 6, '6', '', '', 1, '2011-06-10'),
(76, 0, 'L02011', 6, '6', 'ps albert', 'ps albert', 1, '2011-06-10'),
(77, 0, 'L02012', 6, '6', 'ps for individual', 'ps for individual', 1, '2011-06-10'),
(78, 0, 'L02013', 6, '6', '454456', 'dfdsfdsf45645456', 1, '2011-06-10'),
(79, 0, 'L03006', 7, '7', 'DEMO FOR FD', 'DEMO FOR FD', 1, '2011-06-10'),
(80, 0, 'L04006', 8, '8', 'demo in rd', 'dmr in ', 1, '2011-06-10'),
(81, 0, 'L02002', 14, '4', '', '', 1, '2011-06-13'),
(82, 2, 'L02003', 14, '4', 'albert', 'dfafsd', 1, '2011-06-13'),
(83, 0, 'L02004', 14, '4', '', '', 1, '2011-06-13'),
(84, 2, 'L02005', 14, '4', 'sample1', 'adfdfas', 1, '2011-06-13');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_grant`
--

INSERT INTO `ourbank_grant` (`id`, `name`, `created_date`, `created_by`) VALUES
(1, 'administrator', '2011-06-07 11:18:44', '1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Both fields combined together for a primary key' AUTO_INCREMENT=48 ;

--
-- Dumping data for table `ourbank_grantactivity`
--

INSERT INTO `ourbank_grantactivity` (`id`, `grant_id`, `module_id`, `add`, `edit`, `view`, `delete`) VALUES
(25, 1, 7, 1, 1, 1, 1),
(26, 1, 8, 1, 1, 1, 1),
(27, 1, 9, 1, 1, 1, 1),
(28, 1, 10, 1, 1, 1, 1),
(29, 1, 11, 1, 1, 1, 1),
(30, 1, 12, 1, 1, 1, 1),
(31, 1, 13, 1, 1, 1, 1),
(32, 1, 14, 1, 1, 1, 1),
(33, 1, 15, 1, 1, 1, 1),
(34, 1, 16, 1, 1, 1, 1),
(35, 1, 30, 1, 1, 1, 1),
(36, 1, 17, 1, 1, 1, 1),
(37, 1, 18, 1, 1, 1, 1),
(38, 1, 31, 1, 1, 1, 1),
(39, 1, 21, 1, 1, 1, 1),
(40, 1, 22, 1, 1, 1, 1),
(41, 1, 23, 1, 1, 1, 1),
(42, 1, 24, 1, 1, 1, 1),
(43, 1, 29, 1, 1, 1, 1),
(44, 1, 1, 1, 1, 1, 1),
(45, 1, 2, 1, 1, 1, 1),
(46, 1, 4, 1, 1, 1, 1),
(47, 1, 6, 1, 1, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Both fields combined together for a primary key' AUTO_INCREMENT=38 ;

--
-- Dumping data for table `ourbank_grantactivity_log`
--

INSERT INTO `ourbank_grantactivity_log` (`record_id`, `id`, `grant_id`, `module_id`, `add`, `edit`, `view`, `delete`) VALUES
(1, 1, 1, 7, 1, 1, 1, 1),
(2, 2, 1, 8, 1, 1, 1, 1),
(3, 3, 1, 9, 1, 1, 1, 1),
(4, 4, 1, 10, 1, 1, 1, 1),
(5, 5, 1, 11, 1, 1, 1, 1),
(6, 6, 1, 12, 1, 1, 1, 1),
(7, 7, 1, 13, 1, 1, 1, 1),
(8, 8, 1, 14, 1, 1, 1, 1),
(9, 9, 1, 15, 1, 1, 1, 1),
(10, 10, 1, 16, 1, 1, 1, 1),
(11, 11, 1, 30, 1, 1, 1, 1),
(12, 12, 1, 17, 1, 1, 1, 1),
(13, 13, 1, 18, 1, 1, 1, 1),
(14, 14, 1, 31, 1, 1, 1, 1),
(15, 15, 1, 21, 1, 1, 1, 1),
(16, 16, 1, 22, 1, 1, 1, 1),
(17, 17, 1, 23, 1, 1, 1, 1),
(18, 18, 1, 24, 1, 1, 1, 1),
(19, 19, 1, 29, 1, 1, 1, 1),
(20, 20, 1, 1, 1, 1, 1, 1),
(21, 21, 1, 2, 1, 1, 1, 1),
(22, 22, 1, 4, 1, 1, 1, 1),
(23, 23, 1, 6, 1, 1, 1, 1),
(24, 24, 1, 0, 1, 1, 1, 1),
(25, 48, 2, 7, 1, 1, 1, 1),
(26, 49, 2, 8, 1, 1, 1, 1),
(27, 50, 2, 9, 1, 1, 1, 1),
(28, 51, 2, 10, 1, 1, 1, 1),
(29, 52, 2, 11, 1, 1, 1, 1),
(30, 53, 2, 12, 1, 1, 1, 1),
(31, 54, 2, 13, 1, 1, 1, 1),
(32, 55, 2, 14, 1, 1, 1, 1),
(33, 56, 2, 15, 1, 1, 1, 1),
(34, 57, 2, 16, 1, 1, 1, 1),
(35, 58, 2, 30, 1, 1, 1, 1),
(36, 59, 2, 1, 1, 1, 1, 1),
(37, 60, 2, 0, 1, 1, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_grant_log`
--

INSERT INTO `ourbank_grant_log` (`record_id`, `id`, `name`, `created_date`, `created_by`) VALUES
(1, 1, 'administrator', '2011-06-07', '1'),
(2, 2, 'Manager', '2011-06-08', '1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_group`
--

INSERT INTO `ourbank_group` (`id`, `village_id`, `bank_id`, `branch_id`, `name`, `head`, `saving_perweek`, `penalty_latecoming`, `penalty_notcoming`, `late_subglcode`, `absent_subglcode`, `place`, `time`, `days`, `rateinterest`, `groupcode`, `latitude`, `longitude`, `group_created_date`, `created_by`, `created_date`) VALUES
(1, 7, 1, 1, 'MANGATTA GROUP', 1, 2000, 20, 10, 19, 20, 'Madurai', '00:01:00', '2', 2, '00703000001', 12.9541937801533, 77.5573046874999, '2011-06-10', 1, '2011-06-07 00:00:00'),
(2, 7, 3, 3, 'Sakthi Group', 5, 2000, 20, 10, 19, 20, 'Chennai', '00:05:00', '2', 2, '00703000002', 12.9970169810901, 77.7330859374999, '2011-06-10', 1, '2011-06-02 00:00:00');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_groupmembers`
--

INSERT INTO `ourbank_groupmembers` (`id`, `group_id`, `member_id`, `groupmember_status`) VALUES
(1, 1, 1, 3),
(2, 2, 5, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_groupmembers_log`
--

INSERT INTO `ourbank_groupmembers_log` (`record_id`, `id`, `group_id`, `member_id`, `groupmember_status`) VALUES
(1, 1, 1, 4, 3),
(2, 2, 1, 8, 3),
(3, 1, 1, 1, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_group_acccounts`
--

INSERT INTO `ourbank_group_acccounts` (`id`, `account_id`, `member_id`, `product_id`, `status`, `created_date`, `created_by`) VALUES
(1, 5, 1, 10, 3, '2011-06-10 00:00:00', 1),
(2, 6, 5, 10, 3, '2011-06-10 00:00:00', 1),
(3, 8, 1, 10, 3, '2011-06-10 00:00:00', 2),
(4, 9, 1, 10, 3, '2011-06-10 00:00:00', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_group_fixedtransaction`
--

INSERT INTO `ourbank_group_fixedtransaction` (`id`, `transaction_id`, `account_id`, `member_id`, `transaction_date`, `transaction_type`, `transaction_amount`, `transaction_interest`, `transaction_by`, `created_date`) VALUES
(1, 1, 5, 1, '2011-06-10', 1, 0.00, 88.00, 1, '2011-06-10 00:00:00'),
(2, 2, 6, 5, '2011-06-10', 1, 0.00, 88.00, 1, '2011-06-10 00:00:00'),
(3, 4, 8, 1, '2011-06-10', 1, 0.00, 84.00, 2, '2011-06-10 00:00:00'),
(4, 5, 9, 1, '2011-06-10', 1, 0.00, 85.00, 2, '2011-06-10 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_group_log`
--

INSERT INTO `ourbank_group_log` (`record_id`, `id`, `village_id`, `bank_id`, `branch_id`, `name`, `head`, `saving_perweek`, `penalty_latecoming`, `penalty_notcoming`, `late_subglcode`, `absent_subglcode`, `place`, `time`, `days`, `rateinterest`, `groupcode`, `latitude`, `longitude`, `group_created_date`, `created_by`, `created_date`) VALUES
(1, 1, 6, 1, 1, 'swathy group', 4, 50, 3, 2, 19, 20, 'Hennur', '10:30:00', '2', 6, '00602000001', 10.717777247331, 76.8761523437499, '2011-06-07', 1, '2011-06-07 00:00:00'),
(2, 1, 5, 2, 2, 'swathy group', 1, 50, 3, 2, 19, 20, 'Hennur', '10:30:00', '2', 3, '00503000001', 12.3968303570215, 76.5026171874999, '2011-06-07', 1, '2011-06-07 00:00:00');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_group_representatives`
--

INSERT INTO `ourbank_group_representatives` (`id`, `group_id`, `representative_id`) VALUES
(1, 1, 1),
(2, 2, 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_group_representatives_log`
--

INSERT INTO `ourbank_group_representatives_log` (`record_id`, `id`, `group_id`, `representative_id`) VALUES
(1, 1, 1, 4),
(2, 2, 1, 8),
(3, 1, 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_healthhabitdetails_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_healthphychallenge_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_holiday_log`
--

INSERT INTO `ourbank_holiday_log` (`record_id`, `id`, `name`, `office_id`, `holiday_from`, `holiday_upto`, `repayment_date`, `created_by`, `created_date`) VALUES
(1, 1, 'christmas', 4, '2011-12-25', '2011-12-27', '2011-12-29', 1, '2011-06-09 18:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Income`
--

CREATE TABLE IF NOT EXISTS `ourbank_Income` (
  `Income_id` int(10) NOT NULL AUTO_INCREMENT,
  `office_id` int(10) NOT NULL,
  `glsubcode_id_from` int(10) NOT NULL,
  `glsubcode_id_to` int(10) NOT NULL,
  `tranasction_id` int(10) NOT NULL,
  `credit` float(10,2) NOT NULL,
  `debit` float(10,2) NOT NULL,
  `recordstatus_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`Income_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_Income`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_incomedetails_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_infrastructure_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `ourbank_insurance`
--

INSERT INTO `ourbank_insurance` (`id`, `family_id`, `insurance_id`) VALUES
(3, 1, 4),
(12, 3, 1),
(13, 1, 2),
(14, 1, 3),
(15, 1, 4),
(18, 3, 1),
(19, 4, 1),
(20, 2, 2),
(21, 2, 3),
(22, 5, 2),
(23, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_interesttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_interesttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_interesttypes`
--

INSERT INTO `ourbank_interesttypes` (`id`, `description`) VALUES
(1, 'Declained capital'),
(2, 'EMI');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=110 ;

--
-- Dumping data for table `ourbank_interest_periods`
--

INSERT INTO `ourbank_interest_periods` (`id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(50, 1, 12, '1-12', 4, 1.00, 3),
(51, 13, 24, '13-24', 4, 1.50, 3),
(52, 24, 36, '24-36', 4, 1.99, 3),
(53, 37, 48, '37-48', 4, 2.00, 3),
(55, 1, 2, '1-2months', 7, 1.00, 3),
(56, 3, 5, '3-5months', 7, 5.00, 3),
(57, 6, 8, '6-8months', 7, 8.00, 3),
(79, 1, 12, '1-12', 3, 1.00, 3),
(80, 13, 24, '13-24', 3, 1.50, 3),
(81, 24, 36, '24-36', 3, 1.99, 3),
(82, 37, 48, '37-48', 3, 2.00, 3),
(83, 1, 5, '1-5', 2, 5.00, 3),
(84, 1, 3, '1-3months', 10, 4.00, 3),
(85, 4, 6, '4-6months', 10, 7.00, 3),
(86, 7, 10, '7-10months', 10, 10.00, 3),
(87, 11, 14, '11-14months', 10, 15.00, 3),
(88, 15, 25, '15-25months', 10, 25.00, 3),
(89, 1, 12, '1-12months', 11, 2.00, 3),
(90, 13, 24, '13-24months', 11, 3.00, 3),
(91, 25, 36, '25-36months', 11, 4.00, 3),
(92, 37, 48, '37-48months', 11, 5.00, 3),
(93, 49, 60, '49-60months', 11, 6.00, 3),
(94, 0, 0, '0months', 12, 0.00, 3),
(95, 0, 0, '0months', 13, 0.00, 3),
(96, 0, 0, '0months', 13, 0.00, 3),
(97, 1, 2, '1-2months', 14, 3.00, 3),
(98, 4, 5, '4-5months', 14, 6.00, 3),
(99, 7, 8, '7-8months', 14, 9.00, 3),
(100, 1, 10, '1-10months', 15, 10.00, 3),
(101, 11, 20, '11-20months', 15, 20.00, 3),
(103, 1, 2, '1-2months', 17, 3.00, 3),
(104, 4, 5, '4-5months', 17, 6.00, 3),
(105, 7, 8, '7-8months', 17, 9.00, 3),
(106, 10, 11, '10-11months', 17, 12.00, 3),
(107, 10, 20, '10-20months', 18, 30.00, 3),
(108, 20, 30, '20-30months', 18, 40.00, 3),
(109, 50, 60, '50-60months', 18, 70.00, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=143 ;

--
-- Dumping data for table `ourbank_interest_periods_log`
--

INSERT INTO `ourbank_interest_periods_log` (`record_id`, `id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(1, 14, 1, 12, '1-12', 7, 1.00, 3),
(2, 15, 13, 24, '13-24', 7, 1.50, 3),
(3, 16, 24, 36, '24-36', 7, 1.99, 3),
(4, 17, 1, 12, '1-12', 7, 1.00, 3),
(5, 18, 13, 24, '13-24', 7, 1.50, 3),
(6, 19, 24, 36, '24-36', 7, 1.99, 3),
(7, 9, 1, 12, '1-12', 6, 2.00, 3),
(8, 10, 13, 24, '13-24', 6, 3.00, 3),
(9, 11, 24, 36, '24-36', 6, 4.00, 3),
(10, 12, 37, 48, '37-48', 6, 5.00, 3),
(11, 13, 49, 50, '49-50', 6, 6.00, 3),
(12, 8, 1, 5, '1-5', 5, 5.00, 3),
(13, 20, 1, 12, '1-12', 7, 1.00, 3),
(14, 21, 13, 24, '13-24', 7, 1.50, 3),
(15, 22, 24, 36, '24-36', 7, 1.99, 3),
(16, 29, 1, 12, '1-12', 7, 1.00, 3),
(17, 30, 13, 24, '13-24', 7, 1.50, 3),
(18, 31, 24, 36, '24-36', 7, 1.99, 3),
(19, 32, 1, 12, '1-12', 7, 1.00, 3),
(20, 33, 13, 24, '13-24', 7, 1.50, 3),
(21, 34, 24, 36, '24-36', 7, 1.99, 3),
(22, 35, 1, 12, '1-12', 7, 1.00, 3),
(23, 36, 13, 24, '13-24', 7, 1.50, 3),
(24, 37, 24, 36, '24-36', 7, 1.99, 3),
(25, 38, 1, 12, '1-12', 7, 1.00, 3),
(26, 39, 13, 24, '13-24', 7, 1.50, 3),
(27, 40, 24, 36, '24-36', 7, 1.99, 3),
(28, 41, 1, 12, '1-12', 7, 1.00, 3),
(29, 42, 13, 24, '13-24', 7, 1.50, 3),
(30, 43, 24, 36, '24-36', 7, 1.99, 3),
(31, 44, 1, 12, '1-12', 7, 1.00, 3),
(32, 45, 13, 24, '13-24', 7, 1.50, 3),
(33, 46, 24, 36, '24-36', 7, 1.99, 3),
(34, 47, 1, 12, '1-12', 7, 1.00, 3),
(35, 48, 13, 24, '13-24', 7, 1.50, 3),
(36, 49, 24, 36, '24-36', 7, 1.99, 3),
(37, 28, 1, 30, '1-30', 5, 5.00, 3),
(38, 50, 1, 12, '1-12', 7, 1.00, 3),
(39, 51, 13, 24, '13-24', 7, 1.50, 3),
(40, 52, 24, 36, '24-36', 7, 1.99, 3),
(41, 54, 1, 12, '1-12', 7, 1.00, 3),
(42, 55, 13, 24, '13-24', 7, 1.50, 3),
(43, 56, 24, 36, '24-36', 7, 1.99, 3),
(44, 57, 1, 12, '1-12', 7, 1.00, 3),
(45, 58, 13, 24, '13-24', 7, 1.50, 3),
(46, 59, 24, 36, '24-36', 7, 1.99, 3),
(47, 60, 1, 12, '1-12', 7, 1.00, 3),
(48, 61, 13, 24, '13-24', 7, 1.50, 3),
(49, 62, 24, 36, '24-36', 7, 1.99, 3),
(50, 2, 1, 5, '1-5', 2, 5.00, 3),
(51, 3, 1, 5, '1-5', 2, 5.00, 3),
(52, 13, 1, 5, '1-5months', 5, 5.00, 3),
(53, 13, 6, 10, '6-10months', 5, 10.00, 3),
(54, 14, 1, 5, '1-5months', 5, 5.00, 3),
(55, 1, 1, 1, '1-1 Months', 1, 1.00, 3),
(56, 19, 1, 1, '1-1months', 1, 1.00, 3),
(57, 20, 1, 3, '1-3months', 1, 2.00, 3),
(58, 21, 1, 2, '1-2months', 6, 5.00, 3),
(59, 22, 3, 6, '3-6months', 6, 7.00, 3),
(60, 9, 1, 12, '1-12', 4, 1.00, 3),
(61, 10, 13, 24, '13-24', 4, 1.50, 3),
(62, 11, 24, 36, '24-36', 4, 1.99, 3),
(63, 12, 37, 48, '37-48', 4, 2.00, 3),
(64, 4, 1, 5, '1-5', 2, 5.00, 3),
(65, 31, 1, 5, '1-5', 2, 5.00, 3),
(66, 32, 1, 5, '1-5', 2, 5.00, 3),
(67, 33, 1, 5, '1-5', 2, 5.00, 3),
(68, 16, 6, 10, '6-10months', 5, 10.00, 3),
(69, 17, 1, 5, '1-5months', 5, 5.00, 3),
(70, 18, 1, 4, '1-4months', 5, 3.00, 3),
(71, 23, 1, 5, '1-5months', 1, 1.00, 3),
(72, 24, 6, 10, '6-10months', 1, 2.00, 3),
(73, 38, 1, 5, '1-5months', 1, 1.00, 3),
(74, 39, 6, 10, '6-10months', 1, 2.00, 3),
(75, 40, 1, 5, '1-5months', 1, 1.00, 3),
(76, 41, 6, 10, '6-10months', 1, 2.00, 3),
(77, 42, 1, 3, '1-3months', 1, 4.00, 3),
(78, 27, 1, 12, '1-12', 4, 1.00, 3),
(79, 28, 13, 24, '13-24', 4, 1.50, 3),
(80, 29, 24, 36, '24-36', 4, 1.99, 3),
(81, 30, 37, 48, '37-48', 4, 2.00, 3),
(82, 46, 1, 12, '1-12', 4, 1.00, 3),
(83, 47, 13, 24, '13-24', 4, 1.50, 3),
(84, 48, 24, 36, '24-36', 4, 1.99, 3),
(85, 49, 37, 48, '37-48', 4, 2.00, 3),
(86, 54, 1, 1, '1-1 Months', 7, 1.00, 3),
(87, 58, 1, 3, '1-3months', 8, 5.00, 3),
(88, 59, 4, 8, '4-8months', 8, 8.00, 3),
(89, 60, 1, 3, '1-3months', 8, 5.00, 3),
(90, 61, 4, 8, '4-8months', 8, 8.00, 3),
(91, 62, 5, 10, '5-10months', 8, 10.00, 3),
(92, 67, 1, 3, '1-3months', 9, 5.00, 3),
(93, 68, 4, 6, '4-6months', 9, 6.00, 3),
(94, 69, 1, 3, '1-3months', 9, 5.00, 3),
(95, 70, 4, 6, '4-6months', 9, 6.00, 3),
(96, 71, 7, 10, '7-10months', 9, 8.00, 3),
(97, 69, 1, 3, '1-3months', 9, 5.00, 3),
(98, 70, 4, 6, '4-6months', 9, 6.00, 3),
(99, 71, 7, 10, '7-10months', 9, 8.00, 3),
(100, 34, 1, 5, '1-5', 2, 5.00, 3),
(101, 69, 1, 3, '1-3months', 9, 5.00, 3),
(102, 70, 4, 6, '4-6months', 9, 6.00, 3),
(103, 71, 7, 10, '7-10months', 9, 8.00, 3),
(104, 72, 1, 5, '1-5', 2, 5.00, 3),
(105, 69, 1, 3, '1-3months', 9, 5.00, 3),
(106, 70, 4, 6, '4-6months', 9, 6.00, 3),
(107, 71, 7, 10, '7-10months', 9, 8.00, 3),
(108, 0, 1, 3, '1-3months', 9, 5.00, 3),
(109, 66, 11, 15, '11-15months', 9, 15.00, 3),
(110, 70, 4, 6, '4-6months', 9, 6.00, 3),
(111, 71, 7, 10, '7-10months', 9, 8.00, 3),
(112, 66, 11, 15, '11-15months', 9, 15.00, 3),
(113, 70, 4, 6, '4-6months', 9, 6.00, 3),
(114, 71, 7, 10, '7-10months', 9, 8.00, 3),
(115, 70, 4, 6, '4-6months', 9, 6.00, 3),
(116, 71, 7, 10, '7-10months', 9, 8.00, 3),
(117, 71, 7, 10, '7-10months', 9, 8.00, 3),
(118, 71, 1, 3, '1-3months', 9, 5.00, 3),
(119, 74, 4, 6, '4-6months', 9, 9.00, 3),
(120, 75, 7, 9, '7-9months', 9, 10.00, 3),
(121, 63, 1, 3, '1-3months', 8, 5.00, 3),
(122, 64, 4, 8, '4-8months', 8, 8.00, 3),
(123, 65, 5, 10, '5-10months', 8, 10.00, 3),
(124, 5, 1, 12, '1-12', 3, 1.00, 3),
(125, 6, 13, 24, '13-24', 3, 1.50, 3),
(126, 7, 24, 36, '24-36', 3, 1.99, 3),
(127, 8, 37, 48, '37-48', 3, 2.00, 3),
(128, 73, 1, 5, '1-5', 2, 5.00, 3),
(129, 84, 1, 3, '1-3months', 10, 4.00, 3),
(130, 85, 4, 6, '4-6months', 10, 7.00, 3),
(131, 84, 1, 3, '1-3months', 10, 4.00, 3),
(132, 85, 4, 6, '4-6months', 10, 7.00, 3),
(133, 86, 7, 10, '7-10months', 10, 10.00, 3),
(134, 84, 1, 3, '1-3months', 10, 4.00, 3),
(135, 85, 4, 6, '4-6months', 10, 7.00, 3),
(136, 86, 7, 10, '7-10months', 10, 10.00, 3),
(137, 87, 11, 14, '11-14months', 10, 15.00, 3),
(138, 84, 1, 3, '1-3months', 10, 4.00, 3),
(139, 85, 4, 6, '4-6months', 10, 7.00, 3),
(140, 86, 7, 10, '7-10months', 10, 10.00, 3),
(141, 87, 11, 14, '11-14months', 10, 15.00, 3),
(142, 88, 15, 25, '15-25months', 10, 25.00, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_Liabilities`
--

INSERT INTO `ourbank_Liabilities` (`Liabilities_id`, `office_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_id`, `credit`, `debit`, `record_status`) VALUES
(1, 7, 0, 72, 1, 2000.00, 0.00, 3),
(2, 7, 0, 72, 2, 3000.00, 0.00, 3),
(3, 7, 0, 72, 3, 350.00, 0.00, 3),
(4, 7, 0, 72, 4, 3000.00, 0.00, 3),
(5, 7, 0, 72, 5, 400.00, 0.00, 3),
(6, 7, 0, 73, 55, 10000.00, 0.00, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_liveassetdetails`
--

INSERT INTO `ourbank_liveassetdetails` (`id`, `submodule_id`, `family_id`, `liveasset_id`, `number`, `value`, `date_of_value`, `created_by`, `created_date`) VALUES
(1, 17, 1, 2, '4', '4', '2011-06-06', 0, '2011-06-07 09:24:09');

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

--
-- Dumping data for table `ourbank_liveassetdetails_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_loanaccounts`
--

INSERT INTO `ourbank_loanaccounts` (`id`, `account_id`, `loanofficer_id`, `funder_id`, `loansanctioned_date`, `loanbegin_date`, `loanclose_date`, `loan_amount`, `loan_installments`, `loan_interest`, `interesttype_id`, `savingsaccount_id`, `securityaccount_id`, `tieup_flag`, `created_by`, `created_date`) VALUES
(1, 13, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 65000.00, 50, 13, 1, NULL, NULL, 0, 1, '2011-06-07 12:46:22'),
(2, 14, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 50000.00, 30, 16, 1, NULL, NULL, 0, 1, '2011-06-07 12:49:51'),
(3, 3, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 20000.00, 5, 4, 1, NULL, NULL, 0, 1, '2011-06-07 15:07:10'),
(4, 2, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 65000.00, 47, 8, 1, NULL, NULL, 0, 1, '2011-06-07 15:51:23'),
(5, 2, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 65000.00, 48, 8, 1, NULL, NULL, 0, 1, '2011-06-07 15:56:02'),
(6, 3, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 24000.00, 5, 4, 1, NULL, NULL, 0, 1, '2011-06-07 15:59:40'),
(7, 6, 0, 0, '2011-06-07', '0000-00-00', '0000-00-00', 112000.00, 48, 12, 1, NULL, NULL, 0, 1, '2011-06-07 17:13:14');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loanprocess`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loan_disbursement`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_master_accountype`
--

INSERT INTO `ourbank_master_accountype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'No Frills', 'ನೊ ಫ್ರಿಲ್ಸ್', 1, '2011-05-25 16:52:50'),
(2, 'Post office', 'ಪೋಸ್ಟ್ ಆಫಿಸ್', 1, '2011-05-25 16:52:50'),
(3, 'Savings', 'ಉಳಿತಾಯ', 1, '2011-05-25 16:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_bank`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_bank` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `accounttype_id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_bank`
--

INSERT INTO `ourbank_master_bank` (`id`, `accounttype_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 'State Bank of India', 'ಸ್ಟೇಟ್ ಬ್ಯಾಂಕ್ ಆಫ್ ಇಂಡಿಯಾ', 1, '0000-00-00 00:00:00'),
(2, 1, 'State Bank of Mysore', 'ಸ್ಟೇಟ್ ಬ್ಯಾಂಕ್ ಆಫ್ Mysore', 1, '0000-00-00 00:00:00'),
(3, 1, 'Central Bank', 'central Bank', 1, '0000-00-00 00:00:00'),
(4, 3, 'IDF, Financial Services Pvt.Lt', 'IDF', 1, '0000-00-00 00:00:00'),
(5, 1, 'None', 'None', 1, '0000-00-00 00:00:00'),
(6, 2, 'General Post Office', 'General Post Office - local', 1, '2011-05-24 16:29:20'),
(7, 3, 'SHG - Samaja', 'SHG - Samaja Local', 1, '2011-05-24 16:30:58'),
(8, 2, 'None', 'none', 1, '2011-05-24 16:33:42'),
(9, 3, 'None', 'None', 1, '2011-05-24 16:33:47');

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
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_master_branch`
--

INSERT INTO `ourbank_master_branch` (`id`, `bank_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 1, 'Hebbal', 'H - ಶಾಖೆ', 1, '0000-00-00 00:00:00'),
(2, 2, 'Sriram Nagar', 'S - ಶಾಖೆ', 1, '0000-00-00 00:00:00'),
(3, 3, 'Vidhya Nagar', 'V - ಶಾಖೆ', 1, '0000-00-00 00:00:00'),
(4, 1, 'Ramamurthy Nagar', 'R - ಶಾಖೆ', 1, '0000-00-00 00:00:00'),
(5, 2, 'Majestic', 'M - ಶಾಖೆ', 1, '0000-00-00 00:00:00'),
(6, 5, 'None', 'None', 1, '0000-00-00 00:00:00'),
(7, 6, 'Frazer town', '', 4, '0000-00-00 00:00:00'),
(8, 6, 'None', '', 4, '0000-00-00 00:00:00'),
(9, 8, 'None', '', 4, '0000-00-00 00:00:00'),
(10, 4, 'veeranapalya', '', 4, '0000-00-00 00:00:00'),
(11, 7, 'Yelanka', '', 4, '0000-00-00 00:00:00'),
(12, 8, 'None', '', 4, '0000-00-00 00:00:00'),
(13, 9, 'None', '', 4, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_businesstype`
--

INSERT INTO `ourbank_master_businesstype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Self-employed', '', 1, '2011-05-25 13:34:24'),
(2, 'Salaried - Regular', '', 1, '2011-05-25 13:34:24'),
(3, 'Salaried - Contract/Seasonal', '', 1, '2011-05-25 13:34:24'),
(4, 'Daily Wage', '', 1, '2011-05-25 13:34:24'),
(5, 'Others', '', 1, '2011-05-25 13:34:24');

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
(1, 'SC', '', 1, '2011-05-25 13:35:24'),
(2, 'ST', '', 1, '2011-05-25 13:35:24'),
(3, 'OBC', '', 1, '2011-05-25 13:35:24'),
(4, 'Others', '', 1, '2011-05-25 13:35:24');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cbopromoter`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cbopromoter` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name_regional` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_cbopromoter`
--

INSERT INTO `ourbank_master_cbopromoter` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'None', '', 1, '0000-00-00 00:00:00'),
(2, 'Myrada', '', 1, '0000-00-00 00:00:00'),
(3, 'Dhan', '', 1, '0000-00-00 00:00:00'),
(4, 'IDF', 'ಯಾವುದೂ ಇಲ್ಲ', 1, '0000-00-00 00:00:00'),
(5, 'Anganwadi', 'ಅಂಗನವಾಡಿ', 1, '0000-00-00 00:00:00'),
(6, 'Others', 'ಇತರೆ', 1, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_cbos`
--

INSERT INTO `ourbank_master_cbos` (`id`, `cbopromoter_id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 4, 'SHG', 'ಎಸ್ ಹೆಚ್ ಜಿ', 1, '0000-00-00 00:00:00'),
(2, 5, 'Stree Shakti', 'ಸ್ತ್ರೀ ಶಕ್ತಿ ', 1, '0000-00-00 00:00:00'),
(3, 4, 'JLG', 'ಜೆ ಎಲ್ ಜಿ', 1, '0000-00-00 00:00:00'),
(4, 6, 'Others', 'ಇತರೆ', 1, '0000-00-00 00:00:00'),
(5, 6, 'None', 'ಯಾವುದೂ ಇಲ್ಲ', 1, '0000-00-00 00:00:00'),
(6, 5, 'anganwadi jlg', 'anganwadi jlg', 1, '0000-00-00 00:00:00'),
(7, 2, 'Myrade SHG', 'Myrade SHG Local', 1, '0000-00-00 00:00:00'),
(8, 3, 'Myrade SHG', 'Myrade JLG Local', 1, '0000-00-00 00:00:00'),
(9, 1, 'None', 'ಯಾವುದೂ ಇಲ್ಲ', 1, '0000-00-00 00:00:00');

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
(1, 'Wood', '', 1, '2011-05-25 13:37:20'),
(2, 'Cow Dung', '', 1, '2011-05-25 13:37:20'),
(3, 'Kerosene', '', 1, '2011-05-25 13:37:20'),
(4, 'Biogas', '', 1, '2011-05-25 13:37:20'),
(5, 'Electricity', '', 1, '2011-05-25 13:37:20'),
(6, 'LPG', '', 1, '2011-05-25 13:37:20');

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
(1, 'India', '', 'IND', 'Indian Rupee', 'Rs', 'Rupee', 'asia', '1', 1, '2011-05-25 13:40:22'),
(2, 'America', '', 'USA', 'US Dollar', '$', 'USD', '', '', 1, '2011-05-25 13:40:22'),
(3, 'Russia', '', 'USR', 'Rouble', 'RUB', 'RUB', '', '', 1, '2011-05-25 13:40:22'),
(4, 'Japan', '', 'JAP', 'YEN', '¥', 'JPY', '', '', 1, '2011-05-25 13:40:22'),
(5, 'South Africa', '', 'SA', 'ZAR', 'ZAR', 'ZAR', '', '', 1, '2011-05-25 13:40:22'),
(6, 'United Kingdom', '', 'UK', 'Punds', '₤', 'GBP', '', '', 1, '2011-05-25 13:40:22'),
(7, 'Brazil', '', 'BRZ', 'BRL', 'R$', 'Real', '', '', 1, '2011-05-25 13:40:22'),
(8, 'France', '', 'FRN', 'EURO', '€', 'euro', '', '', 1, '2011-05-25 13:40:22'),
(9, 'Germany', '', 'GRM', 'Deutsche Mark', 'DM', 'DM', '', '', 1, '2011-05-25 13:40:22'),
(10, 'Qatar', '', 'QAT', 'Qatari Rial', 'Rial', 'Rial', '', '', 1, '2011-05-25 13:40:22');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

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
(16, 'Others', 'ಇತರೆ', 5, 1, '2011-05-26 13:44:03');

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
  `currencysymbol` varchar(5) DEFAULT NULL,
  `currencyshortname` varchar(5) DEFAULT NULL,
  `country_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_currency`
--

INSERT INTO `ourbank_master_currency` (`id`, `name`, `currencysymbol`, `currencyshortname`, `country_id`) VALUES
(1, 'Indian Rupee', 'Rs', 'INR', 1),
(2, 'US Dollar', '$', 'USD', 0),
(3, 'YEN', 'Ye', 'YEN', 0),
(4, 'Britain Pounds', 'L', 'P', 0),
(5, 'United Arab Emirates dirhams', 'D', 'UAE D', 0),
(6, 'Euro', 'EU', 'EUR', 0),
(7, 'Australian Dollar', '$', 'AU D', 0),
(8, 'Oman Riyals', 'R', 'ORY', 0);

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
(1, 'Administration', '', 1, '2011-05-25 14:34:22'),
(2, 'Accounts', '', 1, '2011-05-25 14:34:22'),
(3, 'Field staff', '', 1, '2011-05-25 14:34:22'),
(4, 'Loan department', '', 1, '2011-05-25 14:34:22');

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
(1, 'Manager', '', 1, 1, '2011-05-25 14:35:32'),
(2, 'Clerk', '', 2, 1, '2011-05-25 14:35:32'),
(3, 'Field officer', '', 3, 1, '2011-05-25 14:35:32'),
(4, 'Loan officer', '', 4, 1, '2011-05-25 14:35:32'),
(5, 'Block officer', '', 4, 1, '2011-05-25 14:35:32');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_districtlist`
--

INSERT INTO `ourbank_master_districtlist` (`id`, `name`, `name_regional`, `state_id`, `created_by`, `Created_date`) VALUES
(1, 'Bangalore', '', 1, 0, '0000-00-00 00:00:00'),
(2, 'Mysoor', '', 1, 0, '0000-00-00 00:00:00');

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
(1, 'Illiterate', '', 1, '2011-05-25 14:39:11'),
(2, 'Literate (Without Educational ', '', 1, '2011-05-25 14:39:11'),
(3, 'Matriculation/SSLC', '', 1, '2011-05-25 14:39:11'),
(4, 'Pre- University', '', 1, '2011-05-25 14:39:11'),
(5, 'ITI/Certificate', '', 1, '2011-05-25 14:39:11'),
(6, 'Diploma in Engineering', '', 1, '2011-05-25 14:39:11'),
(7, 'Graduate', '', 1, '2011-05-25 14:39:11'),
(8, 'Post Graduate', '', 1, '2011-05-25 14:39:11'),
(9, 'Others', '', 1, '2011-05-25 14:39:11'),
(10, 'Primary', '', 1, '2011-05-25 14:39:11'),
(11, 'Middle', '', 1, '2011-05-25 14:39:11'),
(12, 'High', '', 1, '2011-05-25 14:39:11');

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
(1, 'Self-Employed', '', 1, '2011-05-25 14:40:18'),
(2, 'Employed', '', 1, '2011-05-25 14:40:18'),
(3, 'Housewife/within house worker', '', 1, '2011-05-25 14:40:18'),
(4, 'Unemployed', '', 1, '2011-05-25 14:40:18'),
(5, 'Student', '', 1, '2011-05-25 14:40:18'),
(6, 'Student out of school/discontinued', '', 1, '2011-05-25 14:40:18'),
(7, 'Retired', '', 1, '2011-05-25 14:40:18'),
(8, 'Disabled', '', 1, '2011-05-25 14:40:18'),
(9, 'Employed-Govt sector-salaried', '', 1, '2011-05-25 14:40:18'),
(10, 'Employed-Govt sector-daily wage', '', 1, '2011-05-25 14:40:18'),
(11, 'Employed-Private sector-salaried', '', 1, '2011-05-25 14:40:18'),
(12, 'Employed-Private sector-temporary', '', 1, '2011-05-25 14:40:18'),
(13, 'Daily wage worker', '', 1, '2011-05-25 14:40:18'),
(14, 'Idle/unable', '', 1, '2011-05-25 14:40:18');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_entitlements`
--

INSERT INTO `ourbank_master_entitlements` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Old Age pension', '', 1, '2011-05-25 14:41:28'),
(2, 'Widow pension', '', 1, '2011-05-25 14:41:28'),
(3, 'Physically handicapped pension', '', 1, '2011-05-25 14:41:28'),
(4, 'Others', '', 1, '2011-05-25 14:41:28'),
(6, 'Physically handicapped @ 400', '', 1, '2011-05-25 14:41:28'),
(7, 'Physically handicapped @ 1000', '', 1, '2011-05-25 14:41:28');

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
(1, 'Rabi agricultural expenses', '', 1, '2011-05-30 12:58:31'),
(2, 'Kharif agricultural expenses', '', 1, '2011-05-30 12:58:31'),
(3, 'Summer agricultural expenses', '', 1, '2011-05-30 12:58:31'),
(4, 'Perrinial crops expenses', '', 1, '2011-05-30 12:58:31'),
(5, 'Expenses of the animal husband', '', 1, '2011-05-30 12:58:31'),
(6, 'Expenses of the Grossary', '', 1, '2011-05-30 12:58:31'),
(7, 'Expenses of the vegetables', '', 1, '2011-05-30 12:58:31'),
(8, 'Expenses of the transport', '', 1, '2011-05-30 12:58:31'),
(9, 'Interst on loans', '', 1, '2011-05-30 12:58:31'),
(10, 'Educational expenses', '', 1, '2011-05-30 12:58:31'),
(11, 'Medical expenses', '', 1, '2011-05-30 12:58:31'),
(12, 'Fuel', '', 1, '2011-05-30 12:58:31'),
(13, 'Festivals', '', 1, '2011-05-30 12:58:31'),
(14, 'Clothes', '', 1, '2011-05-30 12:58:31'),
(15, 'Habbits', '', 1, '2011-05-30 12:58:31'),
(16, 'Phone/mobile', '', 1, '2011-05-30 12:58:31'),
(17, 'others', 'ಇತರೆ', 1, '2011-05-30 12:58:31');

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
(1, 'Nuclear/Small Family', '', 1, '2011-05-24 14:11:13'),
(2, 'Joint Family', '', 1, '2011-05-24 14:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_frequencypayment`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_frequencypayment` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_frequencypayment`
--

INSERT INTO `ourbank_master_frequencypayment` (`id`, `name`, `value`) VALUES
(1, 'One time', 1),
(2, 'Daily', 1),
(3, 'Weekly', 7),
(4, 'Monthly', 30),
(5, 'Quarterly', 90),
(6, 'Half Yearly', 180),
(7, 'Yearly', 365),
(8, 'Any time', 0);

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
(1, 'Male', '', 1, '2011-05-25 15:27:36'),
(2, 'Female', '', 1, '2011-05-25 15:27:36');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_gillapanchayath`
--

INSERT INTO `ourbank_master_gillapanchayath` (`id`, `name`, `name_regional`, `hobli_id`, `created_by`, `Created_date`) VALUES
(1, 'Rajaji nager', '', 1, 0, '2011-06-10 10:36:50'),
(2, 'Yalahanka', '', 2, 0, '2011-06-10 10:37:08'),
(3, 'Nalamangala', '', 3, 0, '2011-06-10 10:37:31'),
(4, 'Banargatta', '', 4, 0, '2011-06-10 10:40:25');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_habit`
--

INSERT INTO `ourbank_master_habit` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(2, 'Drinking', '', 1, '2011-05-25 15:30:37'),
(3, 'Tobacco', '', 1, '2011-05-25 15:30:37'),
(4, 'others', '', 1, '2011-05-25 15:30:37'),
(5, 'Smoking', '', 1, '2011-05-25 15:30:37');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_habitation`
--

INSERT INTO `ourbank_master_habitation` (`id`, `name`, `name_regional`, `village_id`, `created_by`, `created_date`) VALUES
(1, 'habit.krishnavillage', '', 4, 1, '0000-00-00 00:00:00'),
(2, 'habit.rajpuram', '', 5, 1, '0000-00-00 00:00:00'),
(3, 'habit.trichy', '', 6, 1, '0000-00-00 00:00:00'),
(4, 'habit.salem', '', 7, 1, '0000-00-00 00:00:00'),
(5, 'Test', 'ಕರಕರಕರ', 4, 1, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_hoblilist`
--

INSERT INTO `ourbank_master_hoblilist` (`id`, `name`, `name_regional`, `taluk_id`, `created_by`, `created_date`) VALUES
(1, 'Majestic', '', 1, 0, '0000-00-00 00:00:00'),
(2, 'Hebbal', '', 2, 0, '0000-00-00 00:00:00'),
(3, 'Srirangapattinam', '', 3, 0, '0000-00-00 00:00:00'),
(4, 'Amruthur', '', 4, 0, '0000-00-00 00:00:00');

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
(1, 'Hut', '', 1, '2011-05-25 15:34:12'),
(2, 'Sheet', '', 1, '2011-05-25 15:34:12'),
(3, 'Tiled', '', 1, '2011-05-25 15:34:12'),
(4, 'RCC', '', 1, '2011-05-25 15:34:12'),
(5, 'Others', '', 1, '2011-05-25 15:34:12');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_income`
--

INSERT INTO `ourbank_master_income` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Rabi agricultural income', '', 1, '2011-05-30 13:14:52'),
(2, 'Kharif agricultural income', '', 1, '2011-05-30 13:14:52'),
(3, 'Summer agricultural income', '', 1, '2011-05-30 13:14:52'),
(4, 'Perrinial crops income', '', 1, '2011-05-30 13:14:52'),
(5, 'Diary/goat/sheep/poultry income', '', 1, '2011-05-30 13:14:52'),
(6, 'Wages', '', 1, '2011-05-30 13:14:52'),
(7, 'Sub callings', '', 1, '2011-05-30 13:14:52'),
(8, 'Employment', '', 1, '2011-05-30 13:14:53'),
(9, 'Others', '', 1, '2011-05-30 13:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_instalstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_instalstatus` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_instalstatus`
--

INSERT INTO `ourbank_master_instalstatus` (`id`, `name`) VALUES
(1, 'Open'),
(2, 'Paid'),
(3, 'Due'),
(4, 'Next due'),
(5, 'Over due'),
(6, 'Hold'),
(7, 'Closed'),
(8, 'Partial');

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
(1, 'None', '', 1, '2011-02-16 18:34:48'),
(2, 'Yeshaswini', '', 1, '2011-03-16 15:44:08'),
(3, 'Arogyashree', '', 1, '2011-03-16 15:44:08'),
(4, 'RSBY', '', 1, '2011-03-16 15:44:08'),
(5, 'Private', '', 1, '2011-03-16 15:44:08');

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
(1, 'PM', '', 1, '2011-05-25 16:49:06'),
(2, 'PA', '', 1, '2011-05-25 16:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_interesttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_interesttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_interesttypes`
--

INSERT INTO `ourbank_master_interesttypes` (`id`, `description`) VALUES
(2, 'Declining capital');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_kootas`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_kootas` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ourbank_master_kootas`
--

INSERT INTO `ourbank_master_kootas` (`id`, `name`, `group_id`, `created_by`, `created_date`) VALUES
(1, 'Bilidevalaya', 0, 0, '0000-00-00 00:00:00'),
(2, 'Alappanagudde', 0, 0, '0000-00-00 00:00:00'),
(3, 'Ammanahatti', 0, 0, '0000-00-00 00:00:00'),
(4, 'Boralinganapalya', 0, 0, '0000-00-00 00:00:00'),
(5, 'Choudarypalya', 0, 0, '0000-00-00 00:00:00'),
(6, 'Doddamadure', 0, 0, '0000-00-00 00:00:00'),
(7, 'Gowdagere', 0, 0, '0000-00-00 00:00:00'),
(8, 'Hadonahalli', 0, 0, '0000-00-00 00:00:00'),
(9, 'Holalagunda ', 0, 0, '0000-00-00 00:00:00'),
(10, 'Hosahalli', 0, 0, '0000-00-00 00:00:00'),
(11, 'Jaladigere', 0, 0, '0000-00-00 00:00:00'),
(12, 'Kaggere', 0, 0, '0000-00-00 00:00:00'),
(13, 'Kannaguni', 0, 0, '0000-00-00 00:00:00'),
(14, 'Kattigehalli', 0, 0, '0000-00-00 00:00:00'),
(15, 'Kittaghatta', 0, 0, '0000-00-00 00:00:00'),
(16, 'Kodagihalli', 0, 0, '0000-00-00 00:00:00'),
(17, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(18, 'Siddapura ', 0, 0, '0000-00-00 00:00:00'),
(19, 'Sondekoppa', 0, 0, '0000-00-00 00:00:00'),
(20, 'Timmegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(21, 'Tubinakere', 0, 0, '0000-00-00 00:00:00'),
(22, 'Urkehalli', 0, 0, '0000-00-00 00:00:00'),
(23, 'Yadiyur', 0, 0, '0000-00-00 00:00:00'),
(24, '', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_kvs`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_kvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `koota_id` int(11) NOT NULL,
  `koota` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `village` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `shg` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=402 ;

--
-- Dumping data for table `ourbank_master_kvs`
--

INSERT INTO `ourbank_master_kvs` (`id`, `koota_id`, `koota`, `village`, `shg`, `created_by`, `created_date`) VALUES
(1, 0, '', 'Amruthur', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(2, 0, '', 'Amruthur', 'Shri Veerabhadreshwar', 0, '0000-00-00 00:00:00'),
(3, 0, '', 'Amruthur', 'Shri Anjaneya', 0, '0000-00-00 00:00:00'),
(4, 0, '', 'Amruthur', 'Shri Kalabhairaveshwara', 0, '0000-00-00 00:00:00'),
(5, 0, '', 'Amruthur', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(6, 0, '', 'Amruthur', 'Lalitha ', 0, '0000-00-00 00:00:00'),
(7, 0, '', 'Amruthur', 'Umamaheshwari', 0, '0000-00-00 00:00:00'),
(8, 0, '', 'Amruthur', 'Shri Annapurneshwari', 0, '0000-00-00 00:00:00'),
(9, 0, '', 'Amruthur', 'Jaimaruti', 0, '0000-00-00 00:00:00'),
(10, 0, '', 'Amruthur', 'Veerabhadreswara', 0, '0000-00-00 00:00:00'),
(11, 0, '', 'Amruthur', 'Maruti JLG', 0, '0000-00-00 00:00:00'),
(12, 0, '', 'Amruthur', 'Lakshmivenkateswara JLG', 0, '0000-00-00 00:00:00'),
(13, 0, '', 'Amruthur', 'Ambabhavani', 0, '0000-00-00 00:00:00'),
(14, 0, '', 'Amruthur', 'Bairaveswara', 0, '0000-00-00 00:00:00'),
(15, 0, '', 'Amruthur', 'Vigneswara', 0, '0000-00-00 00:00:00'),
(16, 0, '', 'Renukanagara', 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(17, 0, '', 'kuvempunagar', 'Chalapati', 0, '0000-00-00 00:00:00'),
(18, 0, '', 'Indiranagara', 'Kalikamba', 0, '0000-00-00 00:00:00'),
(19, 0, '', 'Indiranagara', 'Sri Jagadeshwari', 0, '0000-00-00 00:00:00'),
(20, 0, '', 'Yachanahalli', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(21, 0, '', 'Shanuboganahalli', 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(22, 0, '', 'Shanuboganahalli', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(23, 1, 'Bilidevalaya', 'Bilidevalaya', 'Jai Karnataka ', 0, '0000-00-00 00:00:00'),
(24, 1, 'Bilidevalaya', 'Bilidevalaya', 'Ondematharam', 0, '0000-00-00 00:00:00'),
(25, 1, 'Bilidevalaya', 'Bilidevalaya', 'Kenkeramma', 0, '0000-00-00 00:00:00'),
(26, 1, 'Bilidevalaya', 'Bilidevalaya', 'Nurani', 0, '0000-00-00 00:00:00'),
(27, 1, 'Bilidevalaya', 'Bilidevalaya', 'Suryodaya', 0, '0000-00-00 00:00:00'),
(28, 1, 'Bilidevalaya', 'Bilidevalaya', 'Ambedkar', 0, '0000-00-00 00:00:00'),
(29, 1, 'Bilidevalaya', 'Bilidevalaya', 'Surya', 0, '0000-00-00 00:00:00'),
(30, 1, 'Bilidevalaya', 'Bilidevalaya', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(31, 1, 'Bilidevalaya', 'Bilidevalaya', 'Pakija', 0, '0000-00-00 00:00:00'),
(32, 1, 'Bilidevalaya', 'Bilidevalaya', 'Subhash', 0, '0000-00-00 00:00:00'),
(33, 1, 'Bilidevalaya', 'Bilidevalaya', 'Shri Sharada', 0, '0000-00-00 00:00:00'),
(34, 1, 'Bilidevalaya', 'Bilidevalaya', 'Gagana', 0, '0000-00-00 00:00:00'),
(35, 1, 'Bilidevalaya', 'Bilidevalaya', 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(36, 1, 'Bilidevalaya', 'Bilidevalaya', 'Varalaxmi', 0, '0000-00-00 00:00:00'),
(37, 1, 'Bilidevalaya', 'Bilidevalaya', 'Bismilla', 0, '0000-00-00 00:00:00'),
(38, 1, 'Bilidevalaya', 'Bilidevalaya', 'yarub', 0, '0000-00-00 00:00:00'),
(39, 1, 'Bilidevalaya', 'Bilidevalaya', 'Yallamma', 0, '0000-00-00 00:00:00'),
(40, 2, 'Boralinganapalya', 'Boralinganapalya', 'Bismilla', 0, '0000-00-00 00:00:00'),
(41, 2, 'Boralinganapalya', 'Boralinganapalya', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(42, 2, 'Boralinganapalya', 'Boralinganapalya', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(43, 2, 'Boralinganapalya', 'Boralinganapalya', 'Shri Mulakattamma', 0, '0000-00-00 00:00:00'),
(44, 2, 'Boralinganapalya', 'Boralinganapalya', 'Neralamma', 0, '0000-00-00 00:00:00'),
(45, 2, 'Boralinganapalya', 'Boralinganapalya', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(46, 2, 'Boralinganapalya', 'Boralinganapalya', 'Jai Hanuman', 0, '0000-00-00 00:00:00'),
(47, 2, 'Boralinganapalya', 'Boralinganapalya', 'Shri Raghavendra', 0, '0000-00-00 00:00:00'),
(48, 2, 'Boralinganapalya', 'Boralinganapalya', 'Ilahi', 0, '0000-00-00 00:00:00'),
(49, 2, 'Boralinganapalya', 'Boralinganapalya', 'Sri Ranganatha', 0, '0000-00-00 00:00:00'),
(50, 2, 'Boralinganapalya', 'Boralinganapalya', 'Adhishakthi', 0, '0000-00-00 00:00:00'),
(51, 2, 'Boralinganapalya', 'Boralinganapalya', 'Sri Jaibhuvaneshwari', 0, '0000-00-00 00:00:00'),
(52, 2, 'Boralinganapalya', 'Boralinganapalya', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(53, 2, 'Boralinganapalya', 'Boralinganapalya', 'Balaji', 0, '0000-00-00 00:00:00'),
(54, 2, 'Boralinganapalya', 'Boralinganapalya', 'Gagana', 0, '0000-00-00 00:00:00'),
(55, 3, 'Choudarypalya', 'Choudarypalya', 'Shri Manjunatha', 0, '0000-00-00 00:00:00'),
(56, 3, 'Choudarypalya', 'Choudarypalya', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(57, 3, 'Choudarypalya', 'Choudarypalya', 'Sri Ranga', 0, '0000-00-00 00:00:00'),
(58, 4, 'Muttugadahalli', 'Muttugadahalli', 'Shri Vighneshwara', 0, '0000-00-00 00:00:00'),
(59, 4, 'Muttugadahalli', 'Muttugadahalli', 'Thirumala', 0, '0000-00-00 00:00:00'),
(60, 5, 'Urkehalli', 'Urkehalli', 'Sri Ranganatha', 0, '0000-00-00 00:00:00'),
(61, 5, 'Urkehalli', 'Urkehalli', 'Sri Laxmiranganathaswami', 0, '0000-00-00 00:00:00'),
(62, 5, 'Urkehalli', 'Chottanahalli ', 'Maruthi', 0, '0000-00-00 00:00:00'),
(63, 5, 'Urkehalli', 'Chottanahalli ', 'Shri Lakshmi', 0, '0000-00-00 00:00:00'),
(64, 0, '', 'Jinnaagara', 'Sri Doddammadevi', 0, '0000-00-00 00:00:00'),
(65, 0, '', 'Jinnaagara', 'Sri Vinayaka ', 0, '0000-00-00 00:00:00'),
(66, 0, '', 'Jinnaagara', 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(67, 0, '', 'Jinnaagara', 'Akashaya', 0, '0000-00-00 00:00:00'),
(68, 0, '', 'Jinnaagara', 'Bagatsingh', 0, '0000-00-00 00:00:00'),
(69, 0, '', 'Jinnaagara', 'Sri Chaluvarayaswamy', 0, '0000-00-00 00:00:00'),
(70, 0, '', 'Jinnaagara', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(71, 0, '', 'Jinnaagara', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(72, 0, '', 'Jinnaagara', 'Guliraya', 0, '0000-00-00 00:00:00'),
(73, 0, '', 'Jinnaagara', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(74, 0, '', 'Jinnaagara', 'Shri Bhoomithayi', 0, '0000-00-00 00:00:00'),
(75, 0, '', 'Jinnaagara', 'Sri Boredevaru', 0, '0000-00-00 00:00:00'),
(76, 0, '', 'Jinnaagara', 'Vivekananda', 0, '0000-00-00 00:00:00'),
(77, 0, '', 'Sanaba', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(78, 0, '', 'Sanaba', 'Sri Gaddehuchamma', 0, '0000-00-00 00:00:00'),
(79, 0, '', 'Sanaba', 'Sri Huttadamayamma', 0, '0000-00-00 00:00:00'),
(80, 0, '', 'Sanaba', 'Sri Cheluvarayaswamy', 0, '0000-00-00 00:00:00'),
(81, 0, '', 'Sanaba', 'Gangaparameshwari', 0, '0000-00-00 00:00:00'),
(82, 0, '', 'Sanaba', 'Sri Channakeshva', 0, '0000-00-00 00:00:00'),
(83, 0, '', 'Sanaba', 'Shri Varadevi', 0, '0000-00-00 00:00:00'),
(84, 0, '', 'Sanaba', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(85, 0, '', 'Sanaba', 'Shri Laxmammadevi', 0, '0000-00-00 00:00:00'),
(86, 0, '', 'Sanaba', 'Shri Chamundeshwari', 0, '0000-00-00 00:00:00'),
(87, 0, '', 'Hosakere', 'Sri Kalabairaveshwara', 0, '0000-00-00 00:00:00'),
(88, 0, '', 'Hosakere', 'Sri Gangadhareshwara', 0, '0000-00-00 00:00:00'),
(89, 0, '', 'Hosakere', 'Sri Honnereluhuchamma', 0, '0000-00-00 00:00:00'),
(90, 0, '', 'Hosakere', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(91, 0, '', 'Hosakere', 'Sri Sharadambe', 0, '0000-00-00 00:00:00'),
(92, 0, '', 'Hosakere', 'Sri Boredevara', 0, '0000-00-00 00:00:00'),
(93, 0, '', 'Kuppe', 'Sri Kadagalingeshwara', 0, '0000-00-00 00:00:00'),
(94, 0, '', 'Kuppe', 'Kempegowda', 0, '0000-00-00 00:00:00'),
(95, 0, '', 'Kuppe', 'Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(96, 0, '', 'Belligere', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(97, 0, '', 'Handalagere', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(98, 6, 'Kaggere', 'Kaggere', 'Dandinamma', 0, '0000-00-00 00:00:00'),
(99, 6, 'Kaggere', 'Kaggere', 'Dandinamma adhti', 0, '0000-00-00 00:00:00'),
(100, 6, 'Kaggere', 'Kaggere', 'Suryodaya', 0, '0000-00-00 00:00:00'),
(101, 6, 'Kaggere', 'Kaggere', 'Shri Narashimhaswamy JLG', 0, '0000-00-00 00:00:00'),
(102, 6, 'Kaggere', 'Kaggere', 'Pragathi JLG', 0, '0000-00-00 00:00:00'),
(103, 6, 'Kaggere', 'Kaggere', 'Shri Laksmi JLG', 0, '0000-00-00 00:00:00'),
(104, 6, 'Kaggere', 'Kaggere', 'Navodaya', 0, '0000-00-00 00:00:00'),
(105, 6, 'Kaggere', 'Venkategowdanapalya', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(106, 6, 'Kaggere', 'Venkategowdanapalya', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(107, 7, 'Timmegowdanapalya', 'Timmegowdanapalya', 'Padmavathi', 0, '0000-00-00 00:00:00'),
(108, 7, 'Timmegowdanapalya', 'Timmegowdanapalya', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(109, 7, 'Timmegowdanapalya', 'Timmegowdanapalya', 'Vigneshwara', 0, '0000-00-00 00:00:00'),
(110, 7, 'Timmegowdanapalya', 'Timmegowdanapalya', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(111, 8, 'Gowdagere', 'Gowdagere', 'Chaluvarayaswamy', 0, '0000-00-00 00:00:00'),
(112, 9, 'Kattigehalli', 'Kattigehalli', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(113, 9, 'Kattigehalli', 'Dombarahatti', 'Shri Kollapuradamma', 0, '0000-00-00 00:00:00'),
(114, 9, 'Kattigehalli', 'Giriyappanapalya', 'Shri Kollapuradamma', 0, '0000-00-00 00:00:00'),
(115, 9, 'Kattigehalli', 'Rangegoudanapalya', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(116, 0, '', 'KH halli', 'Gangadhareshwara', 0, '0000-00-00 00:00:00'),
(117, 0, '', 'KH halli', 'Sri Rama', 0, '0000-00-00 00:00:00'),
(118, 0, '', 'KH halli', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(119, 0, '', 'KH halli', 'Sri Beemrao', 0, '0000-00-00 00:00:00'),
(120, 0, '', 'KH halli', 'Sri Channakeshava', 0, '0000-00-00 00:00:00'),
(121, 0, '', 'KH halli', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(122, 0, '', 'KH halli', 'Sri Kalabairaveshwara JLG', 0, '0000-00-00 00:00:00'),
(123, 0, '', 'KH halli', 'Sri Kalabairaveshwara', 0, '0000-00-00 00:00:00'),
(124, 0, '', 'KH halli', 'Shri Kodilakkamma', 0, '0000-00-00 00:00:00'),
(125, 0, '', 'Korati', 'Basaveshwara', 0, '0000-00-00 00:00:00'),
(126, 0, '', 'Puttanapalya', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(127, 0, '', 'Puttanapalya', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(128, 0, '', 'Puttanapalya', 'Veeranjaneya', 0, '0000-00-00 00:00:00'),
(129, 0, '', 'Puttanapalya', 'Kalabhairaveshwara', 0, '0000-00-00 00:00:00'),
(130, 0, '', 'Gajjanapalya', 'Shri Laxminarasimhaswami', 0, '0000-00-00 00:00:00'),
(131, 0, '', 'Gajjanapalya', 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(132, 0, '', 'Halagere', 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(133, 0, '', 'Halagere', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(134, 0, '', 'Halagere', 'Laxmi Venkateshwara', 0, '0000-00-00 00:00:00'),
(135, 0, '', 'Halagere', 'Kempegouda', 0, '0000-00-00 00:00:00'),
(136, 0, '', 'Halagere', 'Huyyalamma', 0, '0000-00-00 00:00:00'),
(137, 0, '', 'Halagere', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(138, 0, '', 'Halagere', 'Ankanatheshwara', 0, '0000-00-00 00:00:00'),
(139, 0, '', 'Sanabagatta', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(140, 0, '', 'Sanabagatta', 'Gomathe', 0, '0000-00-00 00:00:00'),
(141, 0, '', 'Sanabagatta', 'Huliyuramma', 0, '0000-00-00 00:00:00'),
(142, 0, '', 'Sanabagatta', 'Jai Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(143, 0, '', 'Sanabagatta', 'Bhumathe', 0, '0000-00-00 00:00:00'),
(144, 0, '', 'Bydagere', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(145, 0, '', 'Bydagere', 'Kalikhamba', 0, '0000-00-00 00:00:00'),
(146, 0, '', 'Bydagere', 'Srinivasa', 0, '0000-00-00 00:00:00'),
(147, 0, '', 'Bydagere', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(148, 10, 'Kodagihalli', 'Mallapura', 'Shri Bandhamma', 0, '0000-00-00 00:00:00'),
(149, 11, 'Tubinakere', 'Devarayanapalya', 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(150, 11, 'Tubinakere', 'Tubinakere', 'Sri Annapurneshwari', 0, '0000-00-00 00:00:00'),
(151, 11, 'Tubinakere', 'Tubinakere', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(152, 11, 'Tubinakere', 'Tubinakere', 'Sri Jai Maruthi', 0, '0000-00-00 00:00:00'),
(153, 11, 'Tubinakere', 'Tubinakere', 'Shri Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(154, 11, 'Tubinakere', 'Tubinakere', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(155, 11, 'Tubinakere', 'Tubinakere', 'Sri Mahadeshwara', 0, '0000-00-00 00:00:00'),
(156, 11, 'Tubinakere', 'Tubinakere', 'Sri Sharadamba', 0, '0000-00-00 00:00:00'),
(157, 12, 'Sondekoppa', 'Sondekoppa', 'Sri Chiranjeevi', 0, '0000-00-00 00:00:00'),
(158, 12, 'Sondekoppa', 'Sondekoppa', 'Sri Jaimaruthi', 0, '0000-00-00 00:00:00'),
(159, 12, 'Sondekoppa', 'Sondekoppa', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(160, 13, 'Hosahalli', 'Hosahalli', 'Shri Adishakti', 0, '0000-00-00 00:00:00'),
(161, 14, 'Holalagunda ', 'Holalagunda ', 'Shri Siddhalingeshwara', 0, '0000-00-00 00:00:00'),
(162, 14, 'Holalagunda ', 'Holalagunda ', 'Sri Umamaheshwari', 0, '0000-00-00 00:00:00'),
(163, 14, 'Holalagunda ', 'Holalagunda ', 'Sri Bhagyalakshmi', 0, '0000-00-00 00:00:00'),
(164, 14, 'Holalagunda ', 'Holalagunda ', 'Sri Nandhini', 0, '0000-00-00 00:00:00'),
(165, 14, 'Holalagunda ', 'Holalagunda ', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(166, 14, 'Holalagunda ', 'Holalagunda ', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(167, 14, 'Holalagunda ', 'Madihalli', 'Shri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(168, 14, 'Holalagunda ', 'Madihalli', 'Shri Basaveshwara ', 0, '0000-00-00 00:00:00'),
(169, 14, 'Holalagunda ', 'Bidarakattepalya ', 'Shri Pattaladamma ', 0, '0000-00-00 00:00:00'),
(170, 0, '', 'Thippur', 'Shri Bettada Thimmappaswami', 0, '0000-00-00 00:00:00'),
(171, 0, '', 'Koppa', 'Shri Anjaneyaswami', 0, '0000-00-00 00:00:00'),
(172, 0, '', 'Gollarahatti', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(173, 0, '', 'Hulivana', 'Sri Bumithayi', 0, '0000-00-00 00:00:00'),
(174, 0, '', 'Hulivana', 'Sri Devi', 0, '0000-00-00 00:00:00'),
(175, 0, '', 'Hulivana', 'Sri Bhumithayi', 0, '0000-00-00 00:00:00'),
(176, 0, '', 'Hulivana', 'Bhoodevi', 0, '0000-00-00 00:00:00'),
(177, 0, '', 'Kantanahalli', 'Shri Bhuredevaru', 0, '0000-00-00 00:00:00'),
(178, 0, '', 'Markonahalli', 'Sri Timmarayaswamy', 0, '0000-00-00 00:00:00'),
(179, 0, '', 'Markonahalli', 'Subaschandrabos', 0, '0000-00-00 00:00:00'),
(180, 0, '', 'Markonahalli', 'Sir.M Vishweshwaraiah', 0, '0000-00-00 00:00:00'),
(181, 0, '', 'Markonahalli', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(182, 0, '', 'Markonahalli', 'Sri Mayammadevi', 0, '0000-00-00 00:00:00'),
(183, 0, '', 'Markonahalli', 'MPA', 0, '0000-00-00 00:00:00'),
(184, 0, '', 'Markonahalli', 'Sri Siddeshwara', 0, '0000-00-00 00:00:00'),
(185, 0, '', 'Markonahalli', 'Bargavi', 0, '0000-00-00 00:00:00'),
(186, 0, '', 'Markonahalli', 'Sri Srinivasa', 0, '0000-00-00 00:00:00'),
(187, 0, '', 'Markonahalli', 'Ambedkar', 0, '0000-00-00 00:00:00'),
(188, 0, '', 'Markonahalli', 'Spoorthi', 0, '0000-00-00 00:00:00'),
(189, 0, '', 'Markonahalli', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(190, 0, '', 'Tippuru', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(191, 0, '', 'Tippuru', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(192, 0, '', 'Tippuru', 'Anjaneya', 0, '0000-00-00 00:00:00'),
(193, 0, '', 'Mantya', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(194, 0, '', 'Mantya', 'Sri Lakshidevi', 0, '0000-00-00 00:00:00'),
(195, 0, '', 'Mantya', 'Sri Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(196, 0, '', 'Mantya', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(197, 0, '', 'Mantya', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(198, 0, '', 'Mantya', 'Sri Balaji', 0, '0000-00-00 00:00:00'),
(199, 0, '', 'Mantya', 'Channakeshava', 0, '0000-00-00 00:00:00'),
(200, 0, '', 'Mantya', 'Shri Adishakti', 0, '0000-00-00 00:00:00'),
(201, 0, '', 'Kiranguru', 'Jaimaruthi', 0, '0000-00-00 00:00:00'),
(202, 0, '', 'Hanumapura', 'Ambedkar', 0, '0000-00-00 00:00:00'),
(203, 0, '', 'Kiranguru', 'Saraswati', 0, '0000-00-00 00:00:00'),
(204, 0, '', 'Kiranguru', 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(205, 0, '', 'Bisinele', 'Sitapathi', 0, '0000-00-00 00:00:00'),
(206, 0, '', 'Bisinele', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(207, 0, '', 'Kadashettihalli', 'Shri Channakeshava', 0, '0000-00-00 00:00:00'),
(208, 15, 'Alappanagudde', 'Alappanagudde', 'Jafar Sadhif', 0, '0000-00-00 00:00:00'),
(209, 15, 'Alappanagudde', 'Alappanagudde', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(210, 15, 'Alappanagudde', 'Alappanagudde', 'Gangotri', 0, '0000-00-00 00:00:00'),
(211, 16, 'Kannaguni', 'Kalasegowdanapalya', 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(212, 16, 'Kannaguni', 'Kannaguni', 'Shri Ranganatha', 0, '0000-00-00 00:00:00'),
(213, 16, 'Kannaguni', 'Kannaguni', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(214, 16, 'Kannaguni', 'Kannaguni', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(215, 16, 'Kannaguni', 'Nagegowdanapalya', 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(216, 16, 'Kannaguni', 'Kodipalya', 'Mujameel', 0, '0000-00-00 00:00:00'),
(217, 16, 'Kannaguni', 'Kodipalya', 'Sulthana', 0, '0000-00-00 00:00:00'),
(218, 16, 'Kannaguni', 'Kodipalya', 'Shaphiya', 0, '0000-00-00 00:00:00'),
(219, 16, 'Kannaguni', 'Kodipalya', 'Shri  Vinayaka', 0, '0000-00-00 00:00:00'),
(220, 16, 'Kannaguni', 'Kodipalya', 'Shri Mahalaxmi', 0, '0000-00-00 00:00:00'),
(221, 16, 'Kannaguni', 'Megalaplya', 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(222, 16, 'Kannaguni', 'Nagegowdanapalya', 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(223, 16, 'Kannaguni', 'Hadonahalli', 'Sri muttinammadevi', 0, '0000-00-00 00:00:00'),
(224, 16, 'Kannaguni', 'Hadonahalli', 'Sri Ranganathaswamy JLG', 0, '0000-00-00 00:00:00'),
(225, 16, 'Kannaguni', 'Hadonahalli', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(226, 17, 'Siddapura ', 'Nagegowdanapalya', 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(227, 17, 'Siddapura ', 'Nagegowdanapalya', 'Chamundeshwari', 0, '0000-00-00 00:00:00'),
(228, 17, 'Siddapura ', 'Siddapura ', 'Tippu', 0, '0000-00-00 00:00:00'),
(229, 17, 'Siddapura ', 'Siddapura ', 'Jai Bharat', 0, '0000-00-00 00:00:00'),
(230, 17, 'Siddapura ', 'Siddapura ', 'Indian', 0, '0000-00-00 00:00:00'),
(231, 18, 'Hadonahalli', 'Hadonahalli', 'Sri Timmarayaswamy', 0, '0000-00-00 00:00:00'),
(232, 18, 'Hadonahalli', 'Hadonahalli', 'Sri muttinammadevi', 0, '0000-00-00 00:00:00'),
(233, 18, 'Hadonahalli', 'Hadonahalli', 'Sri Ranganathaswamy JLG', 0, '0000-00-00 00:00:00'),
(234, 18, 'Hadonahalli', 'Hadonahalli', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(235, 0, '', 'Nagasandra', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(236, 0, '', 'Nagasandra', 'Sri Anjaneya', 0, '0000-00-00 00:00:00'),
(237, 0, '', 'Nagasandra', 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(238, 0, '', 'Nagasandra', 'Sri Hattimaramma', 0, '0000-00-00 00:00:00'),
(239, 0, '', 'Nagasandra', 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(240, 0, '', 'Nagasandra', 'Sri Varalakshmi', 0, '0000-00-00 00:00:00'),
(241, 0, '', 'Nagasandra', 'Sri Lakshmiranganathaswamy', 0, '0000-00-00 00:00:00'),
(242, 0, '', 'Nagasandra', 'Sri Kannikaparameshwari', 0, '0000-00-00 00:00:00'),
(243, 0, '', 'Nagasandra', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(244, 0, '', 'Nagasandra', 'Shri Bhairaveshwara', 0, '0000-00-00 00:00:00'),
(245, 0, '', 'Nagasandra', 'Sowmya Shree', 0, '0000-00-00 00:00:00'),
(246, 0, '', 'Nagasandra', 'Sri Kannadambe', 0, '0000-00-00 00:00:00'),
(247, 0, '', 'Devarakanasandra', 'Shri Chaluvarayaswami', 0, '0000-00-00 00:00:00'),
(248, 0, '', 'Kanchagalapura', 'Sri Malleshwaraswamy', 0, '0000-00-00 00:00:00'),
(249, 0, '', 'Shettibidu', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(250, 0, '', 'Shettibidu', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(251, 0, '', 'Shettibidu', 'Pranathi', 0, '0000-00-00 00:00:00'),
(252, 0, '', 'Hosuru', 'Sri Vijayalakshmi', 0, '0000-00-00 00:00:00'),
(253, 0, '', 'Hosuru', 'Sri Gramadevathe', 0, '0000-00-00 00:00:00'),
(254, 0, '', 'Jivajihatti', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(255, 0, '', 'Helavarahatti', 'Savyasachi', 0, '0000-00-00 00:00:00'),
(256, 0, '', 'Helavarahatti', 'Shri Renukamba', 0, '0000-00-00 00:00:00'),
(257, 0, '', 'Helavarahatti', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(258, 0, '', 'Tenginamaradapalya', 'Shri Kempammadevi', 0, '0000-00-00 00:00:00'),
(259, 0, '', 'Jiddigere', 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(260, 0, '', 'Jiddigere', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(261, 0, '', 'Jiddigere', 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(262, 0, '', 'Jiddigere', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(263, 0, '', 'Jiddigere', 'Shri Kempammadevi', 0, '0000-00-00 00:00:00'),
(264, 0, '', 'Jiddigere', 'Sri Timmappaswamy', 0, '0000-00-00 00:00:00'),
(265, 0, '', 'Megala Tenginmaradapalya', 'Shri Venkateshwar', 0, '0000-00-00 00:00:00'),
(266, 0, '', 'Megala Tenginmaradapalya', 'Shri Marammadevi', 0, '0000-00-00 00:00:00'),
(267, 0, '', 'Megala Tenginmaradapalya', 'Shri Nidhi', 0, '0000-00-00 00:00:00'),
(268, 0, '', 'Heddigere', 'Sri Huchammadevi', 0, '0000-00-00 00:00:00'),
(269, 0, '', 'Heddigere', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(270, 0, '', 'Turuganuru', 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(271, 0, '', 'Turuganuru', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(272, 0, '', 'Turuganuru', 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(273, 0, '', 'Turuganuru', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(274, 0, '', 'Turuganuru', 'Sri Bettadaranganathaswamy', 0, '0000-00-00 00:00:00'),
(275, 0, '', 'Kottegere', 'Shri Siddhalingeshwara', 0, '0000-00-00 00:00:00'),
(276, 0, '', 'Kottegere', 'Shri Veereshwara ', 0, '0000-00-00 00:00:00'),
(277, 0, '', 'Paduvagere', 'Sri Kollapurasamma', 0, '0000-00-00 00:00:00'),
(278, 0, '', 'Paduvagere', 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(279, 0, '', 'Paduvagere', 'Sri Lakshminarasimhaswamy', 0, '0000-00-00 00:00:00'),
(280, 0, '', 'Paduvagere', 'Sri Hattimaramma', 0, '0000-00-00 00:00:00'),
(281, 0, '', 'Paduvagere', 'Sri  Rama', 0, '0000-00-00 00:00:00'),
(282, 0, '', 'Paduvagere', 'Sri Vinaaka', 0, '0000-00-00 00:00:00'),
(283, 0, '', 'Paduvagere', 'Sri Chowdamma', 0, '0000-00-00 00:00:00'),
(284, 0, '', 'Paduvagere', 'Sri Channakeshva', 0, '0000-00-00 00:00:00'),
(285, 0, '', 'Paduvagere', 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(286, 0, '', 'Paduvagere', 'Laxmidevi', 0, '0000-00-00 00:00:00'),
(287, 0, '', 'Paduvagere', 'Sri Doddamma', 0, '0000-00-00 00:00:00'),
(288, 0, '', 'Chikka Arjunahalli', 'Huchhammadevi', 0, '0000-00-00 00:00:00'),
(289, 0, '', 'Bettahalli', 'Shri Laxmi-Venkateshwara', 0, '0000-00-00 00:00:00'),
(290, 0, '', 'Doddakallahalli', 'Sri Ganapathi', 0, '0000-00-00 00:00:00'),
(291, 0, '', 'Doddakallahalli', 'Chikkamma', 0, '0000-00-00 00:00:00'),
(292, 0, '', 'Doddakallahalli', 'Dr.B R ambedkar', 0, '0000-00-00 00:00:00'),
(293, 0, '', 'Doddakallahalli', 'Shri Durgeshwari', 0, '0000-00-00 00:00:00'),
(294, 0, '', 'Doddakallahalli', 'Shri Shrinivasaswami', 0, '0000-00-00 00:00:00'),
(295, 0, '', 'Doddakallahalli', 'Shri Anjaneyaswami', 0, '0000-00-00 00:00:00'),
(296, 0, '', 'Doddakallahalli', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(297, 0, '', 'Doddakallahalli', 'Parvathi', 0, '0000-00-00 00:00:00'),
(298, 0, '', 'Doddakallahalli', 'Sri Siddalingeshwara', 0, '0000-00-00 00:00:00'),
(299, 0, '', 'Doddakallahalli', 'Sharade', 0, '0000-00-00 00:00:00'),
(300, 0, '', 'Valagerepura', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(301, 0, '', 'Valagerepura', 'Sri Basaweshwara', 0, '0000-00-00 00:00:00'),
(302, 0, '', 'Valagerepura', 'Sri Anthashayana', 0, '0000-00-00 00:00:00'),
(303, 0, '', 'Valagerepura', 'Sri Tirupathivenkateshwaraswamy', 0, '0000-00-00 00:00:00'),
(304, 0, '', 'Valagerepura', 'Sri  Laxmidevi  ', 0, '0000-00-00 00:00:00'),
(305, 0, '', 'Valagerepura', 'Sri Manjunatha', 0, '0000-00-00 00:00:00'),
(306, 0, '', 'Valagerepura', 'Sri siddalingeshwara', 0, '0000-00-00 00:00:00'),
(307, 0, '', 'Valagerepura', 'Sri Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(308, 0, '', 'Valagerepura', 'Sri Aravinamaramma', 0, '0000-00-00 00:00:00'),
(309, 0, '', 'Valagerepura', 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(310, 0, '', 'Valagerepura', 'Madheshwara', 0, '0000-00-00 00:00:00'),
(311, 0, '', 'Valagerepura', 'Mulakattamma', 0, '0000-00-00 00:00:00'),
(312, 0, '', 'Valagerepura', 'Shri Bhairaveshwarswami', 0, '0000-00-00 00:00:00'),
(313, 0, '', 'Valagerepura', 'Shri Laxminarasimhaswami', 0, '0000-00-00 00:00:00'),
(314, 0, '', 'Valagerepura', 'Sharadambe', 0, '0000-00-00 00:00:00'),
(315, 0, '', 'Valagerepura', 'Hanumantharaya', 0, '0000-00-00 00:00:00'),
(316, 0, '', 'Valagerepura', 'Sri Aravinamaramma', 0, '0000-00-00 00:00:00'),
(317, 0, '', 'Janatha Coloni', 'Bhagyalakshmi', 0, '0000-00-00 00:00:00'),
(318, 0, '', 'Benavara', 'Dr.B R ambedkar', 0, '0000-00-00 00:00:00'),
(319, 0, '', 'Benavara', 'Channakeshava', 0, '0000-00-00 00:00:00'),
(320, 0, '', 'Benavara', 'Aravinamaramma', 0, '0000-00-00 00:00:00'),
(321, 0, '', 'Benavara', 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(322, 0, '', 'Bettahalli', 'Hanumantharaya', 0, '0000-00-00 00:00:00'),
(323, 0, '', 'Yadavani', 'Sri Kalikhamba', 0, '0000-00-00 00:00:00'),
(324, 0, '', 'Yadavani', 'Eshwara', 0, '0000-00-00 00:00:00'),
(325, 0, '', 'Yadavani', 'Sri Vinayaka ', 0, '0000-00-00 00:00:00'),
(326, 0, '', 'Yadavani', 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(327, 0, '', 'Yadavani', 'Sri Kuvempu', 0, '0000-00-00 00:00:00'),
(328, 0, '', 'Yadavani', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(329, 0, '', 'Yadavani', 'Aramba', 0, '0000-00-00 00:00:00'),
(330, 0, '', 'Yadavani', 'Bhumithayi', 0, '0000-00-00 00:00:00'),
(331, 0, '', 'Yadavani', 'Masthamma', 0, '0000-00-00 00:00:00'),
(332, 0, '', 'Yadavani', 'Basaveshwara', 0, '0000-00-00 00:00:00'),
(333, 0, '', 'Yadavani', 'Manchamma', 0, '0000-00-00 00:00:00'),
(334, 0, '', 'Yadavani', 'Kalamma', 0, '0000-00-00 00:00:00'),
(335, 0, '', 'Yadavani', 'Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(336, 0, '', 'Yadavani', 'Sinchana', 0, '0000-00-00 00:00:00'),
(337, 0, '', 'Yadavani', 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(338, 0, '', 'Yadavani', 'Huchhamma', 0, '0000-00-00 00:00:00'),
(339, 0, '', 'Yadavani', 'Adarsha ', 0, '0000-00-00 00:00:00'),
(340, 0, '', 'Kagganahalli', 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(341, 0, '', 'Kagganahalli', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(342, 0, '', 'Hanchipura', 'Da.ra Bendre', 0, '0000-00-00 00:00:00'),
(343, 0, '', 'Hanchipura', 'Annapurneshwari', 0, '0000-00-00 00:00:00'),
(344, 0, '', 'Hanchipura', 'Sri Vaibhavalakshmi', 0, '0000-00-00 00:00:00'),
(345, 0, '', 'Hanchipura', 'Triveni Sangama', 0, '0000-00-00 00:00:00'),
(346, 0, '', 'Hanchipura', 'Bettadatimmappa', 0, '0000-00-00 00:00:00'),
(347, 0, '', 'Chandanahalli', 'Mailaralingeshwara', 0, '0000-00-00 00:00:00'),
(348, 0, '', 'Ungara', 'Madeshwara', 0, '0000-00-00 00:00:00'),
(349, 0, '', 'Ungara', 'Varadaraja', 0, '0000-00-00 00:00:00'),
(350, 0, '', 'Ungara', 'Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(351, 0, '', 'Ungara', 'Vinayaka', 0, '0000-00-00 00:00:00'),
(352, 0, '', 'Ungara', 'Tapaswiraya', 0, '0000-00-00 00:00:00'),
(353, 0, '', 'Ungara', 'Sapthagiri', 0, '0000-00-00 00:00:00'),
(354, 0, '', 'Ungara', 'Shri Muttinamma', 0, '0000-00-00 00:00:00'),
(355, 0, '', 'Pallerayanahalli', 'Sri Varadappa', 0, '0000-00-00 00:00:00'),
(356, 0, '', 'Pallerayanahalli', 'Chunchanagiriyappa', 0, '0000-00-00 00:00:00'),
(357, 0, '', 'Pallerayanahalli', 'Sri Manchamma', 0, '0000-00-00 00:00:00'),
(358, 0, '', 'Pallerayanahalli', 'Kalabhairava', 0, '0000-00-00 00:00:00'),
(359, 0, '', 'Pallerayanahalli', 'Maramma', 0, '0000-00-00 00:00:00'),
(360, 0, '', 'Ammanahatti', 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(361, 19, 'Yadiyur', 'Yadiyur', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(362, 19, 'Yadiyur', 'Yadiyur', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(363, 19, 'Yadiyur', 'Yadiyur', 'Parvathi', 0, '0000-00-00 00:00:00'),
(364, 19, 'Yadiyur', 'Beeraganahalli', 'Maheshwari', 0, '0000-00-00 00:00:00'),
(365, 19, 'Yadiyur', 'Beeraganahalli', 'Sri Vigneshwara', 0, '0000-00-00 00:00:00'),
(366, 19, 'Yadiyur', 'Beeraganahalli', 'Shri Vishweshwara', 0, '0000-00-00 00:00:00'),
(367, 19, 'Yadiyur', 'Beeraganahalli', 'Bhargavi', 0, '0000-00-00 00:00:00'),
(368, 19, 'Yadiyur', 'Beeraganahalli', 'Shri Maheshwari', 0, '0000-00-00 00:00:00'),
(369, 19, 'Yadiyur', 'Beeraganahalli', 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(370, 20, 'Kittaghatta', 'Hosuru', 'Sri Siddalingeshwara', 0, '0000-00-00 00:00:00'),
(371, 20, 'Kittaghatta', 'Shattihalli', 'Shri Manchammadevii', 0, '0000-00-00 00:00:00'),
(372, 20, 'Kittaghatta', 'Hosuru', 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(373, 20, 'Kittaghatta', 'Y.Hampapura', 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(374, 20, 'Kittaghatta', 'Y.Hampapura', 'Shri Mariyamma ', 0, '0000-00-00 00:00:00'),
(375, 20, 'Kittaghatta', 'Kittaghatta', 'Shri Bhairaveshwara', 0, '0000-00-00 00:00:00'),
(376, 21, 'Jaladigere', 'Jaladigere', 'Shri  Jaladigereyamma', 0, '0000-00-00 00:00:00'),
(377, 21, 'Jaladigere', 'Jaladigere', 'Shri Chikkamma', 0, '0000-00-00 00:00:00'),
(378, 21, 'Jaladigere', 'Jaladigere', 'Shri Adishakthi', 0, '0000-00-00 00:00:00'),
(379, 21, 'Jaladigere', 'Jaladigere', 'Shri Sharada', 0, '0000-00-00 00:00:00'),
(380, 21, 'Jaladigere', 'Jaladigere', 'Doddamma', 0, '0000-00-00 00:00:00'),
(381, 21, 'Jaladigere', 'Jaladigere', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(382, 21, 'Jaladigere', 'Jaladigere', 'Shri Byatarayaswami', 0, '0000-00-00 00:00:00'),
(383, 21, 'Jaladigere', 'Jaladigere', 'Shri Laxmi Venkateshwara', 0, '0000-00-00 00:00:00'),
(384, 22, 'Doddamadure', 'Doddamadure', 'Sri Huchammadevi', 0, '0000-00-00 00:00:00'),
(385, 22, 'Doddamadure', 'Doddamadure', 'Sri Mulukattammadevi', 0, '0000-00-00 00:00:00'),
(386, 22, 'Doddamadure', 'Doddamadure', 'Sri Channakeshvaswamy', 0, '0000-00-00 00:00:00'),
(387, 22, 'Doddamadure', 'Doddamadure', 'Sri Hattilakkamma', 0, '0000-00-00 00:00:00'),
(388, 22, 'Doddamadure', 'Doddamadure', 'Sri Kempegowda', 0, '0000-00-00 00:00:00'),
(389, 22, 'Doddamadure', 'Doddamadure', 'Sri Mallikarjunaswamy', 0, '0000-00-00 00:00:00'),
(390, 22, 'Doddamadure', 'Doddamadure', 'Sri Hebbagilubairava', 0, '0000-00-00 00:00:00'),
(391, 22, 'Doddamadure', 'Doddamadure', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(392, 22, 'Doddamadure', 'Madurepalya', 'Shri Vishwanatha', 0, '0000-00-00 00:00:00'),
(393, 22, 'Doddamadure', 'Madurepalya', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(394, 22, 'Doddamadure', 'Doddamadure', 'Shri Saraswatidevi', 0, '0000-00-00 00:00:00'),
(395, 22, 'Doddamadure', 'Doddamadure', 'Kamadhenu', 0, '0000-00-00 00:00:00'),
(396, 23, 'Ammanahatti', 'H.B.Shettihalli', 'Shri Beereshwar', 0, '0000-00-00 00:00:00'),
(397, 23, 'Ammanahatti', 'Thathayyanapalya', 'Venkateshwara', 0, '0000-00-00 00:00:00'),
(398, 23, 'Ammanahatti', 'Ammanahatti', 'Sri Saraswathidevi', 0, '0000-00-00 00:00:00'),
(399, 23, 'Ammanahatti', 'Singatihalli', 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(400, 23, 'Ammanahatti', 'Kodipalya', 'Shri Thirumala', 0, '0000-00-00 00:00:00'),
(401, 23, 'Ammanahatti', 'Kodipalya', 'Shridevi', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_landacquisition`
--

INSERT INTO `ourbank_master_landacquisition` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Ancesteral', '', 1, '2011-05-25 15:38:46'),
(2, 'Self-earned', '', 1, '2011-05-25 15:38:46'),
(3, 'Loans', '', 1, '2011-05-25 15:38:46'),
(4, 'Grant ', '', 1, '2011-05-25 15:38:46'),
(5, 'Gift', '', 1, '2011-05-25 15:38:46'),
(6, 'Others', '', 1, '2011-05-25 15:38:46');

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
(1, 'Dry', '', 1, '2011-05-25 15:39:44'),
(2, 'Wet', '', 1, '2011-05-25 15:39:44'),
(3, 'Garden Land', '', 1, '2011-05-25 15:39:44'),
(4, 'Uncultivated', '', 1, '2011-05-25 15:39:44');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_liveassets`
--

INSERT INTO `ourbank_master_liveassets` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Cross breed cows', '', 1, '2011-05-25 15:41:42'),
(2, 'Local cows', '', 1, '2011-05-25 15:41:42'),
(3, 'Buffaloes', '', 1, '2011-05-25 15:41:42'),
(4, 'Bullocks', '', 1, '2011-05-25 15:41:42'),
(5, 'Sheep', '', 1, '2011-05-25 15:41:42'),
(6, 'Poultry', '', 1, '2011-05-25 15:41:42'),
(7, 'Pigs', '', 1, '2011-05-25 15:41:42'),
(8, 'Goats', '', 1, '2011-05-25 15:41:42'),
(9, 'Others', '', 1, '2011-05-25 15:41:42');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_loanpurpose`
--

INSERT INTO `ourbank_master_loanpurpose` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Personal', '', 1, '2011-05-25 15:42:44'),
(2, 'Repaying high cost debt', '', 1, '2011-05-25 15:42:44'),
(3, 'Family (education/marriage etc)', '', 1, '2011-05-25 15:42:44'),
(4, 'To meet healthcare costs', '', 1, '2011-05-25 15:42:44'),
(5, 'Agriculture improvement', '', 1, '2011-05-25 15:42:44'),
(6, 'Starting business/Business improvement', '', 1, '2011-05-25 15:42:44'),
(7, 'Others', '', 1, '2011-05-25 15:42:44'),
(8, 'Education', '', 1, '2011-05-25 15:42:44');

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
(1, 'Friends & Family', '', 1, '2011-05-25 15:43:03'),
(2, 'Chit Funds', '', 1, '2011-05-25 15:43:03'),
(3, 'SHGs / CBOs', '', 1, '2011-05-25 15:43:03'),
(4, 'Cooperative Banks', '', 1, '2011-05-25 15:43:03'),
(5, 'Scheduled Banks', '', 1, '2011-05-25 15:43:03'),
(6, 'Money Lenders', '', 1, '2011-05-25 15:43:03'),
(7, 'MFI', '', 1, '2011-05-25 15:43:03');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_maritalstatus`
--

INSERT INTO `ourbank_master_maritalstatus` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Married', '', 1, '2011-05-25 15:46:54'),
(2, 'Unmarried', '', 1, '2011-05-25 15:46:54'),
(3, 'Widow/widower', '', 1, '2011-05-25 15:46:54'),
(4, 'Divorced', '', 1, '2011-05-25 15:46:54'),
(5, 'Separated', '', 1, '2011-05-25 15:46:54'),
(6, 'Married', '', 1, '2011-05-25 15:46:54'),
(7, 'Coming soon Married', '', 0, '0000-00-00 00:00:00');

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
(1, '', 'ourbank_master_accountype', 'Account type', 1, '2011-06-09 16:39:09'),
(2, '', 'ourbank_master_bank', 'Bank', 1, '2011-06-09 16:39:09'),
(3, '', 'ourbank_master_businesstype', 'Businesstype', 1, '2011-06-09 16:39:09'),
(4, '', 'ourbank_master_castetype', 'Caste type', 1, '2011-06-09 16:39:09'),
(5, '', 'ourbank_master_cbopromoter', 'CBO promoter', 1, '2011-06-09 16:39:09'),
(6, '', 'ourbank_master_cbos', 'CBOs', 1, '2011-06-09 16:39:09'),
(7, '', 'ourbank_master_cookingfuel', 'Cooking fuel', 1, '2011-06-09 16:39:09'),
(8, '', 'ourbank_master_crop', 'Crop', 1, '2011-06-09 16:39:09'),
(9, '', 'ourbank_master_designation', 'Designation', 1, '2011-06-09 16:39:09'),
(10, '', 'ourbank_master_diseasetypes', 'Disease types', 1, '2011-06-09 16:39:09'),
(11, '', 'ourbank_master_districtlist', 'District list', 1, '2011-06-09 16:39:09'),
(12, '', 'ourbank_master_educationtype', 'Education type', 1, '2011-06-09 16:39:09'),
(13, '', 'ourbank_master_employmenttype', 'Employment type', 1, '2011-06-09 16:39:09'),
(14, '', 'ourbank_master_entitlements', 'Entitlements', 1, '2011-06-09 16:39:09'),
(15, '', 'ourbank_master_expense', 'Expense', 1, '2011-06-09 16:39:09'),
(16, '', 'ourbank_master_familyexpense', 'Family Expense', 1, '2011-06-09 16:39:09'),
(17, '', 'ourbank_master_familyincome', 'Family Income', 1, '2011-06-09 16:39:09'),
(18, '', 'ourbank_master_familytype', 'Family Type', 1, '2011-06-09 16:39:09'),
(19, '', 'ourbank_master_frequencypayment', 'Frequency payment', 1, '2011-06-09 16:39:09'),
(20, '', 'ourbank_master_hoblilist', 'Hoblilist', 1, '2011-06-09 16:39:09'),
(21, '', 'ourbank_master_income', 'Income', 1, '2011-06-09 16:39:09'),
(22, '', 'ourbank_master_institutions', 'Institutions', 1, '2011-06-09 16:39:09'),
(23, '', 'ourbank_master_landacquisition', 'Land acquisition', 1, '2011-06-09 16:39:09'),
(24, '', 'ourbank_master_landtypes', 'Land types', 1, '2011-06-09 16:39:09'),
(25, '', 'ourbank_master_liveassets', 'Live assets', 1, '2011-06-09 16:39:09'),
(26, '', 'ourbank_master_loanpurpose', 'Loan purpose', 1, '2011-06-09 16:39:09'),
(27, '', 'ourbank_master_loansource', 'Loan source', 1, '2011-06-09 16:39:09'),
(28, '', 'ourbank_master_nonliveassets', 'Nonliving Assets', 1, '2011-06-09 16:39:09'),
(29, '', 'ourbank_master_ownershiptype', 'Ownership Type', 1, '2011-06-09 16:39:09'),
(30, '', 'ourbank_master_povertytype', 'Poverty Type', 1, '2011-06-09 16:39:09'),
(31, '', 'ourbank_master_profession', 'Profession', 1, '2011-06-09 16:41:35'),
(32, '', 'ourbank_master_realtionshiptype', 'Relationship Type', 1, '2011-06-09 16:41:36'),
(33, '', 'ourbank_master_servicesectors', 'Service Sectors', 1, '2011-06-09 16:41:36'),
(34, '', 'ourbank_master_skills', 'Skills', 1, '2011-06-09 16:41:36'),
(35, '', 'ourbank_master_sourceofincome', 'Source of Income', 1, '2011-06-09 16:41:36'),
(36, '', 'ourbank_master_taluklist', 'Taluk List', 1, '2011-06-09 16:41:36'),
(37, '', 'ourbank_master_gillapanchayath', 'Grama Panchayath', 1, '2011-06-09 16:41:36'),
(38, '', 'ourbank_master_habitation', 'Habitation', 1, '2011-06-09 16:41:36'),
(39, '', 'ourbank_master_seasons', 'Seasons', 1, '2011-06-09 16:41:36'),
(40, '', 'ourbank_master_branch', 'Branch', 1, '2011-06-09 16:41:36');

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
(54, 'ourbank_master_branch', 'Branch', 0, '2011-06-02 20:15:37');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_membertypes`
--

INSERT INTO `ourbank_master_membertypes` (`id`, `type`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Individual', '', 1, '2011-05-25 16:46:41'),
(2, 'SHG', '', 1, '2011-05-25 16:46:41'),
(3, 'JLG', '', 1, '2011-05-25 16:46:41'),
(4, 'All', '', 1, '2011-05-25 16:46:41');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_master_nonliveassets`
--

INSERT INTO `ourbank_master_nonliveassets` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'House', '', 1, '2011-05-25 15:47:44'),
(2, 'Cow shed', '', 1, '2011-05-25 15:47:44'),
(3, 'Bullock cart', '', 1, '2011-05-25 15:47:44'),
(4, 'Deposit', '', 1, '2011-05-25 15:47:44'),
(5, 'Tractor', '', 1, '2011-05-25 15:47:44'),
(6, 'Car/Lorry', '', 1, '2011-05-25 15:47:44'),
(7, 'Bycicle', '', 1, '2011-05-25 15:47:44'),
(8, 'Bike', '', 1, '2011-05-25 15:47:44'),
(9, 'Mobile', '', 1, '2011-05-25 15:47:44'),
(10, 'TV', '', 1, '2011-05-25 15:47:44');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_ownershiptype`
--

INSERT INTO `ourbank_master_ownershiptype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Rented', '', 1, '2011-05-25 15:48:19'),
(2, 'Shared family', '', 1, '2011-05-25 15:48:19'),
(3, 'Owned with title', '', 1, '2011-05-25 15:48:19'),
(4, 'IAY/govt.scheme', '', 1, '2011-05-25 15:48:19'),
(5, 'Owned no title', '', 1, '2011-05-25 15:48:19'),
(6, 'Taken on lease', 'Taken on lease', 1, '2011-05-27 12:10:40'),
(7, 'Taken on sharecropping', 'Taken on sharecropping', 1, '2011-05-27 12:10:44');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_phychallenge`
--

INSERT INTO `ourbank_master_phychallenge` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(2, 'Physical', '', 1, '2011-05-25 16:04:21'),
(3, 'Deaf', '', 1, '2011-05-25 16:04:21'),
(4, 'Dumb', '', 1, '2011-05-25 16:04:21'),
(5, 'Others', '', 1, '2011-05-25 16:04:21'),
(6, 'Blind', '', 1, '2011-05-25 16:04:21');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_profession`
--

INSERT INTO `ourbank_master_profession` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(2, 'Teacher', '', 1, '2011-05-25 15:53:11'),
(3, 'Business', '', 1, '2011-05-25 15:53:11'),
(4, 'Carpenter', '', 1, '2011-05-25 15:53:11'),
(5, 'Cobler', '', 1, '2011-05-25 15:53:11'),
(6, 'Iron Smith', '', 1, '2011-05-25 15:53:11'),
(7, 'Insurence Agent', '', 1, '2011-05-25 15:53:11'),
(8, 'Farmer', '', 1, '2011-05-25 15:53:11'),
(9, 'Tailor', '', 1, '2011-05-25 15:53:11');

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
(1, 'None', '', 1, '2011-02-16 18:34:48'),
(2, 'APL', '', 1, '2011-02-16 00:00:00'),
(3, 'BPL', '', 1, '2011-02-16 00:00:00'),
(4, 'AAY', '', 1, '2011-02-16 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `ourbank_master_realtionshiptype`
--

INSERT INTO `ourbank_master_realtionshiptype` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Self', '', 1, '2011-05-25 16:02:31'),
(2, 'Spouse', '', 1, '2011-05-25 16:02:31'),
(3, 'Father', '', 1, '2011-05-25 16:02:31'),
(4, 'Mother', '', 1, '2011-05-25 16:02:31'),
(5, 'Son', '', 1, '2011-05-25 16:02:31'),
(6, 'Daughter', '', 1, '2011-05-25 16:02:31'),
(7, 'Brother', '', 1, '2011-05-25 16:02:31'),
(8, 'Sister', '', 1, '2011-05-25 16:02:31'),
(9, 'Daughter-in-law', '', 1, '2011-05-25 16:02:31'),
(10, 'Son-in-law', '', 1, '2011-05-25 16:02:31'),
(11, 'Father-in-law', '', 1, '2011-05-25 16:02:31'),
(12, 'Mother-in-law', '', 1, '2011-05-25 16:02:31'),
(13, 'Brother-in-law', '', 1, '2011-05-25 16:02:31'),
(14, 'Sister-in-law', '', 1, '2011-05-25 16:02:31'),
(15, 'Nephew', '', 1, '2011-05-25 16:02:31'),
(16, 'Niece', '', 1, '2011-05-25 16:02:31'),
(17, 'Grandson', '', 1, '2011-05-25 16:02:31'),
(18, 'Granddaughter', '', 1, '2011-05-25 16:02:31'),
(19, 'Grandfather', '', 1, '2011-05-25 16:02:31'),
(20, 'Grandmother', '', 1, '2011-05-25 16:02:31'),
(21, 'Uncle/Aunt', '', 1, '2011-05-25 16:02:31'),
(22, 'Others', '', 1, '2011-05-25 16:02:31');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `ourbank_master_servicesectors`
--

INSERT INTO `ourbank_master_servicesectors` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Agriculture', '', 1, '2011-05-25 16:10:26'),
(2, 'Retail', '', 1, '2011-05-25 16:10:26'),
(3, 'Hospitality/hotel', '', 1, '2011-05-25 16:10:26'),
(4, 'Forestry', '', 1, '2011-05-25 16:10:26'),
(5, 'Fishery', '', 1, '2011-05-25 16:10:26'),
(6, 'Industry/Manufacturing', '', 1, '2011-05-25 16:10:26'),
(7, 'Construction', '', 1, '2011-05-25 16:10:26'),
(8, 'Transportation', '', 1, '2011-05-25 16:10:26'),
(9, 'IT Serivices', '', 1, '2011-05-25 16:10:26'),
(10, 'Others', '', 1, '2011-05-25 16:10:26'),
(11, 'housing', '', 1, '2011-05-25 16:10:26'),
(12, 'house repair', '', 1, '2011-05-25 16:10:26'),
(13, 'ration card', '', 1, '2011-05-25 16:10:26'),
(14, 'widows pension', '', 1, '2011-05-25 16:10:26'),
(15, 'oldage pension', '', 1, '2011-05-25 16:10:26'),
(16, 'handycap pension', '', 1, '2011-05-25 16:10:26'),
(17, 'toilets', '', 1, '2011-05-25 16:10:26'),
(18, 'NREG card', '', 1, '2011-05-25 16:10:26'),
(19, 'skill training', '', 1, '2011-05-25 16:10:26'),
(20, 'external employment', '', 1, '2011-05-25 16:10:26'),
(21, 'bank savings A/C', '', 1, '2011-05-25 16:10:26'),
(22, 'inclusion to women SHG', '', 1, '2011-05-25 16:10:26'),
(23, 'inclusion to farmers SHG', '', 1, '2011-05-25 16:10:26'),
(24, 'life insurance', '', 1, '2011-05-25 16:10:26'),
(25, 'health insurance', '', 1, '2011-05-25 16:10:26'),
(26, 'animal insurance', '', 1, '2011-05-25 16:10:26'),
(27, 'hostels for students', '', 1, '2011-05-25 16:10:26'),
(28, 'special classes/tuition', '', 1, '2011-05-25 16:10:26'),
(29, 'capital/credit', '', 1, '2011-05-25 16:10:26');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ourbank_master_skills`
--

INSERT INTO `ourbank_master_skills` (`id`, `name`, `name_regional`, `created_by`, `created_date`) VALUES
(1, 'Farm worker', '', 1, '2011-05-25 16:11:16'),
(2, 'Non-farm worker', '', 1, '2011-05-25 16:11:16'),
(3, 'Fishermen', '', 1, '2011-05-25 16:11:16'),
(4, 'Weaver', '', 1, '2011-05-25 16:11:16'),
(5, 'Mechanic', '', 1, '2011-05-25 16:11:16'),
(6, 'Carpenter', '', 1, '2011-05-25 16:11:16'),
(7, 'Mason', '', 1, '2011-05-25 16:11:16'),
(8, 'Blacksmith', '', 1, '2011-05-25 16:11:16'),
(9, 'Tailor', '', 1, '2011-05-25 16:11:16'),
(10, 'Teacher', '', 1, '2011-05-25 16:11:16'),
(11, 'Government Employee', '', 1, '2011-05-25 16:11:16'),
(12, 'Private sector employee', '', 1, '2011-05-25 16:11:16'),
(13, 'Driver', '', 1, '2011-05-25 16:11:16'),
(14, 'Business/Trade', '', 1, '2011-05-25 16:11:16'),
(15, 'Others', '', 1, '2011-05-25 16:11:16'),
(16, 'Construction Worker', '', 1, '2011-05-25 16:11:16'),
(17, 'Retail business', '', 1, '2011-05-25 16:11:16'),
(18, 'None', 'None', 1, '2011-05-25 16:11:16');

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
(1, 'Daily Wage', '', 1, '2011-05-25 16:12:02'),
(2, 'Cultivation', '', 1, '2011-05-25 16:12:02'),
(3, 'Salary', '', 1, '2011-05-25 16:12:02'),
(4, 'Others', '', 1, '2011-05-25 16:12:02');

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
(1, 'Karnataka', '', 1, '2011-04-12 14:44:06');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_subcaste`
--

INSERT INTO `ourbank_master_subcaste` (`id`, `name`, `name_regional`, `caste_id`, `created_by`, `created_date`) VALUES
(1, 'sc1', '', 1, 1, '2011-05-25 16:22:59'),
(2, 'sc2', '', 1, 1, '2011-05-25 16:22:59'),
(3, 'st1', '', 2, 1, '2011-05-25 16:22:59'),
(4, 'st2', '', 2, 1, '2011-05-25 16:22:59'),
(5, 'obc1', '', 3, 1, '2011-05-25 16:22:59'),
(6, 'obc2', '', 3, 1, '2011-05-25 16:22:59'),
(7, 'other1', '', 4, 1, '2011-05-25 16:22:59'),
(8, 'other2', '', 4, 1, '2011-05-25 16:22:59');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_taluklist`
--

INSERT INTO `ourbank_master_taluklist` (`id`, `name`, `name_regional`, `district_id`, `created_by`, `Created_date`) VALUES
(1, 'Bangalore South', '', 1, 0, '2011-06-10 10:32:08'),
(2, 'Bangalore North', '', 1, 0, '2011-06-10 10:32:27'),
(3, 'Mandiya', '', 2, 0, '2011-06-10 10:32:59'),
(4, 'Udupi', '', 2, 0, '2011-06-10 10:33:36');

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
(1, 'kilograms', '', 1, '2011-05-25 16:24:38'),
(2, 'Quintal', '', 1, '2011-05-25 16:24:38'),
(3, 'Litre', '', 1, '2011-05-25 16:24:38'),
(4, 'Number', '', 1, '2011-05-25 16:24:38'),
(5, 'Others', '', 1, '2011-05-25 16:24:38'),
(6, 'Not applicable', '', 1, '2011-05-25 16:24:38');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_village`
--

INSERT INTO `ourbank_master_village` (`id`, `village_id`, `panchayath_id`, `hobli_id`, `taluk_id`, `district_id`, `state_id`, `created_by`, `created_date`) VALUES
(1, 4, 1, 1, 1, 1, 0, 1, '2011-06-10 10:40:40'),
(2, 5, 2, 2, 2, 1, 0, 1, '2011-06-10 10:41:39'),
(3, 6, 3, 3, 3, 2, 0, 1, '2011-06-10 10:42:57'),
(4, 7, 4, 4, 4, 2, 0, 1, '2011-06-10 10:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_villagelist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_villagelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `panchayath_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_villagelist`
--

INSERT INTO `ourbank_master_villagelist` (`id`, `village_id`, `name`, `panchayath_id`, `created_by`, `created_date`) VALUES
(1, 4, 'krishna village', 1, 1, '2011-06-10 10:40:40'),
(2, 5, 'bettlesoor village', 2, 1, '2011-06-10 10:41:39'),
(3, 6, 'Samundeswari village', 3, 1, '2011-06-10 10:42:57'),
(4, 7, 'KR village', 4, 1, '2011-06-10 10:43:28');

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
(1, 'Monday', '', 1, '2011-05-25 16:45:23'),
(2, 'Tuesday', '', 1, '2011-05-25 16:45:23'),
(3, 'Wednesday', '', 1, '2011-05-25 16:45:23'),
(4, 'Thursday', '', 1, '2011-05-25 16:45:23'),
(5, 'Friday', '', 1, '2011-05-25 16:45:23'),
(6, 'Saturday', '', 1, '2011-05-25 16:45:23'),
(7, 'Sunday', '', 1, '2011-05-25 16:45:23');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_meeting`
--

INSERT INTO `ourbank_meeting` (`id`, `name`, `village_id`, `group_id`, `grouphead_name`, `place`, `time`, `day`, `created_by`, `created_date`) VALUES
(1, 'meeting1', 5, 1, '', 'bangalore', '01:30:00', '5', '1', '2011-06-08 16:27:58');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ourbank_meeting_log`
--

INSERT INTO `ourbank_meeting_log` (`record_id`, `id`, `name`, `village_id`, `group_id`, `grouphead_name`, `place`, `time`, `day`, `created_by`, `created_date`) VALUES
(1, 1, 'meeting1', 5, 1, '', 'bangalore', '12:23:34', '5', '1', '2011-06-07'),
(2, 1, 'meeting1', 5, 1, '', 'bangalore', '12:23:35', '5', '1', '2011-06-08'),
(3, 1, 'meeting1', 5, 1, '', 'bangalore', '12:23:35', '5', '1', '2011-06-08'),
(4, 1, 'meeting1', 5, 1, '', 'bangalore', '12:23:00', '5', '1', '2011-06-08'),
(5, 1, 'meeting1', 5, 1, '', 'bangalore', '00:00:00', '5', '1', '2011-06-08'),
(6, 1, 'meeting1', 5, 1, '', 'bangalore', '00:00:00', '5', '1', '2011-06-08'),
(7, 1, 'meeting1', 5, 1, '', 'bangalore', '12:30:00', '5', '1', '2011-06-08'),
(8, 1, 'meeting1', 5, 1, '', 'bangalore', '01:30:00', '5', '1', '2011-06-08'),
(9, 1, 'sfdsf@', 5, 1, '', 'bangalore', '01:30:00', '5', '1', '2011-06-08'),
(10, 1, 'meetign1', 5, 1, '', 'bangalore', '01:30:00', '5', '1', '2011-06-08'),
(11, 2, 'meetign', 5, 1, 'ram', 'kolar', '838:59:59', '2', '1', '2011-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_member`
--

CREATE TABLE IF NOT EXISTS `ourbank_member` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `membercode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(5) NOT NULL,
  `street` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `caste` int(5) NOT NULL,
  `familytype` int(5) NOT NULL,
  `povertycreteria` int(5) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_memberattendance_log`
--

INSERT INTO `ourbank_memberattendance_log` (`record_id`, `id`, `attendance_id`, `member_id`, `attendance_type`, `created_date`) VALUES
(1, 1, 2, 1, 0, '2011-06-07 12:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberentitlememnt`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberentitlememnt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `entitlement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `ourbank_memberentitlememnt`
--

INSERT INTO `ourbank_memberentitlememnt` (`id`, `member_id`, `entitlement_id`) VALUES
(4, 3, 0),
(5, 4, 1),
(25, 6, 0),
(46, 5, 0),
(49, 3, 0),
(50, 4, 0),
(51, 5, 0),
(52, 6, 0),
(53, 7, 0),
(54, 8, 0),
(61, 1, 0),
(62, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_memberprofession`
--

CREATE TABLE IF NOT EXISTS `ourbank_memberprofession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `profession_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `ourbank_memberprofession`
--

INSERT INTO `ourbank_memberprofession` (`id`, `member_id`, `profession_id`) VALUES
(4, 3, 2),
(5, 4, 3),
(25, 6, 0),
(46, 5, 0),
(49, 3, 0),
(50, 4, 0),
(51, 5, 2),
(52, 6, 3),
(53, 7, 3),
(54, 8, 0),
(61, 1, 0),
(62, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_member_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_member_log` (
  `record_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `membercode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `village` int(5) NOT NULL,
  `street` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `caste` int(5) NOT NULL,
  `familytype` int(5) NOT NULL,
  `povertycreteria` int(5) NOT NULL,
  `mobile` double NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_member_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_nonlivingassetsdetails`
--

INSERT INTO `ourbank_nonlivingassetsdetails` (`id`, `submodule_id`, `family_id`, `nonliveasset_id`, `number`, `value`, `date_of_value`, `created_by`, `created_date`) VALUES
(1, 17, 1, 6, '1', '200', '2011-06-02', 0, '2011-06-07 09:24:46');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_office`
--

INSERT INTO `ourbank_office` (`id`, `name`, `short_name`, `officetype_id`, `parentoffice_id`, `createddate`, `createdby`) VALUES
(1, 'OUR BANK', 'OBK', 1, 1, '2011-06-10', 1),
(2, 'FEDERATION', 'FDS', 2, 1, '2011-06-10', 1),
(3, 'KOOTA', 'KOA', 3, 2, '2011-06-10', 1),
(4, 'krishna village', 'KVL', 4, 3, '2011-06-10', 1),
(5, 'bettlesoor village', 'BVL', 4, 3, '2011-06-10', 1),
(6, 'Samundeswari village', 'SVL', 4, 3, '2011-06-10', 1),
(7, 'KR village', 'KVL', 4, 3, '2011-06-10', 1);

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
(1, 'OURBANK', 'OB', 1, 1, '2011-06-07'),
(2, 'FEDERATION', 'Fe', 2, 1, '2011-06-07'),
(3, 'KOOTA', 'Ko', 3, 1, '2011-06-07'),
(4, 'VILLAGE', 'Vi', 4, 1, '2011-06-07');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_officemeeting`
--

INSERT INTO `ourbank_officemeeting` (`id`, `name`, `officelevel`, `office_id`, `frequency`, `place`, `created_by`, `created_date`) VALUES
(1, 'meeting2', 2, 2, 6, 'bangalore', '1', '2011-06-07 12:41:40');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_praservice_log`
--


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
(1, 'personal saving', 'ps', 1, 'for Personal savings', 4, '2011-06-06'),
(2, 'fixed deposit', 'fd', 1, 'for fixed deposit', 4, '2011-06-06'),
(3, 'recurring deposit', 'rd', 1, 'for recurring deposit', 4, '2011-06-06'),
(4, 'Agriculture loan', 'agr', 2, 'For Farmers', 1, '2011-06-07'),
(5, 'Education loan', 'Edu', 2, 'EDU', 1, '2011-06-07'),
(6, 'Others purpose loan', 'oth', 2, 'for other purpose', 1, '2011-06-07');

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
(2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 4, '', 0),
(3, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 50, 0, 0, 5, '', 0),
(4, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 48, 0, 0, 2, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `ourbank_productsloan_log`
--

INSERT INTO `ourbank_productsloan_log` (`record_id`, `productsoffer_id`, `minmumloanamount`, `maximunloanamount`, `interesttype_id`, `minimumloaninterest`, `maximunloaninterest`, `penal_Interest`, `installmenttype_id`, `minimumfrequency`, `maximumfrequency`, `fee_id`, `graceperiodtype_id`, `graceperiodnumber`, `fund_id`, `glsubcode`) VALUES
(1, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 100, 0, 0, 9, '', 0),
(2, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 100, 0, 0, 9, '', 0),
(3, 6, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 50, 100, 0, 0, 5, '', 0),
(4, 5, 2500, 15000, 2, 0.00, 0.00, 3.00, 0, 5, 30, 0, 0, 3, '', 0),
(5, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 48, 0, 0, 9, '', 0),
(6, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 48, 0, 0, 9, '', 0),
(7, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 48, 0, 0, 9, '', 0),
(8, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 48, 0, 0, 9, '', 0),
(9, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 36, 36, 0, 0, 9, '', 0),
(10, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 48, 0, 0, 9, '', 0),
(11, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 48, 48, 0, 0, 9, '', 0),
(12, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 50, 50, 0, 0, 9, '', 0),
(13, 5, 2500, 15000, 2, 0.00, 0.00, 3.00, 0, 30, 30, 0, 0, 3, '', 0),
(14, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 50, 50, 0, 0, 9, '', 0),
(15, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 50, 50, 0, 0, 9, '', 0),
(16, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 50, 50, 0, 0, 9, '', 0),
(17, 7, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 50, 50, 0, 0, 9, '', 0),
(18, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 5, 50, 0, 0, 3, '', 0),
(19, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 10, 0, 0, 3, '', 0),
(20, 4, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 48, 0, 0, 5, '', 0),
(21, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 3, '', 0),
(22, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 2, '', 0),
(23, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 2, '', 0),
(24, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 2, '', 0),
(25, 4, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 48, 0, 0, 2, '', 0),
(26, 4, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 48, 0, 0, 2, '', 0),
(27, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 4, '', 0),
(28, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 4, '', 0),
(29, 3, 50000, 500000, 2, 0.00, 0.00, 2.00, 0, 12, 50, 0, 0, 5, '', 0),
(30, 2, 2500, 25000, 2, 0.00, 0.00, 3.00, 0, 1, 5, 0, 0, 4, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ourbank_productsoffer`
--

INSERT INTO `ourbank_productsoffer` (`id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(2, 'loan for crop', 'crl', 4, 'crl', '2011-06-07', '2012-03-29', 4, 45, 0, 0, 0),
(3, 'Education loan', 'EDU', 5, 'for Education loan', '2011-06-07', '2014-02-28', 4, 46, 0, 0, 0),
(4, 'other purpose loan', 'OPL', 6, 'for other purpose', '2011-06-07', '2014-02-28', 4, 47, 0, 0, 0),
(7, 'Savings', 'sb', 1, 'For savings products', '2011-06-09', '0000-00-00', 4, 55, 0, 0, 0),
(10, 'Fixed deposit for All', 'fda', 2, 'Fixed deposit for All', '2011-06-10', '2011-12-30', 4, 72, 0, 0, 0),
(11, 'Recurring Savings', 'RDS', 3, 'for Recurring savings', '2011-01-01', '2014-02-28', 4, 73, 0, 0, 0),
(12, '', '', 1, '', '0000-00-00', '0000-00-00', 0, 74, 0, 0, 0),
(13, '', '', 1, '', '0000-00-00', '0000-00-00', 0, 75, 0, 0, 0),
(14, 'ps albert', 'psa', 1, 'ps albert', '2011-06-10', '0000-00-00', 2, 76, 0, 0, 0),
(15, 'ps for individual', 'psa', 1, 'ps for individual', '2011-06-10', '0000-00-00', 1, 77, 0, 0, 0),
(17, 'DEMO FOR FD', 'DEM', 2, 'DEMO FOR FD', '2011-06-10', '2011-11-24', 1, 79, 0, 0, 0),
(18, 'demo in rd', 'dmr', 3, 'dmr in ', '2011-06-10', '2011-11-30', 3, 80, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `ourbank_productsoffer_log`
--

INSERT INTO `ourbank_productsoffer_log` (`record_id`, `id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(1, 8, 'Fixed deposit for All', 'fda', 2, 'ffd', '2011-06-01', '2011-11-16', 4, 56, 0, 0, 0),
(2, 8, 'Fixed deposit for All', 'fda', 2, 'ffd', '2011-06-01', '2011-11-16', 4, 56, 0, 0, 0),
(3, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(4, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(5, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(6, 2, 'crop loan', 'crl', 4, 'crl', '2011-06-07', '2012-03-29', 4, 45, 0, 0, 0),
(7, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(8, 2, 'loan for crop', 'crl', 4, 'crl', '2011-06-07', '2012-03-29', 4, 45, 0, 0, 0),
(9, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(10, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(11, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(12, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(13, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(14, 9, 'recurring deposit', 'rd', 3, 'recurring deposit', '2011-06-01', '2011-06-30', 4, 57, 0, 0, 0),
(15, 8, 'Fixed deposit for All', 'fda', 2, 'ffd', '2011-06-01', '2011-11-16', 4, 56, 0, 0, 0),
(16, 3, 'Education loan', 'EDU', 5, 'for Education loan', '2011-06-07', '2014-02-28', 4, 46, 0, 0, 0),
(17, 2, 'loan for crop', 'crl', 4, 'crl', '2011-06-07', '2012-03-29', 4, 45, 0, 0, 0),
(18, 10, 'Fixed deposit for All', 'fda', 2, 'Fixed deposit for All', '2011-06-10', '2011-12-30', 4, 72, 0, 0, 0),
(19, 10, 'Fixed deposit for All', 'fda', 2, 'Fixed deposit for All', '2011-06-10', '2011-12-30', 4, 72, 0, 0, 0),
(20, 10, 'Fixed deposit for All', 'fda', 2, 'Fixed deposit for All', '2011-06-10', '2011-12-30', 4, 72, 0, 0, 0),
(21, 10, 'Fixed deposit for All', 'fda', 2, 'Fixed deposit for All', '2011-06-10', '2011-12-30', 4, 72, 0, 0, 0);

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
(7, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, ''),
(12, '', 0, 0, 0.00, 0.00, 0.00, 0.00, 0, '', 0, ''),
(13, '', 0, 0, 0.00, 0.00, 0.00, 0.00, 0, '', 0, ''),
(14, '', 3, 0, 250.00, 0.00, 0.00, 2.00, 0, 'AvgBalance', 3, ''),
(15, '', 3, 0, 250.00, 0.00, 0.00, 3.00, 0, 'AvgBalance', 2, ''),
(16, '', 0, 0, 0.00, 0.00, 0.00, 0.00, 0, '', 0, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_productssaving_log`
--

INSERT INTO `ourbank_productssaving_log` (`record_id`, `productsoffer_id`, `savingsindividualgroup`, `frequencyofdeposit`, `depo_timefrequency_id`, `minmumdeposit`, `maximumwithdrawal`, `rateofinterest`, `minimumbalanceforinterest`, `minimumperiodforinterest`, `frequencyofinterestupdating`, `Int_timefrequency_id`, `amountusedforcalculateinterest`) VALUES
(1, 1, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, ''),
(2, 1, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, ''),
(3, 1, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, ''),
(4, 1, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, ''),
(5, 1, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, ''),
(6, 7, '', 1, 0, 1.00, 0.00, 0.00, 1.00, 0, 'AvgBalance', 1, '');

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
(10, 300.00, 4000.00, 0, 0, 4, 3.00, 0.00),
(11, 10000.00, 500000.00, 0, 0, 4, 2.00, 0.00),
(17, 20.00, 2000.00, 0, 0, 2, 3.00, 0.00),
(18, 20.00, 2500.00, 0, 0, 2, 0.00, 0.00);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_product_fixedrecurring_log`
--

INSERT INTO `ourbank_product_fixedrecurring_log` (`record_id`, `productsoffer_id`, `minimum_deposit_amount`, `maximum_deposit_amount`, `minimum_periodof_deposit`, `maximum_periodof_deposit`, `frequency_of_deposit`, `penal_Interest`, `other_charges`) VALUES
(1, 10, 200.00, 3000.00, 0, 0, 4, 3.00, 0.00),
(2, 10, 200.00, 3000.00, 0, 0, 4, 3.00, 0.00),
(3, 10, 300.00, 4000.00, 0, 0, 4, 3.00, 0.00),
(4, 10, 300.00, 4000.00, 0, 0, 4, 3.00, 0.00);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_recurringaccounts`
--

INSERT INTO `ourbank_recurringaccounts` (`recurringaccount_id`, `account_id`, `begin_date`, `mature_date`, `recurring_amount`, `timefrequncy_id`, `fixed_interest`, `premature_interest`, `fixedaccountstatus_id`, `created_by`, `created_date`) VALUES
(1, 10, '2011-06-10', '2015-06-10', 10000.00, 48, 5.00, 1.00, 1, 1, '2011-06-10');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `ourbank_recurringpaydetails`
--

INSERT INTO `ourbank_recurringpaydetails` (`paymentserial_id`, `account_id`, `rec_payment_id`, `rec_payment_date`, `rec_payment_amount`, `rec_payment_penalty_amount`, `rec_principal_amount`, `rec_payment_status`, `created_by`, `created_date`, `recordstatus_id`) VALUES
(1, 8, 1, '2011-06-07', 4000.00, 0.00, 0.00, 2, 1, '2011-06-07', 3),
(2, 8, 2, '2011-07-07', 4000.00, 0.00, 0.00, 2, 1, '2011-06-07', 3),
(3, 6, 1, '2011-06-07', 3000.00, 0.00, 0.00, 2, 1, '2011-06-07', 3),
(4, 6, 2, '2011-07-07', 3000.00, 0.00, 0.00, 4, 1, '2011-06-07', 3),
(5, 7, 1, '2011-06-07', 500.00, 0.00, 0.00, 2, 1, '2011-06-07', 3),
(6, 7, 2, '2011-07-07', 500.00, 0.00, 0.00, 4, 1, '2011-06-07', 3),
(7, 7, 3, '2011-08-07', 500.00, 0.00, 0.00, 3, 1, '2011-06-07', 3),
(8, 10, 1, '2011-06-10', 10000.00, 0.00, 0.00, 2, 1, '2011-06-10', 3),
(9, 10, 2, '2011-07-10', 10000.00, 0.00, 0.00, 4, 1, '2011-06-10', 3),
(10, 10, 3, '2011-08-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(11, 10, 4, '2011-09-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(12, 10, 5, '2011-10-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(13, 10, 6, '2011-11-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(14, 10, 7, '2011-12-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(15, 10, 8, '2012-01-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(16, 10, 9, '2012-02-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(17, 10, 10, '2012-03-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(18, 10, 11, '2012-04-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(19, 10, 12, '2012-05-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(20, 10, 13, '2012-06-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(21, 10, 14, '2012-07-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(22, 10, 15, '2012-08-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(23, 10, 16, '2012-09-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(24, 10, 17, '2012-10-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(25, 10, 18, '2012-11-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(26, 10, 19, '2012-12-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(27, 10, 20, '2013-01-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(28, 10, 21, '2013-02-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(29, 10, 22, '2013-03-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(30, 10, 23, '2013-04-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(31, 10, 24, '2013-05-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(32, 10, 25, '2013-06-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(33, 10, 26, '2013-07-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(34, 10, 27, '2013-08-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(35, 10, 28, '2013-09-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(36, 10, 29, '2013-10-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(37, 10, 30, '2013-11-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(38, 10, 31, '2013-12-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(39, 10, 32, '2014-01-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(40, 10, 33, '2014-02-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(41, 10, 34, '2014-03-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(42, 10, 35, '2014-04-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(43, 10, 36, '2014-05-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(44, 10, 37, '2014-06-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(45, 10, 38, '2014-07-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(46, 10, 39, '2014-08-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(47, 10, 40, '2014-09-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(48, 10, 41, '2014-10-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(49, 10, 42, '2014-11-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(50, 10, 43, '2014-12-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(51, 10, 44, '2015-01-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(52, 10, 45, '2015-02-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(53, 10, 46, '2015-03-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(54, 10, 47, '2015-04-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3),
(55, 10, 48, '2015-05-10', 10000.00, 0.00, 0.00, 3, 1, '2011-06-10', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ourbank_recurring_payment`
--

INSERT INTO `ourbank_recurring_payment` (`rec_paymentserial_id`, `transaction_id`, `account_id`, `rec_payment_number`, `rec_paymentpaid_date`, `rec_paid_amount`, `rec_paid_interst`, `rec_paid_other_amount`, `recordstatus_id`) VALUES
(1, 6, 10, 1, '2011-06-10', 10000.00, 500.00, 0.00, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_transaction`
--

INSERT INTO `ourbank_transaction` (`transaction_id`, `account_id`, `glsubcode_id_from`, `glsubcode_id_to`, `transaction_date`, `amount_to_bank`, `amount_from_bank`, `paymenttype_id`, `paymenttype_details`, `transactiontype_id`, `recordstatus_id`, `reffering_vouchernumber`, `transaction_description`, `balance`, `confirmation_flag`, `transaction_remarks`, `created_by`, `created_date`) VALUES
(1, 5, 0, 72, '2011-06-09', 2000.00, 0.00, 1, '', 1, 3, 0, 'Opening amount', 2000.00, 0, '', 1, '2011-06-10 12:18:43'),
(2, 6, 0, 72, '2011-06-10', 3000.00, 0.00, 1, '', 1, 3, 0, 'Opening amount', 3000.00, 0, '', 1, '2011-06-10 12:19:31'),
(3, 7, 0, 72, '2011-06-10', 350.00, 0.00, 1, '', 1, 3, 0, 'Opening amount', 350.00, 0, '', 2, '2011-06-10 12:55:20'),
(4, 8, 0, 72, '2011-06-10', 3000.00, 0.00, 1, '', 1, 3, 0, 'Opening amount', 3000.00, 0, '', 2, '2011-06-10 12:55:52'),
(5, 9, 0, 72, '2011-06-10', 400.00, 0.00, 1, '', 1, 3, 0, 'Opening amount', 400.00, 0, '', 2, '2011-06-10 12:56:39'),
(6, 10, 0, 73, '2011-06-10', 10000.00, 0.00, 1, '', 1, 3, 0, 'Opening amount', 10000.00, 0, '', 1, '2011-06-10 14:29:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_user`
--

INSERT INTO `ourbank_user` (`id`, `bank_id`, `name`, `gender`, `designation`, `department`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 7, 'admin', 1, 1, 1, 'admin', 'admin', 1, 0, '2011-06-10 10:45:15'),
(2, 6, 'nataraj', 1, 1, 1, 'nataraj', 'nataraj', 1, 0, '2011-06-07 12:10:23'),
(3, 5, 'mahiti', 1, 1, 4, 'mahiti', 'mahiti', 1, 0, '2011-06-10 10:45:43'),
(4, 4, 'OUR BANK', 1, 4, 4, 'ourbank', 'ourbank', 1, 0, '2011-06-10 10:46:45');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_user_log`
--

INSERT INTO `ourbank_user_log` (`record_id`, `id`, `bank_id`, `name`, `gender`, `designation`, `department`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 3, 2, 'Prakash', 1, 4, 2, 'prakash', 'prakash', 1, 3, '2011-06-07 12:07:32'),
(2, 5, 1, 'eswara', 1, 1, 1, 'eshumanju', 'eshumanju', 1, 5, '2011-06-07 12:08:21'),
(3, 1, 5, 'admin', 1, 1, 1, 'admin', 'admin', 1, 1, '2011-06-10 10:45:15'),
(4, 2, 6, 'nataraj', 1, 1, 1, 'nataraj', 'nataraj', 1, 2, '2011-06-10 10:45:26'),
(5, 3, 7, 'mahiti', 1, 1, 4, 'mahiti', 'mahiti', 1, 3, '2011-06-10 10:45:43');
