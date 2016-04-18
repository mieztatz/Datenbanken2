-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2016 at 03:11 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Table structure for table `fans`
--

CREATE TABLE `fans` (
  `firstname` text COLLATE latin1_german1_ci NOT NULL,
  `lastname` text COLLATE latin1_german1_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `mail` varchar(60) COLLATE latin1_german1_ci NOT NULL,
  `clubmember` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `fans`
--

INSERT INTO `fans` (`firstname`, `lastname`, `birthday`, `mail`, `clubmember`) VALUES
('Fabian', 'Uhlmann', NULL, 'fuhlmann@hm.edu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `leaguename` varchar(60) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`leaguename`) VALUES
('1. Liga '),
('2. Liga'),
('3. Liga '),
('Bayernliga'),
('Deutsche Nationalmannschaft'),
('EM 2016'),
('Regionalliga Bayern');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `mail` varchar(60) COLLATE latin1_german1_ci NOT NULL,
  `leaguenews` varchar(60) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`mail`, `leaguenews`) VALUES
('fuhlmann@hm.edu', '1. Liga '),
('fuhlmann@hm.edu', '2. Liga');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `teamname` varchar(30) COLLATE latin1_german1_ci NOT NULL,
  `vote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`teamname`, `vote`) VALUES
('1. Dynamo Diana ', 23),
('Dynamo Dresden', 16),
('Energie Cottbus', 15),
('FC Bayern München', 10),
('FC Fabian United', 4),
('FC Schalke 04', 9),
('Hertha BSC', 3),
('HSV Hamburg', 4),
('SV Schechen', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fans`
--
ALTER TABLE `fans`
  ADD PRIMARY KEY (`mail`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`leaguename`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`mail`,`leaguenews`),
  ADD KEY `leaguenews` (`leaguenews`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`teamname`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD CONSTRAINT `newsletter_ibfk_1` FOREIGN KEY (`mail`) REFERENCES `fans` (`mail`),
  ADD CONSTRAINT `newsletter_ibfk_2` FOREIGN KEY (`leaguenews`) REFERENCES `league` (`leaguename`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
