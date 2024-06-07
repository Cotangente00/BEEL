-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2024 a las 22:02:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `beel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add postulantes', 1, 'add_postulantes'),
(2, 'Can change postulantes', 1, 'change_postulantes'),
(3, 'Can delete postulantes', 1, 'delete_postulantes'),
(4, 'Can view postulantes', 1, 'view_postulantes'),
(5, 'Can add empresas', 2, 'add_empresas'),
(6, 'Can change empresas', 2, 'change_empresas'),
(7, 'Can delete empresas', 2, 'delete_empresas'),
(8, 'Can view empresas', 2, 'view_empresas'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add roles', 9, 'add_roles'),
(34, 'Can change roles', 9, 'change_roles'),
(35, 'Can delete roles', 9, 'delete_roles'),
(36, 'Can view roles', 9, 'view_roles'),
(37, 'Can add tipo documentos', 10, 'add_tipodocumentos'),
(38, 'Can change tipo documentos', 10, 'change_tipodocumentos'),
(39, 'Can delete tipo documentos', 10, 'delete_tipodocumentos'),
(40, 'Can view tipo documentos', 10, 'view_tipodocumentos'),
(41, 'Can add localidad', 11, 'add_localidad'),
(42, 'Can change localidad', 11, 'change_localidad'),
(43, 'Can delete localidad', 11, 'delete_localidad'),
(44, 'Can view localidad', 11, 'view_localidad'),
(45, 'Can add sexo', 12, 'add_sexo'),
(46, 'Can change sexo', 12, 'change_sexo'),
(47, 'Can delete sexo', 12, 'delete_sexo'),
(48, 'Can view sexo', 12, 'view_sexo'),
(49, 'Can add tipo discapacidad', 13, 'add_tipodiscapacidad'),
(50, 'Can change tipo discapacidad', 13, 'change_tipodiscapacidad'),
(51, 'Can delete tipo discapacidad', 13, 'delete_tipodiscapacidad'),
(52, 'Can view tipo discapacidad', 13, 'view_tipodiscapacidad'),
(53, 'Can add tipo_discapacidad', 13, 'add_tipo_discapacidad'),
(54, 'Can change tipo_discapacidad', 13, 'change_tipo_discapacidad'),
(55, 'Can delete tipo_discapacidad', 13, 'delete_tipo_discapacidad'),
(56, 'Can view tipo_discapacidad', 13, 'view_tipo_discapacidad'),
(57, 'Can add tipo_documentos', 10, 'add_tipo_documentos'),
(58, 'Can change tipo_documentos', 10, 'change_tipo_documentos'),
(59, 'Can delete tipo_documentos', 10, 'delete_tipo_documentos'),
(60, 'Can view tipo_documentos', 10, 'view_tipo_documentos'),
(61, 'Can add estado_civil', 14, 'add_estado_civil'),
(62, 'Can change estado_civil', 14, 'change_estado_civil'),
(63, 'Can delete estado_civil', 14, 'delete_estado_civil'),
(64, 'Can view estado_civil', 14, 'view_estado_civil'),
(65, 'Can add grupo_sanguineo_rh', 15, 'add_grupo_sanguineo_rh'),
(66, 'Can change grupo_sanguineo_rh', 15, 'change_grupo_sanguineo_rh'),
(67, 'Can delete grupo_sanguineo_rh', 15, 'delete_grupo_sanguineo_rh'),
(68, 'Can view grupo_sanguineo_rh', 15, 'view_grupo_sanguineo_rh'),
(69, 'Can add nivel_idioma', 16, 'add_nivel_idioma'),
(70, 'Can change nivel_idioma', 16, 'change_nivel_idioma'),
(71, 'Can delete nivel_idioma', 16, 'delete_nivel_idioma'),
(72, 'Can view nivel_idioma', 16, 'view_nivel_idioma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(8, 'sessions', 'session'),
(2, 'Sistema_autenticacion_registro', 'empresas'),
(14, 'Sistema_autenticacion_registro', 'estado_civil'),
(15, 'Sistema_autenticacion_registro', 'grupo_sanguineo_rh'),
(11, 'Sistema_autenticacion_registro', 'localidad'),
(16, 'Sistema_autenticacion_registro', 'nivel_idioma'),
(1, 'Sistema_autenticacion_registro', 'postulantes'),
(9, 'Sistema_autenticacion_registro', 'roles'),
(12, 'Sistema_autenticacion_registro', 'sexo'),
(13, 'Sistema_autenticacion_registro', 'tipo_discapacidad'),
(10, 'Sistema_autenticacion_registro', 'tipo_documentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Sistema_autenticacion_registro', '0001_initial', '2024-06-04 19:34:01.089325'),
(2, 'Sistema_autenticacion_registro', '0002_rename_postulante_postulantes', '2024-06-04 19:34:01.095775'),
(3, 'Sistema_autenticacion_registro', '0003_empresas', '2024-06-04 19:34:01.130860'),
(4, 'Sistema_autenticacion_registro', '0004_empresas_confirmacion_contraseña_empresas_contraseña', '2024-06-04 19:34:01.302760'),
(5, 'Sistema_autenticacion_registro', '0005_rename_confirmacion_contraseña_empresas_confirmacion_contrasena_and_more', '2024-06-04 19:34:01.486315'),
(6, 'contenttypes', '0001_initial', '2024-06-04 19:34:01.522869'),
(7, 'auth', '0001_initial', '2024-06-04 19:34:01.937744'),
(8, 'admin', '0001_initial', '2024-06-04 19:34:02.043390'),
(9, 'admin', '0002_logentry_remove_auto_add', '2024-06-04 19:34:02.051394'),
(10, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-04 19:34:02.063145'),
(11, 'contenttypes', '0002_remove_content_type_name', '2024-06-04 19:34:02.186014'),
(12, 'auth', '0002_alter_permission_name_max_length', '2024-06-04 19:34:02.229037'),
(13, 'auth', '0003_alter_user_email_max_length', '2024-06-04 19:34:02.248719'),
(14, 'auth', '0004_alter_user_username_opts', '2024-06-04 19:34:02.260315'),
(15, 'auth', '0005_alter_user_last_login_null', '2024-06-04 19:34:02.323053'),
(16, 'auth', '0006_require_contenttypes_0002', '2024-06-04 19:34:02.325456'),
(17, 'auth', '0007_alter_validators_add_error_messages', '2024-06-04 19:34:02.325456'),
(18, 'auth', '0008_alter_user_username_max_length', '2024-06-04 19:34:02.352509'),
(19, 'auth', '0009_alter_user_last_name_max_length', '2024-06-04 19:34:02.369603'),
(20, 'auth', '0010_alter_group_name_max_length', '2024-06-04 19:34:02.397800'),
(21, 'auth', '0011_update_proxy_permissions', '2024-06-04 19:34:02.410516'),
(22, 'auth', '0012_alter_user_first_name_max_length', '2024-06-04 19:34:02.426147'),
(23, 'sessions', '0001_initial', '2024-06-04 19:34:02.459892'),
(24, 'Sistema_autenticacion_registro', '0006_roles', '2024-06-04 20:41:06.221433'),
(25, 'Sistema_autenticacion_registro', '0007_delete_roles', '2024-06-04 20:42:32.724722'),
(26, 'Sistema_autenticacion_registro', '0008_tipodocumentos', '2024-06-04 20:59:54.077596'),
(27, 'Sistema_autenticacion_registro', '0009_postulantes_nacionalidad', '2024-06-04 21:51:44.968201'),
(28, 'Sistema_autenticacion_registro', '0010_alter_postulantes_nacionalidad', '2024-06-04 21:52:40.123338'),
(29, 'Sistema_autenticacion_registro', '0011_localidad', '2024-06-04 22:18:09.395887'),
(30, 'Sistema_autenticacion_registro', '0012_sexo_tipodiscapacidad', '2024-06-05 19:54:07.933786'),
(31, 'Sistema_autenticacion_registro', '0013_alter_sexo_sexo_alter_tipodiscapacidad_tipo', '2024-06-05 19:54:30.752228'),
(32, 'Sistema_autenticacion_registro', '0014_rename_descripciondiscapacidad_postulantes_descripcion_discapacidad', '2024-06-05 20:13:58.704825'),
(33, 'Sistema_autenticacion_registro', '0015_rename_tipodiscapacidad_tipo_discapacidad_and_more', '2024-06-05 20:21:15.321678'),
(34, 'Sistema_autenticacion_registro', '0016_postulantes_id_localidad_postulantes_id_sexo_and_more', '2024-06-06 19:57:49.186034'),
(35, 'Sistema_autenticacion_registro', '0017_alter_postulantes_id_localidad_and_more', '2024-06-06 19:57:50.594271'),
(36, 'Sistema_autenticacion_registro', '0018_rename_id_localidad_postulantes_localidad_and_more', '2024-06-06 20:29:43.552486'),
(37, 'Sistema_autenticacion_registro', '0019_alter_postulantes_cedula', '2024-06-06 20:52:04.343044'),
(38, 'Sistema_autenticacion_registro', '0020_alter_empresas_confirmacion_contrasena_and_more', '2024-06-06 21:42:23.263303'),
(39, 'Sistema_autenticacion_registro', '0021_estado_civil_alter_empresas_confirmacion_contrasena_and_more', '2024-06-07 19:25:36.608223'),
(40, 'Sistema_autenticacion_registro', '0022_postulantes_estado_civil', '2024-06-07 19:26:56.975990'),
(41, 'Sistema_autenticacion_registro', '0023_alter_postulantes_estado_civil', '2024-06-07 19:27:06.695192'),
(42, 'Sistema_autenticacion_registro', '0024_grupo_sanguineo_rh_postulantes_grupo_sanguineo_rh', '2024-06-07 19:35:07.061443'),
(43, 'Sistema_autenticacion_registro', '0025_alter_postulantes_grupo_sanguineo_rh', '2024-06-07 19:35:16.585796'),
(44, 'Sistema_autenticacion_registro', '0026_nivel_idioma_postulantes_idioma', '2024-06-07 19:43:22.444013'),
(45, 'Sistema_autenticacion_registro', '0027_alter_postulantes_idioma', '2024-06-07 19:43:34.137555'),
(46, 'Sistema_autenticacion_registro', '0028_postulantes_nivel_idioma', '2024-06-07 19:44:28.502841'),
(47, 'Sistema_autenticacion_registro', '0029_alter_postulantes_nivel_idioma', '2024-06-07 19:44:37.274750');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_empresas`
--

