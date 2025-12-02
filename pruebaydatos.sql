-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db:3306
-- Tiempo de generación: 24-09-2025 a las 18:50:15
-- Versión del servidor: 8.0.41
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `is_default` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blacklisted_tokens`
--

CREATE TABLE `blacklisted_tokens` (
  `id` bigint NOT NULL,
  `token` varchar(768) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `blacklisted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `blacklisted_tokens`
--

INSERT INTO `blacklisted_tokens` (`id`, `token`, `expires_at`, `blacklisted_at`) VALUES
(1, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQ1VTVE9NRVIiLCJpZCI6MywiZW1haWwiOiJ1c3VhcmlvM0BnbWFpbC5jb20iLCJ1c2VybmFtZSI6InVzdWFyaW8zIiwiaWF0IjoxNzU4MTQ4NDg1LCJleHAiOjE3NTgyMzQ4ODV9.RF_nte8l_YAKP2hF8I3xYlBjT7LkSOIcAq3dhDf9xIrqzfugTlnaOaGLoA_Uv9n00jh5nwPeZFR6M6-KC9Z-PQ', '2025-09-19 00:35:02', '2025-09-18 00:35:02'),
(2, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQ1VTVE9NRVIiLCJpZCI6MSwiZW1haWwiOiJ1c3VhcmlvX3Rlc3QyQGV4YW1wbGUuY29tIiwidXNlcm5hbWUiOiJ1c3VhcmlvX3Rlc3QyIiwiaWF0IjoxNzU4MTkxMzA1LCJleHAiOjE3NTgyNzc3MDV9.9XTyZwNDHpt111H1XdGjVSf-7GDtfMvVEeetORsok0rM_s-SB5HubzYKh3KUrl36xrMxjsWfjHxsi8EwUHaBUw', '2025-09-19 12:28:57', '2025-09-18 12:28:57'),
(3, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQ1VTVE9NRVIiLCJpZCI6MSwiZW1haWwiOiJ1c3VhcmlvX3Rlc3QyQGV4YW1wbGUuY29tIiwidXNlcm5hbWUiOiJ1c3VhcmlvX3Rlc3QyIiwiaWF0IjoxNzU4MTkyMjMyLCJleHAiOjE3NTgyNzg2MzJ9.pNimKnVk7lDzBH6QhY-5NES16JItN721moYyg2MoI6gix7QJJelwcZVDxCBvDJzNFKY4bUZiXTQgYwiVDZgtYQ', '2025-09-19 12:45:52', '2025-09-18 12:45:52'),
(4, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQ1VTVE9NRVIiLCJpZCI6MSwiZW1haWwiOiJ1c3VhcmlvX3Rlc3QyQGV4YW1wbGUuY29tIiwidXNlcm5hbWUiOiJ1c3VhcmlvX3Rlc3QyIiwiaWF0IjoxNzU4MTkyMzY4LCJleHAiOjE3NTgyNzg3Njh9.bbb2FDo1T147nk3mrDKBBzoKKjOZHCrp-fTbYG03XsXZ3BrgSTvBD86yCGHzJ0-YH7wBVl9N-37Q_tfQLu_uWg', '2025-09-19 12:48:13', '2025-09-18 12:48:13'),
(5, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQ1VTVE9NRVIiLCJpZCI6MSwiZW1haWwiOiJ1c3VhcmlvX3Rlc3QyQGV4YW1wbGUuY29tIiwidXNlcm5hbWUiOiJ1c3VhcmlvX3Rlc3QyIiwiaWF0IjoxNzU4MTk1NDg3LCJleHAiOjE3NTgyODE4ODd9.aHG8nLOX-yp6Lgh1USyRdijeOai98-_0UD8dm1LeXaLRePS2J8vm_ZAGdwxHGL4yYTcObbvVQu-B-L5W9enYCw', '2025-09-19 13:40:07', '2025-09-18 13:40:07'),
(6, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQURNSU4iLCJpZCI6MiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNzU4MjIwNzU4LCJleHAiOjE3NTgzMDcxNTh9.U4k4-HAUeZ67wbHZ8cd8pGUjoJ5BapO6-lAG-ZqcmHzeNE4gluFE8vHD3SeqY_2NpjE6PF67FeeH7WXgQsrf9g', '2025-09-19 20:40:40', '2025-09-18 20:40:40'),
(7, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQURNSU4iLCJpZCI6MiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNzU4MzA3NDYyLCJleHAiOjE3NTgzOTM4NjJ9.PjZSnSTwYR2ejP_feWcfbpqW22QHT4jQoC7-EUIPmn3RUbjnFs-bm1Orlskri3XvIKJ3JAZr3-8nazCZFJInwA', '2025-09-20 20:58:11', '2025-09-19 20:58:11'),
(8, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQURNSU4iLCJpZCI6MiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNzU4MzA4NDg1LCJleHAiOjE3NTgzOTQ4ODV9.WyHK-9Ak3EgJg6Y2ZQuMi0G78Q7rDuj5tEsHoHNr3YOK1V1uX0fcVbCD90g_HTgJ_vfYi1HNeWjwkrgHDcI2RA', '2025-09-20 21:18:30', '2025-09-19 21:18:30'),
(9, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQURNSU4iLCJpZCI6MiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNzU4NTQ3MzMwLCJleHAiOjE3NTg2MzM3MzB9.4pBPy_AEtyhlfYEJlu13IP7AdKnrKMy6edeTljFQ5Sqk-MnX22Z9tHG20v-IJg--DM5c63z5I98JmcOhKY3QPg', '2025-09-23 21:04:17', '2025-09-22 21:04:17'),
(10, 'eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6IlJPTEVfQURNSU4iLCJpZCI6MiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNzU4NTY4NDY2LCJleHAiOjE3NTg2NTQ4NjZ9.J5InE5OTqH6ifCMC1asDVCiInx685IE3jSgfiERM3w716dsV19pxX5q_GMqDZ5hzckXUqVhQq2o9nTcGpeWyHA', '2025-09-23 21:14:38', '2025-09-22 21:14:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `logo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `logo_url`) VALUES
(1, 'adidas', 'Marca alemana de ropa deportiva', NULL),
(2, 'Nike', 'Marca estadounidense de ropa deportiva', NULL),
(3, 'Dr. Martens', 'Marca británica de calzado', NULL),
(4, 'Rick Owens', 'Marca de diseñador de lujo', NULL),
(5, 'Crocs', 'Marca de calzado casual', NULL),
(6, 'New Balance', 'Marca estadounidense de calzado deportivo', NULL),
(7, 'Converse', 'Marca estadounidense de zapatillas', NULL),
(8, 'Asics', 'Marca japonesa de calzado deportivo', NULL),
(9, 'Comme des Garçons Play', 'Marca japonesa de moda', NULL),
(10, 'Jordan', 'Submarca de Nike para baloncesto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

CREATE TABLE `carts` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2025-09-18 12:28:26', '2025-09-18 12:28:26'),
(2, 2, NULL, '2025-09-18 13:40:29', '2025-09-18 13:40:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_variant_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `parent_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `parent_id`) VALUES
(1, 'Lifestyle', 'Zapatillas para uso diario', NULL),
(2, 'Running', 'Zapatillas para correr', NULL),
(3, 'Botas', 'Calzado tipo bota', NULL),
(10, 'Retro', 'Zapatillas de estilo retro', NULL),
(14, 'Sandalias', 'Calzado abierto tipo sandalia', NULL),
(15, 'Edición Limitada', 'Productos de colección limitada', NULL),
(21, 'sdf', 'sdfmitada', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `address_id` bigint NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('PENDING','PAID','SHIPPED','DELIVERED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `payment_method` varchar(50) NOT NULL,
  `shipping_method` varchar(50) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tracking_number` varchar(100) DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `product_variant_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `token` varchar(768) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `used` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` enum('PENDING','COMPLETED','FAILED','REFUNDED') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `brand_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1',
  `featured` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `discount_price`, `brand_id`, `category_id`, `created_at`, `updated_at`, `active`, `featured`) VALUES
(43, 'Samba OG - Leopard', 'Para la temporada primavera/verano 2025, adidas presenta las Samba OG \"Cheetah Pack\" para mujer, una reinterpretación salvaje del clásico modelo de la marca. Este pack incluye dos diseños, ambos con una parte superior de piel con estampado de guepardo y toques de color en contraste. La versión JI2734, con colorway Preloved Red Leopard, luce cordones y forro interior de un naranja intenso, talón, lengüeta y franjas laterales en blanco y suela exterior marrón.', 130.00, NULL, 1, 10, '2025-06-11 12:20:16', '2025-06-12 12:59:36', 1, 1),
(45, 'Air Max 95 OG', 'Nike Air Max 95 OG \"Bright Mandarin\" - HM4740-005\nDesde sus inicios en los años 60, Nike ha revolucionado el mundo del deporte y la moda con su visión innovadora y atrevida. Presentamos las exclusivas Air Max 95 OG \"Bright Mandarin\" (HM4740-005), una verdadera joya dentro de la categoría de edición limitada. Perfectas para chicos modernos, estos icónicos sneakers brillan con su colorway Black/Bright Mandarin-Cool Grey, haciendo de ellas la elección ideal para la temporada de verano de 2025.', 190.00, 143.00, 2, 15, '2025-06-11 13:53:00', '2025-09-22 20:45:56', 1, 1),
(46, 'Handball Spezial', 'adidas, nacida en Alemania, comenzó su andadura en el mundo del deporte con una visión innovadora. Actualmente, sigue liderando con estilo. Descubre las Women\'s Handball Spezial (JP8726), unas zapatillas clásicas y retro que llegan en el deslumbrante color Maroon para la temporada otoño/invierno 2025. Son perfectas y atemporales.', 110.00, 99.00, 1, 10, '2025-06-11 13:54:19', '2025-09-22 20:44:06', 1, 0),
(47, '1460 x thisisneverthat®', 'Desde sus inicios en 1947, Dr. Martens ha sido sinónimo de libertad de expresión y resistencia. Con una fusión audaz y sofisticada, las botas \"1460 x thisisneverthat® (32181523)\" ofrecen un estilo único en la categoría de botas de edición limitada. Con un diseño para hombre y mujer, estas marrón oscuro son perfectas para la temporada primavera 2025.', 210.00, NULL, 3, 3, '2025-06-11 14:00:15', '2025-06-12 12:59:32', 1, 0),
(48, '8 Eye Boots', 'Desde su creación en el corazón de Inglaterra, Dr. Martens ha revolucionado el mundo del calzado con su enfoque único en la durabilidad y el estilo distintivo. Su visión ha sido llevar a cada persona la libertad de autoexpresión a través de sus icónicos modelos.\r\n\r\nPresentamos las Dr. Martens 1460 (8-Eye Boots) para la temporada otoño/invierno 2023, unas botas que combinan a la perfección la tradición con la moda actual. Este modelo, ampliamente reconocido y venerado, ha dejado huella en la cultura pop gracias a su singular estilo y robusta fabricación. En color negro, estas botas se adaptan a cualquier look, convirtiéndose en un imprescindible en tu armario. Descubre el auténtico espíritu rebelde de Dr. Martens y marca la diferencia.', 200.00, NULL, 3, 3, '2025-06-11 14:01:55', '2025-06-12 13:25:19', 1, 1),
(49, 'Mega Bumper Sneakers', 'El estilo de Rick Owens es inconfundible. El diseñador de Los Ángeles refleja sus inquietudes sobre el mundo y la sociedad en prendas de proporciones exageradas que unen estilo glamour y grunge a la vez, lo que él mismo define glunge. Cada colección Rick Owens cuenta con ropa, zapatos y accesorios que huyen de las tendencias de la moda para convertirse en objetos esculturales, vanguardistas y de lujo.', 920.00, NULL, 4, 3, '2025-06-11 14:04:27', '2025-06-12 13:25:19', 1, 1),
(50, 'Beatle Turbo Cyclops Leather Boots', 'Ya puedes comprar en sivasdescalzo el modelo Beatle Turbo Cyclops Leather Boots de la firma Rick Owens que pertenece a la colección FA2023. ¿A qué esperas? Parte superior de piel, paneles elásticos, forro de piel, suela de goma, presilla en el talón.', 1605.00, NULL, 4, 3, '2025-06-11 14:05:36', '2025-06-12 13:25:19', 1, 1),
(52, 'ISPA Universal', 'Compra ya en sivasdescalzo el modelo ISPA Universal de la marca Nike de la temporada FA2023. ¡No dejes escapar esta oportunidad!', 80.00, 72.00, 2, 14, '2025-06-11 15:50:28', '2025-09-22 20:46:19', 1, 1),
(53, 'Adilette Slides x Wales Bonner', 'Adidas, nacida en Alemania, lleva décadas liderando el mundo del deporte con su enfoque en calidad e innovación. Presentamos las Adilette Slides x Wales Bonner (JR0229) en marrón oscuro. Este modelo edición limitada es la elección perfecta para el hombre que busca estilo durante el verano 2025.', 350.00, NULL, 1, 14, '2025-06-11 15:59:06', '2025-06-12 13:25:19', 1, 1),
(54, 'Classic Mega Crush Clog', 'Desde su fundación, Crocs ha revolucionado el mundo del calzado con su enfoque en la comodidad y la innovación. Originaria de Estados Unidos, la marca busca ofrecer diseños únicos que se adapten a cada estilo de vida.\r\n\r\nDescubre el increíble Classic Mega Crush Clog de Crocs para la temporada de primavera/verano 2025. Este modelo, conocido por su popularidad y características excepcionales, es perfecto para aquellos que buscan combinar estilo y comodidad en sus sandalias y chanclas. En un vibrante color rosa, esta pieza no solo destaca por su diseño moderno, sino que también ofrece la ligereza y el soporte característicos de Crocs.', 95.00, NULL, 5, 14, '2025-06-11 16:05:18', '2025-06-16 07:48:13', 1, 0),
(55, '1000', 'Desde sus humildes comienzos en Boston, New Balance ha destacado por fusionar tradición con innovación, creando zapatillas que trascienden el tiempo. Te presentamos las New Balance 1000 (M1000BBV) para hombre, un modelo de zapatillas clásicas y retro cuyo colorway en Black las dota de un aura única para la temporada primavera/verano 2025.', 170.00, NULL, 6, 10, '2025-06-11 16:19:39', '2025-06-16 07:48:14', 1, 0),
(56, 'Chuck 70 HI', 'Ya disponible el modelo CHUCK 70 HI de la firma converse que forma parte de la campaña Fall Winter 2018.', 95.00, NULL, 7, 10, '2025-06-11 16:33:20', '2025-06-16 07:48:14', 1, 0),
(57, 'Pegasus Plus', 'Nike, un gigante en el mundo del deporte y el estilo, nos sorprende una vez más con su visión innovadora y diseño impecable. Presentamos las zapatillas running Nike Pegasus Plus (FQ7262-101) para hombre, luciendo unos llamativo colorways. Para la temporada verano 2025, estas zapatillas prometen comodidad y estilo insuperable.', 180.00, NULL, 2, 2, '2025-06-11 16:37:51', '2025-06-16 07:48:14', 1, 0),
(58, 'ZoomX Invincible Run FK 3', 'Descubre la innovación y el legado de Nike con las Zapatillas Running Nike ZoomX Invincible Run Flyknit 3. Esta temporada de Otoño/Invierno 2024 trae consigo lo último en tecnología y comodidad para tus carreras. Con un diseño en Negro que se adapta a cualquier estilo, estas zapatillas son perfectas para mejorar tu rendimiento y disfrutar al máximo de tus entrenamientos. Ya sea que seas un corredor experimentado o estés empezando en el mundo del running, las Nike ZoomX Invincible Run Flyknit 3 son la opción ideal para ti.', 190.00, 152.00, 2, 2, '2025-06-11 16:40:06', '2025-09-22 20:45:01', 1, 0),
(59, 'Gel-Kayano 32 ', 'Desde su creación en Japón, Asics ha sido sinónimo de innovación y calidad en el mundo del deporte. Con su visión de mejorar el rendimiento atlético global, presentan las Asics Gel-Kayano 32 (1011C052-001). Perfectas para la temporada otoño/invierno 2025, estas zapatillas running, con su estilizada colorway Black/Graphite Grey, son ideales para el hombre que busca estilo y rendimiento.', 200.00, NULL, 8, 2, '2025-06-11 16:44:10', '2025-06-16 07:48:14', 1, 0),
(60, 'Adizero Adios Pro 4', 'Desde su creación en Alemania, adidas ha sido un pionero en el mundo del deporte, combinando innovación y estilo. Ahora, te presentamos las Adizero Adios Pro 4 (JR6366) para hombre, perfectas para tus carreras más exigentes. Con su diseño elegante en blanco y su lanzamiento para la temporada otoño/invierno 2025, este modelo te asegurará destacar en cada zancada.', 250.00, NULL, 1, 2, '2025-06-11 16:47:56', '2025-06-16 07:48:14', 1, 0),
(61, 'Superstar Modified x Avavav', 'Desde sus humildes comienzos en Alemania, adidas ha revolucionado el mundo del deporte con sus diseños icónicos y visión innovadora. Ahora, presenta la Superstar Modified x Avavav (JI4585), una auténtica joya de la edición limitada para mujer. Con su colorway Core Black y pensada para la temporada primavera/verano 2025, esta zapatilla captura la esencia de lo urbano y lo sofisticado.', 280.00, NULL, 1, 15, '2025-06-11 17:02:37', '2025-06-11 17:02:37', 1, 0),
(62, 'Big Heart Chuck 70 Hi x Converse', 'Rei Kawakubo ha creado todo un imperio de moda bajo la etiqueta Comme des Garçons. Y con ella, varias relaciones creativas que han servido para desarrollar piezas claves de estilo.\r\nEs el caso de estas Chuck 70 Hi, una de las zapatillas más codiciadas de Converse diseñadas bajo la estética de PLAY, la línea atemporal de la firma japonesa.\r\nConfeccionadas con lona duradera, puntera y suela de goma tonal, y el peculiar corazón con ojos, imaginado por el artista gráfico Filip Pagowski. Estas sneakers son todo un referente de moda, desde París hasta Nueva York.', 150.00, NULL, 9, 15, '2025-06-11 17:04:09', '2025-06-12 12:01:31', 1, 0),
(64, 'Adizero EVO SL', 'Adidas, nacida en Alemania, ha sido un pilar en la industria del deporte desde su fundación, combinando innovación y diseño con una visión clara de excelencia.\r\n\r\nPresentamos las Adizero EVO SL de adidas para la temporada primavera/verano 2025. El modelo adidas Adizero lleva tiempo siendo sinónimo de velocidad y rendimiento, aclamado tanto por atletas profesionales como por entusiastas del running. Estas zapatillas running en color negro son la combinación perfecta de estilo y funcionalidad, diseñadas para quienes buscan batir sus propios récords con comodidad y elegancia.', 150.00, NULL, 1, 2, '2025-06-15 19:26:42', '2025-09-22 15:10:02', 1, 1),
(65, 'Shox TL', 'El modelo Nike Shox fue creado para quienes buscan confort en cada paso, fusionando un diseño inspirado en el retro con tecnología avanzada. Concebido para el día a día, destaca por sus icónicas columnas de amortiguación que ofrecen un impacto suave y una pisada estable en cualquier terreno.', 180.00, 153.00, 2, 1, '2025-06-18 17:58:55', '2025-09-22 20:44:38', 1, 1),
(66, 'Campus 00s', 'El modelo adidas Campus 00 es ideal para el estilo de vida urbano, inspirado en las líneas retro de los años 80. Su diseño atemporal y refinado está pensado para combinar confort y estilo, manteniéndose vigente en las tendencias actuales y siendo una elección segura para los amantes de la moda clásica.', 120.00, NULL, 1, 1, '2025-06-18 18:06:27', '2025-09-22 15:10:01', 1, 1),
(67, 'Superstar II', 'Las icónicas adidas Superstar II aterrizan en la temporada primavera 2025 y prometen conquistar a todos. Este modelo legendario, adorado por su diseño atemporal y comodidad, se viste de blanco impecable, ofreciendo un toque fresco y sofisticado. Perfectas para los amantes de las zapatillas clásicas y retro, son un must-have en cualquier colección.', 120.00, NULL, 1, 1, '2025-06-18 18:21:02', '2025-09-22 15:10:00', 1, 1),
(68, 'Air Jordan 1 High OG', 'Lanzadas originalmente en 1985, las Air Jordan 1 son un emblema del estilo de vida urbano. Inspiradas en el legado del baloncesto, presentan un diseño retro que abraza lo clásico y lo moderno. Sus características principales incluyen una parte superior de cuero premium y una suela que garantiza tracción y comodidad en cada paso.', 190.00, NULL, 10, 1, '2025-06-18 18:25:49', '2025-09-22 15:10:00', 1, 1),
(69, '2976 \"Protection Pack\"', 'Dr. Martens es una marca icónica que ha estado marcando tendencia desde 1947. Con una rica historia en diseño de calzado de alta calidad, Dr. Martens se ha convertido en sinónimo de estilo duradero. ¡Prepárate para el Otoño/Invierno 2024 con las Botas 2976 Protect de Dr. Martens en color negro! Este modelo clásico es conocido por su comodidad y resistencia, perfecto para tus aventuras diarias. Ya sea para un look casual o más sofisticado, estas botas son la opción ideal para cualquier ocasión.', 310.00, NULL, 3, 3, '2025-06-18 18:29:19', '2025-09-22 15:10:00', 1, 1),
(70, 'Air Jordan 4 Retro \"White Cement\"', 'Diseñado originalmente para el baloncesto, el modelo Air Jordan 4 fusiona funcionalidad con estilo retro. Caracterizado por sus alas laterales y su sistema de amortiguación visible, ofrece un soporte insuperable y comodidad para el uso diario. Un verdadero emblema de la cultura sneaker.', 210.00, NULL, 10, 15, '2025-06-18 18:41:08', '2025-09-22 15:09:59', 1, 1),
(72, 'Samba OG x Liberty London', 'Las adidas Samba son un clásico atemporal diseñado originalmente para el fútbol, pero con un atractivo universal para el estilo de vida diario. Inspiradas en los estilos retro, estas zapatillas destacan por su versatilidad, suela de goma adherente y un diseño que combina funcionalidad y moda. Perfectas para cualquier ocasión.', 130.00, NULL, 1, 15, '2025-06-18 18:53:34', '2025-09-22 20:43:42', 1, 1),
(73, 'Air Jordan 4 Retro \"Cave Stone\"', 'El modelo Air Jordan 4, diseñado inicialmente por Tinker Hatfield, es conocido por su integración de malla y detalles en plástico que ofrecen comodidad y ventilación. Inspirado en el baloncesto, se ha convertido en un icono del estilo urbano, fusionando funcionalidad con una estética innovadora perfecta para el día a día.', 210.00, NULL, 10, 15, '2025-06-18 18:29:19', '2025-09-22 20:43:11', 1, 0),
(75, 'Air Max 95 OG \"Big Bubble Fireberry\"', 'Descubre el exclusivo Air Max 95 OG \"Big Bubble Fireberry\" (II7632-600), una joya para la temporada otoño/invierno 2025. Este modelo de hombre combina el audaz color Fireberry/Fireberry-Velvet Brown, destacándose en la categoría de edición limitada. Equipadas con la tecnología Nike Air, estas zapatillas ofrecen una amortiguación superior y una comodidad sin igual, ideales para el estilo de vida moderno con un toque retro que solo Nike puede ofrecer.', 200.00, NULL, 2, 1, '2025-09-18 20:40:21', '2025-09-22 20:18:01', 1, 0),
(79, '9060', 'ste otoño/invierno 2024, New Balance nos presenta las zapatillas 9060 en un elegante color gris. Reconocidas por su silueta futurista y tecnología de rendimiento, las 9060 son una opción destacada para los amantes de la moda urbana. Diseñadas para ofrecer la máxima comodidad, estas zapatillas combinan materiales de alta calidad con un diseño innovador que refleja la evolución constante de la marca.', 190.00, NULL, 6, 1, '2025-09-22 20:15:58', '2025-09-22 20:15:58', 1, 0),
(80, 'Air Jordan 5 Retro OG', 'Déjate conquistar por las Air Jordan 5 Retro OG (HQ7978-101), un modelo que lleva el legado del diseño retro a nuevas alturas. Reimaginadas para hombre, en la temporada otoño/invierno 2025, estas zapatillas de edición limitada en tonalidad Fire Red/Black Tongue destacan por su línea icónica y silueta única. Jordan vuelve a marcar tendencia con este lanzamiento imprescindible para cualquier amante del estilo urbano sofisticado.', 210.00, NULL, 10, 10, '2025-09-22 20:17:48', '2025-09-22 20:17:48', 1, 0),
(81, 'GT-2160', 'Descubre las nuevas Asics GT-2160 (1203A952-100), unas zapatillas diseñadas para quienes exigen lo mejor. Inspiradas en la tradición de running, combinan el diseño retro con las necesidades modernas. Perfectas para ambos géneros, su colorway White/Morpho aporta un toque único. Ideales para la temporada otoño/invierno 2025, estas zapatillas son el equilibrio perfecto entre funcionalidad y tendencia. Asics redefine una vez más el concepto de elegancia deportiva.', 130.00, NULL, 8, 2, '2025-09-22 20:20:38', '2025-09-22 20:20:38', 1, 0),
(82, 'Gel-Cumulus 16', 'Descubre las Asics Gel-Cumulus 16 (1203A733-400) para hombre & mujer en un sofisticado Stone Wash/Independence Blue. Estas zapatillas de la temporada otoño/invierno 2025 destacan por su tecnología GEL, que amortigua el impacto en cada zancada, proporcionando una pisada suave y estable. El modelo Gel-Cumulus 16 está diseñado para running, pero su estética elegante lo convierte en una opción perfecta también para el día a día.', 150.00, NULL, 8, 2, '2025-09-22 20:23:50', '2025-09-22 20:23:50', 1, 0),
(83, '740 V2', 'El modelo New Balance 740 es perfecto para el estilo de vida urbano, inspirado en diseños retro que fusionan lo clásico con lo moderno. Estas zapatillas, con su silueta única y materiales premium, ofrecen una comodidad sin igual, convirtiéndolas en la opción ideal para quienes buscan un look sofisticado y casual.', 120.00, NULL, 6, 1, '2025-09-22 20:31:42', '2025-09-22 20:42:23', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `display_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_primary`, `display_order`) VALUES
(2, 45, 'http://localhost:8080/api/uploads/products/45/d91c413d-bbf1-4e15-bd30-89b563a4ee7c.png', 0, 2),
(12, 75, 'http://localhost:8080/api/uploads/products/75/5ebf5082-2992-4ee8-8adf-0086915a503d.webp', 1, 1),
(18, 75, 'http://localhost:8080/api/uploads/products/75/beb0f0bd-48fb-4363-9774-d0623d17606f.webp', 0, 2),
(19, 75, 'http://localhost:8080/api/uploads/products/75/fb7dd13a-6fdc-461c-84d7-d0c3847d2281.webp', 0, 4),
(20, 75, 'http://localhost:8080/api/uploads/products/75/95dbed79-f059-4644-ad9e-f03cd3abc4c5.webp', 0, 3),
(21, 75, 'http://localhost:8080/api/uploads/products/75/816519f1-2561-4447-9800-3734d71612b7.webp', 0, 5),
(22, 73, 'http://localhost:8080/api/uploads/products/73/efd5f24a-607e-4ac0-995d-5dbf8277e289.webp', 1, 0),
(23, 73, 'http://localhost:8080/api/uploads/products/73/8ca959cc-dd6a-4e55-a33a-07b46cfd5b2d.webp', 0, 1),
(24, 73, 'http://localhost:8080/api/uploads/products/73/e943604c-e9dc-4c4a-b07f-77efa1056f6c.webp', 0, 3),
(25, 73, 'http://localhost:8080/api/uploads/products/73/15dcf53d-cfa9-4ed1-976b-780ce9e16c5d.webp', 0, 2),
(26, 73, 'http://localhost:8080/api/uploads/products/73/af97718a-57b2-43d1-8dd1-d162cf800ac9.webp', 0, 4),
(27, 72, 'http://localhost:8080/api/uploads/products/72/e78f5566-d9f8-4b0a-83da-9390639d2ae9.webp', 0, 5),
(28, 72, 'http://localhost:8080/api/uploads/products/72/70857efc-337b-4ab6-9e7e-d10a8808d953.webp', 0, 4),
(29, 72, 'http://localhost:8080/api/uploads/products/72/fc6178ff-ef45-4d3d-84ed-44a51def0f8b.webp', 0, 3),
(30, 72, 'http://localhost:8080/api/uploads/products/72/94572127-11e7-4912-8d32-90f9d641d21a.webp', 0, 2),
(31, 72, 'http://localhost:8080/api/uploads/products/72/41219f35-c5a7-4e77-939e-cb5358768fa8.webp', 1, 0),
(32, 70, 'http://localhost:8080/api/uploads/products/70/0174d542-3715-4def-b64c-afa5a17d843e.webp', 0, 4),
(33, 70, 'http://localhost:8080/api/uploads/products/70/616eeb14-169e-4317-8697-692d8ea1c63d.webp', 0, 2),
(34, 70, 'http://localhost:8080/api/uploads/products/70/0f3f38b6-671a-4008-8dcd-a1dc54025c94.webp', 0, 3),
(35, 70, 'http://localhost:8080/api/uploads/products/70/a415fb42-3136-44eb-ac08-bfa78abdde20.webp', 0, 1),
(36, 70, 'http://localhost:8080/api/uploads/products/70/d20ce2d9-91e8-4328-8832-916bc8d5399d.webp', 1, 0),
(37, 69, 'http://localhost:8080/api/uploads/products/69/9cddb9f4-f251-4f00-9e2c-6de02105b5b5.webp', 1, 0),
(38, 69, 'http://localhost:8080/api/uploads/products/69/975cf8cd-e8a1-4a8a-8146-67bc87a7b6da.webp', 0, 2),
(39, 69, 'http://localhost:8080/api/uploads/products/69/da74a0c2-64c8-4b09-bfa2-02d5569be04e.webp', 0, 4),
(40, 69, 'http://localhost:8080/api/uploads/products/69/ad8fa277-daeb-47c4-a893-0baeae06d069.webp', 0, 6),
(41, 69, 'http://localhost:8080/api/uploads/products/69/c13828e0-b0db-4181-a094-f3241b956676.webp', 0, 8),
(42, 68, 'http://localhost:8080/api/uploads/products/68/2d3e4213-4fd6-4879-bab4-f86014288310.webp', 0, 4),
(43, 68, 'http://localhost:8080/api/uploads/products/68/deca003d-f9de-4a68-bb94-bb6ea70ab133.webp', 0, 2),
(44, 68, 'http://localhost:8080/api/uploads/products/68/09059b59-3426-4f70-bcb4-dd49a19cf06f.webp', 0, 3),
(45, 68, 'http://localhost:8080/api/uploads/products/68/acfce464-b117-426c-8ef2-9ea97d3d6cf4.webp', 0, 1),
(46, 68, 'http://localhost:8080/api/uploads/products/68/2d2418c9-37bb-4340-b625-e66aa97d8421.webp', 1, 0),
(47, 67, 'http://localhost:8080/api/uploads/products/67/8bca1144-a21c-4cc4-a431-7b90c04db513.webp', 0, 4),
(48, 67, 'http://localhost:8080/api/uploads/products/67/b0e94dec-07f2-459a-8aca-a3758ba34a21.webp', 0, 2),
(49, 67, 'http://localhost:8080/api/uploads/products/67/02ce7d37-f61e-4bdf-ba40-342831d27602.webp', 0, 3),
(50, 67, 'http://localhost:8080/api/uploads/products/67/06d9c09e-0a9a-4e86-a02d-082900c5f8a5.webp', 0, 1),
(51, 67, 'http://localhost:8080/api/uploads/products/67/ba48be27-d16f-43f8-8c9c-449761f3c9de.webp', 1, 0),
(52, 66, 'http://localhost:8080/api/uploads/products/66/1eb46d65-e601-4bb4-b8a0-6bfe3cbaac3f.webp', 1, 0),
(53, 66, 'http://localhost:8080/api/uploads/products/66/38e2b61c-ee92-4585-b2ee-15d91ab5910f.webp', 0, 1),
(54, 66, 'http://localhost:8080/api/uploads/products/66/11da57b6-afa5-4e4b-b018-f183968b916d.webp', 0, 2),
(55, 66, 'http://localhost:8080/api/uploads/products/66/f06eab61-9e5e-498e-ad46-e472f2e461fc.webp', 0, 3),
(56, 66, 'http://localhost:8080/api/uploads/products/66/09be8a94-b9f8-4a13-bb41-8167f3bb928e.webp', 0, 4),
(57, 65, 'http://localhost:8080/api/uploads/products/65/dba5805e-ea11-45ec-a32f-d14c3477f3fb.webp', 0, 4),
(58, 65, 'http://localhost:8080/api/uploads/products/65/6105421a-8fed-4071-9e90-80024af37c57.webp', 0, 2),
(59, 65, 'http://localhost:8080/api/uploads/products/65/cce76922-6d56-423a-9a0a-85f4329e0fd6.webp', 0, 3),
(60, 65, 'http://localhost:8080/api/uploads/products/65/36ac4c1a-6ff0-491c-9f07-622de10c0aa8.webp', 0, 1),
(61, 65, 'http://localhost:8080/api/uploads/products/65/8b29d9e6-1cda-48dd-b19c-63e67a3356e0.webp', 1, 0),
(62, 64, 'http://localhost:8080/api/uploads/products/64/75a48d77-91a8-4668-824e-1cef145da928.webp', 1, 0),
(63, 64, 'http://localhost:8080/api/uploads/products/64/221a5954-5e8e-4a76-9d77-5e1b0f1748b0.webp', 0, 4),
(64, 64, 'http://localhost:8080/api/uploads/products/64/fc2879e3-3dda-4f6b-99fc-3110e92e59a0.webp', 0, 2),
(65, 64, 'http://localhost:8080/api/uploads/products/64/eee99801-76df-4685-b503-4a306e252bad.webp', 0, 3),
(66, 64, 'http://localhost:8080/api/uploads/products/64/fda03cb1-50e4-4ddf-8071-d066dc7d26ef.webp', 0, 1),
(67, 62, 'http://localhost:8080/api/uploads/products/62/5eeca12a-37a9-4ef4-8a1f-eccf0f7e600a.webp', 1, 0),
(68, 62, 'http://localhost:8080/api/uploads/products/62/0c37a015-d96e-486e-a7a8-4f299175aead.webp', 0, 1),
(69, 62, 'http://localhost:8080/api/uploads/products/62/089d28fd-8f6e-4a4b-9f20-6bdce58faafb.webp', 0, 3),
(70, 62, 'http://localhost:8080/api/uploads/products/62/90d0af76-16c1-40d5-815a-30f96c0f27cd.webp', 0, 5),
(71, 62, 'http://localhost:8080/api/uploads/products/62/da1bf1d5-c4af-4667-8c30-bd6cc60cc494.webp', 0, 7),
(72, 62, 'http://localhost:8080/api/uploads/products/62/8a3801a6-9969-4ab0-849d-da09f5cd7c0b.webp', 0, 9),
(73, 62, 'http://localhost:8080/api/uploads/products/62/dc0a291f-3ca1-448c-84ba-c72389a3a069.webp', 0, 11),
(74, 61, 'http://localhost:8080/api/uploads/products/61/4fb68e64-7861-4419-852f-122e2920c824.webp', 1, 0),
(75, 61, 'http://localhost:8080/api/uploads/products/61/d0e9c385-1d4b-4b4b-856f-8ab17d274806.webp', 0, 5),
(76, 61, 'http://localhost:8080/api/uploads/products/61/689de505-c15f-406f-bb62-1f62fb7edb06.webp', 0, 2),
(77, 61, 'http://localhost:8080/api/uploads/products/61/970dd4e7-13a6-4b8d-8aba-396ace377705.webp', 0, 3),
(78, 61, 'http://localhost:8080/api/uploads/products/61/4d72a61a-e525-4b67-88b8-4f339b90f9a8.webp', 0, 4),
(79, 61, 'http://localhost:8080/api/uploads/products/61/13e2ae5e-109e-4284-9d92-578bb01ccf1b.webp', 0, 1),
(80, 60, 'http://localhost:8080/api/uploads/products/60/53217d4f-5c99-4122-9103-1682cd5d98bf.webp', 1, 0),
(81, 60, 'http://localhost:8080/api/uploads/products/60/15b7df50-813d-4102-aed6-0b6b9ed2b969.webp', 0, 5),
(82, 60, 'http://localhost:8080/api/uploads/products/60/002e992d-c4cf-467e-8ff1-85d3e1e66503.webp', 0, 3),
(83, 60, 'http://localhost:8080/api/uploads/products/60/64fe1249-7366-4db6-8b48-f2f4f7025d62.webp', 0, 4),
(84, 60, 'http://localhost:8080/api/uploads/products/60/876d3833-8f88-488f-b254-0c6e4d9f64e2.webp', 0, 2),
(85, 59, 'http://localhost:8080/api/uploads/products/59/87456765-2097-41d3-823e-5a30fb197f6a.webp', 1, 0),
(86, 59, 'http://localhost:8080/api/uploads/products/59/d7bdf204-f783-44fc-b01a-190ab2321154.webp', 0, 4),
(87, 59, 'http://localhost:8080/api/uploads/products/59/97e054ff-c4d4-4ad4-92a1-07327796676e.webp', 0, 2),
(88, 59, 'http://localhost:8080/api/uploads/products/59/97f71d24-2f69-4edd-b614-2e89578b4b82.webp', 0, 3),
(89, 59, 'http://localhost:8080/api/uploads/products/59/46498cb1-a226-43a2-a3d3-9d41a1919835.webp', 0, 1),
(90, 58, 'http://localhost:8080/api/uploads/products/58/4fd79bc4-45aa-4961-be07-d0e593e7aef5.webp', 1, 0),
(91, 58, 'http://localhost:8080/api/uploads/products/58/8cd9822d-b221-4976-8c53-363a9bf51eed.webp', 0, 1),
(92, 58, 'http://localhost:8080/api/uploads/products/58/01c148b4-4f4b-42c5-9058-6becc65ffc10.webp', 0, 3),
(93, 58, 'http://localhost:8080/api/uploads/products/58/d2c8843a-f754-4da3-9cf5-13f0ebf9687c.webp', 0, 5),
(94, 58, 'http://localhost:8080/api/uploads/products/58/7447f210-d83c-42bd-a6c6-1922a7c084b3.webp', 0, 7),
(95, 57, 'http://localhost:8080/api/uploads/products/57/de2f3b80-98f8-4af9-99c1-b636624225b6.webp', 1, 0),
(96, 57, 'http://localhost:8080/api/uploads/products/57/1516c4cb-86ec-47a9-bc35-76331ea8e04e.webp', 0, 1),
(97, 57, 'http://localhost:8080/api/uploads/products/57/40e921fd-78e0-4b8e-9fe9-98f08d8d42e9.webp', 0, 3),
(98, 57, 'http://localhost:8080/api/uploads/products/57/27c2d7a0-96c2-4bfe-9298-298ec1cf4a62.webp', 0, 5),
(99, 57, 'http://localhost:8080/api/uploads/products/57/0abb1726-ad91-46c2-89a8-067098b42521.webp', 0, 7),
(100, 56, 'http://localhost:8080/api/uploads/products/56/a893f039-9e12-4617-a3db-ccf1c18af990.webp', 1, 0),
(101, 56, 'http://localhost:8080/api/uploads/products/56/7d7ff7df-e3b2-4cbf-88c4-d2b2d611b43d.webp', 0, 1),
(102, 56, 'http://localhost:8080/api/uploads/products/56/82dd8e55-1884-4dac-920d-5d1c1afaacbf.webp', 0, 3),
(103, 56, 'http://localhost:8080/api/uploads/products/56/c64e9bdc-e320-47b0-ae8a-af05470967d2.webp', 0, 5),
(104, 56, 'http://localhost:8080/api/uploads/products/56/de54e378-4dcb-4115-ac66-55b26b672f87.webp', 0, 7),
(105, 55, 'http://localhost:8080/api/uploads/products/55/360b3b27-ac4d-4c27-aee5-42760952b155.webp', 1, 0),
(106, 55, 'http://localhost:8080/api/uploads/products/55/13ee6b55-55d5-4a80-b50a-a9ae8da07d15.webp', 0, 1),
(107, 55, 'http://localhost:8080/api/uploads/products/55/0f481e51-eb67-4b4c-a0f2-37ff6c065b20.webp', 0, 3),
(108, 55, 'http://localhost:8080/api/uploads/products/55/00ee54f0-adc2-4f9e-8abc-4295b2021002.webp', 0, 5),
(109, 55, 'http://localhost:8080/api/uploads/products/55/956e045f-bc97-46c5-bfe1-1530e770dff1.webp', 0, 7),
(110, 54, 'http://localhost:8080/api/uploads/products/54/de1b7992-e465-4450-95d1-0d0172c9d1c4.webp', 1, 0),
(111, 54, 'http://localhost:8080/api/uploads/products/54/c8cbbd04-af08-4d58-a20b-2b0a4ccf78fd.webp', 0, 1),
(112, 54, 'http://localhost:8080/api/uploads/products/54/d6f6a62a-224b-4634-b619-153868f29c66.webp', 0, 3),
(113, 54, 'http://localhost:8080/api/uploads/products/54/a31e1010-279b-4359-abdc-61ce8b02231f.webp', 0, 5),
(114, 54, 'http://localhost:8080/api/uploads/products/54/66e1f651-a4fa-46e8-8aec-d783e2f91e0d.webp', 0, 7),
(115, 54, 'http://localhost:8080/api/uploads/products/54/679fab01-d96f-4ca9-8a8c-474cb7860340.webp', 0, 9),
(116, 53, 'http://localhost:8080/api/uploads/products/53/e33457f3-2c87-48ae-acf5-9cef1c0a5e6b.webp', 1, 0),
(117, 53, 'http://localhost:8080/api/uploads/products/53/63dd2de5-c74e-47f4-adf4-fb97f6828ab6.webp', 0, 1),
(118, 53, 'http://localhost:8080/api/uploads/products/53/415a3c4b-3bfc-4c41-a4e4-da39e323e05c.webp', 0, 3),
(119, 53, 'http://localhost:8080/api/uploads/products/53/0767a59b-d6a3-4fb6-bb21-ccbfcb82f10e.webp', 0, 5),
(120, 53, 'http://localhost:8080/api/uploads/products/53/3355a673-e08c-4e0e-9563-7b24be45be2e.webp', 0, 7),
(121, 52, 'http://localhost:8080/api/uploads/products/52/0e111029-2a0a-4f43-b53d-59e2a5b0a62b.webp', 1, 0),
(122, 52, 'http://localhost:8080/api/uploads/products/52/71cbe6d8-387a-41c2-adfe-daa554081dce.webp', 0, 1),
(123, 52, 'http://localhost:8080/api/uploads/products/52/6f84e1d9-ebc8-459e-9515-e657a6b3ed12.webp', 0, 3),
(124, 52, 'http://localhost:8080/api/uploads/products/52/73266ec4-2188-4371-8acd-e7bdd15e702a.webp', 0, 5),
(125, 52, 'http://localhost:8080/api/uploads/products/52/6daa756c-09e2-41c3-b62b-85f6281f9899.webp', 0, 7),
(126, 50, 'http://localhost:8080/api/uploads/products/50/8f001fb2-eec3-4fc1-9acb-07de6fcf0ecf.webp', 1, 0),
(127, 50, 'http://localhost:8080/api/uploads/products/50/a91ba096-39af-4664-81cb-ba48ea4dd1be.webp', 0, 1),
(128, 49, 'http://localhost:8080/api/uploads/products/49/0e2fcd55-c17b-4e4f-9cbb-d8383e8e5160.webp', 1, 0),
(129, 49, 'http://localhost:8080/api/uploads/products/49/8e2f291a-c86e-4877-b99b-2a4b715cfdc4.webp', 0, 1),
(130, 48, 'http://localhost:8080/api/uploads/products/48/b32e7d06-e440-4057-b7f9-08f106f50d4f.webp', 1, 0),
(131, 48, 'http://localhost:8080/api/uploads/products/48/89dcdb83-f937-4dd7-a53e-f41ce34dfd52.webp', 0, 1),
(132, 48, 'http://localhost:8080/api/uploads/products/48/f2a6bf8b-7e76-4977-afc2-3c2fea9596d1.webp', 0, 3),
(133, 48, 'http://localhost:8080/api/uploads/products/48/6d21b19c-09f6-4d56-ab97-d2752120fbe7.webp', 0, 5),
(134, 48, 'http://localhost:8080/api/uploads/products/48/2db268b5-f2e0-428b-b2b8-2111981f6d6a.webp', 0, 7),
(135, 48, 'http://localhost:8080/api/uploads/products/48/461dfee5-7f88-4a06-865c-336e9c759e54.webp', 0, 9),
(136, 48, 'http://localhost:8080/api/uploads/products/48/88b9d379-c51e-455b-9d08-9b36cd847198.webp', 0, 11),
(137, 47, 'http://localhost:8080/api/uploads/products/47/8e8b7181-23fc-4aba-a3d9-2190be24bfb7.webp', 1, 0),
(138, 47, 'http://localhost:8080/api/uploads/products/47/8f311e01-8b4f-4702-9e11-50a714751ab5.webp', 0, 1),
(139, 47, 'http://localhost:8080/api/uploads/products/47/fd29f234-cdc9-40e5-b2d8-7d28a733fa62.webp', 0, 3),
(140, 47, 'http://localhost:8080/api/uploads/products/47/1f898c6f-f297-4ded-8a11-5c7a741f6b8c.webp', 0, 5),
(141, 47, 'http://localhost:8080/api/uploads/products/47/03782dbd-7b38-4fba-a867-4ea022fbedac.webp', 0, 7),
(142, 46, 'http://localhost:8080/api/uploads/products/46/428cc3e9-fff4-4d32-8143-f65acdba3e9a.webp', 1, 0),
(143, 46, 'http://localhost:8080/api/uploads/products/46/49c69c7f-b94e-4909-afe8-0f1b7fcab763.webp', 0, 1),
(144, 46, 'http://localhost:8080/api/uploads/products/46/1d6b3c7a-47c2-4dd4-bd17-6d36f318bf6c.webp', 0, 3),
(145, 46, 'http://localhost:8080/api/uploads/products/46/ed699cdb-3bf9-4000-bfc4-3c6783419ae1.webp', 0, 5),
(146, 46, 'http://localhost:8080/api/uploads/products/46/fb3d4266-de65-423d-a756-5aeb847cbfcd.webp', 0, 7),
(147, 45, 'http://localhost:8080/api/uploads/products/45/4c22254c-2d7b-4be8-b66f-f0134d11c4cd.webp', 1, 0),
(148, 45, 'http://localhost:8080/api/uploads/products/45/0032b38a-d5b2-48df-b50f-3088b421d647.webp', 0, 1),
(149, 45, 'http://localhost:8080/api/uploads/products/45/28d92af9-c38f-49b6-987e-dfd0795eec9c.webp', 0, 3),
(150, 45, 'http://localhost:8080/api/uploads/products/45/f4d0a65e-c624-495f-836f-9c86e8658329.webp', 0, 5),
(151, 45, 'http://localhost:8080/api/uploads/products/45/824d1717-7c09-4930-9c17-eef1519ca4c9.webp', 0, 7),
(152, 43, 'http://localhost:8080/api/uploads/products/43/d24b0ec8-9224-4418-928d-8c501cf17979.webp', 1, 0),
(153, 43, 'http://localhost:8080/api/uploads/products/43/9d34bbe9-81eb-449f-aee7-fb6c69dfef65.webp', 0, 1),
(154, 43, 'http://localhost:8080/api/uploads/products/43/8e3811a8-cf62-4cf7-86e7-c581e7d09341.webp', 0, 3),
(155, 43, 'http://localhost:8080/api/uploads/products/43/b73c902b-7185-4ebf-99bc-0ba775608841.webp', 0, 5),
(156, 43, 'http://localhost:8080/api/uploads/products/43/8aeaf797-b52c-401c-9ba1-c4c9c290e256.webp', 0, 7),
(157, 79, 'http://localhost:8080/api/uploads/products/79/c6dc9230-2e25-470d-b72d-347f82947113.webp', 1, 0),
(158, 79, 'http://localhost:8080/api/uploads/products/79/f08ff327-f006-41b5-b2de-e7836ac435a5.webp', 0, 1),
(159, 79, 'http://localhost:8080/api/uploads/products/79/ca8cb767-c1eb-4a54-b22b-6aa014fe6e16.webp', 0, 3),
(160, 79, 'http://localhost:8080/api/uploads/products/79/eea189b7-14a6-46e8-a9a1-e706c86a787a.webp', 0, 5),
(161, 79, 'http://localhost:8080/api/uploads/products/79/a62eceb7-781f-4231-8d28-45cae2407ca2.webp', 0, 7),
(162, 79, 'http://localhost:8080/api/uploads/products/79/b6cdbe50-a943-4d4a-b5be-3eb81609354e.webp', 0, 9),
(163, 80, 'http://localhost:8080/api/uploads/products/80/cc3c43e0-75d5-4c9b-99e8-d26e5f18a40c.webp', 1, 0),
(164, 80, 'http://localhost:8080/api/uploads/products/80/2ef8276e-1ed6-4783-abf1-4fbe1037c23a.webp', 0, 1),
(165, 80, 'http://localhost:8080/api/uploads/products/80/26d8ee47-dd83-4daa-8e60-ebc572e21cf8.webp', 0, 3),
(166, 80, 'http://localhost:8080/api/uploads/products/80/113f7205-3e73-4bc2-b3a5-21b0fd1b50fd.webp', 0, 5),
(167, 80, 'http://localhost:8080/api/uploads/products/80/f64f7892-14b8-4f43-bae8-f9c59914c1ec.webp', 0, 7),
(168, 81, 'http://localhost:8080/api/uploads/products/81/92dcf2d0-0135-4897-acd2-761db3c56756.webp', 1, 0),
(169, 81, 'http://localhost:8080/api/uploads/products/81/4313fc11-f7cc-4209-a2c0-b633bd77f072.webp', 0, 1),
(170, 81, 'http://localhost:8080/api/uploads/products/81/913c340d-16fd-46e8-8ba0-b2d6f62d9cbd.webp', 0, 3),
(171, 81, 'http://localhost:8080/api/uploads/products/81/a591ecec-acb1-4153-88ef-ddcb40313099.webp', 0, 5),
(172, 81, 'http://localhost:8080/api/uploads/products/81/c1159b13-28ae-46e3-a91e-2886385a81f8.webp', 0, 7),
(173, 82, 'http://localhost:8080/api/uploads/products/82/9df38aef-98bf-4e4d-9c39-36daf8000842.webp', 1, 0),
(174, 82, 'http://localhost:8080/api/uploads/products/82/36eddd62-f78c-4207-a38f-d36e6dc5d26a.webp', 0, 1),
(175, 82, 'http://localhost:8080/api/uploads/products/82/d2a41fc2-7f5f-4ac6-a458-d7c5641b1ff3.webp', 0, 3),
(176, 82, 'http://localhost:8080/api/uploads/products/82/31a3a93a-9531-44c9-a506-16897bdfc965.webp', 0, 5),
(177, 82, 'http://localhost:8080/api/uploads/products/82/5cf4e917-f987-4c63-b8f9-82253cc066df.webp', 0, 7),
(178, 83, 'http://localhost:8080/api/uploads/products/83/4058389c-6a51-403c-b366-d0c3a6ab99a5.webp', 1, 0),
(179, 83, 'http://localhost:8080/api/uploads/products/83/075e0a6f-f0c9-463a-8714-86ede92dafdc.webp', 0, 1),
(180, 83, 'http://localhost:8080/api/uploads/products/83/7e2f58c3-e45c-4995-8252-f62431403f00.webp', 0, 3),
(181, 83, 'http://localhost:8080/api/uploads/products/83/c0ce2829-972b-4675-8715-23cc4dbcf486.webp', 0, 5),
(182, 83, 'http://localhost:8080/api/uploads/products/83/22800023-a97b-4bbd-b2a7-f060302cb6b8.webp', 0, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `size` varchar(10) NOT NULL,
  `color` varchar(20) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `stock` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `size`, `color`, `sku`, `stock`) VALUES
(1, 43, '42', 'Marron', 'SLO-BR-42', 10),
(7, 67, '41', 'Blanco', 'ADI-STAR-BLANC', 50),
(8, 67, '41', 'Negro', 'ADI-STAR-NEGRO', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `token` varchar(768) NOT NULL,
  `expiry_date` timestamp NOT NULL,
  `revoked` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `user_id`, `token`, `expiry_date`, `revoked`) VALUES
(1, 1, 'f4159683-43c3-4757-85f5-70a79633f771', '2025-09-24 22:25:52', 1),
(2, 2, 'fe11debd-05eb-4a75-ae22-1b84b41caeba', '2025-09-24 22:26:41', 1),
(3, 2, '979c5d32-c5de-48aa-98f8-cde69fa0fe07', '2025-09-24 22:27:06', 1),
(4, 3, '8743d591-1f7e-420e-b208-e0bcb78e2062', '2025-09-25 00:34:46', 1),
(5, 1, '33261845-fdff-4620-a454-5ea6a7c20b9b', '2025-09-25 12:28:26', 1),
(6, 1, '87cf25f9-ff6d-4905-9276-eafc5a4559f5', '2025-09-25 12:29:03', 1),
(7, 1, '329670ba-9ebd-45a6-b9ba-dfa98ffe79bd', '2025-09-25 12:43:52', 1),
(8, 1, '1c97e391-cb60-4176-a72b-af157391a4bf', '2025-09-25 12:46:09', 1),
(9, 1, '8765f24b-262f-409e-86e7-e58a499fc370', '2025-09-25 12:48:30', 1),
(10, 1, 'fd1d1ee6-fb63-4a04-b8a4-d816de5faa82', '2025-09-25 12:49:50', 1),
(11, 1, '96ba3c07-e56a-46c5-a1bc-829b3a848699', '2025-09-25 12:51:29', 1),
(12, 1, 'e4f49e22-e151-4f6d-aa75-1c756d8dba3f', '2025-09-25 12:52:06', 1),
(13, 1, '7d77369b-56ae-4489-988c-ee13c715f587', '2025-09-25 12:59:34', 1),
(14, 1, '8b97d3b2-7346-4746-941a-c072df15fc7d', '2025-09-25 13:10:10', 1),
(15, 1, 'fcb7bfb3-b259-4658-8456-578067450941', '2025-09-25 13:26:06', 1),
(16, 1, '30a13cbf-4a2d-446c-8223-9183fd0b1b5a', '2025-09-25 13:27:34', 1),
(17, 1, 'e8689cd1-30d8-4fc8-8301-f516d3d21412', '2025-09-25 13:38:08', 1),
(18, 2, '4f76cfba-0a10-4fdd-b708-5164c0fe4da3', '2025-09-25 13:40:29', 1),
(19, 2, '04436d42-e12a-40ff-a02e-8c35ee62e2b7', '2025-09-25 17:32:50', 1),
(20, 2, 'a195982e-5c9e-4202-bac1-9edcd97faf79', '2025-09-25 20:37:01', 1),
(21, 2, '78e4840b-ec1e-4146-93b6-3d3ec64493fd', '2025-09-25 20:39:18', 1),
(22, 2, '3882ec7b-53de-4731-a7cc-8ca88f036d07', '2025-09-25 20:41:40', 1),
(23, 2, 'f1c30300-35ec-454e-b7c1-ec4bc953fffa', '2025-09-25 20:42:41', 1),
(24, 2, '503a6b63-f666-498d-b039-6382f9eeb705', '2025-09-26 20:44:23', 1),
(25, 2, 'edc9ee67-3f13-4cc0-a06f-bf1764f28992', '2025-09-26 21:01:26', 1),
(26, 2, '64e462dd-01a7-401b-81d1-31095f198c7a', '2025-09-26 21:19:06', 1),
(27, 2, 'f349cf58-47db-4140-9a1e-f6a4b5587a1b', '2025-09-28 18:26:11', 1),
(28, 2, '131a324e-dbec-408a-bb00-f8f3f37dbbbc', '2025-09-29 14:31:19', 1),
(29, 2, '05ee8d02-f7d1-4692-9363-01db78805cce', '2025-09-29 15:12:18', 1),
(30, 2, 'bbe8d208-2dcf-4bf1-9662-298431628967', '2025-09-29 15:22:10', 1),
(31, 2, 'bb189668-a44f-4e1e-9b4a-27c049f94295', '2025-09-29 21:14:26', 1),
(32, 2, 'c34959ed-96b5-438e-bba5-9434a68dfa7e', '2025-09-29 23:24:42', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` enum('CUSTOMER','ADMIN') NOT NULL DEFAULT 'CUSTOMER',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `phone`, `role`, `created_at`, `updated_at`, `active`) VALUES
(1, 'usuario_test2', 'usuario_test2@example.com', '$2a$10$J5M7rsB1cOLkLoxqDAW9EuKyv3Ix1fpQlVkx8DSopKHHS1bypw94i', 'Usuario2', 'Test2', '123456789', 'CUSTOMER', '2025-09-17 22:25:52', '2025-09-17 22:25:52', 1),
(2, 'admin', 'admin@admin.com', '$2a$10$tby0Ho1PKJLAQgdM0qtKAeSjAWEQ4WhR9jIsSJSuU5FqsavW6RTge', 'Admin', 'Admin', '123456789', 'ADMIN', '2025-09-17 22:26:41', '2025-09-19 18:29:21', 1),
(3, 'usuario3', 'usuario3@gmail.com', '$2a$10$4JQ.XLqrvFyGDL.TIiIR8e1GWKZXsy6BfdHvZrVF98AHYdeEXPpy.', 'Usuario', 'Tres', NULL, 'CUSTOMER', '2025-09-18 00:34:46', '2025-09-18 00:34:46', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `blacklisted_tokens`
--
ALTER TABLE `blacklisted_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_blacklisted_tokens_token` (`token`),
  ADD KEY `idx_blacklisted_tokens_expires` (`expires_at`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indices de la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `idx_orders_user` (`user_id`),
  ADD KEY `idx_orders_status` (`status`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_products_brand` (`brand_id`),
  ADD KEY `idx_products_category` (`category_id`),
  ADD KEY `idx_products_active` (`active`);

--
-- Indices de la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `idx_product_variants_product` (`product_id`);

--
-- Indices de la tabla `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_refresh_tokens_token` (`token`),
  ADD KEY `idx_refresh_tokens_user` (`user_id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reviews_product` (`product_id`),
  ADD KEY `idx_reviews_user` (`user_id`),
  ADD KEY `idx_reviews_rating` (`rating`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `blacklisted_tokens`
--
ALTER TABLE `blacklisted_tokens`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de la tabla `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`);

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Filtros para la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD CONSTRAINT `refresh_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
