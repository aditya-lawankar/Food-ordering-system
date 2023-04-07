-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2023 at 02:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `springproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryid`, `name`) VALUES
(1, 'Chinese'),
(2, 'Thai'),
(3, 'Korean'),
(4, 'Japanese');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `password`, `username`) VALUES
(1, '123', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `categoryid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `description` text NOT NULL,
  `course` varchar(50) NOT NULL,
  `diet` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `categoryid`, `quantity`, `price`, `weight`, `description`, `course`, `diet`) VALUES
(1, 'Honey Chilli Potato', '1.jpg', 1, 7, 250, 586, 'Deep-fried potato fingers coated with tomato chilli sauce, honey and a mixture of garlic, vinegar, salt, pepper and chilli flakes garnished with sesame seeds.', 'Starters', 'Veg'),
(2, 'Japanese Cucumber Salad', '2.jpg', 4, 5, 200, 46, 'Japanese Cucumber Salad (Sunomono) made with soy sauce, vinegar, and a touch of sugar and spice is a healthy side dish packed with flavor!', 'Starters', 'Veg'),
(3, 'BBQ Chicken Wings', '3.jpg', 2, 3, 400, 328, 'The wings are marinated in a sweet and tangy sauce, and are loaded with authentic Thai flavors. It\'s inspired by the traditional gai yang ไก่ย่าง.', 'Starters', 'Non-Veg'),
(4, 'Tuna Kimbap', '4.jpg', 3, 6, 350, 240, 'Nutritious and delicious seaweed rice rolls, featuring canned tuna and various vegetables for the fillings.', 'Starters', 'Non-Veg'),
(5, 'Wonton Soup', '5.jpg', 1, 8, 300, 227, 'A Chinese soup that is prepared with wontons, which are small dumpling-like morsels filled with chicken, a clear broth, and several seasonings that may include soy sauce, celery, pepper, and scallions.', 'Starters', 'Non-Veg'),
(6, 'Garlic Chicken Lo Mein', '6.jpg', 1, 7, 450, 568, 'Cabbage, green onions, carrots, and mushroom stir-fried with Lo Mein noodles with heaps of Szechuan garlic butter.', 'Mains', 'Non-Veg'),
(7, 'Pad Krapow Gai', '7.jpg', 2, 8, 350, 310, 'Thai basil chicken is a stir-fry dish made with finely chopped or ground chicken cooked with Chile peppers, garlic, and shallots, and seasoned with a sweet and salty sauce and finished with fresh basil.', 'Mains', 'Non-Veg'),
(8, 'Smoky Vegan Ramen', '8.jpg', 4, 3, 350, 410, 'This vegan ramen is smoky, spicy, and served with gingery mushrooms garnished with green onions for freshness, tofu, and corn for some crunch.', 'Mains', 'Veg'),
(9, 'Vegetarian Bibimbap', '9.jpg', 3, 5, 350, 462, 'This vegetarian bibimbap includes spinach, mushrooms, carrots, red cabbage, baby corn, tofu and jalapeños over a bed of rice served with soy sauce, gochujang, kimchi and fresh cucumbers on the side.', 'Mains', 'Veg'),
(10, 'Oyakodon', '10.jpg', 4, 2, 400, 500, 'Oyakodon is a delicious traditional Japanese meal consisting of chicken sautéed and then cooked in a Japanese broth and then finished with egg and served over rice.', 'Mains', 'Non-Veg'),
(11, 'Pandan Cake', '11.jpg', 2, 7, 350, 123, 'Light, fluffy, green-coloured sponge cake flavoured with the juices of Pandan leaves.', 'Desserts', 'Veg'),
(12, 'Custard Pudding', '12.jpg', 4, 6, 350, 150, 'Custard dessert made from eggs, milk, and sugar, and covered with a thin layer of rich caramel sauce on top.', 'Desserts', 'Non-Veg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `role` varchar(250) NOT NULL DEFAULT 'ROLE_USERS',
  `enabled` tinyint(4) DEFAULT NULL,
  `email` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `enabled`, `email`) VALUES
(1, 'jay', '123', 'ROLE_USER', 1, 'gajerajay9@gmail.com'),
(2, 'admin', '123', 'ROLE_ADMIN', 1, 'admin@email.com'),
(3, 'aditya', 'Qwerty@123', 'ROLE_USERS', 1, 'aditya@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`categoryid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
