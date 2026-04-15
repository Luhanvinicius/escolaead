-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 20/05/2025 às 13:49
-- Versão do servidor: 10.6.21-MariaDB-cll-lve
-- Versão do PHP: 8.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `demomago_academias`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `addtocarts`
--

CREATE TABLE `addtocarts` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `applications`
--

CREATE TABLE `applications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `is_popular` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `check` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `likes` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_likes`
--

CREATE TABLE `blog_likes` (
  `id` int(255) NOT NULL,
  `blog_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bootcamps`
--

CREATE TABLE `bootcamps` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `is_paid` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `discount_flag` int(11) DEFAULT NULL,
  `discounted_price` double(10,2) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `faqs` longtext DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `outcomes` longtext DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bootcamp_categories`
--

CREATE TABLE `bootcamp_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bootcamp_live_classes`
--

CREATE TABLE `bootcamp_live_classes` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `joining_data` longtext DEFAULT NULL,
  `force_stop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bootcamp_modules`
--

CREATE TABLE `bootcamp_modules` (
  `id` int(11) NOT NULL,
  `bootcamp_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  `restriction` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bootcamp_purchases`
--

CREATE TABLE `bootcamp_purchases` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bootcamp_id` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_revenue` double(10,2) DEFAULT NULL,
  `instructor_revenue` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bootcamp_resources`
--

CREATE TABLE `bootcamp_resources` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `upload_type` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `builder_pages`
--

CREATE TABLE `builder_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `html` longtext DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `is_permanent` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `edit_home_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `builder_pages`
--

INSERT INTO `builder_pages` (`id`, `name`, `html`, `identifier`, `is_permanent`, `status`, `edit_home_id`, `created_at`, `updated_at`) VALUES
(12, 'Elegant', '', 'elegant', 1, 0, NULL, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(13, 'Kindergarden', NULL, 'kindergarden', 1, 0, 1, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(14, 'Cooking', NULL, 'cooking', 1, 0, 1, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(15, 'University', NULL, 'university', 1, 0, 1, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(16, 'Language', NULL, 'language', 1, 0, NULL, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(17, 'Development', NULL, 'development', 1, 0, 1, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(18, 'Marketplace', NULL, 'marketplace', 1, 0, 1, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(19, 'Meditation', NULL, 'meditation', 1, 0, 1, '2024-08-27 04:25:11', '2024-10-31 01:03:56'),
(23, 'Default', '[\"top_bar\",\"header\",\"hero_banner\",\"features\",\"category\",\"featured_courses\",\"about_us\",\"testimonial\",\"blog\",\"footer\"]', NULL, NULL, 1, NULL, '2024-08-27 04:25:11', '2024-10-31 01:03:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `category_logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts`
--

CREATE TABLE `contacts` (
  `id` int(21) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `has_read` int(11) DEFAULT 0,
  `replied` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `dial_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `dial_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '+93', NULL, '2024-10-02 02:55:33'),
(2, 'Aland Islands', 'AX', '+358', NULL, '2024-10-02 03:00:27'),
(3, 'Albania', 'AL', '+355', NULL, NULL),
(4, 'Algeria', 'DZ', '+213', NULL, NULL),
(5, 'AmericanSamoa', 'AS', '+1684', NULL, NULL),
(6, 'Andorra', 'AD', '+376', NULL, NULL),
(7, 'Angola', 'AO', '+244', NULL, NULL),
(8, 'Anguilla', 'AI', '+1264', NULL, NULL),
(9, 'Antarctica', 'AQ', '+672', NULL, NULL),
(10, 'Antigua and Barbuda', 'AG', '+1268', NULL, NULL),
(11, 'Argentina', 'AR', '+54', NULL, NULL),
(12, 'Armenia', 'AM', '+374', NULL, NULL),
(13, 'Aruba', 'AW', '+297', NULL, NULL),
(14, 'Australia', 'AU', '+61', NULL, NULL),
(15, 'Austria', 'AT', '+43', NULL, NULL),
(16, 'Azerbaijan', 'AZ', '+994', NULL, NULL),
(17, 'Bahamas', 'BS', '+1242', NULL, NULL),
(18, 'Bahrain', 'BH', '+973', NULL, '2024-10-02 03:00:48'),
(19, 'Bangladesh', 'BD', '+880', NULL, NULL),
(20, 'Barbados', 'BB', '+1246', NULL, NULL),
(21, 'Belarus', 'BY', '+375', NULL, NULL),
(22, 'Belgium', 'BE', '+32', NULL, NULL),
(23, 'Belize', 'BZ', '+501', NULL, NULL),
(24, 'Benin', 'BJ', '+229', NULL, NULL),
(25, 'Bermuda', 'BM', '+1441', NULL, NULL),
(26, 'Bhutan', 'BT', '+975', NULL, NULL),
(27, 'Bolivia, Plurination', 'BO', '+591', NULL, NULL),
(28, 'Bosnia and Herzegovi', 'BA', '+387', NULL, NULL),
(29, 'Botswana', 'BW', '+267', NULL, NULL),
(30, 'Brazil', 'BR', '+55', NULL, NULL),
(31, 'British Indian Ocean', 'IO', '+246', NULL, NULL),
(32, 'Brunei Darussalam', 'BN', '+673', NULL, NULL),
(33, 'Bulgaria', 'BG', '+359', NULL, NULL),
(34, 'Burkina Faso', 'BF', '+226', NULL, NULL),
(35, 'Burundi', 'BI', '+257', NULL, NULL),
(36, 'Cambodia', 'KH', '+855', NULL, NULL),
(37, 'Cameroon', 'CM', '+237', NULL, NULL),
(38, 'Canada', 'CA', '+1', NULL, NULL),
(39, 'Cape Verde', 'CV', '+238', NULL, NULL),
(40, 'Cayman Islands', 'KY', '+ 345', NULL, NULL),
(41, 'Central African Repu', 'CF', '+236', NULL, NULL),
(42, 'Chad', 'TD', '+235', NULL, NULL),
(43, 'Chile', 'CL', '+56', NULL, NULL),
(44, 'China', 'CN', '+86', NULL, NULL),
(45, 'Christmas Island', 'CX', '+61', NULL, NULL),
(46, 'Cocos (Keeling) Isla', 'CC', '+61', NULL, NULL),
(47, 'Colombia', 'CO', '+57', NULL, NULL),
(48, 'Comoros', 'KM', '+269', NULL, NULL),
(49, 'Congo', 'CG', '+242', NULL, NULL),
(50, 'Congo, The Democrati', 'CD', '+243', NULL, NULL),
(51, 'Cook Islands', 'CK', '+682', NULL, NULL),
(52, 'Costa Rica', 'CR', '+506', NULL, NULL),
(53, 'Cote d\'Ivoire', 'CI', '+225', NULL, NULL),
(54, 'Croatia', 'HR', '+385', NULL, NULL),
(55, 'Cuba', 'CU', '+53', NULL, NULL),
(56, 'Cyprus', 'CY', '+357', NULL, NULL),
(57, 'Czech Republic', 'CZ', '+420', NULL, NULL),
(58, 'Denmark', 'DK', '+45', NULL, NULL),
(59, 'Djibouti', 'DJ', '+253', NULL, NULL),
(60, 'Dominica', 'DM', '+1767', NULL, NULL),
(61, 'Dominican Republic', 'DO', '+1849', NULL, NULL),
(62, 'Ecuador', 'EC', '+593', NULL, NULL),
(63, 'Egypt', 'EG', '+20', NULL, NULL),
(64, 'El Salvador', 'SV', '+503', NULL, NULL),
(65, 'Equatorial Guinea', 'GQ', '+240', NULL, NULL),
(66, 'Eritrea', 'ER', '+291', NULL, NULL),
(67, 'Estonia', 'EE', '+372', NULL, NULL),
(68, 'Ethiopia', 'ET', '+251', NULL, NULL),
(69, 'Falkland Islands (Ma', 'FK', '+500', NULL, NULL),
(70, 'Faroe Islands', 'FO', '+298', NULL, NULL),
(71, 'Fiji', 'FJ', '+679', NULL, NULL),
(72, 'Finland', 'FI', '+358', NULL, NULL),
(73, 'France', 'FR', '+33', NULL, NULL),
(74, 'French Guiana', 'GF', '+594', NULL, NULL),
(75, 'French Polynesia', 'PF', '+689', NULL, NULL),
(76, 'Gabon', 'GA', '+241', NULL, NULL),
(77, 'Gambia', 'GM', '+220', NULL, NULL),
(78, 'Georgia', 'GE', '+995', NULL, NULL),
(79, 'Germany', 'DE', '+49', NULL, NULL),
(80, 'Ghana', 'GH', '+233', NULL, NULL),
(81, 'Gibraltar', 'GI', '+350', NULL, NULL),
(82, 'Greece', 'GR', '+30', NULL, NULL),
(83, 'Greenland', 'GL', '+299', NULL, NULL),
(84, 'Grenada', 'GD', '+1473', NULL, NULL),
(85, 'Guadeloupe', 'GP', '+590', NULL, NULL),
(86, 'Guam', 'GU', '+1671', NULL, NULL),
(87, 'Guatemala', 'GT', '+502', NULL, NULL),
(88, 'Guernsey', 'GG', '+44', NULL, NULL),
(89, 'Guinea', 'GN', '+224', NULL, NULL),
(90, 'Guinea-Bissau', 'GW', '+245', NULL, NULL),
(91, 'Guyana', 'GY', '+595', NULL, NULL),
(92, 'Haiti', 'HT', '+509', NULL, NULL),
(93, 'Holy See (Vatican Ci', 'VA', '+379', NULL, NULL),
(94, 'Honduras', 'HN', '+504', NULL, NULL),
(95, 'Hong Kong', 'HK', '+852', NULL, NULL),
(96, 'Hungary', 'HU', '+36', NULL, NULL),
(97, 'Iceland', 'IS', '+354', NULL, NULL),
(98, 'India', 'IN', '+91', NULL, NULL),
(99, 'Indonesia', 'ID', '+62', NULL, NULL),
(100, 'Iran, Islamic Republ', 'IR', '+98', NULL, NULL),
(101, 'Iraq', 'IQ', '+964', NULL, NULL),
(102, 'Ireland', 'IE', '+353', NULL, NULL),
(103, 'Isle of Man', 'IM', '+44', NULL, NULL),
(104, 'Israel', 'IL', '+972', NULL, NULL),
(105, 'Italy', 'IT', '+39', NULL, NULL),
(106, 'Jamaica', 'JM', '+1876', NULL, NULL),
(107, 'Japan', 'JP', '+81', NULL, NULL),
(108, 'Jersey', 'JE', '+44', NULL, NULL),
(109, 'Jordan', 'JO', '+962', NULL, NULL),
(110, 'Kazakhstan', 'KZ', '+7 7', NULL, NULL),
(111, 'Kenya', 'KE', '+254', NULL, NULL),
(112, 'Kiribati', 'KI', '+686', NULL, NULL),
(113, 'Korea, Democratic Pe', 'KP', '+850', NULL, NULL),
(114, 'Korea, Republic of S', 'KR', '+82', NULL, NULL),
(115, 'Kuwait', 'KW', '+965', NULL, NULL),
(116, 'Kyrgyzstan', 'KG', '+996', NULL, NULL),
(117, 'Laos', 'LA', '+856', NULL, NULL),
(118, 'Latvia', 'LV', '+371', NULL, NULL),
(119, 'Lebanon', 'LB', '+961', NULL, NULL),
(120, 'Lesotho', 'LS', '+266', NULL, NULL),
(121, 'Liberia', 'LR', '+231', NULL, NULL),
(122, 'Libyan Arab Jamahiri', 'LY', '+218', NULL, NULL),
(123, 'Liechtenstein', 'LI', '+423', NULL, NULL),
(124, 'Lithuania', 'LT', '+370', NULL, NULL),
(125, 'Luxembourg', 'LU', '+352', NULL, NULL),
(126, 'Macao', 'MO', '+853', NULL, NULL),
(127, 'Macedonia', 'MK', '+389', NULL, NULL),
(128, 'Madagascar', 'MG', '+261', NULL, NULL),
(129, 'Malawi', 'MW', '+265', NULL, NULL),
(130, 'Malaysia', 'MY', '+60', NULL, NULL),
(131, 'Maldives', 'MV', '+960', NULL, NULL),
(132, 'Mali', 'ML', '+223', NULL, NULL),
(133, 'Malta', 'MT', '+356', NULL, NULL),
(134, 'Marshall Islands', 'MH', '+692', NULL, NULL),
(135, 'Martinique', 'MQ', '+596', NULL, NULL),
(136, 'Mauritania', 'MR', '+222', NULL, NULL),
(137, 'Mauritius', 'MU', '+230', NULL, NULL),
(138, 'Mayotte', 'YT', '+262', NULL, NULL),
(139, 'Mexico', 'MX', '+52', NULL, NULL),
(140, 'Micronesia, Federate', 'FM', '+691', NULL, NULL),
(141, 'Moldova', 'MD', '+373', NULL, NULL),
(142, 'Monaco', 'MC', '+377', NULL, NULL),
(143, 'Mongolia', 'MN', '+976', NULL, NULL),
(144, 'Montenegro', 'ME', '+382', NULL, NULL),
(145, 'Montserrat', 'MS', '+1664', NULL, NULL),
(146, 'Morocco', 'MA', '+212', NULL, NULL),
(147, 'Mozambique', 'MZ', '+258', NULL, NULL),
(148, 'Myanmar', 'MM', '+95', NULL, NULL),
(149, 'Namibia', 'NA', '+264', NULL, NULL),
(150, 'Nauru', 'NR', '+674', NULL, NULL),
(151, 'Nepal', 'NP', '+977', NULL, NULL),
(152, 'Netherlands', 'NL', '+31', NULL, NULL),
(153, 'Netherlands Antilles', 'AN', '+599', NULL, NULL),
(154, 'New Caledonia', 'NC', '+687', NULL, NULL),
(155, 'New Zealand', 'NZ', '+64', NULL, NULL),
(156, 'Nicaragua', 'NI', '+505', NULL, NULL),
(157, 'Niger', 'NE', '+227', NULL, NULL),
(158, 'Nigeria', 'NG', '+234', NULL, NULL),
(159, 'Niue', 'NU', '+683', NULL, NULL),
(160, 'Norfolk Island', 'NF', '+672', NULL, NULL),
(161, 'Northern Mariana Isl', 'MP', '+1670', NULL, NULL),
(162, 'Norway', 'NO', '+47', NULL, NULL),
(163, 'Oman', 'OM', '+968', NULL, NULL),
(164, 'Pakistan', 'PK', '+92', NULL, NULL),
(165, 'Palau', 'PW', '+680', NULL, NULL),
(166, 'Palestinian Territor', 'PS', '+970', NULL, NULL),
(167, 'Panama', 'PA', '+507', NULL, NULL),
(168, 'Papua New Guinea', 'PG', '+675', NULL, NULL),
(169, 'Paraguay', 'PY', '+595', NULL, NULL),
(170, 'Peru', 'PE', '+51', NULL, NULL),
(171, 'Philippines', 'PH', '+63', NULL, NULL),
(172, 'Pitcairn', 'PN', '+872', NULL, NULL),
(173, 'Poland', 'PL', '+48', NULL, NULL),
(174, 'Portugal', 'PT', '+351', NULL, NULL),
(175, 'Puerto Rico', 'PR', '+1939', NULL, NULL),
(176, 'Qatar', 'QA', '+974', NULL, NULL),
(177, 'Romania', 'RO', '+40', NULL, NULL),
(178, 'Russia', 'RU', '+7', NULL, NULL),
(179, 'Rwanda', 'RW', '+250', NULL, NULL),
(180, 'Reunion', 'RE', '+262', NULL, NULL),
(181, 'Saint Barthelemy', 'BL', '+590', NULL, NULL),
(182, 'Saint Helena, Ascens', 'SH', '+290', NULL, NULL),
(183, 'Saint Kitts and Nevi', 'KN', '+1869', NULL, NULL),
(184, 'Saint Lucia', 'LC', '+1758', NULL, NULL),
(185, 'Saint Martin', 'MF', '+590', NULL, NULL),
(186, 'Saint Pierre and Miq', 'PM', '+508', NULL, NULL),
(187, 'Saint Vincent and th', 'VC', '+1784', NULL, NULL),
(188, 'Samoa', 'WS', '+685', NULL, NULL),
(189, 'San Marino', 'SM', '+378', NULL, NULL),
(190, 'Sao Tome and Princip', 'ST', '+239', NULL, NULL),
(191, 'Saudi Arabia', 'SA', '+966', NULL, NULL),
(192, 'Senegal', 'SN', '+221', NULL, NULL),
(193, 'Serbia', 'RS', '+381', NULL, NULL),
(194, 'Seychelles', 'SC', '+248', NULL, NULL),
(195, 'Sierra Leone', 'SL', '+232', NULL, NULL),
(196, 'Singapore', 'SG', '+65', NULL, NULL),
(197, 'Slovakia', 'SK', '+421', NULL, NULL),
(198, 'Slovenia', 'SI', '+386', NULL, NULL),
(199, 'Solomon Islands', 'SB', '+677', NULL, NULL),
(200, 'Somalia', 'SO', '+252', NULL, NULL),
(201, 'South Africa', 'ZA', '+27', NULL, NULL),
(202, 'South Georgia and th', 'GS', '+500', NULL, NULL),
(203, 'Spain', 'ES', '+34', NULL, NULL),
(204, 'Sri Lanka', 'LK', '+94', NULL, NULL),
(205, 'Sudan', 'SD', '+249', NULL, NULL),
(206, 'Suriname', 'SR', '+597', NULL, NULL),
(207, 'Svalbard and Jan May', 'SJ', '+47', NULL, NULL),
(208, 'Swaziland', 'SZ', '+268', NULL, NULL),
(209, 'Sweden', 'SE', '+46', NULL, NULL),
(210, 'Switzerland', 'CH', '+41', NULL, NULL),
(211, 'Syrian Arab Republic', 'SY', '+963', NULL, NULL),
(212, 'Taiwan', 'TW', '+886', NULL, NULL),
(213, 'Tajikistan', 'TJ', '+992', NULL, NULL),
(214, 'Tanzania, United Rep', 'TZ', '+255', NULL, NULL),
(215, 'Thailand', 'TH', '+66', NULL, NULL),
(216, 'Timor-Leste', 'TL', '+670', NULL, NULL),
(217, 'Togo', 'TG', '+228', NULL, NULL),
(218, 'Tokelau', 'TK', '+690', NULL, NULL),
(219, 'Tonga', 'TO', '+676', NULL, NULL),
(220, 'Trinidad and Tobago', 'TT', '+1868', NULL, NULL),
(221, 'Tunisia', 'TN', '+216', NULL, NULL),
(222, 'Turkey', 'TR', '+90', NULL, NULL),
(223, 'Turkmenistan', 'TM', '+993', NULL, NULL),
(224, 'Turks and Caicos Isl', 'TC', '+1649', NULL, NULL),
(225, 'Tuvalu', 'TV', '+688', NULL, NULL),
(226, 'Uganda', 'UG', '+256', NULL, NULL),
(227, 'Ukraine', 'UA', '+380', NULL, NULL),
(228, 'United Arab Emirates', 'AE', '+971', NULL, NULL),
(229, 'United Kingdom', 'GB', '+44', NULL, NULL),
(230, 'United States', 'US', '+1', NULL, NULL),
(231, 'Uruguay', 'UY', '+598', NULL, NULL),
(232, 'Uzbekistan', 'UZ', '+998', NULL, NULL),
(233, 'Vanuatu', 'VU', '+678', NULL, NULL),
(234, 'Venezuela, Bolivaria', 'VE', '+58', NULL, NULL),
(235, 'Vietnam', 'VN', '+84', NULL, NULL),
(236, 'Virgin Islands, Brit', 'VG', '+1284', NULL, NULL),
(237, 'Virgin Islands, U.S.', 'VI', '+1340', NULL, NULL),
(238, 'Wallis and Futuna', 'WF', '+681', NULL, NULL),
(239, 'Yemen', 'YE', '+967', NULL, NULL),
(240, 'Zambia', 'ZM', '+260', NULL, NULL),
(241, 'Zimbabwe', 'ZW', '+263', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `coupons`
--

CREATE TABLE `coupons` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` float(10,2) DEFAULT NULL,
  `expiry` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `is_paid` int(11) DEFAULT NULL,
  `is_best` int(11) NOT NULL DEFAULT 0,
  `price` double(10,2) DEFAULT NULL,
  `discounted_price` double(10,2) DEFAULT NULL,
  `discount_flag` int(11) DEFAULT NULL,
  `enable_drip_content` int(11) DEFAULT NULL,
  `drip_content_settings` longtext DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `requirements` mediumtext DEFAULT NULL,
  `outcomes` mediumtext DEFAULT NULL,
  `faqs` mediumtext DEFAULT NULL,
  `instructor_ids` text DEFAULT NULL,
  `average_rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  `ccavenue_supported` int(11) DEFAULT 0,
  `iyzico_supported` int(11) DEFAULT 0,
  `paystack_supported` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`, `ccavenue_supported`, `iyzico_supported`, `paystack_supported`) VALUES
(1, 'US Dollar', 'USD', '$', 1, 1, 0, 0, 0),
(2, 'Albanian Lek', 'ALL', 'Lek', 0, 1, 0, 0, 0),
(3, 'Algerian Dinar', 'DZD', 'دج', 1, 1, 0, 0, 0),
(4, 'Angolan Kwanza', 'AOA', 'Kz', 1, 1, 0, 0, 0),
(5, 'Argentine Peso', 'ARS', '$', 1, 1, 0, 0, 0),
(6, 'Armenian Dram', 'AMD', '֏', 1, 1, 0, 0, 0),
(7, 'Aruban Florin', 'AWG', 'ƒ', 1, 1, 0, 0, 0),
(8, 'Australian Dollar', 'AUD', '$', 1, 1, 0, 0, 0),
(9, 'Azerbaijani Manat', 'AZN', 'm', 1, 1, 0, 0, 0),
(10, 'Bahamian Dollar', 'BSD', 'B$', 1, 1, 0, 0, 0),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', 1, 1, 0, 0, 0),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1, 1, 0, 0, 0),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', 1, 1, 0, 0, 0),
(14, 'Belarusian Ruble', 'BYR', 'Br', 0, 0, 0, 0, 0),
(15, 'Belgian Franc', 'BEF', 'fr', 1, 1, 0, 0, 0),
(16, 'Belize Dollar', 'BZD', '$', 1, 1, 0, 0, 0),
(17, 'Bermudan Dollar', 'BMD', '$', 1, 1, 0, 0, 0),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', 1, 1, 0, 0, 0),
(19, 'Bitcoin', 'BTC', '฿', 1, 1, 0, 0, 0),
(20, 'Bolivian Boliviano', 'BOB', 'Bs.', 1, 1, 0, 0, 0),
(21, 'Bosnia', 'BAM', 'KM', 1, 1, 0, 0, 0),
(22, 'Botswanan Pula', 'BWP', 'P', 1, 1, 0, 0, 0),
(23, 'Brazilian Real', 'BRL', 'R$', 1, 1, 0, 0, 0),
(24, 'British Pound Sterling', 'GBP', '£', 1, 1, 0, 0, 0),
(25, 'Brunei Dollar', 'BND', 'B$', 1, 1, 0, 0, 0),
(26, 'Bulgarian Lev', 'BGN', 'Лв.', 1, 1, 0, 0, 0),
(27, 'Burundian Franc', 'BIF', 'FBu', 1, 1, 0, 0, 0),
(28, 'Cambodian Riel', 'KHR', 'KHR', 1, 1, 0, 0, 0),
(29, 'Canadian Dollar', 'CAD', '$', 1, 1, 0, 0, 0),
(30, 'Cape Verdean Escudo', 'CVE', '$', 1, 1, 0, 0, 0),
(31, 'Cayman Islands Dollar', 'KYD', '$', 1, 1, 0, 0, 0),
(32, 'CFA Franc BCEAO', 'XOF', 'CFA', 1, 1, 0, 0, 0),
(33, 'CFA Franc BEAC', 'XAF', 'FCFA', 1, 1, 0, 0, 0),
(34, 'CFP Franc', 'XPF', '₣', 1, 1, 0, 0, 0),
(35, 'Chilean Peso', 'CLP', '$', 1, 1, 0, 0, 0),
(36, 'Chinese Yuan', 'CNY', '¥', 1, 1, 0, 0, 0),
(37, 'Colombian Peso', 'COP', '$', 1, 1, 0, 0, 0),
(38, 'Comorian Franc', 'KMF', 'CF', 1, 1, 0, 0, 0),
(39, 'Congolese Franc', 'CDF', 'FC', 1, 1, 0, 0, 0),
(40, 'Costa Rican ColÃ³n', 'CRC', '₡', 1, 1, 0, 0, 0),
(41, 'Croatian Kuna', 'HRK', 'kn', 1, 1, 0, 0, 0),
(42, 'Cuban Convertible Peso', 'CUC', '$, CUC', 1, 1, 0, 0, 0),
(43, 'Czech Republic Koruna', 'CZK', 'Kč', 1, 1, 0, 0, 0),
(44, 'Danish Krone', 'DKK', 'Kr.', 1, 1, 0, 0, 0),
(45, 'Djiboutian Franc', 'DJF', 'Fdj', 1, 1, 0, 0, 0),
(46, 'Dominican Peso', 'DOP', '$', 1, 1, 0, 0, 0),
(47, 'East Caribbean Dollar', 'XCD', '$', 1, 1, 0, 0, 0),
(48, 'Egyptian Pound', 'EGP', 'ج.م', 1, 1, 0, 0, 0),
(49, 'Eritrean Nakfa', 'ERN', 'Nfk', 1, 1, 0, 0, 0),
(50, 'Estonian Kroon', 'EEK', 'kr', 1, 1, 0, 0, 0),
(51, 'Ethiopian Birr', 'ETB', 'Nkf', 1, 1, 0, 0, 0),
(52, 'Euro', 'EUR', '€', 1, 1, 0, 0, 0),
(53, 'Falkland Islands Pound', 'FKP', '£', 1, 1, 0, 0, 0),
(54, 'Fijian Dollar', 'FJD', 'FJ$', 1, 1, 0, 0, 0),
(55, 'Gambian Dalasi', 'GMD', 'D', 1, 1, 0, 0, 0),
(56, 'Georgian Lari', 'GEL', 'ლ', 1, 1, 0, 0, 0),
(57, 'German Mark', 'DEM', 'DM', 1, 1, 0, 0, 0),
(58, 'Ghanaian Cedi', 'GHS', 'GH₵', 1, 1, 0, 0, 0),
(59, 'Gibraltar Pound', 'GIP', '£', 1, 1, 0, 0, 0),
(60, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', 1, 1, 0, 0, 0),
(61, 'Guatemalan Quetzal', 'GTQ', 'Q', 1, 1, 0, 0, 0),
(62, 'Guinean Franc', 'GNF', 'FG', 1, 1, 0, 0, 0),
(63, 'Guyanaese Dollar', 'GYD', '$', 1, 1, 0, 0, 0),
(64, 'Haitian Gourde', 'HTG', 'G', 1, 1, 0, 0, 0),
(65, 'Honduran Lempira', 'HNL', 'L', 1, 1, 0, 0, 0),
(66, 'Hong Kong Dollar', 'HKD', '$', 1, 1, 0, 0, 0),
(67, 'Hungarian Forint', 'HUF', 'Ft', 1, 1, 0, 0, 0),
(68, 'Icelandic KrÃ³na', 'ISK', 'kr', 1, 1, 0, 0, 0),
(69, 'Indian Rupee', 'INR', '₹', 1, 1, 1, 0, 0),
(70, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 1, 0, 0, 0),
(71, 'Iranian Rial', 'IRR', '﷼', 1, 1, 0, 0, 0),
(72, 'Iraqi Dinar', 'IQD', 'د.ع', 1, 1, 0, 0, 0),
(73, 'Israeli New Sheqel', 'ILS', '₪', 1, 1, 0, 0, 0),
(74, 'Italian Lira', 'ITL', 'L,£', 1, 1, 0, 0, 0),
(75, 'Jamaican Dollar', 'JMD', 'J$', 1, 1, 0, 0, 0),
(76, 'Japanese Yen', 'JPY', '¥', 1, 1, 0, 0, 0),
(77, 'Jordanian Dinar', 'JOD', 'ا.د', 1, 1, 0, 0, 0),
(78, 'Kazakhstani Tenge', 'KZT', 'лв', 1, 1, 0, 0, 0),
(79, 'Kenyan Shilling', 'KES', 'KSh', 1, 1, 0, 0, 0),
(80, 'Kuwaiti Dinar', 'KWD', 'ك.د', 1, 1, 0, 0, 0),
(81, 'Kyrgystani Som', 'KGS', 'лв', 1, 1, 0, 0, 0),
(82, 'Laotian Kip', 'LAK', '₭', 1, 1, 0, 0, 0),
(83, 'Latvian Lats', 'LVL', 'Ls', 0, 0, 0, 0, 0),
(84, 'Lebanese Pound', 'LBP', '£', 1, 1, 0, 0, 0),
(85, 'Lesotho Loti', 'LSL', 'L', 1, 1, 0, 0, 0),
(86, 'Liberian Dollar', 'LRD', '$', 1, 1, 0, 0, 0),
(87, 'Libyan Dinar', 'LYD', 'د.ل', 1, 1, 0, 0, 0),
(88, 'Lithuanian Litas', 'LTL', 'Lt', 0, 0, 0, 0, 0),
(89, 'Macanese Pataca', 'MOP', '$', 1, 1, 0, 0, 0),
(90, 'Macedonian Denar', 'MKD', 'ден', 1, 1, 0, 0, 0),
(91, 'Malagasy Ariary', 'MGA', 'Ar', 1, 1, 0, 0, 0),
(92, 'Malawian Kwacha', 'MWK', 'MK', 1, 1, 0, 0, 0),
(93, 'Malaysian Ringgit', 'MYR', 'RM', 1, 1, 0, 0, 0),
(94, 'Maldivian Rufiyaa', 'MVR', 'Rf', 1, 1, 0, 0, 0),
(95, 'Mauritanian Ouguiya', 'MRO', 'MRU', 1, 1, 0, 0, 0),
(96, 'Mauritian Rupee', 'MUR', '₨', 1, 1, 0, 0, 0),
(97, 'Mexican Peso', 'MXN', '$', 1, 1, 0, 0, 0),
(98, 'Moldovan Leu', 'MDL', 'L', 1, 1, 0, 0, 0),
(99, 'Mongolian Tugrik', 'MNT', '₮', 1, 1, 0, 0, 0),
(100, 'Moroccan Dirham', 'MAD', 'MAD', 1, 1, 0, 0, 0),
(101, 'Mozambican Metical', 'MZM', 'MT', 1, 1, 0, 0, 0),
(102, 'Myanmar Kyat', 'MMK', 'K', 1, 1, 0, 0, 0),
(103, 'Namibian Dollar', 'NAD', '$', 1, 1, 0, 0, 0),
(104, 'Nepalese Rupee', 'NPR', '₨', 1, 1, 0, 0, 0),
(105, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', 1, 1, 0, 0, 0),
(106, 'New Taiwan Dollar', 'TWD', '$', 1, 1, 0, 0, 0),
(107, 'New Zealand Dollar', 'NZD', '$', 1, 1, 0, 0, 0),
(108, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', 1, 1, 0, 0, 0),
(109, 'Nigerian Naira', 'NGN', '₦', 1, 1, 0, 0, 1),
(110, 'North Korean Won', 'KPW', '₩', 0, 0, 0, 0, 0),
(111, 'Norwegian Krone', 'NOK', 'kr', 1, 1, 0, 0, 0),
(112, 'Omani Rial', 'OMR', '.ع.ر', 0, 0, 0, 0, 0),
(113, 'Pakistani Rupee', 'PKR', '₨', 1, 1, 0, 0, 0),
(114, 'Panamanian Balboa', 'PAB', 'B/.', 1, 1, 0, 0, 0),
(115, 'Papua New Guinean Kina', 'PGK', 'K', 1, 1, 0, 0, 0),
(116, 'Paraguayan Guarani', 'PYG', '₲', 1, 1, 0, 0, 0),
(117, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 1, 1, 0, 0, 0),
(118, 'Philippine Peso', 'PHP', '₱', 1, 1, 0, 0, 0),
(119, 'Polish Zloty', 'PLN', 'zł', 1, 1, 0, 0, 0),
(120, 'Qatari Rial', 'QAR', 'ق.ر', 1, 1, 0, 0, 0),
(121, 'Romanian Leu', 'RON', 'lei', 1, 1, 0, 0, 0),
(122, 'Russian Ruble', 'RUB', '₽', 1, 1, 0, 0, 0),
(123, 'Rwandan Franc', 'RWF', 'FRw', 1, 1, 0, 0, 0),
(124, 'Salvadoran ColÃ³n', 'SVC', '₡', 0, 0, 0, 0, 0),
(125, 'Samoan Tala', 'WST', 'SAT', 1, 1, 0, 0, 0),
(126, 'Saudi Riyal', 'SAR', '﷼', 1, 1, 0, 0, 0),
(127, 'Serbian Dinar', 'RSD', 'din', 1, 1, 0, 0, 0),
(128, 'Seychellois Rupee', 'SCR', 'SRe', 1, 1, 0, 0, 0),
(129, 'Sierra Leonean Leone', 'SLL', 'Le', 1, 1, 0, 0, 0),
(130, 'Singapore Dollar', 'SGD', '$', 1, 1, 0, 0, 0),
(131, 'Slovak Koruna', 'SKK', 'Sk', 1, 1, 0, 0, 0),
(132, 'Solomon Islands Dollar', 'SBD', 'Si$', 1, 1, 0, 0, 0),
(133, 'Somali Shilling', 'SOS', 'Sh.so.', 1, 1, 0, 0, 0),
(134, 'South African Rand', 'ZAR', 'R', 1, 1, 0, 0, 0),
(135, 'South Korean Won', 'KRW', '₩', 1, 1, 0, 0, 0),
(136, 'Special Drawing Rights', 'XDR', 'SDR', 1, 1, 0, 0, 0),
(137, 'Sri Lankan Rupee', 'LKR', 'Rs', 1, 1, 0, 0, 0),
(138, 'St. Helena Pound', 'SHP', '£', 1, 1, 0, 0, 0),
(139, 'Sudanese Pound', 'SDG', '.س.ج', 1, 1, 0, 0, 0),
(140, 'Surinamese Dollar', 'SRD', '$', 1, 1, 0, 0, 0),
(141, 'Swazi Lilangeni', 'SZL', 'E', 1, 1, 0, 0, 0),
(142, 'Swedish Krona', 'SEK', 'kr', 1, 1, 0, 0, 0),
(143, 'Swiss Franc', 'CHF', 'CHf', 1, 1, 0, 0, 0),
(144, 'Syrian Pound', 'SYP', 'LS', 0, 0, 0, 0, 0),
(145, 'São Tomé and Príncipe Dobra', 'STD', 'Db', 1, 1, 0, 0, 0),
(146, 'Tajikistani Somoni', 'TJS', 'SM', 1, 1, 0, 0, 0),
(147, 'Tanzanian Shilling', 'TZS', 'TSh', 1, 1, 0, 0, 0),
(148, 'Thai Baht', 'THB', '฿', 1, 1, 0, 0, 0),
(149, 'Tongan pa\'anga', 'TOP', '$', 1, 1, 0, 0, 0),
(150, 'Trinidad & Tobago Dollar', 'TTD', '$', 1, 1, 0, 0, 0),
(151, 'Tunisian Dinar', 'TND', 'ت.د', 1, 1, 0, 0, 0),
(152, 'Turkish Lira', 'TRY', '₺', 1, 1, 0, 1, 0),
(153, 'Turkmenistani Manat', 'TMT', 'T', 1, 1, 0, 0, 0),
(154, 'Ugandan Shilling', 'UGX', 'USh', 1, 1, 0, 0, 0),
(155, 'Ukrainian Hryvnia', 'UAH', '₴', 1, 1, 0, 0, 0),
(156, 'United Arab Emirates Dirham', 'AED', 'إ.د', 1, 1, 0, 0, 0),
(157, 'Uruguayan Peso', 'UYU', '$', 1, 1, 0, 0, 0),
(158, 'Afghan Afghani', 'AFA', '؋', 1, 1, 0, 0, 0),
(159, 'Uzbekistan Som', 'UZS', 'лв', 1, 1, 0, 0, 0),
(160, 'Vanuatu Vatu', 'VUV', 'VT', 1, 1, 0, 0, 0),
(161, 'Venezuelan BolÃvar', 'VEF', 'Bs', 0, 0, 0, 0, 0),
(162, 'Vietnamese Dong', 'VND', '₫', 1, 1, 0, 0, 0),
(163, 'Yemeni Rial', 'YER', '﷼', 1, 1, 0, 0, 0),
(164, 'Zambian Kwacha', 'ZMK', 'ZK', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `device_ips`
--

CREATE TABLE `device_ips` (
  `id` int(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enrollment_type` varchar(255) DEFAULT NULL,
  `entry_date` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `expiry_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `forums`
--

CREATE TABLE `forums` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` int(255) DEFAULT NULL,
  `parent_id` int(255) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `likes` longtext DEFAULT NULL,
  `dislikes` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'banner_title', 'Start learning from the world’s pro Instructors', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(2, 'banner_sub_title', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(4, 'about_us', '<div>Limitless learning at your fingertips</div><div><br></div><div>Limitless learning at your fingertipsAdvertising a busines online includes assembling the they awesome site. Having the most well-planned on to the our SEO services keep you on the top a business Having the moston to the online.</div><div><br></div><div><br></div><div><br></div><div>Advertising a busines online includes assembling the they awesome site.</div><div><br></div><div><br></div><div>Range including technical skills</div><div>Range including technical skills</div><div>Range including technical skills</div><div><br></div>', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(10, 'terms_and_condition', '<h2>Terms and Condition</h2>', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(11, 'privacy_policy', '<p></p><p></p><h2><span xss=\"removed\">Privacy Policy</span></h2>', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(13, 'theme', 'default', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(14, 'cookie_note', 'This website uses cookies to personalize content and analyse traffic in order to offer you a better experience.', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(15, 'cookie_status', '0', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(16, 'cookie_policy', '<h2 class=\"\">Cookie policy</h2><ol><li>Cookies are small text files that can be used by websites to make a user\'s experience more efficient.</li><li>The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission.</li><li>This site uses different types of cookies. Some cookies are placed by third party services that appear on our pages.</li></ol>', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(17, 'banner_image', 'uploads/banner_image/banner-image.png', '2023-10-31 11:08:12', '2024-05-29 23:12:03'),
(18, 'light_logo', 'uploads/light_logo/light-logo-default.png', '2023-10-31 11:08:12', '2024-05-29 06:23:34'),
(19, 'dark_logo', 'uploads/dark_logo/darklogo-1747759699.png', '2023-10-31 11:08:12', '2025-05-21 01:48:19'),
(20, 'small_logo', 'uploads/small_logo/small-logo-1712661659.jpg', '2023-10-31 11:08:12', '2024-04-09 05:20:59'),
(21, 'favicon', 'uploads/favicon/favicon-default.png', '2023-10-31 11:08:12', '2024-05-29 06:24:18'),
(22, 'recaptcha_status', '0', '2023-10-31 11:08:12', '2023-11-01 23:27:24'),
(23, 'recaptcha_secretkey', 'Valid-secret-key', '2023-10-31 11:08:12', '2023-11-01 23:27:24'),
(24, 'recaptcha_sitekey', 'Valid-site-key', '2023-10-31 11:08:12', '2023-11-01 23:27:24'),
(25, 'refund_policy', '<h2><span xss=\"removed\">Refund Policy</span></h2>', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(26, 'facebook', 'https://facebook.com', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(27, 'twitter', 'https://twitter.com', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(28, 'linkedin', 'https://linkedin.com', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(31, 'blog_page_title', 'Where possibilities begin', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(32, 'blog_page_subtitle', 'We’re a leading marketplace platform for learning and teaching online. Explore some of our most popular content and learn something new.', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(33, 'blog_page_banner', 'blog-page.png', '2023-10-31 11:08:12', '2023-10-31 11:08:12'),
(34, 'instructors_blog_permission', '1', '2023-10-31 11:08:12', '2023-12-07 00:28:58'),
(35, 'blog_visibility_on_the_home_page', '1', '2023-10-31 11:08:12', '2023-12-07 00:28:58'),
(37, 'website_faqs', '[{\"question\":\"How to create an account?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"},{\"question\":\"Do you provide any support for this kit?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"},{\"question\":\"How to create an account?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"},{\"question\":\"How long do you provide support?\",\"answer\":\"Interactively procrastinate high-payoff content without backward-compatible data. Quickly to cultivate optimal processes and tactical architectures. For The Completely iterate covalent strategic.\"}]', '2023-10-31 11:08:12', '2024-09-11 04:57:12'),
(38, 'motivational_speech', '[{\"title\":\"Jenny Murtagh\",\"designation\":\"Graphic Design\",\"description\":\"Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even for slightly believable randomised words.\",\"image\":\"I6zvV1Mr30YUhLfJgwje.png\"},{\"title\":\"Jenny Murtagh\",\"designation\":\"Graphic Design\",\"description\":\"Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even for slightly believable randomised words.\",\"image\":\"ZLfkhGame7sYQvqKxD0J.png\"},{\"title\":\"Jenny Murtagh\",\"designation\":\"Graphic Design\",\"description\":\"Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even for slightly believable randomised words.\",\"image\":\"xBYkXnfvmPiU3j0CzME1.png\"}]', '2023-10-31 11:08:12', '2024-09-11 04:57:18'),
(39, 'home_page', NULL, '2023-10-31 11:08:12', '2024-10-31 01:03:56'),
(40, 'contact_info', '{\"email\":\"creativeitem@example.com\",\"phone\":\"67564345676\",\"address\":\"629 12th St, Modesto\",\"office_hours\":\"8\",\"location\":\"40.689880, -74.045203\"}', '2023-10-31 11:08:12', '2024-09-11 04:57:26'),
(41, 'promo_video_provider', 'youtube', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(42, 'promo_video_link', 'https://youtu.be/4QCaXTOwigw?si=NsFeBQhWNZC859-l', '2023-10-31 11:08:12', '2024-10-27 02:22:09'),
(43, 'mobile_app_link', 'https://youtu.be/4QCaXTOwigw?si=NsFeBQhWNZC859-l', '2023-10-31 11:08:12', '2024-10-27 02:22:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `home_page_settings`
--

CREATE TABLE `home_page_settings` (
  `id` int(11) NOT NULL,
  `home_page_id` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `home_page_settings`
--

INSERT INTO `home_page_settings` (`id`, `home_page_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 14, 'cooking', '{\"title\":\"Become An Instructor\",\"description\":\"Training programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever since the unknown printer took a galley of type and scrambled.\\r\\n\\r\\nConsectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever since.\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=iTlsP6RfCQ8\",\"image\":\"instructor_image.jpg\"}', '2024-05-15 09:43:54', '2024-10-28 05:14:50'),
(3, 15, 'university', '{\"image\":\"default-university.webp\",\"faq_image\":\"default-university2.webp\",\"slider_items\":\"[\\\"https:\\\\\\/\\\\\\/www.youtube.com\\\\\\/watch?v=iTlsP6RfCQ8\\\"]\"}', '2024-05-16 02:31:00', '2024-09-24 06:09:07'),
(4, 17, 'development', '{\"title\":\"Leading the Way in Software Development\",\"description\":\"Far far away, behind the word mountains, far from the away countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.\\r\\nTraining programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent\",\"video_url\":null,\"image\":\"default-dev-banner.webp\"}', '2024-05-18 05:40:13', '2024-05-18 08:08:06'),
(5, 13, 'kindergarden', '{\"title\":\"Creating A Community Of Life Long Learners\",\"description\":\"Training programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes.\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent\\r\\nTraining programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent\",\"video_url\":null,\"image\":\"default-community-banner.webp\"}', '2024-05-18 08:02:45', '2024-05-18 08:07:59'),
(6, 18, 'marketplace', '{\"instructor\":{\"title\":\"Become an instructor\",\"description\":\"Training programs can bring you a super exciting experience of learning through online! You never face any negative experience while enjoying your classes.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever since the unknown printer took a galley of type and scrambled.\\r\\n\\r\\nConsectetur adipiscing elit. Nunc vulputate ad litora torquent per conubi himenaeos Awesome site Lorem Ipsum has been the industry\'s standard dummy text ever sinces.\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=i-rv4VQiBko\",\"image\":\"default-video-area-banner.webp\"},\"slider\":[{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"},{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"},{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"},{\"banner_title\":\"LEARN FROM TODAY\",\"banner_description\":\"Academy Starter is a community for creative people\"}]}', '2024-05-18 22:55:44', '2024-05-20 01:22:25'),
(7, 19, 'meditation', '{\"big_image\":\"664b020ed2bbb.png\",\"meditation\":[{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b07fa650dd.yoga-benefit-1.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Minds\",\"image\":\"664b08157c7ed.yoga-benefit-2.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b08157cab8.yoga-benefit-3.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b08157d2be.yoga-benefit-4.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Mind\",\"image\":\"664b08263ba18.yoga-benefit-5.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"},{\"banner_title\":\"Balance Body & Minddf\",\"image\":\"664b08263bcca.yoga-benefit-6.svg\",\"banner_description\":\"It is a long established fact that a reader will be distracted by the readable content.\"}]}', '2024-05-19 23:54:56', '2024-05-20 02:21:58');

-- --------------------------------------------------------

--
-- Estrutura para tabela `instructor_reviews`
--

CREATE TABLE `instructor_reviews` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `instructor_id` int(255) DEFAULT NULL,
  `rating` varchar(244) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `direction` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `languages`
--

INSERT INTO `languages` (`id`, `name`, `direction`, `created_at`, `updated_at`) VALUES
(3, 'english', 'ltr', '2024-04-08 13:42:26', '2024-04-09 04:12:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `language_phrases`
--

CREATE TABLE `language_phrases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phrase` text DEFAULT NULL,
  `translated` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `language_phrases`
--

INSERT INTO `language_phrases` (`id`, `language_id`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(1, 3, 'Log In', 'Entrar', NULL, NULL),
(2, 3, 'Login', 'Login', NULL, NULL),
(3, 3, 'See your growth and get consulting support!', 'Veja seu crescimento e obtenha suporte de consultoria!', NULL, NULL),
(4, 3, 'Email', 'Email', NULL, NULL),
(5, 3, 'Your Email', 'Seu Email', NULL, NULL),
(6, 3, 'Password', 'Senha', NULL, NULL),
(7, 3, 'Remember Me', 'Lembre-se de mim', NULL, NULL),
(8, 3, 'Forget Password?', 'Esqueceu a senha?', NULL, NULL),
(9, 3, 'Not have an account yet?', 'Ainda não tem uma conta?', NULL, NULL),
(10, 3, 'Create Account', 'Criar Conta', NULL, NULL),
(11, 3, 'Home', 'Início', NULL, NULL),
(12, 3, 'Courses', 'Cursos', NULL, NULL),
(13, 3, 'All Courses', 'Todos os Cursos', NULL, NULL),
(14, 3, 'Bootcamp', 'Bootcamp', NULL, NULL),
(15, 3, 'Search...', 'Pesquisar...', NULL, NULL),
(16, 3, 'Search courses', 'Pesquisar cursos', NULL, NULL),
(17, 3, 'Cart', 'Carrinho', NULL, NULL),
(18, 3, 'Sign Up', 'Inscrever-se', NULL, NULL),
(19, 3, 'It is a long established fact that a reader will be the distract by the read content of a page layout', 'É um fato há muito estabelecido que um leitor será distraído pelo conteúdo lido de um layout de página', NULL, NULL),
(20, 3, 'Contact with Us', 'Entre em Contato Conosco', NULL, NULL),
(21, 3, 'Top Categories', 'Principais Categorias', NULL, NULL),
(22, 3, 'Useful links', 'Links Úteis', NULL, NULL),
(23, 3, 'Course', 'Cursos', NULL, '2024-12-21 01:32:59'),
(24, 3, 'Blog', 'Blog', NULL, NULL),
(25, 3, 'Company', 'Empresa', NULL, NULL),
(26, 3, 'Phone : ', 'Telefone : ', NULL, NULL),
(27, 3, 'Email : ', 'Email : ', NULL, NULL),
(28, 3, 'Newsletter', 'Newsletter', NULL, NULL),
(29, 3, 'Subscribe to stay tuned for new web design and latest updates. Let\'s do it!', 'Inscreva-se para ficar por dentro de novos designs de sites e últimas atualizações. Vamos fazer isso!', NULL, NULL),
(30, 3, 'Email address', 'Endereço de email', NULL, NULL),
(31, 3, 'Submit', 'Enviar', NULL, NULL),
(32, 3, 'About Us', 'Sobre Nós', NULL, NULL),
(33, 3, 'Privacy Policy', 'Política de Privacidade', NULL, NULL),
(34, 3, 'Terms And Use', 'Termos de Uso', NULL, NULL),
(35, 3, 'Sales and Refunds', 'Vendas e Reembolsos', NULL, NULL),
(36, 3, 'FAQ', 'FAQ', NULL, NULL),
(37, 3, '© 2024 All Rights Reserved', '© 2024 Todos os Direitos Reservados', NULL, NULL),
(38, 3, 'Close', 'Fechar', NULL, NULL),
(39, 3, 'Are you sure?', 'Você tem certeza?', NULL, NULL),
(40, 3, 'You can\'t bring it back!', 'Você não pode trazê-lo de volta!', NULL, NULL),
(41, 3, 'Cancel', 'Cancelar', NULL, NULL),
(42, 3, 'Yes, I\'m sure', 'Sim, tenho certeza', NULL, NULL),
(43, 3, 'Just Now', 'Agora mesmo', NULL, NULL),
(44, 3, 'Success !', 'Sucesso!', NULL, NULL),
(45, 3, 'Attention !', 'Atenção!', NULL, NULL),
(46, 3, 'An Error Occurred !', 'Ocorreu um erro!', NULL, NULL),
(47, 3, 'Remove from wishlist', 'Remover da lista de desejos', NULL, NULL),
(48, 3, 'This course added to your wishlist', 'Este curso foi adicionado à sua lista de desejos', NULL, NULL),
(49, 3, 'Add to wishlist', 'Adicionar à lista de desejos', NULL, NULL),
(50, 3, 'This course removed from your wishlist', 'Este curso foi removido da sua lista de desejos', NULL, NULL),
(51, 3, 'Enter your keywords', 'Digite suas palavras-chave', NULL, NULL),
(52, 3, 'Show less', 'Mostrar menos', NULL, NULL),
(53, 3, 'Show more', 'Mostrar mais', NULL, NULL),
(54, 3, 'Dashboard', 'Painel de Controle', NULL, NULL),
(55, 3, 'Number of Courses', 'Número de Cursos', NULL, NULL),
(56, 3, 'Number of Lessons', 'Número de Aulas', NULL, NULL),
(57, 3, 'Number of Enrollment', 'Número de Inscrições', NULL, NULL),
(58, 3, 'Number of Students', 'Número de Alunos', NULL, NULL),
(59, 3, 'Number of Instructor', 'Número de Professores', NULL, '2024-12-20 15:13:35'),
(60, 3, 'Admin Revenue This Year', 'Receita do Admin Este Ano', NULL, NULL),
(61, 3, 'Admin Revenue', 'Receita do Admin', NULL, NULL),
(62, 3, 'Course Status', 'Status do Curso', NULL, NULL),
(63, 3, 'Explore Courses', 'Explorar Cursos', NULL, NULL),
(64, 3, 'Active', 'Ativo', NULL, NULL),
(65, 3, 'Upcoming', 'Próximos', NULL, NULL),
(66, 3, 'Pending', 'Pendente', NULL, NULL),
(67, 3, 'Private', 'Privado', NULL, NULL),
(68, 3, 'Draft', 'Rascunho', NULL, NULL),
(69, 3, 'Inactive', 'Inativo', NULL, NULL),
(70, 3, 'Pending Requested withdrawal', 'Retirada solicitada pendente', NULL, NULL),
(71, 3, 'Instructor Payout', 'Pagamento do Professor', NULL, '2024-12-20 15:13:44'),
(72, 3, 'Main Menu', 'Menu Principal', NULL, NULL),
(73, 3, 'Category', 'Categoria', NULL, NULL),
(74, 3, 'Manage Courses', 'Gerenciar Cursos', NULL, NULL),
(75, 3, 'Add New Course', 'Adicionar Novo Curso', NULL, NULL),
(76, 3, 'Coupons', 'Cupons', NULL, NULL),
(77, 3, 'Manage Bootcamps', 'Gerenciar Bootcamps', NULL, NULL),
(78, 3, 'Add New Bootcamp', 'Adicionar Novo Bootcamp', NULL, NULL),
(79, 3, 'Purchase History', 'Histórico de Compras', NULL, NULL),
(80, 3, 'Student enrollment', 'Inscrição de Alunos', NULL, NULL),
(81, 3, 'Course enrollment', 'Inscrição de Curso', NULL, NULL),
(82, 3, 'Enrollment History', 'Histórico de Inscrições', NULL, NULL),
(83, 3, 'Enroll student', 'Inscrever aluno', NULL, NULL),
(84, 3, 'Payment Report', 'Relatório de Pagamento', NULL, NULL),
(85, 3, 'Offline payments', 'Transfência Bancaria', NULL, '2024-12-21 01:49:56'),
(86, 3, 'Instructor Revenue', 'Receita do Professor', NULL, '2024-12-20 15:13:49'),
(87, 3, 'Payment History', 'Histórico de Pagamentos', NULL, NULL),
(88, 3, 'Users', 'Usuários', NULL, NULL),
(89, 3, 'Admin', 'Admin', NULL, NULL),
(90, 3, 'Manage Admin', 'Gerenciar Admin', NULL, NULL),
(91, 3, 'Add New Admin', 'Adicionar Novo Admin', NULL, NULL),
(92, 3, 'Instructor', 'Professor', NULL, '2024-12-20 15:13:53'),
(93, 3, 'Manage Instructors', 'Gerenciar Professores', NULL, '2024-12-20 15:14:02'),
(94, 3, 'Add new Instructor', 'Add Novo Professor', NULL, '2024-12-20 15:14:21'),
(95, 3, 'Instructor Setting', 'Configuração do Professor', NULL, '2024-12-20 15:14:26'),
(96, 3, 'Application', 'Aplicativo', NULL, NULL),
(97, 3, 'Student', 'Aluno', NULL, NULL),
(98, 3, 'Manage Students', 'Gerenciar Alunos', NULL, NULL),
(99, 3, 'Add new Student', 'Adicionar Novo Aluno', NULL, NULL),
(100, 3, 'Message', 'Mensagem', NULL, NULL),
(101, 3, 'Manage Newsletters', 'Gerenciar Newsletters', NULL, NULL),
(102, 3, 'Subscribed User', 'Usuário Inscrito', NULL, NULL),
(103, 3, 'Contacts', 'Contatos', NULL, NULL),
(104, 3, 'Blogs', 'Blogs', NULL, NULL),
(105, 3, 'Manage Blogs', 'Gerenciar Blogs', NULL, NULL),
(106, 3, 'Pending Blogs', 'Blogs Pendentes', NULL, NULL),
(107, 3, 'Settings', 'Configurações', NULL, NULL),
(108, 3, 'System Settings', 'Configurações do Sistema', NULL, NULL),
(109, 3, 'Website Settings', 'Configurações do Site', NULL, NULL),
(110, 3, 'Payment Settings', 'Configurações de Pagamento', NULL, NULL),
(111, 3, 'Manage Language', 'Gerenciar Idioma', NULL, NULL),
(112, 3, 'Live Class Settings', 'Configurações da Aula Ao Vivo', NULL, NULL),
(113, 3, 'SMTP Settings', 'Configurações SMTP', NULL, NULL),
(114, 3, 'Certificate Settings', 'Configurações de Certificado', NULL, NULL),
(115, 3, 'Player Settings', 'Configurações do Player', NULL, NULL),
(116, 3, 'Open AI Settings', 'Configurações de IA Aberta', NULL, NULL),
(117, 3, 'Home Page Builder', 'Construtor de Página Inicial', NULL, NULL),
(118, 3, 'SEO Settings', 'Configurações de SEO', NULL, NULL),
(119, 3, 'About', 'Sobre', NULL, NULL),
(120, 3, 'Manage Profile', 'Gerenciar Perfil', NULL, NULL),
(121, 3, 'Admin Panel', 'Painel Admin', NULL, NULL),
(122, 3, 'View site', 'Visualizar site', NULL, NULL),
(123, 3, 'Language', 'Idioma', NULL, NULL),
(124, 3, 'AI Assistant', 'Assistente de IA', NULL, NULL),
(125, 3, 'Help Center', 'Central de Ajuda', NULL, NULL),
(126, 3, 'Read documentation', 'Leia a documentação', NULL, NULL),
(127, 3, 'Watch video tutorial', 'Assista ao tutorial em vídeo', NULL, NULL),
(128, 3, 'Get customer support', 'Obtenha suporte ao cliente', NULL, NULL),
(129, 3, 'Order customization', 'Personalização de pedido', NULL, NULL),
(130, 3, 'Request a new feature', 'Solicitar um novo recurso', NULL, NULL),
(131, 3, 'Get Services', 'Obter Serviços', NULL, NULL),
(132, 3, 'My Profile', 'Meu Perfil', NULL, NULL),
(133, 3, 'Sign Out', 'Sair', NULL, NULL),
(134, 3, 'Confirm', 'Confirmar', NULL, NULL),
(135, 3, 'Loading', 'Carregando', NULL, NULL),
(136, 3, 'Learn More', 'Saiba Mais', NULL, NULL),
(137, 3, 'Students has Enrolled', 'Alunos Inscritos', NULL, NULL),
(138, 3, 'Perfect Responsive', 'Perfeitamente Responsivo', NULL, NULL),
(139, 3, 'It is a long established fact that a reader will be distracted', 'É um fato há muito estabelecido que um leitor será distraído', NULL, NULL),
(140, 3, 'Fast & Friendly Support', 'Suporte Rápido e Amigável', NULL, NULL),
(141, 3, 'Easy to Use', 'Fácil de Usar', NULL, NULL),
(142, 3, 'Featured Courses', 'Cursos em Destaque', NULL, NULL),
(143, 3, 'View All Courses', 'Ver Todos os Cursos', NULL, NULL),
(144, 3, 'Know About Us', 'Saiba Mais Sobre Nós', NULL, NULL),
(145, 3, 'Learn & Grow Your Skills From ', 'Aprenda e Desenvolva Suas Habilidades em', NULL, NULL),
(146, 3, 'Educate', 'Educar', NULL, NULL),
(147, 3, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.', 'É um fato há muito estabelecido que um leitor será distraído pelo conteúdo legível de uma página ao observar seu layout. O ponto de usar o Lorem Ipsum.', NULL, NULL),
(148, 3, 'Life time Access', 'Acesso Vitalício', NULL, NULL),
(149, 3, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'É um fato há muito estabelecido que um leitor será distraído pelo conteúdo legível de uma página ao observar seu layout.', NULL, NULL),
(150, 3, 'Learn from Anywhere', 'Aprenda de Qualquer Lugar', NULL, NULL),
(151, 3, 'More about us', 'Saiba Mais Sobre Nós', NULL, NULL),
(152, 3, 'View All Blogs', 'Ver Todos os Blogs', NULL, NULL),
(153, 3, 'Wishlist', 'Lista de Desejos', NULL, NULL),
(154, 3, 'Log Out', 'Sair', NULL, NULL),
(155, 3, 'Logout', 'Sair', NULL, NULL),
(156, 3, 'Admin Dashboard', 'Painel Administrativo', NULL, NULL),
(157, 3, 'Website name', 'Nome do Site', NULL, NULL),
(158, 3, 'Website title', 'Título do Site', NULL, NULL),
(159, 3, 'Website keywords', 'Palavras-chave do Site', NULL, NULL),
(160, 3, 'Website description', 'Descrição do Site', NULL, NULL),
(161, 3, 'Author', 'Autor', NULL, NULL),
(162, 3, 'Slogan', 'Slogan', NULL, NULL),
(163, 3, 'System email', 'Email do Sistema', NULL, NULL),
(164, 3, 'Address', 'Endereço', NULL, NULL),
(165, 3, 'Phone', 'Telefone', NULL, NULL),
(166, 3, 'Youtube API key', 'Chave API do Youtube', NULL, NULL),
(167, 3, 'Get YouTube API key', 'Obtenha Chave API do YouTube', NULL, NULL),
(168, 3, 'If you want to use Google Drive video, you need to enable the Google Drive service in this API', 'Se você quiser usar vídeo do Google Drive, precisa habilitar o serviço Google Drive nesta API', NULL, NULL),
(169, 3, 'Vimeo API key', 'Chave API do Vimeo', NULL, NULL),
(170, 3, 'get Vimeo API key', 'Obtenha Chave API do Vimeo', NULL, NULL),
(171, 3, 'Purchase code', 'Código de Compra', NULL, NULL),
(172, 3, 'System language', 'Idioma do Sistema', NULL, NULL),
(173, 3, 'English', 'Português', NULL, '2024-10-01 17:49:29'),
(174, 3, 'Course selling tax', 'Imposto sobre Venda de Curso', NULL, NULL),
(175, 3, 'Enter 0 if you want to disable the tax option', 'Digite 0 se você quiser desativar a opção de imposto', NULL, NULL),
(176, 3, 'Device limitation', 'Limite de Dispositivos', NULL, NULL),
(177, 3, 'Footer text', 'Texto do Rodapé', NULL, NULL),
(178, 3, 'Footer link', 'Link do Rodapé', NULL, NULL),
(179, 3, 'Save Changes', 'Salvar Alterações', NULL, NULL),
(180, 3, 'Update Product', 'Atualizar Produto', NULL, NULL),
(181, 3, 'File', 'Arquivo', NULL, NULL),
(182, 3, 'Update', 'Atualizar', NULL, NULL),
(183, 3, 'System settings update successfully', 'Configurações do sistema atualizadas com sucesso', NULL, NULL),
(184, 3, 'Frontend Settings', 'Configurações do Frontend', NULL, NULL),
(185, 3, 'Motivational Speech', 'Discurso Motivacional', NULL, NULL),
(186, 3, 'Website FAQS', 'Perguntas Frequentes do Site', NULL, NULL),
(187, 3, 'Contact Information', 'Informações de Contato', NULL, NULL),
(188, 3, 'User Reviews', 'Avaliações de Usuários', NULL, NULL),
(189, 3, 'Logo & Images', 'Logo & Imagens', NULL, NULL),
(190, 3, 'Frontend website settings', 'Configurações do site Frontend', NULL, NULL),
(191, 3, 'Banner title', 'Título do Banner', NULL, NULL),
(192, 3, 'Banner sub title', 'Subtítulo do Banner', NULL, NULL),
(193, 3, 'Promo Video Provider', 'Fornecedor de Vídeo Promocional', NULL, NULL),
(194, 3, 'Youtube Video Link', 'Link de Vídeo do Youtube', NULL, NULL),
(195, 3, 'Vimeo Video Link', 'Link de Vídeo do Vimeo', NULL, NULL),
(196, 3, 'HTML5 Video link', 'Link de Vídeo HTML5', NULL, NULL),
(197, 3, 'Promo video link', 'Link de Vídeo Promocional', NULL, NULL),
(198, 3, 'Cookie status', 'Status de Cookies', NULL, NULL),
(199, 3, 'Cookie note', 'Nota sobre Cookies', NULL, NULL),
(200, 3, 'Facebook', 'Facebook', NULL, '2024-10-01 14:34:27'),
(201, 3, 'Twitter', 'Twitter', NULL, '2024-10-01 14:34:27'),
(202, 3, 'Linkedin', 'Linkedin', NULL, '2024-10-01 14:34:27'),
(203, 3, 'Cookie policy', 'Política de Cookies', NULL, NULL),
(204, 3, 'Terms and condition', 'Termos e Condições', NULL, NULL),
(205, 3, 'Refund policy', 'Política de Reembolso', NULL, NULL),
(206, 3, 'Mobile App download Link', 'Link para download do App Móvel', NULL, NULL),
(207, 3, 'Update Settings', 'Atualizar Configurações', NULL, NULL),
(208, 3, 'Title', 'Título', NULL, NULL),
(209, 3, 'designation', 'Designação', NULL, NULL),
(210, 3, 'Description', 'Descrição', NULL, NULL),
(211, 3, 'Image', 'Imagem', NULL, NULL),
(212, 3, 'Add new', 'Adicionar novo', NULL, NULL),
(213, 3, 'Remove', 'Remover', NULL, NULL),
(214, 3, 'Question', 'Pergunta', NULL, NULL),
(215, 3, 'Write a question', 'Escreva uma pergunta', NULL, NULL),
(216, 3, 'Answer', 'Resposta', NULL, NULL),
(217, 3, 'Write a question answer', 'Escreva uma resposta para a pergunta', NULL, NULL),
(218, 3, 'Contact Email', 'Email de Contato', NULL, NULL),
(219, 3, 'Phone Number', 'Número de Telefone', NULL, NULL),
(220, 3, 'Office Hours', 'Horário de Atendimento', NULL, NULL),
(221, 3, 'Location', 'Localização', NULL, NULL),
(222, 3, 'Latitude', 'Latitude', NULL, NULL),
(223, 3, 'Longitude', 'Longitude', NULL, NULL),
(224, 3, 'Recaptcha settings', 'Configurações do Recaptcha', NULL, NULL),
(225, 3, 'Recaptcha status', 'Status do Recaptcha', NULL, NULL),
(226, 3, 'Recaptcha sitekey', 'Chave do site do Recaptcha', NULL, NULL),
(227, 3, 'Recaptcha secretkey', 'Chave secreta do Recaptcha', NULL, NULL),
(228, 3, 'Update recaptcha settings', 'Atualizar configurações do Recaptcha', NULL, NULL),
(229, 3, 'Review', 'Revisão', NULL, NULL),
(230, 3, 'Add new Review', 'Adicionar nova Revisão', NULL, NULL),
(231, 3, 'No data found', 'Nenhum dado encontrado', NULL, NULL),
(232, 3, 'Upload banner image', 'Carregar imagem de banner', NULL, NULL),
(233, 3, 'Upload light logo', 'Carregar logotipo claro', NULL, NULL),
(234, 3, ' Upload dark logo', 'Carregar logotipo escuro', NULL, NULL),
(235, 3, 'Upload dark logo', 'Carregar logotipo escuro', NULL, NULL),
(236, 3, 'Upload favicon', 'Carregar favicon', NULL, NULL),
(237, 3, 'Frontend settings update successfully', 'Configurações do frontend atualizadas com sucesso', NULL, NULL),
(238, 3, 'Payment setting', 'Configuração de pagamento', NULL, NULL),
(239, 3, 'Currency Settings', 'Configurações de Moeda', NULL, NULL),
(240, 3, 'Heads up !!', 'Atenção !!', NULL, NULL),
(241, 3, 'Ensure that the system currency and all active payment gateway currencies are same', 'Certifique-se de que a moeda do sistema e todas as moedas dos gateways de pagamento ativos sejam as mesmas', NULL, NULL),
(242, 3, 'Select currency', 'Selecionar moeda', NULL, NULL),
(243, 3, 'Currency position', 'Posição da moeda', NULL, NULL),
(244, 3, 'Left', 'Esquerda', NULL, NULL),
(245, 3, 'Right', 'Direita', NULL, NULL),
(246, 3, 'Left with a space', 'Esquerda com espaço', NULL, NULL),
(247, 3, 'Right with a space', 'Direita com espaço', NULL, NULL),
(248, 3, 'No', 'Não', NULL, NULL),
(249, 3, 'Yes', 'Sim', NULL, NULL),
(250, 3, 'Want to keep test mode enabled', 'Deseja manter o modo de teste habilitado', NULL, NULL),
(251, 3, 'sandbox client id', 'id do cliente sandbox', NULL, NULL),
(252, 3, 'sandbox secret key', 'chave secreta sandbox', NULL, NULL),
(253, 3, 'production client id', 'id do cliente de produção', NULL, NULL),
(254, 3, 'production secret key', 'chave secreta de produção', NULL, NULL),
(255, 3, 'setting', 'configuração', NULL, NULL),
(256, 3, 'public key', 'chave pública', NULL, NULL),
(257, 3, 'secret key', 'chave secreta', NULL, NULL),
(258, 3, 'public live key', 'chave pública ao vivo', NULL, NULL),
(259, 3, 'secret live key', 'chave secreta ao vivo', NULL, NULL),
(260, 3, 'Certificate', 'Certificado', NULL, NULL),
(261, 3, 'Certificate template', 'Modelo de Certificado', NULL, NULL),
(262, 3, 'Build your certificate', 'Crie seu certificado', NULL, NULL),
(263, 3, 'Upload your certificate template', 'Carregue seu modelo de certificado', NULL, NULL),
(264, 3, 'Upload', 'Carregar', NULL, NULL),
(265, 3, 'Watermark Type', 'Tipo de Marca d’água', NULL, NULL),
(266, 3, 'Select an option', 'Selecione uma opção', NULL, NULL),
(267, 3, 'Disabled', 'Disabled', NULL, NULL),
(268, 3, 'Js Watermark', 'Js Watermark', NULL, NULL),
(269, 3, 'FFMpeg', 'FFMpeg', NULL, NULL),
(270, 3, 'Watermark', 'Watermark', NULL, NULL),
(271, 3, 'Opacity', 'Opacity', NULL, NULL),
(272, 3, 'Opacity (0 - 100)', 'Opacity (0 - 100)', NULL, NULL),
(273, 3, 'Width', 'Largura', NULL, NULL),
(274, 3, 'Width (px)', 'Largura (px)', NULL, NULL),
(275, 3, 'Height', 'Altura', NULL, NULL),
(276, 3, 'Height (px)', 'Altura (px)', NULL, NULL),
(277, 3, 'Top', 'Superior', NULL, NULL),
(278, 3, 'Top (px)', 'Superior (px)', NULL, NULL),
(279, 3, 'Left (px)', 'Esquerda (px)', NULL, NULL),
(280, 3, 'Manage your open ai settings', 'Gerencie suas configurações de Open AI', NULL, NULL),
(281, 3, 'Select ai model', 'Selecionar modelo de IA', NULL, NULL),
(282, 3, 'Required premium account', 'Conta premium necessária', NULL, NULL),
(283, 3, 'Max tokens', 'Máximo de tokens', NULL, NULL),
(284, 3, 'Page Builder', 'Construtor de Páginas', NULL, NULL),
(285, 3, 'Create Page', 'Criar Página', NULL, NULL),
(286, 3, '#', '#', NULL, NULL),
(287, 3, 'Page Name', 'Nome da Página', NULL, NULL),
(288, 3, 'Status', 'Status', NULL, NULL),
(289, 3, 'Action', 'Ação', NULL, NULL),
(290, 3, 'Edit Home Page', 'Editar Página Inicial', NULL, NULL),
(291, 3, 'Edit Home', 'Editar Início', NULL, NULL),
(292, 3, 'Preview', 'Pré-visualizar', NULL, NULL),
(293, 3, 'Edit Layout', 'Editar Layout', NULL, NULL),
(294, 3, 'Edit Page', 'Editar Página', NULL, NULL),
(295, 3, 'Edit', 'Editar', NULL, NULL),
(296, 3, 'Delete', 'Excluir', NULL, NULL),
(297, 3, 'Name', 'Nome', NULL, NULL),
(298, 3, 'Facebook link', 'Link do Facebook', NULL, NULL),
(299, 3, 'Twitter link', 'Link do Twitter', NULL, NULL),
(300, 3, 'Linkedin link', 'Link do LinkedIn', NULL, NULL),
(301, 3, 'A short title about yourself', 'Um título curto sobre você', NULL, NULL),
(302, 3, 'Skills', 'Habilidades', NULL, NULL),
(303, 3, 'Write your skill and click the enter button', 'Escreva sua habilidade e pressione Enter', NULL, NULL),
(304, 3, 'Biography', 'Biografia', NULL, NULL),
(305, 3, 'Photo', 'Foto', NULL, NULL),
(306, 3, 'The image size should be any square image', 'O tamanho da imagem deve ser uma imagem quadrada', NULL, NULL),
(307, 3, 'Update profile', 'Atualizar perfil', NULL, NULL),
(308, 3, 'Current password', 'Senha atual', NULL, NULL),
(309, 3, 'New password', 'Nova senha', NULL, NULL),
(310, 3, 'Confirm password', 'Confirmar senha', NULL, NULL),
(311, 3, 'Update password', 'Atualizar senha', NULL, NULL),
(312, 3, 'Motivational speech update successfully', 'Discurso motivacional atualizado com sucesso', NULL, NULL),
(313, 3, 'Website Faqs update successfully', 'Perguntas frequentes do site atualizadas com sucesso', NULL, NULL),
(314, 3, 'Contact information update successfully', 'Informações de contato atualizadas com sucesso', NULL, NULL),
(315, 3, 'Light logo update successfully', 'Logo claro atualizado com sucesso', NULL, NULL),
(316, 3, 'Course Manager', 'Gerenciador de Cursos', NULL, NULL),
(317, 3, 'Active courses', 'Cursos Ativos', NULL, NULL),
(318, 3, 'Pending courses', 'Cursos Pendentes', NULL, NULL),
(319, 3, 'Upcoming courses', 'Próximos Cursos', NULL, NULL),
(320, 3, 'Free courses', 'Cursos Gratuitos', NULL, NULL),
(321, 3, 'Paid courses', 'Cursos Pagos', NULL, NULL),
(322, 3, 'Export', 'Exportar', NULL, NULL),
(323, 3, 'PDF', 'PDF', NULL, NULL),
(324, 3, 'Print', 'Imprimir', NULL, NULL),
(325, 3, 'Filter', 'Filtrar', NULL, NULL),
(326, 3, 'All', 'Todos', NULL, NULL),
(327, 3, 'Price', 'Preço', NULL, NULL),
(328, 3, 'Free', 'Gratuito', NULL, NULL),
(329, 3, 'Paid', 'Pago', NULL, NULL),
(330, 3, 'Apply', 'Aplicar', NULL, NULL),
(331, 3, 'Search Title', 'Pesquisar título', NULL, NULL),
(332, 3, 'Search', 'Pesquisar', NULL, NULL),
(333, 3, 'Create course', 'Criar curso', NULL, NULL),
(334, 3, 'Enter Course Title', 'Insira o título do curso', NULL, NULL),
(335, 3, 'Short Description', 'Descrição curta', NULL, NULL),
(336, 3, 'Enter Short Description', 'Insira a descrição curta', NULL, NULL),
(337, 3, 'Enter Description', 'Insira a descrição', NULL, NULL),
(338, 3, 'Create as', 'Criar como', NULL, NULL),
(339, 3, 'Select a category', 'Selecione uma categoria', NULL, NULL),
(340, 3, 'Course level', 'Nível do curso', NULL, NULL),
(341, 3, 'Select your course level', 'Selecione o nível do curso', NULL, NULL),
(342, 3, 'Beginner', 'Iniciante', NULL, NULL),
(343, 3, 'Intermediate', 'Intermediário', NULL, NULL),
(344, 3, 'Advanced', 'Avançado', NULL, NULL),
(345, 3, 'Made in', 'Criado em', NULL, NULL),
(346, 3, 'Select your course language', 'Selecione o idioma do curso', NULL, NULL),
(347, 3, 'Pricing type', 'Tipo de preço', NULL, NULL),
(348, 3, 'Powered by', 'Powered by', NULL, NULL),
(349, 3, 'Check if this course has discount', 'Marque se este curso tem desconto', NULL, NULL),
(350, 3, 'Discounted price', 'Preço com desconto', NULL, NULL),
(351, 3, 'Enter your discount price', 'Insira o preço com desconto', NULL, NULL),
(352, 3, 'Thumbnail', 'Miniatura', NULL, NULL),
(353, 3, 'Finish!', 'Finalizar!', NULL, NULL),
(354, 3, 'Multi language setting', 'Configuração multilíngue', NULL, NULL),
(355, 3, 'Language list', 'Lista de idiomas', NULL, NULL),
(356, 3, 'Add Language', 'Adicionar idioma', NULL, NULL),
(357, 3, 'Import Language', 'Importar idioma', NULL, NULL),
(358, 3, 'Direction', 'Direção', NULL, NULL),
(359, 3, 'Option', 'Opção', NULL, NULL),
(360, 3, 'LTR', 'Esquerda para direita', NULL, NULL),
(361, 3, 'RTL', 'Direita para esquerda', NULL, NULL),
(362, 3, 'Edit phrase', 'Editar frase', NULL, NULL),
(363, 3, 'Add new language', 'Adicionar novo idioma', NULL, NULL),
(364, 3, 'No special character or space is allowed. Valid examples: French, Spanish, Bengali etc', 'Nenhum caractere especial ou espaço é permitido. Exemplos válidos: Francês, Espanhol, Bengali, etc.', NULL, NULL),
(365, 3, 'Save', 'Salvar', NULL, NULL),
(366, 3, 'Import your language files from here. (Ex: english.json)', 'Importe seus arquivos de idioma aqui. (Ex: english.json)', NULL, NULL),
(367, 3, 'Import', 'Importar', NULL, NULL),
(368, 3, 'phrase_updated', 'Frase atualizada', NULL, NULL),
(369, 3, 'Direction has been updated', 'Direção atualizada', NULL, NULL),
(370, 3, 'Edit ____ phrases', 'Editar frases ____', NULL, NULL),
(371, 3, 'Import all phrases from english', 'Importar todas as frases do inglês', NULL, NULL),
(372, 3, 'Back', 'Voltar', NULL, NULL),
(373, 3, 'Phrase updated', 'Frase atualizada', NULL, NULL),
(374, 3, 'Showing', 'Mostrando', NULL, NULL),
(375, 3, 'of', 'de', NULL, NULL),
(376, 3, 'data', 'dados', NULL, NULL),
(377, 3, 'Grid', 'Grade', NULL, NULL),
(378, 3, 'List', 'Lista', NULL, NULL),
(379, 3, 'Categories', 'Categorias', NULL, NULL),
(380, 3, 'Discount', 'Desconto', NULL, NULL),
(381, 3, 'Level', 'Nível', NULL, NULL),
(382, 3, 'Spanish', 'Espanhol', NULL, NULL),
(383, 3, 'Italic', 'Itálico', NULL, NULL),
(384, 3, 'German', 'Alemão', NULL, NULL),
(385, 3, 'Ratings', 'Avaliações', NULL, NULL),
(386, 3, 'No data found !', 'Nenhum dado encontrado!', NULL, NULL),
(387, 3, 'Please attempt utilizing the suitable keywords in your search query to obtain more precise results.', 'Por favor, tente utilizar palavras-chave adequadas em sua consulta de busca para obter resultados mais precisos.', NULL, NULL),
(388, 3, 'All Category', 'Todas as Categorias', NULL, NULL),
(389, 3, 'Add new category', 'Adicionar nova categoria', NULL, NULL),
(390, 3, 'Category Name', 'Nome da Categoria', NULL, NULL),
(391, 3, 'Enter your category name', 'Insira o nome da sua categoria', NULL, NULL),
(392, 3, 'Enter your unique category name', 'Insira o nome único da sua categoria', NULL, NULL),
(393, 3, 'Pick Your Icon', 'Escolha seu ícone', NULL, NULL),
(394, 3, 'Pick your category icon', 'Escolha o ícone da sua categoria', NULL, NULL),
(395, 3, 'Keywords', 'Palavras-chave', NULL, NULL),
(396, 3, 'optional', 'opcional', NULL, NULL),
(397, 3, 'Category Description', 'Descrição da Categoria', NULL, NULL),
(398, 3, 'Enter your description', 'Insira sua descrição', NULL, NULL),
(399, 3, 'Category logo', 'Logo da Categoria', NULL, NULL),
(400, 3, 'Category added successfully', 'Categoria adicionada com sucesso', NULL, NULL),
(401, 3, 'Add', 'Adicionar', NULL, NULL),
(402, 3, 'Edit category', 'Editar categoria', NULL, NULL),
(403, 3, 'Course added successfully', 'Curso adicionado com sucesso', NULL, NULL),
(404, 3, 'Edit course', 'Editar curso', NULL, NULL),
(405, 3, 'Editing', 'Editando', NULL, NULL),
(406, 3, 'Help', 'Ajuda', NULL, NULL),
(407, 3, 'Frontend View', 'Visualização do Frontend', NULL, NULL),
(408, 3, 'Course Player', 'Reprodutor de Curso', NULL, NULL),
(409, 3, 'Curriculum', 'Currículo', NULL, NULL),
(410, 3, 'Basic', 'Básico', NULL, NULL),
(411, 3, 'Live Class', 'Aula ao vivo', NULL, NULL),
(412, 3, 'Pricing', 'Preços', NULL, NULL),
(413, 3, 'Info', 'Informações', NULL, NULL),
(414, 3, 'Media', 'Mídia', NULL, NULL),
(415, 3, 'SEO', 'SEO', NULL, NULL),
(416, 3, 'Add new section', 'Adicionar nova seção', NULL, NULL),
(417, 3, 'Add section', 'Adicionar seção', NULL, NULL),
(418, 3, 'Add a new Section', 'Adicionar uma nova seção', NULL, NULL),
(419, 3, 'Payment settings update successfully', 'Configurações de pagamento atualizadas com sucesso', NULL, NULL),
(420, 3, 'lesson', 'lição', NULL, NULL),
(421, 3, 'Students', 'Estudantes', NULL, NULL),
(422, 3, 'by', 'por', NULL, NULL),
(423, 3, 'Bootcamp Manager', 'Gerente de Bootcamp', NULL, NULL),
(424, 3, 'Manage Bootcamp', 'Gerenciar Bootcamp', NULL, NULL),
(425, 3, 'Discounted', 'Com desconto', NULL, NULL),
(426, 3, 'Create bootcamp', 'Criar bootcamp', NULL, NULL),
(427, 3, 'Enter your course price', 'Insira o preço do seu curso', NULL, NULL),
(428, 3, 'Check if this bootcamp has discount', 'Marque se este bootcamp tiver desconto', NULL, NULL),
(429, 3, 'Publish Date', 'Data de Publicação', NULL, NULL),
(430, 3, 'Your changes has been saved.', 'Suas alterações foram salvas.', NULL, NULL),
(431, 3, 'Already have account.', 'Já tem conta.', NULL, NULL),
(432, 3, 'Sign in', 'Entrar', NULL, NULL),
(433, 3, 'My courses', 'Meus cursos', NULL, NULL),
(434, 3, 'Upload picture', 'Carregar foto', NULL, NULL),
(435, 3, 'Upload New', 'Carregar nova', NULL, NULL),
(436, 3, 'My Bootcamps', 'Meus Bootcamps', NULL, NULL),
(437, 3, 'My Teams', 'Minhas equipes', NULL, NULL),
(438, 3, 'Become an instructor', 'Torne-se um Professor', NULL, '2024-12-20 15:14:35'),
(439, 3, 'Please try using the appropriate keywords.', 'Tente usar as palavras-chave apropriadas.', NULL, NULL),
(440, 3, 'My Team Packages', 'Meus pacotes de equipe', NULL, NULL),
(441, 3, 'Personal Information', 'Informações pessoais', NULL, NULL),
(442, 3, 'Full Name', 'Nome completo', NULL, NULL),
(443, 3, 'Website', 'Site', NULL, NULL),
(444, 3, 'Search user email...', 'Pesquisar e-mail do usuário...', NULL, NULL),
(445, 3, 'Message someone and chat right now!', 'Envie uma mensagem para alguém e converse agora!', NULL, NULL),
(446, 3, 'Wishlisted courses', 'Cursos na lista de desejos', NULL, NULL),
(447, 3, 'Profile picture updated.', 'Foto de perfil atualizada.', NULL, NULL),
(448, 3, 'Clear', 'Limpar', NULL, NULL),
(449, 3, 'Course Details', 'Detalhes do curso', NULL, NULL),
(450, 3, 'Certificate Course', 'Curso com certificado', NULL, NULL),
(451, 3, 'Overview', 'Visão geral', NULL, NULL),
(452, 3, 'Details', 'Detalhes', NULL, NULL),
(453, 3, 'Reviews', 'Avaliações', NULL, NULL),
(454, 3, 'Course Overview', 'Visão geral do curso', NULL, NULL),
(455, 3, 'See more', 'Ver mais', NULL, NULL),
(456, 3, 'FAQ area empty', 'Área de FAQ vazia', NULL, NULL),
(457, 3, 'Course curriculum', 'Currículo do curso', NULL, NULL),
(458, 3, 'Course curriculum Empty', 'Currículo do curso vazio', NULL, NULL),
(459, 3, 'Requirment', 'Requisitos', NULL, NULL),
(460, 3, 'Outcomes', 'Resultados', NULL, NULL),
(461, 3, 'View Details', 'Ver detalhes', NULL, NULL),
(462, 3, 'Rate this course : ', 'Avalie este curso:', NULL, NULL),
(463, 3, 'Remove all', 'Remover tudo', NULL, NULL),
(464, 3, 'Write a reveiw ...', 'Escreva uma avaliação ...', NULL, NULL),
(465, 3, 'Buy Now', 'Comprar agora', NULL, NULL),
(466, 3, 'Add to cart', 'Adicionar ao carrinho', NULL, NULL),
(467, 3, 'Duration', 'Duração', NULL, NULL),
(468, 3, 'Share', 'Compartilhar', NULL, NULL),
(469, 3, 'Share on Facebook', 'Compartilhar no Facebook', NULL, NULL),
(470, 3, 'Share on Twitter', 'Compartilhar no Twitter', NULL, NULL),
(471, 3, 'Share on Whatsapp', 'Compartilhar no Whatsapp', NULL, NULL),
(472, 3, 'Share on Linkedin', 'Compartilhar no Linkedin', NULL, NULL),
(473, 3, 'Shopping cart', 'Carrinho de compras', NULL, NULL),
(474, 3, 'Cart items', 'Itens do carrinho', NULL, NULL),
(475, 3, 'Payment summary', 'Resumo de pagamento', NULL, NULL),
(476, 3, 'Sub total', 'Subtotal', NULL, NULL),
(477, 3, 'Tax', 'Imposto', NULL, NULL),
(478, 3, '%', '%', NULL, NULL),
(479, 3, 'Total', 'Total', NULL, NULL),
(480, 3, 'Apply coupon', 'Aplicar cupom', NULL, NULL),
(481, 3, 'Send as a gift', 'Enviar como presente', NULL, NULL),
(482, 3, 'Enter user email', 'Digite o e-mail do usuário', NULL, NULL),
(483, 3, 'Continue to payment', 'Continuar para pagamento', NULL, NULL),
(484, 3, '500 error found', 'Erro 500 encontrado', NULL, NULL),
(485, 3, 'A technical error has occurred', 'Ocorreu um erro técnico', NULL, NULL),
(486, 3, 'Please contact with site administrator', 'Por favor, entre em contato com o administrador do site', NULL, NULL),
(487, 3, 'Back to home', 'Voltar para a página inicial', NULL, NULL),
(975, 3, 'Language added successfully', 'Idioma adicionado com sucesso', NULL, '2024-10-01 18:01:24'),
(976, 3, 'Delete language', 'Excluir idioma', NULL, '2024-10-01 18:01:17'),
(977, 3, 'Dark logo update successfully', 'Atualização do logotipo escuro com sucesso', NULL, '2024-10-01 18:01:11'),
(978, 3, '404 not found', '404 não encontrado', NULL, '2024-10-01 18:01:05'),
(979, 3, 'The page you requested could not be found', 'A página que você solicitou não foi encontrada', NULL, '2024-10-01 18:00:58'),
(980, 3, 'Please try the following', 'Por favor, tente o seguinte', NULL, '2024-10-01 18:00:51'),
(981, 3, 'Check the spelling of the url', 'Verifique a ortografia do URL', NULL, '2024-10-01 18:00:45'),
(982, 3, 'If you are still puzzled, click on the home link below', 'Se você ainda está confuso, clique no link inicial abaixo', NULL, '2024-10-01 18:00:40'),
(983, 3, 'Contact us', 'Contate-nos', NULL, '2024-10-01 18:00:33'),
(984, 3, 'We\'re always here to help you.', 'Estamos sempre aqui para ajudá-lo.', NULL, '2024-10-01 18:00:27'),
(985, 3, 'Our Address', 'Nosso endereço', NULL, '2024-10-01 18:00:22'),
(986, 3, 'Our location', 'Nossa localização', NULL, '2024-10-01 18:00:15'),
(987, 3, 'Contact Info', 'Informações de contato', NULL, '2024-10-01 18:00:09'),
(988, 3, 'Open a chat or give us call at', 'Abra um chat ou ligue para nós em', NULL, '2024-10-01 18:00:04'),
(989, 3, 'Send your message', 'Envie sua mensagem', NULL, '2024-10-01 17:59:56'),
(990, 3, 'Send Message', 'Enviar mensagem', NULL, '2024-10-01 17:59:49'),
(991, 3, 'Language deleted successfully', 'Idioma excluído com sucesso', NULL, '2024-10-01 18:04:29'),
(992, 3, 'Manage content', 'Gerenciar conteúdo', NULL, '2024-10-01 18:12:34'),
(993, 3, 'Text editor', 'Text editor', NULL, NULL),
(994, 3, 'Text color', 'Text color', NULL, NULL),
(995, 3, 'Padding', 'Preenchimento', NULL, '2024-10-01 18:12:24'),
(996, 3, 'Margin', 'Margin', NULL, NULL),
(997, 3, 'Border', 'Border', NULL, NULL),
(998, 3, 'none', 'nenhum', NULL, '2024-10-01 18:12:17'),
(999, 3, 'dashed', 'dashed', NULL, NULL),
(1000, 3, 'dotted', 'dotted', NULL, NULL),
(1001, 3, 'Border roundness', 'Redondeza da borda', NULL, '2024-10-01 18:12:08'),
(1002, 3, 'Border color', 'Border color', NULL, NULL),
(1003, 3, 'Background color', 'Background color', NULL, NULL),
(1004, 3, 'Page layout has been updated', 'O layout da página foi atualizado', NULL, '2024-10-01 18:12:03'),
(1005, 3, 'Lesson & Section', 'Lição e Seção', NULL, '2024-10-14 05:14:26'),
(1006, 3, 'Enrolled Student', 'Aluno Matriculado', NULL, '2024-10-14 05:14:19'),
(1007, 3, 'Options', 'Opções', NULL, '2024-10-14 05:14:11'),
(1008, 3, 'Section', 'Seção', NULL, '2024-10-14 05:14:04'),
(1009, 3, 'View Course On Frontend', 'Ver curso no frontend', NULL, '2024-10-14 05:13:58'),
(1010, 3, 'Go To Course Playing Page', 'Vá para a página de jogo do curso', NULL, '2024-10-14 05:13:50'),
(1011, 3, 'Duplicate Course', 'Curso duplicado', NULL, '2024-10-14 05:13:43'),
(1012, 3, 'Make As Inactive', 'Tornar como inativo', NULL, '2024-10-14 05:13:36'),
(1013, 3, 'Delete Course', 'Excluir curso', NULL, '2024-10-14 05:13:29'),
(1014, 3, 'Bootcamps', 'Bootcamps', NULL, NULL),
(1015, 3, 'All Bootcamps', 'Todos os Bootcamps', NULL, '2024-10-14 05:13:20'),
(1016, 3, 'Enroll Students', 'Inscrever Alunos', NULL, '2024-10-14 05:13:13'),
(1017, 3, 'Course to enrol', 'Curso para se inscrever', NULL, '2024-10-14 05:13:07'),
(1018, 3, 'Select a course', 'Selecione um curso', NULL, '2024-10-14 05:13:01'),
(1019, 3, 'Configure ZOOM server-to-server-oauth credentials', 'Configurar credenciais oauth de servidor para servidor ZOOM', NULL, '2024-10-14 05:12:53'),
(1020, 3, 'Account Email', 'Conta de E-Mail', NULL, '2024-10-14 05:12:46'),
(1021, 3, 'Account ID', 'Account ID', NULL, NULL),
(1022, 3, 'Client ID', 'Client ID', NULL, NULL),
(1023, 3, 'Client Secret', 'Client Secret', NULL, NULL),
(1024, 3, 'Do you want to use Web SDK for your live class?', 'Você deseja usar o Web SDK para suas aulas ao vivo?', NULL, '2024-10-14 05:12:30'),
(1025, 3, 'Meeting SDK Client ID', 'Meeting SDK Client ID', NULL, NULL),
(1026, 3, 'Meeting SDK Client Secret', 'Meeting SDK Client Secret', NULL, NULL),
(1027, 3, 'sandbox access token', 'sandbox access token', NULL, NULL),
(1028, 3, 'production access token', 'token de acesso à produção', NULL, '2024-10-14 05:12:22'),
(1029, 3, 'Comprar agora', 'Comprar agora', NULL, NULL),
(1030, 3, 'Ops! You own this course.', 'Ops! Você possui este curso.', NULL, '2024-10-14 05:12:15'),
(1031, 3, 'Remove from cart', 'Remover do carrinho', NULL, '2024-10-14 05:12:06'),
(1032, 3, 'Not found', 'Não encontrado', NULL, '2024-10-14 05:12:00'),
(1033, 3, 'About This Application', 'Sobre este aplicativo', NULL, '2024-10-14 05:11:54'),
(1034, 3, 'Software version', 'Versão do software', NULL, '2024-10-14 05:11:45'),
(1035, 3, 'Laravel version', 'Versão Laravel', NULL, '2024-10-14 05:11:38'),
(1036, 3, 'Check update', 'Verifique a atualização', NULL, '2024-10-14 05:11:29'),
(1037, 3, 'Php version', 'Php version', NULL, NULL),
(1038, 3, 'Curl enable', 'Curl enable', NULL, NULL),
(1039, 3, 'enabled', 'habilitado', NULL, '2024-10-14 05:11:19'),
(1040, 3, 'Product license', 'Licença do produto', NULL, '2024-10-14 05:11:10'),
(1041, 3, 'Enter valid purchase code', 'Insira um código de compra válido', NULL, '2024-10-14 05:11:04'),
(1042, 3, 'Customer support status', 'Status do suporte ao cliente', NULL, '2024-10-14 05:10:58'),
(1043, 3, 'Support expiry date', 'Data de expiração do suporte', NULL, '2024-10-14 05:10:52'),
(1044, 3, 'Customer name', 'Nome do cliente', NULL, '2024-10-14 05:10:45'),
(1045, 3, 'Customer support', 'Suporte ao cliente', NULL, '2024-10-14 05:10:39'),
(1604, 3, 'Manage SEO Settings', 'Gerenciar configurações de SEO', NULL, '2024-12-10 15:22:20'),
(1605, 3, 'Meta Title', 'Metatítulo', NULL, '2024-12-10 15:22:26'),
(1606, 3, 'Meta Keywords', 'Meta Keywords', NULL, NULL),
(1607, 3, 'Writing your keyword and hit the enter', 'Escreva sua palavra-chave e pressione Enter', NULL, '2024-12-10 15:22:34'),
(1608, 3, 'Meta Description', 'Meta descrição', NULL, '2024-12-10 15:22:40'),
(1609, 3, 'Meta Robot', 'Meta Robô', NULL, '2024-12-10 15:22:47'),
(1610, 3, ' Canonical Url', 'URL canônico', NULL, '2024-12-10 15:22:54'),
(1611, 3, ' Custom Url', 'URL personalizado', NULL, '2024-12-10 15:23:00'),
(1612, 3, 'Og Title', 'Og Titulo', NULL, '2024-12-10 15:23:11'),
(1613, 3, 'Og Description', 'Og Descrição', NULL, '2024-12-10 15:23:20'),
(1614, 3, 'Og Image', 'Og Imagem', NULL, '2024-12-10 15:23:21'),
(1615, 3, 'Json Id', 'Json Id', NULL, NULL),
(1616, 3, 'Notification settings', 'Config de notificação', NULL, '2024-12-10 15:23:34'),
(1617, 3, 'Protocol', 'Protocolo', NULL, '2024-12-10 15:23:45'),
(1618, 3, 'Smtp crypto', 'Smtp crypto', NULL, NULL),
(1619, 3, 'Smtp host', 'Smtp host', NULL, NULL),
(1620, 3, 'Smtp port', 'Smtp port', NULL, NULL),
(1621, 3, 'Smtp from email', 'Smtp from email', NULL, NULL),
(1622, 3, 'Smtp username', 'Nome de usuário SMTP', NULL, '2024-12-10 15:25:19'),
(1623, 3, 'Smtp password', 'Senha SMTP', NULL, '2024-12-10 15:25:22'),
(1624, 3, 'Student email verification', 'Verificação de e-mail do aluno', NULL, '2024-12-10 15:25:28'),
(1625, 3, 'Select your service', 'Selecione seu serviço', NULL, '2024-12-10 15:25:34'),
(1626, 3, 'Course title', 'Título do curso', NULL, '2024-12-10 15:25:41'),
(1627, 3, 'Course short description', 'Breve descrição do curso', NULL, '2024-12-10 15:25:46'),
(1628, 3, 'Course long description', 'Descrição longa do curso', NULL, '2024-12-19 14:58:44'),
(1629, 3, 'Course requirements', 'Course requirements', NULL, NULL),
(1630, 3, 'Course outcomes', 'Resultados do curso', NULL, '2024-12-10 15:21:54'),
(1631, 3, 'Course faq', 'Perguntas frequentes do curso', NULL, '2024-12-10 15:21:47'),
(1632, 3, 'Course seo tags', 'Tags de SEO do curso', NULL, '2024-12-10 15:21:41'),
(1633, 3, 'Course lesson text', 'Texto da lição do curso', NULL, '2024-12-10 15:21:36'),
(1634, 3, 'Course certificate text', 'Texto do certificado do curso', NULL, '2024-12-10 15:21:17'),
(1635, 3, 'Course quiz text', 'Texto do teste do curso', NULL, '2024-12-10 15:21:23'),
(1636, 3, 'Course blog title', 'Título do blog do curso', NULL, '2024-12-10 15:21:29'),
(1637, 3, 'Course blog post', 'Postagem no blog do curso', NULL, '2024-12-10 15:21:11'),
(1638, 3, 'Course thumbnail', 'Miniatura do curso', NULL, '2024-12-10 15:21:06'),
(1639, 3, 'Enter your keyword', 'Insira sua palavra-chave', NULL, '2024-12-10 15:21:00'),
(1640, 3, 'Generate', 'Gerar', NULL, '2024-12-10 15:20:53'),
(1641, 3, 'Generating', 'Gerando', NULL, '2024-12-10 15:20:47'),
(1642, 3, 'Your images', 'Suas imagens', NULL, '2024-12-10 15:20:41'),
(1643, 3, 'Generated text', 'Texto gerado', NULL, '2024-12-10 15:20:19'),
(1644, 3, 'Copy', 'Copiar', NULL, '2024-12-10 15:20:28'),
(1645, 3, 'Copied', 'Copiado', NULL, '2024-12-10 15:20:32'),
(1646, 3, 'Click here to choose a banner image', 'Clique aqui para escolher uma imagem de banner', NULL, '2024-12-10 15:19:59'),
(1647, 3, 'Click here to choose a light logo', 'Clique aqui para escolher um logotipo leve', NULL, '2024-12-10 15:20:06'),
(1648, 3, 'Click here to choose a dark logo', 'Clique aqui para escolher um logotipo escuro', NULL, '2024-12-10 15:20:11'),
(1649, 3, 'Click here to choose a favicon', 'Clique aqui para escolher um favicon', NULL, '2024-12-10 15:19:42'),
(1650, 3, 'paytm merchant key', 'chave do comerciante paytm', NULL, '2024-12-10 15:19:47'),
(1651, 3, 'paytm merchant mid', 'comerciante paytm médio', NULL, '2024-12-10 15:19:53'),
(1652, 3, 'paytm merchant website', 'Site do comerciante Paytm', NULL, '2024-12-19 14:58:13'),
(1653, 3, 'industry type id', 'ID do tipo de indústria', NULL, '2024-12-10 15:19:28'),
(1654, 3, 'channel id', 'ID do canal', NULL, '2024-12-10 15:19:34'),
(1655, 3, 'Choose an option', 'Escolha uma opção', NULL, '2024-12-10 15:19:16'),
(1656, 3, 'bank information', 'informações bancárias', NULL, '2024-12-10 15:19:10'),
(1657, 3, 'secret test key', 'chave de teste secreta', NULL, '2024-12-10 15:19:04'),
(1658, 3, 'public test key', 'chave de teste pública', NULL, '2024-12-10 15:18:58'),
(1659, 3, 'Student List', 'Lista de Alunos', NULL, '2024-12-19 14:57:51'),
(1660, 3, 'Search user', 'Pesquisar usuário', NULL, '2024-12-19 14:57:59'),
(1661, 3, 'Enrolled Course', 'Curso Inscrito', NULL, '2024-12-19 14:57:42'),
(1662, 3, 'Create Student', 'Criar aluno', NULL, '2024-12-19 14:57:35'),
(1663, 3, 'Student Info', 'Informações do aluno', NULL, '2024-12-19 14:57:28'),
(1664, 3, 'Login Credentials', 'Credenciais de login', NULL, '2024-12-19 14:57:19'),
(1665, 3, 'Social Links', 'Social Links', NULL, NULL),
(1666, 3, 'User image', 'Imagem do usuário', NULL, '2024-12-19 14:57:11'),
(1667, 3, 'Update Student', 'Atualizar aluno', NULL, '2024-12-19 14:57:03'),
(1668, 3, 'Student update successfully', 'Atualização do aluno com sucesso', NULL, '2024-12-19 14:56:56'),
(1669, 3, 'Email Verification', 'Verificação de e-mail', NULL, '2024-12-19 14:56:49'),
(1670, 3, 'Thanks for signing up! Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn\'t receive the email, we will gladly send you another.', 'Obrigado por se inscrever! Antes de começar, você poderia verificar seu endereço de e-mail clicando no link que acabamos de enviar por e-mail? Se você não recebeu o e-mail, teremos o prazer de enviar outro.', NULL, '2024-12-19 14:56:25'),
(1671, 3, 'Resend Verification Email', 'Reenviar e-mail de verificação', NULL, '2024-12-19 14:56:33'),
(1672, 3, 'Course deleted successfully', 'Curso excluído com sucesso', NULL, '2024-12-19 14:56:40'),
(1673, 3, 'Student add successfully', 'Aluno adiciona com sucesso', NULL, '2024-12-19 14:56:15'),
(1674, 3, 'Order summary', 'Resumo do pedido', NULL, '2024-12-19 14:56:08'),
(1675, 3, 'Cancel Payment', 'Cancelar pagamento', NULL, '2024-12-19 14:55:59'),
(1676, 3, 'Select payment gateway', 'Selecione o gateway de pagamento', NULL, '2024-12-19 14:55:35'),
(1677, 3, 'Item List', 'Lista de itens', NULL, '2024-12-19 14:55:42'),
(1678, 3, 'Grand Total', 'Total geral', NULL, '2024-12-19 14:55:50'),
(1679, 3, 'Payment not configured yet', 'Pagamento ainda não configurado', NULL, '2024-12-19 14:55:26'),
(1680, 3, 'access token', 'access token', NULL, NULL),
(1681, 3, 'Pay by MercadoPago', 'Pagar via MercadoPago', NULL, '2024-12-19 14:55:20'),
(1682, 3, 'Payment Document', 'Documento de pagamento', NULL, '2024-12-19 14:54:53'),
(1683, 3, '(jpg, pdf, txt, png, docx)', '(jpg, pdf, txt, png, docx)', NULL, NULL),
(1684, 3, 'Pay offline', 'Pagar offline', NULL, '2024-12-19 14:55:02'),
(1685, 3, 'The payment will be completed once the admin reviews and approves it.', 'O pagamento será concluído assim que o administrador o revisar e aprovar.', NULL, '2024-12-19 14:54:45'),
(1686, 3, 'Admins', 'Admins', NULL, NULL),
(1687, 3, 'Admin List', 'Admin List', NULL, NULL),
(1688, 3, 'Number Of Course', 'Número do curso', NULL, '2024-12-19 14:53:00'),
(1689, 3, 'Root Admin', 'Root Admin', NULL, NULL),
(1690, 3, 'Assign permission', 'Atribuir permissão', NULL, '2024-12-19 14:54:34'),
(1691, 3, 'Admin delete successfully', 'Exclusão de administrador com sucesso', NULL, '2024-12-19 14:54:26'),
(1692, 3, 'Approved', 'Aprovado', NULL, '2024-12-19 14:52:42'),
(1693, 3, 'Suspended', 'Suspenso', NULL, '2024-12-19 14:45:01'),
(1694, 3, 'User', 'Usuário', NULL, '2024-12-19 14:44:41'),
(1695, 3, 'Items', 'Itens', NULL, '2024-12-19 14:44:45'),
(1696, 3, 'Issue date', 'Data de emissão', NULL, '2024-12-19 14:44:53'),
(1697, 3, 'Payment info', 'Informações de pagamento', NULL, '2024-12-19 14:44:36'),
(1698, 3, 'Download', 'Download', NULL, NULL),
(1699, 3, 'Accept', 'Aceitar', NULL, '2024-12-19 14:44:20'),
(1700, 3, 'Decline', 'Não Aceitar', NULL, '2024-12-19 14:44:25'),
(1701, 3, 'Accepted', 'Aceitado', NULL, '2024-12-19 14:52:29'),
(1702, 3, 'SMTP setting update successfully', 'Atualização de configuração SMTP com êxito', NULL, '2024-12-19 15:03:42'),
(1703, 3, 'Private Message', 'Mensagem privada', NULL, '2024-12-19 18:55:43'),
(1704, 3, 'Chat List', 'Lista de Chat', NULL, '2024-12-19 18:55:54'),
(1705, 3, 'Create a new thread', 'Criar um novo tópico', NULL, '2024-12-19 18:56:03'),
(1706, 3, 'New message', 'Nova mensagem', NULL, '2024-12-19 18:55:35'),
(1707, 3, 'Search Here', 'Search Here', NULL, NULL),
(1708, 3, 'Animation speed', 'Animation speed', NULL, NULL),
(1709, 3, 'Second (0 - 10000)', 'Second (0 - 10000)', NULL, NULL),
(1710, 3, 'Home page activated', 'Página inicial ativada', NULL, '2024-12-19 18:55:02'),
(1711, 3, 'Education For Eeveryone', 'Educação para todos', NULL, '2024-12-19 18:54:48'),
(1712, 3, 'User already register and signing up for using it', 'O usuário já se registra e se inscreve para usá-lo', NULL, '2024-12-19 18:54:18'),
(1713, 3, 'Online Instructor have a new ideas every week.', 'Professor on-line tem novas ideias a cada semana.', NULL, '2024-12-20 15:14:45'),
(1714, 3, 'Latest Top Skills', 'Principais habilidades mais recentes', NULL, '2024-12-19 18:54:36'),
(1715, 3, 'Awesome  site the top advertising been business.', 'Site incrível a publicidade superior foi negócio.', NULL, '2024-12-19 18:54:09'),
(1716, 3, 'Industry Experts ', 'Industry Experts ', NULL, NULL),
(1717, 3, 'Learning From Anywhere', 'Learning From Anywhere', NULL, NULL),
(1718, 3, 'Special Featured Course.', 'Curso especial em destaque.', NULL, '2024-12-19 18:53:56'),
(1719, 3, 'View More', 'Veja mais', NULL, '2024-12-19 18:53:47'),
(1720, 3, 'Know About Academy LMS Learning Platform', 'Conheça a plataforma de aprendizagem Academy LMS', NULL, '2024-12-19 18:53:39'),
(1721, 3, 'Far far away, behind the word mountains, far from the away countries Vokalia and Consonantia, there live the blind texts.', 'Muito longe, atrás da palavra montanhas, longe dos países distantes Vokalia e Consonantia, vivem os textos cegos.', NULL, '2024-12-19 18:53:02'),
(1722, 3, 'WHY CHOOSE US', 'POR QUE NOS ESCOLHER', NULL, '2024-12-19 18:53:11'),
(1723, 3, 'Free Resources Learning English for Beginner', 'Recursos gratuitos Aprendendo inglês para iniciantes', NULL, '2024-12-19 18:53:28'),
(1724, 3, 'Far far away, behind the word mountains, far from the away countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.', 'Muito longe, atrás da palavra montanhas, longe dos países distantes Vokalia e Consonantia, vivem os textos cegos. Separados, eles vivem em Bookmarksgrove, bem na costa da Semântica, um grande oceano linguístico.', NULL, '2024-12-19 18:52:51'),
(1725, 3, 'Instructor have a new ideas every week.', 'O Professor tem novas ideias a cada semana.', NULL, '2024-12-20 15:14:55'),
(1726, 3, 'Meet Our Team', 'Conheça nossa equipe', NULL, '2024-12-19 18:52:34'),
(1727, 3, 'What the people Thinks About Us', 'O que as pessoas pensam sobre nós', NULL, '2024-12-19 18:52:23'),
(1728, 3, 'Our Latest Blog', 'Nosso blog mais recente', NULL, '2024-12-19 18:52:15'),
(1729, 3, 'Enter your page name', 'Digite o nome da sua página', NULL, '2024-12-19 18:52:07'),
(1730, 3, 'Fileinfo extension', 'Extensão Fileinfo', NULL, '2024-12-19 18:51:33'),
(1731, 3, 'Course updated successfully', 'Curso atualizado com sucesso', NULL, '2024-12-19 18:51:43'),
(1732, 3, 'Add a new live class', 'Add uma nova aula ao vivo', NULL, '2024-12-19 18:51:57'),
(1733, 3, 'Schedule a new live class', 'Agende uma nova aula ao vivo', NULL, '2024-12-19 18:51:24'),
(1734, 3, 'Class topic', 'Tópico da aula', NULL, '2024-12-19 18:51:16'),
(1735, 3, 'Class Schedule', 'Horário das aulas', NULL, '2024-12-19 18:51:08'),
(1736, 3, 'Discount type', 'Tipo de desconto', NULL, '2024-12-19 18:51:00'),
(1737, 3, 'FAQ question', 'Pergunta de perguntas frequentes', NULL, '2024-12-19 18:50:53'),
(1738, 3, 'Requirements', 'Requisitos', NULL, '2024-12-19 18:50:44'),
(1739, 3, 'Provide requirements', 'Forneça requisitos', NULL, '2024-12-19 18:50:26'),
(1740, 3, 'Provide outcomes', 'Forneça resultados', NULL, '2024-12-19 18:50:35'),
(1741, 3, 'Banner', 'Banner', NULL, NULL),
(1742, 3, 'Preview Video', 'Visualizar vídeo', NULL, '2024-12-19 18:50:17'),
(1743, 3, 'Video Link', 'Video Link', NULL, NULL),
(1744, 3, 'Video File', 'Arquivo de vídeo', NULL, '2024-12-19 18:50:08'),
(1745, 3, 'Supported URL', 'URL suportada', NULL, '2024-12-19 18:49:56'),
(1746, 3, 'Youtube', 'Youtube', NULL, NULL),
(1747, 3, 'or', 'ou', NULL, '2024-12-19 18:49:45'),
(1748, 3, 'Vimeo', 'Vimeo', NULL, NULL),
(1749, 3, 'HTML5', 'HTML5', NULL, NULL),
(1750, 3, 'Preview Video File', 'Visualizar arquivo de vídeo', NULL, '2024-12-19 18:49:41'),
(1751, 3, 'Supported Video file', 'Arquivo de vídeo suportado', NULL, '2024-12-19 18:49:31'),
(1752, 3, 'mp4', 'mp4', NULL, NULL),
(1753, 3, 'webm', 'webm', NULL, NULL),
(1754, 3, 'ogg', 'ogg', NULL, NULL),
(1755, 3, 'Parent category', 'Categoria pai', NULL, '2024-12-19 18:49:13'),
(1756, 3, '- Mark it as parent -', '- Marque-o como pai -', NULL, '2024-12-19 18:49:22'),
(1757, 3, 'Choose category thumbnail', 'Escolher miniatura da categoria', NULL, '2024-12-19 18:49:02'),
(1758, 3, 'Choose category Logo', 'Escolha a categoria Logotipo', NULL, '2024-12-19 18:48:54'),
(1759, 3, 'Category updated successfully', 'Categoria atualizada com sucesso', NULL, '2024-12-19 18:48:46'),
(1760, 3, 'Start Now', 'Comece agora', NULL, '2024-12-19 19:05:21'),
(1761, 3, 'Progress', 'Progresso', NULL, '2024-12-19 19:05:13'),
(1762, 3, 'Course Playing Page', 'Página de jogo do curso', NULL, '2024-12-19 19:05:06'),
(1763, 3, 'Summary', 'Resumo', NULL, '2024-12-19 19:04:43'),
(1764, 3, 'Forum', 'Forum', NULL, NULL),
(1765, 3, 'Class Schedules', 'Horários das aulas', NULL, '2024-12-19 19:04:52'),
(1766, 3, 'Topic', 'Tópico', NULL, '2024-12-19 19:04:37'),
(1767, 3, 'Date & time', 'Data e hora', NULL, '2024-12-19 19:04:30'),
(1768, 3, 'Keep up the great work!', 'Continue com o ótimo trabalho!', NULL, '2024-12-19 19:04:23'),
(1769, 3, 'Your dedication to ongoing progress is inspiring.', 'Sua dedicação ao progresso contínuo é inspiradora.', NULL, '2024-12-19 19:04:14');
INSERT INTO `language_phrases` (`id`, `language_id`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(1770, 3, 'Every step forward is a testament to your commitment to growth and excellence.', 'Cada passo à frente é uma prova de seu compromisso com o crescimento e a excelência.', NULL, '2024-12-19 19:04:06'),
(1771, 3, 'Stay focused, stay determined, and continue to push yourself to new heights.', 'Mantenha o foco, mantenha-se determinado e continue a se esforçar para novas alturas.', NULL, '2024-12-19 19:03:58'),
(1772, 3, 'You have got this!', 'Você conseguiu!', NULL, '2024-12-19 19:03:49'),
(1773, 3, 'Search answers here', 'Pesquise as respostas aqui', NULL, '2024-12-19 19:03:41'),
(1774, 3, 'Questions in this course', 'Perguntas neste curso', NULL, '2024-12-19 19:03:35'),
(1775, 3, 'Ask question', 'Faça uma pergunta', NULL, '2024-12-19 19:03:27'),
(1776, 3, 'Completed', 'Concluído', NULL, '2024-12-19 19:03:20'),
(1777, 3, 'Enter title', 'Digite o título', NULL, '2024-12-19 19:03:12'),
(1778, 3, 'Section added successfully', 'Seção adicionada com sucesso', NULL, '2024-12-19 19:03:04'),
(1779, 3, 'Add new lesson', 'Add nova aula', NULL, '2024-12-19 19:02:56'),
(1780, 3, 'Add lesson', 'Add aula', NULL, '2024-12-19 19:02:48'),
(1781, 3, 'Add new quiz', 'Add nova prova', NULL, '2024-12-19 19:02:40'),
(1782, 3, 'Add quiz', 'Add Prova', NULL, '2024-12-19 19:02:33'),
(1783, 3, 'Sort sections', 'Classificar seções', NULL, '2024-12-19 19:02:22'),
(1784, 3, 'Sort Section', 'Seção de classificação', NULL, '2024-12-19 19:02:13'),
(1785, 3, 'Edit section', 'Editar seção', NULL, '2024-12-19 19:02:06'),
(1786, 3, 'Delete section', 'Excluir seção', NULL, '2024-12-19 19:01:58'),
(1787, 3, 'No lessons are available.', 'Não há aulas disponíveis.', NULL, '2024-12-19 19:01:42'),
(1788, 3, 'Select lesson type', 'Selecione o tipo de lição', NULL, '2024-12-19 19:01:49'),
(1789, 3, 'YouTube Video', 'YouTube Video', NULL, NULL),
(1790, 3, 'Vimeo Video', 'Vimeo Video', NULL, NULL),
(1791, 3, 'Video url [ .mp4 ]', 'Video url [ .mp4 ]', NULL, NULL),
(1792, 3, 'Google drive video', 'Google drive video', NULL, NULL),
(1793, 3, 'Document file', 'Arquivo do documento', NULL, '2024-12-19 19:01:26'),
(1794, 3, 'Text', 'Texto', NULL, '2024-12-19 19:01:29'),
(1795, 3, 'Iframe embed', 'Iframe embed', NULL, NULL),
(1796, 3, 'Next', 'Próximo', NULL, '2024-12-19 19:01:08'),
(1797, 3, 'Contact', 'Contato', NULL, '2024-12-20 15:01:22'),
(1798, 3, 'Search Contact', 'Pesquisar contato', NULL, '2024-12-20 15:01:29'),
(1799, 3, 'Public Instructor Settings', 'Configurações do professor público', NULL, '2024-12-20 15:01:17'),
(1800, 3, 'Instructor settings', 'Configurações do professor', NULL, '2024-12-20 15:01:08'),
(1801, 3, 'Allow public instructor', 'Permitir Professor público', NULL, '2024-12-20 15:15:13'),
(1802, 3, 'Instructor application note', 'Nota de aplicação do professor', NULL, '2024-12-20 15:00:29'),
(1803, 3, 'Revenue settings', 'Configurações de receita', NULL, '2024-12-20 15:00:35'),
(1804, 3, 'Instructor revenue percentage', 'Porcentagem de receita do professor', NULL, '2024-12-20 15:00:47'),
(1805, 3, 'Admin revenue percentage', 'Porcentagem de receita do administrador', NULL, '2024-12-20 15:00:20'),
(1806, 3, 'Instructor setting updated', 'Configuração do professor atualizada', NULL, '2024-12-20 15:00:14'),
(1807, 3, 'Enroll History', 'Histórico de inscrição', NULL, '2024-12-21 01:51:17'),
(1808, 3, 'Add new enrollment', 'Add nova inscrição', NULL, '2024-12-21 01:51:10'),
(1809, 3, 'Enrolled Date', 'Data de inscrição', NULL, '2024-12-21 01:51:00'),
(1810, 3, 'Expiry Date', 'Data de validade', NULL, '2024-12-21 01:50:52'),
(1811, 3, 'Lifetime access', 'Acesso vitalício', NULL, '2024-12-21 01:50:46'),
(1812, 3, 'Enroll delete successfully', 'Inscrição excluída com sucesso', NULL, '2024-12-21 01:50:40'),
(1813, 3, 'Blog that help beginner designers become true unicorns.', 'Blog que ajuda designers iniciantes a se tornarem verdadeiros unicórnios.', NULL, '2024-12-26 22:55:25'),
(1814, 3, 'Popular Post', 'Postagem popular', NULL, '2024-12-26 22:55:17'),
(1815, 3, 'Tags', 'Tags', NULL, NULL),
(1816, 3, 'Manage Course', 'Gerenciar curso', NULL, '2024-12-26 22:55:11'),
(1817, 3, 'Total Mark', 'Marca Total', NULL, '2024-12-26 22:55:05'),
(1818, 3, 'Pass Mark', 'Marca de aprovação', NULL, '2024-12-26 22:54:59'),
(1819, 3, 'Retake', 'Retomar', NULL, '2024-12-26 22:53:15'),
(1820, 3, 'Quiz has been created.', 'O questionário foi criado.', NULL, '2024-12-26 22:52:23'),
(1821, 3, 'Sort lessons', 'Classificar aulas', NULL, '2024-12-26 22:52:15'),
(1822, 3, 'Result', 'Resultado', NULL, '2024-12-26 22:52:09'),
(1823, 3, 'Questions', 'Questões', NULL, '2024-12-26 22:51:50'),
(1824, 3, 'Edit quiz', 'Editar questionário', NULL, '2024-12-26 22:51:57'),
(1825, 3, 'Delete lesson', 'Excluir lição', NULL, '2024-12-26 22:52:03'),
(1826, 3, 'Time left : ', 'Tempo restante :', NULL, '2024-12-26 22:51:44'),
(1827, 3, 'Hour', 'Hora', NULL, '2024-12-26 22:51:35'),
(1828, 3, 'Minute', 'Minuto', NULL, '2024-12-26 22:51:29'),
(1829, 3, 'Second', 'Segundo', NULL, '2024-12-26 22:51:23'),
(1830, 3, 'Total Marks', 'Marcas totais', NULL, '2024-12-26 22:51:15'),
(1831, 3, 'Pass Marks', 'Marcas de aprovação', NULL, '2024-12-26 22:51:08'),
(1832, 3, 'Question Type', 'Tipo de pergunta', NULL, '2024-12-26 22:50:58'),
(1833, 3, 'Attempts', 'Tentativas', NULL, '2024-12-26 22:50:52'),
(1834, 3, 'Total Question', 'Total de Perguntas', NULL, '2024-12-26 22:50:46'),
(1835, 3, 'Start Quiz', 'Iniciar questionário', NULL, '2024-12-26 22:50:31'),
(1836, 3, 'Create Admin', 'Criar admin', NULL, '2024-12-26 22:50:25'),
(1837, 3, 'Admin Info', 'Admin Info', NULL, NULL),
(1838, 3, 'Payment Information', 'Informações de pagamento', NULL, '2024-12-26 22:50:15'),
(1839, 3, 'Add new blog', 'Add novo blog', NULL, '2024-12-26 22:50:09'),
(1840, 3, 'Add Blog', 'Add Blog', NULL, NULL),
(1841, 3, 'Enter blog title', 'Digite o título do blog', NULL, '2024-12-26 22:49:58'),
(1842, 3, 'Writing your keyword and hit htw enter button', 'Escreva sua palavra-chave e pressione o botão htw enter', NULL, '2024-12-26 22:49:52'),
(1843, 3, 'Blog banner', 'Blog banner', NULL, NULL),
(1844, 3, 'Blog thumbnail', 'Miniatura do blog', NULL, '2024-12-26 22:49:45'),
(1845, 3, 'Would you like to designate it as popular?', 'Você gostaria de designá-lo como popular?', NULL, '2024-12-26 22:49:02'),
(1846, 3, 'Pending payouts', 'Pagamentos pendentes', NULL, '2024-12-26 22:48:55'),
(1847, 3, 'Completed payouts', 'Pagamentos concluídos', NULL, '2024-12-26 22:48:48'),
(1848, 3, 'Create Instructor', 'Criar professor', NULL, '2024-12-26 22:48:43'),
(1849, 3, 'Instructor Info', 'Informações do professor', NULL, '2024-12-26 22:46:14'),
(1850, 3, 'Instructor List', 'Lista de instrutores', NULL, '2024-12-26 22:45:59'),
(1851, 3, 'Item', 'Item', NULL, NULL),
(1852, 3, 'Paid amount', 'Valor pago', NULL, '2024-12-26 22:45:52'),
(1853, 3, 'Payment method', 'Método de pagamento', NULL, '2024-12-26 22:45:45'),
(1854, 3, 'Purchased date', 'Data de compra', NULL, '2024-12-26 22:45:37'),
(1855, 3, 'Invoice', 'Fatura', NULL, '2024-12-26 22:45:25'),
(1856, 3, 'Not registered for this course.', 'Não registrado para este curso.', NULL, '2024-12-26 22:44:11'),
(1857, 3, 'Coupon', 'Cupom', NULL, '2024-12-26 22:44:04'),
(1858, 3, 'Add Coupon', 'Add Cupom', NULL, '2024-12-26 22:44:02'),
(1859, 3, 'Search coupon', 'Cupom de pesquisa', NULL, '2024-12-26 22:43:52'),
(1860, 3, 'Code', 'Código', NULL, '2024-12-26 23:15:38'),
(1861, 3, 'Enter coupon code', 'Insira o código do cupom', NULL, '2024-12-26 23:15:46'),
(1862, 3, 'Discount (%)', 'Desconto (%)', NULL, '2024-12-26 23:15:28'),
(1863, 3, 'Enter coupon discount', 'Insira o cupom de desconto', NULL, '2024-12-26 23:15:19'),
(1864, 3, 'Expiry', 'Expiry', NULL, NULL),
(1865, 3, 'Enter coupon expiry', 'Insira a data de expiração do cupom', NULL, '2024-12-26 23:14:51'),
(1866, 3, 'Choose status ...', 'Escolha o estado...', NULL, '2024-12-26 23:14:57'),
(1867, 3, 'Bootcamp Category', 'Bootcamp Categoria', NULL, '2024-12-26 23:15:02'),
(1868, 3, 'Add category', 'Add categoria', NULL, '2024-12-26 23:14:45'),
(1869, 3, 'Category has been created.', 'A categoria foi criada.', NULL, '2024-12-26 23:14:41'),
(1870, 3, 'Total bootcamps', 'Total bootcamps', NULL, NULL),
(1871, 3, 'Bootcamp has been created.', 'O Bootcamp foi criado.', NULL, '2024-12-26 23:14:14'),
(1872, 3, 'Edit bootcamp', 'Editar bootcamp', NULL, '2024-12-26 23:14:17'),
(1873, 3, 'Frontent View', 'Ver no Frontent', NULL, '2024-12-26 23:14:33'),
(1874, 3, 'Add new module', 'Add novo módulo', NULL, '2024-12-26 23:14:07'),
(1875, 3, 'Add module', 'Add module', NULL, NULL),
(1876, 3, 'Module Restriction', 'Module Restriction', NULL, NULL),
(1877, 3, 'Until start date, keep this module locked.', 'Até a data de início, mantenha este módulo bloqueado.', NULL, '2024-12-26 23:13:54'),
(1878, 3, 'Keep this module open only within the selected date range.', 'Mantenha este módulo aberto somente dentro do intervalo de datas selecionado.', NULL, '2024-12-26 23:13:47'),
(1879, 3, 'Validity', 'Validade', NULL, '2024-12-26 23:13:40'),
(1880, 3, 'Module has been created.', 'O módulo foi criado.', NULL, '2024-12-26 23:13:32'),
(1881, 3, 'Add live class', 'Add aula ao vivo', NULL, '2024-12-26 23:13:25'),
(1882, 3, 'Sort module', 'Módulo de classificação', NULL, '2024-12-26 23:13:18'),
(1883, 3, 'Available from : ', 'Disponível em:', NULL, '2024-12-26 23:13:11'),
(1884, 3, 'Resources', 'Recursos', NULL, '2024-12-26 23:13:05'),
(1885, 3, 'Edit module', 'Editar módulo', NULL, '2024-12-26 23:12:59'),
(1886, 3, 'Delete module', 'Excluir módulo', NULL, '2024-12-26 23:12:51'),
(1887, 3, 'No live classes are available.', 'Não há aulas ao vivo disponíveis.', NULL, '2024-12-26 23:12:45'),
(1888, 3, 'Date', 'Data', NULL, '2024-12-26 23:12:39'),
(1889, 3, 'Start time', 'Hora de início', NULL, '2024-12-26 23:12:36'),
(1890, 3, 'End time', 'Hora de término', NULL, '2024-12-26 23:12:29'),
(1891, 3, 'Module', 'Modulo', NULL, '2024-12-26 23:12:24'),
(1892, 3, 'live', 'live', NULL, NULL),
(1893, 3, 'Add class', 'Add classe', NULL, '2024-12-26 23:12:10'),
(1894, 3, 'Invalid access token.', 'Token de acesso inválido.', NULL, '2024-12-26 23:12:17'),
(1895, 3, 'Modules sorted successfully', 'Módulos classificados com sucesso', NULL, '2024-12-26 23:12:07'),
(1896, 3, 'Bootcamp FAQ', 'Bootcamp FAQ', NULL, NULL),
(1897, 3, 'Total amount', 'Montante total', NULL, '2024-12-26 23:11:57'),
(1898, 3, 'Enrolled', 'Inscrito', NULL, '2024-12-26 23:11:49'),
(1899, 3, 'Enrolled: ', 'Inscrito:', NULL, '2024-12-26 23:11:33'),
(1900, 3, 'Instructor Applicationss', 'Inscrições para professores', NULL, '2024-12-26 23:11:26'),
(1901, 3, 'Pending applications', 'Candidaturas pendentes', NULL, '2024-12-26 23:11:00'),
(1902, 3, 'Approved applications', 'Aplicativos aprovados', NULL, '2024-12-26 23:11:07'),
(1903, 3, 'Create a new conversation with a new user', 'Crie uma nova conversa com um novo usuário', NULL, '2024-12-26 23:11:13'),
(1904, 3, 'Select a new user', 'Selecione um novo usuário', NULL, '2024-12-26 23:10:54'),
(1905, 3, 'Select a user', 'Selecione um usuário', NULL, '2024-12-26 23:10:48'),
(1906, 3, 'Message thread successfully created', 'Thread de mensagens criado com sucesso', NULL, '2024-12-26 23:10:41'),
(1907, 3, 'Send', 'Enviar', NULL, '2024-12-26 23:10:34'),
(1908, 3, 'Add Newsletter', 'Add Newsletter', NULL, NULL),
(1909, 3, 'Subject', 'Assunto', NULL, '2024-12-26 23:10:26'),
(1910, 3, 'Newsletter created successfully', 'Newsletter criada com sucesso', NULL, '2024-12-26 23:10:07'),
(1911, 3, 'Send newsletter', 'Enviar newsletter', NULL, '2024-12-26 23:10:18'),
(1912, 3, 'Edit Newsletter', 'Editar Newsletter', NULL, '2024-12-26 23:10:22'),
(1913, 3, 'Newsletter deleted successfully.', 'Newsletter excluída com sucesso.', NULL, '2024-12-26 23:10:01'),
(1914, 3, 'Subscriber', 'Assinante', NULL, '2024-12-26 23:09:54'),
(1915, 3, 'Subscribers', 'Assinantes', NULL, '2024-12-26 23:09:47'),
(1916, 3, 'Search Email', 'Pesquisar e-mail', NULL, '2024-12-26 23:09:40'),
(1917, 3, 'Pending Blog', 'Blog pendente', NULL, '2024-12-26 23:09:34'),
(1918, 3, 'Blog category', 'Categoria do blog', NULL, '2024-12-26 23:09:27'),
(1919, 3, 'Subtitle', 'Legenda', NULL, '2024-12-26 23:09:07'),
(1920, 3, '(80  Character)', '(80 caracteres)', NULL, '2024-12-26 23:09:13'),
(1921, 3, 'Blog Setting', 'Configuração do blog', NULL, '2024-12-26 23:09:20'),
(1922, 3, 'Blog settings', 'Config do blog', NULL, '2024-12-26 23:09:00'),
(1923, 3, 'Instructor permission', 'Permissão do instrutor', NULL, '2024-12-26 23:08:50'),
(1924, 3, 'Provide access', 'Fornecer acesso', NULL, '2024-12-26 23:08:43'),
(1925, 3, 'Decline access', 'Recusar acesso', NULL, '2024-12-26 23:08:23'),
(1926, 3, 'Visibility on homepage', 'Visibilidade na página inicial', NULL, '2024-12-26 23:08:30'),
(1927, 3, 'Visible', 'Visível', NULL, '2024-12-26 23:08:37'),
(1928, 3, 'Hidden', 'Escondido', NULL, '2024-12-26 23:08:17'),
(1929, 3, 'Add Review', 'Add Análise', NULL, '2024-12-26 23:07:40'),
(1930, 3, 'Select User', 'Selecione o usuário', NULL, '2024-12-26 23:07:34'),
(1931, 3, 'Select an user', 'Selecione um usuário', NULL, '2024-12-26 23:07:16'),
(1932, 3, 'Rating', 'Avaliação', NULL, '2024-12-26 23:07:22'),
(1933, 3, 'Select a Rating', 'Selecione uma classificação', NULL, '2024-12-26 23:07:28'),
(1934, 3, 'Certificate elements', 'Elementos do certificado', NULL, '2024-12-26 23:07:09'),
(1935, 3, 'Available Variable Data', 'Dados variáveis ​​disponíveis', NULL, '2024-12-26 23:07:03'),
(1936, 3, 'Add a new element', 'Add um novo elemento', NULL, '2024-12-26 23:06:57'),
(1937, 3, 'Enter Text with variable data', 'Enter Text with variable data', NULL, NULL),
(1938, 3, 'Total Lesson', 'Lição total', NULL, '2024-12-26 23:06:48'),
(1939, 3, 'Choice a font-family', 'Choice a font-family', NULL, NULL),
(1940, 3, 'Auto', 'Auto', NULL, NULL),
(1941, 3, 'Pinyon Script', 'Pinyon Script', NULL, NULL),
(1942, 3, 'Font Size', 'Font Size', NULL, NULL),
(1943, 3, 'Save Template', 'Salvar modelo', NULL, '2024-12-26 23:06:30'),
(1944, 3, 'Course Name', 'Nome do curso', NULL, '2024-12-26 23:29:43'),
(1945, 3, 'Print Invoice', 'Imprimir fatura', NULL, '2024-12-26 23:29:36'),
(1946, 3, '+0 (123) 456 - 7890', '+0 (123) 456 - 7890', NULL, NULL),
(1947, 3, 'Document', 'Documento', NULL, '2024-12-26 23:29:23'),
(1948, 3, 'Documents of qualification. Max-size : 5MB (DOC, DOCX, PDF, TXT, PNG, JPG, JPEG)', 'Documentos de qualificação. Tamanho máximo: 5 MB (DOC, DOCX, PDF, TXT, PNG, JPG, JPEG)', NULL, '2024-12-26 23:29:29'),
(1949, 3, 'Your description here...', 'Sua descrição aqui...', NULL, '2024-12-26 23:29:18'),
(1950, 3, 'Apply for instructor', 'Inscreva-se para professor', NULL, '2024-12-26 23:29:12'),
(1951, 3, 'Your application has been submitted.', 'Sua inscrição foi enviada.', NULL, '2024-12-26 23:28:59'),
(1952, 3, 'Applicant details', 'Detalhes do candidato', NULL, '2024-12-26 23:28:50'),
(1953, 3, 'Application details', 'Detalhes do aplicativo', NULL, '2024-12-26 23:28:43'),
(1954, 3, 'Approve', 'Aprovar', NULL, '2024-12-26 23:28:36'),
(1955, 3, 'Application approve successfully', 'Aplicativo aprovado com sucesso', NULL, '2024-12-26 23:28:30'),
(1956, 3, 'View courses', 'Ver cursos', NULL, '2024-12-26 23:28:22'),
(1957, 3, 'Instructor Revenue This Year', 'Recomendações do professor neste ano', NULL, '2024-12-26 23:28:17'),
(1958, 3, 'Sales', 'Vendas', NULL, '2024-12-26 23:27:56'),
(1959, 3, 'Payout', 'Pagamento', NULL, '2024-12-26 23:27:50'),
(1960, 3, 'Withdraw', 'Retirar', NULL, '2024-12-26 23:27:42'),
(1961, 3, 'Instructor Panel', 'Painel do Professor', NULL, '2024-12-26 23:27:27'),
(1962, 3, 'Class', 'Classe', NULL, '2024-12-26 23:27:29'),
(1963, 3, 'Bootcamp Details', 'Detalhes do bootcamp', NULL, '2024-12-26 23:27:36'),
(1964, 3, 'Course Content', 'Conteúdo do curso', NULL, '2024-12-26 23:27:17'),
(1965, 3, 'Bootcamp Overview', 'Visão geral do bootcamp', NULL, '2024-12-26 23:27:10'),
(1966, 3, 'No classes available in this module.', 'Nenhuma aula disponível neste módulo.', NULL, '2024-12-26 23:27:04'),
(1967, 3, 'Buy Bootcamp', 'Comprar Bootcamp', NULL, '2024-12-26 23:26:57'),
(1968, 3, 'Resource', 'Recurso', NULL, '2024-12-26 23:26:51'),
(1969, 3, 'Class record', 'Registro de aula', NULL, '2024-12-26 23:26:45'),
(1970, 3, 'Contact Instructor', 'Contato do Professor', NULL, '2024-12-26 23:26:38'),
(1971, 3, 'For details about the course', 'Para detalhes sobre o curso', NULL, '2024-12-26 23:26:24'),
(1972, 3, 'Call Us', 'Ligue para nós', NULL, '2024-12-26 23:26:18'),
(1973, 3, 'Share on social media', 'Compartilhe nas redes sociais', NULL, '2024-12-26 23:26:12'),
(1974, 3, 'Sales report', 'Relatório de vendas', NULL, '2024-12-26 23:26:06'),
(1975, 3, 'Payout report', 'Relatório de pagamento', NULL, '2024-12-26 23:25:59'),
(1976, 3, 'Payouts', 'Pagamentos', NULL, '2024-12-26 23:25:52'),
(1977, 3, 'Request a new withdrawal', 'Solicite um novo saque', NULL, '2024-12-26 23:25:42'),
(1978, 3, 'Request withdrawal', 'Solicitar retirada', NULL, '2024-12-26 23:25:35'),
(1979, 3, 'Available', 'Disponível', NULL, '2024-12-26 23:25:19'),
(1980, 3, 'Total payout', 'Pagamento total', NULL, '2024-12-26 23:25:22'),
(1981, 3, 'Requested', 'Solicitado', NULL, '2024-12-26 23:25:29'),
(1982, 3, 'Payout setting', 'Configuração de pagamento', NULL, '2024-12-26 23:25:07'),
(1983, 3, 'Be careful !!', 'Tome cuidado !!', NULL, '2024-12-26 23:25:00'),
(1984, 3, 'Just configure the payment gateway you want to use, leave the rest blank.', 'Basta configurar o gateway de pagamento que você deseja usar, deixe o restante em branco.', NULL, '2024-12-26 23:24:55'),
(1985, 3, 'Also, make sure that you have configured your payment settings correctly', 'Além disso, certifique-se de ter configurado suas configurações de pagamento corretamente', NULL, '2024-12-26 23:21:34'),
(1986, 3, 'course_thumbnail', 'course_thumbnail', NULL, NULL),
(1987, 3, 'user_photo', 'user_photo', NULL, NULL),
(1988, 3, 'Terms', 'Terms', NULL, NULL),
(1989, 3, 'Cookie', 'Cookie', NULL, NULL),
(1990, 3, 'Frequently asked questions', 'Frequently asked questions', NULL, NULL),
(1991, 3, 'Frequently Asked Questions?', 'Frequently Asked Questions?', NULL, NULL),
(1992, 3, 'FAQ provides quick answers to common inquiries, helping users resolve doubts efficiently.', 'FAQ provides quick answers to common inquiries, helping users resolve doubts efficiently.', NULL, NULL),
(1993, 3, 'Forgot Password', 'Forgot Password', NULL, NULL),
(1994, 3, 'Submit your account email address.', 'Submit your account email address.', NULL, NULL),
(1995, 3, 'Enter Your Email', 'Enter Your Email', NULL, NULL),
(1996, 3, 'Send Request', 'Send Request', NULL, NULL),
(1997, 3, 'Back to login page', 'Back to login page', NULL, NULL),
(1998, 3, 'Module & Class', 'Module & Class', NULL, NULL),
(1999, 3, 'Enrollments', 'Enrollments', NULL, NULL),
(2000, 3, 'Duplicate', 'Duplicate', NULL, NULL),
(2001, 3, 'Applicant', 'Applicant', NULL, NULL),
(2002, 3, 'Class date and time', 'Class date and time', NULL, NULL),
(2003, 3, 'Note for your student', 'Note for your student', NULL, NULL),
(2004, 3, 'Create', 'Create', NULL, NULL),
(2005, 3, 'Instructor details', 'Instructor details', NULL, NULL),
(2006, 3, 'Hi, I’m', 'Hi, I’m', NULL, NULL),
(2007, 3, 'Experience', 'Experience', NULL, NULL),
(2008, 3, 'Recently appointed', 'Recently appointed', NULL, NULL),
(2009, 3, 'Update Quiz', 'Update Quiz', NULL, NULL),
(2010, 3, 'Bootcamp payment', 'Bootcamp payment', NULL, NULL),
(2011, 3, 'Instructor delete successfully', 'Instructor delete successfully', NULL, NULL),
(2012, 3, 'You already enrolled in this course', 'You already enrolled in this course', NULL, NULL),
(2013, 3, 'Add Question', 'Add Question', NULL, NULL),
(2014, 3, 'Multiple Choice', 'Multiple Choice', NULL, NULL),
(2015, 3, 'Fill in the blanks', 'Fill in the blanks', NULL, NULL),
(2016, 3, 'True or False', 'True or False', NULL, NULL),
(2017, 3, 'Write question', 'Write question', NULL, NULL),
(2018, 3, 'Your questions here', 'Your questions here', NULL, NULL),
(2019, 3, 'You can keep multiple options. Just put an option and hit enter.', 'You can keep multiple options. Just put an option and hit enter.', NULL, NULL),
(2020, 3, 'You can select multiple answers.', 'You can select multiple answers.', NULL, NULL),
(2021, 3, 'Question has been added.', 'Question has been added.', NULL, NULL),
(2022, 3, 'Sort Questions', 'Sort Questions', NULL, NULL),
(2023, 3, 'Edit Question', 'Edit Question', NULL, NULL),
(2024, 3, 'Instructor add successfully', 'Instructor add successfully', NULL, NULL),
(2025, 3, 'Data not found.', 'Data not found.', NULL, NULL),
(2026, 3, 'Admin add successfully', 'Admin add successfully', NULL, NULL),
(2027, 3, 'Find A Tutor', 'Find A Tutor', NULL, NULL),
(2028, 3, 'Tutor Booking', 'Tutor Booking', NULL, NULL),
(2029, 3, 'Subjects', 'Subjects', NULL, NULL),
(2030, 3, 'Subject Category', 'Subject Category', NULL, NULL),
(2031, 3, 'Select a valid zip file', 'Select a valid zip file', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `total_mark` int(11) DEFAULT NULL,
  `pass_mark` int(11) DEFAULT NULL,
  `retake` int(11) DEFAULT NULL,
  `lesson_src` varchar(255) DEFAULT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `video_type` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `is_free` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `like_dislike_reviews`
--

CREATE TABLE `like_dislike_reviews` (
  `id` int(255) NOT NULL,
  `review_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `liked` int(255) DEFAULT 0,
  `disliked` int(255) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `live_classes`
--

CREATE TABLE `live_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_topic` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `class_date_and_time` timestamp NULL DEFAULT NULL,
  `additional_info` longtext DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `media_files`
--

CREATE TABLE `media_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `story_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `chat_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `privacy` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `messages`
--

CREATE TABLE `messages` (
  `id` int(255) NOT NULL,
  `thread_id` int(255) DEFAULT NULL,
  `sender_id` int(255) DEFAULT NULL,
  `receiver_id` int(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `read` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(255) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_one` int(255) DEFAULT NULL,
  `contact_two` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_editable` int(11) DEFAULT NULL,
  `addon_identifier` varchar(255) DEFAULT NULL,
  `user_types` varchar(400) DEFAULT NULL,
  `system_notification` varchar(400) DEFAULT NULL,
  `email_notification` varchar(400) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `template` longtext DEFAULT NULL,
  `setting_title` varchar(255) DEFAULT NULL,
  `setting_sub_title` varchar(255) DEFAULT NULL,
  `date_updated` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `type`, `is_editable`, `addon_identifier`, `user_types`, `system_notification`, `email_notification`, `subject`, `template`, `setting_title`, `setting_sub_title`, `date_updated`, `created_at`, `updated_at`) VALUES
(1, 'edit_email_template', 1, NULL, '[\"admin\",\"user\"]', '{\"admin\":\"1\",\"user\":\"1\"}', '{\"admin\":\"1\",\"user\":\"0\"}', '{\"admin\":\"New user registered\",\"user\":\"Registered successfully\"}', '{\"admin\":\"New user registered [user_name] \\r\\n<br>User email: <b>[user_email]<\\/b>\",\"user\":\"You have successfully registered with us at [system_name].\"}', 'New user registration', 'Get notified when a new user signs up', '1693215071', '2023-11-02 11:13:07', '2023-12-05 01:23:15'),
(2, 'email_verification', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Email verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [email_verification_code]\"}', 'Email verification', 'It is permanently enabled for student email verification.', '1684135777', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(3, 'forget_password_mail', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Forgot password verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [system_name][verification_link][minutes]\"}', 'Forgot password mail', 'It is permanently enabled for student email verification.', '1684145383', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(4, 'new_device_login_confirmation', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Please confirm your login\"}', '{\"user\":\"Have you tried logging in with a different device? Confirm using the verification code. Your verification code is [verification_code]. Remember that you will lose access to your previous device after logging in to the new device <b>[user_agent]<\\/b>.<br> Use the verification code within [minutes] minutes\"}', 'Account security alert', 'Send verification code for login from a new device', '1684145383', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(6, 'course_purchase', 1, NULL, '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course has been sold\",\"instructor\":\"A new course has been sold\",\"student\":\"You have purchased a new course\"}', '{\"admin\":\"<p>Course title: [course_title]<\\/p><p>Student: [student_name]\\r\\n<\\/p><p>Paid amount: [paid_amount]<\\/p><p>Instructor: [instructor_name]<\\/p>\",\"instructor\":\"Course title: [course_title]\\r\\nStudent: [student_name]\\r\\nPaid amount: [paid_amount]\",\"student\":\"Course title: [course_title]\\r\\nPaid amount: [paid_amount]\\r\\nInstructor: [instructor_name]\"}', 'Course purchase notification', 'Stay up-to-date on student course purchases.', '1684303456', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(7, 'course_completion_mail', 1, NULL, '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Course completion\",\"student\":\"You have completed a new course\"}', '{\"instructor\":\"Course completed [course_title]\\r\\nStudent: [student_name]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\"}', 'Course completion mail', 'Stay up to date on student course completion.', '1684303457', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(8, 'certificate_eligibility', 1, 'certificate', '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Certificate eligibility\",\"student\":\"certificate eligibility\"}', '{\"instructor\":\"Course: [course_title]\\r\\nStudent: [student_name]\\r\\nCertificate link: [certificate_link]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\\r\\nCertificate link: [certificate_link]\"}', 'Course eligibility notification', 'Stay up to date on course certificate eligibility.', '1684303460', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(9, 'offline_payment_suspended_mail', 1, 'offline_payment', '[\"student\"]', '{\"student\":\"1\"}', '{\"student\":\"0\"}', '{\"student\":\"Your payment has been suspended\"}', '{\"student\":\"<p>Your offline payment has been <b style=\'color: red;\'>suspended</b> !</p><p>Please provide a valid document of your payment.</p>\"}', 'Offline payment suspended mail', 'If students provides fake information, notify them of the suspension', '1684303463', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(10, 'bundle_purchase', 1, 'course_bundle', '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course bundle has been sold \",\"instructor\":\"A new course bundle has been sold \",\"student\":\"You have purchased a new course bundle test\"}', '{\"admin\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name]\\r\\nInstructor: [instructor_name] \",\"instructor\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name] \",\"student\":\"Course bundle: [bundle_title]\\r\\nInstructor: [instructor_name] \"}', 'Course bundle purchase notification', 'Stay up-to-date on student course bundle purchases.', '1684303467', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(13, 'add_new_user_as_affiliator', 0, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"Congratulation ! You are assigned as an affiliator\"}', '{\"affiliator\":\"You are assigned as a website Affiliator.\\r\\nWebsite: [website_link]\\r\\n<br>\\r\\nPassword: [password]\"}', 'New user added as affiliator', 'Send account information to the new user', '1684135777', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(14, 'affiliator_approval_notification', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', 'Affiliate approval notification', 'Send affiliate approval mail to the user account', '1684303472', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(15, 'affiliator_request_cancellation', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused.\"}', 'Affiliator request cancellation', 'Send mail, when you cancel the affiliation request', '1684303473', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(16, 'affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"admin\",\"affiliator\"]', '{\"admin\":\"1\",\"affiliator\":\"1\"}', '{\"admin\":\"0\",\"affiliator\":\"0\"}', '{\"admin\":\"New money withdrawal request\",\"affiliator\":\"New money withdrawal request\"}', '{\"admin\":\"New money withdrawal request by [\'user_name] [amount]\",\"affiliator\":\"Your Withdrawal request of [amount] has been sent to authority\"}', 'Affiliation money withdrawal request', 'Send mail, when the users request the withdrawal of money', '1684303476', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(17, 'approval_affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congartulation ! Your withdrawal request has been approved\"}', '{\"affiliator\":\"Congartulation ! Your payment request has been approved.\"}', 'Approval of withdrawal request of affiliation', 'Send mail, when you approved the affiliation withdrawal request', '1684303480', '2023-11-02 11:13:07', '2023-11-02 11:13:07'),
(18, 'course_gift', 1, NULL, '[\"payer\",\"receiver\"]', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"You have gift a course\",\"receiver\":\"You have received a course gift\"}', '{\"payer\":\"You have gift a course to [user_name] [course_title][instructor]\",\"receiver\":\"You have received a course gift by [payer][course_title][instructor]\"}', 'Course gift notification', 'Notify users after course gift', '1691818623', '2023-11-02 11:13:07', '2023-11-06 05:02:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `offline_payments`
--

CREATE TABLE `offline_payments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `bank_no` varchar(255) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `status` int(255) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keys` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `test_mode` int(11) DEFAULT NULL,
  `is_addon` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `identifier`, `currency`, `title`, `model_name`, `description`, `keys`, `status`, `test_mode`, `is_addon`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'USD', 'Paypal', 'Paypal', '', '{\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-11-28 01:44:37'),
(2, 'stripe', 'USD', 'Stripe', 'StripePay', '', '{\"public_key\":\"pk_test_c6VvBEbwHFdulFZ62q1IQrar\",\"secret_key\":\"sk_test_9IMkiM6Ykxr1LCe2dJ3PgaxS\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-10-30 01:33:32'),
(3, 'razorpay', 'INR', 'Razorpay', 'Razorpay', '', '{\"public_key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\"}', 1, 1, 0, '2023-06-24 03:51:49', '2024-09-10 22:41:31'),
(4, 'flutterwave', 'USD', 'Flutterwave', 'Flutterwave', '', '{\"public_key\":\"FLWPUBK_TEST-48dfbeb50344ecd8bc075b4ffe9ba266-X\",\"secret_key\":\"FLWSECK_TEST-1691582e23bd6ee4fb04213ec0b862dd-X\"}', 1, 1, 0, '2023-06-24 03:51:49', '2023-10-30 01:39:58'),
(5, 'paytm', 'INR', 'Paytm', 'Paytm', '', '{\"paytm_merchant_key\":\"NLcIjJn!!lkjDZQN\",\"paytm_merchant_mid\":\"YEPkQv98980476147162\",\"paytm_merchant_website\":\"WEBSTAGING\",\"industry_type_id\":\"Retail\",\"channel_id\":\"WEB\"}', 1, 1, 0, '2023-06-24 03:51:49', '2024-10-30 04:17:36'),
(6, 'offline', 'USD', 'Offline Payment', 'OfflinePayment', '', '{\"bank_information\":\"Write your bank information and instructions here\"}', 1, 0, 0, '2023-06-24 03:51:49', '2024-09-24 01:00:18'),
(7, 'paystack', 'NGN', 'Paystack', 'Paystack', NULL, '{\"secret_test_key\":\"sk_test_c746060e693dd50c6f397dffc6c3b2f655217c94\",\"public_test_key\":\"pk_test_0816abbed3c339b8473ff22f970c7da1c78cbe1b\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxxx\"}', 1, 1, 0, '2024-10-03 11:05:03', '2024-10-03 11:05:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) DEFAULT NULL,
  `instructor_revenue` varchar(255) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT 0,
  `transaction_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
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
-- Estrutura para tabela `player_settings`
--

CREATE TABLE `player_settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `player_settings`
--

INSERT INTO `player_settings` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'watermark_width', '100', '2024-08-27 11:25:27', '2024-10-30 05:47:08'),
(2, 'watermark_height', '24', '2024-08-27 11:25:27', '2024-10-30 05:47:08'),
(3, 'watermark_top', '10', '2024-08-27 11:25:27', '2024-10-30 05:47:08'),
(4, 'watermark_left', '10', '2024-08-27 11:25:27', '2024-10-30 05:47:08'),
(5, 'watermark_opacity', '30', '2024-08-27 11:25:27', '2024-10-30 05:47:08'),
(6, 'watermark_type', 'js', '2024-08-27 11:25:27', '2024-10-30 05:47:08'),
(7, 'watermark_logo', 'uploads/watermark/watermark-default.png', '2024-08-27 11:25:27', '2024-08-27 11:25:27'),
(8, 'animation_speed', '1000', '2024-10-30 11:38:00', '2024-10-30 05:47:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `answer` mediumtext DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `section_id` int(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `total_mark` int(255) DEFAULT NULL,
  `pass_mark` int(255) DEFAULT NULL,
  `drip_rule` int(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `attempts` longtext DEFAULT NULL,
  `sort` int(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quiz_submissions`
--

CREATE TABLE `quiz_submissions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `correct_answer` longtext DEFAULT NULL,
  `wrong_answer` longtext DEFAULT NULL,
  `submits` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reviews`
--

CREATE TABLE `reviews` (
  `id` int(255) UNSIGNED NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` int(255) DEFAULT NULL,
  `rating` int(255) DEFAULT NULL,
  `review_type` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sort` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `seo_fields`
--

CREATE TABLE `seo_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(20) DEFAULT NULL,
  `blog_id` int(20) DEFAULT NULL,
  `bootcamp_id` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `name_route` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_robot` text DEFAULT NULL,
  `canonical_url` varchar(255) DEFAULT NULL,
  `custom_url` varchar(255) DEFAULT NULL,
  `json_ld` longtext DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `seo_fields`
--

INSERT INTO `seo_fields` (`id`, `course_id`, `blog_id`, `bootcamp_id`, `route`, `name_route`, `meta_title`, `meta_keywords`, `meta_description`, `meta_robot`, `canonical_url`, `custom_url`, `json_ld`, `og_title`, `og_description`, `og_image`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'Home', 'home', 'Home page', NULL, 'Home page for academy Seo', 'xxxxxx', 'https://academy.com', 'https://academy.com', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'ooooooooo', 'zzzzzzzzzz', 'OG-home.jpg', NULL, NULL),
(2, NULL, NULL, NULL, 'Compare', 'compare', 'Course compare', '[{\"value\":\"course\"},{\"value\":\"compare\"},{\"value\":\"difference\"}]', 'Course compare', 'xxxxxx', 'https:://academy.com/course-compare', 'https:://academy.com/course-compare', NULL, 'Course compare', 'Course compare', '2-customer-php-version.PNG', NULL, NULL),
(3, NULL, NULL, NULL, 'Privacy', 'privacy.policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG-documantation.jpg', NULL, NULL),
(4, NULL, NULL, NULL, 'Refund', 'refund.policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG-Blog.jpg', NULL, NULL),
(5, NULL, NULL, NULL, 'Terms- condition', 'terms.condition', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OG-service.jpg', NULL, NULL),
(6, NULL, NULL, NULL, 'Faq', 'faq', 'Creative elements - ui subscription system', '[{\"value\":\"ui kits\"},{\"value\":\"website template\"},{\"value\":\"video template\"}]', 'Best and affordable ui kit subscription system', NULL, NULL, NULL, NULL, NULL, NULL, 'OG-elements home.jpg', NULL, NULL),
(7, NULL, NULL, NULL, 'Cookie policy', 'cookie.policy', 'Academy LMS - Cookie policy', '[{\"value\":\"ui kits\"},{\"value\":\"website template\"},{\"value\":\"video template\"}]', 'NULL', NULL, NULL, NULL, NULL, NULL, NULL, 'OG-elements home.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'language', 'english', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(2, 'system_name', 'Samuel', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(3, 'system_title', 'Academy Learning Club', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(4, 'system_email', 'academy@example.com', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(5, 'address', 'Sydney, Australia', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(6, 'phone', '+143-52-9933631', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(7, 'purchase_code', '1', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(8, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(9, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"pk_test_CAC3cB1mhgkJqXtypYBTGb4f\",\"secret_key\":\"sk_test_iatnshcHhQVRXdygXw3L2Pp2\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(10, 'youtube_api_key', 'youtube-and-google-drive-api-key', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(11, 'vimeo_api_key', 'vimeo-api-key', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(12, 'slogan', 'A course based video CMS', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(13, 'text_align', NULL, '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(14, 'allow_instructor', '1', '2023-10-29 05:36:40', '2023-12-05 23:04:06'),
(15, 'instructor_revenue', '70', '2023-10-29 05:36:40', '2023-12-05 23:04:11'),
(16, 'system_currency', 'INR', '2023-10-29 05:36:40', '2024-10-30 01:47:54'),
(17, 'paypal_currency', 'USD', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(18, 'stripe_currency', 'USD', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(19, 'author', 'Creativeitem', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(20, 'currency_position', 'right-space', '2023-10-29 05:36:40', '2024-10-30 01:47:54'),
(21, 'website_description', 'Talemy is your ideal education the WordPress theme for sharing and selling your knowledge online. Teach what you love. Talemy gives you the tools.', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(22, 'website_keywords', 'LMS,Learning Management System,Creativeitem,Academy LMS', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(23, 'footer_text', 'Creativeitem', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(24, 'footer_link', 'https://creativeitem.com/', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(25, 'protocol', 'smtp', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(26, 'smtp_host', 'smtp.gmail.com', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(27, 'smtp_port', '465', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(28, 'smtp_user', 'your-email-address', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(29, 'smtp_pass', 'enter-your-smtp-password', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(30, 'version', '1.4', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(31, 'student_email_verification', 'disable', '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(32, 'instructor_application_note', 'Fill all the fields carefully and share if you want to share any document with us it will help us to evaluate you as an instructor. dfdfs', '2023-10-29 05:36:40', '2023-12-05 23:04:06'),
(33, 'razorpay_keys', '[{\"active\":\"1\",\"key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\",\"theme_color\":\"#c7a600\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(34, 'razorpay_currency', 'USD', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(35, 'fb_app_id', 'fb-app-id', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(36, 'fb_app_secret', 'fb-app-secret', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(37, 'fb_social_login', '0', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(38, 'drip_content_settings', '{\"lesson_completion_role\":\"duration\",\"minimum_duration\":\"15:30:00\",\"minimum_percentage\":\"60\",\"locked_lesson_message\":\"<h3 xss=\\\"removed\\\" style=\\\"text-align: center; \\\"><span xss=\\\"removed\\\" style=\\\"\\\">Permission denied!<\\/span><\\/h3><p xss=\\\"removed\\\" style=\\\"text-align: center; \\\"><span xss=\\\"removed\\\">This course supports drip content, so you must complete the previous lessons.<\\/span><\\/p>\",\"files\":null}', '2023-10-29 05:36:40', '2023-10-29 05:26:38'),
(41, 'course_accessibility', 'publicly', '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(42, 'smtp_crypto', 'ssl', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(47, 'academy_cloud_access_token', 'jdfghasdfasdfasdfasdfasdf', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(48, 'course_selling_tax', '0', '2023-10-29 05:36:40', '2024-09-24 05:51:14'),
(49, 'ccavenue_keys', '[{\"active\":\"1\",\"ccavenue_merchant_id\":\"cmi_xxxxxx\",\"ccavenue_working_key\":\"cwk_xxxxxxxxxxxx\",\"ccavenue_access_code\":\"ccc_xxxxxxxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(50, 'ccavenue_currency', 'INR', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(51, 'iyzico_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"iyzico_currency\":\"TRY\",\"api_test_key\":\"atk_xxxxxxxx\",\"secret_test_key\":\"stk_xxxxxxxx\",\"api_live_key\":\"alk_xxxxxxxx\",\"secret_live_key\":\"slk_xxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(52, 'iyzico_currency', 'TRY', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(53, 'paystack_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"secret_test_key\":\"sk_test_c746060e693dd50c6f397dffc6c3b2f655217c94\",\"public_test_key\":\"pk_test_0816abbed3c339b8473ff22f970c7da1c78cbe1b\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxx\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(54, 'paystack_currency', 'NGN', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(55, 'paytm_keys', '[{\"PAYTM_MERCHANT_KEY\":\"PAYTM_MERCHANT_KEY\",\"PAYTM_MERCHANT_MID\":\"PAYTM_MERCHANT_MID\",\"PAYTM_MERCHANT_WEBSITE\":\"DEFAULT\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\"}]', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(57, 'google_analytics_id', NULL, '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(58, 'meta_pixel_id', NULL, '2023-10-29 05:36:40', '2023-12-05 00:54:45'),
(59, 'smtp_from_email', 'your-email-address', '2023-10-29 05:36:40', '2024-09-24 06:07:39'),
(61, 'language_dirs', '{\"english\":\"ltr\",\"hindi\":\"rtl\",\"arabic\":\"rtl\"}', '2023-10-29 05:36:40', '2023-10-29 05:36:40'),
(62, 'certificate_template', 'uploads/certificate-template/certificate-default.png', '2024-03-12 08:17:10', '2024-08-27 05:21:49'),
(63, 'certificate_builder_content', '<style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                                <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                                <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                                <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                                <style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style>\n        \n\n                                \n<style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><style>\n            @import url(\'https://fonts.googleapis.com/css2?family=Italianno&display=swap\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap%27\');\n            @import url(\'https://fonts.googleapis.com/css2?family=Miss+Fajardose&display=swap%27\');\n        </style><div id=\"certificate-layout-module\" class=\"certificate-layout-module resizeable-canvas draggable ui-draggable ui-draggable-handle ui-resizable hidden-position\" style=\"position: relative; width: 1069.2px; height: 755.055px; left: 0px; top: -1px;\" bis_skin_checked=\"1\">\n                <img class=\"certificate-template\" style=\"width: 100%; height: 100%;\" src=\"http://localhost/academy-laravel/academy_1.4/public/uploads/certificate-template/certificate-default.png\"><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 16px; top: 114px; left: 93px; width: 84.8906px; font-family: &quot;auto&quot;; padding: 5px !important; height: 80px;\" bis_skin_checked=\"1\">\n                {qr_code}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 546px; left: 125px; width: 210.031px; font-family: &quot;Pinyon Script&quot;; padding: 5px !important; height: 37px;\" bis_skin_checked=\"1\">\n                {instructor_name}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 546px; left: 724px; width: 210.188px; font-family: &quot;Pinyon Script&quot;; padding: 5px !important; height: 39px;\" bis_skin_checked=\"1\">\n                {student_name}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 16px; top: 545px; left: 442px; width: min-content; font-family: &quot;auto&quot;; padding: 5px !important;\" bis_skin_checked=\"1\">\n                {course_completion_date}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 12px; top: 665px; left: 457px; width: min-content; font-family: &quot;auto&quot;; padding: 5px !important;\" bis_skin_checked=\"1\">\n                {certificate_download_date}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute;font-size: 30px;top: 136px;left: 264px;width: 534.336px;padding: 5px !important;height: 62px;font-family: auto;\" bis_skin_checked=\"1\">\n                COURSE COMPLETION CERTIFICATE\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 211px; left: 205px; width: 664.5px; font-family: &quot;Pinyon Script&quot;; padding: 5px !important; height: 98px;\" bis_skin_checked=\"1\">\n                This certificate is awarded to {student_name} in recognition of their successful completion of Course on {course_completion_date}. Your hard work, dedication, and commitment to learning have enabled you to achieve this milestone, and we are proud to recognize your accomplishment.\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div><div class=\"draggable resizeable-canvas ui-draggable ui-draggable-handle ui-resizable\" style=\"position: absolute; font-size: 18px; top: 316px; left: 315px; width: 428.25px; font-family: &quot;auto&quot;; padding: 5px !important; height: 48px;\" bis_skin_checked=\"1\">\n                {course_title}\n                <i class=\"remove-item fi-rr-cross-circle cursor-pointer\" onclick=\"$(this).parent().remove()\">\n            </i><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-s\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div><div class=\"ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se\" style=\"z-index: 90;\" bis_skin_checked=\"1\"></div></div></div>', '2024-03-12 08:17:50', '2024-10-29 01:43:51'),
(64, '_token', 'tEYJPyWB4tjFp0tz78j0gDLj07tLXnw5hVpU5mX7', '2024-03-12 08:18:24', '2024-08-27 05:25:46'),
(65, 'zoom_account_email', 'example@gmail.com', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(66, 'zoom_account_id', 'RG4XYxxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(67, 'zoom_client_id', 'mFgJ4xxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(68, 'zoom_client_secret', 'OZ6m9xxxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(69, 'zoom_web_sdk', 'active', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(70, 'zoom_sdk_client_id', '7M6Wxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(71, 'zoom_sdk_client_secret', 'z1Nzxxxxxxxxxxxxxx', '2024-03-12 08:18:24', '2024-08-27 05:19:46'),
(72, 'open_ai_model', 'gpt-3.5-turbo-0125', '2024-03-12 09:11:12', '2024-08-27 05:25:46'),
(73, 'open_ai_max_token', '100', '2024-03-12 09:11:12', '2024-08-27 05:25:46'),
(74, 'open_ai_secret_key', 'sk-JPYxxxxxxxxxxxxxxxxxxx', '2024-03-12 09:11:12', '2024-08-27 05:25:46'),
(75, 'timezone', 'America/Campo_Grande', '2024-07-01 02:06:24', '2024-07-01 08:06:24'),
(76, 'device_limitation', '10', '2023-10-29 05:36:40', '2024-09-24 05:51:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `team_package_members`
--

CREATE TABLE `team_package_members` (
  `id` int(11) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `team_package_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `team_package_purchases`
--

CREATE TABLE `team_package_purchases` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `admin_revenue` float(10,2) DEFAULT NULL,
  `instructor_revenue` float(10,2) DEFAULT NULL,
  `tax` float(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `team_training_packages`
--

CREATE TABLE `team_training_packages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `course_privacy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `allocation` int(11) DEFAULT NULL,
  `expiry_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutor_bookings`
--

CREATE TABLE `tutor_bookings` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `joining_data` longtext DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `admin_revenue` float(10,2) DEFAULT NULL,
  `instructor_revenue` float(10,2) DEFAULT NULL,
  `tax` float(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutor_can_teach`
--

CREATE TABLE `tutor_can_teach` (
  `id` int(11) NOT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutor_categories`
--

CREATE TABLE `tutor_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutor_reviews`
--

CREATE TABLE `tutor_reviews` (
  `id` int(11) NOT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutor_schedules`
--

CREATE TABLE `tutor_schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `tutor_id` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `tution_type` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `booking_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutor_subjects`
--

CREATE TABLE `tutor_subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `biography` longtext DEFAULT NULL,
  `educations` longtext DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `paymentkeys` longtext DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `status`, `name`, `phone`, `website`, `skills`, `facebook`, `twitter`, `linkedin`, `address`, `about`, `biography`, `educations`, `photo`, `email_verified_at`, `password`, `remember_token`, `paymentkeys`, `video_url`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'samuel.oliveiras@hotmail.com', 1, 'Samuel Oliveira', '67992875364', NULL, '[]', NULL, NULL, NULL, 'samuel.oliveiras@hotmail.com', NULL, NULL, NULL, NULL, '2025-05-21 01:46:41', '$2y$10$nozBvCLBsImGnckbbIK9deQ8Ob1bpezdOQuqdk6GufOZ4f36L891S', NULL, NULL, NULL, '2025-05-21 01:46:41', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_reviews`
--

CREATE TABLE `user_reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `watch_durations`
--

CREATE TABLE `watch_durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `watched_student_id` int(11) DEFAULT NULL,
  `watched_course_id` int(11) DEFAULT NULL,
  `watched_lesson_id` int(11) DEFAULT NULL,
  `current_duration` int(11) DEFAULT NULL,
  `watched_counter` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `watch_histories`
--

CREATE TABLE `watch_histories` (
  `id` int(255) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `completed_lesson` longtext DEFAULT NULL,
  `watching_lesson_id` varchar(11) DEFAULT NULL,
  `course_progress` int(11) DEFAULT NULL,
  `completed_date` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `course_id` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `addtocarts`
--
ALTER TABLE `addtocarts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bootcamps`
--
ALTER TABLE `bootcamps`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bootcamp_categories`
--
ALTER TABLE `bootcamp_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bootcamp_live_classes`
--
ALTER TABLE `bootcamp_live_classes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bootcamp_modules`
--
ALTER TABLE `bootcamp_modules`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bootcamp_purchases`
--
ALTER TABLE `bootcamp_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bootcamp_resources`
--
ALTER TABLE `bootcamp_resources`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `builder_pages`
--
ALTER TABLE `builder_pages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Índices de tabela `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificates_identifier_unique` (`identifier`),
  ADD KEY `certificates_user_id_index` (`user_id`),
  ADD KEY `certificates_course_id_index` (`course_id`);

--
-- Índices de tabela `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`);

--
-- Índices de tabela `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_index` (`user_id`),
  ADD KEY `courses_category_id_index` (`category_id`);

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `device_ips`
--
ALTER TABLE `device_ips`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_user_id_index` (`user_id`),
  ADD KEY `enrollments_course_id_index` (`course_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `home_page_settings`
--
ALTER TABLE `home_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `instructor_reviews`
--
ALTER TABLE `instructor_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `language_phrases`
--
ALTER TABLE `language_phrases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_phrases_language_id_index` (`language_id`);

--
-- Índices de tabela `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_user_id_index` (`user_id`),
  ADD KEY `lessons_course_id_index` (`course_id`),
  ADD KEY `lessons_section_id_index` (`section_id`);

--
-- Índices de tabela `like_dislike_reviews`
--
ALTER TABLE `like_dislike_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `live_classes`
--
ALTER TABLE `live_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_classes_user_id_index` (`user_id`),
  ADD KEY `live_classes_course_id_index` (`course_id`);

--
-- Índices de tabela `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_thread_sender_foreign` (`contact_one`),
  ADD KEY `message_thread_receiver_foreign` (`contact_two`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices de tabela `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices de tabela `player_settings`
--
ALTER TABLE `player_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_user_id_index` (`user_id`),
  ADD KEY `sections_course_id_index` (`course_id`);

--
-- Índices de tabela `seo_fields`
--
ALTER TABLE `seo_fields`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `team_package_members`
--
ALTER TABLE `team_package_members`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `team_package_purchases`
--
ALTER TABLE `team_package_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `team_training_packages`
--
ALTER TABLE `team_training_packages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tutor_bookings`
--
ALTER TABLE `tutor_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tutor_can_teach`
--
ALTER TABLE `tutor_can_teach`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tutor_categories`
--
ALTER TABLE `tutor_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tutor_reviews`
--
ALTER TABLE `tutor_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tutor_schedules`
--
ALTER TABLE `tutor_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tutor_subjects`
--
ALTER TABLE `tutor_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices de tabela `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `watch_durations`
--
ALTER TABLE `watch_durations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `addtocarts`
--
ALTER TABLE `addtocarts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_likes`
--
ALTER TABLE `blog_likes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bootcamps`
--
ALTER TABLE `bootcamps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bootcamp_categories`
--
ALTER TABLE `bootcamp_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bootcamp_live_classes`
--
ALTER TABLE `bootcamp_live_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bootcamp_modules`
--
ALTER TABLE `bootcamp_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bootcamp_purchases`
--
ALTER TABLE `bootcamp_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bootcamp_resources`
--
ALTER TABLE `bootcamp_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `builder_pages`
--
ALTER TABLE `builder_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT de tabela `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de tabela `device_ips`
--
ALTER TABLE `device_ips`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `home_page_settings`
--
ALTER TABLE `home_page_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `instructor_reviews`
--
ALTER TABLE `instructor_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `language_phrases`
--
ALTER TABLE `language_phrases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2032;

--
-- AUTO_INCREMENT de tabela `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `like_dislike_reviews`
--
ALTER TABLE `like_dislike_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `live_classes`
--
ALTER TABLE `live_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `offline_payments`
--
ALTER TABLE `offline_payments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_settings`
--
ALTER TABLE `player_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `seo_fields`
--
ALTER TABLE `seo_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `team_package_members`
--
ALTER TABLE `team_package_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `team_package_purchases`
--
ALTER TABLE `team_package_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `team_training_packages`
--
ALTER TABLE `team_training_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutor_bookings`
--
ALTER TABLE `tutor_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutor_can_teach`
--
ALTER TABLE `tutor_can_teach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutor_categories`
--
ALTER TABLE `tutor_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutor_reviews`
--
ALTER TABLE `tutor_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutor_schedules`
--
ALTER TABLE `tutor_schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tutor_subjects`
--
ALTER TABLE `tutor_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `user_reviews`
--
ALTER TABLE `user_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `watch_durations`
--
ALTER TABLE `watch_durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `watch_histories`
--
ALTER TABLE `watch_histories`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
