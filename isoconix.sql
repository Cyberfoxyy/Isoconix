-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2023 at 02:43 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isoconix`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'Shiv', 'shiv@gmail.com', '6306855517', 'Hi this is Shiv.', '2023-02-07 19:22:52'),
(2, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'Mera nama is gmail is sobswdbjscdi jcbmncbbhai sis hoga jme', NULL),
(3, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'Mera nama is gmail is sobswdbjscdi jcbmncbbhai sis hoga jme', '2023-02-07 20:37:44'),
(4, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'gjhggggggggggggggggggj', '2023-02-07 20:48:29'),
(5, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'sdasdasdasd', '2023-02-07 20:54:19'),
(6, 'Rahul', 'radhika.v798596@gmail.com', '9898989898', 'HI this is Rahaul', '2023-02-07 20:55:33'),
(7, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'HI this is shiv and this is first test email', '2023-02-08 01:23:32'),
(8, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'Hi this is test email for the site Isoconix', '2023-02-08 01:42:04'),
(9, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'This is second test email for the website.\r\n\r\nThank you!', '2023-02-08 01:47:09'),
(10, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'hdsaudhsakjdhaskjdhaskjdhaskjdhaskjdhksjdhksa\r\ndasdasdasd\r\nasdasdasdasd\r\nd\r\nsaa', '2023-02-08 01:49:49'),
(11, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'dsfasfsf\r\ndsad\r\nas\r\ndsa\r\ndas', '2023-02-08 01:50:49'),
(12, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'Hi this message is from the Isoconix Project.......................', '2023-02-08 01:53:08'),
(13, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'Hi this message is from the Isoconix Project.......................', '2023-02-08 01:53:41'),
(14, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'dsfasfsf\r\ndsad\r\nas\r\ndsa\r\ndas', '2023-02-08 01:56:09'),
(15, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'dsfasfsf\r\ndsad\r\nas\r\ndsa\r\ndas', '2023-02-08 01:56:17'),
(16, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'dsfasfsf\r\ndsad\r\nas\r\ndsa\r\ndas', '2023-02-08 01:57:07'),
(17, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'dsfasfsf\r\ndsad\r\nas\r\ndsa\r\ndas', '2023-02-08 01:58:14'),
(18, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'hi', '2023-02-08 01:58:27'),
(19, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'hi', '2023-02-08 01:59:40'),
(20, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'hi', '2023-02-08 02:02:06'),
(21, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'swdASasA', '2023-02-08 02:02:18'),
(22, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'dnaskjhaskjdhaskdm \r\ndsadas', '2023-02-08 02:06:08'),
(23, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'hihihhihi', '2023-02-08 02:06:28'),
(24, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'jjjjj', '2023-02-10 03:43:00'),
(25, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'gkhjghghgnmnbmnbm bhgjhgjh', '2023-02-10 19:57:38'),
(26, 'SHIV PRATAP', 's.shivinfo@gmail.com', '06306855517', 'asdasdasdas', '2023-02-10 22:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(22) NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Isoconix: The Best Tech Company in the Modern World', 'isoconix-best-tech-compan', 'The world of technology is constantly evolving and advancing, and with so many companies vying for the top spot, it can be hard to determine which is the best. However, there is one company that stands out from the rest, and that is Isoconix.\r\n\r\nIsoconix is a leading technology company that specializes in providing innovative solutions to a wide range of industries. From cutting-edge software to advanced hardware, Isoconix has proven time and time again that they are dedicated to pushing the boundaries of what is possible in the tech world.\r\n\r\nOne of the things that sets Isoconix apart from other tech companies is their focus on creating products that are not only highly advanced, but also user-friendly. This combination of technical expertise and customer-centric design has earned Isoconix a reputation as one of the most trusted tech companies in the world.\r\n\r\nAnother factor that contributes to Isoconix\'s success is their commitment to sustainability. They understand the importance of reducing their carbon footprint and are always looking for ways to make their products and operations more environmentally friendly.\r\n\r\nIn conclusion, Isoconix\'s combination of technical expertise, customer-focused design, and commitment to sustainability make them the best tech company in the modern world. Whether you\'re looking for cutting-edge software or advanced hardware, you can trust Isoconix to deliver the highest-quality products and services.', 'https://magicstudio.co', '2023-02-11 03:29:56.902286'),
(2, 'Marketing Strategies of Shiv Pratap', 'marketing-strategies', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', 'events-1.jpg', '2023-02-10 20:39:35.897873'),
(3, 'Learn Coding for free', 'learn-coding', 'Here are a few popular options:\r\n\r\nCodecademy: An interactive platform that offers a wide range of courses on various programming languages and technologies, including HTML, CSS, JavaScript, Python, Ruby, and more.\r\n\r\nFreeCodeCamp: A non-profit organization that provides a comprehensive curriculum of coding lessons, as well as opportunities for hands-on experience building projects and contributing to open-source software.\r\n\r\nKhan Academy: A non-profit educational organization that offers free lessons on a variety of topics, including computer programming.\r\n\r\nScratch: A visual programming language and online platform developed by MIT that makes it easy for beginners to learn programming concepts through creating interactive games, animations, and stories.', 'events-2.jpg', '2023-02-09 02:16:10.000000'),
(4, 'This is fourth post in the blog', 'asdasddasasd', 'dsadasd', 'post-landscape-1.jpg', '2023-02-10 20:45:52.670981'),
(5, 'Khan Academy: A non-profit educational organization', '4rd-post', 'Here are a few popular options:\r\n\r\nCodecademy: An interactive platform that offers a wide range of courses on various programming languages and technologies, including HTML, CSS, JavaScript, Python, Ruby, and more.\r\n\r\nFreeCodeCamp: A non-profit organization that provides a comprehensive curriculum of coding lessons, as well as opportunities for hands-on experience building projects and contributing to open-source software.\r\n\r\nKhan Academy: A non-profit educational organization that offers free lessons on a variety of topics, including computer programming.\r\n\r\nScratch: A visual programming language and online platform developed by MIT that makes it easy for beginners to learn programming concepts through creating interactive games, animations, and stories.', '', '2023-02-09 02:28:01.000000'),
(6, 'Khan Academy: A non-profit educational organization', 'events-2.jpg', 'Here are a few popular options:\r\n\r\nCodecademy: An interactive platform that offers a wide range of courses on various programming languages and technologies, including HTML, CSS, JavaScript, Python, Ruby, and more.\r\n\r\nFreeCodeCamp: A non-profit organization that provides a comprehensive curriculum of coding lessons, as well as opportunities for hands-on experience building projects and contributing to open-source software.\r\n\r\nKhan Academy: A non-profit educational organization that offers free lessons on a variety of topics, including computer programming.\r\n\r\nScratch: A visual programming language and online platform developed by MIT that makes it easy for beginners to learn programming concepts through creating interactive games, animations, and stories.', '', '2023-02-09 02:31:12.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
