-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2025 at 08:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ott`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMovie` (IN `id` INT)   DELETE FROM movie WHERE movie_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSeries` (IN `s_id` INT)   DELETE From series_data where id = s_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSeries1` (IN `s_id` INT)   DELETE FROM series WHERE id = s_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `movieInsert` ()   INSERT INTO movie (movie_title, movie_language, category, video_path, duration, `lik`) VALUES
('3 Idiots', 'Hindi', 'Comedy', 'C:/videos/3idiots.mp4', '2h 45m', 2500),
('Dangal', 'Hindi', 'Biography', 'C:/videos/dangal.mp4', '2h 49m', 2300),
('PK', 'Hindi', 'Comedy', 'C:/videos/pk.mp4', '2h 33m', 2200),
('Lagaan', 'Hindi', 'Drama', 'C:/videos/lagaan.mp4', '3h 44m', 2100),
('Baahubali: The Beginning', 'Telugu', 'Action', 'C:/videos/baahubali1.mp4', '2h 39m', 2700),
('Baahubali: The Conclusion', 'Telugu', 'Action', 'C:/videos/baahubali2.mp4', '2h 47m', 2900),
('Chak De! India', 'Hindi', 'Sports', 'C:/videos/chakdeindia.mp4', '2h 33m', 1800),
('Swades', 'Hindi', 'Drama', 'C:/videos/swades.mp4', '3h 5m', 1600),
('Rang De Basanti', 'Hindi', 'Drama', 'C:/videos/rdb.mp4', '2h 37m', 2000),
('Zindagi Na Milegi Dobara', 'Hindi', 'Drama', 'C:/videos/znmd.mp4', '2h 33m', 2100),
('Kahaani', 'Hindi', 'Thriller', 'C:/videos/kahaani.mp4', '2h 2m', 1700),
('Drishyam', 'Hindi', 'Thriller', 'C:/videos/drishyam.mp4', '2h 43m', 1900),
('Barfi!', 'Hindi', 'Romance', 'C:/videos/barfi.mp4', '2h 31m', 1500),
('Andhadhun', 'Hindi', 'Thriller', 'C:/videos/andhadhun.mp4', '2h 19m', 2200),
('Queen', 'Hindi', 'Drama', 'C:/videos/queen.mp4', '2h 26m', 1800),
('Gully Boy', 'Hindi', 'Drama', 'C:/videos/gullyboy.mp4', '2h 33m', 2100),
('Tumbbad', 'Hindi', 'Horror', 'C:/videos/tumbbad.mp4', '1h 44m', 1300),
('Article 15', 'Hindi', 'Crime', 'C:/videos/article15.mp4', '2h 10m', 1600),
('Sardar Udham', 'Hindi', 'Biography', 'C:/videos/sardarudham.mp4', '2h 42m', 2000),
('Pad Man', 'Hindi', 'Biography', 'C:/videos/padman.mp4', '2h 20m', 1500),
('Raazi', 'Hindi', 'Spy', 'C:/videos/raazi.mp4', '2h 20m', 1800),
('Shershaah', 'Hindi', 'War', 'C:/videos/shershaah.mp4', '2h 15m', 1700),
('Mimi', 'Hindi', 'Drama', 'C:/videos/mimi.mp4', '2h 12m', 1600),
('Super 30', 'Hindi', 'Biography', 'C:/videos/super30.mp4', '2h 34m', 1900),
('The Lunchbox', 'Hindi', 'Romance', 'C:/videos/lunchbox.mp4', '1h 44m', 1400)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series1Insert` ()   INSERT INTO series (
  id, title, season, episodeNO, episode_name, video_path, duration, lik
) VALUES
-- Season 1
(1, 'Stranger Things', 1, 1, 'Chapter One: The Vanishing of Will Byers', 'C:\\videos\\st_s1_e1.mp4', '00:50:00', 1000),
(1, 'Stranger Things', 1, 2, 'Chapter Two: The Weirdo on Maple Street', 'C:\\videos\\st_s1_e2.mp4', '00:50:00', 1010),
(1, 'Stranger Things', 1, 3, 'Chapter Three: Holly, Jolly', 'C:\\videos\\st_s1_e3.mp4', '00:50:00', 1020),
(1, 'Stranger Things', 1, 4, 'Chapter Four: The Body', 'C:\\videos\\st_s1_e4.mp4', '00:50:00', 1030),
(1, 'Stranger Things', 1, 5, 'Chapter Five: The Flea and the Acrobat', 'C:\\videos\\st_s1_e5.mp4', '00:50:00', 1040),
(1, 'Stranger Things', 1, 6, 'Chapter Six: The Monster', 'C:\\videos\\st_s1_e6.mp4', '00:50:00', 1050),
(1, 'Stranger Things', 1, 7, 'Chapter Seven: The Bathtub', 'C:\\videos\\st_s1_e7.mp4', '00:50:00', 1060),
(1, 'Stranger Things', 1, 8, 'Chapter Eight: The Upside Down', 'C:\\videos\\st_s1_e8.mp4', '00:50:00', 1070),

-- Season 2
(1, 'Stranger Things', 2, 1, 'Chapter One: MADMAX', 'C:\\videos\\st_s2_e1.mp4', '00:50:00', 1100),
(1, 'Stranger Things', 2, 2, 'Chapter Two: Trick or Treat, Freak', 'C:\\videos\\st_s2_e2.mp4', '00:50:00', 1110),
(1, 'Stranger Things', 2, 3, 'Chapter Three: The Pollywog', 'C:\\videos\\st_s2_e3.mp4', '00:50:00', 1120),
(1, 'Stranger Things', 2, 4, 'Chapter Four: Will the Wise', 'C:\\videos\\st_s2_e4.mp4', '00:50:00', 1130),
(1, 'Stranger Things', 2, 5, 'Chapter Five: Dig Dug', 'C:\\videos\\st_s2_e5.mp4', '00:50:00', 1140),
(1, 'Stranger Things', 2, 6, 'Chapter Six: The Spy', 'C:\\videos\\st_s2_e6.mp4', '00:50:00', 1150),
(1, 'Stranger Things', 2, 7, 'Chapter Seven: The Lost Sister', 'C:\\videos\\st_s2_e7.mp4', '00:50:00', 1160),
(1, 'Stranger Things', 2, 8, 'Chapter Eight: The Mind Flayer', 'C:\\videos\\st_s2_e8.mp4', '00:50:00', 1170),
(1, 'Stranger Things', 2, 9, 'Chapter Nine: The Gate', 'C:\\videos\\st_s2_e9.mp4', '00:50:00', 1180),

-- Season 3
(1, 'Stranger Things', 3, 1, 'Chapter One: Suzie, Do You Copy?', 'C:\\videos\\st_s3_e1.mp4', '00:50:00', 1200),
(1, 'Stranger Things', 3, 2, 'Chapter Two: The Mall Rats', 'C:\\videos\\st_s3_e2.mp4', '00:50:00', 1210),
(1, 'Stranger Things', 3, 3, 'Chapter Three: The Case of the Missing Lifeguard', 'C:\\videos\\st_s3_e3.mp4', '00:50:00', 1220),
(1, 'Stranger Things', 3, 4, 'Chapter Four: The Sauna Test', 'C:\\videos\\st_s3_e4.mp4', '00:50:00', 1230),
(1, 'Stranger Things', 3, 5, 'Chapter Five: The Flayed', 'C:\\videos\\st_s3_e5.mp4', '00:50:00', 1240),
(1, 'Stranger Things', 3, 6, 'Chapter Six: E Pluribus Unum', 'C:\\videos\\st_s3_e6.mp4', '00:50:00', 1250),
(1, 'Stranger Things', 3, 7, 'Chapter Seven: The Bite', 'C:\\videos\\st_s3_e7.mp4', '00:50:00', 1260),
(1, 'Stranger Things', 3, 8, 'Chapter Eight: The Battle of Starcourt', 'C:\\videos\\st_s3_e8.mp4', '00:50:00', 1270),

-- Season 4
(1, 'Stranger Things', 4, 1, 'Chapter One: The Hellfire Club', 'C:\\videos\\st_s4_e1.mp4', '01:05:00', 1300),
(1, 'Stranger Things', 4, 2, 'Chapter Two: Vecna''s Curse', 'C:\\videos\\st_s4_e2.mp4', '00:55:00', 1310),
(1, 'Stranger Things', 4, 3, 'Chapter Three: The Monster and the Superhero', 'C:\\videos\\st_s4_e3.mp4', '01:00:00', 1320),
(1, 'Stranger Things', 4, 4, 'Chapter Four: Dear Billy', 'C:\\videos\\st_s4_e4.mp4', '01:00:00', 1330),
(1, 'Stranger Things', 4, 5, 'Chapter Five: The Nina Project', 'C:\\videos\\st_s4_e5.mp4', '00:55:00', 1340),
(1, 'Stranger Things', 4, 6, 'Chapter Six: The Dive', 'C:\\videos\\st_s4_e6.mp4', '01:05:00', 1350),
(1, 'Stranger Things', 4, 7, 'Chapter Seven: The Massacre at Hawkins Lab', 'C:\\videos\\st_s4_e7.mp4', '01:20:00', 1360),
(1, 'Stranger Things', 4, 8, 'Chapter Eight: Papa', 'C:\\videos\\st_s4_e8.mp4', '01:20:00', 1370),
(1, 'Stranger Things', 4, 9, 'Chapter Nine: The Piggyback', 'C:\\videos\\st_s4_e9.mp4', '01:25:00', 1380)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series2Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
-- Season 1 (7 episodes)
(2, 'Breaking Bad', 1, 1, 'Pilot', 'C:\\videos\\bb_s1_e1.mp4', '00:58:00', 1200),
(2, 'Breaking Bad', 1, 2, 'Cat\'s in the Bag...', 'C:\\videos\\bb_s1_e2.mp4', '00:48:00', 1100),
(2, 'Breaking Bad', 1, 3, '...And the Bag\'s in the River', 'C:\\videos\\bb_s1_e3.mp4', '00:48:00', 1150),
(2, 'Breaking Bad', 1, 4, 'Cancer Man', 'C:\\videos\\bb_s1_e4.mp4', '00:48:00', 1100),
(2, 'Breaking Bad', 1, 5, 'Gray Matter', 'C:\\videos\\bb_s1_e5.mp4', '00:48:00', 1120),
(2, 'Breaking Bad', 1, 6, 'Crazy Handful of Nothin\'', 'C:\\videos\\bb_s1_e6.mp4', '00:48:00', 1180),
(2, 'Breaking Bad', 1, 7, 'A No-Rough-Stuff-Type Deal', 'C:\\videos\\bb_s1_e7.mp4', '00:48:00', 1190),

-- Season 2 (13 episodes)
(2, 'Breaking Bad', 2, 1, 'Seven Thirty-Seven', 'C:\\videos\\bb_s2_e1.mp4', '00:48:00', 1250),
(2, 'Breaking Bad', 2, 2, 'Grilled', 'C:\\videos\\bb_s2_e2.mp4', '00:48:00', 1270),
(2, 'Breaking Bad', 2, 3, 'Bit by a Dead Bee', 'C:\\videos\\bb_s2_e3.mp4', '00:48:00', 1240),
(2, 'Breaking Bad', 2, 4, 'Down', 'C:\\videos\\bb_s2_e4.mp4', '00:48:00', 1230),
(2, 'Breaking Bad', 2, 5, 'Breakage', 'C:\\videos\\bb_s2_e5.mp4', '00:48:00', 1220),
(2, 'Breaking Bad', 2, 6, 'Peekaboo', 'C:\\videos\\bb_s2_e6.mp4', '00:48:00', 1200),
(2, 'Breaking Bad', 2, 7, 'Negro y Azul', 'C:\\videos\\bb_s2_e7.mp4', '00:48:00', 1210),
(2, 'Breaking Bad', 2, 8, 'Better Call Saul', 'C:\\videos\\bb_s2_e8.mp4', '00:48:00', 1230),
(2, 'Breaking Bad', 2, 9, '4 Days Out', 'C:\\videos\\bb_s2_e9.mp4', '00:48:00', 1260),
(2, 'Breaking Bad', 2, 10, 'Over', 'C:\\videos\\bb_s2_e10.mp4', '00:48:00', 1250),
(2, 'Breaking Bad', 2, 11, 'Mandala', 'C:\\videos\\bb_s2_e11.mp4', '00:48:00', 1240),
(2, 'Breaking Bad', 2, 12, 'Phoenix', 'C:\\videos\\bb_s2_e12.mp4', '00:48:00', 1260),
(2, 'Breaking Bad', 2, 13, 'ABQ', 'C:\\videos\\bb_s2_e13.mp4', '00:48:00', 1270),

-- Season 3 (13 episodes)
(2, 'Breaking Bad', 3, 1, 'No Más', 'C:\\videos\\bb_s3_e1.mp4', '00:48:00', 1300),
(2, 'Breaking Bad', 3, 2, 'Caballo Sin Nombre', 'C:\\videos\\bb_s3_e2.mp4', '00:48:00', 1290),
(2, 'Breaking Bad', 3, 3, 'I.F.T.', 'C:\\videos\\bb_s3_e3.mp4', '00:48:00', 1310),
(2, 'Breaking Bad', 3, 4, 'Green Light', 'C:\\videos\\bb_s3_e4.mp4', '00:48:00', 1320),
(2, 'Breaking Bad', 3, 5, 'Mas', 'C:\\videos\\bb_s3_e5.mp4', '00:48:00', 1330),
(2, 'Breaking Bad', 3, 6, 'Sunset', 'C:\\videos\\bb_s3_e6.mp4', '00:48:00', 1340),
(2, 'Breaking Bad', 3, 7, 'One Minute', 'C:\\videos\\bb_s3_e7.mp4', '00:48:00', 1350),
(2, 'Breaking Bad', 3, 8, 'I See You', 'C:\\videos\\bb_s3_e8.mp4', '00:48:00', 1360),
(2, 'Breaking Bad', 3, 9, 'Kafkaesque', 'C:\\videos\\bb_s3_e9.mp4', '00:48:00', 1370),
(2, 'Breaking Bad', 3, 10, 'Fly', 'C:\\videos\\bb_s3_e10.mp4', '00:48:00', 1380),
(2, 'Breaking Bad', 3, 11, 'Abiquiu', 'C:\\videos\\bb_s3_e11.mp4', '00:48:00', 1390),
(2, 'Breaking Bad', 3, 12, 'Half Measures', 'C:\\videos\\bb_s3_e12.mp4', '00:48:00', 1400),
(2, 'Breaking Bad', 3, 13, 'Full Measure', 'C:\\videos\\bb_s3_e13.mp4', '00:48:00', 1410),

-- Season 4 (13 episodes)
(2, 'Breaking Bad', 4, 1, 'Box Cutter', 'C:\\videos\\bb_s4_e1.mp4', '00:48:00', 1420),
(2, 'Breaking Bad', 4, 2, 'Thirty-Eight Snub', 'C:\\videos\\bb_s4_e2.mp4', '00:48:00', 1430),
(2, 'Breaking Bad', 4, 3, 'Open House', 'C:\\videos\\bb_s4_e3.mp4', '00:48:00', 1440),
(2, 'Breaking Bad', 4, 4, 'Bullet Points', 'C:\\videos\\bb_s4_e4.mp4', '00:48:00', 1450),
(2, 'Breaking Bad', 4, 5, 'Shotgun', 'C:\\videos\\bb_s4_e5.mp4', '00:48:00', 1460),
(2, 'Breaking Bad', 4, 6, 'Cornered', 'C:\\videos\\bb_s4_e6.mp4', '00:48:00', 1470),
(2, 'Breaking Bad', 4, 7, 'Problem Dog', 'C:\\videos\\bb_s4_e7.mp4', '00:48:00', 1480),
(2, 'Breaking Bad', 4, 8, 'Hermanos', 'C:\\videos\\bb_s4_e8.mp4', '00:48:00', 1490),
(2, 'Breaking Bad', 4, 9, 'Bug', 'C:\\videos\\bb_s4_e9.mp4', '00:48:00', 1500),
(2, 'Breaking Bad', 4, 10, 'Salud', 'C:\\videos\\bb_s4_e10.mp4', '00:48:00', 1510),
(2, 'Breaking Bad', 4, 11, 'Crawl Space', 'C:\\videos\\bb_s4_e11.mp4', '00:48:00', 1520),
(2, 'Breaking Bad', 4, 12, 'End Times', 'C:\\videos\\bb_s4_e12.mp4', '00:48:00', 1530),
(2, 'Breaking Bad', 4, 13, 'Face Off', 'C:\\videos\\bb_s4_e13.mp4', '00:48:00', 1540),

-- Season 5 (16 episodes)
(2, 'Breaking Bad', 5, 1, 'Live Free or Die', 'C:\\videos\\bb_s5_e1.mp4', '00:48:00', 1550),
(2, 'Breaking Bad', 5, 2, 'Madrigal', 'C:\\videos\\bb_s5_e2.mp4', '00:48:00', 1560),
(2, 'Breaking Bad', 5, 3, 'Hazard Pay', 'C:\\videos\\bb_s5_e3.mp4', '00:48:00', 1570),
(2, 'Breaking Bad', 5, 4, 'Fifty-One', 'C:\\videos\\bb_s5_e4.mp4', '00:48:00', 1580),
(2, 'Breaking Bad', 5, 5, 'Dead Freight', 'C:\\videos\\bb_s5_e5.mp4', '00:48:00', 1590),
(2, 'Breaking Bad', 5, 6, 'Buyout', 'C:\\videos\\bb_s5_e6.mp4', '00:48:00', 1600),
(2, 'Breaking Bad', 5, 7, 'Say My Name', 'C:\\videos\\bb_s5_e7.mp4', '00:48:00', 1610),
(2, 'Breaking Bad', 5, 8, 'Gliding Over All', 'C:\\videos\\bb_s5_e8.mp4', '00:48:00', 1620),
(2, 'Breaking Bad', 5, 9, 'Blood Money', 'C:\\videos\\bb_s5_e9.mp4', '00:48:00', 1630),
(2, 'Breaking Bad', 5, 10, 'Buried', 'C:\\videos\\bb_s5_e10.mp4', '00:48:00', 1640),
(2, 'Breaking Bad', 5, 11, 'Confessions', 'C:\\videos\\bb_s5_e11.mp4', '00:48:00', 1650),
(2, 'Breaking Bad', 5, 12, 'Rabid Dog', 'C:\\videos\\bb_s5_e12.mp4', '00:48:00', 1660),
(2, 'Breaking Bad', 5, 13, 'To\'hajiilee', 'C:\\videos\\bb_s5_e13.mp4', '00:48:00', 1670),
(2, 'Breaking Bad', 5, 14, 'Ozymandias', 'C:\\videos\\bb_s5_e14.mp4', '00:48:00', 1680),
(2, 'Breaking Bad', 5, 15, 'Granite State', 'C:\\videos\\bb_s5_e15.mp4', '00:48:00', 1690),
(2, 'Breaking Bad', 5, 16, 'Felina', 'C:\\videos\\bb_s5_e16.mp4', '00:48:00', 1700)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series3Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
-- Part 1 (Season 1, 13 episodes)
(3, 'Money Heist', 1, 1, 'Efectuar lo acordado', 'C:\\videos\\mh_s1_e1.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 2, 'Imprudencias letales', 'C:\\videos\\mh_s1_e2.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 3, 'Errar al disparar', 'C:\\videos\\mh_s1_e3.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 4, 'Caballo de Troya', 'C:\\videos\\mh_s1_e4.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 5, 'La talla del tablero', 'C:\\videos\\mh_s1_e5.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 6, 'El día de la marmota', 'C:\\videos\\mh_s1_e6.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 7, 'La leyenda del Profesor', 'C:\\videos\\mh_s1_e7.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 8, 'La ofensiva', 'C:\\videos\\mh_s1_e8.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 9, 'Un día sin perder', 'C:\\videos\\mh_s1_e9.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 10, 'La teoría del juego', 'C:\\videos\\mh_s1_e10.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 11, 'El enemigo interno', 'C:\\videos\\mh_s1_e11.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 12, 'La línea roja', 'C:\\videos\\mh_s1_e12.mp4', '00:45:00', 1000),
(3, 'Money Heist', 1, 13, 'El gran golpe', 'C:\\videos\\mh_s1_e13.mp4', '00:45:00', 1000),

-- Part 2 (Season 2, 9 episodes)
(3, 'Money Heist', 2, 1, 'El Regreso', 'C:\\videos\\mh_s2_e1.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 2, 'Traición', 'C:\\videos\\mh_s2_e2.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 3, 'El golpe continúa', 'C:\\videos\\mh_s2_e3.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 4, 'Riesgos', 'C:\\videos\\mh_s2_e4.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 5, 'El enfrentamiento', 'C:\\videos\\mh_s2_e5.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 6, 'Venganza', 'C:\\videos\\mh_s2_e6.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 7, 'El final', 'C:\\videos\\mh_s2_e7.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 8, 'Última oportunidad', 'C:\\videos\\mh_s2_e8.mp4', '00:45:00', 1020),
(3, 'Money Heist', 2, 9, 'El escape', 'C:\\videos\\mh_s2_e9.mp4', '00:45:00', 1020),

-- Part 3 (Season 3, 8 episodes)
(3, 'Money Heist', 3, 1, 'We\'re Back', 'C:\\videos\\mh_s3_e1.mp4', '00:48:00', 1100),
(3, 'Money Heist', 3, 2, 'Aikido', 'C:\\videos\\mh_s3_e2.mp4', '00:48:00', 1110),
(3, 'Money Heist', 3, 3, '48 Meters Underground', 'C:\\videos\\mh_s3_e3.mp4', '00:48:00', 1120),
(3, 'Money Heist', 3, 4, 'It\'s Dolphin Time', 'C:\\videos\\mh_s3_e4.mp4', '00:48:00', 1130),
(3, 'Money Heist', 3, 5, 'Boom, Boom, Ciao', 'C:\\videos\\mh_s3_e5.mp4', '00:48:00', 1140),
(3, 'Money Heist', 3, 6, 'Everything Seemed Insignificant', 'C:\\videos\\mh_s3_e6.mp4', '00:48:00', 1150),
(3, 'Money Heist', 3, 7, 'A Quick Vacation', 'C:\\videos\\mh_s3_e7.mp4', '00:48:00', 1160),
(3, 'Money Heist', 3, 8, 'Astray', 'C:\\videos\\mh_s3_e8.mp4', '00:48:00', 1170),

-- Part 4 (Season 4, 8 episodes)
(3, 'Money Heist', 4, 1, 'Game Over', 'C:\\videos\\mh_s4_e1.mp4', '00:50:00', 1200),
(3, 'Money Heist', 4, 2, 'Berlin\'s Wedding', 'C:\\videos\\mh_s4_e2.mp4', '00:50:00', 1210),
(3, 'Money Heist', 4, 3, 'Anatomy Lesson', 'C:\\videos\\mh_s4_e3.mp4', '00:50:00', 1220),
(3, 'Money Heist', 4, 4, 'Pasodoble', 'C:\\videos\\mh_s4_e4.mp4', '00:50:00', 1230),
(3, 'Money Heist', 4, 5, '5 Minutes Earlier', 'C:\\videos\\mh_s4_e5.mp4', '00:50:00', 1240),
(3, 'Money Heist', 4, 6, 'TKO', 'C:\\videos\\mh_s4_e6.mp4', '00:50:00', 1250),
(3, 'Money Heist', 4, 7, 'Strike the Tent', 'C:\\videos\\mh_s4_e7.mp4', '00:50:00', 1260),
(3, 'Money Heist', 4, 8, 'The Paris Plan', 'C:\\videos\\mh_s4_e8.mp4', '01:00:00', 1270),

-- Part 5 (Season 5, 10 episodes)
(3, 'Money Heist', 5, 1, 'The End of the Road', 'C:\\videos\\mh_s5_e1.mp4', '00:55:00', 1300),
(3, 'Money Heist', 5, 2, 'Do You Believe in Reincarnation?', 'C:\\videos\\mh_s5_e2.mp4', '00:55:00', 1310),
(3, 'Money Heist', 5, 3, 'Welcome to the Spectacle of Life', 'C:\\videos\\mh_s5_e3.mp4', '00:55:00', 1320),
(3, 'Money Heist', 5, 4, 'Your Place in Heaven', 'C:\\videos\\mh_s5_e4.mp4', '00:55:00', 1330),
(3, 'Money Heist', 5, 5, 'Live Many Lives', 'C:\\videos\\mh_s5_e5.mp4', '00:55:00', 1340),
(3, 'Money Heist', 5, 6, 'Escape Valve', 'C:\\videos\\mh_s5_e6.mp4', '00:55:00', 1350),
(3, 'Money Heist', 5, 7, 'Wishful Thinking', 'C:\\videos\\mh_s5_e7.mp4', '00:55:00', 1360),
(3, 'Money Heist', 5, 8, 'The Elegance Theory', 'C:\\videos\\mh_s5_e8.mp4', '00:55:00', 1370),
(3, 'Money Heist', 5, 9, 'Pillow Talk', 'C:\\videos\\mh_s5_e9.mp4', '00:55:00', 1380),
(3, 'Money Heist', 5, 10, 'A Family Tradition', 'C:\\videos\\mh_s5_e10.mp4', '00:55:00', 1390)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series4Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
-- Season 1 (10 episodes)
(4, 'Game of Thrones', 1, 1, 'Winter Is Coming', 'C:\\videos\\got_s1_e1.mp4', '00:62:00', 1500),
(4, 'Game of Thrones', 1, 2, 'The Kingsroad', 'C:\\videos\\got_s1_e2.mp4', '00:56:00', 1400),
(4, 'Game of Thrones', 1, 3, 'Lord Snow', 'C:\\videos\\got_s1_e3.mp4', '00:58:00', 1450),
(4, 'Game of Thrones', 1, 4, 'Cripples, Bastards, and Broken Things', 'C:\\videos\\got_s1_e4.mp4', '00:56:00', 1380),
(4, 'Game of Thrones', 1, 5, 'The Wolf and the Lion', 'C:\\videos\\got_s1_e5.mp4', '00:55:00', 1420),
(4, 'Game of Thrones', 1, 6, 'A Golden Crown', 'C:\\videos\\got_s1_e6.mp4', '00:54:00', 1410),
(4, 'Game of Thrones', 1, 7, 'You Win or You Die', 'C:\\videos\\got_s1_e7.mp4', '00:58:00', 1460),
(4, 'Game of Thrones', 1, 8, 'The Pointy End', 'C:\\videos\\got_s1_e8.mp4', '00:59:00', 1470),
(4, 'Game of Thrones', 1, 9, 'Baelor', 'C:\\videos\\got_s1_e9.mp4', '00:56:00', 1480),
(4, 'Game of Thrones', 1, 10, 'Fire and Blood', 'C:\\videos\\got_s1_e10.mp4', '00:59:00', 1500),

-- Season 2 (10 episodes)
(4, 'Game of Thrones', 2, 1, 'The North Remembers', 'C:\\videos\\got_s2_e1.mp4', '00:55:00', 1520),
(4, 'Game of Thrones', 2, 2, 'The Night Lands', 'C:\\videos\\got_s2_e2.mp4', '00:54:00', 1510),
(4, 'Game of Thrones', 2, 3, 'What Is Dead May Never Die', 'C:\\videos\\got_s2_e3.mp4', '00:56:00', 1530),
(4, 'Game of Thrones', 2, 4, 'Garden of Bones', 'C:\\videos\\got_s2_e4.mp4', '00:58:00', 1540),
(4, 'Game of Thrones', 2, 5, 'The Ghost of Harrenhal', 'C:\\videos\\got_s2_e5.mp4', '00:57:00', 1550),
(4, 'Game of Thrones', 2, 6, 'The Old Gods and the New', 'C:\\videos\\got_s2_e6.mp4', '00:56:00', 1560),
(4, 'Game of Thrones', 2, 7, 'A Man Without Honor', 'C:\\videos\\got_s2_e7.mp4', '00:57:00', 1570),
(4, 'Game of Thrones', 2, 8, 'The Prince of Winterfell', 'C:\\videos\\got_s2_e8.mp4', '00:55:00', 1580),
(4, 'Game of Thrones', 2, 9, 'Blackwater', 'C:\\videos\\got_s2_e9.mp4', '00:56:00', 1590),
(4, 'Game of Thrones', 2, 10, 'Valar Morghulis', 'C:\\videos\\got_s2_e10.mp4', '00:58:00', 1600),

-- Season 3 (10 episodes)
(4, 'Game of Thrones', 3, 1, 'Valar Dohaeris', 'C:\\videos\\got_s3_e1.mp4', '00:58:00', 1610),
(4, 'Game of Thrones', 3, 2, 'Dark Wings, Dark Words', 'C:\\videos\\got_s3_e2.mp4', '00:56:00', 1620),
(4, 'Game of Thrones', 3, 3, 'Walk of Punishment', 'C:\\videos\\got_s3_e3.mp4', '00:55:00', 1630),
(4, 'Game of Thrones', 3, 4, 'And Now His Watch Is Ended', 'C:\\videos\\got_s3_e4.mp4', '00:56:00', 1640),
(4, 'Game of Thrones', 3, 5, 'Kissed by Fire', 'C:\\videos\\got_s3_e5.mp4', '00:57:00', 1650),
(4, 'Game of Thrones', 3, 6, 'The Climb', 'C:\\videos\\got_s3_e6.mp4', '00:58:00', 1660),
(4, 'Game of Thrones', 3, 7, 'The Bear and the Maiden Fair', 'C:\\videos\\got_s3_e7.mp4', '00:57:00', 1670),
(4, 'Game of Thrones', 3, 8, 'Second Sons', 'C:\\videos\\got_s3_e8.mp4', '00:55:00', 1680),
(4, 'Game of Thrones', 3, 9, 'The Rains of Castamere', 'C:\\videos\\got_s3_e9.mp4', '00:55:00', 1690),
(4, 'Game of Thrones', 3, 10, 'Mhysa', 'C:\\videos\\got_s3_e10.mp4', '00:59:00', 1700),

-- Season 4 (10 episodes)
(4, 'Game of Thrones', 4, 1, 'Two Swords', 'C:\\videos\\got_s4_e1.mp4', '00:58:00', 1710),
(4, 'Game of Thrones', 4, 2, 'The Lion and the Rose', 'C:\\videos\\got_s4_e2.mp4', '00:55:00', 1720),
(4, 'Game of Thrones', 4, 3, 'Breaker of Chains', 'C:\\videos\\got_s4_e3.mp4', '00:57:00', 1730),
(4, 'Game of Thrones', 4, 4, 'Oathkeeper', 'C:\\videos\\got_s4_e4.mp4', '00:56:00', 1740),
(4, 'Game of Thrones', 4, 5, 'First of His Name', 'C:\\videos\\got_s4_e5.mp4', '00:58:00', 1750),
(4, 'Game of Thrones', 4, 6, 'The Laws of Gods and Men', 'C:\\videos\\got_s4_e6.mp4', '00:57:00', 1760),
(4, 'Game of Thrones', 4, 7, 'Mockingbird', 'C:\\videos\\got_s4_e7.mp4', '00:56:00', 1770),
(4, 'Game of Thrones', 4, 8, 'The Mountain and the Viper', 'C:\\videos\\got_s4_e8.mp4', '00:55:00', 1780),
(4, 'Game of Thrones', 4, 9, 'The Watchers on the Wall', 'C:\\videos\\got_s4_e9.mp4', '00:58:00', 1790),
(4, 'Game of Thrones', 4, 10, 'The Children', 'C:\\videos\\got_s4_e10.mp4', '00:57:00', 1800),

-- Season 5 (10 episodes)
(4, 'Game of Thrones', 5, 1, 'The Wars to Come', 'C:\\videos\\got_s5_e1.mp4', '00:55:00', 1810),
(4, 'Game of Thrones', 5, 2, 'The House of Black and White', 'C:\\videos\\got_s5_e2.mp4', '00:58:00', 1820),
(4, 'Game of Thrones', 5, 3, 'High Sparrow', 'C:\\videos\\got_s5_e3.mp4', '00:57:00', 1830),
(4, 'Game of Thrones', 5, 4, 'Sons of the Harpy', 'C:\\videos\\got_s5_e4.mp4', '00:56:00', 1840),
(4, 'Game of Thrones', 5, 5, 'Kill the Boy', 'C:\\videos\\got_s5_e5.mp4', '00:58:00', 1850),
(4, 'Game of Thrones', 5, 6, 'Unbowed, Unbent, Unbroken', 'C:\\videos\\got_s5_e6.mp4', '00:59:00', 1860),
(4, 'Game of Thrones', 5, 7, 'The Gift', 'C:\\videos\\got_s5_e7.mp4', '00:57:00', 1870),
(4, 'Game of Thrones', 5, 8, 'Hardhome', 'C:\\videos\\got_s5_e8.mp4', '00:60:00', 1880),
(4, 'Game of Thrones', 5, 9, 'The Dance of Dragons', 'C:\\videos\\got_s5_e9.mp4', '00:56:00', 1890),
(4, 'Game of Thrones', 5, 10, 'Mother\'s Mercy', 'C:\\videos\\got_s5_e10.mp4', '00:57:00', 1900),

-- Season 6 (10 episodes)
(4, 'Game of Thrones', 6, 1, 'The Red Woman', 'C:\\videos\\got_s6_e1.mp4', '00:58:00', 1910),
(4, 'Game of Thrones', 6, 2, 'Home', 'C:\\videos\\got_s6_e2.mp4', '00:55:00', 1920),
(4, 'Game of Thrones', 6, 3, 'Oathbreaker', 'C:\\videos\\got_s6_e3.mp4', '00:57:00', 1930),
(4, 'Game of Thrones', 6, 4, 'Book of the Stranger', 'C:\\videos\\got_s6_e4.mp4', '00:56:00', 1940),
(4, 'Game of Thrones', 6, 5, 'The Door', 'C:\\videos\\got_s6_e5.mp4', '00:58:00', 1950),
(4, 'Game of Thrones', 6, 6, 'Blood of My Blood', 'C:\\videos\\got_s6_e6.mp4', '00:57:00', 1960),
(4, 'Game of Thrones', 6, 7, 'The Broken Man', 'C:\\videos\\got_s6_e7.mp4', '00:55:00', 1970),
(4, 'Game of Thrones', 6, 8, 'No One', 'C:\\videos\\got_s6_e8.mp4', '00:56:00', 1980),
(4, 'Game of Thrones', 6, 9, 'Battle of the Bastards', 'C:\\videos\\got_s6_e9.mp4', '00:60:00', 1990),
(4, 'Game of Thrones', 6, 10, 'The Winds of Winter', 'C:\\videos\\got_s6_e10.mp4', '00:58:00', 2000),

-- Season 7 (7 episodes)
(4, 'Game of Thrones', 7, 1, 'Dragonstone', 'C:\\videos\\got_s7_e1.mp4', '00:59:00', 2010),
(4, 'Game of Thrones', 7, 2, 'Stormborn', 'C:\\videos\\got_s7_e2.mp4', '00:56:00', 2020),
(4, 'Game of Thrones', 7, 3, 'The Queen\'s Justice', 'C:\\videos\\got_s7_e3.mp4', '00:55:00', 2030),
(4, 'Game of Thrones', 7, 4, 'The Spoils of War', 'C:\\videos\\got_s7_e4.mp4', '00:58:00', 2040),
(4, 'Game of Thrones', 7, 5, 'Eastwatch', 'C:\\videos\\got_s7_e5.mp4', '00:56:00', 2050),
(4, 'Game of Thrones', 7, 6, 'Beyond the Wall', 'C:\\videos\\got_s7_e6.mp4', '00:57:00', 2060),
(4, 'Game of Thrones', 7, 7, 'The Dragon and the Wolf', 'C:\\videos\\got_s7_e7.mp4', '00:59:00', 2070),

-- Season 8 (6 episodes)
(4, 'Game of Thrones', 8, 1, 'Winterfell', 'C:\\videos\\got_s8_e1.mp4', '01:02:00', 2080),
(4, 'Game of Thrones', 8, 2, 'A Knight of the Seven Kingdoms', 'C:\\videos\\got_s8_e2.mp4', '00:58:00', 2090),
(4, 'Game of Thrones', 8, 3, 'The Long Night', 'C:\\videos\\got_s8_e3.mp4', '01:02:00', 2100),
(4, 'Game of Thrones', 8, 4, 'The Last of the Starks', 'C:\\videos\\got_s8_e4.mp4', '00:58:00', 2110),
(4, 'Game of Thrones', 8, 5, 'The Bells', 'C:\\videos\\got_s8_e5.mp4', '01:02:00', 2120),
(4, 'Game of Thrones', 8, 6, 'The Iron Throne', 'C:\\videos\\got_s8_e6.mp4', '01:05:00', 2130)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series5Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
(5, 'Friends', 1, 1, 'The One Where Monica Gets a Roommate', 'C:\\videos\\friends_s1_e1.mp4', '00:22:00', 1300),
(5, 'Friends', 1, 2, 'The One with the Sonogram at the End', 'C:\\videos\\friends_s1_e2.mp4', '00:22:00', 1250),
(5, 'Friends', 1, 3, 'The One with the Thumb', 'C:\\videos\\friends_s1_e3.mp4', '00:22:00', 1240),
(5, 'Friends', 1, 4, 'The One with George Stephanopoulos', 'C:\\videos\\friends_s1_e4.mp4', '00:22:00', 1260),
(5, 'Friends', 1, 5, 'The One with the East German Laundry Detergent', 'C:\\videos\\friends_s1_e5.mp4', '00:22:00', 1270),
(5, 'Friends', 1, 6, 'The One with the Butt', 'C:\\videos\\friends_s1_e6.mp4', '00:22:00', 1280),
(5, 'Friends', 1, 7, 'The One with the Blackout', 'C:\\videos\\friends_s1_e7.mp4', '00:22:00', 1290),
(5, 'Friends', 1, 8, 'The One Where Nana Dies Twice', 'C:\\videos\\friends_s1_e8.mp4', '00:22:00', 1275),
(5, 'Friends', 1, 9, 'The One Where Underdog Gets Away', 'C:\\videos\\friends_s1_e9.mp4', '00:22:00', 1265),
(5, 'Friends', 1, 10, 'The One with the Monkey', 'C:\\videos\\friends_s1_e10.mp4', '00:22:00', 1285),
(5, 'Friends', 1, 11, 'The One with Mrs. Bing', 'C:\\videos\\friends_s1_e11.mp4', '00:22:00', 1270),
(5, 'Friends', 1, 12, 'The One with the Dozen Lasagnas', 'C:\\videos\\friends_s1_e12.mp4', '00:22:00', 1255),
(5, 'Friends', 1, 13, 'The One with the Boobies', 'C:\\videos\\friends_s1_e13.mp4', '00:22:00', 1245),
(5, 'Friends', 1, 14, 'The One with the Candy Hearts', 'C:\\videos\\friends_s1_e14.mp4', '00:22:00', 1265),
(5, 'Friends', 1, 15, 'The One with the Stoned Guy', 'C:\\videos\\friends_s1_e15.mp4', '00:22:00', 1280),
(5, 'Friends', 1, 16, 'The One with Two Parts: Part 1', 'C:\\videos\\friends_s1_e16.mp4', '00:22:00', 1270),
(5, 'Friends', 1, 17, 'The One with Two Parts: Part 2', 'C:\\videos\\friends_s1_e17.mp4', '00:22:00', 1290),
(5, 'Friends', 1, 18, 'The One with All the Poker', 'C:\\videos\\friends_s1_e18.mp4', '00:22:00', 1300),
(5, 'Friends', 1, 19, 'The One Where the Monkey Gets Away', 'C:\\videos\\friends_s1_e19.mp4', '00:22:00', 1285),
(5, 'Friends', 1, 20, 'The One with the Evil Orthodontist', 'C:\\videos\\friends_s1_e20.mp4', '00:22:00', 1275),
(5, 'Friends', 1, 21, 'The One with the Fake Monica', 'C:\\videos\\friends_s1_e21.mp4', '00:22:00', 1295),
(5, 'Friends', 1, 22, 'The One with the Ick Factor', 'C:\\videos\\friends_s1_e22.mp4', '00:22:00', 1280),
(5, 'Friends', 1, 23, 'The One with the Birth', 'C:\\videos\\friends_s1_e23.mp4', '00:22:00', 1305),
(5, 'Friends', 1, 24, 'The One Where Rachel Finds Out', 'C:\\videos\\friends_s1_e24.mp4', '00:22:00', 1310)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series6Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
-- Season 1
(6, 'Peaky Blinders', 1, 1, 'Episode 1', 'C:\\videos\\peaky_s1_e1.mp4', '00:56:00', 1400),
(6, 'Peaky Blinders', 1, 2, 'Episode 2', 'C:\\videos\\peaky_s1_e2.mp4', '00:56:00', 1380),
(6, 'Peaky Blinders', 1, 3, 'Episode 3', 'C:\\videos\\peaky_s1_e3.mp4', '00:56:00', 1425),
(6, 'Peaky Blinders', 1, 4, 'Episode 4', 'C:\\videos\\peaky_s1_e4.mp4', '00:56:00', 1400),
(6, 'Peaky Blinders', 1, 5, 'Episode 5', 'C:\\videos\\peaky_s1_e5.mp4', '00:56:00', 1395),
(6, 'Peaky Blinders', 1, 6, 'Episode 6', 'C:\\videos\\peaky_s1_e6.mp4', '00:56:00', 1410),

-- Season 2
(6, 'Peaky Blinders', 2, 1, 'Episode 1', 'C:\\videos\\peaky_s2_e1.mp4', '00:56:00', 1500),
(6, 'Peaky Blinders', 2, 2, 'Episode 2', 'C:\\videos\\peaky_s2_e2.mp4', '00:56:00', 1480),
(6, 'Peaky Blinders', 2, 3, 'Episode 3', 'C:\\videos\\peaky_s2_e3.mp4', '00:56:00', 1525),
(6, 'Peaky Blinders', 2, 4, 'Episode 4', 'C:\\videos\\peaky_s2_e4.mp4', '00:56:00', 1500),
(6, 'Peaky Blinders', 2, 5, 'Episode 5', 'C:\\videos\\peaky_s2_e5.mp4', '00:56:00', 1495),
(6, 'Peaky Blinders', 2, 6, 'Episode 6', 'C:\\videos\\peaky_s2_e6.mp4', '00:56:00', 1510),

-- Season 3
(6, 'Peaky Blinders', 3, 1, 'Episode 1', 'C:\\videos\\peaky_s3_e1.mp4', '00:56:00', 1600),
(6, 'Peaky Blinders', 3, 2, 'Episode 2', 'C:\\videos\\peaky_s3_e2.mp4', '00:56:00', 1580),
(6, 'Peaky Blinders', 3, 3, 'Episode 3', 'C:\\videos\\peaky_s3_e3.mp4', '00:56:00', 1625),
(6, 'Peaky Blinders', 3, 4, 'Episode 4', 'C:\\videos\\peaky_s3_e4.mp4', '00:56:00', 1600),
(6, 'Peaky Blinders', 3, 5, 'Episode 5', 'C:\\videos\\peaky_s3_e5.mp4', '00:56:00', 1595),
(6, 'Peaky Blinders', 3, 6, 'Episode 6', 'C:\\videos\\peaky_s3_e6.mp4', '00:56:00', 1610),

-- Season 4
(6, 'Peaky Blinders', 4, 1, 'Episode 1', 'C:\\videos\\peaky_s4_e1.mp4', '00:56:00', 1700),
(6, 'Peaky Blinders', 4, 2, 'Episode 2', 'C:\\videos\\peaky_s4_e2.mp4', '00:56:00', 1680),
(6, 'Peaky Blinders', 4, 3, 'Episode 3', 'C:\\videos\\peaky_s4_e3.mp4', '00:56:00', 1725),
(6, 'Peaky Blinders', 4, 4, 'Episode 4', 'C:\\videos\\peaky_s4_e4.mp4', '00:56:00', 1700),
(6, 'Peaky Blinders', 4, 5, 'Episode 5', 'C:\\videos\\peaky_s4_e5.mp4', '00:56:00', 1695),
(6, 'Peaky Blinders', 4, 6, 'Episode 6', 'C:\\videos\\peaky_s4_e6.mp4', '00:56:00', 1710),

-- Season 5
(6, 'Peaky Blinders', 5, 1, 'Episode 1', 'C:\\videos\\peaky_s5_e1.mp4', '00:56:00', 1800),
(6, 'Peaky Blinders', 5, 2, 'Episode 2', 'C:\\videos\\peaky_s5_e2.mp4', '00:56:00', 1780),
(6, 'Peaky Blinders', 5, 3, 'Episode 3', 'C:\\videos\\peaky_s5_e3.mp4', '00:56:00', 1825),
(6, 'Peaky Blinders', 5, 4, 'Episode 4', 'C:\\videos\\peaky_s5_e4.mp4', '00:56:00', 1800),
(6, 'Peaky Blinders', 5, 5, 'Episode 5', 'C:\\videos\\peaky_s5_e5.mp4', '00:56:00', 1795),
(6, 'Peaky Blinders', 5, 6, 'Episode 6', 'C:\\videos\\peaky_s5_e6.mp4', '00:56:00', 1810),

-- Season 6
(6, 'Peaky Blinders', 6, 1, 'Episode 1', 'C:\\videos\\peaky_s6_e1.mp4', '00:56:00', 1900),
(6, 'Peaky Blinders', 6, 2, 'Episode 2', 'C:\\videos\\peaky_s6_e2.mp4', '00:56:00', 1880),
(6, 'Peaky Blinders', 6, 3, 'Episode 3', 'C:\\videos\\peaky_s6_e3.mp4', '00:56:00', 1925),
(6, 'Peaky Blinders', 6, 4, 'Episode 4', 'C:\\videos\\peaky_s6_e4.mp4', '00:56:00', 1900),
(6, 'Peaky Blinders', 6, 5, 'Episode 5', 'C:\\videos\\peaky_s6_e5.mp4', '00:56:00', 1895),
(6, 'Peaky Blinders', 6, 6, 'Episode 6', 'C:\\videos\\peaky_s6_e6.mp4', '00:56:00', 1910)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series7Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
-- Season 1
(7, 'Dark', 1, 1, 'Episode 1', 'C:\\videos\\dark_s1_e1.mp4', '00:52:00', 1500),
(7, 'Dark', 1, 2, 'Episode 2', 'C:\\videos\\dark_s1_e2.mp4', '00:52:00', 1520),
(7, 'Dark', 1, 3, 'Episode 3', 'C:\\videos\\dark_s1_e3.mp4', '00:52:00', 1530),
(7, 'Dark', 1, 4, 'Episode 4', 'C:\\videos\\dark_s1_e4.mp4', '00:52:00', 1510),
(7, 'Dark', 1, 5, 'Episode 5', 'C:\\videos\\dark_s1_e5.mp4', '00:52:00', 1540),
(7, 'Dark', 1, 6, 'Episode 6', 'C:\\videos\\dark_s1_e6.mp4', '00:52:00', 1550),
(7, 'Dark', 1, 7, 'Episode 7', 'C:\\videos\\dark_s1_e7.mp4', '00:52:00', 1570),
(7, 'Dark', 1, 8, 'Episode 8', 'C:\\videos\\dark_s1_e8.mp4', '00:52:00', 1560),
(7, 'Dark', 1, 9, 'Episode 9', 'C:\\videos\\dark_s1_e9.mp4', '00:52:00', 1580),
(7, 'Dark', 1, 10, 'Episode 10', 'C:\\videos\\dark_s1_e10.mp4', '00:52:00', 1600),

-- Season 2
(7, 'Dark', 2, 1, 'Episode 1', 'C:\\videos\\dark_s2_e1.mp4', '00:52:00', 1650),
(7, 'Dark', 2, 2, 'Episode 2', 'C:\\videos\\dark_s2_e2.mp4', '00:52:00', 1660),
(7, 'Dark', 2, 3, 'Episode 3', 'C:\\videos\\dark_s2_e3.mp4', '00:52:00', 1670),
(7, 'Dark', 2, 4, 'Episode 4', 'C:\\videos\\dark_s2_e4.mp4', '00:52:00', 1655),
(7, 'Dark', 2, 5, 'Episode 5', 'C:\\videos\\dark_s2_e5.mp4', '00:52:00', 1680),
(7, 'Dark', 2, 6, 'Episode 6', 'C:\\videos\\dark_s2_e6.mp4', '00:52:00', 1690),
(7, 'Dark', 2, 7, 'Episode 7', 'C:\\videos\\dark_s2_e7.mp4', '00:52:00', 1700),
(7, 'Dark', 2, 8, 'Episode 8', 'C:\\videos\\dark_s2_e8.mp4', '00:52:00', 1710),

-- Season 3
(7, 'Dark', 3, 1, 'Episode 1', 'C:\\videos\\dark_s3_e1.mp4', '00:52:00', 1720),
(7, 'Dark', 3, 2, 'Episode 2', 'C:\\videos\\dark_s3_e2.mp4', '00:52:00', 1730),
(7, 'Dark', 3, 3, 'Episode 3', 'C:\\videos\\dark_s3_e3.mp4', '00:52:00', 1740),
(7, 'Dark', 3, 4, 'Episode 4', 'C:\\videos\\dark_s3_e4.mp4', '00:52:00', 1750),
(7, 'Dark', 3, 5, 'Episode 5', 'C:\\videos\\dark_s3_e5.mp4', '00:52:00', 1760),
(7, 'Dark', 3, 6, 'Episode 6', 'C:\\videos\\dark_s3_e6.mp4', '00:52:00', 1770),
(7, 'Dark', 3, 7, 'Episode 7', 'C:\\videos\\dark_s3_e7.mp4', '00:52:00', 1780),
(7, 'Dark', 3, 8, 'Episode 8', 'C:\\videos\\dark_s3_e8.mp4', '00:52:00', 1790)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `series8Insert` ()   INSERT INTO series (id, title, season, episodeNO, episode_name, video_path, duration, lik) VALUES
(8, 'The Last of Us', 1, 1, 'Episode 1', 'C:\\videos\\tlou_s1_e1.mp4', '01:21:00', 2100),
(8, 'The Last of Us', 1, 2, 'Episode 2', 'C:\\videos\\tlou_s1_e2.mp4', '00:53:00', 2050),
(8, 'The Last of Us', 1, 3, 'Episode 3', 'C:\\videos\\tlou_s1_e3.mp4', '01:15:00', 2500),
(8, 'The Last of Us', 1, 4, 'Episode 4', 'C:\\videos\\tlou_s1_e4.mp4', '00:45:00', 1980),
(8, 'The Last of Us', 1, 5, 'Episode 5', 'C:\\videos\\tlou_s1_e5.mp4', '00:59:00', 2070),
(8, 'The Last of Us', 1, 6, 'Episode 6', 'C:\\videos\\tlou_s1_e6.mp4', '00:58:00', 2025),
(8, 'The Last of Us', 1, 7, 'Episode 7', 'C:\\videos\\tlou_s1_e7.mp4', '00:56:00', 2005),
(8, 'The Last of Us', 1, 8, 'Episode 8', 'C:\\videos\\tlou_s1_e8.mp4', '00:51:00', 2150),
(8, 'The Last of Us', 1, 9, 'Episode 9', 'C:\\videos\\tlou_s1_e9.mp4', '00:43:00', 2180)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSeries` (IN `s_name` VARCHAR(30), IN `s_id` INT)   UPDATE series_data SET series_name = s_name WHERE id =s_id$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `has_active_subscription` (`p_user_id` BIGINT) RETURNS TINYINT(4) DETERMINISTIC READS SQL DATA BEGIN
DECLARE v_exists INT DEFAULT 0;
SELECT COUNT(*)
INTO v_exists
FROM subscription_plan
WHERE user_id = p_user_id
AND end_date >= CURDATE();
RETURN (v_exists > 0);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint(100) NOT NULL,
  `admin_name` varchar(10) DEFAULT NULL,
  `admin_email` varchar(20) DEFAULT NULL,
  `admin_password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(6666666666, '1215435', 'nnnn@gmail.com', 'Admin@123'),
(7854123252, 'sds', 'Admin@gmail.com', 'Admin@123'),
(8486848674, 'l', 'f@gmail.com', 'Avftd@4687'),
(8849403877, 'sds', 'Admin@gmail.com', 'Admin@123'),
(9979999766, 'ghh', 'KYGYGHGGGG@gmail.com', 'Yhxgdhdhh@1568');

-- --------------------------------------------------------

--
-- Table structure for table `episode`
--

CREATE TABLE `episode` (
  `episodeID` int(10) NOT NULL,
  `seriesID` int(10) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `episodeNO` int(10) DEFAULT NULL,
  `video_path` longtext DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `his_ID` int(10) NOT NULL,
  `time` varchar(30) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `content_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`his_ID`, `time`, `user_id`, `date`, `content_name`) VALUES
