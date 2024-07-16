-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 10:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `citieguide`
--

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `image_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expiry`) VALUES
(1, 'kjansammad@gmail.com', '2ca74c420b371ee3bc3e635484953d4978a32d8c4c850a362e0d134242f3c9a75f4b3912bd6de97c27a5b8a2f123d214d761', '2024-07-05 02:26:12'),
(2, 'kjansammad@gmail.com', '079b35f522a6e1fd1d0acc27e98441ddc0b4df49fc21c21f182a03220cdd81ec76bd8c14d6f3a896474c845f29edb1369473', '2024-07-05 02:26:15'),
(3, 'kjansammad@gmail.com', 'a555511218a92be7efca816db251c3071e0333db6a9fbee20390cdd94c3e78d1a19f9d8220e4827be90be81c7d227c77c384', '2024-07-05 02:26:29'),
(4, 'kjansammad@gmail.com', '16b01b146ecdf9ac5d68ba1bb6c40524035d76548b01be1d46edba6327ee83867460c58b0e8fc1482cd579cfd10ec0a81a0c', '2024-07-05 02:26:31'),
(5, 'kjansammad@gmail.com', 'ed9c20ea36a7d00bc338a975d35ca712fb88dfe9d23da2726804979001ba9ff93291f24cb09fc18c02104c9eb39e97227446', '2024-07-05 02:26:31'),
(6, 'kjansammad@gmail.com', '20ed2e3fed36facd9cb6d6075278d4c46529d5e7a5a5c175faed87df319fd0985dcd55e96d9c4cba3e0ff1ef31f6039c447a', '2024-07-05 02:26:31'),
(7, 'kjansammad@gmail.com', 'b5c6e9d14f151f5609b760f1b19fc56dce814c0601e42f79a5b64289b2e00b971fe42fd130370ebe2405e089ed8edb4dc1f8', '2024-07-05 02:26:32'),
(8, 'kjansammad@gmail.com', '9ff374adadcb12bf363083568d09664918cf61abcf4815db3658eba06f6dd3af6443dc04fcc4b6bc14dc5255b8f7ad916ca3', '2024-07-05 02:26:32'),
(9, 'kjansammad@gmail.com', 'da254a62036f3439790f71db374ecfaa877ae674cf0a509f4e826ac715afff7561243d893e1911e5d14655f1e7a33206d3c2', '2024-07-05 02:26:32'),
(10, 'kjansammad@gmail.com', '82b6ca120934053eb0ecf7181611f3a73c1969c48f881dcd2ad045b266d5475fb03e719f89c4cb61a39d92e03a7118903d3b', '2024-07-05 02:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `signin`
--

CREATE TABLE `signin` (
  `id` int(11) NOT NULL,
  `email` varchar(257) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signin`
--

INSERT INTO `signin` (`id`, `email`, `password`) VALUES
(1, 'sammad@gmail.com', '123\r\n'),
(2, 'sammadsammad@gmail.com', '123'),
(3, 'sammad1111@gmail.com', '1231111'),
(4, 'samamdsamamd@gmail.com', '123'),
(5, 'khansamamd@gmail.com', '123'),
(6, 'ss@gmail.com', '111'),
(7, 'aa@gmail.com', '111'),
(8, 'aaaaa@gmail.com', '11111'),
(9, 'aaaaaa@gmail.com', '111111'),
(10, 'l@gmail.com', '111'),
(11, 'sammadkhan@gmail.com', 'sammad'),
(12, 'kjansammad@gmail.com', '111'),
(13, 'samma@gmail.com', '1111'),
(14, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_city`
--

CREATE TABLE `table_city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_city`
--

INSERT INTO `table_city` (`id`, `name`, `country_id`, `description`, `image_path`) VALUES
(10, 'Karachi', 23, 'Karachi, Pakistan\'s largest city, is a bustling coastal metropolis known for its economic importance, diverse culture, and vibrant nightlife. Key attractions include the Quaid-e-Azam\'s Mausoleum, Clifton Beach, and lively markets. Despite challenges like traffic congestion, Karachi remains a city of resilience and opportunity.', 'upload/8dbf5350a7223fefc71eb54de7400988.jpg'),
(11, 'Lahore ', 23, 'Karachi, Pakistan\'s largest city, is a bustling coastal metropolis known for its economic importance, diverse culture, and vibrant nightlife. Key attractions include the Quaid-e-Azam\'s Mausoleum, Clifton Beach, and lively markets. Despite challenges like traffic congestion, Karachi remains a city of resilience and opportunity.', 'upload/bd887b02b20734bbf9da5fc16b6be0b3.jpg'),
(12, 'Islamabad ', 23, 'Islamabad, the capital city of Pakistan, is known for its modern architecture, scenic beauty, and tranquil ambiance. Nestled against the Margalla Hills, it features wide, tree-lined streets and well-planned sectors. Key attractions include Faisal Mosque, Daman-e-Koh, and Pakistan Monument. The city is characterized by its lush greenery, clean environment, and a blend of natural beauty with urban development, making it a serene and orderly contrast to the hustle and bustle of other major cities in Pakistan.', 'upload/b1867817251f2619bb0f2f32b616158c.jpg'),
(13, 'Peshawar ', 23, 'Peshawar, one of the oldest cities in Pakistan, is rich in history and cultural heritage. Located near the Khyber Pass, it has been a significant trade route for centuries. The city features a mix of ancient and modern architecture, with key landmarks like the historic Qissa Khwani Bazaar, Bala Hisar Fort, and Mahabat Khan Mosque. Peshawar is known for its vibrant bazaars, traditional crafts, and flavorful cuisine. The city’s blend of Pashtun culture, historic sites, and strategic location make it a fascinating and dynamic place.', 'upload/8a3d29957c96e4928b36570953722377.jpg'),
(14, 'Mumbai', 24, 'Mumbai, located on the west coast of India, is the financial capital known for its bustling city life, Bollywood film industry, and a blend of colonial-era and modern architecture.', 'upload/c419db39831d1f206b630e14b4a09b9b.jpg'),
(15, 'Delhi', 24, 'Delhi, in northern India, is the capital territory known for its rich historical heritage, including landmarks like the Red Fort and Qutub Minar, alongside modern government buildings and vibrant markets.\n\n.', 'upload/ea1fd41360099c3534f6726c2152ea35.jpg'),
(16, 'Hayatabad', 24, 'Hyderabad, located in southern India, is known for its Mughal and Nizam heritage, famous for landmarks such as the Charminar and Golconda Fort, and renowned for its Hyderabadi biryani and pearls.', 'upload/50f960ff7c932aa6fec461655461bf49.jpg'),
(17, 'Rome', 25, 'Rome, the capital city of Italy, is known for its rich history spanning over 2,500 years. It\'s famously called the \"Eternal City\" due to its ancient ruins, Renaissance architecture, and role as the center of Western civilization. Key attractions include the Colosseum, Roman Forum, Vatican City with St. Peter\'s Basilica and the Vatican Museums (home to the Sistine Chapel), Trevi Fountain, Pantheon, and Spanish Steps. Rome is also renowned for its vibrant piazzas, bustling trattorias serving delicious Roman cuisine, and its romantic atmosphere.\n', 'upload/62d5388eb86872bbb19e2ccb649d9c34.jpg'),
(18, 'Florence ', 25, '\nFlorence, the capital of Italy\'s Tuscany region, is celebrated as the birthplace of the Renaissance. It\'s a city steeped in art, culture, and history, with iconic landmarks such as the Florence Cathedral (Duomo) with Brunelleschi\'s Dome, Giotto\'s Campanile, and the Baptistery of St. John. Florence is home to world-class art museums such as the Uffizi Gallery, which houses masterpieces by Botticelli, Leonardo da Vinci, Michelangelo, and Raphael. The city\'s historic center, a UNESCO World Heritage site, is adorned with elegant palaces, charming squares like Piazza della Signoria, and the Ponte Vecchio bridge over the Arno River. Florence is also known for its leather goods, traditional Tuscan cuisine, and fine wines.\n', 'upload/767ff529678017c80ec709f2ecbcc21c.jpg'),
(19, 'Venice', 25, 'Venice, the \"City of Canals,\" is built on a group of 118 small islands in the Venetian Lagoon. It\'s renowned for its picturesque canals navigated by gondolas and lined with stunning Gothic and Renaissance palaces. Key landmarks include St. Mark\'s Basilica with its Byzantine mosaics, the Doge\'s Palace, Rialto Bridge, and the Grand Canal, which is flanked by exquisite architecture. Venice is famous for its annual Carnival celebrations, the Venice Biennale art exhibition, and its traditional glassmaking industry on the nearby island of Murano. The city\'s intimate alleys (calli), charming squares (campi), and vibrant markets add to its unique allure as a romantic destination.', 'upload/10c759df042af39c73b71b208e773b30.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `table_country`
--

CREATE TABLE `table_country` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `image_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_country`
--

INSERT INTO `table_country` (`id`, `name`, `image_path`) VALUES
(23, 'Pakistan', 'a9ecd3e7ddcde5f94f1f13a44f193707.jpg'),
(24, 'India', '5229f0167530d517cc665a538203817b.jpg'),
(25, 'Italy', 'ec091ee108769a7ce83a30e91696e740.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `table_event`
--

CREATE TABLE `table_event` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_hotal`
--

CREATE TABLE `table_hotal` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_hotal`
--

INSERT INTO `table_hotal` (`id`, `city_id`, `name`, `description`, `image_path`, `address`) VALUES
(7, 10, 'Pearl Continental Hotel Karachi', 'Pearl Continental Hotel Karachi, often referred to as PC Karachi, is a luxurious hotel known for its elegant accommodations and excellent dining options. It offers spacious rooms with modern amenities, multiple restaurants serving a variety of cuisines, a fitness center, swimming pool, and banquet facilities for events.', 'images (1).jpg', 'Club Road, Karachi 75530, Pakistan'),
(8, 10, 'Mövenpick Hotel Karachi', 'Mövenpick Hotel Karachi is renowned for its contemporary design and warm hospitality. The hotel features well-appointed rooms and suites, several dining options including international cuisine and specialty restaurants, a rooftop swimming pool, fitness center, and comprehensive business facilities.', 'images (2).jpg', 'Club Road, Karachi 75530, Pakistan'),
(9, 10, 'Avari Towers Karachi', 'Avari Towers Karachi is a landmark hotel known for its central location and luxurious accommodations. It offers spacious rooms with city views, multiple dining outlets ranging from fine dining to casual eateries, a health club with gym and spa services, and extensive meeting and event spaces.', 'images (3).jpg', 'Fatima Jinnah Road, Karachi 75530, Pakistan'),
(10, 11, 'Pearl Continental Hotel Lahore', 'This 5-star luxury hotel offers elegant accommodations, a variety of dining options, a swimming pool, a fitness center, and a spa.', 'images (1).jpg', 'Shahrah-e-Quaid-e-Azam, Lahore 54000, Pakistan'),
(11, 11, 'Avari Hotel Lahore', 'Known for its hospitality, Avari Hotel Lahore features well-appointed rooms, several dining options, a swimming pool, a fitness center, and business facilities.', 'images (8).jpg', '87 Shahrah-e-Quaid-e-Azam, Garhi Shahu, Lahore, Punjab 54000, Pakistan'),
(12, 12, 'Serena Hotel Islamabad', 'A 5-star luxury hotel offering elegant accommodations, multiple dining options, a spa, swimming pool, and conference facilities. Known for its beautiful architecture and gardens.', '183065428.jpg', 'Khayaban-e-Suhrawardy, G-5/1, Islamabad, Pakistan');

-- --------------------------------------------------------

--
-- Table structure for table `table_restaurant`
--

CREATE TABLE `table_restaurant` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_restaurant`
--

INSERT INTO `table_restaurant` (`id`, `city_id`, `name`, `description`, `image_path`, `address`) VALUES
(5, 10, 'Kolachi', 'Known for its stunning views of the Arabian Sea and delicious Pakistani cuisine, especially their BBQ and seafood.', 'images (9).jpg', 'Beach Avenue, phase 8,DHA karachi'),
(6, 10, 'Bar.B.Q Tonight', 'Famous for its extensive BBQ menu, offering a variety of grilled dishes in a lively atmosphere', 'hqdefault.jpg', 'Com 5/1, Boat Basin, Clifton Karachi'),
(7, 10, 'Okra', 'Offers a blend of Mediterranean and Asian cuisine with a contemporary touch, known for its flavorful dishes..', 'images (10).jpg', 'Plot 8-C, Lane 4, Shahbaz Commercial, Phase VI, DHA, Karachi'),
(9, 14, 'Bastian', 'A favorite for seafood lovers, Bastian is celebrated for its exquisite dishes and chic ambiance.\n', 'images (11).jpg', 'B/1, New Kamal Building, Linking Road, Bandra West, Mumbai, Maharashtra 400050.'),
(10, 14, 'Leopold Cafe', 'An iconic cafe and bar with a rich history, known for its relaxed atmosphere and diverse menu.\n', 'images (12).jpg', ' Shahid Bhagat Singh Road, Colaba Causeway, Mumbai, Maharashtra 400039.'),
(11, 14, 'Trishna', ' Famous for its seafood, especially butter garlic crab, Trishna is a go-to place for seafood lovers.\n', 'trishna-restaurant-and-bar-fort-mumbai-sea-food-restaurants-lhxkd8y3g3.jpg', '7, Sai Baba Marg, Kala Ghoda, Fort, Mumbai, Maharashtra 400001'),
(12, 15, 'Indian Accent', 'Indian Accent offers an inventive approach to Indian cuisine. The menu combines global ingredients with traditional Indian flavors.\n', 'images (13).jpg', 'The Lodhi, Lodhi Road, New Delhi, Delhi 110003'),
(13, 15, 'Bukhara', ' Renowned for its authentic North Indian cuisine, Bukhara is known for its kebabs, dal Bukhara, and tandoori dishes.', 'images (14).jpg', ' ITC Maurya, Sardar Patel Marg, Diplomatic Enclave, New Delhi, Delhi 110021'),
(14, 15, 'Olive Bar & Kitchen', 'Set in a beautiful white-washed haveli, Olive Bar & Kitchen is known for its Mediterranean fare, wood-fired pizzas, and vibrant brunches.', 'images (16).jpg', 'One Style Mile, Haveli No. 6-8, Kalka Das Marg, Mehrauli, New Delhi, Delhi 110030'),
(15, 16, 'Jewel of Nizam - The Minar', 'Known as the “Jewel of Nizam,” this restaurant offers a fine dining experience with stunning views and exquisite Hyderabadi cuisine, including biryanis and kebabs.', 'images (17).jpg', 'The Golkonda Resort, Gandipet, Sagar Mahal Complex, Hyderabad, Telangana 500075'),
(16, 16, 'Bawarchi', 'Famous for its authentic Hyderabadi biryani, Bawarchi is a popular spot for locals and tourists alike, offering delicious Mughlai and North Indian dishes.', 'images (18).jpg', ' RTC Cross Road, Musheerabad, Hyderabad, Telangana 500020'),
(17, 16, 'Paradise', 'An iconic name in Hyderabad, Paradise is celebrated for its legendary biryani and wide array of Hyderabadi dishes, serving patrons since 1953. ', 'images (19).jpg', 'Paradise Circle, MG Road, Secunderabad, Telangana 500003'),
(18, 11, 'Cooco’s Den', 'Famous for its stunning rooftop views of the Badshahi Mosque and delicious traditional Pakistani cuisine.', 'download.jpg', '2168/A, Food St Fort Rd, Shahi Mohallah Walled City of Lahore, Lahore, Punjab 54000, Pakistan.'),
(19, 11, 'Fuchsia Kitchen', 'Offers a modern twist on traditional Asian flavors with a chic and contemporary ambiance.', 'images (20).jpg', 'Plot 17-C, Z Block, Commercial Market Sector C Phase 3 Phase 3 DHA, Lahore, Punjab 54000, Pakistan'),
(20, 11, 'Spice Bazaar', 'Specializes in authentic Pakistani dishes with a luxurious dining experience.', 'images (21).jpg', ' T-01, Off MM Alam Road, Tipu Road, Block B3 Gulberg III, Lahore, Punjab 54660, Pakistan.'),
(21, 12, 'Monal', 'Offers stunning panoramic views of Islamabad from its location on Pir Sohawa, with a menu that includes a variety of Pakistani and continental dishes.', 'download (1).jpg', ' Pir Sohawa Road, Islamabad, Pakistan.'),
(22, 12, 'Le Gourmet', 'Le Gourmet offers an exquisite dining experience with a fusion of French and Mediterranean cuisines. Renowned for its elegant ambiance and exceptional service.', 'images (24).jpg', 'Mediterranean cuisines. Renowned for its elegant ambiance and exceptional service.'),
(23, 12, 'Des Pardes', 'Known for its traditional Pakistani cuisine and cultural ambiance, located in the historic Saidpur Village.', 'images (23).jpg', 'Address: Saidpur Village, Islamabad, Pakistan.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`, `created_at`) VALUES
(1, 'sammad', '$2y$10$efYpc05Q5uxgjZkUfc685Onnd/kkj.EGwKEA06ieJjwZe5FqvWDB6', 'kjansammad@gmail.com', 'admin', '2024-07-03 15:38:47'),
(6, 'asdasda', '$2y$10$gAo9q3edU/KUVoOfqe0BxeMT1ff5wjOhaHMPYb9hM3Nx.ySd6wp.q', 'admin@gmail.com', 'user', '2024-07-03 15:42:30'),
(7, 'basit ', '$2y$10$dvEeok0UOlYqZElLSO/NJuscBVW.Co8uhQ58MdCGbw4k5gAqtD28S', 'basit@gmail.com', 'user', '2024-07-03 15:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(256) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin','','') NOT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expiration` datetime DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `otp`, `otp_expiration`, `is_verified`) VALUES
(46, ' h CT', 'kjansammad@gmail.com', '$2y$10$xlj/Om6tnvwY86T/abginemyjqwQ.o0GA4qJxmjrDmYiCnyC8.ily', 'admin', '595302', '2024-07-16 11:20:53', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signin`
--
ALTER TABLE `signin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_city`
--
ALTER TABLE `table_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_country`
--
ALTER TABLE `table_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_event`
--
ALTER TABLE `table_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `table_hotal`
--
ALTER TABLE `table_hotal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `table_restaurant`
--
ALTER TABLE `table_restaurant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `signin`
--
ALTER TABLE `signin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `table_city`
--
ALTER TABLE `table_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `table_country`
--
ALTER TABLE `table_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `table_event`
--
ALTER TABLE `table_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_hotal`
--
ALTER TABLE `table_hotal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `table_restaurant`
--
ALTER TABLE `table_restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_event`
--
ALTER TABLE `table_event`
  ADD CONSTRAINT `table_event_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `table_city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_hotal`
--
ALTER TABLE `table_hotal`
  ADD CONSTRAINT `table_hotal_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `table_city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_restaurant`
--
ALTER TABLE `table_restaurant`
  ADD CONSTRAINT `table_restaurant_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `table_city` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
