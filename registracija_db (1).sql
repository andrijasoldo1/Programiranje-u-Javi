-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 12:16 AM
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
-- Database: `registracija_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `lokacija`
--

CREATE TABLE `lokacija` (
  `lokID` int(32) NOT NULL,
  `lokI` varchar(100) NOT NULL,
  `adresa` varchar(200) NOT NULL,
  `termin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `osiguranje`
--

CREATE TABLE `osiguranje` (
  `osiguranjeID` int(32) NOT NULL,
  `imeOsiguravatelja` varchar(100) NOT NULL,
  `prezimeOsiguravatelja` varchar(100) NOT NULL,
  `pocetakO` date NOT NULL,
  `krajO` date NOT NULL,
  `vrstaO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registracija`
--

CREATE TABLE `registracija` (
  `registracijaID` int(100) NOT NULL,
  `vozacID` int(100) NOT NULL,
  `voziloID` int(100) NOT NULL,
  `registracijskaO` varchar(200) NOT NULL,
  `zeleniKarton` tinyint(1) NOT NULL,
  `osiguranjeID` int(100) NOT NULL,
  `lokID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vozac`
--

CREATE TABLE `vozac` (
  `vozacID` int(32) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `grad` varchar(100) NOT NULL,
  `JMBG` int(32) NOT NULL,
  `status` varchar(50) NOT NULL,
  `voziloID` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vozilo`
--

CREATE TABLE `vozilo` (
  `voziloID` int(32) NOT NULL,
  `registracijskaO` varchar(100) NOT NULL,
  `gradR` varchar(100) NOT NULL,
  `godina` int(100) NOT NULL,
  `marka` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `vrstaVozila` varchar(100) NOT NULL,
  `brojSasije` varchar(100) NOT NULL,
  `masa` int(100) NOT NULL,
  `dopustenaN` int(100) NOT NULL,
  `brojMjesta` int(100) NOT NULL,
  `obujamM` int(100) NOT NULL,
  `snagaM` int(100) NOT NULL,
  `gorivo` varchar(100) NOT NULL,
  `brojM` varchar(100) NOT NULL,
  `katalizator` tinyint(1) NOT NULL,
  `boja` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lokacija`
--
ALTER TABLE `lokacija`
  ADD PRIMARY KEY (`lokID`);

--
-- Indexes for table `osiguranje`
--
ALTER TABLE `osiguranje`
  ADD PRIMARY KEY (`osiguranjeID`);

--
-- Indexes for table `registracija`
--
ALTER TABLE `registracija`
  ADD PRIMARY KEY (`registracijaID`),
  ADD KEY `test` (`vozacID`),
  ADD KEY `voziloID` (`voziloID`),
  ADD KEY `osiguranjeID` (`osiguranjeID`);

--
-- Indexes for table `vozac`
--
ALTER TABLE `vozac`
  ADD PRIMARY KEY (`vozacID`),
  ADD UNIQUE KEY `JMBG` (`JMBG`);

--
-- Indexes for table `vozilo`
--
ALTER TABLE `vozilo`
  ADD PRIMARY KEY (`voziloID`),
  ADD UNIQUE KEY `brojSasije` (`brojSasije`),
  ADD UNIQUE KEY `registracijskaO` (`registracijskaO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lokacija`
--
ALTER TABLE `lokacija`
  MODIFY `lokID` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `osiguranje`
--
ALTER TABLE `osiguranje`
  MODIFY `osiguranjeID` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registracija`
--
ALTER TABLE `registracija`
  MODIFY `registracijaID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vozac`
--
ALTER TABLE `vozac`
  MODIFY `vozacID` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vozilo`
--
ALTER TABLE `vozilo`
  MODIFY `voziloID` int(32) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lokacija`
--
ALTER TABLE `lokacija`
  ADD CONSTRAINT `lokacija_ibfk_2` FOREIGN KEY (`lokID`) REFERENCES `registracija` (`registracijaID`);

--
-- Constraints for table `registracija`
--
ALTER TABLE `registracija`
  ADD CONSTRAINT `registracija_ibfk_1` FOREIGN KEY (`voziloID`) REFERENCES `vozilo` (`voziloID`),
  ADD CONSTRAINT `registracija_ibfk_2` FOREIGN KEY (`osiguranjeID`) REFERENCES `osiguranje` (`osiguranjeID`),
  ADD CONSTRAINT `test` FOREIGN KEY (`vozacID`) REFERENCES `vozac` (`vozacID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
