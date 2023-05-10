-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 10, 2023 lúc 11:02 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbyody`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `create_at`, `update_at`, `name`, `slug`, `parent_id`) VALUES
(1, '2023-04-23 12:38:16.917000', '2023-04-23 12:38:16.917000', 'Nữ', 'nu', 0),
(2, '2023-04-23 12:39:37.106000', '2023-04-23 12:39:37.106000', 'Áo Nữ', 'ao-nu', 1),
(3, '2023-04-23 12:40:22.749000', '2023-04-23 12:40:22.749000', 'Quần nữ', 'quan-nu', 1),
(4, '2023-04-23 12:42:08.964000', '2023-04-23 12:42:08.964000', 'Đồ mặc trong nữ', 'o-mac-trong-nu', 1),
(5, '2023-04-23 12:42:36.042000', '2023-04-23 12:42:36.042000', 'Áo polo', 'ao-polo', 2),
(6, '2023-04-23 12:43:03.198000', '2023-04-23 12:43:03.198000', 'Áo thun', 'ao-thun', 2),
(7, '2023-04-23 12:43:43.643000', '2023-04-23 12:43:43.643000', 'Áo khoác', 'ao-khoac', 2),
(8, '2023-04-23 12:56:16.617000', '2023-04-23 12:56:16.617000', 'Áo sơ mi', 'ao-so-mi', 2),
(9, '2023-04-23 12:56:48.493000', '2023-04-23 12:56:48.493000', 'Quần Jeans', 'quan-jeans', 3),
(10, '2023-04-23 12:59:21.434000', '2023-04-23 12:59:21.434000', 'Quần Âu', 'quan-au', 3),
(11, '2023-04-23 12:59:33.127000', '2023-04-23 12:59:33.127000', 'Quần kaki', 'quan-kaki', 3),
(12, '2023-04-23 12:59:51.847000', '2023-04-23 12:59:51.847000', 'Nam', 'nam', 0),
(13, '2023-04-23 13:00:00.841000', '2023-04-23 13:00:00.841000', 'Trẻ em', 'tre-em', 0),
(14, '2023-04-23 13:14:44.732000', '2023-04-23 13:14:44.732000', 'Áo giữ nhiệt', 'ao-giu-nhiet', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `style` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `variant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `create_at`, `update_at`, `description`, `name`, `price`, `slug`, `category_id`) VALUES
(1, '2023-05-09 22:50:03.003000', '2023-05-09 22:50:03.003000', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\"><img alt=\"Áo Polo Nữ Cafe Phối Nẹp Siêu Nhẹ Siêu Mát\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-scafe.jpg?v=1681270367839\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Chất liệu: Vải Cafe với thành phần 50% Sợi cafe, 50% sợi tái chế PET</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Vải Cafe được làm từ bột cafe có đặc tính khử mùi tốt - nhanh khô - chống tia UV</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Bảo vệ cơ thể, hạn chế tiếp xúc với tia UV</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Kháng khuẩn, khử mùi giúp bạn tự tin khi vận động, ngày hè hay đơn giản là tham gia 1 bữa tiệc nướng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">An toàn cho da, thân thiện môi trường</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Áo có form dáng suông nhẹ, bo nẹp, phối cổ và tay áo khỏe khoắn và lịch sự, thích hợp mặc đi chơi, đi làm</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">YODY&nbsp;- Look good. Feel good.</p>', 'Áo Polo Nữ Cafe Phối Nẹp Siêu Nhẹ Siêu Mát', '299000.00', 'ao-polo-nu-cafe-phoi-nep-sieu-nhe-sieu-mat', 5),
(2, '2023-05-10 15:24:45.491000', '2023-05-10 15:24:45.491000', '<img alt=\"Áo Polo Nữ Tay Ngắn Pique Mắt Chim Phối Bo Thoáng Khí\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-mat-chim-6a406297-73e2-43fa-9be7-23531d98a7c2.jpg?v=1681791176822\" style=\"border: 0px none; max-width: 100%; height: auto; margin-bottom: 10px; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\"><span style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\"></span><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Chất liệu mắt chim hiệu ứng độc đáo, mới lạ và trẻ trung</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Chất liệu áo thoáng mát, thấm hút tốt có độ bền cao</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Co giãn tốt mà vẫn giữ được form dáng và bền màu</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Thiết kế áo polo nữ với kiểu dáng suông cơ bản nên rất dễ mặc với mọi người</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Áo polo nữ form rộng sẽ giúp bạn có thể mặc thoải mái mỗi ngày, tự tin trong mọi hoạt động sinh hoạt hàng ngày</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">YODY - Look good. Feel good.</p>', 'Áo Polo Nữ Tay Ngắn Pique Mắt Chim Phối Bo Thoáng Khí', '289000.00', 'ao-polo-nu-tay-ngan-pique-mat-chim-phoi-bo-thoang-khi', 5),
(3, '2023-05-10 15:42:18.879000', '2023-05-10 15:42:18.879000', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\"><img alt=\"Áo Polo Nữ Coolmax Lacoste\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-coolmax-a0b7d64c-a51e-443e-9171-03df617a054f.jpg?v=1681791486291\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Chất liệu Coolmax: 95% Coolmax +&nbsp;5% Spandex</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Vải nhẹ, xốp, thoáng mát, truyền dẫn ẩm tốt, bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí và ẩm.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Khả năng thấm hút mồ hôi tốt, hút ẩm nhanh tạo sự thoải mái cho cơ thể khi sử dụng.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Chi tiết cố áo được làm phối bo trẻ trung với những đường chỉ đan xen tạo điểm nhấn cách điệu.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">YODY - Look good. Feel good.</p>', 'Áo Polo Nữ Coolmax', '299000.00', 'ao-polo-nu-coolmax', 5),
(4, '2023-05-10 15:48:03.266000', '2023-05-10 15:48:03.266000', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\"><img alt=\"Áo Polo Nữ Airycool Thoáng Mát Phối Bo\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-airycool-cf9328e9-7c5b-49e9-8f96-2a6ce89a38ea.jpg?v=1681373034533\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Công nghệ làm mát Freezing giúp tạo lá chắn bảo vệ cơ thể khỏi môi trường bên ngoài</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Sợi Polyamide chiếm 85%&nbsp;giúp tạo cảm giác thoải mái, dễ chịu khi mặc.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">15% spandex giúp sợi vải thêm bền chắc, tạo form dáng thời trang</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Thiết kế áo giúp tăng tiêu tán bức xạ nhiệt và hạn chế tối đa hấp thụ nhiệt vào cơ thể</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Sản phẩm giúp&nbsp;làm mát tự nhiên, cho người mặc cảm giác thoải mái, mọi lúc, mọi nơi.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">YODY - Look good. Feel good.</p>', 'Áo Polo Nữ Airycool Thoáng Mát Phối Bo', '299000.00', 'ao-polo-nu-airycool-thoang-mat-phoi-bo', 5),
(5, '2023-05-10 15:55:37.511000', '2023-05-10 15:55:37.511000', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\"><img alt=\"Áo Polo Thể Thao Nữ Airycool Phối Nẹp\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-airycool-c9cae1a1-2455-4958-be09-a3cd5a4fafc4.jpg?v=1681957719893\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Chất liệu Airycool với thành phần: 85% Polyamide + 15% Spandex</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Sản phẩm nằm trong BST YODY Sport - Áo Polo thể thao mới</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Công nghệ làm mát FREEZING&nbsp;tiên tiến giúp giải nhiệt cơ thể cho ngày hè mát mẻ.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Áo mềm mịn, thoáng thoáng, hút ẩm tốt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Đặc tính khô nhanh giúp dễ dàng giặt và bảo quản</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">Thoải mái tham gia các vận động&nbsp;cường độ cao nhờ chất liệu co giãn, giữ form</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative; color: rgb(0, 0, 0); font-family: SVN-Gilroy; font-size: 14px;\">YODY SPORT - Look good. Feel good.</p>', 'Áo Polo Thể Thao Nữ Airycool Phối Nẹp', '296100.00', 'ao-polo-the-thao-nu-airycool-phoi-nep', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `src` text DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `create_at`, `update_at`, `name`, `src`, `product_id`) VALUES
(1, '2023-05-09 22:50:03.009000', '2023-05-09 22:50:03.009000', '59PN06MP-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/74f27f5375fa40d1a49acb159f0a4121.webp', 1),
(2, '2023-05-09 22:50:03.009000', '2023-05-09 22:50:03.009000', '59PN06MP-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/01c4fec6cfe540e2a3da681e057fde92.webp', 1),
(3, '2023-05-09 22:50:03.010000', '2023-05-09 22:50:03.010000', '59PN06MP-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/a135e998e6574590a1f82fec66c9971a.webp', 1),
(4, '2023-05-09 22:50:03.013000', '2023-05-09 22:50:03.013000', '59PN06MP-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/e37f265a6415469aa00305dc17440100.webp', 1),
(5, '2023-05-09 22:50:03.014000', '2023-05-09 22:50:03.014000', '59PN06MP-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/97dad69da24b42f48505b3ecf9302f87.webp', 1),
(6, '2023-05-09 22:50:03.014000', '2023-05-09 22:50:03.014000', '59PN06MP-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/1ecc53f083d9467398fad29822df6754.webp', 1),
(7, '2023-05-09 22:50:03.015000', '2023-05-09 22:50:03.015000', 'KADN4BV4-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/de01b2ec24554bed864863aa978a618d.webp', 1),
(8, '2023-05-09 22:50:03.015000', '2023-05-09 22:50:03.015000', 'KADN4BV4-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/514775f023c6488c9dddeaed7fa3c6d7.webp', 1),
(9, '2023-05-09 22:50:03.016000', '2023-05-09 22:50:03.016000', 'KADN4BV4-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9b634ce134d9435f91ee67727bfc812d.webp', 1),
(10, '2023-05-09 22:50:03.016000', '2023-05-09 22:50:03.016000', 'KADN4BV4-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9f7fe78400574d609eb8b17c3a7bb84f.webp', 1),
(11, '2023-05-09 22:50:03.017000', '2023-05-09 22:50:03.017000', 'KADN4BV4-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/8ca0b68196c249f7b9725863fed8f3ee.webp', 1),
(12, '2023-05-09 22:50:03.017000', '2023-05-09 22:50:03.017000', 'KADN4BV4-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/abec8de7882e430aac1aa6461f72afcd.webp', 1),
(13, '2023-05-09 22:50:03.018000', '2023-05-09 22:50:03.018000', '7FJ2T4SK-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/e76e340b699448df9dce866d4a09e9ab.webp', 1),
(14, '2023-05-09 22:50:03.018000', '2023-05-09 22:50:03.018000', '7FJ2T4SK-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/288778d13a4e48ec9c4bfb8e2917ca71.webp', 1),
(15, '2023-05-09 22:50:03.019000', '2023-05-09 22:50:03.019000', '7FJ2T4SK-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/a07f2faad4704bb4a43c7b6483a06165.webp', 1),
(16, '2023-05-09 22:50:03.019000', '2023-05-09 22:50:03.019000', '7FJ2T4SK-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/5615175a089246a691569707f1b83190.webp', 1),
(17, '2023-05-09 22:50:03.020000', '2023-05-09 22:50:03.020000', '7FJ2T4SK-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/ff5dd9b6b32f484ca74b8509ded1e578.webp', 1),
(18, '2023-05-10 15:24:45.498000', '2023-05-10 15:24:45.498000', 'Z1IMKXOW-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/8b2ab80d88084e5b8fb743cd431be73e.webp', 2),
(19, '2023-05-10 15:24:45.500000', '2023-05-10 15:24:45.500000', 'Z1IMKXOW-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/b5cc60bafd1e45909f1334d9a53dc30a.webp', 2),
(20, '2023-05-10 15:24:45.500000', '2023-05-10 15:24:45.500000', 'Z1IMKXOW-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/c096ce13da0241fab6c76a985a79fd52.webp', 2),
(21, '2023-05-10 15:24:45.501000', '2023-05-10 15:24:45.501000', 'Z1IMKXOW-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/4923b01332504962a24bba87a9b39623.webp', 2),
(22, '2023-05-10 15:24:45.502000', '2023-05-10 15:24:45.502000', 'Z1IMKXOW-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/f8fab121446d4f72be2611525ee13577.webp', 2),
(23, '2023-05-10 15:24:45.504000', '2023-05-10 15:24:45.504000', 'Z1IMKXOW-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/4e33a60cbc5d4318a3aebfcbc711d1db.webp', 2),
(24, '2023-05-10 15:24:45.508000', '2023-05-10 15:24:45.508000', 'IOE3QCTN-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/2afda19ccad5434ab60724e75b33850b.webp', 2),
(25, '2023-05-10 15:24:45.509000', '2023-05-10 15:24:45.509000', 'IOE3QCTN-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/bb172c7bbbab495a86134566c555abdf.webp', 2),
(26, '2023-05-10 15:24:45.510000', '2023-05-10 15:24:45.510000', 'IOE3QCTN-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/a95d6d728b774a7cab7a193ff5163fdc.webp', 2),
(27, '2023-05-10 15:24:45.511000', '2023-05-10 15:24:45.511000', 'IOE3QCTN-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/9fd5464413684a708b93c71ea99890d8.webp', 2),
(28, '2023-05-10 15:24:45.512000', '2023-05-10 15:24:45.512000', 'IOE3QCTN-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/5b5cd88ec8aa4941ae68935e18701b6d.webp', 2),
(29, '2023-05-10 15:24:45.512000', '2023-05-10 15:24:45.512000', 'VIGJS2S1-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/f9c4a2bf39d54bbb8b3619396ad7fe3c.webp', 2),
(30, '2023-05-10 15:24:45.513000', '2023-05-10 15:24:45.513000', 'VIGJS2S1-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/4dd26536b1e4438488ac5f5f56c8fd63.webp', 2),
(31, '2023-05-10 15:24:45.514000', '2023-05-10 15:24:45.514000', 'VIGJS2S1-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/66cac71d70024ceca9e69b6427332a80.webp', 2),
(32, '2023-05-10 15:24:45.515000', '2023-05-10 15:24:45.515000', 'VIGJS2S1-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/88d63a2a837c401b9cae2658833b6e41.webp', 2),
(33, '2023-05-10 15:24:45.516000', '2023-05-10 15:24:45.516000', 'VIGJS2S1-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/dbd5a726ec58400ebe144a9eb5774227.webp', 2),
(34, '2023-05-10 15:24:45.517000', '2023-05-10 15:24:45.517000', 'VIGJS2S1-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/59d5d800fd774612aee3c3463964b7d1.webp', 2),
(35, '2023-05-10 15:42:18.902000', '2023-05-10 15:42:18.902000', 'E9RIA9YG-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/a30242a0a24f4f7e9f8e23c70677135f.webp', 3),
(36, '2023-05-10 15:42:18.910000', '2023-05-10 15:42:18.910000', 'E9RIA9YG-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/76dd56c06e514abbb5596039217eb56b.webp', 3),
(37, '2023-05-10 15:42:18.910000', '2023-05-10 15:42:18.910000', 'E9RIA9YG-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/3a0edff4d0d04167a13352b1a44f0311.webp', 3),
(38, '2023-05-10 15:42:18.910000', '2023-05-10 15:42:18.910000', 'E9RIA9YG-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/9f3fab2045744cad815363f460ad60b8.webp', 3),
(39, '2023-05-10 15:42:18.910000', '2023-05-10 15:42:18.910000', 'E9RIA9YG-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/67b3208407b74beba6a18d5e0f734338.webp', 3),
(40, '2023-05-10 15:42:18.910000', '2023-05-10 15:42:18.910000', 'E9RIA9YG-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/8c7d456f32b9495d87327600a63858b4.webp', 3),
(41, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', '3I0CPAF9-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/436f6ee37f4a44c2b0955481a1377847.webp', 3),
(42, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', '3I0CPAF9-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/e1c54f42d3ce4a81bbc51104592e5452.webp', 3),
(43, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', '3I0CPAF9-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9b3a6ef6fcb64cddb5080f25d6ae6631.webp', 3),
(44, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', '3I0CPAF9-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/7487e53b8eaa41698510470874d31ad3.webp', 3),
(45, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', '3I0CPAF9-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/36f813f625f24260a63a71ebfdc900dc.webp', 3),
(46, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', '3I0CPAF9-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/a23c90530248412da1cc7fa6c5f44061.webp', 3),
(47, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', 'PGW4MST3-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/6c6267652feb4c4989644ffadebe82f4.webp', 3),
(48, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', 'PGW4MST3-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/a72c54d3b47c4f60aa16660eb13727f0.webp', 3),
(49, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', 'PGW4MST3-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/72fe2501f87b47cbbb4648cce95651d2.webp', 3),
(50, '2023-05-10 15:42:18.926000', '2023-05-10 15:42:18.926000', 'PGW4MST3-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/d8a5ccac07bd4663b4331cb3c8138657.webp', 3),
(51, '2023-05-10 15:42:18.938000', '2023-05-10 15:42:18.938000', 'PGW4MST3-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/bc2dc976356b4a008df9ed933186d6d4.webp', 3),
(52, '2023-05-10 15:48:03.290000', '2023-05-10 15:48:03.290000', 'WDLV32UF-TIM', 'http://localhost:8080/api/v1/admin/FileUpload/f276e868a7f048669fc1b9fd35314493.webp', 4),
(53, '2023-05-10 15:48:03.290000', '2023-05-10 15:48:03.290000', 'WDLV32UF-TIM', 'http://localhost:8080/api/v1/admin/FileUpload/f712a1e6b91c4dc38de5206415e40b38.webp', 4),
(54, '2023-05-10 15:48:03.290000', '2023-05-10 15:48:03.290000', 'WDLV32UF-TIM', 'http://localhost:8080/api/v1/admin/FileUpload/72b92335675746adb077dca169126bd9.webp', 4),
(55, '2023-05-10 15:48:03.297000', '2023-05-10 15:48:03.297000', 'WDLV32UF-TIM', 'http://localhost:8080/api/v1/admin/FileUpload/f1a6e05c3155436e82eb9c60defc617c.webp', 4),
(56, '2023-05-10 15:48:03.297000', '2023-05-10 15:48:03.297000', 'WDLV32UF-TIM', 'http://localhost:8080/api/v1/admin/FileUpload/a778f9dddbd9499ab0180aacc2527137.webp', 4),
(57, '2023-05-10 15:48:03.297000', '2023-05-10 15:48:03.297000', 'DX15N8C4-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/e50ef0d641cb43d9b4b974191464d9f9.webp', 4),
(58, '2023-05-10 15:48:03.297000', '2023-05-10 15:48:03.297000', 'DX15N8C4-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/bdf1ae9907514e3fac7ce1840d034b14.webp', 4),
(59, '2023-05-10 15:48:03.297000', '2023-05-10 15:48:03.297000', 'DX15N8C4-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/5b0bca7893ed46d690a3baf424ceca4a.webp', 4),
(60, '2023-05-10 15:48:03.301000', '2023-05-10 15:48:03.301000', 'DX15N8C4-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/c16b3c49410d443297e838305c914e05.webp', 4),
(61, '2023-05-10 15:48:03.301000', '2023-05-10 15:48:03.301000', 'DX15N8C4-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/71040012c3894626b26e3c62ebf66ebd.webp', 4),
(62, '2023-05-10 15:48:03.301000', '2023-05-10 15:48:03.301000', 'DX15N8C4-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/f75ae0b1a4fe4c1797116d536ca9b7dd.webp', 4),
(63, '2023-05-10 15:48:03.309000', '2023-05-10 15:48:03.309000', '1JVZH525-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/856db83ad62c489abfc9fa002bcc3ffa.webp', 4),
(64, '2023-05-10 15:48:03.309000', '2023-05-10 15:48:03.309000', '1JVZH525-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9d10370d1552491b866df983b3662c79.webp', 4),
(65, '2023-05-10 15:48:03.309000', '2023-05-10 15:48:03.309000', '1JVZH525-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/6a059b1e9fdd4855b885ea6bec89c448.webp', 4),
(66, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', '1JVZH525-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/24a44d720ed94ad5886740cf4ca6565a.webp', 4),
(67, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', '1JVZH525-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/a51044876ae74f48833b16f190571f38.webp', 4),
(68, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', '1JVZH525-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/e520a8853c4c49fda56ad95ecb8cd163.webp', 4),
(69, '2023-05-10 15:55:37.532000', '2023-05-10 15:55:37.532000', 'JLEXAFJ1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/f93bcb26d7964e71b19badd6eea6acb6.webp', 5),
(70, '2023-05-10 15:55:37.538000', '2023-05-10 15:55:37.538000', 'JLEXAFJ1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/28de1be04c644f089871e5516e0dbbee.webp', 5),
(71, '2023-05-10 15:55:37.539000', '2023-05-10 15:55:37.539000', 'JLEXAFJ1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/e3e45fcfee9f445bb7ae5befcf8417ce.webp', 5),
(72, '2023-05-10 15:55:37.540000', '2023-05-10 15:55:37.540000', 'JLEXAFJ1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/719b78a4176741b8830f6e86819ca75c.webp', 5),
(73, '2023-05-10 15:55:37.540000', '2023-05-10 15:55:37.540000', 'JLEXAFJ1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/cfd64b15990343829f8c47e703734f00.webp', 5),
(74, '2023-05-10 15:55:37.541000', '2023-05-10 15:55:37.541000', 'JLEXAFJ1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/6375075fe2e242e882af36f8fa1a6b37.webp', 5),
(75, '2023-05-10 15:55:37.542000', '2023-05-10 15:55:37.542000', '7I2SP06T-TIM THAN', 'http://localhost:8080/api/v1/admin/FileUpload/f0cd2df9e10948699a469e9c5a9d8c48.webp', 5),
(76, '2023-05-10 15:55:37.542000', '2023-05-10 15:55:37.542000', '7I2SP06T-TIM THAN', 'http://localhost:8080/api/v1/admin/FileUpload/d2888c05662e4395abab2f817505bd71.webp', 5),
(77, '2023-05-10 15:55:37.542000', '2023-05-10 15:55:37.542000', '7I2SP06T-TIM THAN', 'http://localhost:8080/api/v1/admin/FileUpload/7be24511fde743228766842f7050bf19.webp', 5),
(78, '2023-05-10 15:55:37.544000', '2023-05-10 15:55:37.544000', '7I2SP06T-TIM THAN', 'http://localhost:8080/api/v1/admin/FileUpload/9888d6bb64784234bcf8ec543d44fe73.webp', 5),
(79, '2023-05-10 15:55:37.549000', '2023-05-10 15:55:37.549000', '7I2SP06T-TIM THAN', 'http://localhost:8080/api/v1/admin/FileUpload/84ca006b83534aaeba602aa2aa4efaae.webp', 5),
(80, '2023-05-10 15:55:37.549000', '2023-05-10 15:55:37.549000', 'QCJQMZJS-XAM', 'http://localhost:8080/api/v1/admin/FileUpload/a7bbd92034dc4879ba74a84409381f2e.webp', 5),
(81, '2023-05-10 15:55:37.550000', '2023-05-10 15:55:37.550000', 'QCJQMZJS-XAM', 'http://localhost:8080/api/v1/admin/FileUpload/9870a665978140ffafdf8773f5f33414.webp', 5),
(82, '2023-05-10 15:55:37.551000', '2023-05-10 15:55:37.551000', 'QCJQMZJS-XAM', 'http://localhost:8080/api/v1/admin/FileUpload/e3279d7fdbff487b857c61f1ddc39461.webp', 5),
(83, '2023-05-10 15:55:37.551000', '2023-05-10 15:55:37.551000', 'QCJQMZJS-XAM', 'http://localhost:8080/api/v1/admin/FileUpload/66f80c374e3947358f962e3569d6c4c6.webp', 5),
(84, '2023-05-10 15:55:37.552000', '2023-05-10 15:55:37.552000', 'QCJQMZJS-XAM', 'http://localhost:8080/api/v1/admin/FileUpload/8491579a5f9641a0b755b1b359b58d32.webp', 5),
(85, '2023-05-10 15:55:37.552000', '2023-05-10 15:55:37.552000', 'QCJQMZJS-XAM', 'http://localhost:8080/api/v1/admin/FileUpload/b5a2fae0faf6425988e861530e3fb5a9.webp', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `size` varchar(5) DEFAULT NULL,
  `sku` varchar(15) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `create_at`, `update_at`, `color`, `image`, `size`, `sku`, `product_id`) VALUES
(1, '2023-05-09 22:50:03.020000', '2023-05-09 22:50:03.020000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/74f27f5375fa40d1a49acb159f0a4121.webp', 'XL', '59PN06MP-NAU', 1),
(2, '2023-05-09 22:50:03.021000', '2023-05-09 22:50:03.021000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/74f27f5375fa40d1a49acb159f0a4121.webp', 'S', '59PN06MP-NAU', 1),
(3, '2023-05-09 22:50:03.021000', '2023-05-09 22:50:03.021000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/74f27f5375fa40d1a49acb159f0a4121.webp', 'M', '59PN06MP-NAU', 1),
(4, '2023-05-09 22:50:03.022000', '2023-05-09 22:50:03.022000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/74f27f5375fa40d1a49acb159f0a4121.webp', 'L', '59PN06MP-NAU', 1),
(5, '2023-05-09 22:50:03.022000', '2023-05-09 22:50:03.022000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/de01b2ec24554bed864863aa978a618d.webp', 'XL', 'KADN4BV4-XANH', 1),
(6, '2023-05-09 22:50:03.023000', '2023-05-09 22:50:03.023000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/de01b2ec24554bed864863aa978a618d.webp', 'S', 'KADN4BV4-XANH', 1),
(7, '2023-05-09 22:50:03.023000', '2023-05-09 22:50:03.023000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/de01b2ec24554bed864863aa978a618d.webp', 'M', 'KADN4BV4-XANH', 1),
(8, '2023-05-09 22:50:03.024000', '2023-05-09 22:50:03.024000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/de01b2ec24554bed864863aa978a618d.webp', 'L', 'KADN4BV4-XANH', 1),
(9, '2023-05-09 22:50:03.024000', '2023-05-09 22:50:03.024000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/e76e340b699448df9dce866d4a09e9ab.webp', 'XL', '7FJ2T4SK-VANG', 1),
(10, '2023-05-09 22:50:03.024000', '2023-05-09 22:50:03.024000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/e76e340b699448df9dce866d4a09e9ab.webp', 'S', '7FJ2T4SK-VANG', 1),
(11, '2023-05-09 22:50:03.025000', '2023-05-09 22:50:03.025000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/e76e340b699448df9dce866d4a09e9ab.webp', 'M', '7FJ2T4SK-VANG', 1),
(12, '2023-05-09 22:50:03.025000', '2023-05-09 22:50:03.025000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/e76e340b699448df9dce866d4a09e9ab.webp', 'L', '7FJ2T4SK-VANG', 1),
(13, '2023-05-10 15:24:45.518000', '2023-05-10 15:24:45.519000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/8b2ab80d88084e5b8fb743cd431be73e.webp', 'XL', 'Z1IMKXOW-NAU', 2),
(14, '2023-05-10 15:24:45.519000', '2023-05-10 15:24:45.519000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/8b2ab80d88084e5b8fb743cd431be73e.webp', 'S', 'Z1IMKXOW-NAU', 2),
(15, '2023-05-10 15:24:45.520000', '2023-05-10 15:24:45.520000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/8b2ab80d88084e5b8fb743cd431be73e.webp', 'M', 'Z1IMKXOW-NAU', 2),
(16, '2023-05-10 15:24:45.521000', '2023-05-10 15:24:45.521000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/8b2ab80d88084e5b8fb743cd431be73e.webp', 'L', 'Z1IMKXOW-NAU', 2),
(17, '2023-05-10 15:24:45.521000', '2023-05-10 15:24:45.521000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2afda19ccad5434ab60724e75b33850b.webp', 'XL', 'IOE3QCTN-ĐEN', 2),
(18, '2023-05-10 15:24:45.522000', '2023-05-10 15:24:45.522000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2afda19ccad5434ab60724e75b33850b.webp', 'S', 'IOE3QCTN-ĐEN', 2),
(19, '2023-05-10 15:24:45.523000', '2023-05-10 15:24:45.523000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2afda19ccad5434ab60724e75b33850b.webp', 'M', 'IOE3QCTN-ĐEN', 2),
(20, '2023-05-10 15:24:45.523000', '2023-05-10 15:24:45.523000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2afda19ccad5434ab60724e75b33850b.webp', 'L', 'IOE3QCTN-ĐEN', 2),
(21, '2023-05-10 15:24:45.525000', '2023-05-10 15:24:45.525000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/f9c4a2bf39d54bbb8b3619396ad7fe3c.webp', 'XL', 'VIGJS2S1-ĐO', 2),
(22, '2023-05-10 15:24:45.525000', '2023-05-10 15:24:45.525000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/f9c4a2bf39d54bbb8b3619396ad7fe3c.webp', 'S', 'VIGJS2S1-ĐO', 2),
(23, '2023-05-10 15:24:45.526000', '2023-05-10 15:24:45.526000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/f9c4a2bf39d54bbb8b3619396ad7fe3c.webp', 'M', 'VIGJS2S1-ĐO', 2),
(24, '2023-05-10 15:24:45.527000', '2023-05-10 15:24:45.527000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/f9c4a2bf39d54bbb8b3619396ad7fe3c.webp', 'L', 'VIGJS2S1-ĐO', 2),
(25, '2023-05-10 15:42:18.938000', '2023-05-10 15:42:18.938000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/a30242a0a24f4f7e9f8e23c70677135f.webp', 'XL', 'E9RIA9YG-ĐO', 3),
(26, '2023-05-10 15:42:18.938000', '2023-05-10 15:42:18.938000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/a30242a0a24f4f7e9f8e23c70677135f.webp', 'S', 'E9RIA9YG-ĐO', 3),
(27, '2023-05-10 15:42:18.938000', '2023-05-10 15:42:18.938000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/a30242a0a24f4f7e9f8e23c70677135f.webp', 'M', 'E9RIA9YG-ĐO', 3),
(28, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/a30242a0a24f4f7e9f8e23c70677135f.webp', 'L', 'E9RIA9YG-ĐO', 3),
(29, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/436f6ee37f4a44c2b0955481a1377847.webp', 'XL', '3I0CPAF9-XANH', 3),
(30, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/436f6ee37f4a44c2b0955481a1377847.webp', 'S', '3I0CPAF9-XANH', 3),
(31, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/436f6ee37f4a44c2b0955481a1377847.webp', 'M', '3I0CPAF9-XANH', 3),
(32, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/436f6ee37f4a44c2b0955481a1377847.webp', 'L', '3I0CPAF9-XANH', 3),
(33, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/6c6267652feb4c4989644ffadebe82f4.webp', 'XL', 'PGW4MST3-VANG', 3),
(34, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/6c6267652feb4c4989644ffadebe82f4.webp', 'S', 'PGW4MST3-VANG', 3),
(35, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/6c6267652feb4c4989644ffadebe82f4.webp', 'M', 'PGW4MST3-VANG', 3),
(36, '2023-05-10 15:42:18.942000', '2023-05-10 15:42:18.942000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/6c6267652feb4c4989644ffadebe82f4.webp', 'L', 'PGW4MST3-VANG', 3),
(37, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', 'Tím', 'http://localhost:8080/api/v1/admin/FileUpload/f276e868a7f048669fc1b9fd35314493.webp', 'XL', 'WDLV32UF-TIM', 4),
(38, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', 'Tím', 'http://localhost:8080/api/v1/admin/FileUpload/f276e868a7f048669fc1b9fd35314493.webp', 'S', 'WDLV32UF-TIM', 4),
(39, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', 'Tím', 'http://localhost:8080/api/v1/admin/FileUpload/f276e868a7f048669fc1b9fd35314493.webp', 'M', 'WDLV32UF-TIM', 4),
(40, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', 'Tím', 'http://localhost:8080/api/v1/admin/FileUpload/f276e868a7f048669fc1b9fd35314493.webp', 'L', 'WDLV32UF-TIM', 4),
(41, '2023-05-10 15:48:03.313000', '2023-05-10 15:48:03.313000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/e50ef0d641cb43d9b4b974191464d9f9.webp', 'XL', 'DX15N8C4-TRANG', 4),
(42, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/e50ef0d641cb43d9b4b974191464d9f9.webp', 'S', 'DX15N8C4-TRANG', 4),
(43, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/e50ef0d641cb43d9b4b974191464d9f9.webp', 'M', 'DX15N8C4-TRANG', 4),
(44, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/e50ef0d641cb43d9b4b974191464d9f9.webp', 'L', 'DX15N8C4-TRANG', 4),
(45, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/856db83ad62c489abfc9fa002bcc3ffa.webp', 'XL', '1JVZH525-XANH', 4),
(46, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/856db83ad62c489abfc9fa002bcc3ffa.webp', 'S', '1JVZH525-XANH', 4),
(47, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/856db83ad62c489abfc9fa002bcc3ffa.webp', 'M', '1JVZH525-XANH', 4),
(48, '2023-05-10 15:48:03.325000', '2023-05-10 15:48:03.325000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/856db83ad62c489abfc9fa002bcc3ffa.webp', 'L', '1JVZH525-XANH', 4),
(49, '2023-05-10 15:55:37.553000', '2023-05-10 15:55:37.553000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/f93bcb26d7964e71b19badd6eea6acb6.webp', 'XL', 'JLEXAFJ1-ĐEN', 5),
(50, '2023-05-10 15:55:37.554000', '2023-05-10 15:55:37.554000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/f93bcb26d7964e71b19badd6eea6acb6.webp', 'S', 'JLEXAFJ1-ĐEN', 5),
(51, '2023-05-10 15:55:37.555000', '2023-05-10 15:55:37.555000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/f93bcb26d7964e71b19badd6eea6acb6.webp', 'M', 'JLEXAFJ1-ĐEN', 5),
(52, '2023-05-10 15:55:37.556000', '2023-05-10 15:55:37.556000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/f93bcb26d7964e71b19badd6eea6acb6.webp', 'L', 'JLEXAFJ1-ĐEN', 5),
(53, '2023-05-10 15:55:37.556000', '2023-05-10 15:55:37.556000', 'Tím than', 'http://localhost:8080/api/v1/admin/FileUpload/f0cd2df9e10948699a469e9c5a9d8c48.webp', 'XL', '7I2SP06T-TIM TH', 5),
(54, '2023-05-10 15:55:37.557000', '2023-05-10 15:55:37.557000', 'Tím than', 'http://localhost:8080/api/v1/admin/FileUpload/f0cd2df9e10948699a469e9c5a9d8c48.webp', 'S', '7I2SP06T-TIM TH', 5),
(55, '2023-05-10 15:55:37.557000', '2023-05-10 15:55:37.557000', 'Tím than', 'http://localhost:8080/api/v1/admin/FileUpload/f0cd2df9e10948699a469e9c5a9d8c48.webp', 'M', '7I2SP06T-TIM TH', 5),
(56, '2023-05-10 15:55:37.558000', '2023-05-10 15:55:37.558000', 'Tím than', 'http://localhost:8080/api/v1/admin/FileUpload/f0cd2df9e10948699a469e9c5a9d8c48.webp', 'L', '7I2SP06T-TIM TH', 5),
(57, '2023-05-10 15:55:37.562000', '2023-05-10 15:55:37.562000', 'Xám', 'http://localhost:8080/api/v1/admin/FileUpload/a7bbd92034dc4879ba74a84409381f2e.webp', 'XL', 'QCJQMZJS-XAM', 5),
(58, '2023-05-10 15:55:37.564000', '2023-05-10 15:55:37.564000', 'Xám', 'http://localhost:8080/api/v1/admin/FileUpload/a7bbd92034dc4879ba74a84409381f2e.webp', 'S', 'QCJQMZJS-XAM', 5),
(59, '2023-05-10 15:55:37.564000', '2023-05-10 15:55:37.564000', 'Xám', 'http://localhost:8080/api/v1/admin/FileUpload/a7bbd92034dc4879ba74a84409381f2e.webp', 'M', 'QCJQMZJS-XAM', 5),
(60, '2023-05-10 15:55:37.565000', '2023-05-10 15:55:37.565000', 'Xám', 'http://localhost:8080/api/v1/admin/FileUpload/a7bbd92034dc4879ba74a84409381f2e.webp', 'L', 'QCJQMZJS-XAM', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `create_at`, `update_at`, `name`) VALUES
(1, '2023-03-22 13:14:08.000000', '2023-03-22 13:14:08.000000', 'ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `create_at`, `update_at`, `name`) VALUES
(1, '2023-04-02 16:08:20.000000', '2023-04-02 16:08:20.000000', 'XL'),
(2, '2023-04-02 16:08:20.000000', '2023-04-02 16:08:20.000000', 'S'),
(3, '2023-04-02 16:08:20.000000', '2023-04-02 16:08:20.000000', 'M'),
(4, '2023-04-02 16:08:20.000000', '2023-04-02 16:08:20.000000', 'L');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `create_at`, `update_at`, `email`, `fullname`, `password`) VALUES
(10, '2023-03-22 13:15:19.026000', '2023-03-22 13:15:19.026000', 'nguyendev2001@gmail.com', NULL, '$2a$10$fEYHAPNhksDC175WoD.JrOat4BiausNnd0u4lDHeQFLrNMWhluL1e');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(10, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  ADD KEY `FKemq71edpbn9wsxnxncfn1algp` (`variant_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1n91c4vdhw8pa4frngs4qbbvs` (`product_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKosqitn4s405cynmhb87lkvuau` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKemq71edpbn9wsxnxncfn1algp` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `FK1n91c4vdhw8pa4frngs4qbbvs` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `FKosqitn4s405cynmhb87lkvuau` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
