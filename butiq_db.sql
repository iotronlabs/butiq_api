-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2019 at 01:39 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `butiq_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `state_id`, `name`, `address_1`, `city`, `postal_code`, `created_at`, `updated_at`, `default`) VALUES
(1, 3, 2, 'ahksnk', 'kaghnln', 'jhhagmb ', 'nbmbmn', NULL, '2019-11-03 05:42:12', 0),
(3, 3, 3, 'Akash', 'nvhdn', 'vnjhgb,', 'ggbhb', '2019-11-03 05:00:22', '2019-11-03 05:42:12', 0),
(5, 2, 2, 'Akash', 'nvhdn', 'vnjhgb,', 'ggbhb', '2019-11-03 05:40:22', '2019-11-03 05:42:12', 0),
(6, 3, 1, 'Akash', 'nvhdn', 'vnjhgb,', 'ggbhb', '2019-11-03 05:41:11', '2019-11-03 05:42:12', 0),
(7, 3, 4, 'agmg', 'nvhdn', 'vnjhgb,', 'ggbhb', '2019-11-03 05:41:33', '2019-11-03 05:42:12', 0),
(8, 3, 1, 'anb hb', 'nvhdn', 'vnjhgb,', 'ggbhb', '2019-11-03 05:42:12', '2019-11-03 05:42:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile-img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_user`
--

CREATE TABLE `cart_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_user`
--

