-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2023 at 01:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_volan`
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

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 'info', 'Nonaktifkan Layanan\n- 2736 YouTube Watch Hours - [ 4 Hour Video ] [ speed 500/ Hour ] [ 30 Days Guaranteed ] [ Non Drop ]\n- 2735 YouTube Watch Hours - [ 3 Hour Video ] [ speed 500/ Hour ] [ 30 Days Guaranteed ] [ Non Drop ]\n- 2127 Youtube Views [ Jam Tayang ] [ Durasi Video 2 jam+ ] [ G60 ] [ cek Deskripsi ]\n- 1978 Youtube Views [ Jam Tayang CLEAR 48 jam ] [ Durasi Video 1 jam+ ] [ cek Deskripsi ]\n- 1977 Youtube Views [ Jam Tayang CLEAR 15 HARI ] [ Durasi Video 1 jam+ ] [ cek Deskripsi ]\n- 2346 Youtube Views S3 [ Jam Tayang ] [ Durasi Video 45 menit+ ] [ G30 ] [ Super Service ] [ BACA Deskripsi ]\n- 2789 Youtube Views S9 [ Jam Tayang ] [ 60 Minutes Video ] [ Lifetime Refill ]] [Source - Youtube Homepage] [ BACA Deskripsi ]\n- 2794 Youtube Views S13 [ Non Drop ] 20K/Day\n\nAktifkan Layanan\n- 1986 TikTok Followers Indonesia BONUS++ Rp 85.000\n- 2040 TikTok Likes Indonesia Rp 46.000', '2022-12-21 11:44:00', '2022-12-25 04:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_default` varchar(50) NOT NULL,
  `second_default` varchar(50) NOT NULL,
  `api_jap` varchar(255) NOT NULL,
  `name_panel` varchar(50) NOT NULL,
  `title_website` text NOT NULL,
  `description_website` text NOT NULL,
  `keyword_website` text NOT NULL,
  `url_logo` varchar(100) NOT NULL,
  `id_medan` varchar(255) NOT NULL,
  `key_medan` varchar(255) NOT NULL,
  `apikey_tripay` varchar(255) NOT NULL,
  `privatekey_tripay` varchar(255) NOT NULL,
  `merchant_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `color_default`, `second_default`, `api_jap`, `name_panel`, `title_website`, `description_website`, `keyword_website`, `url_logo`, `id_medan`, `key_medan`, `apikey_tripay`, `privatekey_tripay`, `merchant_code`, `created_at`, `updated_at`) VALUES
(1, '#248CF3', '#248CF3', 'b0436563771c44e26812fd47c91c6f03', 'VOLAN SMM', 'VOLANS Panel Indonesia Termurah &amp; Terbaik di Indonesia!', 'VOLAN SMM adalah Panel Utama Terbaik di Indonesia. Layanan Termurah, Bergaransi. Dan Terbesar Yang Menyediyakan Berbagai Macam Layanan Platfrom Sosial Media Marketing.', 'VolanSMM, smm indonesia, smm panel indonesia, smm panel termurah, smm panel indonesia termurah, smm panel terbaik, smm panel indonesia terbaik, smm panel terlengkap, panel smm terbaik, smm panel indonesia terlengkap, smm panel terpercaya, smm panel indonesia terpercaya, smm panel termurah di indonesia, smm panel shopee, smm panel tokopedia, followers tokopedia murah, panel instagram, smm panel, followers shopee, followers shopee murah, jasa followers instagram, cara menambah followers instagram, followers instagram gratis, jasa followers tokopedia, jasa followers shopee, jasa followers instagram, panel smm, followers gratis, followers instagram, followers indonesia', '1684416261.webp', '10538', '43b7f6-369b6d-e4a393-a196c3-9ff570', 'PTiriOkI4BDvy60FYlRYeMiCsbiVEuXxigKTVKl9', 'bWeSB-hzmWE-4ZAy8-1f8WA-gL4uS', 'T22323', '2023-05-14 05:38:31', '2023-05-20 07:17:57');

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
  `payment_url` text NOT NULL,
  `expired` datetime NOT NULL,
  `status` enum('pending','canceled','done') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(45, 1, 101, 'SoundCloud', 'SoundCloud Plays [1.5M]', 950, '2023-05-19 08:12:38', '2023-05-19 08:12:38'),
(46, 1, 102, 'SoundCloud', 'SoundCloud Plays [10M]', 1580, '2023-05-19 09:52:55', '2023-05-19 09:52:55');

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

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `trxid` int(15) NOT NULL,
  `provider` varchar(50) NOT NULL,
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

INSERT INTO `histories` (`id`, `user_id`, `trxid`, `provider`, `type`, `layanan`, `target`, `quantity`, `price`, `custom_comments`, `custom_link`, `start_count`, `remains`, `status`, `refill`, `created_at`, `updated_at`) VALUES
(1, 1, 9055926, 'Medan', 'primary', 'Facebook Follower Profile  15 [ murah max 100k ] SLOW', 'adasd', '1000\r', 12100, '', '', '0', '0', 'partial', '0', '2022-12-08 10:06:22', '2023-05-19 04:30:33'),
(2, 1, 647823, 'Medan', 'primary', 'Facebook Follower Profile  15 [ murah max 100k ] SLOW', 'adasd', '1000\r', 12100, '', '', '0', '0', 'pending', '0', '2022-12-08 10:06:22', '2022-12-08 10:06:22'),
(3, 1, 385580, 'Medan', 'primary', 'Facebook Follower Profile  15 [ murah max 100k ] SLOW', 'adasd', '1000', 12100, '', '', '0', '0', 'error', '0', '2022-12-08 10:06:23', '2022-12-13 12:27:21'),
(4, 1, 719327, 'Medan', 'primary', 'Instagram Followers Indonesia Server 2 [REFILL 30 HARI]', 'adasd', '1000\r', 66000, '', '', '0', '0', 'done', '0', '2022-12-08 10:08:58', '2022-12-08 10:08:58'),
(5, 1, 469632, 'Medan', 'primary', 'Instagram Followers Indonesia Server 2 [REFILL 30 HARI]', 'adasd', '1000', 66000, '', '', '0', '0', 'pending', '0', '2022-12-08 10:08:59', '2022-12-08 10:08:59'),
(6, 1, 516985, 'Medan', 'primary', 'Youtube Like  6 [ Best Seller ][ AUTO Refill ]♻️', 'asdadas', '1000', 44000, '', '', '0', '0', 'done', '1', '2022-12-08 10:12:33', '2022-12-13 12:16:20'),
(7, 1, 132132, 'Medan', 'primary', 'Facebook Follower Profile  15 [ murah max 100k ] SLOW', '1845110781', '1000', 12100, '', '', '0', '0', 'done', '0', '2022-12-09 13:40:56', '2022-12-13 12:25:01'),
(8, 1, 132132, 'Medan', 'primary', 'Clubhouse Followers 250 User', '1845110781', '1000', 297000, '', '', '0', '0', 'error', '0', '2022-12-10 01:44:18', '2022-12-13 12:30:02'),
(9, 1, 808742, 'Medan', 'primary', 'Facebook Group Member Server 4 [ 30 Days Refill ] 500-1K/hari', 'asdad', '1212\r', 37996, '', '', '0', '0', 'pending', '0', '2022-12-21 13:15:21', '2022-12-21 13:15:21'),
(10, 1, 9083388, 'Medan', 'primary', 'Telegram Post Views [1 Post] FAST', 'https://t.me/playcheat_official/350', '1000', 10, '', '', '0', '0', 'done', '0', '2023-05-19 02:09:07', '2023-05-19 04:27:17'),
(11, 1, 9083779, 'Medan', 'primary', 'Telegram Post Views ( Instant-5 minute Start, Superfast, Real )', 'https://t.me/playcheat_official/247', '5000', 100, '', '', '0', '0', 'done', '0', '2023-05-19 02:43:12', '2023-05-19 04:27:17'),
(12, 1, 9085084, 'Medan', 'primary', 'Telegram Post Views [90M] [ 1 Post ] TERMURAH DAN SUPERFAST', 'https://t.me/playcheat_official/246', '500', 15, '', '', '0', '0', 'done', '0', '2023-05-19 04:21:03', '2023-05-19 10:22:19'),
(13, 1, 9085085, 'Medan', 'primary', 'Telegram Post Views [90M] [ 1 Post ] TERMURAH DAN SUPERFAST', 'https://t.me/playcheat_official/339', '500', 15, '', '', '0', '0', 'done', '0', '2023-05-19 04:21:04', '2023-05-19 10:22:02'),
(14, 1, 9085086, 'Medan', 'primary', 'Telegram Post Views [90M] [ 1 Post ] TERMURAH DAN SUPERFAST', 'https://t.me/playcheat_official/341 ', ' 500', 15, '', '', '0', '0', 'done', '0', '2023-05-19 04:21:04', '2023-05-19 10:22:11');

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
(9, 1, 'debit', 'deposit', 10158, 12100, 22258, 'Deposit saldo berhasil via Bank BCA Sebesar Rp 10.158', '2023-05-18 13:52:13', '2023-05-18 13:52:13'),
(10, 1, 'debit', 'deposit', 13052, 22258, 35310, 'Deposit saldo berhasil via Bank BCA Sebesar Rp 13.052', '2023-05-18 13:52:38', '2023-05-18 13:52:38'),
(11, 1, 'Kredit', 'order', 10, 35310, 35300, 'Pembelian Telegram Post Views [1 Post] FAST Berhasil', '2023-05-19 02:09:07', '2023-05-19 02:09:07'),
(12, 1, 'Kredit', 'order', 100, 35300, 35200, 'Pembelian Telegram Post Views ( Instant-5 minute Start, Superfast, Real ) Berhasil', '2023-05-19 02:43:12', '2023-05-19 02:43:12');

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
(6, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-14 04:59:18', '2023-05-14 04:59:18'),
(7, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-14 04:59:31', '2023-05-14 04:59:31'),
(8, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-14 05:17:46', '2023-05-14 05:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayarans`
--

