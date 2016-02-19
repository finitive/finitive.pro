-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2016 at 05:04 PM
-- Server version: 5.6.21-log
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finitivedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `tag_line` text,
  `short_description` text,
  `goal_founding` int(11) DEFAULT NULL,
  `date_upload` timestamp NULL DEFAULT NULL,
  `date_expired` timestamp NULL DEFAULT NULL,
  `long_description` text,
  `url_photo1` text,
  `url_photo2` text,
  `url_photo3` text,
  `url_video` text,
  `ishold` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cities_id` int(11) NOT NULL,
  `cities_provinces_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `url_photo` varchar(45) DEFAULT NULL,
  `previllage` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `article` varchar(45) DEFAULT NULL,
  `url_photo1` varchar(45) DEFAULT NULL,
  `url_photo2` varchar(45) DEFAULT NULL,
  `url_photo3` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `admins_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(200) DEFAULT NULL,
  `provinces_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `actions_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `confirms`
--

CREATE TABLE IF NOT EXISTS `confirms` (
  `actions_id` int(11) NOT NULL,
  `contributions_id` int(11) NOT NULL,
  `contributions_users_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date_time_confirm` varchar(45) DEFAULT NULL,
  `randomnumber` varchar(45) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `admins_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contribute_gifts`
--

CREATE TABLE IF NOT EXISTS `contribute_gifts` (
  `id` int(11) NOT NULL,
  `kind` int(11) DEFAULT NULL,
  `range` varchar(500) DEFAULT NULL,
  `gift` text,
  `actions_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

CREATE TABLE IF NOT EXISTS `contributions` (
  `id` int(11) NOT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `number_contributions` int(11) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `jenis_pembayaran` varchar(150) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  `random_number` int(11) NOT NULL,
  `total_payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE IF NOT EXISTS `makes` (
  `users_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `admins_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `users_id` int(11) NOT NULL,
  `admins_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages_investor`
--

CREATE TABLE IF NOT EXISTS `messages_investor` (
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `users_id` int(11) NOT NULL,
  `users_id1` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
  `id` int(11) NOT NULL,
  `province` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `provincescol` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE IF NOT EXISTS `shares` (
  `users_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `is_shared` int(11) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `nick_fb` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `url_photo` text,
  `alamat` varchar(350) DEFAULT NULL,
  `url_scan_ktp` text,
  `is_investors` int(11) DEFAULT NULL,
  `is_appliers` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `salt`, `name`, `url_photo`, `alamat`, `url_scan_ktp`, `is_investors`, `is_appliers`, `created_at`, `deleted_at`) VALUES
