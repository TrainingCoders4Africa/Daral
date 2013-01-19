-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 19 Janvier 2013 à 20:40
-- Version du serveur: 5.5.25
-- Version de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données: `daral`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_id` varchar(13) NOT NULL,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `photo_left` varchar(100) NOT NULL,
  `photo_right` varchar(100) NOT NULL,
  `photo_front` varchar(100) NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `comment` varchar(1000) NOT NULL DEFAULT 'R.A.S',
  PRIMARY KEY (`id`),
  UNIQUE KEY `animal_id` (`animal_id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `animal`
--

INSERT INTO `animal` (`id`, `animal_id`, `fk_id_farmer`, `fk_animaltype`, `photo_left`, `photo_right`, `photo_front`, `isactive`, `comment`) VALUES
(1, '10010001C0001', '10010001', 'Cheval', 'car.jpg', 'car.jpg', 'image.jpg', 1, 'R.A.S'),
(2, '10010002B0001', '10010002', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(3, '10010002B0002', '10010002', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(4, '10010002B0003', '10010002', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(5, '10010002B0004', '10010002', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(6, '10010002B0005', '10010002', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(7, '10010001C0002', '10010001', 'Cheval', 'image.jpg', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(8, '10010001C0003', '10010001', 'Cheval', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(9, '10010001C0004', '10010001', 'Cheval', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(10, '10010003B0001', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'Tache marron sur le cote droit'),
(11, '10010003B0002', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(12, '10010003B0003', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(13, '10010003B0004', '10010003', 'Boeuf', 'no_photo.png', 'user_icon.jpg', 'no_photo.png', 1, 'R.A.S'),
(14, '10010003B0005', '10010003', 'Boeuf', 'image.jpg', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(15, '10010003B0006', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(16, '10010003B0007', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(17, '10010003B0008', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'image.jpg', 1, 'R.A.S'),
(18, '10010003B0009', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(19, '10010003B0010', '10010003', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(20, '10010001B0001', '10010001', 'Boeuf', 'user_icon.jpg', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(21, '10010001B0002', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(22, '10010001B0003', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(23, '10010001B0004', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(24, '10010001B0005', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(25, '10010001B0006', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(26, '10010001B0007', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(27, '10010001B0008', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(28, '10010001B0009', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(29, '10010001B0010', '10010001', 'Boeuf', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S'),
(30, '10010003C0001', '10010003', 'Cheval', 'no_photo.png', 'no_photo.png', 'no_photo.png', 1, 'R.A.S');

-- --------------------------------------------------------

--
-- Structure de la table `animaltype`
--

CREATE TABLE `animaltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `animal_tag` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `animal_tag` (`animal_tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `animaltype`
--

INSERT INTO `animaltype` (`id`, `name`, `animal_tag`) VALUES
(1, 'Cheval', 'C'),
(2, 'Boeuf', 'B');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `max_animal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorie_id` (`categorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie_id`, `max_animal`) VALUES
(1, 1, 100),
(2, 2, 200);

-- --------------------------------------------------------

--
-- Structure de la table `cheptel`
--

CREATE TABLE `cheptel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `total_animaltype` int(11) NOT NULL,
  `isactive` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `cheptel`
--

INSERT INTO `cheptel` (`id`, `fk_id_farmer`, `fk_animaltype`, `total_animaltype`, `isactive`) VALUES
(1, '10010001', 'Cheval', 4, 1),
(2, '10010002', 'Boeuf', 5, 1),
(3, '10010003', 'Boeuf', 10, 1),
(4, '10010001', 'Boeuf', 10, 1),
(5, '10010003', 'Cheval', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `id_cnx` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `connectionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cnx`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`id_cnx`, `user`, `ip`, `connectionDate`) VALUES
(4, 1, '::1', '2013-01-19 19:17:05');

-- --------------------------------------------------------

--
-- Structure de la table `daral`
--

CREATE TABLE `daral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_localite` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'ex: 0102',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id_localite` (`id_localite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `daral`
--

INSERT INTO `daral` (`id`, `id_localite`, `name`) VALUES
(1, 'Diossong', '1001'),
(2, 'Djilor', '1002'),
(3, 'Nioro Allassane Tall', '1003'),
(4, 'Passy', '1004'),
(5, 'Ndoffane', '1802'),
(6, 'Ndiedieng', '1801'),
(7, 'Ndiaffat', '2801');

-- --------------------------------------------------------

--
-- Structure de la table `daralstatanimal`
--

CREATE TABLE `daralstatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_daral_name` varchar(30) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `total_animaltype` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_daral_name` (`fk_daral_name`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `daralstatfarmer`
--

CREATE TABLE `daralstatfarmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_daral_name` varchar(30) NOT NULL,
  `total_farmer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_daral_name` (`fk_daral_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `region` (`region`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`id`, `name`, `region`) VALUES
(1, 'Bakel', 'Tambacounda'),
(2, 'Bambey', 'Diourbel'),
(3, 'Bignogna', 'Ziguinchor'),
(4, 'Birkelane', 'Kaffrine'),
(5, 'Bounkiling', 'Sedhiou'),
(6, 'Dagana', 'Saint-Louis'),
(7, 'Dakar', 'Dakar'),
(8, 'Diourbel', 'Diourbel'),
(9, 'Fatick', 'Fatick'),
(10, 'Foundiougne', 'Fatick'),
(11, 'Gossas', 'Fatick'),
(12, 'Goudiry', 'Tambacounda'),
(13, 'Goudomp', 'Sedhiou'),
(14, 'Guediewaye', 'Dakar'),
(15, 'Guinguineo', 'Kaolack'),
(16, 'Kaffrine', 'Kaffrine'),
(17, 'Kanel', 'Matam'),
(18, 'Kaolack', 'Kaolack'),
(19, 'Kebemer', 'Louga'),
(20, 'Kedougou', 'Kedougou'),
(21, 'Kolda', 'Kolda'),
(22, 'Koumpentoum', 'Tambacounda'),
(23, 'Koungheul', 'Kaffrine'),
(24, 'Liguere', 'Louga'),
(25, 'Louga', 'Louga'),
(26, 'Mbour', 'Thies'),
(27, 'Malem Hodar', 'Kaffrine'),
(28, 'Matam', 'Matam'),
(29, 'Mbake', 'Diourbel'),
(30, 'Medina Yoro Foulah', 'Kolda'),
(31, 'Nioro du Rip', 'Kaolack'),
(32, 'Oussouye', 'Ziguinchor'),
(33, 'Pikine', 'Dakar'),
(34, 'Podor', 'Saint-Louis'),
(35, 'Ranerou', 'Matam'),
(36, 'Rufisque', 'Dakar'),
(37, 'Saint Louis', 'Saint-Louis'),
(38, 'Salemata', 'Kedougou'),
(39, 'Saraya', 'Kedougou'),
(40, 'Sedhiou', 'Sedhiou'),
(41, 'Tambacounda', 'Tambacounda'),
(42, 'Thies', 'Thies'),
(43, 'Tivaouane', 'Thies'),
(44, 'Velingara', 'Kolda'),
(45, 'Ziguinchor', 'Ziguinchor');

-- --------------------------------------------------------

--
-- Structure de la table `departementstatanimal`
--

CREATE TABLE `departementstatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_departement_name` varchar(50) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `total_animaltype` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departement_name` (`fk_departement_name`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `departementstatfarmer`
--

CREATE TABLE `departementstatfarmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_departement_name` varchar(50) NOT NULL,
  `total_farmer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departement_name` (`fk_departement_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `farmer`
--

CREATE TABLE `farmer` (
  `rank_farmer` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmer` varchar(30) NOT NULL,
  `categorie` int(11) NOT NULL,
  `national_id` varchar(50) NOT NULL,
  `address_farmer` varchar(100) NOT NULL,
  `phone_farmer` varchar(30) NOT NULL,
  `registration_date` date NOT NULL,
  `daral_originel` varchar(30) NOT NULL,
  `daral_actuel` varchar(30) NOT NULL,
  `firstname_farmer` varchar(30) NOT NULL,
  `lastname_farmer` varchar(30) NOT NULL,
  `isactive_farmer` int(2) NOT NULL,
  `birthdate_farmer` date NOT NULL,
  `birthplace_farmer` varchar(30) NOT NULL,
  `id_localite` varchar(30) NOT NULL COMMENT 'localite du daral d''appartenance (daral actuel) de l''eleveur',
  `departement` varchar(30) NOT NULL COMMENT 'Departement du daral d''appartenance (daral actuel) de l''eleveur',
  `region` varchar(30) NOT NULL COMMENT 'region du daral d''appartenance (daral actuel) de l''eleveur',
  PRIMARY KEY (`rank_farmer`),
  UNIQUE KEY `id_farmer` (`id_farmer`),
  KEY `categorie` (`categorie`,`daral_originel`,`daral_actuel`,`id_localite`),
  KEY `daral_originel` (`daral_originel`),
  KEY `daral_actuel` (`daral_actuel`),
  KEY `id_localite` (`id_localite`),
  KEY `departement` (`departement`,`region`),
  KEY `departement_2` (`departement`),
  KEY `region` (`region`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Contenu de la table `farmer`
--

INSERT INTO `farmer` (`rank_farmer`, `id_farmer`, `categorie`, `national_id`, `address_farmer`, `phone_farmer`, `registration_date`, `daral_originel`, `daral_actuel`, `firstname_farmer`, `lastname_farmer`, `isactive_farmer`, `birthdate_farmer`, `birthplace_farmer`, `id_localite`, `departement`, `region`) VALUES
(40, '10010001', 2, '1209812347788', 'Matam', '221775312740', '2013-01-11', '1001', '1802', 'Adama', 'Tounkara', 1, '1967-01-01', 'Matam', 'Ndoffane', 'Kaolack', 'Kaolack'),
(41, '10010002', 1, '1219812347789', 'Podor', '775989808', '2013-01-11', '1001', '1001', 'Baba', 'Samb', 1, '1960-02-02', 'Podor', 'Diossong', 'Foundiougne', 'Fatick'),
(42, '10010003', 1, '1234812347788', 'Ziguinchor', '22178675433', '2013-01-15', '1001', '1001', 'Doudou', 'Drame', 1, '1975-06-02', 'Ziguinchor', 'Diossong', 'Foundiougne', 'Fatick');

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `localite`
--

CREATE TABLE `localite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `departement` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `departement` (`departement`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `localite`
--

INSERT INTO `localite` (`id`, `name`, `departement`) VALUES
(1, 'Diossong', 'Foundiougne'),
(2, 'Nioro Allassane Tall', 'Foundiougne'),
(3, 'Ndiaffat', 'Matam'),
(4, 'Djilor', 'Foundiougne'),
(5, 'Ndiedieng', 'Kaolack'),
(6, 'Ndoffane', 'Kaolack'),
(7, 'Passy', 'Foundiougne');

-- --------------------------------------------------------

--
-- Structure de la table `localitestatanimal`
--

CREATE TABLE `localitestatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_localite_name` varchar(50) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `total_animaltype` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localite_name` (`fk_localite_name`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `localitestatfarmer`
--

CREATE TABLE `localitestatfarmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_localite_name` varchar(50) NOT NULL,
  `total_farmer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localite_name` (`fk_localite_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `symptomes` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `vaccin` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(250) NOT NULL,
  `langue` varchar(100) NOT NULL,
  `date_insertion` date NOT NULL,
  `lien` varchar(250) NOT NULL,
  `maladie` varchar(100) NOT NULL,
  PRIMARY KEY (`id_media`),
  KEY `langue` (`langue`,`maladie`),
  KEY `maladie` (`maladie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `national`
--

CREATE TABLE `national` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_animaltype` varchar(30) NOT NULL,
  `total_animaltype` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_animaltype` (`fk_animaltype`),
  KEY `fk_animaltype_2` (`fk_animaltype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmer` varchar(30) DEFAULT '',
  `id_localite` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `disabled` int(1) NOT NULL DEFAULT '0',
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_localite` (`id_localite`),
  KEY `id_farmer_2` (`id_farmer`),
  KEY `id_user` (`id_user`),
  KEY `type` (`type`),
  KEY `type_2` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `notification`
--

INSERT INTO `notification` (`id`, `id_farmer`, `id_localite`, `date`, `type`, `id_user`, `disabled`, `description`) VALUES
(15, '', 6, '2013-01-15 00:00:00', 1, 2, 0, 'vol de vache'),
(16, '', 2, '2013-01-15 00:00:00', 1, 1, 0, 'eleveur Adama Tounkara id=10010001 a perdu une vache id=5'),
(17, '', 1, '2013-01-15 00:00:00', 5, 1, 0, 'l eleveur Baba Samb id=10010002 a perdu un boeuf id=1'),
(18, '', 1, '2013-01-15 00:00:00', 5, 1, 0, 'l eleveur Baba Samb id=10010002 a perdu un boeuf id=1'),
(19, '', 2, '2013-01-15 00:00:00', 2, 1, 0, 'peste equine declaree'),
(20, '', 1, '2013-01-17 00:00:00', 5, 1, 0, 'l eleveur id=10010003 a perdu un boeuf id=1');

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `region`
--

INSERT INTO `region` (`id`, `name`) VALUES
(1, 'Dakar'),
(2, 'Diourbel'),
(3, 'Fatick'),
(4, 'Kaffrine'),
(5, 'Kaolack'),
(6, 'Kedougou'),
(7, 'Kolda'),
(8, 'Louga'),
(9, 'Matam'),
(10, 'Saint-Louis'),
(11, 'Sedhiou'),
(12, 'Tambacounda'),
(13, 'Thies'),
(14, 'Ziguinchor');

-- --------------------------------------------------------

--
-- Structure de la table `regionstatanimal`
--

CREATE TABLE `regionstatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_region_name` varchar(50) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `total_animaltype` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_name` (`fk_region_name`,`fk_animaltype`),
  KEY `fk_region_name_2` (`fk_region_name`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `regionstatfarmer`
--

CREATE TABLE `regionstatfarmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_region_name` varchar(50) NOT NULL,
  `total_farmer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_name` (`fk_region_name`),
  KEY `fk_region_name_2` (`fk_region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `roleusers`
--

CREATE TABLE `roleusers` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL COMMENT 'valeur = admin ou gerant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `roleusers`
--

INSERT INTO `roleusers` (`id`, `description`) VALUES
(1, 'admin'),
(2, 'gerant');

-- --------------------------------------------------------

--
-- Structure de la table `typenotification`
--

CREATE TABLE `typenotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `typenotification`
--

INSERT INTO `typenotification` (`id`, `libelle`, `description`) VALUES
(1, 'vol de vache', ''),
(2, 'peste equine', ''),
(3, 'vol de chevaux', ''),
(4, 'vol de moutons', ''),
(5, 'vol de boeufs', '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `date_created` datetime NOT NULL,
  `role` varchar(20) NOT NULL,
  `user_daral` varchar(30) NOT NULL COMMENT 'un admin s''attribue un daral et en fonction des besoins il peut modifier cette information',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role` (`role`,`user_daral`),
  KEY `user_daral` (`user_daral`),
  KEY `role_2` (`role`),
  KEY `user_daral_2` (`user_daral`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date_created`, `role`, `user_daral`) VALUES
(1, 'mansour', 'passer', '2012-12-04 00:00:00', 'admin', '1001'),
(2, 'sada', 'passer', '2012-12-05 00:00:00', 'admin', '1002'),
(3, 'amdane', 'passer', '2012-12-06 00:00:00', 'admin', '1003'),
(4, 'sokhna', 'passer', '2012-12-21 00:00:00', 'admin', '1004'),
(5, 'gerant', 'passer', '2013-01-09 00:00:00', 'gerant', '1001'),
(6, 'testt1', 'kutt', '2013-01-14 23:37:52', 'admin', '1003'),
(7, 'testj', '1234', '2013-01-14 23:46:55', 'admin', '1801');

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

CREATE TABLE `veterinaire` (
  `rank_veterinaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_veterinaire` varchar(30) NOT NULL,
  `adresse_veterinaire` varchar(100) NOT NULL,
  `localite_veterinaire` int(11) NOT NULL,
  `firstname_veterinaire` varchar(30) NOT NULL,
  `lastname_veterinaire` varchar(30) NOT NULL,
  `IsActive_veterinaire` int(2) NOT NULL,
  `email_veterinaire` varchar(30) NOT NULL,
  PRIMARY KEY (`rank_veterinaire`),
  UNIQUE KEY `id_veterinaire` (`id_veterinaire`,`email_veterinaire`),
  KEY `localite_veterinaire` (`localite_veterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`fk_id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cheptel`
--
ALTER TABLE `cheptel`
  ADD CONSTRAINT `cheptel_ibfk_1` FOREIGN KEY (`fk_id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cheptel_ibfk_2` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `daral`
--
ALTER TABLE `daral`
  ADD CONSTRAINT `daral_ibfk_3` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `daralstatanimal`
--
ALTER TABLE `daralstatanimal`
  ADD CONSTRAINT `daralstatanimal_ibfk_1` FOREIGN KEY (`fk_daral_name`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `daralstatanimal_ibfk_2` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `daralstatfarmer`
--
ALTER TABLE `daralstatfarmer`
  ADD CONSTRAINT `daralstatfarmer_ibfk_1` FOREIGN KEY (`fk_daral_name`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departementstatanimal`
--
ALTER TABLE `departementstatanimal`
  ADD CONSTRAINT `departementstatanimal_ibfk_1` FOREIGN KEY (`fk_departement_name`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departementstatanimal_ibfk_2` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departementstatfarmer`
--
ALTER TABLE `departementstatfarmer`
  ADD CONSTRAINT `departementstatfarmer_ibfk_1` FOREIGN KEY (`fk_departement_name`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `farmer`
--
ALTER TABLE `farmer`
  ADD CONSTRAINT `farmer_ibfk_17` FOREIGN KEY (`region`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_13` FOREIGN KEY (`daral_actuel`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_15` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_16` FOREIGN KEY (`departement`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_8` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`categorie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_9` FOREIGN KEY (`daral_originel`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `localite`
--
ALTER TABLE `localite`
  ADD CONSTRAINT `localite_ibfk_1` FOREIGN KEY (`departement`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `localitestatanimal`
--
ALTER TABLE `localitestatanimal`
  ADD CONSTRAINT `localitestatanimal_ibfk_1` FOREIGN KEY (`fk_localite_name`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `localitestatanimal_ibfk_2` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `localitestatfarmer`
--
ALTER TABLE `localitestatfarmer`
  ADD CONSTRAINT `localitestatfarmer_ibfk_1` FOREIGN KEY (`fk_localite_name`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`langue`) REFERENCES `langue` (`libelle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`maladie`) REFERENCES `maladie` (`libelle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `national`
--
ALTER TABLE `national`
  ADD CONSTRAINT `national_ibfk_1` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_23` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_24` FOREIGN KEY (`type`) REFERENCES `typenotification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_25` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `regionstatanimal`
--
ALTER TABLE `regionstatanimal`
  ADD CONSTRAINT `regionstatanimal_ibfk_1` FOREIGN KEY (`fk_region_name`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `regionstatanimal_ibfk_2` FOREIGN KEY (`fk_animaltype`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `regionstatfarmer`
--
ALTER TABLE `regionstatfarmer`
  ADD CONSTRAINT `regionstatfarmer_ibfk_1` FOREIGN KEY (`fk_region_name`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roleusers` (`description`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_daral`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
