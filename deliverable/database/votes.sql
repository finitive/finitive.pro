-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 Feb 2016 pada 16.14
-- Versi Server: 5.6.21-log
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
-- Struktur dari tabel `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `users_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `date_time_vote` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `votes`
--

INSERT INTO `votes` (`users_id`, `actions_id`, `date_time_vote`, `created_at`, `deleted_at`) VALUES
(3, 5, '2016-02-23 17:00:00', '2016-02-23 17:00:00', NULL),
(3, 6, '2016-02-23 17:00:00', '2016-02-23 17:00:00', '2016-02-24 17:00:00'),
(4, 6, '2016-02-23 17:00:00', '2016-02-23 17:00:00', NULL),
(5, 6, '2016-02-23 17:00:00', '2016-02-23 17:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`users_id`,`actions_id`),
  ADD KEY `fk_users_has_actions_actions1_idx` (`actions_id`),
  ADD KEY `fk_users_has_actions_users1_idx` (`users_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk_users_has_actions_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_actions_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
