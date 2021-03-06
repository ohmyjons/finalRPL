-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 12:48 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpl_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_11_28_173745_create_students_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_depan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `email`, `alamat`, `avatar`, `created_at`, `updated_at`) VALUES
(3, 0, 'Dimas', 'Haryono', 'L', 'Islam', '', 'Jakarta', NULL, NULL, NULL),
(4, 0, 'Ismi', 'Syafa', 'P', 'Islam', '', 'Bekasi', 'IMG_1042.JPG', NULL, '2019-12-08 05:58:39'),
(5, 0, 'Najwa', 'Aulia Haryono', 'P', 'Islam', '', 'Jakarta', NULL, NULL, NULL),
(12, 0, 'Dohan', 'Pranata Wikanda', 'L', 'Islam', NULL, 'Gresik', 'new.jpg', '2019-11-30 19:43:14', '2019-12-08 06:16:20'),
(13, 0, 'Basrul', 'Yandri', 'L', 'Islam', '', 'Jakarta', NULL, '2019-11-30 19:44:47', '2019-11-30 19:44:47'),
(14, 2, 'Asca', 'Nurana', 'L', 'Islam', 'ascanp@gmail.com', 'Gresik', NULL, '2019-12-01 01:20:25', '2019-12-07 22:42:23'),
(15, 4, 'nikodemus', 'siahaan', 'L', 'nasrani', 'nikodemus@gmail.com', 'meda', NULL, '2019-12-07 10:24:42', '2019-12-07 10:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

CREATE TABLE `student_subject` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`id`, `student_id`, `subject_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 75, '2019-12-01 09:51:17', '0000-00-00 00:00:00'),
(2, 3, 2, 60, '2019-12-01 09:51:17', '0000-00-00 00:00:00'),
(3, 4, 1, 70, '2019-12-01 10:08:25', '0000-00-00 00:00:00'),
(4, 12, 1, 90, '2019-12-05 12:59:43', '2019-12-05 19:59:43'),
(6, 12, 2, 30, '2019-12-06 15:05:06', '2019-12-06 22:05:06'),
(7, 12, 2, 70, '2019-12-06 15:17:12', '2019-12-06 22:17:12'),
(15, 12, 1, 100, '2019-12-06 22:38:23', '2019-12-07 05:38:23'),
(16, 12, 4, 70, '2019-12-07 05:22:06', '2019-12-07 12:22:06'),
(17, 12, 4, 20, '2019-12-07 10:18:57', '2019-12-07 17:18:57'),
(18, 15, 5, 70, '2019-12-07 10:24:57', '2019-12-07 17:24:57'),
(19, 12, 3, 100, '2019-12-12 15:17:30', '2019-12-12 22:17:30'),
(20, 3, 5, 100, '2019-12-12 16:43:47', '2019-12-12 23:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `kode`, `nama`, `semester`, `created_at`, `update_at`) VALUES
(1, 'M-001', 'Matematika Wajib', 'ganjil', '2019-12-01 09:49:40', '0000-00-00 00:00:00'),
(2, 'B-001', 'Bahasa Indonesia', 'ganjil', '2019-12-01 09:49:40', '0000-00-00 00:00:00'),
(3, 'A-001', 'Agama', 'ganjil', '2019-12-07 12:20:42', '0000-00-00 00:00:00'),
(4, 'F-001', 'Fisika', 'ganjil', '2019-12-07 12:21:36', '0000-00-00 00:00:00'),
(5, 'K-001', 'Kimia', 'ganjil', '2019-12-07 12:21:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(255) NOT NULL,
  `nip` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `nip`, `email`, `agama`, `alamat`) VALUES
(1, 0, 'wahed', 'abdurrahman', '1234567890', 'wahedganteng@gmail.com', 'Islam', 'surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Dohan', 'dohanpw@gmail.com', NULL, '$2y$10$s9sOw2KM3346N7z3aRLkLuGSJpcnAV0WJfY1PYwGnoi3N322K.p4i', NULL, '2019-11-30 17:07:55', '2019-11-30 17:07:55'),
(2, 'siswa', 'Asca', 'ascanp@gmail.com', NULL, '$2y$10$hHixVco18buzErcRfsbby.v0xCa4g/i3uk57b3xbJoWEZigX4iJKC', 'Akpl1dPKBJFF0QRdCoTKLa2DsxDNkoHnLrtHvIs2bbJ6TrvO6MwrGw0QX9sF', '2019-12-01 01:20:25', '2019-12-01 01:20:25'),
(3, 'guru', 'Wahed', 'wahedganteng@gmail.com', NULL, '$2y$10$RCUBVMEgMxA/ovZtZA4HxuRmJLpCV4qI1WLPEGFFxCFkQ1Ixfe7nC', 'AIIK87lAwBj2DZQjl50b6aAGMVE8y9zPLCvgwYpWS6t2Hf6S1ae2bAobht5r', '2019-12-01 05:30:06', '2019-12-01 05:30:06'),
(4, 'siswa', 'nikodemus', 'nikodemus@gmail.com', NULL, '$2y$10$R6FVT7WGLuQDvI86XN7vEeOBdCLL80A0uTw43loOUgsJif3MtXyN6', 'kjEWFCCz5M8aCLnUS7jjiFeZJJDYOuQADy5esvMoOsCRb5MmhWZgtFjHF0O1', '2019-12-07 10:24:42', '2019-12-07 10:24:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `student_subject`
--
ALTER TABLE `student_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
