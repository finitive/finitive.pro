-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2016 at 05:00 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

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

CREATE TABLE `actions` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cities_id` int(11) NOT NULL,
  `cities_provinces_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `url_photo` varchar(45) DEFAULT NULL,
  `previllage` int(11) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `salt`, `username`, `name`, `url_photo`, `previllage`, `last_login`, `created_at`, `deleted_at`) VALUES
('1', 'devan.astiko@gmail.com', '$2y$11$1357361ccb8cd4268feedOq5Hf7p5HzGmljt4OdZvMGDE3pqWjN7K', '$2y$11$1357361ccb8cd4268feedc', 'devanastiko', 'Devan Astiko Baktiyar', NULL, 1, '2016-02-20 04:43:38', '2016-02-09 04:22:48', NULL),
('2', '', '$2y$11$acd0e9e8f805fc9418b6fusIKOSSvP/T1ITG3vULOv42gvGYqoohO', '$2y$11$acd0e9e8f805fc9418b6f4', 'kennykarnama', NULL, NULL, 2, '2016-02-22 08:12:11', '2016-02-19 19:39:18', '2016-02-20 00:53:26'),
('3', '', '$2y$11$e297ac7cb5e8961f0df88uOj/nUdOs29SzDJtrRiDOqkSU0ax9EAS', '$2y$11$e297ac7cb5e8961f0df883', 'tiararatna', NULL, NULL, 2, '2016-02-22 08:12:05', '2016-02-20 00:53:08', NULL),
('4', '', '$2y$11$3a3ae257be61c7542df8fuSrEFQOJcF3YeVtaB6GuDyrwoEPfF59.', '$2y$11$3a3ae257be61c7542df8f1', 'Taylorswift', NULL, NULL, 2, '2016-02-22 08:12:08', '2016-02-22 02:11:20', NULL),
('5', '', '$2y$11$8b4d3a69c0cb3f15b4c3duNJ.WDK5vTqsgQRvE4QeGefiRpYnIXsK', '$2y$11$8b4d3a69c0cb3f15b4c3d4', 'devamarine', NULL, NULL, 1, '2016-02-22 08:14:26', '2016-02-22 02:14:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `article` varchar(45) DEFAULT NULL,
  `url_photo1` varchar(45) DEFAULT NULL,
  `url_photo2` varchar(45) DEFAULT NULL,
  `url_photo3` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `admins_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(200) DEFAULT NULL,
  `provinces_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `provinces_id`, `created_at`, `deleted_at`) VALUES