(1, '08:32:54', 7859988312, '2025-08-21', 'Mr majnu'),
(2, '08:33:34', 7859988312, '2025-08-21', 'Strike the Tent'),
(3, '08:40:20', 7859988312, '2025-08-21', 'Raazi'),
(4, '08:40:26', 7859988312, '2025-08-21', 'Pad Man'),
(5, '08:40:34', 7859988312, '2025-08-21', 'Article 15'),
(6, '08:40:52', 7859988312, '2025-08-21', 'Tumbbad'),
(7, '15:09:35', 7859988312, '2025-08-21', '3 Idiots'),
(8, '20:57:51', 7859988312, '2025-08-21', 'Second Sons'),
(9, '22:31:29', 7859988312, '2025-08-21', 'Mr majnu');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `loginID` int(10) NOT NULL,
  `userID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(10) NOT NULL,
  `movie_title` varchar(20) DEFAULT NULL,
  `movie_language` varchar(10) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `video_path` varchar(30) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `lik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_title`, `movie_language`, `category`, `video_path`, `duration`, `lik`) VALUES
(1, '3 Idiots', 'Hindi', 'Comedy', 'C:/videos/3idiots.mp4', '2h 45m', 2506),
(2, 'Dangal', 'Hindi', 'Biography', 'C:/videos/dangal.mp4', '2h 49m', 2300),
(3, 'PK', 'Hindi', 'Comedy', 'C:/videos/pk.mp4', '2h 33m', 2200),
(4, 'Lagaan', 'Hindi', 'Drama', 'C:/videos/lagaan.mp4', '3h 44m', 2100),
(5, 'Baahubali: The Begin', 'Telugu', 'Action', 'C:/videos/baahubali1.mp4', '2h 39m', 2700),
(6, 'Baahubali: The Concl', 'Telugu', 'Action', 'C:/videos/baahubali2.mp4', '2h 47m', 2900),
(7, 'Chak De! India', 'Hindi', 'Sports', 'C:/videos/chakdeindia.mp4', '2h 33m', 1800),
(8, 'Swades', 'Hindi', 'Drama', 'C:/videos/swades.mp4', '3h 5m', 1600),
(9, 'Rang De Basanti', 'Hindi', 'Drama', 'C:/videos/rdb.mp4', '2h 37m', 2000),
(10, 'Zindagi Na Milegi Do', 'Hindi', 'Drama', 'C:/videos/znmd.mp4', '2h 33m', 2100),
(11, 'Kahaani', 'Hindi', 'Thriller', 'C:/videos/kahaani.mp4', '2h 2m', 1700),
(12, 'Drishyam', 'Hindi', 'Thriller', 'C:/videos/drishyam.mp4', '2h 43m', 1900),
(13, 'Barfi!', 'Hindi', 'Romance', 'C:/videos/barfi.mp4', '2h 31m', 1500),
(14, 'Andhadhun', 'Hindi', 'Thriller', 'C:/videos/andhadhun.mp4', '2h 19m', 2200),
(15, 'Queen', 'Hindi', 'Drama', 'C:/videos/queen.mp4', '2h 26m', 1800),
(16, 'Gully Boy', 'Hindi', 'Drama', 'C:/videos/gullyboy.mp4', '2h 33m', 2100),
(17, 'Tumbbad', 'Hindi', 'Horror', 'C:/videos/tumbbad.mp4', '1h 44m', 1300),
(18, 'Article 15', 'Hindi', 'Crime', 'C:/videos/article15.mp4', '2h 10m', 1600),
(19, 'Sardar Udham', 'Hindi', 'Biography', 'C:/videos/sardarudham.mp4', '2h 42m', 2000),
(20, 'Pad Man', 'Hindi', 'Biography', 'C:/videos/padman.mp4', '2h 20m', 1500),
(21, 'Raazi', 'Hindi', 'Spy', 'C:/videos/raazi.mp4', '2h 20m', 1800),
(22, 'Shershaah', 'Hindi', 'War', 'C:/videos/shershaah.mp4', '2h 15m', 1700),
(23, 'Mimi', 'Hindi', 'Drama', 'C:/videos/mimi.mp4', '2h 12m', 1600);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(10) NOT NULL,
  `userID` int(10) DEFAULT NULL,
  `content` varchar(30) DEFAULT NULL,
  `rating` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(10) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `episodeID` int(10) NOT NULL,
  `season` int(10) NOT NULL,
  `episodeNO` int(10) NOT NULL,
  `episode_name` varchar(25) NOT NULL,
  `video_path` varchar(30) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `lik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `title`, `episodeID`, `season`, `episodeNO`, `episode_name`, `video_path`, `duration`, `lik`) VALUES