CREATE TABLE `sistema_autenticacion_registro_empresas` (
  `id` int(11) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `confirmacion_contrasena` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_estado_civil`
--

CREATE TABLE `sistema_autenticacion_registro_estado_civil` (
  `id` int(11) NOT NULL,
  `estado_civil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_estado_civil`
--

INSERT INTO `sistema_autenticacion_registro_estado_civil` (`id`, `estado_civil`) VALUES
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Divorciado'),
(4, 'Viudo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_grupo_sanguineo_rh`
--

CREATE TABLE `sistema_autenticacion_registro_grupo_sanguineo_rh` (
  `id` int(11) NOT NULL,
  `grupo_sanguineo_rh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_grupo_sanguineo_rh`
--

INSERT INTO `sistema_autenticacion_registro_grupo_sanguineo_rh` (`id`, `grupo_sanguineo_rh`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_localidad`
--

CREATE TABLE `sistema_autenticacion_registro_localidad` (
  `id` int(11) NOT NULL,
  `localidades` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_localidad`
--

INSERT INTO `sistema_autenticacion_registro_localidad` (`id`, `localidades`) VALUES
(1, 'Antonio Nariño'),
(2, 'Barrios Unidos'),
(3, 'Bosa'),
(4, 'Chapinero'),
(5, 'Ciudad Bolivar'),
(6, 'Engativá'),
(7, 'Fontibon'),
(8, 'Kennedy'),
(9, 'La Candelaria'),
(10, 'Los Mártires'),
(11, 'Puente Aranda'),
(12, 'Rafael Uribe Uribe'),
(13, 'San Cristóbal'),
(14, 'Santa Fe'),
(15, 'Suba'),
(16, 'Sumapaz'),
(17, 'Teusaquillo'),
(18, 'Tunjuelito'),
(19, 'Usaquén'),
(20, 'Usme');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_nivel_idioma`
--

CREATE TABLE `sistema_autenticacion_registro_nivel_idioma` (
  `id` int(11) NOT NULL,
  `nivel_idioma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_nivel_idioma`
--

INSERT INTO `sistema_autenticacion_registro_nivel_idioma` (`id`, `nivel_idioma`) VALUES
(1, 'Principiante: A0'),
(2, 'Básico: A1-A2'),
(3, 'Pre-intermedio: A2-B1'),
(4, 'Intermedio: B1'),
(5, 'Intermedio-alto: B2-C1'),
(6, 'Avanzado: C2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_postulantes`
--

CREATE TABLE `sistema_autenticacion_registro_postulantes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `cedula` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `celular` varchar(255) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `descripcion_discapacidad` longtext NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `confirmacion_contrasena` varchar(255) NOT NULL,
  `nacionalidad` varchar(255) NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `sexo_id` int(11) NOT NULL,
  `tipo_discapacidad_id` int(11) NOT NULL,
  `tipo_documentos_id` int(11) NOT NULL,
  `estado_civil_id` int(11) NOT NULL,
  `grupo_sanguineo_rh_id` int(11) NOT NULL,
  `idioma` varchar(255) NOT NULL,
  `nivel_idioma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_sexo`
--

CREATE TABLE `sistema_autenticacion_registro_sexo` (
  `id` int(11) NOT NULL,
  `sexo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_sexo`
--

INSERT INTO `sistema_autenticacion_registro_sexo` (`id`, `sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_tipo_discapacidad`
--

CREATE TABLE `sistema_autenticacion_registro_tipo_discapacidad` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_tipo_discapacidad`
--

INSERT INTO `sistema_autenticacion_registro_tipo_discapacidad` (`id`, `tipo`) VALUES
(1, 'Física'),
(2, 'Mental'),
(3, 'Sensorial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_autenticacion_registro_tipo_documentos`
--

CREATE TABLE `sistema_autenticacion_registro_tipo_documentos` (
  `id` int(11) NOT NULL,
  `abreviatura` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema_autenticacion_registro_tipo_documentos`
--

INSERT INTO `sistema_autenticacion_registro_tipo_documentos` (`id`, `abreviatura`, `descripcion`) VALUES
(1, 'CC', 'Cédula de Ciudadanía'),
(2, 'CC', 'Cédula de Ciudadanía'),
(3, 'CC', 'Cédula de Ciudadanía'),
(4, 'TI', 'Tarjeta de Identidad'),
(5, 'RC', 'Registro Civil'),
(6, 'CE', 'Cédula de Extranjería'),
(7, 'PS', 'Pasaporte'),
(8, 'PEP', 'Permiso Especial de Permanencia'),
(9, 'PPT', 'Permiso por Protección Temporal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `sistema_autenticacion_registro_empresas`
--
ALTER TABLE `sistema_autenticacion_registro_empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `nit` (`nit`),
  ADD UNIQUE KEY `rut` (`rut`);

--
-- Indices de la tabla `sistema_autenticacion_registro_estado_civil`
--
ALTER TABLE `sistema_autenticacion_registro_estado_civil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_grupo_sanguineo_rh`
--
ALTER TABLE `sistema_autenticacion_registro_grupo_sanguineo_rh`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_localidad`
--
ALTER TABLE `sistema_autenticacion_registro_localidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_nivel_idioma`
--
ALTER TABLE `sistema_autenticacion_registro_nivel_idioma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_postulantes`
--
ALTER TABLE `sistema_autenticacion_registro_postulantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `Sistema_autenticacio_localidad_id_b72a528c_fk_Sistema_a` (`localidad_id`),
  ADD KEY `Sistema_autenticacio_sexo_id_5298ff20_fk_Sistema_a` (`sexo_id`),
  ADD KEY `Sistema_autenticacio_tipo_discapacidad_id_74bc7838_fk_Sistema_a` (`tipo_discapacidad_id`),
  ADD KEY `Sistema_autenticacio_tipo_documentos_id_936d1416_fk_Sistema_a` (`tipo_documentos_id`),
  ADD KEY `Sistema_autenticacio_estado_civil_id_1d7247cc_fk_Sistema_a` (`estado_civil_id`),
  ADD KEY `Sistema_autenticacio_grupo_sanguineo_rh_i_3cebfa00_fk_Sistema_a` (`grupo_sanguineo_rh_id`),
  ADD KEY `Sistema_autenticacio_nivel_idioma_id_408ff611_fk_Sistema_a` (`nivel_idioma_id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_sexo`
--
ALTER TABLE `sistema_autenticacion_registro_sexo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_tipo_discapacidad`
--
ALTER TABLE `sistema_autenticacion_registro_tipo_discapacidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sistema_autenticacion_registro_tipo_documentos`
--
ALTER TABLE `sistema_autenticacion_registro_tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_empresas`
--
ALTER TABLE `sistema_autenticacion_registro_empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_estado_civil`
--
ALTER TABLE `sistema_autenticacion_registro_estado_civil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_grupo_sanguineo_rh`
--
ALTER TABLE `sistema_autenticacion_registro_grupo_sanguineo_rh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_localidad`
--
ALTER TABLE `sistema_autenticacion_registro_localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_nivel_idioma`
--
ALTER TABLE `sistema_autenticacion_registro_nivel_idioma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_postulantes`
--
ALTER TABLE `sistema_autenticacion_registro_postulantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_sexo`
--
ALTER TABLE `sistema_autenticacion_registro_sexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_tipo_discapacidad`
--
ALTER TABLE `sistema_autenticacion_registro_tipo_discapacidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sistema_autenticacion_registro_tipo_documentos`
--
ALTER TABLE `sistema_autenticacion_registro_tipo_documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `sistema_autenticacion_registro_postulantes`
--
ALTER TABLE `sistema_autenticacion_registro_postulantes`
  ADD CONSTRAINT `Sistema_autenticacio_estado_civil_id_1d7247cc_fk_Sistema_a` FOREIGN KEY (`estado_civil_id`) REFERENCES `sistema_autenticacion_registro_estado_civil` (`id`),
  ADD CONSTRAINT `Sistema_autenticacio_grupo_sanguineo_rh_i_3cebfa00_fk_Sistema_a` FOREIGN KEY (`grupo_sanguineo_rh_id`) REFERENCES `sistema_autenticacion_registro_grupo_sanguineo_rh` (`id`),
  ADD CONSTRAINT `Sistema_autenticacio_localidad_id_b72a528c_fk_Sistema_a` FOREIGN KEY (`localidad_id`) REFERENCES `sistema_autenticacion_registro_localidad` (`id`),
  ADD CONSTRAINT `Sistema_autenticacio_nivel_idioma_id_408ff611_fk_Sistema_a` FOREIGN KEY (`nivel_idioma_id`) REFERENCES `sistema_autenticacion_registro_nivel_idioma` (`id`),
  ADD CONSTRAINT `Sistema_autenticacio_sexo_id_5298ff20_fk_Sistema_a` FOREIGN KEY (`sexo_id`) REFERENCES `sistema_autenticacion_registro_sexo` (`id`),
  ADD CONSTRAINT `Sistema_autenticacio_tipo_discapacidad_id_74bc7838_fk_Sistema_a` FOREIGN KEY (`tipo_discapacidad_id`) REFERENCES `sistema_autenticacion_registro_tipo_discapacidad` (`id`),
  ADD CONSTRAINT `Sistema_autenticacio_tipo_documentos_id_936d1416_fk_Sistema_a` FOREIGN KEY (`tipo_documentos_id`) REFERENCES `sistema_autenticacion_registro_tipo_documentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
