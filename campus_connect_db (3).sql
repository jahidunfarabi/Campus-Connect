-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2026 at 05:26 AM
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
-- Database: `campus_connect_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `action_details` text DEFAULT NULL,
  `affected_table` varchar(50) DEFAULT NULL,
  `affected_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `type` enum('club','conference','research') NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `faculty_name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `type`, `title`, `description`, `faculty_name`, `department`, `date`, `deadline`, `location`, `contact_email`, `image_url`, `posted_by`, `created_at`, `updated_at`, `status`) VALUES
(1, 'club', 'Robotics Club Recruitment 2026', 'Join our robotics team! We are looking for passionate students interested in robotics, AI, and automation. No prior experience required.', NULL, 'Engineering', '2026-02-15', '2026-02-10', 'Room 301, Engineering Building', 'robotics@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(2, 'conference', 'International AI Conference 2026', 'Annual conference on Artificial Intelligence and Machine Learning. Submit your research papers by January 30th.', NULL, 'Computer Science', '2026-03-20', '2026-01-30', 'Main Auditorium', 'aiconf@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(3, 'research', 'Machine Learning Research Lab', 'Dr. Sarah Johnson is recruiting students for ML research on computer vision and natural language processing.', 'Dr. Sarah Johnson', 'Computer Science', NULL, '2026-02-28', 'CS Lab 205', 'sjohnson@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(4, 'club', 'Photography Club Open House', 'Explore your creative side! Photography club welcomes all students. Free camera workshops included.', NULL, 'Arts', '2026-02-05', '2026-02-03', 'Student Center', 'photo@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(5, 'research', 'Blockchain & Cybersecurity Research', 'Prof. Ahmed Khan is looking for research assistants in blockchain technology and network security.', 'Prof. Ahmed Khan', 'Computer Science', NULL, '2026-03-15', 'IT Building 4th Floor', 'akhan@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(6, 'club', 'Debate Society Recruitment', 'Sharpen your public speaking skills! Join the campus debate team. We compete nationally.', NULL, 'Liberal Arts', '2026-02-20', '2026-02-18', 'Room 102, Arts Building', 'debate@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(7, 'conference', 'Blockchain Technology Summit 2026', 'International summit on blockchain, cryptocurrency, and decentralized systems. Keynote speakers from industry leaders.', NULL, 'Information Technology', '2026-04-15', '2026-02-28', 'Convention Center', 'blockchain@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(8, 'research', 'Data Science & Analytics Lab', 'Dr. Maria Chen is seeking undergraduate researchers for big data analytics and visualization projects.', 'Dr. Maria Chen', 'Data Science', NULL, '2026-03-10', 'Data Lab, 3rd Floor', 'mchen@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(9, 'club', 'Gaming & Esports Club', 'Calling all gamers! Competitive gaming team with tournaments and LAN parties. All skill levels welcome.', NULL, 'Student Activities', '2026-02-12', '2026-02-10', 'Gaming Lounge, Student Center', 'esports@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active'),
(10, 'conference', 'Women in Tech Conference 2026', 'Empowering women in technology, science, and engineering. Networking, workshops, and career opportunities.', NULL, 'Women in STEM', '2026-03-08', '2026-02-15', 'Grand Hall', 'womenintech@university.edu', NULL, 1, '2026-01-19 20:30:43', '2026-01-19 20:30:43', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` enum('Present','Absent','Late') DEFAULT 'Absent',
  `check_in_time` timestamp NULL DEFAULT NULL,
  `marked_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `purpose` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected','Cancelled','Completed') DEFAULT 'Pending',
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `approval_notes` text DEFAULT NULL,
  `check_in_time` timestamp NULL DEFAULT NULL,
  `check_out_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `resource_id`, `booking_date`, `start_time`, `end_time`, `purpose`, `status`, `approved_by`, `approval_notes`, `check_in_time`, `check_out_time`, `created_at`, `updated_at`) VALUES
