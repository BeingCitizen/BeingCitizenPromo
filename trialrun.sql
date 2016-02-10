-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2016 at 04:03 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `trialrun`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` bigint(200) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `passward` varchar(200) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `passward`, `start_time`) VALUES
(1, 'test', 'test', '2015-12-17 12:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE IF NOT EXISTS `blogs` (
  `blog_id` bigint(200) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `body` text,
  `user_id` bigint(200) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `title`, `body`, `user_id`, `created_at`, `updated_at`, `image`) VALUES
(1, 'first', 'fmashdskljf,smm', 3, '2015-11-25 09:19:10', '2015-11-25 09:19:10', 'public/blog_uploads/200780264-12196368_529517747210805_3699692238038034839_n.jpg'),
(2, 'hello', 'nsvxbnz czscsefhjkjk', 3, '2015-11-25 09:20:00', '2015-11-25 09:20:00', NULL),
(3, 'trial', 'xvnbmzckjdj,m', 3, '2015-11-25 09:21:11', '2015-11-25 09:21:11', NULL),
(4, 'last', 'zcnbmn, klil', 3, '2015-11-25 09:28:31', '2015-11-25 09:28:31', NULL),
(5, 'bas', 'zvcnbvnmb', 3, '2015-11-25 09:31:01', '2015-11-25 09:31:01', 'public/blog_uploads/36631283-6-4315-4-Funny-Minion-Quotes-Of-The-Day-270.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `campaign_id` bigint(200) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_text` text COLLATE utf8_unicode_ci NOT NULL,
  `constituency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `started_by` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `followers` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'False',
  `volunteers` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'False',
  `start_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`campaign_id`, `name`, `campaign_text`, `constituency`, `started_by`, `status`, `category`, `image`, `followers`, `volunteers`, `start_date`, `created_at`, `updated_at`) VALUES
