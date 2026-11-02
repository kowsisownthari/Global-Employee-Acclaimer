-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 05:16 AM
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
-- Database: `emp_acclaimerj`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor_register`
--

CREATE TABLE `advisor_register` (
  `ad_id` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `advisorid` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `birth` varchar(50) NOT NULL,
  `doj` varchar(30) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(15) NOT NULL,
  `educate` varchar(16) NOT NULL,
  `pro` varchar(60) NOT NULL,
  `gen` varchar(10) NOT NULL,
  `year` varchar(20) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `proof` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advisor_register`
--

INSERT INTO `advisor_register` (`ad_id`, `name`, `advisorid`, `mail`, `contact`, `birth`, `doj`, `street`, `city`, `State`, `Country`, `educate`, `pro`, `gen`, `year`, `branch`, `uname`, `pass`, `profile`, `proof`) VALUES
(1, 'kaushalya', 'FA001', 'kaushalyaudayakumar@gmail.com', '9345411183', '1998-01-25', '2022-03-17', 'Nehru Street', 'Namakkal', 'Tamil nadu', 'India', 'Bachelors Degree', 'Tax Advisor', 'Female', '3', 'Chennai', 'kaushalyaudayakumar@gmail.com', 'Nt#Fo&8I1Y', 'images (2).jpeg', 'download (3).jpeg'),
(2, 'Gayathri', 'FA002', 'gayu234@gmail.com', '8790765489', '2000-01-25', '2024-08-05', 'Kanga nagar', 'Coimbatore', 'Tamilnadu', 'India', 'Masters Degree', 'Investment Advisor', 'Female', '3', 'Chennai', 'gayu234@gmail.com', 'DA!iI4OYp2', 'images (3).jpeg', 'download (4).jpeg'),
(4, 'Deepika', 'FA003', 'deepika34@gmail.com', '9808765489', '2000-12-24', '2024-10-16', 'Ramasamy Street', 'Salem', 'Tamilnadu', 'India', 'Bachelors Degree', 'Financial Planner', 'Female', '1', 'Mumbai', 'deepika34@gmail.com', '1G41vI4Heo', 'images (4).jpeg', 'download (4).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `employee_register`
--

CREATE TABLE `employee_register` (
  `id` int(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dpt` varchar(100) NOT NULL,
  `gen` varchar(30) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `DOB` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `Emp_id` varchar(30) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `DOJ` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_register`
--

INSERT INTO `employee_register` (`id`, `name`, `dpt`, `gen`, `branch`, `DOB`, `mail`, `Address`, `pass`, `Emp_id`, `contact`, `DOJ`, `username`, `image1`, `image2`) VALUES
(1, 'Maga', 'Software Developer', 'Female', 'Chennai', '2000-02-12', 'maga23@gmail.com', 'Vellore', '00178', 'Emp001', '9876543209', '2024-06-17', 'maga23@gmail.com', 'download.jpeg', 'download (1).jpeg'),
(2, 'Kalai', 'System Administrator', 'Male', 'Bengaluru', '1999-04-25', 'kalaiselva@gmail.com', 'Erode', '11880', 'Emp002', '9654309876', '2024-07-24', 'kalaiselva@gmail.com', 'images.jpeg', 'download (2).jpeg'),
(3, 'Varshini', 'UI/UX Designer', 'Female', 'Delhi', '2002-12-25', 'varsha34@gmail.com', 'Kallakurichi', '90023', 'Emp003', '9080065489', '2024-09-26', 'varsha34@gmail.com', 'images (1).jpeg', 'download (3).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `loan_application`
--

CREATE TABLE `loan_application` (
  `application_id` int(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `dpt` varchar(20) NOT NULL,
  `Emp_id` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `loan_type` varchar(50) NOT NULL,
  `amount` varchar(30) NOT NULL,
  `tenure` varchar(20) NOT NULL,
  `repayment_amount` varchar(20) NOT NULL,
  `requiredDate` varchar(30) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `acc_number` varchar(20) NOT NULL,
  `bank_branch` varchar(20) NOT NULL,
  `prev_loan_amount` varchar(30) NOT NULL,
  `monthly_emi` varchar(20) NOT NULL,
  `closing_date` varchar(30) NOT NULL,
  `bank_statement` varchar(50) NOT NULL,
  `aadhar_card` varchar(50) NOT NULL,
  `pan_card` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `Application_date` date NOT NULL DEFAULT current_timestamp(),
  `approved_amount` varchar(100) DEFAULT NULL,
  `sanctionDate` varchar(100) DEFAULT NULL,
  `Advisor_rejected_reason` varchar(100) DEFAULT NULL,
  `Admin_rejected_reason` varchar(100) DEFAULT NULL,
  `Forwarded_to` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_application`
--

INSERT INTO `loan_application` (`application_id`, `user_name`, `user_id`, `contact`, `dpt`, `Emp_id`, `gender`, `mail`, `loan_type`, `amount`, `tenure`, `repayment_amount`, `requiredDate`, `bank_name`, `acc_number`, `bank_branch`, `prev_loan_amount`, `monthly_emi`, `closing_date`, `bank_statement`, `aadhar_card`, `pan_card`, `status`, `Application_date`, `approved_amount`, `sanctionDate`, `Advisor_rejected_reason`, `Admin_rejected_reason`, `Forwarded_to`) VALUES
(1, 'Kalai', '2', '9654309876', 'System Administrator', 'Emp002', 'Male', 'kalaiselva@gmail.com', 'Family Purpose Loan', '200000', '15 Months', '3,000', '2025-04-05', 'State Bank', '9876543908', 'Vadavalli', '100000', '2000', '2025-04-24', 'download (3).png', 'download (4).jpeg', 'download (4).jpeg', 'Approved_by_advisor', '2025-03-17', '100000', '2025-03-21', '', '', 'kaushalya'),
(2, 'Kalai', '2', '9654309876', 'System Administrator', 'Emp002', 'Male', 'kalaiselva@gmail.com', 'Marriage Loan', '70000', '15 Months', '2,000', '2025-05-23', 'HDFC Bank', '2875367803', 'Saibaba Colony', '90000', '2500', '2025-05-22', 'download (7).jpeg', 'download (4).jpeg', 'download (4).jpeg', 'Pending', '2025-03-17', NULL, NULL, NULL, NULL, NULL),
(3, 'Kalai', '2', '9654309876', 'System Administrator', 'Emp002', 'Male', 'kalaiselva@gmail.com', 'Vehicle Loan', '60000', '16 Months', '5,000', '2025-03-13', 'Canara Bank', '2345678901', 'Gandhipuarn', '40000', '1000', '2025-05-16', 'download (4).png', 'download (4).jpeg', 'download (4).jpeg', 'Pending', '2025-03-17', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor_register`
--
ALTER TABLE `advisor_register`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `employee_register`
--
ALTER TABLE `employee_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_application`
--
ALTER TABLE `loan_application`
  ADD PRIMARY KEY (`application_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advisor_register`
--
ALTER TABLE `advisor_register`
  MODIFY `ad_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_register`
--
ALTER TABLE `employee_register`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_application`
--
ALTER TABLE `loan_application`
  MODIFY `application_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
