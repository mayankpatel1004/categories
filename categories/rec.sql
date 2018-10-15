-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2011 at 12:11 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rec`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent`) VALUES
(1, 'Web development', 0),
(2, 'Application development', 0),
(3, 'Linux', 0),
(4, 'Misc', 0),
(5, 'Php', 1),
(6, 'Mysql', 1),
(7, 'Javascript', 1),
(8, 'CSS', 1),
(9, 'C plus plus', 2),
(10, 'wxWidgets', 2),
(11, 'Tutorials', 3),
(12, 'My thoughts', 4),
(13, 'joomla', 5),
(14, 'wordpress', 5);

-- --------------------------------------------------------

--
-- Table structure for table `categories1`
--

CREATE TABLE `categories1` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories1`
--

INSERT INTO `categories1` (`id`, `parent_id`, `category`) VALUES
(1, 0, 'a & w'),
(2, 0, 'b & f'),
(3, 1, 'c & sometimes y'),
(4, 1, 'd');

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

CREATE TABLE `categories_description` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `name` varchar(70) NOT NULL,
  `description` text NOT NULL,
  `seo_title` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_keywords` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`id`, `category_id`, `country_id`, `status`, `name`, `description`, `seo_title`, `seo_description`, `seo_keywords`) VALUES
(1, 1, 1, '1', 'first category', 'first category description', '', '', ''),
(2, 2, 1, '1', 'second category', 'description of second category', '', '', ''),
(3, 3, 1, '1', 'third category', 'description of third category', '', '', ''),
(4, 4, 1, '0', 'forth category', 'description of forth category', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cate_gory`
--

CREATE TABLE `cate_gory` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `cate_gory`
--

INSERT INTO `cate_gory` (`id`, `name`, `parent`) VALUES
(1, 'Web development', 0),
(5, 'Php', 1),
(6, 'Mysql', 1),
(7, 'Javascript', 1),
(13, 'joomla', 5),
(14, 'wordpress', 5);

-- --------------------------------------------------------

--
-- Table structure for table `rec1`
--

CREATE TABLE `rec1` (
  `id` int(11) NOT NULL auto_increment,
  `woid` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `rec1`
--

INSERT INTO `rec1` (`id`, `woid`, `parent`, `name`) VALUES
(1, 1111, 0, 'pdf'),
(2, 1111, 0, 'docs'),
(3, 3333, 0, 'pdf'),
(4, 1111, 2, 'folder1'),
(5, 2222, 4, 'folder3'),
(6, 3333, 5, 'folder');
