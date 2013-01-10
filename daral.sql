-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 13 Décembre 2012 à 09:05
-- Version du serveur: 5.5.25
-- Version de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données: `daral`
--
CREATE DATABASE `daral` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `daral`;

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `photo_left` varchar(100) NOT NULL,
  `photo_right` varchar(100) NOT NULL,
  `photo_front` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `animal`
--

INSERT INTO `animal` (`id`, `fk_id_farmer`, `fk_animaltype`, `photo_left`, `photo_right`, `photo_front`) VALUES
(1, '10010025', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(2, '10010025', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(3, '10010025', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(4, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(5, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(6, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(7, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(8, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(9, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(10, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(11, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(12, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(13, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(14, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(15, '10010025', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(16, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(17, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(18, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(19, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(20, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(21, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(22, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(23, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(24, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(25, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(26, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(27, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(28, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(29, '10010001', 'Ndama', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE');

-- --------------------------------------------------------

--
-- Structure de la table `animaltype`
--

CREATE TABLE `animaltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `animaltype`
--

INSERT INTO `animaltype` (`id`, `name`) VALUES
(1, 'Cheval'),
(2, 'Ndama');

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
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `cheptel`
--

INSERT INTO `cheptel` (`id`, `fk_id_farmer`, `fk_animaltype`, `total_animaltype`) VALUES
(1, '10010025', 'Cheval', 3),
(2, '10010025', 'Ndama', 12),
(3, '10010001', 'Cheval', 5),
(4, '10010001', 'Ndama', 9);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
  `id_localite` varchar(50) NOT NULL,
  PRIMARY KEY (`rank_farmer`),
  UNIQUE KEY `id_farmer` (`id_farmer`),
  KEY `categorie` (`categorie`,`daral_originel`,`daral_actuel`,`id_localite`),
  KEY `daral_originel` (`daral_originel`),
  KEY `daral_actuel` (`daral_actuel`),
  KEY `id_localite` (`id_localite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `farmer`
--

INSERT INTO `farmer` (`rank_farmer`, `id_farmer`, `categorie`, `national_id`, `address_farmer`, `phone_farmer`, `registration_date`, `daral_originel`, `daral_actuel`, `firstname_farmer`, `lastname_farmer`, `isactive_farmer`, `birthdate_farmer`, `birthplace_farmer`, `id_localite`) VALUES
(1, '10010025', 1, '1 791 2010 00123', 'Sedhiou', '771234567890', '2012-12-05', '1001', '1002', 'Adama', 'Samb', 1, '2012-12-11', 'Podor, Matam', 'Djilor'),
(2, '10010001', 2, '1 7677 2333 444555', 'Kasse,Thies', '705432333', '2012-12-06', '1001', '1004', 'Bob', 'Marley', 1, '1900-12-05', 'Libreville', 'Passy'),
(3, '10010003', 2, '1 234 7100 00923', 'Kaolack,', '222222277', '2012-12-06', '1001', '1802', 'Amadou', 'Ba', 0, '1990-10-10', 'matam', 'Ndoffane'),
(6, '10010004', 2, '1 234 7100 01923', 'Joal', '99999000000', '2012-12-08', '1001', '1001', 'Omar', 'Seck', 0, '1999-11-29', 'matam', 'Diossong'),
(7, '10010005', 2, '1 234 7100 01923', 'Harlem', '775989808', '2012-12-08', '1001', '1001', 'John', 'Doe', 0, '2012-12-08', 'Alabama', 'Diossong'),
(8, '10010006', 1, '1 234 7100 01923', 'kingston', '775989808', '2012-12-08', '1001', '1001', 'Bob', 'Marley', 0, '2012-12-08', 'kingston', 'Diossong'),
(9, '10010007', 2, '1 234 7100 00923', 'London', '99999', '2012-12-08', '1001', '1001', 'John', 'Lenon', 0, '2012-12-08', 'pgo', 'Diossong'),
(10, '10010008', 2, '1 234 7100 00933', 'London', '775989808', '2012-12-08', '1001', '1001', 'Mansour', 'Fall', 1, '2012-12-08', 'pgo', 'Diossong'),
(11, '10010009', 1, '1 2345 7890', 'Matam', '77 588 67 78', '2012-12-12', '1001', '1001', 'Ousmane', 'Diallo', 1, '2012-12-12', 'Matam', 'Diossong'),
(12, '10010010', 2, '1 237 3455 8888 9900', 'Kounta', '77 345 6789', '2012-12-12', '1001', '1001', 'Djiby', 'Drame', 1, '2012-12-12', 'Kounta', 'Diossong');

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
  `region` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `departement` (`departement`,`region`),
  KEY `region` (`region`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `localite`
--

INSERT INTO `localite` (`id`, `name`, `departement`, `region`) VALUES
(1, 'Diossong', 'Foundiougne', 'Fatick'),
(2, 'Nioro Allassane Tall', 'Foundiougne', 'Fatick'),
(3, 'Ndiaffat', 'Matam', 'Matam'),
(4, 'Djilor', 'Foundiougne', 'Fatick'),
(5, 'Ndiedieng', 'Kaolack', 'Kaolack'),
(6, 'Ndoffane', 'Kaolack', 'Kaolack'),
(7, 'Passy', 'Foundiougne', 'Fatick');

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
  `id_farmer` varchar(30) NOT NULL,
  `id_localite` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(30) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_farmer` (`id_farmer`,`id_localite`,`type`,`id_user`),
  KEY `id_localite` (`id_localite`),
  KEY `id_farmer_2` (`id_farmer`),
  KEY `id_user` (`id_user`),
  KEY `type` (`type`),
  KEY `type_2` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
-- Structure de la table `type_notification`
--

CREATE TABLE `type_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `role` varchar(20) NOT NULL,
  `user_daral` varchar(30) NOT NULL COMMENT 'un admin s''attribue un daral et en fonction des besoins il peut modifier cette information',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role` (`role`,`user_daral`),
  KEY `user_daral` (`user_daral`),
  KEY `role_2` (`role`),
  KEY `user_daral_2` (`user_daral`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date_created`, `role`, `user_daral`) VALUES
(1, 'mansour', 'passer', '2012-12-04 00:00:00', 'admin', '1001'),
(2, 'sada', 'passer', '2012-12-05 00:00:00', 'admin', '1002'),
(3, 'amdane', 'passer', '2012-12-06 00:00:00', 'admin', '1003');

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
  ADD CONSTRAINT `farmer_ibfk_11` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_13` FOREIGN KEY (`daral_actuel`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_8` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`categorie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_9` FOREIGN KEY (`daral_originel`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `localite`
--
ALTER TABLE `localite`
  ADD CONSTRAINT `localite_ibfk_1` FOREIGN KEY (`departement`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `localite_ibfk_2` FOREIGN KEY (`region`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`type`) REFERENCES `type_notification` (`libelle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

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
