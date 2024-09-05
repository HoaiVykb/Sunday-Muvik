-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th6 29, 2024 lúc 10:26 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `wemusic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$hGg02aSLIpMkAAXngodN8Om2PeOw4jvNPKNP6AVZz3gPdmQ0I1Fx2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blocked`
--

CREATE TABLE `blocked` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(38, 'Kpop'),
(39, 'US-UK'),
(40, 'Ballad'),
(41, 'Lofi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `id` int NOT NULL,
  `from` int NOT NULL,
  `to` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chat`
--

INSERT INTO `chat` (`id`, `from`, `to`, `message`, `read`, `time`) VALUES
(1, 7, 4, 'hello', 1, '2024-06-22 13:19:18'),
(2, 4, 7, 'chao', 0, '2024-06-22 13:19:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `tid` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `uid`, `tid`, `message`, `time`) VALUES
(2, 4, 13, 'hahhaa ', '2024-06-22 13:19:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `downloads`
--

CREATE TABLE `downloads` (
  `id` int NOT NULL,
  `by` int NOT NULL,
  `track` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info_pages`
--

CREATE TABLE `info_pages` (
  `id` int NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` tinyint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes` (
  `id` int NOT NULL,
  `track` int NOT NULL,
  `by` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `likes`
--

INSERT INTO `likes` (`id`, `track`, `by`, `time`) VALUES
(8, 13, 7, '2024-06-22 13:15:43'),
(9, 9, 4, '2024-06-28 22:58:37'),
(10, 8, 4, '2024-06-28 22:58:38'),
(11, 7, 4, '2024-06-28 22:58:40'),
(12, 6, 4, '2024-06-28 22:58:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int NOT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `from` int NOT NULL,
  `to` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `child` int NOT NULL DEFAULT '0',
  `type` int NOT NULL,
  `read` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `from`, `to`, `parent`, `child`, `type`, `read`, `time`) VALUES
(7, 4, 4, 6, 1, 1, 1, '2024-06-22 10:54:12'),
(9, 5, 4, 0, 0, 4, 1, '2024-06-22 11:10:22'),
(10, 7, 7, 13, 0, 2, 0, '2024-06-22 13:15:43'),
(11, 7, 4, 0, 0, 4, 1, '2024-06-22 13:18:55'),
(12, 4, 7, 13, 2, 1, 0, '2024-06-22 13:19:39'),
(13, 4, 4, 9, 0, 2, 0, '2024-06-28 22:58:37'),
(14, 4, 4, 8, 0, 2, 0, '2024-06-28 22:58:38'),
(15, 4, 4, 7, 0, 2, 0, '2024-06-28 22:58:40'),
(16, 4, 4, 6, 0, 2, 0, '2024-06-28 22:58:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `by` int NOT NULL,
  `payer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_country` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `status` int NOT NULL,
  `valid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `by`, `payer_id`, `payer_first_name`, `payer_last_name`, `payer_email`, `payer_country`, `txn_id`, `amount`, `currency`, `type`, `status`, `valid`, `time`) VALUES
(1, 2, 'promoted', 'promoted', 'promoted', 'promoted', 'promoted', 'promoted', 0, 'USD', 1, 1, '2024-08-18 01:08:37', '2023-08-18 01:08:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlistentries`
--

CREATE TABLE `playlistentries` (
  `id` int NOT NULL,
  `playlist` int NOT NULL,
  `track` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `playlistentries`
--

INSERT INTO `playlistentries` (`id`, `playlist`, `track`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlists`
--

CREATE TABLE `playlists` (
  `id` int NOT NULL,
  `by` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `playlists`
--

INSERT INTO `playlists` (`id`, `by`, `name`, `description`, `public`, `time`) VALUES
(1, 3, 'Nhạc remix', '', 1, '2023-08-25 02:27:17'),
(2, 7, 'balad', '', 1, '2024-06-22 13:15:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `relations`
--

CREATE TABLE `relations` (
  `id` int NOT NULL,
  `leader` int NOT NULL,
  `subscriber` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `relations`
--

INSERT INTO `relations` (`id`, `leader`, `subscriber`, `time`) VALUES
(1, 4, 5, '2024-06-22 11:10:22'),
(2, 4, 7, '2024-06-22 13:18:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports` (
  `id` int NOT NULL,
  `track` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `reason` tinyint NOT NULL,
  `by` int NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `perpage` int NOT NULL,
  `volume` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `captcha` int NOT NULL,
  `intervaln` int NOT NULL,
  `time` int NOT NULL,
  `size` int NOT NULL,
  `format` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` int NOT NULL,
  `artsize` int NOT NULL,
  `artformat` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracksize` int NOT NULL,
  `trackformat` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracksizetotal` bigint NOT NULL,
  `cperpage` int NOT NULL,
  `ilimit` int NOT NULL,
  `mlimit` int NOT NULL,
  `rperpage` int NOT NULL,
  `sperpage` int NOT NULL,
  `nperpage` tinyint NOT NULL,
  `nperwidget` tinyint NOT NULL,
  `lperpost` int NOT NULL,
  `aperip` int NOT NULL,
  `conline` int NOT NULL,
  `ronline` tinyint NOT NULL,
  `mperpage` tinyint NOT NULL,
  `chatr` int NOT NULL,
  `email_activation` tinyint NOT NULL,
  `email_comment` tinyint NOT NULL,
  `email_like` tinyint NOT NULL,
  `email_new_friend` tinyint NOT NULL,
  `smiles` tinyint NOT NULL,
  `permalinks` tinyint NOT NULL,
  `fbapp` int NOT NULL,
  `fbappid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fbappsecret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_email` int NOT NULL,
  `smtp_host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_secure` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_auth` int NOT NULL,
  `smtp_username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `as3` int NOT NULL,
  `as3_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `as3_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `as3_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `as3_bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypalapp` int NOT NULL,
  `paypalclientid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypalsecret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypalsand` int NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `promonth` decimal(6,2) NOT NULL,
  `proyear` decimal(6,2) NOT NULL,
  `protracksize` int NOT NULL,
  `protracktotal` bigint NOT NULL,
  `ad1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad3` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad4` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad5` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad6` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad7` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_code` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tos_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lt` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lk` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`title`, `theme`, `perpage`, `volume`, `captcha`, `intervaln`, `time`, `size`, `format`, `mail`, `artsize`, `artformat`, `tracksize`, `trackformat`, `tracksizetotal`, `cperpage`, `ilimit`, `mlimit`, `rperpage`, `sperpage`, `nperpage`, `nperwidget`, `lperpost`, `aperip`, `conline`, `ronline`, `mperpage`, `chatr`, `email_activation`, `email_comment`, `email_like`, `email_new_friend`, `smiles`, `permalinks`, `fbapp`, `fbappid`, `fbappsecret`, `smtp_email`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_username`, `smtp_password`, `language`, `timezone`, `as3`, `as3_key`, `as3_secret`, `as3_region`, `as3_bucket`, `paypalapp`, `paypalclientid`, `paypalsecret`, `paypalsand`, `currency`, `promonth`, `proyear`, `protracksize`, `protracktotal`, `ad1`, `ad2`, `ad3`, `ad4`, `ad5`, `ad6`, `ad7`, `tracking_code`, `tos_url`, `privacy_url`, `cookie_url`, `lt`, `lk`) VALUES
('Sunday Muvik', 'venus', 10, '0.80', 0, 60000, 0, 2097152, 'png,jpg,gif,jpeg', 1, 2097152, 'png,jpg,gif,jpeg', 5242880, 'mp3,m4a,mp4', 104857600, 10, 9, 1000, 20, 10, 100, 30, 5, 0, 600, 7, 10, 30, 0, 1, 1, 1, 1, 0, 0, '', 'thinh1', 0, '', 0, '0', 0, '', '', 'Vietnamese', 'Asia/Bangkok', 0, '', '', 'us-east-2', '', 1, '', '', 0, 'USD', 3.00, 29.00, 52428800, 1073741824, 'Test quang cao 1', '', '', '', '', '', '', '', 'Project ck', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tracks`
--

CREATE TABLE `tracks` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `art` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `buy` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` date DEFAULT NULL,
  `license` int NOT NULL,
  `size` int NOT NULL,
  `as3_track` int NOT NULL,
  `download` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `downloads` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tracks`
--

INSERT INTO `tracks` (`id`, `uid`, `title`, `description`, `name`, `tag`, `art`, `buy`, `record`, `release`, `license`, `size`, `as3_track`, `download`, `time`, `public`, `likes`, `downloads`, `views`) VALUES
(6, 4, 'NHỮNG LỜI HỨA BỎ QUÊN  VŨ x DEAR JANE', 'Credits:\n\nSinger/Lyricist: Vũ.\r\nComposer: Howie @Dear Jane\r\nArranger: Dear Jane\r\nProducer: Howie @Dear Jane, Pesky Kwan\r\nMixing Engineer: Pesky Kwan\r\nMastering Engineer: Alex Psaroudaki\n\n—\n\nRecord Label: Warner Music Vietnam\r\nExecutive Producer: Dan Ton\r\nA&amp;R: Thu Hien\r\nMarketing &amp; Promotion: H. Luu, Eden Tran, Loan Nguyen, Stella Dang, Tuyet Anh\r\nArtwork &amp; Design: Dung Ngo, Nhi Ton\n\n—\n\nStarring | Vũ., Joseph Ng (@josephckng,) Vanora Hui (@vanora.hys), Martin Wong (@mar.tin.wong), Dear Jane (@dearjaneofficial)\n\nDirector | Rony Kong\r\nAssistant Director | WOOTWOOT\n\nProducer | Rachael Leung\r\nProduction Team | Neo Ng, Gary Yu\n\nDirector of Photography | Felix Leong\r\nFocus Puller | Sokin\r\nGaffer | Jerry Tai\r\nGrip &amp; Electrician | Ng Tsz Wai\n\nArt Direction &amp; Styling | WORLDWARPROBLEM\n\nArt Team | Kelly Leung, Sk Hon\n\nAssistant Stylist | Tiffany Liu, Winky Wong\n\nWardrobe | Isabel Marant, 拾衣復古雜貨店 @12.oclock.vintage, Midwest Vintage\n\nHair Stylist | Don Don\r\nHair Assistant | Victoria \r\nMakeup Artist | Agnes Yeung Makeup \r\nMakeup Assistant | Jenny Lai\n\nEditor | Rony Kong\r\nColourist | Eric Chan\r\nStill Photographers | Cow10_@theukiyostduio, mokzeonming, Warren Ng\n\nSpecial thanks to Warner Music Hong Kong', '1643381149_1398697260_2069310576.mp3', 'ballad,', '1819088843_921874853_169115682.jpg', '', '', NULL, 0, 4144620, 0, 0, '2024-06-22 10:53:55', 1, 1, 0, 1),
(7, 4, 'NẾU NGÀY ẤY  SOOBIN HOÀNG SƠN Official Lyric Video', 'Sáng tác: NGUYỄN ĐỨC TÙNG\r\nHoà âm: Lê Thanh Tâm\r\nMaster: Long Halo\r\nLyric Video: Đỗ Hoàng\r\nhttps://m.zingmp3.vn/bai-hat/Neu-Ngay...\r\n \r\nVERSE:\r\nCách đây vài năm thôi, lúc ấy anh vừa biết lớn\r\nGặp em ngẩn ngơ thẩn thơ trong chiều, ê a chẳng nói được nhiều\r\nEm ngây thơ hồn nhiên và đôi mắt sáng như chưa từng yêu\r\nNgại ngùng anh chẳng dám nói, nên câu chuyện tình chơi vơi\r\n \r\nEm đâu nào biết, anh vẫn luôn ở đây\r\nNhìn từ xa theo bóng em nhạt nhoà, để tháng năm dài trôi qua\r\n \r\nCHORUS:\r\nNếu ngày ấy anh ngỏ lời thương và yêu đậm sâu với em\r\nE có tin anh và nắm tay anh,\r\nMình cùng đi qua từng mùa đông rét buốt\r\nNếu ngày ấy a là chàng trai mà em ngày đêm ước ao\r\nDẫu nắng hay mưa dù có ra sao\r\nThì giờ đây anh đã có câu chuyện thật đẹp\r\n \r\nBRIDGE:\r\nSau tiếng cười cho em, anh bước đi ngậm ngùi\r\nSau ánh mắt cười của anh còn gì ngoài bao tiếc nuối\r\nChiều nay gió cuốn lá chợt về lao xao\r\nChuyện tình yêu xin giữ lại thành chiêm bao\r\nMột giấc mơ êm đềm dành cho nhau', '150146787_1144233554_436230900.mp3', 'ballad,', '804667106_380842749_1320134769.jpg', '', '', NULL, 0, 4830073, 0, 0, '2024-06-22 10:57:01', 1, 1, 0, 0),
(8, 4, 'THỊNH SUY live Mai Mình Xa  Live Session 22', 'in chào,\n\nĐây là chuỗi Live Session &quot;Không Nơi Đâu Là Không Thể Live&quot; được lên sóng vào lúc 19h thứ 4 và thứ 7 hàng tuần, mục đích chúng tôi muốn mang đến cho mọi người những bản live nhẹ nhàng những bản live 1 shot 1 take đầy chất mộc mạc và tự nhiên. \r\n#MADproduction #Maiminhxa #Thinhsuy\n\nFollow - Thịnh Suy:\r\n  / rio.phamtom  \r\n  / thinhsuynghi  \r\n   / @thinhsuy  \n\nFollow - M.A.D:\r\nFanpage:   / madproduction.vn  \r\nInstargam:   / madproduction.vn  \r\nTiktok:   / madproduction.vn  \r\nSoundcloud:   / madproduction  \r\nYoutube:    / @m.a.dproduction  \n\n🎁 DONATE\r\n🏛️ MOMO: 0906928000\r\n🏛️ ACB BANK: 80808808\r\nTên Tài Khoản: NGUYEN TIEN DANH\n\nContact for work: \r\nMail: madproduction.booking@gmail.com | Phone: 090 6928000 (Danh)\n\nFAN GROUP:   / madhome  \n\nContact for work: 0906928000 (Danh) - contact@madproduction.info\n\n© Bản quyền thuộc về M.A.D Production\r\n© Copyright by M.A.D Production ☞ Do not Reup', '1917963371_480088751_642509521.mp3', 'ballad,', '2093239121_388791955_961643003.jpg', '', '', NULL, 0, 2200274, 0, 0, '2024-06-22 11:03:43', 1, 1, 0, 0),
(9, 4, 'B RAY x SOFIA  CHÂU ĐĂNG KHOA  THIÊU THÂN  OFFICIAL MV', 'B RAY x SOFIA &amp; CHÂU ĐĂNG KHOA | THIÊU THÂN | OFFICIAL MV\r\n#ThieuThan #BRay #Sofia #ChauDangKhoa \n\nDownload/Stream: https://dfan.to/ThieuThan\n\nSinger: B Ray &amp; Sofia\r\nComposer: B Ray &amp; Châu Đăng Khoa\r\nMusic Producer: Châu Đăng Khoa\r\nRecording &amp; mixing: GSN studio \r\nMastering:  Gausieunhan - Châu Đăng Khoa\r\nSound Engineer : Daniel Mastro\n\nExecutive Producer: Nguyễn Sơn Quyền\r\nProduced: Phạm Bình\r\nPR Manager: Tôn Phong Huỳnh Trần\r\nSocial Manager: Dương Quang Hiếu\r\nCast: Lâm Thanh Nhã, Nguyễn Minh Hà, Minh Thảo\n\nStylish:\r\nB Ray: Phạm Minh Trí, Dương Khuê\r\nSofia: Diêu Vĩ Nhân\r\nNam chính &amp; Nữ chính: Như Nguyễn Bảo My\n\nMake Up: Bùi Thiên Nghiêm\r\nPhotography: Nguyễn Bá Chiêu\r\nDesigner: HIEUDOHOA \r\nVideo BTS: Ares Team\n\n►Follow B Ray:\r\nYoutube: https://bit.ly/Brayofficial\r\nFanpage:   / yunbray  \r\nInstagram:   / yunbray110  \r\nTikTok:   / yunbray  \n\n@applemusic: https://apple.co/3xlUgqc\r\n@spotify: https://lnk.vn/WZ6YnHBS\n\n© Bản quyền thuộc về EvB Records ☞ Do not Reup\r\n© Copyright by EvB Records ☞ Do not Reup', '604100722_361549651_670258024.mp3', 'ballad,', '13543757_1269822090_871630849.jpg', '', '', NULL, 0, 3867513, 0, 0, '2024-06-22 11:06:55', 1, 1, 0, 1),
(10, 5, 'Avicii  Wake Me Up Official Lyric Video', '”It’s so far away from anything I’ve ever done before musically, so it’s obviously a weight off my shoulder that everything went the way it did” — Tim ’Avicii’ Bergling. \r\n \r\nEvery hit song begins with a first note. Released in 2013 on the album True, Wake Me Up was one of the songs where Avicii showed the world his ability to blend different genres, creating songs that touched people worldwide — transcending the boundaries of ages, music preferences, and cultures.  \n\nListen to more music by Avicii here: https://Avicii.lnk.to/Channel\r\nIn Dolby Atmos: https://avicii.lnk.to/SpatialAudio\n\n#Avicii #WakeMeUp #10years', '1456922744_245002778_307914492.mp3', 'us-uk,', '920267721_2053499984_1326697260.jpg', '', '', NULL, 0, 4024248, 0, 0, '2024-06-22 11:14:00', 1, 0, 0, 0),
(11, 5, 'y2mate.com - Avicii  The Nights Audio', 'Watch the official video for “The Nights” by Avicii:    • Avicii - The Nights  \n\nStream “The Nights” by Avicii: https://Avicii.lnk.to/The_Nights\r\nListen to Avicii: https://Avicii.lnk.to/Channel\n\nLyrics\n\nHey, once upon a younger year\r\nWhen all our shadows disappeared\r\nThe animals inside came out to play\r\nHey, when face to face with all our fears\r\nLearned our lessons through the tears\r\nMade memories we knew would never fade\r\nOne day my father—he told me,\r\n&quot;Son, don&#039;t let it slip away&quot;\r\nHe took me in his arms, I heard him say,\r\n&quot;When you get older\r\nYour wild life will live for younger days\r\nThink of me if ever you&#039;re afraid.&quot;\r\nHe said, &quot;One day you&#039;ll leave this world behind\r\nSo live a life you will remember.&quot;\r\nMy father told me when I was just a child\r\nThese are the nights that never die\r\nMy father told me\r\nWhen thunder clouds start pouring down\r\nLight a fire they can&#039;t put out\r\nCarve your name into those shinning stars\r\nHe said, &quot;Go venture far beyond the shores.\r\nDon&#039;t forsake this life of yours.\r\nI&#039;ll guide you home no matter where you are.&quot;\r\nOne day my father—he told me,\r\n&quot;Son, don&#039;t let it slip away.&quot;\r\nWhen I was just a kid I heard him say,\r\n&quot;When you get older\r\nYour wild life will live for younger days\r\nThink of me if ever you&#039;re afraid.&quot;\r\nHe said, &quot;One day you&#039;ll leave this world behind\r\nSo live a life you will remember.&quot;\r\nMy father told me when I was just a child\r\nThese are the nights that never die\r\nMy father told me\r\nThese are the nights that never die\r\nMy father told me\n\nMusic video by Avicii performing The Nights. (C) 2014 Avicii Music AB, under exclusive license to Universal Music AB', '703878241_2008300317_1966928708.mp3', 'us-uk,', '2019172768_918292551_493044568.jpg', '', '', NULL, 0, 2813002, 0, 0, '2024-06-22 11:16:36', 1, 0, 0, 0),
(12, 5, 'Clean Bandit  Symphony feat Zara Larsson Official Video', 'Listen to our new song Don&#039;t Leave Me Lonely! https://cleanbandit.lnk.to/dont-leave...\n\nCreative Director - Grace\r\nDirector - Jack\r\nDrone cinematography - Luke\r\nCinematography - Anya &amp; Dasha \n\nDownload or stream our new album &quot;What Is Love?&quot; - out now: http://atlanti.cr/WhatIsLove\n\nClick here to subscribe: http://bit.ly/SubscribeToCleanBandit\n\nFollow us:\r\nWebsite: http://cleanbandit.co.uk/\r\nFacebook:   / cleanbandit   \r\nTwitter:   / cleanbandit   \r\nInstagram:   / cleanbandit  \r\nSoundcloud:   / cleanbandit  \r\nSpotify: http://www.atlre.co.uk/CleanBanditSpo...', '935796527_1246711358_1946718644.mp3', 'us-uk,', '1835177755_2113718028_1293639675.jpg', '', '', NULL, 0, 3938148, 0, 0, '2024-06-22 11:18:28', 1, 0, 0, 1),
(13, 7, 'SƠN TÙNG MTP  ĐỪNG LÀM TRÁI TIM ANH ĐAU  OFFICIAL MUSIC VIDEO', 'dung lam trai tim anh dau', '1647600812_2134167320_40167589.mp3', 'ballad,', '248208096_1351308863_1535434234.jpg', '', '', NULL, 0, 5212506, 0, 0, '2024-06-22 13:13:25', 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `idu` int NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` date DEFAULT NULL,
  `facebook` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gplus` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `youtube` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vimeo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tumblr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `soundcloud` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `myspace` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastfm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` int NOT NULL DEFAULT '0',
  `suspended` int NOT NULL DEFAULT '0',
  `salted` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `login_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint NOT NULL DEFAULT '0',
  `online` int NOT NULL DEFAULT '0',
  `offline` tinyint NOT NULL DEFAULT '0',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notificationl` tinyint NOT NULL,
  `notificationc` tinyint NOT NULL,
  `notificationd` tinyint NOT NULL,
  `notificationf` tinyint NOT NULL,
  `email_comment` tinyint NOT NULL,
  `email_like` tinyint NOT NULL,
  `email_new_friend` tinyint NOT NULL,
  `email_newsletter` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`idu`, `username`, `password`, `email`, `first_name`, `last_name`, `country`, `city`, `website`, `description`, `date`, `facebook`, `twitter`, `gplus`, `youtube`, `vimeo`, `tumblr`, `soundcloud`, `myspace`, `lastfm`, `image`, `private`, `suspended`, `salted`, `login_token`, `cover`, `gender`, `online`, `offline`, `ip`, `notificationl`, `notificationc`, `notificationd`, `notificationf`, `email_comment`, `email_like`, `email_new_friend`, `email_newsletter`) VALUES
(1, 'taikhoanso1', '$2y$10$FhHEx4fo0qNDALO.htRt5.2HigsuseVvC1/it1TqLg6Jnj0C0y6eW', 'hoaivytest1@gmail.com', '', '', '', '', '', '', '2023-08-18', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', '$2y$10$gwTdvbfB7WhrZWHGWityXOnKYYpQptV2/Per7XUYSGvBFaiwKmJye', 'default.png', 0, 1692947621, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'taikhoanso2', '$2y$10$vFksDjDBbAeby4twZBovn.Fp99UQthNcQ9P/TVK6nUHCA2ZNHBdTO', 'hoaivytest2@gmail.com', '', '', '', '', '', '', '2023-08-18', '', '', '', '', '', '', '', '', '', '2127362737_892967477_814665905.jpg', 0, 0, '', '$2y$10$BLz5ZztyeVLGLDnhcNwTRu8/advFU7YAQY2/jgURNfSIYAV4sJpRi', '111601787_521071373_1771477565.jpg', 0, 1692947132, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(3, 'taikhoanso3', '$2y$10$wPE0WKwKpFvYI86ew2557egBtOfPVtj5TUPl/pdMb6jFY1QNR63DO', 'hoaivytest3@gmail.com', '', '', '', '', '', '', '2023-08-25', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', NULL, 'default.png', 0, 1692947191, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(4, 'hoaivykb', '$2y$10$0Kw/pPf16maxgVvTKbONF.7JwQo3Z5txTY0BV5.5ADobjpB/z3inC', 'hoaivy10122004@gmail.com', '', '', '', '', '', '', '2024-06-22', '', '', '', '', '', '', '', '', '', '1511406151_599897949_1397992485.jpg', 0, 0, '', '$2y$10$mAV8S0QkhbAtP1DHq2moceT4r7vdKSjIWgo1FEORg0nWLUdPrC0Ni', '1804412274_1938411905_1631395392.jpg', 0, 1719615538, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(5, 'hoaivykb2', '$2y$10$QZ4z4qw6EHk0uqcA9aE45uNmYEdZ/O9aVLf6VOs0CzPFpw9NAB7KW', 'hoaivy12a8@gmail.com', '', '', '', '', '', '', '2024-06-22', '', '', '', '', '', '', '', '', '', '1600127307_362969734_192464285.jpg', 0, 0, '', '$2y$10$oZT3kOjdou3ljCREAiPG0ehH9.s723Ba1cVTe2q2FGTY/fyUWDhmC', '1639417901_2051285463_1951369457.jpg', 0, 1719615348, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(6, 'imissthuy', '$2y$10$blIxgnYaUf0XDTf5OyMu7OK0TBKXBGS7R8C4rZE9f519Bf4fQxB8C', '1012200411az@gmail.com', '', '', '', '', '', '', '2024-06-22', '', '', '', '', '', '', '', '', '', '1131420289_646315080_1763975983.jpg', 0, 0, '', '$2y$10$Q.uEIXN7obwEBaJuK2gSw.Rty7pyb/ObsNgzbV9QUfxiSdKVSFjpC', '54904094_411527764_963257692.jpg', 0, 1719061812, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(7, 'hoaivy3', '$2y$10$ajoeAKJK.whQ5u9OBzutneYuGD1q0RyCWrnraPMJpFqZcV0EH5e6W', '12345@gmail.com', '', '', '', '', '', '', '2024-06-22', '', '', '', '', '', '', '', '', '', '281803643_139605681_737046232.jpg', 0, 0, '', '$2y$10$mT/2ijsmT0VYmaCUzBFzducp7pz/nV5gcxry8U4doPaSwsChdYu92', '1595822333_704551857_2018755983.jpg', 0, 1719062361, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1),
(8, 'vuvandong', '$2y$10$Jse9jgfSxOfuBgArPh5nWu6El6tcnxDLeojUoWSMdYlRMx5fyrmx.', '123@gmail.com', '', '', '', '', '', '', '2024-06-22', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', '$2y$10$HJ2vmt66a1.zMMostb03UO3wTLDoVFZmKpScKzp3TiFKK9KEiSXHC', 'default.png', 0, 1719062528, 0, '::1', 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `views`
--

CREATE TABLE `views` (
  `id` int NOT NULL,
  `by` int NOT NULL,
  `track` int NOT NULL,
  `cleared` tinyint(1) DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `views`
--

INSERT INTO `views` (`id`, `by`, `track`, `cleared`, `time`) VALUES
(1, 2, 1, 0, '2023-08-18 07:38:20'),
(2, 1, 1, 0, '2023-08-18 08:01:44'),
(3, 1, 1, 0, '2023-08-18 08:03:41'),
(4, 1, 1, 0, '2023-08-25 02:22:10'),
(5, 1, 2, 0, '2023-08-25 02:24:41'),
(6, 3, 2, 0, '2023-08-25 02:26:44'),
(7, 3, 1, 0, '2023-08-25 02:27:12'),
(8, 3, 2, 0, '2023-08-25 02:33:18'),
(9, 3, 1, 0, '2023-08-25 02:33:45'),
(10, 1, 2, 0, '2023-08-25 07:11:47'),
(11, 1, 3, 0, '2023-08-25 07:11:53'),
(12, 4, 6, 0, '2024-06-22 10:54:53'),
(13, 4, 9, 0, '2024-06-22 11:07:17'),
(14, 7, 13, 0, '2024-06-22 13:13:38');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blocked`
--
ALTER TABLE `blocked`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`,`by`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`,`to`,`read`),
  ADD KEY `to` (`to`,`read`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `time` (`time`);

--
-- Chỉ mục cho bảng `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track` (`track`),
  ADD KEY `by` (`by`);

--
-- Chỉ mục cho bảng `info_pages`
--
ALTER TABLE `info_pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `by` (`by`);

--
-- Chỉ mục cho bảng `newsletters`
--
ALTER TABLE `newsletters`
  ADD UNIQUE KEY `id` (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `to` (`to`,`type`,`read`),
  ADD KEY `from` (`from`,`type`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `by` (`by`);

--
-- Chỉ mục cho bảng `playlistentries`
--
ALTER TABLE `playlistentries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `playlist` (`playlist`);

--
-- Chỉ mục cho bảng `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `by` (`by`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `subscriber` (`subscriber`),
  ADD KEY `leader` (`leader`),
  ADD KEY `leader_2` (`leader`,`subscriber`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `state` (`state`),
  ADD KEY `time` (`time`);

--
-- Chỉ mục cho bảng `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `title` (`title`),
  ADD KEY `tag` (`tag`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`idu`),
  ADD KEY `username` (`username`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `suspended` (`suspended`),
  ADD KEY `email_newsletter` (`email_newsletter`);

--
-- Chỉ mục cho bảng `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `by` (`by`),
  ADD KEY `time` (`time`),
  ADD KEY `cleared` (`cleared`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `blocked`
--
ALTER TABLE `blocked`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `info_pages`
--
ALTER TABLE `info_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `playlistentries`
--
ALTER TABLE `playlistentries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `idu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `views`
--
ALTER TABLE `views`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
