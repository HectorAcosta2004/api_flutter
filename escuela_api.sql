-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2026 at 12:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escuela_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `salon_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`id`, `matricula`, `nombre`, `salon_id`) VALUES
(4, 'A002', 'Martin Perez', 2),
(5, 'A004', 'Issa Aguilar', 2),
(6, 'A006', 'Issa Aguilar', 1),
(7, 'A005', 'Issa Aguilar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `anios`
--

CREATE TABLE `anios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anios`
--

INSERT INTO `anios` (`id`, `nombre`) VALUES
(1, 'Primer Año'),
(2, 'Segundo Año'),
(3, 'Tercer Año');

-- --------------------------------------------------------

--
-- Table structure for table `salones`
--

CREATE TABLE `salones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `anio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salones`
--

INSERT INTO `salones` (`id`, `nombre`, `anio_id`) VALUES
(1, 'Salón A1', 1),
(2, 'Salón A2', 1),
(3, 'Salón B1', 2),
(4, 'Salón B2', 2),
(5, 'Salón C1', 3),
(6, 'Salón C2', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `salon_id` (`salon_id`);

--
-- Indexes for table `anios`
--
ALTER TABLE `anios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `anios`
--
ALTER TABLE `anios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salones`
--
ALTER TABLE `salones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salones` (`id`);

--
-- Constraints for table `salones`
--
ALTER TABLE `salones`
  ADD CONSTRAINT `salones_ibfk_1` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
