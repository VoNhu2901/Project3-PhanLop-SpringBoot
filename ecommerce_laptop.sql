-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 07:56 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_laptop`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `address`, `enabled`, `first_name`, `locked`, `last_name`, `password`, `phone`, `email`, `cart_id`, `role_id`) VALUES
(1, 'string', b'1', 'string', b'1', 'string', '$2a$10$1vuUXyBHsZtstkL4y2sllujMmw6l9wdEun/0CJjmAWEzJoCpZSsI2', '0123456789', 'a@gmail.com', NULL, 1),
(2, 'string', b'0', 'nhu', b'1', 'vo', '$2a$10$f8xOkMjzVSDFAUmwZCN.y./yXYmeOK7NqNLe4qPFL3LnJUAAvtsce', '0123456789', 'n@gmail.com', NULL, 2),
(3, 'string', b'0', 'string', b'1', 'string', '$2a$10$ne613OTxwpkyHjfGZkpqreWygzDOxULmaS6ih3zZtoMKZb3B4LPCa', '0123456789', 'string', NULL, 2),
(4, 'string', b'1', 'string', b'1', 'string', '$2a$10$dNbXpsVBkaCiDkETVLPYNOfagyTn7rFWjMZw9tQfjZr2y7R8Rmi5C', '0123456789', 'vonhu.alien@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `price_total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `create_date`, `price_total`, `status`, `user_id`) VALUES
(1, '2022-12-02', 20, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `description`, `name`, `thumbnail`) VALUES
(1, 'string', 'string', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `actived` bit(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`cart_id`, `product_id`, `actived`, `quantity`) VALUES
(1, 1, b'1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `cmt_time` datetime DEFAULT NULL,
  `noidung` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_token`
--

CREATE TABLE `confirmation_token` (
  `id` bigint(20) NOT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `expired_at` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `confirmation_token`
--

INSERT INTO `confirmation_token` (`id`, `confirmed_at`, `create_at`, `expired_at`, `token`, `user_id`) VALUES
(1, NULL, '2022-11-29 11:09:41', '2022-11-29 11:24:41', '05ee4e21-9147-4eb3-b21f-a1560d6e75c4', 1),
(2, NULL, '2022-11-29 11:10:49', '2022-11-29 11:25:49', '79ef6ffd-b1c0-40a3-abb8-080cabeae94d', 1),
(3, NULL, '2022-11-29 11:16:28', '2022-11-29 11:31:28', '790cc611-99f0-4c83-9822-f505953ff4fe', 2),
(4, NULL, '2022-12-02 00:06:38', '2022-12-02 00:21:38', '1f7ccd20-b6b2-4aa6-9354-862f7d09630f', 3),
(5, '2022-12-02 00:17:07', '2022-12-02 00:15:44', '2022-12-02 00:30:44', 'd043db93-7fee-45d1-9eee-36be84cc1dac', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `guarantee` int(11) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `water_proof` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_date`, `description`, `discount`, `gender`, `guarantee`, `hidden`, `water_proof`, `name`, `price`, `quantity`, `size`, `status`, `thumbnail`, `updated_date`, `brand_id`) VALUES
(1, '2022-12-02 10:19:20', '', 0, b'1', 0, b'0', b'1', 'Mua he soi dong giam 50%', 10, 1, 1, '1', 'http://res.cloudinary.com/diel2oapd/image/upload/v1669951163/sricltwvo8szrenzlact.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `image`, `product_id`) VALUES
(1, 'http://res.cloudinary.com/diel2oapd/image/upload/v1669951172/uuqihuncfx6gcyfdnabx.jpg', 1),
(2, 'http://res.cloudinary.com/diel2oapd/image/upload/v1669951192/fbbwpbf9wxgrpyiwwpzn.png', 1),
(3, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) NOT NULL,
  `rating_points` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `description`, `role`) VALUES
(1, 'Tài khoản role admin', 'ADMIN'),
(2, 'Tài khoản role user', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_n7ihswpy07ci568w34q0oi8he` (`email`) USING HASH,
  ADD KEY `FKax3kbn2ljb7h0c7g3s2r1wug0` (`cart_id`),
  ADD KEY `FKt3wava8ssfdspnh3hg4col3m1` (`role_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoxgvj8ab6uqfo760j1fxlfadk` (`user_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_id`,`product_id`),
  ADD KEY `FK5eb75tdb4bvn0n31k6k0yvjan` (`product_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_oce3937d2f4mpfqrycbr0l93m` (`name`) USING HASH;

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`cart_id`,`product_id`),
  ADD KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfr5v216y8pl7bourpw9y7c7o5` (`user_id`),
  ADD KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`);

--
-- Indexes for table `confirmation_token`
--
ALTER TABLE `confirmation_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl8adamk8a1hqxvq53bhqdfxy4` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1n91c4vdhw8pa4frngs4qbbvs` (`product_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2edjtdgxvpkw80k1itox2nba4` (`user_id`),
  ADD KEY `FK228us4dg38ewge41gos8y761r` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `confirmation_token`
--
ALTER TABLE `confirmation_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
