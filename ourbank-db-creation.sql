-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 14, 2011 at 12:53 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `idf`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_accountfee`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_accounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_accounts`
--


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


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_agriculture`
--

CREATE TABLE IF NOT EXISTS `ourbank_agriculture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `landowner_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `land_id` int(11) NOT NULL,
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

--
-- Dumping data for table `ourbank_agriculture_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_Assets`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_attendance`
--

CREATE TABLE IF NOT EXISTS `ourbank_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_category`
--


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
  `code` int(16) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_family`
--


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
  `uid` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `breadwinner_id` tinyint(1) NOT NULL DEFAULT '0',
  `head_id` tinyint(1) NOT NULL DEFAULT '0',
  `gender_id` tinyint(1) NOT NULL,
  `dob` date NOT NULL,
  `age` tinyint(2) NOT NULL,
  `relationship_id` tinyint(2) NOT NULL,
  `physicalstatus_id` tinyint(20) NOT NULL,
  `maritalstatus_id` tinyint(2) NOT NULL,
  `eductaion_id` tinyint(4) NOT NULL,
  `profession_id` int(11) NOT NULL,
  `employment_status` int(11) NOT NULL,
  `entitlements` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cbo_member` int(11) NOT NULL DEFAULT '0',
  `bank` int(11) NOT NULL,
  `branch_po` int(11) NOT NULL,
  `bank_ac` tinyint(4) NOT NULL,
  `mobile_number` double NOT NULL DEFAULT '1',
  `blood_id` int(11) NOT NULL,
  `can_sign` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `photo` blob NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familymember`
--


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
  `uid` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
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
  `profession_id` int(11) NOT NULL,
  `entitlements` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cbo_member` int(11) NOT NULL DEFAULT '0',
  `bank` int(11) NOT NULL,
  `branch_po` int(11) NOT NULL,
  `bank_ac` tinyint(4) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `can_sign` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` double NOT NULL,
  `photo` blob NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familymember_log`
