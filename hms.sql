-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 06:50 AM
-- Server version: 8.0.26
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'abcd@gmail.com', 'DR. Kunwar', 'Surgery'),
(2, 'ritikakh@gmail.com', 'Dr.Khandelwal', 'Neurologist');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(3, 'abcd@gmail.com', 'Raghav', 'Male', 'evening', 'fever', '09:28:00', '2021-09-24', 'Surgery', '07500835846'),
(4, 'abcd@gmail.com', 'Raghav', 'Male', 'evening', 'fever', '18:22:00', '2021-10-14', 'Select Doctor Department', '07500835846'),
(6, 'abcd@gmail.com', 'Raghav Khandelwal', 'Male', 'evening', 'fever', '18:22:00', '2021-10-02', 'Neurologist', '07500835846');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr Values(null,NEW.pid,NEW.email,NEW.name,"PATIENT UPDATED",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientdeleted` BEFORE DELETE ON `patients` FOR EACH ROW Insert into trigr Values(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr Values(null,NEW.pid,NEW.email,NEW.name,"PATIENT INSERTED",NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `Name`, `Email`) VALUES
(1, 'raghav', 'raghavrakh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int NOT NULL,
  `pid` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trigr`
--

INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 4, 'abcd@gmail.com', 'Raghav Khandelwal', 'patient inserted', '2021-09-24 09:17:18'),
(2, 5, 'abcd@gmail.com', 'Raghav Khandelwal', 'patient inserted', '2021-09-24 09:17:42'),
(3, 6, 'abcd@gmail.com', 'Raghav Khandelwal', 'patient inserted', '2021-09-24 09:17:50'),
(4, 4, 'abcd@gmail.com', 'Raghav', 'patient inserted', '2021-09-24 09:20:58'),
(5, 3, 'abcd@gmail.com', 'Raghav', 'patient updated', '2021-09-24 09:25:25'),
(6, 5, 'abcd@gmail.com', 'Raghav Khandelwal', 'patient deleted', '2021-09-24 09:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'asda', 'raghavrakh@gmail.com', 'pbkdf2:sha256:260000$VpJi7A4xm4mizoWS$95ba57e735688913d027dc64ee9aacce85127920740a4e58fd2a2c3aaef0f676'),
(2, 'abcd', 'abcd@gmail.com', 'pbkdf2:sha256:260000$ZH0QVRyJvfDRLE46$8fdb4af4ddd4a220bf0aeb19c931aa1ed8c19617677707cc4caef199a1be365e'),
(3, 'rkeccentric', 'rkeccentric@gmail.com', 'pbkdf2:sha256:260000$W2o1WelgB1I8lJ29$239cfffe1f4192c52ee6fa1d7972f48570970fb3ef96a54689f4f46cba30b63a'),
(4, 'ritzi', 'ritikakh@gmail.com', 'pbkdf2:sha256:260000$cVbb2tbYCXzNURlo$83d8d6135152c201a594c65402762aa319d51ca5403e9e8d8f6b32cd1c3545cf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