(1, 'Kabupaten Aceh Barat', 1, '2016-02-19 19:45:08', NULL),
(2, 'Kabupaten Aceh Barat Daya', 1, '2016-02-19 19:45:08', NULL),
(3, 'Kabupaten Aceh Besar', 1, '2016-02-19 19:45:08', NULL),
(4, 'Kabupaten Aceh Jaya', 1, '2016-02-19 19:45:08', NULL),
(5, 'Kabupaten Aceh Selatan', 1, '2016-02-19 19:45:08', NULL),
(6, 'Kabupaten Aceh Singkil', 1, '2016-02-19 19:45:08', NULL),
(7, 'Kabupaten Aceh Tamiang', 1, '2016-02-19 19:45:08', NULL),
(8, 'Kabupaten Aceh Tengah', 1, '2016-02-19 19:45:08', NULL),
(9, 'Kabupaten Aceh Tenggara', 1, '2016-02-19 19:45:08', NULL),
(10, 'Kabupaten Aceh Timur', 1, '2016-02-19 19:45:08', NULL),
(11, 'Kabupaten Aceh Utara', 1, '2016-02-19 19:45:08', NULL),
(12, 'Kabupaten Bener Meriah', 1, '2016-02-19 19:45:08', NULL),
(13, 'Kabupaten Bireuen', 1, '2016-02-19 19:45:08', NULL),
(14, 'Kabupaten Gayo Luwes', 1, '2016-02-19 19:45:09', NULL),
(15, 'Kabupaten Nagan Raya', 1, '2016-02-19 19:45:09', NULL),
(16, 'Kabupaten Pidie', 1, '2016-02-19 19:45:09', NULL),
(17, 'Kabupaten Pidie Jaya', 1, '2016-02-19 19:45:09', NULL),
(18, 'Kabupaten Simeulue', 1, '2016-02-19 19:45:09', NULL),
(19, 'Kota Banda Aceh', 1, '2016-02-19 19:45:09', NULL),
(20, 'Kota Langsa', 1, '2016-02-19 19:45:09', NULL),
(21, 'Kota Lhokseumawe', 1, '2016-02-19 19:45:09', NULL),
(22, 'Kota Sabang', 1, '2016-02-19 19:45:09', NULL),
(23, 'Kota Subulussalam', 1, '2016-02-19 19:45:09', NULL),
(24, 'Kabupaten Asahan', 2, '2016-02-19 19:45:09', NULL),
(25, 'Kabupaten Batubara', 2, '2016-02-19 19:45:09', NULL),
(26, 'Kabupaten Dairi', 2, '2016-02-19 19:45:09', NULL),
(27, 'Kabupaten Deli Serdang', 2, '2016-02-19 19:45:10', NULL),
(28, 'Kabupaten Humbang Hasundutan', 2, '2016-02-19 19:45:10', NULL),
(29, 'Kabupaten Karo', 2, '2016-02-19 19:45:10', NULL),
(30, 'Kabupaten Labuhan Batu', 2, '2016-02-19 19:45:10', NULL),
(31, 'Kabupaten Labuhanbatu Selatan', 2, '2016-02-19 19:45:10', NULL),
(32, 'Kabupaten Labuhanbatu Utara', 2, '2016-02-19 19:45:10', NULL),
(33, 'Kabupaten Langkat', 2, '2016-02-19 19:45:10', NULL),
(34, 'Kabupaten Mandailing Natal', 2, '2016-02-19 19:45:10', NULL),
(35, 'Kabupaten Nias', 2, '2016-02-19 19:45:10', NULL),
(36, 'Kabupaten Nias Barat', 2, '2016-02-19 19:45:10', NULL),
(37, 'Kabupaten Nias Selatan', 2, '2016-02-19 19:45:10', NULL),
(38, 'Kabupaten Nias Utara', 2, '2016-02-19 19:45:10', NULL),
(39, 'Kabupaten Padang Lawas', 2, '2016-02-19 19:45:10', NULL),
(40, 'Kabupaten Padang Lawas Utara', 2, '2016-02-19 19:45:10', NULL),
(41, 'Kabupaten Pakpak Barat', 2, '2016-02-19 19:45:11', NULL),
(42, 'Kabupaten Samosir', 2, '2016-02-19 19:45:11', NULL),
(43, 'Kabupaten Serdang Bedagai', 2, '2016-02-19 19:45:11', NULL),
(44, 'Kabupaten Simalungun', 2, '2016-02-19 19:45:11', NULL),
(45, 'Kabupaten Tapanuli Selatan', 2, '2016-02-19 19:45:11', NULL),
(46, 'Kabupaten Tapanuli Tengah', 2, '2016-02-19 19:45:11', NULL),
(47, 'Kabupaten Tapanuli Utara', 2, '2016-02-19 19:45:11', NULL),
(48, 'Kabupaten Toba Samosir', 2, '2016-02-19 19:45:11', NULL),
(49, 'Kota Binjai', 2, '2016-02-19 19:45:11', NULL),
(50, 'Kota Gunung Sitoli', 2, '2016-02-19 19:45:11', NULL),
(51, 'Kota Medan', 2, '2016-02-19 19:45:11', NULL),
(52, 'Kota Padangsidempuan', 2, '2016-02-19 19:45:11', NULL),
(53, 'Kota Pematang Siantar', 2, '2016-02-19 19:45:11', NULL),
(54, 'Kota Sibolga', 2, '2016-02-19 19:45:11', NULL),
(55, 'Kota Tanjung Balai', 2, '2016-02-19 19:45:11', NULL),
(56, 'Kota Tebing Tinggi', 2, '2016-02-19 19:45:11', NULL),
(57, 'Kabupaten Agam', 3, '2016-02-19 19:45:12', NULL),
(58, 'Kabupaten Dharmas Raya', 3, '2016-02-19 19:45:12', NULL),
(59, 'Kabupaten Kepulauan Mentawai', 3, '2016-02-19 19:45:12', NULL),
(60, 'Kabupaten Lima Puluh Kota', 3, '2016-02-19 19:45:12', NULL),
(61, 'Kabupaten Padang Pariaman', 3, '2016-02-19 19:45:12', NULL),
(62, 'Kabupaten Pasaman', 3, '2016-02-19 19:45:12', NULL),
(63, 'Kabupaten Pasaman Barat', 3, '2016-02-19 19:45:12', NULL),
(64, 'Kabupaten Pesisir Selatan', 3, '2016-02-19 19:45:12', NULL),
(65, 'Kabupaten Sijunjung', 3, '2016-02-19 19:45:12', NULL),
(66, 'Kabupaten Solok', 3, '2016-02-19 19:45:12', NULL),
(67, 'Kabupaten Solok Selatan', 3, '2016-02-19 19:45:12', NULL),
(68, 'Kabupaten Tanah Datar', 3, '2016-02-19 19:45:12', NULL),
(69, 'Kota Bukittinggi', 3, '2016-02-19 19:45:12', NULL),
(70, 'Kota Padang', 3, '2016-02-19 19:45:12', NULL),
(71, 'Kota Padang Panjang', 3, '2016-02-19 19:45:12', NULL),
(72, 'Kota Pariaman', 3, '2016-02-19 19:45:12', NULL),
(73, 'Kota Payakumbuh', 3, '2016-02-19 19:45:12', NULL),
(74, 'Kota Sawah Lunto', 3, '2016-02-19 19:45:13', NULL),
(75, 'Kota Solok', 3, '2016-02-19 19:45:13', NULL),
(76, 'Kabupaten Bengkalis', 4, '2016-02-19 19:45:13', NULL),
(77, 'Kabupaten Indragiri Hilir', 4, '2016-02-19 19:45:13', NULL),
(78, 'Kabupaten Indragiri Hulu', 4, '2016-02-19 19:45:13', NULL),
(79, 'Kabupaten Kampar', 4, '2016-02-19 19:45:13', NULL),
(80, 'Kabupaten Kuantan Singingi', 4, '2016-02-19 19:45:13', NULL),
(81, 'Kabupaten Meranti', 4, '2016-02-19 19:45:13', NULL),
(82, 'Kabupaten Pelalawan', 4, '2016-02-19 19:45:13', NULL),
(83, 'Kabupaten Rokan Hilir', 4, '2016-02-19 19:45:13', NULL),
(84, 'Kabupaten Rokan Hulu', 4, '2016-02-19 19:45:13', NULL),
(85, 'Kabupaten Siak', 4, '2016-02-19 19:45:13', NULL),
(86, 'Kota Dumai', 4, '2016-02-19 19:45:13', NULL),
(87, 'Kota Pekanbaru', 4, '2016-02-19 19:45:13', NULL),
(88, 'Kabupaten Bintan', 5, '2016-02-19 19:45:13', NULL),
(89, 'Kabupaten Karimun', 5, '2016-02-19 19:45:13', NULL),
(90, 'Kabupaten Kepulauan Anambas', 5, '2016-02-19 19:45:13', NULL),
(91, 'Kabupaten Lingga', 5, '2016-02-19 19:45:13', NULL),
(92, 'Kabupaten Natuna', 5, '2016-02-19 19:45:14', NULL),
(93, 'Kota Batam', 5, '2016-02-19 19:45:14', NULL),
(94, 'Kota Tanjung Pinang', 5, '2016-02-19 19:45:14', NULL),
(95, 'Kabupaten Bangka', 6, '2016-02-19 19:45:14', NULL),
(96, 'Kabupaten Bangka Barat', 6, '2016-02-19 19:45:14', NULL),
(97, 'Kabupaten Bangka Selatan', 6, '2016-02-19 19:45:14', NULL),
(98, 'Kabupaten Bangka Tengah', 6, '2016-02-19 19:45:14', NULL),
(99, 'Kabupaten Belitung', 6, '2016-02-19 19:45:14', NULL),
(100, 'Kabupaten Belitung Timur', 6, '2016-02-19 19:45:14', NULL),
(101, 'Kota Pangkal Pinang', 6, '2016-02-19 19:45:14', NULL),
(102, 'Kabupaten Kerinci', 7, '2016-02-19 19:45:14', NULL),
(103, 'Kabupaten Merangin', 7, '2016-02-19 19:45:14', NULL),
(104, 'Kabupaten Sarolangun', 7, '2016-02-19 19:45:14', NULL),
(105, 'Kabupaten Batang Hari', 7, '2016-02-19 19:45:14', NULL),
(106, 'Kabupaten Muaro Jambi', 7, '2016-02-19 19:45:14', NULL),
(107, 'Kabupaten Tanjung Jabung Timur', 7, '2016-02-19 19:45:14', NULL),
(108, 'Kabupaten Tanjung Jabung Barat', 7, '2016-02-19 19:45:15', NULL),
(109, 'Kabupaten Tebo', 7, '2016-02-19 19:45:15', NULL),
(110, 'Kabupaten Bungo', 7, '2016-02-19 19:45:15', NULL),
(111, 'Kota Jambi', 7, '2016-02-19 19:45:15', NULL),
(112, 'Kota Sungai Penuh', 7, '2016-02-19 19:45:15', NULL),
(113, 'Kabupaten Bengkulu Selatan', 8, '2016-02-19 19:45:15', NULL),
(114, 'Kabupaten Bengkulu Tengah', 8, '2016-02-19 19:45:15', NULL),
(115, 'Kabupaten Bengkulu Utara', 8, '2016-02-19 19:45:15', NULL),
(116, 'Kabupaten Kaur', 8, '2016-02-19 19:45:15', NULL),
(117, 'Kabupaten Kepahiang', 8, '2016-02-19 19:45:15', NULL),
(118, 'Kabupaten Lebong', 8, '2016-02-19 19:45:15', NULL),
(119, 'Kabupaten Mukomuko', 8, '2016-02-19 19:45:15', NULL),
(120, 'Kabupaten Rejang Lebong', 8, '2016-02-19 19:45:15', NULL),
(121, 'Kabupaten Seluma', 8, '2016-02-19 19:45:15', NULL),
(122, 'Kota Bengkulu', 8, '2016-02-19 19:45:15', NULL),
(123, 'Kabupaten Banyuasin', 9, '2016-02-19 19:45:16', NULL),
(124, 'Kabupaten Empat Lawang', 9, '2016-02-19 19:45:16', NULL),
(125, 'Kabupaten Lahat', 9, '2016-02-19 19:45:16', NULL),
(126, 'Kabupaten Muara Enim', 9, '2016-02-19 19:45:16', NULL),
(127, 'Kabupaten Musi Banyu Asin', 9, '2016-02-19 19:45:16', NULL),
(128, 'Kabupaten Musi Rawas', 9, '2016-02-19 19:45:16', NULL),
(129, 'Kabupaten Ogan Ilir', 9, '2016-02-19 19:45:16', NULL),
(130, 'Kabupaten Ogan Komering Ilir', 9, '2016-02-19 19:45:16', NULL),
(131, 'Kabupaten Ogan Komering Ulu', 9, '2016-02-19 19:45:16', NULL),
(132, 'Kabupaten Ogan Komering Ulu Se', 9, '2016-02-19 19:45:16', NULL),
(133, 'Kabupaten Ogan Komering Ulu Ti', 9, '2016-02-19 19:45:16', NULL),
(134, 'Kota Lubuklinggau', 9, '2016-02-19 19:45:16', NULL),
(135, 'Kota Pagar Alam', 9, '2016-02-19 19:45:16', NULL),
(136, 'Kota Palembang', 9, '2016-02-19 19:45:16', NULL),
(137, 'Kota Prabumulih', 9, '2016-02-19 19:45:16', NULL),
(138, 'Kabupaten Lampung Barat', 10, '2016-02-19 19:45:17', NULL),
(139, 'Kabupaten Lampung Selatan', 10, '2016-02-19 19:45:17', NULL),
(140, 'Kabupaten Lampung Tengah', 10, '2016-02-19 19:45:17', NULL),
(141, 'Kabupaten Lampung Timur', 10, '2016-02-19 19:45:17', NULL),
(142, 'Kabupaten Lampung Utara', 10, '2016-02-19 19:45:17', NULL),
(143, 'Kabupaten Mesuji', 10, '2016-02-19 19:45:17', NULL),
(144, 'Kabupaten Pesawaran', 10, '2016-02-19 19:45:17', NULL),
(145, 'Kabupaten Pringsewu', 10, '2016-02-19 19:45:17', NULL),
(146, 'Kabupaten Tanggamus', 10, '2016-02-19 19:45:17', NULL),
(147, 'Kabupaten Tulang Bawang', 10, '2016-02-19 19:45:17', NULL),
(148, 'Kabupaten Tulang Bawang Barat', 10, '2016-02-19 19:45:17', NULL),
(149, 'Kabupaten Way Kanan', 10, '2016-02-19 19:45:17', NULL),
(150, 'Kota Bandar Lampung', 10, '2016-02-19 19:45:17', NULL),
(151, 'Kota Metro', 10, '2016-02-19 19:45:17', NULL),
(152, 'Kabupaten Lebak', 11, '2016-02-19 19:45:17', NULL),
(153, 'Kabupaten Pandeglang', 11, '2016-02-19 19:45:17', NULL),
(154, 'Kabupaten Serang', 11, '2016-02-19 19:45:17', NULL),
(155, 'Kabupaten Tangerang', 11, '2016-02-19 19:45:18', NULL),
(156, 'Kota Cilegon', 11, '2016-02-19 19:45:18', NULL),
(157, 'Kota Serang', 11, '2016-02-19 19:45:18', NULL),
(158, 'Kota Tangerang', 11, '2016-02-19 19:45:18', NULL),
(159, 'Kota Tangerang Selatan', 11, '2016-02-19 19:45:18', NULL),
(160, 'Kabupaten Adm. Kepulauan Serib', 12, '2016-02-19 19:45:18', NULL),
(161, 'Kota Jakarta Barat', 12, '2016-02-19 19:45:18', NULL),
(162, 'Kota Jakarta Pusat', 12, '2016-02-19 19:45:18', NULL),
(163, 'Kota Jakarta Selatan', 12, '2016-02-19 19:45:18', NULL),
(164, 'Kota Jakarta Timur', 12, '2016-02-19 19:45:18', NULL),
(165, 'Kota Jakarta Utara', 12, '2016-02-19 19:45:18', NULL),
(166, 'Kabupaten Bandung', 13, '2016-02-19 19:45:18', NULL),
(167, 'Kabupaten Bandung Barat', 13, '2016-02-19 19:45:18', NULL),
(168, 'Kabupaten Bekasi', 13, '2016-02-19 19:45:18', NULL),
(169, 'Kabupaten Bogor', 13, '2016-02-19 19:45:18', NULL),
(170, 'Kabupaten Ciamis', 13, '2016-02-19 19:45:19', NULL),
(171, 'Kabupaten Cianjur', 13, '2016-02-19 19:45:19', NULL),
(172, 'Kabupaten Cirebon', 13, '2016-02-19 19:45:19', NULL),
(173, 'Kabupaten Garut', 13, '2016-02-19 19:45:19', NULL),
(174, 'Kabupaten Indramayu', 13, '2016-02-19 19:45:19', NULL),
(175, 'Kabupaten Karawang', 13, '2016-02-19 19:45:19', NULL),
(176, 'Kabupaten Kuningan', 13, '2016-02-19 19:45:19', NULL),
(177, 'Kabupaten Majalengka', 13, '2016-02-19 19:45:19', NULL),
(178, 'Kabupaten Purwakarta', 13, '2016-02-19 19:45:19', NULL),
(179, 'Kabupaten Subang', 13, '2016-02-19 19:45:19', NULL),
(180, 'Kabupaten Sukabumi', 13, '2016-02-19 19:45:19', NULL),
(181, 'Kabupaten Sumedang', 13, '2016-02-19 19:45:19', NULL),
(182, 'Kabupaten Tasikmalaya', 13, '2016-02-19 19:45:19', NULL),
(183, 'Kota Bandung', 13, '2016-02-19 19:45:19', NULL),
(184, 'Kota Banjar', 13, '2016-02-19 19:45:19', NULL),
(185, 'Kota Bekasi', 13, '2016-02-19 19:45:19', NULL),
(186, 'Kota Bogor', 13, '2016-02-19 19:45:19', NULL),
(187, 'Kota Cimahi', 13, '2016-02-19 19:45:19', NULL),
(188, 'Kota Cirebon', 13, '2016-02-19 19:45:20', NULL),
(189, 'Kota Depok', 13, '2016-02-19 19:45:20', NULL),
(190, 'Kota Sukabumi', 13, '2016-02-19 19:45:20', NULL),
(191, 'Kota Tasikmalaya', 13, '2016-02-19 19:45:20', NULL),
(192, 'Kabupaten Banjarnegara', 14, '2016-02-19 19:45:20', NULL),
(193, 'Kabupaten Banyumas', 14, '2016-02-19 19:45:20', NULL),
(194, 'Kabupaten Batang', 14, '2016-02-19 19:45:20', NULL),
(195, 'Kabupaten Blora', 14, '2016-02-19 19:45:20', NULL),
(196, 'Kabupaten Boyolali', 14, '2016-02-19 19:45:20', NULL),
(197, 'Kabupaten Brebes', 14, '2016-02-19 19:45:20', NULL),
(198, 'Kabupaten Cilacap', 14, '2016-02-19 19:45:20', NULL),
(199, 'Kabupaten Demak', 14, '2016-02-19 19:45:20', NULL),
(200, 'Kabupaten Grobogan', 14, '2016-02-19 19:45:20', NULL),
(201, 'Kabupaten Jepara', 14, '2016-02-19 19:45:20', NULL),
(202, 'Kabupaten Karanganyar', 14, '2016-02-19 19:45:20', NULL),
(203, 'Kabupaten Kebumen', 14, '2016-02-19 19:45:20', NULL),
(204, 'Kabupaten Kendal', 14, '2016-02-19 19:45:20', NULL),
(205, 'Kabupaten Klaten', 14, '2016-02-19 19:45:21', NULL),
(206, 'Kabupaten Kota Tegal', 14, '2016-02-19 19:45:21', NULL),
(207, 'Kabupaten Kudus', 14, '2016-02-19 19:45:21', NULL),
(208, 'Kabupaten Magelang', 14, '2016-02-19 19:45:21', NULL),
(209, 'Kabupaten Pati', 14, '2016-02-19 19:45:21', NULL),
(210, 'Kabupaten Pekalongan', 14, '2016-02-19 19:45:21', NULL),
(211, 'Kabupaten Pemalang', 14, '2016-02-19 19:45:21', NULL),
(212, 'Kabupaten Purbalingga', 14, '2016-02-19 19:45:21', NULL),
(213, 'Kabupaten Purworejo', 14, '2016-02-19 19:45:21', NULL),
(214, 'Kabupaten Rembang', 14, '2016-02-19 19:45:21', NULL),
(215, 'Kabupaten Semarang', 14, '2016-02-19 19:45:21', NULL),
(216, 'Kabupaten Sragen', 14, '2016-02-19 19:45:21', NULL),
(217, 'Kabupaten Sukoharjo', 14, '2016-02-19 19:45:21', NULL),
(218, 'Kabupaten Temanggung', 14, '2016-02-19 19:45:21', NULL),
(219, 'Kabupaten Wonogiri', 14, '2016-02-19 19:45:21', NULL),
(220, 'Kabupaten Wonosobo', 14, '2016-02-19 19:45:21', NULL),
(221, 'Kota Magelang', 14, '2016-02-19 19:45:21', NULL),
(222, 'Kota Pekalongan', 14, '2016-02-19 19:45:21', NULL),
(223, 'Kota Salatiga', 14, '2016-02-19 19:45:22', NULL),
(224, 'Kota Semarang', 14, '2016-02-19 19:45:22', NULL),
(225, 'Kota Surakarta', 14, '2016-02-19 19:45:22', NULL),
(226, 'Kota Tegal', 14, '2016-02-19 19:45:22', NULL),
(227, 'Kabupaten Bantul', 15, '2016-02-19 19:45:22', NULL),
(228, 'Kabupaten Gunung Kidul', 15, '2016-02-19 19:45:22', NULL),
(229, 'Kabupaten Kulon Progo', 15, '2016-02-19 19:45:22', NULL),
(230, 'Kabupaten Sleman', 15, '2016-02-19 19:45:22', NULL),
(231, 'Kota Yogyakarta', 15, '2016-02-19 19:45:22', NULL),
(232, 'Kabupaten Bangkalan', 16, '2016-02-19 19:45:22', NULL),
(233, 'Kabupaten Banyuwangi', 16, '2016-02-19 19:45:22', NULL),
(234, 'Kabupaten Blitar', 16, '2016-02-19 19:45:22', NULL),
(235, 'Kabupaten Bojonegoro', 16, '2016-02-19 19:45:22', NULL),
(236, 'Kabupaten Bondowoso', 16, '2016-02-19 19:45:22', NULL),
(237, 'Kabupaten Gresik', 16, '2016-02-19 19:45:22', NULL),
(238, 'Kabupaten Jember', 16, '2016-02-19 19:45:22', NULL),
(239, 'Kabupaten Jombang', 16, '2016-02-19 19:45:22', NULL),
(240, 'Kabupaten Kediri', 16, '2016-02-19 19:45:22', NULL),
(241, 'Kabupaten Lamongan', 16, '2016-02-19 19:45:22', NULL),
(242, 'Kabupaten Lumajang', 16, '2016-02-19 19:45:23', NULL),
(243, 'Kabupaten Madiun', 16, '2016-02-19 19:45:23', NULL),
(244, 'Kabupaten Magetan', 16, '2016-02-19 19:45:23', NULL),
(245, 'Kabupaten Malang', 16, '2016-02-19 19:45:23', NULL),
(246, 'Kabupaten Mojokerto', 16, '2016-02-19 19:45:23', NULL),
(247, 'Kabupaten Nganjuk', 16, '2016-02-19 19:45:23', NULL),
(248, 'Kabupaten Ngawi', 16, '2016-02-19 19:45:23', NULL),
(249, 'Kabupaten Pacitan', 16, '2016-02-19 19:45:23', NULL),
(250, 'Kabupaten Pamekasan', 16, '2016-02-19 19:45:23', NULL),
(251, 'Kabupaten Pasuruan', 16, '2016-02-19 19:45:23', NULL),
(252, 'Kabupaten Ponorogo', 16, '2016-02-19 19:45:23', NULL),
(253, 'Kabupaten Probolinggo', 16, '2016-02-19 19:45:23', NULL),
(254, 'Kabupaten Sampang', 16, '2016-02-19 19:45:23', NULL),
(255, 'Kabupaten Sidoarjo', 16, '2016-02-19 19:45:23', NULL),
(256, 'Kabupaten Situbondo', 16, '2016-02-19 19:45:23', NULL),
(257, 'Kabupaten Sumenep', 16, '2016-02-19 19:45:23', NULL),
(258, 'Kabupaten Trenggalek', 16, '2016-02-19 19:45:24', NULL),
(259, 'Kabupaten Tuban', 16, '2016-02-19 19:45:24', NULL),
(260, 'Kabupaten Tulungagung', 16, '2016-02-19 19:45:24', NULL),
(261, 'Kota Batu', 16, '2016-02-19 19:45:24', NULL),
(262, 'Kota Blitar', 16, '2016-02-19 19:45:24', NULL),
(263, 'Kota Kediri', 16, '2016-02-19 19:45:24', NULL),
(264, 'Kota Madiun', 16, '2016-02-19 19:45:24', NULL),
(265, 'Kota Malang', 16, '2016-02-19 19:45:24', NULL),
(266, 'Kota Mojokerto', 16, '2016-02-19 19:45:24', NULL),
(267, 'Kota Pasuruan', 16, '2016-02-19 19:45:24', NULL),
(268, 'Kota Probolinggo', 16, '2016-02-19 19:45:24', NULL),
(269, 'Kota Surabaya', 16, '2016-02-19 19:45:24', NULL),
(270, 'Kabupaten Badung', 17, '2016-02-19 19:45:24', NULL),
(271, 'Kabupaten Bangli', 17, '2016-02-19 19:45:24', NULL),
(272, 'Kabupaten Buleleng', 17, '2016-02-19 19:45:24', NULL),
(273, 'Kabupaten Gianyar', 17, '2016-02-19 19:45:24', NULL),
(274, 'Kabupaten Jembrana', 17, '2016-02-19 19:45:25', NULL),
(275, 'Kabupaten Karang Asem', 17, '2016-02-19 19:45:25', NULL),
(276, 'Kabupaten Klungkung', 17, '2016-02-19 19:45:25', NULL),
(277, 'Kabupaten Tabanan', 17, '2016-02-19 19:45:25', NULL),
(278, 'Kota Denpasar', 17, '2016-02-19 19:45:25', NULL),
(279, 'Kabupaten Bima', 18, '2016-02-19 19:45:25', NULL),
(280, 'Kabupaten Dompu', 18, '2016-02-19 19:45:25', NULL),
(281, 'Kabupaten Lombok Barat', 18, '2016-02-19 19:45:25', NULL),
(282, 'Kabupaten Lombok Tengah', 18, '2016-02-19 19:45:25', NULL),
(283, 'Kabupaten Lombok Timur', 18, '2016-02-19 19:45:25', NULL),
(284, 'Kabupaten Lombok Utara', 18, '2016-02-19 19:45:25', NULL),
(285, 'Kabupaten Sumbawa', 18, '2016-02-19 19:45:25', NULL),
(286, 'Kabupaten Sumbawa Barat', 18, '2016-02-19 19:45:25', NULL),
(287, 'Kota Bima', 18, '2016-02-19 19:45:25', NULL),
(288, 'Kota Mataram', 18, '2016-02-19 19:45:25', NULL),
(289, 'Kabupaten Alor', 19, '2016-02-19 19:45:25', NULL),
(290, 'Kabupaten Belu', 19, '2016-02-19 19:45:26', NULL),
(291, 'Kabupaten Ende', 19, '2016-02-19 19:45:26', NULL),
(292, 'Kabupaten Flores Timur', 19, '2016-02-19 19:45:26', NULL),
(293, 'Kabupaten Kupang', 19, '2016-02-19 19:45:26', NULL),
(294, 'Kabupaten Lembata', 19, '2016-02-19 19:45:26', NULL),
(295, 'Kabupaten Manggarai', 19, '2016-02-19 19:45:26', NULL),
(296, 'Kabupaten Manggarai Barat', 19, '2016-02-19 19:45:26', NULL),
(297, 'Kabupaten Manggarai Timur', 19, '2016-02-19 19:45:26', NULL),
(298, 'Kabupaten Nagekeo', 19, '2016-02-19 19:45:26', NULL),
(299, 'Kabupaten Ngada', 19, '2016-02-19 19:45:26', NULL),
(300, 'Kabupaten Rote Ndao', 19, '2016-02-19 19:45:26', NULL),
(301, 'Kabupaten Sabu Raijua', 19, '2016-02-19 19:45:26', NULL),
(302, 'Kabupaten Sikka', 19, '2016-02-19 19:45:26', NULL),
(303, 'Kabupaten Sumba Barat', 19, '2016-02-19 19:45:26', NULL),
(304, 'Kabupaten Sumba Barat Daya', 19, '2016-02-19 19:45:26', NULL),
(305, 'Kabupaten Sumba Tengah', 19, '2016-02-19 19:45:26', NULL),
(306, 'Kabupaten Sumba Timur', 19, '2016-02-19 19:45:26', NULL),
(307, 'Kabupaten Timor Tengah Selatan', 19, '2016-02-19 19:45:26', NULL),
(308, 'Kabupaten Timor Tengah Utara', 19, '2016-02-19 19:45:27', NULL),
(309, 'Kota Kupang', 19, '2016-02-19 19:45:27', NULL),
(310, 'Kabupaten Bengkayang', 20, '2016-02-19 19:45:27', NULL),
(311, 'Kabupaten Kapuas Hulu', 20, '2016-02-19 19:45:27', NULL),
(312, 'Kabupaten Kayong Utara', 20, '2016-02-19 19:45:27', NULL),
(313, 'Kabupaten Ketapang', 20, '2016-02-19 19:45:27', NULL),
(314, 'Kabupaten Kubu Raya', 20, '2016-02-19 19:45:27', NULL),
(315, 'Kabupaten Landak', 20, '2016-02-19 19:45:27', NULL),
(316, 'Kabupaten Melawi', 20, '2016-02-19 19:45:27', NULL),
(317, 'Kabupaten Pontianak', 20, '2016-02-19 19:45:27', NULL),
(318, 'Kabupaten Sambas', 20, '2016-02-19 19:45:27', NULL),
(319, 'Kabupaten Sanggau', 20, '2016-02-19 19:45:27', NULL),
(320, 'Kabupaten Sekadau', 20, '2016-02-19 19:45:27', NULL),
(321, 'Kabupaten Sintang', 20, '2016-02-19 19:45:27', NULL),
(322, 'Kota Pontianak', 20, '2016-02-19 19:45:27', NULL),
(323, 'Kota Singkawang', 20, '2016-02-19 19:45:27', NULL),
(324, 'Kabupaten Barito Selatan', 21, '2016-02-19 19:45:27', NULL),
(325, 'Kabupaten Barito Timur', 21, '2016-02-19 19:45:27', NULL),
(326, 'Kabupaten Barito Utara', 21, '2016-02-19 19:45:28', NULL),
(327, 'Kabupaten Gunung Mas', 21, '2016-02-19 19:45:28', NULL),
(328, 'Kabupaten Kapuas', 21, '2016-02-19 19:45:28', NULL),
(329, 'Kabupaten Katingan', 21, '2016-02-19 19:45:28', NULL),
(330, 'Kabupaten Kotawaringin Barat', 21, '2016-02-19 19:45:28', NULL),
(331, 'Kabupaten Kotawaringin Timur', 21, '2016-02-19 19:45:28', NULL),
(332, 'Kabupaten Lamandau', 21, '2016-02-19 19:45:28', NULL),
(333, 'Kabupaten Murung Raya', 21, '2016-02-19 19:45:28', NULL),
(334, 'Kabupaten Pulang Pisau', 21, '2016-02-19 19:45:28', NULL),
(335, 'Kabupaten Seruyan', 21, '2016-02-19 19:45:28', NULL),
(336, 'Kabupaten Sukamara', 21, '2016-02-19 19:45:28', NULL),
(337, 'Kota Palangkaraya', 21, '2016-02-19 19:45:28', NULL),
(338, 'Kabupaten Balangan', 22, '2016-02-19 19:45:28', NULL),
(339, 'Kabupaten Banjar', 22, '2016-02-19 19:45:28', NULL),
(340, 'Kabupaten Barito Kuala', 22, '2016-02-19 19:45:28', NULL),
(341, 'Kabupaten Hulu Sungai Selatan', 22, '2016-02-19 19:45:28', NULL),
(342, 'Kabupaten Hulu Sungai Tengah', 22, '2016-02-19 19:45:28', NULL),
(343, 'Kabupaten Hulu Sungai Utara', 22, '2016-02-19 19:45:29', NULL),
(344, 'Kabupaten Kota Baru', 22, '2016-02-19 19:45:29', NULL),
(345, 'Kabupaten Tabalong', 22, '2016-02-19 19:45:29', NULL),
(346, 'Kabupaten Tanah Bumbu', 22, '2016-02-19 19:45:29', NULL),
(347, 'Kabupaten Tanah Laut', 22, '2016-02-19 19:45:29', NULL),
(348, 'Kabupaten Tapin', 22, '2016-02-19 19:45:29', NULL),
(349, 'Kota Banjar Baru', 22, '2016-02-19 19:45:29', NULL),
(350, 'Kota Banjarmasin', 22, '2016-02-19 19:45:29', NULL),
(351, 'Kabupaten Berau', 23, '2016-02-19 19:45:29', NULL),
(352, 'Kabupaten Bulongan', 23, '2016-02-19 19:45:29', NULL),
(353, 'Kabupaten Kutai Barat', 23, '2016-02-19 19:45:29', NULL),
(354, 'Kabupaten Kutai Kartanegara', 23, '2016-02-19 19:45:30', NULL),
(355, 'Kabupaten Kutai Timur', 23, '2016-02-19 19:45:30', NULL),
(356, 'Kabupaten Malinau', 23, '2016-02-19 19:45:30', NULL),
(357, 'Kabupaten Nunukan', 23, '2016-02-19 19:45:30', NULL),
(358, 'Kabupaten Paser', 23, '2016-02-19 19:45:30', NULL),
(359, 'Kabupaten Penajam Paser Utara', 23, '2016-02-19 19:45:30', NULL),
(360, 'Kabupaten Tana Tidung', 23, '2016-02-19 19:45:30', NULL),
(361, 'Kota Balikpapan', 23, '2016-02-19 19:45:30', NULL),
(362, 'Kota Bontang', 23, '2016-02-19 19:45:30', NULL),
(363, 'Kota Samarinda', 23, '2016-02-19 19:45:30', NULL),
(364, 'Kota Tarakan', 23, '2016-02-19 19:45:30', NULL),
(365, 'Kabupaten Boalemo', 24, '2016-02-19 19:45:30', NULL),
(366, 'Kabupaten Bone Bolango', 24, '2016-02-19 19:45:30', NULL),
(367, 'Kabupaten Gorontalo', 24, '2016-02-19 19:45:30', NULL),
(368, 'Kabupaten Gorontalo Utara', 24, '2016-02-19 19:45:31', NULL),
(369, 'Kabupaten Pohuwato', 24, '2016-02-19 19:45:31', NULL),
(370, 'Kota Gorontalo', 24, '2016-02-19 19:45:31', NULL),
(371, 'Kabupaten Bantaeng', 25, '2016-02-19 19:45:31', NULL),
(372, 'Kabupaten Barru', 25, '2016-02-19 19:45:31', NULL),
(373, 'Kabupaten Bone', 25, '2016-02-19 19:45:31', NULL),
(374, 'Kabupaten Bulukumba', 25, '2016-02-19 19:45:31', NULL),
(375, 'Kabupaten Enrekang', 25, '2016-02-19 19:45:31', NULL),
(376, 'Kabupaten Gowa', 25, '2016-02-19 19:45:31', NULL),
(377, 'Kabupaten Jeneponto', 25, '2016-02-19 19:45:31', NULL),
(378, 'Kabupaten Luwu', 25, '2016-02-19 19:45:31', NULL),
(379, 'Kabupaten Luwu Timur', 25, '2016-02-19 19:45:31', NULL),
(380, 'Kabupaten Luwu Utara', 25, '2016-02-19 19:45:31', NULL),
(381, 'Kabupaten Maros', 25, '2016-02-19 19:45:31', NULL),
(382, 'Kabupaten Pangkajene Kepulauan', 25, '2016-02-19 19:45:32', NULL),
(383, 'Kabupaten Pinrang', 25, '2016-02-19 19:45:32', NULL),
(384, 'Kabupaten Selayar', 25, '2016-02-19 19:45:32', NULL),
(385, 'Kabupaten Sidenreng Rappang', 25, '2016-02-19 19:45:32', NULL),
(386, 'Kabupaten Sinjai', 25, '2016-02-19 19:45:32', NULL),
(387, 'Kabupaten Soppeng', 25, '2016-02-19 19:45:32', NULL),
(388, 'Kabupaten Takalar', 25, '2016-02-19 19:45:32', NULL),
(389, 'Kabupaten Tana Toraja', 25, '2016-02-19 19:45:32', NULL),
(390, 'Kabupaten Toraja Utara', 25, '2016-02-19 19:45:32', NULL),
(391, 'Kabupaten Wajo', 25, '2016-02-19 19:45:32', NULL),
(392, 'Kota Makassar', 25, '2016-02-19 19:45:32', NULL),
(393, 'Kota Palopo', 25, '2016-02-19 19:45:32', NULL),
(394, 'Kota Pare-pare', 25, '2016-02-19 19:45:32', NULL),
(395, 'Kabupaten Bombana', 26, '2016-02-19 19:45:32', NULL),
(396, 'Kabupaten Buton', 26, '2016-02-19 19:45:32', NULL),
(397, 'Kabupaten Buton Utara', 26, '2016-02-19 19:45:33', NULL),
(398, 'Kabupaten Kolaka', 26, '2016-02-19 19:45:33', NULL),
(399, 'Kabupaten Kolaka Utara', 26, '2016-02-19 19:45:33', NULL),
(400, 'Kabupaten Konawe', 26, '2016-02-19 19:45:33', NULL),
(401, 'Kabupaten Konawe Selatan', 26, '2016-02-19 19:45:33', NULL),
(402, 'Kabupaten Konawe Utara', 26, '2016-02-19 19:45:33', NULL),
(403, 'Kabupaten Muna', 26, '2016-02-19 19:45:33', NULL),
(404, 'Kabupaten Wakatobi', 26, '2016-02-19 19:45:33', NULL),
(405, 'Kota Bau-bau', 26, '2016-02-19 19:45:33', NULL),
(406, 'Kota Kendari', 26, '2016-02-19 19:45:33', NULL),
(407, 'Kabupaten Banggai', 27, '2016-02-19 19:45:33', NULL),
(408, 'Kabupaten Banggai Kepulauan', 27, '2016-02-19 19:45:33', NULL),
(409, 'Kabupaten Buol', 27, '2016-02-19 19:45:33', NULL),
(410, 'Kabupaten Donggala', 27, '2016-02-19 19:45:33', NULL),
(411, 'Kabupaten Morowali', 27, '2016-02-19 19:45:33', NULL),
(412, 'Kabupaten Parigi Moutong', 27, '2016-02-19 19:45:33', NULL),
(413, 'Kabupaten Poso', 27, '2016-02-19 19:45:33', NULL),
(414, 'Kabupaten Sigi', 27, '2016-02-19 19:45:34', NULL),
(415, 'Kabupaten Tojo Una-Una', 27, '2016-02-19 19:45:34', NULL),
(416, 'Kabupaten Toli Toli', 27, '2016-02-19 19:45:34', NULL),
(417, 'Kota Palu', 27, '2016-02-19 19:45:34', NULL),
(418, 'Kabupaten Bolaang Mangondow', 28, '2016-02-19 19:45:34', NULL),
(419, 'Kabupaten Bolaang Mangondow Se', 28, '2016-02-19 19:45:34', NULL),
(420, 'Kabupaten Bolaang Mangondow Ti', 28, '2016-02-19 19:45:34', NULL),
(421, 'Kabupaten Bolaang Mangondow Ut', 28, '2016-02-19 19:45:34', NULL),
(422, 'Kabupaten Kepulauan Sangihe', 28, '2016-02-19 19:45:34', NULL),
(423, 'Kabupaten Kepulauan Siau Tagul', 28, '2016-02-19 19:45:34', NULL),
(424, 'Kabupaten Kepulauan Talaud', 28, '2016-02-19 19:45:34', NULL),
(425, 'Kabupaten Minahasa', 28, '2016-02-19 19:45:34', NULL),
(426, 'Kabupaten Minahasa Selatan', 28, '2016-02-19 19:45:34', NULL),
(427, 'Kabupaten Minahasa Tenggara', 28, '2016-02-19 19:45:34', NULL),
(428, 'Kabupaten Minahasa Utara', 28, '2016-02-19 19:45:34', NULL),
(429, 'Kota Bitung', 28, '2016-02-19 19:45:34', NULL),
(430, 'Kota Kotamobagu', 28, '2016-02-19 19:45:35', NULL),
(431, 'Kota Manado', 28, '2016-02-19 19:45:35', NULL),
(432, 'Kota Tomohon', 28, '2016-02-19 19:45:35', NULL),
(433, 'Kabupaten Majene', 29, '2016-02-19 19:45:35', NULL),
(434, 'Kabupaten Mamasa', 29, '2016-02-19 19:45:35', NULL),
(435, 'Kabupaten Mamuju', 29, '2016-02-19 19:45:35', NULL),
(436, 'Kabupaten Mamuju Utara', 29, '2016-02-19 19:45:35', NULL),
(437, 'Kabupaten Polewali Mandar', 29, '2016-02-19 19:45:35', NULL),
(438, 'Kabupaten Buru', 30, '2016-02-19 19:45:35', NULL),
(439, 'Kabupaten Buru Selatan', 30, '2016-02-19 19:45:35', NULL),
(440, 'Kabupaten Kepulauan Aru', 30, '2016-02-19 19:45:35', NULL),
(441, 'Kabupaten Maluku Barat Daya', 30, '2016-02-19 19:45:35', NULL),
(442, 'Kabupaten Maluku Tengah', 30, '2016-02-19 19:45:35', NULL),
(443, 'Kabupaten Maluku Tenggara', 30, '2016-02-19 19:45:35', NULL),
(444, 'Kabupaten Maluku Tenggara Bara', 30, '2016-02-19 19:45:35', NULL),
(445, 'Kabupaten Seram Bagian Barat', 30, '2016-02-19 19:45:36', NULL),
(446, 'Kabupaten Seram Bagian Timur', 30, '2016-02-19 19:45:36', NULL),
(447, 'Kota Ambon', 30, '2016-02-19 19:45:36', NULL),
(448, 'Kota Tual', 30, '2016-02-19 19:45:36', NULL),
(449, 'Kabupaten Halmahera Barat', 31, '2016-02-19 19:45:36', NULL),
(450, 'Kabupaten Halmahera Selatan', 31, '2016-02-19 19:45:36', NULL),
(451, 'Kabupaten Halmahera Tengah', 31, '2016-02-19 19:45:36', NULL),
(452, 'Kabupaten Halmahera Timur', 31, '2016-02-19 19:45:36', NULL),
(453, 'Kabupaten Halmahera Utara', 31, '2016-02-19 19:45:36', NULL),
(454, 'Kabupaten Kepulauan Sula', 31, '2016-02-19 19:45:36', NULL),
(455, 'Kabupaten Pulau Morotai', 31, '2016-02-19 19:45:36', NULL),
(456, 'Kota Ternate', 31, '2016-02-19 19:45:36', NULL),
(457, 'Kota Tidore Kepulauan', 31, '2016-02-19 19:45:36', NULL),
(458, 'Kabupaten Fakfak', 32, '2016-02-19 19:45:36', NULL),
(459, 'Kabupaten Kaimana', 32, '2016-02-19 19:45:36', NULL),
(460, 'Kabupaten Manokwari', 32, '2016-02-19 19:45:36', NULL),
(461, 'Kabupaten Maybrat', 32, '2016-02-19 19:45:37', NULL),
(462, 'Kabupaten Raja Ampat', 32, '2016-02-19 19:45:37', NULL),
(463, 'Kabupaten Sorong', 32, '2016-02-19 19:45:37', NULL),
(464, 'Kabupaten Sorong Selatan', 32, '2016-02-19 19:45:37', NULL),
(465, 'Kabupaten Tambrauw', 32, '2016-02-19 19:45:37', NULL),
(466, 'Kabupaten Teluk Bintuni', 32, '2016-02-19 19:45:37', NULL),
(467, 'Kabupaten Teluk Wondama', 32, '2016-02-19 19:45:37', NULL),
(468, 'Kota Sorong', 32, '2016-02-19 19:45:37', NULL),
(469, 'Kabupaten Merauke', 33, '2016-02-19 19:45:37', NULL),
(470, 'Kabupaten Jayawijaya', 33, '2016-02-19 19:45:37', NULL),
(471, 'Kabupaten Nabire', 33, '2016-02-19 19:45:37', NULL),
(472, 'Kabupaten Kepulauan Yapen', 33, '2016-02-19 19:45:37', NULL),
(473, 'Kabupaten Biak Numfor', 33, '2016-02-19 19:45:37', NULL),
(474, 'Kabupaten Paniai', 33, '2016-02-19 19:45:37', NULL),
(475, 'Kabupaten Puncak Jaya', 33, '2016-02-19 19:45:37', NULL),
(476, 'Kabupaten Mimika', 33, '2016-02-19 19:45:37', NULL),
(477, 'Kabupaten Boven Digoel', 33, '2016-02-19 19:45:38', NULL),
(478, 'Kabupaten Mappi', 33, '2016-02-19 19:45:38', NULL),
(479, 'Kabupaten Asmat', 33, '2016-02-19 19:45:38', NULL),
(480, 'Kabupaten Yahukimo', 33, '2016-02-19 19:45:38', NULL),
(481, 'Kabupaten Pegunungan Bintang', 33, '2016-02-19 19:45:38', NULL),
(482, 'Kabupaten Tolikara', 33, '2016-02-19 19:45:38', NULL),
(483, 'Kabupaten Sarmi', 33, '2016-02-19 19:45:38', NULL),
(484, 'Kabupaten Keerom', 33, '2016-02-19 19:45:38', NULL),
(485, 'Kabupaten Waropen', 33, '2016-02-19 19:45:38', NULL),
(486, 'Kabupaten Jayapura', 33, '2016-02-19 19:45:38', NULL),
(487, 'Kabupaten Deiyai', 33, '2016-02-19 19:45:38', NULL),
(488, 'Kabupaten Dogiyai', 33, '2016-02-19 19:45:38', NULL),
(489, 'Kabupaten Intan Jaya', 33, '2016-02-19 19:45:38', NULL),
(490, 'Kabupaten Lanny Jaya', 33, '2016-02-19 19:45:38', NULL),
(491, 'Kabupaten Mamberamo Raya', 33, '2016-02-19 19:45:38', NULL),
(492, 'Kabupaten Mamberamo Tengah', 33, '2016-02-19 19:45:38', NULL),
(493, 'Kabupaten Nduga', 33, '2016-02-19 19:45:38', NULL),
(494, 'Kabupaten Puncak', 33, '2016-02-19 19:45:38', NULL),
(495, 'Kabupaten Supiori', 33, '2016-02-19 19:45:39', NULL),
(496, 'Kabupaten Yalimo', 33, '2016-02-19 19:45:39', NULL),
(497, 'Kota Jayapura', 33, '2016-02-19 19:45:39', NULL),
(498, 'Kabupaten Bulungan', 34, '2016-02-19 19:45:39', NULL),
(499, 'Kabupaten Malinau', 34, '2016-02-19 19:45:39', NULL),
(500, 'Kabupaten Nunukan', 34, '2016-02-19 19:45:39', NULL),
(501, 'Kabupaten Tana Tidung', 34, '2016-02-19 19:45:39', NULL),
(502, 'Kota Tarakan', 34, '2016-02-19 19:45:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
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

CREATE TABLE `confirms` (
  `name` varchar(45) DEFAULT NULL,
  `date_time_confirm` varchar(45) DEFAULT NULL,
  `randomnumber` varchar(45) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `admins_id` varchar(30) NOT NULL,
  `contributions_id` int(11) NOT NULL,
  `contributions_users_id` int(11) NOT NULL,
  `contributions_actions_id` int(11) NOT NULL,
  `contributions_actions_categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contribute_gifts`
--

CREATE TABLE `contribute_gifts` (
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

CREATE TABLE `contributions` (
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
  `users_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `actions_categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `users_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `admins_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `admins_id` varchar(30) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages_investor`
--

CREATE TABLE `messages_investor` (
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reciever` int(11) NOT NULL,
  `sender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `province` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `province`, `created_at`, `deleted_at`) VALUES
(1, 'Nanggroe Aceh Darussalam', '2016-02-19 19:44:03', NULL),
(2, 'Sumatera Utara', '2016-02-19 19:44:03', NULL),
(3, 'Sumatera Barat', '2016-02-19 19:44:03', NULL),
(4, 'Riau', '2016-02-19 19:44:04', NULL),
(5, 'Kepulauan Riau', '2016-02-19 19:44:04', NULL),
(6, 'Kepulauan Bangka-Belitung', '2016-02-19 19:44:04', NULL),
(7, 'Jambi', '2016-02-19 19:44:04', NULL),
(8, 'Bengkulu', '2016-02-19 19:44:04', NULL),
(9, 'Sumatera Selatan', '2016-02-19 19:44:04', NULL),
(10, 'Lampung', '2016-02-19 19:44:04', NULL),
(11, 'Banten', '2016-02-19 19:44:04', NULL),
(12, 'DKI Jakarta', '2016-02-19 19:44:04', NULL),
(13, 'Jawa Barat', '2016-02-19 19:44:04', NULL),
(14, 'Jawa Tengah', '2016-02-19 19:44:04', NULL),
(15, 'Daerah Istimewa Yogyakarta  ', '2016-02-19 19:44:04', NULL),
(16, 'Jawa Timur', '2016-02-19 19:44:04', NULL),
(17, 'Bali', '2016-02-19 19:44:04', NULL),
(18, 'Nusa Tenggara Barat', '2016-02-19 19:44:05', NULL),
(19, 'Nusa Tenggara Timur', '2016-02-19 19:44:05', NULL),
(20, 'Kalimantan Barat', '2016-02-19 19:44:05', NULL),
(21, 'Kalimantan Tengah', '2016-02-19 19:44:05', NULL),
(22, 'Kalimantan Selatan', '2016-02-19 19:44:05', NULL),
(23, 'Kalimantan Timur', '2016-02-19 19:44:05', NULL),
(24, 'Gorontalo', '2016-02-19 19:44:05', NULL),
(25, 'Sulawesi Selatan', '2016-02-19 19:44:05', NULL),
(26, 'Sulawesi Tenggara', '2016-02-19 19:44:05', NULL),
(27, 'Sulawesi Tengah', '2016-02-19 19:44:05', NULL),
(28, 'Sulawesi Utara', '2016-02-19 19:44:05', NULL),
(29, 'Sulawesi Barat', '2016-02-19 19:44:05', NULL),
(30, 'Maluku', '2016-02-19 19:44:05', NULL),
(31, 'Maluku Utara', '2016-02-19 19:44:05', NULL),
(32, 'Papua Barat', '2016-02-19 19:44:05', NULL),
(33, 'Papua', '2016-02-19 19:44:06', NULL),
(34, 'Kalimantan Utara', '2016-02-19 19:44:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
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

CREATE TABLE `users` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `salt`, `name`, `url_photo`, `alamat`, `url_scan_ktp`, `is_investors`, `is_appliers`, `created_at`, `deleted_at`) VALUES
(1, 'kenny@gmail.com', 'dfdfdf', NULL, 'Kenny', NULL, 'Jln. Manggis No. 9', NULL, 1, 0, '2016-02-19 19:47:42', NULL),
(2, 'halim@gmail.com', 'dfdfdfd', NULL, 'Halim', NULL, NULL, NULL, 0, 1, '2016-02-19 19:47:42', NULL),
(3, 'tommyatmaji@gmail.com', '@pratomo', NULL, 'Pratomo Adi Atmaji', NULL, 'Jaya Harmoni JH 12 Nomer 19', NULL, 0, 1, '2016-02-19 19:47:42', NULL),
(4, 'popp@gmail.com', 'pppp', NULL, 'parampa', NULL, 'galaxy garden, surabaya', NULL, 0, 1, '2016-02-19 19:47:42', NULL),
(5, 'tommyadiatmaji@yahoo.co.id', '@pratomo', NULL, 'tommy adi atmaji', NULL, 'perum bumi bulu indah, probolinggo', NULL, 0, 1, '2016-02-19 19:47:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
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
  ADD PRIMARY KEY (`id`,`categories_id`,`cities_id`,`cities_provinces_id`),
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
  ADD KEY `fk_blogs_admins1_idx` (`admins_id`);

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
  ADD PRIMARY KEY (`contributions_id`,`contributions_users_id`,`contributions_actions_id`,`contributions_actions_categories_id`),
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
  ADD PRIMARY KEY (`id`,`users_id`,`actions_id`,`actions_categories_id`),
  ADD KEY `fk_contributions_users1_idx` (`users_id`),
  ADD KEY `fk_contributions_actions1_idx` (`actions_id`,`actions_categories_id`);

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
  ADD PRIMARY KEY (`date_time`,`admins_id`,`users_id`),
  ADD KEY `fk_messages_admins1_idx` (`admins_id`),
  ADD KEY `fk_messages_users1_idx` (`users_id`);

--
-- Indexes for table `messages_investor`
--
ALTER TABLE `messages_investor`
  ADD PRIMARY KEY (`date_time`,`reciever`,`sender`),
  ADD KEY `fk_messages_investor_users1_idx` (`reciever`),
  ADD KEY `fk_messages_investor_users2_idx` (`sender`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `fk_actions_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_actions_cities1` FOREIGN KEY (`cities_id`,`cities_provinces_id`) REFERENCES `cities` (`id`, `provinces_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `fk_blogs_admins1` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_confirms_admins1` FOREIGN KEY (`admins_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_confirms_contributions1` FOREIGN KEY (`contributions_id`,`contributions_users_id`,`contributions_actions_id`,`contributions_actions_categories_id`) REFERENCES `contributions` (`id`, `users_id`, `actions_id`, `actions_categories_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contribute_gifts`
--
ALTER TABLE `contribute_gifts`
  ADD CONSTRAINT `fk_donate_gift_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contributions`
--
ALTER TABLE `contributions`
  ADD CONSTRAINT `fk_contributions_actions1` FOREIGN KEY (`actions_id`,`actions_categories_id`) REFERENCES `actions` (`id`, `categories_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_messages_investor_users1` FOREIGN KEY (`reciever`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_investor_users2` FOREIGN KEY (`sender`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
