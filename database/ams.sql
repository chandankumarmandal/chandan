-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2019 at 03:21 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ams`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE IF NOT EXISTS `adminlogin` (
  `name` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `course_id` int(11) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `adminlogin_ibfk_1` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`name`, `username`, `password`, `course_id`, `email_id`) VALUES
('chandan', 'chandan', 'admin', 201, 'chandan@gmail.com'),
('divyanshu', 'MCA', 'mca', 101, 'mca@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `attd_date` varchar(30) NOT NULL,
  `Last_Date` varchar(30) NOT NULL,
  `stud_id` varchar(50) NOT NULL,
  `Absent_Count` float NOT NULL,
  `Present_Count` float DEFAULT '0',
  `Total_Classes` float DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `sub_id` int(11) NOT NULL,
  `fact_id` int(11) DEFAULT '0',
  PRIMARY KEY (`stud_id`,`sub_id`) USING BTREE,
  KEY `stud_id` (`stud_id`),
  KEY `course_id` (`course_id`),
  KEY `sub_id` (`sub_id`),
  KEY `fact_id` (`fact_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attd_date`, `Last_Date`, `stud_id`, `Absent_Count`, `Present_Count`, `Total_Classes`, `dept_name`, `course_id`, `sub_id`, `fact_id`) VALUES
('2019-11-07', '2019-11-12', '180001', 0, 5, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-10', '2019-11-09', '180001', 0, 1, 2, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180002', 0, 4, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-10', '2019-11-09', '180002', 0, 1, 2, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180003', 0, 4, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180003', 0, 1, 1, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180004', 0, 6, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180004', 0, 1, 1, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180005', 0, 5, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180005', 0, 1, 1, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180006', 0, 5, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180006', 0, 1, 1, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180007', 0, 6, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-07', '2019-11-12', '180008', 0, 5, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180008', 0, 1, 1, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180009', 0, 6, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180009', 0, 1, 1, 'SCIENCE', 201, 302, 2010),
('2019-11-07', '2019-11-12', '180010', 0, 6, 6, 'SCIENCE', 201, 301, 2010),
('2019-11-09', '2019-11-09', '180010', 0, 1, 1, 'SCIENCE', 201, 302, 2010);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`,`course_name`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `dept_name`) VALUES
(101, 'MCA', 'computer science'),
(202, 'BCA', 'computer science'),
(201, 'MSC', 'science');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `dept_name` varchar(30) NOT NULL,
  `locations` varchar(30) NOT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`, `locations`) VALUES
('computer science', 'science block'),
('science', '1st floor');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE IF NOT EXISTS `enroll` (
  `stud_id` varchar(50) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `sub_id` int(11) NOT NULL,
  PRIMARY KEY (`stud_id`,`sub_id`),
  KEY `enroll_ibfk_2` (`course_id`),
  KEY `enroll_ibfk_4` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`stud_id`, `course_id`, `sub_id`) VALUES
('180001', 201, 301),
('180001', 201, 302),
('180002', 201, 301),
('180002', 201, 302),
('180003', 201, 301),
('180003', 201, 302),
('180004', 201, 301),
('180004', 201, 302),
('180005', 201, 301),
('180005', 201, 302),
('180006', 201, 301),
('180006', 201, 302),
('180007', 201, 301),
('180008', 201, 301),
('180008', 201, 302),
('180009', 201, 301),
('180009', 201, 302),
('180010', 201, 301),
('180010', 201, 302);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `fact_id` int(11) NOT NULL,
  `faculty_name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  PRIMARY KEY (`fact_id`,`dept_name`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fact_id`, `faculty_name`, `Last_Name`, `dept_name`, `email_id`) VALUES
(2001, 'chandan', 'kumar', 'Computer science', 'chandan@gmail.com'),
(2005, 'divyan', 'shu', 'science', 'divya@gmail.com'),
(2010, 'KALAI', 'SELVI', 'SCIENCE', 'KALAISELVI@GMAIL.COM');

-- --------------------------------------------------------

--
-- Table structure for table `facultylogin`
--

CREATE TABLE IF NOT EXISTS `facultylogin` (
  `fact_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  PRIMARY KEY (`fact_id`,`username`),
  KEY `facultylogin_ibfk_2` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facultylogin`
--

INSERT INTO `facultylogin` (`fact_id`, `username`, `password`, `dept_name`) VALUES
(2001, '2001chandan', 'chandan', 'Computer science'),
(2005, '2005divyan', 'divyan', 'science'),
(2010, 'teacher', 'teacher123', 'SCIENCE');

-- --------------------------------------------------------

--
-- Table structure for table `logindetails`
--

CREATE TABLE IF NOT EXISTS `logindetails` (
  `stud_id` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`stud_id`,`username`),
  KEY `stud_id` (`stud_id`),
  KEY `logindetails_ibfk_2` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logindetails`
--

INSERT INTO `logindetails` (`stud_id`, `course_id`, `username`, `password`) VALUES
('180001', 201, '180001', '180001'),
('180002', 201, '180002', '180002'),
('180003', 201, '180003', '180003'),
('180004', 201, '180004', '180004'),
('180005', 201, '180005', '180005'),
('180006', 201, '180006', '180006'),
('180007', 201, '180007', '180007'),
('180008', 201, '180008', '180008'),
('180009', 201, '180009', '180009'),
('180010', 201, '180010', '180010');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` varchar(50) NOT NULL,
  `Topic` varchar(50) NOT NULL,
  `Target` varchar(30) NOT NULL,
  `Message` varchar(100) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Time` varchar(30) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`SrNo`, `Sender`, `Topic`, `Target`, `Message`, `Date`, `Time`) VALUES