CREATE TABLE `metode_pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(50) NOT NULL,
  `process` enum('auto','manual') NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
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

INSERT INTO `metode_pembayarans` (`id`, `provider`, `process`, `code`, `name`, `rate_type`, `rate`, `account_number`, `account_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'private', 'auto', 'Bank', 'BCA', 'percent', 0, '6331218828', 'Muhammad Rizky Putra', 'Bonus', 'active', '2022-12-05 13:26:03', '2023-05-17 13:21:49'),
(2, 'private', 'auto', 'OV', 'OVO', 'fixed', 0, '6331218828', 'Muhammad Rizky Putra', 'Bonus', 'active', '2022-12-05 13:26:03', '2023-05-21 01:49:57');

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
(17, '2023_05_14_123120_create_configs_table', 14);

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
(1, '+6289669001486', '494396d2-b043-43e0-8b0c-1e13bf5deabd', NULL, NULL, 'inactive', '2023-05-20 13:45:19', '2023-05-20 13:45:19');

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
  `id` int(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rate_dollars`
--

INSERT INTO `rate_dollars` (`id`, `rate`, `created_at`, `updated_at`) VALUES
(1, '14844', '2023-05-14 15:48:19', '2023-05-14 15:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `smm`
--

CREATE TABLE `smm` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(50) NOT NULL,
  `service` int(11) DEFAULT NULL,
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
-- Dumping data for table `smm`
--

INSERT INTO `smm` (`id`, `provider`, `service`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(1, 'Medan', 101, 'SoundCloud', 'SoundCloud Plays [1.5M]', 950, 100, 1500000, 'Real\n0-1 Hour Start!\n50K - 100K/Day\nMultiple of 100\nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 6.470 waktu proses 2 jam 4 menit.', '2023-05-14 13:04:45', '2023-05-14 13:04:45'),
(2, 'Medan', 102, 'SoundCloud', 'SoundCloud Plays [10M]', 1580, 20, 10000000, 'Real\n0-1 Hour Start!\n10K - 100K/Day\nMinimum 20', 'primary', '0', NULL, 'jumlah pesan rata rata 5.060 waktu proses 25 menit.', '2023-05-14 13:04:45', '2023-05-14 13:04:45'),
(3, 'Medan', 105, 'SoundCloud', 'Soundcloud - Likes ( S1 ) [ HQ ] ( INSTANT )', 19330, 20, 40000, 'HQ Users, Non Drop. Order Will Be Start Instant.', 'primary', '0', NULL, 'jumlah pesan rata rata 573 waktu proses 7 jam 38 menit.', '2023-05-14 13:04:45', '2023-05-14 13:04:45'),
(4, 'Medan', 108, 'Telegram', 'Telegram Post Views [10K] [Last 5]', 4490, 100, 10000, 'Views Will Be Added To Your Last 5 Posts\nReal\n0-1 Hour Start!\n24 Hours Delivery\nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 130 waktu proses 29 menit.', '2023-05-14 13:04:45', '2023-05-14 13:04:45'),
(5, 'Medan', 115, 'Instagram Story Views', 'Instagram Story Views [20K] [LAST STORY ONLY]', 2050, 20, 20000, 'Views On The Last Story Posted ONLY !\nUsername Only\n0-1 Hour Start!\nUltra Fast!\nMinimum 20', 'primary', '0', NULL, 'jumlah pesan rata rata 1.021 waktu proses 9 menit.', '2023-05-14 13:04:45', '2023-05-14 13:04:45'),
(6, 'Medan', 117, 'Instagram Live Video', 'Instagram Live Video Likes ', 6180, 200, 10000, 'Username Only\nNo Refill / No Refund\nLikes On Live Video\nFast Delivery\nMinimum 200', 'primary', '0', NULL, 'jumlah pesan rata rata 350 waktu proses 1 jam 55 menit.', '2023-05-14 13:04:45', '2023-05-14 13:04:45'),
(7, 'Medan', 118, 'Instagram Live Video', 'Instagram - Live Video Views', 72320, 25, 100000, '[ Username Only ] INSTANT', 'primary', '0', NULL, 'jumlah pesan rata rata 50 waktu proses 1 jam 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(8, 'Medan', 120, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions [10M] [EXPLORE - HOME - LOCATION - PROFILE]', 1280, 100, 20000000, 'Impressions showing from ALL in the statistics (Explore, Home, Location ,Etc..)!\nInstant Start!\nFast Delivery!\nMinimum 100\nMaximum 10M', 'primary', '0', '', 'jumlah pesan rata rata 1.902 waktu proses 8 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(9, 'Medan', 121, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions [1M]', 1540, 100, 1000000, 'Real\nInstant Delivery!\nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 9.072 waktu proses 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(10, 'Medan', 123, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Saves ', 4980, 10, 15000, 'No Refill / No Refund\n0-1 Hour Start!\n15K/Day\nMinimum 10', 'primary', '0', NULL, 'jumlah pesan rata rata 353 waktu proses 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(11, 'Medan', 138, 'Twitter Views & Impressions', 'Twitter Views Server 1 [1M]', 9670, 100, 1000000, 'Refill (30 Days Maximum) \n0-1 Hour Start! \n10K - 100K/Day \nMinimum 100', 'primary', '0', NULL, 'jumlah pesan rata rata 548 waktu proses 3 jam 11 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(12, 'Medan', 141, 'Linkedin', 'Linkedin - Followers AUTO 1', 67090, 100, 1000, 'instan', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 2 hari  13 jam  16   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(13, 'Medan', 143, 'Website Traffic', 'Website Traffic Server 2 [10M]', 430, 100, 10000000, 'Super Cepat', 'primary', '0', '', 'jumlah pesan rata rata 3.320 waktu proses 3 hari  5 jam  26   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(14, 'Medan', 469, 'Telegram', 'Telegram - Channnel Members [ Max 3K]', 12780, 100, 3000, 'Channel Only\n5k/day\nNo Refill\n1-12hrs start\nMin 100, Max 100k', 'primary', '0', '', 'jumlah pesan rata rata 1.580 waktu proses 5 jam 44 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(15, 'Medan', 725, 'Spotify', 'Spotify Followers S1 [1M] min 1000', 5010, 1000, 1000000, 'Start Time: Instant - 6 hours\nSpeed: 20K/ day \nRefill: no', 'primary', '0', NULL, 'jumlah pesan rata rata 1.250 waktu proses 3 hari  4 jam  38   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(16, 'Medan', 726, 'Spotify', 'Spotify Followers S2 [1M] min 20', 42330, 20, 1000000, 'Start Time: Instant - 6 hours\nSpeed: 20K/ day \nRefill: no', 'primary', '0', NULL, 'jumlah pesan rata rata 79 waktu proses 9 jam 27 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(17, 'Medan', 727, 'Spotify', 'Spotify Followers S3 [Super Fast] min 20', 26000, 20, 1000000, '100% High-Quality Account\nNo Drop - Life Time Guarantee\nInstant ( Avg 0-3 hrs ) \n500 to 5000 per 24 hour', 'primary', '0', NULL, 'jumlah pesan rata rata 294 waktu proses 2 jam 20 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(18, 'Medan', 728, 'Spotify', 'Spotify Plays S1', 17830, 1000, 1000000, 'Spotify Plays S1', 'primary', '0', NULL, 'jumlah pesan rata rata 1.562 waktu proses 7 hari  1 jam  9   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(19, 'Medan', 729, 'Spotify', 'Spotify Playlists S1', 2650, 50, 100000, 'Correct format: \nhttps://open.spotify.com/album/2beOdusX0eDgXQ7KdX8IVf\nhttps://open.spotify.com/playlist/4jHJBBSbRZp2SNFeHoJMfA', 'primary', '0', NULL, 'jumlah pesan rata rata 105 waktu proses 4 hari  1 jam  42   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(20, 'Medan', 730, 'Spotify', 'Spotify Playlists S2', 14020, 5000, 1000000, 'Correct format: \nhttps://open.spotify.com/album/2beOdusX0eDgXQ7KdX8IVf\nhttps://open.spotify.com/playlist/4jHJBBSbRZp2SNFeHoJMfA', 'primary', '0', NULL, 'jumlah pesan rata rata 5.000 waktu proses 11 jam 38 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(21, 'Medan', 748, 'Instagram Like Komentar [ top koment ]', 'Like Komen Indonesia BULE ', 37800, 50, 100000, 'HQ/REAL\n0-24hrs \nSuperfast\nSERVICE NOT STABLE', 'custom_link', '0', '', ' Not enough data.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(22, 'Medan', 768, 'YouTube Shorts', 'Youtube Short Views Server 4 [ 50k-100k/day ] [ Lifetime Guarantee ] cheap', 10770, 100, 10000000, 'Start time: 0-3 hours\nJika status selesai tetapi view tidak ter update\nsilahkan klik like', 'primary', '0', '', 'jumlah pesan rata rata 500 waktu proses 10 jam 2 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(23, 'Medan', 771, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes [ S 8 ] [20K] [R30]', 41170, 100, 20000, 'Start Time: Instant - 1 hour\nSpeed: 5K/ day \nRefill: 30 days\nSpecs: Fast', 'primary', '0', '', 'jumlah pesan rata rata 192 waktu proses 1 jam 25 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(24, 'Medan', 915, 'Pinterest', 'Pinterest Board Followers ', 36170, 20, 5000, 'Pinterest Board Followers', 'primary', '0', '', 'jumlah pesan rata rata 105 waktu proses 4 jam 19 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(25, 'Medan', 916, 'Pinterest', 'Pinterest Likes ', 3060, 22, 250000, 'Pinterest Likes', 'primary', '0', NULL, 'jumlah pesan rata rata 67 waktu proses 13 jam 42 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(26, 'Medan', 917, 'Instagram Story Views', 'Instagram Story Views [9K] [1H - Ultra Fast! ]', 2360, 250, 3000, 'NO REFILL\n\njika ada masalah view tidak masuk\nkirimkan bukti ss nya yang ada tanggal dan waktu nya', 'primary', '0', '', 'jumlah pesan rata rata 1.073 waktu proses 26 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(27, 'Medan', 922, 'Instagram Live Video', 'Instagram Live Video Comments Random', 96310, 100, 2000, 'Username Only \nNo Refill / No Refund \nRandom Comments On Live Video \nFast Delivery \nMinimum 50', 'primary', '0', NULL, 'jumlah pesan rata rata 141 waktu proses 5 jam 28 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(28, 'Medan', 1037, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia Views Produk', 2000, 50, 10000, 'Gunakan Link feed produk', 'primary', '0', NULL, 'jumlah pesan rata rata 1.626 waktu proses 11 jam 46 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(29, 'Medan', 1043, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram kunjungan profil / Profile Visit', 890, 100, 100000, 'Profile Visit', 'primary', '0', '', 'jumlah pesan rata rata 3.596 waktu proses 3 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(30, 'Medan', 1047, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia wishlist/ Favorite [ max 2k ]', 8000, 50, 2000, 'gunakan link Produk', 'primary', '0', NULL, 'jumlah pesan rata rata 91 waktu proses 1 hari  15 jam  2   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(31, 'Medan', 1048, 'Shopee/Tokopedia/Bukalapak', 'Shopee Followers [30K] MURAH [BONUS 5%]', 12000, 50, 30000, 'Gunakan username ya bro jangan link!\ninstan\norder 100 dapat 105', 'primary', '0', '', 'jumlah pesan rata rata 1.118 waktu proses 16 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(32, 'Medan', 1124, 'Youtube Views', 'Youtube Ranking Views V10 [ Recommended ][ 0 - 1 Mint Retention]', 14720, 500, 10000000, '[ Lifetime Guarantee Views ]\n- Cheapest In Market\n- Start times : 0 - 1h ( Instant )\n- Non drop - Lifetime Guarantee Views\n- Speed 20k - 30k+ ( Some times will be Faster )\n- Retention : 0-1 Minutes +', 'primary', '0', '', 'jumlah pesan rata rata 2.000 waktu proses 19 jam 34 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(33, 'Medan', 1169, 'Instagram Likes', 'Instagram Likes Server 3 [ Kualitas bagus ] [ Superfast ] ', 17010, 10, 25000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 390 waktu proses 27 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(34, 'Medan', 1173, 'Shopee/Tokopedia/Bukalapak', 'Shopee Likes Indonesia Server new [1500] {produk} ', 3000, 50, 1500, 'bot\ngunakan link\nContoh : https://shopee.co.id/Rok-Midi-A-Line-Lipit-Bahan-Tulle-Warna-Polos-untuk-Wanita-i.29961905.1125996814\njangan pakai smttt\nCONTOH LINK SALAH :\n1. https://shopee.co.id/product/xxxxxx/xxxxxxxx?smtt=0.0.9\n2. https://shopee.co.id/product/xxxxxx/xxxxxxxx/?smtt=0.0.9\nTolong gunakan link yang benar !', 'primary', '0', '', 'jumlah pesan rata rata 760 waktu proses 15 jam 45 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(35, 'Medan', 1208, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Server 2 [REFILL 30 HARI]', 55000, 10, 10000, 'MIX ada akun luar\njika dalam 30 hari drop rate lebih dari 40% itu Bisa refill\nRefill hanya bisa sekali\ndrop di bawah 40% gk bisa di refill', 'primary', '0', '', 'jumlah pesan rata rata 122 waktu proses 16 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(36, 'Medan', 1225, 'Spotify', 'Spotify Plays [ 1M ] Speed : 500 - 3500/D', 9470, 1000, 1000000, '- Start Time: 1 - 12 Hours\n- Speed : 500 - 3500/D\n- Refill : Non Drop - LifeTime Guarantee\n- Best Service in the Market\n- Followers from TIER 1 countries only! USA/CA/EU/AU/NZ/UK.\n- Quality: HQ\n- Min/Max: 1000/1M', 'primary', '0', NULL, 'jumlah pesan rata rata 2.000 waktu proses 3 hari  17 jam  35   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(37, 'Medan', 1231, 'Instagram Like Indonesia', 'Instagram Likes Indonesia Server 3 max 2K [ MAX TERBESAR DAN TERMURAH ] ', 3000, 100, 1000, '24 jam proses\nbisa lebih lama jika antrian panjang\nsemakin besar jumlah yang dipesan semakin cepat diproses\nKualitas Real + BOT HQ\nJANGAN PERNAH DOUBLE ORDER\nHANYA MAX 1K!\nsukses no refund', 'primary', '0', '', 'jumlah pesan rata rata 488 waktu proses 12 jam 4 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(38, 'Medan', 1240, 'TikTok Followers', 'TIK TOK FOLLOWERS S4 [ 30 days refill - Full URL ]⚡️⚡️⚡️', 105690, 10, 15000, 'Complete URL \n30 days refill\nSpeed 2-5k/Day', 'primary', '0', '', 'jumlah pesan rata rata 121 waktu proses 12 jam 59 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(39, 'Medan', 1241, 'TikTok Likes', 'TIK TOK Likes S5 [ 30 days refill - Full URL ] ', 110840, 10, 15000, 'Complete URL \n30 days refill\nSpeed 2-5k/Day', 'primary', '0', NULL, 'jumlah pesan rata rata 62 waktu proses 32 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(40, 'Medan', 1250, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like [ S6 ] [ TERMURAH Instant  ][ R30 ] FAST', 12890, 50, 100000, '- Instant\n- 30 days refill\nStart Time 0-1 hours', 'primary', '0', '', 'jumlah pesan rata rata 161 waktu proses 30 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(41, 'Medan', 1268, 'Youtube Views', 'Youtube Views Server 4 ( No refill ) [Speed: 500K/Day] CHEAP', 6890, 1000, 10000000, '- Start : 0 - 6 jam', 'primary', '0', '', 'jumlah pesan rata rata 1.620 waktu proses 9 jam 25 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(42, 'Medan', 1271, 'Instagram Story Views', 'Instagram - Story Views S3 All Story Views Fast ', 1380, 100, 40000, 'instan\njika ada masalah view tidak masuk\nkirimkan bukti ss nya yang ada tanggal dan waktu nya', 'primary', '0', '', 'jumlah pesan rata rata 760 waktu proses 8 jam 45 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(43, 'Medan', 1303, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia Feeds Comment', 350000, 5, 2000, '-', 'custom_comments', '0', '', 'jumlah pesan rata rata 21 waktu proses 2 hari  7 jam  33   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(44, 'Medan', 1338, 'Shopee/Tokopedia/Bukalapak', 'Shopee Followers Server 2 NEW [2500] NODROP ', 9000, 100, 2500, 'instan', 'primary', '0', '', 'jumlah pesan rata rata 711 waktu proses 15 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(45, 'Medan', 1342, 'TikTok Followers', 'TIK TOK FOLLOWERS S5 [ 30 days refill - Full URL ]  ⚡️⚡️⚡️', 74000, 10, 30000, '- Speed 5000 per day\n- Avatars Followers and Likes\n- 30 days warranty\n- instant start to 5 minute start Time\n( Contoh Target yang kamu masukin https://www.tiktok.com/@username )', 'primary', '0', '', 'jumlah pesan rata rata 470 waktu proses 1 hari  7 jam  52   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(46, 'Medan', 1343, 'TikTok Likes', 'TIK TOK Likes S6 [ 30 days refill - Full URL ] ', 76040, 9, 30000, '- Speed 5000 per day\n- Avatars Followers and Likes\n- 30 days warranty\n- instant start to 5 minute start Time', 'primary', '0', NULL, 'jumlah pesan rata rata 28 waktu proses 33 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(47, 'Medan', 1421, 'Instagram Likes', ' Instagram Likes  2 [No Drop] Real [Max 5K]', 5110, 20, 5000, 'Speed : 200 Likes / Hour\nNo Partial Issues\nNo Drop', 'primary', '0', '', 'jumlah pesan rata rata 111 waktu proses 7 jam 53 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(48, 'Medan', 1422, 'Instagram Likes', 'Instagram Likes  3 [ 10k ] [ Instant - Start ]', 22050, 20, 5000, 'Start time:\nFor orders under 1000 likes usually instant. If more than 1000 - may take some time, usually few hours\nSpeed is up to 100-200 per hour (can lower a bit when many orders)\nNo cancellation before 24 hours', 'primary', '0', NULL, 'jumlah pesan rata rata 434 waktu proses 3 jam 2 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(49, 'Medan', 1430, 'Youtube Views', 'Youtube Ranking Desktop Views  2 [ Lifetime Guaranteed ]', 15650, 100, 1000000, '0-24 hour start time\n100k to 300k /day speed\nLifetime refill guarantee\n30-40 second watch time\nSafe to run with monetised videos\nWindows desktop watch page\nWorldwide viewers added in a non-stop natural pattern\nMust be unrestricted & open for all countries\nOK for VEVO\nIncremental Speed Based on Order Size\n500 Minimum order\n1 Million Maximum order', 'primary', '0', '', 'jumlah pesan rata rata 662 waktu proses 10 jam 29 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(50, 'Medan', 1443, 'Facebook Followers / Friends', 'Facebook Profile Follower  1 [ No Refill ] beta test ', 72470, 100, 10000, '- Speed 1k/D\n- Start : 0 - 24h\n- hanya untuk followers profil ya bukan fanspage/halaman !\n- No Refill .', 'primary', '0', '', 'jumlah pesan rata rata 122 waktu proses 2 hari  9 jam  42   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(51, 'Medan', 1445, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes 1[ Start Instant ][Recommended]', 52990, 25, 10000, 'Speed 5k per day\nNo refill\nbisa untuk video live', 'primary', '0', '', 'jumlah pesan rata rata 102 waktu proses 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(52, 'Medan', 1453, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  3 [ 30 Days Refill - Max 5K ] [ Speed 100+/D ]', 27600, 50, 10000, '- Start : 0 - 24 hours\n- Min: 50 - Max: 5K\n- Daily speed 50 - 200 ( Speed can slower if server overload, in this care must wait )\n- NON DROP so far - 30 days Refill Guarantee\n\nNOTE :\n- No Refund after order placed\n- No Refill if Old Likes Drop Below Start Count .', 'primary', '0', NULL, 'jumlah pesan rata rata 230 waktu proses 51 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(53, 'Medan', 1454, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  4 [ TERMURAH ][ R30 - 10K ][ 200+/D ]♻️', 36100, 20, 10000, '- Instant\n- Non drop -\n- Guarantee: 30 days refill if any drop\n- Speed 200+/D', 'primary', '1', '30', 'jumlah pesan rata rata 844 waktu proses 11 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(54, 'Medan', 1455, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  5 [ TERMURAH ][ NO REFILL- 10K ][ 10K+/D ]', 45250, 20, 10000, '- Instant Start\n- Speed for now about 10K/D\n- No refill / No refund with any reason .', 'primary', '0', NULL, 'jumlah pesan rata rata 271 waktu proses 3 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(55, 'Medan', 1456, 'SoundCloud', 'Soundcloud  Followers  1 [ High Quality ] ~ Instant ', 1040, 20, 25000, '[ High Quality ] ~ Instant\n', 'primary', '0', NULL, 'jumlah pesan rata rata 330 waktu proses 3 jam 17 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(56, 'Medan', 1459, 'Telegram', 'Telegram Post Views [10K] [Last 1] ', 640, 100, 200000, 'Start Time: Instant - 1 hour\nSpeed: 10K to 20K/ day\nRefill: no\nSpecs: Latest Post\nSend Post Link Or channel id\nExample Link: https://t.me/link_example/994', 'primary', '0', NULL, 'jumlah pesan rata rata 236 waktu proses 8 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(57, 'Medan', 1489, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  5 [ Best Price in Market ][ 30 Days refill ]', 15130, 50, 15000, 'Speed 200-400 Per Day\nRefill: 30 Days\nStart Time 0-2 hours', 'primary', '0', '', 'jumlah pesan rata rata 211 waktu proses 13 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(58, 'Medan', 1500, 'Instagram Followers [ No Refill ]', 'Instagram Followers  31 [ LESS DROP | DROP 10-20% ] ', 27600, 100, 5000, '1k in 1 minutes\n80% real\nKemungkinan drop 10-20% jika anda memesan 1000+\n', 'primary', '0', NULL, 'jumlah pesan rata rata 755 waktu proses 9 jam 25 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(59, 'Medan', 1501, 'Instagram Likes', 'Instagram Likes  9 [ Pakistan+asia+indo ] [ 40K ] ', 9780, 50, 40000, '1k-2k/hour\n', 'primary', '0', NULL, 'jumlah pesan rata rata 158 waktu proses 47 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(60, 'Medan', 1502, 'Telegram', 'Telegram Channnel Members [ Max 10K]  48 Hour NonDrop', 5550, 10, 50000, 'Instant\nSpeed: 1-5K day\nBisa Req Cancelled\nNo guaranteed\n48 Hour NonDrop/kemungkinan besar lewat 48hours drop\nkami tidak ada garansi', 'primary', '0', '', 'jumlah pesan rata rata 1.462 waktu proses 2 jam 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(61, 'Medan', 1518, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  6 [ Best Seller ][ AUTO Refill ]♻️', 34760, 20, 10000, 'Instant\n30 days refill\nSpeed 200+/hari', 'primary', '1', '30', 'jumlah pesan rata rata 170 waktu proses 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(62, 'Medan', 1531, 'Instagram Followers [ No Refill ]', 'Instagram Followers  33 [ NON DROP | BONUS 0-5% ] [ 2k/Day ]⚡️', 114150, 50, 100000, 'waktu proses 0-1jam\nkecepatan 1k-3k/hari\nno drop\nkalo drop kemungkinan besar itu followers yang lain, bukan dari kami\nkalo drop kemungkinan sangat dikit dan no refill', 'primary', '0', NULL, 'jumlah pesan rata rata 81 waktu proses 3 hari  20 jam  1   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(63, 'Medan', 1546, 'TikTok View', 'TIKTOK View S9 [ superfast ] [ Trending + Viral Views]', 1760, 500, 500000, 'Layanan ini berbeda dengan view lain\nkarena layanan ini bisa membuat trending dan viral video', 'primary', '0', '', 'jumlah pesan rata rata 1.206 waktu proses 16 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(64, 'Medan', 1560, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ REAL ][ BETA ]', 50220, 5000, 100000, 'Tampilan Aktif Nyata **\n MULAI INSTAN\n 100% Pemirsa Pengguna YouTube Manusia Nyata!\n Tampilan Halaman Desktop Windows & Mobile Watch\n 100% Lalu Lintas Unik dapat dimonetisasi!\n Pemirsa Seluruh Dunia\n Harus Tidak Terbatas & Terbuka untuk SEMUA negara\n Retensi Acak\n Rata-rata Bersamaan dan waktu tonton berdasarkan konten streaming langsung\n Pengiriman Lebih Dijamin\n penayangan dapat dikirim ke embed video streaming langsung yang dinonaktifkan\n Sumber Lalu Lintas: Iklan Langsung\n\nCATATAN :\n- Layanan Beta - itu berarti layanan yang ditawarkan apa adanya tanpa jaminan isi ulang!\n- Tampilan dapat mencakup keterlibatan pengguna nyata - video Anda mungkin mendapatkan suka / tidak suka setiap hari, komentar, bagikan, pelanggan ,,, semua dibuat oleh pengguna YouTube nyata yang tidak kami kontrol!', 'primary', '0', '', 'jumlah pesan rata rata 5.500 waktu proses 1 hari  8 jam  48   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(65, 'Medan', 1562, 'Twitter Retweets', 'Twitter Retweets Server 1 [ Max 2K ]⚡️⚡️', 30200, 50, 10000, '2k/days\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 88 waktu proses 7 jam 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(66, 'Medan', 1565, 'Instagram Likes', 'Instagram Likes  15 [ NO DROP ] Max terbanyak', 5280, 20, 50000, 'No Drop Likes\n1-3K / Hour', 'primary', '0', NULL, 'jumlah pesan rata rata 323 waktu proses 7 jam 35 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(67, 'Medan', 1584, 'Youtube Views', 'Youtube Views server 10 [ LIFETIME ][ FASTEST IN THE MARKET ]', 19250, 1000, 100000000, 'Speed 1 Million Per Day\nInstant Start\nNON-Drop\nLife Time Guarantee', 'primary', '0', NULL, 'jumlah pesan rata rata 1.100 waktu proses 1 hari  3 jam  21   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(68, 'Medan', 1592, 'TikTok Likes', 'TIK TOK Likes Server 1 [ 30 days refill  ] [ SuperInstant  ] ', 13480, 100, 30000, '25K/Day\nGuarantee : 30 Days', 'primary', '0', '', 'jumlah pesan rata rata 175 waktu proses 1 jam 46 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(69, 'Medan', 1606, 'Likee app', 'Likee App Post Likes [Speed : 1k-2k/day]', 2230, 20, 10000, 'contoh target :https://likee.com/@********/video/*********\nNo refill', 'primary', '0', NULL, 'jumlah pesan rata rata 50 waktu proses 8 jam 6 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(70, 'Medan', 1607, 'Likee app', 'Likee App Followers  [ 500-1k/day ]', 4990, 20, 10000, 'contoh target https://likee.com/@********\nno refill', 'primary', '0', NULL, 'jumlah pesan rata rata 86 waktu proses 9 jam 31 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(71, 'Medan', 1621, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  7 [ No Refill and Cheapest ] ', 12150, 30, 50000, 'Real Youtube Likes\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 47 waktu proses 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(72, 'Medan', 1645, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 7 [ fastest - BOT ] ', 5360, 10, 30000, 'Bot Quality', 'primary', '0', '', 'jumlah pesan rata rata 410 waktu proses 6 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(73, 'Medan', 1651, 'Instagram Likes', 'Instagram Likes  19 [ NON DROP ] [5k-10k Per Day] ', 11260, 100, 300000, 'instan', 'primary', '0', NULL, 'jumlah pesan rata rata 410 waktu proses 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(74, 'Medan', 1666, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S2 [ Refill 30Day ] LessDrop♻️', 32280, 50, 100000, 'kemungkinan drop 5-15% ( tapi gk jami 100% )\nHigh-Quality\n', 'primary', '1', '30', 'jumlah pesan rata rata 405 waktu proses 1 jam 4 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(75, 'Medan', 1667, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S3 [ Refill 30Day ] [ Real Recommended  ]', 13350, 100, 100000, 'sekitar 70%-80% real user\nSpeed 1k Per Day\n', 'primary', '1', '30', 'jumlah pesan rata rata 320 waktu proses 27 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(76, 'Medan', 1672, 'Facebook Followers / Friends', 'Facebook Profile Follower  4 [ R30Day ] [Non Drop]', 55070, 30, 100, 'Refill 30Day\nkami sudah uji selama 2 bulan dan tidak ada penurunan\njadi kami tidak bisa mastikan ini nondrop 100% jika ada update dll', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 10 jam 0 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(77, 'Medan', 1705, 'Youtube Views', 'Youtube Views  1 [ 50k-100k/day ] [ 20 Days Refill ] INSTANT', 31290, 100, 100000000, 'Instant Start\n1-3mins Retention\n50k-100k/day\n20 Days Refill', 'primary', '0', NULL, 'jumlah pesan rata rata 417 waktu proses 2 hari  19 jam  12   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(78, 'Medan', 1716, 'Youtube Views', 'Youtube Views  6 [ 20-50k/days ] [ 30 Days Refil ] ', 25250, 100, 100000000, 'fast', 'primary', '0', NULL, 'jumlah pesan rata rata 480 waktu proses 16 jam 16 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(79, 'Medan', 1717, 'Youtube Views', 'Youtube Views  7 [ Best Service ] [ Life Time Guaranteed ] ', 12810, 1000, 100000000, 'INSTANT START\nGood For Ranking\nLife Time Guaranteed\nFast', 'primary', '0', NULL, 'jumlah pesan rata rata 1.170 waktu proses 22 jam 40 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(80, 'Medan', 1719, 'Instagram Likes', 'Instagram Likes  20 [ Real Account ] [ Best Seller ] ', 4840, 10, 20000, 'No garansi apaun yg terjadi\nKualitas bagus\ntidak drop paling kalo drop sekitar 10% ( kami tidak menjamin ini selamanya karna ig kadang update gk jelas )', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 4 jam 33 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(81, 'Medan', 1722, 'Twitter Indonesia', 'Twitter Followers REAL INDONESIA Fast S2', 365000, 100, 100, 'No garansi\nno kompline\nReal indo\nUSERNAME/AKUN YANG DI SUBMIT TIDAK BISA DI SUBMIT ULANG\nhanya bisa 200 per akun!', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 2 jam 2 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(82, 'Medan', 1723, 'Twitter Indonesia', 'Twitter Retweet REAL INDONESIA Fast', 385000, 10, 100, 'No garansi\nno kompline\nReal indo', 'primary', '0', '', 'jumlah pesan rata rata 31 waktu proses 1 jam 4 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(83, 'Medan', 1724, 'Twitter Indonesia', 'Twitter Favorite/Likes REAL INDONESIA Fast', 182000, 10, 100, 'No garansi\nno kompline\nReal indo', 'primary', '0', '', 'jumlah pesan rata rata 32 waktu proses 35 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(84, 'Medan', 1752, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Indonesia', 29740, 50, 500, 'Instan', 'primary', '0', '', 'jumlah pesan rata rata 57 waktu proses 29 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(85, 'Medan', 1753, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes 5 [ 30 days Refill ] [max 500]', 12300, 50, 500, 'Murah\ngk support live', 'primary', '0', '', 'jumlah pesan rata rata 75 waktu proses 26 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(86, 'Medan', 1760, 'Instagram Like Indonesia', 'Instagram Likes + Reels  Indonesia  7 [ MAX 5K ] [ real aktif ] FAST MURAH [ Refill 14 days ]', 15000, 25, 1000, 'Drop kecil banget\nreal \nRefill 14 days \nhanya bisa 1x refill\nsyaratnya\n- like dibawah start order/jumlah awal gak bisa refill.\n- user private gak bisa refill\n- orderan belum ada 24 jam belum bisa refill\n\nmax db 3000', 'primary', '0', '', 'jumlah pesan rata rata 345 waktu proses 2 jam 24 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(87, 'Medan', 1761, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S8 [ Refill 30D] [ max 5k ] HQ FAST', 13060, 10, 500000, 'DROP KEMUNGKINAN Hanya 10%\nmulai 0-1jam', 'primary', '1', '30', 'jumlah pesan rata rata 854 waktu proses 16 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(88, 'Medan', 1773, 'Instagram TV', 'Instagram TV Like Server 4 [ BOT ] [ HQ ]', 1250, 10, 10000, 'Instant\nno garansi', 'primary', '0', NULL, 'jumlah pesan rata rata 212 waktu proses 45 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(89, 'Medan', 1774, 'Instagram TV', 'Instagram TV Like Server 5 [ Instan ]', 5280, 100, 15000, 'instan', 'primary', '0', '', 'jumlah pesan rata rata 520 waktu proses 26 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(90, 'Medan', 1789, 'Instagram Likes', 'Instagram Likes  26 [ No drop ] Real ', 4590, 100, 15000, 'High Quality\nNo drop, jika drop mungkin hanya 10% buat sekarang', 'primary', '0', NULL, 'jumlah pesan rata rata 330 waktu proses 24 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(91, 'Medan', 1807, 'Instagram Likes', 'Instagram Likes  27 [10K] cheap', 4930, 10, 10000, 'no garansi\nspeed 300/jam\nmulai 0-2 jam', 'primary', '0', NULL, 'jumlah pesan rata rata 208 waktu proses 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(92, 'Medan', 1811, 'Twitter Views & Impressions', 'Twitter Views Server 3 [ FAST - Max 1M ] ', 1120, 100, 10000000, '100k-200k/hour', 'primary', '0', NULL, 'jumlah pesan rata rata 4.087 waktu proses 2 jam 0 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(93, 'Medan', 1816, 'Youtube Subscribers', 'Youtube Subscribe SERVER 3 Best Monetization ', 376050, 10, 2000, '30 Days Refill\nSpeed:200-300/day\nHigh Quality subs - Helps for Monetization Approval\nMax 50k [ Can order 25 times - 2K ]', 'primary', '1', '30', 'jumlah pesan rata rata 139 waktu proses 2 hari  19 jam  7   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(94, 'Medan', 1825, 'Instagram Likes', 'Instagram Likes  29 [ Real ] cheapeast ', 6450, 100, 5000, 'No garansi\nfast', 'primary', '0', NULL, 'jumlah pesan rata rata 632 waktu proses 3 jam 2 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(95, 'Medan', 1832, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Video Custom Comments  1 Cheapest ', 85000, 10, 5000, 'Cheapest\nmulai proses 0-24jam', 'custom_comments', '0', NULL, 'jumlah pesan rata rata 21 waktu proses 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(96, 'Medan', 1833, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S15 [ Refill 99 Days ] ♻️', 25210, 10, 500000, '1K-2K/day', 'primary', '1', '30', 'jumlah pesan rata rata 925 waktu proses 2 jam 23 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(97, 'Medan', 1836, 'Instagram Comments/komentar', 'Instagram 5 Comments random [ dari Akun dengan followers 10k + ]', 29830, 1000, 1000, 'instan\nmendapat 5 komentar', 'primary', '0', NULL, 'jumlah pesan rata rata 1.000 waktu proses 2 jam 39 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(98, 'Medan', 1837, 'Instagram Comments/komentar', 'Instagram Comments Costum [ dari Akun dengan followers 15k + ] ', 2741800, 1, 30, 'Proses slow\nwaktu mulai 0-48jam', 'custom_comments', '0', '', 'jumlah pesan rata rata 3 waktu proses 2 hari  15 jam  48   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(99, 'Medan', 1838, 'Instagram Comments/komentar', 'Instagram Comments Costum [ dari Akun dengan followers 10k + ]', 10778600, 1, 10, 'lebih fast dari id layanan 1837\n', 'custom_comments', '0', '', 'jumlah pesan rata rata 2 waktu proses 3 jam 38 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(100, 'Medan', 1839, 'Instagram Comments/komentar', 'Instagram  Comments Custom [Account Verif/centang biru] ', 24968640, 1, 10, 'lambat\nnon drop', 'custom_comments', '0', '', 'jumlah pesan rata rata 1 waktu proses 2 hari  5 jam  46   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(101, 'Medan', 1840, 'Instagram Comments/komentar', 'Instagram  Comments Random [Account Verif/centang biru]', 19571340, 1, 10, 'lambat\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 1 waktu proses 1 hari  20 jam  14   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(102, 'Medan', 1841, 'Instagram Comments/komentar', 'Instagram 5 Comments random [ dari Akun dengan followers 1juta+ ] ', 51920, 1000, 1000, 'waktu mulai 0-24 jam\ndapat 5 komentar', 'primary', '0', NULL, 'jumlah pesan rata rata 1.000 waktu proses 2 hari  8 jam  6   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(103, 'Medan', 1843, 'Instagram Followers [ No Refill ]', 'Instagram Followers S15 [ LESS DROP ] [ REAL ] ', 4010, 20, 5000, '75% real\nno garansi', 'primary', '0', NULL, 'jumlah pesan rata rata 1.182 waktu proses 8 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(104, 'Medan', 1844, 'Instagram Followers [ No Refill ]', 'Instagram Followers S16 [ 10K ] [ REAL ] ', 14740, 20, 10000, 'START TIME 0-1H\n5K/DAY\nno garansi', 'primary', '0', NULL, 'jumlah pesan rata rata 605 waktu proses 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(105, 'Medan', 1848, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 2 [ No Refill] [ BOT ] ', 2900, 10, 10000, 'INSTANT\nkadang sukses pesanan tidak full masuj\nno kompline', 'primary', '0', '', 'jumlah pesan rata rata 775 waktu proses 11 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(106, 'Medan', 1850, 'Youtube Subscribers', 'Youtube Subscribe SERVER 6 [ 30 days guarantee ] 20/day', 327940, 10, 2000, 'Speed - 20/day\n30 Days guarantee\nrefill only no reffund', 'primary', '1', '30', 'jumlah pesan rata rata 42 waktu proses 4 hari  2 jam  42   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(107, 'Medan', 1851, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S16 [ Refill 30Days ] [ REAL HQ ]', 24760, 10, 20000, 'instan\nwaktu mulai 0-6 jam\n', 'primary', '0', NULL, 'jumlah pesan rata rata 1.191 waktu proses 29 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(108, 'Medan', 1870, 'Twitter Views & Impressions', 'Twitter Views Server 4 [ SUPERFAST - Max 100M ] ', 1260, 100, 100000000, '1Juta/hour', 'primary', '0', NULL, 'jumlah pesan rata rata 1.723 waktu proses 17 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(109, 'Medan', 1876, 'TikTok Likes', 'TIK TOK Likes  2 [ HQ ] [ NON-DROP] ', 44250, 20, 5000, 'NON-DROP & HQ\n1000/hours\nwaktu mulai 0-12 jam', 'primary', '0', NULL, 'jumlah pesan rata rata 375 waktu proses 53 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(110, 'Medan', 1877, 'TikTok  share', 'TIKTOK Share  1 [ Real Share ] INSTANT', 23050, 10, 100000, 'THE CHEAPEST SERVICE\nREAL PROFILE', 'primary', '0', '', 'jumlah pesan rata rata 85 waktu proses 15 jam 22 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(111, 'Medan', 1886, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S18 [ Refill 60Day ] INSTANT ', 29480, 20, 100000, 'High Quality\n1k - 2k Per Day Speed\nLow Drop\n', 'primary', '1', '30', 'jumlah pesan rata rata 703 waktu proses 1 jam 25 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(112, 'Medan', 1889, 'Youtube Subscribers', 'Youtube Subscribe SERVER 7 Real USA', 322060, 5, 1500, '30-50days \nguaranted 30days', 'primary', '0', '', 'jumlah pesan rata rata 27 waktu proses 2 hari  14 jam  3   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(113, 'Medan', 1891, 'Youtube Subscribers', 'Youtube Subscribe SERVER 8 Best Monetization ', 385880, 10, 2000, '30 Days Refill\nSpeed:200-300/day\nHigh Quality subs - Helps for Monetization Approval\nMax 50k [ Can order 25 times - 2K ]', 'primary', '0', '', 'jumlah pesan rata rata 155 waktu proses 3 hari  2 jam  43   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(114, 'Medan', 1892, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S21 [ AUTO refill 30D ][ HQ ]', 8740, 10, 5000, '- High-Quality Instagram followers\n- Followers Unfollow 5%\n- Speed 2k-5k per days', 'primary', '0', '', 'jumlah pesan rata rata 892 waktu proses 1 jam 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(115, 'Medan', 1893, 'Youtube Subscribers [ No Refill ]', 'Youtube Subscribe SERVER 12 [ No Refill ]', 9860, 100, 20000, 'No garansi\nTIDAK ADA KOMPLINAN APAPUN\nMAU TIDAK MASUK ATAU DROP LANGSUNG\nLAYANAN NO GARANSI!', 'primary', '0', '', 'jumlah pesan rata rata 516 waktu proses 7 hari  3 jam  23   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(116, 'Medan', 1896, 'TikTok View', 'TIK TOK View S13 [ WORK AFTER UPDATE ] INSTAN', 680, 100, 1000000, 'Fast\nmin 100', 'primary', '0', '', 'jumlah pesan rata rata 3.901 waktu proses 39 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(117, 'Medan', 1914, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S22 [ AUTO refill 30D ]⭐⭐', 12710, 10, 100000, '30 days guarantee\nauto refill\n1-3k/day', 'primary', '0', NULL, 'jumlah pesan rata rata 511 waktu proses 32 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(118, 'Medan', 1915, 'Instagram Comments/komentar Indonesia', 'Instagram Custom Comments Indonesia Instan 2', 900000, 2, 3000, 'fast', 'custom_comments', '0', '', 'jumlah pesan rata rata 5 waktu proses 1 jam 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(119, 'Medan', 1918, 'Instagram Likes', 'Instagram Likes  31  [ Refill 30D ] INSTANT', 1960, 50, 10000, 'Refill 30D\nSpeed 2k/day', 'primary', '0', '', 'jumlah pesan rata rata 1.517 waktu proses 1 jam 28 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(120, 'Medan', 1920, 'Youtube Subscribers', 'Youtube Subscribe SERVER 10 [ NON DROP ] [30d guaranted]♻️', 203520, 100, 50000, '30d guaranted', 'primary', '0', '', 'jumlah pesan rata rata 122 waktu proses 16 jam 18 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(121, 'Medan', 1923, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Refill S23 [ refill button 180D ]♻️', 7400, 100, 500000, 'proses refill 2-3hari\n', 'primary', '1', '30', 'jumlah pesan rata rata 290 waktu proses 50 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(122, 'Medan', 1927, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S25 [ NON DROP ] real followers ♻️', 24420, 1000, 100000, 'NON-drop\n30 days refill\nKualitas Bagus', 'primary', '1', '30', 'jumlah pesan rata rata 1.670 waktu proses 1 jam 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(123, 'Medan', 1928, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S25 [ AUTO REFILL 30Days ] HQ', 11820, 20, 100000, 'hanya bisa refill jika yg turun dari kami\nAuto Refill\nInstan', 'primary', '0', '', 'jumlah pesan rata rata 912 waktu proses 24 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(124, 'Medan', 1929, 'Youtube Views', 'Youtube Views  24 [ Non Drop ] Lifetime ', 26730, 100, 100000000, '- Instant Start\n- Speed 10k - 20k /day For NOW\n- NON DROP', 'primary', '0', '', 'jumlah pesan rata rata 450 waktu proses 8 jam 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(125, 'Medan', 1933, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S26 [ AUTO REFILL 30Days ] MAX 30k', 11740, 50, 30000, 'Instant\n30 days auto refill\nSpeed 5k/D', 'primary', '0', '', 'jumlah pesan rata rata 1.993 waktu proses 40 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(126, 'Medan', 1942, 'Telegram', 'Telegram Post Views [500K] [Last 1 Post] ', 150, 100, 500000, 'Last 1 Post', 'primary', '0', '', 'jumlah pesan rata rata 310 waktu proses 5 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(127, 'Medan', 1943, 'Telegram', 'Telegram Post Views [500K] [Last 10 Post] ', 1400, 50, 500000, 'Last 10 Post', 'primary', '0', '', 'jumlah pesan rata rata 810 waktu proses 41 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(128, 'Medan', 1953, 'Instagram Likes', 'Instagram Likes  32 cheapeast world [ NO DROP ] FAST', 990, 100, 50000, 'Instant\nno drop\nTapi Jika drop gk ada reffund', 'primary', '0', '', 'jumlah pesan rata rata 407 waktu proses 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(129, 'Medan', 1960, 'Twitter Views & Impressions', 'Twitter Views Server 5 [ Cheap - Max 100k ] ', 490, 100, 150000, 'No REFILL\n100k/hour', 'primary', '0', '', 'jumlah pesan rata rata 9.171 waktu proses 1 jam 22 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(130, 'Medan', 1967, 'Telegram', 'Telegram - Channnel Members/Group Server 4 [ Max 15K] R10Days', 22460, 500, 15000, 'Mulai: 1-30 Menit\nKecepatan: 5000 / hari\nRefill 10Days\nKualitas: Real\nJika Anda Telah Mengubah Tautan Atau Saluran Dihapus Tidak Akan Ada Pembatalan Pesanan', 'primary', '0', '', 'jumlah pesan rata rata 839 waktu proses 8 jam 56 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(131, 'Medan', 1969, 'Youtube Views', 'Youtube Views  25 [ Lifetime ] No Drop [ Best ]', 13260, 500, 10000000, 'working service\n10k-20k/day speed\n100% non-drop', 'primary', '0', '', 'jumlah pesan rata rata 1.012 waktu proses 12 jam 20 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(132, 'Medan', 1970, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 7 [ Real ] [ Fast ] Recomended', 4170, 50, 20000, 'Real\nInstan', 'primary', '0', '', 'jumlah pesan rata rata 933 waktu proses 2 jam 0 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(133, 'Medan', 1972, 'Clubhouse', 'Clubhouse Followers 100 User', 22600, 1000, 1000, 'mulai : 0-6 jam\nKecepatan : 0-12 jam\norder 1000 mendapatkan 100 user', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 21 jam 13 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(134, 'Medan', 1973, 'Clubhouse', 'Clubhouse Followers 250 User', 58690, 1000, 1000, 'mulai : 0-6 jam\nKecepatan : 0-12 jam\norder 1000 mendapatkan 250 user', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 2 jam 45 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(135, 'Medan', 1974, 'Clubhouse', 'Clubhouse Followers 500 User ', 101860, 1000, 1000, 'mulai : 0-6 jam\nKecepatan : 0-12 jam\norder 1000 mendapatkan 500 user', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(136, 'Medan', 1979, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S27 [ REFILL 90Days ] Nodrop♻️', 14190, 100, 500000, 'High quality followers\nDrop Sekitar: 2-3%\nKecepatan 20-30K/day', 'primary', '1', '30', 'jumlah pesan rata rata 936 waktu proses 58 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(137, 'Medan', 1983, 'Shopee/Tokopedia/Bukalapak', 'Tokopedia Feeds likes', 8000, 50, 2000, '1', 'primary', '0', '', 'jumlah pesan rata rata 320 waktu proses 4 hari  8 jam  6   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(138, 'Medan', 1986, 'TikTok INDONESIA', 'TikTok Followers Indonesia BONUS++', 88000, 100, 100, 'indo pasif\nproses 3x24 jam\ndapat bonus jika beruntung\nmax db 200', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 2 hari  19 jam  44   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(139, 'Medan', 1998, 'Instagram Live Video', 'Instagram Live Video Views Likes and Comments also', 207850, 20, 30000, 'refund related issue.\n1286 Instagram Live Video Views - Max 30k - Likes and Comments also 12.00 20 30000 3 hours and 27 minutes Starts within 1-2 mints after ordering\nstart live and then order\nHas random likes and comments\nmin 20 max 20k\nif have problem please share screenshot with time and no. of viewers.\n\nAvg Retention of viewers - 30 to 60 minutes', 'primary', '0', '', 'jumlah pesan rata rata 97 waktu proses 6 jam 5 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(140, 'Medan', 2011, 'Youtube Subscribers', 'Youtube Subscribe SERVER 7 [ 30 days refill ][ 100% real ] ', 367800, 20, 55000, '20+/day\nNO stuck\nNO drop\nStart Time: 0-1hrs', 'primary', '0', '', 'jumlah pesan rata rata 58 waktu proses 1 hari  10 jam  19   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(141, 'Medan', 2013, 'Telegram', 'Telegram - Channnel Members/Group Server 6 [ Max 10K] REAL INDIA ', 23190, 10, 10000, 'Link: Https://T.Me/Username\nStart: 0-360 Min\nSpeed: 5000/D\nRefill: 30 Days\nQuality: INDIAN\nJika Anda Telah Mengubah Tautan Atau Saluran Dihapus Tidak Akan Ada canceled Pesanan', 'primary', '0', '', 'jumlah pesan rata rata 304 waktu proses 31 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(142, 'Medan', 2019, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S29 [ Refill 30 Days ] cheapeast ', 8040, 50, 10000, '- Guarantee: 30 days Refill\n- Instant Start\n- Refill button', 'primary', '1', '30', 'jumlah pesan rata rata 600 waktu proses 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(143, 'Medan', 2021, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 9 [ No Refill ] [ Fast ] BOT ', 2250, 50, 10000, 'waktu mulai 0-6 jam', 'primary', '0', '0', 'jumlah pesan rata rata 1.150 waktu proses 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(144, 'Medan', 2025, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S30 [ Refill 45D ] less - no drop', 9420, 20, 200000, 'fast\nkemungkinan 0-10% drop\nkualitas bagus', 'primary', '0', '', 'jumlah pesan rata rata 785 waktu proses 2 jam 55 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(145, 'Medan', 2026, 'Instagram Reels', 'Instagram Reels Likes S1 [ Max - 20k ] INSTANT', 5200, 20, 20000, 'INSTANT', 'primary', '0', '', 'jumlah pesan rata rata 282 waktu proses 10 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(146, 'Medan', 2027, 'Instagram Reels', 'Instagram Reels Likes S2 [ Max - 10k ] FAST [ Refill 30days ]', 9790, 10, 10000, 'fast\nRefill 30days', 'primary', '0', '', 'jumlah pesan rata rata 368 waktu proses 8 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(147, 'Medan', 2039, 'Instagram Likes', 'Instagram Likes Server 9 [ Real ] [ NO DROP ] ', 1550, 100, 5000, 'No drop ( kemungkinan, drop hanya 10% )\ntetap no garansi', 'primary', '0', '', 'jumlah pesan rata rata 518 waktu proses 20 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(148, 'Medan', 2040, 'TikTok INDONESIA', 'TikTok Likes Indonesia ', 47000, 100, 100, 'Proses max 3x24jam\nMAX DB 200', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 2 hari  19 jam  44   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(149, 'Medan', 2043, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 10 [ No Refill ] [ Fast ] BOT CHEAP', 2160, 10, 10000, 'fast', 'primary', '0', '0', 'jumlah pesan rata rata 806 waktu proses 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(150, 'Medan', 2054, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S31 [ Refill button 10D ] 3k/days ♻️', 4910, 50, 10000, 'HQ\nwaktu mulai 0-24 jam', 'primary', '0', '0', 'jumlah pesan rata rata 446 waktu proses 15 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(151, 'Medan', 2055, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S32 [ Refill 99days ] FAST HQ', 9810, 20, 200000, 'Drop sekitar 0-10%\nkualitas bagus\nNON DROP\nrefill 99 days', 'primary', '0', '', 'jumlah pesan rata rata 753 waktu proses 2 jam 29 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(152, 'Medan', 2056, 'Twitter Followers', 'Twitter Followers Server 10 [ No refill ] ', 103380, 50, 1000, '- Start 0-1 hour\n- Speed up to 400 / day (The average speed per day is 50-400!)', 'primary', '0', '', 'jumlah pesan rata rata 62 waktu proses 5 jam 19 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(153, 'Medan', 2075, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 11 [ No Refill ] [ mix real ] ', 4640, 20, 10000, 'drop kemungkinan 10-20% untuk saat ini\nprofil ada story nya', 'primary', '0', '', 'jumlah pesan rata rata 1.241 waktu proses 4 jam 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(154, 'Medan', 2076, 'YouTube Shorts', 'Youtube Short Likes Server 1 [ refill 30 days ]', 24750, 10, 100000, 'fast\nno drop\ngaransi refill 30 days', 'primary', '1', '30', 'jumlah pesan rata rata 300 waktu proses 2 jam 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(155, 'Medan', 2080, 'Youtube Views', 'Youtube Views Spesial [ 60days Guaranted ] BONUS Likes', 11750, 100, 5000000, 'Instant start\nwaktu mulai 0-6jam\nkecepatan 7k-15k/days', 'primary', '0', '', 'jumlah pesan rata rata 684 waktu proses 9 jam 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(156, 'Medan', 2081, 'Youtube View  [ untuk monetisasi - penghasil duit ]', 'Youtube views untuk penambah Adsense 1 ( 2 - 4$ )', 44660, 100, 10000, '- Durasi Video : Harus 5 menit+\n- Pendapatan bergantung pada berbagai faktor seperti kata kunci, panjang, topik, dan lokasi, dll.\n- Kami Tidak Menjamin Berapa Banyak Pendapatan yang Akan Anda Dapatkan? (tetapi $ 2 - 4 diperkirakan untuk 1000 view)\n- Garansi: kami hanya akan isi ulang view bukan pendapatan anda!\ngaransi 30 hari\n\nNOTE: kami tidak menjamin untuk pendapatan akan dapat terus, Kami hanya menggaransikan view\nlebih baik untuk mencoba pesan 100 saja dlu untuk mencobanya', 'primary', '0', '', 'jumlah pesan rata rata 145 waktu proses 23 jam 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46');
INSERT INTO `smm` (`id`, `provider`, `service`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(157, 'Medan', 2083, 'Youtube Subscribers', 'Youtube Subscribe VIP 2 [ 30Days refill ][ REAL ] 500/days NON DROP ', 412740, 100, 100000, '- Guarantee: 30 days\n- Speed : 500 - 2000+/D\n- 100 % real user\n- Almost NON DROP\n- jumlah subs harus di publik!\n- Use channel link or video link to order .\n- Channel harus mempunyai minimal 1 video', 'primary', '0', '', 'jumlah pesan rata rata 173 waktu proses 7 jam 1 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(158, 'Medan', 2087, 'TikTok View', 'TIKTOK View Server 7  [ supercheap ] [ INSTANT ] BONUS++', 40, 100, 300000000, 'no refill\nsuperfast\norder 1000 biasanya bisa dapat 1500-2000 view ( tapi kalo gk ada bonus no kompline )\njika pesanan lagi banyak, bisa lambat', 'primary', '0', '', 'jumlah pesan rata rata 2.630 waktu proses 9 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(159, 'Medan', 2088, 'Youtube Subscribers', 'Youtube Subscribe VIP 3 [ 30Days autorefill ][ REAL ] BEST SELLER', 419740, 10, 50000, 'No stuck\nReal Subs\nBig orders more speed\n30D refill---- 2-3% drop auto refill in every 24hrs', 'primary', '0', '', 'jumlah pesan rata rata 51 waktu proses 1 hari  3 jam  7   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(160, 'Medan', 2094, 'YouTube Shorts', 'Youtube Short Views Server 2 [No refill ] ', 11230, 100, 100000000, 'Instant Start\n5k-20k/day\nNo Refill\nNo kompline', 'primary', '0', '', 'jumlah pesan rata rata 2.382 waktu proses 1 jam 36 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(161, 'Medan', 2095, 'YouTube Shorts', 'Youtube Short Likes Server 2 [ refill 30 days ] cheap', 18060, 10, 100000, 'Instant Start\n30 Days Refill\nSuperfast\n20k-40k per day!', 'primary', '1', '30', 'jumlah pesan rata rata 354 waktu proses 1 jam 2 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(162, 'Medan', 2096, 'YouTube Shorts', 'Youtube Short Likes Server 3 [ no refill ] cheap ', 12210, 20, 50000, 'Instant Start\nSuperfast\nNo Refill\n10k-20k per day!', 'primary', '0', '', 'jumlah pesan rata rata 340 waktu proses 18 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(163, 'Medan', 2097, 'YouTube Shorts', 'Youtube Short Likes Server 4 [ Life Time Guaranteed ] cheap ', 34670, 20, 200000, 'FAST', 'primary', '1', '30', 'jumlah pesan rata rata 323 waktu proses 58 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(164, 'Medan', 2103, 'Instagram Likes', 'Instagram Likes Server 10 [ mix ] [ Superfast, 30 days refill ]', 860, 50, 15000, '30 days refill', 'primary', '1', '30', 'jumlah pesan rata rata 1.022 waktu proses 35 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(165, 'Medan', 2105, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Min 1k - unlimited ] cheap ', 1100, 1000, 10000000, 'Waktu mulai = Instan - 5 menit\njika Anda pesan 1000, Anda akan mendapatkan 1000 view dalam kelipatan 200-300 [ Live mungkin akan mendapatkan 200-300 like, dan menyelesaikan 1000 view]\n\nTidak ada reffund, tidak ada kompline\norder = berani naggung resiko', 'primary', '0', '', 'jumlah pesan rata rata 1.200 waktu proses 2 hari  3 jam  19   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(166, 'Medan', 2108, 'Youtube Views', 'Youtube Views Server 5 [ 10K/Day ]  Lifetime Guarantee  [ Recommended#1]', 12720, 100, 10000000, 'Lifetime Guarantee\n5-10k/day', 'primary', '0', '', 'jumlah pesan rata rata 210 waktu proses 8 jam 29 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(167, 'Medan', 2109, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 30 min]', 239150, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot \nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 1 jam 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(168, 'Medan', 2110, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 60 min]', 359590, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot \nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 110 waktu proses 1 jam 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(169, 'Medan', 2111, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 90 min]', 461070, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot \nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 2 jam 30 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(170, 'Medan', 2112, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 120 min] ', 622400, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot \nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 1 jam 22 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(171, 'Medan', 2113, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 180 min] ', 702510, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot \nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 190 waktu proses 3 jam 11 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(172, 'Medan', 2115, 'Tiktok Live Streams', 'TikTok Livestream Views [Start Time: INSTANT] [Stay: 15 min] ', 340, 100, 5000, 'Start : 0-5 min\nJika Anda memesan 1000, rata-rata 60-100 View bersamaan akan bertahan selama 15menit\nFormat tautan:\nUsername\n\nLAYANAN NO GARANSI APAPUN ITU', 'primary', '0', '', 'jumlah pesan rata rata 740 waktu proses 19 jam 5 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(173, 'Medan', 2116, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 13 [ cheap ] ', 2040, 10, 15000, 'INSTANT START\nBOT PROFILE\nBIG DROPS\nNO REFILL', 'primary', '0', '', 'jumlah pesan rata rata 263 waktu proses 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(174, 'Medan', 2121, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 24jam', 54440, 1000, 3000, '- Order 1000 views kamu dapat 100 - 300 live views stay di live mu 24jam\n- Order 2000 views kamu dapat 200 - 600 live views stay di live mu 24jam\n- Order 3000 views kamu dapat 300 - 900 live views stay di live mu 24jam\n\nCatatan :\n- Harap teruskan siaran langsungmu, Jangan segera mengakhiri siaran langsung. Jika video dihapus atau segera berakhir maka kami tidak dapat reffund/cancel.\n- Setelah order, tidak ada reffund.\n- tidak bisa cancel apapun itu alasannya\n- tidak ada refund apapun itu alasannya\norder = ambil resiko', 'primary', '0', '', 'jumlah pesan rata rata 1.100 waktu proses 6 hari  9 jam  59   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(175, 'Medan', 2122, 'Facebook Followers / Friends', 'Facebook Follower Profile indonesia  8 [ max 50 ] ', 53700, 50, 50, 'waktu proses 0-7 jam', 'primary', '0', '', 'jumlah pesan rata rata 50 waktu proses 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(176, 'Medan', 2123, 'Facebook Followers / Friends', 'Facebook Follower Profile  9 [ real ] [ Refill 30 Days ]', 32250, 1000, 100000, 'waktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 2.200 waktu proses 1 hari  17 jam  14   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(177, 'Medan', 2135, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S12 [ REAL AKTIF ][ 2K ] Refill 7 days ', 40000, 100, 1000, 'proses 1x24 jam\nreal aktif\n\nRefill 7 days \nhanya bisa 2x refill tapi ada cooldown 2 hari\nsyaratnya\n- foll dibawah start order/jumlah awal gak bisa refill.\n- user private gak bisa refill\n- orderan belum ada 24 jam belum bisa refill', 'primary', '0', '', 'jumlah pesan rata rata 130 waktu proses 23 jam 17 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(178, 'Medan', 2142, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S35 [ refill 7days ]  cheap ', 4400, 10, 30000, 'Instant start\ntidak ada reffund\nhanya refill jika drop\njangan berharap lebih sama layanan murah', 'primary', '0', '', 'jumlah pesan rata rata 1.790 waktu proses 11 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(179, 'Medan', 2143, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S36 [ refill 30days ] [ cheap & less drop ] ♻️', 9410, 50, 200000, '0-10% drop\nReal Mixed\nSpeed 10Kday', 'primary', '1', '30', 'jumlah pesan rata rata 312 waktu proses 25 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(180, 'Medan', 2153, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 16 [ NEW ] [ no refill ] ', 3780, 100, 10000, 'waktu proses 0-12 jam\n', 'primary', '0', '', 'jumlah pesan rata rata 613 waktu proses 49 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(181, 'Medan', 2155, 'Instagram VERIFIED ', 'Instagram  Followers [1 Follower] VERIFIED/CENTANG BIRU', 14680, 1000, 1000, 'mendapatkan 1 followers yang verified/centang biru\nproses bisa 3-7 hari\nbahkan mungkin bisa sebulan\ntolong bersabar', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 17 hari  2 jam  17   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(182, 'Medan', 2156, 'Instagram VERIFIED ', 'Instagram Followers [2 Follower] VERIFIED/CENTANG BIRU ', 27880, 1000, 1000, 'mendapatkan 2 followers yang verified/centang biru\nproses bisa 3-7 hari\nbahkan mungkin bisa sebulan\ntolong bersabar', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 9 hari  1 jam  24   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(183, 'Medan', 2157, 'Instagram VERIFIED ', 'Instagram Likes VERIFIED/CENTANG BIRU DONE 24 JAM', 12721000, 1, 13, 'Jika tidak selesai dalam 1-3 hari\nlangsung bikin tiket', 'primary', '0', '', 'jumlah pesan rata rata 1 waktu proses 17 jam 8 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(184, 'Medan', 2158, 'Instagram VERIFIED ', 'Instagram Comments [CUSTOM] VERIFIED/CENTANG BIRU DONE 24 JAM', 21511000, 1, 13, 'jika dalam seminggu belum masuk\nsilahkan ke tiket', 'custom_comments', '0', '', 'jumlah pesan rata rata 1 waktu proses 1 hari  7 jam  16   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(185, 'Medan', 2160, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 17 [ NEW ] [ no refill BOT ] ', 2100, 100, 10000, 'NO Refill', 'primary', '0', '', 'jumlah pesan rata rata 800 waktu proses 4 jam 19 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(186, 'Medan', 2161, 'Instagram Followers [guaranteed]', 'Instagram Followers Refill S37 [ refill 30days ] [ cheap ] ', 7290, 10, 50000, '0 - 10 mins', 'primary', '0', '', 'jumlah pesan rata rata 2.000 waktu proses 1 jam 18 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(187, 'Medan', 2169, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  10 Cheapest [ No refill ] ', 14410, 50, 50000, 'Best Price\nNO REFILL\nno garansi', 'primary', '0', '', 'jumlah pesan rata rata 147 waktu proses 52 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(188, 'Medan', 2170, 'Instagram Views', 'instagram view UPDATE 1 [ Bisa untuk REEL/IGTV/VIDEO ]', 510, 100, 5000000, 'Emergency\n50k/hour', 'primary', '0', '', 'jumlah pesan rata rata 538 waktu proses 1 jam 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(189, 'Medan', 2174, 'Youtube Views', 'Youtube Views JUMBO 1 [ 30 days  AUTO REFILL ] FAST 250k/day BONUS LIKE+++', 16110, 15000, 10000000, 'Layanan super cepat\nSebagian besar DISARANKAN dan EKSTERNAL\nDrop: jika drop dari view berlebih tidak ada refill\n\nTIDAK ADA PENGEMBALIAN DANA ATAU ISI ULANG UNTUK JUMLAH PENGIRIMAN TAMBAHAN', 'primary', '0', '', 'jumlah pesan rata rata 30.025 waktu proses 8 hari  3 jam  13   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(190, 'Medan', 2176, 'Youtube Subscribers [ No Refill ]', 'Youtube Subscribe SERVER 13 [ NO refill ]', 770, 100, 10000, 'TIDAK ADA KOMPLINE SAMA SEKALI\ndalam kasus apapun\nORDER = BERANI AMBIL RESIKO\nInstant - 1 hours\n1k-10k/day\nbisa drop dalam hitungan jam', 'primary', '0', '', 'jumlah pesan rata rata 301 waktu proses 3 hari  18 jam  54   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(191, 'Medan', 2185, 'Instagram Views', 'instagram view UPDATE 3 [ WORKS ON REEL AND IGTV ] DARURAT Cheap ', 690, 50, 100000000, '0-1H\nREAL\n100M', 'primary', '0', '', 'jumlah pesan rata rata 810 waktu proses 1 jam 7 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(192, 'Medan', 2186, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube View Premiere Waiting Server 1 [ cek note ]', 34170, 1000, 1000000, '0-5 Minutes Starting time\n250-300 Viewers per 1000 Order\nNo Refill\nWatchtime - 30 minute to 90 Minute', 'primary', '0', '', 'jumlah pesan rata rata 1.650 waktu proses 1 jam 45 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(193, 'Medan', 2188, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube View Premiere Waiting Server 3 [ cek note ] Automated Passive Views', 18550, 5000, 5000, '- Automated Passive Views - Pre-Premiere Waiting Viewers\n- You will get 5000 Unique Automated Passive Waiting Pre-Premiere Viewers that will stay and wait for 1 Hour!\n- INSTANT Start\n- Windows Desktop & Mobile Watch Page Waiting Viewers\n- World-Wide Viewers\n- Avg Concurrent waiting on Pre-Premiere content 500-1000+ waiting viewers\n- Great for Ranking!\n- Video Must be Unrestricted & Open for ALL countries\n\nNOTE : Service offered as-is with no refill/refund guarantee!\n** note that the Pre-Premiere Waiting viewers will NOT turn into viewers if the premiere/live broadcast will start during the campaign time-frame. (those waiting viewers will not be registered as Livestream viewers or as YouTube views or anywhere on the YouTube studio analytics!)', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(194, 'Medan', 2193, 'Twitter Followers', 'Twitter Followers Server 12 [ 30 days refill ] USA', 152370, 20, 10000, 'Start Time: 1 Hour\nREAL\nusername', 'primary', '0', '', 'jumlah pesan rata rata 33 waktu proses 3 jam 42 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(195, 'Medan', 2196, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 18 [ no refill BOT ] INSTANT', 1190, 10, 1000, 'Tidak ada kompline apapun\nINSTANT START\nBOT PROFILE\nBIG DROPS\nNO REFILL', 'primary', '0', '', 'jumlah pesan rata rata 714 waktu proses 13 jam 45 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(196, 'Medan', 2202, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 30 menit', 2650, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 30 mins\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 2.060 waktu proses 14 jam 34 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(197, 'Medan', 2203, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 60 menit', 3820, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 60 mins\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 1.100 waktu proses 1 hari  14 jam  43   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(198, 'Medan', 2204, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 120 menit ', 7630, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 120 mins\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 950 waktu proses 1 hari  14 jam  7   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(199, 'Medan', 2205, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 12 jam', 17900, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 12h\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 1.108 waktu proses 1 hari  7 jam  3   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(200, 'Medan', 2206, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 24jam nonstop', 22100, 500, 3000, 'order = berani ambil resiko\ntidak ada alasan reffund apapun itu\ntidak bisa canceled\njangan order jika tidak mau jadi hal tidak dinginkan!\n- Start time : 0 - 10 mins\n- Traffic source : Almost suggested views\n- 10% viewers will stay and stay in 24h\n- Natural , real .', 'primary', '0', '', 'jumlah pesan rata rata 1.050 waktu proses 1 hari  23 jam  32   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(201, 'Medan', 2211, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S38 [ refill 99 hari ] [ Best seller ] ', 10060, 10, 1000000, 'Garansi 99 hari\nhanya refill kalo yg drop dari layanan kami\nrefill habis jika layanan tidak tersedia lagi', 'primary', '0', '', 'jumlah pesan rata rata 741 waktu proses 1 jam 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(202, 'Medan', 2216, 'Instagram Views', 'instagram view  21 [Works For Reel] CHEAPEST FAST', 90, 100, 1000000000, 'FAST\nCHEAPEST', 'primary', '0', '', 'jumlah pesan rata rata 6.241 waktu proses 59 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(203, 'Medan', 2218, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Refill S39 [ refill 365days ] FAST♻️', 4200, 50, 1000000, 'Start: 0-1Hrs\nSpeed: 2k-5k/days\nRefill: 365 days', 'primary', '0', '', 'jumlah pesan rata rata 805 waktu proses 18 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(204, 'Medan', 2219, 'Instagram Likes', 'Instagram Likes Server 12 [ LESSDROP ] [ HQ Refill 45days ] ♻️', 1460, 10, 50000, 'Fast\nkualitas bagus\nStart: 0-1 jam', 'primary', '1', '30', 'jumlah pesan rata rata 896 waktu proses 20 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(205, 'Medan', 2221, 'Twitter Followers', 'Twitter Followers Server 13 [ 30 days refill ] FAST⚡️⚡️', 90830, 10, 200000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 246 waktu proses 10 jam 36 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(206, 'Medan', 2226, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S15 [ 5K ] BONUS++', 11000, 200, 10000, 'jika dapat bonus alhamdulillah\njika tidak jangan kompline\nproses 3-7 hari\nBOT INDO', 'primary', '0', '', 'jumlah pesan rata rata 460 waktu proses 2 hari  14 jam  23   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(207, 'Medan', 2227, 'Instagram Like Indonesia', 'Instagram Likes Indonesia  10 [ MAX 1K ] BONUS++ [ NOT SUPPORT REEL ]', 3200, 100, 4000, 'jika dapat bonus alhamdulillah\njika tidak jangan kompline\nproses 1-24 jam\njika blm 24 jam jangan kompline\nBOT INDO\n\ntidak bisa untuk reels', 'primary', '0', '', 'jumlah pesan rata rata 380 waktu proses 17 jam 42 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(208, 'Medan', 2232, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 2 [ Refill 30days ] [ Real ]', 8840, 10, 50000, 'kami garansi 30 hari\n\nmulai: 0-1jam\nFastest\nHigh Quality', 'primary', '1', '30', 'jumlah pesan rata rata 459 waktu proses 38 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(209, 'Medan', 2235, 'Youtube Subscribers', 'Youtube Subscribe VIP 7 [ 30Days refill ] [NO DROP] ', 448290, 100, 5000, 'order 1000 subs kemungkinan siap dalam 9-12 hari\n- Waktu mulai: 0 - 1jam \n- refill: 30 hari\n- 100% pengguna nyata\n- Hampir NON DROP\n\nJika jumlah subs disembunyikan Anda tidak akan mendapatkan jumlah awal\ndan jika tidak masuk subs kami tidak bertanggung jawab\nGunakan tautan saluran atau video ( KEDUANYA DITERIMA)\n', 'primary', '0', '', 'jumlah pesan rata rata 322 waktu proses 1 hari  17 jam  12   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(210, 'Medan', 2236, 'Youtube Subscribers', 'Youtube Subscribe VIP 8 [ 30Days refill ] [NO DROP] Speed 30+-/D', 178610, 20, 6000, '- Start time : 0 - 2h\n- Speed : 30+ / day\n- NON DROP\n- Guarantee: 30 days\n- Min 100 - Max 6k\n- Good subs.', 'primary', '0', '', 'jumlah pesan rata rata 106 waktu proses 12 jam 15 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(211, 'Medan', 2237, 'Youtube Subscribers', 'Youtube Subscribe SERVER 16  [ Refill 30days ] [ FAST ] ', 112490, 50, 5000, '1000 Subscriber /day\n30 days Guarantee\ndrop - 10-70%\nGampang drop!\nNo Refund, Only Refill', 'primary', '0', '', 'jumlah pesan rata rata 122 waktu proses 11 hari  2 jam  47   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(212, 'Medan', 2239, '- PROMO - ON OFF', 'Telegram Post Views ( 1 post ) GRATIS', 0, 100, 500, 'Layanan gratis', 'primary', '0', '', 'jumlah pesan rata rata 478 waktu proses 32 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(213, 'Medan', 2245, 'Facebook Video Views', 'Facebook Video Views Server 3 [ Monetization ] [  PAKET 600k menit ]', 17000, 10000, 10000, '- Start time: 0-24 H ( it Might need 0-72 Hours if there are Update or Overload )\n- Speed 50k-100k hours per day ( this speed is approximate and it may change depending on overload and updates )\n- Video must be at least +2Hours ( you can use an old live video posted on your timeline )\n- Monitizable Views\n- Example Order Format: https://www.facebook.com/user/videos/ID\n\nImportant Requirement: Go to the page: \" https://business.facebook.com/creatorstudio/?tab=monetization_home&collection_id=free_form_collection \", press Ctrl + U and search ( Ctrl + f ) for the keyword \"EAAciLZ\", copy the entire token here', 'primary', '0', '', 'jumlah pesan rata rata 7.750 waktu proses 4 hari  2 jam  22   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(214, 'Medan', 2246, 'Facebook Video Views', 'Facebook Video Views Server 4 [ No Refill ]  [Speed: 100K/Day]', 64180, 5000, 10000000, 'tidak ada garansi\nStart Time: Instant\nSpeed: Up to 100K/ day\nRefill: No refill / No refund\nSpecs: High Quality - 2 to 30 Minutes Video Watch Time !', 'primary', '0', '', 'jumlah pesan rata rata 5.000 waktu proses 1 hari  7 jam  54   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(215, 'Medan', 2250, 'Twitter Favorites/Like', 'Twitter Likes  1 [ No Refill ] Max 5K ', 18940, 10, 5000, 'No Refill\nSped - 5k/day', 'primary', '0', '', 'jumlah pesan rata rata 146 waktu proses 27 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(216, 'Medan', 2251, 'Twitter Favorites/Like', 'Twitter Likes  2 [ 30days Refill ] Max 5K USA', 25540, 20, 5000, 'slow', 'primary', '0', '', 'jumlah pesan rata rata 194 waktu proses 5 jam 15 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(217, 'Medan', 2252, 'Twitter Favorites/Like', 'Twitter Likes  3 [ NO Refill ] FAST [HQ]', 17320, 10, 2500, 'selesai 1000\nkemungkinan tidak sampai 6 jam an\ntetap tunggu 1x24 jam', 'primary', '0', '', 'jumlah pesan rata rata 163 waktu proses 3 jam 4 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(218, 'Medan', 2254, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 3 less Drop [ Refill 30days ] ', 5770, 10, 50000, 'Accounts with Avatars and Posts.\nAuto-Refill up to 100% within a month. |\nCancel Button Enable\n\nCurrent speed: 26,890 per hour.\nDrop Ratio is: ~14%\n\nMost Affordable Price in Market\nOur Aim is to Give Best Quality to Our ALL Customer in Lowest Rate', 'primary', '0', '', 'jumlah pesan rata rata 680 waktu proses 27 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(219, 'Medan', 2264, 'Youtube View Target Negara', 'Youtube GEO views No Refill [ Indonesia ] ', 16010, 1000, 5000000, 'NO KOMPLINE\nkualitas : Normal \nwaktu mulai : 0 - 24 jam\nSpeed: Instant\nRetention: 15s Up To +50 detik\nRefill: No Refill / Dapat Mengalami Penurunan Besar\nGood untuk Youtube Algorithm\nHigh Retention Rate', 'primary', '0', '', 'jumlah pesan rata rata 2.002 waktu proses 9 jam 44 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(220, 'Medan', 2275, 'Youtube Subscribers', 'Youtube Subscribe SERVER 17 [ Lifetime Guarantee ] 15-25/day', 322830, 10, 30000, 'Instan\nCatatan - Kecepatan tinggi jika Anda memesan pelanggan dalam jumlah besar. Akun kecil atau hingga 500 pelanggan mungkin memerlukan waktu maksimal 24 jam untuk dikirimkan.\nTidak seperti jika kecepatan yang disebutkan adalah 1k/hari kecepatan per jam akan menjadi sekitar 50 , tetapi kecepatan akan dibagi rata pada semua pesanan tetapi untuk pesanan besar akan didedikasikan dan diselesaikan dengan cepat.\nPengguna Nyata\nLifetime Guarantee\nless Drop [20-30%]\n\nHarap Dicatat Saat ini pelanggan youtube tidak berfungsi seperti yang dijelaskan. jika Anda ingin membatalkan pesanan Anda, kami dapat melakukannya untuk Anda, tetapi kami tidak memiliki perkiraan kecepatan/waktu mulai yang TEPAT.', 'primary', '0', '0', 'jumlah pesan rata rata 65 waktu proses 22 jam 46 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(221, 'Medan', 2276, 'Twitter Followers', 'Twitter Followers Server 16 [ 30 days refill ] FAST CHEAP⚡️ ', 58000, 20, 1000, 'Instant\nR30 [ after requesting it may take 24-48h to start ]\n1K/Day\nQuality All profiles with profile pictures real looking', 'primary', '1', '30', 'jumlah pesan rata rata 100 waktu proses 2 jam 48 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(222, 'Medan', 2281, 'Shopee/Tokopedia/Bukalapak', 'Shopee Likes Produk Indonesia [ Max 25K ] [BONUS 5%] MURAH ', 5000, 50, 10000, 'High Quality\nInstan\nNO DROP', 'primary', '0', '', 'jumlah pesan rata rata 506 waktu proses 11 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(223, 'Medan', 2289, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 1 [ No Refill ] [ 300/hour ]', 6880, 100, 100000, 'Instant\nKecepatan: 200-1000/jam (Semakin besar pesanan, semakin cepat tingkat pertumbuhannya)\nKecepatan dapat bervariasi jika kelebihan beban mungkin sangat lambat. tetapi dapat didorong sesuai permintaan\nDrop: 10-20%\nNo refill/refund', 'primary', '0', '', 'jumlah pesan rata rata 160 waktu proses 6 jam 42 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(224, 'Medan', 2290, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 2 [ No Refill ] [ 5k/day ]', 7990, 50, 1000, 'Instan\n1000 likes/1 kali order (bisa dipesan 20 kali).\nwaktu penyelesaian adalah 6-12 jam\nDrop: 5-15% [ jika drop diatas itu tetap tidak ada garansi ]\n[No Refill', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 2 hari  7 jam  50   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(225, 'Medan', 2291, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post / Video Likes Server 3 [ 30days Refill ] [ 3k/day ] ', 20290, 10, 5000, 'Link: https://www.facebook.com/zuck/posts/10114380064791681\nStart: Within 0 to 1 Hrs, Pls allow 6-12 hours.\nSpeed: 1000 to 10000 per 24 hours\nRefill: 30days\n\nURL Format: Photo/Video/Status Link\nQuality: Real\nGuarantee: 30days Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 155 waktu proses 21 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(226, 'Medan', 2292, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 4 [ 45days Refill ] [ REAL ] ', 20670, 100, 10000, 'REAL negara luar\n0-3 jam mulai!\nTanpa Drop! Garansi Isi Ulang 45 Hari.\nKecepatan Harian 3K\nHalaman, Grup, Profil Semua Tautan Terima.\nCONTOH LINK: https://www.facebook.com/zuck/posts/10114380064791681', 'primary', '0', '', 'jumlah pesan rata rata 445 waktu proses 1 hari  14 jam  35   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(227, 'Medan', 2294, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S19 [ max 1K murah real ] Refill 3days', 28000, 100, 500, 'BONUS 15-20%\nREAL', 'primary', '0', '', 'jumlah pesan rata rata 259 waktu proses 15 jam 22 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(228, 'Medan', 2298, 'TikTok Likes', 'TikTok Likes  13 [ REFILL 30D ][Speed: 2K/Day]', 21210, 10, 50000, 'waktu mulai 0-2 jam\nkualitas REAL tidak BOT tapi akun luar', 'primary', '0', '', 'jumlah pesan rata rata 165 waktu proses 12 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(229, 'Medan', 2300, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions Server 1 MURAH CEPAT', 670, 100, 5000000, 'Instant\nFrom hashtags , Home , Profile & Other\nSuper Fast Delivery', 'primary', '0', '', 'jumlah pesan rata rata 1.565 waktu proses 26 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(230, 'Medan', 2306, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 4 LessDrop [ Refill 30D ] [ 1-5k/days]', 4160, 50, 100000, 'waktu mulai 0-1jam\n1k-5k/day\nLess Drop', 'primary', '1', '30', 'jumlah pesan rata rata 1.770 waktu proses 1 jam 0 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(231, 'Medan', 2310, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Server 5 [ Best Quality ] [ Refill 99days ] [ 2k-3k/day ]', 5100, 10, 1000000, 'masa garansi 99 hari refill di tiket\n0-1h\n2k-3k/day\n5-10% drop maximum\nBest Quality', 'primary', '1', '30', 'jumlah pesan rata rata 2.610 waktu proses 53 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(232, 'Medan', 2323, 'TikTok View', 'TIKTOK View Server 4 Emergency', 1520, 10, 25000000, 'waktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 4.090 waktu proses 14 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(233, 'Medan', 2326, 'Tiktok Comments ', 'Tiktok 1 Comments random [ Akun centang biru/ VERIFIED ] EKLUSIVE', 21370, 1000, 1000, 'proses 2-7 hari\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 16 jam 2 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(234, 'Medan', 2336, 'Twitter Followers', 'Twitter Followers Server 17 [ 30 days refill ] FAST CHEAPEAST⚡️ ', 14470, 100, 5000, 'R30\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 810 waktu proses 2 hari  11 jam  47   menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(235, 'Medan', 2338, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 6 HQ [ Refill 365days ] [ Fast ] ', 9150, 10, 1000000, 'Fast \nRefill 365days', 'primary', '1', '30', 'jumlah pesan rata rata 899 waktu proses 3 jam 27 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(236, 'Medan', 2339, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Server 7 [ Refill 99days ] [ 30-50k/day]', 6160, 10, 5000000, '99 Days Refill\n30-50k/day\nRefill button enabled', 'primary', '1', '30', 'jumlah pesan rata rata 1.077 waktu proses 2 jam 38 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(237, 'Medan', 2340, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 8 [ Refill 180days ] [ 30-50k/day] ( Recommended Service )', 7820, 10, 1000000, 'Speed 50K/day\nHQ Followers\nRefill: 180 Days ( Auto-Refill is Enable for 30 Days )\nDrop Ratio Below 0.5%', 'primary', '1', '180', 'jumlah pesan rata rata 977 waktu proses 4 jam 31 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(238, 'Medan', 2341, 'Instagram Views', 'instagram view Server 3 [ TV/VIDEO/REELS] INSTANT', 410, 100, 2000000000, 'Fast', 'primary', '0', '', 'jumlah pesan rata rata 1.770 waktu proses 35 menit.', '2023-05-14 13:04:46', '2023-05-14 13:04:46'),
(239, 'Medan', 2342, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views Live Stable Upto 50 Minutes', 6840, 2000, 500000, 'Stable 40-50 Minutes\nLive Streaming Mulai Rata-rata dalam 5-7 Menit\nSetelah Streaming Mulai\nView Langsung Akan Meningkat Perlahan Dan Akan Stabil Selama Live Viewer Hingga 50+ Menit Akan Meningkat\n\nHingga 200+ Live Viewer pada 2000 Streaming Pesanan\n\nPembeli Akan Mendapatkan Hingga 10% Live Viewer Selama Hingga 50 Menit\n( SEMUA Catatan ada di Pengujian dan Estimasi Kami, ini dapat bertambah atau berkurang menurut Update Youtube )\n( pesan kelipatan 100, Jangan order 2150 atau 2650 Order Seperti ini )\n', 'primary', '0', '', 'jumlah pesan rata rata 2.300 waktu proses 3 hari  4 jam  28   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(240, 'Medan', 2348, 'Youtube Subscribers', 'Youtube Subscribe SERVER 18 [ No drop ] [ refill 30day ] 40/day ', 333820, 20, 6000, 'Good subs- Start time : 0 - 2h\nSpeed : 30 - 60 / day\nNON DROP\nGuarantee: 30 days\nMin 20 - Max 6k', 'primary', '0', '', 'jumlah pesan rata rata 89 waktu proses 19 jam 14 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(241, 'Medan', 2352, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views stay 24jam [ BETA 1 murah ]', 20340, 500, 4000, '- Order 1000 views kamu dapat 75 - 300 live views stay di live mu 24jam\n- Order 2000 views kamu dapat 175 - 600 live views stay di live mu 24jam\n- Order 3000 views kamu dapat 275 - 900 live views stay di live mu 24jam\n\nCatatan :\n- Harap teruskan siaran langsungmu, Jangan segera mengakhiri siaran langsung. Jika video dihapus atau segera berakhir maka kami tidak dapat reffund/cancel.\n- Setelah order, tidak ada reffund.\n- tidak bisa cancel apapun itu alasannya\n- tidak ada refund apapun itu alasannya\norder = ambil resiko', 'primary', '1', '', 'jumlah pesan rata rata 2.800 waktu proses 2 hari  3 jam  43   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(242, 'Medan', 2353, 'Youtube Views', 'Youtube Views Server 11 [ R30 ] [ NO drop ]', 25000, 5000, 10000000, 'dalam pengujian kami \nLayanan ini belum ada drop\n20k/days', 'primary', '0', '', 'jumlah pesan rata rata 2.301 waktu proses 5 hari  19 jam  39   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(243, 'Medan', 2360, 'Twitch Live Stream ', 'Twitch Live Views [FOR 20 MINUTES] Fast ', 129930, 100, 2000, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(244, 'Medan', 2361, 'Twitch Live Stream ', 'Twitch Livestream Views 30 mins', 156240, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', 'jumlah pesan rata rata 36 waktu proses 1 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(245, 'Medan', 2362, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Love ] [Non Drop]', 520, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 385 waktu proses 1 hari  13 jam  15   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(246, 'Medan', 2363, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ HaHa ] [Non Drop] ', 520, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 244 waktu proses 1 hari  20 jam  49   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(247, 'Medan', 2364, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ WoW ] [Non Drop] ', 520, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 480 waktu proses 2 hari  1 jam  6   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(248, 'Medan', 2365, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Sad ] [Non Drop] ', 520, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 321 waktu proses 1 hari  4 jam  13   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(249, 'Medan', 2366, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Angry ] [Non Drop] ', 520, 50, 1000, 'Instan\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 382 waktu proses 2 hari  9 jam  50   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(250, 'Medan', 2367, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Love ] [Non Drop] [ max 50k ] fast', 12580, 50, 50000, 'instan \n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 80 waktu proses 1 jam 47 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(251, 'Medan', 2368, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Care ] [Non Drop] [ max 50k ] fast ', 12900, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 259 waktu proses 2 jam 40 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(252, 'Medan', 2369, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ HaHa ] [Non Drop] [ max 50k ] fast', 11940, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 57 waktu proses 2 jam 26 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(253, 'Medan', 2370, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ WoW ] [Non Drop] [ max 50k ] fast ', 12480, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 226 waktu proses 4 jam 6 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(254, 'Medan', 2371, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Sad ] [Non Drop] [ max 50k ] fast ', 12420, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 50 waktu proses 1 jam 57 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(255, 'Medan', 2372, 'Facebook Post Like Emoticon', 'Facebook Emoticons Post Likes [ Angry ] [Non Drop] [ max 50k ] fast ', 12580, 50, 50000, 'instan\n5k/jam\nnondrop', 'primary', '0', '', 'jumlah pesan rata rata 390 waktu proses 1 jam 30 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(256, 'Medan', 2374, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 21 [ NEW ] MURAH! ', 980, 20, 5000, 'MURAH\nProses lama!', 'primary', '0', '', 'jumlah pesan rata rata 486 waktu proses 16 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(257, 'Medan', 2375, 'TikTok View', 'TIKTOK View Server 8 GUARANTED 30D', 160, 100, 10000000, '100k-1M/Days\norder kelipatan 100', 'primary', '0', '', 'jumlah pesan rata rata 16.190 waktu proses 19 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(258, 'Medan', 2381, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  12 Cheapest [ No refill ] [ No Drop ] ', 14570, 10, 100000, 'Instan dan Cepat ( Kualitas Tinggi )\nMin 100 dan Max 100k\n( Tidak Ada Drop Sejak 90 Hari )\nIni Layanan no refill jika suatu saat drop tidak ada garansi!\n\nMedanpedia Tujuannya adalah Memberikan Harga Paling Terjangkau di Pasar', 'primary', '0', '', 'jumlah pesan rata rata 241 waktu proses 26 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(259, 'Medan', 2382, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  13 Cheapest [ 30 Days Refill ]', 13560, 10, 100000, 'Instant and Fast ( High Quality )\n30 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 138 waktu proses 30 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(260, 'Medan', 2389, 'Twitter Followers', 'Twitter Followers Server 19 [ No refill ] CHEAPEAST ', 25370, 10, 10000, 'Instant\n2-3k/jam', 'primary', '0', '', 'jumlah pesan rata rata 878 waktu proses 6 jam 19 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(261, 'Medan', 2395, 'Facebook Reels Short Video', 'Facebook Likes Server 3 [Reels Short Video] [ 5k/day ] [ No Drop ]', 10720, 100, 50000, '5k/day\nLink Format: https://www.facebook.com/username/videos/xxxxxxxxxx/', 'primary', '0', '', 'jumlah pesan rata rata 423 waktu proses 7 hari  23 jam  52   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(262, 'Medan', 2397, 'Twitter Favorites/Like', 'Twitter Likes  4 [ NO Refill ] FAST [HQ] [ 20/10k ]', 18040, 20, 10000, 'waktu mulai 0-1 jam', 'primary', '0', '', 'jumlah pesan rata rata 108 waktu proses 31 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(263, 'Medan', 2407, 'Instagram Followers [ No Refill ]', 'Instagram Followers  3 [ no refill max 20k ] ', 2290, 100, 20000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 750 waktu proses 4 jam 51 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(264, 'Medan', 2415, 'Instagram Followers [ No Refill ]', 'Instagram Followers  4 EKLUSIVE [ REAL HQ ] LESS DROP ', 39260, 100, 5000, 'INSTANT\ndrop maksimal 5-15% saja\n1k-3k/day\nmax pesan saya buat 5.000 jika sudah sukses status, bisa order lagi\nmax per akun bisa isi sampai 20ribu followers\n\nBisa minta refill jika drop diatas 20%\ntetapi refill ini sifatnya random\nbisa refill bisa tidak\nlayanan tetap no refill!\njadi jika suatu saat drop gk bisa refill jangan banyak kompline', 'primary', '0', '', 'jumlah pesan rata rata 1.618 waktu proses 22 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(265, 'Medan', 2417, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Komentar Server 2 [ 24 - 48 jam delivery ] [ CUSTOM ]', 456370, 10, 600, '24 - 48 jam delivery', 'custom_comments', '0', '', 'jumlah pesan rata rata 31 waktu proses 10 jam 1 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(266, 'Medan', 2418, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Komentar Server 3 [ max 1k ] [ CUSTOM ] ', 408850, 10, 1000, 'Link: Follow the description\nStart: 0-6hrs\nSpeed: 100-500/days\nRefill: 30 days\n\nQuality: High Quality\nQuantity: Min 10, Max 600', 'custom_comments', '0', '', 'jumlah pesan rata rata 32 waktu proses 15 jam 26 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(267, 'Medan', 2423, 'Youtube Views', 'Youtube Views Server 13 [ 100K/Day ] Lifetime Guarantee [ Short and Long Video Both Accepted ]', 11440, 100, 50000000, 'INSTANT START', 'primary', '0', '', 'jumlah pesan rata rata 870 waktu proses 10 jam 56 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(268, 'Medan', 2425, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 10 [ Refill 365D ] [ 100-150k per day ] EKLUSIVE', 3930, 10, 500000, 'Speed 100-150k per day\nRefill 365 Days\nada bonus followers jika hoki', 'primary', '1', '30', 'jumlah pesan rata rata 605 waktu proses 19 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(269, 'Medan', 2434, 'TikTok Likes', 'TikTok Likes Server 6 [ Superfast ] [ 1K ] R30 days [ Akun Perempuan ]', 21670, 50, 1000, 'Superfast', 'primary', '0', '', 'jumlah pesan rata rata 239 waktu proses 1 jam 26 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(270, 'Medan', 2446, 'Twitch', 'Twitch Followers Server 1 [ Max 150K ] [ Speed 1-5k ]  R30days', 4520, 100, 150000, 'FAST', 'primary', '0', '', 'jumlah pesan rata rata 395 waktu proses 2 jam 57 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(271, 'Medan', 2447, 'Twitch', 'Twitch Followers Server 2 [ Max kK ] [ Speed 5K/D ] ', 3400, 20, 5000, 'FAST', 'primary', '0', '', 'jumlah pesan rata rata 527 waktu proses 9 jam 3 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(272, 'Medan', 2448, 'Twitch', 'Twitch Followers Server 3 [ Max 50K ] [ Speed 5K/Day ] AUTO REFILL 15D ', 13200, 100, 50000, 'AUTO REFILL 15 DAYS', 'primary', '0', '', 'jumlah pesan rata rata 570 waktu proses 3 jam 59 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(273, 'Medan', 2451, 'Youtube Subscribers', 'Youtube Subscribe SERVER 19  [ 30 days guarantee ] [ Bonus Views ] RECOMMENDED', 429430, 100, 5000, 'Speed - 300-500/day\n30 Days guarantee\nDrop 5%', 'primary', '0', '', 'jumlah pesan rata rata 283 waktu proses 22 jam 49 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(274, 'Medan', 2452, 'Youtube Subscribers', 'Youtube Subscribe SERVER 20 [ 30 days guarantee ] [ 300/day ]', 307380, 400, 5000, '30 Days Refill\nSpeed 1k-5k/ Day\n0-1 hour Start\nRefill Button Enabled\nStart - 0-12 hours\nDrop Ratio: 10-20%', 'primary', '0', '', 'jumlah pesan rata rata 590 waktu proses 4 hari  6 jam  38   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(275, 'Medan', 2453, 'Youtube Subscribers', 'Youtube Subscribe SERVER 21 [ 30 days guarantee ] [ 500/day ] ', 220170, 100, 5000, '30 Days Guarantee\nMin 500 Max 5000\nSpeed 500-1k/day\n30 Days Guarantee\nStart - 0-24 hours [ Do not ask cancel before 24 hours]', 'primary', '0', '', 'jumlah pesan rata rata 207 waktu proses 1 hari  11 jam  6   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(276, 'Medan', 2465, 'Telegram', 'Telegram - Channnel Members/Group Server 11 [100K] [ Refill 30 days ] ', 11680, 100, 100000, 'Instant\nSpeed: 20K+ day\nNon Drop 30 day', 'primary', '0', '', 'jumlah pesan rata rata 309 waktu proses 3 jam 28 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(277, 'Medan', 2467, 'Twitter Followers', 'Twitter Followers Server 20 [ No refill ] SuperInstant ', 12640, 10, 20000, 'Instant, tapi bisa aja lambat saat overload atau ada update twitter\nSpeed: 20K/Day', 'primary', '0', '', 'jumlah pesan rata rata 839 waktu proses 2 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(278, 'Medan', 2468, 'Twitter Followers', 'Twitter Followers Server 21 [ Refill 30D ] SuperInstant ', 15560, 100, 300000, 'Instant, tapi bisa aja lambat saat overload atau ada update twitter\nSpeed: 20K/Day', 'primary', '1', '30', 'jumlah pesan rata rata 200 waktu proses 1 hari  2 jam  11   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(279, 'Medan', 2470, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [Fast service] [ 15 MInutes ]', 41960, 300, 2000, 'Start in 3-5 minutes\nConcurrent Live will be ( 70-100% )\nNo Cancellation issue\n( If Video Deleted, Buyer Will Get Partial Refund )', 'primary', '0', '', 'jumlah pesan rata rata 960 waktu proses 40 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(280, 'Medan', 2471, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [Fast service] [ 30 MInutes ] ', 73920, 300, 2000, 'Start in 3-5 minutes\nConcurrent Live will be ( 70-100% )\nNo Cancellation issue\n( If Video Deleted, Buyer Will Get Partial Refund )', 'primary', '0', '', 'jumlah pesan rata rata 520 waktu proses 1 jam 18 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(281, 'Medan', 2472, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [Fast service] [ 60 MInutes ] ', 132210, 300, 2000, 'Start in 3-5 minutes\nConcurrent Live will be ( 70-100% )\nNo Cancellation issue\n( If Video Deleted, Buyer Will Get Partial Refund )', 'primary', '0', '', 'jumlah pesan rata rata 500 waktu proses 1 jam 34 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(282, 'Medan', 2474, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S22 [ REAL AKTIF ] [ 5K ] [ REFILL 7 DAYS ]', 18000, 50, 1000, 'Real Indonesia\nNo refund\nProses max 1x24 jam\ndilimit pesanan perhari 500-1000\nkemungkinan kalo gk bisa pesan kenak limit harian\nsilahkan dicoba keesokan harinya\n\nSebelum anda membeli:\n- Pastikan username / link data yang di input benar dan valid,\n- Jangan input data yang sama dengan orderan sebelum nya apabila orderan sebelum nya belum Completed,\n- Apabila orderan tidak mengalami perubahan status, silahkan buat sebuah tiket bantuan baru untuk di tangani,\n- Tidak ada pengembalian dana untuk kesalahan pengguna.', 'primary', '0', '', 'jumlah pesan rata rata 359 waktu proses 19 jam 11 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(283, 'Medan', 2476, 'Instagram Live Video', 'Instagram Live Video Views [ Durasi 60 Menit ] INSTANT', 113730, 10, 5000, 'INSTANT', 'primary', '0', '', 'jumlah pesan rata rata 68 waktu proses 7 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(284, 'Medan', 2481, 'SoundCloud', 'SoundCloud Plays [Max: 10M]', 270, 50000, 1000000000, 'Start Time: Instant - 12 hours\nSpeed: 3 to 5mil/ day\nSpecs: Full Link !', 'primary', '0', '', 'jumlah pesan rata rata 50.500 waktu proses 1 hari  7 jam  55   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(285, 'Medan', 2484, 'Youtube Subscribers', 'Youtube Subscribe SERVER 22 [ 30 days guarantee ] [ NON DROP ] Speed 150/D', 192320, 100, 5000, '- Start time : 1 - 24h\n- Speed up to 100 / day (The average speed per day is 30-100!)\n- if the speed is less than 100 per day, partial is possible!\n- Real user\n- Guarantee: 30 days\n- Min 50 - Max 5k\n- Order channel url https://www.youtube.com/channel/xxxx , channel must show number of subs\n\nNOTE : if channel : Hide number of subs, restricted, changing username, old drop , channel delete, etc. The order will be completed due to reasons preventing shipping. In this case , take long time to cancel', 'primary', '0', '', 'jumlah pesan rata rata 301 waktu proses 1 hari  21 jam  59   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47');
INSERT INTO `smm` (`id`, `provider`, `service`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(286, 'Medan', 2491, 'Instagram Likes', 'Instagram Likes Server 19 [ 50k/day ] [  REAL ] ', 1020, 10, 50000, '50k/hari\nkemungkinan 10% Drop saja \ntidak ada isi ulang untuk kasus terburuk.', 'primary', '0', '', 'jumlah pesan rata rata 343 waktu proses 54 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(287, 'Medan', 2494, 'Instagram Likes', 'Instagram Likes S1 [ FAST MURAH ]', 640, 20, 20000, 'Superfast\nNo refill', 'primary', '0', '', 'jumlah pesan rata rata 244 waktu proses 23 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(288, 'Medan', 2495, 'Instagram Likes', 'Instagram Likes S2 [ FAST No Drop ] 500/hour ', 1020, 50, 1000000, 'waktu mulai 0-1j\nkecepatan 500+/jam\nNodrop\nTidak ada refill jika ada update terburuk', 'primary', '0', '', 'jumlah pesan rata rata 278 waktu proses 20 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(289, 'Medan', 2496, 'Youtube Views', 'Youtube Views S1 [ 3-4k/day ] + bonus likes + Traffic Source- External + Direct [ Lifetime Guarantee ]', 11700, 100, 120000, 'Lifetime Guarantee', 'primary', '1', '30', 'jumlah pesan rata rata 515 waktu proses 1 hari  21 jam  24   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(290, 'Medan', 2497, 'Youtube Views', 'Youtube Views S2 [ 2-5k/day ] + bonus likes + Traffic Source- Mixed [R30]', 6700, 100, 160000, 'Refill 30 days', 'primary', '1', '30', 'jumlah pesan rata rata 100 waktu proses 1 jam 23 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(291, 'Medan', 2499, 'Shopee/Tokopedia/Bukalapak', 'Shopee Video Like Indonesia [ Max 15K ] [BONUS 5%] MURAH ', 6500, 50, 15000, 'Maksimal proses 24 jam\nMasukkan Link shopee video\nNo refund jika double order dan yg masuk hanya 1 orderan, silahkan tunggu sampai orderan sebelumnya berstatus Success', 'primary', '0', '', 'jumlah pesan rata rata 423 waktu proses 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(292, 'Medan', 2503, 'Youtube Views', 'Youtube Views S3 [ 20K/day ] + Suggested [ Lifetime Guarantee ] ', 11950, 100, 500000, '20K/day', 'primary', '0', '', 'jumlah pesan rata rata 1.132 waktu proses 13 jam 17 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(293, 'Medan', 2510, 'Instagram Views', 'instagram view Server 8 [ TV/VIDEO/REELS] [UPDATED WORKING] CHEAP ', 2800, 100, 10000000, 'Max 10Juta', 'primary', '0', '', 'jumlah pesan rata rata 427 waktu proses 29 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(294, 'Medan', 2512, 'Youtube Views', 'Youtube Views S4  [ Good For Ranking ] Life Time Guaranteed', 14710, 1000, 100000000, 'Source : Mobile Devices - Android\nSpeed 50-100k Per Day\nRetention : 20-50 Second\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 1.690 waktu proses 16 jam 27 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(295, 'Medan', 2513, 'Youtube Views', 'Youtube Views S5  [ 60K/day - Suggested Views + 2-3% Bonus LIKES ]', 10270, 100, 9000000, 'Speed 40K/day\n60 Days FreeRefill IN case drop\nSource : Suggested Videos\n2-3% Bonus Likes ( Free with Views )\nInstant Start', 'primary', '0', '', 'jumlah pesan rata rata 1.254 waktu proses 13 jam 4 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(296, 'Medan', 2514, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  14 Cheapest Indonesian [ 30 Days Refill ] Instant ', 14950, 10, 1000000, 'Instant Start\nBest Quality with World Cheapest Price )\n30 Days Free Refill if You Found Single Likes Drop', 'primary', '0', '', 'jumlah pesan rata rata 116 waktu proses 6 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(297, 'Medan', 2517, 'TikTok  share', 'TIKTOK Share  3 MAX 100jt TERMURAH', 400, 10, 100000000, '10/10M', 'primary', '0', '', 'jumlah pesan rata rata 927 waktu proses 25 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(298, 'Medan', 2524, 'Youtube Subscribers', 'Youtube Subscribe S2 [ Lifetime Guaranteed ] Best for Monetization', 335640, 200, 1000000, 'Target : Youtube Channel Link\nLokasi : Global\nWaktu Penyelesaian: 0-24 Jam, Dapat diperpanjang hingga 72 jam dalam Intensitas.\nkemungkinan 10k/days\n\nCatatan:\n Saat layanan Overload, kecepatan awal proses berubah.\n Jangan melakukan pemesanan kedua pada link yang sama sebelum pesanan Anda Sukses di sistem.\n Jika ada masalah dengan layanan, silakan hubungi Tiket.', 'primary', '0', '', 'jumlah pesan rata rata 300 waktu proses 14 jam 7 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(299, 'Medan', 2526, 'TikTok  share', 'TIKTOK Share  4 MAX 1jt TERMURAH BONUS VIEW', 90, 300, 1000000, '100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 12.664 waktu proses 5 hari  3 jam  41   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(300, 'Medan', 2527, 'Youtube Subscribers', 'Youtube Subscribe S3 [ Refill 30 days ] EXCLUSIVE', 71450, 100, 5000, 'waktu mulai : 0-30min\nKecepatan : 100-200/day\nDrop : Non drop ( kalau terjadi drop kemungkinan hanya 5% )\nRefill : 30 days', 'primary', '0', '', 'jumlah pesan rata rata 118 waktu proses 18 jam 2 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(301, 'Medan', 2538, 'Instagram Views', 'instagram view Server 3 SUPERFAST [ TV/VIDEO/REELS] ', 1060, 100, 1000000, 'SUPERFAST', 'primary', '0', '', 'jumlah pesan rata rata 4.570 waktu proses 3 jam 27 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(302, 'Medan', 2539, 'Instagram Views', 'instagram view Server 4 SUPERFAST [ TV/VIDEO/REELS]  Recommended ', 540, 100, 5000000, 'Best Service in the World\nGaransi seumur hidup jika drop', 'primary', '0', '', 'jumlah pesan rata rata 1.610 waktu proses 4 jam 12 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(303, 'Medan', 2548, 'Instagram Views', 'instagram view Server 9 FAST [ VIDEO/TV/REELS ] Max 1M ', 1330, 100, 5000000, '0-15 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 3.400 waktu proses 50 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(304, 'Medan', 2554, 'Instagram Likes', 'Instagram Likes S7 [ Max 100K ] + Bonus', 480, 100, 100000, 'Instan\nno drop\njika ada masalah tentang ig dan drop, tetap no garansi', 'primary', '0', '', 'jumlah pesan rata rata 1.152 waktu proses 21 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(305, 'Medan', 2555, 'Instagram Like Indonesia', 'Instagram Likes Indonesia  12 FAST REAL ACCOUNT [ REFILL 7 DAYS ]', 10000, 50, 1000, 'Real Indonesia\nFAST\nProses max 1x24 jam\ndilimit pesanan perhari 500-1000', 'primary', '0', '', 'jumlah pesan rata rata 116 waktu proses 17 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(306, 'Medan', 2560, 'Youtube Subscribers', 'Youtube Subscribe S7 [ 90 days refill ] [ Speed Up to 100/Day ]', 188490, 50, 10000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 132 waktu proses 4 hari  2 jam  44   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(307, 'Medan', 2566, 'Instagram Likes', 'Instagram Likes S7 [ No refill ] [ 20k/day ] Real Mixed', 390, 10, 50000, '20k/day', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 47 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(308, 'Medan', 2568, 'TikTok Likes', 'TIKTOK Likes Server 8 [ Refill 30 Days ]  Speed 10K/Day', 15020, 100, 10000, 'max 10k', 'primary', '0', '', 'jumlah pesan rata rata 240 waktu proses 1 jam 34 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(309, 'Medan', 2573, 'Instagram Views', 'instagram view Server 10 SUPERFAST [ VIDEO/REELS ] [ TV tidak Bisa ] Max 10M ', 160, 100, 10000000, 'Speed: 1M - 2M In 15 minutes\nStart: Instant\nada beberapa pesanan yg status nya stuck\nsebelum kompline silahkan cek apakah sudah masuk atau belum view nya', 'primary', '0', '', 'jumlah pesan rata rata 8.471 waktu proses 4 jam 43 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(310, 'Medan', 2574, 'Youtube Subscribers', 'Youtube Subscribe S7 [ 60 days refill ] [ Speed Up to 3000/Day ] ', 529670, 100, 50000, '0 - 1 Hour', 'primary', '0', '', 'jumlah pesan rata rata 135 waktu proses 6 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(311, 'Medan', 2576, 'Telegram Reactions', 'Telegram PartyPopper Reaction', 630, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat', 'primary', '0', '', 'jumlah pesan rata rata 534 waktu proses 1 hari  19 jam  48   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(312, 'Medan', 2577, 'Telegram Reactions', 'Telegram StarStruck Reaction ', 630, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat', 'primary', '0', '', 'jumlah pesan rata rata 83 waktu proses 2 jam 26 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(313, 'Medan', 2578, 'Telegram Reactions', 'Telegram Fire Reaction ', 630, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat dan lebih lama', 'primary', '0', '', 'jumlah pesan rata rata 165 waktu proses 1 hari  15 jam  48   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(314, 'Medan', 2579, 'Telegram Reactions', 'Telegram Love  Reaction', 50, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat dan lebih lama', 'primary', '0', '', 'jumlah pesan rata rata 57 waktu proses 3 hari  6 jam  2   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(315, 'Medan', 2580, 'Telegram Reactions', 'Telegram Like Reaction ', 630, 1, 10000, 'Proses bisa 1-2 hari\nbisa lebih cepat dan lebih lama', 'primary', '0', '', 'jumlah pesan rata rata 430 waktu proses 2 hari  17 jam  38   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(316, 'Medan', 2581, 'Telegram Reactions', 'Telegram Like Reaction + Views (20/300k) [ 10k/hr ]', 6850, 20, 300000, 'FAST \nINSTAN', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 58 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(317, 'Medan', 2582, 'Telegram Reactions', 'Telegram Dislike Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'Instan\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 215 waktu proses 37 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(318, 'Medan', 2583, 'Telegram Reactions', 'Telegram Heart Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'Instan \nFAST', 'primary', '0', '', 'jumlah pesan rata rata 198 waktu proses 37 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(319, 'Medan', 2584, 'Telegram Reactions', 'Telegram Fire Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 146 waktu proses 31 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(320, 'Medan', 2585, 'Telegram Reactions', 'Telegram PartyPopper Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 104 waktu proses 48 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(321, 'Medan', 2586, 'Telegram Reactions', 'Telegram StarStruck Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 40 waktu proses 1 jam 10 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(322, 'Medan', 2587, 'Telegram Reactions', 'Telegram ScreaminFace Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN \nFAST', 'primary', '0', '', 'jumlah pesan rata rata 38 waktu proses 1 jam 21 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(323, 'Medan', 2588, 'Telegram Reactions', 'Telegram BeamingFace Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 76 waktu proses 43 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(324, 'Medan', 2589, 'Telegram Reactions', 'Telegram CryingFace Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 212 waktu proses 1 jam 27 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(325, 'Medan', 2590, 'Telegram Reactions', 'Telegram Tai ( PileofPoo ) Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 119 waktu proses 46 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(326, 'Medan', 2591, 'Telegram Reactions', 'Telegram Muntah ( FaceVomiting ) Reaction + Views (20/300k) [ 10k/hr ] ', 6850, 20, 300000, 'INSTAN\nFAST', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 34 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(327, 'Medan', 2592, 'Telegram', 'Telegram Post Views [90M] [ 1 Post ] TERMURAH DAN SUPERFAST', 30, 100, 90000000, 'Instant\n2jt/hari\nNon Drop\nTarget/data  masukin link contoh https://t.me/medanpediaSMM/192\nExample Link: https://t.me/Your_Group/MessageID\nAtau bisa \nTarget/data  masukin link contoh https://t.me/medanpediaSMM\nExample Link: https://t.me/Your_Group/\nuntuk postingan terakhir', 'primary', '0', '', 'jumlah pesan rata rata 7.190 waktu proses 28 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(328, 'Medan', 2595, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 11 [ 20K/Day ]', 27920, 100, 30000, '20k/day', 'primary', '0', '', 'jumlah pesan rata rata 571 waktu proses 28 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(329, 'Medan', 2624, 'Telegram Reactions', 'Telegram Post Reactions + Views [Positive]  [Refill: No] [Max: 1M] [Start Time: 0-1 Hour] [Speed: 600K/Day]', 90, 15, 1000000, 'Pesan 1000 kadang yg masuk tidak tepat 1000 bisa cuman 500 ( no kompline )\ndan coba dlu pesan 100 karna ada beberapa chanel/grup yang tidak support\nkami tidak ada refund jika status sukses tetapi react nya gk masuk\nInstant start.\nInstant complete.\nGroup or channel\nPublic links only', 'primary', '0', '', 'jumlah pesan rata rata 115 waktu proses 5 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(330, 'Medan', 2625, 'Telegram Reactions', 'Telegram Post Reactions + Views [Negative] [Refill: No] [Max: 1M] [Start Time: 0-1 Hour] [Speed: 600K/Day] ', 90, 15, 1000000, 'Pesan 1000 kadang yg masuk tidak tepat 1000 bisa cuman 500 ( no kompline )\ndan coba dlu pesan 100 karna ada beberapa chanel/grup yang tidak support\nkami tidak ada refund jika status sukses tetapi react nya gk masuk\nInstant start.\nInstant complete.\nGroup or channel\nPublic links only', 'primary', '0', '', 'jumlah pesan rata rata 93 waktu proses 5 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(331, 'Medan', 2627, 'TikTok  share', 'TIKTOK Share  5 [Refill 30 days]  10K/Day [ NonDrop ]', 1770, 10, 10000000, 'NonDrop', 'primary', '0', '', 'jumlah pesan rata rata 257 waktu proses 58 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(332, 'Medan', 2628, 'TikTok Save/Favorit', 'TikTok Save Server 1 [ Refill 30days ]  5k/days ', 620, 100, 20000, 'Refill 30days \n5k/days', 'primary', '0', '', 'jumlah pesan rata rata 449 waktu proses 15 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(333, 'Medan', 2631, 'Instagram Comments/komentar', 'Instagram Custom Comments  [ 20k/days ] [No Drop]', 13890, 10, 50000, 'No Drop\n20k/days', 'custom_comments', '0', '', 'jumlah pesan rata rata 31 waktu proses 1 jam 23 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(334, 'Medan', 2633, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Like [Max: 100K] [Start Time: Instant] [Speed: 100K/Day]', 1730, 10, 1000000, 'TikTok Live Likes\nService Starting Super Instant!\nDaily Speed : 100K Per Hour\n\nExample Link:\nhttps://www.tiktok.com/@username', 'primary', '0', '', 'jumlah pesan rata rata 2.761 waktu proses 5 hari  17 jam  51   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(335, 'Medan', 2634, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Share [Max: 100K] [Start Time: Instant] [Speed: 100K/Day] ', 10010, 10, 1000000, 'Service Starting Super Instant!\nDaily Speed : 100K Per Hour\n\nExample Link:\nhttps://www.tiktok.com/@username', 'primary', '0', '', 'jumlah pesan rata rata 158 waktu proses 3 hari  20 jam  42   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(336, 'Medan', 2637, 'Youtube Subscribers', 'Youtube Subscribe S8 [ LifeTime Refill ] [ 10k Per Day ] ', 155430, 100, 100000, 'Lifetime Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 278 waktu proses 1 jam 25 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(337, 'Medan', 2638, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 12 [ Refill 365D ] [ Max 500k ] TERMURAH [ 100k-200k/days ]', 4590, 50, 500000, 'nstant', 'primary', '1', '30', 'jumlah pesan rata rata 676 waktu proses 4 jam 1 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(338, 'Medan', 2641, 'TikTok Save/Favorit', 'TikTok Save Server 2 [ Refill 30days ] 5k-10k/day', 2660, 100, 20000, '5k-10k/day\nrefill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 670 waktu proses 34 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(339, 'Medan', 2642, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  15 Cheapest Indonesian [ No Refill ] Instant ', 8370, 10, 50000, '0-15 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 160 waktu proses 1 hari  4 jam  45   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(340, 'Medan', 2648, 'Facebook Group Member', 'Facebook Group Member Server 2 [ No Refill  ] 1-15k/hari', 30960, 1000, 150000, '1-15k/hari\nlow drop bahkan tidak drop\ntapi tetap no refill jika drop', 'primary', '0', '', 'jumlah pesan rata rata 1.229 waktu proses 5 jam 35 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(341, 'Medan', 2650, 'Facebook Group Member', 'Facebook Group Member Server 4 [ 30 Days Refill ] 500-1K/hari', 20840, 100, 25000, 'Waktu mulai : 0-6jam\n30 Days Refill\n\nDetail:\nContoh link: https://www.facebook.com/groups/123\nLayanan ini hanya bekerja di grup publik\nJANGAN MELAKUKAN ORDER LEBIH 1 UNTUK LINK PADA WAKTU YANG SAMA.', 'primary', '0', '', 'jumlah pesan rata rata 2.171 waktu proses 5 hari  23 jam  37   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(342, 'Medan', 2651, 'Youtube Views', 'Youtube Views S7 [ 5k/day speed ] + Suggested [ Lifetime Guarantee ] ', 9390, 500, 55000, 'Source: Suggested + Direct + Browse Features ]\nSpeed 5k Per Day\nInstant Start\nLife Time Guarantee', 'primary', '0', '', 'jumlah pesan rata rata 1.411 waktu proses 12 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(343, 'Medan', 2652, 'Instagram Views', 'instagram view Server 11 SUPERFAST [ VIDEO/REELS/TV ]Max 100M ', 760, 100, 100000000, 'INSTANT\nSUPERFAST', 'primary', '0', '', 'jumlah pesan rata rata 667 waktu proses 2 jam 22 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(344, 'Medan', 2653, 'Youtube Views', 'Youtube Views S8 [ 70K Per Day speed ] ( 100% Suggested Views ) [ Lifetime Guarantee ] BONUS LIKE', 10270, 100, 1000000, 'Guarantee:Lifetime\nSpeed : 50-70k/day\nSource:Suggested', 'primary', '0', '', 'jumlah pesan rata rata 1.046 waktu proses 11 jam 25 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(345, 'Medan', 2658, 'Twitter Followers', 'Twitter Followers Server 22 [ Refill 30D ] [Non Drop] 20k/days', 38900, 10, 20000, '20k/days\nRefill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 687 waktu proses 1 hari  14 jam  39   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(346, 'Medan', 2659, 'Twitter Followers', 'Twitter Followers Server 23 [ Refill 30D ] [Non Drop] 50-100k/day ', 44980, 10, 100000, 'Non Drop\nRefill 30D', 'primary', '0', '', 'jumlah pesan rata rata 1.846 waktu proses 8 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(347, 'Medan', 2661, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 15 [ refill 30 hari ] [ Instant ] [ 50k/day Speed ] HQ Accounts', 37760, 100, 50000, 'refill 30 hari\n50k/day Speed\n HQ Accounts', 'primary', '0', '', 'jumlah pesan rata rata 261 waktu proses 2 jam 29 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(348, 'Medan', 2662, 'Youtube Subscribers', 'Youtube Subscribe S9  [ 30 days refill ] [ 150-200/day ] [ Non drop ]', 71480, 50, 15000, '[ 30 days refill ] \n[ 150-200/day ] \n[ Non drop ]', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 1 hari  1 jam  0   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(349, 'Medan', 2665, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 16 [ No refill ] [ 10k/day Speed ] ', 45320, 100, 100000, 'No refill\n\nsekarang bisa refill 30days tapi jika tiba tiba gk bisa refill\nno kompline', 'primary', '0', '', 'jumlah pesan rata rata 430 waktu proses 2 hari  18 jam  43   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(350, 'Medan', 2668, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Share Server 1 [ max Max 500K] ', 10310, 100, 500000, 'waktu mulai  0-6 jam\nkelipatan 1000 untuk order', 'primary', '0', '', 'jumlah pesan rata rata 2.500 waktu proses 11 jam 58 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(351, 'Medan', 2669, '- PROMO - ON OFF', 'Instagram Followers PROMO 1  [ TERMURAH ] [ HQ LESSDROP ]', 4000, 25, 10000, '0-6h Start\n2-5k/days\n10-20% drop', 'primary', '0', '', 'jumlah pesan rata rata 1.215 waktu proses 28 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(352, 'Medan', 2671, 'Youtube Views', 'Youtube Views S9 ( Suggested Views ) [ Lifetime Guarantee ] [ 5-7K/day ]', 9490, 100, 55000, 'Min 100\nRetention: 30 seconds to 60 Seconds\nNo Drop\nMax 1 Million\n\nSource: Suggested videos + Direct or unknown + Browse features\n( 30-35?ch Source )', 'primary', '0', '', 'jumlah pesan rata rata 190 waktu proses 6 jam 59 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(353, 'Medan', 2672, 'Youtube Views', 'Youtube Views S10 ( Suggested Views ) [ Lifetime Guarantee ] [ 50-70K/day ] ', 10270, 100, 1000000, 'Instant Start\nMin 100\nRetention: 30 seconds to 60 Seconds\nNo Drop\nMax 1 Million\n\nSource: Suggested videos + Direct or unknown + Browse features\n( 30-35?ch Source )', 'primary', '0', '', 'jumlah pesan rata rata 2.033 waktu proses 19 jam 31 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(354, 'Medan', 2676, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S27 [ max 1k ] [ REFILL 3 DAYS ]✨ ', 33000, 100, 1000, 'min 100\nmax 1.000\nrefill 3 days\nhanya bisa refill jika drop diatas 50%\nproses 1x24 jam\nmax proses 2x24 jam', 'primary', '0', '', 'jumlah pesan rata rata 395 waktu proses 1 hari  19 jam  4   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(355, 'Medan', 2679, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Video Custom Comments  2 TERMURAH [ 30k/day Speed ]', 23360, 10, 100000, '30k/day Speed', 'custom_comments', '0', '', 'jumlah pesan rata rata 17 waktu proses 2 hari  19 jam  12   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(356, 'Medan', 2690, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Like BATTLE Server 1  [Max: 100K] [Start Time: Instant] [Speed: 100K/Day] ', 1760, 10, 1000000, 'Speed: 100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 416 waktu proses 7 hari  11 jam  29   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(357, 'Medan', 2691, 'Tiktok Live Streams Like/Share/Comment', 'Tiktok Live Like BATTLE Server 2 [Max: 100K] [Start Time: 0 - 1 Hours] [Speed: 100K/Day] ', 1820, 5, 1000000, 'Speed: 100K/Day', 'primary', '0', '', 'jumlah pesan rata rata 814 waktu proses 10 jam 4 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(358, 'Medan', 2692, 'Youtube Subscribers', 'Youtube Subscribe S10 [ 90 days refill ] [ 150-200/day ] [ Non drop ] ', 63650, 10, 10000, '200/Day', 'primary', '0', '', 'jumlah pesan rata rata 24 waktu proses 3 jam 10 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(359, 'Medan', 2693, 'Youtube Subscribers', 'Youtube Subscribe S11 [ 90 days refill ] [ 1500-2000/day ] [ Non drop ] ', 123290, 20, 20000, '1500-2000/day', 'primary', '0', '', 'jumlah pesan rata rata 503 waktu proses 9 jam 53 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(360, 'Medan', 2694, 'Tiktok Comments ', 'Tiktok Likes Komentar [ R30D ] [ baca deskripsi Sebelum Order! ]', 9110, 50, 5000, 'untuk order di web \ntarget masukin link poto\nLink Post masukin username\n\nuntuk order Via API\nparameter target masukin link poto\nparameter custom_link masukin username\n\n5k/day\nR30', 'custom_link', '0', '', 'jumlah pesan rata rata 363 waktu proses 3 jam 1 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(361, 'Medan', 2695, 'Tiktok Comments ', 'Tiktok Komentar [ 3 HQ Random Komentar ] [Start Time: 0-1 Hour] [Finishes in 3 Hours]', 8580, 1000, 1000, 'Pesan Jumlah 1000 anda mendapat kan 3 komentar\nbukan order 1000 dapat 1000 komentar!\nHQ & Active Accounts\nkomentar sesuai dengan video konten mu', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 3 jam 2 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(362, 'Medan', 2696, 'Tiktok Comments ', 'Tiktok Komentar Kostum Server 1  [Refill 30 Days] [ LOW ] [Max: 10K]  [Speed: 1K/Hour]', 86000, 10, 100000, 'Speed : 1K Per Hour\nNo Drop & 30 Day Refill Guarantee\nExample Link: Tiktok Video Link (All Video Link Acceeptable)', 'custom_comments', '0', '', 'jumlah pesan rata rata 12 waktu proses 8 hari  5 jam  33   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(363, 'Medan', 2697, 'Tiktok Comments ', 'Tiktok Komentar Kostum Server 2 [Refill 30 Days] [Max: 10K] [Speed: 1K/Hour]', 86800, 10, 5000, 'Speed: 1K/Hour\nLOW QUALITY\n', 'custom_comments', '0', '', 'jumlah pesan rata rata 13 waktu proses 8 hari  9 jam  8   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(364, 'Medan', 2699, 'Tiktok Comments ', 'Tiktok Komentar [ 3 HQ Random Komentar ] [Start Time: 0-1 Hour]  Real and Active', 2820, 1000, 1000, 'Pesan Jumlah 1000 anda mendapat kan 3 komentar\nbukan order 1000 dapat 1000 komentar!\nHQ & Active Accounts\nkomentar sesuai dengan video konten mu', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 13 jam 25 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(365, 'Medan', 2701, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers MDN 1 [ Refill 365D ] [ Max 500k ] ', 6000, 10, 500000, 'Max 500k\n', 'primary', '0', '', 'jumlah pesan rata rata 563 waktu proses 1 jam 15 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(366, 'Medan', 2702, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 5 LessDrop [ Refill 30D ] [ 10-15K/Day] ', 5540, 10, 100000, 'Start Time: 0-1 Hour', 'primary', '0', '', 'jumlah pesan rata rata 1.116 waktu proses 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(367, 'Medan', 2703, 'Youtube View Target Negara', 'Youtube views Refill 90 days [ Indonesia ] [Speed: 200-1000/Day] ', 58660, 500, 100000, 'Targeted RAV - Real Active Views*\n100% Real Human Active YouTube Watch Page Views\nINSTANT START - 200-1000 / Day\nWatch Page Views - Monetizable!\nRandom Retention\nStable NON-DROP Views with 90 Days Refill Guarantee**\nWorld-Wide Views Added in a NON-STOP Natural Pattern\nMust be Unrestricted & Open for ALL countries\nOK for VEVO\nCancel any Time with Full/Partial Refund\nviews can be send to embed disabled video (including videos that live-streamed or premiered in the past)\nTraffic Sources: Direct Advertisement\n\n* views may include real user engagements - your video may get some daily likes/dislikes, comments, shares, subscribers\nall made by real YouTube users that we do not control!\n** If views added from external non-organic sources your guarantee may be revoked!\n* daily speeds vary by country and load', 'primary', '0', '', 'jumlah pesan rata rata 1.040 waktu proses 2 hari  5 jam  2   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(368, 'Medan', 2704, 'Youtube View Target Negara', 'Youtube views Refill 90 days [ Francis ] [Speed: 200-1000/Day] ', 58660, 500, 100000, 'Targeted RAV - Real Active Views*\n100% Real Human Active YouTube Watch Page Views\nINSTANT START - 200-1000 / Day\nWatch Page Views - Monetizable!\nRandom Retention\nStable NON-DROP Views with 90 Days Refill Guarantee**\nWorld-Wide Views Added in a NON-STOP Natural Pattern\nMust be Unrestricted & Open for ALL countries\nOK for VEVO\nCancel any Time with Full/Partial Refund\nviews can be send to embed disabled video (including videos that live-streamed or premiered in the past)\nTraffic Sources: Direct Advertisement\n\n* views may include real user engagements - your video may get some daily likes/dislikes, comments, shares, subscribers\nall made by real YouTube users that we do not control!\n** If views added from external non-organic sources your guarantee may be revoked!\n* daily speeds vary by country and load', 'primary', '0', '', 'jumlah pesan rata rata 550 waktu proses 2 hari  19 jam  11   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(369, 'Medan', 2705, 'Youtube View Target Negara', 'Youtube views Refill 90 days [ Spanyol ] [Speed: 200-1000/Day] ', 58660, 500, 100000, 'Targeted RAV - Real Active Views*\n100% Real Human Active YouTube Watch Page Views\nINSTANT START - 200-1000 / Day\nWatch Page Views - Monetizable!\nRandom Retention\nStable NON-DROP Views with 90 Days Refill Guarantee**\nWorld-Wide Views Added in a NON-STOP Natural Pattern\nMust be Unrestricted & Open for ALL countries\nOK for VEVO\nCancel any Time with Full/Partial Refund\nviews can be send to embed disabled video (including videos that live-streamed or premiered in the past)\nTraffic Sources: Direct Advertisement\n\n* views may include real user engagements - your video may get some daily likes/dislikes, comments, shares, subscribers\nall made by real YouTube users that we do not control!\n** If views added from external non-organic sources your guarantee may be revoked!\n* daily speeds vary by country and load', 'primary', '0', '', 'jumlah pesan rata rata 800 waktu proses 2 hari  4 jam  36   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(370, 'Medan', 2706, 'Youtube Subscribers Negara', 'Youtube Subscribe [ INDONESIA ] [ LIFETIME GUARANTEE ]', 278790, 50, 10000, 'Max 20k', 'primary', '0', '', 'jumlah pesan rata rata 126 waktu proses 18 jam 18 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(371, 'Medan', 2707, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  16 [  INDONESIA ][ LIFETIME GUARANTEE ] Instant ', 26240, 10, 20000, 'Max 20k', 'primary', '0', '', 'jumlah pesan rata rata 94 waktu proses 14 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(372, 'Medan', 2714, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 150 Minutes Live CONCURRENT ] [ Latest Service ] ', 653800, 100, 35000, '150 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 640 waktu proses 1 hari  12 jam  11   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(373, 'Medan', 2718, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]', 'YouTube Live Stream [ 24 Hour Live CONCURRENT ] [ Latest Service ] ', 1561750, 100, 35000, '24 Hour Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(374, 'Medan', 2719, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [Mix] ', 1330, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- Users from all over the world with full profile pictures\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', 'jumlah pesan rata rata 15 waktu proses 14 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(375, 'Medan', 2720, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [USA] ', 1330, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from USA with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', 'jumlah pesan rata rata 114 waktu proses 16 jam 55 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(376, 'Medan', 2721, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [INDIA] ', 1330, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from India with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', 'jumlah pesan rata rata 29 waktu proses 12 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(377, 'Medan', 2722, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [SOUTH KOREA] ', 1330, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from South Korea with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(378, 'Medan', 2723, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [VIETNAM] ', 1330, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from Vietnam with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'custom_comments', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(379, 'Medan', 2724, 'Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]', 'Youtube Live Chat Custom Comments [Live Stream / Premiere / Video Waiting To Be Published] [ARAB] ', 1330, 5, 10000, '*This service applies to Live Streaming, Premieres and Video Waiting To Be Published.\n\n- Start time: 0-5 minutes\n- Time for each comment to appear 25-35 seconds apart\n- User from Arabs with full profile picture\n\nLink format:\n+ https://www.youtube.com/watch?v=xxx\n+ https://youtu.be/xxx\nNote:\n- Live streaming with no age or country restrictions.\n- The service will not warrant for orders containing Spam keywords or violating the terms from Youtube (18+, gambling, fraud, ...)', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(380, 'Medan', 2726, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 15 Minutes Live CONCURRENT ] [ Latest Service ] WORK', 34030, 100, 20000, '15 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 248 waktu proses 38 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(381, 'Medan', 2727, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 30 Minutes Live CONCURRENT ] [ Latest Service ] WORK ', 39210, 100, 20000, '30 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 587 waktu proses 42 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(382, 'Medan', 2728, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 60 Minutes Live CONCURRENT ] [ Latest Service ] WORK ', 76580, 100, 20000, '60 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 562 waktu proses 1 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(383, 'Medan', 2729, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 90 Minutes Live CONCURRENT ] [ Latest Service ] WORK ', 112950, 100, 20000, '90 Minutes Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 487 waktu proses 2 hari  18 jam  10   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(384, 'Medan', 2730, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 2 hours Live CONCURRENT ] [ Latest Service ] WORK ', 153680, 100, 20000, '2 hours Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 370 waktu proses 2 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(385, 'Medan', 2731, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 3 hours Live CONCURRENT ] [ Latest Service ] WORK ', 226250, 100, 20000, '3 hours Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 291 waktu proses 3 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(386, 'Medan', 2732, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 6 hours Live CONCURRENT ] [ Latest Service ] WORK ', 441780, 100, 20000, '6 Hours Live CONCURRENT', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 6 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(387, 'Medan', 2733, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 12 hours Live CONCURRENT ] [ Latest Service ] WORK ', 910320, 100, 20000, '12 Hours Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(388, 'Medan', 2734, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]', 'YouTube Live Stream [ 24 hours Live CONCURRENT ] [ Latest Service ] WORK ', 1783910, 100, 20000, '24 hours Live CONCURRENT', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(389, 'Medan', 2737, 'Instagram Likes', 'Instagram Likes S11 [ REAL ] ', 500, 100, 100000, '0-6 hours\nFast after start {200k/day}\nNo Refill/refund \nMixed\nkemungkinan drop 50%', 'primary', '0', '', 'jumlah pesan rata rata 702 waktu proses 3 jam 57 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(390, 'Medan', 2739, 'Twitter Followers', 'Twitter Followers Server 26 [ REFILL 30 DAYS ] [ 25k/day ] ', 33940, 200, 50000, 'Instant\n20k-50k/day\nREFILL 30 DAYS\nLess Drop', 'primary', '0', '', 'jumlah pesan rata rata 318 waktu proses 1 hari  10 jam  28   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(391, 'Medan', 2740, 'Instagram Likes', 'Instagram Likes S12 [Refill 180 Days] [Max 50K] [5K/Day] ', 870, 10, 250000, 'Start Time: 1 Hour\nSpeed 5K/Day', 'primary', '0', '', 'jumlah pesan rata rata 2.869 waktu proses 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(392, 'Medan', 2741, 'Instagram Likes', 'Instagram Likes S13 [ Lifetime Guaranteed ] [ Real Mixed ] [5K/Day] ', 1500, 10, 20000, 'Real Mixed\n10k/days', 'primary', '1', '30', 'jumlah pesan rata rata 945 waktu proses 1 jam 11 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(393, 'Medan', 2742, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [ NEW service ] [ 15 - 60 MInutes ] ', 41030, 1000, 10000000, '- START : Instant\n- MONETIZABLE | REAL\n- 100% Real Human YouTube Users Viewers\n- 100% Unique Traffic\n- World-Wide Viewers\n- Avg Concurrent and watch-time based on live stream content\n- Video must Unrestricted , embed must enabled\nNOTE :\n- To get fast speed, Please order same link/same times ( x5 ,x10 times )\n- Cant refund after order\n- Views are spread over the time to deliver live viewers so that they stay for atleast 15 mins - 1H\nEx : You order 1000 views, then ,1000 live viewers will spread over the time in 15 mins - 1H+.', 'primary', '1', '', 'jumlah pesan rata rata 1.502 waktu proses 1 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(394, 'Medan', 2743, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ Working ] [ NEW service ] [REAL]', 10120, 1000, 1000000, 'Pemirsa WW Penampil Nyata\nBiasanya bisa mendapatkan engagements yang baik\nDurasi minimum siaran langsung adalah 10 menit\nKecepatan: 30\' Untuk Mencapai Jumlah yang Dipesan\nSemakin besar jumlah pesan, semakin baik jumlah view nya\n\nANDA MEMESAN UNTUK JUMLAH TOTAL TAYANGAN LANGSUNG, DAN BUKAN JUmlah TAYANGAN LANGSUNG BERSAMAAN.\nCONTOH: jika Anda memesan 1K, Anda akan mendapatkan sekitar 50 tampilan selama 30 menit (jumlah total tampilan adalah 1K)\ncontoh : https://prnt.sc/8HUkVmmdHx9Q', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 17 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(395, 'Medan', 2744, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ NEW service ] [REAL] INSTANT', 29280, 1000, 1000000, 'Mulai: INSTAN\nKecepatan: Cepat\nIsi ulang: Tidak ada isi ulang\n\nRetensi: Random\nKualitas: 100% Nyata\nCatatan:\n- Jika Live End, Video Dihapus, Video Pribadi, atau Dihapus oleh youtube - Tidak Ada Pengembalian Dana/ Tidak Ada Partial.\n- Silakan memesan tautan yang sama / waktu yang sama ( per 1 - 3 kali ) , Interval (menit) 1-3) untuk mendapatkan kecepatan cepat.\n- Kami tidak dapat menjamin total waktu tonton atau jumlah penonton serentak hanya total penayangan unik yang dikirim selama kampanye. \nTampilan tersebar dari waktu ke waktu untuk menghadirkan pemirsa langsung sehingga mereka bertahan setidaknya selama 15 menit - 2 jam tergantung jumlah pesanan', 'primary', '0', '', 'jumlah pesan rata rata 1.200 waktu proses 11 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(396, 'Medan', 2745, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ NEW service ] [REAL] Active Live Stream', 56290, 1000, 100000, 'Mulai: INSTAN\nKecepatan: Cepat\nIsi ulang: Tidak ada isi ulang\n\nRAV - Tampilan Aktif Nyata** 100% Penonton Pengguna YouTube Manusia !\n Tampilan Halaman Tonton Desktop & Seluler Windows\n 100% Lalu Lintas Unik yang dapat dimonetisasi!\n Pemirsa Seluruh Dunia\n Video harus Tidak Dibatasi & Terbuka untuk SEMUA negara\n Retensi Random (berdasarkan minat pemirsa pada streaming langsung!)\n Rata-Rata Serentak dan waktu tonton didasarkan pada konten streaming langsung\n Batalkan kapan saja dengan Pengembalian Dana Penuh/Sebagian\n Over-Pengiriman Dijamin\n penayangan dapat dikirimkan ke video streaming langsung yang disematkan yang dinonaktifkan\n Sumber Lalu Lintas: Iklan Langsung\n\n\n*Layanan yang ditawarkan apa adanya tanpa jaminan isi ulang/pengembalian uang!\n** Penayangan streaming langsung dapat mencakup keterlibatan pengguna nyata - video Anda mungkin mendapatkan beberapa suka/tidak suka harian, komentar obrolan, bagikan, pelanggan\nsemua dibuat oleh pengguna YouTube nyata yang tidak kami kendalikan!\n*** penayangan streaming langsung akan terdaftar sebagai pemutaran pada statistik streaming langsung (YouTube Studio), tetapi mungkin tidak terdaftar secara penuh pada versi rekaman offline \'biasa\' dari statistik video.\nkami tidak dapat memberikan total waktu tonton atau jumlah penonton serentak hanya dari total penayangan unik yang dikirim selama kampanye.\n\nhttps://i.gyazo.com/254bce6afe96bd5149fd290c06bbec94.png\nhttps://i.gyazo.com/9f78659c94df658ba6b56344ae540bf2.png\nhttps://i.gyazo.com/610ea2c7078ae94d3a439969f0e93d15.png\n(Gambar yang ditampilkan hanya untuk tujuan ilustrasi. Produk yang sebenarnya mungkin berbeda karena peningkatan produk)', 'primary', '0', '', 'jumlah pesan rata rata 1.500 waktu proses 1 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(397, 'Medan', 2748, 'Telegram', 'Telegram - Channnel Members/Group Server 14 [ 100K ] Garansi 1 TAHUN', 18780, 100, 100000, '70k-100k/day\nNO DROP\nKALO DROP TINGGAL MINTA REFILL DI TIKET\nINSTAN', 'primary', '0', '', 'jumlah pesan rata rata 8.159 waktu proses 6 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(398, 'Medan', 2749, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 6  [ Refill 30D ] [ FAST ] [ Real Engaging Followers ]', 5640, 10, 50000, '10k/d', 'primary', '1', '30', 'jumlah pesan rata rata 1.228 waktu proses 1 jam 20 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(399, 'Medan', 2750, 'TikTok  share', 'TIKTOK Share  8 [ Speed 50K/day ] ', 3370, 100, 2000000, 'Speed 50K/day', 'primary', '0', '', 'jumlah pesan rata rata 435 waktu proses 22 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(400, 'Medan', 2752, 'TikTok Story', 'TikTok Story Likes  [ Max 30K ]  [ Day 10K ]', 4580, 50, 30000, '[ Max 30K ]  [ Day 10K ]', 'primary', '0', '', 'jumlah pesan rata rata 291 waktu proses 58 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(401, 'Medan', 2753, 'TikTok Story', 'TikTok Story Views [ Max 30K ] [ Day 10K ] [ All Stories ]', 4580, 100, 30000, '[ Max 30K ] [ Day 10K ] [ All Stories ]', 'primary', '0', '', 'jumlah pesan rata rata 328 waktu proses 6 hari  20 jam  21   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(402, 'Medan', 2754, 'TikTok Story', 'TikTok Story Views [ Max 30K ] [ Day 10K ] ', 4580, 100, 30000, '[ Max 30K ] [ Day 10K ]', 'primary', '0', '', 'jumlah pesan rata rata 415 waktu proses 2 hari  10 jam  28   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(403, 'Medan', 2755, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S77 [ Real Mixed ] [ 50K/day ] [ R60 ]', 3460, 10, 100000, '50k/day\nLess Drop\nMixed Quality\nR30 [ button ]', 'primary', '1', '30', 'jumlah pesan rata rata 987 waktu proses 31 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(404, 'Medan', 2756, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 7 [ Refill 15days] [ HQ ] ', 2570, 20, 50000, '0-3h Start\nReal Mixed\n2-5k/day\n10-20% drop', 'primary', '1', '15', 'jumlah pesan rata rata 1.206 waktu proses 19 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(405, 'Medan', 2759, 'Youtube View  [ untuk monetisasi - penghasil duit ]', 'Youtube views untuk penambah Adsense [NO DROP] [FULL ENGAGEMENT] [Speed: 50K/Day]', 27410, 10000, 100000000, 'View Bisa Menghasilkan Pendapatan $9 dari 20k View yang kamu pesan. ( jika konten videonya bagus)\n\nKualitas Views :-\n. Retensi: Bergantung pada Konten\n. Sumber: Pengguna asli, Metode Organik - Iklan dari berbagai sumber\n. Negara: Seluruh Dunia\n. Istimewa: Penayangan Juga Akan Menghasilkan Pendapatan (Jika Berlaku).\n\nCatatan Layanan:-\n. Waktu mulai: 12 - 36 jam (untuk persetujuan Iklan)\n. Isi Ulang Hari: 30 Hari\n. Rasio Penurunan: Nol Penurunan\n. Kecepatan: 50K - 250K/Hari\n\nCATATAN:-\n1) Pengguna nyata (Anda akan mendapatkan keterlibatan)\n2) Zero Drop For Fresh Videos\n3) Suka/Tidak Suka + Tampilan + Komentar + Pelanggan (Tergantung pada Konten video dan jumlah yang dipesan)\n4) Tidak ada batasan panjang video (Semua Durasi Didukung)\n5) Tidak ada batasan untuk Konten video (Konten dewasa TIDAK Diizinkan)\n6) Tampilan Akan Menghasilkan Pendapatan.\n7) Waktu tonton akan dihitung untuk monetisasi', 'primary', '0', '', 'jumlah pesan rata rata 15.000 waktu proses 1 hari  14 jam  51   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(406, 'Medan', 2760, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers MDN 2 [ Refill 365D ] [ Max 1M ] [ REAL ] Non Drop', 5770, 50, 1000000, '50k/days\nyg follow akun lama bukan akun baru\nSangat minim drop, jika drop kemungkinan update ig', 'primary', '1', '30', 'jumlah pesan rata rata 1.893 waktu proses 38 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(407, 'Medan', 2761, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers MDN 3 [ Refill 365D ] [ Max 1M ] [ 10% interaction ] [ HQ ] ♻️', 6650, 50, 1000000, 'Days 50K\nbutton refill 30days di riwayat order\nkemungkinan besar ada 10% interaction diakunmu\nSangat minim drop, jika drop kemungkinan update ig\nHQ\n\nkemungkinan order 1000 mendapat hanya 900 followers\nanda bisa minta refill setelah 24 jam pesanan sukses', 'primary', '1', '30', 'jumlah pesan rata rata 1.260 waktu proses 1 jam 39 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(408, 'Medan', 2762, 'YouTube Shorts', 'Youtube Short Views Server 5  [Refill Lifetime] [Start Time:0 -24 Hours] [Speed: 60K/Day] ', 12890, 100, 50000000, 'Max 5M', 'primary', '0', '', 'jumlah pesan rata rata 2.430 waktu proses 19 jam 34 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(409, 'Medan', 2763, 'YouTube Shorts', 'Youtube Short Views Server 6 [Refill Lifetime] [Start Time: 0 - 6 Hours] [Speed: 400K/Day] ', 21300, 25000, 2147483647, 'Speed: 400K/Day', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(410, 'Medan', 2766, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  17 [ R30 ][ 2-3k/day ]  LESSDROP', 17890, 50, 100000, '0-6h Start\nR30\nSpeed - 2-3k/d\nDrop 1-3%', 'primary', '0', '', 'jumlah pesan rata rata 126 waktu proses 2 jam 38 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47');
INSERT INTO `smm` (`id`, `provider`, `service`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(411, 'Medan', 2767, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  18 [ R30 ][ 40k/day ] Nondrop', 17180, 20, 100000, '30D refill\nfast server', 'primary', '0', '', 'jumlah pesan rata rata 189 waktu proses 12 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(412, 'Medan', 2774, 'Facebook Followers / Friends', 'Facebook Follower Profile  16 [ Refill 90days ] Less drop', 25240, 1000, 200000, '1k/d', 'primary', '0', '', 'jumlah pesan rata rata 1.113 waktu proses 1 hari  11 jam  53   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(413, 'Medan', 2776, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 30 Minutes Live CONCURRENT ]', 55720, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 150 waktu proses 39 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(414, 'Medan', 2777, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 60 Minutes Live CONCURRENT ] ', 121230, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 190 waktu proses 1 jam 11 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(415, 'Medan', 2778, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 90 Minutes Live CONCURRENT ] ', 183380, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 180 waktu proses 1 jam 41 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(416, 'Medan', 2779, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 120 Minutes Live CONCURRENT ] ', 244010, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 190 waktu proses 2 jam 12 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(417, 'Medan', 2780, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 3 Hours Live CONCURRENT ] ', 363060, 100, 200, 'Start in 5 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 3 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(418, 'Medan', 2781, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 6 Hours Live CONCURRENT ] ', 674720, 100, 200, 'Start in 10 Minutes\n1000 Live Orders will Get 900-1000 Live Stream Viewers', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 4 hari  20 jam  48   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(419, 'Medan', 2782, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 12 Hours Live CONCURRENT ] ', 2944620, 100, 200, 'Start in 5 Minutes\n1000 Live Order will Get 900-1000 Live Stream Viewer', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 2 hari  19 jam  24   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(420, 'Medan', 2783, 'YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 3 [ work ] ', 'YouTube Live Stream Views [ max 200 ] [ 24 Hours Live CONCURRENT ] ', 6052430, 100, 200, '1000 Live Order will Get 900-1000 Live Stream Viewer\nStart in 5 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 44 hari  2 jam  53   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(421, 'Medan', 2784, 'Facebook Group Member', 'Facebook Group Member Server 5 [ 7 Days Refill ] 500-1K/hari ', 11250, 1000, 500000, '0-1hr\n1k/day\n7 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 1.640 waktu proses 11 jam 4 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(422, 'Medan', 2786, 'Facebook Followers / Friends', 'Facebook Follower Profile  18 [ Refill 30 Days ] ', 31240, 1000, 100000, 'Speed: 20K/Day\nStart Time: 0-2 Hours', 'primary', '0', '', 'jumlah pesan rata rata 1.300 waktu proses 1 hari  3 jam  16   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(423, 'Medan', 2790, 'TikTok Followers', 'TIKTOK FOLLOWERS Server 22 [ 100/day ] [ Lifetime guaranteed ]', 39500, 20, 100000, 'Lifetime guaranteed\nwaktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 658 waktu proses 37 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(424, 'Medan', 2795, 'Youtube Views', 'Youtube Views S14 [ Non Drop ] [ Life Time Guarantee ] 1K/Day ', 10710, 100, 500000, 'Instant\n1k-2k/Day\n 0-1min retention\nfrom internal YouTube source + 3-4?ditional likes]\n 0-5% drops', 'primary', '0', '', 'jumlah pesan rata rata 992 waktu proses 11 jam 40 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(425, 'Medan', 2796, 'Youtube Subscribers [ No Refill ]', 'Youtube Subscribe  No Refill 1  [ TERMURAH ]', 8570, 10, 20000, 'min 10\nmax 20k', 'primary', '0', '', 'jumlah pesan rata rata 630 waktu proses 3 hari  5 jam  53   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(426, 'Medan', 2798, 'Instagram Views', 'instagram view Server 1 [ Max - 10Juta ] TERMURAH', 380, 100, 10000000, 'waktu mulai 0-60 Minutes', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 23 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(427, 'Medan', 2801, 'TikTok Likes', 'TIKTOK Likes Server 22 [ Refill 30 Days ] HQ', 8400, 100, 100000, 'waktu mulai 6-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 565 waktu proses 3 jam 11 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(428, 'Medan', 2803, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  20 [ NO refill ] [ 5k/day ]', 14200, 50, 500000, 'Instan\n5k/days', 'primary', '0', '', 'jumlah pesan rata rata 126 waktu proses 13 jam 57 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(429, 'Medan', 2804, 'Youtube Subscribers', 'Youtube Subscribe S12 [ 90 days refill ] [ 1000/day ] [ Non drop ] TERMURAH DIKELASNYA', 136100, 50, 10000, '1000/day\n90 days refill', 'primary', '0', '', 'jumlah pesan rata rata 569 waktu proses 1 hari  7 jam  56   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(430, 'Medan', 2806, 'TikTok Likes', 'TIKTOK Likes Server 24 [ Refill 30 Days ] HQ REAL', 21210, 10, 50000, '2K/Day', 'primary', '0', '', 'jumlah pesan rata rata 10 waktu proses 7 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(431, 'Medan', 2808, 'Instagram Likes', 'Instagram Likes S15 [ AUTO REFILL 30 DAYS ] [ FAST ] [ Start Time: 0 -1 Hours ] ', 1960, 10, 50000, 'HQ', 'primary', '0', '', 'jumlah pesan rata rata 316 waktu proses 15 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(432, 'Medan', 2813, 'Instagram Views', 'instagram view Server 2 [ Max - 10Juta ] Instant FAST ', 180, 100, 10000000, 'Instant!', 'primary', '0', '', 'jumlah pesan rata rata 4.750 waktu proses 5 jam 56 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(433, 'Medan', 2814, 'Instagram AUTO LIKE INDONESIA', 'Instagram Auto Likes Indonesia [MAX 1K] [DURASI 30 HARI] [MAX POST 30]  INSTANT', 200000, 100, 1000, 'IMPRESSION + REACH + PROFILE VISIT\nTarget : Username akun Instagram\nPastikan Akun Instagram tidak private dan pembatasan usia\nCatatan : Setiap Anda upload postingan, maka Anda akan mendapatkan Likes Indonesia sesuai jumlah pesan selama 30 hari\nMaksimal 30 postingan per-bulan\nJika Auto Likes tidak bekerja dalam 24 jam maka bisa buat Tiket', 'primary', '0', '', 'jumlah pesan rata rata 270 waktu proses 41 hari  5 jam  58   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(434, 'Medan', 2815, 'Instagram AUTO LIKE INDONESIA', 'Instagram Auto Likes Indonesia [MAX 1K] [DURASI 30 HARI] [MAX POST 150]  INSTANT', 1250000, 100, 1000, 'IMPRESSION + REACH + PROFILE VISIT\nTarget : Username akun Instagram\nPastikan Akun Instagram tidak private dan pembatasan usia\nCatatan : Setiap Anda upload postingan, maka Anda akan mendapatkan Likes Indonesia sesuai jumlah pesan selama 30 hari\nMaksimal 150 postingan per-bulan\nJika Auto Likes tidak bekerja dalam 24 jam maka bisa buat Tiket', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(435, 'Medan', 2816, 'TikTok Likes', 'TIKTOK Likes Server 27 [ No refill ] [ FAST ] BONUS++', 5870, 100, 10000, 'tidak ada garansi\nbonus bisa 10-50% tergantung hoki/no kompline jika gk ada bonus dapat\n', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 59 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(436, 'Medan', 2817, 'TikTok Likes', 'TIKTOK Likes Server 28 [ No refill ] [ SUPERFAST EMERGENCY ]', 11700, 100, 15000, 'EMERGENCY', 'primary', '0', '', 'jumlah pesan rata rata 905 waktu proses 3 jam 40 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(437, 'Medan', 2820, 'Youtube Views', 'Youtube Views S15 [ Good Service ] [ Refill 30days ]', 31080, 3000, 700000, '50k/day', 'primary', '0', '', 'jumlah pesan rata rata 4.650 waktu proses 21 jam 5 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(438, 'Medan', 2821, 'Youtube Views', 'Youtube Views S16 [ Good Service ] [ Refill 30days ][Non Drop]', 17510, 10000, 1000000000, 'always work\n50k-100k/days', 'primary', '0', '', 'jumlah pesan rata rata 10.001 waktu proses 1 hari  21 jam  0   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(439, 'Medan', 2822, 'Youtube View Target Negara', 'Youtube views Refill 30 days [ Indonesia ] [Speed: 10k/Day] ', 31510, 1000, 1000000, 'waktu mulai 0-12 jam', 'primary', '0', '', 'jumlah pesan rata rata 1.042 waktu proses 6 hari  13 jam  16   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(440, 'Medan', 2823, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  21 [ INDONESIA ][ R30 ] Instant ', 17420, 10, 50000, '20k/days\n', 'primary', '0', '', 'jumlah pesan rata rata 140 waktu proses 33 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(441, 'Medan', 2824, 'Instagram Followers [guaranteed]', 'Instagram Followers Server 8 [ Refill 30D ] [ 10k/day ] ', 2360, 10, 15000, 'drop bisa 20--50%\nwaktu mulai 0-3 jam', 'primary', '1', '30', 'jumlah pesan rata rata 990 waktu proses 1 jam 22 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(442, 'Medan', 2825, 'Facebook Followers / Friends', 'Facebook Follower Profile  19 [ Refill 30 Days ] [ start 0 - 6Hours ]', 22620, 1000, 100000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 1.125 waktu proses 1 hari  9 jam  7   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(443, 'Medan', 2826, 'TikTok Likes', 'TIKTOK Likes Server 29 [ No refill ] [ EMERGENCY KE 2 ] ', 9100, 100, 50000, 'EMERGENCY', 'primary', '0', '', 'jumlah pesan rata rata 314 waktu proses 2 jam 33 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(444, 'Medan', 2829, 'Facebook Page Likes & Page Followers', 'Facebook Page Followers Server 2 [ No refill ] [ 500/Day ] ', 19620, 500, 500000, '500/Day', 'primary', '0', '', 'jumlah pesan rata rata 1.280 waktu proses 1 hari  8 jam  34   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(445, 'Medan', 2830, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes [ S 12 ] [ Refill 30days ] [ Start 1 Hour ] Real ', 103000, 500, 50000, '10K/Day', 'primary', '0', '0', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(446, 'Medan', 2834, '- PROMO - ON OFF', 'Tiktok SHARE PROMO 1 [ TERMURAH ] ', 1100, 100, 50000000, 'NOKOMPLINE', 'primary', '0', '', 'jumlah pesan rata rata 240 waktu proses 16 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(447, 'Medan', 2837, 'Instagram Story Views', 'Instagram - Story Views S4 All Story Views CHEAP', 60, 10, 1000000, 'All Stories View\nkadang gk masuk full\ntidak ada kompline', 'primary', '0', '', 'jumlah pesan rata rata 8.898 waktu proses 5 jam 7 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(448, 'Medan', 2838, 'Instagram Story Views', 'Instagram Story Views S4 [ BEST ]  All Story Views', 1220, 100, 35000, '10k/day', 'primary', '0', '', 'jumlah pesan rata rata 400 waktu proses 5 jam 16 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(449, 'Medan', 2839, 'Youtube Views', 'Youtube Views S18 [ HR ] [ 30 DAYS REFILL ]  Retention 2 - 5 Mins', 30810, 1000, 100000000, '- Start Time : Instant\n- Speed : 50k/day\n- Retention : 2-5 minutes\n- Min/Max : 1000/10M\n- Guarantee: 30 days Refill\n- Source : External\n- Device : Mobile phone\n- Real user\n- Country : Global', 'primary', '0', '', 'jumlah pesan rata rata 1.110 waktu proses 10 jam 58 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(450, 'Medan', 2843, 'Youtube Subscribers', 'Youtube Subscribe S13 [ 30 days refill ] [ 500-2k/days ] ', 77720, 100, 120000, 'Start: Instant - 0 hrs\nSpeed: 500-2k/day\nRefill: 30 days\n\nDrop: 0- 5% drop.', 'primary', '0', '', 'jumlah pesan rata rata 405 waktu proses 1 hari  10 jam  46   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(451, 'Medan', 2845, 'TikTok Likes', 'TIKTOK Likes Server 32 [ 30 refill days] [ 3k/day ]', 7700, 100, 500000, '3k/day', 'primary', '0', '', 'jumlah pesan rata rata 300 waktu proses 2 jam 31 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(452, 'Medan', 2846, 'TikTok Likes', 'TIKTOK Likes Server 33 [ 30 refill days] [ 5k/days ] Best seller', 6820, 100, 100000, '5k/days\nRefill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 705 waktu proses 2 jam 14 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(453, 'Medan', 2848, 'Youtube Views', 'Youtube Views S19 [ HR ] [ 30 DAYS REFILL ] [ 40k+/day ] Retention 3 - 7 Mins ', 28770, 1000, 2000000, 'Retention 3-7 Minutes\n40k+/day', 'primary', '0', '', 'jumlah pesan rata rata 1.192 waktu proses 16 jam 59 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(454, 'Medan', 2849, 'Youtube Views', 'Youtube Views S20 [ 30 DAYS REFILL ] [ Speed 20k - 300k/day ]  [ Non Drop ]', 20710, 10000, 1000000000, 'Speed. : 500k-700k/day\nSource: external + suggested\nDrop: No Drop\nRefill : 30 days\nStart Time : 0-5hr', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(455, 'Medan', 2851, 'TikTok Likes', 'TIKTOK Likes Server 35 [ No refill] [ 100-300/days ] REAL ( LAGI SLOW BANGET )', 4540, 100, 1000000, 'REAL\nSEMENTARA LAYANAN TIDAK DI REKOMENDASIKAN\nPROSES BISA Berminggu minggu', 'primary', '0', '', 'jumlah pesan rata rata 772 waktu proses 4 jam 31 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(456, 'Medan', 2852, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S28 [ NO Refill ] [ max db 5k ] Real ', 23000, 100, 500, 'Real', 'primary', '0', '', 'jumlah pesan rata rata 267 waktu proses 14 jam 14 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(457, 'Medan', 2856, 'TikTok View', 'TIKTOK View 3 [ Trending + viral views]', 370, 100, 10000000, '100% Real Engaging TikTok Views\nTiktok Trending Views\nHigh Chance to Get in Trend\nhttp://tiktok.com/trending\nPlace Big Order to Get in Trending.', 'primary', '0', '', 'jumlah pesan rata rata 7.543 waktu proses 10 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(458, 'Medan', 2857, 'Youtube Live Stream / Youtube Premiered Waiting', 'Youtube Live Stream Views [ NEW ] [ Viewers stay 3 jam ] ', 33000, 1000, 2000, 'Kualitas\nhttps://prnt.sc/vE5ukI0fa-5u\nhttps://prnt.sc/P2koX-ye_m_y\n\nkemungkinan besar view tidak masuk dalam itungan saat live selesai\nmulai 0-15 Menit Mulai (Dalam 15 menit jika tidak mulai, harap buat tiket dengan tangkapan layar)\n1000 = 100 Penonton selama 180 Menit/3jam, setelah itu mungkin turun.\nkamu order 1000 mendapatkan view 100\nkamu order 2000 mendapatkan view 200\nLive Streams are NON-REFUNDABLE and NO REFILL.\nEmbed Must Enable\nMobile links can delay', 'primary', '0', '', 'jumlah pesan rata rata 1.167 waktu proses 11 hari  15 jam  32   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(459, 'Medan', 2858, 'TikTok View', 'TIKTOK View 4 [ 500K/Day ] ', 340, 100, 50000000, 'waktu mulai 0-1jam\n500K/Day\n', 'primary', '0', '', 'jumlah pesan rata rata 1.189 waktu proses 1 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(460, 'Medan', 2862, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 15 Minutes Live CONCURRENT ] [ Latest Service ] P1', 79110, 100, 50000, 'YouTube Live Stream [ 15 Minutes Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', 'jumlah pesan rata rata 850 waktu proses 36 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(461, 'Medan', 2863, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 30 Minutes Live CONCURRENT ] [ Latest Service ] P1', 157920, 100, 50000, 'YouTube Live Stream [ 30 Minutes Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', 'jumlah pesan rata rata 950 waktu proses 36 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(462, 'Medan', 2864, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 60 Minutes Live CONCURRENT ] [ Latest Service ] P1 ', 296100, 100, 50000, 'YouTube Live Stream [ 60 Minutes Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', 'jumlah pesan rata rata 500 waktu proses 1 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(463, 'Medan', 2865, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 90 Minutes Live CONCURRENT ] [ Latest Service ] P1 ', 443320, 100, 50000, 'YouTube Live Stream [ 90 Minutes Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', 'jumlah pesan rata rata 377 waktu proses 1 jam 38 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(464, 'Medan', 2866, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 120 Minutes Live CONCURRENT ] [ Latest Service ] P1 ', 593710, 100, 50000, 'YouTube Live Stream [ 120 Minutes Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', 'jumlah pesan rata rata 373 waktu proses 2 jam 20 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(465, 'Medan', 2867, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 3 jam Live CONCURRENT ] [ Latest Service ] P1 ', 886630, 100, 50000, 'YouTube Live Stream [ 3 jam Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', 'jumlah pesan rata rata 325 waktu proses 6 hari  5 jam  4   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(466, 'Medan', 2868, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 6 jam Live CONCURRENT ] [ Latest Service ] P1 ', 1775290, 1000, 50000, 'YouTube Live Stream [ 6 jam Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(467, 'Medan', 2869, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 12 jam Live CONCURRENT ] [ Latest Service ] P1 ', 3551940, 100, 50000, 'YouTube Live Stream [ 12 jam Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(468, 'Medan', 2870, 'Youtube Live Stream / Youtube Premiered Waiting', 'YouTube Live Stream [ 24 jam Live CONCURRENT ] [ Latest Service ] P1', 7083720, 100, 50000, 'YouTube Live Stream [ 24 jam Live CONCURRENT ] [ Latest Service ] P1', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(469, 'Medan', 2871, 'Facebook Group Member', 'Facebook Group Member Server 6 [ NO Refill ] 3K/hari', 8540, 100, 5000000, '3K/hari', 'primary', '0', '', 'jumlah pesan rata rata 1.630 waktu proses 4 hari  14 jam  58   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(470, 'Medan', 2872, 'Instagram Views', 'instagram view Server 5 [ Max - 10Juta ] ', 180, 100, 10000000, 'waktu mulai 0-30menit', 'primary', '0', '', 'jumlah pesan rata rata 4.800 waktu proses 2 jam 51 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(471, 'Medan', 2874, 'Instagram Views', 'instagram view Server 6 [ fast cheap ] ', 180, 100, 10000000, 'fast', 'primary', '0', '', 'jumlah pesan rata rata 6.177 waktu proses 47 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(472, 'Medan', 2875, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  22 [ CHEAP ][ R30 ] ', 8650, 10, 50000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 59 waktu proses 14 jam 38 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(473, 'Medan', 2876, 'Youtube View Jam Tayang', 'Youtube Views S13 [ Jam Tayang ] [ Lifetime Refill ] [ BACA Deskripsi ] ', 51000, 500, 8000, 'Waktu Mulai: 0- 4 hari\nsetiap pesanan dari layanan ini membutuhkan waktu 10-15 hari untuk diselesaikan jika Anda ingin meminta 4000 jam, minta mereka tepat waktu untuk menyelesaikannya dalam waktu singkat, bukan meminta 1000 lalu langsung 1000\n5 menit+ video dan minimal 10-20 video di saluran\nCATATAN: - Masukkan LINK CHANNEL YOUTUBE\nJangan hapus atau jadikan video pribadi setelah [Tanpa Pengembalian Dana]\nJika Anda Memesan 1000, Anda Akan Mendapatkan 1000 Jam.\nTidak ada Pembatalan mungkin ada penurunan karena pembaruan youtube dan kami hanya mengisi ulang untuk menjadi stabil, no PARTIAL, hanya mengisi ulang/refill.', 'primary', '0', '', 'jumlah pesan rata rata 1.470 waktu proses 10 hari  14 jam  10   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(474, 'Medan', 2877, 'Youtube View Jam Tayang', 'Youtube Views S14 [ Jam Tayang ] [ Lifetime Refill ] [ BACA Deskripsi ] ', 51000, 500, 8000, 'Waktu Mulai: 0- 4 hari\nsetiap pesanan dari layanan ini membutuhkan waktu 10-15 hari untuk diselesaikan jika Anda ingin meminta 4000 jam, minta tepat waktu untuk menyelesaikannya dalam waktu singkat, bukan meminta 1000 lalu  langsung 1000\nGaransi: Lifetime Refill\nContoh: pesan 1000 = 1000 jam.\nSaluran harus memiliki lebih dari 5 video dari masing-masing  harus durasi lebih 2 menit.', 'primary', '0', '', 'jumlah pesan rata rata 1.703 waktu proses 12 hari  9 jam  22   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(475, 'Medan', 2878, 'Youtube View Jam Tayang', 'Youtube Views S15 [ Jam Tayang ] [ Refill 60 days  ] [ BACA Deskripsi ] ', 46000, 500, 8000, 'Waktu Mulai: 0- 4 hari\nsetiap pesanan dari layanan ini membutuhkan waktu 10-15 hari untuk diselesaikan jika Anda ingin meminta 4000 jam, minta mereka tepat waktu untuk menyelesaikannya dalam waktu singkat, bukan meminta 1000 langsung 1000\nmin durasi vdeo 5 menit dan jumlah video diusahakan  10-20 di chanel \nORDER LINK CHANNEL YOUTUBE\nJangan hapus atau jadikan video pribadi setelah order [ NO REFUND ]\nJika Anda Memesan 1000, Anda Akan Mendapatkan 1000 Jam.\nTidak ada layanan Pembatalan mungkin ada penurunan karena pembaruan youtube dan kami hanya mengisi ulang untuk menjadi stabil, NO PARTIAL, hanya mengisi ulang/refill.', 'primary', '0', '', 'jumlah pesan rata rata 1.157 waktu proses 12 hari  5 jam  7   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(476, 'Medan', 2879, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes [ S13 ] [ Refill 30days ] [ Start 24 Hour ] HQ', 59860, 500, 100000, 'contoh target https://mobile.facebook.com/blogtakin\njangan https://www.facebook.com/blogtakin\nsupport link lama hanya diubah aja', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 2 hari  1 jam  57   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(477, 'Medan', 2880, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes [ S14 ] [ Refill 7 days ] [ 3k/day ] ', 39220, 100, 100000, 'waktu mulai 0-24 jam', 'primary', '0', '', 'jumlah pesan rata rata 348 waktu proses 8 hari  20 jam  41   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(478, 'Medan', 2881, 'Facebook Page Likes & Page Followers', 'Facebook Page Likes + Followers Server 3 [ refill 7 days ] [ 5k/Day ]  non drop', 35000, 100, 500000, '5k/days\nwaktu mulai 0-6 jam\nnon drop', 'primary', '0', '', 'jumlah pesan rata rata 1.044 waktu proses 2 jam 2 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(479, 'Medan', 2882, 'Facebook Video Views', 'Facebook Video Views Server 5 [ Non Drop ] [Speed: 1M/Day]  [  Reels ]', 2500, 250, 10000000, 'Speed: 1M/Day\nno drop\ntapi jika terjadi drop, tidak ada garansi', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 10 jam 24 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(480, 'Medan', 2883, 'Facebook Video Views', 'Facebook Video Views Server 6 [ Refill 30days ] [Speed: 5k-20k/days ]', 12710, 500, 100000000, 'Refill 30days', 'primary', '0', '0', 'jumlah pesan rata rata 620 waktu proses 2 jam 13 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(481, 'Medan', 2896, 'TikTok Likes', 'TIKTOK Likes Server 36 [ No refill ] [ 1k/days ] ULTRAFAST', 7010, 100, 1000, 'ULTRAFAST', 'primary', '0', '', 'jumlah pesan rata rata 590 waktu proses 2 jam 54 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(482, 'Medan', 2897, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 33 [ Refill 365D ] [ Max 5M ] [ 10-20k per day ] ', 5260, 10, 5000000, '10-20k per day', 'primary', '0', '', 'jumlah pesan rata rata 6.850 waktu proses 1 jam 39 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(483, 'Medan', 2902, 'TikTok Followers', 'TikTok Followers Server 29 [ 5k-10k/day ] [ 30 days refill ][ HQ ] ', 41910, 10, 500000, 'instan\n10k/days', 'primary', '0', '', 'jumlah pesan rata rata 523 waktu proses 2 jam 2 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(484, 'Medan', 2903, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S78 [ LESS DROP ] [ R99 ]', 240, 10, 1000000, '99 days refill\n0-3% drop\n20-25k per day', 'primary', '1', '99', 'jumlah pesan rata rata 231 waktu proses 2 hari  8 jam  1   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(485, 'Medan', 2904, 'Twitter Tweet view', 'Twitter Tweet Views Server 1 [ Max 500K ] FAST', 60, 50, 500000, 'Max 500K\nwaktu mulai 0-30 menit', 'primary', '0', '', 'jumlah pesan rata rata 8.830 waktu proses 29 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(486, 'Medan', 2905, 'Twitter Tweet view', 'Twitter Tweet Views Server 2 [ Max 1M ] FAST', 210, 100, 1000000, 'Max 1M \nwaktu mulai 0-30 menit', 'primary', '0', '', 'jumlah pesan rata rata 8.891 waktu proses 18 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(487, 'Medan', 2906, 'Twitter Tweet view', 'Twitter Tweet Views Server 3 [ Max 20M ] FAST', 440, 10, 20000000, 'FAST\nwaktu mulai 0-60 menit', 'primary', '0', '', 'jumlah pesan rata rata 3.433 waktu proses 40 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(488, 'Medan', 2907, 'Twitter Views & Impressions', 'Twitter Views Video Server 5 [ FAST - Max 10M ]', 70, 20, 10000000, 'waktu mulai 0-15 menit\nNo refill', 'primary', '0', '', 'jumlah pesan rata rata 49.699 waktu proses 1 jam 50 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(489, 'Medan', 2908, 'TikTok View', 'TIKTOK View 9 [ TERMURAH]', 170, 100, 5000000, 'waktu mulai 0-30 menit', 'primary', '0', '', 'jumlah pesan rata rata 7.225 waktu proses 38 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(490, 'Medan', 2909, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 15 menit]', 86670, 100, 50000, 'Instan\nStay 15 mnt.\nView akan tetap selama periode waktu pemesanan\n100?ri volume pesanan dan penonton hadir\nKualitas: dengan avatar penonton\nJika waktu habis, itu akan berakhir. Jika waktunya belum habis, pemutusan bisa terus bertambah.', 'primary', '0', '', 'jumlah pesan rata rata 113 waktu proses 35 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(491, 'Medan', 2910, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 30menit] ', 170760, 100, 50000, 'Instan\nStay 30 mnt.\nView akan tetap selama periode waktu pemesanan\n100% volume pesanan dan penonton hadir\nKualitas: dengan avatar penonton\nJika waktu habis, itu akan berakhir. Jika waktunya belum habis, pemutusan bisa terus bertambah.', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 18 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(492, 'Medan', 2911, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 1 jam]', 317800, 100, 50000, 'Instan\nStay 1 jam.\nView akan tetap selama periode waktu pemesanan\n100% volume pesanan dan penonton hadir\nKualitas: dengan avatar penonton\nJika waktu habis, itu akan berakhir. Jika waktunya belum habis, pemutusan bisa terus bertambah.', 'primary', '0', '', 'jumlah pesan rata rata 115 waktu proses 37 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(493, 'Medan', 2912, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 2 jam]', 610310, 100, 50000, 'Instan\nStay 2 jam.\nView akan tetap selama periode waktu pemesanan\n100% volume pesanan dan penonton hadir\nKualitas: dengan avatar penonton\nJika waktu habis, itu akan berakhir. Jika waktunya belum habis, pemutusan bisa terus bertambah.', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 46 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(494, 'Medan', 2913, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 10K] [Start Time: INSTANT] [Stay: 3 jam]', 915560, 100, 50000, 'Instan\nStay  3 jam.\nView akan tetap selama periode waktu pemesanan\n100% volume pesanan dan penonton hadir\nKualitas: dengan avatar penonton\nJika waktu habis, itu akan berakhir. Jika waktunya belum habis, pemutusan bisa terus bertambah.', 'primary', '0', '', 'jumlah pesan rata rata 202 waktu proses 7 jam 16 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(495, 'Medan', 2914, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 10K] [Start Time: INSTANT] [Stay: 6 jam]', 1473400, 100, 100000, 'Instan\nStay 6 jam.\nView akan tetap selama periode waktu pemesanan\n100% volume pesanan dan penonton hadir\nKualitas: dengan avatar penonton\nJika waktu habis, itu akan berakhir. Jika waktunya belum habis, pemutusan bisa terus bertambah.', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 1 jam 9 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(496, 'Medan', 2918, 'Youtube Views', 'Youtube Views S21 [ NON DROP ] [ Speed 15k-20K/day ] [ Start Time : 0-5Min ] [ Lifetime Guaranteed ]', 15360, 100, 10000000, 'Start Time : 0-2 Minutes\nNon-Drop Server with Lifetime Guarantee\nSpeed 15k-20k/day ( speed sometimes Down Depending On Order Volume )\nRetention: 30-60 Sec\nSource: Direct/ Unknown + Suggested + external', 'primary', '0', '', 'jumlah pesan rata rata 966 waktu proses 10 jam 51 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(497, 'Medan', 2920, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 35 [ 30 days button, Lifetime Manual ] [ Max 100K ] MIX ASIAN REAL ACCOUNT', 5840, 10, 200000, '30 days button Lifetime Manual', 'primary', '1', '30', 'jumlah pesan rata rata 77 waktu proses 15 jam 12 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(498, 'Medan', 2922, 'Youtube Views', 'Youtube Views S23 [ NON DROP ] [ Speed 1k-2K/day ] [ min 100 ] [ Lifetime Guaranteed ] ', 12710, 100, 10000000, 'Waktu Mulai : 0-2 Menit\nNon-Drop, Server dengan Jaminan Seumur Hidup\nKecepatan 5k-6k/hari ( kecepatan terkadang Turun Tergantung Volume Pesanan )\nRetensi: 30-60 Detik\nSource: Direct/ Unknown + Suggested + external', 'primary', '0', '', 'jumlah pesan rata rata 1.212 waktu proses 15 jam 5 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(499, 'Medan', 2923, 'TikTok Likes', 'TIKTOK Likes Server 37 [Start Time: 0-1 Hour] [Speed: 1K/Day] [Refill 30 Days]', 8180, 100, 100000, 'From order for 1000 Likes, you will get 1000+ likes and in addition 1000 views to the selected post from the same accounts that have liked your post\n\nStart Time: Instant - 1Hours\nSpeed: 2K - 4K/Day\nRefill: 30 Days', 'primary', '0', '', 'jumlah pesan rata rata 310 waktu proses 1 jam 55 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(500, 'Medan', 2936, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia S29 [ NO DROP ]', 47000, 500, 1000, 'perhari 300-500\nproses 3-10 hari\nlapor jika drop!', 'primary', '0', '', 'jumlah pesan rata rata 550 waktu proses 5 hari  6 jam  23   menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(501, 'Medan', 2937, 'TikTok View', 'TIKTOK View 11 [ TERMURAH DUNIA ] 5M/days', 20, 100, 50000000, '5M/days', 'primary', '0', '', 'jumlah pesan rata rata 910 waktu proses 11 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(502, 'Medan', 2938, 'Facebook Page Likes & Page Followers', 'Facebook Page Followers Server 3 [ Lifetime refill ] [ 10K/Day ] ', 94290, 100, 100000, 'Lifetime\nStart Time: 0 - 1 Hours', 'primary', '0', '', 'jumlah pesan rata rata 763 waktu proses 5 jam 43 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(503, 'Medan', 2939, 'Facebook Page Likes & Page Followers', 'Facebook Page Followers Server 4 [ Lifetime refill ] [ 10K/Day ] [Start Time: 8 Hours]', 30780, 100, 10000, 'Real & Active Users', 'primary', '0', '', 'jumlah pesan rata rata 385 waktu proses 15 jam 59 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(504, 'Medan', 2940, 'Facebook Group Member', 'Facebook Group Member Server 7 [ Refill 30 Days ] [Start Time: 0 - 12 Hours] ', 11880, 100, 10000, 'Speed: 1K/Day', 'primary', '0', '', 'jumlah pesan rata rata 665 waktu proses 15 jam 6 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(505, 'Medan', 2943, 'Instagram Followers [ guaranteed 60 Hari - 99 Hari ] ', 'Instagram Followers Refill S79 [ Autorefill 45 days  ] [ R99days ] Best Quality', 9500, 100, 1000000, '30-50k/day\n5-10% drop maximum\nBest Quality\ndrop diatas 10% akan auto refill dalam 45days\nusahakan username gk panjang banget, karna buat delay masuknya', 'primary', '0', '', 'jumlah pesan rata rata 1.313 waktu proses 2 jam 58 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(506, 'Medan', 2944, '- PROMO - ON OFF', 'Instagram Followers PROMO 2 [ NO REFILL HIGH DROP ] ', 820, 100, 1000, 'NO REFILL HIGH DROP', 'primary', '0', '', 'jumlah pesan rata rata 650 waktu proses 7 jam 46 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(507, 'Medan', 2945, '- PROMO - ON OFF', 'Instagram Likes PROMO 1 [ NO DROP ] ', 380, 100, 3000, 'NO DROP TAPI KALO DROP TIDAK ADA GARANSI APAPUN!', 'primary', '0', '', 'jumlah pesan rata rata 210 waktu proses 20 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(508, 'Medan', 2946, 'Instagram Views', 'instagram view Server 7 [ fast MURAH ] ', 250, 100, 100000000, 'Start: 0 - 15 Min\n500K - 1M / Hour', 'primary', '0', '', 'jumlah pesan rata rata 1.500 waktu proses 39 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(509, 'Medan', 2948, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions Server 2 MURAH CEPAT REAL', 700, 100, 10000, 'REAL', 'primary', '0', '', 'jumlah pesan rata rata 1.690 waktu proses 55 menit.', '2023-05-14 13:04:47', '2023-05-14 13:04:47'),
(510, 'Medan', 2949, 'Instagram Story / Impressions / Saves / Profile Visit', 'Instagram Impressions + Reach + Profile Visit Server 3 [ R30days ]', 590, 100, 1000000, 'If you order 1k, user will get around 1k impression+ 1k reach +1k profile visit\n50k/day', 'primary', '0', '', 'jumlah pesan rata rata 944 waktu proses 11 jam 49 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(511, 'Medan', 2950, 'YouTube Shorts', 'Youtube Short Likes Server 5 [ NO REFILL ] cheap ', 10030, 10, 300000, '0-1 Hour\nSpeed 100k/Days', 'primary', '0', '', 'jumlah pesan rata rata 143 waktu proses 22 jam 54 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(512, 'Medan', 2951, 'YouTube Shorts', 'Youtube Short Likes Server 6 [ 30 DAYS REFILL ] cheap ', 10570, 10, 300000, 'Refill 30 Days\nInstant Start\nSpeed 200k/Days\n', 'primary', '0', '', 'jumlah pesan rata rata 287 waktu proses 1 hari  4 jam  28   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(513, 'Medan', 2952, 'Twitter Favorites/Like', 'Twitter Likes  5 [ NO Refill ] FAST [ 5K/Day ] ', 14390, 20, 1000, '0 - 1 Hour\n5K/Day', 'primary', '0', '', 'jumlah pesan rata rata 167 waktu proses 3 jam 47 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(514, 'Medan', 2953, 'Twitter Favorites/Like', 'Twitter Likes  6 [ 30 Days Refill ] FAST', 16000, 10, 15000, 'Instant\n30 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 159 waktu proses 41 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(515, 'Medan', 2954, 'TikTok View', 'TIKTOK View 12 [ 100M - 5M/Day ] R30', 150, 1000, 10000000, '[ 100M - 5M/Day ] R30', 'primary', '0', '', 'jumlah pesan rata rata 7.500 waktu proses 2 hari  9 jam  28   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(516, 'Medan', 2955, 'TikTok View', 'TIKTOK View 13 [ 100M - 5M/Day ] R30', 660, 100, 40000000, '100M - 5M/Day', 'primary', '0', '', 'jumlah pesan rata rata 1.060 waktu proses 2 jam 4 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(517, 'Medan', 2956, 'TikTok View', 'TIKTOK View 14 [ 200k/Day ] FAST UPDATE', 60, 100, 1000000000, 'FAST UPDATE', 'primary', '0', '', 'jumlah pesan rata rata 10.356 waktu proses 46 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(518, 'Medan', 2958, 'TikTok View', 'TIKTOK View 15 [ 2M/Day ] FAST UPDATE CHEAP', 240, 100, 500000000, 'waktu proses fast', 'primary', '0', '', 'jumlah pesan rata rata 2.304 waktu proses 48 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(519, 'Medan', 2959, 'Telegram', 'Telegram Channnel Members 17 [ 30K ] [ Refill 45 days ] Non Drop', 14300, 500, 30000, 'Instant\n7k-15k/day\nR45\nNon Drop', 'primary', '0', '', 'jumlah pesan rata rata 1.413 waktu proses 3 jam 31 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(520, 'Medan', 2961, 'Telegram', 'Telegram Channnel Members 19 [ 100K ] [ Refill 1 year ] Non Drop ', 18000, 100, 100000, 'Instant\n70k-100k/day\nNon Drop\n1 year guarantee\nHanya bisa refill dari akun yg turun dari layanan ini!', 'primary', '0', '', 'jumlah pesan rata rata 2.635 waktu proses 2 jam 26 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(521, 'Medan', 2962, 'Youtube Views', 'Youtube Views S24 [ NON DROP ] [ Speed 2k-3k/day ] [ min 500 ] [ Lifetime Guaranteed ] ', 11830, 500, 500000, '2k-3k/day', 'primary', '0', '', 'jumlah pesan rata rata 1.561 waktu proses 15 jam 35 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(522, 'Medan', 2963, 'Youtube Views', 'Youtube Views S25 [ NON DROP ] [ Speed 20k-30k/day ] [ min 500 ] [ Lifetime Guaranteed ] ', 15980, 500, 5000000, 'Speed 20k-30k/day', 'primary', '0', '', 'jumlah pesan rata rata 1.490 waktu proses 17 jam 1 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(523, 'Medan', 2964, 'SoundCloud', 'SoundCloud Plays [ 250k/day ] [ R30 ] Instant', 210, 500, 100000000, 'Instant\n250k/day\nR30Days', 'primary', '0', '', 'jumlah pesan rata rata 33.820 waktu proses 3 jam 22 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(524, 'Medan', 2965, 'SoundCloud', 'Soundcloud Followers  2 [ 2-3k/day ] 0-6 hours ', 12500, 50, 5000, '0-6 hours\n2-3k/day\nNo Refill', 'primary', '0', '', 'jumlah pesan rata rata 337 waktu proses 8 jam 58 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(525, 'Medan', 2966, 'SoundCloud', 'Soundcloud Followers  3 [Refill 30 Days] [Speed 10K/Day]', 23800, 20, 1000000, 'Refill 30 Days\n10K/Day\n', 'primary', '0', '', 'jumlah pesan rata rata 20 waktu proses 21 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(526, 'Medan', 2968, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [30 Min] ', 23400, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 75 waktu proses 2 jam 14 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(527, 'Medan', 2969, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [60 Min] ', 46500, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 110 waktu proses 1 jam 43 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(528, 'Medan', 2970, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [90 Min] ', 70000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 92 waktu proses 4 jam 33 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(529, 'Medan', 2971, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [120 Min] ', 93100, 50, 5000, 'stable \nno refill', 'primary', '0', '', 'jumlah pesan rata rata 55 waktu proses 2 jam 41 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(530, 'Medan', 2972, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [150 Min] ', 117000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 56 waktu proses 2 jam 48 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(531, 'Medan', 2973, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [180 Min]', 141000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 65 waktu proses 3 jam 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(532, 'Medan', 2974, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [210 Min] ', 165000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 87 waktu proses 13 jam 39 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(533, 'Medan', 2975, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [240 Min] ', 187000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 60 waktu proses 11 jam 42 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(534, 'Medan', 2976, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [270 Min] ', 210000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 138 waktu proses 4 jam 23 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(535, 'Medan', 2977, 'Facebook Live Stream - MP1', ' 1 - Facebook Live Stream View [300 Min] ', 235000, 50, 5000, 'stable\nno refill', 'primary', '0', '', 'jumlah pesan rata rata 193 waktu proses 4 jam 5 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(536, 'Medan', 2978, 'Facebook Live Stream - MP2', ' 2 - Facebook Live Stream View [30 Min] Best Seller', 37000, 50, 2000, 'mulai: 0-5 menit\npembelian harus kelipatan 50', 'primary', '0', '', 'jumlah pesan rata rata 60 waktu proses 58 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(537, 'Medan', 2979, 'Facebook Live Stream - MP2', ' 2 - Facebook Live Stream View [45 Min] Best Seller ', 52000, 50, 2000, 'mulai: 0-5 menit\npembelian harus kelipatan 50', 'primary', '0', '', 'jumlah pesan rata rata 75 waktu proses 3 jam 10 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(538, 'Medan', 2980, 'Facebook Live Stream - MP2', ' 2 - Facebook Live Stream View [60 Min] Best Seller ', 70000, 50, 2000, 'mulai: 0-5 menit\npembelian harus kelipatan 50', 'primary', '0', '', 'jumlah pesan rata rata 125 waktu proses 1 jam 16 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(539, 'Medan', 2981, 'Facebook Live Stream - MP2', ' 2 - Facebook Live Stream View [90 Min] Best Seller ', 104000, 50, 2000, 'mulai: 0-5 menit\npembelian harus kelipatan 50', 'primary', '0', '', 'jumlah pesan rata rata 60 waktu proses 1 jam 13 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(540, 'Medan', 2982, 'Facebook Live Stream - MP2', ' 2 - Facebook Live Stream View [120 Min] Best Seller ', 140000, 50, 2000, 'mulai: 0-5 menit\npembelian harus kelipatan 50', 'primary', '0', '', 'jumlah pesan rata rata 60 waktu proses 1 jam 53 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(541, 'Medan', 2983, 'TikTok Likes', 'TIKTOK Likes Server 38 [1K/Day] [Refill 30 Days] max 1k', 5950, 50, 1000, '[1K/Day] [Refill 30 Days] max 1k', 'primary', '0', '', 'jumlah pesan rata rata 364 waktu proses 3 jam 25 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(542, 'Medan', 2984, 'Website Traffic', 'Website Traffic Server 3 [10M] Direct URL Redirection [No Referrer]', 320, 10000, 10000000, 'Link Format:\nhttps://yourwebsite.com', 'primary', '0', '', 'jumlah pesan rata rata 26.700 waktu proses 3 jam 0 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(543, 'Medan', 2985, 'Website Traffic', 'Website Traffic From Facebook [Speed 50K/Day] [ No refill ]', 390, 100, 10000000, 'Start Time: Instant - 12 hours\nSpeed: Up to 50K/ day\nSpecs:\n100% Real & Unique Traffic\nDesktop Traffic - Direct Visits\nGoogle Analytics Supported\nYou can use bit.ly to track results\nNo Adult, Drugs or other harmful websites allowed\nLink Format: Full Website URL', 'primary', '0', '', 'jumlah pesan rata rata 20.160 waktu proses 1 jam 27 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(544, 'Medan', 2986, 'Website Traffic', 'Website Traffic From Twitter [Speed 50K/Day] [ No refill ] ', 390, 100, 10000000, 'Start Time: Instant - 12 hours\nSpeed: Up to 50K/ day\nSpecs:\n100% Real & Unique Traffic\nDesktop Traffic - Direct Visits\nGoogle Analytics Supported\nYou can use bit.ly to track results\nNo Adult, Drugs or other harmful websites allowed\nLink Format: Full Website URL', 'primary', '0', '', 'jumlah pesan rata rata 3.480 waktu proses 16 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(545, 'Medan', 2987, 'Website Traffic', 'Website Traffic From Instagram [Speed 50K/Day] [ No refill ] ', 390, 100, 10000000, 'Start Time: Instant - 12 hours\nSpeed: Up to 50K/ day\nSpecs:\n100% Real & Unique Traffic\nDesktop Traffic - Direct Visits\nGoogle Analytics Supported\nYou can use bit.ly to track results\nNo Adult, Drugs or other harmful websites allowed\nLink Format: Full Website URL', 'primary', '0', '', 'jumlah pesan rata rata 14.275 waktu proses 1 jam 56 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(546, 'Medan', 2988, 'Website Traffic', 'Website Traffic From Youtube [Speed 50K/Day] [ No refill ] ', 390, 100, 10000000, 'Start Time: Instant - 12 hours\nSpeed: Up to 50K/ day\nSpecs:\n100% Real & Unique Traffic\nDesktop Traffic - Direct Visits\nGoogle Analytics Supported\nYou can use bit.ly to track results\nNo Adult, Drugs or other harmful websites allowed\nLink Format: Full Website URL', 'primary', '0', '', 'jumlah pesan rata rata 17.016 waktu proses 1 jam 12 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(547, 'Medan', 2989, 'Website Traffic', 'Website Traffic From Google [Speed 50K/Day] [ No refill ] ', 390, 100, 10000000, 'Start Time: Instant - 12 hours\nSpeed: Up to 50K/ day\nSpecs:\n100% Real & Unique Traffic\nDesktop Traffic - Direct Visits\nGoogle Analytics Supported\nYou can use bit.ly to track results\nNo Adult, Drugs or other harmful websites allowed\nLink Format: Full Website URL', 'primary', '0', '', 'jumlah pesan rata rata 7.960 waktu proses 35 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(548, 'Medan', 2990, 'Website Traffic', 'Website Traffic From Blogger.com [Speed 50K/Day] [ No refill ] ', 390, 100, 10000000, 'Start Time: Instant - 12 hours\nSpeed: Up to 50K/ day\nSpecs:\n100% Real & Unique Traffic\nDesktop Traffic - Direct Visits\nGoogle Analytics Supported\nYou can use bit.ly to track results\nNo Adult, Drugs or other harmful websites allowed\nLink Format: Full Website URL', 'primary', '0', '', 'jumlah pesan rata rata 1.410 waktu proses 50 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(549, 'Medan', 2991, 'TikTok View', 'TIKTOK View 17 [ 100K-500K/Day ] FAST CHEAP ', 240, 100, 10000000, 'INTANS', 'primary', '0', '', 'jumlah pesan rata rata 10.325 waktu proses 1 jam 38 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(550, 'Medan', 2993, 'TikTok Likes', 'TIKTOK Likes Server 39 [1K/Day] [Refill 30 Days] WORK', 6990, 10, 500000, 'No Drop\nrefill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 107 waktu proses 1 jam 21 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(551, 'Medan', 2997, 'TikTok View', 'TIKTOK View 19 [ 5M ] MURAH! ', 140, 100, 5000000, 'MURAH fast', 'primary', '0', '', 'jumlah pesan rata rata 6.195 waktu proses 20 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(552, 'Medan', 2999, 'TikTok Followers', 'TikTok Followers  2 [ 1K/day ] [ NO Refill ] [ max 200k ] ', 28500, 10, 200000, 'Instan', 'primary', '0', '', 'jumlah pesan rata rata 375 waktu proses 23 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(553, 'Medan', 3000, 'TikTok Followers', 'TikTok Followers  3 [ 200k/day ] [ NO Refill ]  ', 47020, 100, 300000, '200k/day', 'primary', '0', '', 'jumlah pesan rata rata 440 waktu proses 1 hari  6 jam  13   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(554, 'Medan', 3001, 'TikTok Followers', 'TikTok Followers  4 [ 1k/day ] [ NO refill ] [ PEREUAN ] NEW ', 55900, 10, 200000, 'akun banyak yg foto perempuan [ tapi gk menutup kemungkinan kemudian hari berubah NO KOMPLINE MASALAH INI! ]\n30 Days Refill\n1k/day', 'primary', '0', '', 'jumlah pesan rata rata 79 waktu proses 4 jam 48 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(555, 'Medan', 3002, 'TikTok Likes', 'TIKTOK Likes Server 40 [20K/Day] [Refill 30 Days] NEW', 6890, 10, 8000, 'Refill 30 Days', 'primary', '0', '', 'jumlah pesan rata rata 350 waktu proses 42 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(556, 'Medan', 3003, 'TikTok View', 'TIKTOK View 20 [ 10M ] MURAHH! ', 60, 100, 10000000, 'MURAHH', 'primary', '0', '', 'jumlah pesan rata rata 17.300 waktu proses 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(557, 'Medan', 3005, 'Instagram Followers [ No Refill ]', 'Instagram Followers Server 22  TERMURAH! ', 990, 20, 1000, '0-3hr\n1k/day\nNo refill', 'primary', '0', '', 'jumlah pesan rata rata 20 waktu proses 3 jam 39 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48');
INSERT INTO `smm` (`id`, `provider`, `service`, `category`, `name`, `price`, `min`, `max`, `description`, `type`, `refill`, `masa_refill`, `average_time`, `created_at`, `updated_at`) VALUES
(558, 'Medan', 3006, 'Youtube View Jam Tayang', 'Youtube Views S16 [ Jam Tayang ] [ Refill 30 days ] [ BACA Deskripsi ] ', 51000, 1000, 20000, 'Gunakan link chanel\nSistem kami akan memilih saluran video secara otomatis dari chanel anda\nRefill 30 days\n\n~ Catatan:\n- Jika video dihapus, tidak ada refund saldo.\n- Pesanan yang sedang berjalan tidak dapat dibatalkan.\n- Layanan ini hanya bisa di refill, gk bisa refund jika terjadi penurunan!\n- Jika jam tayang turun kirim analisis dari tanggal pesanan ke tanggal saat ini', 'primary', '0', '', 'jumlah pesan rata rata 2.030 waktu proses 4 hari  3 jam  37   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(559, 'Medan', 3007, 'Youtube Views', 'Youtube Views S26  [ Speed 10k/day ] [ Ex­tern­a + Oher features  ] [ Lifetime Guaranteed ] ', 10950, 100, 1000000, 'Lifetime Guaranteed', 'primary', '0', '', 'jumlah pesan rata rata 4.667 waktu proses 1 hari  1 jam  30   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(560, 'Medan', 3008, 'TikTok Followers', 'TikTok Followers  5 [Refill 30 Days] [Start Time 0 - 1 Hour] [Speed Up to 5K/Day]', 48630, 100, 150000, 'Refill 30 Days\nStart Time 0 - 1 Hour\nSpeed Up to 5K/Day', 'primary', '0', '', 'jumlah pesan rata rata 504 waktu proses 2 jam 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(561, 'Medan', 3011, 'TikTok View', 'TIKTOK View  22 [ MAX: 1B ] FAST WORK', 40, 100, 1000000000, 'MURAHH\n5M/days', 'primary', '0', '', 'jumlah pesan rata rata 11.600 waktu proses 12 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(562, 'Medan', 3012, 'Instagram Views', 'instagram view Server 8 [ Penawaran Waktu Terbatas ] [ 10 juta Per hari ]', 260, 1000, 10000000, 'View Termurah Super Cepat\nKami selalu memberikan yang terbaik untuk Anda!\nLayanan Terjangkau Terbaik dengan Kualitas Tertinggi', 'primary', '0', '', 'jumlah pesan rata rata 3.050 waktu proses 47 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(563, 'Medan', 3013, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 36 [ 365 days Refill ] [ Max 500K ] [ HQ - Favorite ]', 4620, 100, 500000, 'Best Service\nHQ Profiles', 'primary', '0', '', 'jumlah pesan rata rata 2.795 waktu proses 37 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(564, 'Medan', 3014, 'TikTok Likes', 'TIKTOK Likes Server 42 [ Speed 10k In 10Min ] [ Refill 30 Days ] Super Instant', 3690, 30, 10000, 'Speed 10k In 10Min', 'primary', '0', '', 'jumlah pesan rata rata 89 waktu proses 3 jam 32 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(565, 'Medan', 3015, 'TikTok View', 'TIKTOK View  23 [ R30 ] TERMURAH FAST', 60, 100, 1000000000, 'R30', 'primary', '0', '', 'jumlah pesan rata rata 10.610 waktu proses 48 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(566, 'Medan', 3016, 'TikTok View', 'TIKTOK View  24 [ Start Time: 0-10 minutes ] TERMURAH FAST ', 50, 100, 300000000, 'TERMURAH FAST', 'primary', '0', '', 'jumlah pesan rata rata 3.402 waktu proses 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(567, 'Medan', 3017, 'TikTok Likes', 'TIKTOK Likes Server 43 [ Start Time: 5-15 minutes ] [ No refill ] ', 3550, 100, 10000, 'Start Time: 5-15 minutes', 'primary', '0', '', 'jumlah pesan rata rata 250 waktu proses 1 jam 22 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(568, 'Medan', 3018, 'Twitter Followers', 'Twitter Followers Server 27 [ NO REFILL ] [ Max 250K ] ', 23110, 200, 250000, 'NO REFILL', 'primary', '0', '', 'jumlah pesan rata rata 325 waktu proses 3 hari  2 jam  57   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(569, 'Medan', 3020, 'TikTok Followers', 'TikTok Followers  26 [ Low Drop - working after update ] [ 100% Real ] [ 1k per day ] No Refill ', 65560, 10, 50000, 'no drop - 2% drop\ntetapi tetap NO GARANSI apapun yang terjadi!', 'primary', '0', '', 'jumlah pesan rata rata 260 waktu proses 1 jam 27 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(570, 'Medan', 3021, 'TikTok View', 'TIKTOK View  25 [ R30 ] TERMURAH [ NON DROP ] ', 40, 100, 2147483647, '5M/Day', 'primary', '0', '', 'jumlah pesan rata rata 1.940 waktu proses 42 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(571, 'Medan', 3023, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  23 [ CHEAP ][ R30 ] [ 50k-100k/day ]', 14320, 10, 100000, '0-1Hr Start', 'primary', '0', '', 'jumlah pesan rata rata 147 waktu proses 17 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(572, 'Medan', 3025, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 15 min] ', 112820, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username atau username ( tanpa @ )\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot\nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 120 waktu proses 1 jam 57 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(573, 'Medan', 3026, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 240 min] ', 782650, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username atau username ( tanpa @ )\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot\nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(574, 'Medan', 3027, 'Tiktok Live Streams', 'TikTok Livestream Views [Max: 50K] [Start Time: INSTANT] [Stay: 90 Menit] ', 498200, 100, 50000, 'Mulai Live Streaming lalu pesan\nContoh tautan: https://www.tiktok.com/@username atau username ( tanpa @ )\nwaktu mulai 3-4 menit\nscreenshot layar dengan waktu -3-4 menit setelah pemesanan - Waktu harus terlihat di screenshot\nscreenshot layar digunakan untuk hal yg tidak diinginkan', 'primary', '0', '', 'jumlah pesan rata rata 225 waktu proses 31 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(575, 'Medan', 3029, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 5 [ NO Refill ] [Max 50K]', 8530, 100, 50000, 'Start Time: 0-24 Hours', 'primary', '0', '', 'jumlah pesan rata rata 460 waktu proses 3 jam 26 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(576, 'Medan', 3030, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 6 [ NO Refill ] [Max 50K] ', 5300, 100, 10000, 'Start Time: 0-6 Hours', 'primary', '0', '', 'jumlah pesan rata rata 208 waktu proses 10 jam 33 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(577, 'Medan', 3031, 'Youtube View Jam Tayang', 'Youtube Views S17 [ Jam Tayang ] [ Refill 30 days ] [ BACA Deskripsi ] [ durasi video 60menit lebih ]  ', 264940, 1000, 1000000, '(800-1000Hr/day)\nRefill 30 Days\nStart time: 6-12 hours\nFinishes in: 3-7DAYS\n\n- Minimum 100Min+ Video Required.\n- Average Watchtime Will Be updated In 6 Hours after completing the order\nAnd the Exact Total Watchtime will be updated in 2-3 Days in Analytics', 'primary', '0', '', 'jumlah pesan rata rata 500 waktu proses 2 hari  15 jam  32   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(578, 'Medan', 3032, 'Facebook Video Views', 'Facebook Video Views Reels Server 7 [ Refill 90days ] [Non Drop] [Monetization]', 3500, 500, 100000000, '10M/day\nuntuk Reels', 'primary', '0', '', 'jumlah pesan rata rata 1.707 waktu proses 4 hari  4 jam  59   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(579, 'Medan', 3033, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 7 [ 30 Days Refill ] [ Max 3k ] ', 12320, 50, 3000, '30 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 440 waktu proses 1 jam 11 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(580, 'Medan', 3034, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 8 [ NONDROP ] [ Max 10k ] ', 6600, 20, 10000, 'instant\n5k/Hours\nNon Drop ( tetapi jika drop gk ada refund ataupun refill ! )', 'primary', '0', '', 'jumlah pesan rata rata 410 waktu proses 12 jam 4 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(581, 'Medan', 3036, 'Youtube Views', 'Youtube Views S28 [ 500-2k Per Day ] [ BEST QUALITY ] [ Lifetime Guaranteed ] [ HR ]', 26390, 100, 1000000, 'Link: https://www.youtube.com/watch?v=zx-xxxxxxx\n500-2k Per Day \nRetention: 1 - 20 minutes\nDevice: Desktop\nSource: Mixed\n\nNote: If your old views drop, we will not refill.\nSource of views: Mixed', 'primary', '0', '', 'jumlah pesan rata rata 1.020 waktu proses 2 hari  13 jam  56   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(582, 'Medan', 3037, 'TikTok Followers', 'TikTok Followers  27 [ working after update ] [ 100% Real ] [ 500-1k/d and HQ quality ] ', 83000, 25, 5000, 'no drop tapi jika drop tidak ada garansi!', 'primary', '0', '', 'jumlah pesan rata rata 476 waktu proses 5 jam 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(583, 'Medan', 3038, 'TikTok Followers', 'TikTok Followers  28 [ working after update ] [ 500-1k/d and Good quality ] ', 85480, 10, 5000, 'Instans', 'primary', '0', '', 'jumlah pesan rata rata 280 waktu proses 3 jam 3 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(584, 'Medan', 3039, 'TikTok Followers', 'TikTok Followers  29 [ Slow ] [ 100/days and HQ quality ] ', 37000, 100, 100000, 'Slow', 'primary', '0', '', 'jumlah pesan rata rata 600 waktu proses 23 jam 31 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(585, 'Medan', 3040, 'Instagram Reels', 'Instagram Reels Views S1 [ Max - 10M ] Speed 1M/Hour [ Refill 30days ] ', 100, 1000, 10000000, '[ Max - 10M ] Speed 1M/Hour [ Refill 30days ]', 'primary', '0', '', 'jumlah pesan rata rata 1.400 waktu proses 2 jam 7 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(586, 'Medan', 3041, 'TikTok View', 'TIKTOK View  26 [ MURAH - MAX 10M  ] ', 60, 100, 100000000, 'Max 10M', 'primary', '0', '', 'jumlah pesan rata rata 15.402 waktu proses 51 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(587, 'Medan', 3042, 'TikTok Likes', 'TIKTOK Likes Server 45 [ Start Time: 10-30 minutes ] [ No refill ] ', 4270, 10, 200000, 'Start Time: 10-30 minutes', 'primary', '0', '', 'jumlah pesan rata rata 136 waktu proses 9 jam 58 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(588, 'Medan', 3045, 'Instagram Views', 'instagram view Server 9 [ INSTANT ] [ VIDEO/REELS/TV ]', 100, 1000, 100000000, 'INSTANT \nFAST', 'primary', '0', '', 'jumlah pesan rata rata 14.130 waktu proses 9 jam 23 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(589, 'Medan', 3046, 'TikTok View', 'TIKTOK View  27 [ MURAH - MAX 50M ] ', 40, 100, 50000000, 'MURAH - MAX 50M\n10M/day', 'primary', '0', '', 'jumlah pesan rata rata 4.294 waktu proses 34 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(590, 'Medan', 3048, 'Instagram Likes', 'Instagram Likes S16 [ 30 Days Refill ] [ Start Time: 0 -6 Hours ] ', 560, 100, 250000, '[ 30 Days Refill ] [ Start Time: 0 -6 Hours ]', 'primary', '0', '', 'jumlah pesan rata rata 186 waktu proses 28 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(591, 'Medan', 3049, 'Instagram Likes', 'Instagram Likes S17 [ Real Mixed ] [ 5-10k/days ] ', 370, 20, 100000, '[ Real Mixed ] [ 5-10k/days ]', 'primary', '0', '', 'jumlah pesan rata rata 190 waktu proses 21 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(592, 'Medan', 3050, 'Instagram Likes', 'Instagram Likes S18 [ Real Mixed ] [ 70k-80k/day ] ', 360, 100, 100000, 'Real Mixed \n70k-80k/day\nNo refill', 'primary', '0', '', 'jumlah pesan rata rata 510 waktu proses 23 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(593, 'Medan', 3051, 'Instagram Likes', 'Instagram Likes S19 [ Real ] [ 20k/day ][ R30 ]', 980, 100, 100000, 'Refill 30 days', 'primary', '0', '', 'jumlah pesan rata rata 236 waktu proses 40 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(594, 'Medan', 3052, 'Telegram', 'Telegram Post Views ( Instant-5 minute Start, Superfast, Real )', 20, 100, 3000000, 'INSTANT START\nSPEED 500K PER DAY', 'primary', '0', '', 'jumlah pesan rata rata 5.500 waktu proses 17 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(595, 'Medan', 3054, 'Instagram Reels', 'Instagram Reels Views S2 [ Max - 100K ] ', 100, 1000, 100000, 'waktu mulai 0-2 jam', 'primary', '0', '', 'jumlah pesan rata rata 3.975 waktu proses 56 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(596, 'Medan', 3055, 'TikTok Followers', 'TikTok Followers  33 [ 30 Days Refill ] [ Speed: Up To 5K/Day ] ', 35160, 10, 50000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 253 waktu proses 1 hari  6 jam  36   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(597, 'Medan', 3056, 'Instagram Reels', 'Instagram Reels Views S3 [ Max - 1M ] ', 70, 100, 10000000, 'waktu mulai 0-6 jam\n', 'primary', '0', '', 'jumlah pesan rata rata 4.980 waktu proses 7 jam 43 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(598, 'Medan', 3057, 'Facebook Followers / Friends', 'Facebook Follower Profile  20 [ Refill 15 Days ] [ 1k-3k/day ] ', 13420, 500, 100000, '1k-3k/day\nwaktu proses 0-4 hari', 'primary', '0', '', 'jumlah pesan rata rata 1.345 waktu proses 9 jam 22 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(599, 'Medan', 3058, 'Facebook Followers / Friends', 'Facebook Follower Profile  21 [ NO Refill ] [ 5k/day ] ', 14650, 100, 50000, 'waktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 706 waktu proses 3 jam 21 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(600, 'Medan', 3059, 'Facebook Followers / Friends', 'Facebook Follower Profile  22 [ Refill 7days ] [ 100k/day ] ', 21300, 1000, 100000000, 'fast biasanya\ntapi bisa overload', 'primary', '0', '', 'jumlah pesan rata rata 1.450 waktu proses 1 hari  15 jam  6   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(601, 'Medan', 3060, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Likes Server 9 [ SLOW ] [ 1K/Day ] ', 5370, 500, 20000, 'Speed: 1K/Day\nwaktu mulai 1-3 hari', 'primary', '0', '', 'jumlah pesan rata rata 720 waktu proses 12 jam 10 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(602, 'Medan', 3061, 'Telegram auto post view ( Future/masa depan )', 'Telegram auto post view ( Future 5 posts ) ', 650, 100, 2000000, 'Auto view for Future posts\nTrusted Service and Full Auto\nSuitable for Public channels', 'primary', '0', '', 'jumlah pesan rata rata 4.506 waktu proses 17 jam 32 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(603, 'Medan', 3062, 'Telegram auto post view ( Future/masa depan )', 'Telegram auto post view ( Future 10 posts ) ', 1270, 100, 2000000, 'Auto view for Future posts\nTrusted Service and Full Auto\nSuitable for Public channels', 'primary', '0', '', 'jumlah pesan rata rata 611 waktu proses 5 jam 12 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(604, 'Medan', 3063, 'Telegram auto post view ( Future/masa depan )', 'Telegram auto post view ( Future 30 posts ) ', 3880, 100, 2000000, 'Auto view for Future posts\nTrusted Service and Full Auto\nSuitable for Public channels', 'primary', '0', '', 'jumlah pesan rata rata 1.750 waktu proses 9 jam 29 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(605, 'Medan', 3064, 'Telegram auto post view ( Future/masa depan )', 'Telegram auto post view ( Future 50 posts ) ', 6010, 100, 2000000, 'Auto view for Future posts\nTrusted Service and Full Auto\nSuitable for Public channels', 'primary', '0', '', 'jumlah pesan rata rata 1.654 waktu proses 6 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(606, 'Medan', 3065, 'Telegram auto post view ( Future/masa depan )', 'Telegram auto post view ( Future 100 posts ) ', 12680, 100, 250000, 'Auto view for Future posts\nTrusted Service and Full Auto\nSuitable for Public channels', 'primary', '0', '', 'jumlah pesan rata rata 750 waktu proses 7 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(607, 'Medan', 3066, 'TikTok Followers', 'TikTok Followers  34 [ Auto 30 Days Refill ] [ Speed: Up To 1K/Day ] ', 64080, 10, 10000, '0 - 6 Hours\nAuto 30 Days Refill \n1K/Day\n\n', 'primary', '0', '', 'jumlah pesan rata rata 283 waktu proses 1 jam 55 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(608, 'Medan', 3067, 'Instagram Views', 'instagram view + Impressions Server 10 [ INSTANT ] [ VIDEO/REELS/TV ] ', 390, 100, 100000000, '500K/Day\n', 'primary', '0', '', 'jumlah pesan rata rata 3.470 waktu proses 4 jam 20 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(609, 'Medan', 3068, 'TikTok View', 'TIKTOK View  28 [ TERMURAH - MAX 1000M ] Instant ', 14, 100, 50000000, '10M/Day', 'primary', '0', '', 'jumlah pesan rata rata 21.890 waktu proses 5 jam 34 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(610, 'Medan', 3069, 'TikTok Followers', 'TikTok Followers S6 [ NEW ] [ Speed Up To 1K/Day ] ᵁᴾᴰᴬᵀᴱᴰ ', 31010, 10, 100000, '1K/Day \nNO refill', 'primary', '0', '', 'jumlah pesan rata rata 683 waktu proses 1 hari  5 jam  46   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(611, 'Medan', 3070, 'TikTok Followers', 'TikTok Followers S7 [ NEW ] [ Speed Up To  2K-5K/Day ] ᵁᴾᴰᴬᵀᴱᴰ ', 39960, 10, 100000, '2K-5K/Day \nNO refill', 'primary', '0', '', 'jumlah pesan rata rata 489 waktu proses 2 hari  18 jam  1   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(612, 'Medan', 3071, 'TikTok Followers', 'TikTok Followers S8 [ NEW ] [ Speed Up To 10K/Day ] ᵁᴾᴰᴬᵀᴱᴰ ', 42620, 10, 300000, '10K/Day\nNO REFILL', 'primary', '0', '', 'jumlah pesan rata rata 690 waktu proses 12 jam 20 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(613, 'Medan', 3072, 'TikTok Followers', 'TikTok Followers S9 [ NEW ] [ Speed Up To 10K/Day ] [ Refill 30days ]  ᵁᴾᴰᴬᵀᴱᴰ', 75980, 10, 10000, '8K-10K/Day \nRefill 30days', 'primary', '0', '', 'jumlah pesan rata rata 175 waktu proses 2 jam 29 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(614, 'Medan', 3073, 'Youtube Subscribers', 'Youtube Subscribe S14 [ 365 days refill ] [ 500/days ] ', 273250, 100, 500, '1K/Day\nStart Time 0 - 1 Hour', 'primary', '0', '', 'jumlah pesan rata rata 127 waktu proses 12 jam 56 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(615, 'Medan', 3074, 'TikTok Followers', 'TikTok Followers S10 [ NEW ] [ 2K/Day ] [ Refill 30days ] [ MAX 20K ] ᵁᴾᴰᴬᵀᴱᴰ ', 27250, 10, 20000, 'Refill 30days\n2K/Day', 'primary', '0', '', 'jumlah pesan rata rata 832 waktu proses 20 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(616, 'Medan', 3075, 'TikTok Followers', 'TikTok Followers S11 [ NEW ] [ 3K/Day ] [ Refill 30days ] [ MAX 50K ] ᵁᴾᴰᴬᵀᴱᴰ ', 30180, 10, 50000, 'Refill 30days\n3K/Day', 'primary', '0', '', 'jumlah pesan rata rata 572 waktu proses 9 jam 50 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(617, 'Medan', 3076, 'TikTok Followers', 'TikTok Followers S12 [ NEW ] [ 5K/Day ] [ Refill 30days ] [ MAX 100K ] ᵁᴾᴰᴬᵀᴱᴰ ', 32600, 10, 100000, 'Refill 30days\n5K/Day', 'primary', '0', '', 'jumlah pesan rata rata 449 waktu proses 11 jam 26 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(618, 'Medan', 3077, 'Instagram Views', 'instagram view Server 11 [ INSTANT ] [ Works for Reels ]  [ FAST ]', 80, 100, 10000000, 'FAST', 'primary', '0', '', 'jumlah pesan rata rata 3.350 waktu proses 40 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(619, 'Medan', 3078, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 30 Minutes Live CONCURRENT ] [ Super Cheap ]', 41050, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 935 waktu proses 45 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(620, 'Medan', 3079, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 60 Minutes Live CONCURRENT ] [ Super Cheap ] ', 81100, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 1.070 waktu proses 1 jam 16 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(621, 'Medan', 3080, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 90 Minutes Live CONCURRENT ] [ Super Cheap ] ', 122150, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 1.496 waktu proses 1 jam 49 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(622, 'Medan', 3081, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 120 Minutes Live CONCURRENT ] [ Super Cheap ] ', 164200, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 985 waktu proses 2 jam 18 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(623, 'Medan', 3082, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 150 Minutes Live CONCURRENT ] [ Super Cheap ] ', 196440, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 720 waktu proses 2 jam 47 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(624, 'Medan', 3083, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 180 Minutes Live CONCURRENT ] [ Super Cheap ] ', 244300, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 180 waktu proses 3 jam 9 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(625, 'Medan', 3084, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 6 hour Live CONCURRENT ] [ Super Cheap ] ', 484600, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 101 waktu proses 6 jam 8 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(626, 'Medan', 3085, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 12 hour Live CONCURRENT ] [ Super Cheap ] ', 967200, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', 'jumlah pesan rata rata 106 waktu proses 12 jam 7 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(627, 'Medan', 3086, 'YouTube Live Stream [ Harga Murah ] [ Premium Quality - 100% ConCurrent ]  Server 4 [ work ]', 'YouTube Live Stream [ High Quality ] [ 24 hour Live CONCURRENT ] [ Super Cheap ] ', 1944400, 100, 10000, 'Youtube Live Stream Super Cheap Price\nStart Time 0-2 Minutes\n1000 Views Increase / Minutes\n10000 Views will Take 10 Minutes To Increase\nAfter all Views Up It will be stabled For mentioned Timing', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(628, 'Medan', 3087, 'TikTok Followers', 'TikTok Followers S13 [ NEW ] [ 2K-5K/Day ] [ Refill 30days ] [ MAX 50K ] ᵁᴾᴰᴬᵀᴱᴰ ', 25300, 10, 50000, 'Refill 30days\n2K-5K/Day', 'primary', '0', '', 'jumlah pesan rata rata 893 waktu proses 33 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(629, 'Medan', 3088, 'TikTok Followers', 'TikTok Followers S14 [ NEW ] [ 3K-7K/Day ] [ Refill 30days ] [ Max 150K ] ᵁᴾᴰᴬᵀᴱᴰ ', 26900, 10, 150000, 'Refill 30days\n3K-7K/Day', 'primary', '0', '', 'jumlah pesan rata rata 661 waktu proses 17 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(630, 'Medan', 3089, 'Telegram', 'Telegram Channnel Members 20 [ 100K ] [ Real - 30 Days Refill ] [ 50K/days ]', 9770, 500, 100000, '50K/days\n30 Days Refill', 'primary', '0', '', 'jumlah pesan rata rata 3.075 waktu proses 3 jam 58 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(631, 'Medan', 3090, 'Telegram', 'Telegram Channnel Members 21 [ 700K ] [ Real - 90 Days Refill ] [ 50K/days ] ', 16940, 100, 700000, '90 Days Refill\n50K/days', 'primary', '0', '', 'jumlah pesan rata rata 135 waktu proses 2 jam 34 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(632, 'Medan', 3091, 'Youtube View Jam Tayang', 'Youtube Views S18 [ Jam Tayang ]  [ 1 Hour Video ] [ speed 300-500/ day ] [ 30 Days Guaranteed ] [ Non Drop ]', 242300, 100, 4000, 'Start Time: 1-5min\nUse 60 Min Lenght Video\nOrder 1000 You will Get 1000 Hours and 2500-3000 Views\n30 Days Guaranteed\nReal Source Views', 'primary', '0', '', 'jumlah pesan rata rata 218 waktu proses 1 hari  15 jam  24   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(633, 'Medan', 3092, 'Youtube View Jam Tayang', 'Youtube Views S19 [ Jam Tayang ] [ 30 Min Video ] [ speed 300-500/ day ] [ 30 Days Guaranteed ] [ Non Drop ] ', 152400, 200, 8000, 'Get Watch Time Hours required for Channel Monetisation\npesan 1000 anda mendapatkan 500 jam tayang\njika mau 4000 jam tayang harus pesan 8000\nAnalytics:\nVideo length required: 30min+\n3000 Views = 1000h\nStart time: 1-4 min\nSource: Google Real\nAverage Speed 500h-1000h /day average', 'primary', '0', '', 'jumlah pesan rata rata 954 waktu proses 3 hari  4 jam  41   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(634, 'Medan', 3094, 'Youtube Views [ FROM ADS - BIG ORDER ]', 'Youtube ADS Views Server 2 [NEVER DROP]  [ Minimum 1M ] [Start Time: 72 Hours] ', 7130, 1000000, 10000000, 'NEVER DROP\nMinimum 1M', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(635, 'Medan', 3095, 'Youtube Views [ FROM ADS - BIG ORDER ]', 'Youtube ADS Views Server 3  [Start Time: 72 Hours] [Speed: 100K/Day] ', 14140, 20000, 100000000, 'Ads Views\n100K/Day', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(636, 'Medan', 3098, 'TikTok Likes', 'TIKTOK Likes Server 46 [ Start Time: 0-6 hours] [ No refill ] ', 2970, 10, 100000, 'SuperInstant\n10k/days', 'primary', '0', '', 'jumlah pesan rata rata 47 waktu proses 1 jam 43 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(637, 'Medan', 3099, 'Facebook Video Views', 'Facebook Video Views Server 8  [Non Drop] [10M/day] ', 3800, 500, 10000000, '10M/day\nNon Drop', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 5 hari  10 jam  25   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(638, 'Medan', 3100, 'Facebook Followers / Friends', 'Facebook Follower Profile  23 [ NO refill ] [ Mix Quality ] ', 16430, 1000, 500000, 'Mix Quality', 'primary', '0', '', 'jumlah pesan rata rata 3.233 waktu proses 23 jam 5 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(639, 'Medan', 3101, 'Twitter Indonesia', 'Twitter Favorite/Likes REAL INDONESIA Fast s2', 59500, 20, 1000, '1k/day\nkadang tidak sesuai\norder 100 dapat 85 like ( no kompline karna udah diinfokan )', 'primary', '0', '', 'jumlah pesan rata rata 54 waktu proses 45 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(640, 'Medan', 3103, 'Facebook Live Stream', 'Facebook Live Stream Views (30 Minutes LIVE STABLE )', 12800, 100, 15000, '30 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 233 waktu proses 45 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(641, 'Medan', 3104, 'Facebook Live Stream', 'Facebook Live Stream Views ( 60 Minutes LIVE STABLE )', 25400, 100, 15000, '60 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 270 waktu proses 1 jam 8 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(642, 'Medan', 3105, 'Facebook Live Stream', 'Facebook Live Stream Views ( 90 Minutes LIVE STABLE )', 43960, 100, 15000, '90 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 127 waktu proses 1 jam 40 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(643, 'Medan', 3106, 'Facebook Live Stream', 'Facebook Live Stream Views ( 120 Minutes LIVE STABLE )', 52460, 100, 15000, '120 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 151 waktu proses 2 jam 1 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(644, 'Medan', 3107, 'Facebook Live Stream', 'Facebook Live Stream Views ( 150 Minutes LIVE STABLE )', 70920, 100, 15000, '150 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 100 waktu proses 2 jam 50 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(645, 'Medan', 3108, 'Facebook Live Stream', 'Facebook Live Stream Views ( 180 Minutes LIVE STABLE )', 75900, 100, 15000, '180 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 119 waktu proses 3 jam 0 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(646, 'Medan', 3109, 'Facebook Live Stream', 'Facebook Live Stream Views ( 210 Minutes LIVE STABLE )', 84500, 100, 15000, '210 Minutes LIVE STABLE', 'primary', '0', '', 'jumlah pesan rata rata 240 waktu proses 3 jam 54 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(647, 'Medan', 3110, 'Twitter Retweets', 'Twitter Retweets Server 2 [ Max 1K ]', 12800, 50, 1000, 'no refill\n', 'primary', '0', '', 'jumlah pesan rata rata 149 waktu proses 11 jam 52 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(648, 'Medan', 3111, 'Twitter Retweets', 'Twitter Retweets Server 3 [ Max 50K ] ', 12280, 10, 50000, 'No Refill\n1k-10k/day\nLink: https://twitter.com/user/status/1382928752842137602', 'primary', '0', '', 'jumlah pesan rata rata 37 waktu proses 6 jam 15 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(649, 'Medan', 3112, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  24 [ LifeTime Guaranteed] [ 40k-80k/day ] ', 190, 100, 80000, '0-10min\n40k-80k/day\nLifeTime Guaranteed', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(650, 'Medan', 3113, 'Youtube Likes / Dislikes / Shares / Comment', 'Youtube Like  25 [ R30 ] [ 40k-80k/day ]', 140, 10, 100000, '0-1hr\nR30 \n40k-80k/day', 'primary', '0', '', 'jumlah pesan rata rata 355 waktu proses 2 jam 3 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(651, 'Medan', 3114, 'Facebook Post Likes / Comments / Shares', 'Facebook Photo / Post Komentar Server 4 [ max 10k ] [ CUSTOM ] ', 65580, 10, 10000, '50-200/Days', 'custom_comments', '0', '', 'jumlah pesan rata rata 23 waktu proses 1 jam 38 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(652, 'Medan', 3115, 'Facebook Video Views', 'Facebook Video/Reels Views Server 9 [ 100-500K/Days ] [Instant]', 5420, 500, 10000000, 'Drop: no\nGuarantee: lifetime\nOur service\nAny kind of support available\nHowever please do not forget these are just estimations', 'primary', '0', '', 'jumlah pesan rata rata 1.280 waktu proses 3 hari  18 jam  55   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(653, 'Medan', 3116, 'TikTok Followers', 'TikTok Followers S15 [ NEW ] [ 3K/Day ] [ Refill 30days ] [ Max 300K ] ᵁᴾᴰᴬᵀᴱᴰ ', 22020, 10, 300000, 'Refill 30days\n3K/Day', 'primary', '0', '', 'jumlah pesan rata rata 500 waktu proses 10 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(654, 'Medan', 3117, 'TikTok Followers', 'TikTok Followers S16 [ NEW ] [ 20K/Day ] [ HQ ] [ INSTAN ] ᵁᴾᴰᴬᵀᴱᴰ ', 62900, 10, 20000, 'kecepatan 20k/jam', 'primary', '0', '', 'jumlah pesan rata rata 513 waktu proses 6 jam 6 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(655, 'Medan', 3118, 'Instagram Like Indonesia', 'Instagram Likes Indonesia  14 [LANGSUNGMASUK] [5K] REAL ACCOUNT  [ Refill 3Days ] ', 11000, 100, 1000, 'INSTAN MASUK\nBONUS JIKA HOKI', 'primary', '0', '', 'jumlah pesan rata rata 324 waktu proses 4 jam 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(656, 'Medan', 3121, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia 2 [REFILL 10 HARI] ', 38000, 10, 2000, 'bisa refill jika drop 40% lebih\nkalo hanya drop 20% tidak berlaku refill', 'primary', '0', '', 'jumlah pesan rata rata 513 waktu proses 54 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(657, 'Medan', 3122, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia 3 [REFILL 15 HARI] ', 45000, 10, 10000, 'bisa refill jika drop 40% lebih\nkalo hanya drop 20% tidak berlaku refill', 'primary', '0', '', 'jumlah pesan rata rata 377 waktu proses 1 jam 2 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(658, 'Medan', 3123, 'Facebook Followers / Friends', 'Facebook Follower Profile/Page Profile Followers  24 [ refill 15days ]', 14800, 500, 100000, '3k/day', 'primary', '0', '', 'jumlah pesan rata rata 776 waktu proses 12 jam 19 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(659, 'Medan', 3124, 'Youtube Views', 'Youtube Views S29 [ 10k-20k/day ] [ NO DROP ] [ Lifetime Guaranteed ] ', 14300, 100, 1500000, 'Instant\n10k-20k/day\nSource: Direct or Unkown\nRetention: 40-60 sec\nLife Time Guarantee\nTidak ada drop sejak pengujian selama 2 bulan ini, tetapi jika dimasa mendakang mengalami drop\nanda bisa meminta refill', 'primary', '0', '', 'jumlah pesan rata rata 376 waktu proses 4 hari  12 jam  46   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(660, 'Medan', 3128, 'Instagram Views', 'instagram view Server 12 [ INSTANT ] [ Works for Reels ] [ SUPER CHEAP ] ', 60, 100, 20000000, 'INSTAN', 'primary', '0', '', 'jumlah pesan rata rata 2.270 waktu proses 1 jam 59 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(661, 'Medan', 3129, 'TikTok Likes', 'TIKTOK Likes Server  1 [Max: 100K] [Refill: 30 Days] [Start Time: 0 - 3 Hours] [Speed: Up to 10K/Day]', 3750, 10, 100000, 'Refill: 30 Days\nSpeed: Up to 10K/Day', 'primary', '0', '', 'jumlah pesan rata rata 57 waktu proses 1 jam 36 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(662, 'Medan', 3130, 'TikTok Likes', 'TIKTOK Likes Server  3 [Max: 100K] [Refill: 30 Days] [Start Time: 0 - 1 Hours] [Speed: Up to 120K/Day] ', 3500, 10, 50000, '5k/JAM\nNon Drop', 'primary', '0', '', 'jumlah pesan rata rata 157 waktu proses 3 jam 56 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(663, 'Medan', 3131, 'Telegram', 'Telegram Channnel Members/Group Server 22 [100K] [ Refill 60 days ] ', 18000, 100, 100000, 'Instant\nSpeed: 30K+ day\nNon Drop 60 day', 'primary', '0', '', 'jumlah pesan rata rata 510 waktu proses 2 jam 43 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(664, 'Medan', 3132, 'Telegram', 'Telegram Channnel Members/Group Server 23 [200K] [ NonDrop ] ', 21700, 10, 200000, 'NonDrop ( tapi jika drop kami tidak ada garansi. jangan kompline )\nInstant\nSpeed: 50K+ day', 'primary', '0', '', 'jumlah pesan rata rata 361 waktu proses 18 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(665, 'Medan', 3133, 'TikTok Followers', 'TikTok Followers S17 [ ULTRAFAST COLETED ] [ 50K/Day ] [ Real  ] ᵁᴾᴰᴬᵀᴱᴰ ', 43000, 10, 50000, 'ULTRAFAST COMPLETED', 'primary', '0', '', 'jumlah pesan rata rata 416 waktu proses 4 jam 38 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(666, 'Medan', 3134, 'TikTok Followers', 'TikTok Followers S18 [ HQ ] [ 3K/Day ] [Refill 60 Days ] ', 62140, 5, 100000, '0 - 1 Hour\n3K/Day\n', 'primary', '0', '', 'jumlah pesan rata rata 536 waktu proses 14 jam 41 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(667, 'Medan', 3135, 'TikTok Followers', 'TikTok Followers S19 [ 5K/Day ] [ Refill 30 Days ] ', 23600, 10, 50000, 'NonDrop\n5K/Day\nRefill 30 Days', 'primary', '0', '', 'jumlah pesan rata rata 597 waktu proses 27 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(668, 'Medan', 3136, 'Instagram Followers [ guaranteed 180 Hari - Lifetime ]', 'Instagram Followers Server 38 [ 365 days Refill ] [ Max 1M ] [ REAL ] ', 2730, 50, 1000000, '60k/days\n365 days Refill', 'primary', '0', '', 'jumlah pesan rata rata 1.373 waktu proses 28 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(669, 'Medan', 3137, 'Facebook Video Views', 'Facebook Video Views Server 10 [ Start 0-5min ] [2k-5k/day] ', 3100, 500, 1000000, '2k-5k/day', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(670, 'Medan', 3138, 'Youtube Views', 'Youtube Views S30 [ FAST SPEED ] [ BONUS LIKES 1-3% ] [ Lifetime Guaranteed ] ', 15800, 10000, 10000000, 'Speed 40-100K/day', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(671, 'Medan', 3139, 'Youtube Views', 'Youtube Views Versi 1[ Suggested ] [ 1k-4k/days ] [ Lifetime Guaranteed ] ', 13250, 100, 25000, 'Link: https://www.youtube.com/watch?v=zx-BAU4ezv8\nStart: INSTANT\nSpeed: 1k-4k/day\nRefill: Lifetime\n\nRetention Random\nSource: Mixed', 'primary', '0', '', 'jumlah pesan rata rata 200 waktu proses 6 jam 7 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(672, 'Medan', 3140, 'Youtube Views', 'Youtube Views Versi 2 [ Suggested ] [ best speed - quality ] [ Lifetime Guaranteed ] ', 14800, 100, 100000000, '20k-40k/Days\nLink: https://www.youtube.com/watch?v=zx-BAU4ezv8\nStart: INSTANT\nSpeed: 1k-5k/day\nRefill: Lifetime\n\nMust be Unrestricted & Open for ALL countries\n Video Must be embed enable', 'primary', '0', '', 'jumlah pesan rata rata 700 waktu proses 1 hari  6 jam  22   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(673, 'Medan', 3141, 'Youtube Views', 'Youtube Views Versi 3 [ Suggested ] [ best speed - quality ] [ Lifetime Guaranteed ] 10k-20k/Days', 14600, 500, 700000, '10k-20k/Days', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(674, 'Medan', 3142, 'Facebook Video Views', 'Facebook Video Views V1 [ Monetization ] [ PAKET 600k menit ] [ 2 Hours+ Video ]', 5100, 10000, 10000, '- Waktu mulai: 0-1 jam (Mungkin perlu 0-72 Jam jika ada Update atau Overload)\n- Kecepatan 50k-100k jam per hari (kecepatan ini perkiraan dan dapat berubah tergantung kelebihan beban dan pembaruan)\n- Video harus setidaknya +2 Jam (Anda dapat menggunakan video langsung lama yang diposting di timeline Anda)\n- Tampilan yang Dapat Dimonetisasi\n- Contoh Format Pemesanan : https://www.facebook.com/user/videos/ID', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(675, 'Medan', 3143, 'Twitter Followers', 'Twitter Followers Server 28 [ Refill 30days ] [ Max 50K ] [ Less Drop ]', 10000, 10, 50000, 'Less Drop\nRefill 30days', 'primary', '0', '', 'jumlah pesan rata rata 675 waktu proses 1 hari  3 jam  32   menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(676, 'Medan', 3144, 'Twitter Tweet view', 'Twitter Tweet Views Server 4 [ Max 1M ] ', 32, 100, 1000000, 'waktu mulai  0-2 jam', 'primary', '0', '', 'jumlah pesan rata rata 4.164 waktu proses 30 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(677, 'Medan', 3145, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia 4 [REFILL 30 HARI] ', 37000, 10, 250000, 'refill 30 days\nhanya bisa refill jika drop diatas 50%\nproses 1x24 jam\nmax proses 2x24 jam', 'primary', '0', '', 'jumlah pesan rata rata 464 waktu proses 2 jam 3 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(678, 'Medan', 3146, 'Instagram Comments/komentar Indonesia', 'Instagram Komentar Indonesia [From Verified Accounts] [1 KOMENTAR + BONUS LIKES] [CUSTOM] EXCLUSIVE', 15000000, 1, 1, 'Anda akan mendapatkan 1 Komentar dari Akun Instagram yang telah Verified Akun indonesia (Centang Biru)', 'custom_comments', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(679, 'Medan', 3147, 'Twitter Followers', 'Twitter Followers Server 29 [ Refill 30days ] [ Max 500K ] [ 50K/Day ] ', 10840, 10, 500000, 'Link: Profile Link or USERNAME\nSpeed: 50-100K/Hours\nStart: Instant\nRefill: Refill 30 days.\nQuality: Global Bot Followers', 'primary', '0', '', 'jumlah pesan rata rata 750 waktu proses 3 jam 21 menit.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(680, 'Medan', 3148, 'Twitter Followers', 'Twitter Followers Server 30 [ Refill 30days ] [ Max 500K ] [ SUPERFAST ] ', 37000, 200, 500000, '30k-100k/days', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(681, 'Medan', 3149, 'Facebook Page Likes & Page Followers', 'Facebook Page Followers Server 5 [ Classic ] [ Refill 30 Days ] [ 50K/Day ]', 17000, 500, 1000000, 'Start Time: 0-12 Hours', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(682, 'Medan', 3150, 'Facebook Page Likes & Page Followers', 'Facebook Page Followers Server 6 [ 25k/day ] [ LifeTime Guaranteed ] [ Non Drop ] ', 24000, 1000, 30000, 'waktu mulai 0-72 hours\n25k/day\nLifeTime Guaranteed', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(683, 'Medan', 3151, 'Twitch Live Stream ', 'Twitch Live Views [FOR 10 MINUTES] [HQ] [Refill: No] [Max: 500] [Start Time: INSTANT] ', 50600, 100, 500, 'Instant start (can take up to 5 minutes sometime).\n\nNO REFILL / REFUND in case you stop your stream early even after 1 minute, please buy carefully.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(684, 'Medan', 3152, 'Twitch Live Stream ', 'Twitch Livestream Views 1 JAM', 286000, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(685, 'Medan', 3153, 'Twitch Live Stream ', 'Twitch Livestream Views 90 menit', 425000, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(686, 'Medan', 3154, 'Twitch Live Stream', 'Twitch Livestream Views 2 JAM', 560000, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-17 13:22:03'),
(687, 'Medan', 3155, 'Twitch Live Stream ', 'Twitch Livestream Views 3 JAM ', 845000, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(688, 'Medan', 3156, 'Twitch Live Stream ', 'Twitch Livestream Views 5 JAM ', 1440000, 20, 500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:48', '2023-05-14 13:04:48'),
(689, 'Medan', 3157, 'Twitch Live Stream ', 'Twitch Online Streams | Min 100 | Max 2500 Viewers | 15 Minutes ', 85600, 100, 2500, 'Start: Instant\nTIDAK ADA REFILL / REFUND jika Anda menghentikan streaming lebih awal bahkan setelah 1 menit, harap beli dengan hati-hati.', 'primary', '0', '', ' Not enough data.', '2023-05-14 13:04:49', '2023-05-14 13:04:49'),
(690, 'Medan', 3158, 'Instagram Likes', 'Instagram Likes S20 [ Max 500K ] [ 365 Days Refill ] ', 660, 10, 500000, 'Max 500K\nwaktu mulai 0-6 jam', 'primary', '0', '', 'jumlah pesan rata rata 2.054 waktu proses 1 jam 31 menit.', '2023-05-14 13:04:49', '2023-05-14 13:04:49'),
(691, 'Medan', 3159, 'Telegram', 'Telegram Post Views [1 Post] FAST', 10, 100, 10000000, 'FAST', 'primary', '0', '', 'jumlah pesan rata rata 1.000 waktu proses 5 menit.', '2023-05-14 13:04:49', '2023-05-19 02:26:34');

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
(1, 1, 'TCK-1670327962', 'Order', 'order', 'd', 'open', '2022-12-06 11:59:22', '2023-05-19 01:36:20'),
(4, 1, 'TCK-1670328760', 'asdad', 'order', 'ddd', 'closed', '2022-12-06 12:12:40', '2022-12-10 10:28:04'),
(5, 1, 'TCK-1684460235', 'Server', 'order', 'Kirim Order ID nya gan', 'open', '2023-05-19 01:37:15', '2023-05-19 01:37:34'),
(6, 1, 'TCK-1686655913', 'asdasd', 'order', 'haa', 'open', '2023-06-13 11:31:53', '2023-06-13 12:35:55');

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
(3, 'TCK-1670327962', 1, 'user', 'asdasd', '2023-05-14 05:00:03', '2023-05-14 05:00:03'),
(4, 'TCK-1670327962', 1, 'user', 'testt', '2023-05-19 01:36:08', '2023-05-19 01:36:08'),
(5, 'TCK-1670327962', 1, 'user', 'd', '2023-05-19 01:36:20', '2023-05-19 01:36:20'),
(6, 'TCK-1684460235', 1, 'user', 'Status Pesanan sudah sukses tapi tidak masuk ke target', '2023-05-19 01:37:15', '2023-05-19 01:37:15'),
(7, 'TCK-1684460235', 1, 'admin', 'Kirim Order ID nya gan', '2023-05-19 01:37:34', '2023-05-19 01:37:34'),
(8, 'TCK-1686655913', 1, 'user', 'asdsad', '2023-06-13 11:31:53', '2023-06-13 11:31:53'),
(9, 'TCK-1686655913', 1, 'admin', 'haa', '2023-06-13 12:35:55', '2023-06-13 12:35:55');

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
(1, 'Yudha Pratama', 'yudha', 'yudhapratama9593@gmail.com', '$2y$10$Vjcvd1MhcydmNIjTcIqdhu90ZwyTbyDcPMpjDc8kgXBNdnYz/o6jC', 'YOxo3vhJkKUEDQmZJhRzqc4S4b6yzcWzp7w7K4bhKKqQ3MWeiMzwXpaAGjLC', 'pKWmen2HgR5HGgH61cKQE8R1mXn6fpGCWezLO+CTPcVCsZq1YJRUsYkO9ji2QhjH', 'kUntTvQKoQq9/u0rZfFzJQ==', 83555, 286751, '192.232.11.1', 'admin', 'active', '2022-12-02 08:24:04', '2023-05-19 07:55:31'),
(10, 'Muhammad Rizky Putra', 'yudha1993', 'rizkyputra066kr@gmail.com', '$2y$10$nASUHpLYiDRi6EloRKN7IelIkf5ZQ/mhhNRKJ9x2uo2FzN0fRitbC', NULL, '9TK6IgY0e+75JnX+P1QPaGx3mC9x3c+k5UUQ4auAKAOOMAY=', '743635', 0, 0, NULL, 'user', 'active', '2022-12-27 09:40:13', '2022-12-27 10:20:25');

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
(3, 'forgot', 'yudhapratama9593@gmail.com', '90683', '2022-12-27 20:00:38', '2022-12-27 10:00:38', '2022-12-27 10:00:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorits`
--
ALTER TABLE `favorits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `gopays`
--
ALTER TABLE `gopays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `history_refills`
--
ALTER TABLE `history_refills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_balances`
--
ALTER TABLE `log_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `log_masuk`
--
ALTER TABLE `log_masuk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `metode_pembayarans`
--
ALTER TABLE `metode_pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ovos`
--
ALTER TABLE `ovos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_dollars`
--
ALTER TABLE `rate_dollars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smm`
--
ALTER TABLE `smm`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_chats`
--
ALTER TABLE `ticket_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