(1, 'test', '', 'Angpura', 1, 1, 'Police', NULL, 'false', 'false', '2015-10-22', '2015-10-21 08:44:55', '2015-10-21 08:44:55'),
(2, 'duplicate', '', 'Adarsh Nagar', 1, 1, 'Police', NULL, 'false', 'false', '2015-10-23', '2015-10-21 11:18:52', '2015-10-21 11:18:52'),
(3, 'just checking tag', 'heya', 'Adarsh Nagar', 1, 1, 'Local Government', 'public/uploads/190006853-IMG_20141207_224145.jpg', 'false', 'false', '2015-10-22', '2015-10-22 09:32:50', '2015-10-22 09:32:50'),
(4, 'finally', 'you are dead', 'Adarsh Nagar', 1, 2, 'Public Law and Order', 'public/uploads/99196367-IMG_9583.jpg', 'true', 'true', '2015-10-24', '2015-10-24 13:37:46', '2015-10-24 13:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `camp_comment1`
--

CREATE TABLE IF NOT EXISTS `camp_comment1` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `camp_comment2`
--

CREATE TABLE IF NOT EXISTS `camp_comment2` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `camp_comment3`
--

CREATE TABLE IF NOT EXISTS `camp_comment3` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `camp_comment_mla`
--

CREATE TABLE IF NOT EXISTS `camp_comment_mla` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `camp_downvote`
--

CREATE TABLE IF NOT EXISTS `camp_downvote` (
  `comment_id` bigint(200) unsigned NOT NULL,
  `downvote` bigint(200) NOT NULL,
  `user_id` bigint(200) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`downvote`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camp_downvote_mla`
--

CREATE TABLE IF NOT EXISTS `camp_downvote_mla` (
  `comment_id` bigint(200) unsigned NOT NULL,
  `downvote` bigint(200) NOT NULL,
  `user_id` bigint(200) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`downvote`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camp_follow`
--

CREATE TABLE IF NOT EXISTS `camp_follow` (
  `user_id` bigint(200) unsigned NOT NULL,
  `campaign_id` bigint(200) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `camp_follow`
--

INSERT INTO `camp_follow` (`user_id`, `campaign_id`) VALUES
(9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `camp_upvote`
--

CREATE TABLE IF NOT EXISTS `camp_upvote` (
  `comment_id` bigint(200) unsigned NOT NULL,
  `upvote` bigint(200) unsigned NOT NULL,
  `user_id` bigint(200) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`upvote`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camp_upvote_mla`
--

CREATE TABLE IF NOT EXISTS `camp_upvote_mla` (
  `comment_id` bigint(200) unsigned NOT NULL,
  `upvote` bigint(200) unsigned NOT NULL,
  `user_id` bigint(200) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`upvote`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camp_volunteer`
--

CREATE TABLE IF NOT EXISTS `camp_volunteer` (
  `user_id` bigint(200) unsigned NOT NULL,
  `campaign_id` bigint(200) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `constituency`
--

CREATE TABLE IF NOT EXISTS `constituency` (
  `Constituency` varchar(60) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Constituency`,`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `constituency`
--

INSERT INTO `constituency` (`Constituency`, `pincode`, `count`) VALUES
('Adarsh Nagar', 110009, 21),
('Adarsh Nagar', 110033, 124),
('Ambedkar Nagar', 110017, 28),
('Ambedkar Nagar', 110062, 112),
('Angpura', 110002, 4),
('Angpura', 110006, 12),
('Angpura', 110013, 44),
('Angpura', 110014, 41),
('Angpura', 110024, 22),
('Babarpur', 110053, 69),
('Babarpur', 110094, 39),
('Badarpur', 110044, 209),
('Badli', 110042, 94),
('Ballimaran', 110006, 91),
('Ballimaran', 110052, 17),
('Ballimaran', 110055, 59),
('Bawana', 110039, 97),
('Bawana', 110042, 66),
('Bawana', 110081, 10),
('Bawana', 110085, 36),
('Bawana', 110086, 70),
('Bijwasan', 110037, 48),
('Bijwasan', 110045, 48),
('Bijwasan', 110061, 27),
('Bijwasan', 110070, 8),
('Bijwasan', 110078, 2),
('Burari', 110007, 1),
('Burari', 110033, 21),
('Burari', 110036, 23),
('Burari', 110042, 34),
('Burari', 110084, 124),
('Chandni Chowk', 110002, 3),
('Chandni Chowk', 110006, 85),
('Chandni Chowk', 110054, 36),
('Chhatarpur', 110030, 21),
('Chhatarpur', 110047, 28),
('Chhatarpur', 110068, 45),
('Chhatarpur', 110074, 35),
('Delhi Cantt', 110003, 1),
('Delhi Cantt', 110010, 39),
('Delhi Cantt', 110021, 25),
('Delhi Cantt', 110023, 22),
('Delhi Cantt', 110066, 1),
('Deoli', 110062, 186),
('Dwarka', 110045, 76),
('Dwarka', 110046, 77),
('Gandhi Nagar', 110031, 85),
('Gandhi Nagar', 110051, 31),
('Gandhi Nagar', 110053, 26),
('Ghonda', 110053, 169),
('Gokalpur', 110093, 69),
('Gokalpur', 110094, 107),
('Greater Kailash', 110017, 62),
('Greater Kailash', 110019, 42),
('Greater Kailash', 110048, 41),
('Greater Kailash', 110065, 11),
('Hari Nagar', 110018, 10),
('Hari Nagar', 110027, 20),
('Hari Nagar', 110028, 7),
('Hari Nagar', 110046, 5),
('Hari Nagar', 110058, 24),
('Hari Nagar', 110061, 16),
('Hari Nagar', 110064, 69),
('Janakpuri', 110037, 20),
('Janakpuri', 110058, 70),
('Janakpuri', 110059, 49),
('Kalkaji', 110019, 99),
('Kalkaji', 110025, 24),
('Kalkaji', 110065, 35),
('Karawal Nagar', 110094, 205),
('Karol Bagh', 110005, 115),
('Karol Bagh', 110055, 54),
('Kasturba Nagar', 110003, 59),
('Kasturba Nagar ', 110014, 7),
('Kasturba Nagar', 110024, 40),
('Kasturba Nagar', 110049, 31),
('Kasturba Nagar', 110065, 12),
('Kirari', 110086, 203),
('Kondli', 110091, 40),
('Kondli', 110096, 100),
('Krishna Nagar', 110031, 60),
('Krishna Nagar', 110051, 124),
('Laxmi Nagar', 110092, 164),
('Madipur', 110015, 20),
('Madipur', 110026, 18),
('Madipur', 110027, 57),
('Madipur', 110063, 49),
('Malviya Nagar', 110016, 31),
('Malviya Nagar', 110017, 50),
('Malviya Nagar', 110029, 25),
('Malviya Nagar', 110049, 20),
('Malviya Nagar', 110078, 5),
('Matia Mahal', 110002, 26),
('Matia Mahal', 110006, 105),
('Matiala', 110043, 96),
('Matiala', 110059, 50),
('Matiala', 110071, 34),
('Matiala', 110073, 18),
('Matiala', 110075, 24),
('Mehrauli', 110016, 13),
('Mehrauli', 110017, 14),
('Mehrauli', 110030, 65),
('Mehrauli', 110038, 7),
('Mehrauli', 110067, 6),
('Mehrauli', 110070, 55),
('Model Town', 110007, 83),
('Model Town', 110033, 72),
('Model Town', 110052, 4),
('Moti Nagar', 110005, 13),
('Moti Nagar', 110015, 125),
('Mundka', 110041, 130),
('Mundka', 110081, 103),
('Mustafabad', 110094, 181),
('Najafgarh', 110043, 156),
('Najafgarh', 110072, 10),
('Najafgarh', 110073, 28),
('Nangloi Jat', 110041, 114),
('Nangloi Jat', 110087, 69),
('Nerela', 110036, 61),
('Nerela', 110040, 131),
('Nerela', 110042, 8),
('Nerela', 110082, 51),
('New Delhi', 110001, 77),
('New Delhi', 110003, 36),
('New Delhi', 110004, 3),
('New Delhi', 110011, 6),
('New Delhi', 110021, 6),
('New Delhi', 110023, 35),
('New Delhi', 110025, 11),
('New Delhi', 110029, 7),
('New Delhi', 110044, 3),
('Okhla', 110025, 108),
('Okhla', 110065, 8),
('Okhla', 110076, 74),
('Palam', 110045, 123),
('Palam', 110059, 46),
('Palam', 110075, 24),
('Patel Nagar', 110005, 39),
('Patel Nagar', 110008, 123),
('Patparganj', 110091, 89),
('Patparganj', 110092, 90),
('Patparganj', 110096, 1),
('R.K. Puram', 110021, 20),
('R.K. Puram', 110022, 67),
('R.K. Puram', 110057, 29),
('R.K. Puram', 110066, 8),
('R.K. Puram', 110067, 27),
('Rajinder Nagar', 110005, 19),
('Rajinder Nagar', 110060, 27),
('Rajouri Garden', 110018, 88),
('Rajouri Garden', 110027, 62),
('Rithala', 110085, 145),
('Rithala', 110086, 67),
('Rohini', 110042, 18),
('Rohini', 110085, 114),
('Rohtas Nagar', 110053, 20),
('Rohtas Nagar', 110093, 89),
('Sadar Bazar', 110005, 13),
('Sadar Bazar', 110006, 38),
('Sadar Bazar', 110007, 56),
('Sadar Bazar', 110035, 22),
('Sadar Bazar', 110052, 36),
('Sangam Vihar', 110019, 33),
('Sangam Vihar', 110062, 113),
('Seelam Pur', 110053, 150),
('Seemapuri', 110093, 71),
('Seemapuri', 110095, 75),
('Shahdara', 110032, 64),
('Shahdara', 110095, 91),
('Shakur Basti', 110034, 60),
('Shalimar Bagh', 110034, 52),
('Shalimar Bagh', 110088, 97),
('Sultan Pur Majra', 110083, 25),
('Sultan Pur Majra', 110086, 126),
('Tilak Nagar', 110018, 129),
('Timarpur', 110007, 51),
('Timarpur', 110009, 59),
('Timarpur', 110054, 57),
('Tri Nagar', 110034, 89),
('Tri Nagar', 110035, 57),
('Trilokpuri', 110091, 117),
('Trilokpuri', 110095, 1),
('Trilokpuri', 110096, 33),
('Tughlakabad', 110019, 5),
('Tughlakabad', 110020, 76),
('Tughlakabad', 110044, 64),
('Uttam Nagar', 110059, 175),
('Vikaspuri', 110018, 37),
('Vikaspuri', 110041, 68),
('Vikaspuri', 110059, 141),
('Vishwas Nagar', 110032, 40),
('Vishwas Nagar', 110051, 3),
('Vishwas Nagar', 110092, 111),
('Vishwas Nagar', 110095, 2),
('Vishwas Nagar', 110096, 14),
('Wazirpur', 110035, 25),
('Wazirpur', 110052, 145);

-- --------------------------------------------------------

--
-- Table structure for table `debates`
--

CREATE TABLE IF NOT EXISTS `debates` (
  `debate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `debate_text` text COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `start_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`debate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `debates`
--

INSERT INTO `debates` (`debate_id`, `name`, `debate_text`, `category`, `image`, `start_date`, `created_at`, `updated_at`) VALUES
(1, 'first', '', 'Foreign Affairs', NULL, '2015-10-21', '2015-10-21 11:35:45', '2015-10-21 11:35:45'),
(2, 'duplicate', '', 'Foreign Affairs', 'public/debate_uploads/129331545-IMG_20141207_172159342_HDR.jpg', '2015-10-23', '2015-10-21 11:36:01', '2015-10-21 11:36:01'),
(4, '', '', 'Defence and Armed Forces', 'public/debate_uploads/89772796-6-4315-4-Funny-Minion-Quotes-Of-The-Day-270.jpg', '2015-10-21', '2015-10-21 12:04:42', '2015-10-21 12:04:42'),
(5, '', '', 'Defence and Armed Forces', NULL, '2015-10-21', '2015-10-21 12:07:23', '2015-10-21 12:07:23'),
(6, 'trial', '', 'Citizenship', NULL, '2015-12-16', '2015-12-16 14:02:53', '2015-12-16 14:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `debate_comments1`
--

CREATE TABLE IF NOT EXISTS `debate_comments1` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `debate_id` bigint(20) unsigned NOT NULL,
  `yes_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `debate_comments1`
--

INSERT INTO `debate_comments1` (`comment_id`, `content`, `debate_id`, `yes_no`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'sdftyguhjik', 4, 'yes', 1, '2016-01-18 02:56:44', '2016-01-18 02:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `debate_comments2`
--

CREATE TABLE IF NOT EXISTS `debate_comments2` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `debate_id` bigint(20) unsigned NOT NULL,
  `yes_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debate_comments3`
--

CREATE TABLE IF NOT EXISTS `debate_comments3` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `debate_id` bigint(20) unsigned NOT NULL,
  `yes_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `debate_downvote`
--

CREATE TABLE IF NOT EXISTS `debate_downvote` (
  `comment_id` bigint(200) unsigned NOT NULL,
  `downvote` bigint(200) unsigned NOT NULL,
  `user_id` bigint(200) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`downvote`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debate_upvote`
--

CREATE TABLE IF NOT EXISTS `debate_upvote` (
  `comment_id` bigint(200) unsigned NOT NULL,
  `upvote` bigint(200) unsigned NOT NULL,
  `user_id` bigint(200) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`upvote`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hashtag_posts`
--

CREATE TABLE IF NOT EXISTS `hashtag_posts` (
  `post_id` bigint(200) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(200) unsigned NOT NULL,
  `content` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `hashtag_posts`
--

INSERT INTO `hashtag_posts` (`post_id`, `user_id`, `content`, `post_date`) VALUES
(1, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 16:05:26'),
(2, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 16:07:05'),
(3, 1, '\n								<span id="tagged"></span>\n							', '2015-10-22 16:08:19'),
(4, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 16:12:22'),
(5, 1, '', '2015-10-22 16:35:46'),
(6, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> </span>\n							', '2015-10-22 16:36:52'),
(7, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>hello how are you', '2015-10-22 16:40:51'),
(8, 1, '\n								 police\n							', '2015-10-22 16:43:43'),
(9, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 16:47:49'),
(10, 0, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 16:55:48'),
(11, 0, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">adf<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 16:56:43'),
(12, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 18:39:07'),
(13, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">adf<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 18:52:57'),
(14, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">adf<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-22 19:00:14'),
(15, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-23 16:33:34'),
(16, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-23 16:36:46'),
(17, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">adf<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-23 16:38:06'),
(18, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">adf<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-23 17:27:32'),
(19, 1, '\n								<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>\n							', '2015-10-23 18:39:47'),
(20, 3, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>hello', '2016-01-30 23:17:31'),
(21, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>cnvhnb', '2016-01-30 23:29:35'),
(22, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-30 23:30:52'),
(23, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-30 23:34:06'),
(24, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>chalja', '2016-01-30 23:35:11'),
(25, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">adf<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-30 23:36:20'),
(26, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-30 23:36:48'),
(27, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">police<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-30 23:41:25'),
(28, 1, '<span id="tagged"> <div class="lbl-tag" contenteditable="false">park<span class="close-tag"><i class="fa fa-close"></i></span></div> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-30 23:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `hash_tag`
--

CREATE TABLE IF NOT EXISTS `hash_tag` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` varchar(90) NOT NULL,
  PRIMARY KEY (`tag_id`,`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hash_tag`
--

INSERT INTO `hash_tag` (`tag_id`, `tag`) VALUES
(1, 'abc'),
(2, 'adf'),
(3, 'police'),
(4, 'park');

-- --------------------------------------------------------

--
-- Table structure for table `leaders`
--

CREATE TABLE IF NOT EXISTS `leaders` (
  `S_No` bigint(20) NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Constituency` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Education` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Profession` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Assets` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Liabilities` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Household_Income` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Criminal_Cases` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Localities` varchar(600) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY ` S no` (`S_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaders`
--

INSERT INTO `leaders` (`S_No`, `Name`, `Constituency`, `Education`, `Profession`, `Assets`, `Liabilities`, `Household_Income`, `Criminal_Cases`, `Localities`) VALUES
(1, 'Pawan Kumar Sharma', 'Adarsh Nagar ', '12th pass\nXII Passed , CBSE Board SSC Examination Board', ' Business ', 'Rs 1,09,96,895 ~1 Crore+', 'Rs 2,56,710 ~2 Lacs+', 'Self : Rs 3,85,150 Spouse : Rs 2,50,513 ', 'Cases Framed =1;Cases Cognizance Taken =0;Cases Convicted =0', 'Azadpur;\r\nVillage Bharola;\r\nSarai Pipal Thala;\r\nVillage Dhirpur;\r\nNirankari Colony;\r\nGandhi Vihar;\r\nModel Town-III, R-Bloc;\r\nModel Town-III, Mohan Park;\r\nModel Town-II, Police Colony;\r\nRameshwar Nagar;\r\nKewal Park;\r\nGopal Nagar;\r\nPanchvati;\r\nIndira Nagar;\r\nMajilis Park;\r\nAdarsh Nagar;\r\nRam Garh;\r\nSanjay Enclave;\r\nMahendra Park;\r\nSanjay Nagar;\r\nJahangir Puri;'),
(2, 'Ajay Dutt', 'Ambedkar Nagar ', 'Post Graduate\r\nM.B.A (Executive) From Amity University Up 2010', 'Self Employed ', 'Rs 2,34,27,501 ~2 Crore+', 'Rs 29,72,000 ~29 Lacs+', 'Self : Rs 12,31,570 Spouse : Rs 11,99,430 ', 'Cases Framed =0;Cases Cognizance Taken =0;Cases Convicted =0', 'Pushp Vihar;\r\nMadangir;\r\nDakshin Puri;\r\nMadangir DDA Flats;\r\nKhanpur Village;\r\nKhanpur;\r\nJ J Colony, Khanpur;\r\nKhanpur Extn;\r\nKrishna Park;\r\nJawahar Park;\r\nShiv Park, Khanpur;\r\nDuggal Colony, Khanpur;\r\nRaju Park, Khanpur;\r\nBihari Park, Khanpur;\r\nSainik Farm;'),
(3, 'Gopal Rai', 'Babarpur', 'Post Graduate\r\nPost Graduation (Sociology ) from Lucknow University in 1998', 'Social work', 'Rs 52,39,843 ~52 Lacs+', 'Nil', 'Self : Rs 1,66,000 Spouse : Rs 0', 'Cases Framed:1 ; Cases Cognizance Taken:1 ;Cases Convicted:0', ''),
(4, 'Narayan Dutt Sharma', 'Badarpur', '12th Pass\n12th From Haryana Education Board in the year 1992', 'Self Employed', 'Rs 61,78,144 ~61 Lacs+', 'Rs 50,000 ~50 Thou+', 'Self : Rs 3,05,620  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(5, 'Ajesh Yadav', 'Badli', 'Graduate\r\nBA From Delhi University in the Year 1990', 'Business', 'RsÂ 14,50,47,653 ~14Â Crore+', 'RsÂ 1,54,04,944 ~1Â Crore+', 'Self : Rs 4,47,536  Spouse : Rs 81,914', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(6, 'Imran Hussain', 'Ballimaran', 'Graduate\r\nBachelor of Business Studies Pass From\r\nJamia Millia Islamia University Delhi In 2005', 'Business', 'RsÂ 73,97,824 ~73Â Lacs+', 'RsÂ 7,50,000 ~7Â Lacs+', 'Self : Rs 6,64,186  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0', ''),
(7, 'Ved Parkash', 'Bawana', 'Graduate\r\nB.A.(Mass Communication) From Kurukshetra University,Year-2006, 12th Pass From Haryana Board,Year-1993', 'Business', 'RsÂ 1,17,82,955 ~1Â Crore+', 'RsÂ 5,54,074 ~5Â Lacs+', 'Self : Rs 2,27,700   Spouse : Rs 8,74,956', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0', ''),
(8, 'Col Devinder Sehrawat', 'Bijwasan', 'Post Graduate\r\nM.Sc. Post Graduation From Madras University,Year-2000, B.Sc. From JNU(NDA,Pune),year-1986', 'Social Activist', 'RsÂ 2,29,36,566 ~2Â Crore+', 'RsÂ 4,80,000 ~4Â Lacs+', 'Self : Rs13,52,926  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:2 ;Cases Convicted:0', ''),
(9, 'Sanjeev Jha', 'Burari', 'Graduate\r\nB.A. (Hon.) from R. K. College, Madhubani, Bihar in 2001', 'Social Worker', 'RsÂ 8,27,915 ~8Â Lacs+', 'Nil', 'Self : Rs 1,53,694   Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(10, 'Alka Lamba', 'Chandni Chowk', 'Post Graduate\r\nB.Sc From Delhi University Delhi In 1996, M.Sc In 1998 & M.Ed. From Bundelkhand University UP', 'Politician', 'RsÂ 1,40,12,477 ~1Â Crore+', 'Nil', 'Self : Rs 12,78,800  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(11, 'Kartar Singh Tanwar', 'Chhatarpur', 'Others\r\n12th Govt. Sr. Sec. School, Mehrauli, New Delhi 1981, Diploma in Civil Engineering G.B.Pant Polytechnic, Okhla, New Delhi 1984', 'Self Employed', 'RsÂ 17,65,12,596 ~17Â Crore+', 'RsÂ 9,24,33,052 ~9Â Crore+', 'Self : Rs 12,65,083  Spouse : Rs 7,09,874 Dependent1 : Rs 3,23,690 Dependent2 : Rs  2,75,946', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0', ''),
(12, 'Surender Singh', 'Delhi Cantt', 'Graduate\r\nB.A. From Sikkim University,Year-2012', 'Retd. Govt. Servant, Ex.MLA', 'RsÂ 76,29,527 ~76Â Lacs+', 'Nil', 'Self : Rs 1,14,815  Spouse : Rs 2,33,280', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(13, 'Prakash', 'Deoli', 'Post Graduate\r\nM.Com, Delhi University 2011', 'EX-MLA(Politician)', 'RsÂ 46,740 ~46Â Thou+', 'RsÂ 16,436 ~16Â Thou+', 'Self : Rs  3,50,930 Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0', ''),
(14, 'Adarsh Shastri', 'Dwarka', 'Post Graduate\r\nPost Graduate Diploma in Management(PGDM) From Lal Bahadur Shastri Institute of Management, Delhi', 'Public Service & Social Work', 'RsÂ 2,21,38,623 ~2Â Crore+', 'RsÂ 51,07,118 ~51Â Lacs+', 'Self : Rs 89,78,106 Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(15, 'Anil Kumar Bajpai', 'Gandhi Nagar', 'Graduate\r\nB.A. (Graduation) from Meerut Universiy in 1978', 'Self Employed (Business)', 'RsÂ 4,47,001 ~4Â Lacs+', 'Nil', 'Self : Rs 2,76,559   Spouse : Rs 2,24,080', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(16, 'Shri Dutt Sharma', 'Ghonda', '12th Pass\r\n12th from CBSE New Delhi in 1981', 'Social Activist', 'RsÂ 14,01,08,017 ~14Â Crore+', 'RsÂ 1,04,40,607 ~1Â Crore+', 'Self : Rs 4,91,100   Spouse : Rs 5,26,134 ', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(17, 'Fateh Singh', 'Gokalpur', 'Graduate\r\nB.A.,From C.L.S.University U.P.', 'Material Dealer', 'RsÂ 7,26,46,007 ~7Â Crore+', 'RsÂ 2,00,000 ~2Â Lacs+', 'Self : Rs 2,39,600  Spouse : Rs 2,03,640 ', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(18, 'Saurabh Bhardwaj', 'Greater Kailash', 'Graduate Professional\r\nB.Tech.(Com.sci.) GGSIPU,Delhi 2003 ,L.L.B.Osmania University 2011', 'Software Engineer (Resigned From Job )Ex-MLA)', 'RsÂ 1,02,29,151 ~1Â Crore+', 'Nil', 'Self : Rs 5,32,840  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0', ''),
(19, 'Jagdeep Singh', 'Hari Nagar', '12th Pass\r\n12th from From National Open School Delhi In 1993', 'Self Employed (EX- MLA)', 'RsÂ 1,85,89,244 ~1Â Crore+', 'RsÂ 5,31,170 ~5Â Lacs+', 'Self : Rs  4,42,935  Spouse : Rs 5,80,844 ', 'Cases Framed:0 ; Cases Cognizance Taken:1;Cases Convicted:2', ''),
(20, 'Rajesh Rishi', 'JanakPuri', 'Graduate\r\nB.Sc From Agra University 1985', 'Self Employed', 'RsÂ 14,23,939 ~14Â Lacs+', 'Nil', 'Self : Rs 2,86,380 Spouse : Rs  2,25,890', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:4', ''),
(21, 'Praveen Kumar', 'Jangpura', 'Post Graduate\r\nMBA From Technocrate Institute of Technology, Barkatullah University,Year-2008\r\n', 'Social Worker', 'RsÂ 8,07,000 ~8Â Lacs+', 'Nil', 'Self : Rs 0  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(22, 'Avtar Singh ', 'Kalkaji', '8th Pass\r\nUnder Matric, Govt. Boys Senior Secondary School, K-Block, Kalkaji, New Delhi-110019 in the year 1977', 'Contractor', 'RsÂ 5,77,958 ~5Â Lacs+', 'Nil', 'Self : Rs 4,66,904  Spouse : Rs 0 Dependent : Rs 2,32,062 ', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(23, 'Kapil Mishra', 'Karawal Nagar', 'Post Graduate\r\nM.A(Social Work), Dept. of Social Work University of Delhi In 2006', 'Social Work', 'RsÂ 46,00,637 ~46Â Lacs+', 'RsÂ 19,99,864 ~19Â Lacs+', 'Self : Rs4,45,051  Spouse : Rs 0', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0', ''),
(24, 'Vishesh Ravi', 'Karol Bagh', '12th Pass\r\nB.A (Prog.) Pursuing From IGNOU (Delhi ) University', 'Business', 'RsÂ 7,17,000 ~7Â Lacs+', 'RsÂ 35,000 ~35Â Thou+\r\n', 'Self : Rs 3,46,215  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(25, 'Madan Lal', 'Kasturba Nagar', 'Post Graduate\r\nM.A LLB From M.M.H. Collage, Ghaziabad Meerut University In 1981\r\n', 'Advocate\r\n', 'RsÂ 2,68,29,444 ~2Â Crore+\r\n', 'RsÂ 19,24,841 ~19Â Lacs+\r\n', 'Self : Rs3,39,106   Spouse : Rs 1,93,200\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(26, 'Rituraj Govind', 'Kirari', 'Others\r\nAdvance Diploma in Hotel Management From Monarch International College of Hotel Management, University of Tefe Adeled Australia,Year-2007\r\n', 'Social Worker\r\n', 'RsÂ 37,933 ~37Â Thou+\r\n', 'Nil\r\n', 'Self : Rs 1,99,500  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(27, 'Manoj Kumar', 'Kondli', '10th Pass\r\n10th Pass from National Open School, New Delhi in 1996\r\n', 'Politician and Social Worker\r\n', 'RsÂ 9,46,186 ~9Â Lacs+\r\n', 'RsÂ 79,082 ~79Â Thou+\r\n', 'Self : Rs 2,02,800  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(28, 'S K Bagga', 'Krishna Nagar', 'Post Graduate\r\nM.Com LLB From Meerut University , UP In 1992\r\n', 'Advocate\r\n', 'RsÂ 7,41,41,683 ~7Â Crore+\r\n', 'RsÂ 53,03,529 ~53Â Lacs+\r\n', 'Self : Rs 6,56,517  Spouse : Rs 2,13,545\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(29, 'Nitin Tyagi', 'Laxmi Nagar', 'Post Graduate\r\nPost Graduate Diploma In Business Management From IMT Ghaziayabd UP In 1997\r\n', 'Business(Consultancy & Service Industry)\r\n', 'RsÂ 1,43,39,460 ~1Â Crore+\r\n', 'RsÂ 3,84,000 ~3Â Lacs+\r\n', 'Self : Rs 3,02,795 Spouse : Rs 1,99,666\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(30, 'Girish Soni', 'Madipur', '10th Pass\r\n10th Class From Govt. Boys Senior Sec. School Madipur, New Delhi-63 in 1979, ITI Refrigeration & Air-Conditioning From ITI Pusa, New Delhi in 1982\r\n\r\n', 'Manufacturing & Trading of Leather Goods Under the Name & Style of M/s Mascot Leather Craft 555/2 Paschim Puri, New Delhi 110063\r\n', 'RsÂ 1,26,88,397 ~1Â Crore+\r\n', 'RsÂ 12,69,467 ~12Â Lacs+\r\n', 'Self : Rs 3,48,496  Spouse : Rs 2,37,332\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(31, 'Somnath Bharti', 'Malviya Nagar', 'Post Graduate\r\nM.Sc. (Math) from Indian Institute of Technology Delhi in 1997, LLB from Law Center-II, Delhi University in 2008\r\n', 'Advocate\r\n', 'RsÂ 1,39,81,720 ~1Â Crore+\r\n', 'RsÂ 20,96,655 ~20Â Lacs+\r\n', 'Self : Rs  5,01,575   Spouse : Rs 4,35,000\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0\r\n', ''),
(32, 'Rakhi Birla', 'Mangol Puri', 'Post Graduate\r\nM.A From Guru Jambeshwar University In 2010\r\n', 'Social Work\r\n', 'RsÂ 18,000 ~18Â Thou+\r\n', 'RsÂ 2,90,000 ~2Â Lacs+\r\n', 'Self : Rs 0  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:2 ;Cases Convicted:0\r\n', ''),
(33, 'Asim Ahmed Khan', 'Matia Mahal', 'Graduate\r\nB.A. course from Chaudhary Charan Singh University Meerut in the year 2010\r\n', 'Business\r\n', 'RsÂ 6,53,49,988 ~6Â Crore+\r\n', 'RsÂ 16,57,220 ~16Â Lacs+\r\n', 'Self : Rs 64,07,224 Spouse : Rs 15,58,520 \r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(34, 'Gulab Singh', 'Matiala', '12th Pass\r\nSenior Secondary From NIOS, Delhi,Year-1999\r\n', 'Self Employed\r\n', 'RsÂ 5,70,30,400 ~5Â Crore+\r\n', 'RsÂ 20,48,382 ~20Â Lacs+\r\n', 'Self : Rs 8,56,438  Spouse : Rs 3,89,056\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:10\r\n', ''),
(35, 'Naresh Yadav', 'Mehrauli', 'Graduate Professional\r\nB.Com (Pass) from Ram Lal Anand College University of Delhi 1994, LLB from IME Law College, CH. Charan singh University meerut in 2005\r\n', 'Advocate\r\n', 'RsÂ 26,80,80,564 ~26Â Crore+\r\n', 'RsÂ 2,73,50,000 ~2Â Crore+\r\n', 'Self : Rs 6,22,536  Spouse : Rs 3,17,321\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(36, 'Akhilesh Pati Tripathi', 'Model Town', 'Post Graduate\r\nM.A. (Ancient History) From RML Avadh University Faizabad U.P. in 2008\r\n', 'Social Work\r\n', 'RsÂ 1,88,118 ~1Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 2,53,194   Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0\r\n', ''),
(37, 'Shiv Charan Goel', 'Moti Nagar', '12th Pass\r\n12th Class from Govt. Boys Senior Secondary School, Punjabi Bagh New Delhi in 1980\r\n', 'Businessman\r\n', 'RsÂ 18,14,62,602 ~18Â Crore+\r\n', 'RsÂ 4,13,00,000 ~4Â Crore+\r\n', 'Self : Rs 22,44,776  Spouse : Rs 19,03,673\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(38, 'Sukhvir Singh', 'Mundka', 'Post Graduate\r\nM.A. (ECO), Global University of Nagaland India 2013\r\n', 'Retired Govt. Servant\r\n', 'RsÂ 18,10,96,152 ~18Â Crore+\r\n', 'RsÂ 8,27,809 ~8Â Lacs+\r\n', 'Self : Rs 7,73,360  Spouse : Rs 2,18,004 Dependent1 : Rs  3,50,150  Dependent2 : Rs  3,64,372\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(39, 'Jagdish Pradhan', 'Mustafabad ', '10th Pass\r\n10th Matriculation ,Loni Inter College ,Loni Ghaziabad U.P. In 1972\r\n', 'Bussiness\r\n', 'RsÂ 13,99,74,291 ~13Â Crore+\r\n', 'RsÂ 17,60,325 ~17Â Lacs+\r\n', 'Self : Rs 5,29,335  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(40, 'Kailash Gahlot', 'Najafgarh', 'Post Graduate\r\nLLM from Faculty of Law, Delhi University in 2002, LLB from Campus Law Center, Faculty of Law, Delhi University in 1998, B.A. from Shri Venkateshwar College, Delhi University in 1995\r\n', 'Lawyer\r\n', 'RsÂ 37,45,41,806 ~37Â Crore+\r\n', 'RsÂ 8,55,25,139 ~8Â Crore+\r\n', 'Self : Rs  96,26,580  Spouse : Rs  59,36,034 \r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(41, 'Raghuvinder Shokeen', 'Nangloi Jat', 'Graduate\r\nB.Sc. From Engineering From Regional Engineering College, Kurushetra, Haryana in 1990\r\n', 'Business\r\n', 'RsÂ 6,22,97,490 ~6Â Crore+\r\n', 'RsÂ 22,82,122 ~22Â Lacs+\r\n', 'Self : Rs  10,25,705  Spouse : Rs 6,22,521\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(42, 'Sharad Kumar', 'Narela', '10th Pass\r\n10th Pass in Year 1995 From Govt. Boys Sr. Sec. School, Bakhtawarpur, Delhi-110036\r\n', 'Farmer\r\n', 'RsÂ 2,59,53,409 ~2Â Crore+\r\n', 'Nil\r\n', 'Self : Rs 3,76,512 Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(43, 'Arvind Kejriwal', 'New Delhi', 'Graduate Professional\r\nB.Tech, Mechnical Engineering, IIT Kharagpur,1989\r\n', 'Poltical Activist (Ex-Chief Minister Of Delhi )\r\n', 'RsÂ 2,09,85,366 ~2Â Crore+\r\n', 'RsÂ 41,00,000 ~41Â Lacs+\r\n', 'Self : Rs 2,07,330 Spouse : Rs 11,83,390\r\n', 'Cases Framed:3 ; Cases Cognizance Taken:7 ;Cases Convicted:0\r\n', ''),
(44, 'Amanatullah Khan', 'Okhla', '12th Pass\r\n12th Passed from Jamia Millia Islamia Sr. Secondary School in 1992-93\r\n', 'Business\r\n', 'RsÂ 2,00,73,316 ~2Â Crore+\r\n', 'Nil\r\n', 'Self : Rs  3,58,925  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0\r\n', ''),
(45, 'Bhavna Gaur', 'Palam', 'Graduate Professional\r\nB.A.- University of Delhi-1991, B.ed-Maharshi Dayanand University 1996\r\n', 'Self Employed\r\n', 'RsÂ 2,69,570 ~2Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 2,17,982  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(46, 'Hazari Lal Chauhan', 'Patel Nagar', '8th Pass\r\n9th Class from Govt. School, Dev Nagar, New Delhi in 1963\r\n', 'Business, Social Worker\r\n', 'RsÂ 2,61,12,537 ~2Â Crore+\r\n', 'RsÂ 33,000 ~33Â Thou+\r\n', 'Self : Rs 78,671  Spouse : Rs 82,597\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(47, 'Manish Sisodia', 'Patparganj', 'Others\r\nDIPLOMA IN JOURNALISM BHARTIYA VIDYA BHAWAN, 1993\r\n', 'SOCIAL SERVICE & POLITICAL ACTIVIST\r\n', 'RsÂ 41,66,133 ~41Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 4,40,871  Spouse : Rs 0\r\n', 'Cases Framed:1 ; Cases Cognizance Taken:5 ;Cases Convicted:0\r\n', ''),
(48, 'Parmila Tokas', 'R.K.Puram', '12th Pass\r\n10th Pass From Govt. Girls Sr.Sec.School, Dhansa New Delhi,CBSE,Year-1994, 12th Pass From Govt. Comp. Model Girls SS School,Dhansa,New Delhi,Year-1996\r\n', 'Business\r\n', 'RsÂ 87,90,98,874 ~87Â Crore+\r\n', 'RsÂ 12,15,96,944 ~12Â Crore+\r\n', 'Self : Rs 3,15,278  Spouse : Rs 2,10,30,982\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(49, 'Vijender Garg Vijay', 'Rajinder Nagar', 'Graduate\r\nB.Com (Pass) From Delhi University in 1985, 12th From CBSE Delhi in 1982\r\n', 'Self Employed (Trading and Repairing of Furniture)\r\n', 'RsÂ 2,36,04,194 ~2Â Crore+\r\n', 'Nil', 'Self : Rs 2,20,850  Spouse : Rs 1,86,650\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(50, 'Jarnail Singh', 'Rajouri Garden', 'Post Graduate\r\nMaster of Arts From Delhi Univeristy In 1995 & Diploma In Journalism From YMCA New Dlehi In 1994 \r\n', 'Writer\r\n', 'RsÂ 1,19,74,780 ~1Â Crore+\r\n', 'RsÂ 1,55,000 ~1Â Lacs+\r\n', 'Self : Rs 3,53,173  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:3 ;Cases Convicted:0\r\n', ''),
(51, 'Mohinder Goyal', 'Rithala', '10th Pass\r\n10th Class Passed from Hindu School, Kaithal, Haryana in 1979\r\n', 'Property Dealing\r\n', 'RsÂ 2,99,58,454 ~2Â Crore+\r\n', 'RsÂ 5,63,044 ~5Â Lacs+\r\n', 'Self : Rs 17,19,883   Spouse : Rs  9,40,840\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(52, 'Vijender Gupta', 'Rohini', 'Post Graduate\r\nM.Com From Delhi University in 1986, B.Com(Hons) From Ram Jas College Delhi University in 1984\r\n\r\n', 'Business\r\n', 'RsÂ 8,58,86,067 ~8Â Crore+\r\n', 'RsÂ 1,15,60,502 ~1Â Crore+\r\n', 'Self : Rs 6,58,563  Spouse : Rs 13,30,373 \r\n', 'Cases Framed:2 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(53, 'Sarita Singh', 'Rohtas Nagar', 'Post Graduate\r\nMaster In Arts (Sociology )From Delhi University \r\n', 'Social worker\r\n', 'RsÂ 1,18,280 ~1Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 0  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(54, 'Som Dutt', 'Sadar Bazar', 'Graduate\r\nB.A. Pass From Delhi University, S.G.T.B. Khalsa (E) College in 1997\r\n', 'Social Service\r\n', 'RsÂ 10,79,433 ~10Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 2,93,801  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(55, 'Dinesh Mohaniya', 'Sangam Vihar', '12th Pass\r\nXIIth Pass from CBSE in 1996\r\n', 'Self Employed\r\n', 'RsÂ 22,60,631 ~22Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 2,10,741 Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:1\r\n', ''),
(56, 'Mohd. Ishraque', 'Seelampur', '5th Pass\r\nMadarsa Islamia Arabia, Kashipur Vill. Palwara Dist Hapur (IUP)\r\n', 'Social Worker\r\n', 'RsÂ 2,73,00,738 ~2Â Crore+\r\n', 'Nil\r\n', 'Self : Rs 5,50,650  Spouse : Rs 3,55,780\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(57, 'Rajendra Pal Gautam', 'Seemapuri', 'Graduate Professional\r\nB.A. , LLB From University of Delhi,Year-1993\r\n', 'Advocate\r\n', 'RsÂ 63,49,317 ~63Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 2,31,199  Spouse : Rs  2,28,048\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(58, 'Ram Niwas Goel', 'Shahadra', 'Graduate\r\nB.A. From Hansraj College, Delhi University, Year-1971\r\n', 'Retd. Business Man\r\n', 'RsÂ 4,39,68,000 ~4Â Crore+\r\n', 'RsÂ 34,81,000 ~34Â Lacs+\r\n', 'Self : Rs 2,20,758  Spouse : Rs 2,31,310\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:2 ;Cases Convicted:0\r\n', ''),
(59, 'Satyender Kumar Jain ', 'Shakur Basti', 'Graduate\r\nAssociate Membership of Indian Institute of Architects By Examination 1991 (Equivalent to B.Arch)\r\n', 'SELF EMPLOYED(ARCHITECT)\r\n', 'RsÂ 8,08,41,007 ~8Â Crore+\r\n', 'RsÂ 1,17,05,000 ~1Â Crore+\r\n', 'Self : Rs 0  Spouse : Rs 1,91,374  Dependent1 : Rs 1,88,793 Dependent2 : Rs 4,432 \r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(60, 'Bandana Kumari', 'Shalimar Bagh', 'Graduate\r\nB.A. from Dr. Ambedkar Bihar University, Muzaffarpur in 1991-94\r\n', 'Ex. MLA\r\n', 'RsÂ 8,87,71,227 ~8Â Crore+\r\n', 'RsÂ 4,45,707 ~4Â Lacs+\r\n', 'Self : Rs 1,29,474  Spouse : Rs 7,12,809\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:0\r\n', ''),
(61, 'Sandeep Kumar', 'Sultanpur Majra', 'Graduate Professional\r\nL.L.B., CCS University, Meerut (U.P) from 2009\r\n', 'Advocate\r\n', 'RsÂ 13,16,629 ~13Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs 0  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(62, 'Jarnail Singh', 'Tilak Nagar', '12th Pass\r\nXII From CBSE Delhi In 2000\r\n', 'Ex MLA & Business\r\n', 'RsÂ 1,88,89,333 ~1Â Crore+\r\n', 'RsÂ 5,00,452 ~5Â Lacs+\r\n', 'Self : Rs 9,94,953  Spouse : Rs 3,30,786\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:1 ;Cases Convicted:1\r\n', ''),
(63, 'Pankaj Pushkar', 'Timarpur', 'Post Graduate\r\nM.A. From Political Science From Ch. Charan Singh University Meerut in 1995\r\n', 'Politician\r\n', 'RsÂ 1,48,80,949 ~1Â Crore+\r\n', 'RsÂ 5,71,442 ~5Â Lacs+\r\n', 'Self : Rs 4,60,789  Spouse : Rs 2,19,830\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(64, 'Jitender Singh Tomar', 'Tri Nagar', 'Graduate Professional\r\nLLB From Tilka Manjhi Bhagalpur University Bihar in 1999\r\n', 'Self Employed\r\n', 'RsÂ 1,07,24,369 ~1Â Crore+\r\n', 'RsÂ 7,46,950 ~7Â Lacs+\r\n', 'Self : Rs 7,26,370   Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(65, 'Raju Dhingan', 'Trilokpuri', '8th Pass\r\n9th Passed from Govt. Adult Senior Sec. School, Krishna Nagar Jheel Kuranja in 1998\r\n', 'Politician (EX- MLA)\r\n', 'RsÂ 10,10,862 ~10Â Lacs+\r\n', 'RsÂ 23,605 ~23Â Thou+\r\n', 'Self : Rs 0  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(66, 'Sahi Ram', 'Tughlakabad', '10th Pass\r\n11th From Govt. Boys Sr. Seco. School Bandarpur N.D\r\n', 'Social Work\r\n', 'RsÂ 94,06,703 ~94Â Lacs+\r\n', 'Nil\r\n', 'Self : Rs  2,39,400   Spouse : Rs 0\r\n', 'Cases Framed:2 ; Cases Cognizance Taken:0 ;Cases Convicted:1\r\n', ''),
(67, 'Naresh Balyan', 'Uttam Nagar', '8th Pass\r\n9th Pass From Haryana Shakti Senior Secondary School, Kanjhawla, Delhi in the year 1993\r\n', 'Social Worker\r\n', 'RsÂ 58,11,82,557 ~58Â Crore+\r\n', 'RsÂ 18,06,000 ~18Â Lacs+\r\n', 'Self : Rs 8,71,722  Spouse : Rs 2,15,600 \r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(68, 'Mahinder Yadav', 'Vikaspuri', '10th Pass\r\n10th from CBSE Board in 1980\r\n', 'Self Employed and as Present as Ex. MLA\r\n', 'RsÂ 2,15,32,814 ~2Â Crore+\r\n', 'Nil\r\n', 'Self : Rs 3,87,974  Spouse : Rs 0\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(69, 'Om Prakash Sharma', 'Vishwas Nagar', 'Graduate\r\nCBSE from Ramjas School No.1, Darya Ganj, New Delhi in 1972, Graduate from Delhi University, Satyawati College, Delhi in 1977\r\n', 'Business\r\n', 'RsÂ 19,25,76,370 ~19Â Crore+\r\n', 'RsÂ 5,40,41,948 ~5Â Crore+\r\n', 'Self : Rs 33,16,730  Spouse : Rs 11,87,040\r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', ''),
(70, 'Rajesh Gupta', 'Wazirpur', '12th Pass\r\nSenior Secondary CBSE Board Tyagi Public School Keshav Puram New Delhi \r\n', 'Business\r\n', 'RsÂ 16,52,676 ~16Â Lacs+\r\n', 'RsÂ 1,09,795 ~1Â Lacs+\r\n', 'Self : Rs  4,03,280  Spouse : Rs 2,29,880 \r\n', 'Cases Framed:0 ; Cases Cognizance Taken:0 ;Cases Convicted:0\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_100000_create_password_resets_table', 1),
('2015_06_11_060236_create_leaders_table', 1),
('2015_06_17_140848_create_users_table', 1),
('2015_06_17_140902_create_campaigns_table', 1),
('2015_06_19_035603_create_debates_table', 1),
('2015_06_20_031225_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ministeries_choice`
--

CREATE TABLE IF NOT EXISTS `ministeries_choice` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(99) NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ministeries_choice`
--

INSERT INTO `ministeries_choice` (`id`, `name`) VALUES
(1, 'Ministry of Education'),
(2, 'Ministry of Finance and Revenues'),
(3, 'Ministry of Land, Building and Urban Development'),
(4, 'Ministry of Vigilance'),
(5, 'Ministry of Employment and Labour'),
(6, 'Ministry of Transport'),
(7, 'Ministry of Health'),
(8, 'Ministry of Power'),
(9, 'Ministry of Tourism, Art and Culture'),
(11, 'Ministry of Law and Justice'),
(12, 'Ministry of Water'),
(13, 'Ministry of Environment and Forest'),
(13, 'Ministry of Social Welfare'),
(14, 'Ministry of Women and Child'),
(15, 'Municipal Corporation of Delhi'),
(16, 'New Delhi Municipal Corporation'),
(17, 'Public Works Department of Delhi'),
(18, 'Delhi Police');

-- --------------------------------------------------------

--
-- Table structure for table `ministeries_tagged`
--

CREATE TABLE IF NOT EXISTS `ministeries_tagged` (
  `department` varchar(200) NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`department`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ministeries_tagged`
--

INSERT INTO `ministeries_tagged` (`department`, `campaign_id`) VALUES
('Delhi Police', 3),
('Municipal Corporation of Delhi', 4),
('New Delhi Municipal Corporation', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mla_details`
--

CREATE TABLE IF NOT EXISTS `mla_details` (
  `user_id` varchar(200) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_user` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `constituency` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `residence` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` bigint(200) DEFAULT NULL,
  `pic_link` varchar(600) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mla_details`
--

INSERT INTO `mla_details` (`user_id`, `name`, `gender`, `about_user`, `password`, `constituency`, `residence`, `state`, `contact_no`, `pic_link`, `start_date`, `created_at`, `updated_at`) VALUES
('m001', 'test', 'male', '', 'test', '', 'Outside', 'Andaman_and_Nicobar_Islands', 34567890, '/laravel/public/public/user_pic/male.gif', '2016-01-08', '2016-01-08 09:26:22', '2016-01-08 09:26:22'),
('m002', 'test', 'male', '', 'test', '', 'Outside', 'Andaman_and_Nicobar_Islands', 34567890, '/laravel/public/public/user_pic/male.gif', '2016-01-08', '2016-01-08 09:26:22', '2016-01-08 09:26:22'),
('m003', 'test', 'male', '', 'jijba', 'Gandhi Nagar', 'Delhi', 'Delhi', 23456, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 03:44:29', '2016-01-17 03:44:29'),
('m004', 'test', 'male', '', 'jijba', 'Gandhi Nagar', 'Delhi', 'Delhi', 23456, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 03:44:29', '2016-01-17 03:44:29'),
('m005', 'check', 'male', '', 'please', 'Adarsh Nagar', 'Delhi', 'Delhi', 34567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 03:47:46', '2016-01-17 03:47:46'),
('m006', 'mohini', 'male', '', 'test', 'Adarsh Nagar', 'Delhi', 'Delhi', 23456, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 03:51:33', '2016-01-17 03:51:33'),
('m007', 'last', 'male', '', 'mohini', 'Chhatarpur', 'Delhi', 'Delhi', 1234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 03:57:21', '2016-01-17 03:57:21'),
('m008', 'marja', 'male', '', 'marja', 'Delhi Cantt', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:04:03', '2016-01-17 04:04:03'),
('m009', 'last', 'male', '', 'last', 'Dwarka', 'Delhi', 'Delhi', 23456, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:05:27', '2016-01-17 04:05:27'),
('m010', 'kill u', 'male', '', 'u', 'Adarsh Nagar', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:14:51', '2016-01-17 04:14:51'),
('m011', 'kill u', 'male', '', 'u', 'Adarsh Nagar', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:14:51', '2016-01-17 04:14:51'),
('m012', 'kill', 'male', '', 'qwerty', 'Adarsh Nagar', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:18:25', '2016-01-17 04:18:25'),
('m013', 'cute', 'male', '', 'test', 'Adarsh Nagar', 'Delhi', 'Delhi', 2345678, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:21:04', '2016-01-17 04:21:04'),
('m014', 'yaar', 'male', '', 'yaar', 'Dwarka', 'Delhi', 'Delhi', 1234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:26:17', '2016-01-17 04:26:17'),
('m015', 'yaar', 'male', '', 'yaar', 'Dwarka', 'Delhi', 'Delhi', 1234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:26:17', '2016-01-17 04:26:17');

--
-- Triggers `mla_details`
--
DROP TRIGGER IF EXISTS `mla_insert`;
DELIMITER //
CREATE TRIGGER `mla_insert` BEFORE INSERT ON `mla_details`
 FOR EACH ROW BEGIN
INSERT INTO mla_seq values (NULL);
SET NEW.user_id=CONCAT('m',LPAD(LAST_INSERT_ID(),3,'0'));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mla_hashtag_posts`
--

CREATE TABLE IF NOT EXISTS `mla_hashtag_posts` (
  `post_id` bigint(200) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mla_hashtag_posts`
--

INSERT INTO `mla_hashtag_posts` (`post_id`, `user_id`, `content`, `post_date`) VALUES
(20, '3', '<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>bbdjmdn', '2015-12-17 15:42:45'),
(24, 'm014', '<span id="tagged"> <div class="lbl-tag" contenteditable="false">abc<span class="close-tag"><i class="fa fa-close"></i></span></div></span>', '2016-01-29 09:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `mla_seq`
--

CREATE TABLE IF NOT EXISTS `mla_seq` (
  `mla_id` bigint(200) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`mla_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mla_seq`
--

INSERT INTO `mla_seq` (`mla_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poll_count`
--

CREATE TABLE IF NOT EXISTS `poll_count` (
  `poll_id` bigint(200) unsigned NOT NULL,
  `yes_count` bigint(200) unsigned NOT NULL DEFAULT '0',
  `no_count` bigint(200) unsigned NOT NULL DEFAULT '0',
  `other_count` bigint(200) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poll_count`
--

INSERT INTO `poll_count` (`poll_id`, `yes_count`, `no_count`, `other_count`) VALUES
(1, 0, 0, 0),
(2, 0, 0, 0),
(3, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_details`
--

CREATE TABLE IF NOT EXISTS `poll_details` (
  `poll_id` bigint(200) NOT NULL AUTO_INCREMENT,
  `poll_title` varchar(200) NOT NULL,
  `poll_description` text,
  PRIMARY KEY (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `poll_details`
--

INSERT INTO `poll_details` (`poll_id`, `poll_title`, `poll_description`) VALUES
(1, 'trial', 'this is first poll'),
(2, 'test', 'second poll'),
(3, 'third', 'third');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE IF NOT EXISTS `post_tag` (
  `tag_id` bigint(200) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(200) NOT NULL,
  `tag` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`tag_id`, `post_id`, `tag`) VALUES
(1, 1, 'abc'),
(2, 2, 'abc'),
(3, 4, 'police'),
(4, 5, 'police'),
(5, 6, 'park'),
(6, 7, 'police'),
(7, 8, 'police'),
(8, 9, 'park'),
(9, 10, 'police'),
(10, 11, 'adf'),
(11, 12, 'police'),
(12, 12, 'park'),
(13, 12, 'abc'),
(14, 12, 'abc'),
(15, 12, 'police'),
(16, 12, 'park'),
(17, 12, 'police'),
(18, 12, 'park'),
(19, 12, 'police'),
(20, 12, 'adf'),
(21, 13, 'adf'),
(22, 13, 'abc'),
(23, 13, 'abc'),
(24, 13, 'abc'),
(25, 13, 'police'),
(26, 13, 'park'),
(27, 13, 'police'),
(28, 13, 'park'),
(29, 13, 'police'),
(30, 13, 'park'),
(31, 13, 'police'),
(32, 13, 'adf'),
(33, 14, 'adf'),
(34, 14, 'park'),
(35, 14, 'abc'),
(36, 14, 'abc'),
(37, 14, 'police'),
(38, 14, 'park'),
(39, 14, 'police'),
(40, 14, 'park'),
(41, 14, 'police'),
(42, 14, 'park'),
(43, 14, 'adf'),
(44, 14, 'abc'),
(45, 14, 'police'),
(46, 14, 'adf'),
(47, 15, 'park'),
(48, 15, 'police'),
(49, 15, 'abc'),
(50, 16, 'park'),
(51, 16, 'police'),
(52, 17, 'park'),
(53, 17, 'police'),
(54, 17, 'adf'),
(55, 17, 'abc'),
(56, 18, 'adf'),
(57, 18, 'police'),
(58, 19, 'abc'),
(64, 24, 'abc'),
(65, 20, 'abc'),
(66, 21, 'abc'),
(67, 22, 'abc'),
(68, 23, 'park'),
(69, 24, 'park'),
(70, 24, 'abc'),
(71, 25, 'adf'),
(72, 26, 'park'),
(73, 26, 'police'),
(74, 27, 'park'),
(75, 27, 'police'),
(76, 28, 'park'),
(77, 28, 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_user` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `constituency` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `residence` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` bigint(200) DEFAULT NULL,
  `pic_link` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `gender`, `about_user`, `password`, `constituency`, `residence`, `state`, `contact_no`, `pic_link`, `start_date`, `created_at`, `updated_at`) VALUES
(1, 'mohini', 'male', '', 'jijba', 'Adarsh Nagar', 'Delhi', 'Delhi', 9685623501, '/laravel/public/public/user_pic/male.gif', '2015-10-21', '2015-10-21 08:42:36', '2015-10-21 08:42:36'),
(2, 'mohini', 'male', '', 'jijba', 'Adarsh Nagar', 'Delhi', 'Delhi', 9685623501, '/laravel/public/public/user_pic/male.gif', '2015-10-21', '2015-10-21 08:42:36', '2015-10-21 08:42:36'),
(3, 'mohini', 'male', '', 'mohini', 'Adarsh Nagar', 'Delhi', 'Delhi', 9893137949, '/laravel/public/public/user_pic/male.gif', '2015-10-23', '2015-10-23 12:03:25', '2015-10-23 12:03:25'),
(4, 'mohini', 'male', '', 'mohini', 'Adarsh Nagar', 'Delhi', 'Delhi', 9893137949, '/laravel/public/public/user_pic/male.gif', '2015-10-23', '2015-10-23 12:03:25', '2015-10-23 12:03:25'),
(5, 'rohit', 'female', '', 'rohit', 'Badli', 'Delhi', 'Delhi', 23456789, '/laravel/public/public/user_pic/female.gif', '2015-10-24', '2015-10-24 02:02:16', '2015-10-24 02:02:16'),
(6, 'rohit', 'female', '', 'rohit', 'Badli', 'Delhi', 'Delhi', 23456789, '/laravel/public/public/user_pic/female.gif', '2015-10-24', '2015-10-24 02:02:16', '2015-10-24 02:02:16'),
(7, 'ja', 'male', '', 'ja', 'Adarsh Nagar', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:10:42', '2016-01-17 04:10:42'),
(8, 'test', 'male', '', 'test', 'Deoli', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:28:37', '2016-01-17 04:28:37'),
(9, 'yaar', 'male', '', 'yaar', 'Adarsh Nagar', 'Delhi', 'Delhi', 234567, '/laravel/public/public/user_pic/male.gif', '2016-01-16', '2016-01-17 04:29:04', '2016-01-17 04:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE IF NOT EXISTS `user_follow` (
  `user_id` bigint(200) NOT NULL,
  `follow_id` bigint(200) NOT NULL,
  PRIMARY KEY (`user_id`,`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_follow`
--

INSERT INTO `user_follow` (`user_id`, `follow_id`) VALUES
(1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