(1, 'Stranger Things', 1, 1, 1, 'Chapter One: The Vanishin', 'C:\\videos\\st_s1_e1.mp4', '00:50:00', 1000),
(1, 'Stranger Things', 2, 1, 2, 'Chapter Two: The Weirdo o', 'C:\\videos\\st_s1_e2.mp4', '00:50:00', 1010),
(1, 'Stranger Things', 3, 1, 3, 'Chapter Three: Holly, Jol', 'C:\\videos\\st_s1_e3.mp4', '00:50:00', 1020),
(1, 'Stranger Things', 4, 1, 4, 'Chapter Four: The Body', 'C:\\videos\\st_s1_e4.mp4', '00:50:00', 1030),
(1, 'Stranger Things', 5, 1, 5, 'Chapter Five: The Flea an', 'C:\\videos\\st_s1_e5.mp4', '00:50:00', 1040),
(1, 'Stranger Things', 6, 1, 6, 'Chapter Six: The Monster', 'C:\\videos\\st_s1_e6.mp4', '00:50:00', 1050),
(1, 'Stranger Things', 7, 1, 7, 'Chapter Seven: The Bathtu', 'C:\\videos\\st_s1_e7.mp4', '00:50:00', 1060),
(1, 'Stranger Things', 8, 1, 8, 'Chapter Eight: The Upside', 'C:\\videos\\st_s1_e8.mp4', '00:50:00', 1070),
(1, 'Stranger Things', 9, 2, 1, 'Chapter One: MADMAX', 'C:\\videos\\st_s2_e1.mp4', '00:50:00', 1100),
(1, 'Stranger Things', 10, 2, 2, 'Chapter Two: Trick or Tre', 'C:\\videos\\st_s2_e2.mp4', '00:50:00', 1110),
(1, 'Stranger Things', 11, 2, 3, 'Chapter Three: The Pollyw', 'C:\\videos\\st_s2_e3.mp4', '00:50:00', 1120),
(1, 'Stranger Things', 12, 2, 4, 'Chapter Four: Will the Wi', 'C:\\videos\\st_s2_e4.mp4', '00:50:00', 1130),
(1, 'Stranger Things', 13, 2, 5, 'Chapter Five: Dig Dug', 'C:\\videos\\st_s2_e5.mp4', '00:50:00', 1140),
(1, 'Stranger Things', 14, 2, 6, 'Chapter Six: The Spy', 'C:\\videos\\st_s2_e6.mp4', '00:50:00', 1150),
(1, 'Stranger Things', 15, 2, 7, 'Chapter Seven: The Lost S', 'C:\\videos\\st_s2_e7.mp4', '00:50:00', 1160),
(1, 'Stranger Things', 16, 2, 8, 'Chapter Eight: The Mind F', 'C:\\videos\\st_s2_e8.mp4', '00:50:00', 1170),
(1, 'Stranger Things', 17, 2, 9, 'Chapter Nine: The Gate', 'C:\\videos\\st_s2_e9.mp4', '00:50:00', 1180),
(1, 'Stranger Things', 18, 3, 1, 'Chapter One: Suzie, Do Yo', 'C:\\videos\\st_s3_e1.mp4', '00:50:00', 1200),
(1, 'Stranger Things', 19, 3, 2, 'Chapter Two: The Mall Rat', 'C:\\videos\\st_s3_e2.mp4', '00:50:00', 1210),
(1, 'Stranger Things', 20, 3, 3, 'Chapter Three: The Case o', 'C:\\videos\\st_s3_e3.mp4', '00:50:00', 1220),
(1, 'Stranger Things', 21, 3, 4, 'Chapter Four: The Sauna T', 'C:\\videos\\st_s3_e4.mp4', '00:50:00', 1230),
(1, 'Stranger Things', 22, 3, 5, 'Chapter Five: The Flayed', 'C:\\videos\\st_s3_e5.mp4', '00:50:00', 1240),
(1, 'Stranger Things', 23, 3, 6, 'Chapter Six: E Pluribus U', 'C:\\videos\\st_s3_e6.mp4', '00:50:00', 1250),
(1, 'Stranger Things', 24, 3, 7, 'Chapter Seven: The Bite', 'C:\\videos\\st_s3_e7.mp4', '00:50:00', 1260),
(1, 'Stranger Things', 25, 3, 8, 'Chapter Eight: The Battle', 'C:\\videos\\st_s3_e8.mp4', '00:50:00', 1270),
(1, 'Stranger Things', 26, 4, 1, 'Chapter One: The Hellfire', 'C:\\videos\\st_s4_e1.mp4', '01:05:00', 1300),
(1, 'Stranger Things', 27, 4, 2, 'Chapter Two: Vecna\'s Curs', 'C:\\videos\\st_s4_e2.mp4', '00:55:00', 1310),
(1, 'Stranger Things', 28, 4, 3, 'Chapter Three: The Monste', 'C:\\videos\\st_s4_e3.mp4', '01:00:00', 1320),
(1, 'Stranger Things', 29, 4, 4, 'Chapter Four: Dear Billy', 'C:\\videos\\st_s4_e4.mp4', '01:00:00', 1330),
(1, 'Stranger Things', 30, 4, 5, 'Chapter Five: The Nina Pr', 'C:\\videos\\st_s4_e5.mp4', '00:55:00', 1340),
(1, 'Stranger Things', 31, 4, 6, 'Chapter Six: The Dive', 'C:\\videos\\st_s4_e6.mp4', '01:05:00', 1350),
(1, 'Stranger Things', 32, 4, 7, 'Chapter Seven: The Massac', 'C:\\videos\\st_s4_e7.mp4', '01:20:00', 1360),
(1, 'Stranger Things', 33, 4, 8, 'Chapter Eight: Papa', 'C:\\videos\\st_s4_e8.mp4', '01:20:00', 1370),
(1, 'Stranger Things', 34, 4, 9, 'Chapter Nine: The Piggyba', 'C:\\videos\\st_s4_e9.mp4', '01:25:00', 1380),
(2, 'Breaking Bad', 35, 1, 1, 'Pilot', 'C:\\videos\\bb_s1_e1.mp4', '00:58:00', 1200),
(2, 'Breaking Bad', 36, 1, 2, 'Cat\'s in the Bag...', 'C:\\videos\\bb_s1_e2.mp4', '00:48:00', 1100),
(2, 'Breaking Bad', 37, 1, 3, '...And the Bag\'s in the R', 'C:\\videos\\bb_s1_e3.mp4', '00:48:00', 1150),
(2, 'Breaking Bad', 38, 1, 4, 'Cancer Man', 'C:\\videos\\bb_s1_e4.mp4', '00:48:00', 1100),
(2, 'Breaking Bad', 39, 1, 5, 'Gray Matter', 'C:\\videos\\bb_s1_e5.mp4', '00:48:00', 1120),
(2, 'Breaking Bad', 40, 1, 6, 'Crazy Handful of Nothin\'', 'C:\\videos\\bb_s1_e6.mp4', '00:48:00', 1180),
(2, 'Breaking Bad', 41, 1, 7, 'A No-Rough-Stuff-Type Dea', 'C:\\videos\\bb_s1_e7.mp4', '00:48:00', 1190),
(2, 'Breaking Bad', 42, 2, 1, 'Seven Thirty-Seven', 'C:\\videos\\bb_s2_e1.mp4', '00:48:00', 1250),
(2, 'Breaking Bad', 43, 2, 2, 'Grilled', 'C:\\videos\\bb_s2_e2.mp4', '00:48:00', 1270),
(2, 'Breaking Bad', 44, 2, 3, 'Bit by a Dead Bee', 'C:\\videos\\bb_s2_e3.mp4', '00:48:00', 1240),
(2, 'Breaking Bad', 45, 2, 4, 'Down', 'C:\\videos\\bb_s2_e4.mp4', '00:48:00', 1230),
(2, 'Breaking Bad', 46, 2, 5, 'Breakage', 'C:\\videos\\bb_s2_e5.mp4', '00:48:00', 1220),
(2, 'Breaking Bad', 47, 2, 6, 'Peekaboo', 'C:\\videos\\bb_s2_e6.mp4', '00:48:00', 1200),
(2, 'Breaking Bad', 48, 2, 7, 'Negro y Azul', 'C:\\videos\\bb_s2_e7.mp4', '00:48:00', 1210),
(2, 'Breaking Bad', 49, 2, 8, 'Better Call Saul', 'C:\\videos\\bb_s2_e8.mp4', '00:48:00', 1230),
(2, 'Breaking Bad', 50, 2, 9, '4 Days Out', 'C:\\videos\\bb_s2_e9.mp4', '00:48:00', 1260),
(2, 'Breaking Bad', 51, 2, 10, 'Over', 'C:\\videos\\bb_s2_e10.mp4', '00:48:00', 1250),
(2, 'Breaking Bad', 52, 2, 11, 'Mandala', 'C:\\videos\\bb_s2_e11.mp4', '00:48:00', 1240),
(2, 'Breaking Bad', 53, 2, 12, 'Phoenix', 'C:\\videos\\bb_s2_e12.mp4', '00:48:00', 1260),
(2, 'Breaking Bad', 54, 2, 13, 'ABQ', 'C:\\videos\\bb_s2_e13.mp4', '00:48:00', 1270),
(2, 'Breaking Bad', 55, 3, 1, 'No Más', 'C:\\videos\\bb_s3_e1.mp4', '00:48:00', 1300),
(2, 'Breaking Bad', 56, 3, 2, 'Caballo Sin Nombre', 'C:\\videos\\bb_s3_e2.mp4', '00:48:00', 1290),
(2, 'Breaking Bad', 57, 3, 3, 'I.F.T.', 'C:\\videos\\bb_s3_e3.mp4', '00:48:00', 1310),
(2, 'Breaking Bad', 58, 3, 4, 'Green Light', 'C:\\videos\\bb_s3_e4.mp4', '00:48:00', 1320),
(2, 'Breaking Bad', 59, 3, 5, 'Mas', 'C:\\videos\\bb_s3_e5.mp4', '00:48:00', 1330),
(2, 'Breaking Bad', 60, 3, 6, 'Sunset', 'C:\\videos\\bb_s3_e6.mp4', '00:48:00', 1340),
(2, 'Breaking Bad', 61, 3, 7, 'One Minute', 'C:\\videos\\bb_s3_e7.mp4', '00:48:00', 1350),
(2, 'Breaking Bad', 62, 3, 8, 'I See You', 'C:\\videos\\bb_s3_e8.mp4', '00:48:00', 1360),
(2, 'Breaking Bad', 63, 3, 9, 'Kafkaesque', 'C:\\videos\\bb_s3_e9.mp4', '00:48:00', 1370),
(2, 'Breaking Bad', 64, 3, 10, 'Fly', 'C:\\videos\\bb_s3_e10.mp4', '00:48:00', 1380),
(2, 'Breaking Bad', 65, 3, 11, 'Abiquiu', 'C:\\videos\\bb_s3_e11.mp4', '00:48:00', 1390),
(2, 'Breaking Bad', 66, 3, 12, 'Half Measures', 'C:\\videos\\bb_s3_e12.mp4', '00:48:00', 1400),
(2, 'Breaking Bad', 67, 3, 13, 'Full Measure', 'C:\\videos\\bb_s3_e13.mp4', '00:48:00', 1410),
(2, 'Breaking Bad', 68, 4, 1, 'Box Cutter', 'C:\\videos\\bb_s4_e1.mp4', '00:48:00', 1420),
(2, 'Breaking Bad', 69, 4, 2, 'Thirty-Eight Snub', 'C:\\videos\\bb_s4_e2.mp4', '00:48:00', 1430),
(2, 'Breaking Bad', 70, 4, 3, 'Open House', 'C:\\videos\\bb_s4_e3.mp4', '00:48:00', 1440),
(2, 'Breaking Bad', 71, 4, 4, 'Bullet Points', 'C:\\videos\\bb_s4_e4.mp4', '00:48:00', 1450),
(2, 'Breaking Bad', 72, 4, 5, 'Shotgun', 'C:\\videos\\bb_s4_e5.mp4', '00:48:00', 1460),
(2, 'Breaking Bad', 73, 4, 6, 'Cornered', 'C:\\videos\\bb_s4_e6.mp4', '00:48:00', 1470),
(2, 'Breaking Bad', 74, 4, 7, 'Problem Dog', 'C:\\videos\\bb_s4_e7.mp4', '00:48:00', 1480),
(2, 'Breaking Bad', 75, 4, 8, 'Hermanos', 'C:\\videos\\bb_s4_e8.mp4', '00:48:00', 1490),
(2, 'Breaking Bad', 76, 4, 9, 'Bug', 'C:\\videos\\bb_s4_e9.mp4', '00:48:00', 1500),
(2, 'Breaking Bad', 77, 4, 10, 'Salud', 'C:\\videos\\bb_s4_e10.mp4', '00:48:00', 1510),
(2, 'Breaking Bad', 78, 4, 11, 'Crawl Space', 'C:\\videos\\bb_s4_e11.mp4', '00:48:00', 1520),
(2, 'Breaking Bad', 79, 4, 12, 'End Times', 'C:\\videos\\bb_s4_e12.mp4', '00:48:00', 1530),
(2, 'Breaking Bad', 80, 4, 13, 'Face Off', 'C:\\videos\\bb_s4_e13.mp4', '00:48:00', 1540),
(2, 'Breaking Bad', 81, 5, 1, 'Live Free or Die', 'C:\\videos\\bb_s5_e1.mp4', '00:48:00', 1550),
(2, 'Breaking Bad', 82, 5, 2, 'Madrigal', 'C:\\videos\\bb_s5_e2.mp4', '00:48:00', 1560),
(2, 'Breaking Bad', 83, 5, 3, 'Hazard Pay', 'C:\\videos\\bb_s5_e3.mp4', '00:48:00', 1570),
(2, 'Breaking Bad', 84, 5, 4, 'Fifty-One', 'C:\\videos\\bb_s5_e4.mp4', '00:48:00', 1580),
(2, 'Breaking Bad', 85, 5, 5, 'Dead Freight', 'C:\\videos\\bb_s5_e5.mp4', '00:48:00', 1590),
(2, 'Breaking Bad', 86, 5, 6, 'Buyout', 'C:\\videos\\bb_s5_e6.mp4', '00:48:00', 1600),
(2, 'Breaking Bad', 87, 5, 7, 'Say My Name', 'C:\\videos\\bb_s5_e7.mp4', '00:48:00', 1610),
(2, 'Breaking Bad', 88, 5, 8, 'Gliding Over All', 'C:\\videos\\bb_s5_e8.mp4', '00:48:00', 1620),
(2, 'Breaking Bad', 89, 5, 9, 'Blood Money', 'C:\\videos\\bb_s5_e9.mp4', '00:48:00', 1630),
(2, 'Breaking Bad', 90, 5, 10, 'Buried', 'C:\\videos\\bb_s5_e10.mp4', '00:48:00', 1640),
(2, 'Breaking Bad', 91, 5, 11, 'Confessions', 'C:\\videos\\bb_s5_e11.mp4', '00:48:00', 1650),
(2, 'Breaking Bad', 92, 5, 12, 'Rabid Dog', 'C:\\videos\\bb_s5_e12.mp4', '00:48:00', 1660),
(2, 'Breaking Bad', 93, 5, 13, 'To\'hajiilee', 'C:\\videos\\bb_s5_e13.mp4', '00:48:00', 1670),
(2, 'Breaking Bad', 94, 5, 14, 'Ozymandias', 'C:\\videos\\bb_s5_e14.mp4', '00:48:00', 1680),
(2, 'Breaking Bad', 95, 5, 15, 'Granite State', 'C:\\videos\\bb_s5_e15.mp4', '00:48:00', 1690),
(2, 'Breaking Bad', 96, 5, 16, 'Felina', 'C:\\videos\\bb_s5_e16.mp4', '00:48:00', 1700),
(3, 'Money Heist', 97, 1, 1, 'Efectuar lo acordado', 'C:\\videos\\mh_s1_e1.mp4', '00:45:00', 1000),
(3, 'Money Heist', 98, 1, 2, 'Imprudencias letales', 'C:\\videos\\mh_s1_e2.mp4', '00:45:00', 1000),
(3, 'Money Heist', 99, 1, 3, 'Errar al disparar', 'C:\\videos\\mh_s1_e3.mp4', '00:45:00', 1000),
(3, 'Money Heist', 100, 1, 4, 'Caballo de Troya', 'C:\\videos\\mh_s1_e4.mp4', '00:45:00', 1000),
(3, 'Money Heist', 101, 1, 5, 'La talla del tablero', 'C:\\videos\\mh_s1_e5.mp4', '00:45:00', 1000),
(3, 'Money Heist', 102, 1, 6, 'El día de la marmota', 'C:\\videos\\mh_s1_e6.mp4', '00:45:00', 1000),
(3, 'Money Heist', 103, 1, 7, 'La leyenda del Profesor', 'C:\\videos\\mh_s1_e7.mp4', '00:45:00', 1000),
(3, 'Money Heist', 104, 1, 8, 'La ofensiva', 'C:\\videos\\mh_s1_e8.mp4', '00:45:00', 1000),
(3, 'Money Heist', 105, 1, 9, 'Un día sin perder', 'C:\\videos\\mh_s1_e9.mp4', '00:45:00', 1000),
(3, 'Money Heist', 106, 1, 10, 'La teoría del juego', 'C:\\videos\\mh_s1_e10.mp4', '00:45:00', 1000),
(3, 'Money Heist', 107, 1, 11, 'El enemigo interno', 'C:\\videos\\mh_s1_e11.mp4', '00:45:00', 1000),
(3, 'Money Heist', 108, 1, 12, 'La línea roja', 'C:\\videos\\mh_s1_e12.mp4', '00:45:00', 1000),
(3, 'Money Heist', 109, 1, 13, 'El gran golpe', 'C:\\videos\\mh_s1_e13.mp4', '00:45:00', 1000),
(3, 'Money Heist', 110, 2, 1, 'El Regreso', 'C:\\videos\\mh_s2_e1.mp4', '00:45:00', 1020),
(3, 'Money Heist', 111, 2, 2, 'Traición', 'C:\\videos\\mh_s2_e2.mp4', '00:45:00', 1020),
(3, 'Money Heist', 112, 2, 3, 'El golpe continúa', 'C:\\videos\\mh_s2_e3.mp4', '00:45:00', 1020),
(3, 'Money Heist', 113, 2, 4, 'Riesgos', 'C:\\videos\\mh_s2_e4.mp4', '00:45:00', 1020),
(3, 'Money Heist', 114, 2, 5, 'El enfrentamiento', 'C:\\videos\\mh_s2_e5.mp4', '00:45:00', 1020),
(3, 'Money Heist', 115, 2, 6, 'Venganza', 'C:\\videos\\mh_s2_e6.mp4', '00:45:00', 1020),
(3, 'Money Heist', 116, 2, 7, 'El final', 'C:\\videos\\mh_s2_e7.mp4', '00:45:00', 1020),
(3, 'Money Heist', 117, 2, 8, 'Última oportunidad', 'C:\\videos\\mh_s2_e8.mp4', '00:45:00', 1020),
(3, 'Money Heist', 118, 2, 9, 'El escape', 'C:\\videos\\mh_s2_e9.mp4', '00:45:00', 1020),
(3, 'Money Heist', 119, 3, 1, 'We\'re Back', 'C:\\videos\\mh_s3_e1.mp4', '00:48:00', 1100),
(3, 'Money Heist', 120, 3, 2, 'Aikido', 'C:\\videos\\mh_s3_e2.mp4', '00:48:00', 1110),
(3, 'Money Heist', 121, 3, 3, '48 Meters Underground', 'C:\\videos\\mh_s3_e3.mp4', '00:48:00', 1120),
(3, 'Money Heist', 122, 3, 4, 'It\'s Dolphin Time', 'C:\\videos\\mh_s3_e4.mp4', '00:48:00', 1130),
(3, 'Money Heist', 123, 3, 5, 'Boom, Boom, Ciao', 'C:\\videos\\mh_s3_e5.mp4', '00:48:00', 1140),
(3, 'Money Heist', 124, 3, 6, 'Everything Seemed Insigni', 'C:\\videos\\mh_s3_e6.mp4', '00:48:00', 1150),
(3, 'Money Heist', 125, 3, 7, 'A Quick Vacation', 'C:\\videos\\mh_s3_e7.mp4', '00:48:00', 1160),
(3, 'Money Heist', 126, 3, 8, 'Astray', 'C:\\videos\\mh_s3_e8.mp4', '00:48:00', 1170),
(3, 'Money Heist', 127, 4, 1, 'Game Over', 'C:\\videos\\mh_s4_e1.mp4', '00:50:00', 1200),
(3, 'Money Heist', 128, 4, 2, 'Berlin\'s Wedding', 'C:\\videos\\mh_s4_e2.mp4', '00:50:00', 1210),
(3, 'Money Heist', 129, 4, 3, 'Anatomy Lesson', 'C:\\videos\\mh_s4_e3.mp4', '00:50:00', 1220),
(3, 'Money Heist', 130, 4, 4, 'Pasodoble', 'C:\\videos\\mh_s4_e4.mp4', '00:50:00', 1230),
(3, 'Money Heist', 131, 4, 5, '5 Minutes Earlier', 'C:\\videos\\mh_s4_e5.mp4', '00:50:00', 1240),
(3, 'Money Heist', 132, 4, 6, 'TKO', 'C:\\videos\\mh_s4_e6.mp4', '00:50:00', 1250),
(3, 'Money Heist', 133, 4, 7, 'Strike the Tent', 'C:\\videos\\mh_s4_e7.mp4', '00:50:00', 1260),
(3, 'Money Heist', 134, 4, 8, 'The Paris Plan', 'C:\\videos\\mh_s4_e8.mp4', '01:00:00', 1270),
(3, 'Money Heist', 135, 5, 1, 'The End of the Road', 'C:\\videos\\mh_s5_e1.mp4', '00:55:00', 1300),
(3, 'Money Heist', 136, 5, 2, 'Do You Believe in Reincar', 'C:\\videos\\mh_s5_e2.mp4', '00:55:00', 1310),
(3, 'Money Heist', 137, 5, 3, 'Welcome to the Spectacle ', 'C:\\videos\\mh_s5_e3.mp4', '00:55:00', 1320),
(3, 'Money Heist', 138, 5, 4, 'Your Place in Heaven', 'C:\\videos\\mh_s5_e4.mp4', '00:55:00', 1330),
(3, 'Money Heist', 139, 5, 5, 'Live Many Lives', 'C:\\videos\\mh_s5_e5.mp4', '00:55:00', 1340),
(3, 'Money Heist', 140, 5, 6, 'Escape Valve', 'C:\\videos\\mh_s5_e6.mp4', '00:55:00', 1350),
(3, 'Money Heist', 141, 5, 7, 'Wishful Thinking', 'C:\\videos\\mh_s5_e7.mp4', '00:55:00', 1360),
(3, 'Money Heist', 142, 5, 8, 'The Elegance Theory', 'C:\\videos\\mh_s5_e8.mp4', '00:55:00', 1370),
(3, 'Money Heist', 143, 5, 9, 'Pillow Talk', 'C:\\videos\\mh_s5_e9.mp4', '00:55:00', 1380),
(3, 'Money Heist', 144, 5, 10, 'A Family Tradition', 'C:\\videos\\mh_s5_e10.mp4', '00:55:00', 1390),
(4, 'Game of Thrones', 145, 1, 1, 'Winter Is Coming', 'C:\\videos\\got_s1_e1.mp4', '00:62:00', 1500),
(4, 'Game of Thrones', 146, 1, 2, 'The Kingsroad', 'C:\\videos\\got_s1_e2.mp4', '00:56:00', 1400),
(4, 'Game of Thrones', 147, 1, 3, 'Lord Snow', 'C:\\videos\\got_s1_e3.mp4', '00:58:00', 1450),
(4, 'Game of Thrones', 148, 1, 4, 'Cripples, Bastards, and B', 'C:\\videos\\got_s1_e4.mp4', '00:56:00', 1380),
(4, 'Game of Thrones', 149, 1, 5, 'The Wolf and the Lion', 'C:\\videos\\got_s1_e5.mp4', '00:55:00', 1420),
(4, 'Game of Thrones', 150, 1, 6, 'A Golden Crown', 'C:\\videos\\got_s1_e6.mp4', '00:54:00', 1410),
(4, 'Game of Thrones', 151, 1, 7, 'You Win or You Die', 'C:\\videos\\got_s1_e7.mp4', '00:58:00', 1460),
(4, 'Game of Thrones', 152, 1, 8, 'The Pointy End', 'C:\\videos\\got_s1_e8.mp4', '00:59:00', 1470),
(4, 'Game of Thrones', 153, 1, 9, 'Baelor', 'C:\\videos\\got_s1_e9.mp4', '00:56:00', 1480),
(4, 'Game of Thrones', 154, 1, 10, 'Fire and Blood', 'C:\\videos\\got_s1_e10.mp4', '00:59:00', 1500),
(4, 'Game of Thrones', 155, 2, 1, 'The North Remembers', 'C:\\videos\\got_s2_e1.mp4', '00:55:00', 1520),
(4, 'Game of Thrones', 156, 2, 2, 'The Night Lands', 'C:\\videos\\got_s2_e2.mp4', '00:54:00', 1510),
(4, 'Game of Thrones', 157, 2, 3, 'What Is Dead May Never Di', 'C:\\videos\\got_s2_e3.mp4', '00:56:00', 1530),
(4, 'Game of Thrones', 158, 2, 4, 'Garden of Bones', 'C:\\videos\\got_s2_e4.mp4', '00:58:00', 1540),
(4, 'Game of Thrones', 159, 2, 5, 'The Ghost of Harrenhal', 'C:\\videos\\got_s2_e5.mp4', '00:57:00', 1550),
(4, 'Game of Thrones', 160, 2, 6, 'The Old Gods and the New', 'C:\\videos\\got_s2_e6.mp4', '00:56:00', 1560),
(4, 'Game of Thrones', 161, 2, 7, 'A Man Without Honor', 'C:\\videos\\got_s2_e7.mp4', '00:57:00', 1570),
(4, 'Game of Thrones', 162, 2, 8, 'The Prince of Winterfell', 'C:\\videos\\got_s2_e8.mp4', '00:55:00', 1580),
(4, 'Game of Thrones', 163, 2, 9, 'Blackwater', 'C:\\videos\\got_s2_e9.mp4', '00:56:00', 1590),
(4, 'Game of Thrones', 164, 2, 10, 'Valar Morghulis', 'C:\\videos\\got_s2_e10.mp4', '00:58:00', 1600),
(4, 'Game of Thrones', 165, 3, 1, 'Valar Dohaeris', 'C:\\videos\\got_s3_e1.mp4', '00:58:00', 1610),
(4, 'Game of Thrones', 166, 3, 2, 'Dark Wings, Dark Words', 'C:\\videos\\got_s3_e2.mp4', '00:56:00', 1620),
(4, 'Game of Thrones', 167, 3, 3, 'Walk of Punishment', 'C:\\videos\\got_s3_e3.mp4', '00:55:00', 1630),
(4, 'Game of Thrones', 168, 3, 4, 'And Now His Watch Is Ende', 'C:\\videos\\got_s3_e4.mp4', '00:56:00', 1640),
(4, 'Game of Thrones', 169, 3, 5, 'Kissed by Fire', 'C:\\videos\\got_s3_e5.mp4', '00:57:00', 1650),
(4, 'Game of Thrones', 170, 3, 6, 'The Climb', 'C:\\videos\\got_s3_e6.mp4', '00:58:00', 1660),
(4, 'Game of Thrones', 171, 3, 7, 'The Bear and the Maiden F', 'C:\\videos\\got_s3_e7.mp4', '00:57:00', 1670),
(4, 'Game of Thrones', 172, 3, 8, 'Second Sons', 'C:\\videos\\got_s3_e8.mp4', '00:55:00', 1680),
(4, 'Game of Thrones', 173, 3, 9, 'The Rains of Castamere', 'C:\\videos\\got_s3_e9.mp4', '00:55:00', 1690),
(4, 'Game of Thrones', 174, 3, 10, 'Mhysa', 'C:\\videos\\got_s3_e10.mp4', '00:59:00', 1700),
(4, 'Game of Thrones', 175, 4, 1, 'Two Swords', 'C:\\videos\\got_s4_e1.mp4', '00:58:00', 1710),
(4, 'Game of Thrones', 176, 4, 2, 'The Lion and the Rose', 'C:\\videos\\got_s4_e2.mp4', '00:55:00', 1720),
(4, 'Game of Thrones', 177, 4, 3, 'Breaker of Chains', 'C:\\videos\\got_s4_e3.mp4', '00:57:00', 1730),
(4, 'Game of Thrones', 178, 4, 4, 'Oathkeeper', 'C:\\videos\\got_s4_e4.mp4', '00:56:00', 1740),
(4, 'Game of Thrones', 179, 4, 5, 'First of His Name', 'C:\\videos\\got_s4_e5.mp4', '00:58:00', 1750),
(4, 'Game of Thrones', 180, 4, 6, 'The Laws of Gods and Men', 'C:\\videos\\got_s4_e6.mp4', '00:57:00', 1760),
(4, 'Game of Thrones', 181, 4, 7, 'Mockingbird', 'C:\\videos\\got_s4_e7.mp4', '00:56:00', 1770),
(4, 'Game of Thrones', 182, 4, 8, 'The Mountain and the Vipe', 'C:\\videos\\got_s4_e8.mp4', '00:55:00', 1780),
(4, 'Game of Thrones', 183, 4, 9, 'The Watchers on the Wall', 'C:\\videos\\got_s4_e9.mp4', '00:58:00', 1790),
(4, 'Game of Thrones', 184, 4, 10, 'The Children', 'C:\\videos\\got_s4_e10.mp4', '00:57:00', 1800),
(4, 'Game of Thrones', 185, 5, 1, 'The Wars to Come', 'C:\\videos\\got_s5_e1.mp4', '00:55:00', 1810),
(4, 'Game of Thrones', 186, 5, 2, 'The House of Black and Wh', 'C:\\videos\\got_s5_e2.mp4', '00:58:00', 1820),
(4, 'Game of Thrones', 187, 5, 3, 'High Sparrow', 'C:\\videos\\got_s5_e3.mp4', '00:57:00', 1830),
(4, 'Game of Thrones', 188, 5, 4, 'Sons of the Harpy', 'C:\\videos\\got_s5_e4.mp4', '00:56:00', 1840),
(4, 'Game of Thrones', 189, 5, 5, 'Kill the Boy', 'C:\\videos\\got_s5_e5.mp4', '00:58:00', 1850),
(4, 'Game of Thrones', 190, 5, 6, 'Unbowed, Unbent, Unbroken', 'C:\\videos\\got_s5_e6.mp4', '00:59:00', 1860),
(4, 'Game of Thrones', 191, 5, 7, 'The Gift', 'C:\\videos\\got_s5_e7.mp4', '00:57:00', 1870),
(4, 'Game of Thrones', 192, 5, 8, 'Hardhome', 'C:\\videos\\got_s5_e8.mp4', '00:60:00', 1880),
(4, 'Game of Thrones', 193, 5, 9, 'The Dance of Dragons', 'C:\\videos\\got_s5_e9.mp4', '00:56:00', 1890),
(4, 'Game of Thrones', 194, 5, 10, 'Mother\'s Mercy', 'C:\\videos\\got_s5_e10.mp4', '00:57:00', 1900),
(4, 'Game of Thrones', 195, 6, 1, 'The Red Woman', 'C:\\videos\\got_s6_e1.mp4', '00:58:00', 1910),
(4, 'Game of Thrones', 196, 6, 2, 'Home', 'C:\\videos\\got_s6_e2.mp4', '00:55:00', 1920),
(4, 'Game of Thrones', 197, 6, 3, 'Oathbreaker', 'C:\\videos\\got_s6_e3.mp4', '00:57:00', 1930),
(4, 'Game of Thrones', 198, 6, 4, 'Book of the Stranger', 'C:\\videos\\got_s6_e4.mp4', '00:56:00', 1940),
(4, 'Game of Thrones', 199, 6, 5, 'The Door', 'C:\\videos\\got_s6_e5.mp4', '00:58:00', 1950),
(4, 'Game of Thrones', 200, 6, 6, 'Blood of My Blood', 'C:\\videos\\got_s6_e6.mp4', '00:57:00', 1960),
(4, 'Game of Thrones', 201, 6, 7, 'The Broken Man', 'C:\\videos\\got_s6_e7.mp4', '00:55:00', 1970),
(4, 'Game of Thrones', 202, 6, 8, 'No One', 'C:\\videos\\got_s6_e8.mp4', '00:56:00', 1980),
(4, 'Game of Thrones', 203, 6, 9, 'Battle of the Bastards', 'C:\\videos\\got_s6_e9.mp4', '00:60:00', 1990),
(4, 'Game of Thrones', 204, 6, 10, 'The Winds of Winter', 'C:\\videos\\got_s6_e10.mp4', '00:58:00', 2000),
(4, 'Game of Thrones', 205, 7, 1, 'Dragonstone', 'C:\\videos\\got_s7_e1.mp4', '00:59:00', 2010),
(4, 'Game of Thrones', 206, 7, 2, 'Stormborn', 'C:\\videos\\got_s7_e2.mp4', '00:56:00', 2020),
(4, 'Game of Thrones', 207, 7, 3, 'The Queen\'s Justice', 'C:\\videos\\got_s7_e3.mp4', '00:55:00', 2030),
(4, 'Game of Thrones', 208, 7, 4, 'The Spoils of War', 'C:\\videos\\got_s7_e4.mp4', '00:58:00', 2040),
(4, 'Game of Thrones', 209, 7, 5, 'Eastwatch', 'C:\\videos\\got_s7_e5.mp4', '00:56:00', 2050),
(4, 'Game of Thrones', 210, 7, 6, 'Beyond the Wall', 'C:\\videos\\got_s7_e6.mp4', '00:57:00', 2060),
(4, 'Game of Thrones', 211, 7, 7, 'The Dragon and the Wolf', 'C:\\videos\\got_s7_e7.mp4', '00:59:00', 2070),
(4, 'Game of Thrones', 212, 8, 1, 'Winterfell', 'C:\\videos\\got_s8_e1.mp4', '01:02:00', 2080),
(4, 'Game of Thrones', 213, 8, 2, 'A Knight of the Seven Kin', 'C:\\videos\\got_s8_e2.mp4', '00:58:00', 2090),
(4, 'Game of Thrones', 214, 8, 3, 'The Long Night', 'C:\\videos\\got_s8_e3.mp4', '01:02:00', 2100),
(4, 'Game of Thrones', 215, 8, 4, 'The Last of the Starks', 'C:\\videos\\got_s8_e4.mp4', '00:58:00', 2110),
(4, 'Game of Thrones', 216, 8, 5, 'The Bells', 'C:\\videos\\got_s8_e5.mp4', '01:02:00', 2120),
(4, 'Game of Thrones', 217, 8, 6, 'The Iron Throne', 'C:\\videos\\got_s8_e6.mp4', '01:05:00', 2130),
(5, 'Friends', 218, 1, 1, 'The One Where Monica Gets', 'C:\\videos\\friends_s1_e1.mp4', '00:22:00', 1300),
(5, 'Friends', 219, 1, 2, 'The One with the Sonogram', 'C:\\videos\\friends_s1_e2.mp4', '00:22:00', 1250),
(5, 'Friends', 220, 1, 3, 'The One with the Thumb', 'C:\\videos\\friends_s1_e3.mp4', '00:22:00', 1240),
(5, 'Friends', 221, 1, 4, 'The One with George Steph', 'C:\\videos\\friends_s1_e4.mp4', '00:22:00', 1260),
(5, 'Friends', 222, 1, 5, 'The One with the East Ger', 'C:\\videos\\friends_s1_e5.mp4', '00:22:00', 1270),
(5, 'Friends', 223, 1, 6, 'The One with the Butt', 'C:\\videos\\friends_s1_e6.mp4', '00:22:00', 1280),
(5, 'Friends', 224, 1, 7, 'The One with the Blackout', 'C:\\videos\\friends_s1_e7.mp4', '00:22:00', 1290),
(5, 'Friends', 225, 1, 8, 'The One Where Nana Dies T', 'C:\\videos\\friends_s1_e8.mp4', '00:22:00', 1275),
(5, 'Friends', 226, 1, 9, 'The One Where Underdog Ge', 'C:\\videos\\friends_s1_e9.mp4', '00:22:00', 1265),
(5, 'Friends', 227, 1, 10, 'The One with the Monkey', 'C:\\videos\\friends_s1_e10.mp4', '00:22:00', 1285),
(5, 'Friends', 228, 1, 11, 'The One with Mrs. Bing', 'C:\\videos\\friends_s1_e11.mp4', '00:22:00', 1270),
(5, 'Friends', 229, 1, 12, 'The One with the Dozen La', 'C:\\videos\\friends_s1_e12.mp4', '00:22:00', 1255),
(5, 'Friends', 230, 1, 13, 'The One with the Boobies', 'C:\\videos\\friends_s1_e13.mp4', '00:22:00', 1245),
(5, 'Friends', 231, 1, 14, 'The One with the Candy He', 'C:\\videos\\friends_s1_e14.mp4', '00:22:00', 1265),
(5, 'Friends', 232, 1, 15, 'The One with the Stoned G', 'C:\\videos\\friends_s1_e15.mp4', '00:22:00', 1280),
(5, 'Friends', 233, 1, 16, 'The One with Two Parts: P', 'C:\\videos\\friends_s1_e16.mp4', '00:22:00', 1270),
(5, 'Friends', 234, 1, 17, 'The One with Two Parts: P', 'C:\\videos\\friends_s1_e17.mp4', '00:22:00', 1290),
(5, 'Friends', 235, 1, 18, 'The One with All the Poke', 'C:\\videos\\friends_s1_e18.mp4', '00:22:00', 1300),
(5, 'Friends', 236, 1, 19, 'The One Where the Monkey ', 'C:\\videos\\friends_s1_e19.mp4', '00:22:00', 1285),
(5, 'Friends', 237, 1, 20, 'The One with the Evil Ort', 'C:\\videos\\friends_s1_e20.mp4', '00:22:00', 1275),
(5, 'Friends', 238, 1, 21, 'The One with the Fake Mon', 'C:\\videos\\friends_s1_e21.mp4', '00:22:00', 1295),
(5, 'Friends', 239, 1, 22, 'The One with the Ick Fact', 'C:\\videos\\friends_s1_e22.mp4', '00:22:00', 1280),
(5, 'Friends', 240, 1, 23, 'The One with the Birth', 'C:\\videos\\friends_s1_e23.mp4', '00:22:00', 1305),
(5, 'Friends', 241, 1, 24, 'The One Where Rachel Find', 'C:\\videos\\friends_s1_e24.mp4', '00:22:00', 1310),
(6, 'Peaky Blinders', 242, 1, 1, 'Episode 1', 'C:\\videos\\peaky_s1_e1.mp4', '00:56:00', 1400),
(6, 'Peaky Blinders', 243, 1, 2, 'Episode 2', 'C:\\videos\\peaky_s1_e2.mp4', '00:56:00', 1380),
(6, 'Peaky Blinders', 244, 1, 3, 'Episode 3', 'C:\\videos\\peaky_s1_e3.mp4', '00:56:00', 1425),
(6, 'Peaky Blinders', 245, 1, 4, 'Episode 4', 'C:\\videos\\peaky_s1_e4.mp4', '00:56:00', 1400),
(6, 'Peaky Blinders', 246, 1, 5, 'Episode 5', 'C:\\videos\\peaky_s1_e5.mp4', '00:56:00', 1395),
(6, 'Peaky Blinders', 247, 1, 6, 'Episode 6', 'C:\\videos\\peaky_s1_e6.mp4', '00:56:00', 1410),
(6, 'Peaky Blinders', 248, 2, 1, 'Episode 1', 'C:\\videos\\peaky_s2_e1.mp4', '00:56:00', 1500),
(6, 'Peaky Blinders', 249, 2, 2, 'Episode 2', 'C:\\videos\\peaky_s2_e2.mp4', '00:56:00', 1480),
(6, 'Peaky Blinders', 250, 2, 3, 'Episode 3', 'C:\\videos\\peaky_s2_e3.mp4', '00:56:00', 1525),
(6, 'Peaky Blinders', 251, 2, 4, 'Episode 4', 'C:\\videos\\peaky_s2_e4.mp4', '00:56:00', 1500),
(6, 'Peaky Blinders', 252, 2, 5, 'Episode 5', 'C:\\videos\\peaky_s2_e5.mp4', '00:56:00', 1495),
(6, 'Peaky Blinders', 253, 2, 6, 'Episode 6', 'C:\\videos\\peaky_s2_e6.mp4', '00:56:00', 1510),
(6, 'Peaky Blinders', 254, 3, 1, 'Episode 1', 'C:\\videos\\peaky_s3_e1.mp4', '00:56:00', 1600),
(6, 'Peaky Blinders', 255, 3, 2, 'Episode 2', 'C:\\videos\\peaky_s3_e2.mp4', '00:56:00', 1580),
(6, 'Peaky Blinders', 256, 3, 3, 'Episode 3', 'C:\\videos\\peaky_s3_e3.mp4', '00:56:00', 1625),
(6, 'Peaky Blinders', 257, 3, 4, 'Episode 4', 'C:\\videos\\peaky_s3_e4.mp4', '00:56:00', 1600),
(6, 'Peaky Blinders', 258, 3, 5, 'Episode 5', 'C:\\videos\\peaky_s3_e5.mp4', '00:56:00', 1595),
(6, 'Peaky Blinders', 259, 3, 6, 'Episode 6', 'C:\\videos\\peaky_s3_e6.mp4', '00:56:00', 1610),
(6, 'Peaky Blinders', 260, 4, 1, 'Episode 1', 'C:\\videos\\peaky_s4_e1.mp4', '00:56:00', 1700),
(6, 'Peaky Blinders', 261, 4, 2, 'Episode 2', 'C:\\videos\\peaky_s4_e2.mp4', '00:56:00', 1680),
(6, 'Peaky Blinders', 262, 4, 3, 'Episode 3', 'C:\\videos\\peaky_s4_e3.mp4', '00:56:00', 1725),
(6, 'Peaky Blinders', 263, 4, 4, 'Episode 4', 'C:\\videos\\peaky_s4_e4.mp4', '00:56:00', 1700),
(6, 'Peaky Blinders', 264, 4, 5, 'Episode 5', 'C:\\videos\\peaky_s4_e5.mp4', '00:56:00', 1695),
(6, 'Peaky Blinders', 265, 4, 6, 'Episode 6', 'C:\\videos\\peaky_s4_e6.mp4', '00:56:00', 1710),
(6, 'Peaky Blinders', 266, 5, 1, 'Episode 1', 'C:\\videos\\peaky_s5_e1.mp4', '00:56:00', 1800),
(6, 'Peaky Blinders', 267, 5, 2, 'Episode 2', 'C:\\videos\\peaky_s5_e2.mp4', '00:56:00', 1780),
(6, 'Peaky Blinders', 268, 5, 3, 'Episode 3', 'C:\\videos\\peaky_s5_e3.mp4', '00:56:00', 1825),
(6, 'Peaky Blinders', 269, 5, 4, 'Episode 4', 'C:\\videos\\peaky_s5_e4.mp4', '00:56:00', 1800),
(6, 'Peaky Blinders', 270, 5, 5, 'Episode 5', 'C:\\videos\\peaky_s5_e5.mp4', '00:56:00', 1795),
(6, 'Peaky Blinders', 271, 5, 6, 'Episode 6', 'C:\\videos\\peaky_s5_e6.mp4', '00:56:00', 1810),
(6, 'Peaky Blinders', 272, 6, 1, 'Episode 1', 'C:\\videos\\peaky_s6_e1.mp4', '00:56:00', 1900),
(6, 'Peaky Blinders', 273, 6, 2, 'Episode 2', 'C:\\videos\\peaky_s6_e2.mp4', '00:56:00', 1880),
(6, 'Peaky Blinders', 274, 6, 3, 'Episode 3', 'C:\\videos\\peaky_s6_e3.mp4', '00:56:00', 1925),
(6, 'Peaky Blinders', 275, 6, 4, 'Episode 4', 'C:\\videos\\peaky_s6_e4.mp4', '00:56:00', 1900),
(6, 'Peaky Blinders', 276, 6, 5, 'Episode 5', 'C:\\videos\\peaky_s6_e5.mp4', '00:56:00', 1895),
(6, 'Peaky Blinders', 277, 6, 6, 'Episode 6', 'C:\\videos\\peaky_s6_e6.mp4', '00:56:00', 1910),
(7, 'Dark', 278, 1, 1, 'Episode 1', 'C:\\videos\\dark_s1_e1.mp4', '00:52:00', 1500),
(7, 'Dark', 279, 1, 2, 'Episode 2', 'C:\\videos\\dark_s1_e2.mp4', '00:52:00', 1520),
(7, 'Dark', 280, 1, 3, 'Episode 3', 'C:\\videos\\dark_s1_e3.mp4', '00:52:00', 1530),
(7, 'Dark', 281, 1, 4, 'Episode 4', 'C:\\videos\\dark_s1_e4.mp4', '00:52:00', 1510),
(7, 'Dark', 282, 1, 5, 'Episode 5', 'C:\\videos\\dark_s1_e5.mp4', '00:52:00', 1540),
(7, 'Dark', 283, 1, 6, 'Episode 6', 'C:\\videos\\dark_s1_e6.mp4', '00:52:00', 1550),
(7, 'Dark', 284, 1, 7, 'Episode 7', 'C:\\videos\\dark_s1_e7.mp4', '00:52:00', 1570),
(7, 'Dark', 285, 1, 8, 'Episode 8', 'C:\\videos\\dark_s1_e8.mp4', '00:52:00', 1560),
(7, 'Dark', 286, 1, 9, 'Episode 9', 'C:\\videos\\dark_s1_e9.mp4', '00:52:00', 1580),
(7, 'Dark', 287, 1, 10, 'Episode 10', 'C:\\videos\\dark_s1_e10.mp4', '00:52:00', 1600),
(7, 'Dark', 288, 2, 1, 'Episode 1', 'C:\\videos\\dark_s2_e1.mp4', '00:52:00', 1650),
(7, 'Dark', 289, 2, 2, 'Episode 2', 'C:\\videos\\dark_s2_e2.mp4', '00:52:00', 1660),
(7, 'Dark', 290, 2, 3, 'Episode 3', 'C:\\videos\\dark_s2_e3.mp4', '00:52:00', 1670),
(7, 'Dark', 291, 2, 4, 'Episode 4', 'C:\\videos\\dark_s2_e4.mp4', '00:52:00', 1655),
(7, 'Dark', 292, 2, 5, 'Episode 5', 'C:\\videos\\dark_s2_e5.mp4', '00:52:00', 1680),
(7, 'Dark', 293, 2, 6, 'Episode 6', 'C:\\videos\\dark_s2_e6.mp4', '00:52:00', 1690),
(7, 'Dark', 294, 2, 7, 'Episode 7', 'C:\\videos\\dark_s2_e7.mp4', '00:52:00', 1700),
(7, 'Dark', 295, 2, 8, 'Episode 8', 'C:\\videos\\dark_s2_e8.mp4', '00:52:00', 1710),
(7, 'Dark', 296, 3, 1, 'Episode 1', 'C:\\videos\\dark_s3_e1.mp4', '00:52:00', 1720),
(7, 'Dark', 297, 3, 2, 'Episode 2', 'C:\\videos\\dark_s3_e2.mp4', '00:52:00', 1730),
(7, 'Dark', 298, 3, 3, 'Episode 3', 'C:\\videos\\dark_s3_e3.mp4', '00:52:00', 1740),
(7, 'Dark', 299, 3, 4, 'Episode 4', 'C:\\videos\\dark_s3_e4.mp4', '00:52:00', 1750),
(7, 'Dark', 300, 3, 5, 'Episode 5', 'C:\\videos\\dark_s3_e5.mp4', '00:52:00', 1760),
(7, 'Dark', 301, 3, 6, 'Episode 6', 'C:\\videos\\dark_s3_e6.mp4', '00:52:00', 1770),
(7, 'Dark', 302, 3, 7, 'Episode 7', 'C:\\videos\\dark_s3_e7.mp4', '00:52:00', 1780),
(7, 'Dark', 303, 3, 8, 'Episode 8', 'C:\\videos\\dark_s3_e8.mp4', '00:52:00', 1790);

