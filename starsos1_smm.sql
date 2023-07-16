-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2023 at 12:10 PM
-- Server version: 10.3.37-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starsos1_smm`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('info','service') NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bcas`
--

CREATE TABLE `bcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bcas`
--

INSERT INTO `bcas` (`id`, `name`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Hendri Tri Febriyanto', '8yOlNRwqUf0=', '9CqkLwo2WODyEg==', 'active', '2022-12-30 02:33:53', '2022-12-30 02:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `trxid` varchar(255) NOT NULL,
  `process` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name_payment` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `diterima` int(11) NOT NULL,
  `expired` datetime NOT NULL,
  `status` enum('pending','canceled','done') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `user_id`, `trxid`, `process`, `code`, `name_payment`, `account_number`, `description`, `amount`, `diterima`, `expired`, `status`, `created_at`, `updated_at`) VALUES
(15, 1, '202212300904249223', 'auto', 'Bank', 'BCA', '5140690467', 'Bonus', 10581, 10581, '2022-12-30 12:04:24', 'done', '2022-12-30 02:04:24', '2022-12-30 03:07:40'),
(16, 5, '202212310056224669', 'auto', 'Bank', 'BCA', '5140690467', 'Bonus', 10147, 10147, '2022-12-31 03:56:22', 'canceled', '2022-12-30 17:56:22', '2022-12-30 17:59:46'),
(17, 1, '202301011151186730', 'auto', 'E-Wallet', 'Gopay', '0895342301466', 'Masukan Berdasarkan Nominal', 10536, 10536, '2023-01-01 14:51:18', 'canceled', '2023-01-01 04:51:18', '2023-01-05 02:23:01'),
(18, 4, '202301041422269036', 'auto', 'E-Wallet', 'Gopay', '0895342301466', 'Masukan Berdasarkan Nominal', 10978, 10978, '2023-01-04 17:22:26', 'done', '2023-01-04 07:22:26', '2023-01-04 07:29:44'),
(19, 10, '202301051322488998', 'auto', 'Bank', 'BCA', '5140690467', 'Bonus', 10290, 10290, '2023-01-05 16:22:48', 'pending', '2023-01-05 06:22:48', '2023-01-05 06:22:48'),
(20, 5, '202301052316567523', 'auto', 'Bank', 'BCA', '5140690467', 'Bonus', 15281, 15281, '2023-01-06 02:16:56', 'done', '2023-01-05 16:16:56', '2023-01-05 22:57:50'),
(21, 1, '202301191056574923', 'auto', 'E-Wallet', 'OVO', '0895342301466', 'Masukan berdasarkan nominal', 10192, 10192, '2023-01-19 13:56:57', 'canceled', '2023-01-19 03:56:57', '2023-01-19 03:57:32'),
(22, 21, '202301241529401275', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 20533, 20533, '2023-01-24 18:29:40', 'done', '2023-01-24 08:29:40', '2023-01-24 08:33:06'),
(23, 22, '202301242004463872', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 25726, 25726, '2023-01-24 23:04:46', 'done', '2023-01-24 13:04:46', '2023-01-24 14:10:42'),
(24, 25, '202301251129222150', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 10477, 10477, '2023-01-25 14:29:22', 'done', '2023-01-25 04:29:22', '2023-01-25 04:35:18'),
(25, 1, '202301251647567171', 'auto', 'E-Wallet', 'OVO', '0895342301466', 'Masukan berdasarkan nominal', 10570, 10570, '2023-01-25 19:47:56', 'canceled', '2023-01-25 09:47:56', '2023-01-25 09:49:10'),
(26, 26, '202301251649346780', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 10873, 10873, '2023-01-25 19:49:34', 'done', '2023-01-25 09:49:34', '2023-01-25 09:51:22'),
(27, 27, '202301252205106350', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 20329, 20329, '2023-01-26 01:05:10', 'done', '2023-01-25 15:05:10', '2023-01-25 15:07:20'),
(28, 35, '202301271727083007', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 15249, 15249, '2023-01-27 20:27:08', 'done', '2023-01-27 10:27:08', '2023-01-27 10:34:35'),
(29, 30, '202301280928169452', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 50525, 50525, '2023-01-28 12:28:16', 'done', '2023-01-28 02:28:16', '2023-01-28 04:14:01'),
(30, 37, '202301281059426057', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 20708, 20708, '2023-01-28 13:59:42', 'done', '2023-01-28 03:59:42', '2023-01-28 04:12:30'),
(31, 38, '202301281224345116', 'auto', 'E-Wallet', 'OVO', '0895342301466', 'Masukan berdasarkan nominal', 50856, 50856, '2023-01-28 15:24:34', 'canceled', '2023-01-28 05:24:34', '2023-01-28 05:25:08'),
(32, 38, '202301281225224695', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 50664, 50664, '2023-01-28 15:25:22', 'done', '2023-01-28 05:25:22', '2023-01-28 06:21:28'),
(33, 39, '202301281239592156', 'auto', 'E-Wallet', 'OVO', '0895342301466', 'Masukan berdasarkan nominal', 20543, 20543, '2023-01-28 15:39:59', 'done', '2023-01-28 05:39:59', '2023-01-28 06:23:46'),
(34, 41, '202301282052207056', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 50205, 50205, '2023-01-28 23:52:20', 'canceled', '2023-01-28 13:52:20', '2023-01-28 13:52:50'),
(35, 41, '202301282053046775', 'auto', 'E-Wallet', 'OVO', '0895342301466', 'Masukan berdasarkan nominal', 50966, 50966, '2023-01-28 23:53:04', 'canceled', '2023-01-28 13:53:04', '2023-01-28 13:53:13'),
(36, 41, '202301282053246762', 'auto', 'E-Wallet', 'OVO', '0895342301466', 'Masukan berdasarkan nominal', 50547, 50547, '2023-01-28 23:53:24', 'done', '2023-01-28 13:53:25', '2023-01-28 13:56:31'),
(37, 42, '202301290336584670', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 30559, 30559, '2023-01-29 06:36:58', 'done', '2023-01-28 20:36:58', '2023-01-28 23:10:37'),
(38, 38, '202301290512339905', 'auto', 'Bank', 'BCA', '5140690467', 'Masukan berdasarkan nominal', 121903, 121903, '2023-01-29 08:12:33', 'done', '2023-01-28 22:12:33', '2023-01-28 23:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `favorits`
--

CREATE TABLE `favorits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `category` text NOT NULL,
  `layanan` text NOT NULL,
  `price` int(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorits`
--

INSERT INTO `favorits` (`id`, `user_id`, `service_id`, `category`, `layanan`, `price`, `created_at`, `updated_at`) VALUES
(39, 23, 597, 'Tiktok Followers', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', 14364, '2023-01-24 14:39:39', '2023-01-24 14:39:39'),
(40, 35, 1528, '🔥New Services🔥', 'Tiktok Followers | Real | Max 5k | 5k/Day ', 15000, '2023-01-27 10:35:57', '2023-01-27 10:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `gopays`
--

CREATE TABLE `gopays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `otp_token` text DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gopays`
--

INSERT INTO `gopays` (`id`, `number`, `otp_token`, `access_token`, `status`, `created_at`, `updated_at`) VALUES
(1, '0895342301466', 'b38f03b9-3dcf-4ec1-87cb-359ee303b507', NULL, 'inactive', '2023-01-01 14:34:38', '2023-01-01 14:34:38'),
(2, '0895342301466', '631f55d6-0c20-44b0-b421-32976cd2467c', NULL, 'inactive', '2023-01-02 06:07:44', '2023-01-02 06:07:44'),
(3, '0895342301466', '6cc2a9f2-d264-4d70-b8f3-734598013ea1', NULL, 'inactive', '2023-01-04 07:35:31', '2023-01-04 07:35:31'),
(4, '0895342301466', '4958e6ed-8ecb-4cfa-aa46-8125cc6be893', NULL, 'inactive', '2023-01-06 22:13:01', '2023-01-06 22:13:01'),
(5, '0895342301466', 'd49739c4-8de4-4ee8-855a-bc3ff37c2911', NULL, 'inactive', '2023-01-06 22:18:07', '2023-01-06 22:18:07'),
(6, '089668205805', 'c5e0c3a9-2d4d-41e1-8a7c-53ae8207f90b', NULL, 'inactive', '2023-01-10 12:19:25', '2023-01-10 12:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `trxid` int(15) NOT NULL,
  `type` varchar(50) NOT NULL,
  `layanan` varchar(255) NOT NULL,
  `target` text NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `custom_comments` text DEFAULT NULL,
  `custom_link` text DEFAULT NULL,
  `start_count` varchar(255) DEFAULT NULL,
  `remains` varchar(255) NOT NULL,
  `status` enum('pending','partial','process','done','error') NOT NULL,
  `refill` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `user_id`, `trxid`, `type`, `layanan`, `target`, `quantity`, `price`, `custom_comments`, `custom_link`, `start_count`, `remains`, `status`, `refill`, `created_at`, `updated_at`) VALUES
(1, 1, 21680551, 'Default', 'Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️', 'justpedia.id', '500', 3000, '', '', '0', '0', 'done', '1', '2022-12-30 03:08:20', '2022-12-30 08:41:17'),
(2, 3, 21687348, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️', 'https://www.instagram.com/reel/CmtIOL1ouqY/?igshid=ZDhmZGIxNmQ=', '500', 500, '', '', '0', '0', 'done', '0', '2022-12-30 08:40:06', '2022-12-30 13:44:32'),
(3, 3, 21687400, 'Default', 'Instagram Likes | Good | Stable | Reach + Impression | No Drop | AR30', 'https://www.instagram.com/p/Cmq7725vKPE/?igshid=YmMyMTA2M2Y=', '100', 560, '', '', '0', '0', 'done', '0', '2022-12-30 08:42:28', '2022-12-30 13:44:06'),
(4, 3, 21687419, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️', 'https://www.instagram.com/p/CmokYHwvpz4/?igshid=YmMyMTA2M2Y=', '100', 100, '', '', '0', '0', 'done', '0', '2022-12-30 08:43:43', '2022-12-30 13:44:11'),
(5, 3, 21687434, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️', 'https://www.instagram.com/reel/Ck2h-bApUt7/?igshid=YmMyMTA2M2Y=', '500', 500, '', '', '0', '0', 'done', '0', '2022-12-30 08:44:35', '2022-12-30 13:44:15'),
(6, 5, 21688850, 'Default', 'Tiktok Likes | SuperInstant | Speed: 15K/Day | MAX 100K', 'https://vt.tiktok.com/ZS86uGC9C/', '100', 600, '', '', '0', '0', 'done', '0', '2022-12-30 10:11:25', '2022-12-30 13:44:19'),
(7, 5, 21688891, 'Default', 'TikTok Likes | New | HQ | Speed: Up To 20K/Day | No Refill | MAX 100K', 'https://vt.tiktok.com/ZS86uwhPr/', '100', 360, '', '', '0', '0', 'done', '0', '2022-12-30 10:13:20', '2022-12-30 13:44:24'),
(8, 5, 21689008, 'Default', 'Tiktok Followers | Mix | Speed: Up To 20K/Day | AR30 | MAX 100K ♻️', 'harikurniawan027', '100', 1500, '', '', '0', '0', 'done', '1', '2022-12-30 10:17:29', '2022-12-30 11:48:48'),
(9, 5, 21690091, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥⚡🔥', 'harikurniawan027', '100', 1740, '', '', '0', '0', 'done', '0', '2022-12-30 11:05:33', '2022-12-30 13:44:00'),
(10, 5, 21690261, 'Default', 'TikTok Likes | New | HQ | Speed: Up To 20K/Day | No Refill | MAX 100K', 'https://vt.tiktok.com/ZS86HsSPy/', '100', 360, '', '', '0', '0', 'done', '0', '2022-12-30 11:13:34', '2022-12-30 13:43:54'),
(11, 5, 21690321, 'Default', 'TikTok Video Shares | Instant | Up To 1M/Day | R30 | MAX 30M', 'https://vt.tiktok.com/ZS86HsSPy/', '100', 160, '', '', '0', '0', 'done', '0', '2022-12-30 11:15:12', '2022-12-30 13:43:49'),
(12, 3, 21690586, 'Default', 'Instagram Likes | Mix | Fast | Cheap | R30 | MAX 10K', 'https://www.instagram.com/p/CmtxQnUvMVm/?igshid=ZDhmZGIxNmQ=', '500', 71, '', '', '0', '0', 'done', '1', '2022-12-30 11:27:04', '2022-12-30 11:47:44'),
(13, 3, 21694276, 'Default', 'Instagram Likes | SuperFast | R45 | MAX 100K ♻️ ⚡️', 'https://www.instagram.com/p/CmvlYU_vZYZ/?igshid=ZDhmZGIxNmQ=', '500', 57, '', '', '0', '0', 'done', '1', '2022-12-30 13:50:43', '2022-12-31 14:56:06'),
(14, 3, 21694683, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️', 'https://www.instagram.com/p/CmvlYU_vZYZ/?igshid=ZDhmZGIxNmQ=', '500', 500, '', '', '0', '0', 'done', '0', '2022-12-30 14:07:17', '2022-12-31 14:56:02'),
(15, 1, 21702936, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmBEZwaJuvU/?utm_source=ig_web_copy_link', '50', 43, '', '', '0', '0', 'done', '0', '2022-12-30 21:56:06', '2022-12-31 14:55:58'),
(16, 1, 21707332, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cl5m3n1vI9n/?utm_source=ig_web_copy_link', '20', 17, '', '', '0', '0', 'done', '0', '2022-12-31 01:42:22', '2022-12-31 14:55:54'),
(17, 6, 21708441, 'Default', 'Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️ ', 'mohammadrizqi_15', '1000', 6000, '', '', '0', '0', 'done', '0', '2022-12-31 02:32:04', '2022-12-31 14:55:50'),
(18, 6, 21708475, 'Default', 'Tiktok Followers | Mix | Speed: Up To 20K/Day | AR30 | MAX 100K ♻️⛔🔥🔥', 'lungs_id', '1000', 17000, '', '', '0', '0', 'done', '0', '2022-12-31 02:34:30', '2022-12-31 14:55:34'),
(19, 6, 21708904, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥', 'vanillamc_', '500', 10000, '', '', '0', '0', 'done', '0', '2022-12-31 02:53:04', '2022-12-31 14:55:31'),
(20, 3, 21709737, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/reel/CmwSi7Yolp8/?igshid=ZDhmZGIxNmQ=', '550', 660, '', '', '0', '0', 'done', '0', '2022-12-31 03:24:16', '2022-12-31 14:55:27'),
(21, 9, 21710646, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥', 'tiktok.com/@calvinadrian', '1200', 24000, '', '', '0', '0', 'done', '0', '2022-12-31 04:08:19', '2022-12-31 14:55:23'),
(22, 3, 21713150, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/reel/Cm0kzLRBaHr/?igshid=YmMyMTA2M2Y=', '2000', 2400, '', '', '0', '0', 'done', '0', '2022-12-31 06:03:03', '2022-12-31 14:55:16'),
(23, 3, 21713181, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/p/CmyhprGPDQD/?igshid=ZDhmZGIxNmQ=', '550', 660, '', '', '0', '0', 'done', '0', '2022-12-31 06:04:45', '2022-12-31 14:55:11'),
(24, 6, 21719567, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥', 'atriharyanto', '1000', 20000, '', '', '0', '0', 'done', '0', '2022-12-31 09:49:30', '2022-12-31 14:55:05'),
(25, 6, 21720928, 'Default', 'Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡', 'https://www.instagram.com/p/Cm1CG1EvqDU/?igshid=YmMyMTA2M2Y=', '10000', 9500, '', '', '0', '0', 'done', '0', '2022-12-31 10:42:55', '2023-01-01 13:47:31'),
(26, 6, 21720957, 'Default', 'Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡', 'https://www.instagram.com/p/Cm1APw0Ps_A/?igshid=YmMyMTA2M2Y=', '10000', 9500, '', '', '0', '0', 'done', '0', '2022-12-31 10:43:49', '2023-01-01 13:47:35'),
(27, 6, 21720969, 'Default', 'Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡', 'https://www.instagram.com/p/Cm0_xUpvPIm/?igshid=YmMyMTA2M2Y=', '10000', 9500, '', '', '0', '0', 'done', '0', '2022-12-31 10:44:24', '2023-01-01 13:47:42'),
(28, 3, 21742832, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/p/Cm1GDq7vQVJ/?igshid=ZDhmZGIxNmQ=', '550', 660, '', '', '0', '0', 'done', '0', '2023-01-01 07:22:34', '2023-01-01 13:47:57'),
(29, 1, 21750562, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/p/Cl74XkjPXRJ/?utm_source=ig_web_copy_link', '30', 36, '', '', '8', '0', 'done', '0', '2023-01-01 14:42:44', '2023-01-01 14:50:08'),
(30, 3, 21761150, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/reel/Cm4WRdVBSSv/?igshid=YmMyMTA2M2Y=', '1000', 1200, '', '', '6', '0', 'done', '0', '2023-01-02 01:56:12', '2023-01-02 06:37:03'),
(31, 6, 21808252, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥', 'kidspriok', '500', 10000, '', '', '74', '0', 'done', '0', '2023-01-03 11:36:39', '2023-01-03 16:56:06'),
(32, 6, 21812561, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥', 'https://www.tiktok.com/@awmahardhika', '1000', 20000, '', '', '1', '0', 'done', '0', '2023-01-03 14:13:47', '2023-01-03 17:42:07'),
(33, 4, 21836846, 'Default', 'Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡', 'https://www.instagram.com/p/Cm7zwXhP_Fg/?igshid=MDJmNzVkMjY=', '10', 10, '', '', '10', '0', 'done', '0', '2023-01-04 07:17:35', '2023-01-04 07:36:05'),
(34, 4, 21838132, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cl-kcQgvJpS/?utm_source=ig_web_copy_link', '100', 85, '', '', '10', '0', 'done', '0', '2023-01-04 08:08:59', '2023-01-04 08:15:12'),
(35, 4, 21838164, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmBsLzhPuWp/?utm_source=ig_web_copy_link', '100', 85, '', '', '16', '0', 'done', '0', '2023-01-04 08:10:31', '2023-01-04 08:16:05'),
(36, 4, 21838185, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmEFJu3PfkU/?utm_source=ig_web_copy_link', '50', 43, '', '', '22', '0', 'done', '0', '2023-01-04 08:11:21', '2023-01-04 08:26:05'),
(37, 4, 21838194, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmMAvZwv8fp/?utm_source=ig_web_copy_link', '100', 85, '', '', '29', '0', 'done', '0', '2023-01-04 08:11:43', '2023-01-04 08:26:05'),
(38, 4, 21838207, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmTkoCBPJ3v/?utm_source=ig_web_copy_link', '100', 85, '', '', '22', '0', 'done', '0', '2023-01-04 08:12:30', '2023-01-04 08:18:07'),
(39, 4, 21838251, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CmY2oUDgcbD/?utm_source=ig_web_copy_link', '100', 85, '', '', '27', '0', 'done', '0', '2023-01-04 08:14:49', '2023-01-04 08:29:04'),
(40, 4, 21838311, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmeBVjovpLM/?utm_source=ig_web_copy_link', '100', 85, '', '', '15', '0', 'done', '0', '2023-01-04 08:16:02', '2023-01-04 08:22:08'),
(41, 4, 21838328, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CmjK_s_pmRo/?utm_source=ig_web_copy_link', '100', 85, '', '', '39', '0', 'done', '0', '2023-01-04 08:16:43', '2023-01-04 08:22:09'),
(42, 4, 21838351, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cmq49wEvjms/?utm_source=ig_web_copy_link', '100', 85, '', '', '16', '0', 'done', '0', '2023-01-04 08:17:02', '2023-01-04 08:23:06'),
(43, 4, 21838361, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmsfzVFvJ4C/?utm_source=ig_web_copy_link', '100', 85, '', '', '7', '0', 'done', '0', '2023-01-04 08:17:21', '2023-01-04 08:24:08'),
(44, 4, 21838372, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cm3xQ-dvWLH/?utm_source=ig_web_copy_link', '100', 85, '', '', '20', '0', 'done', '0', '2023-01-04 08:17:48', '2023-01-04 08:24:09'),
(45, 4, 21838418, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmBtJ4whFK2/?utm_source=ig_web_copy_link', '100', 85, '', '', '24', '0', 'done', '0', '2023-01-04 08:19:31', '2023-01-04 08:25:09'),
(46, 4, 21838455, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmMASKTPoAR/?utm_source=ig_web_copy_link', '100', 85, '', '', '22', '0', 'done', '0', '2023-01-04 08:20:30', '2023-01-04 08:26:07'),
(47, 4, 21838488, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmOkwggv4NX/?utm_source=ig_web_copy_link', '100', 85, '', '', '22', '0', 'done', '0', '2023-01-04 08:21:25', '2023-01-04 08:35:07'),
(48, 4, 21838496, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmWUPeGhEFH/?utm_source=ig_web_copy_link', '100', 85, '', '', '15', '0', 'done', '0', '2023-01-04 08:21:41', '2023-01-04 08:27:05'),
(49, 3, 21838533, 'Default', 'Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔', 'https://www.instagram.com/p/CmULZJVv5Kx/?igshid=YmMyMTA2M2Y=', '500', 600, '', '', '36', '0', 'done', '0', '2023-01-04 08:22:51', '2023-01-04 08:41:04'),
(50, 4, 21838574, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cmc03cwhOC_/?utm_source=ig_web_copy_link', '100', 85, '', '', '15', '0', 'done', '0', '2023-01-04 08:24:25', '2023-01-04 08:30:23'),
(51, 4, 21838601, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmoGbC1hajx/?utm_source=ig_web_copy_link', '100', 85, '', '', '18', '0', 'done', '0', '2023-01-04 08:24:57', '2023-01-04 08:31:05'),
(52, 4, 21838614, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cmq4BzCBf_d/?utm_source=ig_web_copy_link', '100', 85, '', '', '17', '0', 'done', '0', '2023-01-04 08:25:10', '2023-01-04 08:40:11'),
(53, 4, 21838618, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmsgAP5B2Cf/?utm_source=ig_web_copy_link', '100', 85, '', '', '10', '0', 'done', '0', '2023-01-04 08:25:27', '2023-01-04 08:31:06'),
(54, 4, 21838625, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CmynhP-Bd6F/?utm_source=ig_web_copy_link', '100', 85, '', '', '16', '0', 'done', '0', '2023-01-04 08:25:40', '2023-01-04 08:32:09'),
(55, 4, 21838636, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cm6X7Lfh8G9/?utm_source=ig_web_copy_link', '100', 85, '', '', '16', '0', 'done', '0', '2023-01-04 08:25:58', '2023-01-04 08:40:12'),
(56, 4, 21838653, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CjzwP71h6pB/?utm_source=ig_web_copy_link', '100', 85, '', '', '73', '0', 'done', '0', '2023-01-04 08:26:27', '2023-01-04 08:32:10'),
(57, 4, 21868980, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/Cm_RA9Au7GH/?utm_source=ig_web_copy_link', '50', 43, '', '', '34', '0', 'done', '0', '2023-01-05 04:06:04', '2023-01-05 04:12:05'),
(58, 4, 21868993, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/Cm52EPyP8AP/?utm_source=ig_web_copy_link', '50', 43, '', '', '24', '0', 'done', '0', '2023-01-05 04:06:51', '2023-01-05 04:13:04'),
(59, 4, 21869014, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CmoTadQL3So/?utm_source=ig_web_copy_link', '50', 43, '', '', '14', '0', 'done', '0', '2023-01-05 04:07:34', '2023-01-05 04:14:05'),
(60, 4, 21869063, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CmTl7kvt9Ak/?utm_source=ig_web_copy_link', '50', 43, '', '', '18', '0', 'done', '0', '2023-01-05 04:09:14', '2023-01-05 04:15:12'),
(61, 4, 21869176, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/ClLohQDpzue/?utm_source=ig_web_copy_link', '50', 43, '', '', '25', '0', 'done', '0', '2023-01-05 04:15:20', '2023-01-05 04:21:04'),
(62, 4, 21869189, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/Cl3YR7-uUQL/?utm_source=ig_web_copy_link', '50', 43, '', '', '24', '0', 'done', '0', '2023-01-05 04:16:06', '2023-01-05 04:22:05'),
(63, 4, 21869200, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/Cl8gcFgMQ5V/?utm_source=ig_web_copy_link', '50', 43, '', '', '23', '0', 'done', '0', '2023-01-05 04:17:00', '2023-01-05 04:31:05'),
(64, 4, 21869257, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CmgG0aUsXb3/?utm_source=ig_web_copy_link', '50', 43, '', '', '40', '0', 'done', '0', '2023-01-05 04:19:10', '2023-01-05 04:33:04'),
(65, 4, 21869261, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CkqGHSpvRjm/?utm_source=ig_web_copy_link', '50', 43, '', '', '29', '0', 'done', '0', '2023-01-05 04:19:27', '2023-01-05 04:33:05'),
(66, 4, 21869286, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/ClqNaMBN05_/?utm_source=ig_web_copy_link', '50', 43, '', '', '22', '0', 'done', '0', '2023-01-05 04:20:20', '2023-01-05 04:26:08'),
(67, 4, 21869293, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CllC8DkuP4J/?utm_source=ig_web_copy_link', '50', 43, '', '', '23', '0', 'done', '0', '2023-01-05 04:20:35', '2023-01-05 04:27:06'),
(68, 5, 21908693, 'Default', 'Tiktok Followers | Mix | Speed: Up To 20K/Day | AR30 | MAX 100K ♻️⛔🔥🔥', 'harikurniawan027', '500', 8500, '', '', '514', '0', 'done', '0', '2023-01-06 03:46:55', '2023-01-07 08:50:13'),
(69, 6, 21912842, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥', 'https://www.instagram.com/p/CnDfL4GrhpE/?igshid=YmMyMTA2M2Y=', '5000', 6750, '', '', '7', '0', 'done', '0', '2023-01-06 06:43:18', '2023-01-06 07:32:06'),
(70, 6, 21912869, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥', 'https://www.instagram.com/p/CnA6ZLerH_s/?igshid=YmMyMTA2M2Y=', '5000', 6750, '', '', '24', '0', 'done', '0', '2023-01-06 06:44:06', '2023-01-06 07:33:05'),
(71, 6, 21913319, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥', 'https://www.instagram.com/p/Cm-VmerBrYq/?igshid=YmMyMTA2M2Y=', '5000', 6750, '', '', '6', '0', 'done', '0', '2023-01-06 07:01:43', '2023-01-06 07:50:12'),
(72, 6, 21913368, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥', 'https://www.instagram.com/p/Cm7wzIfNOOH/?igshid=YmMyMTA2M2Y=', '5000', 6750, '', '', '8', '0', 'done', '0', '2023-01-06 07:02:26', '2023-01-06 07:50:13'),
(73, 6, 21913382, 'Default', 'Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥', 'https://www.instagram.com/p/Cm53X0oAmed/?igshid=YmMyMTA2M2Y=', '5000', 6750, '', '', '0', '0', 'done', '0', '2023-01-06 07:02:51', '2023-01-06 07:51:05'),
(74, 4, 21914380, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/Cm_QF4EqH_j/?utm_source=ig_web_copy_link', '100', 85, '', '', '25', '0', 'done', '0', '2023-01-06 07:45:04', '2023-01-06 07:51:06'),
(75, 4, 21914394, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/Cm_SA0wJ5Ci/?utm_source=ig_web_copy_link', '100', 85, '', '', '13', '0', 'done', '0', '2023-01-06 07:45:48', '2023-01-06 07:52:06'),
(76, 13, 21922498, 'Default', 'Instagram Followers | Cheap | Fast | HQ | MAX 10K ⛔ ⚡️', 'humbelangsyarif', '2500', 5250, '', '', '5510', '0', 'done', '0', '2023-01-06 14:06:48', '2023-01-06 14:25:08'),
(77, 13, 21922951, 'Default', 'Instagram Followers | Cheap | Fast | HQ | MAX 10K ⛔ ⚡️', 'humbelangsyarif', '3000', 6300, '', '', '8006', '0', 'done', '0', '2023-01-06 14:32:02', '2023-01-06 14:41:06'),
(78, 13, 21925312, 'Default', 'Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️ 🔥⚡️', 'humbelangsyarif', '1400', 15400, '', '', '8688', '0', 'done', '0', '2023-01-06 16:17:59', '2023-01-06 18:15:15'),
(79, 13, 21955439, 'Default', 'Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️ 🔥⚡️', 'humbelangsyarif', '100', 1100, '', '', '10233', '0', 'done', '0', '2023-01-07 15:49:12', '2023-01-07 16:17:03'),
(80, 6, 22007586, 'Default', 'TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥', 'anggiesaputro99', '2000', 40000, '', '', '8', '0', 'done', '0', '2023-01-09 08:12:36', '2023-01-09 19:45:14'),
(81, 4, 22009027, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CnEZZ-UvI1O/?utm_source=ig_web_copy_link', '100', 85, '', '', '14', '0', 'done', '0', '2023-01-09 09:22:23', '2023-01-09 11:04:06'),
(82, 4, 22009032, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/reel/CnJy8O5J0ks/?utm_source=ig_web_copy_link', '100', 85, '', '', '17', '0', 'done', '0', '2023-01-09 09:22:49', '2023-01-09 11:04:06'),
(83, 4, 22009050, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CnEXFFfB_ZP/?utm_source=ig_web_copy_link', '100', 85, '', '', '22', '0', 'done', '0', '2023-01-09 09:23:59', '2023-01-09 11:04:07'),
(84, 4, 22009056, 'Default', 'Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥', 'https://www.instagram.com/p/CnJ0bYhPghN/?utm_source=ig_web_copy_link', '100', 85, '', '', '11', '0', 'done', '0', '2023-01-09 09:24:13', '2023-01-09 11:04:08'),
(85, 6, 22013214, 'Default', 'Tiktok Views | NEW | Start Time: Instant | Speed: 100-500K/Day | No Drop | MAX 3M ⛔', 'https://vt.tiktok.com/ZS8hhEVhH/', '10000', 5000, '', '', '250', '0', 'done', '0', '2023-01-09 12:21:04', '2023-01-09 12:51:03'),
(86, 1, 3093652, 'Default', 'Instagram Like | Real | Max 200K | 500/Hour | Non Drop | No Refill |', 'https://www.instagram.com/p/CnPJBWwP4Oh/?utm_source=ig_web_copy_link', '50', 54, '', '', '0', '0', 'done', '0', '2023-01-10 13:37:37', '2023-01-10 13:52:05'),
(87, 1, 3094059, 'Default', 'Pinterest Repins | Max 100k | No Refill | 1k-5k/Day |', 'https://id.pinterest.com/jhonfebriyanto/', '100', 3498, '', '', '0', '100', 'pending', '0', '2023-01-10 14:44:43', '2023-01-10 16:34:06'),
(88, 9, 3102667, 'Default', 'Tiktok Followers | Real | Max 100k | 10k-20k/Day | 120 Days Refill | ♻️', 'tiktok.com/@je3lim_', '1200', 32212, '', '', '17', '0', 'done', '0', '2023-01-11 19:11:02', '2023-01-12 19:50:17'),
(89, 3, 3104382, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/Cml2ym8PGTX/?igshid=ZDhmZGIxNmQ=', '400', 500, '', '', '271', '0', 'done', '0', '2023-01-12 05:06:53', '2023-01-12 05:21:05'),
(90, 6, 3105800, 'Default', 'Tiktok Followers | Real | Max 100k | 10k/Day | Low Drop | No Refill |', 'cikiicuyyy', '1000', 17499, '', '', NULL, '1000', 'done', '0', '2023-01-12 09:18:34', '2023-01-14 00:42:21'),
(91, 4, 3129412, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnRdGCmphTW/?utm_source=ig_web_copy_link', '100', 125, '', '', '18', '0', 'done', '0', '2023-01-16 02:55:19', '2023-01-17 16:46:08'),
(92, 4, 3129414, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnT1i19peRk/?utm_source=ig_web_copy_link', '100', 125, '', '', '82', '0', 'done', '0', '2023-01-16 02:55:36', '2023-01-17 16:46:09'),
(93, 4, 3129418, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/CnbMg0avux0/?utm_source=ig_web_copy_link', '100', 125, '', '', '18', '0', 'done', '0', '2023-01-16 02:56:07', '2023-01-17 16:46:09'),
(94, 6, 3129579, 'Default', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️', 'only_sultan_store', '2000', 11000, '', '', '81', '0', 'done', '0', '2023-01-16 03:30:18', '2023-01-17 16:46:10'),
(95, 6, 3129587, 'Default', 'Instagram Followers | Real | Max 100K | 10k-20k/Day | No Refill |⛔	', 'Reliapurnamasari', '500', 1350, '', '', '1777', '0', 'done', '0', '2023-01-16 03:31:18', '2023-01-17 16:46:11'),
(96, 4, 3131485, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnOKdNsq4Gs/?utm_source=ig_web_copy_link', '100', 125, '', '', '18', '0', 'done', '0', '2023-01-16 09:35:39', '2023-01-17 16:46:12'),
(97, 4, 3131488, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/CnT3vkyBsit/?utm_source=ig_web_copy_link', '100', 125, '', '', '11', '0', 'done', '0', '2023-01-16 09:36:00', '2023-01-17 16:46:13'),
(98, 4, 3131491, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnbNheEqhMb/?utm_source=ig_web_copy_link', '100', 125, '', '', '22', '0', 'done', '0', '2023-01-16 09:36:14', '2023-01-17 16:46:14'),
(99, 6, 3131501, 'Default', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️', 'mharunalrasyiid', '10000', 55000, '', '', '3698', '0', 'done', '0', '2023-01-16 09:38:16', '2023-01-17 16:46:16'),
(100, 6, 3137087, 'Default', 'Tiktok Followers | Max 10K | Non Drop | 5k/Day | 30D Refill |♻️', 'official.igamers', '1000', 25843, '', '', '1046', '-3', 'done', '0', '2023-01-17 06:19:34', '2023-01-17 16:46:17'),
(101, 4, 3137449, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/Cnf7h22pZ5Y/?utm_source=ig_web_copy_link', '100', 125, '', '', '7', '0', 'done', '0', '2023-01-17 07:27:06', '2023-01-17 16:46:18'),
(102, 1, 3149391, 'Default', 'Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️', 'jhonwlkr72', '50', 500, '', '', '6', '0', 'done', '0', '2023-01-19 03:31:56', '2023-01-19 09:18:06'),
(103, 4, 3151120, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnjRzpgpSsu/?utm_source=ig_web_copy_link', '100', 125, '', '', '14', '0', 'done', '0', '2023-01-19 09:04:38', '2023-01-19 09:28:06'),
(104, 4, 3151122, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/CngruooBU6Z/?utm_source=ig_web_copy_link', '100', 125, '', '', '7', '0', 'done', '0', '2023-01-19 09:05:10', '2023-01-19 09:20:18'),
(105, 5, 3163689, 'Default', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', 'warungtopup.ptk', '1000', 14364, '', '', '104', '0', 'done', '0', '2023-01-21 03:02:08', '2023-01-21 04:38:06'),
(106, 5, 3164411, 'Default', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️', 'warungtopup.ptk', '30', 165, '', '', '10586', '0', 'done', '0', '2023-01-21 05:48:57', '2023-01-21 05:52:06'),
(107, 5, 3164424, 'Default', 'Instagram Followers | Max 1M | Non Drop | 50k/Day | 365 Days Refill♻️', 'warungtopup.ptk', '50', 450, '', '', '10647', '0', 'done', '0', '2023-01-21 05:51:50', '2023-01-21 06:02:07'),
(108, 6, 3169195, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/CnrN-8NJESD/?igshid=YmMyMTA2M2Y=', '1000', 1250, '', '', '32', '0', 'done', '0', '2023-01-21 19:09:40', '2023-01-21 19:34:07'),
(109, 4, 3179347, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnocnQSpYDN/?utm_source=ig_web_copy_link', '100', 125, '', '', '26', '0', 'done', '0', '2023-01-23 07:57:55', '2023-01-23 08:12:06'),
(110, 4, 3179350, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/Cnt41HOPH0O/?utm_source=ig_web_copy_link', '100', 125, '', '', '9', '0', 'done', '0', '2023-01-23 07:58:31', '2023-01-23 08:12:07'),
(111, 4, 3179356, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/Cnl6apQqxYQ/?utm_source=ig_web_copy_link', '100', 125, '', '', '25', '0', 'done', '0', '2023-01-23 07:58:59', '2023-01-23 08:14:05'),
(112, 4, 3179358, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/Cnt2y-CBaIa/?utm_source=ig_web_copy_link', '100', 125, '', '', '13', '0', 'done', '0', '2023-01-23 07:59:20', '2023-01-23 08:14:06'),
(113, 4, 3183954, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/CnwMFwTP9fM/?utm_source=ig_web_copy_link', '100', 125, '', '', '10', '0', 'done', '0', '2023-01-24 01:28:43', '2023-01-24 01:44:07'),
(114, 21, 3186198, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/reel/Cnx7wynBGBA/?igshid=YWJhMjlhZTc=', '100', 135, '', '', '3', '0', 'done', '0', '2023-01-24 08:37:05', '2023-01-24 08:52:06'),
(115, 21, 3186201, 'Default', 'Instagram Reel+ IGTV Views | 1M/Day | Max 10M | Non Drop | Working |', 'https://www.instagram.com/reel/Cnx7wynBGBA/?igshid=YWJhMjlhZTc=', '2000', 374, '', '', '472', '-1627', 'done', '0', '2023-01-24 08:38:05', '2023-01-24 08:48:07'),
(116, 22, 3188218, 'Default', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', 'diablo.069', '1500', 21546, '', '', '28', '0', 'done', '0', '2023-01-24 14:12:05', '2023-01-24 17:04:07'),
(117, 21, 3190336, 'Default', 'Instagram Reel+ IGTV Views | 1M/Day | Max 10M | Non Drop | Working |', 'https://www.instagram.com/reel/Cnx7wynBGBA/?igshid=YWJhMjlhZTc=', '2000', 374, '', '', '4648', '0', 'done', '0', '2023-01-24 21:22:00', '2023-01-24 21:28:07'),
(118, 24, 3191411, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'poros_musarajekshah', '1300', 5850, '', '', '969', '0', 'done', '0', '2023-01-25 04:00:43', '2023-01-25 09:58:06'),
(119, 24, 3191412, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'sumut_beriman', '1300', 5850, '', '', '906', '0', 'done', '0', '2023-01-25 04:01:14', '2023-01-25 09:58:06'),
(120, 24, 3191413, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'garis_musarajekshah', '1300', 5850, '', '', '912', '0', 'done', '0', '2023-01-25 04:01:31', '2023-01-25 09:58:07'),
(121, 24, 3191414, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'holaday_sumut', '1300', 5850, '', '', '871', '0', 'done', '0', '2023-01-25 04:01:43', '2023-01-25 09:58:08'),
(122, 24, 3191415, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'karyabersama__', '1300', 5850, '', '', '771', '0', 'done', '0', '2023-01-25 04:01:54', '2023-01-25 08:52:08'),
(123, 24, 3191417, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'ruang_sumut', '1300', 5850, '', '', '934', '0', 'done', '0', '2023-01-25 04:02:07', '2023-01-25 08:52:09'),
(124, 25, 3191627, 'Default', 'Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️', '@weib.photo', '1000', 10000, '', '', '1486', '0', 'done', '0', '2023-01-25 04:37:31', '2023-01-25 05:12:11'),
(125, 26, 3193246, 'Default', 'Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day |', 'https://www.instagram.com/reel/CngOawuB-qa/', '40000', 1000, '', '', '2136', '0', 'done', '0', '2023-01-25 09:52:06', '2023-01-25 10:08:06'),
(126, 26, 3193308, 'Default', 'Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day |', 'https://www.instagram.com/reel/Cl7-eN5hFVu/', '30000', 750, '', '', '1095', '0', 'done', '0', '2023-01-25 10:01:53', '2023-01-25 10:16:07'),
(127, 26, 3193313, 'Default', 'Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day |', 'https://www.instagram.com/reel/ClpylBChgjE/', '25000', 625, '', '', '1559', '0', 'done', '0', '2023-01-25 10:02:39', '2023-01-25 10:16:08'),
(128, 26, 3193334, 'Default', 'Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day |', 'https://www.instagram.com/reel/Cm6GYwmBnPx/', '25000', 625, '', '', NULL, '25000', 'error', '0', '2023-01-25 10:05:14', '2023-01-26 00:17:46'),
(129, 27, 3195075, 'Default', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', '@akbarhamiedo', '1002', 14393, '', '', '13', '0', 'done', '0', '2023-01-25 15:08:07', '2023-01-25 20:22:08'),
(130, 24, 3195428, 'Default', 'Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop', 'https://www.tiktok.com/@cielahbray/video/7041788906949348609', '4444', 444, '', '', '331', '0', 'done', '0', '2023-01-25 15:58:25', '2023-01-25 16:04:06'),
(131, 24, 3195445, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/p/Cn0qw_wPX_J/?hl=id', '100', 135, '', '', '83', '0', 'done', '0', '2023-01-25 16:01:07', '2023-01-25 16:16:08'),
(132, 4, 3197673, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/reel/Cn1WqLvgkNb/?utm_source=ig_web_copy_link', '100', 135, '', '', '14', '0', 'done', '0', '2023-01-26 02:26:28', '2023-01-26 02:48:06'),
(133, 4, 3197703, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/reel/CnyxF5phxHP/?utm_source=ig_web_copy_link', '100', 75, '', '', '14', '0', 'done', '0', '2023-01-26 02:28:48', '2023-01-26 02:48:07'),
(134, 26, 3197858, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/reel/Cl7-eN5hFVu/', '1481', 1999, '', '', '43', '0', 'done', '0', '2023-01-26 03:11:49', '2023-01-26 03:34:05'),
(135, 24, 3197993, 'Default', 'Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day |', 'https://www.instagram.com/p/Cn3RrL0NZkK/?hl=id', '2735', 68, '', '', NULL, '2735', 'error', '0', '2023-01-26 03:51:12', '2023-01-26 04:01:55'),
(136, 24, 3198075, 'Default', 'Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day |', 'https://www.instagram.com/p/Cn3RrL0NZkK/?hl=id', '3252', 81, '', '', '0', '0', 'error', '0', '2023-01-26 04:04:09', '2023-01-26 04:05:10'),
(137, 24, 3198082, 'Default', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'https://www.instagram.com/p/Cn3RrL0NZkK/?hl=id', '4312', 160, '', '', NULL, '4312', 'error', '0', '2023-01-26 04:05:15', '2023-01-26 04:41:05'),
(138, 26, 3198224, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/CnmfKEeyxXB/', '1500', 1125, '', '', '3', '0', 'done', '0', '2023-01-26 04:34:16', '2023-01-26 04:52:06'),
(139, 26, 3198226, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/Cnme7MJh7aj/', '1000', 750, '', '', '3', '0', 'done', '0', '2023-01-26 04:34:49', '2023-01-26 05:10:10'),
(140, 26, 3198239, 'Default', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'https://www.instagram.com/p/Cnme7MJh7aj/', '35000', 1295, '', '', '39', '0', 'done', '0', '2023-01-26 04:36:44', '2023-01-26 04:50:13'),
(141, 26, 3198250, 'Default', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'https://www.instagram.com/reel/Cj9684XBdBv/', '20000', 740, '', '', '2963', '0', 'done', '0', '2023-01-26 04:40:02', '2023-01-26 04:46:09'),
(142, 6, 3201002, 'Default', 'Tiktok Followers | Real | Max 5k | 5k/Day ', 'yaoyaokuy', '1000', 15000, '', '', '104', '-6', 'done', '0', '2023-01-26 13:03:38', '2023-01-26 13:10:10'),
(143, 6, 3204380, 'Default', 'Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop', 'https://vt.tiktok.com/ZS8DM1YFT/', '1000', 100, '', '', '231', '0', 'done', '0', '2023-01-27 02:57:14', '2023-01-27 03:04:07'),
(144, 4, 3204438, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/Cn36Hy1B_5q/?utm_source=ig_web_copy_link', '100', 75, '', '', '13', '0', 'done', '0', '2023-01-27 03:15:26', '2023-01-27 03:22:06'),
(145, 6, 3204503, 'Default', 'Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop', 'https://vt.tiktok.com/ZS8DMn5Kq/', '1000', 100, '', '', '259', '0', 'done', '0', '2023-01-27 03:29:32', '2023-01-27 03:36:06'),
(146, 24, 3204582, 'Default', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'https://www.instagram.com/p/Cn3RrL0NZkK/?hl=id', '2352', 87, '', '', NULL, '2352', 'error', '0', '2023-01-27 03:43:43', '2023-01-27 07:15:47'),
(147, 6, 3205364, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'freezestore1', '3000', 13500, '', '', '6', '0', 'done', '0', '2023-01-27 06:08:19', '2023-01-27 09:00:21'),
(148, 6, 3205382, 'Default', 'Instagram Followers | Max 10k | 10k/day | No Refill', 'cakruldiamond', '500', 875, '', '', '0', '1', 'partial', '0', '2023-01-27 06:10:56', '2023-01-27 10:32:06'),
(149, 24, 3205867, 'Default', 'Instagram Views | Max 10M | Instant | Non Drop | 1M/Day |', 'https://www.instagram.com/p/Cn3RrL0NZkK/?hl=id', '4321', 151, '', '', '0', '0', 'error', '0', '2023-01-27 07:21:19', '2023-01-27 07:38:40'),
(150, 35, 3206998, 'Default', 'Tiktok Followers | Real | Max 5k | 5k/Day ', 'renytayuliantiie', '1000', 15000, '', '', '0', '1000', 'done', '0', '2023-01-27 10:36:40', '2023-01-28 02:07:28'),
(151, 24, 3207105, 'Default', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'Instagram Video Views Real + Reel + IGTV - [Mix - 20M][Working][S2]', '2345', 87, '', '', NULL, '2345', 'error', '0', '2023-01-27 10:52:35', '2023-01-28 02:09:38'),
(152, 24, 3207111, 'Default', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'https://www.instagram.com/p/Cn3RrL0NZkK/?hl=id', '4321', 160, '', '', NULL, '4321', 'error', '0', '2023-01-27 10:53:47', '2023-01-28 02:09:18'),
(153, 4, 3211148, 'Default', 'Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop', 'https://vt.tiktok.com/ZS8DmWPTy/', '1000', 100, '', '', '166', '0', 'done', '0', '2023-01-28 00:43:20', '2023-01-28 00:50:12'),
(154, 6, 3211735, 'Default', 'Instagram Followers | Max 500K | 10-30% Drop | 10k-50k/Day | 365D Refill | ♻️	', 'freezestore1', '1500', 11100, '', '', '1568', '0', 'done', '0', '2023-01-28 02:55:12', '2023-01-28 04:48:06'),
(155, 6, 3211814, 'Default', 'Instagram Followers | Max 1M | Non Drop | 50k/Day | 365 Days Refill♻️', 'rizuka.store', '5000', 45000, '', '', '468', '0', 'done', '0', '2023-01-28 03:13:47', '2023-01-28 06:42:05'),
(156, 37, 3212154, 'Default', 'Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️', 'Xyz.mbax', '100', 1000, '', '', '8488', '0', 'done', '0', '2023-01-28 04:13:31', '2023-01-28 04:34:06'),
(157, 30, 3212258, 'Default', 'Tiktok Followers | Real | Max 100k | 10k/Day | Low Drop | No Refill |', 'thisveg', '1000', 17499, '', '', '46', '0', 'done', '0', '2023-01-28 04:32:45', '2023-01-28 05:56:06'),
(158, 39, 3213036, 'Default', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 60D Refill | ♻️', 'poketechofficialstore', '2000', 11976, '', '', '1', '0', 'done', '0', '2023-01-28 06:38:01', '2023-01-28 06:48:05'),
(159, 38, 3213055, 'Default', 'Instagram Followers | Real | Max 100K | 10k-20k/Day | No Refill |⛔	', 'east.blake_', '10000', 27000, '', '', '4689', '0', 'done', '0', '2023-01-28 06:40:08', '2023-01-28 06:46:06'),
(160, 38, 3213100, 'Default', 'Instagram Followers | Bot | Max 10k | 10k/day | No Refill |', 'east.blake_', '7000', 11123, '', '', '14793', '0', 'done', '0', '2023-01-28 06:46:26', '2023-01-28 08:56:07'),
(161, 39, 3213112, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/p/Cn8atdEr372/?igshid=YmMyMTA2M2Y=', '100', 135, '', '', '0', '0', 'done', '0', '2023-01-28 06:48:28', '2023-01-28 07:10:10'),
(162, 39, 3213115, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/p/Cn8apyaL97W/?igshid=YmMyMTA2M2Y=', '100', 135, '', '', '0', '0', 'done', '0', '2023-01-28 06:48:58', '2023-01-28 07:28:06'),
(163, 39, 3213121, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/p/Cn8aifjrr8y/?igshid=YmMyMTA2M2Y=', '100', 135, '', '', '0', '0', 'done', '0', '2023-01-28 06:49:40', '2023-01-28 07:04:08'),
(164, 39, 3213132, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/p/CnHkseDv2CI/?igshid=NTdlMDg3MTY=', '200', 270, '', '', '404', '0', 'done', '0', '2023-01-28 06:51:36', '2023-01-28 07:06:08'),
(165, 39, 3213156, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/p/CcWDKw2h7hI/?igshid=NTdlMDg3MTY=', '100', 135, '', '', '69', '0', 'done', '0', '2023-01-28 06:54:07', '2023-01-28 07:08:08'),
(166, 39, 3213163, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/reel/CjpyMeAjWeF/?igshid=NTdlMDg3MTY=', '500', 675, '', '', '107', '0', 'done', '0', '2023-01-28 06:54:53', '2023-01-28 07:08:09'),
(167, 39, 3213165, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/reel/CkvSqHzDx-w/?igshid=NTdlMDg3MTY=', '500', 675, '', '', '110', '0', 'done', '0', '2023-01-28 06:55:27', '2023-01-28 07:10:12'),
(168, 38, 3213198, 'Default', 'Instagram Followers | Bot | Max 10k | 10k/day | No Refill |', 'alvinadwitya', '7750', 12315, '', '', '17030', '0', 'done', '0', '2023-01-28 07:05:04', '2023-01-28 07:20:10'),
(169, 39, 3213364, 'Default', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', 'https://www.tiktok.com/@anandaa.hb?_t=8ZOlftfjz8M&_r=1', '300', 4309, '', '', '99', '0', 'done', '0', '2023-01-28 07:26:57', '2023-01-28 07:56:06'),
(170, 3, 3214898, 'Default', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'https://www.instagram.com/reel/Cn9O7VrJYmL/?igshid=YmMyMTA2M2Y=', '500', 675, '', '', '1', '0', 'done', '0', '2023-01-28 11:20:05', '2023-01-28 11:42:06'),
(171, 3, 3214901, 'Default', 'Instagram Views | Max 10M | Instant | Non Drop | 1M/Day |', 'https://www.instagram.com/reel/Cn9O7VrJYmL/?igshid=YmMyMTA2M2Y=', '10000', 350, '', '', '0', '0', 'done', '0', '2023-01-28 11:20:30', '2023-01-28 11:34:05'),
(172, 3, 3214917, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/ClNYmz-J5Em/?igshid=YmMyMTA2M2Y=', '500', 375, '', '', '10', '0', 'done', '0', '2023-01-28 11:24:08', '2023-01-28 11:44:05'),
(173, 3, 3214919, 'Default', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'https://www.instagram.com/p/Cn8ZjbYJYDk/?igshid=YmMyMTA2M2Y=', '500', 375, '', '', '3', '0', 'done', '0', '2023-01-28 11:24:36', '2023-01-28 11:44:06'),
(174, 6, 3215470, 'Default', 'Tiktok Like | Real | Max 10k | No Refill | 10k/Day |', 'https://vt.tiktok.com/ZS8DqJgkP/', '100', 500, '', '', NULL, '100', 'pending', '0', '2023-01-28 13:11:03', '2023-01-28 13:16:05'),
(175, 41, 3215818, 'Default', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 60D Refill | ♻️', 'https://www.instagram.com/thata.fashion/', '8350', 50000, '', '', '66', '0', 'done', '0', '2023-01-28 14:02:38', '2023-01-28 15:40:11'),
(176, 42, 3218280, 'Default', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', 'https://www.tiktok.com/@kotarakyatroleplay', '2000', 28728, '', '', '0', '0', 'pending', '0', '2023-01-28 23:24:05', '2023-01-28 23:24:05'),
(177, 38, 3218473, 'Default', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'east.blake_', '10000', 45000, '', '', NULL, '10000', 'pending', '0', '2023-01-29 01:03:59', '2023-01-29 01:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `history_refills`
--

CREATE TABLE `history_refills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `refill_id` int(11) NOT NULL,
  `layanan` text NOT NULL,
  `target` text NOT NULL,
  `status` enum('pending','process','done','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_refills`
--

INSERT INTO `history_refills` (`id`, `user_id`, `refill_id`, `layanan`, `target`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 11321, '23213', 'adad', 'done', '2022-12-04 13:05:29', '2022-12-04 13:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `log_balances`
--

CREATE TABLE `log_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `kategori` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `before_balance` int(11) NOT NULL,
  `after_balance` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_balances`
--

INSERT INTO `log_balances` (`id`, `user_id`, `type`, `kategori`, `jumlah`, `before_balance`, `after_balance`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kredit', 'order', 1000, 6555, 66511, 'asdad', '2022-12-07 09:15:02', '2022-12-07 09:15:02'),
(2, 1, 'Debit', 'deposit', 13166, 10026249, 10039415, 'Deposit saldo berhasil via Bank ', '2022-12-09 13:39:33', '2022-12-09 13:39:33'),
(3, 1, 'Kredit', 'order', 12100, 10039415, 10027315, 'Pembelian layanan Facebook Follower Profile  15 [ murah max 100k ] SLOW Berhasil', '2022-12-09 13:40:56', '2022-12-09 13:40:56'),
(4, 1, 'Kredit', 'order', 297000, 10027315, 9730315, 'Pembelian Clubhouse Followers 250 User Berhasil', '2022-12-10 01:44:18', '2022-12-10 01:44:18'),
(5, 1, 'Debit', 'order', 297000, 9730315, 9433315, 'Refund Order #132132', '2022-12-13 12:23:05', '2022-12-13 12:23:05'),
(6, 1, 'Debit', 'order', 12100, 9718215, 9730315, 'Refund Order #132132', '2022-12-13 12:23:56', '2022-12-13 12:23:56'),
(7, 1, 'Debit', 'order', 12100, 9718215, 9730315, 'Refund Order #385580', '2022-12-13 12:27:22', '2022-12-13 12:27:22'),
(8, 1, 'Debit', 'order', 297000, 9433315, 9730315, 'Refund Order #132132', '2022-12-13 12:30:03', '2022-12-13 12:30:03'),
(9, 1, 'Kredit', 'order', 1065, 9692319, 9691254, 'Pembelian Youtube Short Views | Suggested | Speed : Up To 10K/Day | No Drop | R30 | MAX 500K Berhasil', '2022-12-29 12:43:02', '2022-12-29 12:43:02'),
(10, 1, 'Debit', 'deposit', 10581, 0, 10581, 'Deposit saldo berhasil via Bank BCA', '2022-12-30 03:07:40', '2022-12-30 03:07:40'),
(11, 1, 'Kredit', 'order', 3000, 10581, 7581, 'Pembelian Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️ Berhasil', '2022-12-30 03:08:20', '2022-12-30 03:08:20'),
(12, 3, 'Kredit', 'order', 500, 33426, 32926, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️ Berhasil', '2022-12-30 08:40:06', '2022-12-30 08:40:06'),
(13, 3, 'Kredit', 'order', 560, 32926, 32366, 'Pembelian Instagram Likes | Good | Stable | Reach + Impression | No Drop | AR30 Berhasil', '2022-12-30 08:42:28', '2022-12-30 08:42:28'),
(14, 3, 'Kredit', 'order', 100, 32366, 32266, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️ Berhasil', '2022-12-30 08:43:43', '2022-12-30 08:43:43'),
(15, 3, 'Kredit', 'order', 500, 32266, 31766, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️ Berhasil', '2022-12-30 08:44:35', '2022-12-30 08:44:35'),
(16, 5, 'Kredit', 'order', 600, 4864, 4264, 'Pembelian Tiktok Likes | SuperInstant | Speed: 15K/Day | MAX 100K Berhasil', '2022-12-30 10:11:25', '2022-12-30 10:11:25'),
(17, 5, 'Kredit', 'order', 360, 4264, 3904, 'Pembelian TikTok Likes | New | HQ | Speed: Up To 20K/Day | No Refill | MAX 100K Berhasil', '2022-12-30 10:13:20', '2022-12-30 10:13:20'),
(18, 5, 'Kredit', 'order', 1500, 3904, 2404, 'Pembelian Tiktok Followers | Mix | Speed: Up To 20K/Day | AR30 | MAX 100K ♻️ Berhasil', '2022-12-30 10:17:29', '2022-12-30 10:17:29'),
(19, 5, 'Kredit', 'order', 1740, 2404, 664, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥⚡🔥 Berhasil', '2022-12-30 11:05:33', '2022-12-30 11:05:33'),
(20, 5, 'Kredit', 'order', 360, 664, 304, 'Pembelian TikTok Likes | New | HQ | Speed: Up To 20K/Day | No Refill | MAX 100K Berhasil', '2022-12-30 11:13:34', '2022-12-30 11:13:34'),
(21, 5, 'Kredit', 'order', 160, 304, 144, 'Pembelian TikTok Video Shares | Instant | Up To 1M/Day | R30 | MAX 30M Berhasil', '2022-12-30 11:15:12', '2022-12-30 11:15:12'),
(22, 3, 'Kredit', 'order', 71, 31766, 31696, 'Pembelian Instagram Likes | Mix | Fast | Cheap | R30 | MAX 10K Berhasil', '2022-12-30 11:27:04', '2022-12-30 11:27:04'),
(23, 3, 'Kredit', 'order', 57, 31696, 31640, 'Pembelian Instagram Likes | SuperFast | R45 | MAX 100K ♻️ ⚡️ Berhasil', '2022-12-30 13:50:43', '2022-12-30 13:50:43'),
(24, 3, 'Kredit', 'order', 500, 31640, 31140, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥⚡️ Berhasil', '2022-12-30 14:07:17', '2022-12-30 14:07:17'),
(25, 1, 'Kredit', 'order', 43, 7581, 7539, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2022-12-30 21:56:06', '2022-12-30 21:56:06'),
(26, 1, 'Kredit', 'order', 17, 7539, 7522, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2022-12-31 01:42:22', '2022-12-31 01:42:22'),
(27, 6, 'Kredit', 'order', 6000, 30531, 24531, 'Pembelian Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️  Berhasil', '2022-12-31 02:32:04', '2022-12-31 02:32:04'),
(28, 6, 'Kredit', 'order', 17000, 24531, 7531, 'Pembelian Tiktok Followers | Mix | Speed: Up To 20K/Day | AR30 | MAX 100K ♻️⛔🔥🔥 Berhasil', '2022-12-31 02:34:30', '2022-12-31 02:34:30'),
(29, 6, 'Kredit', 'order', 10000, 17531, 7531, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥 Berhasil', '2022-12-31 02:53:04', '2022-12-31 02:53:04'),
(30, 3, 'Kredit', 'order', 660, 31140, 30480, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2022-12-31 03:24:16', '2022-12-31 03:24:16'),
(31, 9, 'Kredit', 'order', 24000, 24000, 0, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥 Berhasil', '2022-12-31 04:08:19', '2022-12-31 04:08:19'),
(32, 3, 'Kredit', 'order', 2400, 30480, 28080, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2022-12-31 06:03:03', '2022-12-31 06:03:03'),
(33, 3, 'Kredit', 'order', 660, 28080, 27420, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2022-12-31 06:04:45', '2022-12-31 06:04:45'),
(34, 6, 'Kredit', 'order', 20000, 27531, 7531, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥 Berhasil', '2022-12-31 09:49:30', '2022-12-31 09:49:30'),
(35, 6, 'Kredit', 'order', 9500, 37531, 28031, 'Pembelian Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡ Berhasil', '2022-12-31 10:42:55', '2022-12-31 10:42:55'),
(36, 6, 'Kredit', 'order', 9500, 28031, 18531, 'Pembelian Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡ Berhasil', '2022-12-31 10:43:49', '2022-12-31 10:43:49'),
(37, 6, 'Kredit', 'order', 9500, 18531, 9031, 'Pembelian Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡ Berhasil', '2022-12-31 10:44:24', '2022-12-31 10:44:24'),
(38, 3, 'Kredit', 'order', 660, 27420, 26760, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2023-01-01 07:22:34', '2023-01-01 07:22:34'),
(39, 1, 'Kredit', 'order', 36, 7522, 7486, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2023-01-01 14:42:44', '2023-01-01 14:42:44'),
(40, 3, 'Kredit', 'order', 1200, 26760, 25560, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2023-01-02 01:56:13', '2023-01-02 01:56:13'),
(41, 6, 'Kredit', 'order', 10000, 19031, 9031, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥 Berhasil', '2023-01-03 11:36:39', '2023-01-03 11:36:39'),
(42, 6, 'Kredit', 'order', 20000, 24031, 4031, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥 Berhasil', '2023-01-03 14:13:47', '2023-01-03 14:13:47'),
(43, 4, 'Kredit', 'order', 10, 533, 524, 'Pembelian Instagram Likes | Cheapest | Fast | MAX 200K 🔥🔥⚡ Berhasil', '2023-01-04 07:17:35', '2023-01-04 07:17:35'),
(44, 4, 'Debit', 'deposit', 10978, 524, 11502, 'Deposit saldo berhasil via E-Wallet Gopay', '2023-01-04 07:29:44', '2023-01-04 07:29:44'),
(45, 4, 'Kredit', 'order', 85, 11502, 11417, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:08:59', '2023-01-04 08:08:59'),
(46, 4, 'Kredit', 'order', 85, 11417, 11332, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:10:31', '2023-01-04 08:10:31'),
(47, 4, 'Kredit', 'order', 43, 11332, 11290, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:11:21', '2023-01-04 08:11:21'),
(48, 4, 'Kredit', 'order', 85, 11290, 11205, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:11:43', '2023-01-04 08:11:43'),
(49, 4, 'Kredit', 'order', 85, 11205, 11120, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:12:30', '2023-01-04 08:12:30'),
(50, 4, 'Kredit', 'order', 85, 11120, 11035, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:14:49', '2023-01-04 08:14:49'),
(51, 4, 'Kredit', 'order', 85, 11035, 10950, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:16:02', '2023-01-04 08:16:02'),
(52, 4, 'Kredit', 'order', 85, 10950, 10865, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:16:43', '2023-01-04 08:16:43'),
(53, 4, 'Kredit', 'order', 85, 10865, 10780, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:17:02', '2023-01-04 08:17:02'),
(54, 4, 'Kredit', 'order', 85, 10780, 10695, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:17:21', '2023-01-04 08:17:21'),
(55, 4, 'Kredit', 'order', 85, 10695, 10610, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:17:48', '2023-01-04 08:17:48'),
(56, 4, 'Kredit', 'order', 85, 10610, 10525, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:19:31', '2023-01-04 08:19:31'),
(57, 4, 'Kredit', 'order', 85, 10525, 10440, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:20:30', '2023-01-04 08:20:30'),
(58, 4, 'Kredit', 'order', 85, 10440, 10355, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:21:25', '2023-01-04 08:21:25'),
(59, 4, 'Kredit', 'order', 85, 10355, 10270, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:21:41', '2023-01-04 08:21:41'),
(60, 3, 'Kredit', 'order', 600, 25560, 24960, 'Pembelian Instagram Likes | HQ | Speed: Up To 70K/Hour | Drop: 0-3% | No Refill | MAX 200K ⛔ Berhasil', '2023-01-04 08:22:51', '2023-01-04 08:22:51'),
(61, 4, 'Kredit', 'order', 85, 10270, 10185, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:24:25', '2023-01-04 08:24:25'),
(62, 4, 'Kredit', 'order', 85, 10185, 10100, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:24:57', '2023-01-04 08:24:57'),
(63, 4, 'Kredit', 'order', 85, 10100, 10015, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:25:10', '2023-01-04 08:25:10'),
(64, 4, 'Kredit', 'order', 85, 10015, 9930, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:25:27', '2023-01-04 08:25:27'),
(65, 4, 'Kredit', 'order', 85, 9930, 9845, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:25:40', '2023-01-04 08:25:40'),
(66, 4, 'Kredit', 'order', 85, 9845, 9760, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:25:58', '2023-01-04 08:25:58'),
(67, 4, 'Kredit', 'order', 85, 9760, 9675, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-04 08:26:27', '2023-01-04 08:26:27'),
(68, 4, 'Kredit', 'order', 43, 9675, 9633, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:06:04', '2023-01-05 04:06:04'),
(69, 4, 'Kredit', 'order', 43, 9633, 9591, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:06:51', '2023-01-05 04:06:51'),
(70, 4, 'Kredit', 'order', 43, 9591, 9549, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:07:34', '2023-01-05 04:07:34'),
(71, 4, 'Kredit', 'order', 43, 9549, 9507, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:09:14', '2023-01-05 04:09:14'),
(72, 4, 'Kredit', 'order', 43, 9507, 9465, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:15:20', '2023-01-05 04:15:20'),
(73, 4, 'Kredit', 'order', 43, 9465, 9423, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:16:06', '2023-01-05 04:16:06'),
(74, 4, 'Kredit', 'order', 43, 9423, 9381, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:17:00', '2023-01-05 04:17:00'),
(75, 4, 'Kredit', 'order', 43, 9381, 9339, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:19:10', '2023-01-05 04:19:10'),
(76, 4, 'Kredit', 'order', 43, 9339, 9297, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:19:27', '2023-01-05 04:19:27'),
(77, 4, 'Kredit', 'order', 43, 9297, 9255, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:20:20', '2023-01-05 04:20:20'),
(78, 4, 'Kredit', 'order', 43, 9255, 9213, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-05 04:20:35', '2023-01-05 04:20:35'),
(79, 5, 'Debit', 'deposit', 15281, 144, 15425, 'Deposit saldo berhasil via Bank BCA', '2023-01-05 22:57:51', '2023-01-05 22:57:51'),
(80, 5, 'Kredit', 'order', 8500, 15425, 6925, 'Pembelian Tiktok Followers | Mix | Speed: Up To 20K/Day | AR30 | MAX 100K ♻️⛔🔥🔥 Berhasil', '2023-01-06 03:46:55', '2023-01-06 03:46:55'),
(81, 6, 'Kredit', 'order', 6750, 39031, 32281, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥 Berhasil', '2023-01-06 06:43:18', '2023-01-06 06:43:18'),
(82, 6, 'Kredit', 'order', 6750, 32281, 25531, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥 Berhasil', '2023-01-06 06:44:06', '2023-01-06 06:44:06'),
(83, 6, 'Kredit', 'order', 6750, 25531, 18781, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥 Berhasil', '2023-01-06 07:01:43', '2023-01-06 07:01:43'),
(84, 6, 'Kredit', 'order', 6750, 18781, 12031, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥 Berhasil', '2023-01-06 07:02:26', '2023-01-06 07:02:26'),
(85, 6, 'Kredit', 'order', 6750, 12031, 5281, 'Pembelian Instagram Likes | HQ | Instant | Fast | No Refill | MAX 150K ⛔🔥⚡️🔥 Berhasil', '2023-01-06 07:02:51', '2023-01-06 07:02:51'),
(86, 4, 'Kredit', 'order', 85, 9213, 9128, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-06 07:45:04', '2023-01-06 07:45:04'),
(87, 4, 'Kredit', 'order', 85, 9128, 9043, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-06 07:45:48', '2023-01-06 07:45:48'),
(88, 13, 'Kredit', 'order', 5250, 28050, 22800, 'Pembelian Instagram Followers | Cheap | Fast | HQ | MAX 10K ⛔ ⚡️ Berhasil', '2023-01-06 14:06:48', '2023-01-06 14:06:48'),
(89, 13, 'Kredit', 'order', 6300, 22800, 16500, 'Pembelian Instagram Followers | Cheap | Fast | HQ | MAX 10K ⛔ ⚡️ Berhasil', '2023-01-06 14:32:02', '2023-01-06 14:32:02'),
(90, 13, 'Kredit', 'order', 15400, 16500, 1100, 'Pembelian Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️ 🔥⚡️ Berhasil', '2023-01-06 16:17:59', '2023-01-06 16:17:59'),
(91, 13, 'Kredit', 'order', 1100, 1100, 0, 'Pembelian Instagram Followers | HQ | Inastant | Fastest | R365 | MAX 1M ♻️ 🔥⚡️ Berhasil', '2023-01-07 15:49:12', '2023-01-07 15:49:12'),
(92, 6, 'Kredit', 'order', 40000, 45281, 5281, 'Pembelian TikTok Followers | HQ | Speed: Up To 50K/Day | R30 | MAX 150K ⚡🔥 Berhasil', '2023-01-09 08:12:36', '2023-01-09 08:12:36'),
(93, 4, 'Kredit', 'order', 85, 9043, 8958, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-09 09:22:23', '2023-01-09 09:22:23'),
(94, 4, 'Kredit', 'order', 85, 8958, 8873, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-09 09:22:49', '2023-01-09 09:22:49'),
(95, 4, 'Kredit', 'order', 85, 8873, 8788, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-09 09:23:59', '2023-01-09 09:23:59'),
(96, 4, 'Kredit', 'order', 85, 8788, 8703, 'Pembelian Instagram Likes | Work For Videos | Speed: Up To 50K/Day | MAX 300K 🔥 Berhasil', '2023-01-09 09:24:13', '2023-01-09 09:24:13'),
(97, 6, 'Kredit', 'order', 5000, 5281, 281, 'Pembelian Tiktok Views | NEW | Start Time: Instant | Speed: 100-500K/Day | No Drop | MAX 3M ⛔ Berhasil', '2023-01-09 12:21:04', '2023-01-09 12:21:04'),
(98, 1, 'Kredit', 'order', 54, 7486, 7432, 'Pembelian Instagram Like | Real | Max 200K | 500/Hour | Non Drop | No Refill | Berhasil', '2023-01-10 13:37:37', '2023-01-10 13:37:37'),
(99, 1, 'Kredit', 'order', 3498, 7432, 3934, 'Pembelian Pinterest Repins | Max 100k | No Refill | 1k-5k/Day | Berhasil', '2023-01-10 14:44:43', '2023-01-10 14:44:43'),
(100, 9, 'Kredit', 'order', 32212, 33000, 788, 'Pembelian Tiktok Followers | Real | Max 100k | 10k-20k/Day | 120 Days Refill | ♻️ Berhasil', '2023-01-11 19:11:02', '2023-01-11 19:11:02'),
(101, 3, 'Kredit', 'order', 500, 24960, 24460, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-12 05:06:53', '2023-01-12 05:06:53'),
(102, 6, 'Kredit', 'order', 17499, 20281, 2782, 'Pembelian Tiktok Followers | Real | Max 100k | 10k/Day | Low Drop | No Refill | Berhasil', '2023-01-12 09:18:34', '2023-01-12 09:18:34'),
(103, 4, 'Kredit', 'order', 125, 8703, 8578, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-16 02:55:19', '2023-01-16 02:55:19'),
(104, 4, 'Kredit', 'order', 125, 8578, 8453, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-16 02:55:36', '2023-01-16 02:55:36'),
(105, 4, 'Kredit', 'order', 125, 8453, 8328, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-16 02:56:07', '2023-01-16 02:56:07'),
(106, 6, 'Kredit', 'order', 11000, 12782, 1782, 'Pembelian Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️ Berhasil', '2023-01-16 03:30:18', '2023-01-16 03:30:18'),
(107, 6, 'Kredit', 'order', 1350, 1782, 432, 'Pembelian Instagram Followers | Real | Max 100K | 10k-20k/Day | No Refill |⛔	 Berhasil', '2023-01-16 03:31:18', '2023-01-16 03:31:18'),
(108, 4, 'Kredit', 'order', 125, 8328, 8203, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-16 09:35:39', '2023-01-16 09:35:39'),
(109, 4, 'Kredit', 'order', 125, 8203, 8078, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-16 09:36:00', '2023-01-16 09:36:00'),
(110, 4, 'Kredit', 'order', 125, 8078, 7953, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-16 09:36:14', '2023-01-16 09:36:14'),
(111, 6, 'Kredit', 'order', 55000, 55432, 432, 'Pembelian Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️ Berhasil', '2023-01-16 09:38:16', '2023-01-16 09:38:16'),
(112, 6, 'Kredit', 'order', 25843, 27432, 1589, 'Pembelian Tiktok Followers | Max 10K | Non Drop | 5k/Day | 30D Refill |♻️ Berhasil', '2023-01-17 06:19:34', '2023-01-17 06:19:34'),
(113, 4, 'Kredit', 'order', 125, 7953, 7828, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-17 07:27:06', '2023-01-17 07:27:06'),
(114, 1, 'Kredit', 'order', 500, 3934, 3434, 'Pembelian Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️ Berhasil', '2023-01-19 03:31:56', '2023-01-19 03:31:56'),
(115, 4, 'Kredit', 'order', 125, 7828, 7703, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-19 09:04:38', '2023-01-19 09:04:38'),
(116, 4, 'Kredit', 'order', 125, 7703, 7578, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-19 09:05:10', '2023-01-19 09:05:10'),
(117, 5, 'Kredit', 'order', 14364, 16925, 2561, 'Pembelian Tiktok Followers | Real | Max 1k | 1k/Day | No Refill | Berhasil', '2023-01-21 03:02:09', '2023-01-21 03:02:09'),
(118, 5, 'Kredit', 'order', 165, 2561, 2396, 'Pembelian Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️ Berhasil', '2023-01-21 05:48:57', '2023-01-21 05:48:57'),
(119, 5, 'Kredit', 'order', 450, 2396, 1946, 'Pembelian Instagram Followers | Max 1M | Non Drop | 50k/Day | 365 Days Refill♻️ Berhasil', '2023-01-21 05:51:50', '2023-01-21 05:51:50'),
(120, 6, 'Kredit', 'order', 1250, 1589, 339, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-21 19:09:40', '2023-01-21 19:09:40'),
(121, 4, 'Kredit', 'order', 125, 7578, 7453, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-23 07:57:55', '2023-01-23 07:57:55'),
(122, 4, 'Kredit', 'order', 125, 7453, 7328, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-23 07:58:31', '2023-01-23 07:58:31'),
(123, 4, 'Kredit', 'order', 125, 7328, 7203, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-23 07:58:59', '2023-01-23 07:58:59'),
(124, 4, 'Kredit', 'order', 125, 7203, 7078, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-23 07:59:20', '2023-01-23 07:59:20'),
(125, 4, 'Kredit', 'order', 125, 7078, 6953, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-24 01:28:43', '2023-01-24 01:28:43'),
(126, 21, 'Debit', 'deposit', 20533, 0, 20533, 'Deposit saldo berhasil via Bank BCA', '2023-01-24 08:33:06', '2023-01-24 08:33:06'),
(127, 21, 'Kredit', 'order', 135, 20533, 20398, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-24 08:37:05', '2023-01-24 08:37:05'),
(128, 21, 'Kredit', 'order', 374, 20398, 20024, 'Pembelian Instagram Reel+ IGTV Views | 1M/Day | Max 10M | Non Drop | Working | Berhasil', '2023-01-24 08:38:05', '2023-01-24 08:38:05'),
(129, 22, 'Debit', 'deposit', 25726, 0, 25726, 'Deposit saldo berhasil via Bank BCA', '2023-01-24 14:10:42', '2023-01-24 14:10:42'),
(130, 22, 'Kredit', 'order', 21546, 25726, 4180, 'Pembelian Tiktok Followers | Real | Max 1k | 1k/Day | No Refill | Berhasil', '2023-01-24 14:12:05', '2023-01-24 14:12:05'),
(131, 21, 'Kredit', 'order', 374, 20024, 19650, 'Pembelian Instagram Reel+ IGTV Views | 1M/Day | Max 10M | Non Drop | Working | Berhasil', '2023-01-24 21:22:00', '2023-01-24 21:22:00'),
(132, 24, 'Kredit', 'order', 5850, 50000, 44150, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-25 04:00:43', '2023-01-25 04:00:43'),
(133, 24, 'Kredit', 'order', 5850, 44150, 38300, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-25 04:01:14', '2023-01-25 04:01:14'),
(134, 24, 'Kredit', 'order', 5850, 38300, 32450, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-25 04:01:31', '2023-01-25 04:01:31'),
(135, 24, 'Kredit', 'order', 5850, 32450, 26600, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-25 04:01:43', '2023-01-25 04:01:43'),
(136, 24, 'Kredit', 'order', 5850, 26600, 20750, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-25 04:01:54', '2023-01-25 04:01:54'),
(137, 24, 'Kredit', 'order', 5850, 20750, 14900, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-25 04:02:07', '2023-01-25 04:02:07'),
(138, 25, 'Debit', 'deposit', 10477, 0, 10477, 'Deposit saldo berhasil via Bank BCA', '2023-01-25 04:35:18', '2023-01-25 04:35:18'),
(139, 25, 'Kredit', 'order', 10000, 10477, 477, 'Pembelian Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️ Berhasil', '2023-01-25 04:37:31', '2023-01-25 04:37:31'),
(140, 26, 'Debit', 'deposit', 10873, 0, 10873, 'Deposit saldo berhasil via Bank BCA', '2023-01-25 09:51:22', '2023-01-25 09:51:22'),
(141, 26, 'Kredit', 'order', 1000, 10873, 9873, 'Pembelian Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day | Berhasil', '2023-01-25 09:52:06', '2023-01-25 09:52:06'),
(142, 26, 'Kredit', 'order', 750, 9873, 9123, 'Pembelian Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day | Berhasil', '2023-01-25 10:01:53', '2023-01-25 10:01:53'),
(143, 26, 'Kredit', 'order', 625, 9123, 8498, 'Pembelian Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day | Berhasil', '2023-01-25 10:02:39', '2023-01-25 10:02:39'),
(144, 26, 'Kredit', 'order', 625, 8498, 7873, 'Pembelian Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day | Berhasil', '2023-01-25 10:05:14', '2023-01-25 10:05:14'),
(145, 27, 'Debit', 'deposit', 20329, 0, 20329, 'Deposit saldo berhasil via Bank BCA', '2023-01-25 15:07:20', '2023-01-25 15:07:20'),
(146, 27, 'Kredit', 'order', 14393, 20329, 5936, 'Pembelian Tiktok Followers | Real | Max 1k | 1k/Day | No Refill | Berhasil', '2023-01-25 15:08:07', '2023-01-25 15:08:07'),
(147, 24, 'Kredit', 'order', 444, 14900, 14456, 'Pembelian Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop Berhasil', '2023-01-25 15:58:25', '2023-01-25 15:58:25'),
(148, 24, 'Kredit', 'order', 135, 14456, 14321, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-25 16:01:07', '2023-01-25 16:01:07'),
(149, 1, 'Debit', 'order', 625, 7248, 7873, 'Refund Order #3193334', '2023-01-26 00:17:46', '2023-01-26 00:17:46'),
(150, 4, 'Kredit', 'order', 135, 6953, 6818, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-26 02:26:28', '2023-01-26 02:26:28'),
(151, 4, 'Kredit', 'order', 75, 6818, 6743, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-26 02:28:48', '2023-01-26 02:28:48'),
(152, 26, 'Kredit', 'order', 1999, 7873, 5874, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-26 03:11:49', '2023-01-26 03:11:49'),
(153, 24, 'Kredit', 'order', 68, 14321, 14253, 'Pembelian Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day | Berhasil', '2023-01-26 03:51:12', '2023-01-26 03:51:12'),
(154, 1, 'Debit', 'order', 68, 14185, 14253, 'Refund Order #3197993', '2023-01-26 04:01:55', '2023-01-26 04:01:55'),
(155, 24, 'Kredit', 'order', 81, 14253, 14172, 'Pembelian Instagram Reel Views + IGTV | 100M | Non Drop | 10M/Day | Berhasil', '2023-01-26 04:04:09', '2023-01-26 04:04:09'),
(156, 1, 'Debit', 'order', 81, 14091, 14172, 'Refund Order #3198075', '2023-01-26 04:05:10', '2023-01-26 04:05:10'),
(157, 24, 'Kredit', 'order', 160, 14172, 14012, 'Pembelian Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day | Berhasil', '2023-01-26 04:05:15', '2023-01-26 04:05:15'),
(158, 26, 'Kredit', 'order', 1125, 5874, 4749, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-26 04:34:16', '2023-01-26 04:34:16'),
(159, 26, 'Kredit', 'order', 750, 4749, 3999, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-26 04:34:49', '2023-01-26 04:34:49'),
(160, 26, 'Kredit', 'order', 1295, 3999, 2704, 'Pembelian Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day | Berhasil', '2023-01-26 04:36:44', '2023-01-26 04:36:44'),
(161, 26, 'Kredit', 'order', 740, 2704, 1964, 'Pembelian Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day | Berhasil', '2023-01-26 04:40:02', '2023-01-26 04:40:02'),
(162, 1, 'Debit', 'order', 160, 13852, 14012, 'Refund Order #3198082', '2023-01-26 04:41:05', '2023-01-26 04:41:05'),
(163, 6, 'Kredit', 'order', 15000, 15339, 339, 'Pembelian Tiktok Followers | Real | Max 5k | 5k/Day  Berhasil', '2023-01-26 13:03:38', '2023-01-26 13:03:38'),
(164, 6, 'Kredit', 'order', 100, 339, 239, 'Pembelian Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop Berhasil', '2023-01-27 02:57:14', '2023-01-27 02:57:14'),
(165, 4, 'Kredit', 'order', 75, 6743, 6668, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-27 03:15:26', '2023-01-27 03:15:26'),
(166, 6, 'Kredit', 'order', 100, 239, 139, 'Pembelian Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop Berhasil', '2023-01-27 03:29:32', '2023-01-27 03:29:32'),
(167, 24, 'Kredit', 'order', 87, 14012, 13925, 'Pembelian Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day | Berhasil', '2023-01-27 03:43:43', '2023-01-27 03:43:43'),
(168, 6, 'Kredit', 'order', 13500, 15139, 1639, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-27 06:08:19', '2023-01-27 06:08:19'),
(169, 6, 'Kredit', 'order', 875, 1639, 764, 'Pembelian Instagram Followers | Max 10k | 10k/day | No Refill Berhasil', '2023-01-27 06:10:56', '2023-01-27 06:10:56'),
(170, 1, 'Debit', 'order', 87, 13838, 13925, 'Refund Order #3204582', '2023-01-27 07:15:47', '2023-01-27 07:15:47'),
(171, 24, 'Kredit', 'order', 151, 13925, 13774, 'Pembelian Instagram Views | Max 10M | Instant | Non Drop | 1M/Day | Berhasil', '2023-01-27 07:21:19', '2023-01-27 07:21:19'),
(172, 1, 'Debit', 'order', 151, 13623, 13774, 'Refund Order #3205867', '2023-01-27 07:38:40', '2023-01-27 07:38:40'),
(173, 35, 'Debit', 'deposit', 15249, 0, 15249, 'Deposit saldo berhasil via Bank BCA', '2023-01-27 10:34:35', '2023-01-27 10:34:35'),
(174, 35, 'Kredit', 'order', 15000, 15249, 249, 'Pembelian Tiktok Followers | Real | Max 5k | 5k/Day  Berhasil', '2023-01-27 10:36:40', '2023-01-27 10:36:40'),
(175, 24, 'Kredit', 'order', 87, 13774, 13687, 'Pembelian Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day | Berhasil', '2023-01-27 10:52:35', '2023-01-27 10:52:35'),
(176, 24, 'Kredit', 'order', 160, 13687, 13527, 'Pembelian Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day | Berhasil', '2023-01-27 10:53:47', '2023-01-27 10:53:47'),
(177, 4, 'Kredit', 'order', 100, 6668, 6568, 'Pembelian Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop Berhasil', '2023-01-28 00:43:20', '2023-01-28 00:43:20'),
(178, 1, 'Debit', 'order', 160, 13367, 13527, 'Refund Order #3207111', '2023-01-28 02:09:18', '2023-01-28 02:09:18'),
(179, 1, 'Debit', 'order', 87, 13440, 13527, 'Refund Order #3207105', '2023-01-28 02:09:38', '2023-01-28 02:09:38'),
(180, 6, 'Kredit', 'order', 11100, 50764, 39664, 'Pembelian Instagram Followers | Max 500K | 10-30% Drop | 10k-50k/Day | 365D Refill | ♻️	 Berhasil', '2023-01-28 02:55:12', '2023-01-28 02:55:12'),
(181, 6, 'Kredit', 'order', 45000, 49664, 4664, 'Pembelian Instagram Followers | Max 1M | Non Drop | 50k/Day | 365 Days Refill♻️ Berhasil', '2023-01-28 03:13:47', '2023-01-28 03:13:47'),
(182, 37, 'Debit', 'deposit', 20708, 0, 20708, 'Deposit saldo berhasil via Bank BCA', '2023-01-28 04:12:30', '2023-01-28 04:12:30'),
(183, 37, 'Kredit', 'order', 1000, 20708, 19708, 'Pembelian Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️ Berhasil', '2023-01-28 04:13:31', '2023-01-28 04:13:31'),
(184, 30, 'Debit', 'deposit', 50525, 0, 50525, 'Deposit saldo berhasil via Bank BCA', '2023-01-28 04:14:01', '2023-01-28 04:14:01'),
(185, 30, 'Kredit', 'order', 17499, 50525, 33026, 'Pembelian Tiktok Followers | Real | Max 100k | 10k/Day | Low Drop | No Refill | Berhasil', '2023-01-28 04:32:45', '2023-01-28 04:32:45'),
(186, 38, 'Debit', 'deposit', 50664, 0, 50664, 'Deposit saldo berhasil via Bank BCA', '2023-01-28 06:21:28', '2023-01-28 06:21:28'),
(187, 39, 'Debit', 'deposit', 20543, 0, 20543, 'Deposit saldo berhasil via E-Wallet OVO', '2023-01-28 06:23:46', '2023-01-28 06:23:46'),
(188, 39, 'Kredit', 'order', 11976, 20543, 8567, 'Pembelian Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 60D Refill | ♻️ Berhasil', '2023-01-28 06:38:01', '2023-01-28 06:38:01'),
(189, 38, 'Kredit', 'order', 27000, 50664, 23664, 'Pembelian Instagram Followers | Real | Max 100K | 10k-20k/Day | No Refill |⛔	 Berhasil', '2023-01-28 06:40:08', '2023-01-28 06:40:08'),
(190, 38, 'Kredit', 'order', 11123, 23664, 12541, 'Pembelian Instagram Followers | Bot | Max 10k | 10k/day | No Refill | Berhasil', '2023-01-28 06:46:26', '2023-01-28 06:46:26'),
(191, 39, 'Kredit', 'order', 135, 8567, 8432, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:48:28', '2023-01-28 06:48:28'),
(192, 39, 'Kredit', 'order', 135, 8432, 8297, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:48:58', '2023-01-28 06:48:58'),
(193, 39, 'Kredit', 'order', 135, 8297, 8162, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:49:40', '2023-01-28 06:49:40'),
(194, 39, 'Kredit', 'order', 270, 8162, 7892, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:51:36', '2023-01-28 06:51:36'),
(195, 39, 'Kredit', 'order', 135, 7892, 7757, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:54:07', '2023-01-28 06:54:07'),
(196, 39, 'Kredit', 'order', 675, 7757, 7082, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:54:53', '2023-01-28 06:54:53'),
(197, 39, 'Kredit', 'order', 675, 7082, 6407, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 06:55:27', '2023-01-28 06:55:27'),
(198, 38, 'Kredit', 'order', 12315, 12541, 226, 'Pembelian Instagram Followers | Bot | Max 10k | 10k/day | No Refill | Berhasil', '2023-01-28 07:05:04', '2023-01-28 07:05:04'),
(199, 39, 'Kredit', 'order', 4309, 6407, 2098, 'Pembelian Tiktok Followers | Real | Max 1k | 1k/Day | No Refill | Berhasil', '2023-01-28 07:26:57', '2023-01-28 07:26:57'),
(200, 3, 'Kredit', 'order', 675, 24460, 23785, 'Pembelian Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill | Berhasil', '2023-01-28 11:20:05', '2023-01-28 11:20:05'),
(201, 3, 'Kredit', 'order', 350, 23785, 23435, 'Pembelian Instagram Views | Max 10M | Instant | Non Drop | 1M/Day | Berhasil', '2023-01-28 11:20:30', '2023-01-28 11:20:30'),
(202, 3, 'Kredit', 'order', 375, 23435, 23060, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-28 11:24:08', '2023-01-28 11:24:08'),
(203, 3, 'Kredit', 'order', 375, 23060, 22685, 'Pembelian Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️ Berhasil', '2023-01-28 11:24:36', '2023-01-28 11:24:36'),
(204, 6, 'Kredit', 'order', 500, 4664, 4164, 'Pembelian Tiktok Like | Real | Max 10k | No Refill | 10k/Day | Berhasil', '2023-01-28 13:11:03', '2023-01-28 13:11:03'),
(205, 41, 'Debit', 'deposit', 50547, 0, 50547, 'Deposit saldo berhasil via E-Wallet OVO', '2023-01-28 13:56:32', '2023-01-28 13:56:32'),
(206, 41, 'Kredit', 'order', 50000, 50547, 547, 'Pembelian Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 60D Refill | ♻️ Berhasil', '2023-01-28 14:02:38', '2023-01-28 14:02:38'),
(207, 38, 'Debit', 'deposit', 121903, 226, 122129, 'Deposit saldo berhasil via Bank BCA', '2023-01-28 23:10:07', '2023-01-28 23:10:07'),
(208, 42, 'Debit', 'deposit', 30559, 0, 30559, 'Deposit saldo berhasil via Bank BCA', '2023-01-28 23:10:37', '2023-01-28 23:10:37'),
(209, 42, 'Kredit', 'order', 28728, 30559, 1831, 'Pembelian Tiktok Followers | Real | Max 1k | 1k/Day | No Refill | Berhasil', '2023-01-28 23:24:05', '2023-01-28 23:24:05'),
(210, 38, 'Kredit', 'order', 45000, 122129, 77129, 'Pembelian Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️ Berhasil', '2023-01-29 01:03:59', '2023-01-29 01:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `log_masuk`
--

CREATE TABLE `log_masuk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_masuk`
--

INSERT INTO `log_masuk` (`id`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 05:38:33', '2022-12-08 05:38:33'),
(2, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-08 13:18:05', '2022-12-08 13:18:05'),
(3, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-27 09:44:55', '2022-12-27 09:44:55'),
(4, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-27 09:45:06', '2022-12-27 09:45:06'),
(5, 10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-27 10:13:58', '2022-12-27 10:13:58'),
(6, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-28 05:41:43', '2022-12-28 05:41:43'),
(7, 1, '111.94.173.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-29 14:13:23', '2022-12-29 14:13:23'),
(8, 1, '116.206.14.62', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-30 00:51:52', '2022-12-30 00:51:52'),
(9, 1, '116.206.14.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 01:08:57', '2022-12-30 01:08:57'),
(10, 2, '111.94.173.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-30 01:38:15', '2022-12-30 01:38:15'),
(11, 1, '114.142.172.29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 02:39:43', '2022-12-30 02:39:43'),
(12, 3, '36.69.242.70', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi 9A Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/100.0.4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/13.20.0-gn', '2022-12-30 03:46:55', '2022-12-30 03:46:55'),
(13, 3, '36.69.242.70', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi 9A Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/100.0.4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/13.20.0-gn', '2022-12-30 03:47:38', '2022-12-30 03:47:38'),
(14, 3, '36.69.242.70', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi 9A Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/100.0.4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/13.20.0-gn', '2022-12-30 03:50:20', '2022-12-30 03:50:20'),
(15, 1, '116.206.14.23', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-30 03:56:15', '2022-12-30 03:56:15'),
(16, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-30 03:57:47', '2022-12-30 03:57:47'),
(17, 1, '116.206.14.55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 05:56:33', '2022-12-30 05:56:33'),
(18, 1, '116.206.15.41', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-30 08:02:27', '2022-12-30 08:02:27'),
(19, 1, '116.206.15.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 08:19:28', '2022-12-30 08:19:28'),
(20, 1, '116.206.15.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 08:33:53', '2022-12-30 08:33:53'),
(21, 5, '202.67.34.23', 'Mozilla/5.0 (Linux; Android 9; ASUS_X01BDA) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-30 08:58:07', '2022-12-30 08:58:07'),
(22, 6, '182.1.117.13', 'Mozilla/5.0 (Linux; Android 12; CPH2357) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-30 09:38:31', '2022-12-30 09:38:31'),
(23, 1, '116.206.14.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 14:06:32', '2022-12-30 14:06:32'),
(24, 1, '116.206.14.57', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-30 14:35:32', '2022-12-30 14:35:32'),
(25, 8, '202.67.44.11', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2022-12-30 16:47:37', '2022-12-30 16:47:37'),
(26, 1, '116.206.14.8', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-30 21:32:34', '2022-12-30 21:32:34'),
(27, 1, '116.206.14.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-30 21:34:58', '2022-12-30 21:34:58'),
(28, 1, '116.206.14.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-31 01:32:27', '2022-12-31 01:32:27'),
(29, 1, '114.142.172.23', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-31 02:02:13', '2022-12-31 02:02:13'),
(30, 6, '182.1.72.139', 'Mozilla/5.0 (Linux; Android 12; CPH2357) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-31 02:30:55', '2022-12-31 02:30:55'),
(31, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-31 02:42:31', '2022-12-31 02:42:31'),
(32, 9, '182.3.39.106', 'Mozilla/5.0 (Linux; Android 12; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-31 03:53:09', '2022-12-31 03:53:09'),
(33, 1, '116.206.14.59', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-31 05:18:32', '2022-12-31 05:18:32'),
(34, 1, '116.206.14.39', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2022-12-31 08:21:12', '2022-12-31 08:21:12'),
(35, 6, '182.1.85.42', 'Mozilla/5.0 (Linux; Android 12; CPH2357) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-31 08:35:22', '2022-12-31 08:35:22'),
(36, 9, '139.193.70.69', 'Mozilla/5.0 (Linux; Android 12; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-31 08:46:41', '2022-12-31 08:46:41'),
(37, 1, '116.206.14.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-31 10:15:21', '2022-12-31 10:15:21'),
(38, 1, '116.206.14.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-31 11:02:54', '2022-12-31 11:02:54'),
(39, 9, '182.0.165.52', 'Mozilla/5.0 (Linux; Android 12; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2022-12-31 11:08:33', '2022-12-31 11:08:33'),
(40, 1, '156.146.35.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2022-12-31 14:54:25', '2022-12-31 14:54:25'),
(41, 1, '116.206.15.31', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-01 04:34:36', '2023-01-01 04:34:36'),
(42, 1, '116.206.14.50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-01 04:42:42', '2023-01-01 04:42:42'),
(43, 1, '116.206.15.58', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-01 09:00:07', '2023-01-01 09:00:07'),
(44, 1, '114.142.172.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-01 11:06:52', '2023-01-01 11:06:52'),
(45, 1, '114.142.172.19', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-01 13:20:14', '2023-01-01 13:20:14'),
(46, 1, '116.206.14.5', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-02 00:08:54', '2023-01-02 00:08:54'),
(47, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-02 01:44:43', '2023-01-02 01:44:43'),
(48, 1, '116.206.14.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-02 06:07:02', '2023-01-02 06:07:02'),
(49, 1, '116.206.14.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-02 14:50:01', '2023-01-02 14:50:01'),
(50, 1, '116.206.14.23', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-02 15:37:41', '2023-01-02 15:37:41'),
(51, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-03 01:21:50', '2023-01-03 01:21:50'),
(52, 1, '116.206.14.27', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-03 01:45:13', '2023-01-03 01:45:13'),
(53, 1, '116.206.14.27', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-03 06:41:41', '2023-01-03 06:41:41'),
(54, 1, '116.206.14.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-03 07:18:33', '2023-01-03 07:18:33'),
(55, 1, '116.206.14.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-03 09:43:06', '2023-01-03 09:43:06'),
(56, 1, '116.206.15.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-03 10:30:26', '2023-01-03 10:30:26'),
(57, 1, '116.206.15.25', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-03 11:26:00', '2023-01-03 11:26:00'),
(58, 1, '116.206.14.51', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-03 23:35:35', '2023-01-03 23:35:35'),
(59, 1, '116.206.14.37', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-04 04:18:27', '2023-01-04 04:18:27'),
(60, 4, '110.232.85.199', 'Mozilla/5.0 (Linux; Android 12; TECNO LG8n) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', '2023-01-04 07:15:36', '2023-01-04 07:15:36'),
(61, 1, '114.142.173.44', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-04 07:25:29', '2023-01-04 07:25:29'),
(62, 1, '114.142.173.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-04 07:28:58', '2023-01-04 07:28:58'),
(63, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-04 08:07:32', '2023-01-04 08:07:32'),
(64, 1, '116.206.14.40', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-05 00:18:15', '2023-01-05 00:18:15'),
(65, 1, '116.206.14.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-05 02:08:42', '2023-01-05 02:08:42'),
(66, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-05 04:04:51', '2023-01-05 04:04:51'),
(67, 10, '125.166.9.41', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Mobile/15E148 Safari/604.1', '2023-01-05 06:20:00', '2023-01-05 06:20:00'),
(68, 1, '116.206.14.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-05 08:17:11', '2023-01-05 08:17:11'),
(69, 1, '116.206.14.26', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-05 22:57:24', '2023-01-05 22:57:24'),
(70, 7, '116.206.36.15', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-06 01:39:14', '2023-01-06 01:39:14'),
(71, 1, '116.206.14.15', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-06 02:31:49', '2023-01-06 02:31:49'),
(72, 11, '2404:c0:7040::50:404f', 'Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.40 Mobile Safari/537.36', '2023-01-06 02:34:16', '2023-01-06 02:34:16'),
(73, 1, '114.142.172.19', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-06 06:40:01', '2023-01-06 06:40:01'),
(74, 1, '114.142.172.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-06 06:50:02', '2023-01-06 06:50:02'),
(75, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-06 07:44:02', '2023-01-06 07:44:02'),
(76, 1, '116.206.15.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-06 11:36:33', '2023-01-06 11:36:33'),
(77, 12, '114.10.22.69', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-06 13:21:16', '2023-01-06 13:21:16'),
(78, 1, '114.142.173.19', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-06 13:22:12', '2023-01-06 13:22:12'),
(79, 13, '114.10.22.69', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-06 13:23:00', '2023-01-06 13:23:00'),
(80, 13, '114.10.22.69', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-06 13:30:52', '2023-01-06 13:30:52'),
(81, 13, '114.10.22.69', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-06 13:38:29', '2023-01-06 13:38:29'),
(82, 1, '116.206.14.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-06 14:07:31', '2023-01-06 14:07:31'),
(83, 14, '140.213.219.120', 'Mozilla/5.0 (Linux; Android 12; M2012K11AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-06 16:04:50', '2023-01-06 16:04:50'),
(84, 7, '116.206.36.43', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-06 17:11:12', '2023-01-06 17:11:12'),
(85, 1, '114.142.172.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-06 22:12:48', '2023-01-06 22:12:48'),
(86, 15, '2001:448a:7025:1c77:28a6:adb9:af25:5186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-06 23:01:02', '2023-01-06 23:01:02'),
(87, 7, '116.206.36.8', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-07 06:05:28', '2023-01-07 06:05:28'),
(88, 1, '116.206.14.11', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-07 13:01:25', '2023-01-07 13:01:25'),
(89, 13, '114.10.6.241', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-07 13:24:31', '2023-01-07 13:24:31'),
(90, 13, '114.10.6.241', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-07 15:48:07', '2023-01-07 15:48:07'),
(91, 1, '116.206.14.36', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-07 19:47:44', '2023-01-07 19:47:44'),
(92, 1, '116.206.15.40', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-08 01:03:59', '2023-01-08 01:03:59'),
(93, 16, '111.95.15.243', 'Mozilla/5.0 (Linux; Android 12; 21061110AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-08 15:22:00', '2023-01-08 15:22:00'),
(94, 1, '116.206.15.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-09 05:04:17', '2023-01-09 05:04:17'),
(95, 1, '116.206.15.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-09 05:09:42', '2023-01-09 05:09:42'),
(96, 7, '202.67.45.3', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-09 06:48:40', '2023-01-09 06:48:40'),
(97, 1, '116.206.14.2', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-09 07:09:04', '2023-01-09 07:09:04'),
(98, 7, '116.206.36.56', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-09 07:50:12', '2023-01-09 07:50:12'),
(99, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-09 09:22:04', '2023-01-09 09:22:04'),
(100, 1, '114.142.173.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54', '2023-01-09 09:50:13', '2023-01-09 09:50:13'),
(101, 7, '116.206.36.44', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-09 13:53:51', '2023-01-09 13:53:51'),
(102, 1, '116.206.15.21', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-09 15:17:30', '2023-01-09 15:17:30'),
(103, 17, '120.188.67.200', 'Mozilla/5.0 (Linux; Android 8.1.0; COL-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5359.128 Mobile Safari/537.36', '2023-01-10 04:00:11', '2023-01-10 04:00:11'),
(104, 1, '116.206.15.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-10 07:19:11', '2023-01-10 07:19:11'),
(105, 1, '116.206.14.31', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-10 12:17:24', '2023-01-10 12:17:24'),
(106, 1, '116.206.14.31', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-10 12:29:01', '2023-01-10 12:29:01'),
(107, 1, '116.206.14.31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-10 13:16:43', '2023-01-10 13:16:43'),
(108, 7, '202.67.44.15', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-11 05:58:58', '2023-01-11 05:58:58'),
(109, 1, '116.206.14.16', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-11 10:59:30', '2023-01-11 10:59:30'),
(110, 9, '202.92.201.62', 'Mozilla/5.0 (Linux; Android 13; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-11 11:18:53', '2023-01-11 11:18:53'),
(111, 2, '111.94.173.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-11 11:36:24', '2023-01-11 11:36:24'),
(112, 1, '116.206.14.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-11 12:50:15', '2023-01-11 12:50:15'),
(113, 9, '202.92.201.62', 'Mozilla/5.0 (Linux; Android 13; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-11 15:47:50', '2023-01-11 15:47:50'),
(114, 1, '116.206.14.54', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-11 19:01:22', '2023-01-11 19:01:22'),
(115, 9, '114.124.247.210', 'Mozilla/5.0 (Linux; Android 13; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-11 19:09:59', '2023-01-11 19:09:59'),
(116, 1, '116.206.15.40', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-12 06:23:43', '2023-01-12 06:23:43'),
(117, 1, '116.206.14.48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-12 09:26:18', '2023-01-12 09:26:18'),
(118, 1, '114.142.173.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-12 13:20:13', '2023-01-12 13:20:13'),
(119, 7, '116.206.36.50', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-12 15:46:51', '2023-01-12 15:46:51'),
(120, 1, '116.206.14.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-13 12:54:35', '2023-01-13 12:54:35'),
(121, 1, '114.142.173.47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-14 00:12:52', '2023-01-14 00:12:52'),
(122, 1, '116.206.14.3', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-14 07:57:59', '2023-01-14 07:57:59'),
(123, 1, '116.206.15.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-14 12:20:19', '2023-01-14 12:20:19'),
(124, 18, '110.232.95.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '2023-01-14 12:45:11', '2023-01-14 12:45:11'),
(125, 13, '114.10.4.71', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-15 07:44:22', '2023-01-15 07:44:22'),
(126, 1, '116.206.14.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-15 11:23:38', '2023-01-15 11:23:38'),
(127, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-16 02:53:51', '2023-01-16 02:53:51'),
(128, 1, '116.206.14.44', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-16 03:25:37', '2023-01-16 03:25:37'),
(129, 7, '116.206.36.41', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-16 05:30:10', '2023-01-16 05:30:10'),
(130, 1, '116.206.14.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', '2023-01-16 06:42:31', '2023-01-16 06:42:31'),
(131, 1, '114.142.173.62', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-16 09:30:21', '2023-01-16 09:30:21'),
(132, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-16 09:35:19', '2023-01-16 09:35:19'),
(133, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2023-01-17 07:26:36', '2023-01-17 07:26:36'),
(134, 1, '114.142.173.2', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-18 05:10:09', '2023-01-18 05:10:09'),
(135, 1, '51.158.166.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.55', '2023-01-19 03:12:05', '2023-01-19 03:12:05'),
(136, 1, '116.206.14.2', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-19 03:56:16', '2023-01-19 03:56:16'),
(137, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-19 09:04:04', '2023-01-19 09:04:04'),
(138, 1, '116.206.14.63', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-19 09:14:13', '2023-01-19 09:14:13'),
(139, 1, '116.206.14.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.55', '2023-01-19 09:16:05', '2023-01-19 09:16:05'),
(140, 1, '116.206.15.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.55', '2023-01-19 12:35:19', '2023-01-19 12:35:19'),
(141, 1, '116.206.15.29', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-20 09:44:41', '2023-01-20 09:44:41'),
(142, 1, '116.206.14.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.55', '2023-01-21 02:14:19', '2023-01-21 02:14:19'),
(143, 1, '116.206.15.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.55', '2023-01-21 08:04:05', '2023-01-21 08:04:05'),
(144, 7, '116.206.36.11', 'Mozilla/5.0 (Linux; Android 9; RMX1821) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36', '2023-01-22 06:10:42', '2023-01-22 06:10:42'),
(145, 1, '116.206.14.60', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-22 16:35:08', '2023-01-22 16:35:08'),
(146, 1, '116.206.14.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-23 02:26:12', '2023-01-23 02:26:12'),
(147, 1, '116.206.14.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-23 03:26:43', '2023-01-23 03:26:43'),
(148, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-23 07:57:28', '2023-01-23 07:57:28'),
(149, 1, '116.206.14.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-23 10:27:36', '2023-01-23 10:27:36'),
(150, 1, '114.142.173.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-23 13:42:28', '2023-01-23 13:42:28'),
(151, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-24 01:28:23', '2023-01-24 01:28:23'),
(152, 1, '116.206.14.27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-24 01:44:25', '2023-01-24 01:44:25'),
(153, 1, '116.206.14.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-24 02:24:28', '2023-01-24 02:24:28'),
(154, 1, '116.206.14.29', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-24 02:54:30', '2023-01-24 02:54:30'),
(155, 1, '116.206.14.29', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-24 07:02:25', '2023-01-24 07:02:25'),
(156, 1, '116.206.15.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-24 07:06:19', '2023-01-24 07:06:19'),
(157, 20, '103.93.236.49', 'Mozilla/5.0 (Linux; Android 12; V2040) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-24 07:09:54', '2023-01-24 07:09:54'),
(158, 20, '103.93.236.49', 'Mozilla/5.0 (Linux; Android 12; V2040) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-24 07:10:35', '2023-01-24 07:10:35'),
(159, 19, '182.253.126.106', 'Mozilla/5.0 (Linux; Android 11; CPH2239) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-24 07:12:10', '2023-01-24 07:12:10'),
(160, 21, '182.1.210.39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1', '2023-01-24 08:28:57', '2023-01-24 08:28:57'),
(161, 1, '116.206.15.49', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-24 08:32:54', '2023-01-24 08:32:54'),
(162, 1, '116.206.14.42', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-24 11:33:39', '2023-01-24 11:33:39'),
(163, 22, '180.242.184.67', 'Mozilla/5.0 (Linux; Android 11; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', '2023-01-24 13:03:41', '2023-01-24 13:03:41'),
(164, 23, '36.82.96.189', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Mobile/15E148 Safari/604.1', '2023-01-24 14:37:09', '2023-01-24 14:37:09'),
(165, 21, '182.1.178.52', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1', '2023-01-24 21:21:25', '2023-01-24 21:21:25'),
(166, 1, '116.206.14.41', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-25 02:40:14', '2023-01-25 02:40:14'),
(167, 24, '2001:448a:5020:e8b2:65:5727:9f82:b412', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-25 03:52:41', '2023-01-25 03:52:41'),
(168, 25, '182.3.36.175', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-25 04:10:16', '2023-01-25 04:10:16'),
(169, 25, '182.3.36.175', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-25 04:27:28', '2023-01-25 04:27:28'),
(170, 25, '182.3.36.175', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-25 04:28:24', '2023-01-25 04:28:24'),
(171, 1, '116.206.14.63', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-25 09:42:43', '2023-01-25 09:42:43'),
(172, 26, '119.110.68.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-25 09:43:50', '2023-01-25 09:43:50'),
(173, 1, '116.206.14.45', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Mobile/15E148 Safari/604.1', '2023-01-25 10:20:13', '2023-01-25 10:20:13'),
(174, 1, '116.206.14.61', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-25 12:34:48', '2023-01-25 12:34:48'),
(175, 1, '116.206.14.49', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-25 15:04:08', '2023-01-25 15:04:08'),
(176, 27, '180.214.232.74', 'Mozilla/5.0 (Linux; Android 13; SM-A525F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-25 15:04:34', '2023-01-25 15:04:34'),
(177, 28, '36.71.83.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-25 15:51:24', '2023-01-25 15:51:24'),
(178, 24, '180.253.163.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-25 15:54:20', '2023-01-25 15:54:20'),
(179, 1, '116.206.14.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-26 00:16:02', '2023-01-26 00:16:02'),
(180, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-26 02:20:22', '2023-01-26 02:20:22'),
(181, 29, '180.243.3.176', 'Mozilla/5.0 (Linux; Android 11; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-26 02:20:27', '2023-01-26 02:20:27'),
(182, 26, '119.110.68.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-26 03:09:10', '2023-01-26 03:09:10'),
(183, 24, '2001:448a:5020:7448:9492:8950:d0b0:2272', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-26 03:50:33', '2023-01-26 03:50:33'),
(184, 1, '116.206.14.13', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-26 03:59:04', '2023-01-26 03:59:04'),
(185, 1, '116.206.14.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-26 04:00:52', '2023-01-26 04:00:52'),
(186, 1, '116.206.14.8', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-26 10:27:19', '2023-01-26 10:27:19'),
(187, 1, '116.206.14.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-26 10:28:42', '2023-01-26 10:28:42'),
(188, 28, '36.71.83.122', 'Mozilla/5.0 (Linux; Android 11) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-26 11:22:56', '2023-01-26 11:22:56'),
(189, 2, '111.94.173.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-26 11:53:26', '2023-01-26 11:53:26'),
(190, 30, '114.5.210.120', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-26 12:52:13', '2023-01-26 12:52:13'),
(191, 1, '116.206.14.41', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-26 13:00:32', '2023-01-26 13:00:32'),
(192, 32, '2001:448a:6060:41c1:a883:4186:23a4:1ceb', 'Mozilla/5.0 (Linux; U; Android 12; en-gb; Redmi 10 Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/100.0.4896.127 Mobile Safari/537.36 XiaoMi/MiuiBrowser/13.22.1-gn', '2023-01-26 14:02:32', '2023-01-26 14:02:32'),
(193, 1, '51.15.70.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-26 15:04:43', '2023-01-26 15:04:43'),
(194, 28, '36.71.81.142', 'Mozilla/5.0 (Linux; Android 11) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-26 15:06:17', '2023-01-26 15:06:17'),
(195, 33, '103.136.58.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-26 16:41:30', '2023-01-26 16:41:30'),
(196, 13, '2404:c0:7140::24f7:3a38', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-26 16:46:03', '2023-01-26 16:46:03'),
(197, 4, '110.232.85.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 03:15:11', '2023-01-27 03:15:11'),
(198, 24, '2001:448a:5020:7448:bcdb:3f92:5e39:ce29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 03:42:57', '2023-01-27 03:42:57'),
(199, 1, '114.142.173.40', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-27 05:58:53', '2023-01-27 05:58:53'),
(200, 1, '114.142.172.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-27 07:15:06', '2023-01-27 07:15:06'),
(201, 24, '180.246.228.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 07:20:10', '2023-01-27 07:20:10'),
(202, 34, '2001:448a:4041:4cc8:61ec:564d:4a2e:5eb3', 'Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-27 08:06:34', '2023-01-27 08:06:34'),
(203, 35, '180.243.8.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 10:22:38', '2023-01-27 10:22:38'),
(204, 1, '116.206.14.42', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-27 10:34:06', '2023-01-27 10:34:06'),
(205, 24, '180.246.228.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 10:46:21', '2023-01-27 10:46:21'),
(206, 35, '180.243.8.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 13:14:50', '2023-01-27 13:14:50'),
(207, 36, '2001:448a:1103:13a9:61a7:8e79:e1a6:a931', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-27 16:40:26', '2023-01-27 16:40:26'),
(208, 4, '114.10.66.27', 'Mozilla/5.0 (Linux; Android 12; TECNO LG8n) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', '2023-01-28 00:42:04', '2023-01-28 00:42:04'),
(209, 1, '116.206.14.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-28 02:02:22', '2023-01-28 02:02:22'),
(210, 30, '114.5.249.86', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', '2023-01-28 02:27:16', '2023-01-28 02:27:16'),
(211, 1, '116.206.14.8', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-28 02:53:47', '2023-01-28 02:53:47'),
(212, 37, '182.1.71.232', 'Mozilla/5.0 (Linux; Android 7.1.1; CPH1729) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Mobile Safari/537.36', '2023-01-28 03:49:44', '2023-01-28 03:49:44'),
(213, 38, '220.247.170.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-28 05:22:46', '2023-01-28 05:22:46'),
(214, 39, '182.2.6.118', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/109.0.5414.83 Mobile/15E148 Safari/604.1', '2023-01-28 05:35:40', '2023-01-28 05:35:40'),
(215, 38, '220.247.170.70', 'Mozilla/5.0 (Linux; Android 12; M2007J20CG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-28 05:56:24', '2023-01-28 05:56:24'),
(216, 1, '116.206.14.39', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-28 06:21:06', '2023-01-28 06:21:06'),
(217, 1, '116.206.14.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-28 09:17:06', '2023-01-28 09:17:06'),
(218, 1, '2001:448a:5040:bba7:554a:499c:6e60:2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15', '2023-01-28 12:00:11', '2023-01-28 12:00:11'),
(219, 2, '111.94.173.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-28 12:19:12', '2023-01-28 12:19:12'),
(220, 1, '114.142.173.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-28 13:05:18', '2023-01-28 13:05:18'),
(221, 41, '202.36.53.85', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-28 13:09:07', '2023-01-28 13:09:07'),
(222, 38, '125.164.96.235', 'Mozilla/5.0 (Linux; Android 12; M2007J20CG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-28 13:24:45', '2023-01-28 13:24:45'),
(223, 1, '114.142.173.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-28 13:26:14', '2023-01-28 13:26:14'),
(224, 1, '114.142.173.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', '2023-01-28 13:26:31', '2023-01-28 13:26:31'),
(225, 1, '114.142.173.38', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-28 13:56:16', '2023-01-28 13:56:16'),
(226, 1, '116.206.15.51', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-28 19:50:43', '2023-01-28 19:50:43'),
(227, 42, '2001:448a:10e5:1e9a:f062:a72d:dec3:4cf', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-28 20:35:24', '2023-01-28 20:35:24'),
(228, 38, '2001:448a:6020:495a:44e2:731e:585d:4982', 'Mozilla/5.0 (Linux; Android 12; M2007J20CG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', '2023-01-28 22:03:14', '2023-01-28 22:03:14'),
(229, 1, '116.206.14.22', 'Mozilla/5.0 (Linux; Android 12; M2102J20SG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '2023-01-28 23:09:52', '2023-01-28 23:09:52'),
(230, 1, '116.206.14.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70', '2023-01-28 23:42:03', '2023-01-28 23:42:03'),
(231, 38, '220.247.170.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-01-29 01:02:38', '2023-01-29 01:02:38'),
(232, 1, '116.206.14.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70', '2023-01-29 03:28:05', '2023-01-29 03:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `medans`
--

CREATE TABLE `medans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `refill` varchar(255) DEFAULT NULL,
  `masa_refill` varchar(255) DEFAULT NULL,
  `average_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medans`
--

INSERT INTO `medans` (`id`, `service_id`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(1, 101, 'SoundCloud', 'SoundCloud Plays [1.5M]', 1100, 100, 1500000, 'Real\n0-1 Hour Start!\n50K - 100K/Day\nMultiple of 100\nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 1.410 waktu proses 11 jam 13 menit.', '2022-12-13 07:16:38', '2022-12-13 07:16:38'),
(2, 102, 'SoundCloud', 'SoundCloud Plays [10M]', 1650, 20, 10000000, 'Real\n0-1 Hour Start!\n10K - 100K/Day\nMinimum 20', 'primary', '0', NULL, 'jumlah pesan rata rata 3.547 waktu proses 40 menit.', '2022-12-13 07:16:38', '2022-12-13 07:16:38'),
(3, 105, 'SoundCloud', 'Soundcloud - Likes ( S1 ) [ HQ ] ( INSTANT )', 22000, 20, 40000, 'HQ Users, Non Drop. Order Will Be Start Instant.', 'primary', '0', NULL, 'jumlah pesan rata rata 82 waktu proses 1 jam 35 menit.', '2022-12-13 07:16:38', '2022-12-13 07:16:38'),
(4, 108, 'Telegram', 'Telegram Post Views [10K] [Last 5]', 16500, 100, 10000, 'Views Will Be Added To Your Last 5 Posts\nReal\n0-1 Hour Start!\n24 Hours Delivery\nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 306 waktu proses 31 menit.', '2022-12-13 07:16:38', '2022-12-13 07:16:38'),
(5, 115, 'Instagram Story Views', 'Instagram Story Views [20K] [LAST STORY ONLY]', 3080, 20, 20000, 'Views On The Last Story Posted ONLY !\nUsername Only\n0-1 Hour Start!\nUltra Fast!\nMinimum 20', 'primary', '0', NULL, 'jumlah pesan rata rata 576 waktu proses 22 menit.', '2022-12-13 07:16:39', '2022-12-13 07:16:39'),
(6, 117, 'Instagram Live Video', 'Instagram Live Video Likes ', 6600, 200, 10000, 'Username Only\nNo Refill / No Refund\nLikes On Live Video\nFast Delivery\nMinimum 200', 'primary', '0', NULL, 'jumlah pesan rata rata 380 waktu proses 3 jam 34 menit.', '2022-12-13 07:16:39', '2022-12-13 07:16:39'),
(7, 118, 'Instagram Live Video', 'Instagram - Live Video Views', 82500, 25, 100000, '[ Username Only ] INSTANT', 'primary', '0', NULL, 'jumlah pesan rata rata 50 waktu proses 1 jam 9 menit.', '2022-12-13 07:16:39', '2022-12-13 07:16:39'),
(8, 120, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions [10M] [EXPLORE - HOME - LOCATION - PROFILE]', 2090, 100, 20000000, 'Impressions showing from ALL in the statistics (Explore, Home, Location ,Etc..)!\nInstant Start!\nFast Delivery!\nMinimum 100\nMaximum 10M', 'primary', '0', NULL, 'jumlah pesan rata rata 1.428 waktu proses 17 menit.', '2022-12-13 07:16:39', '2022-12-13 07:16:39'),
(9, 121, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions [1M]', 1650, 100, 1000000, 'Real\nInstant Delivery!\nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 1.521 waktu proses 10 menit.', '2022-12-13 07:16:39', '2022-12-13 07:16:39'),
(10, 123, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Saves ', 4400, 10, 15000, 'No Refill / No Refund\n0-1 Hour Start!\n15K/Day\nMinimum 10', 'primary', '0', NULL, 'jumlah pesan rata rata 201 waktu proses 18 menit.', '2022-12-13 07:16:40', '2022-12-13 07:16:40'),
(11, 138, 'Twitter Views & Impressions', 'Twitter Views Server 1 [1M]', 11000, 100, 1000000, 'Refill (30 Days Maximum) \n0-1 Hour Start! \n10K - 100K/Day \nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 558 waktu proses 13 jam 17 menit.', '2022-12-13 07:16:40', '2022-12-13 07:16:40'),
(12, 141, 'Linkedin', 'Linkedin - Followers AUTO 1', 79200, 100, 1000, 'instan', 'primary', '0', '', 'jumlah pesan rata rata 199 waktu proses 6 hari  17 jam  2   menit.', '2022-12-13 07:16:40', '2022-12-13 07:16:40'),
(13, 143, 'Website Traffic', 'Website Traffic Server 2 [10M]', 4400, 100, 10000000, 'Super Cepat', 'primary', '0', NULL, 'jumlah pesan rata rata 1.960 waktu proses 2 hari  2 jam  21   menit.', '2022-12-13 07:16:40', '2022-12-13 07:16:40'),
(14, 469, 'Telegram', 'Telegram - Channnel Members [ Max 3K]', 14850, 100, 3000, 'Channel Only\n5k/day\nNo Refill\n1-12hrs start\nMin 100, Max 100k', 'primary', '0', '', 'jumlah pesan rata rata 575 waktu proses 2 jam 30 menit.', '2022-12-13 07:16:40', '2022-12-13 07:16:40'),
(15, 572, 'Youtube Views', 'Youtube Views server 1 [ No Garansi ][ Fast ] ', 7964, 1000, 100000, 'Instan\nkecepatan 5k -20k/hari\nGK ADA GARANSI APAPUN! JIKA VIEW TURUN\nBELI? berani ambil resiko', 'primary', '0', '', 'jumlah pesan rata rata 1.950 waktu proses 13 jam 58 menit.', '2022-12-13 07:16:40', '2022-12-13 07:16:40'),
(16, 592, 'Instagram Views', 'instagram view Server 2 [ Max - 500Juta ] ', 20, 100, 500000000, 'INSTANT', 'primary', '0', '', 'jumlah pesan rata rata 2.396 waktu proses 31 menit.', '2022-12-13 07:16:40', '2022-12-13 07:23:21'),
(17, 725, 'Spotify', 'Spotify Followers S1 [1M] min 1000', 30250, 1000, 1000000, 'Start Time: Instant - 6 hours\nSpeed: 20K/ day \nRefill: no', 'primary', '0', NULL, 'jumlah pesan rata rata 1.278 waktu proses 3 hari  22 jam  3   menit.', '2022-12-13 07:16:41', '2022-12-13 07:16:41'),
(18, 726, 'Spotify', 'Spotify Followers S2 [1M] min 20', 48400, 20, 1000000, 'Start Time: Instant - 6 hours\nSpeed: 20K/ day \nRefill: no', 'primary', '0', NULL, 'jumlah pesan rata rata 417 waktu proses 18 jam 40 menit.', '2022-12-13 07:16:41', '2022-12-13 07:16:41'),
(19, 727, 'Spotify', 'Spotify Followers S3 [Super Fast] min 20', 29700, 20, 1000000, '100% High-Quality Account\nNo Drop - Life Time Guarantee\nInstant ( Avg 0-3 hrs ) \n500 to 5000 per 24 hour', 'primary', '0', NULL, 'jumlah pesan rata rata 303 waktu proses 56 menit.', '2022-12-13 07:16:41', '2022-12-13 07:16:41'),
(20, 728, 'Spotify', 'Spotify Plays S1', 20350, 1000, 1000000, 'Spotify Plays S1', 'primary', '0', NULL, 'jumlah pesan rata rata 1.150 waktu proses 2 hari  2 jam  35   menit.', '2022-12-13 07:16:41', '2022-12-13 07:16:41'),
(21, 729, 'Spotify', 'Spotify Playlists S1', 99000, 50, 100000, 'Correct format: \nhttps://open.spotify.com/album/2beOdusX0eDgXQ7KdX8IVf\nhttps://open.spotify.com/playlist/4jHJBBSbRZp2SNFeHoJMfA', 'primary', '0', NULL, 'jumlah pesan rata rata 105 waktu proses 4 hari  2 jam  42   menit.', '2022-12-13 07:16:41', '2022-12-13 07:16:41'),
(22, 730, 'Spotify', 'Spotify Playlists S2', 24200, 5000, 1000000, 'Correct format: \nhttps://open.spotify.com/album/2beOdusX0eDgXQ7KdX8IVf\nhttps://open.spotify.com/playlist/4jHJBBSbRZp2SNFeHoJMfA', 'primary', '0', NULL, 'jumlah pesan rata rata 5.000 waktu proses 11 jam 38 menit.', '2022-12-13 07:16:42', '2022-12-13 07:16:42'),
(23, 768, 'YouTube Shorts', 'Youtube Short Views Server 4 [ 50k-100k/day ] [ Lifetime Guarantee ] cheap', 12100, 100, 10000000, 'Start time: 0-3 hours\nJika status selesai tetapi view tidak ter update\nsilahkan klik like', 'primary', '0', '', 'jumlah pesan rata rata 675 waktu proses 12 jam 40 menit.', '2022-12-13 07:16:42', '2022-12-13 07:16:42'),
(24, 771, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes [ S 8 ] [20K] [R30]', 132000, 50, 20000, 'Start Time: Instant - 1 hour\nSpeed: 5K/ day \nRefill: 30 days\nSpecs: Fast', 'primary', '0', NULL, 'jumlah pesan rata rata 192 waktu proses 1 jam 25 menit.', '2022-12-13 07:16:42', '2022-12-13 07:16:42'),
(25, 915, 'Pinterest', 'Pinterest Board Followers ', 42900, 20, 5000, 'Pinterest Board Followers', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:16:42', '2022-12-13 07:16:42'),
(26, 916, 'Pinterest', 'Pinterest Likes ', 41800, 22, 250000, 'Pinterest Likes', 'primary', '0', NULL, 'jumlah pesan rata rata 67 waktu proses 13 jam 42 menit.', '2022-12-13 07:16:42', '2022-12-13 07:16:42'),
(27, 917, 'Instagram Story Views', 'Instagram Story Views [9K] [1H - Ultra Fast! ]', 2200, 250, 3000, 'All Stories\nUsername Only\n0-1 Hour Start! \nUltra Fast! \nMinimum 100', 'primary', '0', '', 'jumlah pesan rata rata 1.185 waktu proses 28 menit.', '2022-12-13 07:16:43', '2022-12-13 07:16:43'),
(28, 922, 'Instagram Live Video', 'Instagram Live Video Comments Random', 110000, 100, 2000, 'Username Only \nNo Refill / No Refund \nRandom Comments On Live Video \nFast Delivery \nMinimum 50', 'primary', '0', NULL, 'jumlah pesan rata rata 249 waktu proses 5 jam 23 menit.', '2022-12-13 07:16:43', '2022-12-13 07:16:43'),
(29, 1037, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia Views Produk', 2200, 50, 10000, 'Gunakan Link feed produk', 'primary', '0', NULL, 'jumlah pesan rata rata 612 waktu proses 1 hari  8 jam  21   menit.', '2022-12-13 07:16:43', '2022-12-13 07:16:43'),
(30, 1043, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram kunjungan profil / Profile Visit', 8250, 100, 100000, 'Profile Visit', 'primary', '0', '', 'jumlah pesan rata rata 2.445 waktu proses 58 menit.', '2022-12-13 07:16:43', '2022-12-13 07:16:43'),
(31, 1047, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia wishlist/ Favorite [ max 2k ]', 8800, 50, 2000, 'gunakan link Produk', 'primary', '0', NULL, 'jumlah pesan rata rata 50 waktu proses 7 jam 33 menit.', '2022-12-13 07:16:43', '2022-12-13 07:16:43'),
(32, 1048, 'Shopee/Tokopedia/Bukalapak', 'Shopee Followers [30K] MURAH [BONUS 5%]', 16500, 50, 30000, 'Gunakan username ya bro jangan link!\ninstan\norder 100 dapat 105', 'primary', '0', '', 'jumlah pesan rata rata 735 waktu proses 19 menit.', '2022-12-13 07:16:44', '2022-12-13 07:16:44'),
(33, 1124, 'Youtube Views', 'Youtube Ranking Views V10 [ Recommended ][ 0 - 1 Mint Retention]', 26950, 500, 10000000, '[ Lifetime Guarantee Views ]\n- Cheapest In Market\n- Start times : 0 - 1h ( Instant )\n- Non drop - Lifetime Guarantee Views\n- Speed 20k - 30k+ ( Some times will be Faster )\n- Retention : 0-1 Minutes +', 'primary', '0', '', 'jumlah pesan rata rata 790 waktu proses 14 jam 33 menit.', '2022-12-13 07:16:44', '2022-12-13 07:16:44'),
(34, 1169, 'Instagram Likes', 'Instagram Likes Server 3 [ Kualitas bagus ] [ Superfast ] ', 17600, 10, 25000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 328 waktu proses 16 menit.', '2022-12-13 07:16:44', '2022-12-13 07:16:44'),
(35, 1173, 'Shopee/Tokopedia/Bukalapak', 'Shopee Likes Indonesia Server new [1500] {produk} ', 3300, 50, 1500, 'bot\ngunakan link\nContoh : https://shopee.co.id/Rok-Midi-A-Line-Lipit-Bahan-Tulle-Warna-Polos-untuk-Wanita-i.29961905.1125996814\njangan pakai smttt\nCONTOH LINK SALAH :\n1. https://shopee.co.id/product/xxxxxx/xxxxxxxx?smtt=0.0.9\n2. https://shopee.co.id/product/xxxxxx/xxxxxxxx/?smtt=0.0.9\nTolong gunakan link yang benar !', 'primary', '0', '', 'jumlah pesan rata rata 169 waktu proses 12 jam 3 menit.', '2022-12-13 07:16:45', '2022-12-13 07:16:45'),
(36, 1208, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Server 2 [REFILL 30 HARI]', 66000, 10, 10000, 'MIX ada akun luar\njika dalam 30 hari drop rate lebih dari 40% itu Bisa refill\nRefill hanya bisa sekali\ndrop di bawah 40% gk bisa di refill', 'primary', '0', '', 'jumlah pesan rata rata 432 waktu proses 48 menit.', '2022-12-13 07:16:45', '2022-12-13 07:16:45'),
(37, 1225, 'Spotify', 'Spotify Plays [ 1M ] Speed : 500 - 3500/D', 9900, 1000, 1000000, '- Start Time: 1 - 12 Hours\n- Speed : 500 - 3500/D\n- Refill : Non Drop - LifeTime Guarantee\n- Best Service in the Market\n- Followers from TIER 1 countries only! USA/CA/EU/AU/NZ/UK.\n- Quality: HQ\n- Min/Max: 1000/1M', 'primary', '0', NULL, 'jumlah pesan rata rata 1.150 waktu proses 2 hari  4 jam  18   menit.', '2022-12-13 07:16:45', '2022-12-13 07:16:45'),
(38, 1231, 'Instagram Like Indonesia', 'Instagram Likes Indonesia Server 3 max 2K [ MAX TERBESAR DAN TERMURAH ] ', 3300, 100, 1000, '24 jam proses\nbisa lebih lama jika antrian panjang\nsemakin besar jumlah yang dipesan semakin cepat diproses\nKualitas Real + BOT HQ\nJANGAN PERNAH DOUBLE ORDER\nHANYA MAX 1K!\nsukses no refund', 'primary', '0', '', 'jumlah pesan rata rata 307 waktu proses 1 jam 9 menit.', '2022-12-13 07:16:46', '2022-12-13 07:16:46'),
(39, 1240, 'TikTok Followers', 'TIK TOK FOLLOWERS S4 [ 30 days refill - Full URL ]⚡️⚡️⚡️', 126500, 10, 15000, 'Complete URL \n30 days refill\nSpeed 2-5k/Day', 'primary', '0', '', 'jumlah pesan rata rata 183 waktu proses 1 jam 58 menit.', '2022-12-13 07:16:46', '2022-12-13 07:16:46'),
(40, 1241, 'TikTok Likes', 'TIK TOK Likes S5 [ 30 days refill - Full URL ] ', 126500, 10, 15000, 'Complete URL \n30 days refill\nSpeed 2-5k/Day', 'primary', '0', NULL, 'jumlah pesan rata rata 83 waktu proses 58 menit.', '2022-12-13 07:16:46', '2022-12-13 07:16:46'),
(41, 1250, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like [ S6 ] [ TERMURAH Instant  ][ R30 ] FAST', 14520, 50, 100000, '- Instant\n- 30 days refill\nStart Time 0-1 hours', 'primary', '0', '', 'jumlah pesan rata rata 506 waktu proses 17 menit.', '2022-12-13 07:16:46', '2022-12-13 07:16:46'),
(42, 1268, 'Youtube Views', 'Youtube Views Server 4 ( No refill ) [Speed: 500K/Day] CHEAP', 7810, 1000, 10000000, '- Start : 0 - 6 jam', 'primary', '0', '', 'jumlah pesan rata rata 2.485 waktu proses 14 jam 25 menit.', '2022-12-13 07:16:46', '2022-12-13 07:16:46'),
(43, 1271, 'Instagram Story Views', 'Instagram - Story Views S3 All Story Views Fast ', 5500, 100, 40000, 'instan', 'primary', '0', NULL, 'jumlah pesan rata rata 787 waktu proses 5 jam 19 menit.', '2022-12-13 07:16:46', '2022-12-13 07:16:46'),
(44, 1303, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia Feeds Comment', 385000, 5, 2000, '-', 'custom_comments', '0', '', 'jumlah pesan rata rata 21 waktu proses 2 hari  7 jam  33   menit.', '2022-12-13 07:16:47', '2022-12-13 07:16:47'),
(45, 1316, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes [ S 11 ] [Refill 30] [Instant Start] Real', 187000, 100, 10000, 'Refill 30 Days\nInstant Start\nSpeed : 5K / Day\nNon Drop Likes', 'primary', '0', NULL, 'jumlah pesan rata rata 186 waktu proses 3 jam 0 menit.', '2022-12-13 07:16:47', '2022-12-13 07:16:47'),
(46, 1338, 'Shopee/Tokopedia/Bukalapak', 'Shopee Followers Server 2 NEW [2500] NODROP ', 9900, 100, 2500, 'instan', 'primary', '0', '', 'jumlah pesan rata rata 905 waktu proses 13 menit.', '2022-12-13 07:16:47', '2022-12-13 07:16:47'),
(47, 1342, 'TikTok Followers', 'TIK TOK FOLLOWERS S5 [ 30 days refill - Full URL ]  ⚡️⚡️⚡️', 88000, 10, 30000, '- Speed 5000 per day\n- Avatars Followers and Likes\n- 30 days warranty\n- instant start to 5 minute start Time\n( Contoh Target yang kamu masukin https://www.tiktok.com/@username )', 'primary', '0', '', 'jumlah pesan rata rata 589 waktu proses 1 jam 54 menit.', '2022-12-13 07:16:48', '2022-12-13 07:16:48'),
(48, 1343, 'TikTok Likes', 'TIK TOK Likes S6 [ 30 days refill - Full URL ] ', 93500, 9, 30000, '- Speed 5000 per day\n- Avatars Followers and Likes\n- 30 days warranty\n- instant start to 5 minute start Time', 'primary', '0', NULL, 'jumlah pesan rata rata 63 waktu proses 52 menit.', '2022-12-13 07:16:48', '2022-12-13 07:16:48'),
(49, 1421, 'Instagram Likes', ' Instagram Likes  2 [No Drop] Real [Max 5K]', 8250, 20, 5000, 'Speed : 200 Likes / Hour\nNo Partial Issues\nNo Drop', 'primary', '0', '', 'jumlah pesan rata rata 212 waktu proses 3 jam 45 menit.', '2022-12-13 07:16:48', '2022-12-13 07:16:48'),
(50, 1422, 'Instagram Likes', 'Instagram Likes  3 [ 10k ] [ Instant - Start ]', 26400, 20, 5000, 'Start time:\nFor orders under 1000 likes usually instant. If more than 1000 - may take some time, usually few hours\nSpeed is up to 100-200 per hour (can lower a bit when many orders)\nNo cancellation before 24 hours', 'primary', '0', NULL, 'jumlah pesan rata rata 179 waktu proses 1 jam 59 menit.', '2022-12-13 07:16:49', '2022-12-13 07:16:49'),
(51, 1430, 'Youtube Views', 'Youtube Ranking Desktop Views  2 [ Lifetime Guaranteed ]', 26400, 500, 1000000, '0-24 hour start time\n100k to 300k /day speed\nLifetime refill guarantee\n30-40 second watch time\nSafe to run with monetised videos\nWindows desktop watch page\nWorldwide viewers added in a non-stop natural pattern\nMust be unrestricted & open for all countries\nOK for VEVO\nIncremental Speed Based on Order Size\n500 Minimum order\n1 Million Maximum order', 'primary', '0', '', 'jumlah pesan rata rata 1.036 waktu proses 4 hari  19 jam  28   menit.', '2022-12-13 07:16:49', '2022-12-13 07:16:49'),
(52, 1443, 'Facebook Followers / Friends', 'Facebook Profile Follower  1 [ No Refill ] beta test ', 93500, 100, 10000, '- Speed 1k/D\n- Start : 0 - 24h\n- hanya untuk followers profil ya bukan fanspage/halaman !\n- No Refill .', 'primary', '0', '', 'jumlah pesan rata rata 182 waktu proses 2 hari  1 jam  3   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(53, 1445, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes 1[ Start Instant ][Recommended]', 60500, 25, 10000, 'Speed 5k per day\nNo refill\nbisa untuk video live', 'primary', '0', '', 'jumlah pesan rata rata 155 waktu proses 19 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(54, 1453, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  3 [ 30 Days Refill - Max 5K ] [ Speed 100+/D ]', 33000, 50, 10000, '- Start : 0 - 24 hours\n- Min: 50 - Max: 5K\n- Daily speed 50 - 200 ( Speed can slower if server overload, in this care must wait )\n- NON DROP so far - 30 days Refill Guarantee\n\nNOTE :\n- No Refund after order placed\n- No Refill if Old Likes Drop Below Start Count .', 'primary', '0', NULL, 'jumlah pesan rata rata 170 waktu proses 18 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(55, 1454, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  4 [ TERMURAH ][ R30 - 10K ][ 200+/D ]♻️', 73700, 20, 10000, '- Instant\n- Non drop -\n- Guarantee: 30 days refill if any drop\n- Speed 200+/D', 'primary', '1', '30', 'jumlah pesan rata rata 61 waktu proses 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(56, 1455, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  5 [ TERMURAH ][ NO REFILL- 10K ][ 10K+/D ]', 53900, 20, 10000, '- Instant Start\n- Speed for now about 10K/D\n- No refill / No refund with any reason .', 'primary', '0', NULL, 'jumlah pesan rata rata 275 waktu proses 6 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(57, 1456, 'SoundCloud', 'Soundcloud  Followers  1 [ High Quality ] ~ Instant ', 24200, 20, 25000, '[ High Quality ] ~ Instant\n', 'primary', '0', NULL, 'jumlah pesan rata rata 330 waktu proses 3 jam 17 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(58, 1459, 'Telegram', 'Telegram Post Views [10K] [Last 1] ', 1650, 100, 200000, 'Start Time: Instant - 1 hour\nSpeed: 10K to 20K/ day\nRefill: no\nSpecs: Latest Post\nSend Post Link Or channel id\nExample Link: https://t.me/link_example/994', 'primary', '0', NULL, 'jumlah pesan rata rata 1.575 waktu proses 19 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(59, 1489, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  5 [ Best Price in Market ][ 30 Days refill ]', 13640, 50, 15000, 'Speed 200-400 Per Day\nRefill: 30 Days\nStart Time 0-2 hours', 'primary', '0', '', 'jumlah pesan rata rata 224 waktu proses 35 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(60, 1500, 'Instagram Followers [ No Refill ]', 'Instagram Followers  31 [ LESS DROP | DROP 10-20% ] ', 33000, 100, 5000, '1k in 1 minutes\n80% real\nKemungkinan drop 10-20% jika anda memesan 1000+\n', 'primary', '0', NULL, 'jumlah pesan rata rata 682 waktu proses 46 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(61, 1501, 'Instagram Likes', 'Instagram Likes  9 [ Pakistan+asia+indo ] [ 40K ] ', 11660, 50, 40000, '1k-2k/hour\n', 'primary', '0', NULL, 'jumlah pesan rata rata 318 waktu proses 2 jam 53 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(62, 1502, 'Telegram', 'Telegram Channnel Members [ Max 10K] ', 6820, 10, 10000, 'Instant\nSpeed: 1-5K day\nBisa Req Cancelled\nNo guaranteed', 'primary', '0', '', 'jumlah pesan rata rata 524 waktu proses 1 jam 37 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(63, 1503, 'Telegram', 'Telegram Channnel Members [5K] Non Drop', 15950, 100, 5000, 'Instant\nSpeed 3-3k+ day\nNon drop.\ntetap no garansi jika drop.', 'primary', '0', '', 'jumlah pesan rata rata 489 waktu proses 1 jam 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(64, 1518, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  6 [ Best Seller ][ AUTO Refill ]♻️', 44000, 20, 10000, 'Instant\n30 days refill\nSpeed 200+/hari', 'primary', '1', '30', 'jumlah pesan rata rata 195 waktu proses 4 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(65, 1531, 'Instagram Followers [ No Refill ]', 'Instagram Followers  33 [ NON DROP | BONUS 0-5% ] [ 2k/Day ]⚡️', 132000, 50, 100000, 'waktu proses 0-1jam\nkecepatan 1k-3k/hari\nno drop\nkalo drop kemungkinan besar itu followers yang lain, bukan dari kami\nkalo drop kemungkinan sangat dikit dan no refill', 'primary', '0', NULL, 'jumlah pesan rata rata 81 waktu proses 3 hari  20 jam  1   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(66, 1546, 'TikTok View', 'TIKTOK View S9 [ superfast ] [ Trending + Viral Views]', 2090, 500, 500000, 'Layanan ini berbeda dengan view lain\nkarena layanan ini bisa membuat trending dan viral video', 'primary', '0', '', 'jumlah pesan rata rata 5.577 waktu proses 2 jam 58 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(67, 1560, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ REAL ][ BETA ]', 74800, 5000, 100000, 'Tampilan Aktif Nyata **\n MULAI INSTAN\n 100% Pemirsa Pengguna YouTube Manusia Nyata!\n Tampilan Halaman Desktop Windows & Mobile Watch\n 100% Lalu Lintas Unik dapat dimonetisasi!\n Pemirsa Seluruh Dunia\n Harus Tidak Terbatas & Terbuka untuk SEMUA negara\n Retensi Acak\n Rata-rata Bersamaan dan waktu tonton berdasarkan konten streaming langsung\n Pengiriman Lebih Dijamin\n penayangan dapat dikirim ke embed video streaming langsung yang dinonaktifkan\n Sumber Lalu Lintas: Iklan Langsung\n\nCATATAN :\n- Layanan Beta - itu berarti layanan yang ditawarkan apa adanya tanpa jaminan isi ulang!\n- Tampilan dapat mencakup keterlibatan pengguna nyata - video Anda mungkin mendapatkan suka / tidak suka setiap hari, komentar, bagikan, pelanggan ,,, semua dibuat oleh pengguna YouTube nyata yang tidak kami kontrol!', 'primary', '0', '', 'jumlah pesan rata rata 5.500 waktu proses 1 hari  22 jam  38   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(68, 1562, 'Twitter Retweets', 'Twitter Retweets Server 1 [ Max 2K ]⚡️⚡️', 49500, 20, 2000, '2k/days\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 136 waktu proses 9 jam 40 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(69, 1565, 'Instagram Likes', 'Instagram Likes  15 [ NO DROP ] Max terbanyak', 10450, 20, 50000, 'No Drop Likes\n1-3K / Hour', 'primary', '0', NULL, 'jumlah pesan rata rata 174 waktu proses 1 jam 25 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(70, 1584, 'Youtube Views', 'Youtube Views server 10 [ LIFETIME ][ FASTEST IN THE MARKET ]', 26400, 1000, 100000000, 'Speed 1 Million Per Day\nInstant Start\nNON-Drop\nLife Time Guarantee', 'primary', '0', NULL, 'jumlah pesan rata rata 1.392 waktu proses 4 hari  5 jam  33   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(71, 1592, 'TikTok Likes', 'TIK TOK Likes Server 1 [ 30 days refill  ] [ SuperInstant  ] ', 15400, 100, 30000, '25K/Day\nGuarantee : 30 Days', 'primary', '0', '', 'jumlah pesan rata rata 225 waktu proses 46 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(72, 1606, 'Likee app', 'Likee App Post Likes [Speed : 1k-2k/day]', 58300, 20, 10000, 'contoh target :https://likee.com/@********/video/*********\nNo refill', 'primary', '0', NULL, 'jumlah pesan rata rata 50 waktu proses 8 jam 6 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(73, 1607, 'Likee app', 'Likee App Followers  [ 500-1k/day ]', 126500, 20, 10000, 'contoh target https://likee.com/@********\nno refill', 'primary', '0', NULL, 'jumlah pesan rata rata 86 waktu proses 9 jam 31 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(74, 1621, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  7 [ No Refill and Cheapest ] ', 16500, 30, 50000, 'Real Youtube Likes\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 59 waktu proses 11 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(75, 1645, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 7 [ fastest - BOT ] ', 6050, 10, 30000, 'Bot Quality', 'primary', '0', '', 'jumlah pesan rata rata 859 waktu proses 32 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(76, 1646, 'Telegram', 'Telegram Channnel Members [ Max 50k ] Non Drop', 17600, 100, 50000, 'Instant\nSpeed 5 day\nNon Drop\ntetap no garansi jika drop', 'primary', '0', '', 'jumlah pesan rata rata 1.421 waktu proses 4 jam 29 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(77, 1647, 'Telegram', 'Telegram Channnel Members [ Max 5k ] INSTANT-3HRS ', 28600, 1000, 5000, 'Speed:5k/day', 'primary', '0', '', 'jumlah pesan rata rata 1.791 waktu proses 10 jam 37 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(78, 1651, 'Instagram Likes', 'Instagram Likes  19 [ NON DROP ] [5k-10k Per Day] ', 13200, 100, 300000, 'instan', 'primary', '0', NULL, 'jumlah pesan rata rata 225 waktu proses 33 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(79, 1666, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S2 [ Refill 30Day ] LessDrop♻️', 36300, 50, 100000, 'kemungkinan drop 5-15% ( tapi gk jami 100% )\nHigh-Quality\n', 'primary', '0', '', 'jumlah pesan rata rata 431 waktu proses 1 jam 39 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(80, 1667, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S3 [ Refill 30Day ] [ Real Recommended  ]', 15400, 100, 100000, 'sekitar 70%-80% real user\nSpeed 1k Per Day\n', 'primary', '0', '', 'jumlah pesan rata rata 988 waktu proses 1 jam 21 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(81, 1672, 'Facebook Followers / Friends', 'Facebook Profile Follower  4 [ R30Day ] [Non Drop]', 68200, 30, 100, 'Refill 30Day\nkami sudah uji selama 2 bulan dan tidak ada penurunan\njadi kami tidak bisa mastikan ini nondrop 100% jika ada update dll', 'primary', '0', '', 'jumlah pesan rata rata 95 waktu proses 6 jam 53 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(82, 1705, 'Youtube Views', 'Youtube Views  1 [ 50k-100k/day ] [ 20 Days Refill ] INSTANT', 35200, 100, 100000000, 'Instant Start\n1-3mins Retention\n50k-100k/day\n20 Days Refill', 'primary', '0', NULL, 'jumlah pesan rata rata 235 waktu proses 9 jam 20 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(83, 1716, 'Youtube Views', 'Youtube Views  6 [ 20-50k/days ] [ 30 Days Refil ] ', 34100, 100, 100000000, 'fast', 'primary', '0', NULL, 'jumlah pesan rata rata 260 waktu proses 9 jam 1 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(84, 1717, 'Youtube Views', 'Youtube Views  7 [ Best Service ] [ Life Time Guaranteed ] ', 24750, 1000, 100000000, 'INSTANT START\nGood For Ranking\nLife Time Guaranteed\nFast', 'primary', '0', NULL, 'jumlah pesan rata rata 1.000 waktu proses 1 hari  18 jam  30   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(85, 1719, 'Instagram Likes', 'Instagram Likes  20 [ Real Account ] [ Best Seller ] ', 7810, 10, 20000, 'No garansi apaun yg terjadi\nKualitas bagus\ntidak drop paling kalo drop sekitar 10% ( kami tidak menjamin ini selamanya karna ig kadang update gk jelas )', 'primary', '0', '', 'jumlah pesan rata rata 222 waktu proses 1 jam 55 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(86, 1722, 'Twitter Indonesia', 'Twitter Followers REAL INDONESIA Fast S2', 396000, 10, 100, 'No garansi\nno kompline\nReal indo\nUSERNAME/AKUN YANG DI SUBMIT TIDAK BISA DI SUBMIT ULANG\nhanya bisa 200 per akun!', 'primary', '0', '', 'jumlah pesan rata rata 76 waktu proses 47 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(87, 1723, 'Twitter Indonesia', 'Twitter Retweet REAL INDONESIA Fast', 297000, 10, 100, 'No garansi\nno kompline\nReal indo', 'primary', '0', '', 'jumlah pesan rata rata 14 waktu proses 34 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(88, 1724, 'Twitter Indonesia', 'Twitter Favorite/Likes REAL INDONESIA Fast', 73700, 10, 300, 'No garansi\nno kompline\nReal indo', 'primary', '0', '', 'jumlah pesan rata rata 56 waktu proses 36 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(89, 1748, 'Youtube View Jam Tayang', 'Youtube Views [ Jam Tayang 1000 jam ] [ Durasi Video 2 jam+ ] [ cek Deskripsi ] ', 247500, 1000, 1000, 'pesanan selesai dalam 3-10 hari\nwajib durasi 2jam lebih\n30 days Refill\nmNEDAPAT 1000 JAM', 'primary', '0', NULL, 'jumlah pesan rata rata 1.000 waktu proses 33 hari  14 jam  38   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(90, 1752, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Indonesia', 35200, 50, 50, 'Instan', 'primary', '0', '', 'jumlah pesan rata rata 50 waktu proses 1 jam 58 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(91, 1753, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes 5 [ 30 days Refill ] [max 500]', 13860, 20, 500, 'Murah\ngk support live', 'primary', '0', '', 'jumlah pesan rata rata 144 waktu proses 33 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(92, 1760, 'Instagram Like Indonesia', 'Instagram Likes + Reels  Indonesia  7 [ MAX 5K ] [ real aktif ] FAST MURAH [ Refill 14 days ]', 16500, 25, 1000, 'Drop kecil banget\nreal \nRefill 14 days \nhanya bisa 1x refill\nsyaratnya\n- like dibawah start order/jumlah awal gak bisa refill.\n- user private gak bisa refill\n- orderan belum ada 24 jam belum bisa refill\n\nmax db 3000', 'primary', '0', '', 'jumlah pesan rata rata 263 waktu proses 24 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(93, 1761, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S8 [ Refill 30D] [ max 5k ] HQ FAST', 15400, 10, 500000, 'DROP KEMUNGKINAN Hanya 10%\nmulai 0-1jam', 'primary', '0', '', 'jumlah pesan rata rata 428 waktu proses 38 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(94, 1773, 'Instagram TV', 'Instagram TV Like Server 4 [ BOT ] [ HQ ]', 12100, 10, 10000, 'Instant\nno garansi', 'primary', '0', NULL, 'jumlah pesan rata rata 179 waktu proses 48 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(95, 1774, 'Instagram TV', 'Instagram TV Like Server 5 [ Instan ]', 6930, 100, 15000, 'instan', 'primary', '0', '', 'jumlah pesan rata rata 391 waktu proses 36 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(96, 1788, 'Instagram Likes', 'Instagram Likes  25 [ Lifetime refill ] BONUS+', 1320, 10, 1250000000, 'MEDIUM, bot accounts with profile pictures and no posts.\nLifetime Guaranteed\n+ Impressions + Profile Visits.', 'primary', '0', '', 'jumlah pesan rata rata 123 waktu proses 1 jam 0 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(97, 1789, 'Instagram Likes', 'Instagram Likes  26 [ No drop ] Real ', 13200, 100, 15000, 'High Quality\nNo drop, jika drop mungkin hanya 10% buat sekarang', 'primary', '0', NULL, 'jumlah pesan rata rata 300 waktu proses 16 jam 1 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(98, 1807, 'Instagram Likes', 'Instagram Likes  27 [10K] cheap', 5720, 10, 10000, 'no garansi\nspeed 300/jam\nmulai 0-2 jam', 'primary', '0', NULL, 'jumlah pesan rata rata 610 waktu proses 2 jam 44 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(99, 1810, 'Instagram Likes', 'Instagram Likes  28 [ real ] cheapeast', 4070, 10, 5000, 'No refill\n', 'primary', '0', '', 'jumlah pesan rata rata 1.078 waktu proses 1 hari  3 jam  5   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(100, 1811, 'Twitter Views & Impressions', 'Twitter Views Server 3 [ FAST - Max 1M ] ', 2200, 100, 10000000, '100k-200k/hour', 'primary', '0', NULL, 'jumlah pesan rata rata 3.190 waktu proses 33 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(101, 1814, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S14 [ Auto Refill  30 Days ]', 25300, 20, 10000, 'Auto Refill 30 days\n', 'primary', '0', NULL, 'jumlah pesan rata rata 417 waktu proses 9 jam 22 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(102, 1816, 'Youtube Subscribers', 'Youtube Subscribe SERVER 3 Best Monetization ', 423500, 10, 2000, '30 Days Refill\nSpeed:200-300/day\nHigh Quality subs - Helps for Monetization Approval\nMax 50k [ Can order 25 times - 2K ]', 'primary', '0', '', 'jumlah pesan rata rata 20 waktu proses 15 jam 23 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(103, 1825, 'Instagram Likes', 'Instagram Likes  29 [ Real ] cheapeast ', 7700, 100, 5000, 'No garansi\nfast', 'primary', '0', NULL, 'jumlah pesan rata rata 485 waktu proses 1 jam 1 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(104, 1832, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Video Custom Comments  1 Cheapest ', 130900, 10, 5000, 'Cheapest\nmulai proses 0-24jam', 'custom_comments', '0', NULL, 'jumlah pesan rata rata 33 waktu proses 18 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(105, 1833, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S15 [ Refill 99 Days ] ♻️', 29480, 10, 500000, '1K-2K/day', 'primary', '1', '30', 'jumlah pesan rata rata 356 waktu proses 59 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(106, 1836, 'Instagram Comments', 'Instagram 5 Comments random [ dari Akun dengan followers 10k + ]', 35200, 1000, 1000, 'instan\nmendapat 5 komentar', 'primary', '0', NULL, 'jumlah pesan rata rata 1.000 waktu proses 3 jam 14 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(107, 1837, 'Instagram Comments', 'Instagram Comments Costum [ dari Akun dengan followers 15k + ] [ Rp2.800 ]', 3080000, 1, 30, 'Proses slow\nwaktu mulai 0-48jam', 'custom_comments', '0', NULL, 'jumlah pesan rata rata 1 waktu proses 1 hari  10 jam  22   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(108, 1838, 'Instagram Comments', 'Instagram Comments Costum [ dari Akun dengan followers 10k + ] [ Rp11.000 ] ', 12100000, 1, 10, 'lebih fast dari id layanan 1837\n', 'custom_comments', '0', NULL, 'jumlah pesan rata rata 1 waktu proses 3 jam 25 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(109, 1839, 'Instagram Comments', 'Instagram  Comments Custom [Account Verif/centang biru] [ Rp25.500 ] ', 28050000, 1, 10, 'lambat\nnon drop', 'custom_comments', '0', NULL, 'jumlah pesan rata rata 1 waktu proses 2 hari  7 jam  51   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(110, 1840, 'Instagram Comments', 'Instagram  Comments Random [Account Verif/centang biru] [ Rp21.000 ] ', 23100000, 1, 10, 'lambat\nnon drop', 'primary', '0', NULL, 'jumlah pesan rata rata 1 waktu proses 2 hari  7 jam  23   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(111, 1841, 'Instagram Comments', 'Instagram 5 Comments random [ dari Akun dengan followers 1juta+ ] ', 58300, 1000, 1000, 'waktu mulai 0-24 jam\ndapat 5 komentar', 'primary', '0', NULL, 'jumlah pesan rata rata 1.000 waktu proses 3 hari  19 jam  20   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(112, 1843, 'Instagram Followers [ No Refill ]', 'Instagram Followers S15 [ LESS DROP ] [ REAL ] ', 12650, 20, 5000, '75% real\nno garansi', 'primary', '0', NULL, 'jumlah pesan rata rata 567 waktu proses 46 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(113, 1844, 'Instagram Followers [ No Refill ]', 'Instagram Followers S16 [ 10K ] [ REAL ] ', 17600, 20, 10000, 'START TIME 0-1H\n5K/DAY\nno garansi', 'primary', '0', NULL, 'jumlah pesan rata rata 838 waktu proses 1 jam 32 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(114, 1848, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 2 [ No Refill] [ BOT ] ', 4950, 10, 10000, 'INSTANT\nkadang sukses pesanan tidak full masuj\nno kompline', 'primary', '0', '', 'jumlah pesan rata rata 817 waktu proses 15 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(115, 1850, 'Youtube Subscribers', 'Youtube Subscribe SERVER 6 [ 30 days guarantee ] 20/day', 369600, 5, 2000, 'Speed - 20/day\n30 Days guarantee\nrefill only no reffund', 'primary', '0', '', 'jumlah pesan rata rata 24 waktu proses 2 hari  1 jam  36   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(116, 1851, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S16 [ Refill 30Days ] [ REAL HQ ]', 30800, 10, 20000, 'instan\nwaktu mulai 0-6 jam\n', 'primary', '0', NULL, 'jumlah pesan rata rata 140 waktu proses 38 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(117, 1857, 'Twitter Views & Impressions', 'Twitter Impressions Server 2 [5M] ', 4730, 100, 10000000, 'fast', 'primary', '0', NULL, 'jumlah pesan rata rata 3.600 waktu proses 3 jam 2 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(118, 1870, 'Twitter Views & Impressions', 'Twitter Views Server 4 [ SUPERFAST - Max 100M ] ', 1430, 100, 100000000, '1Juta/hour', 'primary', '0', NULL, 'jumlah pesan rata rata 7.650 waktu proses 15 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(119, 1876, 'TikTok Likes', 'TIK TOK Likes  2 [ HQ ] [ NON-DROP] ', 52800, 20, 5000, 'NON-DROP & HQ\n1000/hours\nwaktu mulai 0-12 jam', 'primary', '0', NULL, 'jumlah pesan rata rata 87 waktu proses 44 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(120, 1877, 'TikTok  share', 'TIKTOK Share  1 [ Real Share ] INSTANT', 27500, 10, 100000, 'THE CHEAPEST SERVICE\nREAL PROFILE', 'primary', '0', '', 'jumlah pesan rata rata 202 waktu proses 16 jam 40 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(121, 1886, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S18 [ Refill 60Day ] INSTANT ', 35200, 20, 100000, 'High Quality\n1k - 2k Per Day Speed\nLow Drop\n', 'primary', '0', '', 'jumlah pesan rata rata 465 waktu proses 52 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(122, 1889, 'Youtube Subscribers', 'Youtube Subscribe SERVER 7 Real USA', 363000, 5, 1500, '30-50days \nguaranted 30days', 'primary', '0', '', 'jumlah pesan rata rata 15 waktu proses 1 hari  12 jam  39   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(123, 1891, 'Youtube Subscribers', 'Youtube Subscribe SERVER 8 Best Monetization ', 434500, 5, 2000, '30 Days Refill\nSpeed:200-300/day\nHigh Quality subs - Helps for Monetization Approval\nMax 50k [ Can order 25 times - 2K ]', 'primary', '0', '', 'jumlah pesan rata rata 80 waktu proses 2 hari  6 jam  19   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(124, 1892, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S21 [ AUTO refill 30D ][ HQ ]', 18700, 10, 5000, '- High-Quality Instagram followers\n- Followers Unfollow 5%\n- Speed 2k-5k per days', 'primary', '0', '', 'jumlah pesan rata rata 306 waktu proses 1 jam 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(125, 1893, 'Youtube Subscribers [ No Refill ]', 'Youtube Subscribe SERVER 12 [ No Refill ]', 9790, 100, 20000, 'No garansi\nTIDAK ADA KOMPLINAN APAPUN\nMAU TIDAK MASUK ATAU DROP LANGSUNG\nLAYANAN NO GARANSI!', 'primary', '0', '', 'jumlah pesan rata rata 352 waktu proses 17 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(126, 1896, 'TikTok View', 'TIK TOK View S13 [ WORK AFTER UPDATE ] INSTAN', 880, 100, 1000000, 'Fast\nmin 100', 'primary', '0', '', 'jumlah pesan rata rata 319 waktu proses 35 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(127, 1904, 'Shopee/Tokopedia/Bukalapak', 'Shopee Followers Indonesia  [ Max 50K] NON DROP', 19800, 100, 25000, 'Masukkan username shopee\nbisa order 2x 25k jadi 50k', 'primary', '0', '', 'jumlah pesan rata rata 4.290 waktu proses 2 jam 13 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(128, 1914, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S22 [ AUTO refill 30D ]⭐⭐', 14300, 10, 100000, '30 days guarantee\nauto refill\n1-3k/day', 'primary', '0', NULL, 'jumlah pesan rata rata 437 waktu proses 6 jam 19 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(129, 1915, 'Instagram Comments', 'Instagram Custom Comments Indonesia Instan 2', 682000, 5, 500, 'fast', 'custom_comments', '0', '', 'jumlah pesan rata rata 9 waktu proses 8 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(130, 1918, 'Instagram Likes', 'Instagram Likes  31  [ Refill 30D ] INSTANT', 2200, 50, 10000, 'Refill 30D\nSpeed 2k/day', 'primary', '0', '', 'jumlah pesan rata rata 1.272 waktu proses 32 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(131, 1920, 'Youtube Subscribers', 'Youtube Subscribe SERVER 10 [ NON DROP ] [30d guaranted]♻️', 253000, 100, 50000, '30d guaranted', 'primary', '0', '', 'jumlah pesan rata rata 135 waktu proses 21 jam 46 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(132, 1923, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Refill S23 [ refill button 180D ]♻️', 6600, 100, 500000, 'proses refill 2-3hari\n', 'primary', '1', '30', 'jumlah pesan rata rata 698 waktu proses 2 jam 37 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(133, 1927, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S25 [ NON DROP ] real followers ♻️', 27500, 1000, 100000, 'NON-drop\n30 days refill\nKualitas Bagus', 'primary', '1', '30', 'jumlah pesan rata rata 1.205 waktu proses 4 jam 8 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(134, 1928, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S25 [ AUTO REFILL 30Days ] HQ', 13750, 20, 100000, 'hanya bisa refill jika yg turun dari kami\nAuto Refill\nInstan', 'primary', '0', '', 'jumlah pesan rata rata 630 waktu proses 37 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(135, 1929, 'Youtube Views', 'Youtube Views  24 [ Non Drop ] Lifetime ', 30690, 100, 100000000, '- Instant Start\n- Speed 10k - 20k /day For NOW\n- NON DROP', 'primary', '0', '', 'jumlah pesan rata rata 251 waktu proses 4 jam 20 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(136, 1933, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S26 [ AUTO REFILL 30Days ] MAX 30k', 11550, 50, 30000, 'Instant\n30 days auto refill\nSpeed 5k/D', 'primary', '0', NULL, 'jumlah pesan rata rata 2.444 waktu proses 3 jam 27 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(137, 1942, 'Telegram', 'Telegram Post Views [500K] [Last 1 Post] ', 605, 100, 500000, 'Last 1 Post', 'primary', '0', '', 'jumlah pesan rata rata 205 waktu proses 10 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(138, 1943, 'Telegram', 'Telegram Post Views [500K] [Last 10 Post] ', 1980, 50, 500000, 'Last 10 Post', 'primary', '0', '', 'jumlah pesan rata rata 364 waktu proses 14 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(139, 1953, 'Instagram Likes', 'Instagram Likes  32 cheapeast world [ NO DROP ] FAST', 1760, 100, 50000, 'Instant\nno drop\nTapi Jika drop gk ada reffund', 'primary', '0', '', 'jumlah pesan rata rata 250 waktu proses 47 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(140, 1960, 'Twitter Views & Impressions', 'Twitter Views Server 5 [ Cheap - Max 100k ] ', 1100, 100, 150000, 'No REFILL\n100k/hour', 'primary', '0', '', 'jumlah pesan rata rata 11.710 waktu proses 1 jam 1 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(141, 1967, 'Telegram', 'Telegram - Channnel Members/Group Server 4 [ Max 15K] R10Days', 27500, 500, 15000, 'Mulai: 1-30 Menit\nKecepatan: 5000 / hari\nRefill 10Days\nKualitas: Real\nJika Anda Telah Mengubah Tautan Atau Saluran Dihapus Tidak Akan Ada Pembatalan Pesanan', 'primary', '0', '', 'jumlah pesan rata rata 800 waktu proses 5 jam 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(142, 1969, 'Youtube Views', 'Youtube Views  25 [ Lifetime ] No Drop [ Best ]', 29700, 500, 10000000, 'working service\n10k-20k/day speed\n100% non-drop', 'primary', '0', '', 'jumlah pesan rata rata 933 waktu proses 14 jam 49 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(143, 1970, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 7 [ Real ] [ Fast ] Recomended', 8470, 50, 20000, 'Real\nInstan', 'primary', '0', '', 'jumlah pesan rata rata 1.403 waktu proses 1 jam 42 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(144, 1972, 'Clubhouse', 'Clubhouse Followers 100 User', 121000, 1000, 1000, 'mulai : 0-6 jam\nKecepatan : 0-12 jam\norder 1000 mendapatkan 100 user', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 21 jam 13 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(145, 1973, 'Clubhouse', 'Clubhouse Followers 250 User', 297000, 1000, 1000, 'mulai : 0-6 jam\nKecepatan : 0-12 jam\norder 1000 mendapatkan 250 user', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 2 jam 45 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(146, 1974, 'Clubhouse', 'Clubhouse Followers 500 User ', 528000, 1000, 1000, 'mulai : 0-6 jam\nKecepatan : 0-12 jam\norder 1000 mendapatkan 500 user', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(147, 1977, 'Youtube View Jam Tayang', 'Youtube Views [ Jam Tayang CLEAR 15 HARI ] [ Durasi Video 1 jam+ ] [ cek Deskripsi ] ', 167200, 400, 4000, 'order dengan kelipatan 100\ncontoh jumlah order 1000,1200 kalo order jumlah 1230 tidak bisa\njumlah pesan = jam tayang yang kamu dapat\n\n- Eksklusif di MEDANPEDIA\n- Silakan memesan 4000 tampilan untuk mendapatkan waktu menonton 4kh\n- SIAP DALAM 12-15 hari ( sebelum waktu 15 hari dilarang kompline )\n- Garansi: refill 30 Hari\n\n\nCATATAN :\n- Harap cantumkan video yang memiliki panjang hanya 1 jam + (Jika tidak sampai 1 jam , pesanan masih berjalan tetapi waktu menonton tidak akan cukup, kami tidak dapat melakukan refill / reffund Dana / canceled / Partial dalam kasus ini)\n- Jika view lama Anda turun di bawah jumlah mulai, maka kami tidak dapat Refill / Refund / Cancel / Membatalkan sebagian. ( lebih baik menggunakan video dengan view yg sedikit/baru )\n- Silakan gunakan video tanpa tampilan interleaving alami (Jika Anda secara bersamaan mendapatkan view alami (ditonton orang lain selain sistem kami ) saat menjalankan waktu jam tayang, Anda tidak akan mendapatkan cukup waktu jam tayang.)\n- Jika video Dihapus, Ditolak, Privat       kami menambahkan waktu tontonan atau setelah selesai, maka kami tidak dapat refill / reffund Dana / canceled / Partial.', 'primary', '0', '', 'jumlah pesan rata rata 1.030 waktu proses 2 hari  11 jam  7   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(148, 1978, 'Youtube View Jam Tayang', 'Youtube Views [ Jam Tayang CLEAR 48 jam ] [ Durasi Video 1 jam+ ] [ cek Deskripsi ] ', 187000, 200, 4000, 'jumlah pesan = jam tayang yang kamu dapat\norder dengan kelipatan 100\ncontoh jumlah order 1000,1200 kalo order jumlah 1230 tidak bisa\n\n- Eksklusif di MEDANPEDIA\n- Silakan memesan 4000 tampilan untuk mendapatkan waktu menonton 4kh\n- SIAP DALAM 2 hari \n- Garansi: refill 30 Hari\n\n\nCATATAN :\n- Harap cantumkan video yang memiliki panjang hanya 1 jam + (Jika tidak sampai 1 jam , pesanan masih berjalan tetapi waktu menonton tidak akan cukup, kami tidak dapat melakukan refill / reffund Dana / canceled / Partial dalam kasus ini)\n- Jika view lama Anda turun di bawah jumlah mulai, maka kami tidak dapat Refill / Refund / Cancel / Membatalkan sebagian. ( lebih baik menggunakan video dengan view yg sedikit/baru )\n- Silakan gunakan video tanpa tampilan interleaving alami (Jika Anda secara bersamaan mendapatkan view alami (ditonton orang lain selain sistem kami ) saat menjalankan waktu jam tayang, Anda tidak akan mendapatkan cukup waktu jam tayang.)\n- Jika video Dihapus, Ditolak, Privat       kami menambahkan waktu tontonan atau setelah selesai, maka kami tidak dapat refill / reffund Dana / canceled / Partial.', 'primary', '0', '', 'jumlah pesan rata rata 790 waktu proses 21 jam 58 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(149, 1979, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S27 [ REFILL 90Days ] Nodrop♻️', 15950, 100, 500000, 'High quality followers\nDrop Sekitar: 2-3%\nKecepatan 20-30K/day', 'primary', '1', '30', 'jumlah pesan rata rata 430 waktu proses 1 jam 28 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(150, 1983, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia Feeds likes', 8800, 50, 2000, '1', 'primary', '0', '', 'jumlah pesan rata rata 320 waktu proses 3 hari  3 jam  20   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(151, 1998, 'Instagram Live Video', 'Instagram Live Video Views Likes and Comments also', 242000, 20, 30000, 'refund related issue.\n1286 Instagram Live Video Views - Max 30k - Likes and Comments also 12.00 20 30000 3 hours and 27 minutes Starts within 1-2 mints after ordering\nstart live and then order\nHas random likes and comments\nmin 20 max 20k\nif have problem please share screenshot with time and no. of viewers.\n\nAvg Retention of viewers - 30 to 60 minutes', 'primary', '0', '', 'jumlah pesan rata rata 511 waktu proses 1 jam 18 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(152, 2011, 'Youtube Subscribers', 'Youtube Subscribe SERVER 7 [ 30 days refill ][ 100% real ] ', 429000, 20, 55000, '20+/day\nNO stuck\nNO drop\nStart Time: 0-1hrs', 'primary', '0', '', 'jumlah pesan rata rata 71 waktu proses 2 hari  14 jam  17   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(153, 2012, 'Telegram', 'Telegram - Channnel Members/Group Server 5 [ Max 5M] REAL FAST', 22330, 50, 5000000, 'NO REFILL\nLink: Https://T.Me/Username\nStart: 1-30 menit\nSpeed: 50000/Hari\nJika Anda Telah Mengubah Tautan Atau Saluran Dihapus Tidak Akan Ada canceled Pesanan', 'primary', '0', '', 'jumlah pesan rata rata 1.583 waktu proses 8 hari  11 jam  19   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(154, 2013, 'Telegram', 'Telegram - Channnel Members/Group Server 6 [ Max 10K] REAL INDIA ', 26400, 10, 10000, 'Link: Https://T.Me/Username\nStart: 0-360 Min\nSpeed: 5000/D\nRefill: 30 Days\nQuality: INDIAN\nJika Anda Telah Mengubah Tautan Atau Saluran Dihapus Tidak Akan Ada canceled Pesanan', 'primary', '0', '', 'jumlah pesan rata rata 285 waktu proses 1 jam 5 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(155, 2019, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S29 [ Refill 30 Days ] cheapeast ', 9350, 50, 10000, '- Guarantee: 30 days Refill\n- Instant Start\n- Refill button', 'primary', '1', '30', 'jumlah pesan rata rata 551 waktu proses 2 jam 12 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50');
INSERT INTO `medans` (`id`, `service_id`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(156, 2021, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 9 [ No Refill ] [ Fast ] BOT ', 3960, 50, 10000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 1.865 waktu proses 21 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(157, 2025, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S30 [ Refill 45D ] less - no drop', 20900, 20, 200000, 'fast\nkemungkinan 0-10% drop\nkualitas bagus', 'primary', '0', '', 'jumlah pesan rata rata 709 waktu proses 36 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(158, 2026, 'Instagram Reels', 'Instagram Reels Likes S1 [ Max - 20k ] INSTANT', 6050, 20, 20000, 'INSTANT', 'primary', '0', '', 'jumlah pesan rata rata 330 waktu proses 1 jam 13 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(159, 2027, 'Instagram Reels', 'Instagram Reels Likes S2 [ Max - 10k ] FAST', 13200, 10, 10000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 282 waktu proses 23 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(160, 2032, '- PROMO - ON OFF', 'Instagram Likes PROMO 1 [ SUPER MURAH DIDUNIA ] ', 154, 10, 20000, 'NO REFILL\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 530 waktu proses 23 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(161, 2039, 'Instagram Likes', 'Instagram Likes Server 9 [ Real ] [ NO DROP ] ', 2585, 100, 5000, 'No drop ( kemungkinan, drop hanya 10% )\ntetap no garansi', 'primary', '0', '', 'jumlah pesan rata rata 1.350 waktu proses 20 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(162, 2043, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 10 [ No Refill ] [ Fast ] BOT CHEAP', 3509, 10, 10000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 422 waktu proses 17 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(163, 2054, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S31 [ Refill button 10D ] 3k/days ♻️', 7260, 50, 10000, 'HQ\nwaktu mulai 0-24 jam', 'primary', '1', '10', 'jumlah pesan rata rata 568 waktu proses 1 jam 2 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(164, 2055, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S32 [ Refill 99days ] FAST HQ', 11000, 20, 200000, 'Drop sekitar 0-10%\nkualitas bagus\nNON DROP\nrefill 99 days', 'primary', '0', '', 'jumlah pesan rata rata 483 waktu proses 59 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(165, 2056, 'Twitter Followers', 'Twitter Followers Server 10 [ No refill ] ', 129800, 50, 1000, '- Start 0-1 hour\n- Speed up to 400 / day (The average speed per day is 50-400!)', 'primary', '0', '', 'jumlah pesan rata rata 203 waktu proses 10 jam 27 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(166, 2075, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 11 [ No Refill ] [ mix real ] ', 5225, 20, 10000, 'drop kemungkinan 10-20% untuk saat ini\nprofil ada story nya', 'primary', '0', '', 'jumlah pesan rata rata 540 waktu proses 1 jam 23 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(167, 2076, 'YouTube Shorts', 'Youtube Short Likes Server 1 [ refill 30 days ]', 28050, 10, 100000, 'fast\nno drop\ngaransi refill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 61 waktu proses 57 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(168, 2080, 'Youtube Views', 'Youtube Views Spesial [ 60days Guaranted ] BONUS Likes', 13200, 100, 5000000, 'Instant start\nwaktu mulai 0-6jam\nkecepatan 7k-15k/days', 'primary', '0', '', 'jumlah pesan rata rata 415 waktu proses 9 jam 57 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(169, 2081, 'Youtube View  [ untuk monetisasi - penghasil duit ]', 'Youtube views untuk penambah Adsense 1 ( 2 - 4$ )', 50600, 100, 10000, '- Durasi Video : Harus 5 menit+\n- Pendapatan bergantung pada berbagai faktor seperti kata kunci, panjang, topik, dan lokasi, dll.\n- Kami Tidak Menjamin Berapa Banyak Pendapatan yang Akan Anda Dapatkan? (tetapi $ 2 - 4 diperkirakan untuk 1000 view)\n- Garansi: kami hanya akan isi ulang view bukan pendapatan anda!\ngaransi 30 hari\n\nNOTE: kami tidak menjamin untuk pendapatan akan dapat terus, Kami hanya menggaransikan view\nlebih baik untuk mencoba pesan 100 saja dlu untuk mencobanya', 'primary', '0', '', 'jumlah pesan rata rata 602 waktu proses 13 jam 31 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(170, 2083, 'Youtube Subscribers', 'Youtube Subscribe VIP 2 [ 30Days refill ][ REAL ] 500/days NON DROP ', 484000, 100, 100000, '- Guarantee: 30 days\n- Speed : 500 - 2000+/D\n- 100 % real user\n- Almost NON DROP\n- jumlah subs harus di publik!\n- Use channel link or video link to order .\n- Channel harus mempunyai minimal 1 video', 'primary', '0', '', 'jumlah pesan rata rata 219 waktu proses 1 hari  2 jam  47   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(171, 2088, 'Youtube Subscribers', 'Youtube Subscribe VIP 3 [ 30Days autorefill ][ REAL ] BEST SELLER', 473000, 10, 50000, 'No stuck\nReal Subs\nBig orders more speed\n30D refill---- 2-3% drop auto refill in every 24hrs', 'primary', '0', '', 'jumlah pesan rata rata 24 waktu proses 17 jam 33 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(172, 2094, 'YouTube Shorts', 'Youtube Short Views Server 2 [No refill ] ', 12650, 100, 100000000, 'Instant Start\n5k-20k/day\nNo Refill', 'primary', '0', '', 'jumlah pesan rata rata 1.100 waktu proses 7 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(173, 2095, 'YouTube Shorts', 'Youtube Short Likes Server 2 [ refill 30 days ] cheap', 20350, 10, 100000, 'Instant Start\n30 Days Refill\nSuperfast\n20k-40k per day!', 'primary', '0', '', 'jumlah pesan rata rata 218 waktu proses 7 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(174, 2096, 'YouTube Shorts', 'Youtube Short Likes Server 3 [ no refill ] cheap ', 13750, 20, 50000, 'Instant Start\nSuperfast\nNo Refill\n10k-20k per day!', 'primary', '0', '', 'jumlah pesan rata rata 59 waktu proses 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(175, 2097, 'YouTube Shorts', 'Youtube Short Likes Server 4 [ Life Time Guaranteed ] cheap ', 39050, 20, 200000, 'FAST', 'primary', '0', '', 'jumlah pesan rata rata 261 waktu proses 30 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(176, 2103, 'Instagram Likes', 'Instagram Likes Server 10 [ mix ] [ Superfast, 30 days refill ]', 1650, 50, 15000, '30 days refill', 'primary', '1', '', 'jumlah pesan rata rata 152 waktu proses 2 jam 31 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(177, 2105, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Min 1k - unlimited ] cheap ', 21450, 1000, 10000000, 'Waktu mulai = Instan - 5 menit\njika Anda pesan 1000, Anda akan mendapatkan 1000 view dalam kelipatan 200-300 [ Live mungkin akan mendapatkan 200-300 like, dan menyelesaikan 1000 view]\n\nTidak ada reffund, tidak ada kompline\norder = berani naggung resiko', 'primary', '0', '', 'jumlah pesan rata rata 1.400 waktu proses 3 jam 13 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(178, 2108, 'Youtube Views', 'Youtube Views Server 5 [ 10K/Day ]  Lifetime Guarantee  [ Recommended#1]', 13750, 100, 10000000, 'Lifetime Guarantee\n5-10k/day', 'primary', '0', '', 'jumlah pesan rata rata 400 waktu proses 10 jam 40 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(179, 2116, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 13 [ cheap ] ', 2651, 10, 15000, 'INSTANT START\nBOT PROFILE\nBIG DROPS\nNO REFILL', 'primary', '0', '', 'jumlah pesan rata rata 533 waktu proses 14 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(180, 2121, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 24jam', 68200, 1000, 3000, '- Order 1000 views kamu dapat 100 - 300 live views stay di live mu 24jam\n- Order 2000 views kamu dapat 200 - 600 live views stay di live mu 24jam\n- Order 3000 views kamu dapat 300 - 900 live views stay di live mu 24jam\n\nCatatan :\n- Harap teruskan siaran langsungmu, Jangan segera mengakhiri siaran langsung. Jika video dihapus atau segera berakhir maka kami tidak dapat reffund/cancel.\n- Setelah order, tidak ada reffund.\n- tidak bisa cancel apapun itu alasannya\n- tidak ada refund apapun itu alasannya\norder = ambil resiko', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 4 hari  2 jam  16   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(181, 2122, 'Facebook Followers / Friends', 'Facebook Follower Profile indonesia  8 [ max 50 ] ', 60500, 50, 50, 'waktu proses 0-7 jam', 'primary', '0', '', 'jumlah pesan rata rata 50 waktu proses 4 jam 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(182, 2123, 'Facebook Followers / Friends', 'Facebook Follower Profile  9 [ real ] [ Refill 30 Days ]', 36300, 1000, 100000, 'waktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 1.200 waktu proses 1 hari  5 jam  41   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(183, 2127, 'Youtube View Jam Tayang', 'Youtube Views [ Jam Tayang ] [ Durasi Video 2 jam+ ] [ G60 ] [ cek Deskripsi ] ', 93500, 1000, 5000, 'jumlah order kelipatan 1000\norder 1000,2000\njika order 600 atau 2300 tidak bisa\n\n- kemungkinan Anda akan mendapatkan waktu tonton 4000 jam  dalam 4 hari\n- garansi refill: 60 hari\n- pesan 1000 = 1000jam tayang\n- Harap gunakan video berdurasi 2 jam atau lebih untuk memesan (Jika Anda menggunakan video kurang dari 2 jam maka Anda tidak akan mendapatkan cukup waktu tonton, Tidak ada isi ulang, tidak ada pengembalian uang dalam kasus ini)\nCATATAN:\n- Saat menggunakan penayangan kami, jangan pada saat yang sama menggunakan penayangan dari pihak ke-3 dan jika video menerima penayangan organik, Anda tidak akan mendapatkan waktu tonton yang cukup. Kami tidak bertanggung jawab dalam kasus ini\n- Lebih baik gunakan video baru dan tidak ada penayangan organik untuk menjalankan waktu tonton.\n- Setelah Pesanan, kami tidak dapat mengembalikan/Pengembalian dana partial/Batal.', 'primary', '0', '', 'jumlah pesan rata rata 1.400 waktu proses 20 hari  10 jam  53   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(184, 2135, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S12 [ REAL AKTIF ][ 2K ] Refill 7 days ', 55000, 100, 500, 'proses 1x24 jam\nreal aktif\n\nRefill 7 days \nhanya bisa 2x refill tapi ada cooldown 2 hari\nsyaratnya\n- foll dibawah start order/jumlah awal gak bisa refill.\n- user private gak bisa refill\n- orderan belum ada 24 jam belum bisa refill', 'primary', '0', '', 'jumlah pesan rata rata 296 waktu proses 18 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(185, 2142, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S35 [ refill 7days ]  cheap ', 4950, 10, 30000, 'Instant start\ntidak ada reffund\nhanya refill jika drop\njangan berharap lebih sama layanan murah', 'primary', '0', '', 'jumlah pesan rata rata 910 waktu proses 2 jam 6 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(186, 2143, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S36 [ refill 30days ] [ cheap & less drop ] ♻️', 8140, 50, 200000, '0-10% drop\nReal Mixed\nSpeed 10Kday', 'primary', '1', '30', 'jumlah pesan rata rata 625 waktu proses 8 jam 2 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(187, 2153, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 16 [ NEW ] [ no refill ] ', 5060, 100, 10000, 'waktu proses 0-12 jam\n', 'primary', '0', '', 'jumlah pesan rata rata 421 waktu proses 25 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(188, 2155, 'Instagram VERIFIED ', 'Instagram  Followers [1 Follower] VERIFIED/CENTANG BIRU', 16500, 1000, 1000, 'mendapatkan 1 followers yang verified/centang biru\nproses bisa 3-7 hari\nbahkan mungkin bisa sebulan\ntolong bersabar', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 4 hari  16 jam  8   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(189, 2156, 'Instagram VERIFIED ', 'Instagram Followers [2 Follower] VERIFIED/CENTANG BIRU ', 31350, 1000, 1000, 'mendapatkan 2 followers yang verified/centang biru\nproses bisa 3-7 hari\nbahkan mungkin bisa sebulan\ntolong bersabar', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 5 hari  10 jam  28   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(190, 2157, 'Instagram VERIFIED ', 'Instagram Likes VERIFIED/CENTANG BIRU DONE 24 JAM [Rp 13.000 1like ]', 14300000, 1, 13, 'Jika tidak selesai dalam 1-3 hari\nlangsung bikin tiket', 'primary', '0', '', 'jumlah pesan rata rata 1 waktu proses 1 hari  15 jam  29   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(191, 2158, 'Instagram VERIFIED ', 'Instagram Comments [CUSTOM] VERIFIED/CENTANG BIRU DONE 24 JAM [Rp 22.000 1 Comments  ]', 24200000, 1, 13, 'jika dalam seminggu belum masuk\nsilahkan ke tiket', 'custom_comments', '0', '', 'jumlah pesan rata rata 1 waktu proses 19 jam 55 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(192, 2160, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 17 [ NEW ] [ no refill BOT ] ', 4620, 100, 10000, 'NO Refill', 'primary', '0', '', 'jumlah pesan rata rata 405 waktu proses 16 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(193, 2161, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S37 [ refill 30days ] [ cheap ] ', 6160, 10, 50000, '0 - 10 mins', 'primary', '0', '', 'jumlah pesan rata rata 1.151 waktu proses 1 jam 32 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(194, 2169, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  10 Cheapest [ No refill ] ', 9790, 50, 50000, 'Best Price\nNO REFILL\nno garansi', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 3 jam 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(195, 2170, 'Instagram Views', 'instagram view UPDATE 1 [ Bisa untuk REEL/IGTV/VIDEO ]', 8140, 100, 5000000, 'Emergency\n50k/hour', 'primary', '0', '', 'jumlah pesan rata rata 828 waktu proses 1 jam 3 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(196, 2174, 'Youtube Views', 'Youtube Views JUMBO 1 [ 30 days  AUTO REFILL ] FAST 250k/day BONUS LIKE+++', 18150, 15000, 10000000, 'Layanan super cepat\nSebagian besar DISARANKAN dan EKSTERNAL\nDrop: jika drop dari view berlebih tidak ada refill\n\nTIDAK ADA PENGEMBALIAN DANA ATAU ISI ULANG UNTUK JUMLAH PENGIRIMAN TAMBAHAN', 'primary', '0', '', 'jumlah pesan rata rata 81.525 waktu proses 2 hari  10 jam  17   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(197, 2176, 'Youtube Subscribers [ No Refill ]', 'Youtube Subscribe SERVER 13 [ NO refill ]', 19250, 100, 10000, 'TIDAK ADA KOMPLINE SAMA SEKALI\ndalam kasus apapun\nORDER = BERANI AMBIL RESIKO\nInstant - 1 hours\n1k-10k/day\nbisa drop dalam hitungan jam', 'primary', '0', '', 'jumlah pesan rata rata 255 waktu proses 40 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(198, 2182, '- PROMO - ON OFF', 'Instagram Views PROMO 1 [ REEL dan Video biasa dan TV ] SUPERMURAH', 138, 100, 1000000, 'SUPERFAST\njika delay/banyak pesanan kemungkinan selesai dalam 1-12 jam\n\nDilarang kompline dalam hal apapun\nlayanan promo\norder = berani ambil resiko', 'primary', '0', '', 'jumlah pesan rata rata 2.391 waktu proses 10 menit.', '2022-12-13 07:16:50', '2022-12-13 07:23:21'),
(199, 2185, 'Instagram Views', 'instagram view UPDATE 3 [ WORKS ON REEL AND IGTV ] DARURAT Cheap ', 495, 50, 100000000, '0-1H\nREAL\n100M', 'primary', '0', '', 'jumlah pesan rata rata 798 waktu proses 22 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(200, 2186, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube View Premiere Waiting Server 1 [ cek note ]', 38500, 1000, 1000000, '0-5 Minutes Starting time\n250-300 Viewers per 1000 Order\nNo Refill\nWatchtime - 30 minute to 90 Minute', 'primary', '0', '', 'jumlah pesan rata rata 1.650 waktu proses 1 jam 45 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(201, 2187, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube View Premiere Waiting Server 2 [ cek note ] MONETIZABLE', 58300, 1000, 10000000, '- START ( 0 - 20 mins )\n- MONETIZABLE | REAL\n- 100% Real Human YouTube Users Viewers\n- 100% Unique Traffic\n- World-Wide Viewers\n- Avg Concurrent and watch-time based on live stream content\n- Video must Unrestricted , embed must enabled\nNOTE :\n- Views are spread over the time to deliver live viewers so that they stay for atleast 30 mins - 2H\nEx : You order 1000 views, then ,1000 live viewers will spread over the time in 30 mins - 2H+.', 'primary', '0', '', 'jumlah pesan rata rata 1.200 waktu proses 1 hari  11 jam  20   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(202, 2188, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube View Premiere Waiting Server 3 [ cek note ] Automated Passive Views', 20900, 5000, 5000, '- Automated Passive Views - Pre-Premiere Waiting Viewers\n- You will get 5000 Unique Automated Passive Waiting Pre-Premiere Viewers that will stay and wait for 1 Hour!\n- INSTANT Start\n- Windows Desktop & Mobile Watch Page Waiting Viewers\n- World-Wide Viewers\n- Avg Concurrent waiting on Pre-Premiere content 500-1000+ waiting viewers\n- Great for Ranking!\n- Video Must be Unrestricted & Open for ALL countries\n\nNOTE : Service offered as-is with no refill/refund guarantee!\n** note that the Pre-Premiere Waiting viewers will NOT turn into viewers if the premiere/live broadcast will start during the campaign time-frame. (those waiting viewers will not be registered as Livestream viewers or as YouTube views or anywhere on the YouTube studio analytics!)', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(203, 2193, 'Twitter Followers', 'Twitter Followers Server 12 [ 30 days refill ] USA', 165000, 20, 10000, 'Start Time: 1 Hour\nREAL\nusername', 'primary', '0', '', 'jumlah pesan rata rata 136 waktu proses 6 jam 25 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(204, 2194, 'Instagram Like Komentar [ top koment ]', 'Instagram Like Komentar FAST Server 3 [ baca deskripsi ]', 23100, 20, 10000, 'untuk order di web \ntarget masukin link poto\nLink Post masukin username\n\nuntuk order Via API\nparameter target masukin link poto\nparameter custom_link masukin username\n\nwaktu mulai 0-2 jam\nNo Refill', 'custom_link', '0', '', 'jumlah pesan rata rata 23 waktu proses 40 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(205, 2196, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 18 [ no refill BOT ] INSTANT', 1320, 10, 1000, 'Tidak ada kompline apapun\nINSTANT START\nBOT PROFILE\nBIG DROPS\nNO REFILL', 'primary', '0', '', 'jumlah pesan rata rata 257 waktu proses 8 jam 50 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(206, 2202, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 30 menit', 2750, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 30 mins\n- Natural , real .', 'primary', '1', '', 'jumlah pesan rata rata 1.900 waktu proses 1 hari  8 jam  18   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(207, 2203, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 60 menit', 4070, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 60 mins\n- Natural , real .', 'primary', '1', '', 'jumlah pesan rata rata 1.550 waktu proses 1 hari  6 jam  25   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(208, 2204, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 120 menit ', 7480, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 120 mins\n- Natural , real .', 'primary', '1', '', 'jumlah pesan rata rata 2.500 waktu proses 1 hari  2 jam  48   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(209, 2205, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 12 jam', 17270, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 12h\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 3.000 waktu proses 1 hari  2 jam  24   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(210, 2206, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 24jam nonstop', 23100, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 24h\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 1.590 waktu proses 2 hari  3 jam  40   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(211, 2211, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S38 [ refill 99 hari ] [ Best seller ] ', 16500, 10, 1000000, 'Garansi 99 hari\nhanya refill kalo yg drop dari layanan kami\nrefill habis jika layanan tidak tersedia lagi', 'primary', '0', '', 'jumlah pesan rata rata 650 waktu proses 2 jam 21 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(212, 2216, 'Instagram Views', 'instagram view  21 [ Accept Video / TV / Reel ] CHEAPEST FAST', 110, 100, 1000000000, 'FAST\nCHEAPEST', 'primary', '0', '', 'jumlah pesan rata rata 5.707 waktu proses 48 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(213, 2218, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Refill S39 [ refill 365days ] FAST♻️', 4950, 10, 1000000, 'Start: 0-1Hrs\nSpeed: 2k-5k/days\nRefill: 365 days', 'primary', '0', '', 'jumlah pesan rata rata 963 waktu proses 2 jam 47 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(214, 2219, 'Instagram Likes', 'Instagram Likes Server 12 [ LESSDROP ] [ HQ Refill 45days ] ♻️', 1540, 10, 50000, 'Fast\nkualitas bagus\nStart: 0-1 jam', 'primary', '1', '45', 'jumlah pesan rata rata 226 waktu proses 21 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(215, 2221, 'Twitter Followers', 'Twitter Followers Server 13 [ 30 days refill ] FAST⚡️⚡️', 102300, 10, 200000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 131 waktu proses 8 jam 51 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(216, 2226, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S15 [ 5K ] BONUS++', 9350, 200, 5000, 'jika dapat bonus alhamdulillah\njika tidak jangan kompline\nproses 1-3 hari\nBOT INDO', 'primary', '0', '', 'jumlah pesan rata rata 240 waktu proses 4 hari  2 jam  12   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(217, 2227, 'Instagram Like Indonesia', 'Instagram Likes Indonesia  10 [ MAX 1K ] BONUS++ [ NOT SUPPORT REEL ]', 3520, 100, 4000, 'jika dapat bonus alhamdulillah\njika tidak jangan kompline\nproses 1-24 jam\njika blm 24 jam jangan kompline\nBOT INDO\n\ntidak bisa untuk reels', 'primary', '0', '', 'jumlah pesan rata rata 344 waktu proses 2 hari  4 jam  44   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(218, 2230, 'TikTok Followers', 'TIKTOK FOLLOWERS  3 [ HQ ] No Drop [ Max 500K ]  [ 30 DAYS REFILL ]', 20350, 100, 500000, 'target : bisa link profile atau username\nSuperfast service\n30 DAYS REFILL', 'primary', '0', '', 'jumlah pesan rata rata 600 waktu proses 3 jam 44 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(219, 2232, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 2 [ Refill 30days ] [ Real ]', 9900, 10, 50000, 'kami garansi 30 hari\n\nmulai: 0-1jam\nFastest\nHigh Quality', 'primary', '0', '', 'jumlah pesan rata rata 835 waktu proses 1 jam 56 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(220, 2235, 'Youtube Subscribers', 'Youtube Subscribe VIP 7 [ 30Days refill ] [NO DROP] ', 533500, 100, 5000, 'order 1000 subs kemungkinan siap dalam 9-12 hari\n- Waktu mulai: 0 - 1jam \n- refill: 30 hari\n- 100% pengguna nyata\n- Hampir NON DROP\n\nJika jumlah subs disembunyikan Anda tidak akan mendapatkan jumlah awal\ndan jika tidak masuk subs kami tidak bertanggung jawab\nGunakan tautan saluran atau video ( KEDUANYA DITERIMA)\n', 'primary', '0', '', 'jumlah pesan rata rata 152 waktu proses 18 jam 31 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(221, 2236, 'Youtube Subscribers', 'Youtube Subscribe VIP 8 [ 30Days refill ] [NO DROP] Speed 30+-/D', 451000, 20, 6000, '- Start time : 0 - 2h\n- Speed : 30+ / day\n- NON DROP\n- Guarantee: 30 days\n- Min 100 - Max 6k\n- Good subs.', 'primary', '0', '', 'jumlah pesan rata rata 143 waktu proses 1 hari  10 jam  39   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(222, 2237, 'Youtube Subscribers', 'Youtube Subscribe SERVER 16  [ Refill 30days ] [ FAST ] ', 126500, 50, 5000, '1000 Subscriber /day\n30 days Guarantee\ndrop - 10-70%\nGampang drop!\nNo Refund, Only Refill', 'primary', '0', '', 'jumlah pesan rata rata 97 waktu proses 22 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(223, 2245, 'Facebook Video Views', 'Facebook Video Views Server 3 [ Monetization ] [  PAKET 600k menit ]', 101200, 10000, 10000, '- Start time: 0-24 H ( it Might need 0-72 Hours if there are Update or Overload )\n- Speed 50k-100k hours per day ( this speed is approximate and it may change depending on overload and updates )\n- Video must be at least +2Hours ( you can use an old live video posted on your timeline )\n- Monitizable Views\n- Example Order Format: https://www.facebook.com/user/videos/ID\n\nImportant Requirement: Go to the page: \" https://business.facebook.com/creatorstudio/?tab=monetization_home&collection_id=free_form_collection \", press Ctrl + U and search ( Ctrl + f ) for the keyword \"EAAciLZ\", copy the entire token here', 'primary', '0', '', 'jumlah pesan rata rata 7.000 waktu proses 4 hari  15 jam  52   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(224, 2246, 'Facebook Video Views', 'Facebook Video Views Server 4 [ No Refill ]  [Speed: 100K/Day]', 47300, 5000, 10000000, 'tidak ada garansi\nStart Time: Instant\nSpeed: Up to 100K/ day\nRefill: No refill / No refund\nSpecs: High Quality - 2 to 30 Minutes Video Watch Time !', 'primary', '0', '', 'jumlah pesan rata rata 5.000 waktu proses 1 hari  7 jam  54   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(225, 2250, 'Twitter Favorites/Like', 'Twitter Likes  1 [ No Refill ] Max 5K ', 21340, 10, 5000, 'No Refill\nSped - 5k/day', 'primary', '0', '', 'jumlah pesan rata rata 23 waktu proses 8 jam 38 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(226, 2251, 'Twitter Favorites/Like', 'Twitter Likes  2 [ 30days Refill ] Max 5K USA', 27830, 20, 5000, 'slow', 'primary', '0', '', 'jumlah pesan rata rata 169 waktu proses 23 jam 17 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(227, 2252, 'Twitter Favorites/Like', 'Twitter Likes  3 [ NO Refill ] FAST [HQ]', 62700, 10, 2500, 'selesai 1000\nkemungkinan tidak sampai 6 jam an\ntetap tunggu 1x24 jam', 'primary', '0', '', 'jumlah pesan rata rata 449 waktu proses 1 hari  12 jam  40   menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(228, 2254, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 3 less Drop [ Refill 30days ] ', 6490, 10, 50000, 'Accounts with Avatars and Posts.\nAuto-Refill up to 100% within a month. |\nCancel Button Enable\n\nCurrent speed: 26,890 per hour.\nDrop Ratio is: ~14%\n\nMost Affordable Price in Market\nOur Aim is to Give Best Quality to Our ALL Customer in Lowest Rate', 'primary', '0', '', 'jumlah pesan rata rata 637 waktu proses 1 jam 28 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(229, 2260, 'Instagram Like Komentar [ top koment ]', 'Instagram Like Komentar Indonesia [ BACA Deskripsi ]', 16500, 100, 100000, 'untuk order di web \ntarget masukin link poto\nLink Post masukin username\n\nuntuk order Via API\nparameter target masukin link poto\nparameter custom_link masukin username\n\nkualitas bot hq\nproses 0-6 jam jika komentar pada postingan tidak sampai 10rb\ntapi tidak menutup kemungkinan proses bisa max 3 hari', 'custom_link', '0', '', 'jumlah pesan rata rata 102 waktu proses 5 jam 36 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(230, 2264, 'Youtube View Target Negara', 'Youtube GEO views No Refill [ Indonesia ] ', 18040, 1000, 5000000, 'kualitas : Normal \nwaktu mulai : 0 - 24 jam\nSpeed: Instant\nRetention: 15s Up To +50 detik\nRefill: No Refill / Dapat Mengalami Penurunan Besar\nGood untuk Youtube Algorithm\nHigh Retention Rate', 'primary', '0', '', 'jumlah pesan rata rata 1.650 waktu proses 14 jam 34 menit.', '2022-12-13 07:16:50', '2022-12-13 07:16:50'),
(231, 2275, 'Youtube Subscribers', 'Youtube Subscribe SERVER 17 [ Lifetime Guarantee ] 15-25/day', 396000, 10, 30000, 'Instan\nCatatan - Kecepatan tinggi jika Anda memesan pelanggan dalam jumlah besar. Akun kecil atau hingga 500 pelanggan mungkin memerlukan waktu maksimal 24 jam untuk dikirimkan.\nTidak seperti jika kecepatan yang disebutkan adalah 1k/hari kecepatan per jam akan menjadi sekitar 50 , tetapi kecepatan akan dibagi rata pada semua pesanan tetapi untuk pesanan besar akan didedikasikan dan diselesaikan dengan cepat.\nPengguna Nyata\nLifetime Guarantee\nless Drop [20-30%]\n\nHarap Dicatat Saat ini pelanggan youtube tidak berfungsi seperti yang dijelaskan. jika Anda ingin membatalkan pesanan Anda, kami dapat melakukannya untuk Anda, tetapi kami tidak memiliki perkiraan kecepatan/waktu mulai yang TEPAT.', 'primary', '1', '', 'jumlah pesan rata rata 36 waktu proses 2 hari  2 jam  19   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(232, 2276, 'Twitter Followers', 'Twitter Followers Server 16 [ 30 days refill ] FAST CHEAP⚡️ ', 63800, 20, 1000, 'Instant\nR30 [ after requesting it may take 24-48h to start ]\n1K/Day\nQuality All profiles with profile pictures real looking', 'primary', '1', '30', 'jumlah pesan rata rata 46 waktu proses 2 jam 31 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(233, 2281, 'Shopee/Tokopedia/Bukalapak', 'Shopee Likes Produk Indonesia [ Max 25K ] [BONUS 5%] MURAH ', 5500, 50, 10000, 'High Quality\nInstan\nNO DROP', 'primary', '0', '', 'jumlah pesan rata rata 610 waktu proses 1 jam 22 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(234, 2289, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 1 [ No Refill ] [ 300/hour ]', 7150, 100, 100000, 'Instant\nKecepatan: 200-1000/jam (Semakin besar pesanan, semakin cepat tingkat pertumbuhannya)\nKecepatan dapat bervariasi jika kelebihan beban mungkin sangat lambat. tetapi dapat didorong sesuai permintaan\nDrop: 10-20%\nNo refill/refund', 'primary', '0', '', 'jumlah pesan rata rata 223 waktu proses 3 jam 53 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(235, 2290, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 2 [ No Refill ] [ 5k/day ]', 9790, 50, 1000, 'Instan\n1000 likes/1 kali order (bisa dipesan 20 kali).\nwaktu penyelesaian adalah 6-12 jam\nDrop: 5-15% [ jika drop diatas itu tetap tidak ada garansi ]\n[No Refill', 'primary', '0', '', 'jumlah pesan rata rata 50 waktu proses 47 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(236, 2291, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post / Video Likes Server 3 [ 30days Refill ] [ 3k/day ] ', 23100, 10, 5000, 'Link: https://www.facebook.com/zuck/posts/10114380064791681\nStart: Within 0 to 1 Hrs, Pls allow 6-12 hours.\nSpeed: 1000 to 10000 per 24 hours\nRefill: 30days\n\nURL Format: Photo/Video/Status Link\nQuality: Real\nGuarantee: 30days Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 146 waktu proses 28 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(237, 2292, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 4 [ 45days Refill ] [ REAL ] ', 25300, 100, 10000, 'REAL negara luar\n0-3 jam mulai!\nTanpa Drop! Garansi Isi Ulang 45 Hari.\nKecepatan Harian 3K\nHalaman, Grup, Profil Semua Tautan Terima.\nCONTOH LINK: https://www.facebook.com/zuck/posts/10114380064791681', 'primary', '0', '', 'jumlah pesan rata rata 1.222 waktu proses 2 hari  18 jam  5   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(238, 2294, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S19 [ max 500 murah real ] Refill 3days', 38500, 100, 500, 'BONUS 15-20%\nREAL', 'primary', '0', '', 'jumlah pesan rata rata 290 waktu proses 17 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(239, 2295, 'Instagram Like Indonesia', 'Instagram Likes Indonesia  11 [LANGSUNGMASUK] [ NODROP] [30K] REAL ACCOUNT BONUS 20% [ Refill 3Days ]', 7700, 20, 1000, 'IMPRESSION + REACH + PROFILE VISIT\nFAST\nRefill 3Days', 'primary', '0', '', 'jumlah pesan rata rata 179 waktu proses 28 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(240, 2298, 'TikTok Likes', 'TikTok Likes  13 [ REFILL 30D ][Speed: 2K/Day]', 24200, 10, 50000, 'waktu mulai 0-2 jam\nkualitas REAL tidak BOT tapi akun luar', 'primary', '0', '', 'jumlah pesan rata rata 54 waktu proses 1 jam 49 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(241, 2300, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions Server 1 MURAH CEPAT', 737, 100, 5000000, 'Instant\nFrom hashtags , Home , Profile & Other\nSuper Fast Delivery', 'primary', '0', '', 'jumlah pesan rata rata 2.230 waktu proses 33 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(242, 2303, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 5 [ 4-5 Minutes Start ] ', 5500, 100, 5000000, '4-5 Minutes Start Time\nMost Likes come From Vietnam Country\nHIgh Quality and Real Likes', 'primary', '0', '', 'jumlah pesan rata rata 171 waktu proses 1 jam 36 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(243, 2304, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 6 NO REFILL', 4950, 100, 5000000, '2.5k/days ~ 0-1hrs', 'primary', '0', '', 'jumlah pesan rata rata 155 waktu proses 1 jam 35 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(244, 2306, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 4 LessDrop [ Refill 30D ] [ 1-5k/days]', 4510, 50, 100000, 'waktu mulai 0-1jam\n1k-5k/day\nLess Drop', 'primary', '0', '', 'jumlah pesan rata rata 1.370 waktu proses 2 jam 30 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(245, 2310, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Server 5 LessDrop [ Refill 99days ] [30-50k/day]', 5610, 10, 1000000, 'masa garansi 99 hari refill di tiket\n0-1h\n30-50k/day\n5-10% drop maximum\nBest Quality', 'primary', '1', '99', 'jumlah pesan rata rata 677 waktu proses 2 jam 20 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(246, 2314, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes  1 [ No Refill  ] 50-200/day ', 9460, 100, 50000, '50-200/day', 'primary', '0', '', 'jumlah pesan rata rata 213 waktu proses 1 hari  23 jam  26   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(247, 2320, 'TikTok View', 'TIKTOK View Server 2 REKOMENDASI [1M/Day] ', 48, 100, 10000000, 'Speed: 1M/Day', 'primary', '0', '', 'jumlah pesan rata rata 5.038 waktu proses 58 menit.', '2022-12-13 07:16:51', '2022-12-13 07:23:21'),
(248, 2321, 'TikTok View', 'TIKTOK View Server 3 REKOMENDASI SUPER FAST', 176, 100, 2000000000, 'waktu mulai 0-1 jam', 'primary', '0', '', 'jumlah pesan rata rata 8.552 waktu proses 18 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(249, 2323, 'TikTok View', 'TIKTOK View Server 4 Emergency', 1705, 10, 25000000, 'waktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 1.564 waktu proses 4 jam 25 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(250, 2325, 'TikTok View', 'TIKTOK View Server 6 CHEAPEAST', 605, 50, 30000000, '0-6jam\n', 'primary', '0', '', 'jumlah pesan rata rata 1.280 waktu proses 10 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(251, 2326, 'Tiktok Comments ', 'Tiktok 1 Comments random [ Akun centang biru/ VERIFIED ] EKLUSIVE MEDANPEDIA', 19800, 1000, 1000, 'proses 2-7 hari\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 17 jam 23 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(252, 2336, 'Twitter Followers', 'Twitter Followers Server 17 [ 30 days refill ] FAST CHEAPEAST⚡️ ', 24750, 100, 5000, 'R30\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 661 waktu proses 3 jam 52 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(253, 2338, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 6 HQ [ Refill 365days ] [ Fast ] ', 7590, 10, 1000000, 'Fast \nRefill 365days', 'primary', '0', '', 'jumlah pesan rata rata 1.697 waktu proses 6 jam 0 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(254, 2339, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Server 7 [ Refill 99days ] [ 30-50k/day]', 5060, 10, 5000000, '99 Days Refill\n30-50k/day\nRefill button enabled', 'primary', '1', '90', 'jumlah pesan rata rata 517 waktu proses 1 jam 10 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(255, 2340, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 8 [ Refill 180days ] [ 30-50k/day] ( Recommended Service )', 8800, 10, 1000000, 'Speed 50K/day\nHQ Followers\nRefill: 180 Days ( Auto-Refill is Enable for 30 Days )\nDrop Ratio Below 0.5%', 'primary', '1', '180', 'jumlah pesan rata rata 400 waktu proses 1 jam 1 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(256, 2341, 'Instagram Views', 'instagram view Server 3 [ TV/VIDEO/REELS] INSTANT', 53, 100, 2000000000, 'Fast', 'primary', '0', '', 'jumlah pesan rata rata 1.863 waktu proses 20 menit.', '2022-12-13 07:16:51', '2022-12-13 07:23:22'),
(257, 2342, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views Live Stable Upto 50 Minutes', 7700, 2000, 500000, 'Stable 40-50 Minutes\nLive Streaming Mulai Rata-rata dalam 5-7 Menit\nSetelah Streaming Mulai\nView Langsung Akan Meningkat Perlahan Dan Akan Stabil Selama Live Viewer Hingga 50+ Menit Akan Meningkat\n\nHingga 200+ Live Viewer pada 2000 Streaming Pesanan\n\nPembeli Akan Mendapatkan Hingga 10% Live Viewer Selama Hingga 50 Menit\n( SEMUA Catatan ada di Pengujian dan Estimasi Kami, ini dapat bertambah atau berkurang menurut Update Youtube )\n( pesan kelipatan 100, Jangan order 2150 atau 2650 Order Seperti ini )\n', 'primary', '0', '', 'jumlah pesan rata rata 3.900 waktu proses 22 jam 35 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(258, 2346, 'Youtube View Jam Tayang', 'Youtube Views S3 [ Jam Tayang ] [ Durasi Video 45 menit+ ] [ G30 ] [ Super Service ] [ BACA Deskripsi ] ', 70400, 100, 20000, '- Gunakan video lebih dari 45 menit untuk mendapatkan hasil terbaik.\n- Waktu tonton: 45+ menit\n- Jika Anda menggunakan Durasi Video 45+ Menit : Pesan 1000 = mendapatkan 750+ jam\n- Server ini: Pesan 1000 = 750+ jam penayangan\n- Guarantee: 30 days Refill\n- Kecepatan: 1000-1500 Jam/ hari (kecepatan bisa berubah/lebih lama) Source: Suggested Videos\n(Source Dapat Diubah Tanpa Pemberitahuan Sebelumnya, Tergantung pada Pembaruan Youtube)', 'primary', '0', '', 'jumlah pesan rata rata 1.480 waktu proses 2 hari  23 jam  48   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(259, 2348, 'Youtube Subscribers', 'Youtube Subscribe SERVER 18 [ No drop ] [ refill 30day ] 40/day ', 374000, 20, 6000, 'Good subs- Start time : 0 - 2h\nSpeed : 30 - 60 / day\nNON DROP\nGuarantee: 30 days\nMin 20 - Max 6k', 'primary', '0', '', 'jumlah pesan rata rata 116 waktu proses 1 hari  4 jam  16   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(260, 2352, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 24jam [ BETA 1 murah ]', 25300, 500, 4000, '- Order 1000 views kamu dapat 75 - 300 live views stay di live mu 24jam\n- Order 2000 views kamu dapat 175 - 600 live views stay di live mu 24jam\n- Order 3000 views kamu dapat 275 - 900 live views stay di live mu 24jam\n\nCatatan :\n- Harap teruskan siaran langsungmu, Jangan segera mengakhiri siaran langsung. Jika video dihapus atau segera berakhir maka kami tidak dapat reffund/cancel.\n- Setelah order, tidak ada reffund.\n- tidak bisa cancel apapun itu alasannya\n- tidak ada refund apapun itu alasannya\norder = ambil resiko', 'primary', '1', '', 'jumlah pesan rata rata 3.600 waktu proses 1 hari  18 jam  51   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(261, 2353, 'Youtube Views', 'Youtube Views Server 11 [ R30 ] [ NO drop ]', 27500, 1000, 10000000, 'dalam pengujian kami \nLayanan ini belum ada drop\n20k/days', 'primary', '0', '', 'jumlah pesan rata rata 451 waktu proses 1 jam 37 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(262, 2359, 'Twitch', 'Twitch  Live Views [FOR 10 MINUTES] Fast', 77000, 100, 2000, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 1 jam 22 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(263, 2360, 'Twitch', 'Twitch Live Views [FOR 20 MINUTES] Fast ', 154000, 100, 2000, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(264, 2361, 'Twitch', 'Twitch Livestream Views 30 mins', 176000, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', 'jumlah pesan rata rata 21 waktu proses 6 jam 1 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(265, 2362, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Love ] [Non Drop]', 11550, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 283 waktu proses 6 jam 34 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(266, 2363, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ HaHa ] [Non Drop] ', 11550, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 135 waktu proses 3 jam 56 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(267, 2364, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ WoW ] [Non Drop] ', 11550, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 450 waktu proses 10 jam 2 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(268, 2365, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Sad ] [Non Drop] ', 11550, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 333 waktu proses 4 hari  3 jam  27   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(269, 2366, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Angry ] [Non Drop] ', 11550, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 443 waktu proses 1 hari  16 jam  23   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(270, 2367, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Love ] [Non Drop] [ max 50k ] fast', 14080, 50, 50000, 'instan \n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 182 waktu proses 46 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(271, 2368, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Care ] [Non Drop] [ max 50k ] fast ', 14080, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 102 waktu proses 1 jam 32 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(272, 2369, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ HaHa ] [Non Drop] [ max 50k ] fast', 14080, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 90 waktu proses 58 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(273, 2370, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ WoW ] [Non Drop] [ max 50k ] fast ', 14080, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 85 waktu proses 1 jam 35 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(274, 2371, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Sad ] [Non Drop] [ max 50k ] fast ', 14080, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 190 waktu proses 1 jam 7 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(275, 2372, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Angry ] [Non Drop] [ max 50k ] fast ', 14080, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 170 waktu proses 1 jam 14 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(276, 2374, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 21 [ NEW ] MURAH! ', 1122, 20, 5000, 'MURAH\nProses lama!', 'primary', '0', '', 'jumlah pesan rata rata 137 waktu proses 3 jam 2 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(277, 2377, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes Server 5 [ No Refill ] [ max 500k ]', 14740, 100, 500000, 'Link: https://www.facebook.com/pageusername\nStart: 1 min to 24 hrs ( Depend on Facebook update )\nSpeed: 100-10k ( Depend on Facebook update )\nRefill: No Refill', 'primary', '0', '', 'jumlah pesan rata rata 1.440 waktu proses 8 hari  5 jam  12   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(278, 2381, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  12 Cheapest [ No refill ] [ No Drop ] ', 4950, 10, 100000, 'Instan dan Cepat ( Kualitas Tinggi )\nMin 100 dan Max 100k\n( Tidak Ada Drop Sejak 90 Hari )\nIni Layanan no refill jika suatu saat drop tidak ada garansi!\n\nMedanpedia Tujuannya adalah Memberikan Harga Paling Terjangkau di Pasar', 'primary', '0', '', 'jumlah pesan rata rata 158 waktu proses 26 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(279, 2382, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  13 Cheapest [ 30 Days Refill ]', 7700, 10, 100000, 'Instant and Fast ( High Quality )\n30 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 160 waktu proses 20 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(280, 2389, 'Twitter Followers', 'Twitter Followers Server 19 [ No refill ] CHEAPEAST ', 14630, 10, 10000, 'Instant\n2-3k/jam', 'primary', '0', '', 'jumlah pesan rata rata 1.083 waktu proses 6 jam 9 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(281, 2390, 'TikTok Followers', 'TIKTOK FOLLOWERS  12 [ Speed 5k-10k/day ]', 18590, 100, 200000, 'Speed: 5-8k/Day\nMixed Quality Accounts', 'primary', '0', '', 'jumlah pesan rata rata 230 waktu proses 2 jam 5 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(282, 2391, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S21 [ REAL ] MAX 1k [ REFILL 3 HARI ]', 17820, 100, 1000, 'proses 1-3 hari\nsebelum 3 hari jangan kompline\n\nGaransi:\nKirimkan tiket untuk refill. Berlaku untuk 1x refill selama masa garansi dengan syarat jumlah followers yang drop lebih dari 30%, berstatus Success (tidak Partial), dan jumlah followers saat ini tidak kurang dari jumlah awal.\n\nCatatan:\nPersentase kemungkinan drop 10%-30% saat atau setelah proses. Pesanan akan dibatalkan (status menjadi Error) otomatis dan saldo dikembalikan jika masih pending setelah 72 jam. Bisa request cancel lebih cepat secara manual dengan menyertakan kode pemesanan melalui tiket. Dapat repeat order pada minggu berikutnya jika pesanan dengan data yang sama telah mencapai jumlah maksimal karena database selalu beregenerasi.', 'primary', '0', '', 'jumlah pesan rata rata 224 waktu proses 1 hari  5 jam  32   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(283, 2394, 'Facebook Reels Short Video', 'Facebook Likes Server 2 [Reels Short Video] [ 10k/day ] ', 10285, 100, 100000, '10k/day\nLink Format: https://www.facebook.com/username/videos/xxxxxxxxxx/', 'primary', '0', '', 'jumlah pesan rata rata 730 waktu proses 1 hari  5 jam  22   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(284, 2395, 'Facebook Reels Short Video', 'Facebook Likes Server 3 [Reels Short Video] [ 5k/day ] [ No Drop ]', 12650, 100, 50000, '5k/day\nLink Format: https://www.facebook.com/username/videos/xxxxxxxxxx/', 'primary', '0', '', 'jumlah pesan rata rata 371 waktu proses 11 jam 15 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(285, 2397, 'Twitter Favorites/Like', 'Twitter Likes  4 [ NO Refill ] FAST [HQ] [ 20/10k ]', 19690, 20, 10000, 'waktu mulai 0-1 jam', 'primary', '0', '', 'jumlah pesan rata rata 106 waktu proses 2 jam 33 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(286, 2407, 'Instagram Followers [ No Refill ]', 'Instagram Followers  3 [ no refill max 20k ] ', 2695, 100, 20000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 1.258 waktu proses 30 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51');
INSERT INTO `medans` (`id`, `service_id`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(287, 2415, 'Instagram Followers [ No Refill ]', 'Instagram Followers  4 EKLUSIVE [ REAL HQ ] LESS DROP ', 7040, 100, 5000, 'INSTANT\ndrop maksimal 5-15% saja\n1k-3k/day\nmax pesan saya buat 5.000 jika sudah sukses status, bisa order lagi\nmax per akun bisa isi sampai 20ribu followers\n\nBisa minta refill jika drop diatas 20%\ntetapi refill ini sifatnya random\nbisa refill bisa tidak\nlayanan tetap no refill!\njadi jika suatu saat drop gk bisa refill jangan banyak kompline', 'primary', '0', '', 'jumlah pesan rata rata 1.196 waktu proses 1 jam 14 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(288, 2417, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Komentar Server 2 [ 24 - 48 jam delivery ] [ CUSTOM ]', 539000, 10, 600, '24 - 48 jam delivery', 'custom_comments', '0', '', 'jumlah pesan rata rata 28 waktu proses 7 jam 14 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(289, 2418, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Komentar Server 3 [ max 1k ] [ CUSTOM ] ', 484000, 10, 1000, 'Link: Follow the description\nStart: 0-6hrs\nSpeed: 100-500/days\nRefill: 30 days\n\nQuality: High Quality\nQuantity: Min 10, Max 600', 'custom_comments', '0', '', 'jumlah pesan rata rata 54 waktu proses 8 jam 50 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(290, 2421, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 4 [ No garansi ] FAST [ max 300k ]', 12100, 10, 300000, '50K-100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 96 waktu proses 37 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(291, 2422, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 5 [ No garansi ] FAST [ max 500k ] ', 12650, 100, 500000, 'FAST\n20-50K/DAYS', 'primary', '0', '', 'jumlah pesan rata rata 675 waktu proses 4 jam 54 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(292, 2423, 'Youtube Views', 'Youtube Views Server 13 [ 100K/Day ] Lifetime Guarantee [ Short and Long Video Both Accepted ]', 12100, 100, 50000000, 'INSTANT START', 'primary', '0', '', 'jumlah pesan rata rata 645 waktu proses 14 jam 44 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(293, 2425, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 10 [ Refill 365D ] [ 400-500k/day ] EKLUSIVE', 4070, 100, 500000, 'Speed 400-500K / day\nRefill 365 Days\nada bonus followers jika hoki', 'primary', '1', '365', 'jumlah pesan rata rata 935 waktu proses 2 jam 8 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(294, 2441, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 3 [ Lifetime guaranted ] [ BEST SELLER ]', 48400, 5, 100000, 'Real and Active Followers and Likes\nProses 1x24 jam', 'primary', '0', '', 'jumlah pesan rata rata 398 waktu proses 1 jam 1 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(295, 2443, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 6 [ 30 dayst guaranted ] 3K/Days', 36300, 10, 30000, '3K/Days \nestimasi bisa lebih lama karna overload dan ada perubahan sistem tiktok\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 442 waktu proses 1 jam 41 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(296, 2446, 'Twitch', 'Twitch Followers Server 1 [ Max 150K ] [ Speed 1-5k ]  R30days', 12100, 100, 150000, 'FAST', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(297, 2447, 'Twitch', 'Twitch Followers Server 2 [ Max kK ] [ Speed 5K/D ] ', 3740, 20, 5000, 'FAST', 'primary', '0', '', 'jumlah pesan rata rata 573 waktu proses 2 jam 30 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(298, 2448, 'Twitch', 'Twitch Followers Server 3 [ Max 50K ] [ Speed 5K/Day ] AUTO REFILL 15D ', 14850, 100, 50000, 'AUTO REFILL 15 DAYS', 'primary', '0', '', 'jumlah pesan rata rata 356 waktu proses 1 jam 7 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(299, 2451, 'Youtube Subscribers', 'Youtube Subscribe SERVER 19  [ 30 days guarantee ] [ Bonus Views ] RECOMMENDED', 484000, 100, 5000, 'Speed - 300-500/day\n30 Days guarantee\nDrop 5%', 'primary', '0', '', 'jumlah pesan rata rata 576 waktu proses 21 jam 54 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(300, 2452, 'Youtube Subscribers', 'Youtube Subscribe SERVER 20 [ 30 days guarantee ] [ 300/day ]', 341000, 400, 5000, '30 Days Refill\nSpeed 1k-5k/ Day\n0-1 hour Start\nRefill Button Enabled\nStart - 0-12 hours\nDrop Ratio: 10-20%', 'primary', '0', '', 'jumlah pesan rata rata 590 waktu proses 4 hari  6 jam  38   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(301, 2453, 'Youtube Subscribers', 'Youtube Subscribe SERVER 21 [ 30 days guarantee ] [ 500/day ] ', 297000, 100, 5000, '30 Days Guarantee\nMin 500 Max 5000\nSpeed 500-1k/day\n30 Days Guarantee\nStart - 0-24 hours [ Do not ask cancel before 24 hours]', 'primary', '0', '', 'jumlah pesan rata rata 214 waktu proses 1 hari  12 jam  37   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(302, 2465, 'Telegram', 'Telegram - Channnel Members/Group Server 11 [30K] [ AUTO Refill 30 days ] Non Drop ', 13750, 100, 30000, 'Instant\nSpeed: 20K+ day\n- Non Drop\n- auto Refill 30 day', 'primary', '0', '', 'jumlah pesan rata rata 790 waktu proses 1 jam 29 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(303, 2467, 'Twitter Followers', 'Twitter Followers Server 20 [ No refill ] SuperInstant ', 14300, 10, 20000, 'Instant, tapi bisa aja lambat saat overload atau ada update twitter\nSpeed: 20K/Day', 'primary', '0', '', 'jumlah pesan rata rata 206 waktu proses 10 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(304, 2468, 'Twitter Followers', 'Twitter Followers Server 21 [ Refill 30D ] SuperInstant ', 17600, 10, 20000, 'Instant, tapi bisa aja lambat saat overload atau ada update twitter\nSpeed: 20K/Day', 'primary', '0', '', 'jumlah pesan rata rata 195 waktu proses 8 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(305, 2470, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [Fast service] [ 15 MInutes ]', 297000, 300, 2000, 'Start in 3-5 minutes\nConcurrent Live will be ( 70-100% )\nNo Cancellation issue\n( If Video Deleted, Buyer Will Get Partial Refund )', 'primary', '0', '', 'jumlah pesan rata rata 440 waktu proses 9 jam 47 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(306, 2471, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [Fast service] [ 30 MInutes ] ', 583000, 300, 2000, 'Start in 3-5 minutes\nConcurrent Live will be ( 70-100% )\nNo Cancellation issue\n( If Video Deleted, Buyer Will Get Partial Refund )', 'primary', '0', '', 'jumlah pesan rata rata 667 waktu proses 1 jam 24 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(307, 2472, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [Fast service] [ 60 MInutes ] ', 770000, 300, 2000, 'Start in 3-5 minutes\nConcurrent Live will be ( 70-100% )\nNo Cancellation issue\n( If Video Deleted, Buyer Will Get Partial Refund )', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(308, 2476, 'Instagram Live Video', 'Instagram Live Video Views [ Durasi 60 Menit ] INSTANT', 148500, 10, 5000, 'INSTANT', 'primary', '0', '', 'jumlah pesan rata rata 95 waktu proses 43 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(309, 2481, 'SoundCloud', 'SoundCloud Plays [Max: 10M]', 363, 50000, 1000000000, 'Start Time: Instant - 12 hours\nSpeed: 3 to 5mil/ day\nSpecs: Full Link !', 'primary', '0', '', 'jumlah pesan rata rata 50.000 waktu proses 1 hari  16 jam  54   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(310, 2484, 'Youtube Subscribers', 'Youtube Subscribe SERVER 22 [ 30 days guarantee ] [ NON DROP ] Speed 150/D', 396000, 100, 5000, '- Start time : 1 - 24h\n- Speed up to 100 / day (The average speed per day is 30-100!)\n- if the speed is less than 100 per day, partial is possible!\n- Real user\n- Guarantee: 30 days\n- Min 50 - Max 5k\n- Order channel url https://www.youtube.com/channel/xxxx , channel must show number of subs\n\nNOTE : if channel : Hide number of subs, restricted, changing username, old drop , channel delete, etc. The order will be completed due to reasons preventing shipping. In this case , take long time to cancel', 'primary', '0', '', 'jumlah pesan rata rata 191 waktu proses 1 hari  2 jam  4   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(311, 2491, 'Instagram Likes', 'Instagram Likes Server 19 [ 50k/day ] [  REAL ] ', 1210, 10, 50000, '50k/hari\nkemungkinan 10% Drop saja \ntidak ada isi ulang untuk kasus terburuk.', 'primary', '0', '', 'jumlah pesan rata rata 262 waktu proses 17 jam 0 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(312, 2492, 'TikTok View', 'TIKTOK View Server 13  [ Max 100jt ] [ 100k/day ]', 46, 100, 100000000, 'Tiktok Video Link\nharus publik akun jangan di privasi\n100k/day', 'primary', '0', '', 'jumlah pesan rata rata 5.592 waktu proses 29 menit.', '2022-12-13 07:16:51', '2022-12-13 07:23:23'),
(313, 2494, 'Instagram Likes', 'Instagram Likes S1 [ FAST MURAH ]', 759, 20, 20000, 'Superfast\nNo refill', 'primary', '0', '', 'jumlah pesan rata rata 143 waktu proses 1 jam 22 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(314, 2495, 'Instagram Likes', 'Instagram Likes S2 [ FAST No Drop ] 500/hour ', 1210, 50, 1000000, 'waktu mulai 0-1j\nkecepatan 500+/jam\nNodrop\nTidak ada refill jika ada update terburuk', 'primary', '0', '', 'jumlah pesan rata rata 158 waktu proses 46 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(315, 2496, 'Youtube Views', 'Youtube Views S1 [ 3-4k/day ] + bonus likes + Traffic Source- External + Direct [ Lifetime Guarantee ]', 12870, 100, 120000, 'Lifetime Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 495 waktu proses 6 jam 58 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(316, 2497, 'Youtube Views', 'Youtube Views S2 [ 2-5k/day ] + bonus likes + Traffic Source- Mixed [R30]', 9130, 100, 160000, 'Refill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 300 waktu proses 3 jam 5 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(317, 2499, 'Shopee/Tokopedia/Bukalapak', 'Shopee Video Like Indonesia [ Max 15K ] [BONUS 5%] MURAH ', 7150, 50, 15000, 'Maksimal proses 24 jam\nMasukkan Link shopee video\nNo refund jika double order dan yg masuk hanya 1 orderan, silahkan tunggu sampai orderan sebelumnya berstatus Success', 'primary', '0', '', 'jumlah pesan rata rata 80 waktu proses 6 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(318, 2502, 'Youtube View Jam Tayang', 'Youtube Views S5 [ Jam Tayang ] [ Bebas Durasi ] [ G30 ] [ Super Service ] [ BACA Deskripsi ] ', 49500, 500, 8000, '- Start Time: 0-24 Hours\n- Speed: 500 -1000/Day\n- Guarantee: 30 days\n- Put channel link NO video link\n- Auto refill if any drop\n- 100% real .\n- Order 500,1k ,2k ,4k ... views , will get 500,1k ,2k ,4k ... Hours', 'primary', '0', '', 'jumlah pesan rata rata 1.940 waktu proses 8 hari  1 jam  2   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(319, 2503, 'Youtube Views', 'Youtube Views S3 [ 20K/day ] + Suggested [ Lifetime Guarantee ] ', 11550, 100, 500000, '20K/day', 'primary', '0', '', 'jumlah pesan rata rata 1.145 waktu proses 14 jam 54 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(320, 2510, 'Instagram Views', 'instagram view Server 8 [ TV/VIDEO/REELS] [UPDATED WORKING] CHEAP ', 682, 100, 10000000, 'Max 10Juta', 'primary', '0', '', 'jumlah pesan rata rata 3.250 waktu proses 36 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(321, 2512, 'Youtube Views', 'Youtube Views S4  [ Good For Ranking ] Life Time Guaranteed', 16500, 1000, 100000000, 'Source : Mobile Devices - Android\nSpeed 50-100k Per Day\nRetention : 20-50 Second\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 15 jam 22 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(322, 2513, 'Youtube Views', 'Youtube Views S5  [ 60K/day - Suggested Views + 2-3% Bonus LIKES ]', 11550, 100, 9000000, 'Speed 40K/day\n60 Days FreeRefill IN case drop\nSource : Suggested Videos\n2-3% Bonus Likes ( Free with Views )\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 499 waktu proses 11 jam 5 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(323, 2514, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  14 Cheapest Indonesian [ 30 Days Refill ] Instant ', 5390, 10, 1000000, 'Instant Start\nBest Quality with World Cheapest Price )\n30 Days Free Refill if You Found Single Likes Drop', 'primary', '0', '', 'jumlah pesan rata rata 255 waktu proses 32 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(324, 2516, 'Telegram', 'Telegram - Channnel Members/Group Server 13 [ 30K ] INSTAN AUTO REFILL 7DAYS', 8470, 100, 30000, '10-30k day', 'primary', '0', '', 'jumlah pesan rata rata 1.135 waktu proses 1 jam 18 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(325, 2517, 'TikTok  share', 'TIKTOK Share  3 MAX 100jt TERMURAH', 363, 10, 100000000, '10/10M', 'primary', '0', '', 'jumlah pesan rata rata 1.400 waktu proses 32 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(326, 2521, 'TikTok Followers', 'TIKTOK FOLLOWERS BETA 1 [ No Refill ] REAL', 9130, 10, 100000, 'No Refill\nSANGAT SLOW\nTIDAK REKOMENDASI YANG PINGIN CEPAT', 'primary', '0', '', 'jumlah pesan rata rata 20 waktu proses 6 hari  10 jam  36   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(327, 2524, 'Youtube Subscribers', 'Youtube Subscribe S2 [ Lifetime Guaranteed ] Best for Monetization', 390500, 200, 1000000, 'Target : Youtube Channel Link\nLokasi : Global\nWaktu Penyelesaian: 0-24 Jam, Dapat diperpanjang hingga 72 jam dalam Intensitas.\nkemungkinan 10k/days\n\nCatatan:\n Saat layanan Overload, kecepatan awal proses berubah.\n Jangan melakukan pemesanan kedua pada link yang sama sebelum pesanan Anda Sukses di sistem.\n Jika ada masalah dengan layanan, silakan hubungi Tiket.', 'primary', '0', '', 'jumlah pesan rata rata 510 waktu proses 1 hari  7 jam  47   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(328, 2526, 'TikTok  share', 'TIKTOK Share  4 MAX 1jt TERMURAH BONUS VIEW', 99, 300, 1000000, '100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 12.664 waktu proses 5 hari  3 jam  41   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(329, 2527, 'Youtube Subscribers', 'Youtube Subscribe S3 [ Refill 30 days ] EXCLUSIVE', 209000, 100, 5000, 'waktu mulai : 0-30min\nKecepatan : 100-200/day\nDrop : Non drop ( kalau terjadi drop kemungkinan hanya 5% )\nRefill : 30 days', 'primary', '0', '', 'jumlah pesan rata rata 197 waktu proses 1 hari  3 jam  57   menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(330, 2538, 'Instagram Views', 'instagram view Server 3 SUPERFAST [ TV/VIDEO/REELS] ', 1210, 100, 1000000, 'SUPERFAST', 'primary', '0', '', 'jumlah pesan rata rata 4.725 waktu proses 15 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(331, 2539, 'Instagram Views', 'instagram view Server 4 SUPERFAST [ TV/VIDEO/REELS]  Recommended ', 990, 100, 5000000, 'Best Service in the World\nGaransi seumur hidup jika drop', 'primary', '0', '', 'jumlah pesan rata rata 1.530 waktu proses 8 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(332, 2548, 'Instagram Views', 'instagram view Server 9 FAST [ VIDEO/TV/REELS ] Max 1M ', 616, 100, 5000000, '0-15 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 2.450 waktu proses 39 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(333, 2554, 'Instagram Likes', 'Instagram Likes S7 [ Max 100K ] Nondrop + Bonus', 528, 10, 100000, 'Instan\nno drop\njika ada masalah tentang ig dan drop, tetap no garansi', 'primary', '0', '', 'jumlah pesan rata rata 481 waktu proses 2 jam 8 menit.', '2022-12-13 07:16:51', '2022-12-13 07:16:51'),
(334, 2558, 'Facebook Followers / Friends', 'Facebook Follower Profile  15 [ murah max 100k ] SLOW', 12100, 100, 100000, 'waktu mulai 0-6 jam\nperhari kemungkinan 300 followers', 'primary', '0', '', 'jumlah pesan rata rata 825 waktu proses 23 jam 50 menit.', '2022-12-13 07:16:52', '2022-12-13 07:16:52'),
(335, 2560, 'Youtube Subscribers', 'Youtube Subscribe S7 [ 90 days refill ] [ Speed Up to 100/Day ]', 216700, 50, 10000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 149 waktu proses 4 hari  2 jam  55   menit.', '2022-12-13 07:16:52', '2022-12-13 07:16:52'),
(336, 2562, 'Youtube View Jam Tayang', 'Youtube Views S6 [ Jam Tayang ] [ 15 Minutes Video ] [ G30 ] [  NON DROP ] [ BACA Deskripsi ] Fastest ', 35200, 100, 16000, 'New watch Hours 100% Non-Drop\nGood For Monetization\nSpeed: 1000 Per Hour\nGuarantee: 30 Days refill\n\nSource: Mostly Suggested videos\n\nUse 15 Minute + Lenght Video To Get Full Watch Hours\nOrder 1000 = 250 Hours', 'primary', '0', '', 'jumlah pesan rata rata 838 waktu proses 1 hari  17 jam  37   menit.', '2022-12-13 07:16:52', '2022-12-13 07:16:52'),
(337, 2563, 'Youtube View Jam Tayang', 'Youtube Views S7 [ Jam Tayang ] [ 30 Minutes Video ] [ G30 ] [ NON DROP ] [ BACA Deskripsi ] Fastest ', 59950, 100, 8000, 'New watch Hours 100% Non-Drop\nGood For Monetization\nSpeed: 1000 Per Hour\nGuarantee: 30 Days refill\nSource: Mostly Suggested\nUse a Minimum 30 Minute Video To Get Full Watch Hours\nOrder 1000 = 500 Hours', 'primary', '0', '', 'jumlah pesan rata rata 818 waktu proses 1 hari  14 jam  20   menit.', '2022-12-13 07:16:52', '2022-12-13 07:16:52'),
(338, 2564, 'Youtube View Jam Tayang', 'Youtube Views S8 [ Jam Tayang ] [ 60 Minutes Video ] [ G30 ] [ NON DROP ] [ BACA Deskripsi ] Fastest ', 85800, 100, 4000, 'New watch Hours 100% Non-Drop\nSpeed: 1000 Per Hour\nGuarantee: 30 Days refill\nSource: Mostly Suggested\nUse a Minimum 60 Minute Video To Get Full Watch Hours\nOrder 1000 = 1000 Hours', 'primary', '0', '', 'jumlah pesan rata rata 550 waktu proses 1 hari  2 jam  48   menit.', '2022-12-13 07:16:52', '2022-12-13 07:16:52'),
(339, 2565, 'Telegram', 'Telegram - Channnel Members/Group Server 14 [ 30K ] INSTAN AUTO REFILL 3DAYS ', 7480, 100, 30000, 'Instant\nSpeed 10-20k day\nAutoRefill 3 day', 'primary', '0', '', 'jumlah pesan rata rata 650 waktu proses 1 jam 3 menit.', '2022-12-13 07:16:53', '2022-12-13 07:16:53'),
(340, 2566, 'Instagram Likes', 'Instagram Likes S7 [ Guaranted 30 days ] [ 20k/day ] Real Mixed', 440, 10, 50000, '20k/day\nGuaranted 30 days', 'primary', '0', '', 'jumlah pesan rata rata 610 waktu proses 3 jam 25 menit.', '2022-12-13 07:16:53', '2022-12-13 07:16:53'),
(341, 2568, 'TikTok Likes', 'TIKTOK Likes Server 8 [ Refill 30 Days ]  Speed 10K/Day', 11220, 100, 10000, 'max 10k', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 5 jam 38 menit.', '2022-12-13 07:16:53', '2022-12-13 07:16:53'),
(342, 2569, 'TikTok Likes', 'TIKTOK Likes Server 9 [ Refill 30 Days ] Max 50k', 12210, 100, 50000, 'Start: Instant\nSpeed: 10K in 10 Minutes\nQuality: Accounts with avatars\nRefill: 30 Days Instant Refill Button\nNon Drop', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 3 jam 10 menit.', '2022-12-13 07:16:54', '2022-12-13 07:16:54'),
(343, 2571, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 8 [ 30 days guaranted ] Speed 3k/day ', 39600, 100, 200000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 870 waktu proses 6 jam 3 menit.', '2022-12-13 07:16:54', '2022-12-13 07:16:54'),
(344, 2572, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 9 [ auto refill 30 hari ] REAL', 55000, 10, 50000, 'refill 30 days\njika tidak terefill otomatis dalam 3 hari bisa req refill\nwaktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 314 waktu proses 1 jam 38 menit.', '2022-12-13 07:16:54', '2022-12-13 07:16:54'),
(345, 2573, 'Instagram Views', 'instagram view Server 10 SUPERFAST [ VIDEO/REELS ] [ TV tidak Bisa ] Max 10M ', 770, 100, 10000000, 'Speed: 1M - 2M In 15 minutes\nStart: Instant\nada beberapa pesanan yg status nya stuck\nsebelum kompline silahkan cek apakah sudah masuk atau belum view nya', 'primary', '0', '', 'jumlah pesan rata rata 2.400 waktu proses 29 menit.', '2022-12-13 07:16:54', '2022-12-13 07:16:54'),
(346, 2574, 'Youtube Subscribers', 'Youtube Subscribe S7 [ 60 days refill ] [ Speed Up to 3000/Day ] ', 594000, 100, 50000, '0 - 1 Hour', 'primary', '0', '', 'jumlah pesan rata rata 225 waktu proses 6 jam 34 menit.', '2022-12-13 07:16:54', '2022-12-13 07:16:54'),
(347, 2576, 'Telegram Reactions', 'Telegram PartyPopper Reaction', 748, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat', 'primary', '0', '', 'jumlah pesan rata rata 55 waktu proses 8 jam 54 menit.', '2022-12-13 07:16:54', '2022-12-13 07:16:54'),
(348, 2577, 'Telegram Reactions', 'Telegram StarStruck Reaction ', 748, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat', 'primary', '0', '', 'jumlah pesan rata rata 121 waktu proses 9 jam 1 menit.', '2022-12-13 07:16:55', '2022-12-13 07:16:55'),
(349, 2578, 'Telegram Reactions', 'Telegram Fire Reaction ', 748, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat dan lebih lama', 'primary', '0', '', 'jumlah pesan rata rata 349 waktu proses 4 jam 59 menit.', '2022-12-13 07:16:55', '2022-12-13 07:16:55'),
(350, 2579, 'Telegram Reactions', 'Telegram Love  Reaction', 748, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat dan lebih lama', 'primary', '0', '', 'jumlah pesan rata rata 113 waktu proses 28 menit.', '2022-12-13 07:16:55', '2022-12-13 07:16:55'),
(351, 2580, 'Telegram Reactions', 'Telegram Like Reaction ', 748, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat dan lebih lama', 'primary', '0', '', 'jumlah pesan rata rata 405 waktu proses 17 jam 13 menit.', '2022-12-13 07:16:55', '2022-12-13 07:16:55'),
(352, 2581, 'Telegram Reactions', 'Telegram Like Reaction + Views (20/300k) [ 10k/hr ]', 8250, 20, 300000, 'FAST \nINSTAN', 'primary', '0', '', 'jumlah pesan rata rata 25 waktu proses 17 menit.', '2022-12-13 07:16:55', '2022-12-13 07:16:55'),
(353, 2582, 'Telegram Reactions', 'Telegram Dislike Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'Instan\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 35 waktu proses 1 jam 22 menit.', '2022-12-13 07:16:55', '2022-12-13 07:16:55'),
(354, 2583, 'Telegram Reactions', 'Telegram Heart Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'Instan \nFAST', 'primary', '0', '', 'jumlah pesan rata rata 34 waktu proses 50 menit.', '2022-12-13 07:16:56', '2022-12-13 07:16:56'),
(355, 2584, 'Telegram Reactions', 'Telegram Fire Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 67 waktu proses 54 menit.', '2022-12-13 07:16:56', '2022-12-13 07:16:56'),
(356, 2585, 'Telegram Reactions', 'Telegram PartyPopper Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 28 waktu proses 44 menit.', '2022-12-13 07:16:57', '2022-12-13 07:16:57'),
(357, 2586, 'Telegram Reactions', 'Telegram StarStruck Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 32 waktu proses 40 menit.', '2022-12-13 07:16:57', '2022-12-13 07:16:57'),
(358, 2587, 'Telegram Reactions', 'Telegram ScreaminFace Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN \nFAST', 'primary', '0', '', 'jumlah pesan rata rata 40 waktu proses 1 jam 18 menit.', '2022-12-13 07:16:57', '2022-12-13 07:16:57'),
(359, 2588, 'Telegram Reactions', 'Telegram BeamingFace Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 41 waktu proses 53 menit.', '2022-12-13 07:16:57', '2022-12-13 07:16:57'),
(360, 2589, 'Telegram Reactions', 'Telegram CryingFace Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 75 waktu proses 38 menit.', '2022-12-13 07:16:58', '2022-12-13 07:16:58'),
(361, 2590, 'Telegram Reactions', 'Telegram Tai ( PileofPoo ) Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 149 waktu proses 42 menit.', '2022-12-13 07:16:59', '2022-12-13 07:16:59'),
(362, 2591, 'Telegram Reactions', 'Telegram Muntah ( FaceVomiting ) Reaction + Views (20/300k) [ 10k/hr ] ', 8250, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 202 waktu proses 34 menit.', '2022-12-13 07:16:59', '2022-12-13 07:16:59'),
(363, 2592, 'Telegram', 'Telegram Post Views [90M] [ 1 Post ] TERMURAH DAN SUPERFAST', 57, 100, 90000000, 'Instant\n2jt/hari\nNon Drop\nTarget/data  masukin link contoh https://t.me/medanpediaSMM/192\nExample Link: https://t.me/Your_Group/MessageID\nAtau bisa \nTarget/data  masukin link contoh https://t.me/medanpediaSMM\nExample Link: https://t.me/Your_Group/\nuntuk postingan terakhir', 'primary', '0', '', 'jumlah pesan rata rata 6.600 waktu proses 37 menit.', '2022-12-13 07:17:00', '2022-12-13 07:23:23'),
(364, 2594, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 10 [ refill 7 hari ] 20K/Day ', 35750, 100, 30000, '0-1 Hours', 'primary', '0', '', 'jumlah pesan rata rata 493 waktu proses 4 jam 6 menit.', '2022-12-13 07:17:00', '2022-12-13 07:17:00'),
(365, 2595, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 11 [ 20K/Day ]', 30800, 100, 30000, '20k/day', 'primary', '0', '', 'jumlah pesan rata rata 430 waktu proses 11 jam 32 menit.', '2022-12-13 07:17:00', '2022-12-13 07:17:00'),
(366, 2604, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes  Server 8 [ 60 Days refill ] [ max 150K ] ', 38500, 500, 150000, 'Start Time: 0 - 2 hours\nSpeed: 30k-40k / day\nQuality: High quality\nGuarantee: 60 Days Refill Guarantee\nLink: Facebook fan page link\nExample format: https://www.facebook.com/Medanpedia\n100% NON DROP Likes', 'primary', '1', '60', 'jumlah pesan rata rata 1.100 waktu proses 1 hari  2 jam  46   menit.', '2022-12-13 07:17:01', '2022-12-13 07:17:01'),
(367, 2624, 'Telegram Reactions', 'Telegram Post Reactions + Views [Positive]  [Refill: No] [Max: 1M] [Start Time: 0-1 Hour] [Speed: 600K/Day]', 1320, 15, 1000000, 'Pesan 1000 kadang yg masuk tidak tepat 1000 bisa cuman 500 ( no kompline )\ndan coba dlu pesan 100 karna ada beberapa chanel/grup yang tidak support\nkami tidak ada refund jika status sukses tetapi react nya gk masuk\nInstant start.\nInstant complete.\nGroup or channel\nPublic links only', 'primary', '0', '', 'jumlah pesan rata rata 900 waktu proses 43 menit.', '2022-12-13 07:17:01', '2022-12-13 07:17:01'),
(368, 2625, 'Telegram Reactions', 'Telegram Post Reactions + Views [Negative] [Refill: No] [Max: 1M] [Start Time: 0-1 Hour] [Speed: 600K/Day] ', 1320, 15, 1000000, 'Pesan 1000 kadang yg masuk tidak tepat 1000 bisa cuman 500 ( no kompline )\ndan coba dlu pesan 100 karna ada beberapa chanel/grup yang tidak support\nkami tidak ada refund jika status sukses tetapi react nya gk masuk\nInstant start.\nInstant complete.\nGroup or channel\nPublic links only', 'primary', '0', '', 'jumlah pesan rata rata 400 waktu proses 37 menit.', '2022-12-13 07:17:01', '2022-12-13 07:17:01'),
(369, 2627, 'TikTok  share', 'TIKTOK Share  5 [Refill 30 days]  10K/Day [ NonDrop ]', 189, 10, 10000000, 'NonDrop', 'primary', '0', '', 'jumlah pesan rata rata 460 waktu proses 33 menit.', '2022-12-13 07:17:01', '2022-12-13 07:23:23'),
(370, 2628, 'TikTok Save/Favorit', 'TikTok Save Server 1 [ Refill 30days ]  5k/days ', 3520, 100, 20000, 'Refill 30days \n5k/days', 'primary', '0', '', 'jumlah pesan rata rata 251 waktu proses 31 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(371, 2631, 'Instagram Comments', 'Instagram Custom Comments  [ 20k/days ] [No Drop]', 15400, 10, 50000, 'No Drop\n20k/days', 'custom_comments', '0', '', 'jumlah pesan rata rata 67 waktu proses 4 jam 48 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(372, 2633, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Like [Max: 100K] [Start Time: Instant] [Speed: 100K/Day]', 2200, 10, 1000000, 'TikTok Live Likes\nService Starting Super Instant!\nDaily Speed : 100K Per Hour\n\nExample Link:\nhttps://www.tiktok.com/@username', 'primary', '0', '', 'jumlah pesan rata rata 1.918 waktu proses 4 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(373, 2634, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Share [Max: 100K] [Start Time: Instant] [Speed: 100K/Day] ', 11550, 10, 1000000, 'Service Starting Super Instant!\nDaily Speed : 100K Per Hour\n\nExample Link:\nhttps://www.tiktok.com/@username', 'primary', '0', '', 'jumlah pesan rata rata 251 waktu proses 4 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(374, 2637, 'Youtube Subscribers', 'Youtube Subscribe S8 [ LifeTime Refill ] [ 10k Per Day ] ', 185900, 100, 100000, 'Lifetime Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 182 waktu proses 22 jam 36 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(375, 2638, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 12 [ Refill 365D ] [ Max 500k ] TERMURAH [ 100k-200k/days ]', 3300, 50, 500000, 'nstant', 'primary', '0', '', 'jumlah pesan rata rata 236 waktu proses 39 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(376, 2639, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 8 [ Speed 20K/Day ]', 2970, 100, 40000, '20K/Day\n0-1 Hours\n', 'primary', '0', '', 'jumlah pesan rata rata 147 waktu proses 46 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(377, 2640, 'TikTok Likes', 'TIKTOK Likes Server 19 [ TERMURAH DIDUNIA YANG  TIDAK GARANSI ] [ 1k-10K/Day ] ', 2640, 10, 10000, 'Speed 1k-10K/Day', 'primary', '0', '', 'jumlah pesan rata rata 320 waktu proses 30 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(378, 2641, 'TikTok Save/Favorit', 'TikTok Save Server 2 [ Refill 30days ] 5k-10k/day', 3135, 100, 20000, '5k-10k/day\nrefill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 262 waktu proses 37 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(379, 2642, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  15 Cheapest Indonesian [ No Refill ] Instant ', 4246, 10, 50000, '0-15 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 286 waktu proses 15 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(380, 2648, 'Facebook Group Member', 'Facebook Group Member Server 2 [ No Refill  ] 1-15k/hari', 37400, 1000, 150000, '1-15k/hari\nlow drop bahkan tidak drop\ntapi tetap no refill jika drop', 'primary', '0', '', 'jumlah pesan rata rata 1.438 waktu proses 4 jam 27 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(381, 2650, 'Facebook Group Member', 'Facebook Group Member Server 4 [ 30 Days Refill ] 500-1K/hari', 31350, 100, 25000, 'Waktu mulai : 0-6jam\n30 Days Refill\n\nDetail:\nContoh link: https://www.facebook.com/groups/123\nLayanan ini hanya bekerja di grup publik\nJANGAN MELAKUKAN ORDER LEBIH 1 UNTUK LINK PADA WAKTU YANG SAMA.', 'primary', '0', '', 'jumlah pesan rata rata 1.903 waktu proses 1 hari  7 jam  16   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(382, 2651, 'Youtube Views', 'Youtube Views S7 [ 5k/day speed ] + Suggested [ Lifetime Guarantee ] ', 10560, 500, 55000, 'Source: Suggested + Direct + Browse Features ]\nSpeed 5k Per Day\nInstant Start\nLife Time Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 1.080 waktu proses 14 jam 39 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(383, 2652, 'Instagram Views', 'instagram view Server 11 SUPERFAST [ VIDEO/REELS/TV ]Max 100M ', 220, 100, 100000000, 'INSTANT\nSUPERFAST', 'primary', '0', '', 'jumlah pesan rata rata 3.158 waktu proses 9 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(384, 2653, 'Youtube Views', 'Youtube Views S8 [ 70K Per Day speed ] ( 100% Suggested Views ) [ Lifetime Guarantee ] BONUS LIKE', 11550, 100, 1000000, 'Guarantee:Lifetime\nSpeed : 50-70k/day\nSource:Suggested', 'primary', '0', '', 'jumlah pesan rata rata 520 waktu proses 11 jam 21 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(385, 2657, 'Shopee/Tokopedia/Bukalapak', 'Shopee Followers [2K] MURAH NON DROP ', 13200, 100, 2000, 'NON DROP\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 1.310 waktu proses 36 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(386, 2658, 'Twitter Followers', 'Twitter Followers Server 22 [ Refill 30D ] [Non Drop] 20k/days', 34100, 10, 20000, '20k/days\nRefill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 321 waktu proses 42 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(387, 2659, 'Twitter Followers', 'Twitter Followers Server 23 [ Refill 30D ] [Non Drop] 50-100k/day ', 38500, 10, 100000, 'Non Drop\nRefill 30D', 'primary', '0', '', 'jumlah pesan rata rata 3.406 waktu proses 20 jam 0 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(388, 2660, 'Twitter Followers', 'Twitter Followers Server 24 [ NO REFILL ] [NOT RECOMENDED] ', 11000, 200, 20000, 'waktu mulai 0-3 jam', 'primary', '0', '', 'jumlah pesan rata rata 458 waktu proses 45 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(389, 2661, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 15 [ refill 30 hari ] [ Instant ] [ 50k/day Speed ] HQ Accounts', 15730, 100, 50000, 'refill 30 hari\n50k/day Speed\n HQ Accounts', 'primary', '0', '', 'jumlah pesan rata rata 628 waktu proses 4 jam 21 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(390, 2662, 'Youtube Subscribers', 'Youtube Subscribe S9  [ 30 days refill ] [ 150-200/day ] [ Non drop ]', 126500, 50, 15000, '[ 30 days refill ] \n[ 150-200/day ] \n[ Non drop ]', 'primary', '0', '', 'jumlah pesan rata rata 117 waktu proses 19 jam 30 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(391, 2666, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 17 [ refill 30 hari ] [ Instant ] [ 100k/day Speed ] ', 22000, 10, 500000, 'Instant \nrefill 30 hari\n100k/day', 'primary', '0', '', 'jumlah pesan rata rata 900 waktu proses 6 jam 13 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(392, 2668, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Share Server 1 [ max Max 500K] ', 12100, 100, 500000, 'waktu mulai  0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 270 waktu proses 3 hari  6 jam  27   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(393, 2671, 'Youtube Views', 'Youtube Views S9 ( Suggested Views ) [ Lifetime Guarantee ] [ 5-7K/day ]', 10670, 100, 55000, 'Min 100\nRetention: 30 seconds to 60 Seconds\nNo Drop\nMax 1 Million\n\nSource: Suggested videos + Direct or unknown + Browse features\n( 30-35?ch Source )', 'primary', '0', '', 'jumlah pesan rata rata 145 waktu proses 7 jam 50 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(394, 2672, 'Youtube Views', 'Youtube Views S10 ( Suggested Views ) [ Lifetime Guarantee ] [ 50-70K/day ] ', 11550, 100, 1000000, 'Instant Start\nMin 100\nRetention: 30 seconds to 60 Seconds\nNo Drop\nMax 1 Million\n\nSource: Suggested videos + Direct or unknown + Browse features\n( 30-35?ch Source )', 'primary', '0', '', 'jumlah pesan rata rata 745 waktu proses 12 jam 23 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(395, 2673, 'TikTok View', 'TIKTOK View Server 15 WORKING FAST AND CHEAP', 61, 100, 2147483647, 'Max 5M', 'primary', '0', '', 'jumlah pesan rata rata 5.892 waktu proses 27 menit.', '2022-12-13 07:17:02', '2022-12-13 07:23:24'),
(396, 2675, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S26 [ max 5k ] [ REFILL 7 DAYS ]✨ ', 27500, 100, 500, 'max 5k', 'primary', '0', '', 'jumlah pesan rata rata 230 waktu proses 2 hari  7 jam  4   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(397, 2679, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Video Custom Comments  2 TERMURAH [ 30k/day Speed ]', 25300, 10, 100000, '30k/day Speed', 'custom_comments', '0', '', 'jumlah pesan rata rata 13 waktu proses 1 jam 20 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(398, 2687, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 11 [ Speed 5k-10k/day ] ', 2970, 100, 10000, '5k-10k/day', 'primary', '0', '', 'jumlah pesan rata rata 1.267 waktu proses 4 jam 7 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(399, 2688, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 12 [ Speed 10-15k/day ] ', 3762, 100, 10000, 'Speed 10-15k/day', 'primary', '0', '', 'jumlah pesan rata rata 221 waktu proses 2 jam 16 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(400, 2689, 'TikTok  share', 'TIKTOK Share  6 [ MAX 10Juta ] [ R30 ]', 28, 10, 10000000, 'Max 10M', 'primary', '0', '', 'jumlah pesan rata rata 627 waktu proses 1 jam 35 menit.', '2022-12-13 07:17:02', '2022-12-13 07:23:24'),
(401, 2690, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Like BATTLE Server 1  [Max: 100K] [Start Time: Instant] [Speed: 100K/Day] ', 1980, 10, 1000000, 'Speed: 100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 2.005 waktu proses 19 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(402, 2691, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Like BATTLE Server 2 [Max: 100K] [Start Time: 0 - 1 Hours] [Speed: 100K/Day] ', 1980, 5, 1000000, 'Speed: 100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 2.580 waktu proses 3 jam 49 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(403, 2692, 'Youtube Subscribers', 'Youtube Subscribe S10 [ 90 days refill ] [ 150-200/day ] [ Non drop ] ', 155100, 20, 10000, '200/Day', 'primary', '0', '', 'jumlah pesan rata rata 67 waktu proses 11 jam 49 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(404, 2693, 'Youtube Subscribers', 'Youtube Subscribe S11 [ 90 days refill ] [ 1500-2000/day ] [ Non drop ] ', 270600, 20, 20000, '1500-2000/day', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 7 jam 35 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(405, 2694, 'Tiktok Comments ', 'Tiktok Likes Komentar [ R30D ] [ baca deskripsi Sebelum Order! ]', 9900, 50, 5000, 'untuk order di web \ntarget masukin link poto\nLink Post masukin username\n\nuntuk order Via API\nparameter target masukin link poto\nparameter custom_link masukin username\n\n5k/day\nR30', 'custom_link', '0', '', 'jumlah pesan rata rata 338 waktu proses 8 hari  23 jam  28   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(406, 2695, 'Tiktok Comments ', 'Tiktok Komentar [ 3 HQ Random Komentar ] [Start Time: 0-1 Hour] [Finishes in 3 Hours]', 9680, 1000, 1000, 'Pesan Jumlah 1000 anda mendapat kan 3 komentar\nbukan order 1000 dapat 1000 komentar!\nHQ & Active Accounts\nkomentar sesuai dengan video konten mu', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 3 jam 5 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(407, 2696, 'Tiktok Comments ', 'Tiktok Komentar Kostum Server 1  [Refill 30 Days] [ LOW ] [Max: 10K]  [Speed: 1K/Hour]', 96800, 10, 100000, 'Speed : 1K Per Hour\nNo Drop & 30 Day Refill Guarantee\nExample Link: Tiktok Video Link (All Video Link Acceeptable)', 'custom_comments', '0', '', 'jumlah pesan rata rata 12 waktu proses 4 jam 5 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(408, 2697, 'Tiktok Comments ', 'Tiktok Komentar Kostum Server 2 [Refill 30 Days] [Max: 10K] [Speed: 5K/Hour]', 116600, 10, 5000, 'Speed: 5K/Hour', 'primary', '0', '', 'jumlah pesan rata rata 62 waktu proses 2 hari  18 jam  57   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(409, 2698, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 18 [ refill 30 hari ] [ Instant ] [ 20k/day Speed ] TERMURAH DIKELASNYA', 13200, 100, 100000, '0-1hr\n20k/day\nR30\nHQ', 'primary', '0', '', 'jumlah pesan rata rata 113 waktu proses 1 jam 44 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(410, 2699, 'Tiktok Comments ', 'Tiktok Komentar [ 3 HQ Random Komentar ] [Start Time: 0-1 Hour]  Real and Active', 3300, 1000, 1000, 'Pesan Jumlah 1000 anda mendapat kan 3 komentar\nbukan order 1000 dapat 1000 komentar!\nHQ & Active Accounts\nkomentar sesuai dengan video konten mu', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 11 jam 6 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(411, 2700, 'Instagram Followers [guaranteed]', 'Instagram Followers 1 [ 30 Days Refill ] [ 0-30 Min ] ', 2343, 10, 20000, '[ 30 Days Refill ] [ 0-30 Min ] \nkemungkinan cepat drop\ncepat masuk', 'primary', '1', '30', 'jumlah pesan rata rata 1.173 waktu proses 14 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(412, 2701, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers MDN 1 [ Refill 365D ] [ Max 500k ] ', 6600, 10, 500000, 'Max 500k\n', 'primary', '0', '', 'jumlah pesan rata rata 607 waktu proses 1 jam 34 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(413, 2702, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 5 LessDrop [ Refill 30D ] [ 10-15K/Day] ', 3960, 10, 100000, 'Start Time: 0-1 Hour', 'primary', '0', '', 'jumlah pesan rata rata 946 waktu proses 2 jam 15 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(414, 2703, 'Youtube View Target Negara', 'Youtube views Refill 90 days [ Indonesia ] [Speed: 200-1000/Day] ', 66000, 500, 100000, 'Targeted RAV - Real Active Views*\n100% Real Human Active YouTube Watch Page Views\nINSTANT START - 200-1000 / Day\nWatch Page Views - Monetizable!\nRandom Retention\nStable NON-DROP Views with 90 Days Refill Guarantee**\nWorld-Wide Views Added in a NON-STOP Natural Pattern\nMust be Unrestricted & Open for ALL countries\nOK for VEVO\nCancel any Time with Full/Partial Refund\nviews can be send to embed disabled video (including videos that live-streamed or premiered in the past)\nTraffic Sources: Direct Advertisement\n\n* views may include real user engagements - your video may get some daily likes/dislikes, comments, shares, subscribers\nall made by real YouTube users that we do not control!\n** If views added from external non-organic sources your guarantee may be revoked!\n* daily speeds vary by country and load', 'primary', '0', '', 'jumlah pesan rata rata 602 waktu proses 13 jam 28 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(415, 2704, 'Youtube View Target Negara', 'Youtube views Refill 90 days [ Francis ] [Speed: 200-1000/Day] ', 66000, 500, 100000, 'Targeted RAV - Real Active Views*\n100% Real Human Active YouTube Watch Page Views\nINSTANT START - 200-1000 / Day\nWatch Page Views - Monetizable!\nRandom Retention\nStable NON-DROP Views with 90 Days Refill Guarantee**\nWorld-Wide Views Added in a NON-STOP Natural Pattern\nMust be Unrestricted & Open for ALL countries\nOK for VEVO\nCancel any Time with Full/Partial Refund\nviews can be send to embed disabled video (including videos that live-streamed or premiered in the past)\nTraffic Sources: Direct Advertisement\n\n* views may include real user engagements - your video may get some daily likes/dislikes, comments, shares, subscribers\nall made by real YouTube users that we do not control!\n** If views added from external non-organic sources your guarantee may be revoked!\n* daily speeds vary by country and load', 'primary', '0', '', 'jumlah pesan rata rata 500 waktu proses 23 jam 34 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(416, 2705, 'Youtube View Target Negara', 'Youtube views Refill 90 days [ Spanyol ] [Speed: 200-1000/Day] ', 66000, 500, 100000, 'Targeted RAV - Real Active Views*\n100% Real Human Active YouTube Watch Page Views\nINSTANT START - 200-1000 / Day\nWatch Page Views - Monetizable!\nRandom Retention\nStable NON-DROP Views with 90 Days Refill Guarantee**\nWorld-Wide Views Added in a NON-STOP Natural Pattern\nMust be Unrestricted & Open for ALL countries\nOK for VEVO\nCancel any Time with Full/Partial Refund\nviews can be send to embed disabled video (including videos that live-streamed or premiered in the past)\nTraffic Sources: Direct Advertisement\n\n* views may include real user engagements - your video may get some daily likes/dislikes, comments, shares, subscribers\nall made by real YouTube users that we do not control!\n** If views added from external non-organic sources your guarantee may be revoked!\n* daily speeds vary by country and load', 'primary', '0', '', 'jumlah pesan rata rata 750 waktu proses 2 hari  23 jam  5   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(417, 2706, 'Youtube Subscribers Negara', 'Youtube Subscribe [ INDONESIA ] [ LIFETIME GUARANTEE ]', 313500, 50, 10000, 'Max 20k', 'primary', '0', '', 'jumlah pesan rata rata 77 waktu proses 14 jam 15 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(418, 2707, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  16 [  INDONESIA ][ LIFETIME GUARANTEE ] Instant ', 35200, 10, 20000, 'Max 20k', 'primary', '0', '', 'jumlah pesan rata rata 84 waktu proses 26 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(419, 2710, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 30 Minutes Live CONCURRENT ] [ Latest Service ]', 57200, 100, 35000, '30 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 1.082 waktu proses 55 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(420, 2711, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 60 Minutes Live CONCURRENT ] [ Latest Service ]', 116600, 100, 35000, '60 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 417 waktu proses 1 jam 25 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(421, 2712, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 90 Minutes Live CONCURRENT ] [ Latest Service ]', 174900, 100, 35000, '90 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 978 waktu proses 1 jam 57 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(422, 2713, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 120 Minutes Live CONCURRENT ] [ Latest Service ] ', 231000, 100, 35000, '120 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 550 waktu proses 3 jam 6 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(423, 2714, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 150 Minutes Live CONCURRENT ] [ Latest Service ] ', 287100, 100, 35000, '150 Minutes Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(424, 2715, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 180 Minutes Live CONCURRENT ] [ Latest Service ] ', 344300, 100, 35000, '180 Minutes Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(425, 2716, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 6 Hour Live CONCURRENT ] [ Latest Service ] ', 682000, 100, 35000, '6 Hour Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(426, 2717, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 12 Hour Live CONCURRENT ] [ Latest Service ] ', 959200, 100, 35000, '12 Hour Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(427, 2718, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 24 Hour Live CONCURRENT ] [ Latest Service ] ', 1760000, 100, 35000, '24 Hour Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(428, 2719, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [Mix] ', 58300, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- Users from all over the world with full profile pictures\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', 'jumlah pesan rata rata 114 waktu proses 4 jam 14 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(429, 2720, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [USA] ', 58300, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from USA with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', 'jumlah pesan rata rata 87 waktu proses 1 jam 13 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(430, 2721, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [INDIA] ', 58300, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from India with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', 'jumlah pesan rata rata 29 waktu proses 12 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02');
INSERT INTO `medans` (`id`, `service_id`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(431, 2722, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [SOUTH KOREA] ', 58300, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from South Korea with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(432, 2723, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [VIETNAM] ', 58300, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from Vietnam with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(433, 2724, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [ARAB] ', 58300, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from Arabs with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(434, 2725, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 19 [ No garansi ] [ Max 700K ] ', 11000, 10, 700000, '0-15 Min', 'primary', '0', '', 'jumlah pesan rata rata 635 waktu proses 3 jam 47 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(435, 2726, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 15 Minutes Live CONCURRENT ] [ Latest Service ] WORK', 31900, 100, 20000, '15 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 1.710 waktu proses 47 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(436, 2727, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 30 Minutes Live CONCURRENT ] [ Latest Service ] WORK ', 63800, 100, 20000, '30 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 700 waktu proses 52 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(437, 2728, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 60 Minutes Live CONCURRENT ] [ Latest Service ] WORK ', 127600, 100, 20000, '60 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 400 waktu proses 1 jam 31 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(438, 2729, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 90 Minutes Live CONCURRENT ] [ Latest Service ] WORK ', 192500, 100, 20000, '90 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 556 waktu proses 1 jam 30 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(439, 2730, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 2 hours Live CONCURRENT ] [ Latest Service ] WORK ', 269500, 100, 20000, '2 hours Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 300 waktu proses 2 jam 39 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(440, 2731, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 3 hours Live CONCURRENT ] [ Latest Service ] WORK ', 374000, 100, 20000, '3 hours Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(441, 2732, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 6 hours Live CONCURRENT ] [ Latest Service ] WORK ', 753500, 100, 20000, '6 Hours Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(442, 2733, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 12 hours Live CONCURRENT ] [ Latest Service ] WORK ', 1507000, 100, 20000, '12 Hours Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(443, 2734, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 24 hours Live CONCURRENT ] [ Latest Service ] WORK ', 2750000, 100, 20000, '24 hours Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(444, 2735, 'youtube jam tayang [ New Server 2 ]', 'YouTube Watch Hours - [ 3 Hour Video ] [ speed 500/ Hour ] [ 30 Days Guaranteed ] [ Non Drop ] ', 78760, 100, 4000, '-Gunakan Video 3 Jam Untuk mendapatkan waktu tontonan Penuh\n-Server Non-drop Dan memiliki Garansi 30 Hari\n-kecepatan 500 jam per hari\n-Jika Video Kurang Dari 3 Jam Tidak Ada Jaminan untuk Isi Ulang atau Pengembalian Uang\n\nCatatan:\n-Kami Tidak Memberikan Retensi 100% Di Sini\n-Retensi akan menjadi 90-95% Tetapi Anda akan Mendapatkan 100% Jam Tontonan 1000 = 1000 jam', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(445, 2736, 'youtube jam tayang [ New Server 2 ]', 'YouTube Watch Hours - [ 4 Hour Video ] [ speed 500/ Hour ] [ 30 Days Guaranteed ] [ Non Drop ] ', 75900, 100, 4000, '-Gunakan Video 4 Jam Untuk mendapatkan waktu tontonan Penuh\n-Server Non-drop Dan memiliki Garansi 30 Hari\n-kecepatan 500-1500 jam per hari\n-Jika Video Kurang Dari 4 Jam Tidak Ada Jaminan untuk Isi Ulang atau Pengembalian Uang\n\nCatatan:\n-Kami Tidak Memberikan Retensi 100% Di Sini\n-Retensi akan menjadi 90-95% Tetapi Anda akan Mendapatkan 100% Jam Tontonan 1000 = 1000 jam', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(446, 2737, 'Instagram Likes', 'Instagram Likes S11 [ REAL ] ', 550, 100, 100000, '0-6 hours\nFast after start {200k/day}\nNo Refill/refund {no drop}\nMixed', 'primary', '0', '', 'jumlah pesan rata rata 1.900 waktu proses 7 jam 57 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(447, 2739, 'Twitter Followers', 'Twitter Followers Server 26 [ REFILL 30 DAYS ] [ 25k/day ] ', 10780, 200, 50000, 'Instant\n20k-50k/day\nREFILL 30 DAYS\nLess Drop', 'primary', '0', '', 'jumlah pesan rata rata 2.340 waktu proses 56 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(448, 2740, 'Instagram Likes', 'Instagram Likes S12 [Refill 180 Days] [Max 50K] [5K/Day] ', 1128, 10, 250000, 'Start Time: 1 Hour\nSpeed 5K/Day', 'primary', '0', '', 'jumlah pesan rata rata 197 waktu proses 35 menit.', '2022-12-13 07:17:02', '2022-12-13 07:23:24'),
(449, 2741, 'Instagram Likes', 'Instagram Likes S13 [ Lifetime Guaranteed ] [ Real Mixed ] [5K/Day] ', 1650, 10, 20000, 'Real Mixed\n10k/days', 'primary', '0', '', 'jumlah pesan rata rata 742 waktu proses 26 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(450, 2742, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [ NEW service ] [ 15 - 60 MInutes ] ', 58300, 1000, 10000000, '- START : Instant\n- MONETIZABLE | REAL\n- 100% Real Human YouTube Users Viewers\n- 100% Unique Traffic\n- World-Wide Viewers\n- Avg Concurrent and watch-time based on live stream content\n- Video must Unrestricted , embed must enabled\nNOTE :\n- To get fast speed, Please order same link/same times ( x5 ,x10 times )\n- Cant refund after order\n- Views are spread over the time to deliver live viewers so that they stay for atleast 15 mins - 1H\nEx : You order 1000 views, then ,1000 live viewers will spread over the time in 15 mins - 1H+.', 'primary', '1', '', 'jumlah pesan rata rata 1.286 waktu proses 16 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(451, 2743, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [ NEW service ] [REAL]', 29150, 1000, 1000000, 'Pemirsa WW Penampil Nyata\nBiasanya bisa mendapatkan engagements yang baik\nDurasi minimum siaran langsung adalah 10 menit\nKecepatan: 30\' Untuk Mencapai Jumlah yang Dipesan\nSemakin besar jumlah pesan, semakin baik jumlah view nya\n\nANDA MEMESAN UNTUK JUMLAH TOTAL TAYANGAN LANGSUNG, DAN BUKAN JUmlah TAYANGAN LANGSUNG BERSAMAAN.\nCONTOH: jika Anda memesan 1K, Anda akan mendapatkan sekitar 50 tampilan selama 30 menit (jumlah total tampilan adalah 1K)\ncontoh : https://prnt.sc/8HUkVmmdHx9Q', 'primary', '0', '', 'jumlah pesan rata rata 1.689 waktu proses 36 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(452, 2744, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ NEW service ] [REAL] INSTANT', 33000, 1000, 1000000, 'Mulai: INSTAN\nKecepatan: Cepat\nIsi ulang: Tidak ada isi ulang\n\nRetensi: Random\nKualitas: 100% Nyata\nCatatan:\n- Jika Live End, Video Dihapus, Video Pribadi, atau Dihapus oleh youtube - Tidak Ada Pengembalian Dana/ Tidak Ada Partial.\n- Silakan memesan tautan yang sama / waktu yang sama ( per 1 - 3 kali ) , Interval (menit) 1-3) untuk mendapatkan kecepatan cepat.\n- Kami tidak dapat menjamin total waktu tonton atau jumlah penonton serentak hanya total penayangan unik yang dikirim selama kampanye. \nTampilan tersebar dari waktu ke waktu untuk menghadirkan pemirsa langsung sehingga mereka bertahan setidaknya selama 15 menit - 2 jam tergantung jumlah pesanan', 'primary', '0', '', 'jumlah pesan rata rata 3.100 waktu proses 1 jam 6 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(453, 2745, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ NEW service ] [REAL] Active Live Stream', 63470, 1000, 100000, 'Mulai: INSTAN\nKecepatan: Cepat\nIsi ulang: Tidak ada isi ulang\n\nRAV - Tampilan Aktif Nyata** 100% Penonton Pengguna YouTube Manusia !\n Tampilan Halaman Tonton Desktop & Seluler Windows\n 100% Lalu Lintas Unik yang dapat dimonetisasi!\n Pemirsa Seluruh Dunia\n Video harus Tidak Dibatasi & Terbuka untuk SEMUA negara\n Retensi Random (berdasarkan minat pemirsa pada streaming langsung!)\n Rata-Rata Serentak dan waktu tonton didasarkan pada konten streaming langsung\n Batalkan kapan saja dengan Pengembalian Dana Penuh/Sebagian\n Over-Pengiriman Dijamin\n penayangan dapat dikirimkan ke video streaming langsung yang disematkan yang dinonaktifkan\n Sumber Lalu Lintas: Iklan Langsung\n\n\n*Layanan yang ditawarkan apa adanya tanpa jaminan isi ulang/pengembalian uang!\n** Penayangan streaming langsung dapat mencakup keterlibatan pengguna nyata - video Anda mungkin mendapatkan beberapa suka/tidak suka harian, komentar obrolan, bagikan, pelanggan\nsemua dibuat oleh pengguna YouTube nyata yang tidak kami kendalikan!\n*** penayangan streaming langsung akan terdaftar sebagai pemutaran pada statistik streaming langsung (YouTube Studio), tetapi mungkin tidak terdaftar secara penuh pada versi rekaman offline \'biasa\' dari statistik video.\nkami tidak dapat memberikan total waktu tonton atau jumlah penonton serentak hanya dari total penayangan unik yang dikirim selama kampanye.\n\nhttps://i.gyazo.com/254bce6afe96bd5149fd290c06bbec94.png\nhttps://i.gyazo.com/9f78659c94df658ba6b56344ae540bf2.png\nhttps://i.gyazo.com/610ea2c7078ae94d3a439969f0e93d15.png\n(Gambar yang ditampilkan hanya untuk tujuan ilustrasi. Produk yang sebenarnya mungkin berbeda karena peningkatan produk)', 'primary', '0', '', 'jumlah pesan rata rata 1.700 waktu proses 1 jam 15 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(454, 2746, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ NEW service ] [ Viewers stay long time ] ', 81400, 1000, 1000000, 'Mulai: INSTAN\nKecepatan: Pengiriman lambat\nIsi ulang: TIDAK ADA Isi Ulang\n\nSumber lalu lintas: External + Youtube Advertising\nViewers stay a long time: 30 menit - 1 jam\nMONETIZABLE', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(455, 2747, 'TikTok Likes', 'TIKTOK Likes Server 20 [ TERMURAH DIDUNIA ] [ max 1M ] ', 2640, 100, 1000000, 'Instant\nREAL', 'primary', '0', '', 'jumlah pesan rata rata 485 waktu proses 9 jam 46 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(456, 2748, 'Telegram', 'Telegram - Channnel Members/Group Server 14 [ 100K ] Garansi 1 TAHUN', 20900, 100, 100000, '70k-100k/day\nNO DROP\nKALO DROP TINGGAL MINTA REFILL DI TIKET\nINSTAN', 'primary', '0', '', 'jumlah pesan rata rata 2.800 waktu proses 1 jam 33 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(457, 2749, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 6  [ Refill 30D ] [ FAST ] [ Real Engaging Followers ]', 6380, 10, 50000, '10k/d', 'primary', '1', '', 'jumlah pesan rata rata 2.036 waktu proses 1 jam 41 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(458, 2750, 'TikTok  share', 'TIKTOK Share  8 [ Speed 50K/day ] ', 385, 100, 2000000, 'Speed 50K/day', 'primary', '0', '', 'jumlah pesan rata rata 1.339 waktu proses 2 jam 17 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(459, 2752, 'TikTok Story', 'TikTok Story Likes  [ Max 30K ]  [ Day 10K ]', 5170, 50, 30000, '[ Max 30K ]  [ Day 10K ]', 'primary', '0', '', 'jumlah pesan rata rata 101 waktu proses 6 jam 8 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(460, 2753, 'TikTok Story', 'TikTok Story Views [ Max 30K ] [ Day 10K ] [ All Stories ]', 5170, 100, 30000, '[ Max 30K ] [ Day 10K ] [ All Stories ]', 'primary', '0', '', 'jumlah pesan rata rata 383 waktu proses 3 jam 8 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(461, 2754, 'TikTok Story', 'TikTok Story Views [ Max 30K ] [ Day 10K ] ', 5170, 100, 30000, '[ Max 30K ] [ Day 10K ]', 'primary', '0', '', 'jumlah pesan rata rata 710 waktu proses 1 hari  14 jam  51   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(462, 2755, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S77 [ Real Mixed ] [ 50K/day ] [ R60 ]', 3960, 10, 100000, '50k/day\nLess Drop\nMixed Quality\nR30 [ button ]', 'primary', '1', '30', 'jumlah pesan rata rata 152 waktu proses 45 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(463, 2756, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 7 [ Refill 30D ] [ HQ ] ', 2860, 20, 50000, '0-3h Start\nReal Mixed\n2-5k/day\n10-20% drop', 'primary', '0', '', 'jumlah pesan rata rata 910 waktu proses 1 jam 41 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(464, 2757, 'Youtube Views', 'Youtube Views S11 [ Emergency Server ] [ 20k-100k/day ] [ Non Drop ] Lifetime ', 30525, 20000, 10000000, 'Start Time: 0-1hr\nRefill: Lifetime (Non drop)\nRetention: 1-10 minutes\nSpeed: 20k-100k/day\nSource: Social Media Platforms + Others', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 22 jam 29 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(465, 2759, 'Youtube View  [ untuk monetisasi - penghasil duit ]', 'Youtube views untuk penambah Adsense [NO DROP] [FULL ENGAGEMENT] [Speed: 50K/Day]', 36300, 20000, 100000000, 'View Bisa Menghasilkan Pendapatan $9 dari 20k View yang kamu pesan. ( jika konten videonya bagus)\n\nKualitas Views :-\n. Retensi: Bergantung pada Konten\n. Sumber: Pengguna asli, Metode Organik - Iklan dari berbagai sumber\n. Negara: Seluruh Dunia\n. Istimewa: Penayangan Juga Akan Menghasilkan Pendapatan (Jika Berlaku).\n\nCatatan Layanan:-\n. Waktu mulai: 12 - 36 jam (untuk persetujuan Iklan)\n. Isi Ulang Hari: 30 Hari\n. Rasio Penurunan: Nol Penurunan\n. Kecepatan: 50K - 250K/Hari\n\nCATATAN:-\n1) Pengguna nyata (Anda akan mendapatkan keterlibatan)\n2) Zero Drop For Fresh Videos\n3) Suka/Tidak Suka + Tampilan + Komentar + Pelanggan (Tergantung pada Konten video dan jumlah yang dipesan)\n4) Tidak ada batasan panjang video (Semua Durasi Didukung)\n5) Tidak ada batasan untuk Konten video (Konten dewasa TIDAK Diizinkan)\n6) Tampilan Akan Menghasilkan Pendapatan.\n7) Waktu tonton akan dihitung untuk monetisasi', 'primary', '1', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(466, 2760, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers MDN 2 [ Refill 365D ] [ Max 1M ] [ REAL ] Non Drop', 5115, 50, 1000000, '50k/days\nyg follow akun lama bukan akun baru\nSangat minim drop, jika drop kemungkinan update ig', 'primary', '0', '', 'jumlah pesan rata rata 294 waktu proses 41 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(467, 2761, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers MDN 3 [ Refill 365D ] [ Max 1M ] [ 10% interaction ] [ HQ ] ♻️', 5115, 50, 1000000, 'Days 50K\nbutton refill 30days di riwayat order\nkemungkinan besar ada 10% interaction diakunmu\nSangat minim drop, jika drop kemungkinan update ig\nHQ\n\nkemungkinan order 1000 mendapat hanya 900 followers\nanda bisa minta refill setelah 24 jam pesanan sukses', 'primary', '1', '30', 'jumlah pesan rata rata 833 waktu proses 1 jam 49 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(468, 2762, 'YouTube Shorts', 'Youtube Short Views Server 5  [Refill Lifetime] [Start Time:0 -24 Hours] [Speed: 60K/Day] ', 14520, 100, 50000000, 'Max 5M', 'primary', '0', '', 'jumlah pesan rata rata 508 waktu proses 10 jam 42 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(469, 2763, 'YouTube Shorts', 'Youtube Short Views Server 6 [Refill Lifetime] [Start Time: 0 - 6 Hours] [Speed: 400K/Day] ', 34430, 25000, 2147483647, 'Speed: 400K/Day', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(470, 2764, 'TikTok View', 'TIKTOK View 1 [ SUPERFAST INSTAN ] [ 100k/day ]', 138, 100, 100000000, '100k/day', 'primary', '0', '', 'jumlah pesan rata rata 8.210 waktu proses 27 menit.', '2022-12-13 07:17:02', '2022-12-13 07:23:24'),
(471, 2766, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  17 [ R30 ][ 2-3k/day ]  LESSDROP', 19800, 50, 100000, '0-6h Start\nR30\nSpeed - 2-3k/d\nDrop 1-3%', 'primary', '0', '', 'jumlah pesan rata rata 1.195 waktu proses 53 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(472, 2767, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  18 [ R30 ][ 40k/day ] Nondrop', 19360, 20, 100000, '30D refill\nfast server', 'primary', '0', '', 'jumlah pesan rata rata 392 waktu proses 26 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(473, 2771, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 13 [ Speed 2k/day ] ', 2750, 200, 10000, 'Murah', 'primary', '0', '', 'jumlah pesan rata rata 400 waktu proses 1 hari  11 jam  44   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(474, 2772, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes Server 9 [ 30 Days refill ] [ 3k-5k/day ] ', 22330, 200, 100000, '0- 6 jam\n3k-5k/hari\nKualitas acc kami bagus\nLink: link fan page Facebook\nContoh format: https://www.facebook.com/link\nKuantitas order harus kelipatan dari 100, contoh yang valid, jumlah: 600, 1000, 1100, 1300, 3500', 'primary', '0', '', 'jumlah pesan rata rata 340 waktu proses 3 hari  8 jam  49   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(475, 2774, 'Facebook Followers / Friends', 'Facebook Follower Profile  16 [ Refill 90days ] Less drop', 28600, 500, 200000, '1k/d', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(476, 2775, 'Facebook Followers / Friends', 'Facebook Follower Profile  17 [ NONdrop ] ', 55000, 50, 1000, 'INSTANT START\nMasukin target Link Profil! ( tidak untuk fanspage )\nReal Followers\nSpeed - 1k/Hour\nNO DROP\nWalaupun Keterangan NODROP tapi kami tidak ada garansi!\nWe provide 10% Extra Followers for covering minor drops', 'primary', '0', '', 'jumlah pesan rata rata 313 waktu proses 3 jam 34 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(477, 2776, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 30 Minutes Live CONCURRENT ]', 19690, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 149 waktu proses 2 hari  22 jam  15   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(478, 2777, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 60 Minutes Live CONCURRENT ] ', 28490, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 2 hari  23 jam  55   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(479, 2778, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 90 Minutes Live CONCURRENT ] ', 44330, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 4 hari  15 jam  43   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(480, 2779, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 120 Minutes Live CONCURRENT ] ', 88550, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 4 hari  1 jam  35   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(481, 2780, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 3 Hours Live CONCURRENT ] ', 134200, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 3 hari  9 jam  7   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(482, 2781, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 6 Hours Live CONCURRENT ] ', 267300, 100, 200, 'Start in 10 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 180 waktu proses 1 hari  3 jam  7   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(483, 2782, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 12 Hours Live CONCURRENT ] ', 357500, 100, 200, 'Start in 5 Minutes\n1000 Live Order will Get 900-1000 Live Stream Viewer', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(484, 2783, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 24 Hours Live CONCURRENT ] ', 533500, 100, 200, '1000 Live Order will Get 900-1000 Live Stream Viewer\nStart in 5 Minutes', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(485, 2784, 'Facebook Group Member', 'Facebook Group Member Server 5 [ 7 Days Refill ] 500-1K/hari ', 8250, 1000, 500000, '0-1hr\n1k/day\n7 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 1.500 waktu proses 1 hari  23 jam  7   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(486, 2785, 'Facebook Page Likes & Page Followers', 'Facebook Page Followers Server 1 [ Lifetime refill ] [ 25K/Day ] ', 30800, 500, 100000, 'starts 1- 6 Hours\n25K/Day\n', 'primary', '0', '', 'jumlah pesan rata rata 1.411 waktu proses 1 hari  6 jam  21   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(487, 2786, 'Facebook Followers / Friends', 'Facebook Follower Profile  18 [ Refill 30 Days ] ', 35200, 1000, 100000, 'Speed: 20K/Day\nStart Time: 0-2 Hours', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(488, 2788, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 21 [ non drop ] [ 30 days guarantee ] ', 18480, 10, 300000, 'superfast', 'primary', '0', '', 'jumlah pesan rata rata 468 waktu proses 3 jam 48 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(489, 2789, 'Youtube View Jam Tayang', 'Youtube Views S9 [ Jam Tayang ] [ 60 Minutes Video ] [ Lifetime Refill ]] [Source - Youtube Homepage] [ BACA Deskripsi ] ', 99000, 200, 5000, 'Non Drop\nLifeTime Refill\nCATATAN :\nGunakan video lebih dari 60 menit untuk hasil terbaik.\nWaktu menonton: 60 menit atau lebih.\nJika Anda menggunakan video lebih dari 60 menit: pesan 1000 view= lebih dari 1000 jam.\nVideo harus maksimal 4 jam.\nJumlah pesanan harus kelipatan 100.', 'primary', '0', '', 'jumlah pesan rata rata 1.050 waktu proses 2 hari  3 jam  17   menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(490, 2790, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 22 [ 10k/day ] [ Lifetime guaranteed ]', 45100, 20, 100000, 'Lifetime guaranteed\nwaktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 838 waktu proses 4 jam 6 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(491, 2791, 'TikTok View', 'TIKTOK View 2 [ FAST ]  TERMURAH! ', 39, 100, 100000, 'perdays 10M', 'primary', '0', '', 'jumlah pesan rata rata 20.325 waktu proses 8 menit.', '2022-12-13 07:17:02', '2022-12-13 07:23:24'),
(492, 2794, 'Youtube Views', 'Youtube Views S13 [ Non Drop ] 20K/Day', 15400, 200, 1000000, 'waktu mulai 0-20 jam', 'primary', '0', '', 'jumlah pesan rata rata 920 waktu proses 16 jam 40 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(493, 2795, 'Youtube Views', 'Youtube Views S14 [ Non Drop ] [ Life Time Guarantee ] 1K/Day ', 12650, 100, 500000, 'Instant\n1k-2k/Day\n 0-1min retention\nfrom internal YouTube source + 3-4?ditional likes]\n 0-5% drops', 'primary', '0', '', 'jumlah pesan rata rata 710 waktu proses 13 jam 26 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(494, 2796, 'Youtube Subscribers [ No Refill ]', 'Youtube Subscribe  No Refill 1  [ TERMURAH ]', 6710, 10, 20000, 'min 10\nmax 20k', 'primary', '0', '', 'jumlah pesan rata rata 208 waktu proses 32 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(495, 2797, 'Instagram Comments', 'Instagram Custom Comments Indonesia Instan 3', 440000, 1, 2000, 'Instan', 'custom_comments', '0', '', 'jumlah pesan rata rata 5 waktu proses 13 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(496, 2798, 'Instagram Views', 'instagram view Server 1 [ Max - 10Juta ] TERMURAH', 17, 100, 10000000, 'waktu mulai 0-60 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 9.521 waktu proses 42 menit.', '2022-12-13 07:17:02', '2022-12-13 07:23:24'),
(497, 2799, 'TikTok Likes', 'TIKTOK Likes Server 21 [ 3k/day ] INSTAN', 2530, 100, 50000, '[ 3k/day ] INSTAN', 'primary', '0', '', ' Not enough data.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(498, 2801, 'TikTok Likes', 'TIKTOK Likes Server 22 [ Refill 30 Days ] HQ', 5720, 100, 100000, 'waktu mulai 6-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 233 waktu proses 8 jam 56 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(499, 2802, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  19 [ No refill ]', 2200, 10, 50000, 'Tidak ada garansi apapun!', 'primary', '0', '', 'jumlah pesan rata rata 180 waktu proses 12 jam 18 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(500, 2803, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  20 [ 30 days refill ] [ 5k/day ]', 5940, 50, 500000, 'Instan\n5k/days', 'primary', '0', '', 'jumlah pesan rata rata 188 waktu proses 57 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(501, 2804, 'Youtube Subscribers', 'Youtube Subscribe S12 [ 90 days refill ] [ 1000/day ] [ Non drop ] TERMURAH DIKELASNYA', 154000, 50, 10000, '1000/day\n90 days refill', 'primary', '0', '', 'jumlah pesan rata rata 320 waktu proses 7 jam 16 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(502, 2805, 'TikTok Likes', 'TIKTOK Likes Server 23 [ Refill 30 Days ] Slow', 4950, 100, 100000, 'Start Time: 0 - 24 Hour', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 5 jam 13 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(503, 2806, 'TikTok Likes', 'TIKTOK Likes Server 24 [ Refill 30 Days ] HQ REAL', 18700, 10, 50000, '2K/Day', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 5 jam 21 menit.', '2022-12-13 07:17:02', '2022-12-13 07:17:02'),
(504, 2807, 'Instagram Likes', 'Instagram Likes S14 [ Lifetime Guaranteed ] [ Real ]  [ Start Time: 0 - 12 Hour ]', 1320, 10, 300000, 'Start Time & Speed: Refer to monitor.justanotherpanel.com\nQuality: MEDIUM, bot accounts with profile pictures and no posts.\nExtra Likes: 0% to 1%.\nRefill: Lifetime Guaranteed\nSpecs: + Impressions + Profile Visits.', 'primary', '0', '', 'waktu prosesNot enough data.', '2022-12-13 07:17:02', '2022-12-13 07:26:22'),
(505, 2808, 'Instagram Likes', 'Instagram Likes S15 [ AUTO REFILL 30 DAYS ] [ FAST ] [ Start Time: 0 -1 Hours ]', 2200, 10, 50000, 'HQ', 'primary', '0', '', 'waktu proses26 menit.', '2022-12-13 07:17:02', '2022-12-13 07:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayarans`
--

CREATE TABLE `metode_pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `process` enum('auto','manual') NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metode_pembayarans`
--

INSERT INTO `metode_pembayarans` (`id`, `process`, `code`, `name`, `rate`, `account_number`, `account_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'auto', 'Bank', 'BCA', 0, '5140690467', 'Hendri Tri Febriyanto', 'Masukan berdasarkan nominal', 'active', '2022-12-05 13:26:03', '2022-12-30 01:02:24'),
(19, 'auto', 'E-Wallet', 'OVO', 0, '0895342301466', 'Hendri Tri Febriyanto', 'Masukan berdasarkan nominal', 'active', '2022-12-30 02:09:52', '2022-12-30 02:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_12_02_104403_create_medans_table', 2),
(4, '2022_12_03_011532_create_histories_table', 3),
(5, '2022_12_04_020542_create_favorits_table', 4),
(6, '2022_12_04_121839_create_history_refills_table', 5),
(7, '2022_12_05_111921_create_deposit_controllers_table', 6),
(8, '2022_12_05_131839_create_metode_pembayarans_table', 6),
(9, '2022_12_05_111921_create_deposit', 7),
(10, '2022_12_06_071311_create_tickets_table', 8),
(11, '2022_12_06_080601_create_ticket_chats_table', 9),
(12, '2022_12_07_133748_create_log_masuks_table', 10),
(13, '2022_12_07_145456_create_log_balances_table', 11),
(14, '2022_12_21_162900_create_announcements_table', 12),
(16, '2022_12_27_155307_create_user_verifies_table', 13),
(17, '2022_12_28_150223_create_gopays_table', 14),
(18, '2022_12_28_172703_create_ovos_table', 15),
(19, '2022_12_28_194436_create_bcas_table', 16),
(20, '2022_12_29_181644_create_smms_table', 17),
(21, '2022_12_29_184055_create_rate_dollars_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `ovos`
--

CREATE TABLE `ovos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` text NOT NULL,
  `otp_ref_id` text DEFAULT NULL,
  `otp_token` text DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ovos`
--

INSERT INTO `ovos` (`id`, `number`, `otp_ref_id`, `otp_token`, `access_token`, `status`, `created_at`, `updated_at`) VALUES
(1, '+62895342301466', 'f0eacab9-fe04-4ea2-bd18-3fca032ed367', NULL, NULL, 'inactive', '2023-01-28 06:25:59', '2023-01-28 06:25:59'),
(2, '+62895342301466', 'beed997d-8408-4723-b315-ad4a7f28aeb6', NULL, NULL, 'inactive', '2023-01-28 06:27:04', '2023-01-28 06:27:04'),
(3, '+62895342301466', 'c410cb0a-ab53-4710-824c-85110d4a619a', NULL, NULL, 'inactive', '2023-01-28 06:28:42', '2023-01-28 06:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rate_dollars`
--

CREATE TABLE `rate_dollars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smm`
--

CREATE TABLE `smm` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service` bigint(20) NOT NULL,
  `category` text NOT NULL,
  `name` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `dripfeed` text NOT NULL,
  `refill` text NOT NULL,
  `cancel` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smm`
--

INSERT INTO `smm` (`id`, `service`, `category`, `name`, `type`, `price`, `min`, `max`, `description`, `dripfeed`, `refill`, `cancel`, `created_at`, `updated_at`) VALUES
(1, 1513, '🔥New Services🔥', 'Facebook 600K Minutes [ Watch Time For 60+mins Video ]', 'Default', '55000', 1000, 1000, 'Start : Instant - 6hrsVideo length should be 60 minutes or more.\nVideo must be Public\n1000 quantity = 600k minutes', '0', '0', '1', '2023-01-10 13:31:10', '2023-01-10 13:42:34'),
(2, 1511, '🔥New Services🔥', 'Facebook Video Views | 10k-20k/Day | Non Drop | Lifetime Guarantee  |', 'Default', '3500', 500, 10000000, '', '0', '0', '0', '2023-01-10 13:31:10', '2023-01-10 13:43:42'),
(3, 1512, '🔥New Services🔥', 'Facebook Reel Video Views | 10k-20k/Day | Non Drop | Lifetime Guarantee  |', 'Default', '3000', 200, 10000000, '', '0', '0', '0', '2023-01-10 13:31:10', '2023-01-10 13:44:17'),
(4, 388, '🔥New Services🔥', 'Youtube Subscribers | 5-20/Day | Non Drop | 30 Days Refill |', 'Default', '59999', 10, 30000, 'Speed : 5-15/DayDrop: 0-20%', '0', '0', '0', '2023-01-10 13:31:10', '2023-01-10 13:45:57'),
(5, 1508, '🔥New Services🔥', 'Youtube Watchtime | Put 5 Min+ Video | 500 Per Day | Lifetime Guarantee | 🔥', 'Default', '74996', 100, 10000, 'Drop: 0%\n- Use videos longer than 5 minutes to get the best effect.\n- Watch time: 5+ minutes\n- If you use Video Length 5+ Minutes : 1000 views = 83+ hours\n- This server: 1000 views = 83+ hours of viewing', '0', '0', '1', '2023-01-10 13:31:10', '2023-01-10 13:47:11'),
(6, 1530, '🔥New Services🔥', 'Instagram Followers | Real | Max 100k | 5k-20k/Day | 365D Refill | ♻️', 'Default', '4500', 100, 50000, 'Start: 0-1h\nSpeed: 5k-20k/Day\nRefill: 365 Days\nQuality: High Quality\nDrop: 5-15%\nLink: Account Link ( must be not private )', '1', '0', '1', '2023-01-24 01:50:28', '2023-01-24 01:50:28'),
(8, 1528, '🔥New Services🔥', 'Tiktok Followers | Real | Max 5k | 5k/Day |', 'Default', '15000', 50, 10000, 'Start 2 minutes', '1', '0', '1', '2023-01-25 15:12:41', '2023-01-25 15:12:41'),
(21, 1248, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Max 1M | Non Drop | 50k/Day | 365 Days Refill♻️', 'Default', '9000', 50, 500000, '\nStart: Instant\nSpeed: 50k/Day\nRefill: 365 days\nQuality: Real\nDrop: 0-4%', '1', '0', '1', '2023-01-11 12:53:02', '2023-01-11 12:53:02'),
(22, 1422, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Max 500K | 10-30% Drop | 10k-50k/Day | 365D Refill | ♻️	', 'Default', '7400', 50, 500000, 'Start: 0-1H\nSpeed: 10k-50k/Day\nRefill: 365 Days\nQuality: Real\nDrop: 10-30%', '1', '0', '1', '2023-01-11 12:56:00', '2023-01-11 12:56:00'),
(23, 488, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Real | Max 1M | 50k-100k/Day | Non Drop | 365Days Refill♻️', 'Default', '10000', 50, 200000, 'Start: 0-10 Min\nSpeed: 30k-50k/Day\nRefill: 130 Days\nQuality: Real\nDrop: 0-5%', '1', '0', '1', '2023-01-11 12:59:20', '2023-01-11 13:02:57'),
(24, 817, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Max 10M | 30k-50k/Day | Non Drop | 130D Refill |♻️', 'Default', '11000', 50, 500000, '\nStart: 0-10 Min\nSpeed: 30k-50k/Day\nRefill: 130 Days\nQuality: Real\nDrop: 0-5%', '1', '0', '1', '2023-01-11 13:03:44', '2023-01-11 13:03:44'),
(25, 1345, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 30D Refill | ♻️', 'Default', '5500', 20, 300000, '\nStart: 0-30 Min\nSpeed: 10k-30k/Day\nRefill: 30 days\nQuality: Real\nDrop: 0-10%', '1', '0', '1', '2023-01-11 13:06:04', '2023-01-11 13:06:04'),
(26, 696, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Real | Good Quality | 10k/Day | 30D Refill ♻️⛔', 'Default', '6000', 10, 150000, 'Start: 0-1H\nSpeed: 10k/Day\nRefill : 30 Days\nQuality: High Quality\nDrop: Very Low', '1', '0', '1', '2023-01-11 13:09:58', '2023-01-11 13:13:25'),
(27, 1346, 'Instagram Followers [Guaranteed]', 'Instagram Followers | Max 300K | Real | 10k-30k/Day | Non Drop | 60D Refill | ♻️', 'Default', '5988', 10, 300000, 'Start: 0-30 Min\nSpeed: 10k-30k/Day\nRefill: 60 days\nQuality: Real\nDrop: 0-10%', '1', '0', '1', '2023-01-11 13:13:33', '2023-01-11 13:13:33'),
(28, 463, 'Instagram Followers [Not Guaranteed]', 'Instagram Followers | Max 10k | 10k/day | No Refill', 'Default', '1750', 20, 10000, 'Start: 0-1H\nSpeed: 10k/Day\nRefill: No\nQuality: Bot\nDrop: Very High\n\n❌No Cancel/Refill/Refund', '1', '0', '1', '2023-01-11 13:16:24', '2023-01-11 13:23:17'),
(29, 1219, 'Instagram Followers [Not Guaranteed]', 'Instagram Followers | Super Quality | Max 1k | 1k/Day | No Refill', 'Default', '1489', 100, 4000, 'Start: 0-10 Min\nSpeed: 1k/Day\nRefill: No\nQuality: Very Good Quality\nDrop: Usually No Drop, But can drop 0-30%', '1', '0', '1', '2023-01-11 13:24:43', '2023-01-11 13:24:43'),
(30, 810, 'Instagram Followers [Not Guaranteed]', 'Instagram Followers | Bot | Max 10k | 10k/day | No Refill |', 'Default', '1589', 10, 10000, 'Start: 0-1H\nSpeed: 1k/Day\nRefill: No\nQuality: Bot', '1', '0', '1', '2023-01-11 13:25:42', '2023-01-11 13:25:42'),
(31, 1220, 'Instagram Followers [Not Guaranteed]', 'Instagram Followers | Super Quality | Max 3k | 3k/Day | No Refill', 'Default', '2149', 20, 6000, 'Start: 0-3H\nSpeed: 3k/Day\nRefill: No\nQuality: Very Good Quality\nDrop: Usually No Drop, But can drop upto 0-30%', '1', '0', '1', '2023-01-11 13:27:04', '2023-01-11 13:27:04'),
(32, 305, 'Instagram Followers [Not Guaranteed]', 'Instagram Followers | Real | Max 100K | 10k-20k/Day | No Refill |⛔	', 'Default', '2700', 10, 100000, 'Start: 0-3H\nSpeed: 3k/Day\nRefill: No\nQuality: Very Good Quality\nDrop: Usually No Drop, But can drop upto 0-30%', '1', '0', '1', '2023-01-11 13:28:13', '2023-01-11 13:28:13'),
(50, 1342, 'Instagram Likes', 'Instagram Likes | Real | Max 50k | 10k-50k/Day | Non Drop |♻️', 'Default', '750', 100, 150000, 'Start: 0-5 Min\nSpeed: 10k-50k/Day\nRefill: 30 days\nQuality: Real\nDrop: 0-5%', '1', '0', '1', '2023-01-11 13:31:28', '2023-01-24 03:39:40'),
(51, 1438, 'Instagram Likes', 'Instagram Likes | Real | Max 300k | 10k-50k/Hour | No Refill |', 'Default', '1350', 100, 60000, 'Start: Instant\nSpeed: 10k-50k/Hour\nRefill: No\nQuality: Real\nDrop: 0-10%, Can Drop More', '1', '0', '1', '2023-01-11 13:33:10', '2023-01-11 13:33:10'),
(52, 1256, 'Instagram Likes', 'Instagram Likes | Real | Max 10k | 10k/Hour | Lifetime Guarantee | ♻️♻️', 'Default', '2500', 10, 50000, '\nStart: 0-1H\nSpeed: 10k/Hour\nRefill: Lifetime\nQuality: Real\nDrop: 0-2%', '1', '0', '1', '2023-01-11 13:34:39', '2023-01-11 13:34:39'),
(53, 697, 'Instagram Likes', 'Instagram Likes | FEMALE | Max 5K | 5k/Day | No Refill |	', 'Default', '3700', 10, 1000, '\nStart: 0-1H\nSpeed: 5k/Day\nRefill: No\nQuality: Real Female Profile\nDrop: Usually 0-5%, Can Drop More', '1', '0', '1', '2023-01-11 13:37:03', '2023-01-11 13:37:03'),
(61, 139, 'Instagram Views', 'Instagram Views + Reel Views | Non Drop | Max 5M | 1M/Day |', 'Default', '37', 100, 50000000, 'Start: 0-1H\nSpeed: 1k-10k\nRefill: NON DROP\nQuality: High Quality\n\n**This is a slow service as we mention, do not create ticket for speed up\nYou can use cancel button, if you want to cancel the order', '1', '0', '1', '2023-01-11 13:39:56', '2023-01-27 07:40:07'),
(62, 338, 'Instagram Reel', 'Instagram Reel+ IGTV Views | 1M/Day | Max 10M | Non Drop | Working |', 'Default', '187', 1000, 30000000, 'Start: INSTANT\nSpeed :1k-10k/Hour\nGuarantee: Non Drop\nQuality: High Quality', '1', '0', '1', '2023-01-11 13:44:23', '2023-01-11 13:44:23'),
(63, 24, 'Instagram Views', 'Instagram Views | Max 10M | Instant | Non Drop | 1M/Day |', 'Default', '35', 100, 10000000, '🕐Start : Instant-5 minute\n⚡Speed : 1M/day\n🔥Guarantee : Non Drop\n🔽Minimum : 500\n🔼Maximum : 1M', '1', '0', '1', '2023-01-26 04:38:49', '2023-01-26 04:38:49'),
(64, 1477, 'Instagram Views', 'Instagram Video Views + Reel | Non Drop | Max 4M | 1M/ Day |', 'Default', '45', 100, 10000000, '\nStart: Instant\nSpeed: 1M/Day\nRefill: No\nQuality: Real', '1', '0', '1', '2023-01-26 04:40:14', '2023-01-26 04:40:14'),
(664, 232, 'Instagram IGTV', 'IGTV Like | NEVER DROP | Real Users | Max 50K | High Quality🔥', 'Default', '6000', 20, 50000, 'Start: Instant\nSpeed: 20k/Day\nRefill: Never Drop\nQuality: High Quality', '1', '0', '1', '2023-01-11 13:46:24', '2023-01-11 13:46:24'),
(665, 409, 'Instagram Story | Save | Impression | Reach', 'Instagram Story Views | All Story | Max 10K | Instant |	', 'Default', '100', 10, 100000, '\nStart: 0-15 Min\nSpeed: 20k/Day\nRefill: No\nQuality: Real\nDrop: 0%', '1', '0', '1', '2023-01-11 13:49:45', '2023-01-11 13:49:45'),
(666, 1169, 'Instagram Story | Save | Impression | Reach', 'Instagram Story Views | All Story | Max 3K | Fast |', 'Default', '110', 100, 3000, '\nStart: 0-30 Min\nSpeed: 3k/Hour\nRefill: Non Drop\nQuality: Real', '1', '0', '1', '2023-01-11 13:50:56', '2023-01-11 13:50:56'),
(667, 1266, 'Instagram Story | Save | Impression | Reach', 'Instagram Story Views | Max 20K | All Stories |', 'Default', '300', 10, 100000, '\n\nStart: 0-1H\nSpeed: 20k/Day\nRefill: Non Drop', '1', '0', '1', '2023-01-11 13:52:19', '2023-01-11 13:52:19'),
(668, 1266, 'Instagram Comments', 'Instagram Comments | Random | Super Quality | 10k/Day | Non Drop |', 'Default', '13000', 10, 10000, 'Start: 0-1H\nSpeed: 10k/Day\nRefill: Non Drop\nQuality : Real Accounts with pp & posts', '1', '0', '1', '2023-01-11 13:53:40', '2023-01-11 13:53:40'),
(669, 597, 'Tiktok Followers', 'Tiktok Followers | Real | Max 1k | 1k/Day | No Refill |', 'Default', '14364', 10, 10000, '\nStart: 0-1H\nSpeed: 100/Day\nRefill: No\nQuality: Real\nDrop: N/A', '1', '0', '1', '2023-01-11 13:57:18', '2023-01-11 13:57:18'),
(670, 1406, 'Tiktok Followers', 'Tiktok Followers | Real | Max 100k | 10k/Day | Low Drop | No Refill |', 'Default', '17499', 100, 500000, '\nStart: 0-1H\n', '1', '0', '1', '2023-01-11 13:58:49', '2023-01-11 13:58:49'),
(671, 1217, 'Tiktok Followers', 'Tiktok Followers | Real | Max 100k | 10k-20k/Day | 120 Days Refill | ♻️', 'Default', '26843', 50, 100000, 'Start: 0-6H\nSpeed: 10k-20k/Day\nRefill: 120 days\nQuantity: Real\nDrop: 0-5%\n', '1', '0', '1', '2023-01-11 14:00:32', '2023-01-11 14:00:32'),
(672, 1353, 'Tiktok Followers', 'Tiktok Followers | Max 10K | Non Drop | 5k/Day | 30D Refill |♻️', 'Default', '25843', 100, 300000, 'Start: 0-6H\nSpeed: 10k-20k/Day\nRefill: 120 days\nQuantity: Real\nDrop: 0-5%\n', '1', '0', '1', '2023-01-11 14:01:43', '2023-01-11 14:01:43'),
(673, 425, 'Tiktok Likes', 'Tiktok Like | Real | Max 10k | No Refill | 10k/Day |', 'Default', '5000', 10, 100000, '\nStart: 0-1H\nSpeed: 10k/Day\nRefill: No\nQuality: Real\nDrop: N/A\n', '1', '0', '1', '2023-01-11 14:05:53', '2023-01-11 14:05:53'),
(674, 1358, 'Tiktok Likes', 'Tiktok Like | Real | Max 10k | No Refill |', 'Default', '9250', 100, 100000, '\nStart: 0-1H\nSpeed: 1k-5k/Day\nRefill: No\nQuality: Real', '1', '0', '1', '2023-01-11 14:07:21', '2023-01-11 14:07:21'),
(675, 1171, 'Tiktok Views', 'Tiktok Views | Max 10M | Superfast | 1M/Day | Non Drop', 'Default', '100', 100, 10000000, '\nStart: 0-1H\nSpeed: 1k-5k/Day\nRefill: No\nQuality: Real', '1', '0', '1', '2023-01-11 14:10:18', '2023-01-11 14:10:18'),
(676, 608, 'Tiktok Views', 'Tiktok Views | Max 10M | Instant | 100k/Day | Cheapest |', 'Default', '120', 100, 90000000, 'Start: 0-1H\nSpeed: 1M/Day\nRefill: No\nQuality: Real\nDrop: N/A', '1', '0', '1', '2023-01-11 14:11:20', '2023-01-11 14:11:20'),
(677, 833, 'Facebook Profile Followers', 'Facebook Profile Followers | Max 100k | 2k-10k/Day | No Refill', 'Default', '19667', 1000, 15000, 'Drop: 0-5%\nNote : No Refund If you use page link, This Service only for facebook Profile Followers', '1', '0', '1', '2023-01-14 08:00:06', '2023-01-14 08:00:06'),
(680, 1393, 'Youtube Subscriber', 'Youtube subscriber | 200-500/Day | Non Drop | Lifetime Guarantee | 🔥♻️', 'Default', '125000', 50, 20000, '\nStart: 0-24H\nSpeed: 200-500/Day\nRefill: Lifetime\nQuality: Real\nDrop: 0-5%', '1', '0', '1', '2023-01-24 02:07:12', '2023-01-24 02:07:12'),
(681, 33, 'Youtube Subscriber', 'Youtube Subscribers | Instant Start | No Refill | Max 10k | 10k/Day', 'Default', '8500', 100, 20000, 'Link: www.youtube.com/channel/UC5aSJYXrNDzTkQmEC0Amkow\nStart: 0-30 Min\nSpeed: 15k/Day\nRefill: NO\nQuality: Real Users', '1', '0', '1', '2023-01-24 02:08:39', '2023-01-24 02:08:39'),
(683, 1296, 'Youtube Likes', 'Youtube Like | Real | Max 100k | 10k-20k/Day | Non Drop | No Refill |', 'Default', '4500', 10, 100000, 'Start: Instant\nSpeed: 50k-100k/Day\nRefill: 30 Days\nQuality: Real\nDrop: 0-5%', '1', '0', '1', '2023-01-24 02:11:09', '2023-01-24 02:12:08'),
(684, 1297, 'Youtube Likes', 'Youtube Like | Real | Max 100k | 20k-50k/Day | Non Drop | 30D Refill | ♻️', 'Default', '5500', 10, 100000, '\nStart: 0-10 Min\nSpeed: 20k-50k/Day\nRefill: 30 days\nQuality: Real\nDrop: 0-2%', '1', '0', '1', '2023-01-24 02:13:59', '2023-01-24 02:13:59'),
(685, 861, 'Youtube Views ', 'Youtube Views | Max 1M | 2k-5k/Day | Non Drop | Lifetime Refill♻️', 'Default', '11000', 100, 550000, 'Start: 0-6H\nSpeed: 5k-10k/Day\nRefill: Lifetime\nQuality: Real', '1', '0', '1', '2023-01-24 02:16:56', '2023-01-24 02:16:56'),
(686, 1249, 'Youtube Views ', 'Youtube Superfast Views | SUGGESTED VIEWS+ 2% Free Likes | 500k/Day | NEVER DROP |🔥🔥', 'Default', '12000', 100, 4000000, 'Start: 0-6H\nSpeed: 500k/Day\nRefill: 90 days\nQuality: Real\nDrop: 1%', '1', '0', '1', '2023-01-24 02:20:20', '2023-01-24 02:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_id` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `type_ticket` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `status` enum('open','closed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `ticket_id`, `subject`, `type_ticket`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'TCK-1670327962', 'Order', 'order', 'ddd', 'open', '2022-12-06 11:59:22', '2022-12-21 13:11:51'),
(4, 1, 'TCK-1670328760', 'asdad', 'order', 'ddd', 'closed', '2022-12-06 12:12:40', '2022-12-10 10:28:04'),
(5, 1, 'TCK-1672640242', 'Pesanan belum masuk', 'order', 'halo kak ada yang bisa saya bantu?', 'open', '2023-01-02 06:17:22', '2023-01-02 06:17:54'),
(6, 5, 'TCK-1672946394', 'Deposit', 'deposit', 'mohon maaf atas keterlambatan pesan tiket', 'open', '2023-01-05 19:19:54', '2023-01-09 05:24:04'),
(7, 22, 'TCK-1674567046', 'Deposit tdk msk', 'deposit', 'Mohon maaf atas keterlambatan. Mohon dicek ulang terimakasih🙏', 'open', '2023-01-24 13:30:46', '2023-01-25 09:50:36'),
(8, 30, 'TCK-1674878647', 'BELUM MASUK', 'deposit', 'ID : 202301280928169452', 'open', '2023-01-28 04:04:07', '2023-01-28 04:04:07'),
(9, 38, 'TCK-1674884828', 'Deposit', 'deposit', 'ayo min tolong dibantu', 'open', '2023-01-28 05:47:08', '2023-01-28 05:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_chats`
--

CREATE TABLE `ticket_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('user','admin') NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_chats`
--

INSERT INTO `ticket_chats` (`id`, `ticket_id`, `user_id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 'TCK-1670327962', 1, 'admin', 'adad', '2022-12-21 13:11:40', '2022-12-21 13:11:40'),
(2, 'TCK-1670327962', 1, 'user', 'ddd', '2022-12-21 13:11:51', '2022-12-21 13:11:51'),
(3, 'TCK-1672640242', 1, 'user', 'tidak masuk', '2023-01-02 06:17:22', '2023-01-02 06:17:22'),
(4, 'TCK-1672640242', 1, 'admin', 'halo kak ada yang bisa saya bantu?', '2023-01-02 06:17:54', '2023-01-02 06:17:54'),
(5, 'TCK-1672946394', 5, 'user', 'Saya udah depo pakai sistem otomatis kok saldo belum masuk masuk', '2023-01-05 19:19:54', '2023-01-05 19:19:54'),
(6, 'TCK-1672946394', 1, 'admin', 'mohon maaf atas keterlambatan pesan tiket', '2023-01-09 05:24:04', '2023-01-09 05:24:04'),
(7, 'TCK-1674567046', 22, 'user', '202301242004463872 id deposit g msk2', '2023-01-24 13:30:46', '2023-01-24 13:30:46'),
(8, 'TCK-1674567046', 1, 'admin', 'Mohon maaf atas keterlambatan. Mohon dicek ulang terimakasih🙏', '2023-01-25 09:50:36', '2023-01-25 09:50:36'),
(9, 'TCK-1674878647', 30, 'user', 'ID : 202301280928169452', '2023-01-28 04:04:07', '2023-01-28 04:04:07'),
(10, 'TCK-1674884828', 38, 'user', 'Deposit 50.664 ga masuk', '2023-01-28 05:47:08', '2023-01-28 05:47:08'),
(11, 'TCK-1674884828', 38, 'user', 'ayo min tolong dibantu', '2023-01-28 05:47:20', '2023-01-28 05:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `secret_key` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `omzet` int(25) DEFAULT NULL,
  `whitelist_ip` varchar(255) DEFAULT NULL,
  `role` enum('user','reseller','admin') NOT NULL DEFAULT 'user',
  `status` enum('active','banned','nonverif') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `api_key`, `secret_key`, `balance`, `omzet`, `whitelist_ip`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jhon', 'jhonwlkr', 'stevenimous999@gmail.com', '$2y$10$y9/DMVoVBwe34/4hFZKtPur4mXMNkPNhcrWkD0pse2jR6vyR8nx9i', NULL, 'zAeIOQ9zDOG2CXHGSVNJYT0jrhF769Wf3WQlx4mnFgHIFDc=', '174371', 3434, 7148, NULL, 'admin', 'active', '2022-12-30 00:51:16', '2023-01-19 03:31:56'),
(2, 'Muhammad Rizky Putra', 'yudha', 'rizkyputra066kr@gmail.com', '$2y$10$eU4Bwz78/FLyg4.v4ENsOe1z8G6dJEjVXBYBldZnKChew/MmpJWPy', 'r75JcnSf2xulNX1Xtg0PXIhiKqIYqxPFQmZtkYrHITt8pGdG7sC9X9QzAjKG', '56227a79b4df790007708b86e96c18841b9aef5c', '570637', 0, 0, NULL, 'admin', 'active', '2022-12-30 01:37:19', '2022-12-30 01:37:48'),
(3, 'Putri laduni', 'Putryls', 'putriladuni79@gmail.com', '$2y$10$lssvcOCrIhxabBkACV0rze0Mmp7xU9//N3TaKQFB0ktdu61wTFboC', 'z66acPREU7LPBgN63l8isfAx39kKFwVSR4mlJc8xMPeCvSoxwI9kRhtUvk4m', 'dc79bc8d4ca747f2c9bcfc16a97a38c92e2c5ea5', '881509', 22685, 10743, NULL, 'user', 'active', '2022-12-30 03:46:18', '2023-01-28 11:24:36'),
(4, 'Anwar Sholeh Al Qorni', 'anwarsholeh', 'anwar.sholeh022@gmail.com', '$2y$10$QFAcxPtF3RlJeKU.lXiYdOXzE6785oYoFU4/kbnv4wQ6mkxZTVU1u', NULL, '1e6a00cb689bb69cb56768d1cf7580400ad6aa0e', '435464', 6568, 4956, NULL, 'user', 'active', '2022-12-30 03:57:24', '2023-01-28 00:43:20'),
(5, 'Hari Kurniawan', 'haristore', 'harikurniaewan0901@gmail.com', '$2y$10$7UoASI9UvsICHV48VROVzucN2nbmIiQI8SQMtO/8nmDQ9dxHsj1jW', 'SgXz1Wj7nDjqfm33fPGHXMPwBtjyiTbhWBD49m0FHaEXuVzcLvEAt8tg6Cv8', '36c64f85df232c0466a3526d62c5e987ffbfceb2', '611690', 1946, 28199, NULL, 'user', 'active', '2022-12-30 08:57:30', '2023-01-21 05:51:50'),
(6, 'Agung Rahmadi', 'Fypmedia', 'Agungrahmadi222@gmail.com', '$2y$10$ALCO1JGP3aShf/uSllzoSuIN.31IAXd96hhkXlyLh8V.YTAJZ8LaG', 'pJLO85Z2uwk2Q7pMdDQ8KVNNF01Jf3TxNlNQDfgibJ4YrVqC15NLh6oiNVtm', 'b59c675b414b0ba5e91b8c0e69c576a07049fec6', '596609', 4164, 388367, NULL, 'user', 'active', '2022-12-30 09:38:05', '2023-01-28 13:11:03'),
(7, 'hyugan', 'inidudung', 'culunb936@gmail.com', '$2y$10$/ojy9zVMYciJdxt3yUydw./xbIEaeBH7l8/keJvb1EBfsI.lCFpDu', NULL, '101dff3695baa4ee64e6af8cf247c3d35736b603', '733303', 0, 0, NULL, 'user', 'active', '2022-12-30 16:43:28', '2022-12-31 02:26:42'),
(8, 'balik kanan', 'pulang', 'jamalsetyawan3@gmail.com', '$2y$10$mCAQoR6xweYpYUjuUzhIueiS1vKwzaJ8ETVcuYJ7JF0vLYvn/3nLW', NULL, '885cf2afa53df429cb908d648770f8afee32166f', '766976', 0, 0, NULL, 'user', 'active', '2022-12-30 16:47:11', '2022-12-30 16:47:28'),
(9, 'steven wijaya', 'stevenwii48', 'stevenwii48@gmail.com', '$2y$10$DxiK8yPBzpqSC4xRFoYW3ejAe8Laknxne69NvKAtN5rE53ibkhNfO', NULL, 'ded7e6169dc7f8f117071922b71f114cd5b73974', '607774', 788, 56212, NULL, 'user', 'active', '2022-12-31 03:52:43', '2023-01-11 19:11:02'),
(10, 'Pitsa', 'Pitsa', 'Pitsatech.store3@gmail.com', '$2y$10$9QQgHmef2wUBm5UpZ3RuheJxE04jw.NZoYh/TH.HK8kJolPldt88u', NULL, '3ab3e6fd5161f6a69caf29ac25e948744a7db46e', '159310', 0, 0, NULL, 'user', 'active', '2023-01-05 06:18:53', '2023-01-05 06:19:25'),
(11, 'Candra', 'Candrasp27', 'candraputra3133@gmail.com', '$2y$10$U4iUH9x3m8HeFNc3C7o5n.7ot5w/XSuzRFUFND5zZeP/X8/N80tti', 'jzHmBxe3XwjzbPpaDmhzhT3AcFm1PlFYtee5jEOrAvJTIjFumgITXDwgYGOy', '8506d939b3a9d98a43b2d79d28d63530e6be2f21', '541920', 0, 0, NULL, 'user', 'active', '2023-01-06 02:33:41', '2023-01-06 02:34:05'),
(13, 'Yusron syarif', 'Humbelang', 'Yusronsyaarif@gmail.com', '$2y$10$RCdMee7Z.YKi/.qjGkJoMuzKy8rc0kYTGy0enNMyFoyBz1Vg.Zolm', NULL, 'e9e1d5e9ba4e60e019eef5a73559a456aa44d89f', '452026', 0, 28050, NULL, 'user', 'active', '2023-01-06 13:22:31', '2023-01-07 15:49:12'),
(14, 'rzlaffnd', 'rzlaffnd', 'custom.classic@yahoo.com', '$2y$10$jVBzDUh/EWrhfnSmzE4Uz.xu3JshX7fH60xdsFRIKk/nWrGlKNmhS', '5hv20GuwRjOgLgl9Fp0dcJDbTq6xSdi25w2axabvEzmylq7Xq7eUBYkhn30A', '5bc101b4d7a6cc71934240f634d7ad41461a1b01', '487888', 0, 0, NULL, 'user', 'active', '2023-01-06 16:03:48', '2023-01-06 16:04:38'),
(15, 'Fikri Hidayatullah', 'fikri2509', 'fikrihidayat2509@gmail.com', '$2y$10$q3ii5mJJBYTznLqDqYvlZO23hwGB86k1wFNbWAhAFD/GSp9aVEXpO', NULL, 'dfba547eb27cfc318116a9acde60d047424d0a8f', '696624', 0, 0, NULL, 'user', 'active', '2023-01-06 23:00:35', '2023-01-06 23:00:56'),
(16, 'Zeonet', 'Zeonet', 'kasurputih06@gmail.com', '$2y$10$opc5EPwHtrN1HxYwv3Tgju/hHLYzKqo2BHjf/6/okazoarlV.Souy', NULL, '6b26f9c7191ec3e11520bf81135ea985be0681de', '428583', 0, 0, NULL, 'user', 'active', '2023-01-08 15:21:27', '2023-01-08 15:21:46'),
(17, 'Ikhwan', 'Ikhwan', 'Ikhwanyaoke@gmail.com', '$2y$10$h5/N4UVeaWkM0foOeM6ZQelD0ArMNlRP80RwSxtsu0kuKL0yv7d12', NULL, '65a1f971cb57de19840d6927828109d962631996', '230394', 0, 0, NULL, 'user', 'active', '2023-01-10 03:58:17', '2023-01-10 03:59:09'),
(18, 'Abdurrahman Siregar', 'abdurrahmansiregar', 'rahmankazuki77@gmail.com', '$2y$10$1IlpPVoVxYlsSwfPg0eUbONlJPDpNyTetzIzM1ARRRKy5CQ2TKIly', NULL, '46d1dc5aa83add37359dc5dab2f262ca7cacb0f2', '196782', 0, 0, NULL, 'user', 'active', '2023-01-14 12:43:52', '2023-01-14 12:45:03'),
(19, 'Maghfira Rati taufiq', 'Maghfira123', 'maghfira147@gmail.com', '$2y$10$O.vqtEdFPIwha4nnHvCKkeqEwAcuTTA4yUKwrO1PF3ceT0RePVvdG', NULL, '16e9781962b8645140c527aa8e9d5bea343f81c9', '512971', 0, 0, NULL, 'user', 'active', '2023-01-24 07:09:16', '2023-01-24 07:35:52'),
(20, 'Daily Bisnis', 'dailybisnis', 'dailybisnis@gmail.com', '$2y$10$NYcfW6uk6kU3zb2C7xspluOmIsQIjWHSzDXrwpsGGEPa/FN0O9ltK', NULL, '26953bd56aacbc1f10407e4cd9d94a35acac140c', '777925', 0, 0, NULL, 'user', 'active', '2023-01-24 07:09:23', '2023-01-24 07:35:57'),
(21, 'Renaldi Ramba', 'renaldinaldi', 'naldiramba23@gmail.com', '$2y$10$vWAII6L8XwaHAiYiIqEl5e.NgO575Ej69FSsokxEA//704TUiWsRS', NULL, '5ec0302ddd16186e20024df3ee468de6188c9774', '533632', 19650, 883, NULL, 'user', 'active', '2023-01-24 08:28:33', '2023-01-24 21:22:00'),
(22, 'Radika', 'Radika9c', 'radika.rizky210@gmail.com', '$2y$10$Nl4fckUGWQkjcitKXe0VYuzKSFKwsBR52wkgEw4AqBHs7RjOhMNnW', NULL, '832a64442b511e69c9454bba3f597074f6ea0d6a', '523883', 4180, 21546, NULL, 'user', 'active', '2023-01-24 13:03:12', '2023-01-24 14:12:05'),
(23, 'Fitra adha aryananda', 'Fitra144', 'Fitraadha33@gmail.com', '$2y$10$bDftwxy10gFujSnth1XcU.xY/ojsGenlAXoXBLPTSewDBEnHZp4vi', NULL, '9286c25de10e2a351a7f2d8467fda128a8c01c8f', '509741', 0, 0, NULL, 'user', 'active', '2023-01-24 14:36:29', '2023-01-24 14:36:53'),
(24, 'Zulfi', 'zulfi', 'zulfiferdiansyah44@gmail.com', '$2y$10$XUwiyTMPOj3Y2zIbKnEcFeF74qlGuRIC0JK7TF2pugVL2pM2r22FO', NULL, 'db7c1aad9f5334943c69899d40282c38b5ee4b6a', '749364', 13527, 36473, NULL, 'user', 'active', '2023-01-25 03:52:13', '2023-01-27 10:53:47'),
(25, 'Imam aji', 'baktia', 'baktiibu40@gmail.com', '$2y$10$S/wfJfA/..U9PHKqumfru.bjzPLEchHOy2dAu/OSTazgcoSy0Kj8O', 'QjuuAC2j0Wjawla9tP5SemjdVEiNt6PhWYJ6rIbaVjSy87CBP4B22YBiJAfm', '912e062440f60d4dbba0e8ebc3c2afa31722b6ac', '292964', 477, 10000, NULL, 'user', 'active', '2023-01-25 04:08:14', '2023-01-25 04:37:31'),
(26, 'Alwan', 'fazlulaar', 'fazlulaar@gmail.com', '$2y$10$EfC1vI99h3REyyoXCKJiGOQiGBg2v9zmC9Uaigb9abzJFqmJSPyYG', NULL, 'd7626f5d6b153cb27823f72b9d52aebedc869e10', '671174', 1964, 8909, NULL, 'user', 'active', '2023-01-25 09:43:20', '2023-01-26 04:40:02'),
(27, 'Baby10', 'Baby10', 'fawwazakbar89@gmail.com', '$2y$10$VLf7c5WBxPlWKgs/IHHmc.nSNy33hu1NlxEvxHmurN5uXB2AznFVW', 'O17aTyNWV5qA5wB91puDOokMqHgSADkLeQIRIv8YEOmQ19tKBHU40lTOr1Zy', 'c1c4257e6be92ce0bb0be0ef42e8d39ff84b7ad4', '425906', 5936, 14393, NULL, 'user', 'active', '2023-01-25 15:02:24', '2023-01-25 15:08:07'),
(28, 'dewa', 'el diablo', 'bigshaq6990@gmail.com', '$2y$10$DM4od3QgaD6PXXxkrwN3xOZXyE9p61ZL3kkCXQdyvtJPD.IxUiOme', 'IQHfilhs8L5U0gcrXWG9JWChGQjnZwE8Y6ZLBWaTsX582A62EC1fcDm1gDtG', 'a0c617bdfeabdca632d8e2b844d9cfa53fde2485', '290418', 0, 0, NULL, 'user', 'active', '2023-01-25 15:50:39', '2023-01-25 15:51:10'),
(29, 'bryan', 'bryanag', 'bryanag@givmail.com', '$2y$10$bnfkI3gvYgWSg2Gma829ru1fvowf4yIlcKpYS5/0cgEMlITdqAxr.', NULL, '61ac4440c069e73569cf73bbe5163c77d9eec3e8', '705388', 0, 0, NULL, 'user', 'active', '2023-01-26 02:18:38', '2023-01-26 02:20:23'),
(30, 'vegi rama', 'vegirama', 'vegera227@gmail.com', '$2y$10$klE.IBhAbSW.Rb8hfjK4UO1BaP7dfjak7m9TZZB1as7Ov.t3b.lE6', NULL, 'd6a44ab4ccab9735751cbc49495f593e17b22a2a', '427457', 33026, 17499, NULL, 'user', 'active', '2023-01-26 11:53:30', '2023-01-28 04:32:45'),
(31, 'zhupu', 'zhu', 'cucu0722@gmail.com', '$2y$10$EeWGXzfwfEdKQJ1iaDMqReU.oQgp7F1cdInTQ1iPlbxRE4KkLppCS', NULL, '899f75ec5237bb71e0ade90ca9d9412191d30ef5', '835248', 0, 0, NULL, 'user', 'nonverif', '2023-01-26 14:00:38', '2023-01-26 14:00:38'),
(32, 'zhupyyy', 'zhupy_067', 'cucu0722y@gmail.com', '$2y$10$f8R6CMYntnX7FDbamOzZBOnuBf/nI530EH8EmAuYvPd25.xKFks0u', NULL, '989cf14d488a2f1170b9f0df4f1b917c92d8954c', '832641', 0, 0, NULL, 'user', 'nonverif', '2023-01-26 14:02:09', '2023-01-26 14:02:09'),
(33, 'Ardi', 'Saputra', 'ardisaputra2912@gmail.com', '$2y$10$xmqPUO9aimKR515VAX/EQu13WRoOMMP67qLn.q81iHgAaeee0TtJ.', NULL, '94d4a5ab10f7c66aa25c3aa1a70ebe756850ce48', '983217', 0, 0, NULL, 'user', 'active', '2023-01-26 16:40:55', '2023-01-26 16:41:15'),
(34, 'Dimas Purnomo', 'dimasakdulu', 'dmsprnm00@gmail.com', '$2y$10$RIPZ4vuvbcM8Eb/dEFYT3u0kXoU6Cm/kQQLDoVaPZnXLEE5rUav8q', NULL, '14344def4c7e381716142e230cb399d45096fd52', '991971', 0, 0, NULL, 'user', 'active', '2023-01-27 08:06:02', '2023-01-27 08:06:30'),
(35, 'Dandy S', 'Dandysgb', 'gataulau@gmail.com', '$2y$10$iSMth5ZxGhkHf9ouE38s3OdYKg5EDoLXJQD6VUS10f/JSvlhIiNcC', NULL, 'adc73e7b43a281c7e38905661e9c893c57244e54', '231437', 249, 15000, NULL, 'user', 'active', '2023-01-27 10:22:02', '2023-01-27 10:36:40'),
(36, 'afif syaifullah', 'afifsyaifullah', 'afifsyaifullah1512@gmail.com', '$2y$10$84Iu1KeoGz0nmVEOkDAyHu9EiiFHxe3EOwDGaVmgXzbEFpNCdojD6', NULL, '1b6d27fe75aac3b7559441b987ba0c5598f0b40d', '216980', 0, 0, NULL, 'user', 'active', '2023-01-27 16:39:59', '2023-01-27 16:40:17'),
(37, 'Dwi', 'Dwi02', 'kelvinpratama583@gmail.com', '$2y$10$wcciTPlQvRzW5l6OZTVCZ.EuEkxhQEQJXodCGcdWxBHf4Eg3TajoS', 'SdBrmz0lVQ8vcbMjNG7iIXwnHIiFRl8MN8XwH5E1SKmQpkPdhocC1ltI7vEP', '9e17eb813297a2a18c2f950c1caa954b7049ec2a', '983808', 19708, 1000, NULL, 'user', 'active', '2023-01-28 03:48:51', '2023-01-28 04:13:31'),
(38, 'Alvin Adwitya Rizky Ramadhan', 'Alvinzone', 'alvindotid@gmail.com', '$2y$10$npj9/XDqcW9m203JNFeX2e5aZ0CB21q75DMucJsPIAk9ObjuAmOum', NULL, 'ef4e5d784474069deb3b38b054c96f8e6de6d3c1', '503847', 77129, 95438, NULL, 'user', 'active', '2023-01-28 05:03:03', '2023-01-29 01:03:59'),
(39, 'Yogy Pratama', 'Gyprtma', 'yogypr03@gmail.com', '$2y$10$Ik30XveWvDFO88lWdNBwVuIbroWosoJygCLSpuj2xWGoH3h42PJF6', NULL, '640b023722c75446bfa10afa8ea0e0b84a7da4d7', '806379', 2098, 18445, NULL, 'user', 'active', '2023-01-28 05:35:05', '2023-01-28 07:26:57'),
(41, 'satya', 'brdriac', 'shinichisatya19@gmail.com', '$2y$10$cKeRgJqs6EVcfLMSRoQVVuDL214lxVFK8M2Y5luCczU3xuIeLDxYm', NULL, '509db0e95d5b2db2bf19bc936a0c2b153c9380f7', '679972', 547, 50000, NULL, 'user', 'active', '2023-01-28 13:08:49', '2023-01-28 14:02:38'),
(42, 'Rinaldo Abdi Pratama', 'kingaldo', 'aurorapremium582@gmail.com', '$2y$10$E5juYE1bqJiD6yeaUZ5zOOqjCDjkQefT0T643d41yQ/7zAAH70d1i', NULL, 'e71fcab38ee2120fd08ebab933c2d2b0e79e5597', '800846', 1831, 28728, NULL, 'user', 'active', '2023-01-28 20:34:47', '2023-01-28 23:24:05'),
(43, 'Gabriel', 'Ananda', 'nafisahbwi812@gmail.com', '$2y$10$RzEzL/pQ8RcZkHZY5KvFEuFxr.6xHYaFGwX7iI4O.0/dVhgvNnSMS', NULL, 'c56a0c3f6618f49e857b5a69d9ba70b4ca306b89', '217668', 0, 0, NULL, 'user', 'active', '2023-01-28 22:43:59', '2023-01-28 22:44:24'),
(44, 'Alfina', 'Safinah', 'alfinasafinah@gmail.com', '$2y$10$M/xUtpc0VS41vnUJiv8WFeHd8sVXscNBlkX9l6IKGQRH4EgUDxJye', NULL, '0f75a604a288260980bef757e4f5d15327f5bebc', '463066', 0, 0, NULL, 'user', 'active', '2023-01-28 22:49:19', '2023-01-28 22:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `token` text NOT NULL,
  `expired_at` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_verifies`
--

INSERT INTO `user_verifies` (`id`, `type`, `email`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES
(3, 'forgot', 'yudhapratama9593@gmail.com', '90683', '2022-12-27 20:00:38', '2022-12-27 10:00:38', '2022-12-27 10:00:38'),
(8, 'email', 'steveninous98@gmail.com', '27312', '2022-12-30 00:25:07', '2022-12-29 14:25:07', '2022-12-29 14:25:07'),
(9, 'email', 'yudhapratama9593@gmail.com', '88290', '2022-12-30 10:31:48', '2022-12-30 00:31:48', '2022-12-30 00:31:48'),
(19, 'email', 'culunb936@gmail.com', '77457', '2022-12-31 02:43:28', '2022-12-30 16:43:28', '2022-12-30 16:43:28'),
(24, 'email', 'naomnami@gmail.com', '19731', '2023-01-06 23:20:39', '2023-01-06 13:20:39', '2023-01-06 13:20:39'),
(31, 'email', 'maghfira147@gmail.com', '47386', '2023-01-24 17:09:16', '2023-01-24 07:09:16', '2023-01-24 07:09:16'),
(32, 'email', 'dailybisnis@gmail.com', '22657', '2023-01-24 17:09:23', '2023-01-24 07:09:23', '2023-01-24 07:09:23'),
(37, 'email', 'baktiibu40@gmail.com', '35926', '2023-01-25 14:08:14', '2023-01-25 04:08:14', '2023-01-25 04:08:14'),
(39, 'email', 'fawwazakbar89@gmail.com', '86926', '2023-01-26 01:02:24', '2023-01-25 15:02:24', '2023-01-25 15:02:24'),
(43, 'email', 'cucu0722@gmail.com', '10230', '2023-01-27 00:00:38', '2023-01-26 14:00:38', '2023-01-26 14:00:38'),
(44, 'email', 'cucu0722y@gmail.com', '45741', '2023-01-27 00:02:09', '2023-01-26 14:02:09', '2023-01-26 14:02:09'),
(54, 'forgot', 'jhonwlkr', 'DzgOtb4pTrh8Aba0Qs9kmo0v44yZtz8un0ZcBU6EDCEryGxepQvtnpuhc1ff', '2023-01-28 23:17:03', '2023-01-28 13:17:03', '2023-01-28 13:17:03'),
(55, 'forgot', 'stevenimous999@gmail.com', 'B0r17UtiC3GT8pPNexb3l4gzhydaOqezVgRlBJ08YahhRePdsD2cIE6WDdHa', '2023-01-28 23:17:22', '2023-01-28 13:17:22', '2023-01-28 13:17:22'),
(56, 'forgot', 'jhonwlkr', 'Nw931ntyKXqVo8fVKMROw0A7JZjL9RgjRG7ZRiOJERUciaAIHoU0m0uqIdlM', '2023-01-28 23:23:47', '2023-01-28 13:23:47', '2023-01-28 13:23:47'),
(57, 'forgot', 'stevenimous999@gmail.com', 'ZbAI0oUueSsYziwGgUQczsu2nrDfhWujF77uqkkanoC7ttqozacwQTjjvZOa', '2023-01-28 23:24:25', '2023-01-28 13:24:25', '2023-01-28 13:24:25'),
(60, 'forgot', 'nafisahbwi812@gmail.com', 'ufM4Nnuz5GIjhXRajoatSPbTjriCAWGc2NOH4pRaCD8CDrIcdMifz7ZLWfZG', '2023-01-29 08:45:49', '2023-01-28 22:45:49', '2023-01-28 22:45:49'),
(61, 'forgot', 'nafisahbwi812@gmail.com', '5EGeotey47QJERl8e486WFdIFY6mEMSKTq3BaLKTUE7GvIcwKV8OIzCFodY9', '2023-01-29 08:47:00', '2023-01-28 22:47:00', '2023-01-28 22:47:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcas`
--
ALTER TABLE `bcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorits`
--
ALTER TABLE `favorits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gopays`
--
ALTER TABLE `gopays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_refills`
--
ALTER TABLE `history_refills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_balances`
--
ALTER TABLE `log_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_masuk`
--
ALTER TABLE `log_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medans`
--
ALTER TABLE `medans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metode_pembayarans`
--
ALTER TABLE `metode_pembayarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ovos`
--
ALTER TABLE `ovos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rate_dollars`
--
ALTER TABLE `rate_dollars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smm`
--
ALTER TABLE `smm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_chats`
--
ALTER TABLE `ticket_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bcas`
--
ALTER TABLE `bcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `gopays`
--
ALTER TABLE `gopays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `history_refills`
--
ALTER TABLE `history_refills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_balances`
--
ALTER TABLE `log_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `log_masuk`
--
ALTER TABLE `log_masuk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `medans`
--
ALTER TABLE `medans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- AUTO_INCREMENT for table `metode_pembayarans`
--
ALTER TABLE `metode_pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ovos`
--
ALTER TABLE `ovos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_dollars`
--
ALTER TABLE `rate_dollars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smm`
--
ALTER TABLE `smm`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=690;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticket_chats`
--
ALTER TABLE `ticket_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
