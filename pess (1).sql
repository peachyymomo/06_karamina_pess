-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 09:09 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pess`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_ID` int(11) NOT NULL,
  `patrolcar_ID` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_ID`, `patrolcar_ID`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(10, 'QX132V', '2021-03-03 21:50:36', '2021-03-03 21:51:04', '2021-03-03 21:55:22'),
(12, 'QX123A', '2021-03-04 13:38:19', '2021-03-04 13:40:16', '2021-03-04 13:40:26'),
(13, 'QX231V', '2021-03-04 14:37:20', '2021-03-04 14:37:28', '2021-03-04 14:37:33'),
(14, 'QX123A', '2021-03-04 15:11:48', '2021-03-04 17:05:38', '2021-03-04 16:33:54'),
(14, 'QX231V', '2021-03-04 15:11:48', NULL, '2021-03-04 16:33:29'),
(15, 'QX123A', '2021-03-04 17:05:31', '2021-03-04 17:05:38', '2021-03-04 17:05:51'),
(15, 'QX132J', '2021-03-04 17:05:31', '2021-03-04 17:05:46', '2021-03-04 17:05:57'),
(16, 'QX123A', '2021-03-04 18:09:19', '2021-03-04 18:09:37', '2021-03-04 18:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_ID` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_ID` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_ID` varchar(1) NOT NULL,
  `time_called` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_ID`, `caller_name`, `phone_number`, `incident_type_ID`, `incident_location`, `incident_desc`, `incident_status_ID`, `time_called`) VALUES
(10, 'Meiying', '87279096', '020', 'CCK', 'Riot @ CC ', '3', '2021-03-03 21:50:36'),
(11, 'Meiying', '87279098', '020', 'CCK', 'Riot @ Community Club', '2', '2021-03-03 21:59:14'),
(12, 'testing', 'testing', '080', 'testing', 'testing', '3', '2021-03-04 13:38:19'),
(13, 'Johnathan', '89281821', '080', 'Jurong East', 'stuck at swing', '3', '2021-03-04 14:37:20'),
(14, 'kartina', '12345678', '080', 'jurong east', 'illali', '3', '2021-03-04 15:11:47'),
(15, 'Karamina', '84633853', '080', 'CCK', 'stuck @ swing', '3', '2021-03-04 17:05:31'),
(16, 'testing', 'testing', '080', 'testing', 'testing', '3', '2021-03-04 18:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident_status_ID` varchar(1) NOT NULL,
  `incident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident_status_ID`, `incident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_ID` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_ID`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violence'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('080', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_ID` varchar(10) NOT NULL,
  `patrolcar_status_ID` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_ID`, `patrolcar_status_ID`) VALUES
('QX123A', '1'),
('QX132J', '3'),
('QX132V', '3'),
('QX133A', '3'),
('QX231V', '3'),
('QX241P', '3'),
('QX326J', '3'),
('QX435J', '3'),
('QX555S', '3'),
('QX657F', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_ID` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_ID`, `patrolcar_status_desc`) VALUES
('4', 'Arrived'),
('1', 'Dispatched'),
('3', 'Free'),
('2', 'Patrol');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_ID`,`patrolcar_ID`),
  ADD KEY `patrolcar_ID` (`patrolcar_ID`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_ID`),
  ADD KEY `incident_type_ID` (`incident_type_ID`,`incident_status_ID`),
  ADD KEY `incident_status_ID` (`incident_status_ID`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident_status_ID`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_ID`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_ID`),
  ADD KEY `patrolcar_status_ID` (`patrolcar_status_ID`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_ID`),
  ADD KEY `patrolcar_status_desc` (`patrolcar_status_desc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`incident_ID`) REFERENCES `incident` (`incident_ID`),
  ADD CONSTRAINT `dispatch_ibfk_2` FOREIGN KEY (`patrolcar_ID`) REFERENCES `patrolcar` (`patrolcar_ID`);

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`incident_type_ID`) REFERENCES `incident_type` (`incident_type_ID`),
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`incident_status_ID`) REFERENCES `incident_status` (`incident_status_ID`);

--
-- Constraints for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD CONSTRAINT `patrolcar_ibfk_1` FOREIGN KEY (`patrolcar_status_ID`) REFERENCES `patrolcar_status` (`patrolcar_status_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