--


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
  `amountype_id` int(50) NOT NULL,
  `glsubcode_id` int(11) NOT NULL,
  `created_by` int(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_fee`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_feeamounttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_feeamounttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_feeamounttypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_feetype`
--

CREATE TABLE IF NOT EXISTS `ourbank_feetype` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_feetype`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_fee_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_fee_log` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_fee_log`
--


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
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ob_funders' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_funder`
--


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
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ob_funders' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_funder_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_funding`
--


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
  `accounting_line` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `beginingdate` date NOT NULL,
  `closingdate` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_funding_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_glcode`
--


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

--
-- Dumping data for table `ourbank_glcode_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_glsubcode`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_glsubcode_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_grant`
--


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_groupmembers`
--


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

--
-- Dumping data for table `ourbank_groupmembers_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_group_representatives`
--


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
  `suggestion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
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
  `suggestion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_insurance`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_interesttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_interesttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_interesttypes`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_interest_periods`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_interest_periods_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_jlgadvances`
--

CREATE TABLE IF NOT EXISTS `ourbank_jlgadvances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_formation` int(11) NOT NULL,
  `existloan` int(11) NOT NULL,
  `bankname` int(50) NOT NULL,
  `limitenjoy` int(100) NOT NULL,
  `account_number` int(11) NOT NULL,
  `date_advance` int(11) NOT NULL,
  `date_closure` int(11) NOT NULL,
  `total_members` int(11) NOT NULL,
  `debarred` int(100) NOT NULL,
  `periodical_meeting` int(11) NOT NULL,
  `bank_jlgarea` int(30) NOT NULL,
  `repayment_installment` int(11) NOT NULL,
  `interest_rate` int(11) NOT NULL,
  `application_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `existJLGmembers` int(11) NOT NULL,
  `declaration_member` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rotated_period` tinyint(4) NOT NULL,
  `jlgotherbank` tinyint(4) NOT NULL,
  `memberotherbank` tinyint(4) NOT NULL,
  `bclink` tinyint(4) NOT NULL,
  `statutory_requirement` tinyint(4) NOT NULL,
  `jlgmeetingfrom` date NOT NULL,
  `jlgmeetingto` date NOT NULL,
  `savingregisterfrom` date NOT NULL,
  `savingregisterto` date NOT NULL,
  `lendingregisterfrom` date NOT NULL,
  `lendingregisterto` date NOT NULL,
  `jlgpassbook` tinyint(4) NOT NULL,
  `totalsaving` int(11) NOT NULL,
  `totalinterest` int(11) NOT NULL,
  `revolvingfund` int(11) NOT NULL,
  `subsidy` int(11) NOT NULL,
  `totalcorpus` int(11) NOT NULL,
  `internallendamt` int(11) NOT NULL,
  `otherexpense` int(11) NOT NULL,
  `cashonhand` int(11) NOT NULL,
  `amountinbank` int(11) NOT NULL,
  `remarks` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_jlgadvances`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_Liabilities`
--


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
  `date_of_value` date NOT NULL,
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
  `date_of_value` date NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loanaccounts`
--


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
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_master_accountype`
--

INSERT INTO `ourbank_master_accountype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'No Frills', 0, '0000-00-00 00:00:00'),
(2, 'Post office', 0, '0000-00-00 00:00:00'),
(3, 'Savings', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_bank`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_bank` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_bank`
--

INSERT INTO `ourbank_master_bank` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'State Bank of India', 0, '0000-00-00 00:00:00'),
(2, 'State Bank of Mysore', 0, '0000-00-00 00:00:00'),
(3, 'Central Bank', 0, '0000-00-00 00:00:00'),
(4, 'IDF, Financial Services Pvt.Lt', 0, '0000-00-00 00:00:00'),
(5, 'None', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_bloodtype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_bloodtype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_bloodtype`
--

INSERT INTO `ourbank_master_bloodtype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'O−', 0, '0000-00-00 00:00:00'),
(2, 'O+', 0, '0000-00-00 00:00:00'),
(3, 'A−', 0, '0000-00-00 00:00:00'),
(4, 'A+', 0, '0000-00-00 00:00:00'),
(5, 'B−', 0, '0000-00-00 00:00:00'),
(6, 'B+', 0, '0000-00-00 00:00:00'),
(7, 'AB−', 0, '0000-00-00 00:00:00'),
(8, 'AB+', 0, '0000-00-00 00:00:00'),
(9, 'Not Known', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_branch`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_branch` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bank_id` smallint(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_branch`
--

INSERT INTO `ourbank_master_branch` (`id`, `bank_id`, `name`, `created_by`, `created_date`) VALUES
(1, 1, 'Hebbal', 0, '0000-00-00 00:00:00'),
(2, 2, 'Sriram Nagar', 0, '0000-00-00 00:00:00'),
(3, 3, 'Vidhya Nagar', 0, '0000-00-00 00:00:00'),
(4, 1, 'Ramamurthy Nagar', 0, '0000-00-00 00:00:00'),
(5, 2, 'Majestic', 0, '0000-00-00 00:00:00'),
(6, 5, 'None', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_businesstype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_businesstype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_businesstype`
--

INSERT INTO `ourbank_master_businesstype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Self-employed', 0, '0000-00-00 00:00:00'),
(2, 'Salaried - Regular', 0, '0000-00-00 00:00:00'),
(3, 'Salaried - Contract/Seasonal', 0, '0000-00-00 00:00:00'),
(4, 'Daily Wage', 0, '0000-00-00 00:00:00'),
(5, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_castetype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_castetype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_castetype`
--

INSERT INTO `ourbank_master_castetype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'SC', 0, '0000-00-00 00:00:00'),
(2, 'ST', 0, '0000-00-00 00:00:00'),
(3, 'OBC', 0, '0000-00-00 00:00:00'),
(4, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cbopromoter`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cbopromoter` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_cbopromoter`
--

INSERT INTO `ourbank_master_cbopromoter` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'IDF', 0, '0000-00-00 00:00:00'),
(2, 'Myrada', 0, '0000-00-00 00:00:00'),
(3, 'Dhan', 0, '0000-00-00 00:00:00'),
(4, 'None', 0, '0000-00-00 00:00:00'),
(5, 'Anganwadi', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cbos`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cbos` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cbopromoter_id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_cbos`
--

INSERT INTO `ourbank_master_cbos` (`id`, `cbopromoter_id`, `name`, `created_by`, `created_date`) VALUES
(1, 1, 'SHG', 0, '0000-00-00 00:00:00'),
(2, 5, 'Stree Shakti', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_check`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_check`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_cookingfuel`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_cookingfuel` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_cookingfuel`
--

INSERT INTO `ourbank_master_cookingfuel` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Wood', 0, '0000-00-00 00:00:00'),
(2, 'Cow Dung', 0, '0000-00-00 00:00:00'),
(3, 'Kerosene', 0, '0000-00-00 00:00:00'),
(4, 'Biogas', 0, '0000-00-00 00:00:00'),
(5, 'Electricity', 0, '0000-00-00 00:00:00'),
(6, 'LPG', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_countrylist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_countrylist` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currencyname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currencysymbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `currencyshortname` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `default` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_master_countrylist`
--

INSERT INTO `ourbank_master_countrylist` (`id`, `name`, `country_code`, `currencyname`, `currencysymbol`, `currencyshortname`, `timezone`, `default`) VALUES
(1, 'India', 'IND', 'Indian Rupee', 'Rs', 'Rupee', 'asia', '1'),
(2, 'America', 'USA', 'US Dollar', '$', 'USD', '', ''),
(3, 'Russia', 'USR', 'Rouble', 'RUB', 'RUB', '', ''),
(4, 'Japan', 'JAP', 'YEN', '¥', 'JPY', '', ''),
(5, 'South Africa', 'SA', 'ZAR', 'ZAR', 'ZAR', '', ''),
(6, 'United Kingdom', 'UK', 'Punds', '₤', 'GBP', '', ''),
(7, 'Brazil', 'BRZ', 'BRL', 'R$', 'Real', '', ''),
(8, 'France', 'FRN', 'EURO', '€', 'euro', '', ''),
(9, 'Germany', 'GRM', 'Deutsche Mark', 'DM', 'DM', '', ''),
(10, 'Qatar', 'QAT', 'Qatari Rial', 'Rial', 'Rial', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_crop`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_crop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_crop`
--

INSERT INTO `ourbank_master_crop` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Rice', 0, '0000-00-00 00:00:00'),
(2, 'Ragi', 0, '0000-00-00 00:00:00'),
(3, 'Corns', 0, '0000-00-00 00:00:00'),
(4, 'Sugar cane', 0, '0000-00-00 00:00:00'),
(5, 'Vegetables', 0, '0000-00-00 00:00:00'),
(6, 'Fruits', 0, '0000-00-00 00:00:00'),
(7, 'sunflower', 0, '0000-00-00 00:00:00'),
(8, 'coconut', 0, '0000-00-00 00:00:00'),
(9, 'paddy', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_currency`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_currency` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currencysymbol` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currencyshortname` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_department`
--

INSERT INTO `ourbank_master_department` (`id`, `name`) VALUES
(1, 'Administration'),
(2, 'Accounts'),
(3, 'Field staff'),
(4, 'Loan department');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_deposit`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_deposit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_deposit`
--

INSERT INTO `ourbank_master_deposit` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Banks', 0, '0000-00-00 00:00:00'),
(2, 'SHGs / CBOs', 0, '0000-00-00 00:00:00'),
(3, 'Chit Funds', 0, '0000-00-00 00:00:00'),
(4, 'MFI', 0, '0000-00-00 00:00:00'),
(5, 'Cooperative Banks', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_designation`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_designation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_designation`
--

INSERT INTO `ourbank_master_designation` (`id`, `name`, `department_id`) VALUES
(1, 'Manager', 1),
(2, 'Clerk', 2),
(3, 'Field officer', 3),
(4, 'Loan officer', 4),
(5, 'Block officer', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_diseasetypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_diseasetypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_master_diseasetypes`
--

INSERT INTO `ourbank_master_diseasetypes` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Immune system [viral and bacterial infections] ', 0, '0000-00-00 00:00:00'),
(2, 'Musculoskeletal(fractures,swelling,sprain,wound)', 0, '0000-00-00 00:00:00'),
(3, 'Cardiovascular (heart & blood circulation related)', 0, '0000-00-00 00:00:00'),
(4, 'Digestive system (Dental, Oesophageal, Gastrointes', 0, '0000-00-00 00:00:00'),
(5, 'Nervous system ', 0, '0000-00-00 00:00:00'),
(6, 'ENT (Ear, Nose, Throat, head related)', 0, '0000-00-00 00:00:00'),
(7, 'Ophthalmology (eye related)', 0, '0000-00-00 00:00:00'),
(8, 'Dermatology  (Skin related)', 0, '0000-00-00 00:00:00'),
(9, 'Urinary system', 0, '0000-00-00 00:00:00'),
(10, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_districtlist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_districtlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `ourbank_master_districtlist`
--

INSERT INTO `ourbank_master_districtlist` (`id`, `name`, `state_id`, `created_by`, `Created_date`) VALUES
(1, 'Bagalkot', 1, 0, '0000-00-00 00:00:00'),
(2, 'hosur', 2, 0, '0000-00-00 00:00:00'),
(3, 'Bangalore Urban', 1, 0, '0000-00-00 00:00:00'),
(4, 'Belagavi', 1, 0, '0000-00-00 00:00:00'),
(5, 'Bellary', 1, 0, '0000-00-00 00:00:00'),
(6, 'Bidar', 1, 0, '0000-00-00 00:00:00'),
(7, 'Bijapur', 1, 0, '0000-00-00 00:00:00'),
(8, 'Chamarajanagar', 1, 0, '0000-00-00 00:00:00'),
(9, 'Chikmagalur', 1, 0, '0000-00-00 00:00:00'),
(10, 'Chitradurga', 1, 0, '0000-00-00 00:00:00'),
(11, 'Dakshina Kannada', 1, 0, '0000-00-00 00:00:00'),
(12, 'Davanagere', 1, 0, '0000-00-00 00:00:00'),
(13, 'Dharwad', 1, 0, '0000-00-00 00:00:00'),
(14, 'Gadag', 1, 0, '0000-00-00 00:00:00'),
(15, 'Gulbarga', 1, 0, '0000-00-00 00:00:00'),
(16, 'Hassan', 1, 0, '0000-00-00 00:00:00'),
(17, 'Haveri', 1, 0, '0000-00-00 00:00:00'),
(18, 'Kodagu', 1, 0, '0000-00-00 00:00:00'),
(19, 'Kolar', 1, 0, '0000-00-00 00:00:00'),
(20, 'Koppal', 1, 0, '0000-00-00 00:00:00'),
(21, 'Mandya', 1, 0, '0000-00-00 00:00:00'),
(22, 'Mysore', 1, 0, '0000-00-00 00:00:00'),
(23, 'Raichur', 1, 0, '0000-00-00 00:00:00'),
(24, 'Shimoga', 1, 0, '0000-00-00 00:00:00'),
(25, 'Tumkur', 1, 0, '0000-00-00 00:00:00'),
(26, 'Udupi', 1, 0, '0000-00-00 00:00:00'),
(27, 'Uttara Kannada', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_districtlist-1`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_districtlist-1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `ourbank_master_districtlist-1`
--

INSERT INTO `ourbank_master_districtlist-1` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Alappanagudde', 0, '0000-00-00 00:00:00'),
(2, 'Ammanahatti', 0, '0000-00-00 00:00:00'),
(3, 'Amruthur', 0, '0000-00-00 00:00:00'),
(4, 'Beeraganahalli', 0, '0000-00-00 00:00:00'),
(5, 'Belligere', 0, '0000-00-00 00:00:00'),
(6, 'Benavara', 0, '0000-00-00 00:00:00'),
(7, 'Bettahalli', 0, '0000-00-00 00:00:00'),
(8, 'Bidarakattepalya ', 0, '0000-00-00 00:00:00'),
(9, 'Bilidevalaya', 0, '0000-00-00 00:00:00'),
(10, 'Bisinele', 0, '0000-00-00 00:00:00'),
(11, 'Boralinganapalya', 0, '0000-00-00 00:00:00'),
(12, 'Bydagere', 0, '0000-00-00 00:00:00'),
(13, 'Chandanahalli', 0, '0000-00-00 00:00:00'),
(14, 'Chikka Arjunahalli', 0, '0000-00-00 00:00:00'),
(15, 'Chottanahalli ', 0, '0000-00-00 00:00:00'),
(16, 'Choudarypalya', 0, '0000-00-00 00:00:00'),
(17, 'Devarakanasandra', 0, '0000-00-00 00:00:00'),
(18, 'Devarayanapalya', 0, '0000-00-00 00:00:00'),
(19, 'Doddakallahalli', 0, '0000-00-00 00:00:00'),
(20, 'Doddamadure', 0, '0000-00-00 00:00:00'),
(21, 'Dombarahatti', 0, '0000-00-00 00:00:00'),
(22, 'Gajjanapalya', 0, '0000-00-00 00:00:00'),
(23, 'Giriyappanapalya', 0, '0000-00-00 00:00:00'),
(24, 'Gollarahatti', 0, '0000-00-00 00:00:00'),
(25, 'Gowdagere', 0, '0000-00-00 00:00:00'),
(26, 'H.B.Shettihalli', 0, '0000-00-00 00:00:00'),
(27, 'Hadonahalli', 0, '0000-00-00 00:00:00'),
(28, 'Halagere', 0, '0000-00-00 00:00:00'),
(29, 'Hanchipura', 0, '0000-00-00 00:00:00'),
(30, 'Handalagere', 0, '0000-00-00 00:00:00'),
(31, 'Hanumapura', 0, '0000-00-00 00:00:00'),
(32, 'Heddigere', 0, '0000-00-00 00:00:00'),
(33, 'Helavarahatti', 0, '0000-00-00 00:00:00'),
(34, 'Holalagunda ', 0, '0000-00-00 00:00:00'),
(35, 'Hosahalli', 0, '0000-00-00 00:00:00'),
(36, 'Hosakere', 0, '0000-00-00 00:00:00'),
(37, 'Hosuru', 0, '0000-00-00 00:00:00'),
(38, 'Hulivana', 0, '0000-00-00 00:00:00'),
(39, 'Indiranagara', 0, '0000-00-00 00:00:00'),
(40, 'Jaladigere', 0, '0000-00-00 00:00:00'),
(41, 'Janatha Coloni', 0, '0000-00-00 00:00:00'),
(42, 'Jiddigere', 0, '0000-00-00 00:00:00'),
(43, 'Jinnaagara', 0, '0000-00-00 00:00:00'),
(44, 'Jivajihatti', 0, '0000-00-00 00:00:00'),
(45, 'Kadashettihalli', 0, '0000-00-00 00:00:00'),
(46, 'Kagganahalli', 0, '0000-00-00 00:00:00'),
(47, 'Kaggere', 0, '0000-00-00 00:00:00'),
(48, 'Kalasegowdanapalya', 0, '0000-00-00 00:00:00'),
(49, 'Kanchagalapura', 0, '0000-00-00 00:00:00'),
(50, 'Kannaguni', 0, '0000-00-00 00:00:00'),
(51, 'Kantanahalli', 0, '0000-00-00 00:00:00'),
(52, 'Kattigehalli', 0, '0000-00-00 00:00:00'),
(53, 'KH halli', 0, '0000-00-00 00:00:00'),
(54, 'Kiranguru', 0, '0000-00-00 00:00:00'),
(55, 'Kittaghatta', 0, '0000-00-00 00:00:00'),
(56, 'Kodipalya', 0, '0000-00-00 00:00:00'),
(57, 'Koppa', 0, '0000-00-00 00:00:00'),
(58, 'Korati', 0, '0000-00-00 00:00:00'),
(59, 'Kottegere', 0, '0000-00-00 00:00:00'),
(60, 'Kuppe', 0, '0000-00-00 00:00:00'),
(61, 'kuvempunagar', 0, '0000-00-00 00:00:00'),
(62, 'Madihalli', 0, '0000-00-00 00:00:00'),
(63, 'Madihalli', 0, '0000-00-00 00:00:00'),
(64, 'Madurepalya', 0, '0000-00-00 00:00:00'),
(65, 'Mallapura', 0, '0000-00-00 00:00:00'),
(66, 'Mantya', 0, '0000-00-00 00:00:00'),
(67, 'Markonahalli', 0, '0000-00-00 00:00:00'),
(68, 'Megala Tenginmaradapalya', 0, '0000-00-00 00:00:00'),
(69, 'Megalaplya', 0, '0000-00-00 00:00:00'),
(70, 'Muttugadahalli', 0, '0000-00-00 00:00:00'),
(71, 'Muttugadahalli', 0, '0000-00-00 00:00:00'),
(72, 'Nagasandra', 0, '0000-00-00 00:00:00'),
(73, 'Nagegowdanapalya', 0, '0000-00-00 00:00:00'),
(74, 'Paduvagere', 0, '0000-00-00 00:00:00'),
(75, 'Pallerayanahalli', 0, '0000-00-00 00:00:00'),
(76, 'Puttanapalya', 0, '0000-00-00 00:00:00'),
(77, 'Rangegoudanapalya', 0, '0000-00-00 00:00:00'),
(78, 'Renukanagara', 0, '0000-00-00 00:00:00'),
(79, 'Sanaba', 0, '0000-00-00 00:00:00'),
(80, 'Sanabagatta', 0, '0000-00-00 00:00:00'),
(81, 'Shanuboganahalli', 0, '0000-00-00 00:00:00'),
(82, 'Shattihalli', 0, '0000-00-00 00:00:00'),
(83, 'Shettibidu', 0, '0000-00-00 00:00:00'),
(84, 'Siddapura ', 0, '0000-00-00 00:00:00'),
(85, 'Singatihalli', 0, '0000-00-00 00:00:00'),
(86, 'Sondekoppa', 0, '0000-00-00 00:00:00'),
(87, 'Tenginamaradapalya', 0, '0000-00-00 00:00:00'),
(88, 'Thathayyanapalya', 0, '0000-00-00 00:00:00'),
(89, 'Thippur', 0, '0000-00-00 00:00:00'),
(90, 'Timmegowdanapalya', 0, '0000-00-00 00:00:00'),
(91, 'Tippuru', 0, '0000-00-00 00:00:00'),
(92, 'Tubinakere', 0, '0000-00-00 00:00:00'),
(93, 'Turuganuru', 0, '0000-00-00 00:00:00'),
(94, 'Ungara', 0, '0000-00-00 00:00:00'),
(95, 'Urkehalli', 0, '0000-00-00 00:00:00'),
(96, 'Valagerepura', 0, '0000-00-00 00:00:00'),
(97, 'Venkategowdanapalya', 0, '0000-00-00 00:00:00'),
(98, 'Y.Hampapura', 0, '0000-00-00 00:00:00'),
(99, 'Yachanahalli', 0, '0000-00-00 00:00:00'),
(100, 'Yadavani', 0, '0000-00-00 00:00:00'),
(101, 'Yadiyur', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_educationtype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_educationtype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ourbank_master_educationtype`
--

INSERT INTO `ourbank_master_educationtype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Illiterate', 0, '0000-00-00 00:00:00'),
(2, 'Literate (Without Educational ', 0, '0000-00-00 00:00:00'),
(3, 'Matriculation/SSLC', 0, '0000-00-00 00:00:00'),
(4, 'Pre- University', 0, '0000-00-00 00:00:00'),
(5, 'ITI/Certificate', 0, '0000-00-00 00:00:00'),
(6, 'Diploma in Engineering', 0, '0000-00-00 00:00:00'),
(7, 'Graduate', 0, '0000-00-00 00:00:00'),
(8, 'Post Graduate', 0, '0000-00-00 00:00:00'),
(9, 'Others', 0, '0000-00-00 00:00:00'),
(10, 'Primary', 0, '0000-00-00 00:00:00'),
(11, 'Middle', 0, '0000-00-00 00:00:00'),
(12, 'High', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_employmenttype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_employmenttype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_employmenttype`
--

INSERT INTO `ourbank_master_employmenttype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Self-Employed', 0, '0000-00-00 00:00:00'),
(2, 'Employed', 0, '0000-00-00 00:00:00'),
(3, 'Housewife/within house worker', 0, '0000-00-00 00:00:00'),
(4, 'Unemployed', 0, '0000-00-00 00:00:00'),
(5, 'Student', 0, '0000-00-00 00:00:00'),
(6, 'Student out of school/discontinued', 0, '0000-00-00 00:00:00'),
(7, 'Retired', 0, '0000-00-00 00:00:00'),
(8, 'Disabled', 0, '0000-00-00 00:00:00'),
(9, 'None', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_entitlements`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_entitlements` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_entitlements`
--

INSERT INTO `ourbank_master_entitlements` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'None', 0, '0000-00-00 00:00:00'),
(2, 'Widow pension', 0, '0000-00-00 00:00:00'),
(3, 'Physically handicapped pension', 0, '0000-00-00 00:00:00'),
(4, 'Old Age pension', 0, '0000-00-00 00:00:00'),
(5, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_expense`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ourbank_master_expense`
--

INSERT INTO `ourbank_master_expense` (`id`, `name`) VALUES
(1, 'Festivals'),
(2, 'Clothes'),
(3, 'crops expense'),
(4, 'Expense of the grossary'),
(5, 'Expense of the vegetables'),
(6, 'Expense of the transport'),
(7, 'interest on loans'),
(8, 'Educational expenses'),
(9, 'Fuel'),
(10, 'Habbits'),
(11, 'Phone/Mobile'),
(12, 'Others'),
(13, 'Summer agriculture expense'),
(14, 'Rabi agricultural expenses'),
(15, 'expenses of the animal husband'),
(16, 'Medical expenses ');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familyexpense`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familyexpense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_master_familyexpense`
--

INSERT INTO `ourbank_master_familyexpense` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Festivals', 0, '0000-00-00 00:00:00'),
(2, 'Clothes', 0, '0000-00-00 00:00:00'),
(3, 'crops expense', 0, '0000-00-00 00:00:00'),
(4, 'Expense of the grossary', 0, '0000-00-00 00:00:00'),
(5, 'Expense of the vegetables', 0, '0000-00-00 00:00:00'),
(6, 'Expense of the transport', 0, '0000-00-00 00:00:00'),
(7, 'interest on loans', 0, '0000-00-00 00:00:00'),
(8, 'Educational expenses', 0, '0000-00-00 00:00:00'),
(9, 'Fuel', 0, '0000-00-00 00:00:00'),
(10, 'Habbits', 0, '0000-00-00 00:00:00'),
(11, 'Phone/Mobile', 0, '0000-00-00 00:00:00'),
(12, 'Others', 0, '0000-00-00 00:00:00'),
(13, 'Summer agriculture expense', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familyincome`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familyincome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_familyincome`
--

INSERT INTO `ourbank_master_familyincome` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'rabi agricultural income', 0, '0000-00-00 00:00:00'),
(2, 'kharif agricultural income', 0, '0000-00-00 00:00:00'),
(3, 'summer agricultural income', 0, '0000-00-00 00:00:00'),
(4, 'perrinial crops income', 0, '0000-00-00 00:00:00'),
(5, 'diary/goat/sheep/poultry incom', 0, '0000-00-00 00:00:00'),
(6, 'wages', 0, '0000-00-00 00:00:00'),
(7, 'sub callings', 0, '0000-00-00 00:00:00'),
(8, 'employment', 0, '0000-00-00 00:00:00'),
(9, 'others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familytype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familytype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_familytype`
--

INSERT INTO `ourbank_master_familytype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Nuclear/Small Family', 0, '0000-00-00 00:00:00'),
(2, 'Joint Family', 0, '0000-00-00 00:00:00'),
(3, 'Nuclear Family', 0, '0000-00-00 00:00:00'),
(4, 'Neuclier', 0, '0000-00-00 00:00:00');

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
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_fundertype`
--

INSERT INTO `ourbank_master_fundertype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Individual', 0, '0000-00-00 00:00:00'),
(2, 'Organization', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_gender`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_gender`
--

INSERT INTO `ourbank_master_gender` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_gillapanchayath`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_gillapanchayath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hobli_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=176 ;

--
-- Dumping data for table `ourbank_master_gillapanchayath`
--

INSERT INTO `ourbank_master_gillapanchayath` (`id`, `name`, `hobli_id`, `created_by`, `Created_date`) VALUES
(1, 'Bagalkot', 1, 0, '0000-00-00 00:00:00'),
(2, 'Jamkhandi', 1, 0, '0000-00-00 00:00:00'),
(3, 'Mudhol', 1, 0, '0000-00-00 00:00:00'),
(4, 'Badami', 1, 0, '0000-00-00 00:00:00'),
(5, 'Bilgi', 1, 0, '0000-00-00 00:00:00'),
(6, 'Hungund', 1, 0, '0000-00-00 00:00:00'),
(7, 'Channapatna', 2, 0, '0000-00-00 00:00:00'),
(8, 'Dod Ballapur', 2, 0, '0000-00-00 00:00:00'),
(9, 'Ramanagaram', 2, 0, '0000-00-00 00:00:00'),
(10, 'Devanhalli', 2, 0, '0000-00-00 00:00:00'),
(11, 'Hoskote', 2, 0, '0000-00-00 00:00:00'),
(12, 'Kanakapura', 2, 0, '0000-00-00 00:00:00'),
(13, 'Magadi', 2, 0, '0000-00-00 00:00:00'),
(14, 'Nelmangala', 2, 0, '0000-00-00 00:00:00'),
(15, 'Anekal', 3, 0, '0000-00-00 00:00:00'),
(16, 'Bangalore North', 3, 0, '0000-00-00 00:00:00'),
(17, 'Bangalore South', 3, 0, '0000-00-00 00:00:00'),
(18, 'Uttarhalli', 3, 0, '0000-00-00 00:00:00'),
(19, 'Athni', 4, 0, '0000-00-00 00:00:00'),
(20, 'Bailahongal', 4, 0, '0000-00-00 00:00:00'),
(21, 'Belgaum', 4, 0, '0000-00-00 00:00:00'),
(22, 'Chikodi', 4, 0, '0000-00-00 00:00:00'),
(23, 'Gokak', 4, 0, '0000-00-00 00:00:00'),
(24, 'Hukkeri', 4, 0, '0000-00-00 00:00:00'),
(25, 'Khanapur', 4, 0, '0000-00-00 00:00:00'),
(26, 'Raybag', 4, 0, '0000-00-00 00:00:00'),
(27, 'Ramdurg', 4, 0, '0000-00-00 00:00:00'),
(28, 'Saundatti', 4, 0, '0000-00-00 00:00:00'),
(29, 'Bellary', 5, 0, '0000-00-00 00:00:00'),
(30, 'Hospet', 5, 0, '0000-00-00 00:00:00'),
(31, 'Kampli', 5, 0, '0000-00-00 00:00:00'),
(32, 'Hoovina Hadagalli', 5, 0, '0000-00-00 00:00:00'),
(33, 'Kudligi', 5, 0, '0000-00-00 00:00:00'),
(34, 'Sanduru', 5, 0, '0000-00-00 00:00:00'),
(35, 'Siruguppa', 5, 0, '0000-00-00 00:00:00'),
(36, 'Bidar', 6, 0, '0000-00-00 00:00:00'),
(37, 'Basavakalyan', 6, 0, '0000-00-00 00:00:00'),
(38, 'Bhalki', 6, 0, '0000-00-00 00:00:00'),
(39, 'Homnabad', 6, 0, '0000-00-00 00:00:00'),
(40, 'Aurad', 6, 0, '0000-00-00 00:00:00'),
(41, 'Bijapur', 7, 0, '0000-00-00 00:00:00'),
(42, 'Indi', 7, 0, '0000-00-00 00:00:00'),
(43, 'Muddebihal', 7, 0, '0000-00-00 00:00:00'),
(44, 'Sindgi', 7, 0, '0000-00-00 00:00:00'),
(45, 'Basavana Bagevadi', 7, 0, '0000-00-00 00:00:00'),
(46, 'Chamrajnagar', 8, 0, '0000-00-00 00:00:00'),
(47, 'Gundlupet', 8, 0, '0000-00-00 00:00:00'),
(48, 'Kollegal', 8, 0, '0000-00-00 00:00:00'),
(49, 'Yelandur', 8, 0, '0000-00-00 00:00:00'),
(50, 'Chikmagalur', 9, 0, '0000-00-00 00:00:00'),
(51, 'Kadur', 9, 0, '0000-00-00 00:00:00'),
(52, 'Koppa', 9, 0, '0000-00-00 00:00:00'),
(53, 'Mudigere', 9, 0, '0000-00-00 00:00:00'),
(54, 'Narasimharajapura', 9, 0, '0000-00-00 00:00:00'),
(55, 'Sringeri', 9, 0, '0000-00-00 00:00:00'),
(56, 'Tarikere', 9, 0, '0000-00-00 00:00:00'),
(57, 'Chitradurga', 10, 0, '0000-00-00 00:00:00'),
(58, 'Challakere', 10, 0, '0000-00-00 00:00:00'),
(59, 'Hiriyur', 10, 0, '0000-00-00 00:00:00'),
(60, 'Holalkere', 10, 0, '0000-00-00 00:00:00'),
(61, 'Hosdurga', 10, 0, '0000-00-00 00:00:00'),
(62, 'Molakalmuru', 10, 0, '0000-00-00 00:00:00'),
(63, 'Mangalore', 11, 0, '0000-00-00 00:00:00'),
(64, 'Puttur', 11, 0, '0000-00-00 00:00:00'),
(65, 'Bantwal', 11, 0, '0000-00-00 00:00:00'),
(66, 'Beltangadi', 11, 0, '0000-00-00 00:00:00'),
(67, 'Sulya', 11, 0, '0000-00-00 00:00:00'),
(68, 'Davanagere', 12, 0, '0000-00-00 00:00:00'),
(69, 'Harihar', 12, 0, '0000-00-00 00:00:00'),
(70, 'Channagiri', 12, 0, '0000-00-00 00:00:00'),
(71, 'Harpanahalli', 12, 0, '0000-00-00 00:00:00'),
(72, 'Honnali', 12, 0, '0000-00-00 00:00:00'),
(73, 'Jagalur', 12, 0, '0000-00-00 00:00:00'),
(74, 'Hubli-Dharwad', 13, 0, '0000-00-00 00:00:00'),
(75, 'Kalghatgi', 13, 0, '0000-00-00 00:00:00'),
(76, 'Kundgol', 13, 0, '0000-00-00 00:00:00'),
(77, 'Navalgund', 13, 0, '0000-00-00 00:00:00'),
(78, 'Gadag-Betigeri', 14, 0, '0000-00-00 00:00:00'),
(79, 'Nargund', 14, 0, '0000-00-00 00:00:00'),
(80, 'Mundargi', 14, 0, '0000-00-00 00:00:00'),
(81, 'Ron', 14, 0, '0000-00-00 00:00:00'),
(82, 'Shirhatti', 14, 0, '0000-00-00 00:00:00'),
(83, 'Gulbarga', 15, 0, '0000-00-00 00:00:00'),
(84, 'Aland', 15, 0, '0000-00-00 00:00:00'),
(85, 'Sedam', 15, 0, '0000-00-00 00:00:00'),
(86, 'Shahpur', 15, 0, '0000-00-00 00:00:00'),
(87, 'Shorapur', 15, 0, '0000-00-00 00:00:00'),
(88, 'Yadgir', 15, 0, '0000-00-00 00:00:00'),
(89, 'Afzalpur', 15, 0, '0000-00-00 00:00:00'),
(90, 'Chincholi', 15, 0, '0000-00-00 00:00:00'),
(91, 'Chitapur', 15, 0, '0000-00-00 00:00:00'),
(92, 'Jevargi', 15, 0, '0000-00-00 00:00:00'),
(93, 'Hassan', 16, 0, '0000-00-00 00:00:00'),
(94, 'Arsikere', 16, 0, '0000-00-00 00:00:00'),
(95, 'Channarayapattana', 16, 0, '0000-00-00 00:00:00'),
(96, 'Holenarsipur', 16, 0, '0000-00-00 00:00:00'),
(97, 'Sakleshpur', 16, 0, '0000-00-00 00:00:00'),
(98, 'Alur', 16, 0, '0000-00-00 00:00:00'),
(99, 'Arkalgud', 16, 0, '0000-00-00 00:00:00'),
(100, 'Belur', 16, 0, '0000-00-00 00:00:00'),
(101, 'Ranibennur', 17, 0, '0000-00-00 00:00:00'),
(102, 'Byadgi', 17, 0, '0000-00-00 00:00:00'),
(103, 'Hangal', 17, 0, '0000-00-00 00:00:00'),
(104, 'Haveri', 17, 0, '0000-00-00 00:00:00'),
(105, 'Savanur', 17, 0, '0000-00-00 00:00:00'),
(106, 'Hirekerur', 17, 0, '0000-00-00 00:00:00'),
(107, 'Shiggaon', 17, 0, '0000-00-00 00:00:00'),
(108, 'Madikeri', 18, 0, '0000-00-00 00:00:00'),
(109, 'Somvarpet', 18, 0, '0000-00-00 00:00:00'),
(110, 'Virajpet', 18, 0, '0000-00-00 00:00:00'),
(111, 'Chik Ballapur', 19, 0, '0000-00-00 00:00:00'),
(112, 'Chintamani', 19, 0, '0000-00-00 00:00:00'),
(113, 'Kolar', 19, 0, '0000-00-00 00:00:00'),
(114, 'Bangarapet', 19, 0, '0000-00-00 00:00:00'),
(115, 'Gauribidanur', 19, 0, '0000-00-00 00:00:00'),
(116, 'Malur', 19, 0, '0000-00-00 00:00:00'),
(117, 'Mulbagal', 19, 0, '0000-00-00 00:00:00'),
(118, 'Sidlaghatta', 19, 0, '0000-00-00 00:00:00'),
(119, 'Bagepalli', 19, 0, '0000-00-00 00:00:00'),
(120, 'Gudibanda', 19, 0, '0000-00-00 00:00:00'),
(121, 'Srinivaspur', 19, 0, '0000-00-00 00:00:00'),
(122, 'Gangawati', 20, 0, '0000-00-00 00:00:00'),
(123, 'Koppal', 20, 0, '0000-00-00 00:00:00'),
(124, 'Kushtagi', 20, 0, '0000-00-00 00:00:00'),
(125, 'Yelbarga', 20, 0, '0000-00-00 00:00:00'),
(126, 'Mandya', 21, 0, '0000-00-00 00:00:00'),
(127, 'Maddur', 21, 0, '0000-00-00 00:00:00'),
(128, 'Malavalli', 21, 0, '0000-00-00 00:00:00'),
(129, 'Shrirangapattana', 21, 0, '0000-00-00 00:00:00'),
(130, 'Krishnarajpet', 21, 0, '0000-00-00 00:00:00'),
(131, 'Nagamangala', 21, 0, '0000-00-00 00:00:00'),
(132, 'Pandavapura', 21, 0, '0000-00-00 00:00:00'),
(133, 'Mysore', 22, 0, '0000-00-00 00:00:00'),
(134, 'Hunsur', 22, 0, '0000-00-00 00:00:00'),
(135, 'Krishnarajanagar', 22, 0, '0000-00-00 00:00:00'),
(136, 'Nanjangud', 22, 0, '0000-00-00 00:00:00'),
(137, 'Heggadadevanakote', 22, 0, '0000-00-00 00:00:00'),
(138, 'Piriyapatna', 22, 0, '0000-00-00 00:00:00'),
(139, 'Tirumakudal-Narsipur', 22, 0, '0000-00-00 00:00:00'),
(140, 'Raichur', 23, 0, '0000-00-00 00:00:00'),
(141, 'Manvi', 23, 0, '0000-00-00 00:00:00'),
(142, 'Sindhnur', 23, 0, '0000-00-00 00:00:00'),
(143, 'Devadurga', 23, 0, '0000-00-00 00:00:00'),
(144, 'Lingsugur', 23, 0, '0000-00-00 00:00:00'),
(145, 'Bhadravati', 24, 0, '0000-00-00 00:00:00'),
(146, 'Shimoga', 24, 0, '0000-00-00 00:00:00'),
(147, 'Sagar', 24, 0, '0000-00-00 00:00:00'),
(148, 'Hosanagara', 24, 0, '0000-00-00 00:00:00'),
(149, 'Shikaripura', 24, 0, '0000-00-00 00:00:00'),
(150, 'Sorab', 24, 0, '0000-00-00 00:00:00'),
(151, 'Tirthahalli', 24, 0, '0000-00-00 00:00:00'),
(152, 'Tumkur', 25, 0, '0000-00-00 00:00:00'),
(153, 'Chiknayakanhalli', 25, 0, '0000-00-00 00:00:00'),
(154, 'Kunigal', 25, 0, '0000-00-00 00:00:00'),
(155, 'Madhugiri', 25, 0, '0000-00-00 00:00:00'),
(156, 'Sira', 25, 0, '0000-00-00 00:00:00'),
(157, 'Tiptur', 25, 0, '0000-00-00 00:00:00'),
(158, 'Gubbi', 25, 0, '0000-00-00 00:00:00'),
(159, 'Koratagere', 25, 0, '0000-00-00 00:00:00'),
(160, 'Pavagada', 25, 0, '0000-00-00 00:00:00'),
(161, 'Turuvekere', 25, 0, '0000-00-00 00:00:00'),
(162, 'Udupi', 26, 0, '0000-00-00 00:00:00'),
(163, 'Karkal', 26, 0, '0000-00-00 00:00:00'),
(164, 'Kundapura', 26, 0, '0000-00-00 00:00:00'),
(165, 'Karwar', 27, 0, '0000-00-00 00:00:00'),
(166, 'Sirsi', 27, 0, '0000-00-00 00:00:00'),
(167, 'Joida', 27, 0, '0000-00-00 00:00:00'),
(168, 'Dandeli', 27, 0, '0000-00-00 00:00:00'),
(169, 'Bhatkal', 27, 0, '0000-00-00 00:00:00'),
(170, 'Kumta', 27, 0, '0000-00-00 00:00:00'),
(171, 'Ankola', 27, 0, '0000-00-00 00:00:00'),
(172, 'Haliyal', 27, 0, '0000-00-00 00:00:00'),
(173, 'Honavar', 27, 0, '0000-00-00 00:00:00'),
(174, 'Mundgod', 27, 0, '0000-00-00 00:00:00'),
(175, 'Siddapur', 27, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_habit`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_habit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_habit`
--

INSERT INTO `ourbank_master_habit` (`id`, `name`) VALUES
(1, 'None'),
(2, 'Drinking'),
(3, 'Tobacco'),
(4, 'others'),
(5, 'Smoking');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_habitation`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_habitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `village_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=109 ;

--
-- Dumping data for table `ourbank_master_habitation`
--

INSERT INTO `ourbank_master_habitation` (`id`, `name`, `village_id`, `created_by`, `created_date`) VALUES
(1, 'Alappanagudde', 0, 0, '0000-00-00 00:00:00'),
(2, 'Ammanahatti', 0, 0, '0000-00-00 00:00:00'),
(3, 'Amruthur', 0, 0, '0000-00-00 00:00:00'),
(4, 'Beeraganahalli', 0, 0, '0000-00-00 00:00:00'),
(5, 'Belligere', 0, 0, '0000-00-00 00:00:00'),
(6, 'Benavara', 0, 0, '0000-00-00 00:00:00'),
(7, 'Bettahalli', 0, 0, '0000-00-00 00:00:00'),
(8, 'Bidarakattepalya ', 0, 0, '0000-00-00 00:00:00'),
(9, 'Bilidevalaya', 0, 0, '0000-00-00 00:00:00'),
(10, 'Bisinele', 0, 0, '0000-00-00 00:00:00'),
(11, 'Boralinganapalya', 0, 0, '0000-00-00 00:00:00'),
(12, 'Bydagere', 0, 0, '0000-00-00 00:00:00'),
(13, 'Chandanahalli', 0, 0, '0000-00-00 00:00:00'),
(14, 'Chikka Arjunahalli', 0, 0, '0000-00-00 00:00:00'),
(15, 'Chottanahalli ', 0, 0, '0000-00-00 00:00:00'),
(16, 'Choudarypalya', 0, 0, '0000-00-00 00:00:00'),
(17, 'Devarakanasandra', 0, 0, '0000-00-00 00:00:00'),
(18, 'Devarayanapalya', 0, 0, '0000-00-00 00:00:00'),
(19, 'Doddakallahalli', 0, 0, '0000-00-00 00:00:00'),
(20, 'Doddamadure', 0, 0, '0000-00-00 00:00:00'),
(21, 'Dombarahatti', 0, 0, '0000-00-00 00:00:00'),
(22, 'Gajjanapalya', 0, 0, '0000-00-00 00:00:00'),
(23, 'Giriyappanapalya', 0, 0, '0000-00-00 00:00:00'),
(24, 'Gollarahatti', 0, 0, '0000-00-00 00:00:00'),
(25, 'Gowdagere', 0, 0, '0000-00-00 00:00:00'),
(26, 'H.B.Shettihalli', 0, 0, '0000-00-00 00:00:00'),
(27, 'Hadonahalli', 0, 0, '0000-00-00 00:00:00'),
(28, 'Halagere', 0, 0, '0000-00-00 00:00:00'),
(29, 'Hanchipura', 0, 0, '0000-00-00 00:00:00'),
(30, 'Handalagere', 0, 0, '0000-00-00 00:00:00'),
(31, 'Hanumapura', 0, 0, '0000-00-00 00:00:00'),
(32, 'Heddigere', 0, 0, '0000-00-00 00:00:00'),
(33, 'Helavarahatti', 0, 0, '0000-00-00 00:00:00'),
(34, 'Holalagunda ', 0, 0, '0000-00-00 00:00:00'),
(35, 'Hosahalli', 0, 0, '0000-00-00 00:00:00'),
(36, 'Hosakere', 0, 0, '0000-00-00 00:00:00'),
(37, 'Hosuru', 0, 0, '0000-00-00 00:00:00'),
(38, 'Hulivana', 0, 0, '0000-00-00 00:00:00'),
(39, 'Indiranagara', 0, 0, '0000-00-00 00:00:00'),
(40, 'Jaladigere', 0, 0, '0000-00-00 00:00:00'),
(41, 'Janatha Coloni', 0, 0, '0000-00-00 00:00:00'),
(42, 'Jiddigere', 0, 0, '0000-00-00 00:00:00'),
(43, 'Jinnaagara', 0, 0, '0000-00-00 00:00:00'),
(44, 'Jivajihatti', 0, 0, '0000-00-00 00:00:00'),
(45, 'Kadashettihalli', 0, 0, '0000-00-00 00:00:00'),
(46, 'Kagganahalli', 0, 0, '0000-00-00 00:00:00'),
(47, 'Kaggere', 0, 0, '0000-00-00 00:00:00'),
(48, 'Kalasegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(49, 'Kanchagalapura', 0, 0, '0000-00-00 00:00:00'),
(50, 'Kannaguni', 0, 0, '0000-00-00 00:00:00'),
(51, 'Kantanahalli', 0, 0, '0000-00-00 00:00:00'),
(52, 'Kattigehalli', 0, 0, '0000-00-00 00:00:00'),
(53, 'KH halli', 0, 0, '0000-00-00 00:00:00'),
(54, 'Kiranguru', 0, 0, '0000-00-00 00:00:00'),
(55, 'Kittaghatta', 0, 0, '0000-00-00 00:00:00'),
(56, 'Kodipalya', 0, 0, '0000-00-00 00:00:00'),
(57, 'Koppa', 0, 0, '0000-00-00 00:00:00'),
(58, 'Korati', 0, 0, '0000-00-00 00:00:00'),
(59, 'Kottegere', 0, 0, '0000-00-00 00:00:00'),
(60, 'Kuppe', 0, 0, '0000-00-00 00:00:00'),
(61, 'kuvempunagar', 0, 0, '0000-00-00 00:00:00'),
(62, 'Madihalli', 0, 0, '0000-00-00 00:00:00'),
(63, 'Madihalli', 0, 0, '0000-00-00 00:00:00'),
(64, 'Madurepalya', 0, 0, '0000-00-00 00:00:00'),
(65, 'Mallapura', 0, 0, '0000-00-00 00:00:00'),
(66, 'Mantya', 0, 0, '0000-00-00 00:00:00'),
(67, 'Markonahalli', 0, 0, '0000-00-00 00:00:00'),
(68, 'Megala Tenginmaradapalya', 0, 0, '0000-00-00 00:00:00'),
(69, 'Megalaplya', 0, 0, '0000-00-00 00:00:00'),
(70, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(71, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(72, 'Nagasandra', 0, 0, '0000-00-00 00:00:00'),
(73, 'Nagegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(74, 'Paduvagere', 0, 0, '0000-00-00 00:00:00'),
(75, 'Pallerayanahalli', 0, 0, '0000-00-00 00:00:00'),
(76, 'Puttanapalya', 0, 0, '0000-00-00 00:00:00'),
(77, 'Rangegoudanapalya', 0, 0, '0000-00-00 00:00:00'),
(78, 'Renukanagara', 0, 0, '0000-00-00 00:00:00'),
(79, 'Sanaba', 0, 0, '0000-00-00 00:00:00'),
(80, 'Sanabagatta', 0, 0, '0000-00-00 00:00:00'),
(81, 'Shanuboganahalli', 0, 0, '0000-00-00 00:00:00'),
(82, 'Shattihalli', 0, 0, '0000-00-00 00:00:00'),
(83, 'Shettibidu', 0, 0, '0000-00-00 00:00:00'),
(84, 'Siddapura ', 0, 0, '0000-00-00 00:00:00'),
(85, 'Singatihalli', 0, 0, '0000-00-00 00:00:00'),
(86, 'Sondekoppa', 0, 0, '0000-00-00 00:00:00'),
(87, 'Tenginamaradapalya', 0, 0, '0000-00-00 00:00:00'),
(88, 'Thathayyanapalya', 0, 0, '0000-00-00 00:00:00'),
(89, 'Thippur', 0, 0, '0000-00-00 00:00:00'),
(90, 'Timmegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(91, 'Tippuru', 0, 0, '0000-00-00 00:00:00'),
(92, 'Tubinakere', 0, 0, '0000-00-00 00:00:00'),
(93, 'Turuganuru', 0, 0, '0000-00-00 00:00:00'),
(94, 'Ungara', 0, 0, '0000-00-00 00:00:00'),
(95, 'Urkehalli', 0, 0, '0000-00-00 00:00:00'),
(96, 'Valagerepura', 0, 0, '0000-00-00 00:00:00'),
(97, 'Venkategowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(98, 'Y.Hampapura', 0, 0, '0000-00-00 00:00:00'),
(99, 'Yachanahalli', 0, 0, '0000-00-00 00:00:00'),
(100, 'Yadavani', 0, 0, '0000-00-00 00:00:00'),
(101, 'Yadiyur', 0, 0, '0000-00-00 00:00:00'),
(102, 'kodanahalli', 0, 1, '2011-02-14 16:18:16'),
(103, 'village1', 0, 1, '2011-02-24 20:22:43'),
(104, 'Jalahalli', 0, 1, '2011-02-28 16:15:43'),
(105, 'Goravana halli', 0, 1, '2011-02-28 16:16:43'),
(106, 'Kurubara halli ', 0, 1, '2011-02-28 16:17:03'),
(107, 'Gutta halli', 0, 1, '2011-02-28 16:17:31'),
(108, 'Kammana halli', 0, 1, '2011-03-25 13:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_hoblilist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_hoblilist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `taluk_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_hoblilist`
--

INSERT INTO `ourbank_master_hoblilist` (`id`, `name`, `taluk_id`, `created_by`, `created_date`) VALUES
(1, 'Kunigal Hobli-1', 154, 1, '2011-05-10 13:44:42'),
(2, 'Kunigal Hobli-2', 154, 1, '2011-05-10 13:45:03'),
(3, 'Gubbi hobli - 3', 158, 1, '2011-05-10 13:48:31'),
(4, 'Gubbi hobli - 4', 158, 1, '2011-05-10 13:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_hoblilist1`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_hoblilist1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `taluk_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `ourbank_master_hoblilist1`
--

INSERT INTO `ourbank_master_hoblilist1` (`id`, `name`, `taluk_id`, `created_by`, `created_date`) VALUES
(1, 'Alappanagudde', 1, 0, '0000-00-00 00:00:00'),
(2, 'Ammanahatti', 0, 0, '0000-00-00 00:00:00'),
(3, 'Amruthur', 0, 0, '0000-00-00 00:00:00'),
(4, 'Beeraganahalli', 0, 0, '0000-00-00 00:00:00'),
(5, 'Belligere', 0, 0, '0000-00-00 00:00:00'),
(6, 'Benavara', 0, 0, '0000-00-00 00:00:00'),
(7, 'Bettahalli', 0, 0, '0000-00-00 00:00:00'),
(8, 'Bidarakattepalya ', 0, 0, '0000-00-00 00:00:00'),
(9, 'Bilidevalaya', 0, 0, '0000-00-00 00:00:00'),
(10, 'Bisinele', 0, 0, '0000-00-00 00:00:00'),
(11, 'Boralinganapalya', 0, 0, '0000-00-00 00:00:00'),
(12, 'Bydagere', 0, 0, '0000-00-00 00:00:00'),
(13, 'Chandanahalli', 0, 0, '0000-00-00 00:00:00'),
(14, 'Chikka Arjunahalli', 0, 0, '0000-00-00 00:00:00'),
(15, 'Chottanahalli ', 0, 0, '0000-00-00 00:00:00'),
(16, 'Choudarypalya', 0, 0, '0000-00-00 00:00:00'),
(17, 'Devarakanasandra', 0, 0, '0000-00-00 00:00:00'),
(18, 'Devarayanapalya', 0, 0, '0000-00-00 00:00:00'),
(19, 'Doddakallahalli', 0, 0, '0000-00-00 00:00:00'),
(20, 'Doddamadure', 0, 0, '0000-00-00 00:00:00'),
(21, 'Dombarahatti', 0, 0, '0000-00-00 00:00:00'),
(22, 'Gajjanapalya', 0, 0, '0000-00-00 00:00:00'),
(23, 'Giriyappanapalya', 0, 0, '0000-00-00 00:00:00'),
(24, 'Gollarahatti', 0, 0, '0000-00-00 00:00:00'),
(25, 'Gowdagere', 0, 0, '0000-00-00 00:00:00'),
(26, 'H.B.Shettihalli', 0, 0, '0000-00-00 00:00:00'),
(27, 'Hadonahalli', 0, 0, '0000-00-00 00:00:00'),
(28, 'Halagere', 0, 0, '0000-00-00 00:00:00'),
(29, 'Hanchipura', 0, 0, '0000-00-00 00:00:00'),
(30, 'Handalagere', 0, 0, '0000-00-00 00:00:00'),
(31, 'Hanumapura', 0, 0, '0000-00-00 00:00:00'),
(32, 'Heddigere', 0, 0, '0000-00-00 00:00:00'),
(33, 'Helavarahatti', 0, 0, '0000-00-00 00:00:00'),
(34, 'Holalagunda ', 0, 0, '0000-00-00 00:00:00'),
(35, 'Hosahalli', 0, 0, '0000-00-00 00:00:00'),
(36, 'Hosakere', 0, 0, '0000-00-00 00:00:00'),
(37, 'Hosuru', 0, 0, '0000-00-00 00:00:00'),
(38, 'Hulivana', 0, 0, '0000-00-00 00:00:00'),
(39, 'Indiranagara', 0, 0, '0000-00-00 00:00:00'),
(40, 'Jaladigere', 0, 0, '0000-00-00 00:00:00'),
(41, 'Janatha Coloni', 0, 0, '0000-00-00 00:00:00'),
(42, 'Jiddigere', 0, 0, '0000-00-00 00:00:00'),
(43, 'Jinnaagara', 0, 0, '0000-00-00 00:00:00'),
(44, 'Jivajihatti', 0, 0, '0000-00-00 00:00:00'),
(45, 'Kadashettihalli', 0, 0, '0000-00-00 00:00:00'),
(46, 'Kagganahalli', 0, 0, '0000-00-00 00:00:00'),
(47, 'Kaggere', 0, 0, '0000-00-00 00:00:00'),
(48, 'Kalasegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(49, 'Kanchagalapura', 0, 0, '0000-00-00 00:00:00'),
(50, 'Kannaguni', 0, 0, '0000-00-00 00:00:00'),
(51, 'Kantanahalli', 0, 0, '0000-00-00 00:00:00'),
(52, 'Kattigehalli', 0, 0, '0000-00-00 00:00:00'),
(53, 'KH halli', 0, 0, '0000-00-00 00:00:00'),
(54, 'Kiranguru', 0, 0, '0000-00-00 00:00:00'),
(55, 'Kittaghatta', 0, 0, '0000-00-00 00:00:00'),
(56, 'Kodipalya', 0, 0, '0000-00-00 00:00:00'),
(57, 'Koppa', 0, 0, '0000-00-00 00:00:00'),
(58, 'Korati', 0, 0, '0000-00-00 00:00:00'),
(59, 'Kottegere', 0, 0, '0000-00-00 00:00:00'),
(60, 'Kuppe', 0, 0, '0000-00-00 00:00:00'),
(61, 'kuvempunagar', 0, 0, '0000-00-00 00:00:00'),
(62, 'Madihalli', 0, 0, '0000-00-00 00:00:00'),
(63, 'Madihalli', 0, 0, '0000-00-00 00:00:00'),
(64, 'Madurepalya', 0, 0, '0000-00-00 00:00:00'),
(65, 'Mallapura', 0, 0, '0000-00-00 00:00:00'),
(66, 'Mantya', 0, 0, '0000-00-00 00:00:00'),
(67, 'Markonahalli', 0, 0, '0000-00-00 00:00:00'),
(68, 'Megala Tenginmaradapalya', 0, 0, '0000-00-00 00:00:00'),
(69, 'Megalaplya', 0, 0, '0000-00-00 00:00:00'),
(70, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(71, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(72, 'Nagasandra', 0, 0, '0000-00-00 00:00:00'),
(73, 'Nagegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(74, 'Paduvagere', 0, 0, '0000-00-00 00:00:00'),
(75, 'Pallerayanahalli', 0, 0, '0000-00-00 00:00:00'),
(76, 'Puttanapalya', 0, 0, '0000-00-00 00:00:00'),
(77, 'Rangegoudanapalya', 0, 0, '0000-00-00 00:00:00'),
(78, 'Renukanagara', 0, 0, '0000-00-00 00:00:00'),
(79, 'Sanaba', 0, 0, '0000-00-00 00:00:00'),
(80, 'Sanabagatta', 0, 0, '0000-00-00 00:00:00'),
(81, 'Shanuboganahalli', 0, 0, '0000-00-00 00:00:00'),
(82, 'Shattihalli', 0, 0, '0000-00-00 00:00:00'),
(83, 'Shettibidu', 0, 0, '0000-00-00 00:00:00'),
(84, 'Siddapura ', 0, 0, '0000-00-00 00:00:00'),
(85, 'Singatihalli', 0, 0, '0000-00-00 00:00:00'),
(86, 'Sondekoppa', 0, 0, '0000-00-00 00:00:00'),
(87, 'Tenginamaradapalya', 0, 0, '0000-00-00 00:00:00'),
(88, 'Thathayyanapalya', 0, 0, '0000-00-00 00:00:00'),
(89, 'Thippur', 0, 0, '0000-00-00 00:00:00'),
(90, 'Timmegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(91, 'Tippuru', 0, 0, '0000-00-00 00:00:00'),
(92, 'Tubinakere', 0, 0, '0000-00-00 00:00:00'),
(93, 'Turuganuru', 0, 0, '0000-00-00 00:00:00'),
(94, 'Ungara', 0, 0, '0000-00-00 00:00:00'),
(95, 'Urkehalli', 0, 0, '0000-00-00 00:00:00'),
(96, 'Valagerepura', 0, 0, '0000-00-00 00:00:00'),
(97, 'Venkategowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(98, 'Y.Hampapura', 0, 0, '0000-00-00 00:00:00'),
(99, 'Yachanahalli', 0, 0, '0000-00-00 00:00:00'),
(100, 'Yadavani', 0, 0, '0000-00-00 00:00:00'),
(101, 'Yadiyur', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_houseownership`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_houseownership` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_houseownership`
--

INSERT INTO `ourbank_master_houseownership` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Rented', 0, '2011-02-17 00:00:00'),
(2, 'Sahred family', 0, '0000-00-00 00:00:00'),
(3, 'owned with title', 0, '0000-00-00 00:00:00'),
(4, 'IAY/Govt scheme', 0, '0000-00-00 00:00:00'),
(5, 'Owned no title', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_housingtype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_housingtype` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_housingtype`
--

INSERT INTO `ourbank_master_housingtype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Hut', 0, '0000-00-00 00:00:00'),
(2, 'Sheet', 0, '0000-00-00 00:00:00'),
(3, 'Tiled', 0, '0000-00-00 00:00:00'),
(4, 'RCC', 0, '0000-00-00 00:00:00'),
(5, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_income`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_income`
--

INSERT INTO `ourbank_master_income` (`id`, `name`) VALUES
(1, 'rabi agricultural income'),
(2, 'kharif agricultural income'),
(3, 'summer agricultural income'),
(4, 'perrinial crops income'),
(5, 'diary/goat/sheep/poultry incom'),
(6, 'wages'),
(7, 'sub callings'),
(8, 'employment'),
(9, 'others');

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
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_institutions`
--

INSERT INTO `ourbank_master_institutions` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Grameena Welfare', 0, '0000-00-00 00:00:00'),
(2, 'Health clinic', 0, '0000-00-00 00:00:00'),
(3, 'Gubbi Women care society', 0, '0000-00-00 00:00:00'),
(4, 'Govt Hospital Gubbi', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_insurance`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_insurance` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_insurance`
--

INSERT INTO `ourbank_master_insurance` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'None', 1, '2011-02-16 18:34:48'),
(2, 'Yeshaswini', 1, '2011-03-16 15:44:08'),
(3, 'Arogyashree', 1, '2011-03-16 15:44:08'),
(4, 'RSBY', 1, '2011-03-16 15:44:08'),
(5, 'Private', 1, '2011-03-16 15:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_interest`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_interest` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_interest`
--

INSERT INTO `ourbank_master_interest` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'PM', 0, '2011-02-16 11:44:05'),
(2, 'PA', 0, '2011-02-16 11:44:05');

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
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_landacquisition`
--

INSERT INTO `ourbank_master_landacquisition` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Ancesteral', 0, '0000-00-00 00:00:00'),
(2, 'Self-earned', 0, '0000-00-00 00:00:00'),
(3, 'Loans', 0, '0000-00-00 00:00:00'),
(4, 'Grant ', 0, '0000-00-00 00:00:00'),
(5, 'Gift', 0, '0000-00-00 00:00:00'),
(6, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_landtypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_landtypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_landtypes`
--

INSERT INTO `ourbank_master_landtypes` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Dry', 0, '0000-00-00 00:00:00'),
(2, 'Wet', 0, '0000-00-00 00:00:00'),
(3, 'Garden Land', 0, '0000-00-00 00:00:00'),
(4, 'Uncultivated', 0, '0000-00-00 00:00:00'),
(5, 'Leez land', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_ledgertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_ledgertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_ledgertypes`
--

INSERT INTO `ourbank_master_ledgertypes` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Income', 0, '0000-00-00 00:00:00'),
(2, 'Expenditure', 0, '0000-00-00 00:00:00'),
(3, 'Assets', 0, '0000-00-00 00:00:00'),
(4, 'Liabilities', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_liveassets`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_liveassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_liveassets`
--

INSERT INTO `ourbank_master_liveassets` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Cross breed cows', 0, '0000-00-00 00:00:00'),
(2, 'Local cows', 0, '0000-00-00 00:00:00'),
(3, 'Buffaloes', 0, '0000-00-00 00:00:00'),
(4, 'Bullocks', 0, '0000-00-00 00:00:00'),
(5, 'Sheep', 0, '0000-00-00 00:00:00'),
(6, 'Poultry', 0, '0000-00-00 00:00:00'),
(7, 'Pigs', 0, '0000-00-00 00:00:00'),
(8, 'Goats', 0, '0000-00-00 00:00:00'),
(9, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_loanpurpose`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_loanpurpose` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_loanpurpose`
--

INSERT INTO `ourbank_master_loanpurpose` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Personal', 0, '0000-00-00 00:00:00'),
(2, 'Repaying high cost debt', 0, '0000-00-00 00:00:00'),
(3, 'Family (education/marriage etc)', 0, '0000-00-00 00:00:00'),
(4, 'To meet healthcare costs', 0, '0000-00-00 00:00:00'),
(5, 'Agriculture improvement', 0, '0000-00-00 00:00:00'),
(6, 'Starting business/Business improvement', 0, '0000-00-00 00:00:00'),
(7, 'Others', 0, '0000-00-00 00:00:00'),
(8, 'Education', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_loansource`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_loansource` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_loansource`
--

INSERT INTO `ourbank_master_loansource` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Banks', 0, '0000-00-00 00:00:00'),
(2, 'SHGs / CBOs', 0, '0000-00-00 00:00:00'),
(3, 'Money Lenders', 0, '0000-00-00 00:00:00'),
(4, 'Chit Funds', 0, '0000-00-00 00:00:00'),
(5, 'Freinds & Family', 0, '0000-00-00 00:00:00'),
(6, 'MFI', 0, '0000-00-00 00:00:00'),
(7, 'Cooperative Banks', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_loanstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_loanstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `officehierarchy_id` smallint(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_loanstatus`
--

INSERT INTO `ourbank_master_loanstatus` (`id`, `name`, `officehierarchy_id`, `created_by`, `created_date`) VALUES
(1, 'New', 0, 1, '2011-02-26 13:46:58'),
(2, 'Verification', 4, 1, '2011-02-26 13:46:58'),
(3, 'Grading', 3, 1, '2011-02-26 13:47:25'),
(4, 'Field visit', 2, 1, '2011-02-26 13:47:45'),
(5, 'Approved', 1, 1, '0000-00-00 00:00:00'),
(6, 'Reject', 99, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_maritalstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_maritalstatus` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_maritalstatus`
--

INSERT INTO `ourbank_master_maritalstatus` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Married', 0, '0000-00-00 00:00:00'),
(2, 'Unmarried', 0, '0000-00-00 00:00:00'),
(3, 'Widow/widower', 0, '0000-00-00 00:00:00'),
(4, 'Divorced', 0, '0000-00-00 00:00:00'),
(5, 'Separated', 0, '0000-00-00 00:00:00'),
(6, 'Currently Married', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_mastertables`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_mastertables` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptions` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `ourbank_master_mastertables`
--

INSERT INTO `ourbank_master_mastertables` (`id`, `name`, `descriptions`) VALUES
(1, 'ourbank_master_accountype', 'account type'),
(2, 'ourbank_master_bank', 'bank'),
(3, 'ourbank_master_businesstype', 'businesstype'),
(4, 'ourbank_master_castetype', 'caste type'),
(5, 'ourbank_master_cbopromoter', 'cbo promoter'),
(6, 'ourbank_master_cbos', 'cbos'),
(7, 'ourbank_master_cookingfuel', 'cooking fuel'),
(8, 'ourbank_master_countrylist', 'country list'),
(9, 'ourbank_master_crop', 'crop'),
(10, 'ourbank_master_currency', 'currency'),
(11, 'ourbank_master_designation', 'designation'),
(12, 'ourbank_master_diseasetypes', 'disease types'),
(13, 'ourbank_master_districtlist', 'district list'),
(14, 'ourbank_master_educationtype', 'education type'),
(15, 'ourbank_master_employmenttype', 'employment type'),
(16, 'ourbank_master_entitlements', 'entitlements'),
(17, 'ourbank_master_expense', 'expense'),
(18, 'ourbank_master_familyexpense', 'family expense'),
(19, 'ourbank_master_familyincome', 'family income'),
(20, 'ourbank_master_familytype', 'family type'),
(21, 'ourbank_master_frequencypayment', 'frequency payment'),
(22, 'ourbank_master_fundertype', 'funder type'),
(23, 'ourbank_master_gender', 'gender'),
(24, 'ourbank_master_hoblilist', 'hoblilist'),
(25, 'ourbank_master_income', 'income'),
(26, 'ourbank_master_instalstatus', 'instal status'),
(27, 'ourbank_master_institutions', 'institutions'),
(28, 'ourbank_master_kootas', 'kootas'),
(29, 'ourbank_master_kvs', 'kvs'),
(30, 'ourbank_master_landacquisition', 'land acquisition'),
(31, 'ourbank_master_landtypes', 'land types'),
(32, 'ourbank_master_ledgertypes', 'ledger types'),
(33, 'ourbank_master_liveassets', 'live assets'),
(34, 'ourbank_master_loanpurpose', 'loan purpose'),
(35, 'ourbank_master_loansource', 'loan source'),
(36, 'ourbank_master_maritalstatus', 'marital status'),
(38, 'ourbank_master_nonliveassets', 'nonlive assets'),
(39, 'ourbank_master_ownershiptype', 'ownership type'),
(40, 'ourbank_master_paymenttypes', 'payment types'),
(41, 'ourbank_master_povertytype', 'poverty type'),
(42, 'ourbank_master_profession', 'profession'),
(43, 'ourbank_master_realtionshiptype', 'relationship type'),
(44, 'ourbank_master_servicesectors', 'service sectors'),
(45, 'ourbank_master_shgs', 'shgs'),
(46, 'ourbank_master_skills', 'skills'),
(47, 'ourbank_master_sourceofincome', 'source of income'),
(48, 'ourbank_master_taluklist', 'taluk list'),
(49, 'ourbank_master_villagelist', 'villagelist'),
(50, 'ourbank_master_gillapanchayath', 'gillapanchayath'),
(51, 'ourbank_master_habitation', 'habitation'),
(52, 'ourbank_master_mastertables', 'master tables');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_membertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_membertypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_membertypes`
--

INSERT INTO `ourbank_master_membertypes` (`id`, `type`, `created_by`, `created_date`) VALUES
(1, 'Individual', 0, '0000-00-00 00:00:00'),
(2, 'SHG', 0, '0000-00-00 00:00:00'),
(3, 'JLG', 0, '0000-00-00 00:00:00'),
(4, 'All', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_nonliveassets`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_nonliveassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ourbank_master_nonliveassets`
--

INSERT INTO `ourbank_master_nonliveassets` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'House', 0, '0000-00-00 00:00:00'),
(2, 'Cow shed', 0, '0000-00-00 00:00:00'),
(3, 'Bullock cart', 0, '0000-00-00 00:00:00'),
(4, 'Deposit', 0, '0000-00-00 00:00:00'),
(5, 'Tractor', 0, '0000-00-00 00:00:00'),
(6, 'Car/Lorry', 0, '0000-00-00 00:00:00'),
(7, 'Bycicle', 0, '0000-00-00 00:00:00'),
(8, 'Bike', 0, '0000-00-00 00:00:00'),
(9, 'Mobile', 0, '0000-00-00 00:00:00'),
(10, 'TV', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_ownershiptype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_ownershiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_ownershiptype`
--

INSERT INTO `ourbank_master_ownershiptype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Rented', 0, '0000-00-00 00:00:00'),
(2, 'Shared family', 0, '0000-00-00 00:00:00'),
(3, 'Owned with title', 0, '0000-00-00 00:00:00'),
(4, 'IAY/govt.scheme', 1, '0000-00-00 00:00:00'),
(5, 'Owned no title', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_paymenttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_paymenttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_paymenttypes`
--

INSERT INTO `ourbank_master_paymenttypes` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Cash', 0, '0000-00-00 00:00:00'),
(2, 'Cheque', 0, '0000-00-00 00:00:00'),
(3, 'Voucher', 0, '0000-00-00 00:00:00'),
(4, 'Draft', 0, '0000-00-00 00:00:00'),
(5, 'E-transfer', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_phychallenge`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_phychallenge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_phychallenge`
--

INSERT INTO `ourbank_master_phychallenge` (`id`, `name`) VALUES
(1, 'None'),
(2, 'Physical'),
(3, 'Deaf'),
(4, 'Dumb'),
(5, 'Others'),
(6, 'Blind');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_povertytype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_povertytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_povertytype`
--

INSERT INTO `ourbank_master_povertytype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Homeless / Ordinary house', 0, '0000-00-00 00:00:00'),
(2, 'Landless / marginal farmer', 0, '0000-00-00 00:00:00'),
(3, 'Wage employed', 0, '0000-00-00 00:00:00'),
(4, 'Managed by women', 0, '0000-00-00 00:00:00'),
(5, 'Not available', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_profession`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_profession` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profession_ID` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_master_profession`
--

INSERT INTO `ourbank_master_profession` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'None', 0, '0000-00-00 00:00:00'),
(2, 'Teacher', 0, '0000-00-00 00:00:00'),
(3, 'Business', 0, '0000-00-00 00:00:00'),
(4, 'Carpenter', 0, '0000-00-00 00:00:00'),
(5, 'Cobler', 0, '0000-00-00 00:00:00'),
(6, 'Iron Smith', 0, '0000-00-00 00:00:00'),
(7, 'Insurence Agent', 0, '0000-00-00 00:00:00'),
(8, 'Farmer', 0, '0000-00-00 00:00:00'),
(9, 'Tailor', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_rationcard`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_rationcard` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_rationcard`
--

INSERT INTO `ourbank_master_rationcard` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'None', 1, '2011-02-16 18:34:48'),
(2, 'APL', 1, '2011-02-16 00:00:00'),
(3, 'BPL', 1, '2011-02-16 00:00:00'),
(4, 'AAY', 1, '2011-02-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_realtionshiptype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_realtionshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ourbank_master_realtionshiptype`
--

INSERT INTO `ourbank_master_realtionshiptype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Self', 0, '0000-00-00 00:00:00'),
(2, 'Spouse', 0, '0000-00-00 00:00:00'),
(3, 'Father', 0, '0000-00-00 00:00:00'),
(4, 'Mother', 0, '0000-00-00 00:00:00'),
(5, 'Son', 0, '0000-00-00 00:00:00'),
(6, 'Daughter', 0, '0000-00-00 00:00:00'),
(7, 'Brother', 0, '0000-00-00 00:00:00'),
(8, 'Sister', 0, '0000-00-00 00:00:00'),
(9, 'Daughter-in-law', 0, '0000-00-00 00:00:00'),
(10, 'Son-in-law', 0, '0000-00-00 00:00:00'),
(11, 'Father-in-law', 0, '0000-00-00 00:00:00'),
(12, 'Mother-in-law', 0, '0000-00-00 00:00:00'),
(13, 'Brother-in-law', 0, '0000-00-00 00:00:00'),
(14, 'Sister-in-law', 0, '0000-00-00 00:00:00'),
(15, 'Nephew', 0, '0000-00-00 00:00:00'),
(16, 'Neice', 0, '0000-00-00 00:00:00'),
(17, 'Grandson', 0, '0000-00-00 00:00:00'),
(18, 'Granddaughter', 0, '0000-00-00 00:00:00'),
(19, 'Grandfather', 0, '0000-00-00 00:00:00'),
(20, 'Grandmother', 0, '0000-00-00 00:00:00'),
(21, 'Uncle/Aunt', 0, '0000-00-00 00:00:00'),
(22, 'Others', 0, '0000-00-00 00:00:00'),
(23, 'Husband', 0, '0000-00-00 00:00:00'),
(24, 'Friend', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_servicesectors`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_servicesectors` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `ourbank_master_servicesectors`
--

INSERT INTO `ourbank_master_servicesectors` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Agriculture', 0, '0000-00-00 00:00:00'),
(2, 'Retail', 0, '0000-00-00 00:00:00'),
(3, 'Hospitality/hotel', 0, '0000-00-00 00:00:00'),
(4, 'Forestry', 0, '0000-00-00 00:00:00'),
(5, 'Fishery', 0, '0000-00-00 00:00:00'),
(6, 'Industry/Manufacturing', 0, '0000-00-00 00:00:00'),
(7, 'Construction', 0, '0000-00-00 00:00:00'),
(8, 'Transportation', 0, '0000-00-00 00:00:00'),
(9, 'IT Serivices', 0, '0000-00-00 00:00:00'),
(10, 'Others', 0, '0000-00-00 00:00:00'),
(11, 'housing', 0, '0000-00-00 00:00:00'),
(12, 'house repair', 0, '0000-00-00 00:00:00'),
(13, 'ration card', 0, '0000-00-00 00:00:00'),
(14, 'widows pension', 0, '0000-00-00 00:00:00'),
(15, 'oldage pension', 0, '0000-00-00 00:00:00'),
(16, 'handycap pension', 0, '0000-00-00 00:00:00'),
(17, 'toilets', 0, '0000-00-00 00:00:00'),
(18, 'NREG card', 0, '0000-00-00 00:00:00'),
(19, 'skill training', 0, '0000-00-00 00:00:00'),
(20, 'external employment', 0, '0000-00-00 00:00:00'),
(21, 'bank savings A/C', 0, '0000-00-00 00:00:00'),
(22, 'inclusion to women SHG', 0, '0000-00-00 00:00:00'),
(23, 'inclusion to farmers SHG', 0, '0000-00-00 00:00:00'),
(24, 'life insurance', 0, '0000-00-00 00:00:00'),
(25, 'health insurance', 0, '0000-00-00 00:00:00'),
(26, 'animal insurance', 0, '0000-00-00 00:00:00'),
(27, 'hostels for students', 0, '0000-00-00 00:00:00'),
(28, 'special classes/tuition', 0, '0000-00-00 00:00:00'),
(29, 'capital/credit', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_shgs`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_shgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=402 ;

--
-- Dumping data for table `ourbank_master_shgs`
--

INSERT INTO `ourbank_master_shgs` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Adarsha ', 0, '0000-00-00 00:00:00'),
(2, 'Adhishakthi', 0, '0000-00-00 00:00:00'),
(3, 'Akashaya', 0, '0000-00-00 00:00:00'),
(4, 'Ambabhavani', 0, '0000-00-00 00:00:00'),
(5, 'Ambedkar', 0, '0000-00-00 00:00:00'),
(6, 'Ambedkar', 0, '0000-00-00 00:00:00'),
(7, 'Ambedkar', 0, '0000-00-00 00:00:00'),
(8, 'Anjaneya', 0, '0000-00-00 00:00:00'),
(9, 'Ankanatheshwara', 0, '0000-00-00 00:00:00'),
(10, 'Annapurneshwari', 0, '0000-00-00 00:00:00'),
(11, 'Aramba', 0, '0000-00-00 00:00:00'),
(12, 'Aravinamaramma', 0, '0000-00-00 00:00:00'),
(13, 'Bagatsingh', 0, '0000-00-00 00:00:00'),
(14, 'Bairaveswara', 0, '0000-00-00 00:00:00'),
(15, 'Balaji', 0, '0000-00-00 00:00:00'),
(16, 'Bargavi', 0, '0000-00-00 00:00:00'),
(17, 'Basaveshwara', 0, '0000-00-00 00:00:00'),
(18, 'Basaveshwara', 0, '0000-00-00 00:00:00'),
(19, 'Bettadatimmappa', 0, '0000-00-00 00:00:00'),
(20, 'Bhagyalakshmi', 0, '0000-00-00 00:00:00'),
(21, 'Bhargavi', 0, '0000-00-00 00:00:00'),
(22, 'Bhoodevi', 0, '0000-00-00 00:00:00'),
(23, 'Bhumathe', 0, '0000-00-00 00:00:00'),
(24, 'Bhumithayi', 0, '0000-00-00 00:00:00'),
(25, 'Bismilla', 0, '0000-00-00 00:00:00'),
(26, 'Bismilla', 0, '0000-00-00 00:00:00'),
(27, 'Chalapati', 0, '0000-00-00 00:00:00'),
(28, 'Chaluvarayaswamy', 0, '0000-00-00 00:00:00'),
(29, 'Chamundeshwari', 0, '0000-00-00 00:00:00'),
(30, 'Channakeshava', 0, '0000-00-00 00:00:00'),
(31, 'Channakeshava', 0, '0000-00-00 00:00:00'),
(32, 'Chikkamma', 0, '0000-00-00 00:00:00'),
(33, 'Chunchanagiriyappa', 0, '0000-00-00 00:00:00'),
(34, 'Da.ra Bendre', 0, '0000-00-00 00:00:00'),
(35, 'Dandinamma', 0, '0000-00-00 00:00:00'),
(36, 'Dandinamma adhti', 0, '0000-00-00 00:00:00'),
(37, 'Doddamma', 0, '0000-00-00 00:00:00'),
(38, 'Dr.B R ambedkar', 0, '0000-00-00 00:00:00'),
(39, 'Dr.B R ambedkar', 0, '0000-00-00 00:00:00'),
(40, 'Eshwara', 0, '0000-00-00 00:00:00'),
(41, 'Gagana', 0, '0000-00-00 00:00:00'),
(42, 'Gagana', 0, '0000-00-00 00:00:00'),
(43, 'Gangadhareshwara', 0, '0000-00-00 00:00:00'),
(44, 'Gangaparameshwari', 0, '0000-00-00 00:00:00'),
(45, 'Gangotri', 0, '0000-00-00 00:00:00'),
(46, 'Gomathe', 0, '0000-00-00 00:00:00'),
(47, 'Guliraya', 0, '0000-00-00 00:00:00'),
(48, 'Hanumantharaya', 0, '0000-00-00 00:00:00'),
(49, 'Hanumantharaya', 0, '0000-00-00 00:00:00'),
(50, 'Huchhamma', 0, '0000-00-00 00:00:00'),
(51, 'Huchhammadevi', 0, '0000-00-00 00:00:00'),
(52, 'Huliyuramma', 0, '0000-00-00 00:00:00'),
(53, 'Huyyalamma', 0, '0000-00-00 00:00:00'),
(54, 'Ilahi', 0, '0000-00-00 00:00:00'),
(55, 'Indian', 0, '0000-00-00 00:00:00'),
(56, 'Jafar Sadhif', 0, '0000-00-00 00:00:00'),
(57, 'Jai Bharat', 0, '0000-00-00 00:00:00'),
(58, 'Jai Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(59, 'Jai Hanuman', 0, '0000-00-00 00:00:00'),
(60, 'Jai Karnataka ', 0, '0000-00-00 00:00:00'),
(61, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(62, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(63, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(64, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(65, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(66, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(67, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(68, 'Jai Maruthi', 0, '0000-00-00 00:00:00'),
(69, 'Jaimaruthi', 0, '0000-00-00 00:00:00'),
(70, 'Jaimaruti', 0, '0000-00-00 00:00:00'),
(71, 'Kalabhairava', 0, '0000-00-00 00:00:00'),
(72, 'Kalabhairaveshwara', 0, '0000-00-00 00:00:00'),
(73, 'Kalamma', 0, '0000-00-00 00:00:00'),
(74, 'Kalikamba', 0, '0000-00-00 00:00:00'),
(75, 'Kalikhamba', 0, '0000-00-00 00:00:00'),
(76, 'Kamadhenu', 0, '0000-00-00 00:00:00'),
(77, 'Kempegouda', 0, '0000-00-00 00:00:00'),
(78, 'Kempegowda', 0, '0000-00-00 00:00:00'),
(79, 'Kenkeramma', 0, '0000-00-00 00:00:00'),
(80, 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(81, 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(82, 'Lakshmidevi', 0, '0000-00-00 00:00:00'),
(83, 'Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(84, 'Lakshmivenkateswara JLG', 0, '0000-00-00 00:00:00'),
(85, 'Lalitha ', 0, '0000-00-00 00:00:00'),
(86, 'Laxmi Venkateshwara', 0, '0000-00-00 00:00:00'),
(87, 'Laxmidevi', 0, '0000-00-00 00:00:00'),
(88, 'Madeshwara', 0, '0000-00-00 00:00:00'),
(89, 'Madheshwara', 0, '0000-00-00 00:00:00'),
(90, 'Maheshwari', 0, '0000-00-00 00:00:00'),
(91, 'Mailaralingeshwara', 0, '0000-00-00 00:00:00'),
(92, 'Manchamma', 0, '0000-00-00 00:00:00'),
(93, 'Maramma', 0, '0000-00-00 00:00:00'),
(94, 'Maruthi', 0, '0000-00-00 00:00:00'),
(95, 'Maruti JLG', 0, '0000-00-00 00:00:00'),
(96, 'Masthamma', 0, '0000-00-00 00:00:00'),
(97, 'MPA', 0, '0000-00-00 00:00:00'),
(98, 'Mujameel', 0, '0000-00-00 00:00:00'),
(99, 'Mulakattamma', 0, '0000-00-00 00:00:00'),
(100, 'Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(101, 'Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(102, 'Navodaya', 0, '0000-00-00 00:00:00'),
(103, 'Neralamma', 0, '0000-00-00 00:00:00'),
(104, 'Nurani', 0, '0000-00-00 00:00:00'),
(105, 'Ondematharam', 0, '0000-00-00 00:00:00'),
(106, 'Padmavathi', 0, '0000-00-00 00:00:00'),
(107, 'Pakija', 0, '0000-00-00 00:00:00'),
(108, 'Parvathi', 0, '0000-00-00 00:00:00'),
(109, 'Parvathi', 0, '0000-00-00 00:00:00'),
(110, 'Pragathi JLG', 0, '0000-00-00 00:00:00'),
(111, 'Pranathi', 0, '0000-00-00 00:00:00'),
(112, 'Sapthagiri', 0, '0000-00-00 00:00:00'),
(113, 'Saraswati', 0, '0000-00-00 00:00:00'),
(114, 'Savyasachi', 0, '0000-00-00 00:00:00'),
(115, 'Shaphiya', 0, '0000-00-00 00:00:00'),
(116, 'Sharadambe', 0, '0000-00-00 00:00:00'),
(117, 'Sharade', 0, '0000-00-00 00:00:00'),
(118, 'Shri  Jaladigereyamma', 0, '0000-00-00 00:00:00'),
(119, 'Shri  Vinayaka', 0, '0000-00-00 00:00:00'),
(120, 'Shri Adishakthi', 0, '0000-00-00 00:00:00'),
(121, 'Shri Adishakti', 0, '0000-00-00 00:00:00'),
(122, 'Shri Adishakti', 0, '0000-00-00 00:00:00'),
(123, 'Shri Anjaneya', 0, '0000-00-00 00:00:00'),
(124, 'Shri Anjaneyaswami', 0, '0000-00-00 00:00:00'),
(125, 'Shri Anjaneyaswami', 0, '0000-00-00 00:00:00'),
(126, 'Shri Annapurneshwari', 0, '0000-00-00 00:00:00'),
(127, 'Shri Bandhamma', 0, '0000-00-00 00:00:00'),
(128, 'Shri Basaveshwara ', 0, '0000-00-00 00:00:00'),
(129, 'Shri Beereshwar', 0, '0000-00-00 00:00:00'),
(130, 'Shri Bettada Thimmappaswami', 0, '0000-00-00 00:00:00'),
(131, 'Shri Bhairaveshwara', 0, '0000-00-00 00:00:00'),
(132, 'Shri Bhairaveshwara', 0, '0000-00-00 00:00:00'),
(133, 'Shri Bhairaveshwarswami', 0, '0000-00-00 00:00:00'),
(134, 'Shri Bhoomithayi', 0, '0000-00-00 00:00:00'),
(135, 'Shri Bhuredevaru', 0, '0000-00-00 00:00:00'),
(136, 'Shri Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(137, 'Shri Byatarayaswami', 0, '0000-00-00 00:00:00'),
(138, 'Shri Chaluvarayaswami', 0, '0000-00-00 00:00:00'),
(139, 'Shri Chamundeshwari', 0, '0000-00-00 00:00:00'),
(140, 'Shri Channakeshava', 0, '0000-00-00 00:00:00'),
(141, 'Shri Chikkamma', 0, '0000-00-00 00:00:00'),
(142, 'Shri Durgeshwari', 0, '0000-00-00 00:00:00'),
(143, 'Shri Kalabhairaveshwara', 0, '0000-00-00 00:00:00'),
(144, 'Shri Kempammadevi', 0, '0000-00-00 00:00:00'),
(145, 'Shri Kempammadevi', 0, '0000-00-00 00:00:00'),
(146, 'Shri Kodilakkamma', 0, '0000-00-00 00:00:00'),
(147, 'Shri Kollapuradamma', 0, '0000-00-00 00:00:00'),
(148, 'Shri Kollapuradamma', 0, '0000-00-00 00:00:00'),
(149, 'Shri Lakshmi', 0, '0000-00-00 00:00:00'),
(150, 'Shri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(151, 'Shri Laksmi JLG', 0, '0000-00-00 00:00:00'),
(152, 'Shri Laxmammadevi', 0, '0000-00-00 00:00:00'),
(153, 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(154, 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(155, 'Shri Laxmi', 0, '0000-00-00 00:00:00'),
(156, 'Shri Laxmi Venkateshwara', 0, '0000-00-00 00:00:00'),
(157, 'Shri Laxmi-Venkateshwara', 0, '0000-00-00 00:00:00'),
(158, 'Shri Laxminarasimhaswami', 0, '0000-00-00 00:00:00'),
(159, 'Shri Laxminarasimhaswami', 0, '0000-00-00 00:00:00'),
(160, 'Shri Mahalaxmi', 0, '0000-00-00 00:00:00'),
(161, 'Shri Maheshwari', 0, '0000-00-00 00:00:00'),
(162, 'Shri Manchammadevii', 0, '0000-00-00 00:00:00'),
(163, 'Shri Manjunatha', 0, '0000-00-00 00:00:00'),
(164, 'Shri Marammadevi', 0, '0000-00-00 00:00:00'),
(165, 'Shri Mariyamma ', 0, '0000-00-00 00:00:00'),
(166, 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(167, 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(168, 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(169, 'Shri Maruthi', 0, '0000-00-00 00:00:00'),
(170, 'Shri Mulakattamma', 0, '0000-00-00 00:00:00'),
(171, 'Shri Muttinamma', 0, '0000-00-00 00:00:00'),
(172, 'Shri Narashimhaswamy JLG', 0, '0000-00-00 00:00:00'),
(173, 'Shri Nidhi', 0, '0000-00-00 00:00:00'),
(174, 'Shri Pattaladamma ', 0, '0000-00-00 00:00:00'),
(175, 'Shri Raghavendra', 0, '0000-00-00 00:00:00'),
(176, 'Shri Ranganatha', 0, '0000-00-00 00:00:00'),
(177, 'Shri Renukamba', 0, '0000-00-00 00:00:00'),
(178, 'Shri Saraswatidevi', 0, '0000-00-00 00:00:00'),
(179, 'Shri Sharada', 0, '0000-00-00 00:00:00'),
(180, 'Shri Sharada', 0, '0000-00-00 00:00:00'),
(181, 'Shri Shrinivasaswami', 0, '0000-00-00 00:00:00'),
(182, 'Shri Siddhalingeshwara', 0, '0000-00-00 00:00:00'),
(183, 'Shri Siddhalingeshwara', 0, '0000-00-00 00:00:00'),
(184, 'Shri Thirumala', 0, '0000-00-00 00:00:00'),
(185, 'Shri Varadevi', 0, '0000-00-00 00:00:00'),
(186, 'Shri Veerabhadreshwar', 0, '0000-00-00 00:00:00'),
(187, 'Shri Veereshwara ', 0, '0000-00-00 00:00:00'),
(188, 'Shri Venkateshwar', 0, '0000-00-00 00:00:00'),
(189, 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(190, 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(191, 'Shri Venkateshwara', 0, '0000-00-00 00:00:00'),
(192, 'Shri Vighneshwara', 0, '0000-00-00 00:00:00'),
(193, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(194, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(195, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(196, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(197, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(198, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(199, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(200, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(201, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(202, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(203, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(204, 'Shri Vinayaka', 0, '0000-00-00 00:00:00'),
(205, 'Shri Vishwanatha', 0, '0000-00-00 00:00:00'),
(206, 'Shri Vishweshwara', 0, '0000-00-00 00:00:00'),
(207, 'Shridevi', 0, '0000-00-00 00:00:00'),
(208, 'Sinchana', 0, '0000-00-00 00:00:00'),
(209, 'Sir.M Vishweshwaraiah', 0, '0000-00-00 00:00:00'),
(210, 'Sitapathi', 0, '0000-00-00 00:00:00'),
(211, 'Sowmya Shree', 0, '0000-00-00 00:00:00'),
(212, 'Spoorthi', 0, '0000-00-00 00:00:00'),
(213, 'Sri  Laxmidevi  ', 0, '0000-00-00 00:00:00'),
(214, 'Sri  Rama', 0, '0000-00-00 00:00:00'),
(215, 'Sri Anjaneya', 0, '0000-00-00 00:00:00'),
(216, 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(217, 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(218, 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(219, 'Sri Anjaneyaswamy', 0, '0000-00-00 00:00:00'),
(220, 'Sri Annapurneshwari', 0, '0000-00-00 00:00:00'),
(221, 'Sri Anthashayana', 0, '0000-00-00 00:00:00'),
(222, 'Sri Aravinamaramma', 0, '0000-00-00 00:00:00'),
(223, 'Sri Aravinamaramma', 0, '0000-00-00 00:00:00'),
(224, 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(225, 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(226, 'Sri Bairaveshwara', 0, '0000-00-00 00:00:00'),
(227, 'Sri Balaji', 0, '0000-00-00 00:00:00'),
(228, 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(229, 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(230, 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(231, 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(232, 'Sri Basaveshwara', 0, '0000-00-00 00:00:00'),
(233, 'Sri Basaweshwara', 0, '0000-00-00 00:00:00'),
(234, 'Sri Beemrao', 0, '0000-00-00 00:00:00'),
(235, 'Sri Bettadaranganathaswamy', 0, '0000-00-00 00:00:00'),
(236, 'Sri Bhagyalakshmi', 0, '0000-00-00 00:00:00'),
(237, 'Sri Bhumithayi', 0, '0000-00-00 00:00:00'),
(238, 'Sri Bhuvaneshwari', 0, '0000-00-00 00:00:00'),
(239, 'Sri Boredevara', 0, '0000-00-00 00:00:00'),
(240, 'Sri Boredevaru', 0, '0000-00-00 00:00:00'),
(241, 'Sri Bumithayi', 0, '0000-00-00 00:00:00'),
(242, 'Sri Chaluvarayaswamy', 0, '0000-00-00 00:00:00'),
(243, 'Sri Channakeshava', 0, '0000-00-00 00:00:00'),
(244, 'Sri Channakeshva', 0, '0000-00-00 00:00:00'),
(245, 'Sri Channakeshva', 0, '0000-00-00 00:00:00'),
(246, 'Sri Channakeshvaswamy', 0, '0000-00-00 00:00:00'),
(247, 'Sri Cheluvarayaswamy', 0, '0000-00-00 00:00:00'),
(248, 'Sri Chiranjeevi', 0, '0000-00-00 00:00:00'),
(249, 'Sri Chowdamma', 0, '0000-00-00 00:00:00'),
(250, 'Sri Devi', 0, '0000-00-00 00:00:00'),
(251, 'Sri Doddamma', 0, '0000-00-00 00:00:00'),
(252, 'Sri Doddammadevi', 0, '0000-00-00 00:00:00'),
(253, 'Sri Gaddehuchamma', 0, '0000-00-00 00:00:00'),
(254, 'Sri Ganapathi', 0, '0000-00-00 00:00:00'),
(255, 'Sri Gangadhareshwara', 0, '0000-00-00 00:00:00'),
(256, 'Sri Gramadevathe', 0, '0000-00-00 00:00:00'),
(257, 'Sri Hattilakkamma', 0, '0000-00-00 00:00:00'),
(258, 'Sri Hattimaramma', 0, '0000-00-00 00:00:00'),
(259, 'Sri Hattimaramma', 0, '0000-00-00 00:00:00'),
(260, 'Sri Hebbagilubairava', 0, '0000-00-00 00:00:00'),
(261, 'Sri Honnereluhuchamma', 0, '0000-00-00 00:00:00'),
(262, 'Sri Huchammadevi', 0, '0000-00-00 00:00:00'),
(263, 'Sri Huchammadevi', 0, '0000-00-00 00:00:00'),
(264, 'Sri Huttadamayamma', 0, '0000-00-00 00:00:00'),
(265, 'Sri Jagadeshwari', 0, '0000-00-00 00:00:00'),
(266, 'Sri Jai Maruthi', 0, '0000-00-00 00:00:00'),
(267, 'Sri Jaibhuvaneshwari', 0, '0000-00-00 00:00:00'),
(268, 'Sri Jaimaruthi', 0, '0000-00-00 00:00:00'),
(269, 'Sri Kadagalingeshwara', 0, '0000-00-00 00:00:00'),
(270, 'Sri Kalabairaveshwara', 0, '0000-00-00 00:00:00'),
(271, 'Sri Kalabairaveshwara', 0, '0000-00-00 00:00:00'),
(272, 'Sri Kalabairaveshwara JLG', 0, '0000-00-00 00:00:00'),
(273, 'Sri Kalikhamba', 0, '0000-00-00 00:00:00'),
(274, 'Sri Kannadambe', 0, '0000-00-00 00:00:00'),
(275, 'Sri Kannikaparameshwari', 0, '0000-00-00 00:00:00'),
(276, 'Sri Kempegowda', 0, '0000-00-00 00:00:00'),
(277, 'Sri Kollapurasamma', 0, '0000-00-00 00:00:00'),
(278, 'Sri Kuvempu', 0, '0000-00-00 00:00:00'),
(279, 'Sri Lakshidevi', 0, '0000-00-00 00:00:00'),
(280, 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(281, 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(282, 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(283, 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(284, 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(285, 'Sri Lakshmi', 0, '0000-00-00 00:00:00'),
(286, 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(287, 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(288, 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(289, 'Sri Lakshmidevi', 0, '0000-00-00 00:00:00'),
(290, 'Sri Lakshminarasimhaswamy', 0, '0000-00-00 00:00:00'),
(291, 'Sri Lakshmiranganathaswamy', 0, '0000-00-00 00:00:00'),
(292, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(293, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(294, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(295, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(296, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(297, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(298, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(299, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(300, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(301, 'Sri Lakshmivenkateshwara', 0, '0000-00-00 00:00:00'),
(302, 'Sri Laxmiranganathaswami', 0, '0000-00-00 00:00:00'),
(303, 'Sri Mahadeshwara', 0, '0000-00-00 00:00:00'),
(304, 'Sri Malleshwaraswamy', 0, '0000-00-00 00:00:00'),
(305, 'Sri Mallikarjunaswamy', 0, '0000-00-00 00:00:00'),
(306, 'Sri Manchamma', 0, '0000-00-00 00:00:00'),
(307, 'Sri Manjunatha', 0, '0000-00-00 00:00:00'),
(308, 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(309, 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(310, 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(311, 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(312, 'Sri Maramma', 0, '0000-00-00 00:00:00'),
(313, 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(314, 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(315, 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(316, 'Sri Maruthi', 0, '0000-00-00 00:00:00'),
(317, 'Sri Mayammadevi', 0, '0000-00-00 00:00:00'),
(318, 'Sri Mulukattammadevi', 0, '0000-00-00 00:00:00'),
(319, 'Sri muttinammadevi', 0, '0000-00-00 00:00:00'),
(320, 'Sri muttinammadevi', 0, '0000-00-00 00:00:00'),
(321, 'Sri Nandhini', 0, '0000-00-00 00:00:00'),
(322, 'Sri Nanjundeshwara', 0, '0000-00-00 00:00:00'),
(323, 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(324, 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(325, 'Sri Pattaladamma', 0, '0000-00-00 00:00:00'),
(326, 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(327, 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(328, 'Sri Rajeshwari', 0, '0000-00-00 00:00:00'),
(329, 'Sri Rama', 0, '0000-00-00 00:00:00'),
(330, 'Sri Ranga', 0, '0000-00-00 00:00:00'),
(331, 'Sri Ranganatha', 0, '0000-00-00 00:00:00'),
(332, 'Sri Ranganatha', 0, '0000-00-00 00:00:00'),
(333, 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(334, 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(335, 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(336, 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(337, 'Sri Ranganathaswamy', 0, '0000-00-00 00:00:00'),
(338, 'Sri Ranganathaswamy JLG', 0, '0000-00-00 00:00:00'),
(339, 'Sri Ranganathaswamy JLG', 0, '0000-00-00 00:00:00'),
(340, 'Sri Saraswathidevi', 0, '0000-00-00 00:00:00'),
(341, 'Sri Sharadamba', 0, '0000-00-00 00:00:00'),
(342, 'Sri Sharadambe', 0, '0000-00-00 00:00:00'),
(343, 'Sri Siddalingeshwara', 0, '0000-00-00 00:00:00'),
(344, 'Sri siddalingeshwara', 0, '0000-00-00 00:00:00'),
(345, 'Sri Siddalingeshwara', 0, '0000-00-00 00:00:00'),
(346, 'Sri Siddeshwara', 0, '0000-00-00 00:00:00'),
(347, 'Sri Srinivasa', 0, '0000-00-00 00:00:00'),
(348, 'Sri Timmappaswamy', 0, '0000-00-00 00:00:00'),
(349, 'Sri Timmarayaswamy', 0, '0000-00-00 00:00:00'),
(350, 'Sri Timmarayaswamy', 0, '0000-00-00 00:00:00'),
(351, 'Sri Tirupathivenkateshwaraswam', 0, '0000-00-00 00:00:00'),
(352, 'Sri Umamaheshwari', 0, '0000-00-00 00:00:00'),
(353, 'Sri Vaibhavalakshmi', 0, '0000-00-00 00:00:00'),
(354, 'Sri Varadappa', 0, '0000-00-00 00:00:00'),
(355, 'Sri Varalakshmi', 0, '0000-00-00 00:00:00'),
(356, 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(357, 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(358, 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(359, 'Sri Venkateshwara', 0, '0000-00-00 00:00:00'),
(360, 'Sri Vigneshwara', 0, '0000-00-00 00:00:00'),
(361, 'Sri Vijayalakshmi', 0, '0000-00-00 00:00:00'),
(362, 'Sri Vinaaka', 0, '0000-00-00 00:00:00'),
(363, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(364, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(365, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(366, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(367, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(368, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(369, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(370, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(371, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(372, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(373, 'Sri Vinayaka', 0, '0000-00-00 00:00:00'),
(374, 'Sri Vinayaka ', 0, '0000-00-00 00:00:00'),
(375, 'Sri Vinayaka ', 0, '0000-00-00 00:00:00'),
(376, 'Srinivasa', 0, '0000-00-00 00:00:00'),
(377, 'Subaschandrabos', 0, '0000-00-00 00:00:00'),
(378, 'Subhash', 0, '0000-00-00 00:00:00'),
(379, 'Sulthana', 0, '0000-00-00 00:00:00'),
(380, 'Surya', 0, '0000-00-00 00:00:00'),
(381, 'Suryodaya', 0, '0000-00-00 00:00:00'),
(382, 'Suryodaya', 0, '0000-00-00 00:00:00'),
(383, 'Tapaswiraya', 0, '0000-00-00 00:00:00'),
(384, 'Thirumala', 0, '0000-00-00 00:00:00'),
(385, 'Tippu', 0, '0000-00-00 00:00:00'),
(386, 'Triveni Sangama', 0, '0000-00-00 00:00:00'),
(387, 'Umamaheshwari', 0, '0000-00-00 00:00:00'),
(388, 'Varadaraja', 0, '0000-00-00 00:00:00'),
(389, 'Varalaxmi', 0, '0000-00-00 00:00:00'),
(390, 'Veerabhadreswara', 0, '0000-00-00 00:00:00'),
(391, 'Veeranjaneya', 0, '0000-00-00 00:00:00'),
(392, 'Venkateshwara', 0, '0000-00-00 00:00:00'),
(393, 'Vigneshwara', 0, '0000-00-00 00:00:00'),
(394, 'Vigneswara', 0, '0000-00-00 00:00:00'),
(395, 'Vinayaka', 0, '0000-00-00 00:00:00'),
(396, 'Vinayaka', 0, '0000-00-00 00:00:00'),
(397, 'Vinayaka', 0, '0000-00-00 00:00:00'),
(398, 'Vinayaka', 0, '0000-00-00 00:00:00'),
(399, 'Vivekananda', 0, '0000-00-00 00:00:00'),
(400, 'Yallamma', 0, '0000-00-00 00:00:00'),
(401, 'yarub', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_skills`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_skills` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ourbank_master_skills`
--

INSERT INTO `ourbank_master_skills` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Farm worker', 0, '0000-00-00 00:00:00'),
(2, 'Non-farm worker', 0, '0000-00-00 00:00:00'),
(3, 'Fishermen', 0, '0000-00-00 00:00:00'),
(4, 'Weaver', 0, '0000-00-00 00:00:00'),
(5, 'Mechanic', 0, '0000-00-00 00:00:00'),
(6, 'Carpenter', 0, '0000-00-00 00:00:00'),
(7, 'Mason', 0, '0000-00-00 00:00:00'),
(8, 'Blacksmith', 0, '0000-00-00 00:00:00'),
(9, 'Tailor', 0, '0000-00-00 00:00:00'),
(10, 'Teacher', 0, '0000-00-00 00:00:00'),
(11, 'Government Employee', 0, '0000-00-00 00:00:00'),
(12, 'Private sector employee', 0, '0000-00-00 00:00:00'),
(13, 'Driver', 0, '0000-00-00 00:00:00'),
(14, 'Business/Trade', 0, '0000-00-00 00:00:00'),
(15, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_sourceofincome`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_sourceofincome` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_sourceofincome`
--

INSERT INTO `ourbank_master_sourceofincome` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Daily Wage', 0, '0000-00-00 00:00:00'),
(2, 'Cultivation', 0, '0000-00-00 00:00:00'),
(3, 'Salary', 0, '0000-00-00 00:00:00'),
(4, 'Others', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_state`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_state`
--

INSERT INTO `ourbank_master_state` (`id`, `name`, `created_by`, `Created_date`) VALUES
(1, 'Karnataka', 1, '2011-04-12 14:44:06'),
(2, 'tamilnadu', 1, '2011-04-14 15:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_subcaste`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_subcaste` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `caste_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_subcaste`
--

INSERT INTO `ourbank_master_subcaste` (`id`, `name`, `caste_id`) VALUES
(1, 'sc1', 1),
(2, 'sc2', 1),
(3, 'st1', 2),
(4, 'st2', 2),
(5, 'obc1', 3),
(6, 'obc2', 3),
(7, 'other1', 4),
(8, 'other2', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_taluklist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_taluklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=176 ;

--
-- Dumping data for table `ourbank_master_taluklist`
--

INSERT INTO `ourbank_master_taluklist` (`id`, `name`, `district_id`, `created_by`, `Created_date`) VALUES
(1, 'Bagalkot', 1, 0, '0000-00-00 00:00:00'),
(2, 'Jamkhandi', 1, 0, '0000-00-00 00:00:00'),
(3, 'Mudhol', 1, 0, '0000-00-00 00:00:00'),
(4, 'Badami', 1, 0, '0000-00-00 00:00:00'),
(5, 'Bilgi', 1, 0, '0000-00-00 00:00:00'),
(6, 'Hungund', 1, 0, '0000-00-00 00:00:00'),
(7, 'Channapatna', 2, 0, '0000-00-00 00:00:00'),
(8, 'Dod Ballapur', 2, 0, '0000-00-00 00:00:00'),
(9, 'Ramanagaram', 2, 0, '0000-00-00 00:00:00'),
(10, 'Devanhalli', 2, 0, '0000-00-00 00:00:00'),
(11, 'Hoskote', 2, 0, '0000-00-00 00:00:00'),
(12, 'Kanakapura', 2, 0, '0000-00-00 00:00:00'),
(13, 'Magadi', 2, 0, '0000-00-00 00:00:00'),
(14, 'Nelmangala', 2, 0, '0000-00-00 00:00:00'),
(15, 'Anekal', 3, 0, '0000-00-00 00:00:00'),
(16, 'Bangalore North', 3, 0, '0000-00-00 00:00:00'),
(17, 'Bangalore South', 3, 0, '0000-00-00 00:00:00'),
(18, 'Uttarhalli', 3, 0, '0000-00-00 00:00:00'),
(19, 'Athni', 4, 0, '0000-00-00 00:00:00'),
(20, 'Bailahongal', 4, 0, '0000-00-00 00:00:00'),
(21, 'Belgaum', 4, 0, '0000-00-00 00:00:00'),
(22, 'Chikodi', 4, 0, '0000-00-00 00:00:00'),
(23, 'Gokak', 4, 0, '0000-00-00 00:00:00'),
(24, 'Hukkeri', 4, 0, '0000-00-00 00:00:00'),
(25, 'Khanapur', 4, 0, '0000-00-00 00:00:00'),
(26, 'Raybag', 4, 0, '0000-00-00 00:00:00'),
(27, 'Ramdurg', 4, 0, '0000-00-00 00:00:00'),
(28, 'Saundatti', 4, 0, '0000-00-00 00:00:00'),
(29, 'Bellary', 5, 0, '0000-00-00 00:00:00'),
(30, 'Hospet', 5, 0, '0000-00-00 00:00:00'),
(31, 'Kampli', 5, 0, '0000-00-00 00:00:00'),
(32, 'Hoovina Hadagalli', 5, 0, '0000-00-00 00:00:00'),
(33, 'Kudligi', 5, 0, '0000-00-00 00:00:00'),
(34, 'Sanduru', 5, 0, '0000-00-00 00:00:00'),
(35, 'Siruguppa', 5, 0, '0000-00-00 00:00:00'),
(36, 'Bidar', 6, 0, '0000-00-00 00:00:00'),
(37, 'Basavakalyan', 6, 0, '0000-00-00 00:00:00'),
(38, 'Bhalki', 6, 0, '0000-00-00 00:00:00'),
(39, 'Homnabad', 6, 0, '0000-00-00 00:00:00'),
(40, 'Aurad', 6, 0, '0000-00-00 00:00:00'),
(41, 'Bijapur', 7, 0, '0000-00-00 00:00:00'),
(42, 'Indi', 7, 0, '0000-00-00 00:00:00'),
(43, 'Muddebihal', 7, 0, '0000-00-00 00:00:00'),
(44, 'Sindgi', 7, 0, '0000-00-00 00:00:00'),
(45, 'Basavana Bagevadi', 7, 0, '0000-00-00 00:00:00'),
(46, 'Chamrajnagar', 8, 0, '0000-00-00 00:00:00'),
(47, 'Gundlupet', 8, 0, '0000-00-00 00:00:00'),
(48, 'Kollegal', 8, 0, '0000-00-00 00:00:00'),
(49, 'Yelandur', 8, 0, '0000-00-00 00:00:00'),
(50, 'Chikmagalur', 9, 0, '0000-00-00 00:00:00'),
(51, 'Kadur', 9, 0, '0000-00-00 00:00:00'),
(52, 'Koppa', 9, 0, '0000-00-00 00:00:00'),
(53, 'Mudigere', 9, 0, '0000-00-00 00:00:00'),
(54, 'Narasimharajapura', 9, 0, '0000-00-00 00:00:00'),
(55, 'Sringeri', 9, 0, '0000-00-00 00:00:00'),
(56, 'Tarikere', 9, 0, '0000-00-00 00:00:00'),
(57, 'Chitradurga', 10, 0, '0000-00-00 00:00:00'),
(58, 'Challakere', 10, 0, '0000-00-00 00:00:00'),
(59, 'Hiriyur', 10, 0, '0000-00-00 00:00:00'),
(60, 'Holalkere', 10, 0, '0000-00-00 00:00:00'),
(61, 'Hosdurga', 10, 0, '0000-00-00 00:00:00'),
(62, 'Molakalmuru', 10, 0, '0000-00-00 00:00:00'),
(63, 'Mangalore', 11, 0, '0000-00-00 00:00:00'),
(64, 'Puttur', 11, 0, '0000-00-00 00:00:00'),
(65, 'Bantwal', 11, 0, '0000-00-00 00:00:00'),
(66, 'Beltangadi', 11, 0, '0000-00-00 00:00:00'),
(67, 'Sulya', 11, 0, '0000-00-00 00:00:00'),
(68, 'Davanagere', 12, 0, '0000-00-00 00:00:00'),
(69, 'Harihar', 12, 0, '0000-00-00 00:00:00'),
(70, 'Channagiri', 12, 0, '0000-00-00 00:00:00'),
(71, 'Harpanahalli', 12, 0, '0000-00-00 00:00:00'),
(72, 'Honnali', 12, 0, '0000-00-00 00:00:00'),
(73, 'Jagalur', 12, 0, '0000-00-00 00:00:00'),
(74, 'Hubli-Dharwad', 13, 0, '0000-00-00 00:00:00'),
(75, 'Kalghatgi', 13, 0, '0000-00-00 00:00:00'),
(76, 'Kundgol', 13, 0, '0000-00-00 00:00:00'),
(77, 'Navalgund', 13, 0, '0000-00-00 00:00:00'),
(78, 'Gadag-Betigeri', 14, 0, '0000-00-00 00:00:00'),
(79, 'Nargund', 14, 0, '0000-00-00 00:00:00'),
(80, 'Mundargi', 14, 0, '0000-00-00 00:00:00'),
(81, 'Ron', 14, 0, '0000-00-00 00:00:00'),
(82, 'Shirhatti', 14, 0, '0000-00-00 00:00:00'),
(83, 'Gulbarga', 15, 0, '0000-00-00 00:00:00'),
(84, 'Aland', 15, 0, '0000-00-00 00:00:00'),
(85, 'Sedam', 15, 0, '0000-00-00 00:00:00'),
(86, 'Shahpur', 15, 0, '0000-00-00 00:00:00'),
(87, 'Shorapur', 15, 0, '0000-00-00 00:00:00'),
(88, 'Yadgir', 15, 0, '0000-00-00 00:00:00'),
(89, 'Afzalpur', 15, 0, '0000-00-00 00:00:00'),
(90, 'Chincholi', 15, 0, '0000-00-00 00:00:00'),
(91, 'Chitapur', 15, 0, '0000-00-00 00:00:00'),
(92, 'Jevargi', 15, 0, '0000-00-00 00:00:00'),
(93, 'Hassan', 16, 0, '0000-00-00 00:00:00'),
(94, 'Arsikere', 16, 0, '0000-00-00 00:00:00'),
(95, 'Channarayapattana', 16, 0, '0000-00-00 00:00:00'),
(96, 'Holenarsipur', 16, 0, '0000-00-00 00:00:00'),
(97, 'Sakleshpur', 16, 0, '0000-00-00 00:00:00'),
(98, 'Alur', 16, 0, '0000-00-00 00:00:00'),
(99, 'Arkalgud', 16, 0, '0000-00-00 00:00:00'),
(100, 'Belur', 16, 0, '0000-00-00 00:00:00'),
(101, 'Ranibennur', 17, 0, '0000-00-00 00:00:00'),
(102, 'Byadgi', 17, 0, '0000-00-00 00:00:00'),
(103, 'Hangal', 17, 0, '0000-00-00 00:00:00'),
(104, 'Haveri', 17, 0, '0000-00-00 00:00:00'),
(105, 'Savanur', 17, 0, '0000-00-00 00:00:00'),
(106, 'Hirekerur', 17, 0, '0000-00-00 00:00:00'),
(107, 'Shiggaon', 17, 0, '0000-00-00 00:00:00'),
(108, 'Madikeri', 18, 0, '0000-00-00 00:00:00'),
(109, 'Somvarpet', 18, 0, '0000-00-00 00:00:00'),
(110, 'Virajpet', 18, 0, '0000-00-00 00:00:00'),
(111, 'Chik Ballapur', 19, 0, '0000-00-00 00:00:00'),
(112, 'Chintamani', 19, 0, '0000-00-00 00:00:00'),
(113, 'Kolar', 19, 0, '0000-00-00 00:00:00'),
(114, 'Bangarapet', 19, 0, '0000-00-00 00:00:00'),
(115, 'Gauribidanur', 19, 0, '0000-00-00 00:00:00'),
(116, 'Malur', 19, 0, '0000-00-00 00:00:00'),
(117, 'Mulbagal', 19, 0, '0000-00-00 00:00:00'),
(118, 'Sidlaghatta', 19, 0, '0000-00-00 00:00:00'),
(119, 'Bagepalli', 19, 0, '0000-00-00 00:00:00'),
(120, 'Gudibanda', 19, 0, '0000-00-00 00:00:00'),
(121, 'Srinivaspur', 19, 0, '0000-00-00 00:00:00'),
(122, 'Gangawati', 20, 0, '0000-00-00 00:00:00'),
(123, 'Koppal', 20, 0, '0000-00-00 00:00:00'),
(124, 'Kushtagi', 20, 0, '0000-00-00 00:00:00'),
(125, 'Yelbarga', 20, 0, '0000-00-00 00:00:00'),
(126, 'Mandya', 21, 0, '0000-00-00 00:00:00'),
(127, 'Maddur', 21, 0, '0000-00-00 00:00:00'),
(128, 'Malavalli', 21, 0, '0000-00-00 00:00:00'),
(129, 'Shrirangapattana', 21, 0, '0000-00-00 00:00:00'),
(130, 'Krishnarajpet', 21, 0, '0000-00-00 00:00:00'),
(131, 'Nagamangala', 21, 0, '0000-00-00 00:00:00'),
(132, 'Pandavapura', 21, 0, '0000-00-00 00:00:00'),
(133, 'Mysore', 22, 0, '0000-00-00 00:00:00'),
(134, 'Hunsur', 22, 0, '0000-00-00 00:00:00'),
(135, 'Krishnarajanagar', 22, 0, '0000-00-00 00:00:00'),
(136, 'Nanjangud', 22, 0, '0000-00-00 00:00:00'),
(137, 'Heggadadevanakote', 22, 0, '0000-00-00 00:00:00'),
(138, 'Piriyapatna', 22, 0, '0000-00-00 00:00:00'),
(139, 'Tirumakudal-Narsipur', 22, 0, '0000-00-00 00:00:00'),
(140, 'Raichur', 23, 0, '0000-00-00 00:00:00'),
(141, 'Manvi', 23, 0, '0000-00-00 00:00:00'),
(142, 'Sindhnur', 23, 0, '0000-00-00 00:00:00'),
(143, 'Devadurga', 23, 0, '0000-00-00 00:00:00'),
(144, 'Lingsugur', 23, 0, '0000-00-00 00:00:00'),
(145, 'Bhadravati', 24, 0, '0000-00-00 00:00:00'),
(146, 'Shimoga', 24, 0, '0000-00-00 00:00:00'),
(147, 'Sagar', 24, 0, '0000-00-00 00:00:00'),
(148, 'Hosanagara', 24, 0, '0000-00-00 00:00:00'),
(149, 'Shikaripura', 24, 0, '0000-00-00 00:00:00'),
(150, 'Sorab', 24, 0, '0000-00-00 00:00:00'),
(151, 'Tirthahalli', 24, 0, '0000-00-00 00:00:00'),
(152, 'Tumkur', 25, 0, '0000-00-00 00:00:00'),
(153, 'Chiknayakanhalli', 25, 0, '0000-00-00 00:00:00'),
(154, 'Kunigal', 25, 0, '0000-00-00 00:00:00'),
(155, 'Madhugiri', 25, 0, '0000-00-00 00:00:00'),
(156, 'Sira', 25, 0, '0000-00-00 00:00:00'),
(157, 'Tiptur', 25, 0, '0000-00-00 00:00:00'),
(158, 'Gubbi', 25, 0, '0000-00-00 00:00:00'),
(159, 'Koratagere', 25, 0, '0000-00-00 00:00:00'),
(160, 'Pavagada', 25, 0, '0000-00-00 00:00:00'),
(161, 'Turuvekere', 25, 0, '0000-00-00 00:00:00'),
(162, 'Udupi', 26, 0, '0000-00-00 00:00:00'),
(163, 'Karkal', 26, 0, '0000-00-00 00:00:00'),
(164, 'Kundapura', 26, 0, '0000-00-00 00:00:00'),
(165, 'Karwar', 27, 0, '0000-00-00 00:00:00'),
(166, 'Sirsi', 27, 0, '0000-00-00 00:00:00'),
(167, 'Joida', 27, 0, '0000-00-00 00:00:00'),
(168, 'Dandeli', 27, 0, '0000-00-00 00:00:00'),
(169, 'Bhatkal', 27, 0, '0000-00-00 00:00:00'),
(170, 'Kumta', 27, 0, '0000-00-00 00:00:00'),
(171, 'Ankola', 27, 0, '0000-00-00 00:00:00'),
(172, 'Haliyal', 27, 0, '0000-00-00 00:00:00'),
(173, 'Honavar', 27, 0, '0000-00-00 00:00:00'),
(174, 'Mundgod', 27, 0, '0000-00-00 00:00:00'),
(175, 'Siddapur', 27, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_taluklist-1`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_taluklist-1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `ourbank_master_taluklist-1`
--

INSERT INTO `ourbank_master_taluklist-1` (`id`, `name`, `district_id`, `created_by`, `created_date`) VALUES
(1, 'Alappanagudde', 0, 0, '0000-00-00 00:00:00'),
(2, 'Ammanahatti', 0, 0, '0000-00-00 00:00:00'),
(3, 'Amruthur', 0, 0, '0000-00-00 00:00:00'),
(4, 'Beeraganahalli', 0, 0, '0000-00-00 00:00:00'),
(5, 'Belligere', 0, 0, '0000-00-00 00:00:00'),
(6, 'Benavara', 0, 0, '0000-00-00 00:00:00'),
(7, 'Bettahalli', 0, 0, '0000-00-00 00:00:00'),
(8, 'Bidarakattepalya ', 0, 0, '0000-00-00 00:00:00'),
(9, 'Bilidevalaya', 0, 0, '0000-00-00 00:00:00'),
(10, 'Bisinele', 0, 0, '0000-00-00 00:00:00'),
(11, 'Boralinganapalya', 0, 0, '0000-00-00 00:00:00'),
(12, 'Bydagere', 0, 0, '0000-00-00 00:00:00'),
(13, 'Chandanahalli', 0, 0, '0000-00-00 00:00:00'),
(14, 'Chikka Arjunahalli', 0, 0, '0000-00-00 00:00:00'),
(15, 'Chottanahalli ', 0, 0, '0000-00-00 00:00:00'),
(16, 'Choudarypalya', 0, 0, '0000-00-00 00:00:00'),
(17, 'Devarakanasandra', 0, 0, '0000-00-00 00:00:00'),
(18, 'Devarayanapalya', 0, 0, '0000-00-00 00:00:00'),
(19, 'Doddakallahalli', 0, 0, '0000-00-00 00:00:00'),
(20, 'Doddamadure', 0, 0, '0000-00-00 00:00:00'),
(21, 'Dombarahatti', 0, 0, '0000-00-00 00:00:00'),
(22, 'Gajjanapalya', 0, 0, '0000-00-00 00:00:00'),
(23, 'Giriyappanapalya', 0, 0, '0000-00-00 00:00:00'),
(24, 'Gollarahatti', 0, 0, '0000-00-00 00:00:00'),
(25, 'Gowdagere', 0, 0, '0000-00-00 00:00:00'),
(26, 'H.B.Shettihalli', 0, 0, '0000-00-00 00:00:00'),
(27, 'Hadonahalli', 0, 0, '0000-00-00 00:00:00'),
(28, 'Halagere', 0, 0, '0000-00-00 00:00:00'),
(29, 'Hanchipura', 0, 0, '0000-00-00 00:00:00'),
(30, 'Handalagere', 0, 0, '0000-00-00 00:00:00'),
(31, 'Hanumapura', 0, 0, '0000-00-00 00:00:00'),
(32, 'Heddigere', 0, 0, '0000-00-00 00:00:00'),
(33, 'Helavarahatti', 0, 0, '0000-00-00 00:00:00'),
(34, 'Holalagunda ', 0, 0, '0000-00-00 00:00:00'),
(35, 'Hosahalli', 0, 0, '0000-00-00 00:00:00'),
(36, 'Hosakere', 0, 0, '0000-00-00 00:00:00'),
(37, 'Hosuru', 0, 0, '0000-00-00 00:00:00'),
(38, 'Hulivana', 0, 0, '0000-00-00 00:00:00'),
(39, 'Indiranagara', 0, 0, '0000-00-00 00:00:00'),
(40, 'Jaladigere', 0, 0, '0000-00-00 00:00:00'),
(41, 'Janatha Coloni', 0, 0, '0000-00-00 00:00:00'),
(42, 'Jiddigere', 0, 0, '0000-00-00 00:00:00'),
(43, 'Jinnaagara', 0, 0, '0000-00-00 00:00:00'),
(44, 'Jivajihatti', 0, 0, '0000-00-00 00:00:00'),
(45, 'Kadashettihalli', 0, 0, '0000-00-00 00:00:00'),
(46, 'Kagganahalli', 0, 0, '0000-00-00 00:00:00'),
(47, 'Kaggere', 0, 0, '0000-00-00 00:00:00'),
(48, 'Kalasegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(49, 'Kanchagalapura', 0, 0, '0000-00-00 00:00:00'),
(50, 'Kannaguni', 0, 0, '0000-00-00 00:00:00'),
(51, 'Kantanahalli', 0, 0, '0000-00-00 00:00:00'),
(52, 'Kattigehalli', 0, 0, '0000-00-00 00:00:00'),
(53, 'KH halli', 0, 0, '0000-00-00 00:00:00'),
(54, 'Kiranguru', 0, 0, '0000-00-00 00:00:00'),
(55, 'Kittaghatta', 0, 0, '0000-00-00 00:00:00'),
(56, 'Kodipalya', 0, 0, '0000-00-00 00:00:00'),
(57, 'Koppa', 0, 0, '0000-00-00 00:00:00'),
(58, 'Korati', 0, 0, '0000-00-00 00:00:00'),
(59, 'Kottegere', 0, 0, '0000-00-00 00:00:00'),
(60, 'Kuppe', 0, 0, '0000-00-00 00:00:00'),
(61, 'kuvempunagar', 0, 0, '0000-00-00 00:00:00'),
(62, 'Madihalli', 0, 0, '0000-00-00 00:00:00'),
(63, 'Madihalli', 0, 0, '0000-00-00 00:00:00'),
(64, 'Madurepalya', 0, 0, '0000-00-00 00:00:00'),
(65, 'Mallapura', 0, 0, '0000-00-00 00:00:00'),
(66, 'Mantya', 0, 0, '0000-00-00 00:00:00'),
(67, 'Markonahalli', 0, 0, '0000-00-00 00:00:00'),
(68, 'Megala Tenginmaradapalya', 0, 0, '0000-00-00 00:00:00'),
(69, 'Megalaplya', 0, 0, '0000-00-00 00:00:00'),
(70, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(71, 'Muttugadahalli', 0, 0, '0000-00-00 00:00:00'),
(72, 'Nagasandra', 0, 0, '0000-00-00 00:00:00'),
(73, 'Nagegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(74, 'Paduvagere', 0, 0, '0000-00-00 00:00:00'),
(75, 'Pallerayanahalli', 0, 0, '0000-00-00 00:00:00'),
(76, 'Puttanapalya', 0, 0, '0000-00-00 00:00:00'),
(77, 'Rangegoudanapalya', 0, 0, '0000-00-00 00:00:00'),
(78, 'Renukanagara', 0, 0, '0000-00-00 00:00:00'),
(79, 'Sanaba', 0, 0, '0000-00-00 00:00:00'),
(80, 'Sanabagatta', 0, 0, '0000-00-00 00:00:00'),
(81, 'Shanuboganahalli', 0, 0, '0000-00-00 00:00:00'),
(82, 'Shattihalli', 0, 0, '0000-00-00 00:00:00'),
(83, 'Shettibidu', 0, 0, '0000-00-00 00:00:00'),
(84, 'Siddapura ', 0, 0, '0000-00-00 00:00:00'),
(85, 'Singatihalli', 0, 0, '0000-00-00 00:00:00'),
(86, 'Sondekoppa', 0, 0, '0000-00-00 00:00:00'),
(87, 'Tenginamaradapalya', 0, 0, '0000-00-00 00:00:00'),
(88, 'Thathayyanapalya', 0, 0, '0000-00-00 00:00:00'),
(89, 'Thippur', 0, 0, '0000-00-00 00:00:00'),
(90, 'Timmegowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(91, 'Tippuru', 0, 0, '0000-00-00 00:00:00'),
(92, 'Tubinakere', 0, 0, '0000-00-00 00:00:00'),
(93, 'Turuganuru', 0, 0, '0000-00-00 00:00:00'),
(94, 'Ungara', 0, 0, '0000-00-00 00:00:00'),
(95, 'Urkehalli', 0, 0, '0000-00-00 00:00:00'),
(96, 'Valagerepura', 0, 0, '0000-00-00 00:00:00'),
(97, 'Venkategowdanapalya', 0, 0, '0000-00-00 00:00:00'),
(98, 'Y.Hampapura', 0, 0, '0000-00-00 00:00:00'),
(99, 'Yachanahalli', 0, 0, '0000-00-00 00:00:00'),
(100, 'Yadavani', 0, 0, '0000-00-00 00:00:00'),
(101, 'Yadiyur', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_units`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_master_units`
--

INSERT INTO `ourbank_master_units` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'kilograms', 1, '2011-04-19 13:17:16'),
(2, 'bags', 1, '2011-04-19 13:17:28'),
(3, 'quintals', 1, '2011-04-19 13:17:50');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_village`
--

INSERT INTO `ourbank_master_village` (`id`, `village_id`, `panchayath_id`, `hobli_id`, `taluk_id`, `district_id`, `state_id`, `created_by`, `created_date`) VALUES
(1, 8, 1, 1, 154, 25, 0, 1, '2011-05-10 15:06:14'),
(2, 9, 3, 3, 158, 25, 0, 1, '2011-05-10 15:08:23'),
(3, 10, 4, 4, 158, 25, 0, 1, '2011-05-10 15:51:36'),
(4, 11, 2, 2, 154, 25, 0, 1, '2011-05-10 15:52:45'),
(5, 12, 3, 3, 158, 25, 0, 1, '2011-05-10 15:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_village1`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_village1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `hobli_id` int(11) NOT NULL,
  `panchayath_id` int(11) NOT NULL,
  `taluk_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `state_id` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_master_village1`
--

INSERT INTO `ourbank_master_village1` (`id`, `village_id`, `hobli_id`, `panchayath_id`, `taluk_id`, `district_id`, `state_id`, `created_by`, `created_date`) VALUES
(1, 102, 0, 0, 84, 89, 0, 1, '2011-02-09 13:15:26'),
(2, 104, 0, 0, 85, 101, 0, 1, '2011-02-09 13:24:33'),
(3, 105, 0, 0, 92, 86, 0, 1, '2011-02-09 13:25:25'),
(4, 106, 0, 0, 85, 98, 0, 1, '2011-02-09 13:25:47'),
(5, 107, 0, 0, 84, 99, 0, 1, '2011-02-09 13:26:08'),
(6, 30, 0, 0, 83, 84, 0, 1, '2011-02-24 00:00:00'),
(7, 5, 0, 0, 85, 52, 0, 1, '2011-02-28 16:15:43'),
(8, 6, 0, 0, 83, 86, 0, 1, '2011-02-28 16:16:43'),
(9, 7, 0, 0, 84, 69, 0, 1, '2011-02-28 16:17:03'),
(10, 8, 0, 0, 83, 26, 0, 1, '2011-02-28 16:17:31'),
(11, 9, 0, 0, 86, 86, 0, 1, '2011-03-25 13:43:14'),
(12, 14, 12, 16, 3, 1, 0, 1, '2011-04-26 00:00:00'),
(13, 15, 1, 5, 1, 1, 0, 1, '2011-04-28 15:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_villagelist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_villagelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=122 ;

--
-- Dumping data for table `ourbank_master_villagelist`
--

INSERT INTO `ourbank_master_villagelist` (`id`, `village_id`, `name`, `created_by`, `created_date`) VALUES
(1, 0, 'Alappanagudde', 0, '0000-00-00 00:00:00'),
(2, 0, 'Ammanahatti', 0, '0000-00-00 00:00:00'),
(3, 0, 'Amruthur', 0, '0000-00-00 00:00:00'),
(4, 0, 'Beeraganahalli', 0, '0000-00-00 00:00:00'),
(5, 0, 'Belligere', 0, '0000-00-00 00:00:00'),
(6, 0, 'Benavara', 0, '0000-00-00 00:00:00'),
(7, 0, 'Bettahalli', 0, '0000-00-00 00:00:00'),
(8, 0, 'Bidarakattepalya ', 0, '0000-00-00 00:00:00'),
(9, 0, 'Bilidevalaya', 0, '0000-00-00 00:00:00'),
(10, 0, 'Bisinele', 0, '0000-00-00 00:00:00'),
(11, 0, 'Boralinganapalya', 0, '0000-00-00 00:00:00'),
(12, 0, 'Bydagere', 0, '0000-00-00 00:00:00'),
(13, 0, 'Chandanahalli', 0, '0000-00-00 00:00:00'),
(14, 0, 'Chikka Arjunahalli', 0, '0000-00-00 00:00:00'),
(15, 0, 'Chottanahalli ', 0, '0000-00-00 00:00:00'),
(16, 0, 'Choudarypalya', 0, '0000-00-00 00:00:00'),
(17, 0, 'Devarakanasandra', 0, '0000-00-00 00:00:00'),
(18, 0, 'Devarayanapalya', 0, '0000-00-00 00:00:00'),
(19, 0, 'Doddakallahalli', 0, '0000-00-00 00:00:00'),
(20, 0, 'Doddamadure', 0, '0000-00-00 00:00:00'),
(21, 0, 'Dombarahatti', 0, '0000-00-00 00:00:00'),
(22, 0, 'Gajjanapalya', 0, '0000-00-00 00:00:00'),
(23, 0, 'Giriyappanapalya', 0, '0000-00-00 00:00:00'),
(24, 0, 'Gollarahatti', 0, '0000-00-00 00:00:00'),
(25, 0, 'Gowdagere', 0, '0000-00-00 00:00:00'),
(26, 0, 'H.B.Shettihalli', 0, '0000-00-00 00:00:00'),
(27, 0, 'Hadonahalli', 0, '0000-00-00 00:00:00'),
(28, 0, 'Halagere', 0, '0000-00-00 00:00:00'),
(29, 0, 'Hanchipura', 0, '0000-00-00 00:00:00'),
(30, 0, 'Handalagere', 0, '0000-00-00 00:00:00'),
(31, 0, 'Hanumapura', 0, '0000-00-00 00:00:00'),
(32, 0, 'Heddigere', 0, '0000-00-00 00:00:00'),
(33, 0, 'Helavarahatti', 0, '0000-00-00 00:00:00'),
(34, 0, 'Holalagunda ', 0, '0000-00-00 00:00:00'),
(35, 0, 'Hosahalli', 0, '0000-00-00 00:00:00'),
(36, 0, 'Hosakere', 0, '0000-00-00 00:00:00'),
(37, 0, 'Hosuru', 0, '0000-00-00 00:00:00'),
(38, 0, 'Hulivana', 0, '0000-00-00 00:00:00'),
(39, 0, 'Indiranagara', 0, '0000-00-00 00:00:00'),
(40, 0, 'Jaladigere', 0, '0000-00-00 00:00:00'),
(41, 0, 'Janatha Coloni', 0, '0000-00-00 00:00:00'),
(42, 0, 'Jiddigere', 0, '0000-00-00 00:00:00'),
(43, 0, 'Jinnaagara', 0, '0000-00-00 00:00:00'),
(44, 0, 'Jivajihatti', 0, '0000-00-00 00:00:00'),
(45, 0, 'Kadashettihalli', 0, '0000-00-00 00:00:00'),
(46, 0, 'Kagganahalli', 0, '0000-00-00 00:00:00'),
(47, 0, 'Kaggere', 0, '0000-00-00 00:00:00'),
(48, 0, 'Kalasegowdanapalya', 0, '0000-00-00 00:00:00'),
(49, 0, 'Kanchagalapura', 0, '0000-00-00 00:00:00'),
(50, 0, 'Kannaguni', 0, '0000-00-00 00:00:00'),
(51, 0, 'Kantanahalli', 0, '0000-00-00 00:00:00'),
(52, 0, 'Kattigehalli', 0, '0000-00-00 00:00:00'),
(53, 0, 'KH halli', 0, '0000-00-00 00:00:00'),
(54, 0, 'Kiranguru', 0, '0000-00-00 00:00:00'),
(55, 0, 'Kittaghatta', 0, '0000-00-00 00:00:00'),
(56, 0, 'Kodipalya', 0, '0000-00-00 00:00:00'),
(57, 0, 'Koppa', 0, '0000-00-00 00:00:00'),
(58, 0, 'Korati', 0, '0000-00-00 00:00:00'),
(59, 0, 'Kottegere', 0, '0000-00-00 00:00:00'),
(60, 0, 'Kuppe', 0, '0000-00-00 00:00:00'),
(61, 0, 'kuvempunagar', 0, '0000-00-00 00:00:00'),
(62, 0, 'Madihalli', 0, '0000-00-00 00:00:00'),
(63, 0, 'Madihalli', 0, '0000-00-00 00:00:00'),
(64, 0, 'Madurepalya', 0, '0000-00-00 00:00:00'),
(65, 0, 'Mallapura', 0, '0000-00-00 00:00:00'),
(66, 0, 'Mantya', 0, '0000-00-00 00:00:00'),
(67, 0, 'Markonahalli', 0, '0000-00-00 00:00:00'),
(68, 0, 'Megala Tenginmaradapalya', 0, '0000-00-00 00:00:00'),
(69, 0, 'Megalaplya', 0, '0000-00-00 00:00:00'),
(70, 0, 'Muttugadahalli', 0, '0000-00-00 00:00:00'),
(71, 0, 'Muttugadahalli', 0, '0000-00-00 00:00:00'),
(72, 0, 'Nagasandra', 0, '0000-00-00 00:00:00'),
(73, 0, 'Nagegowdanapalya', 0, '0000-00-00 00:00:00'),
(74, 0, 'Paduvagere', 0, '0000-00-00 00:00:00'),
(75, 0, 'Pallerayanahalli', 0, '0000-00-00 00:00:00'),
(76, 0, 'Puttanapalya', 0, '0000-00-00 00:00:00'),
(77, 0, 'Rangegoudanapalya', 0, '0000-00-00 00:00:00'),
(78, 0, 'Renukanagara', 0, '0000-00-00 00:00:00'),
(79, 0, 'Sanaba', 0, '0000-00-00 00:00:00'),
(80, 0, 'Sanabagatta', 0, '0000-00-00 00:00:00'),
(81, 0, 'Shanuboganahalli', 0, '0000-00-00 00:00:00'),
(82, 0, 'Shattihalli', 0, '0000-00-00 00:00:00'),
(83, 0, 'Shettibidu', 0, '0000-00-00 00:00:00'),
(84, 0, 'Siddapura ', 0, '0000-00-00 00:00:00'),
(85, 0, 'Singatihalli', 0, '0000-00-00 00:00:00'),
(86, 0, 'Sondekoppa', 0, '0000-00-00 00:00:00'),
(87, 0, 'Tenginamaradapalya', 0, '0000-00-00 00:00:00'),
(88, 0, 'Thathayyanapalya', 0, '0000-00-00 00:00:00'),
(89, 0, 'Thippur', 0, '0000-00-00 00:00:00'),
(90, 0, 'Timmegowdanapalya', 0, '0000-00-00 00:00:00'),
(91, 0, 'Tippuru', 0, '0000-00-00 00:00:00'),
(92, 0, 'Tubinakere', 0, '0000-00-00 00:00:00'),
(93, 0, 'Turuganuru', 0, '0000-00-00 00:00:00'),
(94, 0, 'Ungara', 0, '0000-00-00 00:00:00'),
(95, 0, 'Urkehalli', 0, '0000-00-00 00:00:00'),
(96, 0, 'Valagerepura', 0, '0000-00-00 00:00:00'),
(97, 0, 'Venkategowdanapalya', 0, '0000-00-00 00:00:00'),
(98, 0, 'Y.Hampapura', 0, '0000-00-00 00:00:00'),
(99, 0, 'Yachanahalli', 0, '0000-00-00 00:00:00'),
(100, 0, 'Yadavani', 0, '0000-00-00 00:00:00'),
(101, 0, 'Yadiyur', 0, '0000-00-00 00:00:00'),
(102, 0, 'kodanahalli', 1, '2011-02-14 16:18:16'),
(103, 30, 'village1', 1, '2011-02-24 20:22:43'),
(104, 5, 'Jalahalli', 1, '2011-02-28 16:15:43'),
(105, 6, 'Goravana halli', 1, '2011-02-28 16:16:43'),
(106, 7, 'Kurubara halli ', 1, '2011-02-28 16:17:03'),
(107, 8, 'Gutta halli', 1, '2011-02-28 16:17:31'),
(108, 9, 'Kammana halli', 1, '2011-03-25 13:43:14'),
(109, 10, 'Nagasandra', 1, '2011-04-15 11:38:55'),
(110, 12, 'Vinobanagara', 1, '2011-04-15 11:58:28'),
(111, 13, 'Magadipalya', 1, '2011-04-15 11:59:32'),
(112, 14, 'Gubbi', 1, '2011-04-15 12:08:53'),
(113, 15, 'Chilaganahalli', 1, '2011-04-15 12:10:08'),
(114, 16, 'mavukere', 1, '2011-04-15 12:11:55'),
(115, 17, 'lingenshslli', 1, '2011-04-15 12:13:12'),
(116, 18, 'Yediyur', 1, '2011-04-15 12:36:59'),
(117, 21, 'A Hosahalli', 1, '2011-04-15 13:04:57'),
(118, 0, 'Gokula', 0, '0000-00-00 00:00:00'),
(119, 22, 'Baddihalli-Tumkur', 1, '2011-04-15 13:50:41'),
(120, 23, 'Gokula - Tumkur', 1, '2011-04-15 13:51:19'),
(121, 25, 'Vinayakanagara_TMK', 1, '2011-04-15 13:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_weekdays`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_weekdays` (
  `id` int(3) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_master_weekdays`
--

INSERT INTO `ourbank_master_weekdays` (`id`, `name`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_memberattendance_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_modules`
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
  `date_of_value` date NOT NULL,
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
  `date_of_value` date NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_office`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_office1`
--

CREATE TABLE IF NOT EXISTS `ourbank_office1` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_office1`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_officehierarchy`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_officehierarchy1`
--

CREATE TABLE IF NOT EXISTS `ourbank_officehierarchy1` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Hierarchy_level` smallint(5) NOT NULL,
  `created_userid` int(10) NOT NULL,
  `createddate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `officetype` (`type`),
  UNIQUE KEY `officeshort_name` (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_officehierarchy1`
--


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
  `record_id` int(100) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `officetype_id` smallint(5) NOT NULL,
  `parentoffice_id` smallint(5) NOT NULL,
  `createddate` date NOT NULL,
  `createdby` int(10) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `Parent_Office_ID` (`parentoffice_id`),
  KEY `Office_Type_ID` (`officetype_id`),
  KEY `Created_By` (`createdby`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_paymenttypes`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_product`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_productsloan_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_productsoffer`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_productsoffer_log`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_Recordstatus`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_transaction`
--


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
  `department` int(50) NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` int(11) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_user`
--

INSERT INTO `ourbank_user` (`id`, `bank_id`, `name`, `gender`, `designation`, `department`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 1, 'admin', 1, 4, 1, 'admin', 'admin', 1, 0, '2011-05-03 18:16:03'),
(2, 3, 'lakshmi', 2, 5, 3, 'lakshmi', 'lakshmi', 2, 0, '2011-04-12 20:00:10'),
(3, 2, 'Prakash', 1, 4, 2, 'prakash', 'prakash', 1, 0, '2011-04-12 20:01:36'),
(5, 9, 'Loan Officer', 1, 4, 4, 'eswar', 'eswar', 2, 0, '2011-04-16 10:30:29'),
(6, 10, 'eswara', 1, 1, 1, 'eshumanju', 'manjunath', 1, 0, '2011-04-15 16:44:10');

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


-- --------------------------------------------------------

--
-- Table structure for table `phone_family`
--

CREATE TABLE IF NOT EXISTS `phone_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `select1_0` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textfield1_0` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textfield1_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select1_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select1_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RadioGroup1_0` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select1_3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RadioGroup1_3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RadioGroup1_4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textfield1_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RadioGroup1_5` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select1_4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `phone_family`
--


-- --------------------------------------------------------

--
-- Table structure for table `phone_family_member`
--

CREATE TABLE IF NOT EXISTS `phone_family_member` (
  `family_id` int(11) NOT NULL,
  `select2_1_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_5` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_6` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_7` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_8` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_9` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_10` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_11` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_12` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_13` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `select2_1_14` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textfield2_1_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textfield2_1_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phone_family_member`
--