(2, 'chandan', 'hello', '201', 'welcome to attendance management system', '10-11-2019', '2:45 AM'),
(3, 'chandan', 'java lab', '3', 'the java lab exam is to be conducted tomorrow', '11-11-2019', '5:12 PM'),
(4, 'KALAI SELVI', 'mp', '201', 'mp exxam is on 14th of this month', '11-11-2019', '5:13 PM');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `stud_id` varchar(50) NOT NULL,
  `stud_name` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  `sem_no` int(11) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email_id` varchar(50) NOT NULL,
  `Phone_no` bigint(30) NOT NULL,
  PRIMARY KEY (`stud_id`,`course_id`) USING BTREE,
  KEY `stud_id` (`stud_id`) USING BTREE,
  KEY `student_ibfk_1` (`course_id`),
  KEY `stud_id_2` (`stud_id`,`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `stud_name`, `course_id`, `sem_no`, `dob`, `address`, `email_id`, `Phone_no`) VALUES
('180001', 'AKASH B E', 201, 3, '', 'HSR LAYOUT', 'AKASHBE30@GMAIL.COM', 7975243571),
('180002', 'AMEE LEPCHA', 201, 3, '', 'HSR LAYOUT', 'AMEELEPCHA@GMAIL.COM', 9547118311),
('180003', 'ANUSHA PURUSHOTHAM', 201, 3, '', 'HSR LAYOUT', 'ANUPATTER3@GMAIL.COM', 9986966309),
('180004', 'ATHULURU MANISHA', 201, 3, '', 'HSR LAYOUT', 'MANISHATHULURU001@GMAIL.COM', 986151060),
('180005', 'BABU B', 201, 3, '', 'HSR LAYOUT', 'AMMU33374@GMAIL.COM', 9035051155),
('180006', 'BINDUSHREE M', 201, 3, '', 'HSR LAYOUT', 'VENKIBABU137@GMAIL.COM', 8892842254),
('180007', 'KONDAPANENI SIVA KRISHNA', 201, 3, '', 'HSR LAYOUT', 'SIVAKRISHNA431997@GMAIL.COM', 9019929578),
('180008', 'MANI GANDAN D', 201, 3, '', 'HSR LAYOUT', 'MANIGANDAN9845@GMAIL.COM', 9538662208),
('180009', 'NAGAVENI N', 201, 3, '', 'HSR LAYOUT', 'NAGAVENIN123456@GMAIL.COM', 9901739147),
('180010', 'NARASIMHA MURTHY R', 201, 3, '', 'HSR LAYOUT', 'MURTHYKUMAR085@GMAIL.COM', 9611863049);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `course_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `sub_name` varchar(50) NOT NULL,
  `fact_id` int(11) DEFAULT '0',
  `Enroll_Key` int(11) DEFAULT '0',
  PRIMARY KEY (`sub_id`,`course_id`),
  KEY `course_id` (`course_id`) USING BTREE,
  KEY `sub_id` (`sub_id`) USING BTREE,
  KEY `subjects_ibfk_2` (`fact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`course_id`, `sub_id`, `sub_name`, `fact_id`, `Enroll_Key`) VALUES