(34, 21, 9, '2026-01-14', '16:30:00', '20:00:00', 'Bulk Class', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 18:26:33', '2026-01-19 20:56:41'),
(35, 21, 11, '2026-01-14', '16:30:00', '20:00:00', 'Bulk Class', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 18:26:33', NULL),
(36, 21, 12, '2026-01-14', '16:30:00', '20:00:00', 'Bulk Class', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 18:26:33', NULL),
(37, 21, 13, '2026-01-14', '16:30:00', '20:00:00', 'Bulk Class', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 18:26:33', NULL),
(38, 21, 1, '2026-01-14', '16:30:00', '20:00:00', 'Bulk Class', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 18:26:33', NULL),
(39, 16, 15, '2026-01-21', '18:43:00', '08:14:00', 'Study', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 20:07:18', '2026-01-19 20:56:43'),
(40, 16, 7, '2026-01-11', '05:33:00', '07:36:00', 'Game', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:15', '2026-01-19 21:37:52'),
(41, 21, 11, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', '2026-01-20 04:25:50'),
(42, 21, 5, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Rejected', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', '2026-01-19 21:38:00'),
(43, 21, 6, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Rejected', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', '2026-01-19 21:33:19'),
(44, 21, 12, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', NULL),
(45, 21, 13, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', NULL),
(46, 21, 1, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', NULL),
(47, 21, 2, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', NULL),
(48, 21, 8, '2026-01-23', '18:34:00', '17:34:00', 'Gaming event', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 21:32:46', NULL),
(49, 16, 15, '2026-01-24', '04:10:00', '08:07:00', 'sad', 'Approved', NULL, NULL, NULL, NULL, '2026-01-19 22:07:14', '2026-01-20 04:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_requests`
--

CREATE TABLE `bulk_requests` (
  `request_id` int(10) UNSIGNED NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `purpose` text DEFAULT NULL,
  `expected_attendees` int(11) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `type` enum('Booking','Approval','System','Reminder','Alert') NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `related_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resource_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('Study Room','Lab','Projector','Sports Facility','Auditorium','Conference Room') NOT NULL,
  `location` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `available_capacity` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('Available','Booked','Maintenance','Unavailable') DEFAULT 'Available',
  `requires_approval` tinyint(1) DEFAULT 0,
  `max_booking_hours` int(11) DEFAULT 4,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resource_id`, `name`, `type`, `location`, `capacity`, `available_capacity`, `description`, `image_url`, `status`, `requires_approval`, `max_booking_hours`, `created_at`, `updated_at`) VALUES
(1, 'Study Room A', 'Study Room', 'Library Building, 2nd Floor', 10, 10, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(2, 'Study Room B', 'Study Room', 'Library Building, 3rd Floor', 8, 8, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(3, 'Computer Lab 1', 'Lab', 'CSE Building, Room 101', 25, 25, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(4, 'Multimedia Lab', 'Lab', 'CSE Building, Room 201', 20, 20, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(5, 'Projector 1', 'Projector', 'Main Auditorium', 1, 1, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(6, 'Projector 2', 'Projector', 'Conference Hall', 1, 1, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(7, 'Basketball Court', 'Sports Facility', 'Sports Complex', 40, 40, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(8, 'Tennis Court', 'Sports Facility', 'Sports Complex', 4, 4, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(9, 'Main Auditorium', 'Auditorium', 'Admin Building', 200, 200, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(10, 'Conference Room', 'Conference Room', 'Admin Building', 20, 20, NULL, NULL, 'Available', 0, 4, '2026-01-15 20:41:03', '2026-01-19 15:36:14'),
(11, 'Programming Lab 1', 'Lab', 'CSE Building, Level 4', 40, 40, NULL, NULL, 'Available', 0, 4, '2026-01-16 18:08:25', '2026-01-19 15:36:14'),
(12, 'Projector Room 102', 'Projector', 'Main Building, Level 1', 1, 1, NULL, NULL, 'Available', 0, 4, '2026-01-16 18:08:25', '2026-01-19 15:36:14'),
(13, 'Quiet Study Zone', 'Study Room', 'Library, Level 2', 15, 15, NULL, NULL, 'Available', 0, 4, '2026-01-16 18:08:25', '2026-01-19 15:36:14'),
(14, 'Conference Hall', 'Conference Room', 'Admin Building, Level 3', 20, 20, NULL, NULL, 'Available', 0, 4, '2026-01-16 18:08:25', '2026-01-19 15:36:14'),
(15, 'Basketball Court', 'Sports Facility', 'Sports Complex', 50, 50, NULL, NULL, 'Available', 0, 4, '2026-01-16 18:08:25', '2026-01-19 15:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `issue_type` enum('Equipment Broken','Cleanliness','Safety Concern','Other') NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `status` enum('Open','In Progress','Resolved','Closed') DEFAULT 'Open',
  `assigned_to` int(10) UNSIGNED DEFAULT NULL,
  `resolution_notes` text DEFAULT NULL,
  `priority` enum('Low','Medium','High') DEFAULT 'Medium',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `resolved_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Student','Faculty','Admin') NOT NULL DEFAULT 'Student',
  `student_id` varchar(20) DEFAULT NULL,
  `faculty_dept` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` enum('Active','Suspended') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role`, `student_id`, `faculty_dept`, `phone`, `status`, `created_at`, `last_login`, `updated_at`) VALUES
(6, 'Mirza Asif', 'MA@gmail.com', '$2y$10$2xs2X5DSd18ok1HfIEqlW.UB8mhT9wMp0xc2SoGtn1L1QMCfq340K', 'Faculty', '', NULL, NULL, 'Active', '2026-01-16 20:23:03', NULL, NULL),
(9, 'ADMIN1', 'admin1@gmail.com', '$2y$10$BxhhGA4hNIderpNKLOGT2exVFcA/OkeUxHBvnkZF4M6kQhWoMhN3m', 'Admin', '', NULL, NULL, 'Active', '2026-01-16 20:57:34', NULL, NULL),
(11, 'Jamilatun Moshfirat', '22-49177-3@student.aiub.edu', '$2y$10$SpUt1CWlpuclo6FBK1yycOu3zvbxaoQKoG9hNfxuvtwTY7K6LZA.q', 'Student', '22-49177-3', NULL, NULL, 'Active', '2026-01-16 21:16:23', NULL, NULL),
(12, 'AXBY', 'A@gmail.com', '$2y$10$OloZhhVf9eWlykU9Nw.S9O8ZO9QLULtL68zlHNR54bLoqvhknM8uO', 'Student', '22-48063-1', NULL, NULL, 'Active', '2026-01-16 21:25:32', NULL, NULL),
(13, 'Tachvir Uddin', '22-49986-3@student.aiub.edu', '$2y$10$olcn8tlkNpjqifJxwpJVr.Fb9kCfizVVx6NPWK/P9lGm1nij5soPW', 'Student', '22-49986-3', NULL, NULL, 'Active', '2026-01-17 09:58:27', NULL, NULL),
(14, 'Rongon Tahmid', '22-49562-3@student.aiub.edu', '$2y$10$/LHse0Jz5o/8BEQ27hS1K.ijcwKUIQ5kc6TfGjx1HH91A9kC6UwwC', 'Student', '22-49562-3', NULL, NULL, 'Active', '2026-01-17 10:20:29', NULL, NULL),
(15, 'Fardin Khan', 'sarahchisty2@gmail.com', '$2y$10$IDHRDx03vr22OuTA/l6ZuOqd5BeEuLPgAa5AteVGZUQ5ISDqh7eI6', 'Student', '2015FB05588', NULL, NULL, 'Active', '2026-01-18 08:03:36', NULL, NULL),
(16, 'Abdul', 'fardindm69@gmail.com', '$2y$10$c1Tkg0rQb4/fwjZNHm5JWuAYFE.5VGFdTi8DN.uqN7f75XxzFoUOy', 'Student', '22-49114-3', NULL, NULL, 'Active', '2026-01-18 08:05:03', NULL, NULL),
(17, 'Abrar', 'fardindm70@gmail.com', '$2y$10$DtACr72Q9vdiKurYuuQ.muiMY0MzP8b3iqT6rB6aDx3UW16Qt..Ne', 'Faculty', '22-49114-3', NULL, NULL, 'Active', '2026-01-18 08:08:17', NULL, NULL),
(18, 'Admin ', 'admin@campus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', NULL, NULL, NULL, 'Active', '2026-01-18 10:04:52', NULL, NULL),
(19, 'Admin User', 'admin@campus.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', NULL, NULL, NULL, 'Active', '2026-01-18 10:15:39', NULL, NULL),
(20, 'Fahim Abrar', 'fardindm60@gmail.com', '$2y$10$hzbW462/JwXxZrQhIum3gONnu8JEATmd9lwpuAa7a64iopcZks0Ua', 'Student', '2015FB05588', NULL, NULL, 'Active', '2026-01-19 14:17:53', NULL, NULL),
(21, 'Tasmia Farah', 'ab@gmail.com', '$2y$10$zF20CTmb/vbUt5Tuwz/39.ODiVoceuDZ8yGfXbGXrYZ5txNR2R6Ia', 'Faculty', '2025', NULL, NULL, 'Active', '2026-01-19 15:08:39', NULL, NULL),
(22, 'Fahim  Abrar', 'abrar@gmail.com', '$2y$10$zPQra0fzzXu5UbQw2arY0Oh35bMQPnGWyzbnqvBwEb//pl9TAGci2', 'Faculty', '2025', NULL, NULL, 'Active', '2026-01-19 15:31:38', NULL, NULL),
(23, 'Understanding Artificial Intelligence', 'faculty@gmail.com', '$2y$10$FnmMY6rey1NtlJYQzyaCt.hYLrOyaTtZnMlZjY9LMIHUfNmcAWUNK', 'Faculty', '2015FB05588', NULL, NULL, 'Active', '2026-01-19 22:33:58', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_admin_date` (`admin_id`,`created_at`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD UNIQUE KEY `unique_booking` (`resource_id`,`booking_date`,`start_time`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_resource_id` (`resource_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_booking_date` (`booking_date`);

--
-- Indexes for table `bulk_requests`
--
ALTER TABLE `bulk_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_user_read` (`user_id`,`is_read`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resource_id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_location` (`location`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `unique_booking_review` (`booking_id`),
  ADD KEY `idx_resource_id` (`resource_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_rating` (`rating`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_priority` (`priority`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `bulk_requests`
--
ALTER TABLE `bulk_requests`
  MODIFY `request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `bulk_requests`
--
ALTER TABLE `bulk_requests`
  ADD CONSTRAINT `bulk_requests_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bulk_requests_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
