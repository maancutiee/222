-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 11:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oews_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `customer_id`, `product_id`, `quantity`) VALUES
(4, 1, 1, 1),
(5, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Jewelry', 'Adorn yourself with our exquisite jewelry collection, featuring stunning pieces that are as unique as you are. Each necklace, bracelet, and ring is crafted with precision and designed to make a statement of luxury and refinement.', 1, 0, '2023-01-30 10:03:37', '2024-05-25 10:29:03'),
(2, 'Clothing', 'Step into the world of high fashion with our luxury clothing line. From couture dresses to impeccably tailored suits, our collection embodies elegance and style, perfect for those who demand the very best.', 1, 0, '2023-01-30 10:05:04', '2024-05-25 10:29:42'),
(3, 'Bags', 'Discover our curated collection of luxury bags, where timeless elegance meets modern design. From iconic handbags to chic clutches, elevate your style with pieces that exude sophistication and unparalleled craftsmanship.', 1, 0, '2023-01-30 10:06:13', '2024-05-25 10:28:02'),
(4, 'Footwear', 'Walk in style with our exclusive range of luxury footwear. From designer heels to sophisticated flats, our shoes are crafted to provide the perfect blend of comfort and high fashion, making every step a statement.', 1, 0, '2024-05-25 10:30:32', '2024-05-25 10:30:32'),
(5, 'Headwear', 'Top off your look with our designer headwear—the perfect accessory for a touch of high-end style.', 1, 0, '2024-05-25 10:32:58', '2024-05-27 12:42:23'),
(6, 'Beauty & Fragrance', 'Indulge in our luxury beauty and fragrance collection, where high-end skincare meets captivating scents. Pamper yourself with premium products designed to enhance your natural beauty and leave a lasting impression.', 1, 0, '2024-05-25 10:34:05', '2024-05-25 10:34:05'),
(7, 'Watches', 'Discover the epitome of luxury and precision with our high-end watches. Each timepiece is a masterpiece of craftsmanship, designed to be both a functional accessory and a statement of timeless elegance.', 1, 0, '2024-05-25 10:40:29', '2024-05-25 10:40:29'),
(8, 'Eyewear', 'Elevate your look with our designer eyewear collection. From sophisticated sunglasses to stylish optical frames, our eyewear combines cutting-edge design with unparalleled quality, perfect for those who see the world through a lens of luxury.', 1, 0, '2024-05-25 10:40:52', '2024-05-25 10:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer_list`
--

CREATE TABLE `customer_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_list`
--

INSERT INTO `customer_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `email`, `password`, `avatar`, `date_created`, `date_updated`) VALUES
(1, 'Mark', 'D', 'Cooper', 'Male', '0912356498', 'mcooper@mail.com', 'c7162ff89c647f444fcaa5c635dac8c3', 'uploads/customers/1.png?v=1675045908', '2023-01-30 10:31:48', '2023-01-30 10:49:25'),
(3, 'Joyce ', '', 'Jayectin', 'Female', '09655646192', 'joyce@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/customers/3.png?v=1716620038', '2024-05-25 14:53:58', '2024-05-25 14:53:58'),
(4, 'Nora', '', 'Calud', 'Female', '09525224154', 'nora@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/customers/4.png?v=1716620109', '2024-05-25 14:55:09', '2024-05-25 14:55:09'),
(5, 'Maan', '', 'Lemin', 'Female', '09525224150', 'maan@gmail.com', '202cb962ac59075b964b07152d234b70', 'uploads/customers/5.png?v=1716792966', '2024-05-27 14:56:06', '2024-05-27 14:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0,
  `price` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(2, 1, 2, 355.99),
(2, 2, 2, 455.99),
(6, 5, 1, 2599.00),
(6, 11, 1, 50959.00),
(7, 1, 1, 30055.00),
(8, 29, 1, 221657.00),
(8, 42, 1, 7399.00),
(8, 21, 1, 716110.00),
(9, 27, 1, 53789.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `total_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=packed,\r\n2=out for delivery,\r\n3=paid\r\n',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `customer_id`, `delivery_address`, `total_amount`, `status`, `date_created`, `date_updated`) VALUES
(2, '2023013000002', 1, 'Sample Address only 101', 1623.96, 3, '2023-01-30 10:34:56', '2023-01-30 10:51:56'),
(6, '2024052700003', 3, 'Gajdi', 53558.00, 1, '2024-05-27 14:54:01', '2024-05-29 16:53:28'),
(7, '2024052700004', 3, 'ckkd', 30055.00, 2, '2024-05-27 14:54:35', '2024-05-29 16:53:18'),
(8, '2024052700001', 5, 'dks', 945166.00, 3, '2024-05-27 14:56:56', '2024-05-29 16:53:07'),
(9, '2024052700002', 5, 'jdod', 53789.00, 3, '2024-05-27 14:57:20', '2024-05-29 16:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `brand` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `dose` varchar(250) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `brand`, `name`, `description`, `dose`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 6, 'Dior', 'GUCCI BLONDIE LEATHER BRACELET, 0.8\"', 'The Round Interlocking G cut-out in gold-toned metal puts an innovative twist on smooth leather bracelets, like this one crafted featuring GG Supreme.\r\n\r\nBeige and ebony GG Supreme canvas\r\nGold-toned hardware\r\nRound Interlocking G\r\nSnap button closure\r\nWidth: 0.8\"\r\nMade in Italy', '', 30055.00, 'uploads/medicines//Y0319000_C031900001_E01_ZHC_1.jpg?v=1716613189', 1, 0, '2023-01-30 10:07:54', '2024-05-25 15:12:38'),
(2, 6, 'Dior', 'DIORSHOW BLACK OUT', 'Spectacular volume intense black khôl mascara\r\n\r\nLike kohl for the lashes. Diorshow Black Out recreates the captivating effect of kohl in a mascara for extreme volume with a charcoal-like finish.', '', 455.00, 'uploads/medicines//Y0726100_F069703099_E01_ZHC.jpg?v=1716611409', 1, 0, '2023-01-30 10:08:30', '2024-05-25 12:30:09'),
(4, 6, 'Dior', 'DIOR FOREVER SKIN CORRECT', 'Full-Coverage Concealer - 24h Hydration and Wear - No Transfer\r\n\r\nDior Forever Skin Correct is the clean* high-perfection concealer by Dior that offers 24h** wear and hydration.\r\n\r\nIn a single sweep, this multi-use, full-coverage complexion concealer with a creamy texture hides undereye circles, localized redness, pigment spots and blemishes for flawless correcting and undereye circle concealing action with no transfer. From morning to night, it smooths the complexion and enhances the skin, without settling into facial lines. It stands up in all conditions of heat and humidity.\r\n\r\nComposed of 96%*** natural-origin ingredients, this concealer is clean,* formulated according to a rigorous list of ingredients and infused with iris extract with hydrating properties, wild pansy extract that contributes to comfort and yarrow extract that contributes to the brightening and smoothing action in the eye area.\r\n\r\nThis concealer is non-comedogenic and dermatologically tested.', '', 1099.00, 'uploads/medicines//Y0326000_C032600032_E01_ZHC.jpg?v=1716613458', 1, 0, '2023-01-30 10:12:18', '2024-05-25 13:04:18'),
(5, 6, 'Dior', 'DIOR FOREVER EXTREME CONTROL', 'Compact Foundation - Extreme High Perfection, Hold and Mattness\r\n\r\nor 12 hours*, Diorskin Forever Extreme Control ensures absolute complexion control. This compact foundation combines all extremes: extra-mattness, luminosity, hold, comfort, and skincare effect to make the skin more beautiful day after day.\r\n\r\nPeter Philip\'s tip: \"I particularly like to use this compact for touch ups or in a very fine layer on the entire face in the morning.\"\r\n\r\nDiorskin Forever Extrême Control is presented in an on-the-go and refillable case to limit its environmental footprint.', '', 2599.00, 'uploads/medicines//Y0332500_F033250020_E01_ZHC.jpg?v=1716613553', 1, 0, '2023-01-30 10:12:53', '2024-05-25 13:05:53'),
(6, 3, 'Gucci', 'LARGE TOTE BAG WITH GUCCI PRINT', 'Well-known prints of the House constantly evolve to tell a unique narrative. An essential storytelling element of the Pre-Fall 2024 collection, the \'Gucci Made in Italy\' print defines this large beige canvas tote bag with a red leather trim and GG Supreme lining.', '', 399000.00, 'uploads/medicines//772177_FACUL_8574_003_100_0000_Light-Large-tote-bag-with-Gucci-print.jpg?v=1716618274', 1, 0, '2023-01-30 10:15:09', '2024-05-25 14:24:34'),
(7, 4, 'Gucci', 'MENS GG LOAFER WITH HORSEBIT', 'The Pre-Fall selections spotlight essential silhouettes with emblematic details. This slip-on style for men is crafted from burgundy debossed GG leather, with the House\'s signature, highlighting the Horsebit hardware.\r\n\r\nBurgundy leather with debossed GG leather detail\r\nMen\'s\r\nSilver-toned hardware\r\nHorsebit\r\nLeather sole\r\nLow heel\r\n0.6\" height\r\nMade in Italy', '', 59999.00, 'uploads/medicines//loafers.jpg?v=1716618900', 1, 0, '2023-01-30 10:15:56', '2024-05-27 14:48:45'),
(8, 7, 'Gucci', 'G-TIMELESS WATCH, 38MM', 'Part of the G-Timeless collection, this automatic watch is designed with a black onyx stone dial, enriched with silver-toned indexes that take the form of the Gucci bee—a distinctive code of the House. The case continues into a steel bracelet that wraps around the wrist.\r\n\r\nSteel case, black onyx stone dial with bees, steel bracelet\r\nThe warranty certificates for Gucci watches purchased after March 1st 2022 are exclusively available online.\r\nutomatic movement\r\nWater resistance: 5 ATM (160 feet/50 meters)\r\nYA1264130\r\nSwiss Made', '', 1020999.00, 'uploads/medicines//584156_I1600_8489_003_100_0000_Light-G-Timeless-watch-38mm.jpg?v=1716620802', 1, 0, '2023-01-30 10:16:42', '2024-05-25 15:06:42'),
(9, 5, 'Prada', 'PRADA BUCKET HAT', 'RE-NYLON IN BLACK UNISEX AUTHENTIC GENUINE BRAND NEW', '', 24985.00, 'uploads/medicines//17050566_34235282_600.jpg?v=1716785341', 1, 0, '2024-05-25 09:58:25', '2024-05-27 12:53:19'),
(10, 5, 'Louis Vuitton', 'LV Iconic cap', 'The LV Iconic cap is introduced in three exciting new colorways. On the front corner, LV Initials in polished hardware lend a subtle touch. Embroidered eyelets in the shape of Monogram Flowers and a tone-on-tone Monogram pattern underneath emphasize the House\'s commitment to detail.\r\n28 x 13 x 15 cm\r\n(Length x Height x Width)- 70000', '', 25180.00, 'uploads/medicines//louis-vuitton--M7051L_PM2_Front view.jpg?v=1716785573', 1, 0, '2024-05-27 12:52:53', '2024-05-27 12:52:53'),
(11, 5, 'Dior', 'D-Smash Toile de Jouy Soleil Visor', 'The D-Smash visor offers a new take on the symbolic House motif with this season\'s signature Toile de Jouy Soleil, layering suns and crescent moons into a floral design representing the four seasons. Crafted in a white and navy blue fully embroidered cotton blend, it is accented by a contrasting band embroidered with the Christian Dior Paris signature. The adjustable visor will complete modern outfits and can be coordinated with other Toile de Jouy Soleil pieces from the collection.\r\nWhite and navy blue Toile de Jouy Soleil embroidery\r\nContrasting embroidered band with Christian Dior Paris signature\r\nChristian Dior Paris signature embroidered on the interior\r\n90% cotton, 7% polypropylene, 3% polyester\r\nMade in Italy\r\n\r\nOne size\r\nAdjustable size', '', 50959.00, 'uploads/medicines//bfc1b554a0794215503e88870619c96ae0ca87a75aeceb2912818c70d5d2352f.jpg?v=1716785780', 1, 0, '2024-05-27 12:56:20', '2024-05-27 12:56:20'),
(12, 2, 'Gucci', 'Gucci Monogram Embroidered Dress', 'Dimensions and specifications\r\n100% Wool\r\nMade in Italy\r\n\r\nDesigner Model Number: 681306XKB7S\r\nDesigner Colour: 1080\r\nSize: XS', '', 78977.00, 'uploads/medicines//Screenshot_2024-05-26-22-10-37-43_40deb401b9ffe8e1df2f1cc5ba480b12.jpg?v=1716786024', 1, 0, '2024-05-27 13:00:24', '2024-05-27 13:00:24'),
(13, 2, 'Dior', 'Christian Dior Pre-Owned', '2010s flared wool minidress\r\n\r\nChristian Dior’s admiration for organic shapes is reflected in this flared minidress. The voluminous rounded forms of the New Look softens into a high-low hemline with a curved finish for this woven piece.\r\n\r\nMade in France\r\n\r\nComposition\r\nLining: Silk 100%\r\nOuter: Wool 100%\r\n\r\nWearing\r\nThe model is 1.8 m wearing size 42', '', 94016.00, 'uploads/medicines//19791730_44548607_600.jpg?v=1716786278', 1, 0, '2024-05-27 13:04:38', '2024-05-27 13:04:38'),
(14, 2, 'Versace', 'Mini skirt in bouclé tweed', 'This mini skirt in bouclé tweed features a wrap design with accent Medusa buttons.\r\nMedusa hardware\r\nBarocco jacquard lining\r\nOuter composition: 77% Pure virgin wool, 14% Mohair, 9% Nylon\r\nLining: 58% Cupro, 42% Viscose', '', 34000.00, 'uploads/medicines//Screenshot_2024-05-26-22-03-37-57_40deb401b9ffe8e1df2f1cc5ba480b12.jpg?v=1716786529', 1, 0, '2024-05-27 13:08:49', '2024-05-27 13:08:49'),
(15, 2, 'Gucci', 'GG jacquard double-breasted blazer', 'GG jacquard is a quintessentially Gucci fabric that\'s been part of the house\'s codes since the early \'70s. This double-breasted blazer is made from a cotton blend with exaggerated satin lapels and a lined interior.\r\n\r\nDetails: 100% silk\r\nMade in Italy\r\nMaterial: 41% viscose, 59% cotton\r\nLining II: 100% viscose\r\nContains non-textile parts of animal origin\r\nLining: fully lined, 100% viscose\r\nPockets: flap pockets, internal pockets\r\nClosure: double-breasted buttoned front\r\nCare instructions: dry clean\r\nItem number: P00770014\r\n\r\nSize and Fit:\r\nTrue to size\r\nShoulder pad inserts\r\nCinched waist\r\nMid-weight material\r\nFalls below the hip', '', 182805.00, 'uploads/medicines//Screenshot_2024-05-26-22-13-52-02_40deb401b9ffe8e1df2f1cc5ba480b12.jpg?v=1716786905', 1, 0, '2024-05-27 13:15:05', '2024-05-27 13:15:05'),
(16, 1, 'Dolce & Gabbana', 'Dolce & Gabbana DG Embellished Bracelet', 'Dimensions and specifications\r\nBrass, Glass\r\nMade in Italy\r\nDesigner Model Number: WNO4S6W1111\r\nDesigner Colour: ZOO00GOLD', '', 2300000.00, 'uploads/medicines//IMG_20240526_224619.jpg?v=1716787268', 1, 0, '2024-05-27 13:21:08', '2024-05-27 13:21:08'),
(17, 1, 'Louis Vuitton', 'LV Jewelry', 'LV-Made in stainless steel Materials, ● Non tarnish and Hypo Allergenic, ● Best for gifts parties and special kind of occasions, ● Comfortable for all.', '', 1600000.00, 'uploads/medicines//IMG_20240526_224559.jpg?v=1716787529', 1, 0, '2024-05-27 13:25:29', '2024-05-27 13:25:29'),
(18, 1, 'Hermes', 'Hermes Gold GP Slip On Bracelet Horse Heads Bangle ', 'Authentic Hermes Gold GP Slip On Bracelet Horse Heads Bangle Jewelry Accessory\r\n', '', 64884.00, 'uploads/medicines//s-l1200.jpg?v=1716787624', 1, 0, '2024-05-27 13:27:04', '2024-05-27 13:27:04'),
(19, 1, 'Chanel', 'RARE Chanel CC F12V ', 'Authentic RARE Chanel CC F12V logo classic timeless crystal necklace box receipt ', '', 151486.00, 'uploads/medicines//s-l400.jpg?v=1716787713', 1, 0, '2024-05-27 13:28:33', '2024-05-27 13:28:33'),
(20, 1, 'Gucci', 'Gucci set jewelry', 'Polar bear diamond ring, one stone earrings design, gemstone ruby, memory pendant, 9ct gold mini hoop earrings.', '', 7090359.00, 'uploads/medicines//de8b71aaa5bdf6c01060010b7c832c34.jpg_720x720q80.jpg?v=1716787913', 1, 0, '2024-05-27 13:31:53', '2024-05-27 13:31:53'),
(21, 3, 'Louis Vuitton', 'Louis Vuitton Multi Pochette', 'Louis Vuitton Multi Pochette Accessoires Crossbody Bags Handbags Purse Kaki M44813', '', 716110.00, 'uploads/medicines//hero-lux-bags-investment.jpg?v=1716788022', 1, 0, '2024-05-27 13:33:41', '2024-05-27 13:33:42'),
(22, 3, 'Dior', 'Dior Ivory Bag', 'Color Ivory\r\nMaterial Leather\r\nMaterial Details Lambskin Leather\r\nPlace Of Origin France \r\nDesigner Style ID M0505ONGE M030', '', 353756.00, 'uploads/medicines//IMG_20240526_231734.jpg?v=1716788095', 1, 0, '2024-05-27 13:34:55', '2024-05-27 13:34:55'),
(23, 3, 'Prada', 'Prada leather shoulder bag', 'Prada leather shoulder bag white', '', 211509.00, 'uploads/medicines//IMG_20240526_231721.jpg?v=1716788153', 1, 0, '2024-05-27 13:35:53', '2024-05-27 13:35:53'),
(24, 3, 'Hermes', 'Hermes shoulder bag', 'Constance is pretty nonetheless. Fashioned from smooth black suede, Hermès\' Constance shoulder bag focused on efficiency and lets the gold-tone H logo plaque speak for itself.\r\nMade in France\r\nComposition\r\nOuter: Suede 100%\r\nLining: Leather 100%', '', 456788.00, 'uploads/medicines//IMG_20240526_231703.jpg?v=1716788263', 1, 0, '2024-05-27 13:37:43', '2024-05-27 13:37:43'),
(25, 8, 'Versace', 'Versace Squared sunglasses', 'Squared sunglasses defined by geometric lines, accented with the logo at the sides.\r\nLogo\r\nFrame color: Black\r\nTemple color: Black\r\nLens color: Dark gray\r\nFrame: Acetate\r\nTemple: Acetate', '', 70000.00, 'uploads/medicines//IMG_20240526_231613.jpg?v=1716788425', 1, 0, '2024-05-27 13:40:25', '2024-05-27 13:40:25'),
(26, 8, 'Louis Vuitton', 'Louis Vuitton Sunglasses', 'The Louis Vuitton Sunglasses Cyclone Black Black is designed by fashionist The Louis Vuitton Sunglasses Cyclone Men\'s Black BlackLouis Vuitton', '', 67000.00, 'uploads/medicines//Louis-Vuitton-Sunglasses-Cyclone-Black-Black.jpg?v=1716788496', 1, 0, '2024-05-27 13:41:36', '2024-05-27 13:41:36'),
(27, 8, 'Hermes', 'Hermes Copa Mundial Frame', 'Copa Mundial Frame with 1 ICE Lens', '', 53789.00, 'uploads/medicines//s-l1200 (1).jpg?v=1716788595', 1, 0, '2024-05-27 13:43:15', '2024-05-27 13:43:15'),
(28, 8, 'Prada', 'Prada Eyewear Symbole square', 'Prada Eyewear Symbole square-frame Sunglasses - Farfetch', '', 31423.00, 'uploads/medicines//18917950_41159500_600.jpg?v=1716788646', 1, 0, '2024-05-27 13:44:06', '2024-05-27 13:44:06'),
(29, 4, 'Louis Vuitton', 'Louis Vuitton Pre-Owned x Tyler the Creator LV Trainer sneakers', 'Highlights\r\nbeige\r\nleather\r\nmonogram print\r\nround toe\r\nfront lace-up fastening\r\nlogo-embossed tongue\r\n#54 signature on the back\r\nbranded insole\r\nrubber sole\r\nmonogram flowers on the outsole\r\nThese styles are supplied by a premium and authenticated sneaker marketplace. Stocking only the most sought-after footwear, they source and curate some of the most hard to find sneakers from around the world.\r\nCondition: UNWORN, WITH TAGS. This piece is previously owned but remains unworn and in its original condition. Comes complete with its original tags attached.\r\nLearn more about what makes a product Conscious on our Conscious Criteria page\r\nComposition\r\nSole: Rubber 100%\r\nOuter: Grained Leather 100%\r\nLining: Fabric 100%', '', 221657.00, 'uploads/medicines//IMG_20240526_233434.jpg?v=1716788766', 1, 0, '2024-05-27 13:46:06', '2024-05-27 13:46:06'),
(30, 4, 'Saint Laurent', 'YSL Calfskin Leather Heels', 'Saint Laurent \r\nDimensions: Heel: 11cm\r\n100% Calfskin Leather\r\nMade in Italy\r\nDesigner Model Number: 5576620NPKK\r\nDesigner Colour: 1000', '', 275000.00, 'uploads/medicines//IMG_20240526_233420.jpg?v=1716788857', 1, 0, '2024-05-27 13:47:37', '2024-05-27 13:47:37'),
(31, 4, 'Rene Caovilla', 'Rene Caovilla butterflies crystal heels', 'Rene Caovilla refreshes the brand-signature spiral silhouette with delicate butterflies crystal embellishments. Set atop 105mm stiletto heels, this glamorous style is made from satin and has leather trims.\r\nToe shape: round open toe\r\nTrim: crystals\r\nLining: leather\r\nSole: leather insole and sole\r\nComes with a box\r\nDesigner color name: Gold\r\nClosure: ankle strap\r\nMade in Italy\r\nUpper: fabric\r\nComes with dust bag\r\nComes with extra heel tips\r\nItem number: P00740762', '', 84679.00, 'uploads/medicines//IMG_20240526_233357.jpg?v=1716788951', 1, 0, '2024-05-27 13:49:11', '2024-05-27 13:49:11'),
(32, 4, 'Prada', 'Prada leather boots', 'Dimensions: Heel: 6cm, Height: 19.5cm, Platform: 4.5cm\r\n100% Calf Leather, 100% Nylon, 100% Rubber\r\nMade in Italy\r\nDesigner Model Number: 2UE007FD0023L09\r\nDesigner Colour: F0002', '', 66517.00, 'uploads/medicines//IMG_20240526_233337.jpg?v=1716789023', 1, 0, '2024-05-27 13:50:23', '2024-05-27 13:50:23'),
(33, 4, 'Gucci', 'Gucci crystal GG pattern heels', 'A true testament to the legacy of Gucci, these mules present a playful twist on iconic house codes. Made in Italy with mesh uppers, this style features a crystal GG pattern and has open toes.\r\nToe shape: round open toe\r\nUpper: fabric\r\nComes with extra heel tips\r\nTrim: leather\r\nSole: leather insole and sole\r\nComes with a box\r\nMade in Italy\r\nComes with dust bags', '', 223688.00, 'uploads/medicines//IMG_20240526_233321.jpg?v=1716789119', 1, 0, '2024-05-27 13:51:59', '2024-05-27 13:51:59'),
(34, 7, 'Versace', 'White-Silver dial with Versace logo Watch', 'An elegant jewelry timepiece characterised by a Greca bracelet with studs. The case is detailed with a three-dimensional Medusa at 12 o\'clock. All Versace watches are guaranteed by the \'Swiss Made\' marking.\r\nCase: IP5N case with studs on the top ring\r\nDial: White-Silver dial with Versace logo and Medusa at 12h / Stud indexes at 3h, 6h, and 9h\r\nBracelet: IP5N Greca bracelet with studs and butterfly buckle\r\nMovement: RONDA 1032.3 Swiss Quartz 2-hands movement\r\nWater Resistant: 5 ATM\r\nItem: PVE7A002-P0023_RTU_TU', '', 50030.00, 'uploads/medicines//IMG_20240526_235312.jpg?v=1716789305', 1, 0, '2024-05-27 13:55:05', '2024-05-27 13:55:05'),
(35, 7, 'Fendi', 'Fendi leather watch', 'Dimensions and specifications\r\nStainless Steel, Leather\r\nMade in Switzerland\r\nDesigner Model Number: ZEGAREKGUYA126581A', '', 107482.00, 'uploads/medicines//IMG_20240526_235303.jpg?v=1716789411', 1, 0, '2024-05-27 13:56:51', '2024-05-27 13:56:51'),
(36, 7, 'Chanel', 'CHANEL Pre-Owned 1990-2000 pre-owned Camélia pearl 23mm', 'The Camélia is an enduring symbol, introduced by Coco Chanel herself. It’s said that the motif comes from her admiration for Alexandre Dumas’ novel ‘La Dame aux Camélias’. The flower blossoms on this 1990-2000 pre-owned Camélia pearl 23mm, its case sculpted as the flower and encrusted with sparkling crystals.\r\nMade in France\r\nHighlights\r\ncirca 1990-2000\r\n23mm\r\n18kt white gold\r\nindex hands\r\ncrystal index\r\nlogo stamp to the front\r\nround face\r\nrhinestone embellishment\r\nhinged lid\r\npush-lock fastening\r\nThis item comes with an original Chanel authenticity card.\r\nSize: 23mm', '', 236147.00, 'uploads/medicines//IMG_20240526_235251.jpg?v=1716789507', 1, 0, '2024-05-27 13:58:27', '2024-05-27 13:59:56'),
(37, 7, 'Louis Vuitton', 'Line	Tambour Model Q132L', 'Design\r\nType:	Wristwatch\r\nGender:	Women\r\nMaterial (Case):	Yellow gold\r\nMaterial (Band):	\r\nLeather Leather/Fur Type:	Enamel Leather\r\nColor (Band):	White\r\nColor (Dial):	White shell\r\nGemstone:	Diamond\r\n\r\nMovement:	Quartz', '', 278402.00, 'uploads/medicines//IMG_20240526_235238.jpg?v=1716789712', 1, 0, '2024-05-27 14:01:52', '2024-05-27 14:01:52'),
(38, 7, 'Fendi', 'Calf Leather Watch', 'Dimensions and specifications\r\nCalf Leather, Glass\r\nMade in Switzerland\r\n\r\nDesigner Model Number: FOW974A2YG\r\nDesigner Colour: F0QZ1', '', 49679.00, 'uploads/medicines//IMG_20240526_235217.jpg?v=1716789847', 1, 0, '2024-05-27 14:04:07', '2024-05-27 14:04:07'),
(39, 7, 'Geneva', 'Geneva Quartz Watch', '100% Brand New, High Quality., Product: Quartz Watch, Style: Fashion & Casual, Movement: Quartz, Case Shape: Round, Band \r\n', '', 110000.00, 'uploads/medicines//IMG_20240526_235202.jpg?v=1716789946', 1, 0, '2024-05-27 14:05:46', '2024-05-27 14:05:46'),
(40, 6, 'Saint Laurent', 'Yves Saint Laurent - Libre Eau De Parfum Spray', 'Yves Saint Laurent\r\nYves Saint Laurent - Libre Eau De Parfum Spray 90ml/3oz\r\n\r\n', '', 9262.00, 'uploads/medicines//IMG_20240527_002523.jpg?v=1716790522', 1, 0, '2024-05-27 14:15:22', '2024-05-27 14:15:22'),
(41, 6, 'Prada', 'Prada  Ambrofix, Bourbon Vanilla perfume', 'prada \r\nThis is a new fragrance. Prada Paradoxe Intense was launched in 2023. Prada Paradoxe Intense was created by Nadège Le Garlantezec, Shyamala Maisondieu, and Antoine Maisondieu.\r\n\r\nTop notes are Pear, Neroli, and Bergamot;\r\nMiddle notes are Jasmine, Moss, and Neroli Essence;\r\nBase notes are Ambrofix, Bourbon Vanilla, Vanilla, Serenolide and Amber\r\n', '', 11209.00, 'uploads/medicines//IMG_20240527_002509.jpg?v=1716790684', 1, 0, '2024-05-27 14:18:04', '2024-05-27 14:32:03'),
(42, 6, 'Bvlgari', ' BVLGARI Omnia Crystalline Eau de Toilette', 'Experience the pure elegance of BVLGARI Omnia Crystalline Eau de Toilette, an iconic fragrance by Master Perfumer Alberto Morillas. Inspired by the clarity of crystal and the aquatic beauty of Lotus Flower, this delicate scent unveils layers of freshness and warmth, culminating in a mesmerizing allure.\r\n\r\nEmbrace the timeless allure of Omnia Crystalline: where purity meets sophistication!\r\n\r\nWhat is the story of the BVLGARI Omnia Crystalline perfume?\r\n\r\nBVLGARI Omnia Crystalline Eau de Toilette embodies the pure essence of crystal clarity. Inspired by the ethereal beauty of the Lotus Flower and the crisp freshness of White Peony, this delicate fragrance evolves through layers of aqueous notes, crunchy Nashi Pear, and the verdant essence of Bamboo. Its journey culminates in the comforting warmth of Balsa Wood, enveloped by a subtle accord of Crystal Musks.\r\n', '', 7399.00, 'uploads/medicines//IMG_20240527_002421.jpg?v=1716790805', 1, 0, '2024-05-27 14:20:05', '2024-05-27 14:31:29'),
(43, 6, 'Chanel', 'Coco Mademoiselle Eau de Parfum', 'Coco Mademoiselle Eau de Parfum is inspired by the fascinating personality of Gabrielle Chanel.\r\n\r\nThis fragrance is an olfactory reflection of a beautiful and independent mind, breaking the rules and creates new guidelines.\r\n\r\nThe portrait of a boldly intelligent woman ready to write her own destiny!\r\n\r\nFresh, sexy and oriental fragrance, that recalls the irrepressible spirit of the young \"Coco\" Chanel.\r\n\r\nPowerful, concentrated and long-lasting, this fragrance, is the ultimate expression of the art of the perfumer.\r\n\r\nThe classic bottle represents a luxury and elegant way of express yourself using an scent.\r\n', '', 34566.00, 'uploads/medicines//IMG_20240527_002650.jpg?v=1716791076', 1, 0, '2024-05-27 14:24:36', '2024-05-27 14:31:44'),
(44, 6, 'Dior', 'Miss Dior Eau de Parfum', 'Miss Dior Eau de Parfum reinterprets the invitation to all women to surrender to love and enjoy the natural beauty of the world around them.\r\nA new inspiration of love and optimism! #wakeupforlove\r\nA floral bouquet \"millefiori\", a true awakening to the senses, has in its heart, the Rose of Grasse which is synonymous with happiness and renewal.\r\nThe iconic \"Miss Dior knot\" was also reinvented. For months, a jacquard ribbon was made woven with about 396 threads, in traditional looms, in a handmade way to recreate creativity and unique attention to detail as if it were the creation of a dress of \"red carpet\"\r\n\r\n', '', 47500.00, 'uploads/medicines//IMG_20240527_002606.jpg?v=1716791234', 1, 0, '2024-05-27 14:27:14', '2024-05-27 14:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `quantity` float(12,2) NOT NULL DEFAULT 0.00,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `code`, `quantity`, `date_created`, `date_updated`) VALUES
(1, 2, 'Asd87A546', 12.00, '2023-01-30 10:24:29', '2024-05-27 14:37:28'),
(2, 1, 'SDA12312', 50.00, '2023-01-30 10:25:22', '2023-01-30 10:25:22'),
(4, 4, '878751A122', 15.00, '2023-01-30 10:26:03', '2024-05-27 14:36:44'),
(5, 5, 'FAD78885', 10.00, '2023-01-30 10:26:22', '2024-05-27 14:36:25'),
(6, 6, '879ASC', 80.00, '2023-01-30 10:26:34', '2023-01-30 10:26:34'),
(7, 7, '879SAC878', 10.00, '2023-01-30 10:26:48', '2024-05-27 14:48:24'),
(8, 8, 'LEST123454', 75.00, '2023-01-30 10:27:04', '2023-01-30 10:27:04'),
(9, 9, 'f8', 10.00, '2024-05-25 10:00:29', '2024-05-25 10:00:29'),
(10, 42, '', 7.00, '2024-05-27 14:32:43', '2024-05-27 14:32:43'),
(11, 36, '4773j', 13.00, '2024-05-27 14:34:28', '2024-05-29 15:04:23'),
(12, 43, 'dju322', 5.00, '2024-05-27 14:34:54', '2024-05-27 14:34:54'),
(13, 19, 'dhwuu2882', 2.00, '2024-05-27 14:35:16', '2024-05-27 14:35:16'),
(14, 13, '54nd77', 11.00, '2024-05-27 14:35:48', '2024-05-29 14:58:33'),
(15, 11, 'dhwu9kf', 7.00, '2024-05-27 14:36:07', '2024-05-27 14:36:07'),
(16, 22, 'es6784', 13.00, '2024-05-27 14:37:13', '2024-05-29 15:04:36'),
(17, 44, 'gguj7789', 3.00, '2024-05-27 14:39:03', '2024-05-27 14:39:03'),
(18, 16, 'sdfghj56', 5.00, '2024-05-27 14:39:37', '2024-05-27 14:39:37'),
(19, 38, 'wertb347', 5.00, '2024-05-27 14:40:25', '2024-05-27 14:40:25'),
(20, 35, 'axcvbnm22345', 4.00, '2024-05-27 14:40:59', '2024-05-27 14:40:59'),
(21, 39, 'mjf3467', 3.00, '2024-05-27 14:41:38', '2024-05-27 14:41:38'),
(22, 15, 'mdieik22', 2.00, '2024-05-27 14:42:12', '2024-05-27 14:42:12'),
(23, 33, 'kksue23', 5.00, '2024-05-27 14:42:57', '2024-05-27 14:42:57'),
(24, 12, '2djakl', 9.00, '2024-05-27 14:43:27', '2024-05-27 14:43:27'),
(25, 20, '54nd748999', 2.00, '2024-05-27 14:44:13', '2024-05-27 14:44:13'),
(26, 26, 'dhwuu288eje', 4.00, '2024-05-27 14:44:38', '2024-05-27 14:44:38'),
(27, 29, 'dju322duiiakk', 7.00, '2024-05-27 14:44:59', '2024-05-27 14:44:59'),
(28, 21, 'dhwu9kfjkder', 3.00, '2024-05-27 14:45:21', '2024-05-27 14:45:21'),
(29, 37, '245798765', 4.00, '2024-05-27 14:45:44', '2024-05-27 14:45:44'),
(30, 40, 'jdor27', 5.00, '2024-05-27 14:46:29', '2024-05-27 14:46:29'),
(31, 24, 'dhdko339948', 5.00, '2024-05-27 14:46:55', '2024-05-27 14:46:55'),
(32, 18, '748dhgmc', 5.00, '2024-05-27 14:47:21', '2024-05-27 14:47:21'),
(33, 27, 'cskke9394', 6.00, '2024-05-27 14:47:43', '2024-05-27 14:47:43'),
(34, 30, 'dhwuuaud', 7.00, '2024-05-29 14:59:06', '2024-05-29 14:59:06'),
(35, 31, 'dhw882mdk', 9.00, '2024-05-29 14:59:30', '2024-05-29 14:59:30'),
(36, 23, 'jdjsweiiw92', 9.00, '2024-05-29 14:59:45', '2024-05-29 14:59:45'),
(37, 32, 'sjjekw7828nd', 10.00, '2024-05-29 15:00:02', '2024-05-29 15:00:02'),
(38, 28, 'sjjwem892', 12.00, '2024-05-29 15:00:17', '2024-05-29 15:00:17'),
(39, 41, 'mfrkk3894', 14.00, '2024-05-29 15:01:05', '2024-05-29 15:01:05'),
(40, 17, 'dkwki392', 5.00, '2024-05-29 15:01:23', '2024-05-29 15:01:23'),
(41, 10, 'nfei8402ms', 15.00, '2024-05-29 15:01:41', '2024-05-29 15:01:41'),
(42, 34, 'krtko39759m', 10.00, '2024-05-29 15:02:10', '2024-05-29 15:02:10'),
(43, 25, 'ejudrjh48', 18.00, '2024-05-29 15:02:30', '2024-05-29 15:02:30'),
(44, 14, 'fkeii3389', 17.00, '2024-05-29 15:02:46', '2024-05-29 15:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `stock_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Ornate Elegance World Store'),
(6, 'short_name', 'OEWS'),
(11, 'logo', 'uploads/logo.png?v=1716967177'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1716612226'),
(17, 'phone', '012-345-6789'),
(18, 'mobile', '09123456789'),
(19, 'email', 'ornatelegance@oews.com'),
(20, 'address', '10101 New Visayas, Panabo City');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1716604570', NULL, 1, '2021-01-20 14:02:37', '2024-05-25 10:36:10'),
(8, 'Claire', '', 'Blake', 'cblake', 'cd74fae0a3adf459f73bbf187607ccea', 'uploads/avatars/8.png?v=1675047323', NULL, 2, '2023-01-30 10:55:23', '2023-01-30 10:55:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_list`
--
ALTER TABLE `customer_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_list`
--
ALTER TABLE `customer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `customer_id_fk_cl` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_cl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_id_fk_oi` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_oi` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `customer_id_fk_ol` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id_fk_pl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `product_id_fk_sl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `order_id_fk_so` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `stock_id_fk_so` FOREIGN KEY (`stock_id`) REFERENCES `stock_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