INSERT INTO `cart_user` (`id`, `user_id`, `product_variation_id`, `quantity`, `created_at`, `updated_at`) VALUES
(16, 2, 3, 1, '2019-12-17 07:00:32', '2019-12-17 07:00:32'),
(17, 2, 4, 1, '2019-12-17 07:00:32', '2019-12-17 07:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `order`) VALUES
(1, 'Men', 'men', 1, NULL, NULL, 1),
(2, 'Women', 'women', NULL, NULL, NULL, 1),
(3, 'Shirt', 'shirt', 1, NULL, NULL, 1),
(4, 'Jeans', 'jeans', 1, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`category_id`, `product_id`) VALUES
(1, 1),
(1, 2);

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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_09_24_182600_create_categories_table', 1),
(10, '2019_09_24_185412_add_order_to_categories_table', 1),
(11, '2019_09_28_175505_create_products_table', 1),
(12, '2019_09_28_181518_add_description_to_products_table', 1),
(13, '2019_09_29_121538_create_category_product_table', 1),
(14, '2019_09_30_093914_create_product_variations_table', 1),
(15, '2019_10_01_091545_create_product_variation_types_table', 1),
(16, '2019_10_01_092441_add_product_variation_type_id_to_product_variations_table', 1),
(17, '2019_10_03_141941_create_stocks_table', 1),
(18, '2019_10_03_145011_create_orders_table', 2),
(19, '2019_10_03_145902_create_product_varaition_order_table', 3),
(20, '2019_10_03_151454_create_product_variation_stock_view_table', 4),
(21, '2019_10_03_140029_create_admins_table', 5),
(22, '2019_10_03_140422_create_sellers_table', 6),
(23, '2019_10_10_063648_create_o_t_p_verifies_table', 6),
(24, '2019_10_18_132529_add_popularity_to_products_table', 7),
(25, '2019_10_23_142009_create_cart_user_table', 7),
(26, '2019_11_03_092511_create_states_table', 8),
(27, '2019_11_03_094523_create_addresses_table', 9),
(28, '2019_11_03_105719_add_default_to_addresses_table', 10),
(29, '2019_11_09_151328_add_images_to_products_table', 11),
(30, '2019_11_09_151827_add_images_to_products_variations_table', 11),
(31, '2019_12_02_172452_create_shipping_methods_table', 11),
(32, '2019_12_02_173629_create_state_shipping_method_table', 12),
(33, '2019_12_02_185506_create_state_shipping_method_table', 13),
(34, '2019_12_02_185635_create_shipping_method_state_table', 14),
(35, '2019_12_08_182401_add_address_and_shipping_to_order_table', 15),
(36, '2019_12_08_184729_add_status_to_order_table', 16),
(37, '2019_12_08_190656_add_subtotal_to_order_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('18026470d7530429236382bc0acc7459586588871feeabc71961f214400ea89e0dbb3a4424121e83', 3, 1, 'authToken', '[]', 0, '2019-11-03 04:41:58', '2019-11-03 04:41:58', '2020-11-03 10:11:58'),
('20b61b772037cb07f21c1376d913416a24d33fe05abb2cd0cdc317b958bb73183a222526680cfa20', 2, 1, 'authToken', '[]', 0, '2019-12-11 08:52:14', '2019-12-11 08:52:14', '2020-12-11 14:22:14'),
('2e6254c6ad125eca80a80715bbd30a3b1b7144fe0a923de36a472e376e1028f974ccd6b5c7ae3654', 2, 1, 'authToken', '[]', 0, '2019-12-17 06:47:24', '2019-12-17 06:47:24', '2020-12-17 12:17:24'),
('320aea776222bb2a0c5177d18df049f784e54f31e2df0a226e50f8452b5e91eea33bee96fa82ec97', 2, 1, 'authToken', '[]', 0, '2019-12-06 23:51:21', '2019-12-06 23:51:21', '2020-12-07 05:21:21'),
('392d73fcba3d54322418efabf1ce83dc07de513506be97fce69a0bd8881be9e962c91662fa4278ab', 2, 1, 'authToken', '[]', 0, '2019-12-11 09:56:00', '2019-12-11 09:56:00', '2020-12-11 15:26:00'),
('3dfc08bec36bc93ca65bfcee2922d78e35a342ff5a1e8959af3e83b25945dc82c1de1fce722c44fa', 2, 1, 'authToken', '[]', 0, '2019-12-09 09:18:09', '2019-12-09 09:18:09', '2020-12-09 14:48:09'),
('509126da78fd1ed53ec88fa8d3fcf2f3d4974cc1b0fc8b1495c6d23eb1f15a9ec883228a331881d1', 2, 1, 'authToken', '[]', 0, '2019-12-09 09:32:56', '2019-12-09 09:32:56', '2020-12-09 15:02:56'),
('7809ea3f98c8019ea1ef2dfac41409190a1728080522cf7a6aba9a3e7d7befe97599361fb2185d03', 4, 1, 'authToken', '[]', 0, '2019-11-08 08:58:24', '2019-11-08 08:58:24', '2020-11-08 14:28:24'),
('9a587451d8723160781bb468369422109f54ab5b047e4beea008b9278a495aead382c1f04e64d153', 2, 1, 'authToken', '[]', 0, '2019-12-08 13:21:04', '2019-12-08 13:21:04', '2020-12-08 18:51:04'),
('9f41e381459736e6c1fce91e25c13312beaa12a7dd1ac8f66ca5ece151d8a9f22c1559552741e07b', 3, 1, 'authToken', '[]', 0, '2019-11-03 04:41:39', '2019-11-03 04:41:39', '2020-11-03 10:11:39'),
('bebdd795c45d55d19a9ed19ce5fa1415160f725fd16cf1ec3aed9486a9c7e5b59b9cd002ca5c26af', 3, 1, 'authToken', '[]', 0, '2019-12-03 09:12:38', '2019-12-03 09:12:38', '2020-12-03 14:42:38'),
('e787ff3007c7a7eccb846eb4db302b42e86b384124c36e3dc63ecfd19f988b0e3957041edf83bc9d', 4, 1, 'authToken', '[]', 0, '2019-11-08 09:50:25', '2019-11-08 09:50:25', '2020-11-08 15:20:25'),
('feae0f53f4efbb17cf756e983d8defcb324990c3adb70a214e9ddbceae0f4d29f1c9987b04b78189', 2, 1, 'authToken', '[]', 0, '2019-12-03 09:11:52', '2019-12-03 09:11:52', '2020-12-03 14:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qncrYUzAv4Qdtj6A0Z6yiYVLRj88yZztq13PRUy5', 'http://localhost', 1, 0, 0, '2019-11-03 04:40:44', '2019-11-03 04:40:44'),
(2, NULL, 'Laravel Password Grant Client', 'XiYCM1jlAHaud2utD9mEFa42BCiv8RVbinFKjbbZ', 'http://localhost', 0, 1, 0, '2019-11-03 04:40:44', '2019-11-03 04:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-03 04:40:44', '2019-11-03 04:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_id` int(10) UNSIGNED NOT NULL,
  `shipping_method_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`, `address_id`, `shipping_method_id`, `status`, `subtotal`) VALUES
(31, 2, '2019-12-17 06:51:44', '2019-12-17 06:51:44', 5, 1, 'pending', 33040);

-- --------------------------------------------------------

--
-- Table structure for table `o_t_p_verifies`
--

CREATE TABLE `o_t_p_verifies` (
  `id` int(10) UNSIGNED NOT NULL,
  `temp_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_email` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `o_t_p_verifies`
--

INSERT INTO `o_t_p_verifies` (`id`, `temp_email`, `token_email`, `email_verified_at`, `verified`, `created_at`, `updated_at`) VALUES
(12, '145@gmail.com', 123, NULL, 0, '2019-10-10 02:37:16', '2019-10-10 02:37:16'),
(14, 'hello@gmail.com', 1720, '2019-10-10 04:24:11', 1, '2019-10-10 04:22:53', '2019-10-10 04:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popularity` int(11) NOT NULL DEFAULT 0,
  `seller_id` int(11) DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `created_at`, `updated_at`, `description`, `popularity`, `seller_id`, `color`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`) VALUES
(1, 'coffee', 'coffee', 1200, NULL, NULL, 'New Latest Shirt at lowest price', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Rounded Next T-Shirt', 'rounded-neck', 1900, NULL, NULL, 'vcagdjah bjabmjb mxag xahsavt ujxgsc ayGjsuy duv aj', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'hoody', 'hoody', 12321, '2019-12-11 11:32:04', '2019-12-11 11:32:04', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'hoody with paint', 'hoodypant', 12321, '2019-12-17 06:29:47', '2019-12-17 06:29:47', 'Hello, there anand', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_variation_type_id` int(10) UNSIGNED NOT NULL,
  `pv_image_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pv_image_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pv_image_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pv_image_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pv_image_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_id`, `name`, `price`, `order`, `created_at`, `updated_at`, `product_variation_type_id`, `pv_image_1`, `pv_image_2`, `pv_image_3`, `pv_image_4`, `pv_image_5`) VALUES
(1, 1, 'Small', 1100, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Small', 1000, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Medium', 1400, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Medium', 1120, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Small', 1200, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'Medium', 1400, 2, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(25, 9, 'Small', 8000, 1, '2019-12-17 06:37:37', '2019-12-17 06:37:37', 25, NULL, NULL, NULL, NULL, NULL),
(26, 9, 'Medium', 8800, 2, '2019-12-17 06:37:37', '2019-12-17 06:37:37', 25, NULL, NULL, NULL, NULL, NULL),
(27, 9, 'Large', 9000, 3, '2019-12-17 06:37:37', '2019-12-17 06:37:37', 25, NULL, NULL, NULL, NULL, NULL),
(28, 9, 'Small', 9000, 1, '2019-12-17 06:37:37', '2019-12-17 06:37:37', 27, NULL, NULL, NULL, NULL, NULL),
(29, 9, 'Medium', 9800, 2, '2019-12-17 06:37:37', '2019-12-17 06:37:37', 27, NULL, NULL, NULL, NULL, NULL),
(30, 9, 'Large', 10000, 3, '2019-12-17 06:37:37', '2019-12-17 06:37:37', 27, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_order`
--

CREATE TABLE `product_variation_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_variation_stock_view`
-- (See below for the actual view)
--
CREATE TABLE `product_variation_stock_view` (
`product_id` int(10) unsigned
,`product_variation_id` int(10) unsigned
,`stock` decimal(55,0)
,`in_stock` int(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_types`
--

CREATE TABLE `product_variation_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variation_types`
--

INSERT INTO `product_variation_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Green', NULL, NULL),
(2, 'Red', NULL, NULL),
(3, 'Pink', NULL, NULL),
(25, 'DarkGreen', '2019-12-11 12:29:39', '2019-12-11 12:29:39'),
(27, 'Indigo', '2019-12-11 12:42:59', '2019-12-11 12:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_pin` int(11) NOT NULL,
  `profile-img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'UPS', 1000, NULL, NULL),
(2, 'Royal 1st', 5000, NULL, NULL),
(3, 'Royal 2st', 500, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_method_state`
--

CREATE TABLE `shipping_method_state` (
  `state_id` int(10) UNSIGNED NOT NULL,
  `shipping_method_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_method_state`
--

INSERT INTO `shipping_method_state` (`state_id`, `shipping_method_id`) VALUES
(1, 2),
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `code`, `name`) VALUES
(1, 'AN', 'Andaman and Nicobar Islands'),
(2, 'AP', 'Andhra Pradesh'),
(3, 'AR', 'Arunachal Pradesh'),
(4, 'AS', 'Assam');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `quantity`, `product_variation_id`, `created_at`, `updated_at`) VALUES
(1, 750, 1, NULL, NULL),
(2, 820, 2, NULL, NULL),
(3, 390, 1, NULL, NULL),
(4, 1700, 3, NULL, NULL),
(5, 760, 5, NULL, NULL),
(6, 1200, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Anand', '123@gmail.com', NULL, '12345678', NULL, NULL, NULL),
(2, 'Anandi', '111@gmail.com', NULL, '$2y$10$PBsdpXyCHVRf9sGnkgRGTem4fnx9mT57kOJ1O0yZfsFae9JRR5w1y', NULL, '2019-11-03 04:40:22', '2019-11-03 04:40:22'),
(3, 'Anandi', '121@gmail.com', NULL, '$2y$10$IBjeamnd.C1LXFN0V2sb9e5ys2den2.lzfVEyq0mumR8gJeO.AhJu', NULL, '2019-11-03 04:41:39', '2019-11-03 04:41:39'),
(4, 'Akash', 'akash@gmail.com', NULL, '$2y$10$KJ8h9snIhcuV85mCHy4KXu.rA5X0uSFxVZ99xEzcu8b8yzepkPQ8O', NULL, '2019-11-08 08:58:24', '2019-11-08 08:58:24');

-- --------------------------------------------------------

--
-- Structure for view `product_variation_stock_view`
--
DROP TABLE IF EXISTS `product_variation_stock_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_variation_stock_view`  AS  select `product_variations`.`product_id` AS `product_id`,`product_variations`.`id` AS `product_variation_id`,coalesce(sum(`stocks`.`quantity`) - coalesce(sum(`product_variation_order`.`quantity`),0),0) AS `stock`,case when coalesce(sum(`stocks`.`quantity`) - coalesce(sum(`product_variation_order`.`quantity`),0),0) > 0 then 1 else 0 end AS `in_stock` from ((`product_variations` left join (select `stocks`.`product_variation_id` AS `id`,sum(`stocks`.`quantity`) AS `quantity` from `stocks` group by `stocks`.`product_variation_id`) `stocks` on(`product_variations`.`id` = `stocks`.`id`)) left join (select `product_variation_order`.`product_variation_id` AS `id`,sum(`product_variation_order`.`quantity`) AS `quantity` from `product_variation_order` group by `product_variation_order`.`product_variation_id`) `product_variation_order` on(`product_variations`.`id` = `product_variation_order`.`id`)) group by `product_variations`.`id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_index` (`user_id`),
  ADD KEY `addresses_state_id_index` (`state_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cart_user`
--
ALTER TABLE `cart_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_user_id_index` (`user_id`),
  ADD KEY `cart_user_product_variation_id_index` (`product_variation_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD KEY `category_product_category_id_index` (`category_id`),
  ADD KEY `category_product_product_id_index` (`product_id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_address_id_index` (`address_id`),
  ADD KEY `orders_shipping_method_id_index` (`shipping_method_id`);

--
-- Indexes for table `o_t_p_verifies`
--
ALTER TABLE `o_t_p_verifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_product_id_index` (`product_id`),
  ADD KEY `product_variations_product_variation_type_id_index` (`product_variation_type_id`);

--
-- Indexes for table `product_variation_order`
--
ALTER TABLE `product_variation_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variation_order_order_id_index` (`order_id`),
  ADD KEY `product_variation_order_product_variation_id_index` (`product_variation_id`);

--
-- Indexes for table `product_variation_types`
--
ALTER TABLE `product_variation_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_method_state`
--
ALTER TABLE `shipping_method_state`
  ADD KEY `shipping_method_state_state_id_index` (`state_id`),
  ADD KEY `shipping_method_state_shipping_method_id_index` (`shipping_method_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_product_variation_id_index` (`product_variation_id`);

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
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_user`
--
ALTER TABLE `cart_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `o_t_p_verifies`
--
ALTER TABLE `o_t_p_verifies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_variation_order`
--
ALTER TABLE `product_variation_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_variation_types`
--
ALTER TABLE `product_variation_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_user`
--
ALTER TABLE `cart_user`
  ADD CONSTRAINT `cart_user_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`),
  ADD CONSTRAINT `cart_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_variations_product_variation_type_id_foreign` FOREIGN KEY (`product_variation_type_id`) REFERENCES `product_variation_types` (`id`);

--
-- Constraints for table `product_variation_order`
--
ALTER TABLE `product_variation_order`
  ADD CONSTRAINT `product_variation_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_variation_order_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`);

--
-- Constraints for table `shipping_method_state`
--
ALTER TABLE `shipping_method_state`
  ADD CONSTRAINT `shipping_method_state_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`),
  ADD CONSTRAINT `shipping_method_state_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