(1, 'kenny@gmail.com', 'dfdfdf', NULL, 'Kenny', NULL, 'Jln. Manggis No. 9', NULL, 0, 1, '2016-02-19 15:31:35', NULL),
(2, 'halim@gmail.com', 'dfdfdfd', NULL, 'Halim', NULL, NULL, NULL, 0, 1, '2016-02-19 15:35:35', NULL),
(3, 'tommyatmaji@gmail.com', '@pratomo', NULL, 'Pratomo Adi Atmaji', NULL, 'Jaya Harmoni JH 12 Nomer 19', NULL, 0, 1, '2016-02-19 15:39:02', NULL),
(4, 'popp@gmail.com', 'pppp', NULL, 'parampa', NULL, 'galaxy garden, surabaya', NULL, 0, 1, '2016-02-19 15:40:36', NULL),
(5, 'tommyadiatmaji@yahoo.co.id', '@pratomo', NULL, 'tommy adi atmaji', NULL, 'perum bumi bulu indah, probolinggo', NULL, 0, 1, '2016-02-19 15:41:38', NULL),
(6, 'yayaya@yahoo.com', 'yayayaya', NULL, 'ya Sayang yayat', NULL, 'perumahan mojokerto', NULL, 0, 1, '2016-02-19 15:42:54', NULL),
(7, 'codeignitor@gmail.com', 'ci', NULL, 'code igniter', NULL, 'framework php, surabaya', NULL, 0, 1, '2016-02-19 15:44:02', NULL),
(8, 'asuslenovotoshiba@gmail.com', 'laptop', NULL, 'semua laptop', NULL, 'thr surabaya', NULL, 0, 1, '2016-02-19 15:45:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `users_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `date_time_vote` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`,`categories_id`),
  ADD KEY `fk_actions_cities1_idx` (`cities_id`,`cities_provinces_id`),
  ADD KEY `fk_actions_categories1_idx` (`categories_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`,`admins_id`),
  ADD KEY `fk_blogs_admins_idx` (`admins_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`,`provinces_id`),
  ADD KEY `fk_cities_provinces1_idx` (`provinces_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`,`actions_id`,`users_id`),
  ADD KEY `fk_comments_actions1_idx` (`actions_id`),
  ADD KEY `fk_comments_users1_idx` (`users_id`);

--
-- Indexes for table `confirms`
--
ALTER TABLE `confirms`
  ADD PRIMARY KEY (`actions_id`,`contributions_id`,`contributions_users_id`),
  ADD KEY `fk_actions_has_contributions_contributions1_idx` (`contributions_id`,`contributions_users_id`),
  ADD KEY `fk_actions_has_contributions_actions1_idx` (`actions_id`),
  ADD KEY `fk_confirms_admins1_idx` (`admins_id`);

--
-- Indexes for table `contribute_gifts`
--
ALTER TABLE `contribute_gifts`
  ADD PRIMARY KEY (`id`,`actions_id`),
  ADD KEY `fk_donate_gift_actions1_idx` (`actions_id`);

--
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_contributions_users1_idx` (`users_id`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`users_id`,`actions_id`),
  ADD KEY `fk_users_has_actions_actions3_idx` (`actions_id`),
  ADD KEY `fk_users_has_actions_users3_idx` (`users_id`),
  ADD KEY `fk_makes_admins1_idx` (`admins_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`date_time`,`admins_id`),
  ADD KEY `fk_messages_users1_idx` (`users_id`),
  ADD KEY `fk_messages_admins1_idx` (`admins_id`);

--
-- Indexes for table `messages_investor`
--
ALTER TABLE `messages_investor`
  ADD PRIMARY KEY (`date_time`),
  ADD KEY `fk_users_has_users_users2_idx` (`users_id1`),
  ADD KEY `fk_users_has_users_users1_idx` (`users_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`users_id`,`actions_id`),
  ADD KEY `fk_users_has_actions_actions2_idx` (`actions_id`),
  ADD KEY `fk_users_has_actions_users2_idx` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`users_id`,`actions_id`),
  ADD KEY `fk_users_has_actions_actions1_idx` (`actions_id`),
  ADD KEY `fk_users_has_actions_users1_idx` (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contribute_gifts`
--
ALTER TABLE `contribute_gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `fk_actions_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actions_cities1` FOREIGN KEY (`cities_id`, `cities_provinces_id`) REFERENCES `cities` (`id`, `provinces_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `fk_blogs_admins` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_cities_provinces1` FOREIGN KEY (`provinces_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `confirms`
--
ALTER TABLE `confirms`
  ADD CONSTRAINT `fk_actions_has_contributions_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actions_has_contributions_contributions1` FOREIGN KEY (`contributions_id`, `contributions_users_id`) REFERENCES `contributions` (`id`, `users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_confirms_admins1` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contribute_gifts`
--
ALTER TABLE `contribute_gifts`
  ADD CONSTRAINT `fk_donate_gift_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contributions`
--
ALTER TABLE `contributions`
  ADD CONSTRAINT `fk_contributions_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `makes`
--
ALTER TABLE `makes`
  ADD CONSTRAINT `fk_makes_admins1` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actions_actions3` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actions_users3` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_admins1` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messages_investor`
--
ALTER TABLE `messages_investor`
  ADD CONSTRAINT `fk_users_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_users_users2` FOREIGN KEY (`users_id1`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shares`
--
ALTER TABLE `shares`
  ADD CONSTRAINT `fk_users_has_actions_actions2` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actions_users2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk_users_has_actions_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actions_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
