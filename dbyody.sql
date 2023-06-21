-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 21, 2023 lúc 05:02 PM
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
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `create_at`, `update_at`, `user_id`) VALUES
(4, '2023-05-27 14:40:35.797000', '2023-05-27 14:40:35.797000', 11),
(13, '2023-05-29 11:28:33.090000', '2023-05-29 11:28:33.090000', 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `variant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cart_item`
--

INSERT INTO `cart_item` (`id`, `create_at`, `update_at`, `quantity`, `cart_id`, `variant_id`) VALUES
(40, '2023-05-29 11:28:33.100000', '2023-05-29 11:28:33.100000', 3, 13, 157);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `create_at`, `update_at`, `name`, `parent_id`, `slug`) VALUES
(1, '2023-04-23 12:38:16.917000', '2023-04-23 12:38:16.917000', 'Nữ', 0, 'nu'),
(2, '2023-04-23 12:39:37.106000', '2023-04-23 12:39:37.106000', 'Áo Nữ', 1, 'ao-nu'),
(3, '2023-04-23 12:40:22.749000', '2023-04-23 12:40:22.749000', 'Quần nữ', 1, 'quan-nu'),
(4, '2023-04-23 12:42:08.964000', '2023-04-23 12:42:08.964000', 'Đồ mặc trong nữ', 1, 'o-mac-trong-nu'),
(5, '2023-04-23 12:42:36.042000', '2023-04-23 12:42:36.042000', 'Áo polo', 2, 'ao-polo'),
(6, '2023-04-23 12:43:03.198000', '2023-04-23 12:43:03.198000', 'Áo thun', 2, 'ao-thun'),
(7, '2023-04-23 12:43:43.643000', '2023-04-23 12:43:43.643000', 'Áo khoác', 2, 'ao-khoac'),
(8, '2023-04-23 12:56:16.617000', '2023-04-23 12:56:16.617000', 'Áo sơ mi', 2, 'ao-so-mi'),
(9, '2023-04-23 12:56:48.493000', '2023-04-23 12:56:48.493000', 'Quần Jeans', 3, 'quan-jeans'),
(10, '2023-04-23 12:59:21.434000', '2023-04-23 12:59:21.434000', 'Quần Âu', 3, 'quan-au'),
(11, '2023-04-23 12:59:33.127000', '2023-04-23 12:59:33.127000', 'Quần kaki', 3, 'quan-kaki'),
(12, '2023-04-23 12:59:51.847000', '2023-04-23 12:59:51.847000', 'Nam', 0, 'nam'),
(13, '2023-04-23 13:00:00.841000', '2023-04-23 13:00:00.841000', 'Trẻ em', 0, 'tre-em'),
(14, '2023-04-23 13:14:44.732000', '2023-04-23 13:14:44.732000', 'Áo giữ nhiệt', 4, 'ao-giu-nhiet'),
(15, '2023-05-16 14:18:59.624000', '2023-05-16 14:18:59.624000', 'Áo Nam', 12, 'ao-nam'),
(16, '2023-05-16 14:19:29.456000', '2023-05-16 14:19:29.456000', 'Áo Polo', 15, 'ao-polo'),
(17, '2023-05-16 14:19:47.152000', '2023-05-16 14:19:47.152000', 'Áo thun', 15, 'ao-thun'),
(18, '2023-05-16 14:20:28.241000', '2023-05-16 14:20:28.241000', 'Quần nam', 12, 'quan-nam'),
(19, '2023-05-16 14:21:10.234000', '2023-05-16 14:21:10.234000', 'Quần Jeans', 18, 'quan-jeans'),
(20, '2023-05-16 14:21:22.218000', '2023-05-16 14:21:22.218000', 'Quần kaki', 18, 'quan-kaki'),
(21, '2023-05-16 14:21:37.789000', '2023-05-16 14:21:37.789000', 'Quần Short', 18, 'quan-short'),
(22, '2023-05-16 14:22:10.910000', '2023-05-16 14:22:10.910000', 'Quần Âu', 18, 'quan-au'),
(24, '2023-05-28 21:58:44.351000', '2023-05-28 21:58:44.351000', 'Bộ Sưu Tập', 0, 'bo-suu-tap'),
(25, '2023-05-28 21:58:55.804000', '2023-05-28 21:58:55.804000', 'Đồng phục', 0, 'ong-phuc');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_username` varchar(50) NOT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `create_at`, `update_at`, `address`, `user_id`, `note`, `order_username`, `payment_type`, `phone`) VALUES
(4, '2023-05-27 15:24:36.520000', '2023-05-27 15:24:36.520000', 'e4et34', 12, 'dfrgv', 'ăf', 'COD', '35344'),
(5, '2023-05-27 15:27:34.394000', '2023-05-27 15:27:34.394000', 'eawfs', 12, 'èw', 'sâf', 'COD', 'rger'),
(6, '2023-05-27 15:28:25.582000', '2023-05-27 15:28:25.582000', '43634', 12, 'ewgfer', 'âgwe', 'COD', '42534'),
(7, '2023-05-27 16:19:46.013000', '2023-05-27 16:19:46.013000', '17/10 khu phố Tân Lập , Phường Đông Hòa , Thành phố Dĩ An ,Tỉnh Bình Dương .', 13, 'âssasdsa', 'Võ Chí Nguyên', 'COD', '0811235460'),
(8, '2023-05-27 16:32:45.626000', '2023-05-27 16:32:45.626000', '17/10 khu phố Tân Lập', 13, 'asdads', 'asdsas', 'COD', 'asdsad'),
(9, '2023-05-28 21:13:34.787000', '2023-05-28 21:13:34.787000', 'Xã Hiếu Phụng , Huyện  Vũng Liêm ,Tỉnh Vĩnh Long .', 13, 'wadass', 'Võ Chí Nguyên', 'COD', '1213123123'),
(10, '2023-05-28 22:16:52.208000', '2023-05-28 22:16:52.208000', '17/10 khu phố Tân Lập , Phường Đông Hòa , Thành phố Dĩ An ,Tỉnh Bình Dương .', 13, 'abc', 'Võ Chí Nguyên', 'COD', '0811235460'),
(11, '2023-05-29 08:55:30.067000', '2023-05-29 08:55:30.067000', '17/10 khu phố Tân Lập , Phường Đông Hòa , Thành phố Dĩ An ,Tỉnh Bình Dương .', 13, 'sdaasda', 'Võ Chí Nguyên', 'COD', '0811235460');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `create_at`, `update_at`, `quantity`, `order_id`, `variant_id`) VALUES
(9, '2023-05-27 15:24:36.521000', '2023-05-27 15:24:36.521000', 8, 4, 38),
(10, '2023-05-27 15:24:36.523000', '2023-05-27 15:24:36.523000', 4, 4, 39),
(11, '2023-05-27 15:27:34.394000', '2023-05-27 15:27:34.394000', 4, 5, 37),
(12, '2023-05-27 15:27:34.394000', '2023-05-27 15:27:34.394000', 1, 5, 39),
(13, '2023-05-27 15:27:34.394000', '2023-05-27 15:27:34.394000', 1, 5, 38),
(14, '2023-05-27 15:28:25.582000', '2023-05-27 15:28:25.582000', 1, 6, 52),
(15, '2023-05-27 15:28:25.582000', '2023-05-27 15:28:25.582000', 1, 6, 53),
(16, '2023-05-27 15:28:25.588000', '2023-05-27 15:28:25.588000', 9, 6, 54),
(17, '2023-05-27 16:19:46.013000', '2023-05-27 16:19:46.013000', 1, 7, 28),
(18, '2023-05-27 16:19:46.013000', '2023-05-27 16:19:46.013000', 2, 7, 29),
(19, '2023-05-27 16:19:46.013000', '2023-05-27 16:19:46.013000', 1, 7, 30),
(20, '2023-05-27 16:19:46.020000', '2023-05-27 16:19:46.020000', 1, 7, 32),
(21, '2023-05-27 16:32:45.627000', '2023-05-27 16:32:45.627000', 1, 8, 27),
(22, '2023-05-27 16:32:45.638000', '2023-05-27 16:32:45.638000', 5, 8, 63),
(23, '2023-05-28 21:13:34.787000', '2023-05-28 21:13:34.787000', 5, 9, 27),
(24, '2023-05-28 21:13:34.787000', '2023-05-28 21:13:34.787000', 4, 9, 29),
(25, '2023-05-28 22:16:52.214000', '2023-05-28 22:16:52.214000', 1, 10, 27),
(26, '2023-05-28 22:16:52.220000', '2023-05-28 22:16:52.220000', 1, 10, 30),
(27, '2023-05-29 08:55:30.067000', '2023-05-29 08:55:30.067000', 1, 11, 219),
(28, '2023-05-29 08:55:30.078000', '2023-05-29 08:55:30.078000', 4, 11, 223);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `create_at`, `update_at`, `description`, `name`, `price`, `slug`, `category_id`) VALUES
(4, '2023-05-27 13:28:09.871000', '2023-05-27 13:28:09.871000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 272px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"Áo Polo Nữ Coolmax Phối Bo\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-coolmax-01dfb7ed-c9e5-402e-adb6-a82bf151c716.jpg?v=1681366149264\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo được làm từ vải coolmax nên nhẹ, xốp, thoáng mát, truyền dẫn ẩm tốt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí, hút ẩm cực tốt và cực kỳ nhanh khô</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sản phẩm có tính đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế phối nẹp 3 cúc cao cấp, bo phần gấu tay và cổ làm cho sản phẩm sang trọng &amp; tiện lợi hơn.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Polo Nữ Coolmax Phối Bo', '250000.00', 'ao-polo-nu-coolmax-phoi-bo', 5),
(16, '2023-05-27 12:46:15.900000', '2023-05-27 12:46:15.900000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 194px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun nữ chất liệu Bamboo: 95% Bamboo + 5% Spandex</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sợi vải được làm từ tre nên rất lành tính, thân thiện môi trường</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Mềm mại, thông thoáng, an toàn với làn da</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Co giãn đàn hồi, có độ bền cao</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế cổ tim, dáng suông dễ mặc</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Rất tiện dụng, dễ phối với nhiều trang phục: quần short, quần jeans, kaki, chân váy...</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Thun Nữ Cổ Tim Bamboo', '199000.00', 'ao-thun-nu-co-tim-bamboo', 6),
(17, '2023-05-27 12:49:13.386000', '2023-05-27 12:49:13.386000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 194px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu vải Bột Ngô</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thành phần 80% Cotton + 20% I-scra Softcool</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu thân thiện với môi trường.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Vải&nbsp;siêu mềm mượt, thấm hút mồ hôi mang lại cảm giác&nbsp;thoải mái</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Kiểu dáng suông rộng, trẻ trung, cá tính, điểm nhấn là hình thêu phối trước ngực mềm mại.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Dễ dàng phối đồ cùng quần hoặc chân váy, đi làm, đi chơi đều rất phù hợp.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Thun Nữ Vải Bột Ngô Thêu Think Different', '249000.00', 'ao-thun-nu-vai-bot-ngo-theu-think-different', 6),
(18, '2023-05-27 12:58:46.741000', '2023-05-27 12:58:46.741000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun nữ&nbsp;chất liệu cotton double face siêu&nbsp;mềm mại, thoáng mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Vải có độ bền cao, thấm hút mồ hồi tốt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Kiểu dáng suông trơn, thiết kế vừa vặn với dáng người, mặc tôn dáng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Mang hơi thở của sự hiện đại, năng động và khoẻ khoắn</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể hợp với nhiều trang phục khác nhau để đi chơi, dạo phố, đi làm, đi học</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Phông Nữ Basic Cotton Double Face Siêu Mềm Mại', '249000.00', 'ao-phong-nu-basic-cotton-double-face-sieu-mem-mai', 6),
(19, '2023-05-27 13:10:00.668000', '2023-05-27 13:10:00.668000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun nữ kỳ tôn dáng dành cho phái đẹp</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế ôm bo, cổ tim mang giúp tôn lên những đường cong cơ thể</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chiếc cổ cách điệu tạo điểm nhấn mới mẻ cho sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Màu sắc đa dạng, phù hợp với đa dạng sở thích người mặc</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo mềm mại, co giãn nhẹ và phù hợp mặc đi chơi, đi làm đều xinh</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Thun Zip Nữ Dáng Ôm Cổ V', '230000.00', 'ao-thun-zip-nu-dang-om-co-v', 6),
(20, '2023-05-27 13:13:01.791000', '2023-05-27 13:13:01.791000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 296px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"T-shirt Yoguu In Breakfast Cotton USA\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-cotton-usa-d9508fe0-8f84-49a5-ba97-6a83764db8fc.jpg?v=1681792272851\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun Yoguu dành cho Gen Z&nbsp;chất liệu Cotton USA siêu thoáng mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">NHẸ, MÁT: Được trồng bằng phương pháp khoa học, kỹ thuật cao nên tạo ra xơ bông dai và dài hơn tạo nên kết cấu nhẹ và thông thoáng khi mặc.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">MỀM MẠI TỰ NHIÊN: Chất lượng sợi được xoắn từ những xơ bông dài, và chắc giúp giảm tối đa độ xù lông trên bề mặt vải.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Nằm trong dòng Sản phẩm Yoguu mang đến những thiết kế mới mẻ nhất cho các bạn trẻ</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'T-Shirt Yoguu In Breakfast Cotton USA', '330000.00', 't-shirt-yoguu-in-breakfast-cotton-usa', 6),
(21, '2023-05-27 13:16:46.548000', '2023-05-27 13:16:46.548000', '<h1 class=\"title-head mb-1\" style=\"font-family: SVN-Gilroy; font-weight: 600; line-height: 32px; color: rgb(23, 25, 28); font-size: 20px; text-transform: capitalize;\"><div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px; font-weight: 400; text-transform: none;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div></h1><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><h1 class=\"title-head mb-1\" style=\"font-family: SVN-Gilroy; font-weight: 600; line-height: 32px; color: rgb(23, 25, 28); font-size: 20px; text-transform: capitalize;\"><div class=\"accordion-panel\" style=\"max-height: 368px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px; font-weight: 400; text-transform: none;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"Áo Phông Nữ In Chữ Nicest Vải Bột Ngô\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-hightlight-aa37b77b-2368-4f00-aa7e-a1445eaca6ec.jpg?v=1682044249214\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun nữ chất liệu bột ngô, thành phần:&nbsp;80% Cotton + 20% I-scra Softcool</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Vải sử dụng loại sợi co giãn đặc biệt: Iscra - loại sợi sinh học thế hệ mới được chiết xuất từ ngô</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu thân thiện với môi trường</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sản phẩm thông thoáng, mềm mại, thấm hút hiệu quả</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Co giãn tốt phù hợp với chuyển động cơ thể</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế suông năng động, hình in nổi bật trước ngực</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể kết hợp với nhiều trang phục và mặc trong nhiều hoàn cảnh khác nhau</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div></h1>', 'Áo Phông Nữ In Chữ Nicest Vải Bột Ngô Đẹp', '299000.00', 'ao-phong-nu-in-chu-nicest-vai-bot-ngo-ep', 6),
(23, '2023-05-27 13:22:47.800000', '2023-05-27 13:22:47.800000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 272px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"T-Shirt Nữ Cơ Bản In Creative Bột Ngô\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-hightlight-f28a149e-bcc4-4486-9306-39b249e8b7f7.jpg?v=1682043842118\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun nữ bột ngô, chất liệu siêu mềm mại, thoải mái, mát và thấm hút tốt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Phom cơ bản, điểm nhấn&nbsp;là hình in decal phản quang đổi màu cá&nbsp;tính</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo dễ mặc, phù hợp với nhiều đối tượng khác nhau</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể kết hợp cùng quần jeans, short, chân váy,... mặc đi chơi, đi làm hay ở nhà đều được</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'T-Shirt Nữ Cơ Bản In Creative Bột Ngô', '299000.00', 't-shirt-nu-co-ban-in-creative-bot-ngo', 6),
(24, '2023-05-27 13:25:47.772000', '2023-05-27 13:25:47.772000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 296px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"Áo Thun Nữ Cotton USA Thêu Gấu Trẻ Trung\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-cotton-usa-4afe01a2-e8e9-4af9-a054-805bda4304e5.jpg?v=1682483668914\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo thun nữ YODY thêu gấu vô cùng hiện đại</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sản phẩm được làm từ vải Cotton Compact - sợi bông USA cao cấp hàng đầu thế giới</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Đây là loại sợi chất lượng cao, có độ mảnh và khả năng nhuộm ưu việt cùng khả năng thấm hút mồ hôi tốt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo mặc thoáng mát, rất thích hợp với thời tiết nóng ẩm Việt Nam</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Co giãn nhẹ, phù hợp với chuyển động của cơ thể</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Thun Nữ Cotton USA Thêu Gấu Trẻ Trung', '249000.00', 'ao-thun-nu-cotton-usa-theu-gau-tre-trung', 6),
(25, '2023-05-27 13:30:14.173000', '2023-05-27 13:30:14.173000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 194px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo croptop nữ cá&nbsp;tính với chữ in nổi bật trước ngực, in puff tạo hiệu ứng nổi đặc biệt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế phần nách được cắt cách điệu, thoải mái</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu thun rib co giãn tốt, giữ form khi mặc</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể phối&nbsp;theo phong cách cá tính với quần suông, jogger, chân váy, quần&nbsp;jeans hay&nbsp;phong cách cơ bản cùng jeans, chân váy, quần short</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thích hợp mặc đi chơi, đi làm hoặc đi học</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'T-Shirt Nữ Rcroptop In Chữ', '199000.00', 't-shirt-nu-rcroptop-in-chu', 6),
(26, '2023-05-27 14:49:39.823000', '2023-05-27 14:49:39.823000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo phông nữ&nbsp;chất liệu cotton USA cao cấp mềm mại, thấm hút và mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Kiểu dáng freesize rộng mang đến sự&nbsp;thoải mái khi mặc</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Điểm nhấn hình in mảng lớn nổi bật với chú mèo đeo kính</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thích hợp để tôn lên nét&nbsp;trẻ trung, cá tính của chị em</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể mix với quần short, chân váy hoặc quần jeans mặc đi chơi, đi làm</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Phông Nữ Cotton USA In Hình Cá Tính Đẹp', '299000.00', 'ao-phong-nu-cotton-usa-in-hinh-ca-tinh-ep', 6),
(27, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 146px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ tay dài dáng rộng trẻ trung</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Cổ bẻ, khuy dọc thân trước, cầu vai phía sau và một túi ngực mở</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Vai ráp trễ, tay dài với măng sét cài khuy và vạt hơi tròn. Thân sau hơi dài hơn</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế&nbsp;thời thượng, rất thích hợp để diện trong mùa hè này</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Sơ Mi Dài Tay Nữ Thô Dáng Rộng', '469000.00', 'so-mi-dai-tay-nu-tho-dang-rong', 8),
(28, '2023-05-27 14:55:20.996000', '2023-05-27 14:55:20.996000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 218px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu vải: Nano</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Bề mặt vải mềm mại, thoáng mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thoải mái làm việc, vui chơi khi mồ hôi được thấm hút nhanh chóng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sợi Nano siêu&nbsp;nhỏ hơn đường kính sợi tóc nhiều lần nên kết cấu vải đanh</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Không nhăn tự nhiên từ sợi nên sẽ không nhăn bền vững và an toàn với da</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Họa tiết nàng&nbsp;tiên cá in trên nền vải tạo điểm nhấn hút mắt người đối diện</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Phù hợp với tất cả những hoạt động dù đi làm, hay đi chơi</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Tay Ngắn Nano In Họa Tiết', '470000.00', 'ao-so-mi-nu-tay-ngan-nano-in-hoa-tiet', 8),
(29, '2023-05-27 14:58:52.324000', '2023-05-27 14:58:52.324000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu vải: 100% Nano Polyester mềm mại, thoáng mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Khả năng thấm hút nhanh, không nhăn</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sợi Nano siêu&nbsp;nhỏ hơn đường kính sợi tóc nhiều lần nên kết cấu vải đanh</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Họa tiết&nbsp;trên nền vải tạo điểm nhấn</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Phù hợp với tất cả những hoạt động dù đi làm hay đi chơi</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Tay Ngắn Vai Chờm In Họa Tiết', '449000.00', 'ao-so-mi-nu-tay-ngan-vai-chom-in-hoa-tiet', 8),
(30, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 146px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ phối nơ đầy nữ tính dành riêng cho các tín đồ của sơ mi&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chiếc áo nhẹ và siêu&nbsp;bền form</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế trẻ trung với điểm nhấn là chiếc nơ buộc lệch giúp chiếc áo trở nên tinh tế dịu&nbsp;dàng hơn</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Sơ mi nữ cộc tay có&nbsp;thể mix match với quần âu, chân váy. tự tin khi diện nơi công sở hay những buổi cà phê, gặp gỡ bạn bè</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Cộc Tay Cổ Nơ', '359000.00', 'ao-so-mi-nu-coc-tay-co-no', 8),
(31, '2023-05-27 15:04:35.572000', '2023-05-27 15:04:35.572000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ cách điệu nữ tính, thanh lịch</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu vải mềm nhẹ in hoạ tiết chấm bi bắt mắt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế dáng suông thoáng mát, điệu đà với phần tay tiên 2 tầng, nữ tính mang đến cho outfit của các chị em điểm nhấn ấn tượng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo phù hợp mặc đi làm, đi chơi kết hợp với chân váy quần âu thanh lịch</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Tay Loe Chấm Bi Trẻ Trung', '399000.00', 'ao-so-mi-nu-tay-loe-cham-bi-tre-trung', 8),
(32, '2023-05-27 15:10:50.966000', '2023-05-27 15:10:50.966000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\"><div><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ sát nách siêu thoải mái, hiện đại</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế tay ngắn sát nách dành riêng cho mùa hè, mặc sơ mi không lo gò bó</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất vải cafe thoáng, thấm hút mồ hôi tốt, được sự ưa thích của hàng triệu khách hàng YODY</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Đường may tỉ mỉ, các chi tiết cổ áo, khuy áo, tay áo đều rất chắc chắn những vẫn mang lại nét nữ tính, nhẹ nhàng cho các chị em.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div></div></div>', 'Áo Sơ Mi Nữ Dáng Suông Sát Nách', '399000.00', 'ao-so-mi-nu-dang-suong-sat-nach', 8),
(33, '2023-05-27 15:13:37.857000', '2023-05-27 15:13:37.857000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 170px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ chất liệu mềm mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Kiểu dáng croptop ôm eo cực tôn dáng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Nữ tính nhẹ nhàng nhưng vô cùng hút mắt với phần nơ phía sau</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Tay suông rủ giúp che đi phần bắp tay to&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể kết hợp cùng quần âu, chân váy thanh lịch để nàng diện đi làm, đi chơi</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Kiểu Croptop Tay Ngắn Đai Nơ', '399000.00', 'ao-so-mi-nu-kieu-croptop-tay-ngan-ai-no', 8),
(34, '2023-05-27 15:16:12.874000', '2023-05-27 15:16:12.874000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 146px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ dài tay thiết kế hiện đại</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu vải cotton mềm mại, thấm hút tốt, thoải mái khi mặc</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế túi ốp khoẻ khoắn nhưng không cứng nhắc</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thích hợp phối cùng quần âu, quần jean, quần short để đi làm, đi chơi, đi học...</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Tay Dài Túi Ốp', '469000.00', 'ao-so-mi-nu-tay-dai-tui-op', 8),
(35, '2023-05-27 15:19:46.701000', '2023-05-27 15:19:46.701000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 194px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ tay dài làm từ&nbsp;vải voan mềm mại</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Kiểu dáng suông thoải mái cùng đường may tinh tế, chắc chắn</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Cổ bèo cùng thiết kế tay dài nữ tính</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Có thể phối với chân váy hoá \"nàng thơ\" dịu dàng hay quần âu trở thành quý cô thanh lịch</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thích hợp để nàng mặc đi làm, đi chơi, dạo phố</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Tay Dài Cổ Bèo Dáng Suông', '384000.00', 'ao-so-mi-nu-tay-dai-co-beo-dang-suong', 8),
(36, '2023-05-27 15:21:50.648000', '2023-05-27 15:21:50.648000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 146px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo sơ mi nữ suông tay dài</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế trẻ trung thêu hình gấu ở ngực tạo điểm nhấn riêng biệt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất vải Rayon, polyester giúp đứng form và hạn chế nhăn nhàu rất tốt</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo mềm, co giãn vừa đủ, thoải mái cho người sử dụng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Sơ Mi Nữ Tay Dài Dáng Suông Ngực Thêu Gấu', '279000.00', 'ao-so-mi-nu-tay-dai-dang-suong-nguc-theu-gau', 8),
(38, '2023-05-28 21:48:16.897000', '2023-05-28 21:48:16.897000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 296px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"Áo Polo Nữ Tay Ngắn Pique Mắt Chim Phối Bo Thoáng Khí\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-mat-chim-6a406297-73e2-43fa-9be7-23531d98a7c2.jpg?v=1681791176822\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu mắt chim hiệu ứng độc đáo, mới lạ và trẻ trung</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Chất liệu áo thoáng mát, thấm hút tốt có độ bền cao</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Co giãn tốt mà vẫn giữ được form dáng và bền màu</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Thiết kế áo polo nữ với kiểu dáng suông cơ bản nên rất dễ mặc với mọi người</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo polo nữ form rộng sẽ giúp bạn có thể mặc thoải mái mỗi ngày, tự tin trong mọi hoạt động sinh hoạt hàng ngày</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Polo Nữ Tay Ngắn Pique Mắt Chim Phối Bo Thoáng Khí', '290000.00', 'ao-polo-nu-tay-ngan-pique-mat-chim-phoi-bo-thoang-khi', 5),
(39, '2023-05-28 21:52:38.424000', '2023-05-28 21:52:38.424000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 146px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo polo nữ&nbsp;Airycool làm từ&nbsp;85% Freezing Polyamide + 15% Spandex</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Mặc siêu mát nhờ công nghệ làm mát FREEZING&nbsp;tiên tiến</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Mềm mịn, thấm hút tốt và khô nhanh</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Co giãn tốt, giữ phom trong quá trình sử dụng</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Polo Nữ Airycool In YODY', '290000.00', 'ao-polo-nu-airycool-in-yody', 5);
INSERT INTO `products` (`id`, `create_at`, `update_at`, `description`, `name`, `price`, `slug`, `category_id`) VALUES
(40, '2023-05-28 21:56:45.341000', '2023-05-28 21:56:45.341000', '<div style=\"color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"property-outstanding\" style=\"padding: 19px 12px;\">Đặc tính nổi bật</div></div><div class=\"accordion-panel\" style=\"max-height: 296px; overflow: hidden; transition: max-height 0.25s linear 0s; color: rgb(0, 0, 0); font-family: SVN-Gilroy, sans-serif; font-size: 18px;\"><div class=\"accordion-content\" style=\"font-family: SVN-Gilroy; font-size: 14px; line-height: 24px; padding-top: 4px; padding-bottom: 12px;\"><div id=\"product-dactinh\" class=\"km-hot\"><div class=\"box-km\"><h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;SVN-Gilroy Bold&quot;; line-height: 1.4; color: inherit; font-size: 16px;\"></h2><div class=\"box-promotion\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\"><img alt=\"Áo Polo Nữ Cafe Cổ Trơn Siêu Nhẹ Thoáng Khí\" data-thumb=\"original\" original-height=\"120\" original-width=\"820\" src=\"https://bizweb.dktcdn.net/100/438/408/files/product-highlight-scafe-80888856-0161-4fb4-92a1-c5604517ca12.jpg?v=1681783916892\" style=\"border: 0px none; max-width: 100%; height: auto; margin: 0px 0px 10px;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Áo polo Vải Cafe được làm từ bột bã cafe có đặc tính siêu nhẹ, siêu mát</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Nổi bật vượt trội với khả năng kiểm soát mùi cơ thể tự nhiên và chống tia UV</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">An toàn cho da, thân thiện môi trường</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">Các đường nét cắt vải được làm mềm mại hơn, form áo tối ưu cho nữ giới giúp chị em có thể tôn lên vóc dáng thon gọn của mình</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-left: 25px; position: relative;\">YODY - Look good. Feel good.</p></div></div></div></div></div>', 'Áo Polo Nữ Cafe Cổ Trơn Siêu Nhẹ Thoáng Khí', '290000.00', 'ao-polo-nu-cafe-co-tron-sieu-nhe-thoang-khi', 5),
(41, '2023-05-29 11:30:49.115000', '2023-05-29 11:30:49.115000', 'demo&nbsp;', 'sản phâm demo', '290000.00', 'san-pham-demo', 5);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `create_at`, `update_at`, `name`, `src`, `product_id`) VALUES
(44, '2023-05-27 13:28:09.875000', '2023-05-27 13:28:09.875000', 'P8EK4MBA-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/92f3fbe8f45c480bbbb1e162f88a251c.webp', 4),
(45, '2023-05-27 13:28:09.879000', '2023-05-27 13:28:09.879000', 'P8EK4MBA-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1d97b62bd2344edbbc9732a09a1dcc65.webp', 4),
(46, '2023-05-27 13:28:09.880000', '2023-05-27 13:28:09.880000', 'P8EK4MBA-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/43dc34178c614379a653442ab2c299de.webp', 4),
(47, '2023-05-27 13:28:09.880000', '2023-05-27 13:28:09.880000', 'P8EK4MBA-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/b8910eaa24a745a2b5023131668d79e2.webp', 4),
(48, '2023-05-27 13:28:09.881000', '2023-05-27 13:28:09.881000', 'P8EK4MBA-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/842c1b0fb50b438bbb17fae09f8aec57.webp', 4),
(49, '2023-05-27 13:28:09.884000', '2023-05-27 13:28:09.884000', 'P8EK4MBA-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/54569554744544039604589206eefec1.webp', 4),
(50, '2023-05-27 13:28:09.884000', '2023-05-27 13:28:09.884000', '6GQH5VVO-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/994635d8bf094db18a08a43dc35d5820.webp', 4),
(51, '2023-05-27 13:28:09.885000', '2023-05-27 13:28:09.885000', '6GQH5VVO-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/a5c42999aaa34e4fbcce7597f5186b16.webp', 4),
(52, '2023-05-27 13:28:09.885000', '2023-05-27 13:28:09.885000', '6GQH5VVO-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/059c79fbaf3f455c8c64ea1b5d3448b5.webp', 4),
(53, '2023-05-27 13:28:09.886000', '2023-05-27 13:28:09.886000', '6GQH5VVO-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/17d68fd65d544a37bdc348624e77a235.webp', 4),
(54, '2023-05-27 13:28:09.886000', '2023-05-27 13:28:09.886000', '6GQH5VVO-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/2f4d320eeb334d6a9b6c1e008f4a48ae.webp', 4),
(55, '2023-05-27 13:28:09.887000', '2023-05-27 13:28:09.887000', '6GQH5VVO-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/d2652cdee3274b269c3107c3324f5da8.webp', 4),
(56, '2023-05-27 13:28:09.887000', '2023-05-27 13:28:09.887000', 'FWGX7PRP-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/33a548247d3d44218964ae33b944a75f.webp', 4),
(57, '2023-05-27 13:28:09.887000', '2023-05-27 13:28:09.887000', 'FWGX7PRP-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/c41f3290a0294492a9e3d7a19f62f688.webp', 4),
(58, '2023-05-27 13:28:09.888000', '2023-05-27 13:28:09.888000', 'FWGX7PRP-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/1ed61cf62be1472cae5c76b56cc55b21.webp', 4),
(59, '2023-05-27 13:28:09.888000', '2023-05-27 13:28:09.888000', 'FWGX7PRP-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/bc5a28b8664d441f967787601cd37109.webp', 4),
(60, '2023-05-27 13:28:09.889000', '2023-05-27 13:28:09.889000', 'FWGX7PRP-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/0eb37d2a43404e3ca47a89b2c5976e6a.webp', 4),
(61, '2023-05-27 13:28:09.889000', '2023-05-27 13:28:09.889000', 'FWGX7PRP-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/f4a28081d60f4d76a00575c8e0fe3b7b.webp', 4),
(62, '2023-05-27 13:28:09.890000', '2023-05-27 13:28:09.890000', 'D14BOUI7-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/f09c5a4cdcc5481ab3e9f0ee7b659398.webp', 4),
(63, '2023-05-27 13:28:09.890000', '2023-05-27 13:28:09.890000', 'D14BOUI7-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/b0804791bb494eab80963d61328a42ec.webp', 4),
(64, '2023-05-27 13:28:09.891000', '2023-05-27 13:28:09.891000', 'D14BOUI7-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/cdcae84090944a1b8195a46bf5abf202.webp', 4),
(65, '2023-05-27 13:28:09.891000', '2023-05-27 13:28:09.891000', 'D14BOUI7-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/b6f060679b524a0584dbeefa71728eec.webp', 4),
(66, '2023-05-27 13:28:09.891000', '2023-05-27 13:28:09.891000', 'D14BOUI7-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/68096dbf2aa742fe892059de92cfaaed.webp', 4),
(67, '2023-05-27 13:28:09.892000', '2023-05-27 13:28:09.892000', 'D14BOUI7-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/3130bc6b15d24940a20372295a0cb679.webp', 4),
(68, '2023-05-27 12:46:15.902000', '2023-05-27 12:46:15.902000', 'NH0B3ZB2-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/b72a2abfd36b4a4e9b16af36fb403780.webp', 16),
(69, '2023-05-27 12:46:15.903000', '2023-05-27 12:46:15.903000', 'NH0B3ZB2-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/41fa5be1b6e14fe09968fa8903426895.webp', 16),
(70, '2023-05-27 12:46:15.904000', '2023-05-27 12:46:15.904000', 'NH0B3ZB2-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/06137d1bc3f14887bc5563bbbc3d9987.webp', 16),
(71, '2023-05-27 12:46:15.905000', '2023-05-27 12:46:15.905000', 'NH0B3ZB2-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/d3adf986a678425d80fd54777f5c1060.webp', 16),
(72, '2023-05-27 12:46:15.909000', '2023-05-27 12:46:15.909000', 'NH0B3ZB2-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/bb2132f0b3044a91be28b1277fb6cf5d.webp', 16),
(73, '2023-05-27 12:46:15.910000', '2023-05-27 12:46:15.910000', 'NH0B3ZB2-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/7af2bd0c7f724d53868795990e6859ee.webp', 16),
(74, '2023-05-27 12:46:15.911000', '2023-05-27 12:46:15.911000', 'LW67IG5R-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/1f7a0a6432b341f0aace5db0ee95763a.webp', 16),
(75, '2023-05-27 12:46:15.912000', '2023-05-27 12:46:15.912000', 'LW67IG5R-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/79f6bfc9523c49519d325dfaff954693.webp', 16),
(76, '2023-05-27 12:46:15.914000', '2023-05-27 12:46:15.914000', 'LW67IG5R-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/ea994350af1d4235b6d59411acbb2e9f.webp', 16),
(77, '2023-05-27 12:46:15.915000', '2023-05-27 12:46:15.915000', 'LW67IG5R-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/2581559b628b48df966b4b673e8eabf1.webp', 16),
(78, '2023-05-27 12:46:15.917000', '2023-05-27 12:46:15.917000', 'LW67IG5R-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/0a3113eb7f50498b95d7e9482c665e27.webp', 16),
(79, '2023-05-27 12:46:15.918000', '2023-05-27 12:46:15.918000', 'LW67IG5R-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/e07d8412e9f14d9097716a53c2c8e6d3.webp', 16),
(80, '2023-05-27 12:49:13.393000', '2023-05-27 12:49:13.393000', '8FV0GM3M-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/25093cb1962d492888d0a2f843e7f6ec.webp', 17),
(81, '2023-05-27 12:49:13.396000', '2023-05-27 12:49:13.396000', '8FV0GM3M-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/4960b6cc150e48daa8db0ceed5fcdf59.webp', 17),
(82, '2023-05-27 12:49:13.397000', '2023-05-27 12:49:13.397000', '8FV0GM3M-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/7d4003253ebe4f98b7d004f1e58ec185.webp', 17),
(83, '2023-05-27 12:49:13.397000', '2023-05-27 12:49:13.397000', '8FV0GM3M-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/a90fc9a0739641d1a0069ebbdd1da0a2.webp', 17),
(84, '2023-05-27 12:49:13.398000', '2023-05-27 12:49:13.398000', '8FV0GM3M-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/f1032580b66847d89c9aa0d19af7bc47.webp', 17),
(85, '2023-05-27 12:49:13.399000', '2023-05-27 12:49:13.399000', '8FV0GM3M-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/24f8c5fd2a814ecbb869abe887f04186.webp', 17),
(86, '2023-05-27 12:49:13.399000', '2023-05-27 12:49:13.399000', 'YG7MOH91-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/ef3ac18646014919b0091b216dc1e91a.webp', 17),
(87, '2023-05-27 12:49:13.400000', '2023-05-27 12:49:13.400000', 'YG7MOH91-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/8a4bb83b44d04d369752bd7b2c9d18b5.webp', 17),
(88, '2023-05-27 12:49:13.403000', '2023-05-27 12:49:13.403000', 'YG7MOH91-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/520a225a55544965aa34b469b2ac0cd1.webp', 17),
(89, '2023-05-27 12:49:13.404000', '2023-05-27 12:49:13.404000', 'YG7MOH91-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/55f1b0fe816a418c93e03c05141b91c8.webp', 17),
(90, '2023-05-27 12:58:46.741000', '2023-05-27 12:58:46.741000', 'OU5W6IXP-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/021832f35edc4bc58a7339a9df0a93ec.webp', 18),
(91, '2023-05-27 12:58:46.741000', '2023-05-27 12:58:46.741000', 'OU5W6IXP-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/24d81a05e76b4f06bda7da7ffc0b8bea.webp', 18),
(92, '2023-05-27 12:58:46.741000', '2023-05-27 12:58:46.741000', 'OU5W6IXP-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/03f3122070cc4b3f95a751744045b92f.webp', 18),
(93, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', 'OU5W6IXP-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/44f274019d3d406eb4391ef54357e8f9.webp', 18),
(94, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', '9XGQUCNF-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/949f4a96f4264e3e9f1f90de902c4394.webp', 18),
(95, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', '9XGQUCNF-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/a0dc18404eb343628cde746e28797950.webp', 18),
(96, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', '9XGQUCNF-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/ec4e8f3045d5408aa9cf90c74dc1ea4e.webp', 18),
(97, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', '9XGQUCNF-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/1cc90ee8f0a143d1b577f69c71f68d53.webp', 18),
(98, '2023-05-27 13:10:00.673000', '2023-05-27 13:10:00.673000', 'OZHXC6W7-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/0e674291a8ad4ec6a46764da8976e21e.webp', 19),
(99, '2023-05-27 13:10:00.678000', '2023-05-27 13:10:00.678000', 'OZHXC6W7-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/73256aa418f4420da2e23ed20394a481.webp', 19),
(100, '2023-05-27 13:10:00.679000', '2023-05-27 13:10:00.679000', 'OZHXC6W7-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/be34aab29e2d4c0f9a491171ac403e4c.webp', 19),
(101, '2023-05-27 13:10:00.679000', '2023-05-27 13:10:00.679000', 'OZHXC6W7-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/0dc0baf75a6e4aa8a97df85c109abf15.webp', 19),
(102, '2023-05-27 13:10:00.680000', '2023-05-27 13:10:00.680000', 'BJEXTZFI-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/32aedbfd883644e494dc699e52fec419.webp', 19),
(103, '2023-05-27 13:10:00.681000', '2023-05-27 13:10:00.681000', 'BJEXTZFI-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/e2cd45683c9f4a7cbea8481b7addc8d6.webp', 19),
(104, '2023-05-27 13:10:00.685000', '2023-05-27 13:10:00.685000', 'BJEXTZFI-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/97756818e6b24689adbb2e9a8793591d.webp', 19),
(105, '2023-05-27 13:10:00.686000', '2023-05-27 13:10:00.686000', 'BJEXTZFI-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/bb7bef3a86c0473aa41df690dd48b187.webp', 19),
(106, '2023-05-27 13:13:01.796000', '2023-05-27 13:13:01.796000', '9C7D4DBW-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/41717e78628441169103e5ebcccddca9.webp', 20),
(107, '2023-05-27 13:13:01.797000', '2023-05-27 13:13:01.797000', '9C7D4DBW-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/3cf1fbbcd0f2450bb15b96aa32c4e244.webp', 20),
(108, '2023-05-27 13:13:01.798000', '2023-05-27 13:13:01.798000', '9C7D4DBW-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/78a86942801e4dd286264ccebd7a80a9.webp', 20),
(109, '2023-05-27 13:13:01.799000', '2023-05-27 13:13:01.799000', '9C7D4DBW-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/ac9a0161db214bec85374ca48f5e2d7d.webp', 20),
(110, '2023-05-27 13:13:01.800000', '2023-05-27 13:13:01.800000', 'H4OXDF69-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/650776e41d274b6f9b61f5e11248eaea.webp', 20),
(111, '2023-05-27 13:13:01.801000', '2023-05-27 13:13:01.801000', 'H4OXDF69-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/1108d17737874cd095b9cc2b0736d953.webp', 20),
(112, '2023-05-27 13:13:01.802000', '2023-05-27 13:13:01.802000', 'H4OXDF69-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/b080002efbe547ba902793bb5d3e0851.webp', 20),
(113, '2023-05-27 13:13:01.806000', '2023-05-27 13:13:01.806000', 'H4OXDF69-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/a63fb96f786445108d36678da4602098.webp', 20),
(114, '2023-05-27 13:16:46.551000', '2023-05-27 13:16:46.551000', 'EZH4DTWJ-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/c7b1b85e2e4d47df9f8cae8e69a685ef.webp', 21),
(115, '2023-05-27 13:16:46.555000', '2023-05-27 13:16:46.555000', 'EZH4DTWJ-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/46f505c648894cd8befac6255fdc48f5.webp', 21),
(116, '2023-05-27 13:16:46.557000', '2023-05-27 13:16:46.557000', 'EZH4DTWJ-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/03240462fc684ba3ac63c1a3ba6af7d4.webp', 21),
(117, '2023-05-27 13:16:46.558000', '2023-05-27 13:16:46.558000', 'EZH4DTWJ-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/a7104dbdea5b4a47b6c69324a03100ea.webp', 21),
(118, '2023-05-27 13:22:47.802000', '2023-05-27 13:22:47.802000', '0ACALWWT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/9067c8d9ba464cad820d8178b0922f70.webp', 23),
(119, '2023-05-27 13:22:47.803000', '2023-05-27 13:22:47.803000', '0ACALWWT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/b54f8de85e5f437f828f25c13d11c226.webp', 23),
(120, '2023-05-27 13:22:47.804000', '2023-05-27 13:22:47.804000', '0ACALWWT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/587dc7834b8f44cea9bd2b8de8b2f313.webp', 23),
(121, '2023-05-27 13:22:47.804000', '2023-05-27 13:22:47.804000', '0ACALWWT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/dc42b60454094379b3ee26bd1db1b806.webp', 23),
(122, '2023-05-27 13:22:47.805000', '2023-05-27 13:22:47.805000', '7UE7AZUO-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/cd16b407627846b58ee0d393dd43b8af.webp', 23),
(123, '2023-05-27 13:22:47.806000', '2023-05-27 13:22:47.806000', '7UE7AZUO-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/b69454568e7e4ca999ec0691425eef90.webp', 23),
(124, '2023-05-27 13:22:47.806000', '2023-05-27 13:22:47.806000', '7UE7AZUO-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/10527989156d4be5961c6124581016a3.webp', 23),
(125, '2023-05-27 13:22:47.807000', '2023-05-27 13:22:47.807000', '7UE7AZUO-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/cfad781246b445008893064a85a43180.webp', 23),
(126, '2023-05-27 13:25:47.772000', '2023-05-27 13:25:47.772000', 'RAWUYGPU-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/1924d1bc923f4ef1874a0e9f2ac93fde.webp', 24),
(127, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'RAWUYGPU-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/412feacf07ee4d6eb65cdddaa6bf34b0.webp', 24),
(128, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'RAWUYGPU-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/a5f84ba0a54344f18a329ac5327466ab.webp', 24),
(129, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'RAWUYGPU-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/0e1d687da29d4a808150d7180dc0a038.webp', 24),
(130, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'RAWUYGPU-VANG', 'http://localhost:8080/api/v1/admin/FileUpload/a2decd6354a047ff8c2d62d2bb69384d.webp', 24),
(131, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'WEA8M1LK-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/035883772eae42a0b2a3cc251630622d.webp', 24),
(132, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'WEA8M1LK-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/4b8019dd18424ee0b571d6e4a3423467.webp', 24),
(133, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'WEA8M1LK-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/fda4986d02e9489993bd061336d930c8.webp', 24),
(134, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'WEA8M1LK-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/159ac55eaa174d97b2d66818688e34ab.webp', 24),
(135, '2023-05-27 13:30:14.184000', '2023-05-27 13:30:14.184000', 'UJW1AIYS-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9666de5814644b7493c455722e16115d.webp', 25),
(136, '2023-05-27 13:30:14.184000', '2023-05-27 13:30:14.184000', 'UJW1AIYS-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/2245789f51e3415ca9a587599e01e2af.webp', 25),
(137, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'UJW1AIYS-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1abe71bb9b0342c4b7a3c7db154c22f2.webp', 25),
(138, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'UJW1AIYS-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/b208a0c83fb94a3c950a2b0afffdd013.webp', 25),
(139, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'UJW1AIYS-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/0d7d6e23e3da4b22828ad3a29508bddf.webp', 25),
(140, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'TF0OSRUJ-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/0d369fb362c447c7b10f69674f2b82c5.webp', 25),
(141, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'TF0OSRUJ-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/0a02bd07e1284bdfa3bef995396df8f3.webp', 25),
(142, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'TF0OSRUJ-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/fd9d8d7704954975a0cf13364cb35506.webp', 25),
(143, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'TF0OSRUJ-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/56ba67c5e98e4ebd96f8314a0f856e5e.webp', 25),
(144, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'TF0OSRUJ-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/345cb02ac4ea4f83b5258179788f2f44.webp', 25),
(236, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'V8ZLBHQX-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/864779cdd1df4f4e87a5b6466208f794.webp', 26),
(237, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'V8ZLBHQX-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/3450850bf3f94c069eab313559a1e716.webp', 26),
(238, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'V8ZLBHQX-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/ef02ac76192246179fe654a541e72722.webp', 26),
(239, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'V8ZLBHQX-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/4599dc40b4654311af1825bbef3d0d1e.webp', 26),
(240, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'V8ZLBHQX-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/7c25ea6660344d05942f5f99b18c1249.webp', 26),
(241, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', '9XM5DRT1-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/e2fa59c8586d404ea1cb4b8f7834ec99.webp', 26),
(242, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', '9XM5DRT1-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/2a149d0ed42a443b82bfaf8e52036870.webp', 26),
(243, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', '9XM5DRT1-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/91bca2465f744888a0fd4bbe28371b7a.webp', 26),
(244, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', '9XM5DRT1-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/60e9cb1971324af4be56dec005a5facc.webp', 26),
(245, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', '9XM5DRT1-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/22849d05adc8489db5a8442fd9e7cb9d.webp', 26),
(246, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', '9XM5DRT1-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/795b93964039435eaeac4f3fa123c13f.webp', 26),
(247, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'GE001BK2-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/bb278a6752ef4d1ea0b55bce49896142.webp', 27),
(248, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'GE001BK2-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/6fc33ddeda02439fb3c17309747d099a.webp', 27),
(249, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'GE001BK2-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/c4ddd580b9f24a119751daebb2f4e0f5.webp', 27),
(250, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'GE001BK2-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/fcc27a75f3e74e9db57d74537a59cde6.webp', 27),
(251, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'GE001BK2-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/3e002fe19d444b198273cd4fa027d541.webp', 27),
(252, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'OCA447QL-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/731cf601bedd46599895db204dd9d3d6.webp', 27),
(253, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'OCA447QL-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/8cf8c4a9e8034787ae21bee2b7bfae33.webp', 27),
(254, '2023-05-27 14:52:34.706000', '2023-05-27 14:52:34.706000', 'OCA447QL-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/aee14567e8c040ad8c12391a2d66f0f6.webp', 27),
(255, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'OCA447QL-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/0fd24690007141aa9a488a54a6ed7b34.webp', 27),
(256, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'OCA447QL-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/5ad80c5d59c843f8b62822aedf997179.webp', 27),
(257, '2023-05-27 14:55:20.999000', '2023-05-27 14:55:20.999000', 'B13J9CAT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/64f3fd37c1624e8d94b81ba80fafa150.webp', 28),
(258, '2023-05-27 14:55:21.000000', '2023-05-27 14:55:21.000000', 'B13J9CAT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/a6b7347eaaa64e46936eb4117017b6db.webp', 28),
(259, '2023-05-27 14:55:21.000000', '2023-05-27 14:55:21.000000', 'B13J9CAT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/cfcde27d368b44a6b882840bbcc0c07b.webp', 28),
(260, '2023-05-27 14:55:21.000000', '2023-05-27 14:55:21.000000', 'B13J9CAT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/56c82bae6f514924b6b5e9b1f667596b.webp', 28),
(261, '2023-05-27 14:55:21.001000', '2023-05-27 14:55:21.001000', 'B13J9CAT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/082648fa143c43578d59624db207e283.webp', 28),
(262, '2023-05-27 14:55:21.001000', '2023-05-27 14:55:21.001000', 'B13J9CAT-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/aabb567f535940bc902eef83d8b39d24.webp', 28),
(263, '2023-05-27 14:55:21.001000', '2023-05-27 14:55:21.001000', 'MQLKNEZO-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9943575b32e74c4ab8e21e7cf52c4d5d.webp', 28),
(264, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'MQLKNEZO-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/e07a1e62c49840fcbea317999ce4be70.webp', 28),
(265, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'MQLKNEZO-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/e1bb7242fa5d46d695d9c118da6c9a8c.webp', 28),
(266, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'MQLKNEZO-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/692c0727719340af95bf74d36a295087.webp', 28),
(267, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'MQLKNEZO-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/f2328e52eff6468a89e7172ee5701dfc.webp', 28),
(268, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'MQLKNEZO-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/b47a9730de6b4209b15a041119400e98.webp', 28),
(269, '2023-05-27 14:58:52.326000', '2023-05-27 14:58:52.326000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/0e24a7e0d0fb4716bb05e1ca29ca0803.webp', 29),
(270, '2023-05-27 14:58:52.328000', '2023-05-27 14:58:52.328000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/c116457311a746b895f25d3a398e9130.webp', 29),
(271, '2023-05-27 14:58:52.329000', '2023-05-27 14:58:52.329000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/0b3934219802439ea205251796c2c285.webp', 29),
(272, '2023-05-27 14:58:52.329000', '2023-05-27 14:58:52.329000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/ca3dbeb2f8044ee889ded4f09c702bde.webp', 29),
(273, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/75c9de790e5241c499f039a41c41e8bf.webp', 29),
(274, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/36fe1132f4ee4922bc7a1ec484756569.webp', 29),
(275, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/1d1a933cdbab416eb3a5cbfa48e49f68.webp', 29),
(276, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/b8c5be86a5304f27b4f2ea12953723d4.webp', 29),
(277, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'UFZTDPSW-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/0491bee5727040d6bc32b252d86ee491.webp', 29),
(278, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'AAQ1OMAH-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/d6ade651ba8542a39f8b54d988a3d023.webp', 29),
(279, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'AAQ1OMAH-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/d270401fa3dd4a8db3341dfd0f06cf64.webp', 29),
(280, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'AAQ1OMAH-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/9201158550364ecb920b39b53fe16ebc.webp', 29),
(281, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'AAQ1OMAH-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/5fa587bc62d24d50bfcfa0a8f86d64b3.webp', 29),
(282, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'AAQ1OMAH-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/fa21999f0a32417a84348c5cbe9d080c.webp', 29),
(283, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'AAQ1OMAH-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1263332299b04e468cea88548b955d7d.webp', 29),
(284, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'MSEZX7ZR-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/85e2ec523ef74c5794e03daf7752a2f9.webp', 30),
(285, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'MSEZX7ZR-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/5bb53a75a71c4a948d021337c14de8e6.webp', 30),
(286, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'MSEZX7ZR-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/fac873aa440f42559a3c6af52498628e.webp', 30),
(287, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'MSEZX7ZR-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/27f5a5169c1d48b8a95e9cf26e1d5f13.webp', 30),
(288, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'MSEZX7ZR-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/cbd513718c2c4e71a5eb8da4757dfa62.webp', 30),
(289, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'VQVUJBJT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/947123b9ba2b4fe8a7536c7705da7e87.webp', 30),
(290, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'VQVUJBJT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/c1f345a50fa34f06a57927582c39bf57.webp', 30),
(291, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'VQVUJBJT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/2034ccf75817436da290d5cea5314451.webp', 30),
(292, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'VQVUJBJT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/38a4fef48c4c4547992badd7ee0c0691.webp', 30),
(293, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'VQVUJBJT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/2a3321242e0d4f6eb70187d895f07a0c.webp', 30),
(294, '2023-05-27 15:04:35.573000', '2023-05-27 15:04:35.573000', '0RC2N419-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/ee604fd35fc04fd6a7cbfc242e65c8fa.webp', 31),
(295, '2023-05-27 15:04:35.573000', '2023-05-27 15:04:35.573000', '0RC2N419-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/e229de73113e48e681e36948c6089739.webp', 31),
(296, '2023-05-27 15:04:35.574000', '2023-05-27 15:04:35.574000', '0RC2N419-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1cbb00766ea240248121bff83e6130cd.webp', 31),
(297, '2023-05-27 15:04:35.577000', '2023-05-27 15:04:35.577000', '0RC2N419-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/e48c4d65692b48c5a1a0950c01bfc927.webp', 31),
(298, '2023-05-27 15:04:35.577000', '2023-05-27 15:04:35.577000', '0RC2N419-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1938e870a8d5435b8e21e6780c6dc5cb.webp', 31),
(299, '2023-05-27 15:04:35.577000', '2023-05-27 15:04:35.577000', 'FI3ML73O-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/bc7c98d98a334909b06f86a540f86e94.webp', 31),
(300, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'FI3ML73O-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/5085f6eadcaa406fa5795035e9762b15.webp', 31),
(301, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'FI3ML73O-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/b6fb027367c24bf59de11ec7329ece8a.webp', 31),
(302, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'FI3ML73O-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/4176b0c01a7c4f7f86aa61a13187955d.webp', 31),
(303, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'LDDOJ0LQ-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/699e97e275024fcf9d969ac972e4ca9c.webp', 32),
(304, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'LDDOJ0LQ-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/876eb589ac554fd59923d0a39add3dbd.webp', 32),
(305, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'LDDOJ0LQ-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/29915b31b28c49348546abb0e7a96beb.webp', 32),
(306, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'LDDOJ0LQ-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/d0a7d2d614e743338c857842a0c6d171.webp', 32),
(307, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'G1782LEU-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/a29aac8ed9154d96a8958d32cbc59560.webp', 32),
(308, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'G1782LEU-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/fab23d3c60eb4b70af0b21cc1b26f448.webp', 32),
(309, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'G1782LEU-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/a58444cc566d4d029a603a4d1a7b01af.webp', 32),
(310, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'G1782LEU-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/b0a4cf6e485f4a48a1b165b655ce2dd9.webp', 32),
(311, '2023-05-27 15:10:50.972000', '2023-05-27 15:10:50.972000', 'G1782LEU-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/73df991d6e4241fa974e8a244bc26b5a.webp', 32),
(312, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '93EPO9TR-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/00e6065864744e7898d7ae2741d10764.webp', 33),
(313, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '93EPO9TR-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/fe20b3e33efe4ba08ab45e5023f1a566.webp', 33),
(314, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '93EPO9TR-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/dc7c3dfed6c341698d485a71c10ff5e0.webp', 33),
(315, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '93EPO9TR-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/5663e5dd654b42ad8ef975c516fd3515.webp', 33),
(316, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '93EPO9TR-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/487ba4cc35c1421084ba383c79868d36.webp', 33),
(317, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '93EPO9TR-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/0ef500dc41dc4be4ac49514a7e8686c8.webp', 33),
(318, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '0JQ1PS5H-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/87669a29f99e4568b186f76778d91c9b.webp', 33),
(319, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '0JQ1PS5H-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/c31d5301eaf14194bc59ea2ae0d04513.webp', 33),
(320, '2023-05-27 15:13:37.859000', '2023-05-27 15:13:37.859000', '0JQ1PS5H-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/9a59fd0fde104ad4ad2481539ae5e5ae.webp', 33),
(321, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', '0JQ1PS5H-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/af8e64a50d0c4bb7836826acda266740.webp', 33),
(322, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', '0JQ1PS5H-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/28700cf290734ee4ac56c10eec27f7a6.webp', 33),
(323, '2023-05-27 15:16:12.879000', '2023-05-27 15:16:12.879000', 'YO1YB2C1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/2e1e79ebdbfa47e99d28db122330f9e0.webp', 34),
(324, '2023-05-27 15:16:12.879000', '2023-05-27 15:16:12.879000', 'YO1YB2C1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/2e4a63d4ab7941cca167462b6fc65941.webp', 34),
(325, '2023-05-27 15:16:12.879000', '2023-05-27 15:16:12.879000', 'YO1YB2C1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/9a8f2c33e7f14ff8935fcb15ac99bbfc.webp', 34),
(326, '2023-05-27 15:16:12.880000', '2023-05-27 15:16:12.880000', 'YO1YB2C1-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/741b5c1606ea4a8cb26839a2396ef54f.webp', 34),
(327, '2023-05-27 15:16:12.880000', '2023-05-27 15:16:12.880000', '99XTLTPG-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/822b32b5efba4c9bae42175e273b1505.webp', 34),
(328, '2023-05-27 15:16:12.880000', '2023-05-27 15:16:12.880000', '99XTLTPG-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/3407d090e19742f5975bba22ce4ec136.webp', 34),
(329, '2023-05-27 15:16:12.881000', '2023-05-27 15:16:12.881000', '99XTLTPG-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/7e763232bb8c42e6a5cce65802109082.webp', 34),
(330, '2023-05-27 15:16:12.881000', '2023-05-27 15:16:12.881000', '99XTLTPG-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/22d79132ad40472995f7c89f4f12b1d1.webp', 34),
(331, '2023-05-27 15:16:12.881000', '2023-05-27 15:16:12.881000', '99XTLTPG-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/dce8a073ff814f62a5768f4c38723431.webp', 34),
(332, '2023-05-27 15:16:12.882000', '2023-05-27 15:16:12.882000', '99XTLTPG-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/317da4b69cbf4aa8a2bdace57ea64498.webp', 34),
(333, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', '4LE2YQSU-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/09c99025c8cf4731ac15514d0919d1f9.webp', 35),
(334, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', '4LE2YQSU-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/00e0ca4a590f469aa649acefe0cc6bfe.webp', 35),
(335, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', '4LE2YQSU-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/7ef5c1b11279438981c0eb4715123d87.webp', 35),
(336, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', '4LE2YQSU-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/5d89b280fc2f42eb9fac1f4b83733870.webp', 35),
(337, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', '4LE2YQSU-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/18617d07429246d388ee8de2052695f0.webp', 35),
(338, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'WASHQGKY-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/52af2f70e0754610b00f81b1bc0a42e4.webp', 35),
(339, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'WASHQGKY-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/76faf3c929114ee7a52907f3ab1374c3.webp', 35),
(340, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'WASHQGKY-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/0daa47f5f969479da90ef5f971fe56d5.webp', 35),
(341, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'WASHQGKY-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/ed5679695b68437bbd3edeafb3df37ee.webp', 35),
(342, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'WASHQGKY-CAM', 'http://localhost:8080/api/v1/admin/FileUpload/6a94098144e44b5bb83e746233cb7eb4.webp', 35),
(343, '2023-05-27 15:21:50.651000', '2023-05-27 15:21:50.651000', 'KRP6PG7U-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/c821a8e18df64db2bfe4d715a3af66ec.webp', 36),
(344, '2023-05-27 15:21:50.652000', '2023-05-27 15:21:50.652000', 'KRP6PG7U-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/eefe9d9659e74c3ca2993b105adbeae9.webp', 36),
(345, '2023-05-27 15:21:50.652000', '2023-05-27 15:21:50.652000', 'KRP6PG7U-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/3ca30c36d8474f91a6efa780903dca8d.webp', 36),
(346, '2023-05-27 15:21:50.652000', '2023-05-27 15:21:50.652000', 'KRP6PG7U-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/b71c40363be04b99b0324f38ad59c199.webp', 36),
(347, '2023-05-27 15:21:50.652000', '2023-05-27 15:21:50.652000', 'LP3Z8NQL-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/69786dfa29de43dcb7dc8bca4e7a22d0.webp', 36),
(348, '2023-05-27 15:21:50.654000', '2023-05-27 15:21:50.654000', 'LP3Z8NQL-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/fabe7c3eb572424e988c3c98f9f5538c.webp', 36),
(349, '2023-05-27 15:21:50.655000', '2023-05-27 15:21:50.655000', 'LP3Z8NQL-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/261b93e160c84bc0a9bebcd5eb772624.webp', 36),
(350, '2023-05-27 15:21:50.655000', '2023-05-27 15:21:50.655000', 'LP3Z8NQL-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/58c489243b0b4d1884b782f992c0da3f.webp', 36),
(373, '2023-05-28 21:48:16.926000', '2023-05-28 21:48:16.926000', '1GJ8GE4W-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/363bdeab0b974302980ee679e4ee5aa5.webp', 38),
(374, '2023-05-28 21:48:16.927000', '2023-05-28 21:48:16.927000', '1GJ8GE4W-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/7d7b274c32b146aa87bd5dfc7078259d.webp', 38),
(375, '2023-05-28 21:48:16.927000', '2023-05-28 21:48:16.927000', '1GJ8GE4W-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1cff8da998754490ab87cb2f11264699.webp', 38),
(376, '2023-05-28 21:48:16.928000', '2023-05-28 21:48:16.928000', '1GJ8GE4W-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/79a3ed6905a643acb2e07a5e29c5ee51.webp', 38),
(377, '2023-05-28 21:48:16.928000', '2023-05-28 21:48:16.928000', '1GJ8GE4W-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/1ba0fc78278b4d138b6e391c93557bc6.webp', 38),
(378, '2023-05-28 21:48:16.928000', '2023-05-28 21:48:16.928000', '1GJ8GE4W-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/4c7d02a38bac4144b95b7404ab369d89.webp', 38),
(379, '2023-05-28 21:48:16.929000', '2023-05-28 21:48:16.929000', '7H7CCKNO-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/5075f83742224818aa2b694808087b19.webp', 38),
(380, '2023-05-28 21:48:16.933000', '2023-05-28 21:48:16.933000', '7H7CCKNO-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/c68b0e3acb9146e0b9209c1f5bdbdc2d.webp', 38),
(381, '2023-05-28 21:48:16.934000', '2023-05-28 21:48:16.934000', '7H7CCKNO-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/42d47115750a4625b53b266a5d79009f.webp', 38),
(382, '2023-05-28 21:48:16.934000', '2023-05-28 21:48:16.934000', '7H7CCKNO-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/665d796856b74ab9a60887b660b6ebac.webp', 38),
(383, '2023-05-28 21:48:16.934000', '2023-05-28 21:48:16.934000', '7H7CCKNO-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/ad96435749a841ad95f04096d4c59dd1.webp', 38),
(384, '2023-05-28 21:48:16.935000', '2023-05-28 21:48:16.935000', '7H7CCKNO-TRANG', 'http://localhost:8080/api/v1/admin/FileUpload/3154685e269b4778923dfc86a8327a7a.webp', 38),
(385, '2023-05-28 21:48:16.935000', '2023-05-28 21:48:16.935000', 'SHRTTZTY-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/33513418c1da45338580567bf468c9dd.webp', 38),
(386, '2023-05-28 21:48:16.935000', '2023-05-28 21:48:16.935000', 'SHRTTZTY-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/b9ac5230a5e142ab81698839abab2b41.webp', 38),
(387, '2023-05-28 21:48:16.936000', '2023-05-28 21:48:16.936000', 'SHRTTZTY-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/feb7e0964b294ed681a74c6d8910ec6f.webp', 38),
(388, '2023-05-28 21:48:16.936000', '2023-05-28 21:48:16.936000', 'SHRTTZTY-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/e29e462cbf2144a6b197a8ddd065274d.webp', 38),
(389, '2023-05-28 21:48:16.936000', '2023-05-28 21:48:16.936000', 'SHRTTZTY-HONG', 'http://localhost:8080/api/v1/admin/FileUpload/da9e2cfb19e442dbb47e0f6fc586c462.webp', 38),
(390, '2023-05-28 21:52:38.446000', '2023-05-28 21:52:38.446000', 'H42SFYLT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/b00d022a0ef84edda273a3d06d4ca7e5.webp', 39),
(391, '2023-05-28 21:52:38.446000', '2023-05-28 21:52:38.446000', 'H42SFYLT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/7881c887446449e7aad7def904bf19c1.webp', 39),
(392, '2023-05-28 21:52:38.446000', '2023-05-28 21:52:38.446000', 'H42SFYLT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/1d49dc76fb754635bd61da79c4236e7c.webp', 39),
(393, '2023-05-28 21:52:38.455000', '2023-05-28 21:52:38.455000', 'H42SFYLT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/26237b6944944f1ab3d92fef3f7ad8e3.webp', 39),
(394, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'H42SFYLT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/e3458279ff334e0f9a390297a263e385.webp', 39),
(395, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'H42SFYLT-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/f078c7c8e97b461488ffd698a68e8c24.webp', 39),
(396, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'FM5MP2J0-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/fac1a1c9669b4ee1a440b94d1f8ea0b6.webp', 39),
(397, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'FM5MP2J0-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/525aee15ae884cc5bb06e834c783c456.webp', 39),
(398, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'FM5MP2J0-XANH', 'http://localhost:8080/api/v1/admin/FileUpload/0e5ac48e76f541cba94a0e37484984d4.webp', 39),
(399, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', '51SO6NJT-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/4c917446a20c46099b1299a241df96fd.webp', 40),
(400, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', '51SO6NJT-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/e8e53e7264db44668f723f7225d75165.webp', 40),
(401, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', '51SO6NJT-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/d2c2178189e74594a2fe4764c7519344.webp', 40),
(402, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', '51SO6NJT-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/d72786730ac64b25858395ee2de547c9.webp', 40),
(403, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', '51SO6NJT-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/b95acdec825b45a093cec04b75e6ad5b.webp', 40),
(404, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', '51SO6NJT-ĐO', 'http://localhost:8080/api/v1/admin/FileUpload/cdab0971dcb84ee88447eb817179d677.webp', 40),
(405, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', 'PFXEHJHG-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/96ecf030fa9e471b92a5c742f1a97760.webp', 40),
(406, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', 'PFXEHJHG-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/926bf7540f5e422086d25c150673405c.webp', 40),
(407, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', 'PFXEHJHG-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/a92ff019d7434646b684eb97c256b7b7.webp', 40),
(408, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', 'PFXEHJHG-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/de59581e03bf442eb01a83b7a3479a1e.webp', 40),
(409, '2023-05-28 21:56:45.371000', '2023-05-28 21:56:45.371000', 'PFXEHJHG-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/6933c49fa10545eebead5e3d3cd0cdba.webp', 40),
(410, '2023-05-28 21:56:45.387000', '2023-05-28 21:56:45.387000', 'PFXEHJHG-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/d6a39b137e1c4f8e94dc0a9dcc8315b4.webp', 40),
(411, '2023-05-29 11:30:49.115000', '2023-05-29 11:30:49.115000', 'KMCNWQQS-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/5c0e288a4f5c4889a88da72d8925f075.webp', 41),
(412, '2023-05-29 11:30:49.115000', '2023-05-29 11:30:49.115000', 'KMCNWQQS-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/887c12fdb7b44b0c8cd065329956f45a.webp', 41),
(413, '2023-05-29 11:30:49.115000', '2023-05-29 11:30:49.115000', 'KMCNWQQS-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/90b9048e03824b3caa4ca7eca92f40ec.webp', 41),
(414, '2023-05-29 11:30:49.115000', '2023-05-29 11:30:49.115000', 'KMCNWQQS-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/0c11baaeacb44679a3a7f4202d3f19c4.webp', 41),
(415, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', 'KMCNWQQS-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/c99040ef668644eabd84c8a9aaa7f3a2.webp', 41),
(416, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', 'KMCNWQQS-ĐEN', 'http://localhost:8080/api/v1/admin/FileUpload/b135f5c3c5e3446097b550072c668875.webp', 41),
(417, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', '5N2GQ8LS-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/4a7dca892cb44b6cb6a35aa1adc26f76.webp', 41),
(418, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', '5N2GQ8LS-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/93926bcbeecc4bbe93905c7b8b16ac6e.webp', 41),
(419, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', '5N2GQ8LS-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/e3f108888b8644c1a14f3087e209fab7.webp', 41),
(420, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', '5N2GQ8LS-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/a78acf7512464c5180f221b1e7399c58.webp', 41),
(421, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', '5N2GQ8LS-NAU', 'http://localhost:8080/api/v1/admin/FileUpload/ac4041c239f144309c73720a56d10c6d.webp', 41);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `create_at`, `update_at`, `color`, `image`, `size`, `sku`, `product_id`) VALUES
(27, '2023-05-27 13:28:09.892000', '2023-05-27 13:28:09.892000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/92f3fbe8f45c480bbbb1e162f88a251c.webp', 'S', 'P8EK4MBA-XANH', 4),
(28, '2023-05-27 13:28:09.893000', '2023-05-27 13:28:09.893000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/92f3fbe8f45c480bbbb1e162f88a251c.webp', 'M', 'P8EK4MBA-XANH', 4),
(29, '2023-05-27 13:28:09.893000', '2023-05-27 13:28:09.893000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/994635d8bf094db18a08a43dc35d5820.webp', 'XL', '6GQH5VVO-ĐEN', 4),
(30, '2023-05-27 13:28:09.894000', '2023-05-27 13:28:09.894000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/994635d8bf094db18a08a43dc35d5820.webp', 'S', '6GQH5VVO-ĐEN', 4),
(31, '2023-05-27 13:28:09.894000', '2023-05-27 13:28:09.894000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/33a548247d3d44218964ae33b944a75f.webp', 'XL', 'FWGX7PRP-TRANG', 4),
(32, '2023-05-27 13:28:09.895000', '2023-05-27 13:28:09.895000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/33a548247d3d44218964ae33b944a75f.webp', 'S', 'FWGX7PRP-TRANG', 4),
(33, '2023-05-27 13:28:09.895000', '2023-05-27 13:28:09.895000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/33a548247d3d44218964ae33b944a75f.webp', 'M', 'FWGX7PRP-TRANG', 4),
(34, '2023-05-27 13:28:09.896000', '2023-05-27 13:28:09.896000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/f09c5a4cdcc5481ab3e9f0ee7b659398.webp', 'XL', 'D14BOUI7-HONG', 4),
(35, '2023-05-27 13:28:09.896000', '2023-05-27 13:28:09.896000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/f09c5a4cdcc5481ab3e9f0ee7b659398.webp', 'M', 'D14BOUI7-HONG', 4),
(36, '2023-05-27 12:46:15.918000', '2023-05-27 12:46:15.918000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/b72a2abfd36b4a4e9b16af36fb403780.webp', 'S', 'NH0B3ZB2-XANH', 16),
(37, '2023-05-27 12:46:15.919000', '2023-05-27 12:46:15.919000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/b72a2abfd36b4a4e9b16af36fb403780.webp', 'M', 'NH0B3ZB2-XANH', 16),
(38, '2023-05-27 12:46:15.920000', '2023-05-27 12:46:15.920000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/1f7a0a6432b341f0aace5db0ee95763a.webp', 'S', 'LW67IG5R-ĐO', 16),
(39, '2023-05-27 12:46:15.921000', '2023-05-27 12:46:15.921000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/1f7a0a6432b341f0aace5db0ee95763a.webp', 'M', 'LW67IG5R-ĐO', 16),
(40, '2023-05-27 12:49:13.405000', '2023-05-27 12:49:13.405000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/25093cb1962d492888d0a2f843e7f6ec.webp', 'S', '8FV0GM3M-XANH', 17),
(41, '2023-05-27 12:49:13.406000', '2023-05-27 12:49:13.406000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/25093cb1962d492888d0a2f843e7f6ec.webp', 'M', '8FV0GM3M-XANH', 17),
(42, '2023-05-27 12:49:13.407000', '2023-05-27 12:49:13.407000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/ef3ac18646014919b0091b216dc1e91a.webp', 'S', 'YG7MOH91-NAU', 17),
(43, '2023-05-27 12:49:13.408000', '2023-05-27 12:49:13.408000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/ef3ac18646014919b0091b216dc1e91a.webp', 'XL', 'YG7MOH91-NAU', 17),
(44, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/021832f35edc4bc58a7339a9df0a93ec.webp', 'S', 'OU5W6IXP-CAM', 18),
(45, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/021832f35edc4bc58a7339a9df0a93ec.webp', 'M', 'OU5W6IXP-CAM', 18),
(46, '2023-05-27 12:58:46.757000', '2023-05-27 12:58:46.757000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/021832f35edc4bc58a7339a9df0a93ec.webp', 'XL', 'OU5W6IXP-CAM', 18),
(47, '2023-05-27 12:58:46.773000', '2023-05-27 12:58:46.773000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/021832f35edc4bc58a7339a9df0a93ec.webp', 'L', 'OU5W6IXP-CAM', 18),
(48, '2023-05-27 12:58:46.773000', '2023-05-27 12:58:46.773000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/949f4a96f4264e3e9f1f90de902c4394.webp', 'S', '9XGQUCNF-ĐEN', 18),
(49, '2023-05-27 12:58:46.773000', '2023-05-27 12:58:46.773000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/949f4a96f4264e3e9f1f90de902c4394.webp', 'M', '9XGQUCNF-ĐEN', 18),
(50, '2023-05-27 12:58:46.773000', '2023-05-27 12:58:46.773000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/949f4a96f4264e3e9f1f90de902c4394.webp', 'XL', '9XGQUCNF-ĐEN', 18),
(51, '2023-05-27 12:58:46.773000', '2023-05-27 12:58:46.773000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/949f4a96f4264e3e9f1f90de902c4394.webp', 'L', '9XGQUCNF-ĐEN', 18),
(52, '2023-05-27 13:10:00.687000', '2023-05-27 13:10:00.687000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/0e674291a8ad4ec6a46764da8976e21e.webp', 'S', 'OZHXC6W7-ĐO', 19),
(53, '2023-05-27 13:10:00.688000', '2023-05-27 13:10:00.688000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/0e674291a8ad4ec6a46764da8976e21e.webp', 'M', 'OZHXC6W7-ĐO', 19),
(54, '2023-05-27 13:10:00.689000', '2023-05-27 13:10:00.689000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/0e674291a8ad4ec6a46764da8976e21e.webp', 'L', 'OZHXC6W7-ĐO', 19),
(55, '2023-05-27 13:10:00.691000', '2023-05-27 13:10:00.691000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/32aedbfd883644e494dc699e52fec419.webp', 'XL', 'BJEXTZFI-ĐEN', 19),
(56, '2023-05-27 13:10:00.692000', '2023-05-27 13:10:00.692000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/32aedbfd883644e494dc699e52fec419.webp', 'M', 'BJEXTZFI-ĐEN', 19),
(57, '2023-05-27 13:10:00.693000', '2023-05-27 13:10:00.693000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/32aedbfd883644e494dc699e52fec419.webp', 'L', 'BJEXTZFI-ĐEN', 19),
(58, '2023-05-27 13:13:01.807000', '2023-05-27 13:13:01.807000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/41717e78628441169103e5ebcccddca9.webp', 'S', '9C7D4DBW-CAM', 20),
(59, '2023-05-27 13:13:01.808000', '2023-05-27 13:13:01.808000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/41717e78628441169103e5ebcccddca9.webp', 'M', '9C7D4DBW-CAM', 20),
(60, '2023-05-27 13:13:01.809000', '2023-05-27 13:13:01.809000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/650776e41d274b6f9b61f5e11248eaea.webp', 'XL', 'H4OXDF69-ĐEN', 20),
(61, '2023-05-27 13:13:01.813000', '2023-05-27 13:13:01.813000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/650776e41d274b6f9b61f5e11248eaea.webp', 'S', 'H4OXDF69-ĐEN', 20),
(62, '2023-05-27 13:16:46.561000', '2023-05-27 13:16:46.561000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/c7b1b85e2e4d47df9f8cae8e69a685ef.webp', 'S', 'EZH4DTWJ-XANH', 21),
(63, '2023-05-27 13:16:46.565000', '2023-05-27 13:16:46.565000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/c7b1b85e2e4d47df9f8cae8e69a685ef.webp', 'M', 'EZH4DTWJ-XANH', 21),
(64, '2023-05-27 13:16:46.566000', '2023-05-27 13:16:46.566000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/cbe005fdd8e74d8b903e3ee05e406d54.webp', 'XL', 'B3A6GRO5-TRANG', 21),
(65, '2023-05-27 13:16:46.566000', '2023-05-27 13:16:46.566000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/cbe005fdd8e74d8b903e3ee05e406d54.webp', 'M', 'B3A6GRO5-TRANG', 21),
(66, '2023-05-27 13:16:46.567000', '2023-05-27 13:16:46.567000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/cbe005fdd8e74d8b903e3ee05e406d54.webp', 'L', 'B3A6GRO5-TRANG', 21),
(67, '2023-05-27 13:22:47.807000', '2023-05-27 13:22:47.807000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/9067c8d9ba464cad820d8178b0922f70.webp', 'S', '0ACALWWT-TRANG', 23),
(68, '2023-05-27 13:22:47.808000', '2023-05-27 13:22:47.808000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/9067c8d9ba464cad820d8178b0922f70.webp', 'M', '0ACALWWT-TRANG', 23),
(69, '2023-05-27 13:22:47.809000', '2023-05-27 13:22:47.809000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/9067c8d9ba464cad820d8178b0922f70.webp', 'L', '0ACALWWT-TRANG', 23),
(70, '2023-05-27 13:22:47.809000', '2023-05-27 13:22:47.809000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/cd16b407627846b58ee0d393dd43b8af.webp', 'XL', '7UE7AZUO-HONG', 23),
(71, '2023-05-27 13:22:47.810000', '2023-05-27 13:22:47.810000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/cd16b407627846b58ee0d393dd43b8af.webp', 'S', '7UE7AZUO-HONG', 23),
(72, '2023-05-27 13:22:47.810000', '2023-05-27 13:22:47.810000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/cd16b407627846b58ee0d393dd43b8af.webp', 'L', '7UE7AZUO-HONG', 23),
(73, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/1924d1bc923f4ef1874a0e9f2ac93fde.webp', 'S', 'RAWUYGPU-VANG', 24),
(74, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/1924d1bc923f4ef1874a0e9f2ac93fde.webp', 'M', 'RAWUYGPU-VANG', 24),
(75, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'Vàng', 'http://localhost:8080/api/v1/admin/FileUpload/1924d1bc923f4ef1874a0e9f2ac93fde.webp', 'L', 'RAWUYGPU-VANG', 24),
(76, '2023-05-27 13:25:47.776000', '2023-05-27 13:25:47.776000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/035883772eae42a0b2a3cc251630622d.webp', 'XL', 'WEA8M1LK-TRANG', 24),
(77, '2023-05-27 13:25:47.792000', '2023-05-27 13:25:47.792000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/035883772eae42a0b2a3cc251630622d.webp', 'M', 'WEA8M1LK-TRANG', 24),
(78, '2023-05-27 13:25:47.792000', '2023-05-27 13:25:47.792000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/035883772eae42a0b2a3cc251630622d.webp', 'L', 'WEA8M1LK-TRANG', 24),
(79, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/9666de5814644b7493c455722e16115d.webp', 'S', 'UJW1AIYS-XANH', 25),
(80, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/9666de5814644b7493c455722e16115d.webp', 'M', 'UJW1AIYS-XANH', 25),
(81, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/9666de5814644b7493c455722e16115d.webp', 'L', 'UJW1AIYS-XANH', 25),
(82, '2023-05-27 13:30:14.189000', '2023-05-27 13:30:14.189000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/0d369fb362c447c7b10f69674f2b82c5.webp', 'XL', 'TF0OSRUJ-NAU', 25),
(83, '2023-05-27 13:30:14.205000', '2023-05-27 13:30:14.205000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/0d369fb362c447c7b10f69674f2b82c5.webp', 'M', 'TF0OSRUJ-NAU', 25),
(84, '2023-05-27 13:30:14.205000', '2023-05-27 13:30:14.205000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/0d369fb362c447c7b10f69674f2b82c5.webp', 'L', 'TF0OSRUJ-NAU', 25),
(143, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/864779cdd1df4f4e87a5b6466208f794.webp', 'S', 'V8ZLBHQX-CAM', 26),
(144, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/864779cdd1df4f4e87a5b6466208f794.webp', 'M', 'V8ZLBHQX-CAM', 26),
(145, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/864779cdd1df4f4e87a5b6466208f794.webp', 'L', 'V8ZLBHQX-CAM', 26),
(146, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/e2fa59c8586d404ea1cb4b8f7834ec99.webp', 'XL', '9XM5DRT1-TRANG', 26),
(147, '2023-05-27 14:49:39.839000', '2023-05-27 14:49:39.839000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/e2fa59c8586d404ea1cb4b8f7834ec99.webp', 'L', '9XM5DRT1-TRANG', 26),
(148, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/bb278a6752ef4d1ea0b55bce49896142.webp', 'XL', 'GE001BK2-HONG', 27),
(149, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/bb278a6752ef4d1ea0b55bce49896142.webp', 'M', 'GE001BK2-HONG', 27),
(150, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/bb278a6752ef4d1ea0b55bce49896142.webp', 'L', 'GE001BK2-HONG', 27),
(151, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/731cf601bedd46599895db204dd9d3d6.webp', 'XL', 'OCA447QL-CAM', 27),
(152, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/731cf601bedd46599895db204dd9d3d6.webp', 'S', 'OCA447QL-CAM', 27),
(153, '2023-05-27 14:52:34.719000', '2023-05-27 14:52:34.719000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/731cf601bedd46599895db204dd9d3d6.webp', 'L', 'OCA447QL-CAM', 27),
(154, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/64f3fd37c1624e8d94b81ba80fafa150.webp', 'S', 'B13J9CAT-TRANG', 28),
(155, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/64f3fd37c1624e8d94b81ba80fafa150.webp', 'M', 'B13J9CAT-TRANG', 28),
(156, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/64f3fd37c1624e8d94b81ba80fafa150.webp', 'L', 'B13J9CAT-TRANG', 28),
(157, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/9943575b32e74c4ab8e21e7cf52c4d5d.webp', 'XL', 'MQLKNEZO-XANH', 28),
(158, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/9943575b32e74c4ab8e21e7cf52c4d5d.webp', 'M', 'MQLKNEZO-XANH', 28),
(159, '2023-05-27 14:55:21.002000', '2023-05-27 14:55:21.002000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/9943575b32e74c4ab8e21e7cf52c4d5d.webp', 'L', 'MQLKNEZO-XANH', 28),
(160, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/0e24a7e0d0fb4716bb05e1ca29ca0803.webp', 'S', 'UFZTDPSW-TRANG', 29),
(161, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/0e24a7e0d0fb4716bb05e1ca29ca0803.webp', 'M', 'UFZTDPSW-TRANG', 29),
(162, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/0e24a7e0d0fb4716bb05e1ca29ca0803.webp', 'L', 'UFZTDPSW-TRANG', 29),
(163, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/d6ade651ba8542a39f8b54d988a3d023.webp', 'XL', 'AAQ1OMAH-XANH', 29),
(164, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/d6ade651ba8542a39f8b54d988a3d023.webp', 'S', 'AAQ1OMAH-XANH', 29),
(165, '2023-05-27 14:58:52.330000', '2023-05-27 14:58:52.330000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/d6ade651ba8542a39f8b54d988a3d023.webp', 'L', 'AAQ1OMAH-XANH', 29),
(166, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/85e2ec523ef74c5794e03daf7752a2f9.webp', 'S', 'MSEZX7ZR-TRANG', 30),
(167, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/85e2ec523ef74c5794e03daf7752a2f9.webp', 'M', 'MSEZX7ZR-TRANG', 30),
(168, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/85e2ec523ef74c5794e03daf7752a2f9.webp', 'L', 'MSEZX7ZR-TRANG', 30),
(169, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/947123b9ba2b4fe8a7536c7705da7e87.webp', 'XL', 'VQVUJBJT-ĐEN', 30),
(170, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/947123b9ba2b4fe8a7536c7705da7e87.webp', 'S', 'VQVUJBJT-ĐEN', 30),
(171, '2023-05-27 15:01:21.441000', '2023-05-27 15:01:21.441000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/947123b9ba2b4fe8a7536c7705da7e87.webp', 'L', 'VQVUJBJT-ĐEN', 30),
(172, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/ee604fd35fc04fd6a7cbfc242e65c8fa.webp', 'XL', '0RC2N419-XANH', 31),
(173, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/ee604fd35fc04fd6a7cbfc242e65c8fa.webp', 'S', '0RC2N419-XANH', 31),
(174, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/ee604fd35fc04fd6a7cbfc242e65c8fa.webp', 'M', '0RC2N419-XANH', 31),
(175, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/ee604fd35fc04fd6a7cbfc242e65c8fa.webp', 'L', '0RC2N419-XANH', 31),
(176, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/bc7c98d98a334909b06f86a540f86e94.webp', 'XL', 'FI3ML73O-TRANG', 31),
(177, '2023-05-27 15:04:35.578000', '2023-05-27 15:04:35.578000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/bc7c98d98a334909b06f86a540f86e94.webp', 'S', 'FI3ML73O-TRANG', 31),
(178, '2023-05-27 15:04:35.582000', '2023-05-27 15:04:35.582000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/bc7c98d98a334909b06f86a540f86e94.webp', 'M', 'FI3ML73O-TRANG', 31),
(179, '2023-05-27 15:04:35.582000', '2023-05-27 15:04:35.582000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/bc7c98d98a334909b06f86a540f86e94.webp', 'L', 'FI3ML73O-TRANG', 31),
(180, '2023-05-27 15:10:50.976000', '2023-05-27 15:10:50.976000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/699e97e275024fcf9d969ac972e4ca9c.webp', 'S', 'LDDOJ0LQ-ĐEN', 32),
(181, '2023-05-27 15:10:50.976000', '2023-05-27 15:10:50.976000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/699e97e275024fcf9d969ac972e4ca9c.webp', 'M', 'LDDOJ0LQ-ĐEN', 32),
(182, '2023-05-27 15:10:50.976000', '2023-05-27 15:10:50.976000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/699e97e275024fcf9d969ac972e4ca9c.webp', 'L', 'LDDOJ0LQ-ĐEN', 32),
(183, '2023-05-27 15:10:50.977000', '2023-05-27 15:10:50.977000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/a29aac8ed9154d96a8958d32cbc59560.webp', 'XL', 'G1782LEU-TRANG', 32),
(184, '2023-05-27 15:10:50.978000', '2023-05-27 15:10:50.978000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/a29aac8ed9154d96a8958d32cbc59560.webp', 'M', 'G1782LEU-TRANG', 32),
(185, '2023-05-27 15:10:50.978000', '2023-05-27 15:10:50.978000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/a29aac8ed9154d96a8958d32cbc59560.webp', 'L', 'G1782LEU-TRANG', 32),
(186, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/00e6065864744e7898d7ae2741d10764.webp', 'S', '93EPO9TR-NAU', 33),
(187, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/00e6065864744e7898d7ae2741d10764.webp', 'M', '93EPO9TR-NAU', 33),
(188, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/00e6065864744e7898d7ae2741d10764.webp', 'L', '93EPO9TR-NAU', 33),
(189, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/87669a29f99e4568b186f76778d91c9b.webp', 'XL', '0JQ1PS5H-ĐEN', 33),
(190, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/87669a29f99e4568b186f76778d91c9b.webp', 'S', '0JQ1PS5H-ĐEN', 33),
(191, '2023-05-27 15:13:37.867000', '2023-05-27 15:13:37.867000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/87669a29f99e4568b186f76778d91c9b.webp', 'L', '0JQ1PS5H-ĐEN', 33),
(192, '2023-05-27 15:16:12.882000', '2023-05-27 15:16:12.882000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2e1e79ebdbfa47e99d28db122330f9e0.webp', 'S', 'YO1YB2C1-ĐEN', 34),
(193, '2023-05-27 15:16:12.882000', '2023-05-27 15:16:12.882000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2e1e79ebdbfa47e99d28db122330f9e0.webp', 'M', 'YO1YB2C1-ĐEN', 34),
(194, '2023-05-27 15:16:12.882000', '2023-05-27 15:16:12.882000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/2e1e79ebdbfa47e99d28db122330f9e0.webp', 'L', 'YO1YB2C1-ĐEN', 34),
(195, '2023-05-27 15:16:12.882000', '2023-05-27 15:16:12.882000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/822b32b5efba4c9bae42175e273b1505.webp', 'XL', '99XTLTPG-TRANG', 34),
(196, '2023-05-27 15:16:12.887000', '2023-05-27 15:16:12.887000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/822b32b5efba4c9bae42175e273b1505.webp', 'S', '99XTLTPG-TRANG', 34),
(197, '2023-05-27 15:16:12.888000', '2023-05-27 15:16:12.888000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/822b32b5efba4c9bae42175e273b1505.webp', 'M', '99XTLTPG-TRANG', 34),
(198, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/09c99025c8cf4731ac15514d0919d1f9.webp', 'S', '4LE2YQSU-ĐEN', 35),
(199, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/09c99025c8cf4731ac15514d0919d1f9.webp', 'M', '4LE2YQSU-ĐEN', 35),
(200, '2023-05-27 15:19:46.707000', '2023-05-27 15:19:46.707000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/09c99025c8cf4731ac15514d0919d1f9.webp', 'L', '4LE2YQSU-ĐEN', 35),
(201, '2023-05-27 15:19:46.713000', '2023-05-27 15:19:46.713000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/52af2f70e0754610b00f81b1bc0a42e4.webp', 'XL', 'WASHQGKY-CAM', 35),
(202, '2023-05-27 15:19:46.713000', '2023-05-27 15:19:46.713000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/52af2f70e0754610b00f81b1bc0a42e4.webp', 'M', 'WASHQGKY-CAM', 35),
(203, '2023-05-27 15:19:46.713000', '2023-05-27 15:19:46.713000', 'Cam', 'http://localhost:8080/api/v1/admin/FileUpload/52af2f70e0754610b00f81b1bc0a42e4.webp', 'L', 'WASHQGKY-CAM', 35),
(204, '2023-05-27 15:21:50.655000', '2023-05-27 15:21:50.655000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/c821a8e18df64db2bfe4d715a3af66ec.webp', 'S', 'KRP6PG7U-TRANG', 36),
(205, '2023-05-27 15:21:50.656000', '2023-05-27 15:21:50.656000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/c821a8e18df64db2bfe4d715a3af66ec.webp', 'M', 'KRP6PG7U-TRANG', 36),
(206, '2023-05-27 15:21:50.656000', '2023-05-27 15:21:50.656000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/c821a8e18df64db2bfe4d715a3af66ec.webp', 'L', 'KRP6PG7U-TRANG', 36),
(207, '2023-05-27 15:21:50.656000', '2023-05-27 15:21:50.656000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/69786dfa29de43dcb7dc8bca4e7a22d0.webp', 'XL', 'LP3Z8NQL-XANH', 36),
(208, '2023-05-27 15:21:50.656000', '2023-05-27 15:21:50.656000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/69786dfa29de43dcb7dc8bca4e7a22d0.webp', 'S', 'LP3Z8NQL-XANH', 36),
(209, '2023-05-27 15:21:50.656000', '2023-05-27 15:21:50.656000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/69786dfa29de43dcb7dc8bca4e7a22d0.webp', 'L', 'LP3Z8NQL-XANH', 36),
(219, '2023-05-28 21:48:16.937000', '2023-05-28 21:48:16.937000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/363bdeab0b974302980ee679e4ee5aa5.webp', 'S', '1GJ8GE4W-XANH', 38),
(220, '2023-05-28 21:48:16.938000', '2023-05-28 21:48:16.938000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/363bdeab0b974302980ee679e4ee5aa5.webp', 'M', '1GJ8GE4W-XANH', 38),
(221, '2023-05-28 21:48:16.938000', '2023-05-28 21:48:16.938000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/363bdeab0b974302980ee679e4ee5aa5.webp', 'L', '1GJ8GE4W-XANH', 38),
(222, '2023-05-28 21:48:16.939000', '2023-05-28 21:48:16.939000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/5075f83742224818aa2b694808087b19.webp', 'XL', '7H7CCKNO-TRANG', 38),
(223, '2023-05-28 21:48:16.939000', '2023-05-28 21:48:16.939000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/5075f83742224818aa2b694808087b19.webp', 'S', '7H7CCKNO-TRANG', 38),
(224, '2023-05-28 21:48:16.939000', '2023-05-28 21:48:16.939000', 'Trắng', 'http://localhost:8080/api/v1/admin/FileUpload/5075f83742224818aa2b694808087b19.webp', 'L', '7H7CCKNO-TRANG', 38),
(225, '2023-05-28 21:48:16.940000', '2023-05-28 21:48:16.940000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/33513418c1da45338580567bf468c9dd.webp', 'XL', 'SHRTTZTY-HONG', 38),
(226, '2023-05-28 21:48:16.940000', '2023-05-28 21:48:16.940000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/33513418c1da45338580567bf468c9dd.webp', 'S', 'SHRTTZTY-HONG', 38),
(227, '2023-05-28 21:48:16.940000', '2023-05-28 21:48:16.940000', 'Hồng', 'http://localhost:8080/api/v1/admin/FileUpload/33513418c1da45338580567bf468c9dd.webp', 'M', 'SHRTTZTY-HONG', 38),
(228, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/b00d022a0ef84edda273a3d06d4ca7e5.webp', 'XL', 'H42SFYLT-ĐEN', 39),
(229, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/b00d022a0ef84edda273a3d06d4ca7e5.webp', 'S', 'H42SFYLT-ĐEN', 39),
(230, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/fac1a1c9669b4ee1a440b94d1f8ea0b6.webp', 'XL', 'FM5MP2J0-XANH', 39),
(231, '2023-05-28 21:52:38.456000', '2023-05-28 21:52:38.456000', 'Xanh', 'http://localhost:8080/api/v1/admin/FileUpload/fac1a1c9669b4ee1a440b94d1f8ea0b6.webp', 'S', 'FM5MP2J0-XANH', 39),
(232, '2023-05-28 21:56:45.387000', '2023-05-28 21:56:45.387000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/4c917446a20c46099b1299a241df96fd.webp', 'XL', '51SO6NJT-ĐO', 40),
(233, '2023-05-28 21:56:45.387000', '2023-05-28 21:56:45.387000', 'Đỏ', 'http://localhost:8080/api/v1/admin/FileUpload/4c917446a20c46099b1299a241df96fd.webp', 'S', '51SO6NJT-ĐO', 40),
(234, '2023-05-28 21:56:45.387000', '2023-05-28 21:56:45.387000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/96ecf030fa9e471b92a5c742f1a97760.webp', 'XL', 'PFXEHJHG-NAU', 40),
(235, '2023-05-28 21:56:45.393000', '2023-05-28 21:56:45.393000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/96ecf030fa9e471b92a5c742f1a97760.webp', 'S', 'PFXEHJHG-NAU', 40),
(236, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/5c0e288a4f5c4889a88da72d8925f075.webp', 'XL', 'KMCNWQQS-ĐEN', 41),
(237, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', 'Đen', 'http://localhost:8080/api/v1/admin/FileUpload/5c0e288a4f5c4889a88da72d8925f075.webp', 'S', 'KMCNWQQS-ĐEN', 41),
(238, '2023-05-29 11:30:49.123000', '2023-05-29 11:30:49.123000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/4a7dca892cb44b6cb6a35aa1adc26f76.webp', 'XL', '5N2GQ8LS-NAU', 41),
(239, '2023-05-29 11:30:49.131000', '2023-05-29 11:30:49.131000', 'Nâu', 'http://localhost:8080/api/v1/admin/FileUpload/4a7dca892cb44b6cb6a35aa1adc26f76.webp', 'S', '5N2GQ8LS-NAU', 41);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `create_at`, `update_at`, `name`) VALUES
(1, '2023-03-22 13:14:08.000000', '2023-03-22 13:14:08.000000', 'ADMIN'),
(2, NULL, NULL, 'USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `create_at`, `update_at`, `email`, `fullname`, `password`) VALUES
(10, '2023-03-22 13:15:19.026000', '2023-03-22 13:15:19.026000', 'admin@gmail.com', NULL, '$2a$10$fEYHAPNhksDC175WoD.JrOat4BiausNnd0u4lDHeQFLrNMWhluL1e'),
(11, '2023-05-27 14:26:50.808000', '2023-05-27 14:26:50.808000', 'nhuan@gmail.com', NULL, '$2a$10$VP0Jz2DQgvy6unhNBekvQ.wG/d3clqbzNZkqV31u0YrnoNCzlFDpi'),
(12, '2023-05-27 15:24:03.523000', '2023-05-27 15:24:03.523000', '19130164@st.hcmuaf.edu.vn', NULL, '$2a$10$aRTZLwzXpbNwBLNEBrnuN.wu8AHsiBtYNoomN76gPA0eMZ.1XPctm'),
(13, '2023-05-27 16:18:42.948000', '2023-05-27 16:18:42.948000', '19130154@st.hcmuaf.edu.vn', NULL, '$2a$10$PBWp0e.URc66rfoAoS.aZ.UdtS3KgcCps4IUl8DGzPQdNPUuMPizG');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(10, 1),
(10, 2),
(11, 2),
(12, 2),
(13, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb5o626f86h46m4s7ms6ginnop` (`user_id`);

--
-- Chỉ mục cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlqwuo55w1gm4779xcu3t4wnrd` (`cart_id`),
  ADD KEY `FKpbcx1acwbqj9esdr9hum0o7v7` (`variant_id`);

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
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FKlqwuo55w1gm4779xcu3t4wnrd` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `FKpbcx1acwbqj9esdr9hum0o7v7` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`);

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
