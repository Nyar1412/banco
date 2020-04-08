-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 08, 2020 at 04:41 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ParabellumDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Aliado`
--

CREATE TABLE `Aliado` (
  `fk_id_usuario1` int(11) NOT NULL,
  `fk_id_usuario2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Clase`
--

CREATE TABLE `Clase` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `logo` varchar(30) COLLATE utf16_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Estado`
--

CREATE TABLE `Estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf16_spanish2_ci NOT NULL,
  `simbolo` int(30) NOT NULL,
  `descripcion` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Gremio`
--

CREATE TABLE `Gremio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf16_spanish2_ci NOT NULL,
  `logo` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `fk_lider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Habilidad`
--

CREATE TABLE `Habilidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf16_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Incidencia`
--

CREATE TABLE `Incidencia` (
  `id` int(11) NOT NULL,
  `fk_acusante` int(11) NOT NULL,
  `fk_reportado` int(11) NOT NULL,
  `motivo` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_04_08_021015_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Mision`
--

CREATE TABLE `Mision` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(300) COLLATE utf16_spanish2_ci NOT NULL,
  `DuracionMin` int(11) NOT NULL,
  `titulo` varchar(30) COLLATE utf16_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

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
-- Table structure for table `personaje`
--

CREATE TABLE `personaje` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf16_spanish2_ci NOT NULL,
  `fk_clase` int(11) NOT NULL,
  `fk_gremio` int(11) NOT NULL,
  `frase` varchar(140) COLLATE utf16_spanish2_ci NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Personaje_estado`
--

CREATE TABLE `Personaje_estado` (
  `fk_personaje` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `duracionMin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personaje_habilidad`
--

CREATE TABLE `personaje_habilidad` (
  `fk_id_Personaje` int(11) NOT NULL,
  `fk_id_hab` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regla`
--

CREATE TABLE `regla` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `fk_gremio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restriccion_clase`
--

CREATE TABLE `restriccion_clase` (
  `fk_id_clase` int(11) NOT NULL,
  `fk_id_mision` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restriccion_habilidad`
--

CREATE TABLE `restriccion_habilidad` (
  `fk_id_hab` int(11) NOT NULL,
  `fk_id_mision` int(11) NOT NULL,
  `min_puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL,
  `nick` varchar(30) COLLATE utf16_spanish2_ci NOT NULL,
  `password` varchar(400) COLLATE utf16_spanish2_ci NOT NULL,
  `fk_personaje` int(11) DEFAULT NULL,
  `rol` varchar(30) COLLATE utf16_spanish2_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(40) COLLATE utf16_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`id`, `nick`, `password`, `fk_personaje`, `rol`, `habilitado`, `email`) VALUES
