-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 27-Set-2023 às 14:59
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vicecityradio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(45) NOT NULL,
  `liked_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `likes`
--

INSERT INTO `likes` (`id`, `user_ip`, `liked_at`) VALUES
(88, '::1', '2023-09-27 17:53:33'),
(20, '22', '2023-09-27 03:17:38'),
(30, '33', '2023-09-27 03:29:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `musicas`
--

DROP TABLE IF EXISTS `musicas`;
CREATE TABLE IF NOT EXISTS `musicas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `radio_id` int DEFAULT NULL,
  `type` enum('musica','comentario') NOT NULL DEFAULT 'musica',
  PRIMARY KEY (`id`),
  KEY `fk_radio` (`radio_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `musicas`
--

INSERT INTO `musicas` (`id`, `name`, `artist`, `directory`, `radio_id`, `type`) VALUES
(10, 'Too Young To Fall In Love', 'Mötley Crüe', 'radios/new radio/3.Mötley Crüe - Too Young To Fall In Love.mp3', 16, 'musica'),
(26, 'I Wanna Rock', 'Twisted Sister', 'radios/V Rock/2.Stay Hungry CD 1 TRACK 5 (320).mp3', 17, 'musica'),
(8, 'Billie Jean', 'Michael Jackson', 'radios/Flash FM/4.Thriller CD 1 TRACK 6 (320).mp3', 15, 'musica'),
(11, 'Out of Touch (Single Version)', 'Daryl Hall & John Oates', 'radios/Flash FM/2.Daryl Hall _ John Oates - Out of Touch (Single Version).mp3', 15, 'musica'),
(12, 'Dance Hall Days', 'Wang Chung', 'radios/Flash FM/3.Points On The Curve CD 1 TRACK 1 (320).mp3', 15, 'musica'),
(13, 'Self Control', 'Laura Branigan', 'radios/Flash FM/5.Laura Branigan - Self Control.mp3', 15, 'musica'),
(14, 'Call Me', 'Go West', 'radios/Flash FM/6.Go West - Call Me.mp3', 15, 'musica'),
(15, 'Kiss the Dirt (Falling Down the Mountain)', 'INXS', 'radios/Flash FM/7.INXS - Kiss the Dirt (Falling Down the Mountain).mp3', 15, 'musica'),
(16, 'Run To You', 'Bryan Adams', 'radios/Flash FM/8.Bryan Adams - Run To You.mp3', 15, 'musica'),
(17, 'Four Little Diamonds', 'Electric Light Orchestra', 'radios/Flash FM/9.Electric Light Orchestra - Four Little Diamonds.mp3', 15, 'musica'),
(18, 'Owner of a Lonely Heart', 'Yes', 'radios/Flash FM/10.Yes - Owner of a Lonely Heart.mp3', 15, 'musica'),
(19, 'Video Killed The Radio Star', 'The Buggles', 'radios/Flash FM/11.The Age Of Plastic CD 1 TRACK 2 (320).mp3', 15, 'musica'),
(20, 'Japanese Boy', 'Aneka', 'radios/Flash FM/12.Aneka - Japanese Boy.mp3', 15, 'musica'),
(21, 'Life\'s What You Make It', 'Talk Talk', 'radios/Flash FM/13.The Very Best Of CD 1 TRACK 8 (320).mp3', 15, 'musica'),
(22, 'Your Love', 'The Outfield', 'radios/Flash FM/14.Românticas Anos 80 CD 1 TRACK 34 (320).mp3', 15, 'musica'),
(23, 'Steppin\' Out', 'Joe Jackson', 'radios/Flash FM/15.Joe Jackson - Steppin_ Out.mp3', 15, 'musica'),
(24, 'One Thing Leads To Another', 'The Fixx', 'radios/Flash FM/16.The Fixx - One Thing Leads To Another.mp3', 15, 'musica'),
(25, 'Running With The Night (Single Version)', 'Lionel Richie', 'radios/Flash FM/17.Lionel Richie - Running With The Night (Single Version).mp3', 15, 'musica'),
(27, 'Too Young To Fall In Love', 'Mötley Crüe', 'radios/V Rock/3.Mötley Crüe - Too Young To Fall In Love.mp3', 17, 'musica'),
(28, 'Cum on Feel the Noize', 'Quiet Riot', 'radios/V Rock/4.Cum on Feel the Noize.mp3', 17, 'musica'),
(29, 'She Sells Sanctuary', 'The Cult', 'radios/V Rock/5.The Cult - She Sells Sanctuary.mp3', 17, 'musica'),
(30, 'Bark at the Moon', 'Ozzy Osbourne', 'radios/V Rock/6.Ozzy Osbourne - Bark at the Moon.mp3', 17, 'musica'),
(31, 'Dangerous Bastard', 'Love Fist', 'radios/V Rock/7.Love Fist - Dangerous Bastard.mp3', 17, 'musica'),
(32, '2 Minutes to Midnight (2015 Remaster)', 'Iron Maiden', 'radios/V Rock/8.Iron Maiden - 2 Minutes to Midnight (2015 Remaster).mp3', 17, 'musica'),
(33, 'Working for the Weekend (Remastered)', 'Loverboy', 'radios/V Rock/9.Loverboy - Working for the Weekend (Remastered).mp3', 17, 'musica'),
(34, 'God Blessed Video', 'Alcatrazz', 'radios/V Rock/10.Disturbing The Peace CD 1 TRACK 1 (320).mp3', 17, 'musica'),
(35, 'Cumin\' Atcha Live', 'Tesla', 'radios/V Rock/11.Mechanical Resonance CD 1 TRACK 2 (320).mp3', 17, 'musica'),
(36, 'Turn up the Radio', 'Autograph', 'radios/V Rock/12.Autograph - Turn up the Radio.mp3', 17, 'musica'),
(37, 'Peace Sells', 'Megadeth', 'radios/V Rock/13.Megadeth - Peace Sells.mp3', 17, 'musica'),
(38, 'Madhouse', 'Anthrax', 'radios/V Rock/14.Anthrax - Madhouse.mp3', 17, 'musica'),
(39, 'Raining Blood', 'Slayer', 'radios/V Rock/15.Reign In Blood CD 1 TRACK 10 (320).mp3', 17, 'musica'),
(40, 'You\'ve Got Another Thing Coming', 'Judas Priest', 'radios/V Rock/16.Screaming For Vengeance CD 1 TRACK 8 (320).mp3', 17, 'musica'),
(41, 'Fist Fury', 'Love Fist', 'radios/V Rock/17.Love Fist - Fist Fury.mp3', 17, 'musica'),
(42, 'Yankee Rose', 'David Lee Roth', 'radios/V Rock/18.Eat  Em And Smile CD 1 TRACK 1 (320).mp3', 17, 'musica'),
(43, 'comentario', 'comentario', 'radios/V Rock/1.The American Thing.mp3', 17, 'comentario'),
(44, 'comentario', 'comentario', 'radios/V Rock/2.Mosters of Rock.mp3', 17, 'comentario'),
(45, 'comentario', 'comentario', 'radios/V Rock/3.The American way.mp3', 17, 'comentario'),
(46, 'comentario', 'comentario', 'radios/V Rock/4. Exploder.mp3', 17, 'comentario'),
(47, 'comentario', 'comentario', 'radios/V Rock/5. Ammo Mart.mp3', 17, 'comentario'),
(48, 'comentario', 'comentario', 'radios/V Rock/6. VROCK.mp3', 17, 'comentario'),
(49, 'GTA Vice City - Flash FM **Commercials**', 'GTAradioStation', 'radios/Flash FM/01.Flash FM Commercials.mp3', 15, 'comentario'),
(50, 'GTA Vice City - Flash FM **Commercials**', 'GTAradioStation', 'radios/Flash FM/02.Flash FM Commercials.mp3', 15, 'comentario'),
(51, 'GTA Vice City - Flash FM **Commercials**', 'GTAradioStation', 'radios/Flash FM/03.Flash FM Commercials.mp3', 15, 'comentario'),
(52, 'GTA Vice City - Flash FM **Commercials**', 'GTAradioStation', 'radios/Flash FM/04.Flash FM Commercials.mp3', 15, 'comentario'),
(53, 'Two Tribes', 'Frankie Goes to Hollywood', 'radios/Wave 103/2.Frankie Goes to Hollywood - Two Tribes.mp3', 18, 'musica'),
(54, 'Love Missile F1-11', 'Sigue Sigue Sputnik', 'radios/Wave 103/3.Sigue Sigue Sputnik - Love Missile F1-11.mp3', 18, 'musica'),
(55, 'Cars', 'Gary Numan', 'radios/Wave 103/4.Gary Numan - Cars.mp3', 18, 'musica'),
(56, '(Keep Feeling) Fascination', 'The Human League', 'radios/Wave 103/5.The Human League - (Keep Feeling) Fascination.mp3', 18, 'musica'),
(57, 'Atomic (Remastered/2001)', 'Blondie', 'radios/Wave 103/6.Atomic Remastered 2001.mp3', 18, 'musica'),
(58, '99 Luftballons', 'Nena', 'radios/Wave 103/7.Nena - 99 Luftballons.mp3', 18, 'musica'),
(59, 'Kids In America', 'Kim Wilde', 'radios/Wave 103/8.Kim Wilde - Kids In America.mp3', 18, 'musica'),
(60, 'Pale Shelter', 'Tears for Fears', 'radios/Wave 103/9.Tears for Fears - Pale Shelter.mp3', 18, 'musica'),
(61, 'Sunglasses At Night', 'Corey Hart', 'radios/Wave 103/10.Corey Hart - Sunglasses At Night.mp3', 18, 'musica'),
(62, 'Poison Arrow', 'ABC', 'radios/Wave 103/11.ABC - Poison Arrow.mp3', 18, 'musica'),
(63, 'I Ran (So Far Away)', 'A Flock of Seagulls', 'radios/Wave 103/12.A Flock of Seagulls - I Ran (So Far Away).mp3', 18, 'musica'),
(64, 'Love My Way', 'The Psychedelic Furs', 'radios/Wave 103/13.The Psychedelic Furs - Love My Way.mp3', 18, 'musica'),
(65, 'Obsession', 'Animotion', 'radios/Wave 103/14.Animotion - Obsession.mp3', 18, 'musica'),
(66, 'Gold', 'Spandau Ballet', 'radios/Wave 103/15.Spandau Ballet - Gold.mp3', 18, 'musica'),
(67, 'Hyperactive!', 'Thomas Dolby', 'radios/Wave 103/16.The Flat Earth CD 1 TRACK 7 (320).mp3', 18, 'musica'),
(68, 'Never Say Never (Single Version)', 'Romeo Void', 'radios/Wave 103/17.Romeo Void - Never Say Never (Single Version).mp3', 18, 'musica'),
(69, 'GTA Vice City Wave 103- Commercials', 'TheEverythingGTA', 'radios/Wave 103/01.Wave 103 Commercials.mp3', 18, 'musica'),
(70, 'GTA Vice City Wave 103- Commercials', 'TheEverythingGTA', 'radios/Wave 103/02.Wave 103 Commercials.mp3', 18, 'musica'),
(71, 'GTA Vice City Wave 103- Commercials', 'TheEverythingGTA', 'radios/Wave 103/03.Wave 103 Commercials.mp3', 18, 'musica'),
(72, 'GTA Vice City - Emotion 98.3  **Commercials**', 'GTAradioStation', 'radios/Emotion 98.3/01.Emotion 98 Commercials.mp3', 19, 'comentario'),
(73, 'GTA Vice City - Emotion 98.3  **Commercials**', 'GTAradioStation', 'radios/Emotion 98.3/02.Emotion 98 Commercials.mp3', 19, 'comentario'),
(74, 'GTA Vice City - Emotion 98.3  **Commercials**', 'GTAradioStation', 'radios/Emotion 98.3/03.Emotion 98 Commercials.mp3', 19, 'comentario'),
(75, 'Waiting for a Girl like You', 'Foreigner', 'radios/Emotion 98.3/2.Foreigner - Waiting for a Girl like You.mp3', 19, 'musica'),
(76, 'Wow', 'Kate Bush', 'radios/Emotion 98.3/3.Foreigner - Waiting for a Girl like You.mp3', 19, 'musica'),
(77, 'Tempted', 'Squeeze', 'radios/Emotion 98.3/4.Squeeze - Tempted.mp3', 19, 'musica'),
(78, 'Keep on Loving You', 'REO Speedwagon', 'radios/Emotion 98.3/5.REO Speedwagon - Keep on Loving You.mp3', 19, 'musica'),
(79, '(I Just) Died In Your Arms', 'Cutting Crew', 'radios/Emotion 98.3/6.Cutting Crew - (I Just) Died In Your Arms.mp3', 19, 'musica'),
(80, 'More Than This', 'Roxy Music', 'radios/Emotion 98.3/7.Roxy Music - More Than This.mp3', 19, 'musica'),
(81, 'Africa', 'Toto', 'radios/Emotion 98.3/8.Toto - Africa.mp3', 19, 'musica'),
(82, 'Broken Wings', 'Mr. Mister', 'radios/Emotion 98.3/9.Mr. Mister - Broken Wings.mp3', 19, 'musica'),
(83, 'Missing You', 'John Waite', 'radios/Emotion 98.3/10.John Waite - Missing You.mp3', 19, 'musica'),
(84, 'Crockett\'s Theme', 'Jan Hammer', 'radios/Emotion 98.3/11.Jan Hammer - Crockett_s Theme.mp3', 19, 'musica'),
(85, 'Sister Christian', 'Night Ranger', 'radios/Emotion 98.3/12.Midnight Madness CD 1 TRACK 4 (320).mp3', 19, 'musica'),
(86, 'Never Too Much', 'Luther Vandross', 'radios/Emotion 98.3/13.Never Too Much CD 1 TRACK 1 (320).mp3', 19, 'musica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `radio`
--

DROP TABLE IF EXISTS `radio`;
CREATE TABLE IF NOT EXISTS `radio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text,
  `imagem` varchar(255) DEFAULT NULL,
  `diretorio` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `radio`
--

INSERT INTO `radio` (`id`, `nome`, `descricao`, `imagem`, `diretorio`, `logo`) VALUES
(15, 'Flash FM', 'Radio FlashFM', 'radios/Flash FM/1.jpg', 'radios/Flash FM', 'radios/Flash FM/logo.png'),
(18, 'Wave 103', 'Radio Wave 103', 'radios/Wave 103/Card wave 103.png', 'radios/Wave 103', 'radios/Wave 103/Logo.png'),
(17, 'V Rock', 'Radio V Rock FM', 'radios/V Rock/Volume 1 Capa.png', 'radios/V Rock', 'radios/V Rock/logo.png'),
(19, 'Emotion 98.3', 'Radio Emotion 98.3', 'radios/Emotion 98.3/Card emotion93.3.png', 'radios/Emotion 98.3', 'radios/Emotion 98.3/logo.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
