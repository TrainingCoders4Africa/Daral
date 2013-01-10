-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mer 09 Janvier 2013 à 23:59
-- Version du serveur: 5.5.16
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `daral`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `photo_left` varchar(100) NOT NULL,
  `photo_right` varchar(100) NOT NULL,
  `photo_front` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `animaltype`
--

CREATE TABLE IF NOT EXISTS `animaltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `categorie` (
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

CREATE TABLE IF NOT EXISTS `cheptel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  `isactive` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `daral`
--

CREATE TABLE IF NOT EXISTS `daral` (
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

CREATE TABLE IF NOT EXISTS `daralstatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_daral_name` varchar(30) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_daral_name` (`fk_daral_name`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `daralstatfarmer`
--

CREATE TABLE IF NOT EXISTS `daralstatfarmer` (
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

CREATE TABLE IF NOT EXISTS `departement` (
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

CREATE TABLE IF NOT EXISTS `departementstatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_departement_name` varchar(50) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departement_name` (`fk_departement_name`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `departementstatfarmer`
--

CREATE TABLE IF NOT EXISTS `departementstatfarmer` (
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

CREATE TABLE IF NOT EXISTS `farmer` (
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
  `id_localite` varchar(30) NOT NULL,
  PRIMARY KEY (`rank_farmer`),
  UNIQUE KEY `id_farmer` (`id_farmer`),
  KEY `categorie` (`categorie`,`daral_originel`,`daral_actuel`,`id_localite`),
  KEY `daral_originel` (`daral_originel`),
  KEY `daral_actuel` (`daral_actuel`),
  KEY `id_localite` (`id_localite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `farmer`
--

INSERT INTO `farmer` (`rank_farmer`, `id_farmer`, `categorie`, `national_id`, `address_farmer`, `phone_farmer`, `registration_date`, `daral_originel`, `daral_actuel`, `firstname_farmer`, `lastname_farmer`, `isactive_farmer`, `birthdate_farmer`, `birthplace_farmer`, `id_localite`) VALUES
(37, '10020001', 2, '1 237 3455 8888 9912', 'Matam', '221775312740', '2012-12-22', '1002', '1002', 'Adama', 'Diallo', 1, '1945-12-11', 'Poyong', 'Djilor'),
(38, '10020002', 1, '123666666666666666', 'liberte 1 n:1244', '221775312740', '2013-01-08', '1002', '1002', 'sada', 'sow', 0, '2013-01-08', 'dakar', 'Djilor');

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE IF NOT EXISTS `langue` (
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

CREATE TABLE IF NOT EXISTS `localite` (
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

CREATE TABLE IF NOT EXISTS `localitestatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_localite_name` varchar(50) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localite_name` (`fk_localite_name`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `localitestatfarmer`
--

CREATE TABLE IF NOT EXISTS `localitestatfarmer` (
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

CREATE TABLE IF NOT EXISTS `maladie` (
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

CREATE TABLE IF NOT EXISTS `media` (
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

CREATE TABLE IF NOT EXISTS `national` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_animal_type` (`fk_animal_type`),
  KEY `fk_animal_type_2` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmer` varchar(30) NOT NULL,
  `id_localite` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `disabled` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_farmer` (`id_farmer`,`id_localite`,`type`,`id_user`),
  KEY `id_localite` (`id_localite`),
  KEY `id_farmer_2` (`id_farmer`),
  KEY `id_user` (`id_user`),
  KEY `type` (`type`),
  KEY `type_2` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `notification`
--

INSERT INTO `notification` (`id`, `id_farmer`, `id_localite`, `date`, `type`, `id_user`, `disabled`) VALUES
(2, '10020001', 4, '2013-01-01 17:33:34', 1, 2, 1),
(3, '10020001', 4, '2013-01-01 17:44:46', 1, 2, 1),
(4, '10020001', 4, '2013-01-02 00:00:00', 1, 2, 0),
(5, '10020001', 4, '2013-01-04 00:00:00', 2, 2, 0),
(6, '10020001', 2, '2013-01-04 00:00:00', 3, 2, 0),
(7, '10020001', 4, '2013-01-05 00:00:00', 4, 2, 1),
(8, '10020001', 4, '2013-01-08 00:00:00', 3, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
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

CREATE TABLE IF NOT EXISTS `regionstatanimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_region_name` varchar(50) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_name` (`fk_region_name`,`fk_animal_type`),
  KEY `fk_region_name_2` (`fk_region_name`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `regionstatfarmer`
--

CREATE TABLE IF NOT EXISTS `regionstatfarmer` (
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

CREATE TABLE IF NOT EXISTS `roleusers` (
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

CREATE TABLE IF NOT EXISTS `typenotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `typenotification`
--

INSERT INTO `typenotification` (`id`, `libelle`, `description`) VALUES
(1, 'vol de vache', ''),
(2, 'epidemie de maladie de vache', ''),
(3, 'vol de chevaux', ''),
(4, 'vol de moutons', '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date_created`, `role`, `user_daral`) VALUES
(1, 'mansour', 'passer', '2012-12-04 00:00:00', 'admin', '1001'),
(2, 'sada', 'passer', '2012-12-05 00:00:00', 'admin', '1002'),
(3, 'amdane', 'passer', '2012-12-06 00:00:00', 'admin', '1003'),
(4, 'sokhna', 'passer', '2012-12-21 00:00:00', 'admin', '1004'),
(5, 'gerant', 'passer', '2013-01-09 00:00:00', 'gerant', '1001');

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

CREATE TABLE IF NOT EXISTS `veterinaire` (
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
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cheptel`
--
ALTER TABLE `cheptel`
  ADD CONSTRAINT `cheptel_ibfk_1` FOREIGN KEY (`fk_id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cheptel_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `daralstatanimal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `departementstatanimal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departementstatfarmer`
--
ALTER TABLE `departementstatfarmer`
  ADD CONSTRAINT `departementstatfarmer_ibfk_1` FOREIGN KEY (`fk_departement_name`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `farmer`
--
ALTER TABLE `farmer`
  ADD CONSTRAINT `farmer_ibfk_13` FOREIGN KEY (`daral_actuel`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `farmer_ibfk_14` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`),
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
  ADD CONSTRAINT `localitestatanimal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `national_ibfk_1` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_18` FOREIGN KEY (`id_farmer`) REFERENCES `farmer` (`id_farmer`),
  ADD CONSTRAINT `notification_ibfk_19` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`id`),
  ADD CONSTRAINT `notification_ibfk_20` FOREIGN KEY (`type`) REFERENCES `typenotification` (`id`),
  ADD CONSTRAINT `notification_ibfk_21` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `regionstatanimal`
--
ALTER TABLE `regionstatanimal`
  ADD CONSTRAINT `regionstatanimal_ibfk_1` FOREIGN KEY (`fk_region_name`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `regionstatanimal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animaltype` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