(25, 'tete', '$2y$10$6f0p.9Q9.n9S1x7srknmneKiZwGodW/K5G6XVWIGSeOT3JXtYUiTq', NULL, 'usuario', 1, 'tete@gmail.com'),
(26, 'reet', '$2y$10$jmqJgCFkAZeIQnVigpgcMOpvzU6LUurZAGwAULT3ZW7w/6YFQfzgW', NULL, 'usuario', 1, 'reet@gmail.com'),
(27, 'ty', '$2y$10$1KWEyydc5b3CxEZvzGRMPeDJAaSCt3Bezd0OekpPAt8CKt.mcqYLq', NULL, 'usuario', 1, 'ty@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Aliado`
--
ALTER TABLE `Aliado`
  ADD PRIMARY KEY (`fk_id_usuario1`,`fk_id_usuario2`),
  ADD KEY `fk_aliadoConstr2` (`fk_id_usuario2`);

--
-- Indexes for table `Clase`
--
ALTER TABLE `Clase`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `Estado`
--
ALTER TABLE `Estado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Gremio`
--
ALTER TABLE `Gremio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `fk_lider` (`fk_lider`);

--
-- Indexes for table `Habilidad`
--
ALTER TABLE `Habilidad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `Incidencia`
--
ALTER TABLE `Incidencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acusante` (`fk_acusante`),
  ADD KEY `reportado` (`fk_reportado`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mision`
--
ALTER TABLE `Mision`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo` (`titulo`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `personaje_clase` (`fk_clase`),
  ADD KEY `personaje_gremio` (`fk_gremio`);

--
-- Indexes for table `Personaje_estado`
--
ALTER TABLE `Personaje_estado`
  ADD KEY `id_personaje_estado` (`fk_personaje`),
  ADD KEY `id_estado_personaje` (`fk_estado`);

--
-- Indexes for table `personaje_habilidad`
--
ALTER TABLE `personaje_habilidad`
  ADD PRIMARY KEY (`fk_id_hab`,`fk_id_Personaje`) USING BTREE,
  ADD KEY `personaje_id` (`fk_id_Personaje`);

--
-- Indexes for table `regla`
--
ALTER TABLE `regla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regla_gremio` (`fk_gremio`);

--
-- Indexes for table `restriccion_clase`
--
ALTER TABLE `restriccion_clase`
  ADD PRIMARY KEY (`fk_id_clase`,`fk_id_mision`),
  ADD KEY `misionReferenciada` (`fk_id_mision`);

--
-- Indexes for table `restriccion_habilidad`
--
ALTER TABLE `restriccion_habilidad`
  ADD PRIMARY KEY (`fk_id_hab`,`fk_id_mision`),
  ADD KEY `misionReferenciadaHab` (`fk_id_mision`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `personaje_usuario` (`fk_personaje`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Clase`
--
ALTER TABLE `Clase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Estado`
--
ALTER TABLE `Estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Gremio`
--
ALTER TABLE `Gremio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Habilidad`
--
ALTER TABLE `Habilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Incidencia`
--
ALTER TABLE `Incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Mision`
--
ALTER TABLE `Mision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personaje`
--
ALTER TABLE `personaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regla`
--
ALTER TABLE `regla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Aliado`
--
ALTER TABLE `Aliado`
  ADD CONSTRAINT `fk_aliadoConstr1` FOREIGN KEY (`fk_id_usuario1`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aliadoConstr2` FOREIGN KEY (`fk_id_usuario2`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Gremio`
--
ALTER TABLE `Gremio`
  ADD CONSTRAINT `Gremio_ibfk_1` FOREIGN KEY (`fk_lider`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Incidencia`
--
ALTER TABLE `Incidencia`
  ADD CONSTRAINT `acusante` FOREIGN KEY (`fk_acusante`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reportado` FOREIGN KEY (`fk_reportado`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `personaje_clase` FOREIGN KEY (`fk_clase`) REFERENCES `Clase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personaje_gremio` FOREIGN KEY (`fk_gremio`) REFERENCES `Gremio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Personaje_estado`
--
ALTER TABLE `Personaje_estado`
  ADD CONSTRAINT `id_estado_personaje` FOREIGN KEY (`fk_estado`) REFERENCES `Estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_personaje_estado` FOREIGN KEY (`fk_personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personaje_habilidad`
--
ALTER TABLE `personaje_habilidad`
  ADD CONSTRAINT `personaje_habilidad_relacion` FOREIGN KEY (`fk_id_hab`) REFERENCES `Habilidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personaje_id` FOREIGN KEY (`fk_id_Personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regla`
--
ALTER TABLE `regla`
  ADD CONSTRAINT `regla_gremio` FOREIGN KEY (`fk_gremio`) REFERENCES `Gremio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restriccion_clase`
--
ALTER TABLE `restriccion_clase`
  ADD CONSTRAINT `claseRestringida` FOREIGN KEY (`fk_id_clase`) REFERENCES `Clase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misionReferenciada` FOREIGN KEY (`fk_id_mision`) REFERENCES `Mision` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restriccion_habilidad`
--
ALTER TABLE `restriccion_habilidad`
  ADD CONSTRAINT `habilidadRequerida` FOREIGN KEY (`fk_id_hab`) REFERENCES `Habilidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misionReferenciadaHab` FOREIGN KEY (`fk_id_mision`) REFERENCES `Mision` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `personaje_usuario` FOREIGN KEY (`fk_personaje`) REFERENCES `personaje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