(201, 301, 'ADVANCED WEB PROGRAMMING', 2010, 301),
(201, 302, 'ADVANCED ALGORITHM', 2010, 302),
(201, 303, 'OPEN ELECTIVE', 2010, 303);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE IF NOT EXISTS `timetable` (
  `course_id` int(11) NOT NULL,
  `sem_no` int(11) NOT NULL,
  `lect_slot` int(11) NOT NULL,
  `StartTime` varchar(50) NOT NULL,
  `EndTime` varchar(50) NOT NULL,
  `Time` varchar(50) NOT NULL,
  `mon` varchar(30) NOT NULL,
  `tues` varchar(30) NOT NULL,
  `wed` varchar(30) NOT NULL,
  `thurs` varchar(30) NOT NULL,
  `fri` varchar(30) NOT NULL,
  `sat` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`,`sem_no`,`lect_slot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`course_id`, `sem_no`, `lect_slot`, `StartTime`, `EndTime`, `Time`, `mon`, `tues`, `wed`, `thurs`, `fri`, `sat`) VALUES
(101, 2, 1, '10:00', '11:30', '', '202', '203', '204', '203', '202', ''),
(101, 2, 2, '11:30', '13:00', '', '204', '201', '202', '201', '204', ''),
(101, 2, 3, '13:00', '14:00', '', '---', 'Break', '---', 'Time', '---', ''),
(101, 2, 4, '14:00', '15:00', '', '205/206', '205/206', '205/206', '205/206', '201', ''),
(101, 2, 5, '15:00', '16:00', '', '205/206', '205/206', '205/206', '205/206', '203', ''),
(101, 2, 6, '16:00', '17:00', '', '205/206', '205/206', '205/206', '205/206', '', ''),
(201, 3, 1, '12:00', '02:05', '', 'A', 'D', 'D', 'D', 'D', ''),
(201, 3, 2, '22:00', '07:59', '', 'O', 'W', 'C', 'H', 'U', ''),
(201, 3, 3, '05:58', '06:55', '', 'V', 'B', 'N', 'J', 'D', ''),
(201, 3, 4, '05:06', '05:05', '', 'AS', 'STYu', 'U', 'G', 'H', ''),
(201, 3, 5, '06:06', '06:59', '', '---', 'Break', '---', 'Time', '---', ''),
(201, 3, 6, '05:05', '05:05', '', 'AS', 'H', 'UH', 'H', 'C', ''),
(201, 3, 7, '', '', '', 'AAS', 'T', 'U', 'C', 'UJ', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_5` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_6` FOREIGN KEY (`fact_id`) REFERENCES `faculty` (`fact_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_8` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_9` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`);

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `adminlogin` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enroll_ibfk_4` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enroll_ibfk_5` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facultylogin`
--
ALTER TABLE `facultylogin`
  ADD CONSTRAINT `facultylogin_ibfk_1` FOREIGN KEY (`fact_id`) REFERENCES `faculty` (`fact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facultylogin_ibfk_2` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logindetails`
--
ALTER TABLE `logindetails`
  ADD CONSTRAINT `logindetails_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `logindetails_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `adminlogin` (`course_id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`fact_id`) REFERENCES `faculty` (`fact_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `subjects_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `adminlogin` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
