-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2026 at 06:40 AM
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
-- Database: `internmatrix`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_details`
--

CREATE TABLE `academic_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `college_name` varchar(255) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `year` varchar(50) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `cgpa` varchar(10) DEFAULT NULL,
  `preferred_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_details`
--

INSERT INTO `academic_details` (`id`, `user_id`, `college_name`, `degree`, `year`, `branch`, `cgpa`, `preferred_location`) VALUES
(1, 1, 'saveetha school of engineering', 'B.E', '4', 'computer science', '8.7', 'Chennai'),
(2, 3, 'Saveetha school of engineering', 'B.Tech', '4th year', 'Computer science', '8.6', 'Chennai');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`) VALUES
(239, 'internmatrixx@gmail.com', 'scrypt:32768:8:1$hBmiGxjyDy2C2j0V$a305cbf769a2215a0432fbe40028bd52b8f794d9d96b3aaa912821f4508508da02b13142e599ba1dbbb7ee8769601305404f3a4bc25fefdb2cd2655fb9c9ad9c', '2026-03-15 16:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `internship_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `cgpa` varchar(50) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `resume_file` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `match_score` int(11) DEFAULT 0,
  `cover_letter` text DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `user_id`, `internship_id`, `full_name`, `email`, `phone`, `college`, `degree`, `year`, `cgpa`, `skills`, `resume_file`, `status`, `match_score`, `cover_letter`, `applied_at`) VALUES