-- --------------------------------------------------------

--
-- Table structure for table `series_data`
--

CREATE TABLE `series_data` (
  `id` int(11) NOT NULL,
  `series_name` varchar(30) NOT NULL,
  `lik` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series_data`
--

INSERT INTO `series_data` (`id`, `series_name`, `lik`) VALUES
(1, 'Stranger Things', 40483),
(2, 'Breaking Bad', 86960),
(3, 'Money Heist', 54590),
(4, 'Game of Thrones', 129130),
(5, 'Friends', 30640),
(6, 'Peaky Blinders', 59460),
(7, 'Dark', 42915);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plan`
--

CREATE TABLE `subscription_plan` (
  `Subscription_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `Start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_plan`
--

INSERT INTO `subscription_plan` (`Subscription_id`, `type`, `Start_date`, `end_date`, `user_id`) VALUES
(1, 'Standard', '2025-08-20', '2025-09-20', 7859988312);

--
-- Triggers `subscription_plan`
--
DELIMITER $$
CREATE TRIGGER `trg_subscription_plan_prevent_duplicate` BEFORE INSERT ON `subscription_plan` FOR EACH ROW BEGIN
DECLARE v_exists INT DEFAULT 0;
SELECT COUNT(*)
INTO v_exists
FROM subscription_plan
WHERE user_id = NEW.user_id
AND end_date >= NEW.Start_date; -- overlap check
IF v_exists > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Overlapping subscription exists. Cannot purchase again.';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `subscription` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `mobile_no`, `age`, `subscription`) VALUES
(7859988312, 'savaliya', 'dwarkesh', 'sanjaybhai', 'd@gmail.com', 'Dwarkesh@777', 6363636363, 18, 'true'),
(9000000001, 'John', 'A', 'Doe', 'john.doe1@gmail.com', 'Password@1', 9000000001, 25, 'no'),
(9000000002, 'Jane', 'B', 'Smith', 'jane.smith2@gmail.com', 'Password@2', 9000000002, 30, 'no'),
(9000000003, 'Robert', 'C', 'Johnson', 'robert.johnson3@gmail.com', 'Password@3', 9000000003, 28, 'no'),
(9000000004, 'Emily', 'D', 'Brown', 'emily.brown4@gmail.com', 'Password@4', 9000000004, 22, 'no'),
(9000000005, 'Michael', 'E', 'Clark', 'michael.clark5@gmail.com', 'Password@5', 9000000005, 27, 'no'),
(9000000006, 'Sarah', 'F', 'Davis', 'sarah.davis6@gmail.com', 'Password@6', 9000000006, 29, 'no'),
(9000000007, 'William', 'G', 'Miller', 'william.miller7@gmail.com', 'Password@7', 9000000007, 34, 'no'),
(9000000008, 'Jessica', 'H', 'Wilson', 'jessica.wilson8@gmail.com', 'Password@8', 9000000008, 21, 'no'),
(9000000009, 'David', 'I', 'Moore', 'david.moore9@gmail.com', 'Password@9', 9000000009, 24, 'no'),
(9000000010, 'Ashley', 'J', 'Taylor', 'ashley.taylor10@gmail.com', 'Password@10', 9000000010, 33, 'no'),
(9000000011, 'Anthony', 'K', 'Anderson', 'anthony.anderson11@gmail.com', 'Password@11', 9000000011, 32, 'no'),
(9000000012, 'Amanda', 'L', 'Thomas', 'amanda.thomas12@gmail.com', 'Password@12', 9000000012, 26, 'no'),
(9000000013, 'Joshua', 'M', 'Jackson', 'joshua.jackson13@gmail.com', 'Password@13', 9000000013, 23, 'no'),
(9000000014, 'Stephanie', 'N', 'White', 'stephanie.white14@gmail.com', 'Password@14', 9000000014, 31, 'no'),
(9000000015, 'Matthew', 'O', 'Harris', 'matthew.harris15@gmail.com', 'Password@15', 9000000015, 35, 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`episodeID`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`his_ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`loginID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`episodeID`);

--
-- Indexes for table `series_data`
--
ALTER TABLE `series_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  ADD PRIMARY KEY (`Subscription_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9979999767;

--
-- AUTO_INCREMENT for table `episode`
--
ALTER TABLE `episode`
  MODIFY `episodeID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `his_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `loginID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `episodeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `series_data`
--
ALTER TABLE `series_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  MODIFY `Subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9000000016;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  ADD CONSTRAINT `subscription_plan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
