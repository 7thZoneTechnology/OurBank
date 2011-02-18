-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2011 at 01:49 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `a`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `submodule_id` tinyint(4) NOT NULL,
  `id` mediumint(9) NOT NULL,
  `address1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--


-- --------------------------------------------------------

--
-- Table structure for table `address_log`
--

CREATE TABLE IF NOT EXISTS `address_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` tinyint(4) NOT NULL,
  `id` mediumint(9) NOT NULL,
  `address1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `address_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
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
-- Dumping data for table `contact`
--


-- --------------------------------------------------------

--
-- Table structure for table `contact_log`
--

CREATE TABLE IF NOT EXISTS `contact_log` (
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
-- Dumping data for table `contact_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `sex`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `ob_accounts`
--

CREATE TABLE IF NOT EXISTS `ob_accounts` (
  `account_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(11) NOT NULL,
  `activity_id` smallint(6) NOT NULL,
  `creditline_id` smallint(5) NOT NULL,
  `membertype_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  `Status_Description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `accountstatus_id` int(5) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_accounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_activity`
--

CREATE TABLE IF NOT EXISTS `ob_activity` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sector_id` tinyint(4) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_activity`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_activity_log`
--

CREATE TABLE IF NOT EXISTS `ob_activity_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `sector_id` tinyint(4) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_activity_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_attendance`
--

CREATE TABLE IF NOT EXISTS `ob_attendance` (
  `record_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_attendance`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_attendance_log`
--

CREATE TABLE IF NOT EXISTS `ob_attendance_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_attendance_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_bank`
--

CREATE TABLE IF NOT EXISTS `ob_bank` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_bank`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_bank_log`
--

CREATE TABLE IF NOT EXISTS `ob_bank_log` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_bank_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_creditline`
--

CREATE TABLE IF NOT EXISTS `ob_creditline` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `portfolio` float(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(2) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_creditline`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_creditline_log`
--

CREATE TABLE IF NOT EXISTS `ob_creditline_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `portfolio` float(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(2) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_creditline_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_currency`
--

CREATE TABLE IF NOT EXISTS `ob_currency` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `shortname` varchar(5) DEFAULT NULL,
  `country_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ob_currency`
--

INSERT INTO `ob_currency` (`id`, `name`, `symbol`, `shortname`, `country_id`) VALUES
(1, 'Indian Rupee', 'Rs', 'INR', 1),
(2, 'US Dollar', '$', 'USD', 2),
(3, 'YEN', 'Ye', 'YEN', 3),
(4, 'Britain Pounds', 'L', 'P', 40),
(5, 'United Arab Emirates dirhams', 'D', 'UAE D', 5),
(6, 'Euro', 'EU', 'EUR', 6),
(7, 'Australian Dollar', '$', 'AU D', 7),
(8, 'Oman Riyals', 'R', 'ORY', 8),
(9, 'Brazilian real', 'R$', 'BRL', 9);

-- --------------------------------------------------------

--
-- Table structure for table `ob_deleted_details`
--

CREATE TABLE IF NOT EXISTS `ob_deleted_details` (
  `module_id` tinyint(4) NOT NULL,
  `submodule_id` tinyint(4) NOT NULL,
  `id` mediumint(9) NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by` mediumint(9) NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ob_deleted_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_designation`
--

CREATE TABLE IF NOT EXISTS `ob_designation` (
  `designation_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ob_designation`
--

INSERT INTO `ob_designation` (`designation_id`, `designation_name`) VALUES
(1, 'Manager'),
(2, 'Clerk');

-- --------------------------------------------------------

--
-- Table structure for table `ob_fee`
--

CREATE TABLE IF NOT EXISTS `ob_fee` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `membertype_id` smallint(5) NOT NULL,
  `action_id` smallint(5) NOT NULL,
  `frequency_id` smallint(5) NOT NULL,
  `glsubcode_id` int(5) NOT NULL,
  `defaultfee` char(1) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_fee`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_fee_log`
--

CREATE TABLE IF NOT EXISTS `ob_fee_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `membertype_id` smallint(5) NOT NULL,
  `action_id` smallint(5) NOT NULL,
  `frequency_id` smallint(5) NOT NULL,
  `glsubcode_id` int(5) NOT NULL,
  `defaultfee` char(1) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(10) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_fee_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_funder`
--

CREATE TABLE IF NOT EXISTS `ob_funder` (
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
-- Dumping data for table `ob_funder`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_funder_log`
--

CREATE TABLE IF NOT EXISTS `ob_funder_log` (
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
-- Dumping data for table `ob_funder_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_funder_types`
--

CREATE TABLE IF NOT EXISTS `ob_funder_types` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `fundertype` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_funder_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_funding`
--

CREATE TABLE IF NOT EXISTS `ob_funding` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `institution_id` int(10) NOT NULL,
  `intrest` int(10) NOT NULL,
  `currency_id` int(5) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `exchangerate` decimal(10,2) NOT NULL,
  `glsubcode_id` int(11) NOT NULL,
  `accounting_line` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `beginingdate` date NOT NULL,
  `closingdate` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_funding`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_funding_log`
--

CREATE TABLE IF NOT EXISTS `ob_funding_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `institution_id` int(10) NOT NULL,
  `intrest` int(10) NOT NULL,
  `currency_id` int(5) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `exchangerate` decimal(10,2) NOT NULL,
  `glsubcode_id` smallint(15) NOT NULL,
  `accounting_line` smallint(5) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `beginingdate` date NOT NULL,
  `closingdate` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_funding_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_graceperiod`
--

CREATE TABLE IF NOT EXISTS `ob_graceperiod` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `days` tinyint(4) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_graceperiod`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_graceperiod_log`
--

CREATE TABLE IF NOT EXISTS `ob_graceperiod_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` tinyint(4) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `days` tinyint(4) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_graceperiod_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_grant`
--

CREATE TABLE IF NOT EXISTS `ob_grant` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_grant`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_grantactivity`
--

CREATE TABLE IF NOT EXISTS `ob_grantactivity` (
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
-- Dumping data for table `ob_grantactivity`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_grantactivity_log`
--

CREATE TABLE IF NOT EXISTS `ob_grantactivity_log` (
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
-- Dumping data for table `ob_grantactivity_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_grant_log`
--

CREATE TABLE IF NOT EXISTS `ob_grant_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `created_date` date NOT NULL,
  `created_by` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_grant_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_group`
--

CREATE TABLE IF NOT EXISTS `ob_group` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bank_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_head` mediumint(9) NOT NULL,
  `groupcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `group_created_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_groupmemberloan_disbursement`
--

CREATE TABLE IF NOT EXISTS `ob_groupmemberloan_disbursement` (
  `groupmemberloandisbursement_id` int(10) NOT NULL AUTO_INCREMENT,
  `groupmembertransaction_id` int(10) NOT NULL,
  `groupaccount_id` int(10) NOT NULL,
  `groupmemberaccount_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `loandisbursement_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loanpayment_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `groupmember_loanamount` float(10,2) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`groupmemberloandisbursement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_groupmemberloan_disbursement`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_groupmemberloan_repayment`
--

CREATE TABLE IF NOT EXISTS `ob_groupmemberloan_repayment` (
  `groupmemberloanrepayment_id` int(10) NOT NULL AUTO_INCREMENT,
  `groupmembertransaction_id` int(10) NOT NULL,
  `groupaccount_id` int(10) NOT NULL,
  `groupmemberaccount_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `groupmemberloaninstallment_number` smallint(5) NOT NULL,
  `groupmemberloaninstallmentpaid_date` date NOT NULL,
  `groupmemberloaninstallmentpaid_amount` float(10,2) NOT NULL,
  `groupmemberloaninstallmentpaid_interst` float(10,2) NOT NULL,
  `groupmemberloaninstallmentpaid_other_amount` float(10,2) NOT NULL,
  `groupmemberloaninstallmentpaid_mode` smallint(5) NOT NULL,
  `groupmemberloaninstallmentpaid_details` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`groupmemberloanrepayment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_groupmemberloan_repayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_groupmembers`
--

CREATE TABLE IF NOT EXISTS `ob_groupmembers` (
  `id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `groupmember_status` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ob_groupmembers`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_groupmembers_accounts`
--

CREATE TABLE IF NOT EXISTS `ob_groupmembers_accounts` (
  `groupmemberaccount_id` int(10) NOT NULL AUTO_INCREMENT,
  `groupaccount_id` int(10) NOT NULL,
  `groupmember_id` int(10) NOT NULL,
  `activity_id` smallint(5) NOT NULL,
  `groupmember_account_status` smallint(5) NOT NULL,
  `groupcreateddate` date NOT NULL,
  `groupcreatedby` int(10) NOT NULL,
  PRIMARY KEY (`groupmemberaccount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_groupmembers_accounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_group_log`
--

CREATE TABLE IF NOT EXISTS `ob_group_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` mediumint(9) NOT NULL,
  `bank_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_head` mediumint(9) NOT NULL,
  `groupcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `group_created_date` date NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_group_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_installmentdetails`
--

CREATE TABLE IF NOT EXISTS `ob_installmentdetails` (
  `Installmentserial_id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `accountinstallment_id` smallint(5) NOT NULL,
  `accountinstallment_date` date NOT NULL,
  `accountinstallment_amount` float(10,2) NOT NULL,
  `accountinstallment_interest_amount` float(10,2) NOT NULL,
  `billet` float(10,2) NOT NULL,
  `installment_principal_amount` float(10,2) NOT NULL,
  `installment_principalreduceing_amount` float(10,2) NOT NULL,
  `current_due` float(10,2) NOT NULL,
  `paid_date` date DEFAULT NULL,
  `installment_status` tinyint(4) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`Installmentserial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_installmentdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_installmentstatus`
--

CREATE TABLE IF NOT EXISTS `ob_installmentstatus` (
  `installmentstatus_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `statusdescription` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`installmentstatus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ob_installmentstatus`
--

INSERT INTO `ob_installmentstatus` (`installmentstatus_id`, `statusdescription`) VALUES
(1, 'Open'),
(2, 'Paid'),
(3, 'Due'),
(4, 'Next due'),
(5, 'Over due'),
(6, 'Hold'),
(7, 'Closed'),
(8, 'partial payment');

-- --------------------------------------------------------

--
-- Table structure for table `ob_institution`
--

CREATE TABLE IF NOT EXISTS `ob_institution` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_institution`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_institution_log`
--

CREATE TABLE IF NOT EXISTS `ob_institution_log` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_institution_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_interest_rates`
--

CREATE TABLE IF NOT EXISTS `ob_interest_rates` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `start_range` float(8,2) NOT NULL,
  `end_range` float(8,2) NOT NULL,
  `rate` float(5,2) NOT NULL,
  `fee` float(10,2) NOT NULL,
  `ballet` int(10) NOT NULL,
  `status` int(5) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_interest_rates`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_interest_rates_log`
--

CREATE TABLE IF NOT EXISTS `ob_interest_rates_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `start_range` float(8,2) NOT NULL,
  `end_range` float(8,2) NOT NULL,
  `rate` float(5,2) NOT NULL,
  `fee` float(10,2) NOT NULL,
  `ballet` int(10) NOT NULL,
  `status` int(5) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_interest_rates_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_interest_types`
--

CREATE TABLE IF NOT EXISTS `ob_interest_types` (
  `interesttype_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`interesttype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ob_interest_types`
--

INSERT INTO `ob_interest_types` (`interesttype_id`, `description`) VALUES
(1, 'Flat'),
(2, 'Declining capital'),
(3, 'Periodical interest');

-- --------------------------------------------------------

--
-- Table structure for table `ob_language`
--

CREATE TABLE IF NOT EXISTS `ob_language` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `code` varchar(5) CHARACTER SET utf8 NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ob_language`
--

INSERT INTO `ob_language` (`id`, `name`, `code`, `active`) VALUES
(1, 'english', 'en', 1),
(2, 'hindi', 'hi_IN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ob_loan_accounts`
--

CREATE TABLE IF NOT EXISTS `ob_loan_accounts` (
  `loanaccount_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` mediumint(9) NOT NULL,
  `loanstatus_id` tinyint(1) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `loansanctioned_date` date NOT NULL,
  `loan_amount` float(10,2) NOT NULL,
  `loan_installments` smallint(6) NOT NULL,
  `loan_interest` float(5,2) NOT NULL,
  `billet` int(10) NOT NULL,
  `fee` float(10,2) NOT NULL,
  `interest_type` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` mediumint(9) NOT NULL,
  `recordstatus_id` smallint(6) NOT NULL,
  PRIMARY KEY (`loanaccount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_loan_accounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_loan_disbursement`
--

CREATE TABLE IF NOT EXISTS `ob_loan_disbursement` (
  `loandisbursement_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `account_id` mediumint(9) NOT NULL,
  `disbursement_date` date NOT NULL,
  `accountdisbursement_id` int(11) NOT NULL,
  `disbursed_by` mediumint(9) NOT NULL,
  `amount_disbursed` float(10,2) NOT NULL,
  `sms` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_type` smallint(6) NOT NULL,
  `transaction_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `recordstatus_id` smallint(6) NOT NULL,
  PRIMARY KEY (`loandisbursement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_loan_disbursement`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_loan_repayment`
--

CREATE TABLE IF NOT EXISTS `ob_loan_repayment` (
  `loanrepayment_id` int(30) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(40) NOT NULL,
  `account_id` int(30) NOT NULL,
  `loaninstallment_number` smallint(5) NOT NULL,
  `loaninstallmentpaid_date` date NOT NULL,
  `loaninstallmentpaid_amount` float(10,2) NOT NULL,
  `loaninstallmentpaid_interst` float(10,2) NOT NULL,
  `loaninstallmentpaid_other_amount` float(10,2) NOT NULL,
  `sms` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`loanrepayment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_loan_repayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_login_details`
--

CREATE TABLE IF NOT EXISTS `ob_login_details` (
  `module_id` int(100) NOT NULL,
  `submodule_id` int(100) NOT NULL,
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `recordstatus_id` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob_login_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_meeting`
--

CREATE TABLE IF NOT EXISTS `ob_meeting` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bank_id` int(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `grouphead_name` varchar(30) NOT NULL,
  `place` varchar(100) NOT NULL,
  `time` time NOT NULL,
  `day` varchar(25) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_meeting`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_meeting_log`
--

CREATE TABLE IF NOT EXISTS `ob_meeting_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bank_id` int(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `grouphead_name` varchar(30) NOT NULL,
  `place` varchar(100) NOT NULL,
  `time` time NOT NULL,
  `day` varchar(25) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_meeting_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_member`
--

CREATE TABLE IF NOT EXISTS `ob_member` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bank_id` smallint(6) NOT NULL,
  `membercode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `member_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `member_dateofbirth` date NOT NULL,
  `member_gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` double NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_member`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_membertypes`
--

CREATE TABLE IF NOT EXISTS `ob_membertypes` (
  `membertype_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `membertype` varchar(30) NOT NULL,
  PRIMARY KEY (`membertype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_membertypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_member_family`
--

CREATE TABLE IF NOT EXISTS `ob_member_family` (
  `id` mediumint(9) NOT NULL,
  `father` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mother` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `spouse` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `children` tinyint(4) NOT NULL,
  `otherinfo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ob_member_family`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_member_family_log`
--

CREATE TABLE IF NOT EXISTS `ob_member_family_log` (
  `record_id` int(11) NOT NULL,
  `id` mediumint(9) NOT NULL,
  `father` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mother` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `spouse` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `children` tinyint(4) NOT NULL,
  `otherinfo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ob_member_family_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_member_log`
--

CREATE TABLE IF NOT EXISTS `ob_member_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` mediumint(9) NOT NULL,
  `bank_id` smallint(6) NOT NULL,
  `membercode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `member_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `member_dateofbirth` date NOT NULL,
  `member_gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` double NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_member_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_modules`
--

CREATE TABLE IF NOT EXISTS `ob_modules` (
  `module_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `module_description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `parent` tinyint(4) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `ob_modules`
--

INSERT INTO `ob_modules` (`module_id`, `module_description`, `parent`) VALUES
(1, 'Management', 0),
(2, 'Membership', 0),
(3, 'Meeting', 0),
(4, 'Reports', 0),
(5, 'Transaction', 0),
(6, 'Accounting', 0),
(7, 'Credit line', 0),
(8, 'Settings', 0),
(9, 'Institution', 1),
(10, 'Bank', 1),
(11, 'Roles', 1),
(12, 'User', 1),
(13, 'Funder', 1),
(14, 'Fundings', 1),
(15, 'Fee', 1),
(16, 'Sectors', 1),
(17, 'Activities', 1),
(18, 'Individual', 2),
(19, 'Group', 2),
(20, 'Meeting', 3),
(21, 'Attendance', 3),
(22, 'Credit line', 7),
(23, 'Interest', 7),
(24, 'Grace period', 7),
(25, 'Penalty', 7),
(27, 'groupm', 2),
(28, 'saving deposit', 5),
(29, 'savings withdraw', 5),
(30, 'saving status', 5),
(31, 'loan disbursement', 5),
(32, 'loan repayment', 5),
(33, 'loan status', 5),
(34, 'loan details', 5),
(35, 'individualm', 2),
(36, 'Office', 1),
(37, 'Office hierarchy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ob_paymenttypes`
--

CREATE TABLE IF NOT EXISTS `ob_paymenttypes` (
  `paymenttype_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `paymenttype_description` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`paymenttype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_paymenttypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_penalty`
--

CREATE TABLE IF NOT EXISTS `ob_penalty` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `penalty_per_delay` float(5,2) NOT NULL,
  `interest_of_delay` float(10,2) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `status` int(5) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_penalty`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_penalty_log`
--

CREATE TABLE IF NOT EXISTS `ob_penalty_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `penalty_per_delay` float(5,2) NOT NULL,
  `interest_of_delay` float(10,2) NOT NULL,
  `creditline_id` smallint(6) NOT NULL,
  `status` int(5) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_penalty_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_record_status`
--

CREATE TABLE IF NOT EXISTS `ob_record_status` (
  `recordstatus_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `recordstatusdescription` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`recordstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_record_status`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_sector`
--

CREATE TABLE IF NOT EXISTS `ob_sector` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_sector`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_sector_log`
--

CREATE TABLE IF NOT EXISTS `ob_sector_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` tinyint(4) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_sector_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_sms`
--

CREATE TABLE IF NOT EXISTS `ob_sms` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ob_sms`
--

INSERT INTO `ob_sms` (`id`, `url`) VALUES
(1, 'Airtel');

-- --------------------------------------------------------

--
-- Table structure for table `ob_subactivity`
--

CREATE TABLE IF NOT EXISTS `ob_subactivity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `activity_description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `submodule_id` int(11) NOT NULL,
  `recordstatus_id` int(11) NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `ob_subactivity`
--

INSERT INTO `ob_subactivity` (`activity_id`, `activity_name`, `activity_description`, `module_id`, `submodule_id`, `recordstatus_id`) VALUES
(1, 'Add Institution', 'addinstitutionAction', 1, 1, 3),
(2, 'Edit Institution', 'editinstitutionAction', 1, 1, 3),
(3, 'View Institution', 'viewinstitutionAction', 1, 1, 3),
(4, 'Delete Institution', 'deleteinstitutionAction', 1, 1, 3),
(5, 'Add Bank', 'addbankAction', 1, 2, 3),
(6, 'Edit Bank', 'editbankAction', 1, 2, 3),
(7, 'View Bank', 'viewbankAction', 1, 2, 3),
(8, 'Delete Bank', 'deletebankAction', 1, 2, 3),
(9, 'Add Roles', 'rolesaddAction', 1, 3, 3),
(10, 'Edit Roles', 'roleseditAction', 1, 3, 3),
(11, 'View Roles', 'rolesviewAction', 1, 3, 3),
(12, 'Delete Roles', 'rolesdeleteAction', 1, 3, 3),
(13, 'Add User', 'addAction', 1, 4, 3),
(14, 'Edit User', 'edituserdetailAction', 1, 4, 3),
(15, 'View User', 'commonviewAction', 1, 4, 3),
(16, 'Delete user', 'deleteAction', 1, 4, 3),
(17, 'Add Funder', 'addfunderAction', 1, 5, 3),
(18, 'Edit Funder', 'editfunderAction', 1, 5, 3),
(19, 'View Funder', 'viewfunderAction', 1, 5, 3),
(20, 'Delete Funder', 'deleteAction', 1, 5, 3),
(21, 'Add Fundings', 'addfundingsAction', 1, 6, 3),
(22, 'Edit Fundings', 'editfundingsAction', 1, 6, 3),
(23, 'View Fundings', 'viewfundingsAction', 1, 6, 3),
(24, 'Delete Fundings', 'deletefundingsAction', 1, 6, 3),
(25, 'Add Fee', 'addAction', 1, 7, 3),
(26, 'Edit Fee', 'editfeedetailAction', 1, 7, 3),
(27, 'View Fee', 'viewAction', 1, 7, 3),
(28, 'Delete Fee', 'deleteAction', 1, 7, 3),
(29, 'Add Sector', 'sectorsaddAction', 1, 8, 3),
(30, 'Edit Sector', 'sectoreditAction', 1, 8, 3),
(31, 'View Sector', 'sectorviewAction', 1, 8, 3),
(32, 'Delete Sector', 'sectordeleteAction', 1, 8, 3),
(33, 'Add Activity', 'activityaddAction', 1, 9, 3),
(34, 'Edit Activity', 'activityeditAction', 1, 9, 3),
(35, 'View Activity', 'activityviewAction', 1, 9, 3),
(36, 'Delete Activity', 'activitydeleteAction', 1, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ob_submodule`
--

CREATE TABLE IF NOT EXISTS `ob_submodule` (
  `submodule_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(4) NOT NULL,
  `submodule_description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`submodule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ob_submodule`
--

INSERT INTO `ob_submodule` (`submodule_id`, `module_id`, `submodule_description`, `action_flag`) VALUES
(1, 1, 'Institution', '0'),
(2, 1, 'Bank', '0'),
(3, 1, 'Roles', '0'),
(4, 1, 'User', '0'),
(5, 1, 'Funder', '0'),
(6, 1, 'Fundings', '0'),
(7, 1, 'Fee', '0'),
(8, 1, 'Sector', '0'),
(9, 1, 'Activity', '0'),
(13, 2, 'Individual', '0'),
(14, 2, 'Group', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ob_transaction`
--

CREATE TABLE IF NOT EXISTS `ob_transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount_to_bank` float(10,2) DEFAULT NULL,
  `amount_from_bank` float(10,2) DEFAULT NULL,
  `paymenttype_mode` smallint(6) NOT NULL,
  `paymenttype_details` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_type` smallint(6) NOT NULL,
  `recordstatus_id` smallint(6) NOT NULL,
  `reffering_vouchernumber` int(11) NOT NULL,
  `transaction_remarks` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_flag` tinyint(1) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_transactiontype`
--

CREATE TABLE IF NOT EXISTS `ob_transactiontype` (
  `transactiontype_id` int(10) NOT NULL,
  `transactiontype` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ob_transactiontype`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_user`
--

CREATE TABLE IF NOT EXISTS `ob_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` int(10) NOT NULL,
  `designation` int(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `grant_id` int(11) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ob_user`
--

INSERT INTO `ob_user` (`id`, `bank_id`, `name`, `gender`, `designation`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 1, 'admin', 1, 1, 'admin', 'admin', 1, 1, '2010-12-11 12:12:47'),
(4, 2, 'bhavana', 2, 2, 'bhavana', 'bhavana', 1, 1, '2010-12-11 13:05:39'),
(9, 4, 'viknesh', 1, 1, 'vickee', 'vickee', 3, 0, '2011-01-21 15:09:58'),
(10, 5, 'vinoth', 1, 2, 'vivo', 'vivo', 3, 0, '2011-01-21 15:11:21'),
(11, 5, 'jeba', 1, 1, 'jeba', 'jeba', 3, 0, '2011-01-21 15:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `ob_usergrants`
--

CREATE TABLE IF NOT EXISTS `ob_usergrants` (
  `usergrant_id` int(50) NOT NULL AUTO_INCREMENT,
  `grant_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `createdby` int(50) NOT NULL,
  `createddate` date NOT NULL,
  PRIMARY KEY (`usergrant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_usergrants`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_user_log`
--

CREATE TABLE IF NOT EXISTS `ob_user_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(10) NOT NULL,
  `office_id` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `gender` int(10) NOT NULL,
  `designation` int(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ob_user_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ob_weekdays`
--

CREATE TABLE IF NOT EXISTS `ob_weekdays` (
  `day_value` varchar(15) NOT NULL,
  `days_name` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ob_weekdays`
--

INSERT INTO `ob_weekdays` (`day_value`, `days_name`) VALUES
('Monday', 'Monday'),
('Tuesday', 'Tuesday'),
('Wednesday', 'Wednesday'),
('Thursday', 'Thursday'),
('Friday', 'Friday'),
('Saturday', 'Saturday'),
('Sunday', 'Sunday');

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
(1, 'Savings', 'For savings products', 1, '2011-01-17'),
(2, 'Loan', 'for loan products', 1, '2011-01-17');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_category_log`
--

INSERT INTO `ourbank_category_log` (`record_id`, `id`, `name`, `description`, `created_by`, `created_date`) VALUES
(1, 1, 'jjhgj', 'jhhgj', 1, '2011-01-04'),
(2, 2, 'albert', 'chumma', 1, '2011-01-05'),
(3, 1, 'jeba', 'jhhgj', 1, '2011-01-05'),
(4, 1, 'Personal savings', 'Mfi produc', 1, '2011-01-06'),
(5, 1, 'Personal savings', 'Mfi product', 1, '2010-11-03'),
(6, 4, 'sheep loan', 'loans for sheep', 1, '2011-01-13');

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
-- Table structure for table `ourbank_family`
--

CREATE TABLE IF NOT EXISTS `ourbank_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` tinyint(2) NOT NULL,
  `relationship` tinyint(2) NOT NULL,
  `physicalstatus` tinyint(20) NOT NULL,
  `maritalstatus` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_family`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyeconomic`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyeconomic` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `familymember_id` int(15) NOT NULL,
  `member_id` int(20) NOT NULL,
  `profession` tinyint(2) NOT NULL,
  `earnings` tinyint(2) NOT NULL,
  `benefits` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familyeconomic`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyeconomic_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyeconomic_log` (
  `record_id` int(15) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `familymember_id` int(15) NOT NULL,
  `member_id` int(20) NOT NULL,
  `profession` tinyint(2) NOT NULL,
  `earnings` tinyint(2) NOT NULL,
  `benefits` tinyint(2) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familyeconomic_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyeducation`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyeducation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `familymember_id` int(15) NOT NULL,
  `member_id` int(20) NOT NULL,
  `qualification` tinyint(2) NOT NULL,
  `school_location` tinyint(2) NOT NULL,
  `transportation` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familyeducation`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyeducation_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyeducation_log` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `familymember_id` int(15) NOT NULL,
  `member_id` int(20) NOT NULL,
  `qualification` tinyint(2) NOT NULL,
  `school_location` tinyint(2) NOT NULL,
  `transportation` tinyint(2) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familyeducation_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyhealth`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyhealth` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `familymember_id` int(15) NOT NULL,
  `member_id` int(11) NOT NULL,
  `health_problem` tinyint(3) NOT NULL,
  `under_treatment` tinyint(2) NOT NULL,
  `clinical_accessability` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familyhealth`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyhealth_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyhealth_log` (
  `record_id` int(15) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `familymember_id` int(15) NOT NULL,
  `member_id` int(11) NOT NULL,
  `health_problem` tinyint(3) NOT NULL,
  `under_treatment` tinyint(2) NOT NULL,
  `clinical_accessability` tinyint(2) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_familyhealth_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_familyrelationship`
--

CREATE TABLE IF NOT EXISTS `ourbank_familyrelationship` (
  `id` smallint(5) NOT NULL,
  `relationship` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_familyrelationship`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_family_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_family_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(5) NOT NULL,
  `member_id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` tinyint(2) NOT NULL,
  `relationship` tinyint(2) NOT NULL,
  `physicalstatus` tinyint(20) NOT NULL,
  `maritalstatus` tinyint(2) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_family_log`
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
-- Table structure for table `ourbank_frequencyofpayment`
--

CREATE TABLE IF NOT EXISTS `ourbank_frequencyofpayment` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_frequencyofpayment`
--

INSERT INTO `ourbank_frequencyofpayment` (`id`, `type`, `value`) VALUES
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
-- Table structure for table `ourbank_funding`
--

CREATE TABLE IF NOT EXISTS `ourbank_funding` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type_id` smallint(5) NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `currency_id` int(5) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `interest` float(5,2) NOT NULL,
  `exchangerate` decimal(10,2) NOT NULL,
  `accounting_line` smallint(5) NOT NULL,
  `beginingdate` date NOT NULL,
  `closingdate` date NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_funding`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_glcode`
--

INSERT INTO `ourbank_glcode` (`id`, `glcode`, `ledgertype_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 'A01000', '3', 'Bank', 'Bank in assets', 1, '2011-01-13 14:52:02'),
(2, 'A02000', '3', 'Cash', 'Cash in assets', 1, '2011-01-13 14:55:27'),
(3, 'L01000', '4', 'Savings liabilities', 'Savings liabilities', 1, '2011-01-26 15:03:15'),
(4, 'E01000', '2', 'Savings expenditure', 'Savings expenditure', 1, '2011-01-26 15:04:44');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_glcode_log`
--

INSERT INTO `ourbank_glcode_log` (`record_id`, `id`, `glcode`, `ledgertype_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 5, 'E02000', '2', 'Fixed expenditure', 'Fixed expenditure', 1, '2011-01-26 15:08:19'),
(2, 6, 'L02000', '4', 'Recurring individual', 'Recurring individual', 1, '2011-01-26 15:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_glsubcode`
--

CREATE TABLE IF NOT EXISTS `ourbank_glsubcode` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `glsubcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `glcode_id` int(5) NOT NULL,
  `subledger_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `header` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ourbank_glsubcode`
--

INSERT INTO `ourbank_glsubcode` (`id`, `glsubcode`, `glcode_id`, `subledger_id`, `header`, `description`, `created_by`, `created_date`) VALUES
(1, 'A01001', 1, '3', 'Bank1', 'Bank1', 1, '2011-01-26'),
(2, 'A02001', 2, '3', 'Cash1', 'Cash1', 1, '2011-01-26'),
(3, 'A01002', 1, '3', 'Bank2', 'Bank2', 1, '2011-01-26'),
(4, 'A02002', 2, '3', 'Cash2', 'Cash2', 1, '2011-01-26'),
(5, 'A01003', 1, '3', 'Bank3', 'Bank3', 1, '2011-01-26'),
(6, 'A02003', 2, '3', 'Cash3', 'Cash3', 1, '2011-01-26'),
(7, 'L01001', 3, '4', 'Savings Individual', 'Savings Individual', 1, '2011-01-26'),
(8, 'L01002', 3, '4', 'Savings Group', 'Savings Group', 1, '2011-01-26'),
(9, 'E01001', 4, '2', 'Savings individual', 'Savings individual', 1, '2011-01-26'),
(10, 'E01002', 4, '2', 'Savings group', 'Savings group', 1, '2011-01-26'),
(11, 'L01003', 3, '4', 'Fixed individual', 'Fixed individual', 1, '2011-01-26'),
(12, 'L01004', 3, '4', 'Fixed group', 'Fixed group', 1, '2011-01-26'),
(13, 'L01005', 3, '4', 'Recurring individual', 'Recurring individual', 1, '2011-01-26'),
(14, 'L01006', 3, '4', 'Recurring group', 'Recurring group', 1, '2011-01-26'),
(15, 'E01003', 4, '2', 'Fixed individual', 'Fixed individual', 1, '2011-01-26'),
(16, 'E01004', 4, '2', 'Fixed group', 'Fixed group', 1, '2011-01-26'),
(17, 'E01005', 4, '2', 'Recurring individual', 'Recurring individual', 1, '2011-01-26'),
(18, 'E01006', 4, '2', 'Recurring group', 'Recurring group', 1, '2011-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_glsubcode_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_glsubcode_log` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `ourbank_group`
--

CREATE TABLE IF NOT EXISTS `ourbank_group` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `office_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `head` mediumint(9) NOT NULL,
  `groupcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
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
  `id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `groupmember_status` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_groupmembers`
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
  `office_id` smallint(6) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `head` mediumint(9) NOT NULL,
  `groupcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
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
-- Table structure for table `ourbank_health_problem`
--

CREATE TABLE IF NOT EXISTS `ourbank_health_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `health_problem` varchar(25) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_health_problem`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_holiday`
--

CREATE TABLE IF NOT EXISTS `ourbank_holiday` (
  `id` smallint(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `office_id` smallint(50) NOT NULL,
  `holiday_from` date NOT NULL,
  `holiday_upto` date NOT NULL,
  `repayment_date` date NOT NULL,
  `created_by` smallint(50) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `name` varchar(50) NOT NULL,
  `office_id` smallint(50) NOT NULL,
  `holiday_from` date NOT NULL,
  `holiday_upto` date NOT NULL,
  `repayment_date` date NOT NULL,
  `created_by` smallint(50) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
-- Table structure for table `ourbank_installmentdetails`
--

CREATE TABLE IF NOT EXISTS `ourbank_installmentdetails` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `installment_id` smallint(5) NOT NULL,
  `installment_date` date NOT NULL,
  `installment_amount` float(10,2) NOT NULL,
  `installment_interest_amount` float(10,2) NOT NULL,
  `installment_principal_amount` float(10,2) NOT NULL,
  `reduced_prinicipal_balance` float(10,2) NOT NULL,
  `installment_status` tinyint(4) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_installmentdetails`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_installmentstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_installmentstatus` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_installmentstatus`
--

INSERT INTO `ourbank_installmentstatus` (`id`, `description`) VALUES
(1, 'Open'),
(2, 'Paid'),
(3, 'Due'),
(4, 'Next due'),
(5, 'Over due'),
(6, 'Hold'),
(7, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_interesttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_interesttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_interesttypes`
--

INSERT INTO `ourbank_interesttypes` (`id`, `description`) VALUES
(2, 'Declining capital');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ourbank_interest_periods`
--

INSERT INTO `ourbank_interest_periods` (`id`, `period_ofrange_monthfrom`, `period_ofrange_monthto`, `period_ofrange_description`, `offerproduct_id`, `Interest`, `intereststatus_id`) VALUES
(1, 1, 12, '1-12months', 1, 5.00, 3),
(2, 1, 12, '1-12months', 2, 5.00, 3),
(4, 1, 12, '1-12', 4, 2.00, 3),
(5, 13, 24, '13-24', 4, 3.00, 3),
(6, 1, 12, '1-12months', 5, 2.00, 3),
(7, 13, 24, '13-24months', 5, 4.00, 3),
(8, 1, 12, '1-12months', 6, 5.00, 3),
(9, 1, 12, '1-12months', 7, 6.00, 3),
(10, 1, 12, '1-12months', 8, 2.00, 3),
(11, 1, 12, '1-12months', 9, 2.00, 3);

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
-- Table structure for table `ourbank_ledgertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_ledgertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_ledgertypes`
--

INSERT INTO `ourbank_ledgertypes` (`id`, `description`) VALUES
(1, 'Income'),
(2, 'Expenditure'),
(3, 'Assets'),
(4, 'Liabilities');

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
-- Table structure for table `ourbank_loanaccounts`
--

CREATE TABLE IF NOT EXISTS `ourbank_loanaccounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `funder_id` smallint(5) NOT NULL,
  `loansanctioned_date` date NOT NULL,
  `loanbegin_date` date NOT NULL,
  `loanclose_date` date NOT NULL,
  `loan_amount` float(10,2) NOT NULL,
  `loan_installments` int(11) NOT NULL,
  `loan_interest` float(5,2) NOT NULL,
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
  `transaction_description` varchar(100) CHARACTER SET latin1 NOT NULL,
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
  `paid_interst` float(10,2) NOT NULL,
  `paid_other_amount` float(10,2) NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_loan_repayment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_maritalstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_maritalstatus` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `maritalstatus` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_maritalstatus`
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
  `serialno` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_bank`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_cbopromoter`
--


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
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `country_code` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `currencyname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currencysymbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `currencyshortname` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `default` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_countrylist`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_crop`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_crop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ourbank_master_crop`
--

INSERT INTO `ourbank_master_crop` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Rice', 0, '0000-00-00 00:00:00'),
(2, 'Ragi', 0, '0000-00-00 00:00:00'),
(3, 'Corns', 0, '0000-00-00 00:00:00'),
(4, 'Sugar cane', 0, '0000-00-00 00:00:00'),
(5, 'Vegetables', 0, '0000-00-00 00:00:00'),
(6, 'Fruits', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18446744073709551615 ;

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
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `ourbank_master_districtlist`
--

INSERT INTO `ourbank_master_districtlist` (`id`, `name`, `created_by`, `created_date`) VALUES
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

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
(8, 'Disabled', 0, '0000-00-00 00:00:00');

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
(1, 'Old Age pension', 0, '0000-00-00 00:00:00'),
(2, 'Widow pension', 0, '0000-00-00 00:00:00'),
(3, 'Physically handicapped pension', 0, '0000-00-00 00:00:00'),
(4, 'Others', 0, '0000-00-00 00:00:00'),
(5, 'None', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_expense`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
(13, 'Summer agriculture expense');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_familyexpense`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_familyexpense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
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
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_familytype`
--

INSERT INTO `ourbank_master_familytype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Nuclear/Small Family', 0, '0000-00-00 00:00:00'),
(2, 'Joint Family', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_frequencypayment`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_frequencypayment` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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
  `name` varchar(30) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ourbank_master_gender`
--

INSERT INTO `ourbank_master_gender` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `ourbank_master_hoblilist`
--

INSERT INTO `ourbank_master_hoblilist` (`id`, `name`, `taluk_id`, `created_by`, `created_date`) VALUES
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
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

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
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18446744073709551615 ;

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
(7, 'Closed');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_institutions`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_kootas`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_kvs`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_landtypes`
--

INSERT INTO `ourbank_master_landtypes` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Dry', 0, '0000-00-00 00:00:00'),
(2, 'Wet', 0, '0000-00-00 00:00:00'),
(3, 'Garden Land', 0, '0000-00-00 00:00:00'),
(4, 'Uncultivated', 0, '0000-00-00 00:00:00');

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
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_master_liveassets`
--

INSERT INTO `ourbank_master_liveassets` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Cross bed cows', 0, '0000-00-00 00:00:00'),
(2, 'Local cows', 0, '0000-00-00 00:00:00'),
(3, 'Buffaloes', 0, '0000-00-00 00:00:00'),
(4, 'Bullocks', 0, '0000-00-00 00:00:00'),
(5, 'Sheep/goats', 0, '0000-00-00 00:00:00'),
(6, 'Poultry', 0, '0000-00-00 00:00:00'),
(7, 'Pigs', 0, '0000-00-00 00:00:00'),
(8, 'Others', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

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
(7, 'Others', 0, '0000-00-00 00:00:00');

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
(1, 'Friends & Family', 0, '0000-00-00 00:00:00'),
(2, 'Chit Funds', 0, '0000-00-00 00:00:00'),
(3, 'SHGs / CBOs', 0, '0000-00-00 00:00:00'),
(4, 'Cooperative Banks', 0, '0000-00-00 00:00:00'),
(5, 'Scheduled Banks', 0, '0000-00-00 00:00:00'),
(6, 'Money Lenders', 0, '0000-00-00 00:00:00'),
(7, 'MFI', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_master_maritalstatus`
--

INSERT INTO `ourbank_master_maritalstatus` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Currently Married', 0, '0000-00-00 00:00:00'),
(2, 'Unmarried', 0, '0000-00-00 00:00:00'),
(3, 'Widow/widower', 0, '0000-00-00 00:00:00'),
(4, 'Divorced', 0, '0000-00-00 00:00:00'),
(5, 'Separated', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_membertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_membertypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_membertypes`
--

INSERT INTO `ourbank_master_membertypes` (`id`, `type`, `created_by`, `created_date`) VALUES
(1, 'Individual', 0, '0000-00-00 00:00:00'),
(2, 'Group', 0, '0000-00-00 00:00:00'),
(3, 'Center', 0, '0000-00-00 00:00:00'),
(4, 'All', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_nonliveassets`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_nonliveassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
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
(5, 'Tractor/Tilter', 0, '0000-00-00 00:00:00'),
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
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ourbank_master_ownershiptype`
--

INSERT INTO `ourbank_master_ownershiptype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'own', 0, '0000-00-00 00:00:00'),
(2, 'tenant', 0, '0000-00-00 00:00:00'),
(3, 'leased', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_paymenttypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_paymenttypes` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

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
-- Table structure for table `ourbank_master_povertytype`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_povertytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_master_povertytype`
--

INSERT INTO `ourbank_master_povertytype` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Homeless / Ordinary house', 0, '0000-00-00 00:00:00'),
(2, 'Landless / marginal farmer', 0, '0000-00-00 00:00:00'),
(3, 'Wage employed', 0, '0000-00-00 00:00:00'),
(4, 'Managed by women', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_master_profession`
--

INSERT INTO `ourbank_master_profession` (`id`, `name`, `created_by`, `created_date`) VALUES
(1, 'Farmer', 0, '0000-00-00 00:00:00'),
(2, 'Teacher', 0, '0000-00-00 00:00:00'),
(3, 'Business', 0, '0000-00-00 00:00:00'),
(4, 'Carpenter', 0, '0000-00-00 00:00:00'),
(5, 'Cobler', 0, '0000-00-00 00:00:00'),
(6, 'Iron Smith', 0, '0000-00-00 00:00:00'),
(7, 'Insurence Agent', 0, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

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
(22, 'Others', 0, '0000-00-00 00:00:00');

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
(1, 'Farm Worker', 0, '0000-00-00 00:00:00'),
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
-- Table structure for table `ourbank_master_taluklist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_taluklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_taluklist`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_village`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_village` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `village_id` int(11) NOT NULL,
  `hobli_id` int(11) NOT NULL,
  `taluk_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `state_id` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_village`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_master_villagelist`
--

CREATE TABLE IF NOT EXISTS `ourbank_master_villagelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hobli_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_master_villagelist`
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
-- Table structure for table `ourbank_membertypes`
--

CREATE TABLE IF NOT EXISTS `ourbank_membertypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_membertypes`
--

INSERT INTO `ourbank_membertypes` (`id`, `type`) VALUES
(1, 'Individual'),
(2, 'Group'),
(3, 'Center'),
(4, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_member_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_member_log` (
  `record_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `office_id` smallint(6) NOT NULL,
  `membercode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
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
-- Table structure for table `ourbank_officehierarchy`
--

CREATE TABLE IF NOT EXISTS `ourbank_officehierarchy` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Hierarchy_level` smallint(5) NOT NULL,
  `created_userid` int(10) NOT NULL,
  `createddate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `officetype` (`type`),
  UNIQUE KEY `officeshort_name` (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_officehierarchy`
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
  `description` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

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
  `physicalstatus` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_physicalstatus`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_product`
--

CREATE TABLE IF NOT EXISTS `ourbank_product` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `category_id` smallint(5) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Category_ID` (`category_id`),
  KEY `product_id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ourbank_product`
--

INSERT INTO `ourbank_product` (`id`, `name`, `shortname`, `category_id`, `description`, `created_by`, `created_date`) VALUES
(1, 'Savings bank', 'ps', 1, 'for Personal savings', 1, '2011-01-17'),
(2, 'fixed savings', 'fd', 1, 'for fixed deposit ', 1, '2011-01-17'),
(3, 'Recurring deposit ', 'rd', 1, 'recurring deposit', 1, '2011-01-21'),
(5, 'savings', 'sav', 1, 'save', 1, '2011-01-21'),
(6, 'home loan', 'HL', 2, 'home loan', 1, '2011-01-21'),
(7, 'educational', 'edu', 2, 'education', 1, '2011-01-24'),
(8, 'group ', 'gp', 2, 'group gp', 1, '2011-01-24');

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
  `fund_id` varchar(10) NOT NULL,
  `glsubcode` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ourbank_productsloan`
--

INSERT INTO `ourbank_productsloan` (`productsoffer_id`, `minmumloanamount`, `maximunloanamount`, `interesttype_id`, `minimumloaninterest`, `maximunloaninterest`, `penal_Interest`, `installmenttype_id`, `minimumfrequency`, `maximumfrequency`, `fee_id`, `graceperiodtype_id`, `graceperiodnumber`, `fund_id`, `glsubcode`) VALUES
(4, 10000, 20000, 1, '0.00', '0.00', 0.01, 0, 12, 24, 0, 0, 2, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsloan_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsloan_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `offerproduct_id` int(11) NOT NULL,
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
  `fund_id` varchar(10) NOT NULL,
  `glsubcode` int(10) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_productsloan_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsoffer`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsoffer` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `product_id` smallint(5) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `begindate` date NOT NULL,
  `closedate` date NOT NULL,
  `applicableto` smallint(5) NOT NULL,
  `glsubcode_id` int(5) NOT NULL,
  `capital_glsubcode_id` int(5) NOT NULL,
  `Interest_glsubcode_id` int(5) NOT NULL,
  `fee_glsubcode_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ourbank_productsoffer`
--

INSERT INTO `ourbank_productsoffer` (`id`, `name`, `shortname`, `product_id`, `description`, `begindate`, `closedate`, `applicableto`, `glsubcode_id`, `capital_glsubcode_id`, `Interest_glsubcode_id`, `fee_glsubcode_id`) VALUES
(1, 'saving for individual', 'PS', 1, 'sb for individual ', '2010-01-26', '0000-00-00', 1, 7, 0, 0, 9),
(2, 'saving for group', 'ps', 1, 'sb for group', '2010-01-22', '0000-00-00', 2, 8, 0, 0, 10),
(4, 'roof  loan', 'r', 6, 'roof loan for village', '2011-01-26', '2011-06-17', 1, 1, 0, 9, 9),
(5, 'Fixed individual#1', 'FI1', 2, 'Fixed individual#1', '2011-01-26', '2011-05-28', 1, 11, 0, 0, 15),
(6, 'fixed saving for group', 'fsg', 2, 'fixed saving for group', '2010-11-01', '2012-06-25', 2, 12, 0, 0, 16),
(7, 'fixed saving for individual', 'fsi', 2, 'fixed saving for individual', '2010-03-08', '2012-01-26', 1, 11, 0, 0, 15),
(8, 'RD individual', 'rd', 3, 'recurring deposit individual', '2010-01-26', '2011-01-26', 1, 13, 0, 0, 17),
(9, 'RD group', 'rd', 3, 'recurring deposit group ', '2010-01-26', '2012-01-26', 2, 14, 0, 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productsoffer_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_productsoffer_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` smallint(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `product_id` smallint(5) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `begindate` date NOT NULL,
  `closedate` date NOT NULL,
  `applicableto` smallint(5) NOT NULL,
  `glsubcode_id` int(5) NOT NULL,
  `capital_glsubcode_id` int(5) NOT NULL,
  `Interest_glsubcode_id` int(5) NOT NULL,
  `fee_glsubcode_id` int(5) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_productsoffer_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productssaving`
--

CREATE TABLE IF NOT EXISTS `ourbank_productssaving` (
  `productsoffer_id` int(11) NOT NULL,
  `savingsindividualgroup` varchar(10) NOT NULL,
  `frequencyofdeposit` int(10) NOT NULL,
  `depo_timefrequency_id` int(10) NOT NULL,
  `minmumdeposit` decimal(10,2) NOT NULL,
  `maximumwithdrawal` decimal(10,2) NOT NULL,
  `rateofinterest` decimal(10,2) NOT NULL,
  `minimumbalanceforinterest` decimal(10,2) NOT NULL,
  `minimumperiodforinterest` smallint(5) NOT NULL,
  `frequencyofinterestupdating` varchar(50) NOT NULL,
  `Int_timefrequency_id` int(10) NOT NULL,
  `amountusedforcalculateinterest` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ourbank_productssaving`
--

INSERT INTO `ourbank_productssaving` (`productsoffer_id`, `savingsindividualgroup`, `frequencyofdeposit`, `depo_timefrequency_id`, `minmumdeposit`, `maximumwithdrawal`, `rateofinterest`, `minimumbalanceforinterest`, `minimumperiodforinterest`, `frequencyofinterestupdating`, `Int_timefrequency_id`, `amountusedforcalculateinterest`) VALUES
(1, '', 8, 0, '50.00', '0.00', '0.00', '500.00', 0, 'MinBalance', 8, ''),
(2, '', 8, 0, '50.00', '0.00', '0.00', '500.00', 0, 'MinBalance', 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_productssaving_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_productssaving_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `productsoffer_id` int(11) NOT NULL,
  `savingsindividualgroup` varchar(10) NOT NULL,
  `frequencyofdeposit` int(10) NOT NULL,
  `depo_timefrequency_id` int(10) NOT NULL,
  `minmumdeposit` decimal(10,2) NOT NULL,
  `maximumwithdrawal` decimal(10,2) NOT NULL,
  `rateofinterest` decimal(10,2) NOT NULL,
  `minimumbalanceforinterest` decimal(10,2) NOT NULL,
  `minimumperiodforinterest` smallint(5) NOT NULL,
  `frequencyofinterestupdating` varchar(50) NOT NULL,
  `Int_timefrequency_id` int(10) NOT NULL,
  `amountusedforcalculateinterest` varchar(20) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ourbank_product_fixedrecurring`
--

INSERT INTO `ourbank_product_fixedrecurring` (`productsoffer_id`, `minimum_deposit_amount`, `maximum_deposit_amount`, `minimum_periodof_deposit`, `maximum_periodof_deposit`, `frequency_of_deposit`, `penal_Interest`, `other_charges`) VALUES
(5, 10000.00, 50000.00, 0, 0, 7, 3.00, 0.00),
(6, 50.00, 1500.00, 0, 0, 8, 3.00, 0.00),
(7, 50.00, 1500.00, 0, 0, 8, 3.00, 0.00),
(8, 1000.00, 100000.00, 0, 0, 8, 0.01, 0.00),
(9, 1000.00, 100000.00, 0, 0, 8, 0.01, 0.00);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `name` varchar(100) NOT NULL,
  `shortname` varchar(100) NOT NULL,
  `description` varchar(10) NOT NULL,
  `category_id` smallint(50) NOT NULL,
  `created_by` smallint(50) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_product_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_profession`
--

CREATE TABLE IF NOT EXISTS `ourbank_profession` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `profession` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profession_ID` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ourbank_profession`
--

INSERT INTO `ourbank_profession` (`id`, `profession`) VALUES
(1, 'Farmer'),
(2, 'Teacher'),
(3, 'Business'),
(4, 'Carpenter'),
(5, 'Cobler'),
(6, 'Iron Smith'),
(7, 'Insurence Agent');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_qualification`
--

CREATE TABLE IF NOT EXISTS `ourbank_qualification` (
  `id` int(2) NOT NULL,
  `qualification` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_qualification`
--

INSERT INTO `ourbank_qualification` (`id`, `qualification`) VALUES
(1, 'SSLC'),
(2, 'PUC'),
(3, 'Bsce'),
(4, 'Bcom');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_Recordstatus`
--

CREATE TABLE IF NOT EXISTS `ourbank_Recordstatus` (
  `recordstatus_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `recordstatusdescription` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`recordstatus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ourbank_Recordstatus`
--

INSERT INTO `ourbank_Recordstatus` (`recordstatus_id`, `recordstatusdescription`) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Open'),
(4, 'Void'),
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
  `paymenttype_details` varchar(60) CHARACTER SET latin1 NOT NULL,
  `transaction_description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `transaction_interest` float(10,2) NOT NULL,
  `transaction_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ourbank_savings_transaction`
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
  `created_by` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `ourbank_user`
--

CREATE TABLE IF NOT EXISTS `ourbank_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` int(10) NOT NULL,
  `designation` int(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `grant_id` int(11) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ourbank_user`
--

INSERT INTO `ourbank_user` (`id`, `bank_id`, `name`, `gender`, `designation`, `username`, `password`, `grant_id`, `created_by`, `created_date`) VALUES
(1, 1, 'admin', 1, 1, 'admin', 'admin', 1, 1, '2010-12-11 12:12:47'),
(4, 2, 'bhavana', 2, 2, 'bhavana', 'bhavana', 1, 1, '2010-12-11 13:05:39'),
(9, 4, 'viknesh', 1, 1, 'vickee', 'vickee', 3, 0, '2011-01-21 15:09:58'),
(10, 5, 'vinoth', 1, 2, 'vivo', 'vivo', 3, 0, '2011-01-21 15:11:21'),
(11, 5, 'jeba', 1, 1, 'jeba', 'jeba', 2, 0, '2011-01-26 12:22:47'),
(12, 6, 'Muthu', 1, 1, 'pandi', 'pandi', 3, 0, '2011-01-26 00:12:57'),
(13, 3, 'jebastine', 1, 1, 'jeba', 'jeba', 3, 0, '2011-01-26 15:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_userloginupdates`
--

CREATE TABLE IF NOT EXISTS `ourbank_userloginupdates` (
  `userlogin_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `login_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `confirmpassword` varchar(10) CHARACTER SET utf8 NOT NULL,
  `recordstatus_id` smallint(5) NOT NULL,
  `createdby` int(10) NOT NULL,
  `createddate` date DEFAULT NULL,
  `editedby` int(10) DEFAULT NULL,
  `editeddate` date DEFAULT NULL,
  PRIMARY KEY (`userlogin_id`),
  KEY `Created_By` (`createdby`),
  KEY `Updated_By` (`editedby`),
  KEY `personnel_id` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ourbank_userloginupdates`
--

INSERT INTO `ourbank_userloginupdates` (`userlogin_id`, `user_id`, `login_name`, `password`, `confirmpassword`, `recordstatus_id`, `createdby`, `createddate`, `editedby`, `editeddate`) VALUES
(1, 1, 'admin', 'admin', 'admin', 3, 0, '2010-09-04', NULL, NULL),
(2, 2, 'vijayrasq', '123456', '123456', 3, 0, '2010-09-04', NULL, NULL),
(3, 3, 'sree', '1234567', '1234567', 3, 0, '2010-09-06', NULL, NULL),
(4, 4, 'Chethan', '12345678', '12345678', 3, 0, '2010-09-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ourbank_user_log`
--

CREATE TABLE IF NOT EXISTS `ourbank_user_log` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(10) NOT NULL,
  `office_id` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `gender` int(10) NOT NULL,
  `designation` int(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_by` mediumint(9) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ourbank_user_log`
--

