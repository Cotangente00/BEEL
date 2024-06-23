-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2024 at 01:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beel_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user', 1, 'add_customuser'),
(2, 'Can change user', 1, 'change_customuser'),
(3, 'Can delete user', 1, 'delete_customuser'),
(4, 'Can view user', 1, 'view_customuser'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'contenttypes', 'contenttype'),
(1, 'registro_login', 'customuser'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-23 21:41:31.189044'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-06-23 21:41:31.249005'),
(3, 'auth', '0001_initial', '2024-06-23 21:41:31.501852'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-06-23 21:41:31.561812'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-06-23 21:41:31.569807'),
(6, 'auth', '0004_alter_user_username_opts', '2024-06-23 21:41:31.577802'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-06-23 21:41:31.584797'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-06-23 21:41:31.587796'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-06-23 21:41:31.594791'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-06-23 21:41:31.605785'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-06-23 21:41:31.613781'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-06-23 21:41:31.627772'),
(13, 'auth', '0011_update_proxy_permissions', '2024-06-23 21:41:31.636765'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-06-23 21:41:31.666748'),
(15, 'registro_login', '0001_initial', '2024-06-23 21:41:32.055162'),
(16, 'admin', '0001_initial', '2024-06-23 21:41:32.198073'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-06-23 21:41:32.210066'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-23 21:41:32.220060'),
(19, 'sessions', '0001_initial', '2024-06-23 21:41:32.260035');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('l6huktjc9ub0rdn4d93j9fkds0ulc4vh', 'e30:1sLV2B:m3XlorVqi4gtpiyhFBs3__Y31p__P-Kt5aPCSoFeyPI', '2024-07-07 21:46:03.438685'),
('nayl9kqurvbaahr3cojzibvheds8v3wx', 'e30:1sLVip:vhhACtwdFi7tSKl3zkshURTFi5N2Hi5JrKg9-AsqIXE', '2024-07-07 22:30:07.302152'),
('u4kror0ddbjg5h7ly0lzhu6r7kdzxhy0', 'e30:1sLVX9:FjSQwNBD7QmtKS17dZOwS777nEH_0MaraCTSSJimOSQ', '2024-07-07 22:18:03.633391'),
('wcy1iez6ubl5rtnhl622cdlmucoc8paz', 'e30:1sLVPf:2_GtPUb3y0kRT1Hoa-rvTaB6M9VMaRluFTfLkLW-tO8', '2024-07-07 22:10:19.730395'),
('yfcqknlrghl7f4okwlzt5zufliglq1k1', 'e30:1sLUzy:PEotKx-ZA-gsZgkKNyCegFvL43WuGJA5Wj6-KcqLOnI', '2024-07-07 21:43:46.095075'),
('zq5yujkk0s5euag5lcjirciedyuyvpxo', 'e30:1sLVdO:6AjNFAGMGD8reQX1EjpEnJILr_0FFNMoSZUQLK1S_7E', '2024-07-07 22:24:30.565065');

-- --------------------------------------------------------

--
-- Table structure for table `registro_login_customuser`
--

CREATE TABLE `registro_login_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registro_login_customuser`
--

INSERT INTO `registro_login_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `nit`, `cedula`) VALUES
(1, 'pbkdf2_sha256$720000$axi0Y1rQ5oDj3MgusPnlFi$Dz9GAPeQxKYWizZyqJ/H6neqVAtTajgDnLVmeFndKGs=', '2024-06-23 23:18:30.299947', 0, 'Cotangente', '', '', 'julianavila458@gmail.com', 0, 1, '2024-06-23 21:43:45.070151', 'postulante', NULL, '1034276238'),
(2, 'pbkdf2_sha256$720000$nF9f5OkjtzP0UK8JZEnEW2$90/Qs30qcb+8Y2n/onaeOmPyLt5BRw+11UgCcsr70Z4=', '2024-06-23 23:19:11.213366', 0, 'Casalimpia', '', '', 'casalimpia@gmail.com', 0, 1, '2024-06-23 21:52:45.195789', 'empresa', '2345654323', NULL),
(3, 'pbkdf2_sha256$720000$7LO6q4pwQN5lT5eDdgOzcW$uTftkLJt1qm5c25Z1nThYjd9S7XLOZa+NE6qFN2ZutY=', NULL, 0, 'Bavaria', '', '', 'bavaria@gmail.com', 0, 1, '2024-06-23 22:03:32.535370', 'empresa', '48547584', NULL),
(4, 'pbkdf2_sha256$720000$UR4T4UgdDNs30TfXiVbW3e$ou8VgwDpTWAcPuaJGTS52XQM2g87PfLAlNAoIp3liCY=', NULL, 0, 'mafe', '', '', 'lopezmariafernanda060@gmail.com', 0, 1, '2024-06-23 22:24:29.605903', 'postulante', NULL, '1398473984'),
(5, 'pbkdf2_sha256$720000$5cPRrvh87X1tWUROQK9WtA$WDzb4063P7fEN4Mq2SBD3IOYkth63LfkwAlR3nGDtpc=', NULL, 0, 'johan', '', '', 'luque123@gmail.com', 0, 1, '2024-06-23 22:30:06.339561', 'postulante', NULL, '324325323'),
(6, 'pbkdf2_sha256$720000$5rqj30fSH0thTNfNh3Oo8S$tiDtmif6VqubUlw2bR701jHMlaAbNViC67OPA9rvkI8=', '2024-06-23 22:34:54.806022', 0, 'freddy', '', '', 'pumarfreddy@gmail.com', 0, 1, '2024-06-23 22:34:53.741190', 'postulante', NULL, '523910234'),
(7, 'pbkdf2_sha256$720000$Wybd6Rz52adjddUrXeG6tc$yr67WTlEPaLl4kZmSl0HLdt1cc4VPNs+ZwH8/LthgHk=', '2024-06-23 22:36:42.106262', 0, 'ArturoCalle', '', '', 'arturocalle@gmail.com', 0, 1, '2024-06-23 22:36:41.153822', 'empresa', '34957349', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registro_login_customuser_groups`
--

CREATE TABLE `registro_login_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registro_login_customuser_user_permissions`
--

CREATE TABLE `registro_login_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_registro_` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `registro_login_customuser`
--
ALTER TABLE `registro_login_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `registro_login_customuser_groups`
--
ALTER TABLE `registro_login_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registro_login_customuse_customuser_id_group_id_605da95e_uniq` (`customuser_id`,`group_id`),
  ADD KEY `registro_login_custo_group_id_ac6d3aa8_fk_auth_grou` (`group_id`);

--
-- Indexes for table `registro_login_customuser_user_permissions`
--
ALTER TABLE `registro_login_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registro_login_customuse_customuser_id_permission_402737bf_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `registro_login_custo_permission_id_d74242a5_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `registro_login_customuser`
--
ALTER TABLE `registro_login_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `registro_login_customuser_groups`
--
ALTER TABLE `registro_login_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registro_login_customuser_user_permissions`
--
ALTER TABLE `registro_login_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_registro_` FOREIGN KEY (`user_id`) REFERENCES `registro_login_customuser` (`id`);

--
-- Constraints for table `registro_login_customuser_groups`
--
ALTER TABLE `registro_login_customuser_groups`
  ADD CONSTRAINT `registro_login_custo_customuser_id_e30a34f6_fk_registro_` FOREIGN KEY (`customuser_id`) REFERENCES `registro_login_customuser` (`id`),
  ADD CONSTRAINT `registro_login_custo_group_id_ac6d3aa8_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `registro_login_customuser_user_permissions`
--
ALTER TABLE `registro_login_customuser_user_permissions`
  ADD CONSTRAINT `registro_login_custo_customuser_id_e61cdad8_fk_registro_` FOREIGN KEY (`customuser_id`) REFERENCES `registro_login_customuser` (`id`),
  ADD CONSTRAINT `registro_login_custo_permission_id_d74242a5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
