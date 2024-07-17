-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 02:50 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin@123', '2016-04-04 20:31:45', '2023-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_sn` varchar(255) NOT NULL,
  `course_fn` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(9, '', 'B.A.M.S', 'Bachelor of Ayurvedic Medicine and Surgery', '2023-10-11 13:19:35'),
(10, '', 'Engg', 'engg', '2023-10-16 10:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `gate`
--

CREATE TABLE `gate` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `roomno` int(11) NOT NULL,
  `contactno` int(11) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `timestamp` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gate`
--

INSERT INTO `gate` (`id`, `firstName`, `middleName`, `lastName`, `roomno`, `contactno`, `entry`, `timestamp`) VALUES
(38, 'Mrunali', 'Alaka', 'Chavan', 117, 2147483647, 'IN', '2024-02-02 20:16:20'),
(41, 'sheya', '', 'patil', 21, 2147483647, 'OUT', '2024-02-02 20:17:33'),
(1, 'Komal', 'Ganesh', 'Chavan', 22, 2147483647, 'IN', '2024-02-03 09:32:36'),
(1, 'Komal', 'Ganesh', 'Chavan', 22, 2147483647, 'OUT', '2024-02-03 09:32:41'),
(1, 'Komal', 'Ganesh', 'Chavan', 22, 2147483647, 'IN', '2024-02-03 09:32:46'),
(1, 'Komal', 'Ganesh', 'Chavan', 22, 2147483647, 'OUT', '2024-02-03 09:32:50'),
(1, 'Komal', 'Ganesh', 'Chavan', 22, 2147483647, 'IN', '2024-02-03 13:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `guard`
--

CREATE TABLE `guard` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guard`
--

INSERT INTO `guard` (`id`, `username`, `email`, `password`) VALUES
(1, 'guard', 'guard@gmail.com', 'guard@123');

-- --------------------------------------------------------

--
-- Table structure for table `rector`
--

CREATE TABLE `rector` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rector`
--

INSERT INTO `rector` (`username`, `email`, `password`, `id`) VALUES
('ram', 'ram@123', '123', 1),
('rector', 'rector@gmail.com', 'rector@123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `Fees_Paid` int(11) DEFAULT NULL,
  `feespm` int(11) NOT NULL,
  `foodstatus` int(11) NOT NULL,
  `stayfrom` date NOT NULL,
  `duration` int(11) NOT NULL,
  `course` varchar(500) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `middleName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `emailid` varchar(500) NOT NULL,
  `egycontactno` bigint(11) NOT NULL,
  `guardianName` varchar(500) NOT NULL,
  `guardianRelation` varchar(500) NOT NULL,
  `guardianContactno` bigint(11) NOT NULL,
  `corresAddress` varchar(500) NOT NULL,
  `corresCIty` varchar(500) NOT NULL,
  `corresState` varchar(500) NOT NULL,
  `corresPincode` int(11) NOT NULL,
  `pmntAddress` varchar(500) NOT NULL,
  `pmntCity` varchar(500) NOT NULL,
  `pmnatetState` varchar(500) NOT NULL,
  `pmntPincode` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) NOT NULL,
  `pending_fees` decimal(10,2) GENERATED ALWAYS AS (`duration` * `feespm` - `Fees_Paid`) STORED,
  `pending_fees1` decimal(20,2) GENERATED ALWAYS AS (`duration` * `feespm` - `Fees_Paid`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `Fees_Paid`, `feespm`, `foodstatus`, `stayfrom`, `duration`, `course`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(1, 22, 2, 100, 200, 0, '2024-02-14', 1, 'cse', 'Komal', 'Ganesh', 'Chavan', 'f', 7028146112, 'kc@gmai.com', 7028050845, 'ganesh', 'father', 100, 'palus', 'india', 'mh', 111222, 'sss', 'kkkk', 'asda', 123456, '2024-03-12 19:18:48', 'asda'),
(29, 100, 2, 10000, 8000, 0, '0000-00-00', 12, 'Bachelor  of Technology', 'shaun', 'Albert', 'Licon', 'male', 8975566181, 'omikabure3004@gmail.com', 88865675, 'vgfhjgjhgc', 'ghhd', 0, 'AAAAAAA', 'bfcbg', 'Gujarat', 416502, 'AAAAAAA', 'bfcbg', '', 416502, '2023-10-12 10:39:57', ''),
(38, 117, 1, 5000, 2000, 0, '0000-00-00', 12, 'Bachelor  of Technology', 'Mrunali', 'Alaka', 'Chavan', 'female', 8975566181, 'mrunalic99@gmail.com', 88865675, 'vgfhjgjhgc', 'ghhd', 0, 'evxcbvbv', 'bfcbg', 'Kerala', 416502, 'evxcbvbv', 'bfcbg', '', 416502, '2023-12-03 05:03:03', ''),
(41, 21, 5, 5000, 2000, 0, '0000-00-00', 6, 'Bachelor  of Technology', 'sheya', '', 'patil', 'female', 8975566181, 'mrunalic99@gmail.com', 88865675, 'vgfhjgjhgc', 'ghhd', 0, 'hjhbk', 'fdfgyf', 'Assam', 416502, 'hjhbk', 'fdfgyf', '', 416502, '2023-12-03 05:58:25', ''),
(48, 444, 5, 10000, 20000, 0, '0000-00-00', 7, 'engg', 'onkar', 'Alaka', 'Chavan', 'male', 8975566181, 'onkarkabure@gmail.com', 88865675, 'vgfhjgjhgc', 'ghhd', 4565767645, 'AP Kadgaon', 'Gadhinglaj', 'Maharashtra', 416, 'AP Kadgaon', 'Gadhinglaj', '', 416, '2023-12-08 17:27:44', ''),
(50, 21, 5, 5000, 2000, 0, '0000-00-00', 12, 'Bachelor of Ayurvedic Medicine and Surgery', 'Mrunali', 'Alaka', 'Kabure', 'female', 8975566181, 'mrunalic99@gmail.com', 88865675, 'alaka', 'daughter', 4565767645, 'AP Kadgaon', 'Gadhinglaj', 'Maharashtra', 416, 'AP Kadgaon', 'Gadhinglaj', '', 416, '2023-12-08 18:03:56', ''),
(51, 21, 5, 10000, 2000, 0, '0000-00-00', 12, 'Bachelor of Ayurvedic Medicine and Surgery', 'Onkar ', '', 'Kabure', 'male', 8975566181, 'onkarkabure@gmail.com', 9876554321, 'zxhchzc', 'hjxzh jkhx', 0, 'AP : Kadgaon Kolhapur\r\nNear new english school anna marg road kadgaon', 'Gadhinglaj 416502', 'Delhi (NCT)', 416502, 'AP : Kadgaon Kolhapur\r\nNear new english school anna marg road kadgaon', 'Gadhinglaj 416502', '', 416502, '2023-12-08 18:05:48', ''),
(54, 30, 4, 10000, 1000, 0, '0000-00-00', 12, 'engg', 'Tanmay', '', 'kumbhar', 'male', 8975566181, 'tanya@gmail.com', 88865675, 'tyuh', 'son', 4565767645, 'AP Kadgaon', 'Gadhinglaj', 'Maharashtra', 416, 'AP Kadgaon', 'Gadhinglaj', '', 416, '2023-12-08 18:46:36', ''),
(55, 30, 4, 10000, 1000, 0, '0000-00-00', 11, 'engg', 'Omkarr', '', 'Kabure', 'male', 8975566181, 'omkar@gmail.com', 88865675, 'vgfhjgjhgc', 'ghhd', 0, 'AP Kadgaon', 'Gadhinglaj', 'Maharashtra', 416, 'AP Kadgaon', 'Gadhinglaj', '', 416, '2023-12-09 04:28:50', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `fees` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `room_no`, `fees`, `posting_date`) VALUES
(9, 2, 1, 1800, '2023-10-12 14:28:26'),
(10, 3, 920, 20000, '2023-10-13 04:02:06'),
(11, 1, 117, 2000, '2023-10-16 10:21:26'),
(12, 5, 21, 2000, '2023-12-03 05:29:05'),
(13, 5, 444, 20000, '2023-12-04 18:51:55'),
(14, 4, 30, 1000, '2023-12-08 18:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Andaman and Nicobar Island (UT)'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh (UT)'),
(7, 'Chhattisgarh'),
(8, 'Dadra and Nagar Haveli (UT)'),
(9, 'Daman and Diu (UT)'),
(10, 'Delhi (NCT)'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu and Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kerala'),
(19, 'Lakshadweep (UT)'),
(20, 'Madhya Pradesh'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'Meghalaya'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Odisha'),
(27, 'Puducherry (UT)'),
(28, 'Punjab'),
(29, 'Rajastha'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telangana'),
(33, 'Tripura'),
(34, 'Uttarakhand'),
(35, 'EPE'),
(36, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userEmail`, `userIp`, `city`, `country`, `loginTime`) VALUES
(1, 10, 'test@gmail.com', '', '', '', '2016-06-22 06:16:42'),
(2, 10, 'test@gmail.com', '', '', '', '2016-06-24 11:20:28'),
(4, 10, 'test@gmail.com', 0x3a3a31, '', '', '2016-06-24 11:22:47'),
(5, 10, 'test@gmail.com', 0x3a3a31, '', '', '2016-06-26 15:37:40'),
(6, 20, 'Benjamin@gmail.com', 0x3a3a31, '', '', '2016-06-26 16:40:57'),
(7, 23, 'cust@gmail.com', 0x3a3a31, '', '', '2023-10-09 12:49:03'),
(8, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-09 12:52:55'),
(9, 25, 'kgc@gmail.com', 0x3a3a31, '', '', '2023-10-11 04:55:54'),
(10, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 06:21:45'),
(11, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 06:21:46'),
(12, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 13:17:59'),
(13, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 13:22:36'),
(14, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 14:07:36'),
(15, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 14:10:21'),
(16, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 14:12:22'),
(17, 23, 'cust@gmail.com', 0x3a3a31, '', '', '2023-10-12 17:07:19'),
(18, 21, 'mrunalic99@gmail.com', 0x3a3a31, '', '', '2023-10-12 17:26:57'),
(19, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-12 18:20:56'),
(20, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-13 02:21:19'),
(21, 30, 'omikabure3004@gmail.com', 0x3a3a31, '', '', '2023-10-13 02:51:36'),
(22, 30, 'omikabure3004@gmail.com', 0x3a3a31, '', '', '2023-10-13 03:03:25'),
(23, 30, 'omikabure3004@gmail.com', 0x3a3a31, '', '', '2023-10-13 04:10:07'),
(24, 30, 'omikabure3004@gmail.com', 0x3a3a31, '', '', '2023-10-13 04:19:13'),
(25, 30, 'omikabure3004@gmail.com', 0x3a3a31, '', '', '2023-10-13 04:22:52'),
(26, 30, 'omikabure3004@gmail.com', 0x3a3a31, '', '', '2023-10-13 04:24:53'),
(27, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-16 09:18:46'),
(28, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-16 09:32:48'),
(29, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-16 10:11:22'),
(30, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-16 10:12:26'),
(31, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-16 10:14:11'),
(32, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-18 06:15:41'),
(33, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-10-27 08:56:37'),
(34, 28, 'onkarkabure@gmail.com', 0x3a3a31, '', '', '2023-12-02 05:21:40'),
(35, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-02 06:02:26'),
(36, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 04:49:48'),
(37, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 04:50:48'),
(38, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 04:51:25'),
(39, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 05:22:20'),
(40, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 05:30:03'),
(41, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 05:34:38'),
(42, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 06:00:58'),
(43, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 06:00:59'),
(44, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 06:01:00'),
(45, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 06:01:00'),
(46, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 06:19:48'),
(47, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-03 06:29:35'),
(48, 42, '8975566181', 0x3a3a31, '', '', '2023-12-03 13:41:00'),
(49, 31, 'mrunalic99@gmail.com', 0x3a3a31, '', '', '2023-12-03 13:51:04'),
(50, 31, 'mrunalic99@gmail.com', 0x3a3a31, '', '', '2023-12-03 13:52:58'),
(51, 31, 'mrunalic99@gmail.com', 0x3a3a31, '', '', '2023-12-03 13:58:19'),
(52, 31, 'mrunalic99@gmail.com', 0x3a3a31, '', '', '2023-12-03 14:07:32'),
(53, 47, '8975566181', 0x3a3a31, '', '', '2023-12-04 13:08:03'),
(54, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-06 11:39:31'),
(55, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-07 02:50:35'),
(56, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-07 07:53:26'),
(57, 42, '8975566181', 0x3a3a31, '', '', '2023-12-07 09:03:24'),
(58, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-07 09:04:58'),
(59, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-07 09:26:22'),
(60, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-07 09:41:25'),
(61, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-08 12:42:53'),
(62, 55, '8975566181', 0x3a3a31, '', '', '2023-12-08 13:04:00'),
(63, 60, '', 0x3a3a31, '', '', '2023-12-08 14:33:10'),
(64, 64, 'tim@gmail.com', 0x3a3a31, '', '', '2023-12-08 16:54:39'),
(65, 70, 'tanya@gmail.com', 0x3a3a31, '', '', '2023-12-08 18:33:04'),
(66, 70, 'tanya@gmail.com', 0x3a3a31, '', '', '2023-12-08 18:48:11'),
(67, 10, 'test@gmail.com', 0x3a3a31, '', '', '2023-12-08 18:53:46'),
(68, 72, 'omkar@gmail.com', 0x3a3a31, '', '', '2023-12-09 04:25:04'),
(69, 72, 'omkar@gmail.com', 0x3a3a31, '', '', '2023-12-09 04:30:10'),
(70, 70, 'tanya@gmail.com', 0x3a3a31, '', '', '2023-12-09 06:34:11'),
(71, 70, 'tanya@gmail.com', 0x3a3a31, '', '', '2023-12-09 06:34:12'),
(72, 70, 'tanya@gmail.com', 0x3a3a31, '', '', '2023-12-09 06:34:13'),
(73, 70, 'tanya@gmail.com', 0x3a3a31, '', '', '2023-12-09 06:34:14'),
(74, 72, 'omkar@gmail.com', 0x3a3a31, '', '', '2023-12-09 06:54:36');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contactNo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) NOT NULL,
  `passUdateDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `firstName`, `middleName`, `lastName`, `gender`, `contactNo`, `email`, `password`, `regDate`, `updationDate`, `passUdateDate`) VALUES
(10, 'onkar', '', 'kabure', 'male', 8975566181, 'test@gmail.com', 'Onkar', '2016-06-22 04:21:33', '12-10-2023 06:51:50', '12-10-2023 06:53:14'),
(19, 'Harry', 'projects', 'Singh', 'male', 6786786786, 'Harry@gmail.com', '6786786786', '2016-06-26 16:33:36', '', ''),
(20, 'Benjamin', '', 'projects', 'male', 8596185625, 'Benjamin@gmail.com', '8596185625', '2016-06-26 16:40:07', '', ''),
(21, 'Shreya', 'Shashikant', 'Patil', 'female', 677888, 'mrunalic99@gmail.com', '0677888', '2023-10-09 11:46:15', '', ''),
(23, 'om', 'Shivaji', 'Chavan', 'male', 3232323222, 'cust@gmail.com', '1234', '2023-10-09 12:48:46', '', ''),
(24, 'komal', 'Shivaji', 'Chavan', 'female', 4444444444, 'mrunalic99@gmail.com', '4444444444', '2023-10-09 12:56:38', '', ''),
(25, 'Komal', 'Ganesh ', 'Chavan', 'female', 6578987654, 'kgc@gmail.com', '123', '2023-10-11 04:55:22', '', ''),
(26, 'dhanu', 'adcs', 'surya', 'female', 4444444444, 'dhanu@gmail.com', '123', '2023-10-11 05:13:54', '', ''),
(27, 'Mrunali', 'Shivaji', 'Chavan', 'female', 3232323222, 'ngghgh@gmail.com', '123', '2023-10-12 01:45:10', '', ''),
(28, 'onkar', '', 'kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '123', '2023-10-12 10:16:05', '', ''),
(29, 'onkar', '', 'kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-10-12 10:35:36', '', ''),
(30, 'Shaun', 'Albert', 'Licon', 'male', 8975566181, 'omikabure3004@gmail.com', '8975566181', '2023-10-12 10:39:57', '13-10-2023 08:25:02', ''),
(31, 'Mrunali', '', 'Chavan', 'female', 8975566181, 'mrunalic99@gmail.com', '8975566181', '2023-10-12 11:30:27', '', ''),
(32, 'Onkar', '', 'Kabure', 'male', 8975566181, 'omikabure3004@gmail.com', '8975566181', '2023-10-12 14:30:21', '', ''),
(33, 'Onkar', '', 'Kabure', 'male', 8975566181, 'omikabure3004@gmail.com', '8975566181', '2023-10-12 15:51:16', '', ''),
(34, 'Om', '', 'kabure', 'male', 8975566181, 'omikabure3004@gmail.com', '8975566181', '2023-10-12 17:37:46', '', ''),
(35, 'Onkar', 'Sidling', 'Kabure', 'male', 8975566181, '0', 'om', '2023-10-12 18:00:28', '', ''),
(36, 'Om', '', 'kabure', 'male', 8975566181, 'omikabure3004@gmail.com', '8975566181', '2023-10-12 18:14:43', '', ''),
(37, 'Sam', '', 'Hargrave', 'male', 344, '0', 'Sam', '2023-10-13 02:47:57', '', ''),
(38, 'Sai', '', 'devraj', 'male', 8975566181, 'sai@gmail.com', '8975566181', '2023-10-13 04:05:47', '', ''),
(39, 'Mrunali', 'Alaka', 'Chavan', 'female', 8975566181, 'mrunalic99@gmail.com', '8975566181', '2023-12-03 05:03:03', '', ''),
(40, 'Mrunali', 'Alaka', 'Chavan', 'female', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-03 05:48:39', '', ''),
(41, 'sheya', '', 'patil', 'female', 8975566181, 'mrunalic99@gmail.com', '8975566181', '2023-12-03 05:58:25', '', ''),
(42, 'Mrunali', 'Shivaji', 'Chavan', 'female', 0, '8975566181', '123', '2023-12-03 13:38:15', '', ''),
(43, 'hdnf', 'bgcn', 'vcbgn', 'male', 0, '4235', '123', '2023-12-03 13:39:57', '', ''),
(44, 'hdnf', 'bgcn', 'vcbgn', 'others', 0, '4235', '123', '2023-12-03 13:41:41', '', ''),
(45, 'Onkar Sidling Kabbure', '', 'Kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-03 14:27:10', '', ''),
(46, 'Onkar ', '', 'Kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-03 14:28:24', '', ''),
(47, 'onkarr', 'Shivaji', 'Kabbure', 'male', 8975566181, '8975566181', '12345', '2023-12-04 13:04:41', '04-12-2023 06:38:21', '04-12-2023 06:39:33'),
(48, 'Onkar ', '', 'Kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-04 13:19:12', '', ''),
(49, 'hdnf', 'bgcn', 'vcbgn', 'male', 4647833, 'ram@123', '4647833', '2023-12-04 17:17:58', '', ''),
(50, 'Omkar ', '', 'Kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-04 18:53:25', '', ''),
(51, 'onkar', '', 'kabure', 'male', 0, '8975566181', '123', '2023-12-07 09:02:55', '', ''),
(52, 'Sai', '', 'sharma', 'male', 0, '1234567890', '123', '2023-12-08 12:44:45', '', ''),
(53, 'Sai', '', 'sharma', 'male', 0, '1234567890', '123', '2023-12-08 12:46:12', '', ''),
(54, 'Devraj', '', 'Licon', 'male', 0, '1234567890', '123456', '2023-12-08 12:47:57', '', ''),
(55, 'Sandesh', '', 'varpe', 'male', 0, '8975566181', '321', '2023-12-08 13:03:04', '', ''),
(56, 'Sandesh', '', 'varpe', 'male', 0, '8975566181', '321', '2023-12-08 13:03:24', '', ''),
(57, 'rohit', '', 'sharma', 'male', 0, '8975566181', '000', '2023-12-08 13:13:17', '', ''),
(58, 'virat', '', 'kohli', 'male', 0, 'rcb@gmail.com', '987', '2023-12-08 13:18:47', '', ''),
(59, 'Ishan', '', 'Kishan', 'male', 0, '8975566181', '12', '2023-12-08 14:09:56', '', ''),
(60, 'Mrunali', '', 'kabure', 'female', 8976, '', '123', '2023-12-08 14:26:45', '', ''),
(61, 'shikar', '', 'dhavan', 'male', 123, '', '123', '2023-12-08 14:27:43', '', ''),
(62, 'shiv', '', 'shiv', 'male', 9887485553, '', '123', '2023-12-08 14:32:16', '', ''),
(63, 'shrii', 'sai', 'samarth', 'male', 9887485553, 'adcet@gmail.com', '123', '2023-12-08 16:53:00', '', ''),
(64, 'Tim', '', 'David', 'male', 656857456, 'tim@gmail.com', '1234', '2023-12-08 16:54:11', '', ''),
(65, 'Mrunali', 'onkar', 'Chavan', 'male', 8975566181, 'mrunalic99@gmail.com', '8975566181', '2023-12-08 17:07:20', '', ''),
(66, 'onkar', 'Alaka', 'Chavan', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-08 17:27:44', '', ''),
(67, 'onkar', 'Alaka', 'kabure', 'male', 1234567890, 'test@gmail.com', '1234567890', '2023-12-08 17:52:00', '', ''),
(68, 'Mrunali', 'Alaka', 'Kabure', 'female', 8975566181, 'mrunalic99@gmail.com', '8975566181', '2023-12-08 18:03:56', '', ''),
(69, 'Onkar ', '', 'Kabure', 'male', 8975566181, 'onkarkabure@gmail.com', '8975566181', '2023-12-08 18:05:48', '', ''),
(70, 'Tanmay', '', 'kumbhar', 'male', 8976236798, 'tanya@gmail.com', '123', '2023-12-08 18:32:47', '', '09-12-2023 12:03:34'),
(71, 'Tanmay', '', 'kumbhar', 'male', 8975566181, 'tanya@gmail.com', '', '2023-12-08 18:46:36', '', ''),
(72, 'Omkarr', '', 'kabure', 'male', 8976236798, 'omkar@gmail.com', '0000', '2023-12-09 04:24:56', '', ''),
(73, 'Omkarr', '', 'Kabure', 'male', 8975566181, 'omkar@gmail.com', '', '2023-12-09 04:28:50', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guard`
--
ALTER TABLE `guard`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
