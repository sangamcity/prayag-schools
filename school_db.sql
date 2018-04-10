-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2018 at 08:21 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `csid` int(11) NOT NULL,
  `present_student` int(11) NOT NULL,
  `present_staff` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `csid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `reg_student` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`csid`, `sid`, `class`, `reg_student`) VALUES
(1, 1, 1, 36),
(2, 1, 2, 40),
(3, 1, 3, 32),
(4, 1, 4, 35),
(5, 4, 1, 50),
(6, 4, 2, 38),
(7, 1, 5, 30),
(8, 4, 3, 56),
(9, 4, 4, 45),
(10, 4, 5, 34);

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `csid` int(11) NOT NULL,
  `date` date NOT NULL,
  `avg_marks` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`csid`, `date`, `avg_marks`) VALUES
(1, '2018-04-10', 85.4),
(2, '2018-04-10', 74),
(3, '2018-04-10', 65),
(4, '2018-04-10', 82),
(5, '2018-04-10', 70),
(6, '2018-04-10', 67),
(7, '2018-04-10', 54),
(8, '2018-04-10', 63),
(9, '2018-04-10', 76),
(10, '2018-04-10', 75);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `sid` int(11) NOT NULL,
  `sname` varchar(128) NOT NULL,
  `hname` varchar(64) NOT NULL,
  `hmobile` varchar(16) NOT NULL,
  `location` varchar(128) NOT NULL,
  `img` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`sid`, `sname`, `hname`, `hmobile`, `location`, `img`) VALUES
(1, 'Bahadur Primary Schools Allahabad', 'Rajendra Prasad', '9161575960', 'taliarganj', ''),
(2, 'Rampur Primary Schools Allahabad', 'Ramesh', '8483748374', 'Rampur', ''),
(3, 'Sangam Primary Schools Allahabad', 'Samyak Jain', '7905804461', 'Sangam Allahabad', ''),
(4, 'Ramgarh Primary Schools Allahabad', 'Ajay Kumar', '8458449584', 'Rambagh ', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`csid`,`date`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`csid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`csid`,`date`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `hmobile` (`hmobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `csid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`csid`) REFERENCES `classes` (`csid`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `school` (`sid`);

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`csid`) REFERENCES `classes` (`csid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
