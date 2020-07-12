-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2020 at 12:12 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exercici 6`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `direccio` varchar(100) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data_registre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `direccio`, `telefon`, `email`, `data_registre`) VALUES
(1, 'miriam', 'carrer galileu 34', 666666, '666@gmail.com', '2020-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `empleat`
--

CREATE TABLE `empleat` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `cognom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empleat`
--

INSERT INTO `empleat` (`id_empleat`, `nom`, `cognom`) VALUES
(1, 'jordi', 'manubens');

-- --------------------------------------------------------

--
-- Table structure for table `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `direccio` text NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `nom`, `direccio`, `telefon`, `fax`, `nif`) VALUES
(1, 'rayban', 'downstreet 31, california', 555555, 444444, 123345);

-- --------------------------------------------------------

--
-- Table structure for table `provisio`
--

CREATE TABLE `provisio` (
  `marca` varchar(30) NOT NULL,
  `id_proveidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provisio`
--

INSERT INTO `provisio` (`marca`, `id_proveidor`) VALUES
('rayban aviador', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recomanacio`
--

CREATE TABLE `recomanacio` (
  `id_client` int(11) NOT NULL,
  `id_client_antic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recomanacio`
--

INSERT INTO `recomanacio` (`id_client`, `id_client_antic`) VALUES
(1, 24);

-- --------------------------------------------------------

--
-- Table structure for table `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `graduacio_vidre1` int(11) NOT NULL,
  `graduacio_vidre2` int(11) NOT NULL,
  `tipus_muntura` varchar(30) NOT NULL,
  `color_muntura` varchar(30) NOT NULL,
  `color_vidre1` varchar(30) NOT NULL,
  `color_vidre2` varchar(30) NOT NULL,
  `preu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca`, `graduacio_vidre1`, `graduacio_vidre2`, `tipus_muntura`, `color_muntura`, `color_vidre1`, `color_vidre2`, `preu`) VALUES
(1, 'rayban aviador', 2, 3, 'pasta', 'vermell', 'transparent', 'transparent', 150);

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `id_client` int(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL,
  `id_empleat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venta`
--

INSERT INTO `venta` (`id_client`, `id_ulleres`, `id_empleat`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indexes for table `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indexes for table `provisio`
--
ALTER TABLE `provisio`
  ADD PRIMARY KEY (`marca`),
  ADD UNIQUE KEY `id_proveidor` (`id_proveidor`);

--
-- Indexes for table `recomanacio`
--
ALTER TABLE `recomanacio`
  ADD UNIQUE KEY `id_client` (`id_client`);

--
-- Indexes for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD UNIQUE KEY `marca` (`marca`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD UNIQUE KEY `id_client` (`id_client`),
  ADD UNIQUE KEY `id_ulleres` (`id_ulleres`),
  ADD UNIQUE KEY `id_empleat` (`id_empleat`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `provisio`
--
ALTER TABLE `provisio`
  ADD CONSTRAINT `provisio-proveidor` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidor` (`id_proveidor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recomanacio`
--
ALTER TABLE `recomanacio`
  ADD CONSTRAINT `recomanacio-client` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres-provisio` FOREIGN KEY (`marca`) REFERENCES `provisio` (`marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta-clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venta-empleat` FOREIGN KEY (`id_empleat`) REFERENCES `empleat` (`id_empleat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venta-ulleres` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