(1, 1, 5, 'Thomas ', 'thomas@gmail.com', '9876543210', 'iit', 'b.e', '4', '8.7', 'react,java,python', NULL, 'Rejected', 0, 'cover letter ', '2026-03-12 06:45:17'),
(2, 1, 11, 'James Cameron ', 'james@gmail.com', '9988776655', 'IIT ', 'B.Tech', '4th year', '8.5', 'Dot net framework, Html,Css,Js,', 'app_1_11_konda_reddy_score_card.pdf', 'Accepted', 0, 'I have great skill in the dotnet framework and also throw with the concepts of frontend and backend ', '2026-03-15 16:06:41'),
(3, 3, 11, 'Yaswitha Paruchuri', 'paruchuriyaswitha13@gmail.com', '9191919191', 'NIT ', 'B.Tech in CSE', '4th year ', '8.9', 'React,Java,Python,Frontend,Backend', 'app_3_11_paruchuri_yaswitha_resume.pdf', 'Accepted', 0, 'I have good skill in the dotnet framework and It\'s APIs ', '2026-03-16 05:06:40'),
(4, 1, 4, 'Konda reddy Lekkala', 'kondareddyl0009.sse@saveetha.com', '123456789', 'iit', 'b.e', '4', '8.9', 'java', 'app_1_4_kondareddy_resume.pdf', 'Accepted', 0, 'hhj', '2026-03-16 10:38:00'),
(5, 1, 12, 'Narendra ', 'narendra@gmail.com', '987654321', 'IIT', 'B.E', '4th', '8.6', 'java,python,kotlin', 'app_1_12_kondareddy_resume.pdf', 'Accepted', 100, 'resume ', '2026-03-22 04:40:12'),
(7, 1, 15, 'Konda reddy Lekkala', 'lekkalakondareddy2004@gmail.com', '7601088447', 'saveetha school of engineering', 'B.E', '4', '8.7', 'JavaScript,TypeScript,Node.js,MongoDB,Machine Learning', 'app_1_15_paruchuri_yaswitha_resume.pdf', 'Pending', 0, 'm', '2026-04-01 05:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `internships`
--

CREATE TABLE `internships` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `work_type` varchar(100) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `stipend` varchar(100) NOT NULL,
  `deadline` varchar(100) NOT NULL,
  `skills` text NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `internships`
--

INSERT INTO `internships` (`id`, `title`, `company`, `location`, `work_type`, `duration`, `stipend`, `deadline`, `skills`, `description`, `status`, `created_at`) VALUES
(1, 'Machine learning intern', 'Deloitte ', 'Chennai ', 'Remote', '4 months ', '15000', '12/04/2026', 'Python ,oops,machine learning ', 'An Artificial Intelligence (AI) Intern is an entry-level professional—typically a student or recent graduate—who supports engineering or data science teams in designing, building, and testing AI models, systems, or applications. This role serves as a bridge between academic study and professional AI', 'Active', '2026-03-12 04:45:31'),
(2, 'Dot net full stack developer ', 'Tcs', 'Hyderabad ', 'In office ', '6 months ', '12000', '15/05/2026', 'angular ,dot net framework ,sql,c#,HTML and CSS ,oops', 'NET Developers design, build, and maintain software applications using the Microsoft .NET framework, primarily coding in C# or VB.NET. Responsibilities include developing backend services, creating front-end interfaces, testing, debugging, and integrating databases like SQL Server. They often work with APIs and collaborate with cross-functional teams', 'Active', '2026-03-12 04:54:56'),
(3, 'Backed developer ', 'HCL', 'Bangalore ', 'Hybrid ', '2 months ', '12000', '16/06/2026', 'sql,mongodb,api', 'Backend Developers are the architects of the \"server-side,\" building the hidden infrastructure that powers websites and applications. While frontend developers handle what users see, backend developers manage the logic, database interactions, and server configurations that make a site functional. ', 'Active', '2026-03-12 05:01:50'),
(4, 'Network engineering intern ', 'Wipro ', 'pune', 'Hybrid ', '4 months ', '14000', '24/06/2026', 'Topology ,networking ,VPN,Python ', 'A network engineering intern primarily supports the IT team in maintaining, troubleshooting, and configuring an organization\'s network infrastructure. This role serves as a practical learning environment where interns bridge academic theory with real-world enterprise networkin', 'Active', '2026-03-12 05:04:46'),
(5, 'Backend Developer Intern', 'TechCorp', 'Remote', 'Remote', '4 months', '15,000', '2026-05-01', 'Python,Flask,MySQL', 'Exiciting role for a backend developer to work on scalable APIs.', 'Active', '2026-03-12 05:11:31'),
(6, 'artificially intelligence intern', 'tcs', 'Chennai ', 'remote', '3 months', '12k', '12/06/2026', 'react ,java,html', 'react , java , html', 'Active', '2026-03-13 07:53:19'),
(7, 'Senior Android Developer', 'Google', 'Remote', 'Remote', '6 Months', '₹45,000', '2024-12-31', 'Kotlin, Jetpack Compose', 'Build premium Android applications.', 'Active', '2026-03-13 08:13:07'),
(8, 'Frontend Architect', 'Microsoft', 'Bangalore', 'Hybrid', '3 Months', '₹35,000', '2024-11-15', 'React, TypeScript', 'Design scalable frontend architectures.', 'Active', '2026-03-13 08:13:07'),
(9, 'Data Scientist', 'Amazon', 'Hyderabad', 'In-office', '6 Months', '₹40,000', '2024-12-01', 'Python, ML, SQL', 'Extract insights from large datasets.', 'Active', '2026-03-13 08:13:07'),
(10, 'UI/UX Designer', 'Adobe', 'Remote', 'Remote', '4 Months', '₹30,000', '2024-11-20', 'Figma, Adobe XD', 'Create stunning user experiences.', 'Active', '2026-03-13 08:13:07'),
(11, 'Dotnet framework intern', 'Wipro', 'kolkata ', 'Remote ', '6 months ', '16k', '6/09/2026', 'dotnet framework ,frontend ,api', 'Dotnet framework is developed by Microsoft and is used to handle the website and applications easily ', 'Active', '2026-03-15 15:52:11'),
(12, 'Business Development Role ', 'Rinex', 'Chennai', 'Hybrid', '4 months', '23K', '2026-03-06', 'Java', 'BDE role is very important to enhance their business', 'Active', '2026-03-17 08:35:04'),
(13, 'Software Trainee ', 'JSW', 'Pune', 'Remote ', '4', '12k', '12/06/2026', 'Java ,python ', 'hi', 'Active', '2026-03-20 08:10:52'),
(15, 'AI Research Intern', 'DeepMind', 'Remote / London', 'Full-time', '6', '45000', '2026-06-30', 'Python, PyTorch, Reinforcement Learning, Linear Algebra', 'Join our world-class research team to push the boundaries of Artificial Intelligence. You will work on cutting-edge reinforcement learning models and contribute to peer-reviewed publications. Ideal candidates have strong mathematical foundations and proficiency in deep learning frameworks.', 'Active', '2026-03-31 19:08:55'),
(16, 'Full Stack Developer Intern', 'Stripe', 'San Francisco / Remote', 'On-site', '3', '35000', '2026-05-15', 'React, TypeScript, Node.js, Ruby on Rails, PostgreSql', 'Help us build the economic infrastructure of the internet. You will work alongside senior engineers to develop scalable payment solutions and improve our developer dashboard. We value clean code, robust testing, and a passion for financial technology.', 'Active', '2026-03-31 19:08:55'),
(17, 'UI/UX Design Intern', 'Airbnb', 'New York / Remote', 'Remote', '4', '28000', '2026-07-20', 'Figma, Adobe XD, User Research, Prototyping, Design Systems', 'Design experiences and crafting stories for millions of travelers worldwide. You\'ll assist in creating high-fidelity prototypes and conducting usability studies. If you have a keen eye for detail and a user-centric mindset, we want to hear from you.', 'Active', '2026-03-31 19:08:55'),
(18, 'Cybersecurity Analyst Intern', 'CrowdStrike', 'Austin, TX', 'Hybrid', '6', '32000', '2026-08-10', 'Network Security, Penetration Testing, Wireshark, SIEM, SOC', 'Protect the world\'s most sensitive data. You will participate in threat hunting operations and help refine our incident response protocols. This is a high-impact role for students passionate about ethical hacking and network defense.', 'Active', '2026-03-31 19:08:55'),
(19, 'Cloud Architect Intern', 'Amazon Web Services (AWS)', 'Seattle, WA', 'On-site', '3', '38000', '2026-05-30', 'AWS, Docker, Kubernetes, Terraform, Go', 'Scale the clouds with AWS. Work on infrastructure-as-code projects and help automate deployment pipelines for enterprise customers. You will gain deep experience in serverless computing and container orchestration.', 'Active', '2026-03-31 19:08:55'),
(20, 'Data Science & Analytics Intern', 'Netflix', 'Los Gatos, CA', 'On-site', '3', '40000', '2026-06-15', 'SQL, Python, Pandas, Tableau, Statistics', 'Analyze viewer behavior to drive content strategy. You will work with massive datasets to identify trends and build predictive models for recommendation engines. Strong SQL skills and a love for entertainment are a must.', 'Active', '2026-03-31 19:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `is_admin`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 0, 'New Internship Posted!', 'A new internship for \'Dotnet framework intern\' at \'Wipro\' has just been posted.', 0, '2026-03-15 15:52:11'),
(3, NULL, 1, 'New Application Received', 'James Cameron  has applied for \'Dotnet framework intern\' at \'Wipro\'.', 0, '2026-03-15 16:06:41'),
(4, 1, 0, 'Application Status Updated', 'Your application for \'Dotnet framework intern\' at \'Wipro\' has been accepted.', 0, '2026-03-15 16:07:30'),
(5, 3, 0, 'Application Status Updated', 'Your application for \'Dotnet framework intern\' at \'Wipro\' has been accepted.', 0, '2026-03-16 05:07:39'),
(6, 1, 0, 'Application Status Updated', 'Your application for \'Network engineering intern \' at \'Wipro \' has been accepted.', 0, '2026-03-17 07:08:28'),
(8, 1, 0, 'New Internship Posted!', 'A new internship for \'Business Development Role \' at \'Rinex\' has just been posted.', 0, '2026-03-17 08:35:04'),
(9, 3, 0, 'New Internship Posted!', 'A new internship for \'Business Development Role \' at \'Rinex\' has just been posted.', 0, '2026-03-17 08:35:04'),
(13, 1, 0, 'New Internship Posted!', 'A new internship for \'Software Trainee \' at \'JSW\' has just been posted.', 0, '2026-03-20 08:10:52'),
(14, 3, 0, 'New Internship Posted!', 'A new internship for \'Software Trainee \' at \'JSW\' has just been posted.', 0, '2026-03-20 08:10:52'),
(17, 1, 0, 'Application Status Updated', 'Your application for \'Business Development Role \' at \'Rinex\' has been accepted.', 0, '2026-03-22 05:17:18'),
(21, 1, 0, 'New Internship Posted!', 'A new internship for \'m\' at \'m\' has just been posted.', 0, '2026-03-31 10:21:31'),
(23, 3, 0, 'New Internship Posted!', 'A new internship for \'m\' at \'m\' has just been posted.', 0, '2026-03-31 10:21:31'),
(26, 1, 0, 'New Opportunity!', 'Explore the new \'AI Research Intern\' role at \'DeepMind\'!', 0, '2026-03-31 19:08:55'),
(28, 3, 0, 'New Opportunity!', 'Explore the new \'AI Research Intern\' role at \'DeepMind\'!', 0, '2026-03-31 19:08:55'),
(31, 1, 0, 'New Opportunity!', 'Explore the new \'Full Stack Developer Intern\' role at \'Stripe\'!', 0, '2026-03-31 19:08:55'),
(33, 3, 0, 'New Opportunity!', 'Explore the new \'Full Stack Developer Intern\' role at \'Stripe\'!', 0, '2026-03-31 19:08:55'),
(36, 1, 0, 'New Opportunity!', 'Explore the new \'UI/UX Design Intern\' role at \'Airbnb\'!', 0, '2026-03-31 19:08:55'),
(38, 3, 0, 'New Opportunity!', 'Explore the new \'UI/UX Design Intern\' role at \'Airbnb\'!', 0, '2026-03-31 19:08:55'),
(41, 1, 0, 'New Opportunity!', 'Explore the new \'Cybersecurity Analyst Intern\' role at \'CrowdStrike\'!', 0, '2026-03-31 19:08:55'),
(43, 3, 0, 'New Opportunity!', 'Explore the new \'Cybersecurity Analyst Intern\' role at \'CrowdStrike\'!', 0, '2026-03-31 19:08:55'),
(46, 1, 0, 'New Opportunity!', 'Explore the new \'Cloud Architect Intern\' role at \'Amazon Web Services (AWS)\'!', 0, '2026-03-31 19:08:55'),
(48, 3, 0, 'New Opportunity!', 'Explore the new \'Cloud Architect Intern\' role at \'Amazon Web Services (AWS)\'!', 0, '2026-03-31 19:08:55'),
(51, 1, 0, 'New Opportunity!', 'Explore the new \'Data Science & Analytics Intern\' role at \'Netflix\'!', 0, '2026-03-31 19:08:55'),
(53, 3, 0, 'New Opportunity!', 'Explore the new \'Data Science & Analytics Intern\' role at \'Netflix\'!', 0, '2026-03-31 19:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `email`, `otp`, `created_at`, `expires_at`) VALUES
(2, 'yaswithap0013.sse@saveetha.com', '344307', '2026-03-14 15:40:07', '2026-03-14 15:50:07'),
(3, 'paruchuriyaswitha13@gmail.com', '128256', '2026-03-16 04:14:03', '2026-03-16 04:24:03'),
(4, 'paruchuriyaswitha13@gmail.com', '245629', '2026-03-16 04:14:16', '2026-03-16 04:24:16'),
(5, 'paruchuriyaswitha13@gmail.com', '886919', '2026-03-16 04:20:46', '2026-03-16 04:30:46'),
(7, 'kondareddyl0009.sse@saveetha.com', '962530', '2026-03-20 04:06:57', '2026-03-20 04:16:57'),
(10, 'lekkalakondareddy2004@gmail.com', '249949', '2026-03-23 03:42:42', '2026-03-23 03:52:42'),
(11, 'bb2051307@gmail.com', '664726', '2026-03-28 14:39:49', '2026-03-28 14:49:49'),
(12, 'kondareddyl0009.sse@saveetha.com', '799936', '2026-03-28 14:46:59', '2026-03-28 14:56:59'),
(14, 'lekkalakondareddy2004@gmail.com', '947813', '2026-03-28 16:06:07', '2026-03-28 16:16:07'),
(15, 'macboi0809@gmail.co.', '878528', '2026-03-31 09:58:33', '2026-03-31 10:08:33'),
(16, 'macboi0809@gmail.co', '933922', '2026-03-31 09:58:35', '2026-03-31 10:08:35'),
(17, 'yaswithap0013.sse@saveetha.com', '317625', '2026-03-31 10:00:27', '2026-03-31 10:10:27');

-- --------------------------------------------------------

--
-- Table structure for table `saved_internships`
--

CREATE TABLE `saved_internships` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `internship_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_internships`
--

INSERT INTO `saved_internships` (`id`, `user_id`, `internship_id`, `created_at`) VALUES
(4, 1, 2, '2026-03-13 08:53:26'),
(5, 1, 1, '2026-03-13 09:03:36'),
(6, 1, 9, '2026-03-14 15:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `profile_pic`, `created_at`) VALUES
(1, 'Konda reddy Lekkala', 'lekkalakondareddy2004@gmail.com', 'scrypt:32768:8:1$k6413mAjby9jeGbe$cee900c86c411d64d71118a6b932ffb8caae2083d9d267008aae566765489dff3fb1ca35444b518a4181d6923a5a40fd0ed0264e4a291679459dcfa0c3f0fd9b', '7601088447', 'user_1_profile_1775037039.jpg', '2026-03-10 15:36:11'),
(3, 'Yaswitha Paruchuri', 'paruchuriyaswitha13@gmail.com', 'scrypt:32768:8:1$7h4pi5OA5k5FdjEW$cf72dfe9d03bd3a5a7b75bd96dd9753ce27f34edeb1086f568ca17ae7e79c98669288313d78b80db6ac674ce3ea1d5c0d6242a0f3e89b7c60c1e09b51dcd5e5d', NULL, NULL, '2026-03-16 04:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `domains` text NOT NULL,
  `duration` varchar(50) NOT NULL,
  `work_mode` varchar(50) NOT NULL,
  `stipend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `domains`, `duration`, `work_mode`, `stipend`) VALUES
(1, 1, 'Marketing,Sales,Operations', '2-3 months', 'Remote', 5000),
(2, 3, 'Operations', '2-3 months', 'In-Office', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `user_resumes`
--

CREATE TABLE `user_resumes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resume_file` varchar(255) NOT NULL,
  `extracted_skills` text DEFAULT NULL,
  `resume_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_resumes`
--

INSERT INTO `user_resumes` (`id`, `user_id`, `resume_file`, `extracted_skills`, `resume_text`) VALUES
(1, 1, 'user_1_kondareddy_resume.pdf', NULL, NULL),
(2, 3, 'user_3_paruchuri_yaswitha_resume.pdf', 'Java,Python,Sql,Aws,Css,Github,Ai', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skills` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_skills`
--

INSERT INTO `user_skills` (`id`, `user_id`, `skills`) VALUES
(1, 1, 'JavaScript,TypeScript,Node.js,MongoDB,Machine Learning'),
(2, 3, 'JavaScript,AWS,TypeScript,Python,Java');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_details`
--
ALTER TABLE `academic_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `internship_id` (`internship_id`);

--
-- Indexes for table `internships`
--
ALTER TABLE `internships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_internships`
--
ALTER TABLE `saved_internships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_save` (`user_id`,`internship_id`),
  ADD KEY `internship_id` (`internship_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_resumes`
--
ALTER TABLE `user_resumes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_details`
--
ALTER TABLE `academic_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=793;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `internships`
--
ALTER TABLE `internships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `saved_internships`
--
ALTER TABLE `saved_internships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_resumes`
--
ALTER TABLE `user_resumes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_details`
--
ALTER TABLE `academic_details`
  ADD CONSTRAINT `fk_academic_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`internship_id`) REFERENCES `internships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_internships`
--
ALTER TABLE `saved_internships`
  ADD CONSTRAINT `saved_internships_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_internships_ibfk_2` FOREIGN KEY (`internship_id`) REFERENCES `internships` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `fk_preferences_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_resumes`
--
ALTER TABLE `user_resumes`
  ADD CONSTRAINT `fk_resume_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD CONSTRAINT `fk_skills_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
