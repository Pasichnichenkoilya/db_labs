-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` (`id`, `name`) VALUES
(5,	'economics'),
(3,	'fashion'),
(1,	'politics'),
(2,	'science'),
(4,	'sql');

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news` (`id`, `title`, `description`, `publication_date`, `category_id`) VALUES
(1,	'news1',	'news1_description',	'2023-05-05',	1),
(2,	'news2',	'news2_description',	'2023-05-06',	2),
(3,	'news3',	'news3_description',	'2023-05-07',	3),
(4,	'news4',	'news4_description',	'2023-05-08',	4),
(5,	'news5',	'news5_description',	'2023-05-09',	5),
(6,	'news6',	'news6_description',	'2023-05-10',	1);

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` int(1) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_rating_per_news` (`user_id`,`news_id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `ratings_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_6` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  CONSTRAINT `check_mark_range` CHECK (`mark` >= 1 and `mark` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ratings` (`id`, `mark`, `comment`, `user_id`, `news_id`) VALUES
(1,	1,	'comment1',	1,	1),
(2,	2,	'comment2',	2,	2),
(3,	3,	'comment3',	3,	3),
(4,	4,	'comment4',	1,	4),
(5,	5,	'comment5',	2,	5),
(6,	3,	'comment6',	3,	6);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1,	'user1',	'user1@gmail.com'),
(2,	'user2',	'user2@gmail.com'),
(3,	'user3',	'user3@gmail.com');

-- 2023-05-05 06:34:44
