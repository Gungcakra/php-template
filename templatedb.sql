-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2024 at 07:23 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `templatedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`) VALUES
(4, 'bimo', '$2y$10$OqL3ey.MfoPT5SuX3d8J/uae46n82rc8OzBKmvrbSmCZ.Hk8eRxy2'),
(9, 'masfuad', 'masfuad'),
(39, 'cakra', '$2y$10$yQ8gwJd/jOtoi6yMR.p0ouYslvuCPFnVvORztsk7VoJ6IPLags7gm'),
(42, 'testing', '$2y$10$Yv7OOoJwYuEHRwI6c7i.nuchDZUXA5O5oAy84A4XQdb264oU6DwlO'),
(43, 'satoru', '$2y$10$Pk2YO7rEPzv7enwk3KfPceAhf9lb.DDZEkk9zNO5tFfAtiKCp/Iuu'),
(44, 'testoinmg', '$2y$10$PZTRHBTDGp1lyUIF82sa0uyiqscuWQ86B4KPNDMSGDFkiGoPU0amW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
