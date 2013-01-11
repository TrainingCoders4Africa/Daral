-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 11 Janvier 2013 à 11:01
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
  `animal_id` varchar(13) NOT NULL,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animaltype` varchar(30) NOT NULL,
  `photo_left` varchar(100) NOT NULL,
  `photo_right` varchar(100) NOT NULL,
  `photo_front` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `animal_id` (`animal_id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animaltype`),
  KEY `fk_animaltype` (`fk_animaltype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Contenu de la table `farmer`
--

INSERT INTO `farmer` (`rank_farmer`, `id_farmer`, `categorie`, `national_id`, `address_farmer`, `phone_farmer`, `registration_date`, `daral_originel`, `daral_actuel`, `firstname_farmer`, `lastname_farmer`, `isactive_farmer`, `birthdate_farmer`, `birthplace_farmer`, `id_localite`, `departement`, `region`) VALUES
(40, '10010001', 2, '1209812347788', 'Matam', '775989808', '2013-01-11', '1001', '1802', 'Adama', 'Tounkara', 1, '1967-01-01', 'Matam', 'Ndoffane', 'Kaolack', 'Kaolack');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
  ADD CONSTRAINT `notification_ibfk_25` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_22` FOREIGN KEY (`id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_23` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_24` FOREIGN KEY (`type`) REFERENCES `typenotification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
--
-- Base de données: `daral_09_01_13`
--
CREATE DATABASE `daral_09_01_13` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `daral_09_01_13`;

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_farmer` varchar(30) NOT NULL,
  `fk_animal_type` varchar(30) NOT NULL,
  `photo_left` varchar(100) NOT NULL,
  `photo_right` varchar(100) NOT NULL,
  `photo_front` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=160 ;

--
-- Contenu de la table `animal`
--

INSERT INTO `animal` (`id`, `fk_id_farmer`, `fk_animal_type`, `photo_left`, `photo_right`, `photo_front`) VALUES
(1, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(2, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(3, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(4, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(5, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(6, '10010002', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(7, '10010002', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(8, '10010003', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(9, '10010003', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(10, '10010003', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(11, '10010002', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(12, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(13, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(14, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(15, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(16, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(17, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(18, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(19, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(20, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(21, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(22, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(23, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(24, '10010004', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(25, '10010004', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(26, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(27, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(28, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(29, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(30, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(31, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(32, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(33, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(34, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(35, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(36, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(37, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(38, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(39, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(40, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(41, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(42, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(43, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(44, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(45, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(46, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(47, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(48, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(49, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(50, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(51, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(52, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(53, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(54, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(55, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(56, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(57, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(58, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(59, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(60, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(61, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(62, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(63, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(64, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(65, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(66, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(67, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(68, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(69, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(70, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(71, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(72, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(73, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(74, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(75, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(76, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(77, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(78, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(79, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(80, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(81, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(82, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(83, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(84, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(85, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(86, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(87, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(88, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(89, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(90, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(91, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(92, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(93, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(94, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(95, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(96, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(97, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(98, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(99, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(100, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(101, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(102, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(103, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(104, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(105, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(106, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(107, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(108, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(109, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(110, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(111, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(112, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(113, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(114, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(115, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(116, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(117, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(118, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(119, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(120, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(121, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(122, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(123, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(124, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(125, '10010005', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(126, '10010002', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(127, '10010002', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(128, '10010002', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(129, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(130, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(131, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(132, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(133, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(134, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(135, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(136, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(137, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(138, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(139, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(140, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(141, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(142, '10010003', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(143, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(144, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(145, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(146, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(147, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(148, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(149, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(150, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(151, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(152, '10010006', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(153, '10010006', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(154, '10010006', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(155, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(156, '10010001', 'Boeuf', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(157, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(158, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE'),
(159, '10010001', 'Cheval', 'VUE GAUCHE', 'VUE DROITE', 'VUE FACE');

-- --------------------------------------------------------

--
-- Structure de la table `animal_type`
--

CREATE TABLE `animal_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `animal_type`
--

INSERT INTO `animal_type` (`id`, `name`) VALUES
(2, 'Boeuf'),
(1, 'Cheval');

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
  `fk_animal_type` varchar(30) NOT NULL,
  `total_animal_type` int(11) NOT NULL,
  `isactive` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_farmer` (`fk_id_farmer`,`fk_animal_type`),
  KEY `fk_animal_type` (`fk_animal_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `cheptel`
--

INSERT INTO `cheptel` (`id`, `fk_id_farmer`, `fk_animal_type`, `total_animal_type`, `isactive`) VALUES
(1, '10010001', 'Boeuf', 20, 1),
(2, '10010002', 'Cheval', 2, 1),
(3, '10010003', 'Boeuf', 3, 1),
(4, '10010002', 'Boeuf', 4, 1),
(5, '10010003', 'Cheval', 15, 1),
(6, '10010001', 'Cheval', 10, 1),
(7, '10010004', 'Cheval', 2, 1),
(8, '10010005', 'Boeuf', 100, 1),
(9, '10010006', 'Boeuf', 2, 0),
(10, '10010006', 'Cheval', 1, 0);

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
-- Structure de la table `daral_stat_animal`
--

CREATE TABLE `daral_stat_animal` (
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
-- Structure de la table `daral_stat_farmer`
--

CREATE TABLE `daral_stat_farmer` (
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
-- Structure de la table `departement_stat_animal`
--

CREATE TABLE `departement_stat_animal` (
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
-- Structure de la table `departement_stat_farmer`
--

CREATE TABLE `departement_stat_farmer` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `farmer`
--

INSERT INTO `farmer` (`rank_farmer`, `id_farmer`, `categorie`, `national_id`, `address_farmer`, `phone_farmer`, `registration_date`, `daral_originel`, `daral_actuel`, `firstname_farmer`, `lastname_farmer`, `isactive_farmer`, `birthdate_farmer`, `birthplace_farmer`, `id_localite`) VALUES
(1, '10010001', 2, '1 234 7123 00923', 'Podor', '775989808', '2013-01-05', '1001', '1001', 'Adama', 'Tounkara', 1, '1978-01-04', 'podor', 'Diossong'),
(2, '10010002', 1, '1 234 7100 01923 34', 'Podor', '775989808', '2013-01-05', '1001', '1001', 'Pape', 'Adama', 1, '1956-12-06', 'Podor', 'Diossong'),
(3, '10010003', 1, '1 234 7100 00923', 'Thies', '777756654', '2013-01-08', '1001', '1001', 'Baba', 'Thiam', 1, '1967-07-08', 'Passi', 'Diossong'),
(4, '10010004', 2, '1209812347788', 'Dakar', '775989808', '2013-01-09', '1001', '1001', 'Birame', 'Diop', 1, '1961-12-01', 'Dakar', 'Diossong'),
(5, '10010005', 2, '1209812347789', 'Matam', '775989808', '2013-01-09', '1001', '1001', 'Assane', 'Cisse', 1, '1930-05-01', 'Matam', 'Diossong'),
(6, '10010006', 2, '1209812347798', 'Dakar', '775989808', '2013-01-09', '1001', '1001', 'Demba', 'Diop', 1, '1986-09-07', 'Dakar', 'Diossong'),
(7, '10010007', 2, '1234567891123', 'Thies', '77 6666 99', '2013-01-09', '1001', '1001', 'Baba', 'Kante', 1, '1945-04-01', 'Thies', 'Diossong');

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
-- Structure de la table `localite_stat_animal`
--

CREATE TABLE `localite_stat_animal` (
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
-- Structure de la table `localite_stat_farmer`
--

CREATE TABLE `localite_stat_farmer` (
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
-- Structure de la table `region_stat_animal`
--

CREATE TABLE `region_stat_animal` (
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
-- Structure de la table `region_stat_farmer`
--

CREATE TABLE `region_stat_farmer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_region_name` varchar(50) NOT NULL,
  `total_farmer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_name` (`fk_region_name`),
  KEY `fk_region_name_2` (`fk_region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `role_users`
--

CREATE TABLE `role_users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL COMMENT 'valeur = admin ou gerant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `role_users`
--

INSERT INTO `role_users` (`id`, `description`) VALUES
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
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cheptel`
--
ALTER TABLE `cheptel`
  ADD CONSTRAINT `cheptel_ibfk_1` FOREIGN KEY (`fk_id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cheptel_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `daral`
--
ALTER TABLE `daral`
  ADD CONSTRAINT `daral_ibfk_3` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `daral_stat_animal`
--
ALTER TABLE `daral_stat_animal`
  ADD CONSTRAINT `daral_stat_animal_ibfk_1` FOREIGN KEY (`fk_daral_name`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `daral_stat_animal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `daral_stat_farmer`
--
ALTER TABLE `daral_stat_farmer`
  ADD CONSTRAINT `daral_stat_farmer_ibfk_1` FOREIGN KEY (`fk_daral_name`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departement_stat_animal`
--
ALTER TABLE `departement_stat_animal`
  ADD CONSTRAINT `departement_stat_animal_ibfk_1` FOREIGN KEY (`fk_departement_name`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departement_stat_animal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departement_stat_farmer`
--
ALTER TABLE `departement_stat_farmer`
  ADD CONSTRAINT `departement_stat_farmer_ibfk_1` FOREIGN KEY (`fk_departement_name`) REFERENCES `departement` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Contraintes pour la table `localite_stat_animal`
--
ALTER TABLE `localite_stat_animal`
  ADD CONSTRAINT `localite_stat_animal_ibfk_1` FOREIGN KEY (`fk_localite_name`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `localite_stat_animal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `localite_stat_farmer`
--
ALTER TABLE `localite_stat_farmer`
  ADD CONSTRAINT `localite_stat_farmer_ibfk_1` FOREIGN KEY (`fk_localite_name`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `national_ibfk_1` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_farmer`) REFERENCES `farmer` (`id_farmer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`type`) REFERENCES `type_notification` (`libelle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `region_stat_animal`
--
ALTER TABLE `region_stat_animal`
  ADD CONSTRAINT `region_stat_animal_ibfk_1` FOREIGN KEY (`fk_region_name`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `region_stat_animal_ibfk_2` FOREIGN KEY (`fk_animal_type`) REFERENCES `animal_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `region_stat_farmer`
--
ALTER TABLE `region_stat_farmer`
  ADD CONSTRAINT `region_stat_farmer_ibfk_1` FOREIGN KEY (`fk_region_name`) REFERENCES `region` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role_users` (`description`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_daral`) REFERENCES `daral` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données: `dbuser`
--
CREATE DATABASE `dbuser` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbuser`;
--
-- Base de données: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Structure de la table `CHARACTER_SETS`
--

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2),
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3),
('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1),
('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('utf8mb4', 'utf8mb4_general_ci', 'UTF-8 Unicode', 4),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('utf16', 'utf16_general_ci', 'UTF-16 Unicode', 4),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('utf32', 'utf32_general_ci', 'UTF-32 Unicode', 4),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1),
('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2),
('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

--
-- Structure de la table `COLLATIONS`
--

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1),
('big5_bin', 'big5', 84, '', 'Yes', 1),
('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1),
('dec8_bin', 'dec8', 69, '', 'Yes', 1),
('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1),
('cp850_bin', 'cp850', 80, '', 'Yes', 1),
('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1),
('hp8_bin', 'hp8', 72, '', 'Yes', 1),
('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1),
('koi8r_bin', 'koi8r', 74, '', 'Yes', 1),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4),
('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1),
('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1),
('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1),
('latin2_bin', 'latin2', 77, '', 'Yes', 1),
('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1),
('swe7_bin', 'swe7', 82, '', 'Yes', 1),
('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1),
('ascii_bin', 'ascii', 65, '', 'Yes', 1),
('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1),
('ujis_bin', 'ujis', 91, '', 'Yes', 1),
('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1),
('sjis_bin', 'sjis', 88, '', 'Yes', 1),
('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1),
('hebrew_bin', 'hebrew', 71, '', 'Yes', 1),
('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4),
('tis620_bin', 'tis620', 89, '', 'Yes', 1),
('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1),
('euckr_bin', 'euckr', 85, '', 'Yes', 1),
('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1),
('koi8u_bin', 'koi8u', 75, '', 'Yes', 1),
('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1),
('gb2312_bin', 'gb2312', 86, '', 'Yes', 1),
('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1),
('greek_bin', 'greek', 70, '', 'Yes', 1),
('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1),
('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2),
('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1),
('cp1250_bin', 'cp1250', 66, '', 'Yes', 1),
('cp1250_polish_ci', 'cp1250', 99, '', 'Yes', 1),
('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1),
('gbk_bin', 'gbk', 87, '', 'Yes', 1),
('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1),
('latin5_bin', 'latin5', 78, '', 'Yes', 1),
('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1),
('armscii8_bin', 'armscii8', 64, '', 'Yes', 1),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('utf8_sinhala_ci', 'utf8', 211, '', 'Yes', 8),
('utf8_general_mysql500_ci', 'utf8', 223, '', 'Yes', 1),
('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1),
('ucs2_bin', 'ucs2', 90, '', 'Yes', 1),
('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8),
('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8),
('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8),
('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8),
('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8),
('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8),
('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8),
('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8),
('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8),
('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8),
('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8),
('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8),
('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8),
('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8),
('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8),
('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8),
('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8),
('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8),
('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8),
('ucs2_sinhala_ci', 'ucs2', 147, '', 'Yes', 8),
('ucs2_general_mysql500_ci', 'ucs2', 159, '', 'Yes', 1),
('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1),
('cp866_bin', 'cp866', 68, '', 'Yes', 1),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1),
('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1),
('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1),
('macce_bin', 'macce', 43, '', 'Yes', 1),
('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1),
('macroman_bin', 'macroman', 53, '', 'Yes', 1),
('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1),
('cp852_bin', 'cp852', 81, '', 'Yes', 1),
('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1),
('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1),
('latin7_general_cs', 'latin7', 42, '', 'Yes', 1),
('latin7_bin', 'latin7', 79, '', 'Yes', 1),
('utf8mb4_general_ci', 'utf8mb4', 45, 'Yes', 'Yes', 1),
('utf8mb4_bin', 'utf8mb4', 46, '', 'Yes', 1),
('utf8mb4_unicode_ci', 'utf8mb4', 224, '', 'Yes', 8),
('utf8mb4_icelandic_ci', 'utf8mb4', 225, '', 'Yes', 8),
('utf8mb4_latvian_ci', 'utf8mb4', 226, '', 'Yes', 8),
('utf8mb4_romanian_ci', 'utf8mb4', 227, '', 'Yes', 8),
('utf8mb4_slovenian_ci', 'utf8mb4', 228, '', 'Yes', 8),
('utf8mb4_polish_ci', 'utf8mb4', 229, '', 'Yes', 8),
('utf8mb4_estonian_ci', 'utf8mb4', 230, '', 'Yes', 8),
('utf8mb4_spanish_ci', 'utf8mb4', 231, '', 'Yes', 8),
('utf8mb4_swedish_ci', 'utf8mb4', 232, '', 'Yes', 8),
('utf8mb4_turkish_ci', 'utf8mb4', 233, '', 'Yes', 8),
('utf8mb4_czech_ci', 'utf8mb4', 234, '', 'Yes', 8),
('utf8mb4_danish_ci', 'utf8mb4', 235, '', 'Yes', 8),
('utf8mb4_lithuanian_ci', 'utf8mb4', 236, '', 'Yes', 8),
('utf8mb4_slovak_ci', 'utf8mb4', 237, '', 'Yes', 8),
('utf8mb4_spanish2_ci', 'utf8mb4', 238, '', 'Yes', 8),
('utf8mb4_roman_ci', 'utf8mb4', 239, '', 'Yes', 8),
('utf8mb4_persian_ci', 'utf8mb4', 240, '', 'Yes', 8),
('utf8mb4_esperanto_ci', 'utf8mb4', 241, '', 'Yes', 8),
('utf8mb4_hungarian_ci', 'utf8mb4', 242, '', 'Yes', 8),
('utf8mb4_sinhala_ci', 'utf8mb4', 243, '', 'Yes', 8),
('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1),
('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1),
('cp1251_bin', 'cp1251', 50, '', 'Yes', 1),
('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1),
('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1),
('utf16_general_ci', 'utf16', 54, 'Yes', 'Yes', 1),
('utf16_bin', 'utf16', 55, '', 'Yes', 1),
('utf16_unicode_ci', 'utf16', 101, '', 'Yes', 8),
('utf16_icelandic_ci', 'utf16', 102, '', 'Yes', 8),
('utf16_latvian_ci', 'utf16', 103, '', 'Yes', 8),
('utf16_romanian_ci', 'utf16', 104, '', 'Yes', 8),
('utf16_slovenian_ci', 'utf16', 105, '', 'Yes', 8),
('utf16_polish_ci', 'utf16', 106, '', 'Yes', 8),
('utf16_estonian_ci', 'utf16', 107, '', 'Yes', 8),
('utf16_spanish_ci', 'utf16', 108, '', 'Yes', 8),
('utf16_swedish_ci', 'utf16', 109, '', 'Yes', 8),
('utf16_turkish_ci', 'utf16', 110, '', 'Yes', 8),
('utf16_czech_ci', 'utf16', 111, '', 'Yes', 8),
('utf16_danish_ci', 'utf16', 112, '', 'Yes', 8),
('utf16_lithuanian_ci', 'utf16', 113, '', 'Yes', 8),
('utf16_slovak_ci', 'utf16', 114, '', 'Yes', 8),
('utf16_spanish2_ci', 'utf16', 115, '', 'Yes', 8),
('utf16_roman_ci', 'utf16', 116, '', 'Yes', 8),
('utf16_persian_ci', 'utf16', 117, '', 'Yes', 8),
('utf16_esperanto_ci', 'utf16', 118, '', 'Yes', 8),
('utf16_hungarian_ci', 'utf16', 119, '', 'Yes', 8),
('utf16_sinhala_ci', 'utf16', 120, '', 'Yes', 8),
('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1),
('cp1256_bin', 'cp1256', 67, '', 'Yes', 1),
('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1),
('cp1257_bin', 'cp1257', 58, '', 'Yes', 1),
('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1),
('utf32_general_ci', 'utf32', 60, 'Yes', 'Yes', 1),
('utf32_bin', 'utf32', 61, '', 'Yes', 1),
('utf32_unicode_ci', 'utf32', 160, '', 'Yes', 8),
('utf32_icelandic_ci', 'utf32', 161, '', 'Yes', 8),
('utf32_latvian_ci', 'utf32', 162, '', 'Yes', 8),
('utf32_romanian_ci', 'utf32', 163, '', 'Yes', 8),
('utf32_slovenian_ci', 'utf32', 164, '', 'Yes', 8),
('utf32_polish_ci', 'utf32', 165, '', 'Yes', 8),
('utf32_estonian_ci', 'utf32', 166, '', 'Yes', 8),
('utf32_spanish_ci', 'utf32', 167, '', 'Yes', 8),
('utf32_swedish_ci', 'utf32', 168, '', 'Yes', 8),
('utf32_turkish_ci', 'utf32', 169, '', 'Yes', 8),
('utf32_czech_ci', 'utf32', 170, '', 'Yes', 8),
('utf32_danish_ci', 'utf32', 171, '', 'Yes', 8),
('utf32_lithuanian_ci', 'utf32', 172, '', 'Yes', 8),
('utf32_slovak_ci', 'utf32', 173, '', 'Yes', 8),
('utf32_spanish2_ci', 'utf32', 174, '', 'Yes', 8),
('utf32_roman_ci', 'utf32', 175, '', 'Yes', 8),
('utf32_persian_ci', 'utf32', 176, '', 'Yes', 8),
('utf32_esperanto_ci', 'utf32', 177, '', 'Yes', 8),
('utf32_hungarian_ci', 'utf32', 178, '', 'Yes', 8),
('utf32_sinhala_ci', 'utf32', 179, '', 'Yes', 8),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1),
('geostd8_bin', 'geostd8', 93, '', 'Yes', 1),
('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1),
('cp932_bin', 'cp932', 96, '', 'Yes', 1),
('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1),
('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

--
-- Structure de la table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('big5_chinese_ci', 'big5'),
('big5_bin', 'big5'),
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_czech_cs', 'latin2'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('ujis_japanese_ci', 'ujis'),
('ujis_bin', 'ujis'),
('sjis_japanese_ci', 'sjis'),
('sjis_bin', 'sjis'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('tis620_thai_ci', 'tis620'),
('tis620_bin', 'tis620'),
('euckr_korean_ci', 'euckr'),
('euckr_bin', 'euckr'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('gb2312_chinese_ci', 'gb2312'),
('gb2312_bin', 'gb2312'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_czech_cs', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('cp1250_polish_ci', 'cp1250'),
('gbk_chinese_ci', 'gbk'),
('gbk_bin', 'gbk'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('utf8_sinhala_ci', 'utf8'),
('utf8_general_mysql500_ci', 'utf8'),
('ucs2_general_ci', 'ucs2'),
('ucs2_bin', 'ucs2'),
('ucs2_unicode_ci', 'ucs2'),
('ucs2_icelandic_ci', 'ucs2'),
('ucs2_latvian_ci', 'ucs2'),
('ucs2_romanian_ci', 'ucs2'),
('ucs2_slovenian_ci', 'ucs2'),
('ucs2_polish_ci', 'ucs2'),
('ucs2_estonian_ci', 'ucs2'),
('ucs2_spanish_ci', 'ucs2'),
('ucs2_swedish_ci', 'ucs2'),
('ucs2_turkish_ci', 'ucs2'),
('ucs2_czech_ci', 'ucs2'),
('ucs2_danish_ci', 'ucs2'),
('ucs2_lithuanian_ci', 'ucs2'),
('ucs2_slovak_ci', 'ucs2'),
('ucs2_spanish2_ci', 'ucs2'),
('ucs2_roman_ci', 'ucs2'),
('ucs2_persian_ci', 'ucs2'),
('ucs2_esperanto_ci', 'ucs2'),
('ucs2_hungarian_ci', 'ucs2'),
('ucs2_sinhala_ci', 'ucs2'),
('ucs2_general_mysql500_ci', 'ucs2'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('utf8mb4_general_ci', 'utf8mb4'),
('utf8mb4_bin', 'utf8mb4'),
('utf8mb4_unicode_ci', 'utf8mb4'),
('utf8mb4_icelandic_ci', 'utf8mb4'),
('utf8mb4_latvian_ci', 'utf8mb4'),
('utf8mb4_romanian_ci', 'utf8mb4'),
('utf8mb4_slovenian_ci', 'utf8mb4'),
('utf8mb4_polish_ci', 'utf8mb4'),
('utf8mb4_estonian_ci', 'utf8mb4'),
('utf8mb4_spanish_ci', 'utf8mb4'),
('utf8mb4_swedish_ci', 'utf8mb4'),
('utf8mb4_turkish_ci', 'utf8mb4'),
('utf8mb4_czech_ci', 'utf8mb4'),
('utf8mb4_danish_ci', 'utf8mb4'),
('utf8mb4_lithuanian_ci', 'utf8mb4'),
('utf8mb4_slovak_ci', 'utf8mb4'),
('utf8mb4_spanish2_ci', 'utf8mb4'),
('utf8mb4_roman_ci', 'utf8mb4'),
('utf8mb4_persian_ci', 'utf8mb4'),
('utf8mb4_esperanto_ci', 'utf8mb4'),
('utf8mb4_hungarian_ci', 'utf8mb4'),
('utf8mb4_sinhala_ci', 'utf8mb4'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('utf16_general_ci', 'utf16'),
('utf16_bin', 'utf16'),
('utf16_unicode_ci', 'utf16'),
('utf16_icelandic_ci', 'utf16'),
('utf16_latvian_ci', 'utf16'),
('utf16_romanian_ci', 'utf16'),
('utf16_slovenian_ci', 'utf16'),
('utf16_polish_ci', 'utf16'),
('utf16_estonian_ci', 'utf16'),
('utf16_spanish_ci', 'utf16'),
('utf16_swedish_ci', 'utf16'),
('utf16_turkish_ci', 'utf16'),
('utf16_czech_ci', 'utf16'),
('utf16_danish_ci', 'utf16'),
('utf16_lithuanian_ci', 'utf16'),
('utf16_slovak_ci', 'utf16'),
('utf16_spanish2_ci', 'utf16'),
('utf16_roman_ci', 'utf16'),
('utf16_persian_ci', 'utf16'),
('utf16_esperanto_ci', 'utf16'),
('utf16_hungarian_ci', 'utf16'),
('utf16_sinhala_ci', 'utf16'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('utf32_general_ci', 'utf32'),
('utf32_bin', 'utf32'),
('utf32_unicode_ci', 'utf32'),
('utf32_icelandic_ci', 'utf32'),
('utf32_latvian_ci', 'utf32'),
('utf32_romanian_ci', 'utf32'),
('utf32_slovenian_ci', 'utf32'),
('utf32_polish_ci', 'utf32'),
('utf32_estonian_ci', 'utf32'),
('utf32_spanish_ci', 'utf32'),
('utf32_swedish_ci', 'utf32'),
('utf32_turkish_ci', 'utf32'),
('utf32_czech_ci', 'utf32'),
('utf32_danish_ci', 'utf32'),
('utf32_lithuanian_ci', 'utf32'),
('utf32_slovak_ci', 'utf32'),
('utf32_spanish2_ci', 'utf32'),
('utf32_roman_ci', 'utf32'),
('utf32_persian_ci', 'utf32'),
('utf32_esperanto_ci', 'utf32'),
('utf32_hungarian_ci', 'utf32'),
('utf32_sinhala_ci', 'utf32'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8'),
('cp932_japanese_ci', 'cp932'),
('cp932_bin', 'cp932'),
('eucjpms_japanese_ci', 'eucjpms'),
('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

--
-- Structure de la table `COLUMNS`
--

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(27)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'ENGINE', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'SUPPORT', 2, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'COMMENT', 3, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'TRANSACTIONS', 4, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'XA', 5, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'SAVEPOINTS', 6, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_CATALOG', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'DEFINER', 4, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'TIME_ZONE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_BODY', 6, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_DEFINITION', 7, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_TYPE', 8, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EXECUTE_AT', 9, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'INTERVAL_VALUE', 10, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'INTERVAL_FIELD', 11, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'SQL_MODE', 12, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'STARTS', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ENDS', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'STATUS', 15, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ON_COMPLETION', 16, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'CREATED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'LAST_ALTERED', 18, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'LAST_EXECUTED', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_COMMENT', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ORIGINATOR', 21, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'CHARACTER_SET_CLIENT', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'COLLATION_CONNECTION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'DATABASE_COLLATION', 24, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_NAME', 2, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_TYPE', 3, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLESPACE_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_CATALOG', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_SCHEMA', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_NAME', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LOGFILE_GROUP_NAME', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LOGFILE_GROUP_NUMBER', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'ENGINE', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FULLTEXT_KEYS', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DELETED_ROWS', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'UPDATE_COUNT', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FREE_EXTENTS', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TOTAL_EXTENTS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'EXTENT_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'INITIAL_SIZE', 17, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'MAXIMUM_SIZE', 18, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'AUTOEXTEND_SIZE', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CREATION_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LAST_UPDATE_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LAST_ACCESS_TIME', 22, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'RECOVER_TIME', 23, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TRANSACTION_COUNTER', 24, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'VERSION', 25, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'ROW_FORMAT', 26, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_ROWS', 27, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'AVG_ROW_LENGTH', 28, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DATA_LENGTH', 29, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'MAX_DATA_LENGTH', 30, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'INDEX_LENGTH', 31, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DATA_FREE', 32, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CREATE_TIME', 33, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'UPDATE_TIME', 34, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CHECK_TIME', 35, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CHECKSUM', 36, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'STATUS', 37, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'EXTRA', 38, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'ORDINAL_POSITION', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'PARAMETER_MODE', 5, NULL, 'YES', 'varchar', 5, 15, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(5)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'PARAMETER_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'DATA_TYPE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_MAXIMUM_LENGTH', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_OCTET_LENGTH', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'NUMERIC_PRECISION', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'NUMERIC_SCALE', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_SET_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'COLLATION_NAME', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'DTD_IDENTIFIER', 14, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'ROUTINE_TYPE', 15, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_NAME', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_ORDINAL_POSITION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_ORDINAL_POSITION', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_METHOD', 8, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_METHOD', 9, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_EXPRESSION', 10, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_EXPRESSION', 11, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_DESCRIPTION', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_ROWS', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'AVG_ROW_LENGTH', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'DATA_LENGTH', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'MAX_DATA_LENGTH', 16, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'INDEX_LENGTH', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'DATA_FREE', 18, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CREATE_TIME', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'UPDATE_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CHECK_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CHECKSUM', 22, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_COMMENT', 23, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'NODEGROUP', 24, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLESPACE_NAME', 25, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_VERSION', 2, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_STATUS', 3, '', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_TYPE', 4, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_TYPE_VERSION', 5, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY_VERSION', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_AUTHOR', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_DESCRIPTION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LICENSE', 10, NULL, 'YES', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'LOAD_OPTION', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'USER', 2, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'HOST', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'DB', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'COMMAND', 5, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'TIME', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(7)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'STATE', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'INFO', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_CATALOG', 4, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'MATCH_OPTION', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UPDATE_RULE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'DELETE_RULE', 9, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'TABLE_NAME', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'REFERENCED_TABLE_NAME', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DATA_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_MAXIMUM_LENGTH', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_OCTET_LENGTH', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'NUMERIC_PRECISION', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'NUMERIC_SCALE', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_SET_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'COLLATION_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 13, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 14, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 15, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 16, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 17, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 18, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 19, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_PATH', 21, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 22, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CREATED', 23, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'LAST_ALTERED', 24, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_MODE', 25, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 26, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DEFINER', 27, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_SET_CLIENT', 28, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'COLLATION_CONNECTION', 29, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DATABASE_COLLATION', 30, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_COMMENT', 16, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 2048, 6144, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(2048)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'ENGINE', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_TYPE', 3, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'LOGFILE_GROUP_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'EXTENT_SIZE', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'AUTOEXTEND_SIZE', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'MAXIMUM_SIZE', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'NODEGROUP_ID', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_COMMENT', 9, NULL, 'YES', 'varchar', 2048, 6144, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(2048)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'DEFINER', 19, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'CHARACTER_SET_CLIENT', 20, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'COLLATION_CONNECTION', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'DATABASE_COLLATION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'CHARACTER_SET_CLIENT', 9, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'COLLATION_CONNECTION', 10, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_ops', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_ops_ok', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_time', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'uncompress_ops', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'uncompress_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_id', 1, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_state', 2, '', 'NO', 'varchar', 13, 39, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(13)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_started', 3, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_requested_lock_id', 4, NULL, 'YES', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_wait_started', 5, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_weight', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_mysql_thread_id', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_query', 8, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_operation_state', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_tables_in_use', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_tables_locked', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_lock_structs', 12, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_lock_memory_bytes', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_rows_locked', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_rows_modified', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_concurrency_tickets', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_isolation_level', 17, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_unique_checks', 18, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_foreign_key_checks', 19, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_last_foreign_key_error', 20, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_adaptive_hash_latched', 21, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_adaptive_hash_timeout', 22, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'buffer_pool_instance', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'pages_used', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'pages_free', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'relocation_ops', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'relocation_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'requesting_trx_id', 1, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'requested_lock_id', 2, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'blocking_trx_id', 3, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'blocking_lock_id', 4, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'buffer_pool_instance', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'pages_used', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'pages_free', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'relocation_ops', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'relocation_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_ops', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_ops_ok', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_time', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'uncompress_ops', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'uncompress_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_id', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_trx_id', 2, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_mode', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_type', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_table', 5, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_index', 6, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_space', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_page', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_rec', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_data', 10, NULL, 'YES', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'daral', 'animal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'animal', 'animal_id', 2, NULL, 'NO', 'varchar', 13, 13, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(13)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'animal', 'fk_id_farmer', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'animal', 'fk_animaltype', 4, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'animal', 'photo_left', 5, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'animal', 'photo_right', 6, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'animal', 'photo_front', 7, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'animaltype', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'animaltype', 'name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'animaltype', 'animal_tag', 3, NULL, 'NO', 'char', 1, 1, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(1)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'categorie', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'categorie', 'categorie_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'categorie', 'max_animal', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'cheptel', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'cheptel', 'fk_id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'cheptel', 'fk_animaltype', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'cheptel', 'total_animaltype', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'cheptel', 'isactive', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'daral', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'daral', 'id_localite', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'daral', 'name', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', 'ex: 0102'),
('def', 'daral', 'daralstatanimal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'daralstatanimal', 'fk_daral_name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'daralstatanimal', 'fk_animaltype', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'daralstatanimal', 'total_animaltype', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'daralstatfarmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'daralstatfarmer', 'fk_daral_name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'daralstatfarmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'departement', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'departement', 'name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'departement', 'region', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatanimal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatanimal', 'fk_departement_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatanimal', 'fk_animaltype', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatanimal', 'total_animaltype', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatfarmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatfarmer', 'fk_departement_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'departementstatfarmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'rank_farmer', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'categorie', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'national_id', 4, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'address_farmer', 5, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'phone_farmer', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'registration_date', 7, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'daral_originel', 8, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'daral_actuel', 9, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'firstname_farmer', 10, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'lastname_farmer', 11, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'isactive_farmer', 12, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'birthdate_farmer', 13, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'birthplace_farmer', 14, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'farmer', 'id_localite', 15, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', 'localite du daral d''appartenance (daral actuel) de l''eleveur'),
('def', 'daral', 'farmer', 'departement', 16, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', 'Departement du daral d''appartenance (daral actuel) de l''eleveur'),
('def', 'daral', 'farmer', 'region', 17, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', 'region du daral d''appartenance (daral actuel) de l''eleveur'),
('def', 'daral', 'langue', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'langue', 'libelle', 2, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'langue', 'pays', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'localite', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'localite', 'name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'localite', 'departement', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatanimal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatanimal', 'fk_localite_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatanimal', 'fk_animaltype', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatanimal', 'total_animaltype', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatfarmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatfarmer', 'fk_localite_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'localitestatfarmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'maladie', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'maladie', 'libelle', 2, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'maladie', 'symptomes', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'maladie', 'type', 4, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'maladie', 'vaccin', 5, NULL, 'NO', 'varchar', 200, 200, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'media', 'id_media', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'media', 'titre', 2, NULL, 'NO', 'varchar', 250, 250, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'media', 'langue', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'media', 'date_insertion', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'media', 'lien', 5, NULL, 'NO', 'varchar', 250, 250, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'media', 'maladie', 6, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'national', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'national', 'fk_animaltype', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'national', 'total_animaltype', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'id_localite', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'date', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'type', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'id_user', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'notification', 'disabled', 7, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'region', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'region', 'name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatanimal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatanimal', 'fk_region_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatanimal', 'fk_animaltype', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatanimal', 'total_animaltype', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatfarmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatfarmer', 'fk_region_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'regionstatfarmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'roleusers', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'roleusers', 'description', 2, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', 'UNI', '', 'select,insert,update,references', 'valeur = admin ou gerant'),
('def', 'daral', 'typenotification', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'typenotification', 'libelle', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'typenotification', 'description', 3, '', 'NO', 'varchar', 300, 300, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(300)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'users', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'users', 'username', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_general_cs', 'varchar(50)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral', 'users', 'password', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_general_cs', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'users', 'date_created', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'users', 'role', 5, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'users', 'user_daral', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', 'un admin s''attribue un daral et en fonction des besoins il peut modifier cette information'),
('def', 'daral', 'veterinaire', 'rank_veterinaire', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'id_veterinaire', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'adresse_veterinaire', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'localite_veterinaire', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'firstname_veterinaire', 5, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'lastname_veterinaire', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'IsActive_veterinaire', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'daral', 'veterinaire', 'email_veterinaire', 8, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal', 'fk_id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal', 'fk_animal_type', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal', 'photo_left', 4, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal', 'photo_right', 5, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal', 'photo_front', 6, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal_type', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'animal_type', 'name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'categorie', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'categorie', 'categorie_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'categorie', 'max_animal', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'cheptel', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'cheptel', 'fk_id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'cheptel', 'fk_animal_type', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'cheptel', 'total_animal_type', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'cheptel', 'isactive', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral', 'id_localite', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral', 'name', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', 'ex: 0102'),
('def', 'daral_09_01_13', 'daral_stat_animal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 'fk_daral_name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 'fk_animal_type', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 'total_animal_type', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral_stat_farmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral_stat_farmer', 'fk_daral_name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'daral_stat_farmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement', 'name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement', 'region', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 'fk_departement_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 'fk_animal_type', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 'total_animal_type', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_farmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_farmer', 'fk_departement_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'departement_stat_farmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'rank_farmer', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'categorie', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'national_id', 4, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'address_farmer', 5, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'phone_farmer', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'registration_date', 7, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'daral_originel', 8, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'daral_actuel', 9, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'firstname_farmer', 10, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'lastname_farmer', 11, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'isactive_farmer', 12, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'birthdate_farmer', 13, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'birthplace_farmer', 14, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'farmer', 'id_localite', 15, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'langue', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'langue', 'libelle', 2, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'langue', 'pays', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite', 'name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite', 'departement', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'daral_09_01_13', 'localite', 'region', 4, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 'fk_localite_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 'fk_animal_type', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 'total_animal_type', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_farmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_farmer', 'fk_localite_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'localite_stat_farmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'maladie', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'maladie', 'libelle', 2, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'maladie', 'symptomes', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'maladie', 'type', 4, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'maladie', 'vaccin', 5, NULL, 'NO', 'varchar', 200, 200, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'media', 'id_media', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'media', 'titre', 2, NULL, 'NO', 'varchar', 250, 250, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'media', 'langue', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'media', 'date_insertion', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'media', 'lien', 5, NULL, 'NO', 'varchar', 250, 250, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'media', 'maladie', 6, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'national', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'national', 'fk_animal_type', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'national', 'total_animal_type', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'notification', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'notification', 'id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'notification', 'id_localite', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'notification', 'date', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'notification', 'type', 5, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'notification', 'id_user', 6, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region', 'name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 'fk_region_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 'fk_animal_type', 3, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 'total_animal_type', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 'fk_region_name', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 'total_farmer', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'role_users', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'role_users', 'description', 2, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', 'UNI', '', 'select,insert,update,references', 'valeur = admin ou gerant'),
('def', 'daral_09_01_13', 'type_notification', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'type_notification', 'libelle', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'users', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'users', 'username', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'users', 'password', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'users', 'date_created', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'users', 'role', 5, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'users', 'user_daral', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', 'un admin s''attribue un daral et en fonction des besoins il peut modifier cette information'),
('def', 'daral_09_01_13', 'veterinaire', 'rank_veterinaire', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'id_veterinaire', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'adresse_veterinaire', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'localite_veterinaire', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'firstname_veterinaire', 5, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'lastname_veterinaire', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'IsActive_veterinaire', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'daral_09_01_13', 'veterinaire', 'email_veterinaire', 8, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'Db', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'User', 3, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'Table_name', 4, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'Column_name', 5, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'Timestamp', 6, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'columns_priv', 'Column_priv', 7, '', 'NO', 'set', 31, 93, NULL, NULL, 'utf8', 'utf8_general_ci', 'set(''Select'',''Insert'',''Update'',''References'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Db', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'User', 3, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Select_priv', 4, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Insert_priv', 5, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Update_priv', 6, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Delete_priv', 7, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Create_priv', 8, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Drop_priv', 9, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Grant_priv', 10, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'References_priv', 11, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Index_priv', 12, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Alter_priv', 13, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Create_tmp_table_priv', 14, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Lock_tables_priv', 15, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Create_view_priv', 16, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Show_view_priv', 17, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Create_routine_priv', 18, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Alter_routine_priv', 19, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Execute_priv', 20, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Event_priv', 21, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'db', 'Trigger_priv', 22, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'db', 1, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'name', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'body', 3, NULL, 'NO', 'longblob', 4294967295, 4294967295, NULL, NULL, NULL, NULL, 'longblob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'definer', 4, '', 'NO', 'char', 77, 231, NULL, NULL, 'utf8', 'utf8_bin', 'char(77)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'execute_at', 5, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'interval_value', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'interval_field', 7, NULL, 'YES', 'enum', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''YEAR'',''QUARTER'',''MONTH'',''DAY'',''HOUR'',''MINUTE'',''WEEK'',''SECOND'',''MICROSECOND'',''YEAR_MONTH'',''DAY_HOUR'',''DAY_MINUTE'',''DAY_SECOND'',''HOUR_MINUTE'',''HOUR_SECOND'',''MINUTE_SECOND'',''DAY_MICROSECOND'',''HOUR_MICROSECOND'',''MINUTE_MICROSECOND'',''SECOND_MICROSECOND'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'created', 8, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'modified', 9, '0000-00-00 00:00:00', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'last_executed', 10, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'starts', 11, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'ends', 12, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'status', 13, 'ENABLED', 'NO', 'enum', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''ENABLED'',''DISABLED'',''SLAVESIDE_DISABLED'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'on_completion', 14, 'DROP', 'NO', 'enum', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''DROP'',''PRESERVE'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'sql_mode', 15, '', 'NO', 'set', 478, 1434, NULL, NULL, 'utf8', 'utf8_general_ci', 'set(''REAL_AS_FLOAT'',''PIPES_AS_CONCAT'',''ANSI_QUOTES'',''IGNORE_SPACE'',''NOT_USED'',''ONLY_FULL_GROUP_BY'',''NO_UNSIGNED_SUBTRACTION'',''NO_DIR_IN_CREATE'',''POSTGRESQL'',''ORACLE'',''MSSQL'',''DB2'',''MAXDB'',''NO_KEY_OPTIONS'',''NO_TABLE_OPTIONS'',''NO_FIELD_OPTIONS'',''MYSQL323'',''MYSQL40'',''ANSI'',''NO_AUTO_VALUE_ON_ZERO'',''NO_BACKSLASH_ESCAPES'',''STRICT_TRANS_TABLES'',''STRICT_ALL_TABLES'',''NO_ZERO_IN_DATE'',''NO_ZERO_DATE'',''INVALID_DATES'',''ERROR_FOR_DIVISION_BY_ZERO'',''TRADITIONAL'',''NO_AUTO_CREATE_USER'',''HIGH_NOT_PRECEDENCE'',''NO_ENGINE_SUBSTITUTION'',''PAD_CHAR_TO_FULL_LENGTH'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'comment', 16, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'originator', 17, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'time_zone', 18, 'SYSTEM', 'NO', 'char', 64, 64, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'character_set_client', 19, NULL, 'YES', 'char', 32, 96, NULL, NULL, 'utf8', 'utf8_bin', 'char(32)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'collation_connection', 20, NULL, 'YES', 'char', 32, 96, NULL, NULL, 'utf8', 'utf8_bin', 'char(32)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'db_collation', 21, NULL, 'YES', 'char', 32, 96, NULL, NULL, 'utf8', 'utf8_bin', 'char(32)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'event', 'body_utf8', 22, NULL, 'YES', 'longblob', 4294967295, 4294967295, NULL, NULL, NULL, NULL, 'longblob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'func', 'name', 1, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'func', 'ret', 2, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'func', 'dl', 3, '', 'NO', 'char', 128, 384, NULL, NULL, 'utf8', 'utf8_bin', 'char(128)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'func', 'type', 4, NULL, 'NO', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''function'',''aggregate'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'general_log', 'event_time', 1, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'general_log', 'user_host', 2, NULL, 'NO', 'mediumtext', 16777215, 16777215, NULL, NULL, 'utf8', 'utf8_general_ci', 'mediumtext', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'general_log', 'thread_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'general_log', 'server_id', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'general_log', 'command_type', 5, NULL, 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'general_log', 'argument', 6, NULL, 'NO', 'mediumtext', 16777215, 16777215, NULL, NULL, 'utf8', 'utf8_general_ci', 'mediumtext', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_category', 'help_category_id', 1, NULL, 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(5) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_category', 'name', 2, NULL, 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_category', 'parent_category_id', 3, NULL, 'YES', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(5) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_category', 'url', 4, NULL, 'NO', 'char', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(128)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_keyword', 'help_keyword_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_keyword', 'name', 2, NULL, 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_relation', 'help_topic_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_relation', 'help_keyword_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_topic', 'help_topic_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_topic', 'name', 2, NULL, 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_topic', 'help_category_id', 3, NULL, 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(5) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_topic', 'description', 4, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_topic', 'example', 5, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'help_topic', 'url', 6, NULL, 'NO', 'char', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(128)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Db', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Select_priv', 3, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Insert_priv', 4, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Update_priv', 5, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Delete_priv', 6, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Create_priv', 7, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Drop_priv', 8, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Grant_priv', 9, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'References_priv', 10, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Index_priv', 11, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Alter_priv', 12, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Create_tmp_table_priv', 13, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Lock_tables_priv', 14, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Create_view_priv', 15, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Show_view_priv', 16, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Create_routine_priv', 17, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Alter_routine_priv', 18, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Execute_priv', 19, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'host', 'Trigger_priv', 20, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'Position', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'File', 2, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'epoch', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'inserts', 4, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'updates', 5, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'deletes', 6, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'ndb_binlog_index', 'schemaops', 7, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'plugin', 'name', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'plugin', 'dl', 2, '', 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'db', 1, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'name', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'type', 3, NULL, 'NO', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''FUNCTION'',''PROCEDURE'')', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'specific_name', 4, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'language', 5, 'SQL', 'NO', 'enum', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''SQL'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'sql_data_access', 6, 'CONTAINS_SQL', 'NO', 'enum', 17, 51, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''CONTAINS_SQL'',''NO_SQL'',''READS_SQL_DATA'',''MODIFIES_SQL_DATA'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'is_deterministic', 7, 'NO', 'NO', 'enum', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''YES'',''NO'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'security_type', 8, 'DEFINER', 'NO', 'enum', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''INVOKER'',''DEFINER'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'param_list', 9, NULL, 'NO', 'blob', 65535, 65535, NULL, NULL, NULL, NULL, 'blob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'returns', 10, NULL, 'NO', 'longblob', 4294967295, 4294967295, NULL, NULL, NULL, NULL, 'longblob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'body', 11, NULL, 'NO', 'longblob', 4294967295, 4294967295, NULL, NULL, NULL, NULL, 'longblob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'definer', 12, '', 'NO', 'char', 77, 231, NULL, NULL, 'utf8', 'utf8_bin', 'char(77)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'created', 13, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'modified', 14, '0000-00-00 00:00:00', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'sql_mode', 15, '', 'NO', 'set', 478, 1434, NULL, NULL, 'utf8', 'utf8_general_ci', 'set(''REAL_AS_FLOAT'',''PIPES_AS_CONCAT'',''ANSI_QUOTES'',''IGNORE_SPACE'',''NOT_USED'',''ONLY_FULL_GROUP_BY'',''NO_UNSIGNED_SUBTRACTION'',''NO_DIR_IN_CREATE'',''POSTGRESQL'',''ORACLE'',''MSSQL'',''DB2'',''MAXDB'',''NO_KEY_OPTIONS'',''NO_TABLE_OPTIONS'',''NO_FIELD_OPTIONS'',''MYSQL323'',''MYSQL40'',''ANSI'',''NO_AUTO_VALUE_ON_ZERO'',''NO_BACKSLASH_ESCAPES'',''STRICT_TRANS_TABLES'',''STRICT_ALL_TABLES'',''NO_ZERO_IN_DATE'',''NO_ZERO_DATE'',''INVALID_DATES'',''ERROR_FOR_DIVISION_BY_ZERO'',''TRADITIONAL'',''NO_AUTO_CREATE_USER'',''HIGH_NOT_PRECEDENCE'',''NO_ENGINE_SUBSTITUTION'',''PAD_CHAR_TO_FULL_LENGTH'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'comment', 16, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_bin', 'text', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'character_set_client', 17, NULL, 'YES', 'char', 32, 96, NULL, NULL, 'utf8', 'utf8_bin', 'char(32)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'collation_connection', 18, NULL, 'YES', 'char', 32, 96, NULL, NULL, 'utf8', 'utf8_bin', 'char(32)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'db_collation', 19, NULL, 'YES', 'char', 32, 96, NULL, NULL, 'utf8', 'utf8_bin', 'char(32)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proc', 'body_utf8', 20, NULL, 'YES', 'longblob', 4294967295, 4294967295, NULL, NULL, NULL, NULL, 'longblob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Db', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'User', 3, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Routine_name', 4, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Routine_type', 5, NULL, 'NO', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_bin', 'enum(''FUNCTION'',''PROCEDURE'')', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Grantor', 6, '', 'NO', 'char', 77, 231, NULL, NULL, 'utf8', 'utf8_bin', 'char(77)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Proc_priv', 7, '', 'NO', 'set', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'set(''Execute'',''Alter Routine'',''Grant'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'procs_priv', 'Timestamp', 8, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'User', 2, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'Proxied_host', 3, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'Proxied_user', 4, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'With_grant', 5, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'Grantor', 6, '', 'NO', 'char', 77, 231, NULL, NULL, 'utf8', 'utf8_bin', 'char(77)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'mysql', 'proxies_priv', 'Timestamp', 7, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Server_name', 1, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Host', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Db', 3, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Username', 4, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Password', 5, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Port', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(4)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Socket', 7, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Wrapper', 8, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'servers', 'Owner', 9, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'start_time', 1, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'user_host', 2, NULL, 'NO', 'mediumtext', 16777215, 16777215, NULL, NULL, 'utf8', 'utf8_general_ci', 'mediumtext', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'query_time', 3, NULL, 'NO', 'time', NULL, NULL, NULL, NULL, NULL, NULL, 'time', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'lock_time', 4, NULL, 'NO', 'time', NULL, NULL, NULL, NULL, NULL, NULL, 'time', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'rows_sent', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'rows_examined', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'db', 7, NULL, 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'last_insert_id', 8, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'insert_id', 9, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'server_id', 10, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'slow_log', 'sql_text', 11, NULL, 'NO', 'mediumtext', 16777215, 16777215, NULL, NULL, 'utf8', 'utf8_general_ci', 'mediumtext', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Db', 2, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'User', 3, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Table_name', 4, '', 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_bin', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Grantor', 5, '', 'NO', 'char', 77, 231, NULL, NULL, 'utf8', 'utf8_bin', 'char(77)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Timestamp', 6, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Table_priv', 7, '', 'NO', 'set', 98, 294, NULL, NULL, 'utf8', 'utf8_general_ci', 'set(''Select'',''Insert'',''Update'',''Delete'',''Create'',''Drop'',''Grant'',''References'',''Index'',''Alter'',''Create View'',''Show view'',''Trigger'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'tables_priv', 'Column_priv', 8, '', 'NO', 'set', 31, 93, NULL, NULL, 'utf8', 'utf8_general_ci', 'set(''Select'',''Insert'',''Update'',''References'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone', 'Time_zone_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone', 'Use_leap_seconds', 2, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''Y'',''N'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_leap_second', 'Transition_time', 1, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_leap_second', 'Correction', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_name', 'Name', 1, NULL, 'NO', 'char', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(64)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_name', 'Time_zone_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition', 'Time_zone_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition', 'Transition_time', 2, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition', 'Transition_type_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition_type', 'Time_zone_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition_type', 'Transition_type_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition_type', 'Offset', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition_type', 'Is_DST', 4, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(3) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'time_zone_transition_type', 'Abbreviation', 5, '', 'NO', 'char', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(8)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Host', 1, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'User', 2, '', 'NO', 'char', 16, 48, NULL, NULL, 'utf8', 'utf8_bin', 'char(16)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Password', 3, '', 'NO', 'char', 41, 41, NULL, NULL, 'latin1', 'latin1_bin', 'char(41)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Select_priv', 4, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Insert_priv', 5, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Update_priv', 6, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Delete_priv', 7, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Create_priv', 8, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Drop_priv', 9, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Reload_priv', 10, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Shutdown_priv', 11, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Process_priv', 12, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'File_priv', 13, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Grant_priv', 14, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'References_priv', 15, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Index_priv', 16, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Alter_priv', 17, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Show_db_priv', 18, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Super_priv', 19, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Create_tmp_table_priv', 20, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Lock_tables_priv', 21, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Execute_priv', 22, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Repl_slave_priv', 23, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Repl_client_priv', 24, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Create_view_priv', 25, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Show_view_priv', 26, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Create_routine_priv', 27, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Alter_routine_priv', 28, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Create_user_priv', 29, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Event_priv', 30, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Trigger_priv', 31, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'Create_tablespace_priv', 32, 'N', 'NO', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''N'',''Y'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'ssl_type', 33, '', 'NO', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum('''',''ANY'',''X509'',''SPECIFIED'')', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'ssl_cipher', 34, NULL, 'NO', 'blob', 65535, 65535, NULL, NULL, NULL, NULL, 'blob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'x509_issuer', 35, NULL, 'NO', 'blob', 65535, 65535, NULL, NULL, NULL, NULL, 'blob', '', '', 'select,insert,update,references', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'mysql', 'user', 'x509_subject', 36, NULL, 'NO', 'blob', 65535, 65535, NULL, NULL, NULL, NULL, 'blob', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'max_questions', 37, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'max_updates', 38, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'max_connections', 39, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'max_user_connections', 40, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'plugin', 41, '', 'NO', 'char', 60, 180, NULL, NULL, 'utf8', 'utf8_bin', 'char(60)', '', '', 'select,insert,update,references', ''),
('def', 'mysql', 'user', 'authentication_string', 42, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_bin', 'text', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'cond_instances', 'NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'cond_instances', 'OBJECT_INSTANCE_BEGIN', 2, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'THREAD_ID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'EVENT_ID', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'EVENT_NAME', 3, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'SOURCE', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'TIMER_START', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'TIMER_END', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'TIMER_WAIT', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'SPINS', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'OBJECT_SCHEMA', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'OBJECT_NAME', 10, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'OBJECT_TYPE', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'OBJECT_INSTANCE_BEGIN', 12, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'NESTING_EVENT_ID', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'OPERATION', 14, NULL, 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'NUMBER_OF_BYTES', 15, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_current', 'FLAGS', 16, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'THREAD_ID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'EVENT_ID', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'EVENT_NAME', 3, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'SOURCE', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'TIMER_START', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'TIMER_END', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'TIMER_WAIT', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'SPINS', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'OBJECT_SCHEMA', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'OBJECT_NAME', 10, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'OBJECT_TYPE', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'OBJECT_INSTANCE_BEGIN', 12, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'NESTING_EVENT_ID', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'OPERATION', 14, NULL, 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'NUMBER_OF_BYTES', 15, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history', 'FLAGS', 16, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'THREAD_ID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'EVENT_ID', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'EVENT_NAME', 3, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'SOURCE', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'TIMER_START', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'TIMER_END', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'TIMER_WAIT', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'SPINS', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'OBJECT_SCHEMA', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'OBJECT_NAME', 10, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'OBJECT_TYPE', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'OBJECT_INSTANCE_BEGIN', 12, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'NESTING_EVENT_ID', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'OPERATION', 14, NULL, 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'NUMBER_OF_BYTES', 15, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_history_long', 'FLAGS', 16, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'EVENT_NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'OBJECT_INSTANCE_BEGIN', 2, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'COUNT_STAR', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'SUM_TIMER_WAIT', 4, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'MIN_TIMER_WAIT', 5, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'AVG_TIMER_WAIT', 6, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'MAX_TIMER_WAIT', 7, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'THREAD_ID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'EVENT_NAME', 2, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'COUNT_STAR', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'SUM_TIMER_WAIT', 4, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'MIN_TIMER_WAIT', 5, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'AVG_TIMER_WAIT', 6, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'MAX_TIMER_WAIT', 7, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'EVENT_NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'COUNT_STAR', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'SUM_TIMER_WAIT', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'MIN_TIMER_WAIT', 4, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'AVG_TIMER_WAIT', 5, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'MAX_TIMER_WAIT', 6, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_instances', 'FILE_NAME', 1, NULL, 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_instances', 'EVENT_NAME', 2, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_instances', 'OPEN_COUNT', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_event_name', 'EVENT_NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_event_name', 'COUNT_READ', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_event_name', 'COUNT_WRITE', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_event_name', 'SUM_NUMBER_OF_BYTES_READ', 4, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_event_name', 'SUM_NUMBER_OF_BYTES_WRITE', 5, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'FILE_NAME', 1, NULL, 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'EVENT_NAME', 2, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'COUNT_READ', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'COUNT_WRITE', 4, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'SUM_NUMBER_OF_BYTES_READ', 5, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'SUM_NUMBER_OF_BYTES_WRITE', 6, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'mutex_instances', 'NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'mutex_instances', 'OBJECT_INSTANCE_BEGIN', 2, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'mutex_instances', 'LOCKED_BY_THREAD_ID', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'performance_timers', 'TIMER_NAME', 1, NULL, 'NO', 'enum', 11, 33, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''CYCLE'',''NANOSECOND'',''MICROSECOND'',''MILLISECOND'',''TICK'')', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'performance_timers', 'TIMER_FREQUENCY', 2, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'performance_timers', 'TIMER_RESOLUTION', 3, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'performance_timers', 'TIMER_OVERHEAD', 4, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'rwlock_instances', 'NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'rwlock_instances', 'OBJECT_INSTANCE_BEGIN', 2, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'rwlock_instances', 'WRITE_LOCKED_BY_THREAD_ID', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'rwlock_instances', 'READ_LOCKED_BY_COUNT', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_consumers', 'NAME', 1, NULL, 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_consumers', 'ENABLED', 2, NULL, 'NO', 'enum', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''YES'',''NO'')', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_instruments', 'NAME', 1, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_instruments', 'ENABLED', 2, NULL, 'NO', 'enum', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''YES'',''NO'')', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_instruments', 'TIMED', 3, NULL, 'NO', 'enum', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''YES'',''NO'')', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_timers', 'NAME', 1, NULL, 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'setup_timers', 'TIMER_NAME', 2, NULL, 'NO', 'enum', 11, 33, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''CYCLE'',''NANOSECOND'',''MICROSECOND'',''MILLISECOND'',''TICK'')', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'threads', 'THREAD_ID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'threads', 'PROCESSLIST_ID', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'performance_schema', 'threads', 'NAME', 3, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'ID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'MUL', 'auto_increment', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'nom', 2, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'possesseur', 3, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'console', 4, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'prix', 5, '0', 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'nbre_joueurs_max', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'test', 'jeux_video', 'commentaires', 7, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'test', 'news', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'test', 'news', 'titre', 2, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'test', 'news', 'contenu', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions', 'action_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions', 'action', 2, NULL, 'NO', 'varchar', 75, 225, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(75)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions', 'qualifiers', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions', 'response', 4, NULL, 'NO', 'varchar', 75, 225, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(75)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions', 'response_vars', 5, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions', 'active', 6, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions_log', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions_log', 'action_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions_log', 'user_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'actions_log', 'time', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'user_id', 2, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_type', 3, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '1 - MOBILE, 2 - EMAIL'),
('def', 'ushahidi_db', 'alert', 'alert_recipient', 4, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_code', 5, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_confirmed', 6, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_lat', 7, NULL, 'YES', 'varchar', 150, 450, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_lon', 8, NULL, 'YES', 'varchar', 150, 450, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_radius', 9, '20', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert', 'alert_ip', 10, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_category', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_category', 'alert_id', 2, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_category', 'category_id', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_sent', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_sent', 'incident_id', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_sent', 'alert_id', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'alert_sent', 'alert_date', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_banned', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_banned', 'banned_ipaddress', 2, NULL, 'NO', 'varchar', 50, 150, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_banned', 'banned_date', 3, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_log', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_log', 'api_task', 2, NULL, 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_log', 'api_parameters', 3, NULL, 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_log', 'api_records', 4, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_log', 'api_ipaddress', 5, NULL, 'NO', 'varchar', 50, 150, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_log', 'api_date', 6, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_settings', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_settings', 'default_record_limit', 2, '20', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_settings', 'max_record_limit', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_settings', 'max_requests_per_ip_address', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_settings', 'max_requests_quota_basis', 5, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'api_settings', 'modification_date', 6, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'badge', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'badge', 'name', 2, NULL, 'NO', 'varchar', 250, 750, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'badge', 'description', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'badge_users', 'user_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'badge_users', 'badge_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'parent_id', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'locale', 3, 'en_US', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_position', 4, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_title', 5, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_description', 6, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_color', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_image', 8, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_image_thumb', 9, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_visible', 10, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category', 'category_trusted', 11, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category_lang', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category_lang', 'category_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category_lang', 'locale', 3, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category_lang', 'category_title', 4, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'category_lang', 'category_description', 5, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'user_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'location_id', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'incident_id', 4, '0', 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'checkin_description', 5, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'checkin_date', 6, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'checkin', 'checkin_auto', 7, '0', 'YES', 'enum', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''0'',''1'')', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'city', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'city', 'country_id', 2, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'city', 'city', 3, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'city', 'city_lat', 4, NULL, 'YES', 'varchar', 150, 450, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'city', 'city_lon', 5, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'location_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'latitude', 3, NULL, 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'longitude', 4, NULL, 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'latitude_min', 5, NULL, 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'longitude_min', 6, NULL, 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'latitude_max', 7, NULL, 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'longitude_max', 8, NULL, 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'child_count', 9, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'parent_id', 10, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'left_side', 11, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'right_side', 12, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'level', 13, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'incident_id', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'cluster', 'category_id', 15, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'incident_id', 2, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'checkin_id', 3, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'user_id', 4, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_author', 5, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_email', 6, NULL, 'YES', 'varchar', 120, 360, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(120)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_description', 7, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_ip', 8, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_spam', 9, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_active', 10, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_date', 11, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'comment', 'comment_date_gmt', 12, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'country', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'country', 'iso', 2, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'country', 'country', 3, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'country', 'capital', 4, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'country', 'cities', 5, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'externalapp', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'externalapp', 'name', 2, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'externalapp', 'url', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed', 'feed_name', 2, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed', 'feed_url', 3, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed', 'feed_cache', 4, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed', 'feed_active', 5, '1', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed', 'feed_update', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'feed_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'location_id', 3, '0', 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'incident_id', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'item_title', 5, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'item_description', 6, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'item_link', 7, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'feed_item', 'item_date', 8, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form', 'form_title', 2, NULL, 'NO', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form', 'form_description', 3, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form', 'form_active', 4, '1', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'form_id', 2, '1', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_name', 3, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_type', 4, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX'),
('def', 'ushahidi_db', 'form_field', 'field_required', 5, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_position', 6, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_default', 7, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_maxlength', 8, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_width', 9, '0', 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(6)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_height', 10, '5', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_isdate', 11, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_ispublic_visible', 12, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field', 'field_ispublic_submit', 13, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field_option', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field_option', 'form_field_id', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field_option', 'option_name', 3, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_field_option', 'option_value', 4, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'ushahidi_db', 'form_response', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_response', 'form_field_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_response', 'incident_id', 3, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'form_response', 'form_response', 4, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'incident_id', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'geometry', 3, NULL, 'NO', 'geometry', NULL, NULL, NULL, NULL, NULL, NULL, 'geometry', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'geometry_label', 4, NULL, 'YES', 'varchar', 150, 450, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(150)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'geometry_comment', 5, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'geometry_color', 6, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'geometry', 'geometry_strokewidth', 7, NULL, 'YES', 'varchar', 5, 15, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(5)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'location_id', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'form_id', 3, '1', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'locale', 4, 'en_US', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'user_id', 5, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_title', 6, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_description', 7, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_date', 8, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_mode', 9, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER'),
('def', 'ushahidi_db', 'incident', 'incident_active', 10, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_verified', 11, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_dateadd', 12, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_dateadd_gmt', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_datemodify', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident', 'incident_alert_status', 15, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent'),
('def', 'ushahidi_db', 'incident', 'incident_zoom', 16, NULL, 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_category', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_category', 'incident_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_category', 'category_id', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_lang', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_lang', 'incident_id', 2, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_lang', 'locale', 3, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_lang', 'incident_title', 4, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_lang', 'incident_description', 5, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'incident_id', 2, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'person_first', 3, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'person_last', 4, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'person_email', 5, NULL, 'YES', 'varchar', 120, 360, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(120)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'person_phone', 6, NULL, 'YES', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'person_ip', 7, NULL, 'YES', 'varchar', 50, 150, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'incident_person', 'person_date', 8, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'layer', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'layer', 'layer_name', 2, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'layer', 'layer_url', 3, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'layer', 'layer_file', 4, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'layer', 'layer_color', 5, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'layer', 'layer_visible', 6, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'level', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'level', 'level_title', 2, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'level', 'level_description', 3, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'level', 'level_weight', 4, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'location_name', 2, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'country_id', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'latitude', 4, '0', 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'longitude', 5, '0', 'NO', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'location_visible', 6, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'location', 'location_date', 7, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'maintenance', 'allowed_ip', 1, NULL, 'NO', 'varchar', 15, 45, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(15)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'location_id', 2, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'incident_id', 3, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'checkin_id', 4, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'message_id', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'badge_id', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_type', 7, NULL, 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST'),
('def', 'ushahidi_db', 'media', 'media_title', 8, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_description', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_link', 10, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_medium', 11, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_thumb', 12, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_date', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'media', 'media_active', 14, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'parent_id', 2, '0', 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'incident_id', 3, '0', 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'user_id', 4, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'reporter_id', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'service_messageid', 6, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'message_from', 7, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'message_to', 8, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'message', 9, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'message_detail', 10, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'message_type', 11, '1', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED'),
('def', 'ushahidi_db', 'message', 'message_date', 12, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'message_level', 13, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', '0 - UNREAD, 1 - READ, 99 - SPAM'),
('def', 'ushahidi_db', 'message', 'latitude', 14, NULL, 'YES', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'message', 'longitude', 15, NULL, 'YES', 'double', NULL, NULL, 22, NULL, NULL, NULL, 'double', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'openid', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'openid', 'user_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'openid', 'openid', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'openid', 'openid_email', 4, NULL, 'NO', 'varchar', 127, 381, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(127)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'openid', 'openid_server', 5, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'openid', 'openid_date', 6, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'page', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'page', 'page_title', 2, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'page', 'page_description', 3, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'page', 'page_tab', 4, NULL, 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'page', 'page_active', 5, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'permissions', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'permissions', 'name', 2, NULL, 'NO', 'varchar', 32, 32, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(32)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'permissions_roles', 'role_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'permissions_roles', 'permission_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'plugin_name', 2, NULL, 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'plugin_url', 3, NULL, 'YES', 'varchar', 250, 750, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'plugin_description', 4, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'plugin_priority', 5, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'plugin_active', 6, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'plugin', 'plugin_installed', 7, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'parent_id', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'user_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'from_user_id', 4, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'private_subject', 5, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'private_message', 6, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'private_message_date', 7, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'private_message', 'private_message_new', 8, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'user_id', 2, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'incident_id', 3, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'comment_id', 4, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'rating', 5, '0', 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'rating_ip', 6, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'rating', 'rating_date', 7, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'location_id', 2, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'user_id', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'service_id', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'level_id', 5, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'service_account', 6, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'reporter_first', 7, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'reporter_last', 8, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'reporter_email', 9, NULL, 'YES', 'varchar', 120, 360, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(120)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'reporter_phone', 10, NULL, 'YES', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'reporter_ip', 11, NULL, 'YES', 'varchar', 50, 150, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'reporter', 'reporter_date', 12, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'roles', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'roles', 'name', 2, NULL, 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'roles', 'description', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'roles', 'access_level', 4, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'roles_users', 'user_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'roles_users', 'role_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_name', 2, NULL, 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_last', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_weekday', 4, '-1', 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(6)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_day', 5, '-1', 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(6)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_hour', 6, '-1', 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(6)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_minute', 7, NULL, 'NO', 'smallint', NULL, NULL, 5, 0, NULL, NULL, 'smallint(6)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_controller', 8, NULL, 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler', 'scheduler_active', 9, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler_log', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler_log', 'scheduler_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler_log', 'scheduler_status', 3, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'scheduler_log', 'scheduler_date', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'service', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'service', 'service_name', 2, NULL, 'YES', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'service', 'service_description', 3, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'service', 'service_url', 4, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'service', 'service_api', 5, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'sessions', 'session_id', 1, NULL, 'NO', 'varchar', 127, 381, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(127)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'sessions', 'last_activity', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'sessions', 'data', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'settings', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'settings', 'key', 2, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', 'Unique identifier for the configuration parameter'),
('def', 'ushahidi_db', 'settings', 'value', 3, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', 'Value for the settings parameter'),
('def', 'ushahidi_db', 'user_devices', 'id', 1, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_devices', 'user_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_tokens', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_tokens', 'user_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_tokens', 'user_agent', 3, NULL, 'NO', 'varchar', 40, 120, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(40)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_tokens', 'token', 4, NULL, 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_tokens', 'created', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'user_tokens', 'expires', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'riverid', 2, NULL, 'NO', 'varchar', 128, 384, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(128)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'name', 3, NULL, 'YES', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'email', 4, NULL, 'NO', 'varchar', 127, 381, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(127)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'username', 5, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'password', 6, NULL, 'NO', 'char', 50, 150, NULL, NULL, 'utf8', 'utf8_general_ci', 'char(50)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'logins', 7, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'last_login', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'notify', 9, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', 'Flag incase admin opts in for email notifications'),
('def', 'ushahidi_db', 'users', 'updated', 10, 'CURRENT_TIMESTAMP', 'NO', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', 'on update CURRENT_TIMESTAMP', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'color', 11, 'FF0000', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'code', 12, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'confirmed', 13, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'public_profile', 14, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'approved', 15, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'users', 'needinfo', 16, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'verified', 'id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'verified', 'incident_id', 2, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'verified', 'user_id', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'verified', 'verified_date', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'ushahidi_db', 'verified', 'verified_status', 5, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'animal', 'id_animal', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'animal', 'id_eleveur', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'animal', 'type', 3, '', 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'animal', 'photo_left', 4, '', 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'animal', 'photo_right', 5, '', 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'animal', 'photo_front', 6, '', 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'daral', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'daral', 'id_localite', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'daral', 'name', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'rank_farmer', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'daral_number', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'firstname_farmer', 4, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'lastname_farmer', 5, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'phone_farmer', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'isactive_farmer', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'birthdate_farmer', 8, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'birthplace_farmer', 9, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'farmer', 'id_localite', 10, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'lang', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'lang', 'libelle', 2, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'lang', 'pays', 3, NULL, 'NO', 'varchar', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'localite', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'localite', 'name', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'maladie', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'maladie', 'libelle', 2, NULL, 'NO', 'varchar', 1000, 1000, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(1000)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'maladie', 'symptomes', 3, NULL, 'NO', 'varchar', 1000, 1000, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(1000)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'maladie', 'type', 4, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'maladie', 'vaccin', 5, NULL, 'NO', 'varchar', 1000, 1000, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(1000)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'media', 'id_media', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'media', 'titre', 2, NULL, 'NO', 'varchar', 250, 250, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'media', 'langue', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'media', 'date_insertion', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'media', 'lien', 5, NULL, 'YES', 'varchar', 250, 250, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(250)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'media', 'maladie', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'notification', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'notification', 'id_farmer', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'notification', 'id_localite', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'notification', 'date', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'notification', 'type', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'notification', 'id_user', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'users', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'users', 'username', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'users', 'password', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'users', 'date_created', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'rank_veterinaire', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'id_veterinaire', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'adresse_veto', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'firstname_veterinaire', 4, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'lastname_veterinaire', 5, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'phone_veterinaire', 6, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'IsActive_veterinaire', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(2)', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'birthdate_veterinaire', 8, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'zf_daral', 'veterinaire', 'birthplace_veterinaire', 9, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', '');

-- --------------------------------------------------------

--
-- Structure de la table `COLUMN_PRIVILEGES`
--

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ENGINES`
--

CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ENGINES`
--

INSERT INTO `ENGINES` (`ENGINE`, `SUPPORT`, `COMMENT`, `TRANSACTIONS`, `XA`, `SAVEPOINTS`) VALUES
('FEDERATED', 'NO', 'Federated MySQL storage engine', NULL, NULL, NULL),
('MRG_MYISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO'),
('MyISAM', 'YES', 'MyISAM storage engine', 'NO', 'NO', 'NO'),
('BLACKHOLE', 'YES', '/dev/null storage engine (anything you write to it disappears)', 'NO', 'NO', 'NO'),
('CSV', 'YES', 'CSV storage engine', 'NO', 'NO', 'NO'),
('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO'),
('ARCHIVE', 'YES', 'Archive storage engine', 'NO', 'NO', 'NO'),
('InnoDB', 'DEFAULT', 'Supports transactions, row-level locking, and foreign keys', 'YES', 'YES', 'YES'),
('PERFORMANCE_SCHEMA', 'YES', 'Performance Schema', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Structure de la table `EVENTS`
--

CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `FILES`
--

CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `GLOBAL_STATUS`
--

CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `GLOBAL_STATUS`
--

INSERT INTO `GLOBAL_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '0'),
('ABORTED_CONNECTS', '0'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BINLOG_STMT_CACHE_DISK_USE', '0'),
('BINLOG_STMT_CACHE_USE', '0'),
('BYTES_RECEIVED', '1113885'),
('BYTES_SENT', '11963614'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '175'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '896'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '24'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '74'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '78'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '22'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '5'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '46'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '52'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESIGNAL', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '3864'),
('COM_SET_OPTION', '3865'),
('COM_SIGNAL', '0'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '34'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '671'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '197'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '2555'),
('COM_SHOW_FUNCTION_STATUS', '17'),
('COM_SHOW_GRANTS', '4'),
('COM_SHOW_KEYS', '3730'),
('COM_SHOW_MASTER_STATUS', '31'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '4'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '17'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_RELAYLOG_EVENTS', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '31'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '7'),
('COM_SHOW_TABLE_STATUS', '1103'),
('COM_SHOW_TABLES', '311'),
('COM_SHOW_TRIGGERS', '412'),
('COM_SHOW_VARIABLES', '160'),
('COM_SHOW_WARNINGS', '6'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '8'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '1779'),
('CREATED_TMP_DISK_TABLES', '3173'),
('CREATED_TMP_FILES', '17'),
('CREATED_TMP_TABLES', '9496'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '3199'),
('HANDLER_DELETE', '22'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '1250'),
('HANDLER_READ_KEY', '3156'),
('HANDLER_READ_LAST', '0'),
('HANDLER_READ_NEXT', '4068'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '2'),
('HANDLER_READ_RND_NEXT', '79317'),
('HANDLER_ROLLBACK', '12'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '8'),
('HANDLER_WRITE', '66925'),
('INNODB_BUFFER_POOL_PAGES_DATA', '672'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '1'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '3670'),
('INNODB_BUFFER_POOL_PAGES_FREE', '7518'),
('INNODB_BUFFER_POOL_PAGES_MISC', '2'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '8192'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD_EVICTED', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '345019'),
('INNODB_BUFFER_POOL_READS', '508'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '56694'),
('INNODB_DATA_FSYNCS', '1505'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '10506240'),
('INNODB_DATA_READS', '523'),
('INNODB_DATA_WRITES', '2779'),
('INNODB_DATA_WRITTEN', '123839488'),
('INNODB_DBLWR_PAGES_WRITTEN', '3670'),
('INNODB_DBLWR_WRITES', '157'),
('INNODB_HAVE_ATOMIC_BUILTINS', 'ON'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '7122'),
('INNODB_LOG_WRITES', '1108'),
('INNODB_OS_LOG_FSYNCS', '1190'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '3538432'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '165'),
('INNODB_PAGES_READ', '507'),
('INNODB_PAGES_WRITTEN', '3670'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '0'),
('INNODB_ROW_LOCK_TIME_AVG', '0'),
('INNODB_ROW_LOCK_TIME_MAX', '0'),
('INNODB_ROW_LOCK_WAITS', '0'),
('INNODB_ROWS_DELETED', '35'),
('INNODB_ROWS_INSERTED', '1354'),
('INNODB_ROWS_READ', '8133'),
('INNODB_ROWS_UPDATED', '23'),
('INNODB_TRUNCATED_STATUS_WRITES', '0'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '6685'),
('KEY_BLOCKS_USED', '13'),
('KEY_READ_REQUESTS', '45'),
('KEY_READS', '13'),
('KEY_WRITE_REQUESTS', '0'),
('KEY_WRITES', '0'),
('LAST_QUERY_COST', '0.000000'),
('MAX_USED_CONNECTIONS', '2'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '158'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '159'),
('OPEN_TABLES', '159'),
('OPENED_FILES', '14067'),
('OPENED_TABLE_DEFINITIONS', '790'),
('OPENED_TABLES', '1150'),
('PERFORMANCE_SCHEMA_COND_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_COND_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_LOCKER_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_INSTANCES_LOST', '0'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '20176'),
('QUESTIONS', '20176'),
('RPL_STATUS', 'AUTH_MASTER'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '9970'),
('SLAVE_HEARTBEAT_PERIOD', '0.000'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RECEIVED_HEARTBEATS', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '2'),
('SORT_SCAN', '1'),
('TABLE_LOCKS_IMMEDIATE', '3442'),
('TABLE_LOCKS_WAITED', '0'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '1'),
('THREADS_CREATED', '1778'),
('THREADS_RUNNING', '1'),
('UPTIME', '71615'),
('UPTIME_SINCE_FLUSH_STATUS', '71615');

-- --------------------------------------------------------

--
-- Structure de la table `GLOBAL_VARIABLES`
--

CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `GLOBAL_VARIABLES`
--

INSERT INTO `GLOBAL_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('HAVE_CRYPT', 'YES'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_LONG_SIZE', '10000'),
('INNODB_VERSION', '1.1.8'),
('PERFORMANCE_SCHEMA_MAX_COND_INSTANCES', '1000'),
('HAVE_QUERY_CACHE', 'YES'),
('OLD_PASSWORDS', 'OFF'),
('PERFORMANCE_SCHEMA_MAX_FILE_CLASSES', '50'),
('PERFORMANCE_SCHEMA_MAX_THREAD_INSTANCES', '1000'),
('DELAYED_INSERT_TIMEOUT', '300'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_INSTANCES', '1000000'),
('TIME_FORMAT', '%H:%i:%s'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_INSTANCES', '1000000'),
('LC_MESSAGES', 'en_US'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_CLASSES', '30'),
('BASEDIR', '/Applications/MAMP/Library'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_CLASSES', '200'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('BACK_LOG', '50'),
('SLOW_LAUNCH_TIME', '2'),
('EVENT_SCHEDULER', 'OFF'),
('QUERY_CACHE_LIMIT', '1048576'),
('INIT_SLAVE', ''),
('RELAY_LOG_INDEX', ''),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('PERFORMANCE_SCHEMA', 'OFF'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('HAVE_GEOMETRY', 'YES'),
('WAIT_TIMEOUT', '28800'),
('LOCK_WAIT_TIMEOUT', '31536000'),
('PERFORMANCE_SCHEMA_MAX_TABLE_HANDLES', '100000'),
('CHARACTER_SETS_DIR', '/Applications/MAMP/Library/share/charsets/'),
('SKIP_NAME_RESOLVE', 'OFF'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('REPORT_HOST', ''),
('CHARACTER_SET_RESULTS', 'latin1'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('CHARACTER_SET_CONNECTION', 'latin1'),
('INNODB_ROLLBACK_SEGMENTS', '128'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('LARGE_FILES_SUPPORT', 'ON'),
('PID_FILE', '/Applications/MAMP/tmp/mysql/mysql.pid'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('SQL_LOG_BIN', 'ON'),
('NET_BUFFER_LENGTH', '16384'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('SKIP_SHOW_DATABASE', 'OFF'),
('FT_MAX_WORD_LEN', '84'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('LARGE_PAGES', 'OFF'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('LC_TIME_NAMES', 'en_US'),
('INIT_CONNECT', ''),
('MULTI_RANGE_COUNT', '256'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_SIZE', '10'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('LICENSE', 'GPL'),
('DELAYED_INSERT_LIMIT', '100'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('COMPLETION_TYPE', 'NO_CHAIN'),
('REPORT_PASSWORD', ''),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('MAX_ERROR_COUNT', '64'),
('HAVE_COMPRESS', 'YES'),
('AUTO_INCREMENT_OFFSET', '1'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('JOIN_BUFFER_SIZE', '131072'),
('THREAD_CACHE_SIZE', '0'),
('CONNECT_TIMEOUT', '10'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('LOWER_CASE_FILE_SYSTEM', 'ON'),
('INIT_FILE', ''),
('DEFAULT_WEEK_FORMAT', '0'),
('LC_MESSAGES_DIR', '/Applications/MAMP/Library/share/'),
('LOG_OUTPUT', 'FILE'),
('PERFORMANCE_SCHEMA_MAX_THREAD_CLASSES', '50'),
('INNODB_IO_CAPACITY', '200'),
('MAX_CONNECT_ERRORS', '10'),
('INNODB_USE_NATIVE_AIO', 'OFF'),
('PROTOCOL_VERSION', '10'),
('HAVE_SYMLINK', 'YES'),
('NET_WRITE_TIMEOUT', '60'),
('TIME_ZONE', 'SYSTEM'),
('INNODB_TABLE_LOCKS', 'ON'),
('LOG_WARNINGS', '1'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('DELAYED_QUEUE_SIZE', '1000'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('MAX_LONG_DATA_SIZE', '1048576'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('OPEN_FILES_LIMIT', '2560'),
('SQL_AUTO_IS_NULL', 'OFF'),
('LOWER_CASE_TABLE_NAMES', '0'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('BINLOG_CACHE_SIZE', '32768'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('SYNC_RELAY_LOG_INFO', '0'),
('NET_RETRY_COUNT', '10'),
('INNODB_REPLICATION_DELAY', '0'),
('FT_STOPWORD_FILE', '(built-in)'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('DELAY_KEY_WRITE', 'ON'),
('INNODB_STATS_ON_METADATA', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('LONG_QUERY_TIME', '10.000000'),
('PROFILING_HISTORY_SIZE', '15'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('INNODB_CHANGE_BUFFERING', 'all'),
('INNODB_BUFFER_POOL_SIZE', '134217728'),
('READ_RND_BUFFER_SIZE', '262144'),
('HAVE_INNODB', 'YES'),
('INNODB_FILE_FORMAT', 'Antelope'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('BIG_TABLES', 'OFF'),
('FLUSH', 'OFF'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('METADATA_LOCKS_CACHE_SIZE', '1024'),
('DATE_FORMAT', '%Y-%m-%d'),
('CHARACTER_SET_SERVER', 'latin1'),
('READ_ONLY', 'OFF'),
('HOSTNAME', 'alexandria-seiers-macbook-pro.local'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('READ_BUFFER_SIZE', '131072'),
('INNODB_PURGE_THREADS', '0'),
('MAX_SORT_LENGTH', '1024'),
('PROFILING', 'OFF'),
('MAX_BINLOG_SIZE', '1073741824'),
('INNODB_STRICT_MODE', 'OFF'),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('FLUSH_TIME', '0'),
('GENERAL_LOG_FILE', '/Applications/MAMP/db/mysql/alexandria-seiers-macbook-pro.log'),
('QUERY_PREALLOC_SIZE', '8192'),
('PERFORMANCE_SCHEMA_MAX_COND_CLASSES', '80'),
('SLOW_QUERY_LOG', 'OFF'),
('AUTO_INCREMENT_INCREMENT', '1'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('TMPDIR', '/var/folders/wn/lbd299qx2vjd9dpx6hy85v780000gn/T/'),
('SQL_BIG_SELECTS', 'ON'),
('EXPIRE_LOGS_DAYS', '0'),
('BINLOG_STMT_CACHE_SIZE', '32768'),
('HAVE_PARTITIONING', 'YES'),
('QUERY_CACHE_SIZE', '0'),
('FOREIGN_KEY_CHECKS', 'ON'),
('MAX_USER_CONNECTIONS', '0'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('BINLOG_FORMAT', 'STATEMENT'),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('LOG', 'OFF'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('LOG_BIN', 'OFF'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('INNODB_PURGE_BATCH_SIZE', '20'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('VERSION', '5.5.25'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_SUPPORT_XA', 'ON'),
('SSL_CAPATH', ''),
('INNODB_SYNC_SPIN_LOOPS', '30'),
('VERSION_COMMENT', 'Source distribution'),
('COLLATION_CONNECTION', 'latin1_swedish_ci'),
('SYNC_RELAY_LOG', '0'),
('INNODB_ADAPTIVE_FLUSHING', 'ON'),
('THREAD_STACK', '262144'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('SYSTEM_TIME_ZONE', 'GMT'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('DIV_PRECISION_INCREMENT', '4'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('STORED_PROGRAM_CACHE', '256'),
('TIMED_MUTEXES', 'OFF'),
('INNODB_DATA_HOME_DIR', ''),
('INNODB_READ_IO_THREADS', '4'),
('SERVER_ID', '0'),
('INNODB_WRITE_IO_THREADS', '4'),
('CHARACTER_SET_DATABASE', 'latin1'),
('INNODB_BUFFER_POOL_INSTANCES', '1'),
('INNODB_FORCE_RECOVERY', '0'),
('VERSION_COMPILE_MACHINE', 'i386'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('TABLE_DEFINITION_CACHE', '400'),
('REPORT_USER', ''),
('HAVE_DYNAMIC_LOADING', 'YES'),
('NET_READ_TIMEOUT', '30'),
('SYNC_BINLOG', '0'),
('TMP_TABLE_SIZE', '16777216'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('INNODB_OPEN_FILES', '300'),
('QUERY_CACHE_TYPE', 'ON'),
('INNODB_FILE_FORMAT_CHECK', 'ON'),
('SQL_BIG_TABLES', 'OFF'),
('INNODB_READ_AHEAD_THRESHOLD', '56'),
('TABLE_OPEN_CACHE', '400'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('MAX_SP_RECURSION_DEPTH', '0'),
('KEY_BUFFER_SIZE', '8388608'),
('REPORT_PORT', '3306'),
('HAVE_NDBCLUSTER', 'NO'),
('SSL_CIPHER', ''),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_STATS_METHOD', 'nulls_equal'),
('NEW', 'OFF'),
('INNODB_FAST_SHUTDOWN', '1'),
('SQL_MODE', ''),
('SSL_CA', ''),
('SQL_SAFE_UPDATES', 'OFF'),
('INNODB_THREAD_CONCURRENCY', '0'),
('LARGE_PAGE_SIZE', '0'),
('SLAVE_NET_TIMEOUT', '3600'),
('SECURE_FILE_PRIV', ''),
('INNODB_STATS_SAMPLE_PAGES', '8'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('LOCAL_INFILE', 'ON'),
('SQL_BUFFER_RESULT', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('HAVE_PROFILING', 'YES'),
('HAVE_CSV', 'YES'),
('OLD_ALTER_TABLE', 'OFF'),
('OLD', 'OFF'),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('PRELOAD_BUFFER_SIZE', '32768'),
('PERFORMANCE_SCHEMA_MAX_FILE_HANDLES', '32768'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('RELAY_LOG_RECOVERY', 'OFF'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('MAX_DELAYED_THREADS', '20'),
('LOG_ERROR', '/Applications/MAMP/logs/mysql_error_log.err'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('GENERAL_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('SORT_BUFFER_SIZE', '2097152'),
('MAX_RELAY_LOG_SIZE', '0'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('INNODB_RANDOM_READ_AHEAD', 'OFF'),
('MAX_CONNECTIONS', '151'),
('DATADIR', '/Applications/MAMP/db/mysql/'),
('FT_MIN_WORD_LEN', '4'),
('PORT', '3306'),
('VERSION_COMPILE_OS', 'osx10.6'),
('MYISAM_REPAIR_THREADS', '1'),
('MYISAM_USE_MMAP', 'OFF'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('SQL_WARNINGS', 'OFF'),
('INNODB_FORCE_LOAD_CORRUPTED', 'OFF'),
('RELAY_LOG', ''),
('HAVE_OPENSSL', 'NO'),
('PLUGIN_DIR', '/Applications/MAMP/Library/lib/plugin/'),
('MAX_BINLOG_STMT_CACHE_SIZE', '18446744073709547520'),
('LOG_SLOW_QUERIES', 'OFF'),
('PERFORMANCE_SCHEMA_MAX_FILE_INSTANCES', '10000'),
('MAX_TMP_TABLES', '32'),
('INNODB_SPIN_WAIT_DELAY', '6'),
('SQL_LOG_OFF', 'OFF'),
('INNODB_FILE_FORMAT_MAX', 'Antelope'),
('SLOW_QUERY_LOG_FILE', '/Applications/MAMP/db/mysql/alexandria-seiers-macbook-pro-slow.log'),
('DEFAULT_STORAGE_ENGINE', 'InnoDB'),
('SQL_SLAVE_SKIP_COUNTER', '0'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('SECURE_AUTH', 'OFF'),
('INNODB_OLD_BLOCKS_TIME', '0'),
('SYNC_FRM', 'ON'),
('RPL_RECOVERY_RANK', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('MAX_ALLOWED_PACKET', '1048576'),
('AUTOCOMMIT', 'ON'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,engine_condition_pushdown=on'),
('INNODB_FLUSH_METHOD', ''),
('LOCKED_IN_MEMORY', 'OFF'),
('CHARACTER_SET_CLIENT', 'latin1'),
('INNODB_CHECKSUMS', 'ON'),
('STORAGE_ENGINE', 'InnoDB'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('HAVE_SSL', 'NO'),
('SSL_KEY', ''),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('CONCURRENT_INSERT', 'AUTO'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('LOG_SLAVE_UPDATES', 'OFF'),
('SYNC_MASTER_INFO', '0'),
('RELAY_LOG_PURGE', 'ON'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('SSL_CERT', ''),
('INNODB_LARGE_PREFIX', 'OFF'),
('SOCKET', '/Applications/MAMP/tmp/mysql/mysql.sock'),
('INNODB_LOG_BUFFER_SIZE', '8388608'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('INNODB_MAX_PURGE_LAG', '0'),
('SLAVE_LOAD_TMPDIR', '/var/folders/wn/lbd299qx2vjd9dpx6hy85v780000gn/T/'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '8388608'),
('SLAVE_TYPE_CONVERSIONS', ''),
('INNODB_USE_SYS_MALLOC', 'ON'),
('SQL_NOTES', 'ON'),
('INNODB_MAX_DIRTY_PAGES_PCT', '75'),
('PERFORMANCE_SCHEMA_MAX_TABLE_INSTANCES', '50000'),
('THREAD_CONCURRENCY', '10'),
('UNIQUE_CHECKS', 'ON'),
('INNODB_OLD_BLOCKS_PCT', '37');

-- --------------------------------------------------------

--
-- Structure de la table `KEY_COLUMN_USAGE`
--

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
('def', 'daral', 'PRIMARY', 'def', 'daral', 'animal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'animal_id', 'def', 'daral', 'animal', 'animal_id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'animal_ibfk_1', 'def', 'daral', 'animal', 'fk_id_farmer', 1, 1, 'daral', 'farmer', 'id_farmer'),
('def', 'daral', 'animal_ibfk_2', 'def', 'daral', 'animal', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'animaltype', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'name', 'def', 'daral', 'animaltype', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'animal_tag', 'def', 'daral', 'animaltype', 'animal_tag', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'categorie', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'categorie_id', 'def', 'daral', 'categorie', 'categorie_id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'cheptel', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'cheptel_ibfk_1', 'def', 'daral', 'cheptel', 'fk_id_farmer', 1, 1, 'daral', 'farmer', 'id_farmer'),
('def', 'daral', 'cheptel_ibfk_2', 'def', 'daral', 'cheptel', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'daral', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'name', 'def', 'daral', 'daral', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'daral_ibfk_3', 'def', 'daral', 'daral', 'id_localite', 1, 1, 'daral', 'localite', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'daralstatanimal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'daralstatanimal_ibfk_1', 'def', 'daral', 'daralstatanimal', 'fk_daral_name', 1, 1, 'daral', 'daral', 'name'),
('def', 'daral', 'daralstatanimal_ibfk_2', 'def', 'daral', 'daralstatanimal', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'daralstatfarmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'daralstatfarmer_ibfk_1', 'def', 'daral', 'daralstatfarmer', 'fk_daral_name', 1, 1, 'daral', 'daral', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'departement', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'name', 'def', 'daral', 'departement', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'departement_ibfk_1', 'def', 'daral', 'departement', 'region', 1, 1, 'daral', 'region', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'departementstatanimal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'departementstatanimal_ibfk_1', 'def', 'daral', 'departementstatanimal', 'fk_departement_name', 1, 1, 'daral', 'departement', 'name'),
('def', 'daral', 'departementstatanimal_ibfk_2', 'def', 'daral', 'departementstatanimal', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'departementstatfarmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'departementstatfarmer_ibfk_1', 'def', 'daral', 'departementstatfarmer', 'fk_departement_name', 1, 1, 'daral', 'departement', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'farmer', 'rank_farmer', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'id_farmer', 'def', 'daral', 'farmer', 'id_farmer', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'farmer_ibfk_17', 'def', 'daral', 'farmer', 'region', 1, 1, 'daral', 'region', 'name'),
('def', 'daral', 'farmer_ibfk_13', 'def', 'daral', 'farmer', 'daral_actuel', 1, 1, 'daral', 'daral', 'name'),
('def', 'daral', 'farmer_ibfk_15', 'def', 'daral', 'farmer', 'id_localite', 1, 1, 'daral', 'localite', 'name'),
('def', 'daral', 'farmer_ibfk_16', 'def', 'daral', 'farmer', 'departement', 1, 1, 'daral', 'departement', 'name'),
('def', 'daral', 'farmer_ibfk_8', 'def', 'daral', 'farmer', 'categorie', 1, 1, 'daral', 'categorie', 'categorie_id'),
('def', 'daral', 'farmer_ibfk_9', 'def', 'daral', 'farmer', 'daral_originel', 1, 1, 'daral', 'daral', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'langue', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'libelle', 'def', 'daral', 'langue', 'libelle', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'localite', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'name', 'def', 'daral', 'localite', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'localite_ibfk_1', 'def', 'daral', 'localite', 'departement', 1, 1, 'daral', 'departement', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'localitestatanimal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'localitestatanimal_ibfk_1', 'def', 'daral', 'localitestatanimal', 'fk_localite_name', 1, 1, 'daral', 'localite', 'name'),
('def', 'daral', 'localitestatanimal_ibfk_2', 'def', 'daral', 'localitestatanimal', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'localitestatfarmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'localitestatfarmer_ibfk_1', 'def', 'daral', 'localitestatfarmer', 'fk_localite_name', 1, 1, 'daral', 'localite', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'maladie', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'libelle', 'def', 'daral', 'maladie', 'libelle', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'media', 'id_media', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'media_ibfk_1', 'def', 'daral', 'media', 'langue', 1, 1, 'daral', 'langue', 'libelle'),
('def', 'daral', 'media_ibfk_2', 'def', 'daral', 'media', 'maladie', 1, 1, 'daral', 'maladie', 'libelle'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'national', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'national_ibfk_1', 'def', 'daral', 'national', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'notification', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'notification_ibfk_25', 'def', 'daral', 'notification', 'id_user', 1, 1, 'daral', 'users', 'id'),
('def', 'daral', 'notification_ibfk_22', 'def', 'daral', 'notification', 'id_farmer', 1, 1, 'daral', 'farmer', 'id_farmer'),
('def', 'daral', 'notification_ibfk_23', 'def', 'daral', 'notification', 'id_localite', 1, 1, 'daral', 'localite', 'id'),
('def', 'daral', 'notification_ibfk_24', 'def', 'daral', 'notification', 'type', 1, 1, 'daral', 'typenotification', 'id'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'region', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'name', 'def', 'daral', 'region', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'regionstatanimal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'regionstatanimal_ibfk_1', 'def', 'daral', 'regionstatanimal', 'fk_region_name', 1, 1, 'daral', 'region', 'name'),
('def', 'daral', 'regionstatanimal_ibfk_2', 'def', 'daral', 'regionstatanimal', 'fk_animaltype', 1, 1, 'daral', 'animaltype', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'regionstatfarmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'regionstatfarmer_ibfk_1', 'def', 'daral', 'regionstatfarmer', 'fk_region_name', 1, 1, 'daral', 'region', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'roleusers', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'description', 'def', 'daral', 'roleusers', 'description', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'typenotification', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'libelle', 'def', 'daral', 'typenotification', 'libelle', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'users', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'username', 'def', 'daral', 'users', 'username', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'users_ibfk_1', 'def', 'daral', 'users', 'role', 1, 1, 'daral', 'roleusers', 'description'),
('def', 'daral', 'users_ibfk_2', 'def', 'daral', 'users', 'user_daral', 1, 1, 'daral', 'daral', 'name'),
('def', 'daral', 'PRIMARY', 'def', 'daral', 'veterinaire', 'rank_veterinaire', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'id_veterinaire', 'def', 'daral', 'veterinaire', 'id_veterinaire', 1, NULL, NULL, NULL, NULL),
('def', 'daral', 'id_veterinaire', 'def', 'daral', 'veterinaire', 'email_veterinaire', 2, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'animal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'animal_ibfk_1', 'def', 'daral_09_01_13', 'animal', 'fk_id_farmer', 1, 1, 'daral_09_01_13', 'farmer', 'id_farmer'),
('def', 'daral_09_01_13', 'animal_ibfk_2', 'def', 'daral_09_01_13', 'animal', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'animal_type', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'name', 'def', 'daral_09_01_13', 'animal_type', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'categorie', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'categorie_id', 'def', 'daral_09_01_13', 'categorie', 'categorie_id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'cheptel', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'cheptel_ibfk_1', 'def', 'daral_09_01_13', 'cheptel', 'fk_id_farmer', 1, 1, 'daral_09_01_13', 'farmer', 'id_farmer'),
('def', 'daral_09_01_13', 'cheptel_ibfk_2', 'def', 'daral_09_01_13', 'cheptel', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'daral', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'name', 'def', 'daral_09_01_13', 'daral', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'daral_ibfk_3', 'def', 'daral_09_01_13', 'daral', 'id_localite', 1, 1, 'daral_09_01_13', 'localite', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'daral_stat_animal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'daral_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'daral_stat_animal', 'fk_daral_name', 1, 1, 'daral_09_01_13', 'daral', 'name'),
('def', 'daral_09_01_13', 'daral_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'daral_stat_animal', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'daral_stat_farmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'daral_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'daral_stat_farmer', 'fk_daral_name', 1, 1, 'daral_09_01_13', 'daral', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'departement', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'name', 'def', 'daral_09_01_13', 'departement', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'departement_ibfk_1', 'def', 'daral_09_01_13', 'departement', 'region', 1, 1, 'daral_09_01_13', 'region', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'departement_stat_animal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'departement_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'departement_stat_animal', 'fk_departement_name', 1, 1, 'daral_09_01_13', 'departement', 'name'),
('def', 'daral_09_01_13', 'departement_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'departement_stat_animal', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'departement_stat_farmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'departement_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'departement_stat_farmer', 'fk_departement_name', 1, 1, 'daral_09_01_13', 'departement', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'farmer', 'rank_farmer', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'id_farmer', 'def', 'daral_09_01_13', 'farmer', 'id_farmer', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'farmer_ibfk_11', 'def', 'daral_09_01_13', 'farmer', 'id_localite', 1, 1, 'daral_09_01_13', 'localite', 'name'),
('def', 'daral_09_01_13', 'farmer_ibfk_13', 'def', 'daral_09_01_13', 'farmer', 'daral_actuel', 1, 1, 'daral_09_01_13', 'daral', 'name'),
('def', 'daral_09_01_13', 'farmer_ibfk_8', 'def', 'daral_09_01_13', 'farmer', 'categorie', 1, 1, 'daral_09_01_13', 'categorie', 'categorie_id'),
('def', 'daral_09_01_13', 'farmer_ibfk_9', 'def', 'daral_09_01_13', 'farmer', 'daral_originel', 1, 1, 'daral_09_01_13', 'daral', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'langue', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'libelle', 'def', 'daral_09_01_13', 'langue', 'libelle', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'localite', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'name', 'def', 'daral_09_01_13', 'localite', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'localite_ibfk_1', 'def', 'daral_09_01_13', 'localite', 'departement', 1, 1, 'daral_09_01_13', 'departement', 'name'),
('def', 'daral_09_01_13', 'localite_ibfk_2', 'def', 'daral_09_01_13', 'localite', 'region', 1, 1, 'daral_09_01_13', 'region', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'localite_stat_animal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'localite_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'localite_stat_animal', 'fk_localite_name', 1, 1, 'daral_09_01_13', 'localite', 'name'),
('def', 'daral_09_01_13', 'localite_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'localite_stat_animal', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'localite_stat_farmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'localite_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'localite_stat_farmer', 'fk_localite_name', 1, 1, 'daral_09_01_13', 'localite', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'maladie', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'libelle', 'def', 'daral_09_01_13', 'maladie', 'libelle', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'media', 'id_media', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'media_ibfk_1', 'def', 'daral_09_01_13', 'media', 'langue', 1, 1, 'daral_09_01_13', 'langue', 'libelle'),
('def', 'daral_09_01_13', 'media_ibfk_2', 'def', 'daral_09_01_13', 'media', 'maladie', 1, 1, 'daral_09_01_13', 'maladie', 'libelle'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'national', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'national_ibfk_1', 'def', 'daral_09_01_13', 'national', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'notification', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'notification_ibfk_1', 'def', 'daral_09_01_13', 'notification', 'id_farmer', 1, 1, 'daral_09_01_13', 'farmer', 'id_farmer'),
('def', 'daral_09_01_13', 'notification_ibfk_2', 'def', 'daral_09_01_13', 'notification', 'id_localite', 1, 1, 'daral_09_01_13', 'localite', 'name'),
('def', 'daral_09_01_13', 'notification_ibfk_3', 'def', 'daral_09_01_13', 'notification', 'type', 1, 1, 'daral_09_01_13', 'type_notification', 'libelle'),
('def', 'daral_09_01_13', 'notification_ibfk_4', 'def', 'daral_09_01_13', 'notification', 'id_user', 1, 1, 'daral_09_01_13', 'users', 'username'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'region', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'name', 'def', 'daral_09_01_13', 'region', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'region_stat_animal', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'region_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'region_stat_animal', 'fk_region_name', 1, 1, 'daral_09_01_13', 'region', 'name'),
('def', 'daral_09_01_13', 'region_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'region_stat_animal', 'fk_animal_type', 1, 1, 'daral_09_01_13', 'animal_type', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'region_stat_farmer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'region_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'region_stat_farmer', 'fk_region_name', 1, 1, 'daral_09_01_13', 'region', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'role_users', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'description', 'def', 'daral_09_01_13', 'role_users', 'description', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'type_notification', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'libelle', 'def', 'daral_09_01_13', 'type_notification', 'libelle', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'users', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'username', 'def', 'daral_09_01_13', 'users', 'username', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'users_ibfk_1', 'def', 'daral_09_01_13', 'users', 'role', 1, 1, 'daral_09_01_13', 'role_users', 'description'),
('def', 'daral_09_01_13', 'users_ibfk_2', 'def', 'daral_09_01_13', 'users', 'user_daral', 1, 1, 'daral_09_01_13', 'daral', 'name'),
('def', 'daral_09_01_13', 'PRIMARY', 'def', 'daral_09_01_13', 'veterinaire', 'rank_veterinaire', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'id_veterinaire', 'def', 'daral_09_01_13', 'veterinaire', 'id_veterinaire', 1, NULL, NULL, NULL, NULL),
('def', 'daral_09_01_13', 'id_veterinaire', 'def', 'daral_09_01_13', 'veterinaire', 'email_veterinaire', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'columns_priv', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'columns_priv', 'Db', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'columns_priv', 'User', 3, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'columns_priv', 'Table_name', 4, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'columns_priv', 'Column_name', 5, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'db', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'db', 'Db', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'db', 'User', 3, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'event', 'db', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'event', 'name', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'func', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'help_category', 'help_category_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'name', 'def', 'mysql', 'help_category', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'help_keyword', 'help_keyword_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'name', 'def', 'mysql', 'help_keyword', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'help_relation', 'help_keyword_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'help_relation', 'help_topic_id', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'help_topic', 'help_topic_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'name', 'def', 'mysql', 'help_topic', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'host', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'host', 'Db', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'ndb_binlog_index', 'epoch', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'plugin', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proc', 'db', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proc', 'name', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proc', 'type', 3, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'procs_priv', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'procs_priv', 'Db', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'procs_priv', 'User', 3, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'procs_priv', 'Routine_name', 4, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'procs_priv', 'Routine_type', 5, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proxies_priv', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proxies_priv', 'User', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proxies_priv', 'Proxied_host', 3, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'proxies_priv', 'Proxied_user', 4, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'servers', 'Server_name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'tables_priv', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'tables_priv', 'Db', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'tables_priv', 'User', 3, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'tables_priv', 'Table_name', 4, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone', 'Time_zone_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone_leap_second', 'Transition_time', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone_name', 'Name', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone_transition', 'Time_zone_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone_transition', 'Transition_time', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone_transition_type', 'Time_zone_id', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'time_zone_transition_type', 'Transition_type_id', 2, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'user', 'Host', 1, NULL, NULL, NULL, NULL),
('def', 'mysql', 'PRIMARY', 'def', 'mysql', 'user', 'User', 2, NULL, NULL, NULL, NULL),
('def', 'test', 'PRIMARY', 'def', 'test', 'news', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'actions', 'action_id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'actions_log', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'alert', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'uniq_alert_code', 'def', 'ushahidi_db', 'alert', 'alert_code', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'alert_category', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'alert_sent', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'api_banned', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'api_log', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'api_settings', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'badge', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'badge_users', 'user_id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'badge_users', 'badge_id', 2, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'category', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'category_lang', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'checkin', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'city', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'cluster', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'comment', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'country', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'externalapp', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'feed', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'feed_item', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'form', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'form_field', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'field_name', 'def', 'ushahidi_db', 'form_field', 'field_name', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'form_field_option', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'form_response', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'geometry', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'incident', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'incident_category', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'incident_category_ids', 'def', 'ushahidi_db', 'incident_category', 'incident_id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'incident_category_ids', 'def', 'ushahidi_db', 'incident_category', 'category_id', 2, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'incident_lang', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'incident_person', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'layer', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'level', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'location', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'maintenance', 'allowed_ip', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'media', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'message', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'openid', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'page', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'permissions', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'name_UNIQUE', 'def', 'ushahidi_db', 'permissions', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'permissions_roles', 'role_id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'permissions_roles', 'permission_id', 2, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'plugin', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'plugin_name', 'def', 'ushahidi_db', 'plugin', 'plugin_name', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'private_message', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'rating', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'reporter', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'roles', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'uniq_name', 'def', 'ushahidi_db', 'roles', 'name', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'roles_users', 'user_id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'roles_users', 'role_id', 2, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'scheduler', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'scheduler_log', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'service', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'sessions', 'session_id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'settings', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'uq_settings_key', 'def', 'ushahidi_db', 'settings', 'key', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'user_devices', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'user_tokens', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'uniq_token', 'def', 'ushahidi_db', 'user_tokens', 'token', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'users', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'uniq_username', 'def', 'ushahidi_db', 'users', 'username', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'uniq_email', 'def', 'ushahidi_db', 'users', 'email', 1, NULL, NULL, NULL, NULL),
('def', 'ushahidi_db', 'PRIMARY', 'def', 'ushahidi_db', 'verified', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'animal', 'id_animal', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'animal_ibfk_1', 'def', 'zf_daral', 'animal', 'id_eleveur', 1, 1, 'zf_daral', 'farmer', 'id_farmer'),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'daral', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'daral_ibfk_1', 'def', 'zf_daral', 'daral', 'id_localite', 1, 1, 'zf_daral', 'localite', 'id'),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'farmer', 'rank_farmer', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'farmer_ibfk_1', 'def', 'zf_daral', 'farmer', 'daral_number', 1, 1, 'zf_daral', 'daral', 'id'),
('def', 'zf_daral', 'farmer_ibfk_2', 'def', 'zf_daral', 'farmer', 'id_localite', 1, 1, 'zf_daral', 'localite', 'id'),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'lang', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'localite', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'maladie', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'media', 'id_media', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'media_ibfk_1', 'def', 'zf_daral', 'media', 'langue', 1, 1, 'zf_daral', 'lang', 'id'),
('def', 'zf_daral', 'media_ibfk_2', 'def', 'zf_daral', 'media', 'maladie', 1, 1, 'zf_daral', 'maladie', 'id'),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'notification', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'notification_ibfk_3', 'def', 'zf_daral', 'notification', 'id_farmer', 1, 1, 'zf_daral', 'farmer', 'id_farmer'),
('def', 'zf_daral', 'notification_ibfk_4', 'def', 'zf_daral', 'notification', 'id_localite', 1, 1, 'zf_daral', 'localite', 'id'),
('def', 'zf_daral', 'notification_ibfk_5', 'def', 'zf_daral', 'notification', 'id_user', 1, 1, 'zf_daral', 'users', 'id'),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'users', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'zf_daral', 'PRIMARY', 'def', 'zf_daral', 'veterinaire', 'rank_veterinaire', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `PARAMETERS`
--

CREATE TEMPORARY TABLE `PARAMETERS` (
  `SPECIFIC_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `SPECIFIC_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` int(21) NOT NULL DEFAULT '0',
  `PARAMETER_MODE` varchar(5) DEFAULT NULL,
  `PARAMETER_NAME` varchar(64) DEFAULT NULL,
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext NOT NULL,
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `PARTITIONS`
--

CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(18) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `PARTITIONS`
--

INSERT INTO `PARTITIONS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `PARTITION_NAME`, `SUBPARTITION_NAME`, `PARTITION_ORDINAL_POSITION`, `SUBPARTITION_ORDINAL_POSITION`, `PARTITION_METHOD`, `SUBPARTITION_METHOD`, `PARTITION_EXPRESSION`, `SUBPARTITION_EXPRESSION`, `PARTITION_DESCRIPTION`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `CHECKSUM`, `PARTITION_COMMENT`, `NODEGROUP`, `TABLESPACE_NAME`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 384, 0, 16434816, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLLATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 231, 0, 16704765, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 195, 0, 16357770, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLUMNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLUMN_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2565, 0, 16757145, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'ENGINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 490, 0, 16574250, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'EVENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'FILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2677, 0, 16758020, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'GLOBAL_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'GLOBAL_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'KEY_COLUMN_USAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4637, 0, 16762755, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PARAMETERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PARTITIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PLUGINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PROCESSLIST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PROFILING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 308, 0, 16562084, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4814, 0, 16767162, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'ROUTINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SCHEMATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3464, 0, 16738048, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2179, 0, 16736899, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SESSION_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SESSION_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5753, 0, 16752736, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9450, 0, 16764300, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLESPACES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6951, 0, 16772763, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLE_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2504, 0, 16721712, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLE_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2372, 0, 16748692, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TRIGGERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'USER_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1986, 0, 16726092, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'VIEWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMP_RESET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, 0, 13107200, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_TRX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4534, 0, 16766732, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, 0, 15204352, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_LOCK_WAITS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 599, 0, 16749238, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMPMEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, 0, 15204352, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, 0, 13107200, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_LOCKS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 31244, 0, 16746784, 0, 0, '2013-01-11 10:01:16', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 49152, 11534336, '2013-01-11 08:42:25', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'animaltype', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 32768, 11534336, '2013-01-11 08:45:49', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'categorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:23', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'cheptel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:27', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'daral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:27', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'daralstatanimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:27', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'daralstatfarmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:27', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'departement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 364, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:27', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'departementstatanimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:28', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'departementstatfarmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:28', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 16384, 16384, NULL, 131072, 11534336, '2013-01-11 09:49:56', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'langue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:24', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'localite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 32768, 11534336, '2013-01-11 09:10:41', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'localitestatanimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:28', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'localitestatfarmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:29', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'maladie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:25', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'media', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:29', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'national', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:29', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 98304, 11534336, '2013-01-11 08:39:59', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'region', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 1170, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:25', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'regionstatanimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 49152, 11534336, '2013-01-11 08:28:29', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'regionstatfarmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:30', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'roleusers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:26', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'typenotification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4096, 16384, NULL, 16384, 11534336, '2013-01-11 08:28:26', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 3276, 16384, NULL, 81920, 11534336, '2013-01-11 08:35:58', NULL, NULL, NULL, '', '', NULL),
('def', 'daral', 'veterinaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-11 08:28:26', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 159, 103, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:18', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'animal_type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 11534336, '2012-12-05 15:45:48', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'categorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 11534336, '2012-12-05 15:45:48', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'cheptel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1638, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:18', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'daral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:18', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'daral_stat_animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:18', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'daral_stat_farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-10 14:09:19', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'departement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 364, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:19', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'departement_stat_animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:19', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'departement_stat_farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-10 14:09:19', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 81920, 11534336, '2013-01-10 14:09:19', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'langue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2012-12-05 15:45:50', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'localite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 49152, 11534336, '2013-01-10 14:09:19', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'localite_stat_animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:20', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'localite_stat_farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2013-01-10 14:09:20', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'maladie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2012-12-12 17:15:07', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'media', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:20', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'national', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:20', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 98304, 11534336, '2013-01-10 14:09:20', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'region', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 1170, 16384, NULL, 16384, 11534336, '2012-12-05 15:45:52', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'region_stat_animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 49152, 11534336, '2013-01-10 14:09:20', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'region_stat_farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2013-01-10 14:09:21', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'role_users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 11534336, '2012-12-05 15:45:52', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'type_notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 11534336, '2012-12-05 15:45:53', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5461, 16384, NULL, 81920, 11534336, '2013-01-10 14:09:21', NULL, NULL, NULL, '', '', NULL),
('def', 'daral_09_01_13', 'veterinaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2012-12-05 15:45:53', NULL, NULL, NULL, '', '', NULL),
('def', 'mysql', 'columns_priv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 227994731135631359, 4096, 0, '2011-02-14 14:27:13', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'db', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 440, 2200, 123848989752688639, 5120, 440, '2011-02-14 14:27:19', '2013-01-05 07:53:26', NULL, NULL, '', '', NULL),
('def', 'mysql', 'event', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 2048, 0, '2011-02-14 14:27:19', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'func', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 162974011515469823, 1024, 0, '2011-02-14 14:27:14', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'general_log', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'mysql', 'help_category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 581, 20916, 163536961468891135, 3072, 0, '2006-03-15 14:53:39', '2012-07-10 12:13:05', '2009-08-11 12:59:56', NULL, '', '', NULL),
('def', 'mysql', 'help_keyword', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 378, 197, 74466, 55450570411999231, 13312, 0, '2006-03-15 14:53:40', '2012-07-10 12:13:05', '2009-08-11 12:59:56', NULL, '', '', NULL),
('def', 'mysql', 'help_relation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 726, 9, 6534, 2533274790395903, 12288, 0, '2006-03-15 14:53:39', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'help_topic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 458, 537, 246268, 281474976710655, 15360, 0, '2006-03-15 14:53:39', '2012-07-10 12:13:05', '2009-08-11 12:59:56', NULL, '', '', NULL),
('def', 'mysql', 'host', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 110056715893866495, 2048, 0, '2011-02-14 14:27:19', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'ndb_binlog_index', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2009-08-11 12:59:57', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'plugin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2011-02-14 14:27:15', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'proc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 308, 281474976710655, 4096, 308, '2011-02-14 14:27:18', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'procs_priv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 239253730204057599, 4096, 0, '2011-02-14 14:27:17', '2012-07-10 12:13:05', '2011-02-14 14:27:17', NULL, '', '', NULL),
('def', 'mysql', 'proxies_priv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 693, 693, 195062158860484607, 5120, 0, '2011-02-14 14:27:12', '2012-07-10 12:13:05', '2011-02-14 14:27:20', NULL, '', '', NULL),
('def', 'mysql', 'servers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 433752939111120895, 1024, 0, '2009-08-11 12:59:56', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'slow_log', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'mysql', 'tables_priv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 239535205180768255, 4096, 0, '2011-02-14 14:27:13', '2012-07-10 12:13:05', '2011-02-14 14:27:13', NULL, '', '', NULL),
('def', 'mysql', 'time_zone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1970324836974591, 1024, 0, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'time_zone_leap_second', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 3659174697238527, 1024, 0, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'time_zone_name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 55450570411999231, 1024, 0, '2006-03-15 14:53:40', '2012-07-10 12:13:05', '2009-08-11 12:59:56', NULL, '', '', NULL),
('def', 'mysql', 'time_zone_transition', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 4785074604081151, 1024, 0, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'time_zone_transition_type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 10696049115004927, 1024, 0, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, NULL, '', '', NULL),
('def', 'mysql', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 83, 420, 281474976710655, 2048, 88, '2011-02-14 14:27:20', '2013-01-05 07:53:26', NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'cond_instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'events_waits_current', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'events_waits_history', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'events_waits_history_long', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'events_waits_summary_by_instance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'file_instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'file_summary_by_event_name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'file_summary_by_instance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'mutex_instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'performance_timers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'rwlock_instances', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'setup_consumers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'setup_instruments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'setup_timers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'performance_schema', 'threads', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, '', '', NULL),
('def', 'test', 'jeux_video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 91, 4564, 281474976710655, 2048, 0, '2012-12-12 18:21:55', '2012-12-12 18:21:55', NULL, NULL, '', '', NULL),
('def', 'test', 'news', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 11534336, '2012-12-12 14:42:20', NULL, NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'actions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'actions_log', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 5910974510923775, 1024, 0, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'alert', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'alert_category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 4785074604081151, 1024, 0, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'alert_sent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 9288674231451647, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'api_banned', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'api_log', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'api_settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8162774324609023, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'badge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'badge_users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 2533274790395903, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 57, 228, 281474976710655, 3072, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'category_lang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'checkin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'city', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'cluster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 26177172834091007, 1024, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'comment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 247, 33, 8272, 281474976710655, 5120, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'externalapp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 80, 160, 281474976710655, 2048, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'feed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'feed_item', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'form', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 56, 56, 281474976710655, 2048, 0, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'form_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 4096, 0, '2012-11-30 08:45:16', '2012-11-30 08:45:16', '2012-11-30 08:45:16', NULL, '', '', NULL),
('def', 'ushahidi_db', 'form_field_option', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:16', '2012-11-30 08:45:16', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'form_response', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:16', '2012-11-30 08:45:16', '2012-11-30 08:45:16', NULL, '', '', NULL),
('def', 'ushahidi_db', 'geometry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'incident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 136, 136, 281474976710655, 7168, 0, '2012-11-30 08:45:17', '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, '', '', NULL),
('def', 'ushahidi_db', 'incident_category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, 17, 4785074604081151, 3072, 0, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'incident_lang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'incident_person', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'layer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'level', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 32, 164, 281474976710655, 2048, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 52, 52, 281474976710655, 3072, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, '', '', NULL),
('def', 'ushahidi_db', 'maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'media', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'message', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'openid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 4096, 0, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'page', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'permissions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 22, 412, 281474976710655, 3072, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'permissions_roles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, 9, 315, 2533274790395903, 2048, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'plugin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 21, 108, 281474976710655, 5120, 0, '2012-11-30 08:45:19', '2012-11-30 08:58:01', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'private_message', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'rating', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'reporter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'roles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 71, 284, 281474976710655, 3072, 0, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'roles_users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 27, 2533274790395903, 3072, 0, '2012-11-30 08:45:20', '2012-11-30 08:45:20', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'scheduler', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 54, 272, 281474976710655, 2048, 0, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'scheduler_log', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 28, 756, 281474976710655, 3072, 0, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 53, 160, 281474976710655, 2048, 0, '2012-11-30 08:45:20', '2012-11-30 08:45:20', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'sessions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1312, 2624, 281474976710655, 4096, 0, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, 34, 2304, 281474976710655, 5120, 72, '2012-11-30 08:45:20', '2012-11-30 09:06:37', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'user_devices', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 4096, 0, '2012-11-30 08:45:20', '2012-11-30 08:45:20', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'user_tokens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 96, 96, 281474976710655, 4096, 0, '2012-11-30 08:45:21', '2012-12-02 19:25:21', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 140, 140, 281474976710655, 7168, 0, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, NULL, '', '', NULL),
('def', 'ushahidi_db', 'verified', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8444249301319679, 1024, 0, '2012-11-30 08:45:21', '2012-11-30 08:45:21', NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'animal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 11534336, '2012-11-28 19:15:51', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'daral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1638, 16384, NULL, 16384, 11534336, '2012-11-28 19:15:51', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'farmer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 356, 16384, NULL, 65536, 11534336, '2012-11-28 20:00:38', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'lang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 11534336, '2012-11-28 19:15:50', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'localite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2730, 16384, NULL, 0, 11534336, '2012-11-28 19:15:50', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'maladie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 11534336, '2012-11-28 19:15:50', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'media', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 11534336, '2012-11-28 19:15:51', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 81920, 11534336, '2012-11-28 19:15:51', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 2048, 16384, NULL, 16384, 11534336, '2012-11-28 19:15:50', NULL, NULL, NULL, '', '', NULL),
('def', 'zf_daral', 'veterinaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 0, 11534336, '2012-11-28 19:15:51', NULL, NULL, NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `PLUGINS`
--

CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL,
  `LOAD_OPTION` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `PLUGINS`
--

INSERT INTO `PLUGINS` (`PLUGIN_NAME`, `PLUGIN_VERSION`, `PLUGIN_STATUS`, `PLUGIN_TYPE`, `PLUGIN_TYPE_VERSION`, `PLUGIN_LIBRARY`, `PLUGIN_LIBRARY_VERSION`, `PLUGIN_AUTHOR`, `PLUGIN_DESCRIPTION`, `PLUGIN_LICENSE`, `LOAD_OPTION`) VALUES
('binlog', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'MySQL AB', 'This is a pseudo storage engine to represent the binlog in a transaction', 'GPL', 'FORCE'),
('mysql_native_password', '1.0', 'ACTIVE', 'AUTHENTICATION', '1.0', NULL, NULL, 'R.J.Silk, Sergei Golubchik', 'Native MySQL authentication', 'GPL', 'FORCE'),
('mysql_old_password', '1.0', 'ACTIVE', 'AUTHENTICATION', '1.0', NULL, NULL, 'R.J.Silk, Sergei Golubchik', 'Old MySQL-4.0 authentication', 'GPL', 'FORCE'),
('CSV', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'Brian Aker, MySQL AB', 'CSV storage engine', 'GPL', 'FORCE'),
('MEMORY', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'MySQL AB', 'Hash based, stored in memory, useful for temporary tables', 'GPL', 'FORCE'),
('MyISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'MySQL AB', 'MyISAM storage engine', 'GPL', 'FORCE'),
('MRG_MYISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'MySQL AB', 'Collection of identical MyISAM tables', 'GPL', 'FORCE'),
('ARCHIVE', '3.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'Brian Aker, MySQL AB', 'Archive storage engine', 'GPL', 'ON'),
('BLACKHOLE', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'MySQL AB', '/dev/null storage engine (anything you write to it disappears)', 'GPL', 'ON'),
('FEDERATED', '1.0', 'DISABLED', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'Patrick Galbraith and Brian Aker, MySQL AB', 'Federated MySQL storage engine', 'GPL', 'OFF'),
('InnoDB', '1.1', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'Oracle Corporation', 'Supports transactions, row-level locking, and foreign keys', 'GPL', 'ON'),
('INNODB_TRX', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'InnoDB transactions', 'GPL', 'ON'),
('INNODB_LOCKS', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'InnoDB conflicting locks', 'GPL', 'ON'),
('INNODB_LOCK_WAITS', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'InnoDB which lock is blocking which', 'GPL', 'ON'),
('INNODB_CMP', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compression', 'GPL', 'ON'),
('INNODB_CMP_RESET', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compression; reset cumulated counts', 'GPL', 'ON'),
('INNODB_CMPMEM', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compressed buffer pool', 'GPL', 'ON'),
('INNODB_CMPMEM_RESET', '1.1', 'ACTIVE', 'INFORMATION SCHEMA', '50525.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compressed buffer pool; reset cumulated counts', 'GPL', 'ON'),
('PERFORMANCE_SCHEMA', '0.1', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'Marc Alff, Oracle', 'Performance Schema', 'GPL', 'FORCE'),
('partition', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50525.0', NULL, NULL, 'Mikael Ronstrom, MySQL AB', 'Partition Storage Engine Helper', 'GPL', 'ON');

-- --------------------------------------------------------

--
-- Structure de la table `PROCESSLIST`
--

CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `PROCESSLIST`
--

INSERT INTO `PROCESSLIST` (`ID`, `USER`, `HOST`, `DB`, `COMMAND`, `TIME`, `STATE`, `INFO`) VALUES
(1778, 'root', 'localhost', 'dbuser', 'Query', 0, 'executing', 'SELECT * FROM `information_schema`.`PROCESSLIST`');

-- --------------------------------------------------------

--
-- Structure de la table `PROFILING`
--

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `REFERENTIAL_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `REFERENTIAL_CONSTRAINTS`
--

INSERT INTO `REFERENTIAL_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `UNIQUE_CONSTRAINT_CATALOG`, `UNIQUE_CONSTRAINT_SCHEMA`, `UNIQUE_CONSTRAINT_NAME`, `MATCH_OPTION`, `UPDATE_RULE`, `DELETE_RULE`, `TABLE_NAME`, `REFERENCED_TABLE_NAME`) VALUES
('def', 'daral', 'animal_ibfk_1', 'def', 'daral', 'id_farmer', 'NONE', 'CASCADE', 'CASCADE', 'animal', 'farmer'),
('def', 'daral', 'animal_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'animal', 'animaltype'),
('def', 'daral', 'cheptel_ibfk_1', 'def', 'daral', 'id_farmer', 'NONE', 'CASCADE', 'CASCADE', 'cheptel', 'farmer'),
('def', 'daral', 'cheptel_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'cheptel', 'animaltype'),
('def', 'daral', 'daral_ibfk_3', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daral', 'localite'),
('def', 'daral', 'daralstatanimal_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daralstatanimal', 'daral'),
('def', 'daral', 'daralstatanimal_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daralstatanimal', 'animaltype'),
('def', 'daral', 'daralstatfarmer_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daralstatfarmer', 'daral'),
('def', 'daral', 'departement_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departement', 'region'),
('def', 'daral', 'departementstatanimal_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departementstatanimal', 'departement'),
('def', 'daral', 'departementstatanimal_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departementstatanimal', 'animaltype'),
('def', 'daral', 'departementstatfarmer_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departementstatfarmer', 'departement'),
('def', 'daral', 'farmer_ibfk_17', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'region'),
('def', 'daral', 'farmer_ibfk_13', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'daral'),
('def', 'daral', 'farmer_ibfk_15', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'localite'),
('def', 'daral', 'farmer_ibfk_16', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'departement'),
('def', 'daral', 'farmer_ibfk_8', 'def', 'daral', 'categorie_id', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'categorie'),
('def', 'daral', 'farmer_ibfk_9', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'daral'),
('def', 'daral', 'localite_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localite', 'departement'),
('def', 'daral', 'localitestatanimal_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localitestatanimal', 'localite'),
('def', 'daral', 'localitestatanimal_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localitestatanimal', 'animaltype'),
('def', 'daral', 'localitestatfarmer_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localitestatfarmer', 'localite'),
('def', 'daral', 'media_ibfk_1', 'def', 'daral', 'libelle', 'NONE', 'CASCADE', 'CASCADE', 'media', 'langue'),
('def', 'daral', 'media_ibfk_2', 'def', 'daral', 'libelle', 'NONE', 'CASCADE', 'CASCADE', 'media', 'maladie'),
('def', 'daral', 'national_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'national', 'animaltype'),
('def', 'daral', 'notification_ibfk_25', 'def', 'daral', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'users'),
('def', 'daral', 'notification_ibfk_22', 'def', 'daral', 'id_farmer', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'farmer'),
('def', 'daral', 'notification_ibfk_23', 'def', 'daral', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'localite'),
('def', 'daral', 'notification_ibfk_24', 'def', 'daral', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'typenotification'),
('def', 'daral', 'regionstatanimal_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'regionstatanimal', 'region'),
('def', 'daral', 'regionstatanimal_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'regionstatanimal', 'animaltype'),
('def', 'daral', 'regionstatfarmer_ibfk_1', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'regionstatfarmer', 'region'),
('def', 'daral', 'users_ibfk_1', 'def', 'daral', 'description', 'NONE', 'CASCADE', 'CASCADE', 'users', 'roleusers'),
('def', 'daral', 'users_ibfk_2', 'def', 'daral', 'name', 'NONE', 'CASCADE', 'CASCADE', 'users', 'daral'),
('def', 'daral_09_01_13', 'animal_ibfk_1', 'def', 'daral_09_01_13', 'id_farmer', 'NONE', 'CASCADE', 'CASCADE', 'animal', 'farmer'),
('def', 'daral_09_01_13', 'animal_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'animal', 'animal_type'),
('def', 'daral_09_01_13', 'cheptel_ibfk_1', 'def', 'daral_09_01_13', 'id_farmer', 'NONE', 'CASCADE', 'CASCADE', 'cheptel', 'farmer'),
('def', 'daral_09_01_13', 'cheptel_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'cheptel', 'animal_type'),
('def', 'daral_09_01_13', 'daral_ibfk_3', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daral', 'localite'),
('def', 'daral_09_01_13', 'daral_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daral_stat_animal', 'daral'),
('def', 'daral_09_01_13', 'daral_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daral_stat_animal', 'animal_type'),
('def', 'daral_09_01_13', 'daral_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'daral_stat_farmer', 'daral'),
('def', 'daral_09_01_13', 'departement_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departement', 'region'),
('def', 'daral_09_01_13', 'departement_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departement_stat_animal', 'departement'),
('def', 'daral_09_01_13', 'departement_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departement_stat_animal', 'animal_type'),
('def', 'daral_09_01_13', 'departement_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'departement_stat_farmer', 'departement'),
('def', 'daral_09_01_13', 'farmer_ibfk_11', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'localite'),
('def', 'daral_09_01_13', 'farmer_ibfk_13', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'daral'),
('def', 'daral_09_01_13', 'farmer_ibfk_8', 'def', 'daral_09_01_13', 'categorie_id', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'categorie'),
('def', 'daral_09_01_13', 'farmer_ibfk_9', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'farmer', 'daral'),
('def', 'daral_09_01_13', 'localite_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localite', 'departement'),
('def', 'daral_09_01_13', 'localite_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localite', 'region'),
('def', 'daral_09_01_13', 'localite_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localite_stat_animal', 'localite'),
('def', 'daral_09_01_13', 'localite_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localite_stat_animal', 'animal_type'),
('def', 'daral_09_01_13', 'localite_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'localite_stat_farmer', 'localite'),
('def', 'daral_09_01_13', 'media_ibfk_1', 'def', 'daral_09_01_13', 'libelle', 'NONE', 'CASCADE', 'CASCADE', 'media', 'langue'),
('def', 'daral_09_01_13', 'media_ibfk_2', 'def', 'daral_09_01_13', 'libelle', 'NONE', 'CASCADE', 'CASCADE', 'media', 'maladie'),
('def', 'daral_09_01_13', 'national_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'national', 'animal_type'),
('def', 'daral_09_01_13', 'notification_ibfk_1', 'def', 'daral_09_01_13', 'id_farmer', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'farmer'),
('def', 'daral_09_01_13', 'notification_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'localite'),
('def', 'daral_09_01_13', 'notification_ibfk_3', 'def', 'daral_09_01_13', 'libelle', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'type_notification'),
('def', 'daral_09_01_13', 'notification_ibfk_4', 'def', 'daral_09_01_13', 'username', 'NONE', 'CASCADE', 'CASCADE', 'notification', 'users'),
('def', 'daral_09_01_13', 'region_stat_animal_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'region_stat_animal', 'region'),
('def', 'daral_09_01_13', 'region_stat_animal_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'region_stat_animal', 'animal_type'),
('def', 'daral_09_01_13', 'region_stat_farmer_ibfk_1', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'region_stat_farmer', 'region'),
('def', 'daral_09_01_13', 'users_ibfk_1', 'def', 'daral_09_01_13', 'description', 'NONE', 'CASCADE', 'CASCADE', 'users', 'role_users'),
('def', 'daral_09_01_13', 'users_ibfk_2', 'def', 'daral_09_01_13', 'name', 'NONE', 'CASCADE', 'CASCADE', 'users', 'daral'),
('def', 'zf_daral', 'animal_ibfk_1', 'def', 'zf_daral', 'id_farmer', 'NONE', 'RESTRICT', 'RESTRICT', 'animal', 'farmer'),
('def', 'zf_daral', 'daral_ibfk_1', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'daral', 'localite'),
('def', 'zf_daral', 'farmer_ibfk_1', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'farmer', 'daral'),
('def', 'zf_daral', 'farmer_ibfk_2', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'farmer', 'localite'),
('def', 'zf_daral', 'media_ibfk_1', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'media', 'lang'),
('def', 'zf_daral', 'media_ibfk_2', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'media', 'maladie'),
('def', 'zf_daral', 'notification_ibfk_3', 'def', 'zf_daral', 'id_farmer', 'NONE', 'RESTRICT', 'RESTRICT', 'notification', 'farmer'),
('def', 'zf_daral', 'notification_ibfk_4', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'notification', 'localite'),
('def', 'zf_daral', 'notification_ibfk_5', 'def', 'zf_daral', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'notification', 'users');

-- --------------------------------------------------------

--
-- Structure de la table `ROUTINES`
--

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` longtext NOT NULL,
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `SCHEMATA`
--

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) NOT NULL DEFAULT '',
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
('def', 'information_schema', 'utf8', 'utf8_general_ci', NULL),
('def', 'daral', 'latin1', 'latin1_swedish_ci', NULL),
('def', 'daral_09_01_13', 'latin1', 'latin1_swedish_ci', NULL),
('def', 'dbuser', 'latin1', 'latin1_swedish_ci', NULL),
('def', 'mysql', 'latin1', 'latin1_swedish_ci', NULL),
('def', 'performance_schema', 'utf8', 'utf8_general_ci', NULL),
('def', 'test', 'latin1', 'latin1_swedish_ci', NULL),
('def', 'ushahidi_db', 'latin1', 'latin1_swedish_ci', NULL),
('def', 'zf_daral', 'latin1', 'latin1_swedish_ci', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `SCHEMA_PRIVILEGES`
--

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''admin''@''localhost''', 'def', 'daral', 'SELECT', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'INSERT', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'UPDATE', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'DELETE', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'CREATE', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'DROP', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'REFERENCES', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'INDEX', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'ALTER', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'CREATE TEMPORARY TABLES', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'LOCK TABLES', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'EXECUTE', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'CREATE VIEW', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'SHOW VIEW', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'CREATE ROUTINE', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'ALTER ROUTINE', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'EVENT', 'NO'),
('''admin''@''localhost''', 'def', 'daral', 'TRIGGER', 'NO'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'SELECT', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'INSERT', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'UPDATE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'DELETE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'CREATE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'DROP', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'REFERENCES', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'INDEX', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'ALTER', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'CREATE TEMPORARY TABLES', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'LOCK TABLES', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'EXECUTE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'CREATE VIEW', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'SHOW VIEW', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'CREATE ROUTINE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'ALTER ROUTINE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'EVENT', 'YES'),
('''ushahidi''@''localhost''', 'def', 'ushahidi_db', 'TRIGGER', 'YES'),
('''''@''%''', 'def', 'test', 'SELECT', 'NO'),
('''''@''%''', 'def', 'test', 'INSERT', 'NO'),
('''''@''%''', 'def', 'test', 'UPDATE', 'NO'),
('''''@''%''', 'def', 'test', 'DELETE', 'NO'),
('''''@''%''', 'def', 'test', 'CREATE', 'NO'),
('''''@''%''', 'def', 'test', 'DROP', 'NO'),
('''''@''%''', 'def', 'test', 'REFERENCES', 'NO'),
('''''@''%''', 'def', 'test', 'INDEX', 'NO'),
('''''@''%''', 'def', 'test', 'ALTER', 'NO'),
('''''@''%''', 'def', 'test', 'CREATE TEMPORARY TABLES', 'NO'),
('''''@''%''', 'def', 'test', 'LOCK TABLES', 'NO'),
('''''@''%''', 'def', 'test', 'CREATE VIEW', 'NO'),
('''''@''%''', 'def', 'test', 'SHOW VIEW', 'NO'),
('''''@''%''', 'def', 'test', 'CREATE ROUTINE', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'SELECT', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'INSERT', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'UPDATE', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'DELETE', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'CREATE', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'DROP', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'REFERENCES', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'INDEX', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'ALTER', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'CREATE TEMPORARY TABLES', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'LOCK TABLES', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'CREATE VIEW', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'SHOW VIEW', 'NO'),
('''''@''%''', 'def', 'test\\_%', 'CREATE ROUTINE', 'NO');

-- --------------------------------------------------------

--
-- Structure de la table `SESSION_STATUS`
--

CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `SESSION_STATUS`
--

INSERT INTO `SESSION_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '0'),
('ABORTED_CONNECTS', '0'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BINLOG_STMT_CACHE_DISK_USE', '0'),
('BINLOG_STMT_CACHE_USE', '0'),
('BYTES_RECEIVED', '22932'),
('BYTES_SENT', '635768'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '0'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '6'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '0'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '0'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '0'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESIGNAL', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '77'),
('COM_SET_OPTION', '78'),
('COM_SIGNAL', '0'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '0'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '73'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '1'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '0'),
('COM_SHOW_FUNCTION_STATUS', '4'),
('COM_SHOW_GRANTS', '0'),
('COM_SHOW_KEYS', '0'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '0'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '4'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_RELAYLOG_EVENTS', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '0'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '0'),
('COM_SHOW_TABLE_STATUS', '128'),
('COM_SHOW_TABLES', '4'),
('COM_SHOW_TRIGGERS', '72'),
('COM_SHOW_VARIABLES', '3'),
('COM_SHOW_WARNINGS', '0'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '0'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '1779'),
('CREATED_TMP_DISK_TABLES', '154'),
('CREATED_TMP_FILES', '17'),
('CREATED_TMP_TABLES', '471'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '52'),
('HANDLER_DELETE', '0'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '62'),
('HANDLER_READ_KEY', '52'),
('HANDLER_READ_LAST', '0'),
('HANDLER_READ_NEXT', '34'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '3917'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '0'),
('HANDLER_WRITE', '3486'),
('INNODB_BUFFER_POOL_PAGES_DATA', '672'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '1'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '3670'),
('INNODB_BUFFER_POOL_PAGES_FREE', '7518'),
('INNODB_BUFFER_POOL_PAGES_MISC', '2'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '8192'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD_EVICTED', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '348988'),
('INNODB_BUFFER_POOL_READS', '508'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '56694'),
('INNODB_DATA_FSYNCS', '1505'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '10506240'),
('INNODB_DATA_READS', '523'),
('INNODB_DATA_WRITES', '2779'),
('INNODB_DATA_WRITTEN', '123839488'),
('INNODB_DBLWR_PAGES_WRITTEN', '3670'),
('INNODB_DBLWR_WRITES', '157'),
('INNODB_HAVE_ATOMIC_BUILTINS', 'ON'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '7122'),
('INNODB_LOG_WRITES', '1108'),
('INNODB_OS_LOG_FSYNCS', '1190'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '3538432'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '165'),
('INNODB_PAGES_READ', '507'),
('INNODB_PAGES_WRITTEN', '3670'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '0'),
('INNODB_ROW_LOCK_TIME_AVG', '0'),
('INNODB_ROW_LOCK_TIME_MAX', '0'),
('INNODB_ROW_LOCK_WAITS', '0'),
('INNODB_ROWS_DELETED', '35'),
('INNODB_ROWS_INSERTED', '1354'),
('INNODB_ROWS_READ', '8133'),
('INNODB_ROWS_UPDATED', '23'),
('INNODB_TRUNCATED_STATUS_WRITES', '0'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '6685'),
('KEY_BLOCKS_USED', '13'),
('KEY_READ_REQUESTS', '45'),
('KEY_READS', '13'),
('KEY_WRITE_REQUESTS', '0'),
('KEY_WRITES', '0'),
('LAST_QUERY_COST', '10.499000'),
('MAX_USED_CONNECTIONS', '2'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '158'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '159'),
('OPEN_TABLES', '159'),
('OPENED_FILES', '14323'),
('OPENED_TABLE_DEFINITIONS', '0'),
('OPENED_TABLES', '159'),
('PERFORMANCE_SCHEMA_COND_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_COND_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_LOCKER_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_INSTANCES_LOST', '0'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '20248'),
('QUESTIONS', '450'),
('RPL_STATUS', 'AUTH_MASTER'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '292'),
('SLAVE_HEARTBEAT_PERIOD', '0.000'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RECEIVED_HEARTBEATS', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '0'),
('SORT_SCAN', '0'),
('TABLE_LOCKS_IMMEDIATE', '3444'),
('TABLE_LOCKS_WAITED', '0'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '1'),
('THREADS_CREATED', '1778'),
('THREADS_RUNNING', '1'),
('UPTIME', '71615'),
('UPTIME_SINCE_FLUSH_STATUS', '71615');

-- --------------------------------------------------------

--
-- Structure de la table `SESSION_VARIABLES`
--

CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `SESSION_VARIABLES`
--

INSERT INTO `SESSION_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('HAVE_CRYPT', 'YES'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_LONG_SIZE', '10000'),
('INNODB_VERSION', '1.1.8'),
('LAST_INSERT_ID', '0'),
('PSEUDO_THREAD_ID', '1778'),
('PERFORMANCE_SCHEMA_MAX_COND_INSTANCES', '1000'),
('HAVE_QUERY_CACHE', 'YES'),
('OLD_PASSWORDS', 'OFF'),
('PERFORMANCE_SCHEMA_MAX_FILE_CLASSES', '50'),
('PERFORMANCE_SCHEMA_MAX_THREAD_INSTANCES', '1000'),
('DELAYED_INSERT_TIMEOUT', '300'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_INSTANCES', '1000000'),
('TIME_FORMAT', '%H:%i:%s'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_INSTANCES', '1000000'),
('LC_MESSAGES', 'en_US'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_CLASSES', '30'),
('BASEDIR', '/Applications/MAMP/Library'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_CLASSES', '200'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('BACK_LOG', '50'),
('SLOW_LAUNCH_TIME', '2'),
('EVENT_SCHEDULER', 'OFF'),
('QUERY_CACHE_LIMIT', '1048576'),
('INIT_SLAVE', ''),
('RELAY_LOG_INDEX', ''),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('PERFORMANCE_SCHEMA', 'OFF'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('HAVE_GEOMETRY', 'YES'),
('WAIT_TIMEOUT', '28800'),
('LOCK_WAIT_TIMEOUT', '31536000'),
('PERFORMANCE_SCHEMA_MAX_TABLE_HANDLES', '100000'),
('CHARACTER_SETS_DIR', '/Applications/MAMP/Library/share/charsets/'),
('SKIP_NAME_RESOLVE', 'OFF'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('REPORT_HOST', ''),
('CHARACTER_SET_RESULTS', 'utf8'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('CHARACTER_SET_CONNECTION', 'utf8'),
('INNODB_ROLLBACK_SEGMENTS', '128'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('LARGE_FILES_SUPPORT', 'ON'),
('PID_FILE', '/Applications/MAMP/tmp/mysql/mysql.pid'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('SQL_LOG_BIN', 'ON'),
('NET_BUFFER_LENGTH', '16384'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('SKIP_SHOW_DATABASE', 'OFF'),
('FT_MAX_WORD_LEN', '84'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('LARGE_PAGES', 'OFF'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('LC_TIME_NAMES', 'en_US'),
('INIT_CONNECT', ''),
('MULTI_RANGE_COUNT', '256'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_SIZE', '10'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('LICENSE', 'GPL'),
('DELAYED_INSERT_LIMIT', '100'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('COMPLETION_TYPE', 'NO_CHAIN'),
('REPORT_PASSWORD', ''),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('MAX_ERROR_COUNT', '64'),
('HAVE_COMPRESS', 'YES'),
('AUTO_INCREMENT_OFFSET', '1'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('JOIN_BUFFER_SIZE', '131072'),
('THREAD_CACHE_SIZE', '0'),
('CONNECT_TIMEOUT', '10'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('LOWER_CASE_FILE_SYSTEM', 'ON'),
('INIT_FILE', ''),
('DEFAULT_WEEK_FORMAT', '0'),
('LC_MESSAGES_DIR', '/Applications/MAMP/Library/share/'),
('LOG_OUTPUT', 'FILE'),
('PERFORMANCE_SCHEMA_MAX_THREAD_CLASSES', '50'),
('INNODB_IO_CAPACITY', '200'),
('MAX_CONNECT_ERRORS', '10'),
('INNODB_USE_NATIVE_AIO', 'OFF'),
('PROTOCOL_VERSION', '10'),
('HAVE_SYMLINK', 'YES'),
('NET_WRITE_TIMEOUT', '60'),
('TIME_ZONE', '+00:00'),
('TIMESTAMP', '1357898476'),
('INNODB_TABLE_LOCKS', 'ON'),
('LOG_WARNINGS', '1'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('DELAYED_QUEUE_SIZE', '1000'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('MAX_LONG_DATA_SIZE', '1048576'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('OPEN_FILES_LIMIT', '2560'),
('SQL_AUTO_IS_NULL', 'OFF'),
('LOWER_CASE_TABLE_NAMES', '0'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('BINLOG_CACHE_SIZE', '32768'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('SYNC_RELAY_LOG_INFO', '0'),
('NET_RETRY_COUNT', '10'),
('INNODB_REPLICATION_DELAY', '0'),
('FT_STOPWORD_FILE', '(built-in)'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('DELAY_KEY_WRITE', 'ON'),
('INNODB_STATS_ON_METADATA', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('LONG_QUERY_TIME', '10.000000'),
('PROFILING_HISTORY_SIZE', '15'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('INNODB_CHANGE_BUFFERING', 'all'),
('INNODB_BUFFER_POOL_SIZE', '134217728'),
('READ_RND_BUFFER_SIZE', '262144'),
('HAVE_INNODB', 'YES'),
('INNODB_FILE_FORMAT', 'Antelope'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('BIG_TABLES', 'OFF'),
('FLUSH', 'OFF'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('METADATA_LOCKS_CACHE_SIZE', '1024'),
('DATE_FORMAT', '%Y-%m-%d'),
('CHARACTER_SET_SERVER', 'latin1'),
('READ_ONLY', 'OFF'),
('PROXY_USER', ''),
('RAND_SEED1', '0'),
('HOSTNAME', 'alexandria-seiers-macbook-pro.local'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('READ_BUFFER_SIZE', '131072'),
('INNODB_PURGE_THREADS', '0'),
('MAX_SORT_LENGTH', '1024'),
('PROFILING', 'OFF'),
('MAX_BINLOG_SIZE', '1073741824'),
('INNODB_STRICT_MODE', 'OFF'),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('FLUSH_TIME', '0'),
('GENERAL_LOG_FILE', '/Applications/MAMP/db/mysql/alexandria-seiers-macbook-pro.log'),
('QUERY_PREALLOC_SIZE', '8192'),
('PERFORMANCE_SCHEMA_MAX_COND_CLASSES', '80'),
('SLOW_QUERY_LOG', 'OFF'),
('AUTO_INCREMENT_INCREMENT', '1'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('TMPDIR', '/var/folders/wn/lbd299qx2vjd9dpx6hy85v780000gn/T/'),
('SQL_BIG_SELECTS', 'ON'),
('EXPIRE_LOGS_DAYS', '0'),
('BINLOG_STMT_CACHE_SIZE', '32768'),
('HAVE_PARTITIONING', 'YES'),
('QUERY_CACHE_SIZE', '0'),
('FOREIGN_KEY_CHECKS', 'ON'),
('MAX_USER_CONNECTIONS', '0'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('BINLOG_FORMAT', 'STATEMENT'),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('LOG', 'OFF'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('LOG_BIN', 'OFF'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('INNODB_PURGE_BATCH_SIZE', '20'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('VERSION', '5.5.25'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_SUPPORT_XA', 'ON'),
('SSL_CAPATH', ''),
('INNODB_SYNC_SPIN_LOOPS', '30'),
('VERSION_COMMENT', 'Source distribution'),
('COLLATION_CONNECTION', 'utf8_general_ci'),
('SYNC_RELAY_LOG', '0'),
('INNODB_ADAPTIVE_FLUSHING', 'ON'),
('THREAD_STACK', '262144'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('SYSTEM_TIME_ZONE', 'GMT'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('DIV_PRECISION_INCREMENT', '4'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('STORED_PROGRAM_CACHE', '256'),
('TIMED_MUTEXES', 'OFF'),
('INNODB_DATA_HOME_DIR', ''),
('EXTERNAL_USER', ''),
('INNODB_READ_IO_THREADS', '4'),
('SERVER_ID', '0'),
('INNODB_WRITE_IO_THREADS', '4'),
('CHARACTER_SET_DATABASE', 'latin1'),
('INNODB_BUFFER_POOL_INSTANCES', '1'),
('WARNING_COUNT', '0'),
('INNODB_FORCE_RECOVERY', '0'),
('VERSION_COMPILE_MACHINE', 'i386'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('TABLE_DEFINITION_CACHE', '400'),
('ERROR_COUNT', '0'),
('REPORT_USER', ''),
('HAVE_DYNAMIC_LOADING', 'YES'),
('NET_READ_TIMEOUT', '30'),
('SYNC_BINLOG', '0'),
('TMP_TABLE_SIZE', '16777216'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('INNODB_OPEN_FILES', '300'),
('QUERY_CACHE_TYPE', 'ON'),
('INNODB_FILE_FORMAT_CHECK', 'ON'),
('SQL_BIG_TABLES', 'OFF'),
('INNODB_READ_AHEAD_THRESHOLD', '56'),
('TABLE_OPEN_CACHE', '400'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('MAX_SP_RECURSION_DEPTH', '0'),
('KEY_BUFFER_SIZE', '8388608'),
('REPORT_PORT', '3306'),
('HAVE_NDBCLUSTER', 'NO'),
('SSL_CIPHER', ''),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_STATS_METHOD', 'nulls_equal'),
('NEW', 'OFF'),
('INNODB_FAST_SHUTDOWN', '1'),
('SQL_MODE', ''),
('SSL_CA', ''),
('SQL_SAFE_UPDATES', 'OFF'),
('INNODB_THREAD_CONCURRENCY', '0'),
('LARGE_PAGE_SIZE', '0'),
('SLAVE_NET_TIMEOUT', '3600'),
('SECURE_FILE_PRIV', ''),
('INNODB_STATS_SAMPLE_PAGES', '8'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('LOCAL_INFILE', 'ON'),
('SQL_BUFFER_RESULT', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('HAVE_PROFILING', 'YES'),
('HAVE_CSV', 'YES'),
('OLD_ALTER_TABLE', 'OFF'),
('OLD', 'OFF'),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('PRELOAD_BUFFER_SIZE', '32768'),
('PERFORMANCE_SCHEMA_MAX_FILE_HANDLES', '32768'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('RELAY_LOG_RECOVERY', 'OFF'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('MAX_DELAYED_THREADS', '20'),
('LOG_ERROR', '/Applications/MAMP/logs/mysql_error_log.err'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('GENERAL_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('SORT_BUFFER_SIZE', '2097152'),
('MAX_RELAY_LOG_SIZE', '0'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('INNODB_RANDOM_READ_AHEAD', 'OFF'),
('MAX_CONNECTIONS', '151'),
('DATADIR', '/Applications/MAMP/db/mysql/'),
('FT_MIN_WORD_LEN', '4'),
('PORT', '3306'),
('VERSION_COMPILE_OS', 'osx10.6'),
('MYISAM_REPAIR_THREADS', '1'),
('MYISAM_USE_MMAP', 'OFF'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('SQL_WARNINGS', 'OFF'),
('INNODB_FORCE_LOAD_CORRUPTED', 'OFF'),
('RELAY_LOG', ''),
('HAVE_OPENSSL', 'NO'),
('PLUGIN_DIR', '/Applications/MAMP/Library/lib/plugin/'),
('MAX_BINLOG_STMT_CACHE_SIZE', '18446744073709547520'),
('LOG_SLOW_QUERIES', 'OFF'),
('PERFORMANCE_SCHEMA_MAX_FILE_INSTANCES', '10000'),
('MAX_TMP_TABLES', '32'),
('INNODB_SPIN_WAIT_DELAY', '6'),
('SQL_LOG_OFF', 'OFF'),
('INNODB_FILE_FORMAT_MAX', 'Antelope'),
('SLOW_QUERY_LOG_FILE', '/Applications/MAMP/db/mysql/alexandria-seiers-macbook-pro-slow.log'),
('DEFAULT_STORAGE_ENGINE', 'InnoDB'),
('SQL_SLAVE_SKIP_COUNTER', '0'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('SECURE_AUTH', 'OFF'),
('INNODB_OLD_BLOCKS_TIME', '0'),
('SYNC_FRM', 'ON'),
('RPL_RECOVERY_RANK', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('MAX_ALLOWED_PACKET', '1048576'),
('AUTOCOMMIT', 'ON'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,engine_condition_pushdown=on'),
('INNODB_FLUSH_METHOD', ''),
('LOCKED_IN_MEMORY', 'OFF'),
('CHARACTER_SET_CLIENT', 'utf8'),
('INNODB_CHECKSUMS', 'ON'),
('STORAGE_ENGINE', 'InnoDB'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('HAVE_SSL', 'NO'),
('SSL_KEY', ''),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('CONCURRENT_INSERT', 'AUTO'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('LOG_SLAVE_UPDATES', 'OFF'),
('INSERT_ID', '0'),
('SYNC_MASTER_INFO', '0'),
('RELAY_LOG_PURGE', 'ON'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('SSL_CERT', ''),
('INNODB_LARGE_PREFIX', 'OFF'),
('SOCKET', '/Applications/MAMP/tmp/mysql/mysql.sock'),
('INNODB_LOG_BUFFER_SIZE', '8388608'),
('IDENTITY', '0'),
('RAND_SEED2', '0'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('INNODB_MAX_PURGE_LAG', '0'),
('SLAVE_LOAD_TMPDIR', '/var/folders/wn/lbd299qx2vjd9dpx6hy85v780000gn/T/'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '8388608'),
('SLAVE_TYPE_CONVERSIONS', ''),
('INNODB_USE_SYS_MALLOC', 'ON'),
('SQL_NOTES', 'ON'),
('INNODB_MAX_DIRTY_PAGES_PCT', '75'),
('PERFORMANCE_SCHEMA_MAX_TABLE_INSTANCES', '50000'),
('THREAD_CONCURRENCY', '10'),
('UNIQUE_CHECKS', 'ON'),
('INNODB_OLD_BLOCKS_PCT', '37');

-- --------------------------------------------------------

--
-- Structure de la table `STATISTICS`
--

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL,
  `INDEX_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`, `INDEX_COMMENT`) VALUES
('def', 'daral', 'animal', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animal', 0, 'daral', 'animal_id', 1, 'animal_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animal', 1, 'daral', 'fk_id_farmer', 1, 'fk_id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animal', 1, 'daral', 'fk_id_farmer', 2, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animal', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animaltype', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animaltype', 0, 'daral', 'name', 1, 'name', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'animaltype', 0, 'daral', 'animal_tag', 1, 'animal_tag', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'categorie', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'categorie', 0, 'daral', 'categorie_id', 1, 'categorie_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'cheptel', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'cheptel', 1, 'daral', 'fk_id_farmer', 1, 'fk_id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'cheptel', 1, 'daral', 'fk_id_farmer', 2, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'cheptel', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daral', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daral', 0, 'daral', 'name', 1, 'name', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daral', 1, 'daral', 'id_localite', 1, 'id_localite', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daralstatanimal', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daralstatanimal', 1, 'daral', 'fk_daral_name', 1, 'fk_daral_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daralstatanimal', 1, 'daral', 'fk_daral_name', 2, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daralstatanimal', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daralstatfarmer', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'daralstatfarmer', 1, 'daral', 'fk_daral_name', 1, 'fk_daral_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departement', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 45, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departement', 0, 'daral', 'name', 1, 'name', 'A', 45, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departement', 1, 'daral', 'region', 1, 'region', 'A', 45, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departementstatanimal', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departementstatanimal', 1, 'daral', 'fk_departement_name', 1, 'fk_departement_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departementstatanimal', 1, 'daral', 'fk_departement_name', 2, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departementstatanimal', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departementstatfarmer', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'departementstatfarmer', 1, 'daral', 'fk_departement_name', 1, 'fk_departement_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 0, 'daral', 'PRIMARY', 1, 'rank_farmer', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 0, 'daral', 'id_farmer', 1, 'id_farmer', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'categorie', 1, 'categorie', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'categorie', 2, 'daral_originel', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'categorie', 3, 'daral_actuel', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'categorie', 4, 'id_localite', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'daral_originel', 1, 'daral_originel', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'daral_actuel', 1, 'daral_actuel', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'id_localite', 1, 'id_localite', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'departement', 1, 'departement', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'departement', 2, 'region', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'departement_2', 1, 'departement', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'farmer', 1, 'daral', 'region', 1, 'region', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'langue', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'langue', 0, 'daral', 'libelle', 1, 'libelle', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localite', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localite', 0, 'daral', 'name', 1, 'name', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localite', 1, 'daral', 'departement', 1, 'departement', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localitestatanimal', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localitestatanimal', 1, 'daral', 'fk_localite_name', 1, 'fk_localite_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localitestatanimal', 1, 'daral', 'fk_localite_name', 2, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localitestatanimal', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localitestatfarmer', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'localitestatfarmer', 1, 'daral', 'fk_localite_name', 1, 'fk_localite_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'maladie', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'maladie', 0, 'daral', 'libelle', 1, 'libelle', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'media', 0, 'daral', 'PRIMARY', 1, 'id_media', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'media', 1, 'daral', 'langue', 1, 'langue', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'media', 1, 'daral', 'langue', 2, 'maladie', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'media', 1, 'daral', 'maladie', 1, 'maladie', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'national', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'national', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'national', 1, 'daral', 'fk_animaltype_2', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_farmer', 1, 'id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_farmer', 2, 'id_localite', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_farmer', 3, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_farmer', 4, 'id_user', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_localite', 1, 'id_localite', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_farmer_2', 1, 'id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'id_user', 1, 'id_user', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'type', 1, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'notification', 1, 'daral', 'type_2', 1, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'region', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 14, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'region', 0, 'daral', 'name', 1, 'name', 'A', 14, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatanimal', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatanimal', 1, 'daral', 'fk_region_name', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatanimal', 1, 'daral', 'fk_region_name', 2, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatanimal', 1, 'daral', 'fk_region_name_2', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatanimal', 1, 'daral', 'fk_animaltype', 1, 'fk_animaltype', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatfarmer', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatfarmer', 1, 'daral', 'fk_region_name', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'regionstatfarmer', 1, 'daral', 'fk_region_name_2', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'roleusers', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'roleusers', 0, 'daral', 'description', 1, 'description', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'typenotification', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'typenotification', 0, 'daral', 'libelle', 1, 'libelle', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 0, 'daral', 'PRIMARY', 1, 'id', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 0, 'daral', 'username', 1, 'username', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 1, 'daral', 'role', 1, 'role', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 1, 'daral', 'role', 2, 'user_daral', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 1, 'daral', 'user_daral', 1, 'user_daral', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 1, 'daral', 'role_2', 1, 'role', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'users', 1, 'daral', 'user_daral_2', 1, 'user_daral', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'veterinaire', 0, 'daral', 'PRIMARY', 1, 'rank_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'veterinaire', 0, 'daral', 'id_veterinaire', 1, 'id_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'veterinaire', 0, 'daral', 'id_veterinaire', 2, 'email_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral', 'veterinaire', 1, 'daral', 'localite_veterinaire', 1, 'localite_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'animal', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 159, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'animal', 1, 'daral_09_01_13', 'fk_id_farmer', 1, 'fk_id_farmer', 'A', 12, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'animal', 1, 'daral_09_01_13', 'fk_id_farmer', 2, 'fk_animal_type', 'A', 22, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'animal', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'animal_type', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'animal_type', 0, 'daral_09_01_13', 'name', 1, 'name', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'categorie', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'categorie', 0, 'daral_09_01_13', 'categorie_id', 1, 'categorie_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'cheptel', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'cheptel', 1, 'daral_09_01_13', 'fk_id_farmer', 1, 'fk_id_farmer', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'cheptel', 1, 'daral_09_01_13', 'fk_id_farmer', 2, 'fk_animal_type', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'cheptel', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral', 0, 'daral_09_01_13', 'name', 1, 'name', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral', 1, 'daral_09_01_13', 'id_localite', 1, 'id_localite', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 1, 'daral_09_01_13', 'fk_daral_name', 1, 'fk_daral_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 1, 'daral_09_01_13', 'fk_daral_name', 2, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral_stat_farmer', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'daral_stat_farmer', 1, 'daral_09_01_13', 'fk_daral_name', 1, 'fk_daral_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 45, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement', 0, 'daral_09_01_13', 'name', 1, 'name', 'A', 45, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement', 1, 'daral_09_01_13', 'region', 1, 'region', 'A', 45, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 1, 'daral_09_01_13', 'fk_departement_name', 1, 'fk_departement_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 1, 'daral_09_01_13', 'fk_departement_name', 2, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement_stat_farmer', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'departement_stat_farmer', 1, 'daral_09_01_13', 'fk_departement_name', 1, 'fk_departement_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 0, 'daral_09_01_13', 'PRIMARY', 1, 'rank_farmer', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 0, 'daral_09_01_13', 'id_farmer', 1, 'id_farmer', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'categorie', 1, 'categorie', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'categorie', 2, 'daral_originel', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'categorie', 3, 'daral_actuel', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'categorie', 4, 'id_localite', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'daral_originel', 1, 'daral_originel', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'daral_actuel', 1, 'daral_actuel', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'farmer', 1, 'daral_09_01_13', 'id_localite', 1, 'id_localite', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'langue', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'langue', 0, 'daral_09_01_13', 'libelle', 1, 'libelle', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite', 0, 'daral_09_01_13', 'name', 1, 'name', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite', 1, 'daral_09_01_13', 'departement', 1, 'departement', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite', 1, 'daral_09_01_13', 'departement', 2, 'region', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite', 1, 'daral_09_01_13', 'region', 1, 'region', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 1, 'daral_09_01_13', 'fk_localite_name', 1, 'fk_localite_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 1, 'daral_09_01_13', 'fk_localite_name', 2, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite_stat_farmer', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'localite_stat_farmer', 1, 'daral_09_01_13', 'fk_localite_name', 1, 'fk_localite_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'maladie', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'maladie', 0, 'daral_09_01_13', 'libelle', 1, 'libelle', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'media', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id_media', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'media', 1, 'daral_09_01_13', 'langue', 1, 'langue', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'media', 1, 'daral_09_01_13', 'langue', 2, 'maladie', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'media', 1, 'daral_09_01_13', 'maladie', 1, 'maladie', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'national', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'national', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'national', 1, 'daral_09_01_13', 'fk_animal_type_2', 1, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_farmer', 1, 'id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_farmer', 2, 'id_localite', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_farmer', 3, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_farmer', 4, 'id_user', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_localite', 1, 'id_localite', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_farmer_2', 1, 'id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'id_user', 1, 'id_user', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'type', 1, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'notification', 1, 'daral_09_01_13', 'type_2', 1, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 14, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region', 0, 'daral_09_01_13', 'name', 1, 'name', 'A', 14, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 1, 'daral_09_01_13', 'fk_region_name', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 1, 'daral_09_01_13', 'fk_region_name', 2, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 1, 'daral_09_01_13', 'fk_region_name_2', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 1, 'daral_09_01_13', 'fk_animal_type', 1, 'fk_animal_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 1, 'daral_09_01_13', 'fk_region_name', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 1, 'daral_09_01_13', 'fk_region_name_2', 1, 'fk_region_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'role_users', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'role_users', 0, 'daral_09_01_13', 'description', 1, 'description', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'type_notification', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'type_notification', 0, 'daral_09_01_13', 'libelle', 1, 'libelle', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 0, 'daral_09_01_13', 'PRIMARY', 1, 'id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 0, 'daral_09_01_13', 'username', 1, 'username', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 1, 'daral_09_01_13', 'role', 1, 'role', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 1, 'daral_09_01_13', 'role', 2, 'user_daral', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 1, 'daral_09_01_13', 'user_daral', 1, 'user_daral', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 1, 'daral_09_01_13', 'role_2', 1, 'role', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'users', 1, 'daral_09_01_13', 'user_daral_2', 1, 'user_daral', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'veterinaire', 0, 'daral_09_01_13', 'PRIMARY', 1, 'rank_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'veterinaire', 0, 'daral_09_01_13', 'id_veterinaire', 1, 'id_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'veterinaire', 0, 'daral_09_01_13', 'id_veterinaire', 2, 'email_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'daral_09_01_13', 'veterinaire', 1, 'daral_09_01_13', 'localite_veterinaire', 1, 'localite_veterinaire', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'columns_priv', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'columns_priv', 0, 'mysql', 'PRIMARY', 2, 'Db', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'columns_priv', 0, 'mysql', 'PRIMARY', 3, 'User', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'columns_priv', 0, 'mysql', 'PRIMARY', 4, 'Table_name', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'columns_priv', 0, 'mysql', 'PRIMARY', 5, 'Column_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'db', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'db', 0, 'mysql', 'PRIMARY', 2, 'Db', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'db', 0, 'mysql', 'PRIMARY', 3, 'User', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'db', 1, 'mysql', 'User', 1, 'User', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'event', 0, 'mysql', 'PRIMARY', 1, 'db', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'event', 0, 'mysql', 'PRIMARY', 2, 'name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'func', 0, 'mysql', 'PRIMARY', 1, 'name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_category', 0, 'mysql', 'PRIMARY', 1, 'help_category_id', 'A', 36, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_category', 0, 'mysql', 'name', 1, 'name', 'A', 36, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_keyword', 0, 'mysql', 'PRIMARY', 1, 'help_keyword_id', 'A', 378, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_keyword', 0, 'mysql', 'name', 1, 'name', 'A', 378, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_relation', 0, 'mysql', 'PRIMARY', 1, 'help_keyword_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_relation', 0, 'mysql', 'PRIMARY', 2, 'help_topic_id', 'A', 726, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_topic', 0, 'mysql', 'PRIMARY', 1, 'help_topic_id', 'A', 458, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'help_topic', 0, 'mysql', 'name', 1, 'name', 'A', 458, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'host', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'host', 0, 'mysql', 'PRIMARY', 2, 'Db', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'ndb_binlog_index', 0, 'mysql', 'PRIMARY', 1, 'epoch', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'plugin', 0, 'mysql', 'PRIMARY', 1, 'name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proc', 0, 'mysql', 'PRIMARY', 1, 'db', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proc', 0, 'mysql', 'PRIMARY', 2, 'name', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proc', 0, 'mysql', 'PRIMARY', 3, 'type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'procs_priv', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'procs_priv', 0, 'mysql', 'PRIMARY', 2, 'Db', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'procs_priv', 0, 'mysql', 'PRIMARY', 3, 'User', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'procs_priv', 0, 'mysql', 'PRIMARY', 4, 'Routine_name', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'procs_priv', 0, 'mysql', 'PRIMARY', 5, 'Routine_type', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'procs_priv', 1, 'mysql', 'Grantor', 1, 'Grantor', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proxies_priv', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proxies_priv', 0, 'mysql', 'PRIMARY', 2, 'User', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proxies_priv', 0, 'mysql', 'PRIMARY', 3, 'Proxied_host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proxies_priv', 0, 'mysql', 'PRIMARY', 4, 'Proxied_user', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'proxies_priv', 1, 'mysql', 'Grantor', 1, 'Grantor', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'servers', 0, 'mysql', 'PRIMARY', 1, 'Server_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'tables_priv', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'tables_priv', 0, 'mysql', 'PRIMARY', 2, 'Db', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'tables_priv', 0, 'mysql', 'PRIMARY', 3, 'User', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'tables_priv', 0, 'mysql', 'PRIMARY', 4, 'Table_name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'tables_priv', 1, 'mysql', 'Grantor', 1, 'Grantor', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone', 0, 'mysql', 'PRIMARY', 1, 'Time_zone_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone_leap_second', 0, 'mysql', 'PRIMARY', 1, 'Transition_time', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone_name', 0, 'mysql', 'PRIMARY', 1, 'Name', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone_transition', 0, 'mysql', 'PRIMARY', 1, 'Time_zone_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone_transition', 0, 'mysql', 'PRIMARY', 2, 'Transition_time', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone_transition_type', 0, 'mysql', 'PRIMARY', 1, 'Time_zone_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'time_zone_transition_type', 0, 'mysql', 'PRIMARY', 2, 'Transition_type_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'user', 0, 'mysql', 'PRIMARY', 1, 'Host', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'mysql', 'user', 0, 'mysql', 'PRIMARY', 2, 'User', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'test', 'jeux_video', 1, 'test', 'ID', 1, 'ID', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'test', 'news', 0, 'test', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'actions', 0, 'ushahidi_db', 'PRIMARY', 1, 'action_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'actions_log', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'actions_log', 1, 'ushahidi_db', 'action_id', 1, 'action_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert', 0, 'ushahidi_db', 'uniq_alert_code', 1, 'alert_code', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert_category', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert_category', 1, 'ushahidi_db', 'alert_id', 1, 'alert_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert_category', 1, 'ushahidi_db', 'category_id', 1, 'category_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert_sent', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert_sent', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'alert_sent', 1, 'ushahidi_db', 'alert_id', 1, 'alert_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'api_banned', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'api_log', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'api_settings', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'badge', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'badge_users', 0, 'ushahidi_db', 'PRIMARY', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'badge_users', 0, 'ushahidi_db', 'PRIMARY', 2, 'badge_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'category', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'category', 1, 'ushahidi_db', 'category_visible', 1, 'category_visible', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'category_lang', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'category_lang', 1, 'ushahidi_db', 'category_id', 1, 'category_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'checkin', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'checkin', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'checkin', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'checkin', 1, 'ushahidi_db', 'location_id', 1, 'location_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'city', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'city', 1, 'ushahidi_db', 'country_id', 1, 'country_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'cluster', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'cluster', 1, 'ushahidi_db', 'location_id', 1, 'location_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'cluster', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'cluster', 1, 'ushahidi_db', 'category_id', 1, 'category_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'comment', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'comment', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'comment', 1, 'ushahidi_db', 'checkin_id', 1, 'checkin_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'comment', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'country', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 247, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'externalapp', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'feed', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'feed_item', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'feed_item', 1, 'ushahidi_db', 'feed_id', 1, 'feed_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'feed_item', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'feed_item', 1, 'ushahidi_db', 'location_id', 1, 'location_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_field', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_field', 0, 'ushahidi_db', 'field_name', 1, 'field_name', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_field', 1, 'ushahidi_db', 'fk_form_id', 1, 'form_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_field_option', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_field_option', 1, 'ushahidi_db', 'form_field_id', 1, 'form_field_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_response', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_response', 1, 'ushahidi_db', 'fk_form_field_id', 1, 'form_field_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'form_response', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'geometry', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'geometry', 1, 'ushahidi_db', 'geometry', 1, 'geometry', 'A', NULL, 32, NULL, '', 'SPATIAL', '', ''),
('def', 'ushahidi_db', 'geometry', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident', 1, 'ushahidi_db', 'location_id', 1, 'location_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident', 1, 'ushahidi_db', 'incident_active', 1, 'incident_active', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident', 1, 'ushahidi_db', 'incident_date', 1, 'incident_date', 'A', 1, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident', 1, 'ushahidi_db', 'form_id', 1, 'form_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', 1, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_category', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_category', 0, 'ushahidi_db', 'incident_category_ids', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_category', 0, 'ushahidi_db', 'incident_category_ids', 2, 'category_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_lang', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_lang', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_person', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'incident_person', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'layer', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'level', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'location', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'location', 1, 'ushahidi_db', 'country_id', 1, 'country_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'maintenance', 0, 'ushahidi_db', 'PRIMARY', 1, 'allowed_ip', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'media', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'media', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'media', 1, 'ushahidi_db', 'location_id', 1, 'location_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'media', 1, 'ushahidi_db', 'checkin_id', 1, 'checkin_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'media', 1, 'ushahidi_db', 'badge_id', 1, 'badge_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'media', 1, 'ushahidi_db', 'message_id', 1, 'message_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'message', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'message', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'message', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'message', 1, 'ushahidi_db', 'reporter_id', 1, 'reporter_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'openid', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'openid', 1, 'ushahidi_db', 'openid', 1, 'openid', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'openid', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'page', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'permissions', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 18, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'permissions', 0, 'ushahidi_db', 'name_UNIQUE', 1, 'name', 'A', 18, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'permissions_roles', 0, 'ushahidi_db', 'PRIMARY', 1, 'role_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'permissions_roles', 0, 'ushahidi_db', 'PRIMARY', 2, 'permission_id', 'A', 35, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'plugin', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'plugin', 0, 'ushahidi_db', 'plugin_name', 1, 'plugin_name', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'private_message', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'private_message', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'rating', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'rating', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'rating', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'rating', 1, 'ushahidi_db', 'comment_id', 1, 'comment_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'reporter', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'reporter', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'reporter', 1, 'ushahidi_db', 'location_id', 1, 'location_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'reporter', 1, 'ushahidi_db', 'service_id', 1, 'service_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'reporter', 1, 'ushahidi_db', 'level_id', 1, 'level_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'ushahidi_db', 'roles', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'roles', 0, 'ushahidi_db', 'uniq_name', 1, 'name', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'roles_users', 0, 'ushahidi_db', 'PRIMARY', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'roles_users', 0, 'ushahidi_db', 'PRIMARY', 2, 'role_id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'roles_users', 1, 'ushahidi_db', 'fk_role_id', 1, 'role_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'scheduler', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 5, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'scheduler_log', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 27, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'scheduler_log', 1, 'ushahidi_db', 'scheduler_id', 1, 'scheduler_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'service', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'sessions', 0, 'ushahidi_db', 'PRIMARY', 1, 'session_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'settings', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 65, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'settings', 0, 'ushahidi_db', 'uq_settings_key', 1, 'key', 'A', 65, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'user_devices', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'user_devices', 1, 'ushahidi_db', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'user_tokens', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'user_tokens', 0, 'ushahidi_db', 'uniq_token', 1, 'token', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'user_tokens', 1, 'ushahidi_db', 'fk_user_id', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'users', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'users', 0, 'ushahidi_db', 'uniq_username', 1, 'username', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'users', 0, 'ushahidi_db', 'uniq_email', 1, 'email', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'verified', 0, 'ushahidi_db', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'ushahidi_db', 'verified', 1, 'ushahidi_db', 'incident_id', 1, 'incident_id', 'A', NULL, NULL, NULL, 'YES', 'BTREE', '', ''),
('def', 'zf_daral', 'animal', 0, 'zf_daral', 'PRIMARY', 1, 'id_animal', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'animal', 1, 'zf_daral', 'id_eleveur', 1, 'id_eleveur', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'daral', 0, 'zf_daral', 'PRIMARY', 1, 'id', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'daral', 1, 'zf_daral', 'id_localite', 1, 'id_localite', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'farmer', 0, 'zf_daral', 'PRIMARY', 1, 'rank_farmer', 'A', 46, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'farmer', 1, 'zf_daral', 'id_localite', 1, 'id_localite', 'A', 9, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'farmer', 1, 'zf_daral', 'daral_number', 1, 'daral_number', 'A', 15, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'farmer', 1, 'zf_daral', 'id_farmer', 1, 'id_farmer', 'A', 46, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'farmer', 1, 'zf_daral', 'id_localite_2', 1, 'id_localite', 'A', 9, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'lang', 0, 'zf_daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'localite', 0, 'zf_daral', 'PRIMARY', 1, 'id', 'A', 6, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'maladie', 0, 'zf_daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'media', 0, 'zf_daral', 'PRIMARY', 1, 'id_media', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'media', 1, 'zf_daral', 'langue', 1, 'langue', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'media', 1, 'zf_daral', 'maladie', 1, 'maladie', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 0, 'zf_daral', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 1, 'zf_daral', 'id', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 1, 'zf_daral', 'id_2', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 1, 'zf_daral', 'id_farmer', 1, 'id_farmer', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 1, 'zf_daral', 'id_farmer', 2, 'id_user', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 1, 'zf_daral', 'id_user', 1, 'id_user', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'notification', 1, 'zf_daral', 'id_localite', 1, 'id_localite', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'users', 0, 'zf_daral', 'PRIMARY', 1, 'id', 'A', 8, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'users', 1, 'zf_daral', 'id', 1, 'id', 'A', 8, NULL, NULL, '', 'BTREE', '', ''),
('def', 'zf_daral', 'veterinaire', 0, 'zf_daral', 'PRIMARY', 1, 'rank_veterinaire', 'A', 2, NULL, NULL, '', 'BTREE', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `TABLES`
--

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 384, 0, 16434816, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43690', ''),
('def', 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 231, 0, 16704765, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=72628', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 195, 0, 16357770, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=86037', ''),
('def', 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=2802', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
('def', 'information_schema', 'ENGINES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 490, 0, 16574250, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=34239', ''),
('def', 'information_schema', 'EVENTS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=618', ''),
('def', 'information_schema', 'FILES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2677, 0, 16758020, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6267', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
('def', 'information_schema', 'PARAMETERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=6050', ''),
('def', 'information_schema', 'PARTITIONS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=5579', ''),
('def', 'information_schema', 'PLUGINS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=11328', ''),
('def', 'information_schema', 'PROCESSLIST', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=23899', ''),
('def', 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 308, 0, 16562084, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=54471', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4814, 0, 16767162, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3485', ''),
('def', 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=583', ''),
('def', 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3464, 0, 16738048, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4843', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2179, 0, 16736899, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
('def', 'information_schema', 'SESSION_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 5753, 0, 16752736, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2916', ''),
('def', 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 9450, 0, 16764300, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=1775', ''),
('def', 'information_schema', 'TABLESPACES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6951, 0, 16772763, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2413', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2504, 0, 16721712, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
('def', 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=569', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 1986, 0, 16726092, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
('def', 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2013-01-11 10:01:16', '2013-01-11 10:01:16', NULL, 'utf8_general_ci', NULL, 'max_rows=6935', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 25, 0, 13107200, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=671088', ''),
('def', 'information_schema', 'INNODB_TRX', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4534, 0, 16766732, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3700', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 29, 0, 15204352, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=578524', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 599, 0, 16749238, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=28008', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 29, 0, 15204352, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=578524', ''),
('def', 'information_schema', 'INNODB_CMP', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 25, 0, 13107200, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=671088', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 31244, 0, 16746784, 0, 0, NULL, '2013-01-11 10:01:16', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=536', ''),
('def', 'daral', 'animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 49152, 11534336, 1, '2013-01-11 08:42:25', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'animaltype', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 32768, 11534336, 3, '2013-01-11 08:45:49', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'categorie', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 11534336, 3, '2013-01-11 08:28:23', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'cheptel', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:27', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'daral', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 32768, 11534336, 8, '2013-01-11 08:28:27', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'daralstatanimal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:27', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'daralstatfarmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-11 08:28:27', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'departement', 'BASE TABLE', 'InnoDB', 10, 'Compact', 45, 364, 16384, 0, 32768, 11534336, 46, '2013-01-11 08:28:27', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'departementstatanimal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:28', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'departementstatfarmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-11 08:28:28', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 1, 16384, 16384, 0, 131072, 11534336, 41, '2013-01-11 09:49:56', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'langue', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-11 08:28:24', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'localite', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 32768, 11534336, 8, '2013-01-11 09:10:41', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'localitestatanimal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:28', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'localitestatfarmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-11 08:28:29', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'maladie', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-11 08:28:25', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'media', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:29', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'national', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:29', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'notification', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 98304, 11534336, 9, '2013-01-11 08:39:59', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'region', 'BASE TABLE', 'InnoDB', 10, 'Compact', 14, 1170, 16384, 0, 16384, 11534336, 15, '2013-01-11 08:28:25', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'regionstatanimal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 49152, 11534336, 1, '2013-01-11 08:28:29', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'regionstatfarmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:30', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'roleusers', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 11534336, 3, '2013-01-11 08:28:26', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'typenotification', 'BASE TABLE', 'InnoDB', 10, 'Compact', 4, 4096, 16384, 0, 16384, 11534336, 5, '2013-01-11 08:28:26', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'users', 'BASE TABLE', 'InnoDB', 10, 'Compact', 5, 3276, 16384, 0, 81920, 11534336, 6, '2013-01-11 08:35:58', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral', 'veterinaire', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-11 08:28:26', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 159, 103, 16384, 0, 32768, 11534336, 160, '2013-01-10 14:09:18', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'animal_type', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 11534336, 3, '2012-12-05 15:45:48', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'categorie', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 11534336, 3, '2012-12-05 15:45:48', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'cheptel', 'BASE TABLE', 'InnoDB', 10, 'Compact', 10, 1638, 16384, 0, 32768, 11534336, 11, '2013-01-10 14:09:18', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'daral', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 32768, 11534336, 8, '2013-01-10 14:09:18', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'daral_stat_animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-10 14:09:18', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'daral_stat_farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-10 14:09:19', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'departement', 'BASE TABLE', 'InnoDB', 10, 'Compact', 45, 364, 16384, 0, 32768, 11534336, 46, '2013-01-10 14:09:19', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'departement_stat_animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-10 14:09:19', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'departement_stat_farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-10 14:09:19', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 81920, 11534336, 8, '2013-01-10 14:09:19', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'langue', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2012-12-05 15:45:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'localite', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 49152, 11534336, 8, '2013-01-10 14:09:19', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'localite_stat_animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-10 14:09:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'localite_stat_farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2013-01-10 14:09:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'maladie', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2012-12-12 17:15:07', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'media', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-10 14:09:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'national', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-10 14:09:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'notification', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 98304, 11534336, 1, '2013-01-10 14:09:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'region', 'BASE TABLE', 'InnoDB', 10, 'Compact', 14, 1170, 16384, 0, 16384, 11534336, 15, '2012-12-05 15:45:52', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'region_stat_animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 49152, 11534336, 1, '2013-01-10 14:09:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'region_stat_farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2013-01-10 14:09:21', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'role_users', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 11534336, 3, '2012-12-05 15:45:52', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'type_notification', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 11534336, 1, '2012-12-05 15:45:53', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'users', 'BASE TABLE', 'InnoDB', 10, 'Compact', 3, 5461, 16384, 0, 81920, 11534336, 4, '2013-01-10 14:09:21', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'daral_09_01_13', 'veterinaire', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2012-12-05 15:45:53', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'mysql', 'columns_priv', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 227994731135631359, 4096, 0, NULL, '2011-02-14 14:27:13', '2012-07-10 12:13:05', NULL, 'utf8_bin', NULL, '', 'Column privileges'),
('def', 'mysql', 'db', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 4, 440, 2200, 123848989752688639, 5120, 440, NULL, '2011-02-14 14:27:19', '2013-01-05 07:53:26', NULL, 'utf8_bin', NULL, '', 'Database privileges'),
('def', 'mysql', 'event', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 2048, 0, NULL, '2011-02-14 14:27:19', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'Events'),
('def', 'mysql', 'func', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 162974011515469823, 1024, 0, NULL, '2011-02-14 14:27:14', '2012-07-10 12:13:05', NULL, 'utf8_bin', NULL, '', 'User defined functions'),
('def', 'mysql', 'general_log', 'BASE TABLE', 'CSV', 10, 'Dynamic', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', 'General log'),
('def', 'mysql', 'help_category', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 36, 581, 20916, 163536961468891135, 3072, 0, NULL, '2006-03-15 14:53:39', '2012-07-10 12:13:05', '2009-08-11 12:59:56', 'utf8_general_ci', NULL, '', 'help categories'),
('def', 'mysql', 'help_keyword', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 378, 197, 74466, 55450570411999231, 13312, 0, NULL, '2006-03-15 14:53:40', '2012-07-10 12:13:05', '2009-08-11 12:59:56', 'utf8_general_ci', NULL, '', 'help keywords'),
('def', 'mysql', 'help_relation', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 726, 9, 6534, 2533274790395903, 12288, 0, NULL, '2006-03-15 14:53:39', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'keyword-topic relation'),
('def', 'mysql', 'help_topic', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 458, 537, 246268, 281474976710655, 15360, 0, NULL, '2006-03-15 14:53:39', '2012-07-10 12:13:05', '2009-08-11 12:59:56', 'utf8_general_ci', NULL, '', 'help topics'),
('def', 'mysql', 'host', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 110056715893866495, 2048, 0, NULL, '2011-02-14 14:27:19', '2012-07-10 12:13:05', NULL, 'utf8_bin', NULL, '', 'Host privileges;  Merged with database privileges'),
('def', 'mysql', 'ndb_binlog_index', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, NULL, '2009-08-11 12:59:57', '2012-07-10 12:13:05', NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'mysql', 'plugin', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, NULL, '2011-02-14 14:27:15', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'MySQL plugins'),
('def', 'mysql', 'proc', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 308, 281474976710655, 4096, 308, NULL, '2011-02-14 14:27:18', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'Stored Procedures'),
('def', 'mysql', 'procs_priv', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 239253730204057599, 4096, 0, NULL, '2011-02-14 14:27:17', '2012-07-10 12:13:05', '2011-02-14 14:27:17', 'utf8_bin', NULL, '', 'Procedure privileges'),
('def', 'mysql', 'proxies_priv', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 1, 693, 693, 195062158860484607, 5120, 0, NULL, '2011-02-14 14:27:12', '2012-07-10 12:13:05', '2011-02-14 14:27:20', 'utf8_bin', NULL, '', 'User proxy privileges'),
('def', 'mysql', 'servers', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 433752939111120895, 1024, 0, NULL, '2009-08-11 12:59:56', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'MySQL Foreign Servers table'),
('def', 'mysql', 'slow_log', 'BASE TABLE', 'CSV', 10, 'Dynamic', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', 'Slow log'),
('def', 'mysql', 'tables_priv', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 239535205180768255, 4096, 0, NULL, '2011-02-14 14:27:13', '2012-07-10 12:13:05', '2011-02-14 14:27:13', 'utf8_bin', NULL, '', 'Table privileges'),
('def', 'mysql', 'time_zone', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 1970324836974591, 1024, 0, 1, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'Time zones'),
('def', 'mysql', 'time_zone_leap_second', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 3659174697238527, 1024, 0, NULL, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'Leap seconds information for time zones'),
('def', 'mysql', 'time_zone_name', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 55450570411999231, 1024, 0, NULL, '2006-03-15 14:53:40', '2012-07-10 12:13:05', '2009-08-11 12:59:56', 'utf8_general_ci', NULL, '', 'Time zone names'),
('def', 'mysql', 'time_zone_transition', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 4785074604081151, 1024, 0, NULL, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'Time zone transitions'),
('def', 'mysql', 'time_zone_transition_type', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 10696049115004927, 1024, 0, NULL, '2006-03-15 14:53:40', '2012-07-10 12:13:05', NULL, 'utf8_general_ci', NULL, '', 'Time zone transition types'),
('def', 'mysql', 'user', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 4, 83, 420, 281474976710655, 2048, 88, NULL, '2011-02-14 14:27:20', '2013-01-05 07:53:26', NULL, 'utf8_bin', NULL, '', 'Users and global privileges'),
('def', 'performance_schema', 'cond_instances', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'events_waits_current', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'events_waits_history', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'events_waits_history_long', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 10000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'events_waits_summary_by_instance', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'events_waits_summary_by_thread_by_event_name', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'events_waits_summary_global_by_event_name', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'file_instances', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'file_summary_by_event_name', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'file_summary_by_instance', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'mutex_instances', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'performance_timers', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Fixed', 5, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'rwlock_instances', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'setup_consumers', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 8, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'setup_instruments', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'setup_timers', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'performance_schema', 'threads', 'BASE TABLE', 'PERFORMANCE_SCHEMA', 10, 'Dynamic', 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'test', 'jeux_video', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 50, 91, 4564, 281474976710655, 2048, 0, 51, '2012-12-12 18:21:55', '2012-12-12 18:21:55', NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'test', 'news', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 11534336, 1, '2012-12-12 14:42:20', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'ushahidi_db', 'actions', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, 'utf8_general_ci', NULL, '', 'Stores user defined actions triggered by certain events'),
('def', 'ushahidi_db', 'actions_log', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 5910974510923775, 1024, 0, 1, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, 'utf8_general_ci', NULL, '', 'Stores a log of triggered actions'),
('def', 'ushahidi_db', 'alert', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, 'utf8_general_ci', NULL, '', 'Stores alerts subscribers information'),
('def', 'ushahidi_db', 'alert_category', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 4785074604081151, 1024, 0, 1, '2012-11-30 08:45:13', '2012-11-30 08:45:13', NULL, 'utf8_general_ci', NULL, '', 'Stores subscriber alert categories'),
('def', 'ushahidi_db', 'alert_sent', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 9288674231451647, 1024, 0, 1, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'Stores a log of alerts sent out to subscribers'),
('def', 'ushahidi_db', 'api_banned', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 8, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'For logging banned API IP addresses'),
('def', 'ushahidi_db', 'api_log', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 19, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'For logging API activities'),
('def', 'ushahidi_db', 'api_settings', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 8162774324609023, 1024, 0, 1, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'For storing API logging settings'),
('def', 'ushahidi_db', 'badge', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'Stores description of badges to be assigned'),
('def', 'ushahidi_db', 'badge_users', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 2533274790395903, 1024, 0, NULL, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'Stores assigned badge information'),
('def', 'ushahidi_db', 'category', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 4, 57, 228, 281474976710655, 3072, 0, 6, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'Holds information about categories defined for a deployment'),
('def', 'ushahidi_db', 'category_lang', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:14', '2012-11-30 08:45:14', NULL, 'utf8_general_ci', NULL, '', 'Holds translations for category titles and descriptions'),
('def', 'ushahidi_db', 'checkin', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores checkin information'),
('def', 'ushahidi_db', 'city', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores cities of countries retrieved by user.'),
('def', 'ushahidi_db', 'cluster', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 26177172834091007, 1024, 0, NULL, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores information used for clustering of reports on the map.'),
('def', 'ushahidi_db', 'comment', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores comments made on reports/checkins'),
('def', 'ushahidi_db', 'country', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 247, 33, 8272, 281474976710655, 5120, 0, 248, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores a list of all countries and their capital cities'),
('def', 'ushahidi_db', 'externalapp', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 2, 80, 160, 281474976710655, 2048, 0, 3, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Info on external apps(mobile) that work with your deployment'),
('def', 'ushahidi_db', 'feed', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Information about RSS Feeds a deployment subscribes to'),
('def', 'ushahidi_db', 'feed_item', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores feed items pulled from each RSS Feed'),
('def', 'ushahidi_db', 'form', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 56, 56, 281474976710655, 2048, 0, 2, '2012-11-30 08:45:15', '2012-11-30 08:45:15', NULL, 'utf8_general_ci', NULL, '', 'Stores all report submission forms created(default+custom)'),
('def', 'ushahidi_db', 'form_field', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 4096, 0, 1, '2012-11-30 08:45:16', '2012-11-30 08:45:16', '2012-11-30 08:45:16', 'utf8_general_ci', NULL, '', 'Stores all custom form fields created by users'),
('def', 'ushahidi_db', 'form_field_option', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:16', '2012-11-30 08:45:16', NULL, 'utf8_general_ci', NULL, '', 'Options related to custom form fields'),
('def', 'ushahidi_db', 'form_response', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:16', '2012-11-30 08:45:16', '2012-11-30 08:45:16', 'utf8_general_ci', NULL, '', 'Stores responses to custom form fields'),
('def', 'ushahidi_db', 'geometry', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, 'utf8_general_ci', NULL, '', 'Stores map geometries i.e polygons, lines etc'),
('def', 'ushahidi_db', 'incident', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 136, 136, 281474976710655, 7168, 0, 2, '2012-11-30 08:45:17', '2012-11-30 08:45:17', '2012-11-30 08:45:17', 'utf8_general_ci', NULL, '', 'Stores reports submitted'),
('def', 'ushahidi_db', 'incident_category', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 1, 17, 17, 4785074604081151, 3072, 0, 2, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, 'utf8_general_ci', NULL, '', 'Stores submitted reports categories'),
('def', 'ushahidi_db', 'incident_lang', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, 'utf8_general_ci', NULL, '', 'Holds translations for report titles and descriptions'),
('def', 'ushahidi_db', 'incident_person', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:17', '2012-11-30 08:45:17', NULL, 'utf8_general_ci', NULL, '', 'Holds information provided by people who submit reports'),
('def', 'ushahidi_db', 'layer', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, 'utf8_general_ci', NULL, '', 'Holds static layer information'),
('def', 'ushahidi_db', 'level', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 5, 32, 164, 281474976710655, 2048, 0, 6, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, 'utf8_general_ci', NULL, '', 'Stores level of trust assigned to reporters of the platform'),
('def', 'ushahidi_db', 'location', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 52, 52, 281474976710655, 3072, 0, 2, '2012-11-30 08:45:18', '2012-11-30 08:45:18', '2012-11-30 08:45:18', 'utf8_general_ci', NULL, '', 'Stores location information'),
('def', 'ushahidi_db', 'maintenance', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, NULL, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, 'utf8_general_ci', NULL, '', 'Puts a site in maintenance mode if data exists in this table'),
('def', 'ushahidi_db', 'media', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, 'utf8_general_ci', NULL, '', 'Stores any media submitted along with a report/checkin'),
('def', 'ushahidi_db', 'message', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, 'utf8_general_ci', NULL, '', 'Stores tweets, emails and SMS messages'),
('def', 'ushahidi_db', 'openid', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 4096, 0, 1, '2012-11-30 08:45:18', '2012-11-30 08:45:18', NULL, 'utf8_general_ci', NULL, '', 'Stores usersâ€™ openid information'),
('def', 'ushahidi_db', 'page', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'utf8_general_ci', NULL, '', 'Stores user created pages'),
('def', 'ushahidi_db', 'permissions', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 18, 22, 412, 281474976710655, 3072, 0, 20, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'latin1_swedish_ci', NULL, '', 'Stores permissions used for access control'),
('def', 'ushahidi_db', 'permissions_roles', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 35, 9, 315, 2533274790395903, 2048, 0, NULL, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'latin1_swedish_ci', NULL, '', 'Stores permissions assigned to roles'),
('def', 'ushahidi_db', 'plugin', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 5, 21, 108, 281474976710655, 5120, 0, 6, '2012-11-30 08:45:19', '2012-11-30 08:58:01', NULL, 'utf8_general_ci', NULL, '', 'Holds a list of all plugins installed on a deployment'),
('def', 'ushahidi_db', 'private_message', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'utf8_general_ci', NULL, '', 'Stores private messages sent between Members'),
('def', 'ushahidi_db', 'rating', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'utf8_general_ci', NULL, '', 'Stores credibility ratings for reports and comments'),
('def', 'ushahidi_db', 'reporter', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'utf8_general_ci', NULL, '', 'Information on report submitters via email, twitter and sms'),
('def', 'ushahidi_db', 'roles', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 4, 71, 284, 281474976710655, 3072, 0, 5, '2012-11-30 08:45:19', '2012-11-30 08:45:19', NULL, 'utf8_general_ci', NULL, '', 'Defines user access levels and privileges on a deployment'),
('def', 'ushahidi_db', 'roles_users', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 3, 9, 27, 2533274790395903, 3072, 0, NULL, '2012-11-30 08:45:20', '2012-11-30 08:45:20', NULL, 'utf8_general_ci', NULL, '', 'Stores roles assigned to users registered on a deployment'),
('def', 'ushahidi_db', 'scheduler', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 5, 54, 272, 281474976710655, 2048, 0, 6, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, 'utf8_general_ci', NULL, '', 'Stores schedules for cron jobs'),
('def', 'ushahidi_db', 'scheduler_log', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 27, 28, 756, 281474976710655, 3072, 0, 28, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, 'utf8_general_ci', NULL, '', 'Stores a log of scheduler actions'),
('def', 'ushahidi_db', 'service', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 3, 53, 160, 281474976710655, 2048, 0, 4, '2012-11-30 08:45:20', '2012-11-30 08:45:20', NULL, 'utf8_general_ci', NULL, '', 'Info on input sources i.e SMS, Email, Twitter'),
('def', 'ushahidi_db', 'sessions', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 2, 1312, 2624, 281474976710655, 4096, 0, NULL, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, 'utf8_general_ci', NULL, '', 'Stores session information'),
('def', 'ushahidi_db', 'settings', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 65, 34, 2304, 281474976710655, 5120, 72, 66, '2012-11-30 08:45:20', '2012-11-30 09:06:37', NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'ushahidi_db', 'user_devices', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 4096, 0, NULL, '2012-11-30 08:45:20', '2012-11-30 08:45:20', NULL, 'utf8_general_ci', NULL, '', 'Works with checkins'),
('def', 'ushahidi_db', 'user_tokens', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 96, 96, 281474976710655, 4096, 0, 2, '2012-11-30 08:45:21', '2012-12-02 19:25:21', NULL, 'utf8_general_ci', NULL, '', 'Stores browser tokens assigned to users'),
('def', 'ushahidi_db', 'users', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 140, 140, 281474976710655, 7168, 0, 2, '2012-11-30 08:45:20', '2012-12-02 19:25:21', NULL, 'utf8_general_ci', NULL, '', 'Stores registered usersâ€™ information'),
('def', 'ushahidi_db', 'verified', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 8444249301319679, 1024, 0, 1, '2012-11-30 08:45:21', '2012-11-30 08:45:21', NULL, 'utf8_general_ci', NULL, '', 'Stores all verified reports'),
('def', 'zf_daral', 'animal', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 11534336, 6, '2012-11-28 19:15:51', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'daral', 'BASE TABLE', 'InnoDB', 10, 'Compact', 10, 1638, 16384, 0, 16384, 11534336, 11, '2012-11-28 19:15:51', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'farmer', 'BASE TABLE', 'InnoDB', 10, 'Compact', 46, 356, 16384, 0, 65536, 11534336, 47, '2012-11-28 20:00:38', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'lang', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 11534336, 1, '2012-11-28 19:15:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'localite', 'BASE TABLE', 'InnoDB', 10, 'Compact', 6, 2730, 16384, 0, 0, 11534336, NULL, '2012-11-28 19:15:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'maladie', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 11534336, 1, '2012-11-28 19:15:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'media', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 11534336, 1, '2012-11-28 19:15:51', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'notification', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 81920, 11534336, 1, '2012-11-28 19:15:51', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'users', 'BASE TABLE', 'InnoDB', 10, 'Compact', 8, 2048, 16384, 0, 16384, 11534336, 9, '2012-11-28 19:15:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', ''),
('def', 'zf_daral', 'veterinaire', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 0, 11534336, 4, '2012-11-28 19:15:51', NULL, NULL, 'latin1_swedish_ci', NULL, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `TABLESPACES`
--

CREATE TEMPORARY TABLE `TABLESPACES` (
  `TABLESPACE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `TABLESPACE_TYPE` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `EXTENT_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `NODEGROUP_ID` bigint(21) unsigned DEFAULT NULL,
  `TABLESPACE_COMMENT` varchar(2048) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `TABLE_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
('def', 'daral', 'PRIMARY', 'daral', 'animal', 'PRIMARY KEY'),
('def', 'daral', 'animal_id', 'daral', 'animal', 'UNIQUE'),
('def', 'daral', 'animal_ibfk_1', 'daral', 'animal', 'FOREIGN KEY'),
('def', 'daral', 'animal_ibfk_2', 'daral', 'animal', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'animaltype', 'PRIMARY KEY'),
('def', 'daral', 'name', 'daral', 'animaltype', 'UNIQUE'),
('def', 'daral', 'animal_tag', 'daral', 'animaltype', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'categorie', 'PRIMARY KEY'),
('def', 'daral', 'categorie_id', 'daral', 'categorie', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'cheptel', 'PRIMARY KEY'),
('def', 'daral', 'cheptel_ibfk_1', 'daral', 'cheptel', 'FOREIGN KEY'),
('def', 'daral', 'cheptel_ibfk_2', 'daral', 'cheptel', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'daral', 'PRIMARY KEY'),
('def', 'daral', 'name', 'daral', 'daral', 'UNIQUE'),
('def', 'daral', 'daral_ibfk_3', 'daral', 'daral', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'daralstatanimal', 'PRIMARY KEY'),
('def', 'daral', 'daralstatanimal_ibfk_1', 'daral', 'daralstatanimal', 'FOREIGN KEY'),
('def', 'daral', 'daralstatanimal_ibfk_2', 'daral', 'daralstatanimal', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'daralstatfarmer', 'PRIMARY KEY'),
('def', 'daral', 'daralstatfarmer_ibfk_1', 'daral', 'daralstatfarmer', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'departement', 'PRIMARY KEY'),
('def', 'daral', 'name', 'daral', 'departement', 'UNIQUE'),
('def', 'daral', 'departement_ibfk_1', 'daral', 'departement', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'departementstatanimal', 'PRIMARY KEY'),
('def', 'daral', 'departementstatanimal_ibfk_1', 'daral', 'departementstatanimal', 'FOREIGN KEY'),
('def', 'daral', 'departementstatanimal_ibfk_2', 'daral', 'departementstatanimal', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'departementstatfarmer', 'PRIMARY KEY'),
('def', 'daral', 'departementstatfarmer_ibfk_1', 'daral', 'departementstatfarmer', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'farmer', 'PRIMARY KEY'),
('def', 'daral', 'id_farmer', 'daral', 'farmer', 'UNIQUE'),
('def', 'daral', 'farmer_ibfk_17', 'daral', 'farmer', 'FOREIGN KEY'),
('def', 'daral', 'farmer_ibfk_13', 'daral', 'farmer', 'FOREIGN KEY'),
('def', 'daral', 'farmer_ibfk_15', 'daral', 'farmer', 'FOREIGN KEY'),
('def', 'daral', 'farmer_ibfk_16', 'daral', 'farmer', 'FOREIGN KEY'),
('def', 'daral', 'farmer_ibfk_8', 'daral', 'farmer', 'FOREIGN KEY'),
('def', 'daral', 'farmer_ibfk_9', 'daral', 'farmer', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'langue', 'PRIMARY KEY'),
('def', 'daral', 'libelle', 'daral', 'langue', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'localite', 'PRIMARY KEY'),
('def', 'daral', 'name', 'daral', 'localite', 'UNIQUE'),
('def', 'daral', 'localite_ibfk_1', 'daral', 'localite', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'localitestatanimal', 'PRIMARY KEY'),
('def', 'daral', 'localitestatanimal_ibfk_1', 'daral', 'localitestatanimal', 'FOREIGN KEY'),
('def', 'daral', 'localitestatanimal_ibfk_2', 'daral', 'localitestatanimal', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'localitestatfarmer', 'PRIMARY KEY'),
('def', 'daral', 'localitestatfarmer_ibfk_1', 'daral', 'localitestatfarmer', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'maladie', 'PRIMARY KEY'),
('def', 'daral', 'libelle', 'daral', 'maladie', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'media', 'PRIMARY KEY'),
('def', 'daral', 'media_ibfk_1', 'daral', 'media', 'FOREIGN KEY'),
('def', 'daral', 'media_ibfk_2', 'daral', 'media', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'national', 'PRIMARY KEY'),
('def', 'daral', 'national_ibfk_1', 'daral', 'national', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'notification', 'PRIMARY KEY'),
('def', 'daral', 'notification_ibfk_25', 'daral', 'notification', 'FOREIGN KEY'),
('def', 'daral', 'notification_ibfk_22', 'daral', 'notification', 'FOREIGN KEY'),
('def', 'daral', 'notification_ibfk_23', 'daral', 'notification', 'FOREIGN KEY'),
('def', 'daral', 'notification_ibfk_24', 'daral', 'notification', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'region', 'PRIMARY KEY'),
('def', 'daral', 'name', 'daral', 'region', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'regionstatanimal', 'PRIMARY KEY'),
('def', 'daral', 'regionstatanimal_ibfk_1', 'daral', 'regionstatanimal', 'FOREIGN KEY'),
('def', 'daral', 'regionstatanimal_ibfk_2', 'daral', 'regionstatanimal', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'regionstatfarmer', 'PRIMARY KEY'),
('def', 'daral', 'regionstatfarmer_ibfk_1', 'daral', 'regionstatfarmer', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'roleusers', 'PRIMARY KEY'),
('def', 'daral', 'description', 'daral', 'roleusers', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'typenotification', 'PRIMARY KEY'),
('def', 'daral', 'libelle', 'daral', 'typenotification', 'UNIQUE'),
('def', 'daral', 'PRIMARY', 'daral', 'users', 'PRIMARY KEY'),
('def', 'daral', 'username', 'daral', 'users', 'UNIQUE'),
('def', 'daral', 'users_ibfk_1', 'daral', 'users', 'FOREIGN KEY'),
('def', 'daral', 'users_ibfk_2', 'daral', 'users', 'FOREIGN KEY'),
('def', 'daral', 'PRIMARY', 'daral', 'veterinaire', 'PRIMARY KEY'),
('def', 'daral', 'id_veterinaire', 'daral', 'veterinaire', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'animal', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'animal_ibfk_1', 'daral_09_01_13', 'animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'animal_ibfk_2', 'daral_09_01_13', 'animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'animal_type', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'name', 'daral_09_01_13', 'animal_type', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'categorie', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'categorie_id', 'daral_09_01_13', 'categorie', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'cheptel', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'cheptel_ibfk_1', 'daral_09_01_13', 'cheptel', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'cheptel_ibfk_2', 'daral_09_01_13', 'cheptel', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'daral', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'name', 'daral_09_01_13', 'daral', 'UNIQUE'),
('def', 'daral_09_01_13', 'daral_ibfk_3', 'daral_09_01_13', 'daral', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'daral_stat_animal', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'daral_stat_animal_ibfk_1', 'daral_09_01_13', 'daral_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'daral_stat_animal_ibfk_2', 'daral_09_01_13', 'daral_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'daral_stat_farmer', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'daral_stat_farmer_ibfk_1', 'daral_09_01_13', 'daral_stat_farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'departement', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'name', 'daral_09_01_13', 'departement', 'UNIQUE'),
('def', 'daral_09_01_13', 'departement_ibfk_1', 'daral_09_01_13', 'departement', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'departement_stat_animal', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'departement_stat_animal_ibfk_1', 'daral_09_01_13', 'departement_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'departement_stat_animal_ibfk_2', 'daral_09_01_13', 'departement_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'departement_stat_farmer', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'departement_stat_farmer_ibfk_1', 'daral_09_01_13', 'departement_stat_farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'farmer', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'id_farmer', 'daral_09_01_13', 'farmer', 'UNIQUE'),
('def', 'daral_09_01_13', 'farmer_ibfk_11', 'daral_09_01_13', 'farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'farmer_ibfk_13', 'daral_09_01_13', 'farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'farmer_ibfk_8', 'daral_09_01_13', 'farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'farmer_ibfk_9', 'daral_09_01_13', 'farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'langue', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'libelle', 'daral_09_01_13', 'langue', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'localite', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'name', 'daral_09_01_13', 'localite', 'UNIQUE'),
('def', 'daral_09_01_13', 'localite_ibfk_1', 'daral_09_01_13', 'localite', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'localite_ibfk_2', 'daral_09_01_13', 'localite', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'localite_stat_animal', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'localite_stat_animal_ibfk_1', 'daral_09_01_13', 'localite_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'localite_stat_animal_ibfk_2', 'daral_09_01_13', 'localite_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'localite_stat_farmer', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'localite_stat_farmer_ibfk_1', 'daral_09_01_13', 'localite_stat_farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'maladie', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'libelle', 'daral_09_01_13', 'maladie', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'media', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'media_ibfk_1', 'daral_09_01_13', 'media', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'media_ibfk_2', 'daral_09_01_13', 'media', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'national', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'national_ibfk_1', 'daral_09_01_13', 'national', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'notification', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'notification_ibfk_1', 'daral_09_01_13', 'notification', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'notification_ibfk_2', 'daral_09_01_13', 'notification', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'notification_ibfk_3', 'daral_09_01_13', 'notification', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'notification_ibfk_4', 'daral_09_01_13', 'notification', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'region', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'name', 'daral_09_01_13', 'region', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'region_stat_animal', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'region_stat_animal_ibfk_1', 'daral_09_01_13', 'region_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'region_stat_animal_ibfk_2', 'daral_09_01_13', 'region_stat_animal', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'region_stat_farmer', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'region_stat_farmer_ibfk_1', 'daral_09_01_13', 'region_stat_farmer', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'role_users', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'description', 'daral_09_01_13', 'role_users', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'type_notification', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'libelle', 'daral_09_01_13', 'type_notification', 'UNIQUE'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'users', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'username', 'daral_09_01_13', 'users', 'UNIQUE'),
('def', 'daral_09_01_13', 'users_ibfk_1', 'daral_09_01_13', 'users', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'users_ibfk_2', 'daral_09_01_13', 'users', 'FOREIGN KEY'),
('def', 'daral_09_01_13', 'PRIMARY', 'daral_09_01_13', 'veterinaire', 'PRIMARY KEY'),
('def', 'daral_09_01_13', 'id_veterinaire', 'daral_09_01_13', 'veterinaire', 'UNIQUE'),
('def', 'mysql', 'PRIMARY', 'mysql', 'columns_priv', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'db', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'event', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'func', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'help_category', 'PRIMARY KEY'),
('def', 'mysql', 'name', 'mysql', 'help_category', 'UNIQUE'),
('def', 'mysql', 'PRIMARY', 'mysql', 'help_keyword', 'PRIMARY KEY'),
('def', 'mysql', 'name', 'mysql', 'help_keyword', 'UNIQUE'),
('def', 'mysql', 'PRIMARY', 'mysql', 'help_relation', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'help_topic', 'PRIMARY KEY'),
('def', 'mysql', 'name', 'mysql', 'help_topic', 'UNIQUE'),
('def', 'mysql', 'PRIMARY', 'mysql', 'host', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'ndb_binlog_index', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'plugin', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'proc', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'procs_priv', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'proxies_priv', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'servers', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'tables_priv', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'time_zone', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'time_zone_leap_second', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'time_zone_name', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'time_zone_transition', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'time_zone_transition_type', 'PRIMARY KEY'),
('def', 'mysql', 'PRIMARY', 'mysql', 'user', 'PRIMARY KEY'),
('def', 'test', 'PRIMARY', 'test', 'news', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'actions', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'actions_log', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'alert', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'uniq_alert_code', 'ushahidi_db', 'alert', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'alert_category', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'alert_sent', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'api_banned', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'api_log', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'api_settings', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'badge', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'badge_users', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'category', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'category_lang', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'checkin', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'city', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'cluster', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'comment', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'country', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'externalapp', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'feed', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'feed_item', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'form', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'form_field', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'field_name', 'ushahidi_db', 'form_field', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'form_field_option', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'form_response', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'geometry', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'incident', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'incident_category', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'incident_category_ids', 'ushahidi_db', 'incident_category', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'incident_lang', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'incident_person', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'layer', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'level', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'location', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'maintenance', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'media', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'message', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'openid', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'page', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'permissions', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'name_UNIQUE', 'ushahidi_db', 'permissions', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'permissions_roles', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'plugin', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'plugin_name', 'ushahidi_db', 'plugin', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'private_message', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'rating', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'reporter', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'roles', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'uniq_name', 'ushahidi_db', 'roles', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'roles_users', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'scheduler', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'scheduler_log', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'service', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'sessions', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'settings', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'uq_settings_key', 'ushahidi_db', 'settings', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'user_devices', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'user_tokens', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'uniq_token', 'ushahidi_db', 'user_tokens', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'users', 'PRIMARY KEY'),
('def', 'ushahidi_db', 'uniq_username', 'ushahidi_db', 'users', 'UNIQUE'),
('def', 'ushahidi_db', 'uniq_email', 'ushahidi_db', 'users', 'UNIQUE'),
('def', 'ushahidi_db', 'PRIMARY', 'ushahidi_db', 'verified', 'PRIMARY KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'animal', 'PRIMARY KEY'),
('def', 'zf_daral', 'animal_ibfk_1', 'zf_daral', 'animal', 'FOREIGN KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'daral', 'PRIMARY KEY'),
('def', 'zf_daral', 'daral_ibfk_1', 'zf_daral', 'daral', 'FOREIGN KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'farmer', 'PRIMARY KEY'),
('def', 'zf_daral', 'farmer_ibfk_1', 'zf_daral', 'farmer', 'FOREIGN KEY'),
('def', 'zf_daral', 'farmer_ibfk_2', 'zf_daral', 'farmer', 'FOREIGN KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'lang', 'PRIMARY KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'localite', 'PRIMARY KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'maladie', 'PRIMARY KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'media', 'PRIMARY KEY'),
('def', 'zf_daral', 'media_ibfk_1', 'zf_daral', 'media', 'FOREIGN KEY'),
('def', 'zf_daral', 'media_ibfk_2', 'zf_daral', 'media', 'FOREIGN KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'notification', 'PRIMARY KEY'),
('def', 'zf_daral', 'notification_ibfk_3', 'zf_daral', 'notification', 'FOREIGN KEY'),
('def', 'zf_daral', 'notification_ibfk_4', 'zf_daral', 'notification', 'FOREIGN KEY'),
('def', 'zf_daral', 'notification_ibfk_5', 'zf_daral', 'notification', 'FOREIGN KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'users', 'PRIMARY KEY'),
('def', 'zf_daral', 'PRIMARY', 'zf_daral', 'veterinaire', 'PRIMARY KEY');

-- --------------------------------------------------------

--
-- Structure de la table `TABLE_PRIVILEGES`
--

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `TRIGGERS`
--

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `USER_PRIVILEGES`
--

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''root''@''localhost''', 'def', 'SELECT', 'YES'),
('''root''@''localhost''', 'def', 'INSERT', 'YES'),
('''root''@''localhost''', 'def', 'UPDATE', 'YES'),
('''root''@''localhost''', 'def', 'DELETE', 'YES'),
('''root''@''localhost''', 'def', 'CREATE', 'YES'),
('''root''@''localhost''', 'def', 'DROP', 'YES'),
('''root''@''localhost''', 'def', 'RELOAD', 'YES'),
('''root''@''localhost''', 'def', 'SHUTDOWN', 'YES'),
('''root''@''localhost''', 'def', 'PROCESS', 'YES'),
('''root''@''localhost''', 'def', 'FILE', 'YES'),
('''root''@''localhost''', 'def', 'REFERENCES', 'YES'),
('''root''@''localhost''', 'def', 'INDEX', 'YES'),
('''root''@''localhost''', 'def', 'ALTER', 'YES'),
('''root''@''localhost''', 'def', 'SHOW DATABASES', 'YES'),
('''root''@''localhost''', 'def', 'SUPER', 'YES'),
('''root''@''localhost''', 'def', 'CREATE TEMPORARY TABLES', 'YES'),
('''root''@''localhost''', 'def', 'LOCK TABLES', 'YES'),
('''root''@''localhost''', 'def', 'EXECUTE', 'YES'),
('''root''@''localhost''', 'def', 'REPLICATION SLAVE', 'YES'),
('''root''@''localhost''', 'def', 'REPLICATION CLIENT', 'YES'),
('''root''@''localhost''', 'def', 'CREATE VIEW', 'YES'),
('''root''@''localhost''', 'def', 'SHOW VIEW', 'YES'),
('''root''@''localhost''', 'def', 'CREATE ROUTINE', 'YES'),
('''root''@''localhost''', 'def', 'ALTER ROUTINE', 'YES'),
('''root''@''localhost''', 'def', 'CREATE USER', 'YES'),
('''root''@''localhost''', 'def', 'EVENT', 'YES'),
('''root''@''localhost''', 'def', 'TRIGGER', 'YES'),
('''root''@''localhost''', 'def', 'CREATE TABLESPACE', 'YES'),
('''ushahidi''@''localhost''', 'def', 'USAGE', 'NO'),
('''admin''@''localhost''', 'def', 'SELECT', 'YES'),
('''admin''@''localhost''', 'def', 'INSERT', 'YES'),
('''admin''@''localhost''', 'def', 'UPDATE', 'YES'),
('''admin''@''localhost''', 'def', 'DELETE', 'YES'),
('''admin''@''localhost''', 'def', 'CREATE', 'YES'),
('''admin''@''localhost''', 'def', 'DROP', 'YES'),
('''admin''@''localhost''', 'def', 'RELOAD', 'YES'),
('''admin''@''localhost''', 'def', 'SHUTDOWN', 'YES'),
('''admin''@''localhost''', 'def', 'PROCESS', 'YES'),
('''admin''@''localhost''', 'def', 'FILE', 'YES'),
('''admin''@''localhost''', 'def', 'REFERENCES', 'YES'),
('''admin''@''localhost''', 'def', 'INDEX', 'YES'),
('''admin''@''localhost''', 'def', 'ALTER', 'YES'),
('''admin''@''localhost''', 'def', 'SHOW DATABASES', 'YES'),
('''admin''@''localhost''', 'def', 'SUPER', 'YES'),
('''admin''@''localhost''', 'def', 'CREATE TEMPORARY TABLES', 'YES'),
('''admin''@''localhost''', 'def', 'LOCK TABLES', 'YES'),
('''admin''@''localhost''', 'def', 'EXECUTE', 'YES'),
('''admin''@''localhost''', 'def', 'REPLICATION SLAVE', 'YES'),
('''admin''@''localhost''', 'def', 'REPLICATION CLIENT', 'YES'),
('''admin''@''localhost''', 'def', 'CREATE VIEW', 'YES'),
('''admin''@''localhost''', 'def', 'SHOW VIEW', 'YES'),
('''admin''@''localhost''', 'def', 'CREATE ROUTINE', 'YES'),
('''admin''@''localhost''', 'def', 'ALTER ROUTINE', 'YES'),
('''admin''@''localhost''', 'def', 'CREATE USER', 'YES'),
('''admin''@''localhost''', 'def', 'EVENT', 'YES'),
('''admin''@''localhost''', 'def', 'TRIGGER', 'YES'),
('''admin''@''localhost''', 'def', 'CREATE TABLESPACE', 'YES'),
('''''@''localhost''', 'def', 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Structure de la table `VIEWS`
--

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_CMP_RESET`
--

CREATE TEMPORARY TABLE `INNODB_CMP_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `INNODB_CMP_RESET`
--

INSERT INTO `INNODB_CMP_RESET` (`page_size`, `compress_ops`, `compress_ops_ok`, `compress_time`, `uncompress_ops`, `uncompress_time`) VALUES
(1024, 0, 0, 0, 0, 0),
(2048, 0, 0, 0, 0, 0),
(4096, 0, 0, 0, 0, 0),
(8192, 0, 0, 0, 0, 0),
(16384, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_TRX`
--

CREATE TEMPORARY TABLE `INNODB_TRX` (
  `trx_id` varchar(18) NOT NULL DEFAULT '',
  `trx_state` varchar(13) NOT NULL DEFAULT '',
  `trx_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trx_requested_lock_id` varchar(81) DEFAULT NULL,
  `trx_wait_started` datetime DEFAULT NULL,
  `trx_weight` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_query` varchar(1024) DEFAULT NULL,
  `trx_operation_state` varchar(64) DEFAULT NULL,
  `trx_tables_in_use` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_tables_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_structs` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_modified` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_isolation_level` varchar(16) NOT NULL DEFAULT '',
  `trx_unique_checks` int(1) NOT NULL DEFAULT '0',
  `trx_foreign_key_checks` int(1) NOT NULL DEFAULT '0',
  `trx_last_foreign_key_error` varchar(256) DEFAULT NULL,
  `trx_adaptive_hash_latched` int(1) NOT NULL DEFAULT '0',
  `trx_adaptive_hash_timeout` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_CMPMEM_RESET`
--

CREATE TEMPORARY TABLE `INNODB_CMPMEM_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `INNODB_CMPMEM_RESET`
--

INSERT INTO `INNODB_CMPMEM_RESET` (`page_size`, `buffer_pool_instance`, `pages_used`, `pages_free`, `relocation_ops`, `relocation_time`) VALUES
(1024, 0, 0, 0, 0, 0),
(2048, 0, 0, 0, 0, 0),
(4096, 0, 0, 0, 0, 0),
(8192, 0, 0, 0, 0, 0),
(16384, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_LOCK_WAITS`
--

CREATE TEMPORARY TABLE `INNODB_LOCK_WAITS` (
  `requesting_trx_id` varchar(18) NOT NULL DEFAULT '',
  `requested_lock_id` varchar(81) NOT NULL DEFAULT '',
  `blocking_trx_id` varchar(18) NOT NULL DEFAULT '',
  `blocking_lock_id` varchar(81) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_CMPMEM`
--

CREATE TEMPORARY TABLE `INNODB_CMPMEM` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `INNODB_CMPMEM`
--

INSERT INTO `INNODB_CMPMEM` (`page_size`, `buffer_pool_instance`, `pages_used`, `pages_free`, `relocation_ops`, `relocation_time`) VALUES
(1024, 0, 0, 0, 0, 0),
(2048, 0, 0, 0, 0, 0),
(4096, 0, 0, 0, 0, 0),
(8192, 0, 0, 0, 0, 0),
(16384, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_CMP`
--

CREATE TEMPORARY TABLE `INNODB_CMP` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Contenu de la table `INNODB_CMP`
--

INSERT INTO `INNODB_CMP` (`page_size`, `compress_ops`, `compress_ops_ok`, `compress_time`, `uncompress_ops`, `uncompress_time`) VALUES
(1024, 0, 0, 0, 0, 0),
(2048, 0, 0, 0, 0, 0),
(4096, 0, 0, 0, 0, 0),
(8192, 0, 0, 0, 0, 0),
(16384, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `INNODB_LOCKS`
--

CREATE TEMPORARY TABLE `INNODB_LOCKS` (
  `lock_id` varchar(81) NOT NULL DEFAULT '',
  `lock_trx_id` varchar(18) NOT NULL DEFAULT '',
  `lock_mode` varchar(32) NOT NULL DEFAULT '',
  `lock_type` varchar(32) NOT NULL DEFAULT '',
  `lock_table` varchar(1024) NOT NULL DEFAULT '',
  `lock_index` varchar(1024) DEFAULT NULL,
  `lock_space` bigint(21) unsigned DEFAULT NULL,
  `lock_page` bigint(21) unsigned DEFAULT NULL,
  `lock_rec` bigint(21) unsigned DEFAULT NULL,
  `lock_data` varchar(8192) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
--
-- Base de données: `mysql`
--
CREATE DATABASE `mysql` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mysql`;

-- --------------------------------------------------------

--
-- Structure de la table `columns_priv`
--

CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';

-- --------------------------------------------------------

--
-- Structure de la table `db`
--

CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';

--
-- Contenu de la table `db`
--

INSERT INTO `db` (`Host`, `Db`, `User`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Create_priv`, `Drop_priv`, `Grant_priv`, `References_priv`, `Index_priv`, `Alter_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Create_view_priv`, `Show_view_priv`, `Create_routine_priv`, `Alter_routine_priv`, `Execute_priv`, `Event_priv`, `Trigger_priv`) VALUES
('%', 'test', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N'),
('%', 'test\\_%', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N'),
('localhost', 'ushahidi_db', 'ushahidi', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
('localhost', 'daral', 'admin', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';

-- --------------------------------------------------------

--
-- Structure de la table `func`
--

CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';

-- --------------------------------------------------------

--
-- Structure de la table `general_log`
--

CREATE TABLE `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';

-- --------------------------------------------------------

--
-- Structure de la table `help_category`
--

CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';

--
-- Contenu de la table `help_category`
--

INSERT INTO `help_category` (`help_category_id`, `name`, `parent_category_id`, `url`) VALUES
(1, 'Geographic', 0, ''),
(2, 'Polygon properties', 30, ''),
(3, 'WKT', 30, ''),
(4, 'Numeric Functions', 34, ''),
(5, 'MBR', 30, ''),
(6, 'Control flow functions', 34, ''),
(7, 'Transactions', 31, ''),
(8, 'Account Management', 31, ''),
(9, 'Point properties', 30, ''),
(10, 'Encryption Functions', 34, ''),
(11, 'LineString properties', 30, ''),
(12, 'Logical operators', 34, ''),
(13, 'Miscellaneous Functions', 34, ''),
(14, 'Functions and Modifiers for Use with GROUP BY', 31, ''),
(15, 'Information Functions', 34, ''),
(16, 'Storage Engines', 31, ''),
(17, 'Comparison operators', 34, ''),
(18, 'Bit Functions', 34, ''),
(19, 'Table Maintenance', 31, ''),
(20, 'Data Types', 31, ''),
(21, 'Triggers', 31, ''),
(22, 'Geometry constructors', 30, ''),
(23, 'GeometryCollection properties', 1, ''),
(24, 'Administration', 31, ''),
(25, 'Data Manipulation', 31, ''),
(26, 'Geometry relations', 30, ''),
(27, 'Language Structure', 31, ''),
(28, 'Date and Time Functions', 34, ''),
(29, 'WKB', 30, ''),
(30, 'Geographic Features', 31, ''),
(31, 'Contents', 0, ''),
(32, 'Geometry properties', 30, ''),
(33, 'String Functions', 34, ''),
(34, 'Functions', 31, ''),
(35, 'Stored Routines', 31, ''),
(36, 'Data Definition', 31, '');

-- --------------------------------------------------------

--
-- Structure de la table `help_keyword`
--

CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';

--
-- Contenu de la table `help_keyword`
--

INSERT INTO `help_keyword` (`help_keyword_id`, `name`) VALUES
(0, 'JOIN'),
(1, 'REPEAT'),
(2, 'SERIALIZABLE'),
(3, 'REPLACE'),
(4, 'RETURNS'),
(5, 'MASTER_SSL_CA'),
(6, 'NCHAR'),
(7, 'COLUMNS'),
(8, 'WORK'),
(9, 'DATETIME'),
(10, 'MODE'),
(11, 'OPEN'),
(12, 'INTEGER'),
(13, 'ESCAPE'),
(14, 'VALUE'),
(15, 'GEOMETRYCOLLECTIONFROMWKB'),
(16, 'SQL_BIG_RESULT'),
(17, 'DROP'),
(18, 'EVENTS'),
(19, 'MONTH'),
(20, 'INFO'),
(21, 'DUPLICATE'),
(22, 'REPLICATION'),
(23, 'INNODB'),
(24, 'YEAR_MONTH'),
(25, 'SUBJECT'),
(26, 'PREPARE'),
(27, 'LOCK'),
(28, 'NDB'),
(29, 'CHECK'),
(30, 'FULL'),
(31, 'INT4'),
(32, 'BY'),
(33, 'NO'),
(34, 'MINUTE'),
(35, 'DATA'),
(36, 'DAY'),
(37, 'SHARE'),
(38, 'REAL'),
(39, 'SEPARATOR'),
(40, 'DELETE'),
(41, 'ON'),
(42, 'CONNECTION'),
(43, 'CLOSE'),
(44, 'X509'),
(45, 'USE'),
(46, 'WHERE'),
(47, 'PRIVILEGES'),
(48, 'SPATIAL'),
(49, 'SUPER'),
(50, 'SQL_BUFFER_RESULT'),
(51, 'IGNORE'),
(52, 'QUICK'),
(53, 'SIGNED'),
(54, 'SECURITY'),
(55, 'POLYGONFROMWKB'),
(56, 'NDBCLUSTER'),
(57, 'FALSE'),
(58, 'LEVEL'),
(59, 'FORCE'),
(60, 'BINARY'),
(61, 'TO'),
(62, 'CHANGE'),
(63, 'HOUR_MINUTE'),
(64, 'UPDATE'),
(65, 'INTO'),
(66, 'FEDERATED'),
(67, 'VARYING'),
(68, 'HOUR_SECOND'),
(69, 'VARIABLE'),
(70, 'ROLLBACK'),
(71, 'PROCEDURE'),
(72, 'RTREE'),
(73, 'TIMESTAMP'),
(74, 'IMPORT'),
(75, 'AGAINST'),
(76, 'CHECKSUM'),
(77, 'COUNT'),
(78, 'LONGBINARY'),
(79, 'THEN'),
(80, 'INSERT'),
(81, 'HANDLER'),
(82, 'ENGINES'),
(83, 'DAY_SECOND'),
(84, 'EXISTS'),
(85, 'RELEASE'),
(86, 'BOOLEAN'),
(87, 'MOD'),
(88, 'DEFAULT'),
(89, 'TYPE'),
(90, 'NO_WRITE_TO_BINLOG'),
(91, 'RESET'),
(92, 'DO'),
(93, 'ITERATE'),
(94, 'BIGINT'),
(95, 'SET'),
(96, 'ISSUER'),
(97, 'DATE'),
(98, 'STATUS'),
(99, 'FULLTEXT'),
(100, 'COMMENT'),
(101, 'MASTER_CONNECT_RETRY'),
(102, 'INNER'),
(103, 'STOP'),
(104, 'MASTER_LOG_FILE'),
(105, 'MRG_MYISAM'),
(106, 'PRECISION'),
(107, 'REQUIRE'),
(108, 'TRAILING'),
(109, 'LONG'),
(110, 'OPTION'),
(111, 'ELSE'),
(112, 'DEALLOCATE'),
(113, 'IO_THREAD'),
(114, 'CASE'),
(115, 'CIPHER'),
(116, 'CONTINUE'),
(117, 'FROM'),
(118, 'READ'),
(119, 'LEFT'),
(120, 'ELSEIF'),
(121, 'MINUTE_SECOND'),
(122, 'COMPACT'),
(123, 'DEC'),
(124, 'FOR'),
(125, 'WARNINGS'),
(126, 'MIN_ROWS'),
(127, 'STRING'),
(128, 'CONDITION'),
(129, 'FUNCTION'),
(130, 'ENCLOSED'),
(131, 'AGGREGATE'),
(132, 'FIELDS'),
(133, 'INT3'),
(134, 'ARCHIVE'),
(135, 'ADD'),
(136, 'AVG_ROW_LENGTH'),
(137, 'FLOAT4'),
(138, 'VIEW'),
(139, 'REPEATABLE'),
(140, 'INFILE'),
(141, 'ORDER'),
(142, 'USING'),
(143, 'MIDDLEINT'),
(144, 'GRANT'),
(145, 'UNSIGNED'),
(146, 'DECIMAL'),
(147, 'GEOMETRYFROMTEXT'),
(148, 'INDEXES'),
(149, 'FOREIGN'),
(150, 'CACHE'),
(151, 'HOSTS'),
(152, 'COMMIT'),
(153, 'SCHEMAS'),
(154, 'LEADING'),
(155, 'SNAPSHOT'),
(156, 'DECLARE'),
(157, 'LOAD'),
(158, 'SQL_CACHE'),
(159, 'CONVERT'),
(160, 'DYNAMIC'),
(161, 'POLYGONFROMTEXT'),
(162, 'BYTE'),
(163, 'LINESTRINGFROMWKB'),
(164, 'GLOBAL'),
(165, 'BERKELEYDB'),
(166, 'WHEN'),
(167, 'HAVING'),
(168, 'AS'),
(169, 'STARTING'),
(170, 'RELOAD'),
(171, 'AUTOCOMMIT'),
(172, 'REVOKE'),
(173, 'GRANTS'),
(174, 'OUTER'),
(175, 'FLOOR'),
(176, 'WITH'),
(177, 'STD'),
(178, 'AFTER'),
(179, 'CSV'),
(180, 'DISABLE'),
(181, 'OUTFILE'),
(182, 'LOW_PRIORITY'),
(183, 'FILE'),
(184, 'BDB'),
(185, 'SCHEMA'),
(186, 'SONAME'),
(187, 'POW'),
(188, 'MULTIPOINTFROMWKB'),
(189, 'INDEX'),
(190, 'MULTIPOINTFROMTEXT'),
(191, 'BACKUP'),
(192, 'MULTILINESTRINGFROMWKB'),
(193, 'EXTENDED'),
(194, 'CROSS'),
(195, 'NATIONAL'),
(196, 'GROUP'),
(197, 'UNDO'),
(198, 'ZEROFILL'),
(199, 'CLIENT'),
(200, 'MASTER_PASSWORD'),
(201, 'RELAY_LOG_FILE'),
(202, 'TRUE'),
(203, 'CHARACTER'),
(204, 'MASTER_USER'),
(205, 'ENGINE'),
(206, 'TABLE'),
(207, 'INSERT_METHOD'),
(208, 'CASCADE'),
(209, 'RELAY_LOG_POS'),
(210, 'SQL_CALC_FOUND_ROWS'),
(211, 'MYISAM'),
(212, 'LEAVE'),
(213, 'MODIFY'),
(214, 'MATCH'),
(215, 'MASTER_LOG_POS'),
(216, 'DESC'),
(217, 'DISTINCTROW'),
(218, 'TIME'),
(219, 'NUMERIC'),
(220, 'EXPANSION'),
(221, 'CURSOR'),
(222, 'GEOMETRYCOLLECTIONFROMTEXT'),
(223, 'CHAIN'),
(224, 'FLUSH'),
(225, 'CREATE'),
(226, 'ISAM'),
(227, 'MAX_UPDATES_PER_HOUR'),
(228, 'INT2'),
(229, 'PROCESSLIST'),
(230, 'LOGS'),
(231, 'HEAP'),
(232, 'SOUNDS'),
(233, 'BETWEEN'),
(234, 'MULTILINESTRINGFROMTEXT'),
(235, 'PACK_KEYS'),
(236, 'CALL'),
(237, 'FAST'),
(238, 'VALUES'),
(239, 'LOOP'),
(240, 'VARCHARACTER'),
(241, 'BEFORE'),
(242, 'SHOW'),
(243, 'REDUNDANT'),
(244, 'ALL'),
(245, 'USER_RESOURCES'),
(246, 'PARTIAL'),
(247, 'BINLOG'),
(248, 'END'),
(249, 'SECOND'),
(250, 'AND'),
(251, 'FLOAT8'),
(252, 'PREV'),
(253, 'HOUR'),
(254, 'SELECT'),
(255, 'DATABASES'),
(256, 'OR'),
(257, 'IDENTIFIED'),
(258, 'MASTER_SSL_CIPHER'),
(259, 'SQL_SLAVE_SKIP_COUNTER'),
(260, 'BOTH'),
(261, 'BOOL'),
(262, 'YEAR'),
(263, 'MASTER_PORT'),
(264, 'CONCURRENT'),
(265, 'UNIQUE'),
(266, 'TRIGGERS'),
(267, 'PROCESS'),
(268, 'CONSISTENT'),
(269, 'MASTER_SSL'),
(270, 'DATE_ADD'),
(271, 'MAX_CONNECTIONS_PER_HOUR'),
(272, 'LIKE'),
(273, 'FETCH'),
(274, 'IN'),
(275, 'COLUMN'),
(276, 'DUMPFILE'),
(277, 'USAGE'),
(278, 'EXECUTE'),
(279, 'MEMORY'),
(280, 'CEIL'),
(281, 'QUERY'),
(282, 'MASTER_HOST'),
(283, 'LINES'),
(284, 'SQL_THREAD'),
(285, 'MAX_QUERIES_PER_HOUR'),
(286, 'MULTIPOLYGONFROMWKB'),
(287, 'MASTER_SSL_CERT'),
(288, 'DAY_MINUTE'),
(289, 'TRANSACTION'),
(290, 'DATE_SUB'),
(291, 'GEOMETRYFROMWKB'),
(292, 'RENAME'),
(293, 'INT1'),
(294, 'ALTER'),
(295, 'MAX_ROWS'),
(296, 'RIGHT'),
(297, 'STRAIGHT_JOIN'),
(298, 'NATURAL'),
(299, 'VARIABLES'),
(300, 'ESCAPED'),
(301, 'SHA1'),
(302, 'PASSWORD'),
(303, 'CHAR'),
(304, 'OFFSET'),
(305, 'NEXT'),
(306, 'SQL_LOG_BIN'),
(307, 'ERRORS'),
(308, 'TEMPORARY'),
(309, 'SQL_SMALL_RESULT'),
(310, 'COMMITTED'),
(311, 'UPGRADE'),
(312, 'DELAY_KEY_WRITE'),
(313, 'BEGIN'),
(314, 'MEDIUM'),
(315, 'INTERVAL'),
(316, 'SSL'),
(317, 'DAY_HOUR'),
(318, 'REFERENCES'),
(319, 'AES_ENCRYPT'),
(320, 'STORAGE'),
(321, 'ISOLATION'),
(322, 'INT8'),
(323, 'RESTRICT'),
(324, 'LINESTRINGFROMTEXT'),
(325, 'IS'),
(326, 'UNCOMMITTED'),
(327, 'NOT'),
(328, 'DES_KEY_FILE'),
(329, 'COMPRESSED'),
(330, 'START'),
(331, 'IF'),
(332, 'SAVEPOINT'),
(333, 'PRIMARY'),
(334, 'INNOBASE'),
(335, 'LAST'),
(336, 'EXIT'),
(337, 'KEYS'),
(338, 'LIMIT'),
(339, 'KEY'),
(340, 'MERGE'),
(341, 'UNTIL'),
(342, 'SQL_NO_CACHE'),
(343, 'DELAYED'),
(344, 'CONSTRAINT'),
(345, 'SERIAL'),
(346, 'ACTION'),
(347, 'WRITE'),
(348, 'SESSION'),
(349, 'DATABASE'),
(350, 'NULL'),
(351, 'USE_FRM'),
(352, 'SLAVE'),
(353, 'TERMINATED'),
(354, 'ASC'),
(355, 'ENABLE'),
(356, 'OPTIONALLY'),
(357, 'DIRECTORY'),
(358, 'WHILE'),
(359, 'MAX_USER_CONNECTIONS'),
(360, 'DISTINCT'),
(361, 'LOCAL'),
(362, 'MASTER_SSL_KEY'),
(363, 'NONE'),
(364, 'TABLES'),
(365, '<>'),
(366, 'RLIKE'),
(367, 'TRIGGER'),
(368, 'COLLATION'),
(369, 'SHUTDOWN'),
(370, 'HIGH_PRIORITY'),
(371, 'BTREE'),
(372, 'FIRST'),
(373, 'TYPES'),
(374, 'MASTER'),
(375, 'FIXED'),
(376, 'MULTIPOLYGONFROMTEXT'),
(377, 'ROW_FORMAT');

-- --------------------------------------------------------

--
-- Structure de la table `help_relation`
--

CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';

--
-- Contenu de la table `help_relation`
--

INSERT INTO `help_relation` (`help_topic_id`, `help_keyword_id`) VALUES
(324, 0),
(204, 1),
(402, 2),
(382, 3),
(185, 4),
(165, 5),
(387, 6),
(17, 7),
(315, 7),
(124, 8),
(343, 9),
(73, 10),
(324, 10),
(12, 11),
(88, 11),
(112, 11),
(315, 11),
(185, 12),
(450, 12),
(346, 13),
(214, 14),
(90, 15),
(324, 16),
(25, 17),
(72, 17),
(166, 17),
(209, 17),
(234, 17),
(246, 17),
(369, 17),
(376, 17),
(417, 17),
(102, 18),
(26, 19),
(231, 20),
(86, 21),
(177, 22),
(315, 23),
(364, 23),
(422, 23),
(26, 24),
(177, 25),
(29, 26),
(209, 26),
(324, 27),
(422, 28),
(422, 29),
(17, 30),
(263, 30),
(315, 30),
(407, 30),
(422, 30),
(450, 31),
(41, 32),
(69, 32),
(177, 32),
(324, 32),
(330, 32),
(382, 32),
(417, 32),
(422, 32),
(422, 33),
(426, 33),
(26, 34),
(98, 35),
(382, 35),
(422, 35),
(26, 36),
(324, 37),
(185, 38),
(283, 38),
(330, 39),
(422, 40),
(426, 40),
(0, 41),
(426, 41),
(422, 42),
(44, 43),
(88, 43),
(177, 44),
(0, 45),
(41, 46),
(69, 46),
(88, 46),
(170, 47),
(177, 47),
(220, 47),
(187, 48),
(417, 48),
(177, 49),
(324, 50),
(0, 51),
(69, 51),
(86, 51),
(324, 51),
(382, 51),
(417, 51),
(41, 52),
(377, 52),
(420, 52),
(343, 53),
(177, 54),
(75, 55),
(435, 55),
(422, 56),
(350, 57),
(402, 58),
(0, 59),
(228, 60),
(268, 60),
(343, 60),
(387, 60),
(165, 61),
(414, 61),
(418, 61),
(165, 62),
(417, 62),
(26, 63),
(86, 64),
(324, 64),
(426, 64),
(36, 65),
(86, 65),
(273, 65),
(324, 65),
(422, 66),
(228, 67),
(26, 68),
(109, 69),
(124, 70),
(414, 70),
(13, 71),
(270, 71),
(297, 71),
(315, 71),
(324, 71),
(376, 71),
(396, 71),
(187, 72),
(81, 73),
(167, 73),
(382, 74),
(73, 75),
(422, 76),
(56, 77),
(298, 77),
(390, 77),
(255, 78),
(23, 79),
(70, 79),
(379, 79),
(86, 80),
(171, 80),
(439, 80),
(282, 81),
(251, 82),
(315, 82),
(26, 83),
(25, 84),
(133, 84),
(246, 84),
(124, 85),
(19, 86),
(73, 86),
(152, 87),
(86, 88),
(175, 88),
(214, 88),
(417, 88),
(422, 88),
(417, 89),
(422, 89),
(95, 90),
(296, 90),
(420, 90),
(424, 90),
(31, 91),
(129, 91),
(235, 91),
(446, 92),
(104, 93),
(196, 94),
(36, 95),
(69, 95),
(117, 95),
(124, 95),
(162, 95),
(188, 95),
(302, 95),
(417, 95),
(426, 95),
(444, 95),
(177, 96),
(26, 97),
(110, 97),
(233, 97),
(343, 97),
(48, 98),
(115, 98),
(190, 98),
(198, 98),
(297, 98),
(315, 98),
(334, 98),
(364, 98),
(187, 99),
(417, 99),
(422, 99),
(422, 100),
(165, 101),
(0, 102),
(45, 103),
(165, 104),
(422, 105),
(283, 106),
(177, 107),
(410, 108),
(255, 109),
(177, 110),
(70, 111),
(379, 111),
(209, 112),
(45, 113),
(294, 113),
(70, 114),
(379, 114),
(177, 115),
(282, 116),
(41, 117),
(98, 117),
(102, 117),
(315, 117),
(324, 117),
(329, 117),
(410, 117),
(30, 118),
(88, 118),
(402, 118),
(0, 119),
(23, 120),
(26, 121),
(422, 122),
(184, 123),
(159, 124),
(282, 124),
(315, 124),
(324, 124),
(380, 124),
(298, 125),
(315, 125),
(422, 126),
(185, 127),
(159, 128),
(13, 129),
(185, 129),
(270, 129),
(297, 129),
(315, 129),
(369, 129),
(376, 129),
(396, 129),
(382, 130),
(185, 131),
(315, 132),
(382, 132),
(223, 133),
(422, 134),
(50, 135),
(417, 135),
(417, 136),
(422, 136),
(147, 137),
(25, 138),
(137, 138),
(402, 139),
(382, 140),
(41, 141),
(69, 141),
(324, 141),
(330, 141),
(417, 141),
(0, 142),
(41, 142),
(71, 142),
(223, 143),
(177, 144),
(19, 145),
(108, 145),
(147, 145),
(184, 145),
(283, 145),
(343, 145),
(450, 145),
(134, 146),
(185, 146),
(373, 147),
(315, 148),
(417, 149),
(422, 149),
(426, 149),
(84, 150),
(129, 150),
(273, 150),
(123, 151),
(315, 151),
(124, 152),
(138, 153),
(315, 153),
(410, 154),
(124, 155),
(159, 156),
(175, 156),
(282, 156),
(380, 156),
(98, 157),
(273, 157),
(329, 157),
(382, 157),
(324, 158),
(343, 159),
(422, 160),
(359, 161),
(419, 162),
(406, 163),
(109, 164),
(115, 164),
(162, 164),
(318, 164),
(402, 164),
(422, 165),
(70, 166),
(379, 166),
(324, 167),
(0, 168),
(30, 168),
(324, 168),
(382, 169),
(177, 170),
(124, 171),
(220, 172),
(169, 173),
(315, 173),
(0, 174),
(196, 175),
(73, 176),
(177, 176),
(370, 177),
(417, 178),
(382, 179),
(422, 179),
(417, 180),
(324, 181),
(30, 182),
(36, 182),
(41, 182),
(69, 182),
(86, 182),
(382, 182),
(177, 183),
(144, 184),
(422, 184),
(133, 185),
(166, 185),
(188, 185),
(278, 185),
(315, 185),
(185, 186),
(436, 187),
(416, 188),
(0, 189),
(50, 189),
(72, 189),
(84, 189),
(187, 189),
(273, 189),
(277, 189),
(315, 189),
(417, 189),
(422, 189),
(384, 190),
(326, 191),
(242, 192),
(420, 193),
(0, 194),
(228, 195),
(387, 195),
(324, 196),
(282, 197),
(19, 198),
(108, 198),
(147, 198),
(184, 198),
(283, 198),
(450, 198),
(177, 199),
(165, 200),
(165, 201),
(350, 202),
(188, 203),
(228, 203),
(302, 203),
(387, 203),
(165, 204),
(315, 205),
(334, 205),
(417, 205),
(422, 205),
(50, 206),
(190, 206),
(246, 206),
(247, 206),
(315, 206),
(326, 206),
(329, 206),
(422, 207),
(25, 208),
(246, 208),
(422, 208),
(426, 208),
(165, 209),
(324, 210),
(422, 211),
(279, 212),
(417, 213),
(73, 214),
(165, 215),
(299, 216),
(324, 216),
(330, 216),
(324, 217),
(284, 218),
(342, 218),
(343, 218),
(184, 219),
(73, 220),
(380, 221),
(217, 222),
(124, 223),
(129, 224),
(13, 225),
(16, 225),
(50, 225),
(133, 225),
(185, 225),
(187, 225),
(247, 225),
(270, 225),
(278, 225),
(315, 225),
(422, 225),
(422, 226),
(177, 227),
(205, 228),
(315, 229),
(407, 229),
(144, 230),
(268, 230),
(315, 230),
(334, 230),
(422, 231),
(344, 232),
(125, 233),
(89, 234),
(422, 235),
(307, 236),
(377, 237),
(36, 238),
(312, 239),
(228, 240),
(418, 241),
(13, 242),
(17, 242),
(20, 242),
(48, 242),
(56, 242),
(102, 242),
(112, 242),
(115, 242),
(123, 242),
(138, 242),
(144, 242),
(169, 242),
(170, 242),
(190, 242),
(198, 242),
(247, 242),
(251, 242),
(263, 242),
(268, 242),
(277, 242),
(278, 242),
(297, 242),
(298, 242),
(302, 242),
(318, 242),
(334, 242),
(364, 242),
(407, 242),
(442, 242),
(422, 243),
(177, 244),
(220, 244),
(274, 244),
(324, 244),
(296, 245),
(422, 246),
(102, 247),
(23, 248),
(70, 248),
(204, 248),
(295, 248),
(312, 248),
(379, 248),
(446, 248),
(26, 249),
(125, 250),
(285, 250),
(283, 251),
(88, 252),
(26, 253),
(36, 254),
(227, 254),
(231, 254),
(138, 255),
(315, 255),
(119, 256),
(177, 257),
(165, 258),
(162, 259),
(410, 260),
(19, 261),
(92, 261),
(26, 262),
(165, 263),
(382, 264),
(417, 265),
(20, 266),
(177, 267),
(124, 268),
(165, 269),
(26, 270),
(177, 271),
(315, 272),
(344, 272),
(349, 273),
(73, 274),
(102, 274),
(324, 274),
(417, 275),
(324, 276),
(177, 277),
(71, 278),
(177, 278),
(324, 279),
(403, 280),
(73, 281),
(129, 281),
(165, 282),
(382, 283),
(45, 284),
(294, 284),
(177, 285),
(103, 286),
(165, 287),
(26, 288),
(124, 289),
(402, 289),
(26, 290),
(122, 291),
(417, 292),
(19, 293),
(50, 294),
(137, 294),
(177, 294),
(396, 294),
(417, 294),
(422, 295),
(0, 296),
(0, 297),
(324, 297),
(0, 298),
(315, 299),
(318, 299),
(382, 300),
(254, 301),
(177, 302),
(343, 303),
(419, 303),
(324, 304),
(88, 305),
(444, 306),
(56, 307),
(315, 307),
(246, 308),
(324, 309),
(402, 310),
(377, 311),
(422, 312),
(124, 313),
(295, 313),
(377, 314),
(26, 315),
(177, 316),
(26, 317),
(177, 318),
(422, 318),
(426, 318),
(447, 319),
(251, 320),
(402, 321),
(108, 322),
(25, 323),
(246, 323),
(426, 323),
(47, 324),
(337, 325),
(402, 326),
(133, 327),
(281, 327),
(296, 328),
(422, 329),
(124, 330),
(294, 330),
(23, 331),
(25, 331),
(133, 331),
(166, 331),
(246, 331),
(433, 331),
(414, 332),
(417, 333),
(422, 334),
(88, 335),
(282, 336),
(277, 337),
(315, 337),
(417, 337),
(41, 338),
(69, 338),
(88, 338),
(102, 338),
(324, 338),
(50, 339),
(86, 339),
(417, 339),
(422, 339),
(426, 339),
(422, 340),
(204, 341),
(324, 342),
(36, 343),
(86, 343),
(439, 343),
(417, 344),
(422, 344),
(214, 345),
(422, 345),
(422, 346),
(426, 346),
(30, 347),
(109, 348),
(115, 348),
(318, 348),
(402, 348),
(133, 349),
(166, 349),
(278, 349),
(315, 349),
(337, 350),
(426, 350),
(420, 351),
(31, 352),
(45, 352),
(123, 352),
(198, 352),
(294, 352),
(382, 353),
(324, 354),
(330, 354),
(417, 355),
(382, 356),
(422, 357),
(446, 358),
(177, 359),
(258, 360),
(274, 360),
(324, 360),
(330, 360),
(351, 360),
(390, 360),
(430, 360),
(30, 361),
(95, 361),
(296, 361),
(382, 361),
(420, 361),
(424, 361),
(165, 362),
(177, 363),
(30, 364),
(112, 364),
(263, 364),
(315, 364),
(445, 365),
(22, 366),
(16, 367),
(234, 367),
(442, 368),
(177, 369),
(86, 370),
(324, 370),
(187, 371),
(88, 372),
(417, 372),
(422, 372),
(315, 373),
(48, 374),
(98, 374),
(165, 374),
(235, 374),
(268, 374),
(329, 374),
(184, 375),
(422, 375),
(176, 376),
(422, 377);

-- --------------------------------------------------------

--
-- Structure de la table `help_topic`
--

CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';

--
-- Contenu de la table `help_topic`
--

INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(0, 'JOIN', 25, 'MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    table_reference [, table_reference] ...\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias]\n        [{USE|IGNORE|FORCE} INDEX (key_list)]\n  | ( table_references )\n  | { OJ table_reference LEFT OUTER JOIN table_reference\n        ON conditional_expr }\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON condition\n  | table_reference LEFT [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [LEFT [OUTER]] JOIN table_factor\n  | table_reference RIGHT [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [RIGHT [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, CROSS JOIN is a syntactic equivalent to INNER JOIN (they can\nreplace each other. In standard SQL, they are not equivalent. INNER\nJOIN is used with an ON clause, CROSS JOIN is used otherwise.\n\nIn versions of MySQL prior to 5.0.1, parentheses in table_references\nwere just omitted and all join operations were grouped to the left. In\ngeneral, parentheses can be ignored in join expressions containing only\ninner join operations. As of 5.0.1, nested joins are allowed (see\n[nested-joins]).\n\nFurther changes in join processing were made in 5.0.12 to make MySQL\nmore compliant with standard SQL. These charges are described later in\nthis section.\n', 'SELECT table1.* FROM table1\n  LEFT JOIN table2 ON table1.id=table2.id\n  WHERE table2.id IS NULL;\n', 'join'),
(1, 'HEX', 33, 'Syntax:\nHEX(N_or_S)\n\nIf N_or_S is a number, returns a string representation of the\nhexadecimal value of N, where N is a longlong (BIGINT) number. This is\nequivalent to CONV(N,10,16).\n\nIf N_or_S is a string, returns a hexadecimal string representation of\nN_or_S where each character in N_or_S is converted to two hexadecimal\ndigits.\n', 'mysql> SELECT HEX(255);\n        -> ''FF''\nmysql> SELECT 0x616263;\n        -> ''abc''\nmysql> SELECT HEX(''abc'');\n        -> 616263\n', 'string-functions'),
(2, 'REPLACE', 33, 'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n', 'mysql> SELECT REPLACE(''www.mysql.com'', ''w'', ''Ww'');\n        -> ''WwWwWw.mysql.com''\n', 'string-functions'),
(3, 'CONTAINS', 26, 'Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(4, 'SRID', 32, 'SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n', 'mysql> SELECT SRID(GeomFromText(''LineString(1 1,2 2)'',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(''LineString(1 1,2 2)'',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n', 'general-geometry-property-functions'),
(5, 'CURRENT_TIMESTAMP', 28, 'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n', '', 'date-and-time-functions'),
(6, 'VARIANCE', 14, 'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. As of MySQL 5.0.3, the standard SQL function VAR_POP()\ncan be used instead.\n\nVARIANCE() returns NULL if there were no matching rows.\n', '', 'group-by-functions'),
(7, 'VAR_SAMP', 14, 'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one. This function was added in MySQL 5.0.3.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n', '', 'group-by-functions'),
(8, 'CONCAT', 33, 'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are non-binary strings,\nthe result is a non-binary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent binary string form; if you want to avoid that, you\ncan use an explicit type cast, as in this example:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n', 'mysql> SELECT CONCAT(''My'', ''S'', ''QL'');\n        -> ''MySQL''\nmysql> SELECT CONCAT(''My'', NULL, ''QL'');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> ''14.3''\n', 'string-functions'),
(9, 'GEOMETRY HIERARCHY', 30, 'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnon-instantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n', '', 'gis-geometry-class-hierarchy'),
(10, 'CHAR FUNCTION', 33, 'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nAs of MySQL 5.0.15, CHAR() arguments larger than 255 are converted into\nmultiple result bytes. For example, CHAR(256) is equivalent to\nCHAR(1,0), and CHAR(256*256) is equivalent to CHAR(1,0,0):\n\nmysql> SELECT HEX(CHAR(1,0)), HEX(CHAR(256));\n+----------------+----------------+\n| HEX(CHAR(1,0)) | HEX(CHAR(256)) |\n+----------------+----------------+\n| 0100           | 0100           |\n+----------------+----------------+\nmysql> SELECT HEX(CHAR(1,0,0)), HEX(CHAR(256*256));\n+------------------+--------------------+\n| HEX(CHAR(1,0,0)) | HEX(CHAR(256*256)) |\n+------------------+--------------------+\n| 010000           | 010000             |\n+------------------+--------------------+\n\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nBefore MySQL 5.0.15, CHAR() returns a string in the connection\ncharacter set and the USING clause is unavailable. In addition, each\nargument is interpreted modulo 256, so CHAR(256) and CHAR(256*256) both\nare equivalent to CHAR(0).\n', 'mysql> SELECT CHAR(77,121,83,81,''76'');\n        -> ''MySQL''\nmysql> SELECT CHAR(77,77.3,''77.3'');\n        -> ''MMM''\n', 'string-functions'),
(11, 'DATETIME', 20, 'DATETIME\n\nA date and time combination. The supported range is ''1000-01-01\n00:00:00'' to ''9999-12-31 23:59:59''. MySQL displays DATETIME values in\n''YYYY-MM-DD HH:MM:SS'' format, but allows you to assign values to\nDATETIME columns using either strings or numbers.\n', '', 'date-and-time-type-overview'),
(12, 'OPEN', 35, 'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor.\n', '', 'open'),
(13, 'SHOW CREATE PROCEDURE', 25, 'Syntax:\nSHOW CREATE {PROCEDURE | FUNCTION} sp_name\n\nThis statement is a MySQL extension. Similar to SHOW CREATE TABLE, it\nreturns the exact string that can be used to re-create the named\nroutine.\n', 'mysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n       Function: hello\n       sql_mode:\nCreate Function: CREATE FUNCTION `test`.`hello`(s CHAR(20)) RETURNS CHAR(50)\nRETURN CONCAT(''Hello, '',s,''!'')\n', 'show-create-procedure'),
(14, 'INTEGER', 20, 'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n', '', 'numeric-type-overview'),
(15, 'LOWER', 33, 'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n', 'mysql> SELECT LOWER(''QUADRATICALLY'');\n        -> ''quadratically''\n', 'string-functions'),
(16, 'CREATE TRIGGER', 21, 'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name trigger_time trigger_event\n    ON tbl_name FOR EACH ROW trigger_stmt\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. CREATE TRIGGER was added in\nMySQL 5.0.2. Currently, its use requires the SUPER privilege.\n\nThe trigger becomes associated with the table named tbl_name, which\nmust refer to a permanent table. You cannot associate a trigger with a\nTEMPORARY table or a view.\n\nWhen the trigger is activated, the DEFINER clause determines the\nprivileges that apply, as described later in this section.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after the statement that\nactivated it.\n\ntrigger_event indicates the kind of statement that activates the\ntrigger. The trigger_event can be one of the following:\n\no INSERT: The trigger is activated whenever a new row is inserted into\n  the table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger is activated whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger is activated whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements.\n', '', 'create-trigger'),
(17, 'SHOW COLUMNS', 25, 'Syntax:\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [LIKE ''pattern'']\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views as of MySQL 5.0.1.\n\nIf the data types differ from what you expect them to be based on your\nCREATE TABLE statement, note that MySQL sometimes changes data types\nwhen you create or alter a table. The conditions for which this occurs\nare described in [silent-column-changes].\n\nThe FULL keyword causes the output to include the privileges you have\nas well as any per-column comments for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nmysql> SHOW COLUMNS FROM mytable FROM mydb;\nmysql> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table''s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee [describe].\n', '', 'show-columns'),
(18, 'MONTH', 28, 'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 0 to 12.\n', 'mysql> SELECT MONTH(''1998-02-03'');\n        -> 2\n', 'date-and-time-functions'),
(19, 'TINYINT', 20, 'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n', '', 'numeric-type-overview'),
(20, 'SHOW TRIGGERS', 25, 'Syntax:\nSHOW TRIGGERS [FROM db_name] [LIKE expr]\n\nSHOW TRIGGERS lists the triggers currently defined on the MySQL server.\nThis statement requires the SUPER privilege. It was implemented in\nMySQL 5.0.10.\n\nFor the trigger ins_sum as defined in [using-triggers], the output of\nthis statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE ''acc%''\\G\n*************************** 1. row ***************************\n  Trigger: ins_sum\n    Event: INSERT\n    Table: account\nStatement: SET @sum = @sum + NEW.amount\n   Timing: BEFORE\n  Created: NULL\n sql_mode:\n  Definer: myname@localhost\n', '', 'show-triggers'),
(21, 'MASTER_POS_WAIT', 13, 'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave''s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n', '', 'miscellaneous-functions'),
(22, 'REGEXP', 33, 'Syntax:\nexpr REGEXP pat expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression. The syntax for\nregular expressions is discussed in [regexp]. Returns 1 if expr matches\npat; otherwise it returns 0. If either expr or pat is NULL, the result\nis NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nNote: Because MySQL uses the C escape syntax in strings (for example,\n`\\n'' to represent the newline character), you must double any `\\'' that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n', 'mysql> SELECT ''Monty!'' REGEXP ''m%y%%'';\n        -> 0\nmysql> SELECT ''Monty!'' REGEXP ''.*'';\n        -> 1\nmysql> SELECT ''new*\\n*line'' REGEXP ''new\\\\*.\\\\*line'';\n        -> 1\nmysql> SELECT ''a'' REGEXP ''A'', ''a'' REGEXP BINARY ''A'';\n        -> 1  0\nmysql> SELECT ''a'' REGEXP ''^[a-d]'';\n        -> 1\n', 'string-comparison-functions'),
(23, 'IF STATEMENT', 35, 'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nIF implements a basic conditional construct. If the search_condition\nevaluates to true, the corresponding SQL statement list is executed. If\nno search_condition matches, the statement list in the ELSE clause is\nexecuted. Each statement_list consists of one or more statements.\n\nNote: There is also an IF() function, which differs from the IF\nstatement described here. See [control-flow-functions].\n', '', 'if-statement'),
(24, '^', 18, 'Syntax:\n^\n\nBitwise XOR:\n', 'mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n', 'bit-functions'),
(25, 'DROP VIEW', 36, 'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon''t exist. When this clause is given, a NOTE is generated for each\nnon-existent view. See [show-warnings].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n', '', 'drop-view'),
(26, 'DATE OPERATIONS', 28, 'Syntax:\nDATE_ADD(date,INTERVAL expr type), DATE_SUB(date,INTERVAL expr type)\n\nThese functions perform date arithmetic. date is a DATETIME or DATE\nvalue specifying the starting date. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a `-'' for negative intervals. type\nis a keyword indicating how the expression should be interpreted.\n', 'mysql> SELECT ''1997-12-31 23:59:59'' + INTERVAL 1 SECOND;\n        -> ''1998-01-01 00:00:00''\nmysql> SELECT INTERVAL 1 DAY + ''1997-12-31'';\n        -> ''1998-01-01''\nmysql> SELECT ''1998-01-01'' - INTERVAL 1 SECOND;\n        -> ''1997-12-31 23:59:59''\nmysql> SELECT DATE_ADD(''1997-12-31 23:59:59'',\n    ->                 INTERVAL 1 SECOND);\n        -> ''1998-01-01 00:00:00''\nmysql> SELECT DATE_ADD(''1997-12-31 23:59:59'',\n    ->                 INTERVAL 1 DAY);\n        -> ''1998-01-01 23:59:59''\nmysql> SELECT DATE_ADD(''1997-12-31 23:59:59'',\n    ->                 INTERVAL ''1:1'' MINUTE_SECOND);\n        -> ''1998-01-01 00:01:00''\nmysql> SELECT DATE_SUB(''1998-01-01 00:00:00'',\n    ->                 INTERVAL ''1 1:1:1'' DAY_SECOND);\n        -> ''1997-12-30 22:58:59''\nmysql> SELECT DATE_ADD(''1998-01-01 00:00:00'',\n    ->                 INTERVAL ''-1 10'' DAY_HOUR);\n        -> ''1997-12-30 14:00:00''\nmysql> SELECT DATE_SUB(''1998-01-02'', INTERVAL 31 DAY);\n        -> ''1997-12-02''\nmysql> SELECT DATE_ADD(''1992-12-31 23:59:59.000002'',\n    ->            INTERVAL ''1.999999'' SECOND_MICROSECOND);\n        -> ''1993-01-01 00:00:01.000001''\n', 'date-and-time-functions'),
(27, 'WITHIN', 26, 'Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(28, 'WEEK', 28, 'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() allows you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\n[server-system-variables].\n', 'mysql> SELECT WEEK(''1998-02-20'');\n        -> 7\nmysql> SELECT WEEK(''1998-02-20'',0);\n        -> 7\nmysql> SELECT WEEK(''1998-02-20'',1);\n        -> 8\nmysql> SELECT WEEK(''1998-12-31'',1);\n        -> 53\n', 'date-and-time-functions'),
(29, 'PREPARE', 25, 'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a statement and assigns it a name,\nstmt_name, by which to refer to the statement later. Statement names\nare not case sensitive. preparable_stmt is either a string literal or a\nuser variable that contains the text of the statement. The text must\nrepresent a single SQL statement, not multiple statements. Within the\nstatement, `?'' characters can be used as parameter markers to indicate\nwhere data values are to be bound to the query later when you execute\nit. The `?'' characters should not be enclosed within quotes, even if\nyou intend to bind them to string values. Parameter markers can be used\nonly where data values should appear, not for SQL keywords,\nidentifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nThe scope of a prepared statement is the client session within which it\nis created. Other clients cannot see it.\n', '', 'sqlps'),
(30, 'LOCK', 7, 'Syntax:\nLOCK TABLES\n    tbl_name [AS alias] {READ [LOCAL] | [LOW_PRIORITY] WRITE}\n    [, tbl_name [AS alias] {READ [LOCAL] | [LOW_PRIORITY] WRITE}] ...\nUNLOCK TABLES\n\nLOCK TABLES locks tables for the current thread. If any of the tables\nare locked by other threads, it blocks until all locks can be acquired.\nUNLOCK TABLES releases any locks held by the current thread. All tables\nthat are locked by the current thread are implicitly unlocked when the\nthread issues another LOCK TABLES, or when the connection to the server\nis closed.\n\nA table lock protects only against inappropriate reads or writes by\nother clients. The client holding the lock, even a read lock, can\nperform table-level operations such as DROP TABLE.\n', '', 'lock-tables'),
(31, 'RESET SLAVE', 25, 'Syntax:\nRESET SLAVE\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster''s binary logs. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay logs, and starts a new relay log.\n\nNote: All relay logs are deleted, even if they have not been completely\nexecuted by the slave SQL thread. (This is a condition likely to exist\non a replication slave if you have issued a STOP SLAVE statement or if\nthe slave is highly loaded.)\n\nConnection information stored in the master.info file is immediately\nreset using any values specified in the corresponding startup options.\nThis information includes values such as master host, master port,\nmaster user, and master password. If the slave SQL thread was in the\nmiddle of replicating temporary tables when it was stopped, and RESET\nSLAVE is issued, these replicated temporary tables are deleted on the\nslave.\n', '', 'reset-slave'),
(32, 'POLYGON', 22, 'Polygon(ls1,ls2,...)\n\nConstructs a WKB Polygon value from a number of WKB LineString\narguments. If any argument does not represent the WKB of a LinearRing\n(that is, not a closed and simple LineString) the return value is NULL.\n', '', 'gis-mysql-specific-functions'),
(33, 'MINUTE', 28, 'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n', 'mysql> SELECT MINUTE(''98-02-03 10:05:03'');\n        -> 5\n', 'date-and-time-functions'),
(34, 'DAY', 28, 'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n', '', 'date-and-time-functions'),
(35, 'MID', 33, 'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n', '', 'string-functions'),
(36, 'REPLACE INTO', 25, 'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See\n[insert].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. If you''re looking for a statement that follows the\nSQL standard, and that either inserts or updates, look for the INSERT\n... ON DUPLICATE KEY UPDATE statement; see [insert-on-duplicate].\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n', '', 'replace'),
(37, 'UUID', 13, 'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n"DCE 1.1: Remote Procedure Call" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a string of five hexadecimal\nnumbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n', 'mysql> SELECT UUID();\n        -> ''6ccd780c-baba-1026-9564-0040f4311e29''\n', 'miscellaneous-functions'),
(38, 'LINESTRING', 22, 'LineString(pt1,pt2,...)\n\nConstructs a WKB LineString value from a number of WKB Point arguments.\nIf any argument is not a WKB Point, the return value is NULL. If the\nnumber of Point arguments is less than two, the return value is NULL.\n', '', 'gis-mysql-specific-functions'),
(39, 'SLEEP', 13, 'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part given in microseconds. This\nfunction was added in MySQL 5.0.12.\n', '', 'miscellaneous-functions'),
(40, 'CONNECTION_ID', 15, 'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n', 'mysql> SELECT CONNECTION_ID();\n        -> 23786\n', 'information-functions'),
(41, 'DELETE', 25, 'Syntax:\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns the number of rows deleted. The WHERE clause, if\ngiven, specifies the conditions that identify which rows to delete.\nWith no WHERE clause, all rows are deleted. If the ORDER BY clause is\nspecified, the rows are deleted in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in [select].\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not want to know the number of\ndeleted rows, is to use TRUNCATE TABLE. See [truncate].\n', '', 'delete'),
(42, 'ROUND', 4, 'Syntax:\nROUND(X), ROUND(X,D)\n\nReturns the argument X, rounded to the nearest integer. With two\narguments, returns X rounded to D decimal places. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n', 'mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n', 'mathematical-functions'),
(43, 'NULLIF', 6, 'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n', 'mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n', 'control-flow-functions'),
(44, 'CLOSE', 35, 'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor.\n\nIf not closed explicitly, a cursor is closed at the end of the compound\nstatement in which it was declared.\n', '', 'close'),
(45, 'STOP SLAVE', 25, 'Syntax:\nSTOP SLAVE [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n', '', 'stop-slave'),
(46, 'TIMEDIFF', 28, 'Syntax:\nTIMEDIFF(expr,expr2)\n\nTIMEDIFF() returns the time between the start time expr and the end\ntime expr2. expr and expr2 are time or date-and-time expressions, but\nboth must be of the same type.\n', 'mysql> SELECT TIMEDIFF(''2000:01:01 00:00:00'',\n    ->                 ''2000:01:01 00:00:00.000001'');\n        -> ''-00:00:00.000001''\nmysql> SELECT TIMEDIFF(''1997-12-31 23:59:59.000001'',\n    ->                 ''1997-12-30 01:01:01.000002'');\n        -> ''46:58:57.999999''\n', 'date-and-time-functions'),
(47, 'LINEFROMTEXT', 3, 'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n', '', 'gis-wkt-functions'),
(48, 'SHOW MASTER STATUS', 25, 'Syntax:\nSHOW MASTER STATUS\n\nProvides status information about the binary log files of the master.\nExample:\n\nmysql > SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n', '', 'show-master-status'),
(49, 'ADDTIME', 28, 'Syntax:\nADDTIME(expr,expr2)\n\nADDTIME() adds expr2 to expr and returns the result. expr is a time or\ndatetime expression, and expr2 is a time expression.\n', 'mysql> SELECT ADDTIME(''1997-12-31 23:59:59.999999'',\n    ->                ''1 1:1:1.000002'');\n        -> ''1998-01-02 01:01:01.000001''\nmysql> SELECT ADDTIME(''01:00:00.999999'', ''02:00:00.999998'');\n        -> ''03:00:01.999997''\n', 'date-and-time-functions'),
(50, 'SPATIAL', 30, 'MySQL can create spatial indexes using syntax similar to that for\ncreating regular indexes, but extended with the SPATIAL keyword.\nCurrently, spatial columns that are indexed must be declared NOT NULL.\nThe following examples demonstrate how to create spatial indexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g));\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For other\nstorage engines that support spatial indexing, SPATIAL INDEX creates a\nB-tree index. A B-tree index on spatial values will be useful for\nexact-value lookups, but not for range scans.\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n', '', 'creating-spatial-indexes'),
(51, 'TIMESTAMPDIFF', 28, 'Syntax:\nTIMESTAMPDIFF(interval,datetime_expr1,datetime_expr2)\n\nReturns the integer difference between the date or datetime expressions\ndatetime_expr1 and datetime_expr2. The unit for the result is given by\nthe interval argument. The legal values for interval are the same as\nthose listed in the description of the TIMESTAMPADD() function.\n', 'mysql> SELECT TIMESTAMPDIFF(MONTH,''2003-02-01'',''2003-05-01'');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,''2002-05-01'',''2001-01-01'');\n        -> -1\n', 'date-and-time-functions'),
(52, 'UPPER', 33, 'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n', 'mysql> SELECT UPPER(''Hej'');\n        -> ''HEJ''\n', 'string-functions'),
(53, 'FROM_UNIXTIME', 28, 'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n''YYYY-MM-DD HH:MM:SS'' or YYYYMMDDHHMMSS format, depending on whether\nthe function is used in a string or numeric context. unix_timestamp is\nan internal timestamp value such as is produced by the UNIX_TIMESTAMP()\nfunction.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n', 'mysql> SELECT FROM_UNIXTIME(875996580);\n        -> ''1997-10-04 22:23:00''\nmysql> SELECT FROM_UNIXTIME(875996580) + 0;\n        -> 19971004222300\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      ''%Y %D %M %h:%i:%s %x'');\n        -> ''2003 6th August 06:22:58 2003''\n', 'date-and-time-functions'),
(54, 'MEDIUMBLOB', 20, 'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes.\n', '', 'string-type-overview'),
(55, 'IFNULL', 6, 'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n', 'mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,''yes'');\n        -> ''yes''\n', 'control-flow-functions'),
(56, 'SHOW ERRORS', 25, 'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nThis statement is similar to SHOW WARNINGS, except that instead of\ndisplaying errors, warnings, and notes, it displays only errors.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\n[select].\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n', '', 'show-errors'),
(57, 'LEAST', 17, 'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If any argument is a case-sensitive string, the arguments are\n  compared as case-sensitive strings.\n\no In all other cases, the arguments are compared as case-insensitive\n  strings.\n\nBefore MySQL 5.0.13, LEAST() returns NULL only if all arguments are\nNULL. As of 5.0.13, it returns NULL if any argument is NULL.\n', 'mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(''B'',''A'',''C'');\n        -> ''A''\n', 'comparison-operators'),
(58, '=', 17, '=\n\nEqual:\n', 'mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT ''0'' = 0;\n        -> 1\nmysql> SELECT ''0.0'' = 0;\n        -> 1\nmysql> SELECT ''0.01'' = 0;\n        -> 0\nmysql> SELECT ''.01'' = 0.01;\n        -> 1\n', 'comparison-operators'),
(59, 'REVERSE', 33, 'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n', 'mysql> SELECT REVERSE(''abc'');\n        -> ''cba''\n', 'string-functions'),
(60, 'ISNULL', 17, 'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n', 'mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n', 'comparison-operators'),
(61, 'BINARY', 20, 'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than non-binary character strings.\n', '', 'string-type-overview'),
(62, 'BLOB DATA TYPE', 20, 'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See [storage-requirements]. No lettercase\nconversion for TEXT or BLOB columns takes place during storage or\nretrieval.\n', '', 'blob'),
(63, 'BOUNDARY', 32, 'Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n', '', 'general-geometry-property-functions'),
(64, 'CREATE USER', 8, 'Syntax:\nCREATE USER user [IDENTIFIED BY [PASSWORD] ''password'']\n    [, user [IDENTIFIED BY [PASSWORD] ''password'']] ...\n\nThe CREATE USER statement was added in MySQL 5.0.2. This statement\ncreates new MySQL accounts. To use it, you must have the global CREATE\nUSER privilege or the INSERT privilege for the mysql database. For each\naccount, CREATE USER creates a new record in the mysql.user table that\nhas no privileges. An error occurs if the account already exists. Each\naccount is named using the same format as for the GRANT statement; for\nexample, ''jeffrey''@''localhost''. The user and host parts of the account\nname correspond to the User and Host column values of the user table\nrow for the account.\n\nThe account can be given a password with the optional IDENTIFIED BY\nclause. The user value and the password are given the same way as for\nthe GRANT statement. In particular, to specify the password in plain\ntext, omit the PASSWORD keyword. To specify the password as the hashed\nvalue as returned by the PASSWORD() function, include the PASSWORD\nkeyword. See [grant].\n', '', 'create-user'),
(65, 'POINT', 22, 'Point(x,y)\n\nConstructs a WKB Point using its coordinates.\n', '', 'gis-mysql-specific-functions'),
(66, 'CURRENT_USER', 15, 'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the username and hostname combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. As of MySQL 5.0.10, within a stored\nroutine that is defined with the SQL SECURITY DEFINER characteristic,\nCURRENT_USER() returns the creator of the routine. The return value is\na string in the utf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n', 'mysql> SELECT USER();\n        -> ''davida@localhost''\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user ''''@''localhost'' to\ndatabase ''mysql''\nmysql> SELECT CURRENT_USER();\n        -> ''@localhost''\n', 'information-functions'),
(67, 'LCASE', 33, 'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n', '', 'string-functions'),
(68, '<=', 17, 'Syntax:\n<=\n\nLess than or equal:\n', 'mysql> SELECT 0.1 <= 2;\n        -> 1\n', 'comparison-operators'),
(69, 'UPDATE', 25, 'Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] tbl_name\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in tbl_name with new values. The SET clause indicates\nwhich columns to modify and the values they should be given. The WHERE\nclause, if given, specifies the conditions that identify which rows to\nupdate. With no WHERE clause, all rows are updated. If the ORDER BY\nclause is specified, the rows are updated in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. In this case, ORDER BY\nand LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. It is specified as described in [select].\n\nThe UPDATE statement supports the following modifiers:\n\no If you use the LOW_PRIORITY keyword, execution of the UPDATE is\n  delayed until no other clients are reading from the table.\n\no If you use the IGNORE keyword, the update statement does not abort\n  even if errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closet valid values instead.\n', '', 'update'),
(70, 'CASE STATEMENT', 35, 'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored routines implements a complex conditional\nconstruct. If a search_condition evaluates to true, the corresponding\nSQL statement list is executed. If no search condition matches, the\nstatement list in the ELSE clause is executed. Each statement_list\nconsists of one or more statements.\n\nNote: The syntax of the CASE statement shown here for use inside stored\nroutines differs slightly from that of the SQL CASE expression\ndescribed in [control-flow-functions]. The CASE statement cannot have\nan ELSE NULL clause, and it is terminated with END CASE instead of END.\n', '', 'case-statement'),
(71, 'EXECUTE STATEMENT', 25, 'Syntax:\nEXECUTE stmt_name [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement, you execute it with an EXECUTE statement\nthat refers to the prepared statement name. If the prepared statement\ncontains any parameter markers, you must supply a USING clause that\nlists user variables containing the values to be bound to the\nparameters. Parameter values can be supplied only by user variables,\nand the USING clause must name exactly as many variables as the number\nof parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n', '', 'sqlps'),
(72, 'DROP INDEX', 36, 'Syntax:\nDROP INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [alter-table].\n', '', 'drop-index'),
(73, 'MATCH AGAINST', 33, 'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nsearch_modifier: { IN BOOLEAN MODE | WITH QUERY EXPANSION }\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables, and can be\n  created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large datasets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a literal string, not a variable or a column name. There\nare three types of full-text searches:\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as "some" or\n  "then" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see [fulltext-boolean].\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies. In addition, words that are\n  present in more than 50% of the rows are considered common and do not\n  match. Full-text searches are natural language searches if no\n  modifier is given.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The WITH QUERY\n  EXPANSION modifier specifies a query expansion search. For more\n  information, see [fulltext-query-expansion].\n', 'mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (''Security implications of running MySQL as root'') AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (''Security implications of running MySQL as root'');\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n', 'fulltext-search'),
(74, 'ABS', 4, 'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n', 'mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n', 'mathematical-functions'),
(75, 'POLYFROMWKB', 29, 'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n', '', 'gis-wkb-functions'),
(76, 'NOT LIKE', 33, 'Syntax:\nexpr NOT LIKE pat [ESCAPE ''escape_char'']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE ''escape_char'']).\n', '', 'string-comparison-functions'),
(77, 'SPACE', 33, 'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n', 'mysql> SELECT SPACE(6);\n        -> ''      ''\n', 'string-functions'),
(78, 'MBR DEFINITION', 5, 'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n', '((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n', 'gis-class-geometry'),
(79, 'GEOMETRYCOLLECTION', 22, 'GeometryCollection(g1,g2,...)\n\nConstructs a WKB GeometryCollection. If any argument is not a\nwell-formed WKB representation of a geometry, the return value is NULL.\n', '', 'gis-mysql-specific-functions'),
(80, '*', 4, 'Syntax:\n*\n\nMultiplication:\n', 'mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> 0\n', 'arithmetic-functions');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(81, 'TIMESTAMP', 20, 'TIMESTAMP[(M)]\n\nA timestamp. The range is ''1970-01-01 00:00:00'' to partway through the\nyear 2037.\n\nA TIMESTAMP column is useful for recording the date and time of an\nINSERT or UPDATE operation. By default, the first TIMESTAMP column in a\ntable is automatically set to the date and time of the most recent\noperation if you do not assign it a value yourself. You can also set\nany TIMESTAMP column to the current date and time by assigning it a\nNULL value. Variations on automatic initialization and update\nproperties are described in [timestamp-4-1].\n\nA TIMESTAMP value is returned as a string in the format ''YYYY-MM-DD\nHH:MM:SS'' whose display width is fixed at 19 characters. To obtain the\nvalue as a number, you should add +0 to the timestamp column.\n\nNote: The TIMESTAMP format that was used prior to MySQL 4.1 is not\nsupported in MySQL 5.0; see MySQL 3.23, 4.0, 4.1 Reference Manual for\ninformation regarding the old format.\n', '', 'date-and-time-type-overview'),
(82, 'DES_DECRYPT', 10, 'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nNote that this function works only if MySQL has been configured with\nSSL support. See [secure-connections].\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n', '', 'encryption-functions'),
(83, 'ENDPOINT', 11, 'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n', 'mysql> SET @ls = ''LineString(1 1,2 2,3 3)'';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n', 'linestring-property-functions'),
(84, 'CACHE INDEX', 25, 'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n', '', 'cache-index'),
(85, 'COMPRESS', 10, 'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n', 'mysql> SELECT LENGTH(COMPRESS(REPEAT(''a'',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(''''));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(''a''));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(''a'',16)));\n        -> 15\n', 'encryption-functions'),
(86, 'INSERT', 25, 'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [insert-select].\n', '', 'insert'),
(87, 'COUNT', 14, 'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values in the rows retrieved\nby a SELECT statement.\n\nCOUNT() returns 0 if there were no matching rows.\n', 'mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n', 'group-by-functions'),
(88, 'HANDLER', 25, 'Syntax:\nHANDLER tbl_name OPEN [ AS alias ]\nHANDLER tbl_name READ index_name { = | >= | <= | < } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for MyISAM and InnoDB tables.\n', '', 'handler'),
(89, 'MLINEFROMTEXT', 3, 'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n', '', 'gis-wkt-functions'),
(90, 'GEOMCOLLFROMWKB', 29, 'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n', '', 'gis-wkb-functions'),
(91, 'RENAME TABLE', 36, 'Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nthread can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n', 'CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n', 'rename-table'),
(92, 'BOOLEAN', 20, 'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Non-zero values are considered true.\n\nIn the future, full boolean type handling will be introduced in\naccordance with standard SQL.\n', '', 'numeric-type-overview'),
(93, 'DEFAULT', 13, 'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. Starting with MySQL\n5.0.2, an error results if the column has no default value.\n', 'mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n', 'miscellaneous-functions'),
(94, 'TINYTEXT', 20, 'TINYTEXT\n\nA TEXT column with a maximum length of 255 (28 - 1) characters.\n', '', 'string-type-overview'),
(95, 'OPTIMIZE TABLE', 19, 'Syntax:\nOPTIMIZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length\nrows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).\nDeleted rows are maintained in a linked list and subsequent INSERT\noperations reuse old row positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file.\n', '', 'optimize-table'),
(96, 'DECODE', 10, 'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n', '', 'encryption-functions'),
(97, '<=>', 17, 'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n', 'mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n', 'comparison-operators'),
(98, 'LOAD DATA FROM MASTER', 25, 'Syntax:\nLOAD DATA FROM MASTER\n\nThis statement takes a snapshot of the master and copies it to the\nslave. It updates the values of MASTER_LOG_FILE and MASTER_LOG_POS so\nthat the slave starts replicating from the correct position. Any table\nand database exclusion rules specified with the --replicate-*-do-* and\n--replicate-*-ignore-* options are honored. --replicate-rewrite-db is\nnot taken into account because a user could use this option to set up a\nnon-unique mapping such as --replicate-rewrite-db="db1->db3" and\n--replicate-rewrite-db="db2->db3", which would confuse the slave when\nloading tables from the master.\n\nUse of this statement is subject to the following conditions:\n\no It works only for MyISAM tables. Attempting to load a non-MyISAM\n  table results in the following error:\n\nERROR 1189 (08S01): Net error reading from master\n\no It acquires a global read lock on the master while taking the\n  snapshot, which prevents updates on the master during the load\n  operation.\n\nIf you are loading large tables, you might have to increase the values\nof net_read_timeout and net_write_timeout on both the master and slave\nservers. See [server-system-variables].\n\nNote that LOAD DATA FROM MASTER does not copy any tables from the mysql\ndatabase. This makes it easy to have different users and privileges on\nthe master and the slave.\n\nTo use LOAD DATA FROM MASTER, the replication account that is used to\nconnect to the master must have the RELOAD and SUPER privileges on the\nmaster and the SELECT privilege for all master tables you want to load.\nAll master tables for which the user does not have the SELECT privilege\nare ignored by LOAD DATA FROM MASTER. This is because the master hides\nthem from the user: LOAD DATA FROM MASTER calls SHOW DATABASES to know\nthe master databases to load, but SHOW DATABASES returns only databases\nfor which the user has some privilege. See [show-databases]. On the\nslave side, the user that issues LOAD DATA FROM MASTER must have\nprivileges for dropping and creating the databases and tables that are\ncopied.\n', '', 'load-data-from-master'),
(99, 'RESET', 25, 'Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [flush].\n', '', 'reset'),
(100, 'GET_LOCK', 13, 'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally).\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This allows clients that agree on\na given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also allows a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n', 'mysql> SELECT GET_LOCK(''lock1'',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(''lock2'');\n        -> 1\nmysql> SELECT GET_LOCK(''lock2'',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(''lock2'');\n        -> 1\nmysql> SELECT RELEASE_LOCK(''lock1'');\n        -> NULL\n', 'miscellaneous-functions'),
(101, 'UCASE', 33, 'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n', '', 'string-functions'),
(102, 'SHOW BINLOG EVENTS', 25, 'Syntax:\nSHOW BINLOG EVENTS\n   [IN ''log_name''] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify ''log_name'',\nthe first binary log is displayed.\n', '', 'show-binlog-events'),
(103, 'MPOLYFROMWKB', 29, 'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n', '', 'gis-wkb-functions'),
(104, 'ITERATE', 35, 'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means "do the loop again."\n', 'CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND\n', 'iterate-statement'),
(105, 'DO', 25, 'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\nHowever, DO does not report any errors. Instead, it reports errors as\nwarnings.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n', '', 'do'),
(106, 'CURTIME', 28, 'Syntax:\nCURTIME()\n\nReturns the current time as a value in ''HH:MM:SS'' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext.\n', 'mysql> SELECT CURTIME();\n        -> ''23:50:26''\nmysql> SELECT CURTIME() + 0;\n        -> 235026\n', 'date-and-time-functions'),
(107, 'CHAR_LENGTH', 33, 'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five two-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n', '', 'string-functions'),
(108, 'BIGINT', 20, 'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n', '', 'numeric-type-overview'),
(109, 'SET', 25, 'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client. Older versions of\nMySQL employed SET OPTION, but this syntax is deprecated in favor of\nSET without OPTION.\n', '', 'set-option'),
(110, 'DATE', 20, 'DATE\n\nA date. The supported range is ''1000-01-01'' to ''9999-12-31''. MySQL\ndisplays DATE values in ''YYYY-MM-DD'' format, but allows you to assign\nvalues to DATE columns using either strings or numbers.\n', '', 'date-and-time-type-overview'),
(111, 'CONV', 33, 'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n', 'mysql> SELECT CONV(''a'',16,2);\n        -> ''1010''\nmysql> SELECT CONV(''6E'',18,8);\n        -> ''172''\nmysql> SELECT CONV(-17,10,-18);\n        -> ''-H''\nmysql> SELECT CONV(10+''10''+''10''+0xa,10,10);\n        -> ''40''\n', 'string-functions'),
(112, 'SHOW OPEN TABLES', 25, 'Syntax:\nSHOW OPEN TABLES [FROM db_name] [LIKE ''pattern'']\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See [table-cache].\n', '', 'show-open-tables'),
(113, 'EXTRACT', 28, 'Syntax:\nEXTRACT(type FROM date)\n\nThe EXTRACT() function uses the same kinds of interval type specifiers\nas DATE_ADD() or DATE_SUB(), but extracts parts from the date rather\nthan performing date arithmetic.\n', 'mysql> SELECT EXTRACT(YEAR FROM ''1999-07-02'');\n       -> 1999\nmysql> SELECT EXTRACT(YEAR_MONTH FROM ''1999-07-02 01:02:03'');\n       -> 199907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM ''1999-07-02 01:02:03'');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM ''2003-01-02 10:30:00.00123'');\n        -> 123\n', 'date-and-time-functions'),
(114, 'ENCRYPT', 10, 'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument should be a string with at least two\ncharacters. If no salt argument is given, a random value is used.\n', 'mysql> SELECT ENCRYPT(''hello'');\n        -> ''VxuFAJXVARROc''\n', 'encryption-functions'),
(115, 'SHOW STATUS', 25, 'Syntax:\nSHOW [GLOBAL | SESSION] STATUS [LIKE ''pattern'']\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command.\nWith a LIKE clause, the statement displays only those variables that\nmatch the pattern:\n\nmysql> SHOW STATUS LIKE ''Key%'';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nThe GLOBAL and SESSION options are new in MySQL 5.0.2. With the GLOBAL\nmodifier, SHOW STATUS displays the status values for all connections to\nMySQL. With SESSION, it displays the status values for the current\nconnection. If no modifier is present, the default is SESSION. LOCAL is\na synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION.\n', '', 'show-status'),
(116, 'OLD_PASSWORD', 10, 'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added to MySQL when the implementation of PASSWORD()\nwas changed to improve security. OLD_PASSWORD() returns the value of\nthe old (pre-4.1) implementation of PASSWORD() as a binary string, and\nis intended to permit you to reset passwords for any pre-4.1 clients\nthat need to connect to your version 5.0 MySQL server without locking\nthem out. See [password-hashing].\n', '', 'encryption-functions'),
(117, 'SET VARIABLE', 35, 'Syntax:\nSET var_name = expr [, var_name = expr] ...\n\nThe SET statement in stored routines is an extended version of the\ngeneral SET statement. Referenced variables may be ones declared inside\na routine, or global system variables.\n\nThe SET statement in stored routines is implemented as part of the\npre-existing SET syntax. This allows an extended syntax of SET a=x,\nb=y, ... where different variable types (locally declared variables and\nglobal and session server variables) can be mixed. This also allows\ncombinations of local variables and some options that make sense only\nfor system variables; in that case, the options are recognized but\nignored.\n', '', 'set-statement'),
(118, 'FORMAT', 33, 'Syntax:\nFORMAT(X,D)\n\nFormats the number X to a format like ''#,###,###.##'', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n', 'mysql> SELECT FORMAT(12332.123456, 4);\n        -> ''12,332.1235''\nmysql> SELECT FORMAT(12332.1,4);\n        -> ''12,332.1000''\nmysql> SELECT FORMAT(12332.2,0);\n        -> ''12,332''\n', 'string-functions'),
(119, '||', 12, 'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is non-zero, and 0 otherwise. With a NULL operand, the result\nis 1 if the other operand is non-zero, and NULL otherwise. If both\noperands are NULL, the result is NULL.\n', 'mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1\n', 'logical-operators'),
(120, 'BIT_LENGTH', 33, 'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n', 'mysql> SELECT BIT_LENGTH(''text'');\n        -> 32\n', 'string-functions'),
(121, 'EXTERIORRING', 2, 'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n', 'mysql> SET @poly =\n    -> ''Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))'';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n', 'polygon-property-functions'),
(122, 'GEOMFROMWKB', 29, 'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n', '', 'gis-wkb-functions'),
(123, 'SHOW SLAVE HOSTS', 25, 'Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster. Any slave not started with the --report-host=slave_name option\nis not visible in this list.\n', '', 'show-slave-hosts'),
(124, 'START TRANSACTION', 7, 'Syntax:\nSTART TRANSACTION | BEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET AUTOCOMMIT = {0 | 1}\n\nThe START TRANSACTION and BEGIN statement begin a new transaction.\nCOMMIT commits the current transaction, making its changes permanent.\nROLLBACK rolls back the current transaction, canceling its changes. The\nSET AUTOCOMMIT statement disables or enables the default autocommit\nmode for the current connection.\n\nBeginning with MySQL 5.0.3, the optional WORK keyword is supported for\nCOMMIT and RELEASE, as are the CHAIN and RELEASE clauses. CHAIN and\nRELEASE can be used for additional control over transaction completion.\nThe value of the completion_type system variable determines the default\ncompletion behavior. See [server-system-variables].\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client connection after terminating\nthe current transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk.\n\nIf you are using a transaction-safe storage engine (like InnoDB, BDB or\nNDB Cluster), you can disable autocommit mode with the following\nstatement:\n\nSET AUTOCOMMIT=0;\n\nAfter disabling autocommit mode by setting the AUTOCOMMIT variable to\nzero, you must use COMMIT to store your changes to disk or ROLLBACK if\nyou want to ignore the changes you have made since the beginning of\nyour transaction.\n\nTo disable autocommit mode for a single series of statements, use the\nSTART TRANSACTION statement:\n', 'START TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n', 'commit'),
(125, 'BETWEEN AND', 17, 'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in [type-conversion], but applied to all the\nthree arguments.\n', 'mysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT ''b'' BETWEEN ''a'' AND ''c'';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND ''3'';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND ''x-3'';\n        -> 0\n', 'comparison-operators'),
(126, 'MULTIPOLYGON', 22, 'MultiPolygon(poly1,poly2,...)\n\nConstructs a WKB MultiPolygon value from a set of WKB Polygon\narguments. If any argument is not a WKB Polygon, the return value is\nNULL.\n', '', 'gis-mysql-specific-functions'),
(127, 'TIME_FORMAT', 28, 'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, and seconds. Other\nspecifiers produce a NULL value or 0.\n', 'mysql> SELECT TIME_FORMAT(''100:00:00'', ''%H %k %h %I %l'');\n        -> ''100 100 04 04 4''\n', 'date-and-time-functions'),
(128, 'LEFT', 33, 'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str.\n', 'mysql> SELECT LEFT(''foobarbar'', 5);\n        -> ''fooba''\n', 'string-functions'),
(129, 'FLUSH QUERY CACHE', 24, 'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n', '', 'query-cache-status-and-maintenance'),
(130, 'SET DATA TYPE', 20, 'SET(''value1'',''value2'',...)\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values ''value1'', ''value2'', ... A SET\ncolumn can have a maximum of 64 members. SET values are represented\ninternally as integers.\n', '', 'string-type-overview'),
(131, 'RAND', 4, 'Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v between 0 and 1 inclusive (that\nis, in the range 0 <= v <= 1.0). If an integer argument N is specified,\nit is used as the seed value, which produces a repeatable sequence.\n', 'mysql> SELECT RAND();\n        -> 0.9233482386203\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND();\n        -> 0.63553050033332\nmysql> SELECT RAND();\n        -> 0.70100469486881\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\n', 'mathematical-functions'),
(132, 'RPAD', 33, 'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n', 'mysql> SELECT RPAD(''hi'',5,''?'');\n        -> ''hi???''\nmysql> SELECT RPAD(''hi'',1,''?'');\n        -> ''h''\n', 'string-functions'),
(133, 'CREATE DATABASE', 36, 'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification [, create_specification] ...]\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name\n\nCREATE DATABASE creates a database with the given name. To use CREATE\nDATABASE, you need the CREATE privilege on the database. CREATE SCHEMA\nis a synonym for CREATE DATABASE as of MySQL 5.0.2.\n', '', 'create-database'),
(134, 'DEC', 20, 'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n', '', 'numeric-type-overview'),
(135, 'VAR_POP', 14, 'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. This function was added in MySQL 5.0.3. Before 5.0.3,\nyou can use VARIANCE(), which is equivalent but is not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n', '', 'group-by-functions'),
(136, 'ELT', 33, 'Syntax:\nELT(N,str1,str2,str3,...)\n\nReturns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is\nless than 1 or greater than the number of arguments. ELT() is the\ncomplement of FIELD().\n', 'mysql> SELECT ELT(1, ''ej'', ''Heja'', ''hej'', ''foo'');\n        -> ''ej''\nmysql> SELECT ELT(4, ''ej'', ''Heja'', ''hej'', ''foo'');\n        -> ''foo''\n', 'string-functions'),
(137, 'ALTER VIEW', 36, 'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of an existing view. The syntax\nis similar to that for CREATE VIEW. See [create-view]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement.\n', '', 'alter-view'),
(138, 'SHOW DATABASES', 25, 'Syntax:\nSHOW {DATABASES | SCHEMAS} [LIKE ''pattern'']\n\nSHOW DATABASES lists the databases on the MySQL server host. You see\nonly those databases for which you have some kind of privilege, unless\nyou have the global SHOW DATABASES privilege. You can also get this\nlist using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nSHOW SCHEMAS can be used as of MySQL 5.0.2\n', '', 'show-databases'),
(139, '~', 18, 'Syntax:\n~\n\nInvert all bits.\n', 'mysql> SELECT 5 & ~1;\n        -> 4\n', 'bit-functions'),
(140, 'TEXT', 20, 'TEXT[(M)]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n', '', 'string-type-overview'),
(141, 'CONCAT_WS', 33, 'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n', 'mysql> SELECT CONCAT_WS('','',''First name'',''Second name'',''Last Name'');\n        -> ''First name,Second name,Last Name''\nmysql> SELECT CONCAT_WS('','',''First name'',NULL,''Last Name'');\n        -> ''First name,Last Name''\n', 'string-functions'),
(142, 'ROW_COUNT', 15, 'Syntax:\nROW_COUNT()\n\nROW_COUNT() returns the number of rows updated, inserted, or deleted by\nthe preceding statement. This is the same as the row count that the\nmysql client displays and the value from the mysql_affected_rows() C\nAPI function.\n', 'mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n', 'information-functions'),
(143, 'ASIN', 4, 'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n', 'mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(''foo'');\n\n+-------------+\n| ASIN(''foo'') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: ''foo'' |\n+---------+------+-----------------------------------------+\n', 'mathematical-functions'),
(144, 'SHOW LOGS', 25, 'Syntax:\nSHOW [BDB] LOGS\n\nIn MySQL 5.0, this is a deprecated synonym for SHOW ENGINE BDB LOGS.\nSee [show-engine].\n', '', 'show-logs'),
(145, 'SIGN', 4, 'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n', 'mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n', 'mathematical-functions'),
(146, 'SEC_TO_TIME', 28, 'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a value in ''HH:MM:SS'' or HHMMSS format, depending on whether the\nfunction is used in a string or numeric context.\n', 'mysql> SELECT SEC_TO_TIME(2378);\n        -> ''00:39:38''\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n', 'date-and-time-functions'),
(147, 'FLOAT', 20, 'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Allowable values are\n-3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of decimal digits and D is the number of digits\nfollowing the decimal point. If M and D are omitted, values are stored\nto the limits allowed by the hardware. A single-precision\nfloating-point number is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\n[no-matching-rows].\n', '', 'numeric-type-overview'),
(148, 'LOCATE', 33, 'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n', 'mysql> SELECT LOCATE(''bar'', ''foobarbar'');\n        -> 4\nmysql> SELECT LOCATE(''xbar'', ''foobar'');\n        -> 0\nmysql> SELECT LOCATE(''bar'', ''foobarbar'', 5);\n        -> 7\n', 'string-functions'),
(149, 'CHARSET', 15, 'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n', 'mysql> SELECT CHARSET(''abc'');\n        -> ''latin1''\nmysql> SELECT CHARSET(CONVERT(''abc'' USING utf8));\n        -> ''utf8''\nmysql> SELECT CHARSET(USER());\n        -> ''utf8''\n', 'information-functions'),
(150, 'SUBDATE', 28, 'Syntax:\nSUBDATE(date,INTERVAL expr type), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(''1998-01-02'', INTERVAL 31 DAY);\n        -> ''1997-12-02''\nmysql> SELECT SUBDATE(''1998-01-02'', INTERVAL 31 DAY);\n        -> ''1997-12-02''\n\nThe second form allows the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(''1998-01-02 12:00:00'', 31);\n        -> ''1997-12-02 12:00:00''\n\nNote: You cannot use format "%X%V" to convert a year-week string to a\ndate because the combination of a year and week does not uniquely\nidentify a year and month if the week crosses a month boundary. To\nconvert a year-week to a date, then you should also specify the\nweekday:\n\nmysql> SELECT STR_TO_DATE(''200442 Monday'', ''%X%V %W'');\n        -> ''2004-10-18''\n', '', 'date-and-time-functions'),
(151, 'DAYOFYEAR', 28, 'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n', 'mysql> SELECT DAYOFYEAR(''1998-02-03'');\n        -> 34\n', 'date-and-time-functions'),
(152, '%', 4, 'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n', 'mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n', 'mathematical-functions'),
(153, 'LONGTEXT', 20, 'LONGTEXT\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The maximum effective (permitted) length of LONGTEXT\ncolumns depends on the configured maximum packet size in the\nclient/server protocol and available memory.\n', '', 'string-type-overview'),
(154, 'DISJOINT', 26, 'Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(155, 'KILL', 25, 'Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nIn MySQL 5.0.0, KILL allows the optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\nNote: You cannot use KILL with the Embedded MySQL Server library,\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n', '', 'kill'),
(156, 'ASTEXT', 3, 'AsText(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n', 'mysql> SET @g = ''LineString(1 1,2 2,3 3)'';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n', 'functions-to-convert-geometries-between-formats'),
(157, 'LPAD', 33, 'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n', 'mysql> SELECT LPAD(''hi'',4,''??'');\n        -> ''??hi''\nmysql> SELECT LPAD(''hi'',1,''??'');\n        -> ''h''\n', 'string-functions'),
(158, 'RESTORE TABLE', 19, 'Syntax:\nRESTORE TABLE tbl_name [, tbl_name] ... FROM ''/path/to/backup/directory''\n\nRESTORE TABLE restores the table or tables from a backup that was made\nwith BACKUP TABLE. Existing tables are not overwritten; if you try to\nrestore over an existing table, an error occurs. Just as for BACKUP\nTABLE, RESTORE TABLE currently works only for MyISAM tables. The\ndirectory should be specified as a full pathname.\n\nThe backup for each table consists of its .frm format file and .MYD\ndata file. The restore operation restores those files, and then uses\nthem to rebuild the .MYI index file. Restoring takes longer than\nbacking up due to the need to rebuild the indexes. The more indexes the\ntable has, the longer it takes.\n', '', 'restore-table'),
(159, 'DECLARE CONDITION', 35, 'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | mysql_error_code\n\nThis statement specifies conditions that need specific handling. It\nassociates a name with a specified error condition. The name can\nsubsequently be used in a DECLARE HANDLER statement. See\n[declare-handlers].\n\nA condition_value can be an SQLSTATE value or a MySQL error code.\n', '', 'declare-conditions'),
(160, 'OVERLAPS', 26, 'Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(161, 'NUMGEOMETRIES', 23, 'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n', 'mysql> SET @gc = ''GeometryCollection(Point(1 1),LineString(2 2, 3 3))'';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n', 'geometrycollection-property-functions'),
(162, 'SET GLOBAL SQL_SLAVE_SKIP_COUNTER', 25, 'Syntax:\nSET GLOBAL SQL_SLAVE_SKIP_COUNTER = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave thread is not running.\nOtherwise, it produces an error.\n', '', 'set-global-sql-slave-skip-counter'),
(163, 'MONTHNAME', 28, 'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date.\n', 'mysql> SELECT MONTHNAME(''1998-02-05'');\n        -> ''February''\n', 'date-and-time-functions'),
(164, 'MBREQUAL', 5, 'MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n', '', 'relations-on-geometry-mbr'),
(165, 'CHANGE MASTER TO', 25, 'Syntax:\nCHANGE MASTER TO master_def [, master_def] ...\n\nmaster_def:\n    MASTER_HOST = ''host_name''\n  | MASTER_USER = ''user_name''\n  | MASTER_PASSWORD = ''password''\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = count\n  | MASTER_LOG_FILE = ''master_log_name''\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = ''relay_log_name''\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = ''ca_file_name''\n  | MASTER_SSL_CAPATH = ''ca_directory_name''\n  | MASTER_SSL_CERT = ''cert_file_name''\n  | MASTER_SSL_KEY = ''key_file_name''\n  | MASTER_SSL_CIPHER = ''cipher_list''\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to and communicating with the master server. It also updates\nthe contents of the master.info and relay-log.info files.\n\nMASTER_USER, MASTER_PASSWORD, MASTER_SSL, MASTER_SSL_CA,\nMASTER_SSL_CAPATH, MASTER_SSL_CERT, MASTER_SSL_KEY, and\nMASTER_SSL_CIPHER provide information to the slave about how to connect\nto its master.\n\nThe SSL options (MASTER_SSL, MASTER_SSL_CA, MASTER_SSL_CAPATH,\nMASTER_SSL_CERT, MASTER_SSL_KEY, and MASTER_SSL_CIPHER) can be changed\neven on slaves that are compiled without SSL support. They are saved to\nthe master.info file, but are ignored until you use a server that has\nSSL support enabled.\n\nIf you don''t specify a given parameter, it keeps its old value, except\nas indicated in the following discussion. For example, if the password\nto connect to your MySQL master has changed, you just need to issue\nthese statements to tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=''new3cret'';\nSTART SLAVE; -- if you want to restart replication\n\nThere is no need to specify the parameters that do not change (host,\nport, user, and so forth).\n\nMASTER_HOST and MASTER_PORT are the hostname (or IP address) of the\nmaster host and its TCP/IP port. Note that if MASTER_HOST is equal to\nlocalhost, then, like in other parts of MySQL, the port number might be\nignored (if Unix socket files can be used, for example).\n\nIf you specify MASTER_HOST or MASTER_PORT, the slave assumes that the\nmaster server is different from before (even if you specify a host or\nport value that is the same as the current value.) In this case, the\nold values for the master binary log name and position are considered\nno longer applicable, so if you do not specify MASTER_LOG_FILE and\nMASTER_LOG_POS in the statement, MASTER_LOG_FILE='''' and\nMASTER_LOG_POS=4 are silently appended to it.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. If you specify either of them, you cannot specify\nRELAY_LOG_FILE or RELAY_LOG_POS. If neither of MASTER_LOG_FILE or\nMASTER_LOG_POS are specified, the slave uses the last coordinates of\nthe slave SQL thread before CHANGE MASTER was issued. This ensures that\nthere is no discontinuity in replication, even if the slave SQL thread\nwas late compared to the slave I/O thread, when you merely want to\nchange, say, the password to use.\n\nCHANGE MASTER deletes all relay log files and starts a new one, unless\nyou specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay logs\nare kept; the relay_log_purge global variable is set silently to 0.\n\nCHANGE MASTER is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the log and the offset\ncorresponding to it. After loading the snapshot into the slave, you can\nrun CHANGE MASTER TO MASTER_LOG_FILE=''log_name_on_master'',\nMASTER_LOG_POS=log_offset_on_master on the slave.\n\nThe following example changes the master and master''s binary log\ncoordinates. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=''master2.mycompany.com'',\n  MASTER_USER=''replication'',\n  MASTER_PASSWORD=''bigs3cret'',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=''master2-bin.001'',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay logs that you want it to execute\nagain for some reason. To do this, the master need not be reachable.\nYou need only use CHANGE MASTER TO and start the SQL thread (START\nSLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=''slave-relay-bin.006'',\n  RELAY_LOG_POS=4025;\n', '', 'change-master-to'),
(166, 'DROP DATABASE', 36, 'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE as of MySQL 5.0.2.\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n', '', 'drop-database'),
(167, 'TIMESTAMP FUNCTION', 28, 'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr and\nreturns the result as a datetime value.\n', 'mysql> SELECT TIMESTAMP(''2003-12-31'');\n        -> ''2003-12-31 00:00:00''\nmysql> SELECT TIMESTAMP(''2003-12-31 12:00:00'',''12:00:00'');\n        -> ''2004-01-01 00:00:00''\n', 'date-and-time-functions'),
(168, 'CHARACTER_LENGTH', 33, 'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n', '', 'string-functions'),
(169, 'SHOW GRANTS', 25, 'Syntax:\nSHOW GRANTS FOR user\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, ''jeffrey''@''localhost''. The user and host parts\nof the account name correspond to the User and Host column values of\nthe user table row for the account.\n\nmysql> SHOW GRANTS FOR ''root''@''localhost'';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO ''root''@''localhost'' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n', '', 'show-grants'),
(170, 'SHOW PRIVILEGES', 25, 'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n', '', 'show-privileges');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(171, 'INSERT FUNCTION', 33, 'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos is len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n', 'mysql> SELECT INSERT(''Quadratic'', 3, 4, ''What'');\n        -> ''QuWhattic''\nmysql> SELECT INSERT(''Quadratic'', -1, 4, ''What'');\n        -> ''Quadratic''\nmysql> SELECT INSERT(''Quadratic'', 3, 100, ''What'');\n        -> ''QuWhat''\n', 'string-functions'),
(172, 'CRC32', 4, 'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n', 'mysql> SELECT CRC32(''MySQL'');\n        -> 3259397556\nmysql> SELECT CRC32(''mysql'');\n        -> 2501908538\n', 'mathematical-functions'),
(173, 'XOR', 12, 'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is non-zero,\notherwise 0 is returned.\n', 'mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n', 'logical-operators'),
(174, 'STARTPOINT', 11, 'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n', 'mysql> SET @ls = ''LineString(1 1,2 2,3 3)'';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n', 'linestring-property-functions'),
(175, 'DECLARE VARIABLE', 35, 'Syntax:\nDECLARE var_name[,...] type [DEFAULT value]\n\nThis statement is used to declare local variables. To provide a default\nvalue for the variable, include a DEFAULT clause. The value can be\nspecified as an expression; it need not be a constant. If the DEFAULT\nclause is missing, the initial value is NULL.\n\nLocal variables are treated like routine parameters with respect to\ndata type and overflow checking. See [create-procedure].\n\nThe scope of a local variable is within the BEGIN ... END block where\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n', '', 'declare-local-variables'),
(176, 'MPOLYFROMTEXT', 3, 'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n', '', 'gis-wkt-functions'),
(177, 'GRANT', 8, 'Syntax:\nGRANT priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON [object_type] {tbl_name | * | *.* | db_name.*}\n    TO user [IDENTIFIED BY [PASSWORD] ''password'']\n        [, user [IDENTIFIED BY [PASSWORD] ''password'']] ...\n    [REQUIRE\n        NONE |\n        [{SSL| X509}]\n        [CIPHER ''cipher'' [AND]]\n        [ISSUER ''issuer'' [AND]]\n        [SUBJECT ''subject'']]\n    [WITH with_option [with_option] ...]\n\nobject_type =\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\nwith_option =\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement enables system administrators to create MySQL user\naccounts and to grant rights to from accounts. To use GRANT, you must\nhave the GRANT OPTION privilege, and you must have the privileges that\nyou are granting. The REVOKE statement is related and enables\nadministrators to remove account privileges. See [revoke].\n\nMySQL account information is stored in the tables of the mysql\ndatabase. This database and the access control system are discussed\nextensively in [database-administration], which you should consult for\nadditional details.\n\nImportant: Some releases of MySQL introduce changes to the structure of\nthe grant tables to add new privileges or features. Whenever you update\nto a new version of MySQL, you should update your grant tables to make\nsure that they have the current structure so that you can take\nadvantage of any new capabilities. See [mysql-upgrade].\n\nIf the grant tables hold privilege rows that contain mixed-case\ndatabase or table names and the lower_case_table_names system variable\nis set to a non-zero value, REVOKE cannot be used to revoke these\nprivileges. It will be necessary to manipulate the grant tables\ndirectly. (GRANT will not create such rows when lower_case_table_names\nis set, but such rows might have been created prior to setting the\nvariable.)\n\nPrivileges can be granted at several levels:\n\no Global level\n\n  Global privileges apply to all databases on a given server. These\n  privileges are stored in the mysql.user table. GRANT ALL ON *.* and\n  REVOKE ALL ON *.* grant and revoke only global privileges.\n\no Database level\n\n  Database privileges apply to all objects in a given database. These\n  privileges are stored in the mysql.db and mysql.host tables. GRANT\n  ALL ON db_name.* and REVOKE ALL ON db_name.* grant and revoke only\n  database privileges.\n\no Table level\n\n  Table privileges apply to all columns in a given table. These\n  privileges are stored in the mysql.tables_priv table. GRANT ALL ON\n  db_name.tbl_name and REVOKE ALL ON db_name.tbl_name grant and revoke\n  only table privileges.\n\no Column level\n\n  Column privileges apply to single columns in a given table. These\n  privileges are stored in the mysql.columns_priv table. When using\n  REVOKE, you must specify the same columns that were granted.\n\no Routine level\n\n  The CREATE ROUTINE, ALTER ROUTINE, EXECUTE, and GRANT privileges\n  apply to stored routines (functions and procedures). They can be\n  granted at the global and database levels. Also, except for CREATE\n  ROUTINE, these privileges can be granted at the routine level for\n  individual routines and are stored in the mysql.procs_priv table.\n\nThe object_type clause was added in MySQL 5.0.6. It should be specified\nas TABLE, FUNCTION, or PROCEDURE when the following object is a table,\na stored function, or a stored procedure.\n', '', 'grant'),
(178, 'MBRINTERSECTS', 5, 'MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n', '', 'relations-on-geometry-mbr'),
(179, 'BIT_OR', 14, 'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n', '', 'group-by-functions'),
(180, 'YEARWEEK', 28, 'Syntax:\nYEARWEEK(date), YEARWEEK(date,start)\n\nReturns year and week for a date. The start argument works exactly like\nthe start argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n', 'mysql> SELECT YEARWEEK(''1987-01-01'');\n        -> 198653\n', 'date-and-time-functions'),
(181, 'NOT BETWEEN', 17, 'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n', '', 'comparison-operators'),
(182, 'LOG10', 4, 'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n', 'mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n', 'mathematical-functions'),
(183, 'SQRT', 4, 'Syntax:\nSQRT(X)\n\nReturns the square root of a non-negative number X.\n', 'mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL        \n', 'mathematical-functions'),
(184, 'DECIMAL', 20, 'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nFor MySQL 5.0.3 and above:\n\nA packed "exact" fixed-point number. M is the total number of decimal\ndigits (the precision) and D is the number of digits after the decimal\npoint (the scale). The decimal point and (for negative numbers) the `-''\nsign are not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65 (64\nfrom 5.0.3 to 5.0.5). The maximum number of supported decimals (D) is\n30. If D is omitted, the default is 0. If M is omitted, the default is\n10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nBefore MySQL 5.0.3:\n\nAn unpacked fixed-point number. Behaves like a CHAR column; "unpacked"\nmeans the number is stored as a string, using one character for each\ndigit of the value. M is the total number of digits and D is the number\nof digits after the decimal point. The decimal point and (for negative\nnumbers) the `-'' sign are not counted in M, although space for them is\nreserved. If D is 0, values have no decimal point or fractional part.\nThe maximum range of DECIMAL values is the same as for DOUBLE, but the\nactual range for a given DECIMAL column may be constrained by the\nchoice of M and D. If D is omitted, the default is 0. If M is omitted,\nthe default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n', '', 'numeric-type-overview'),
(185, 'CREATE FUNCTION', 34, 'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction''s return value. As of MySQL 5.0.3, DECIMAL is a legal value\nafter RETURNS, but currently DECIMAL functions return string values and\nshould be written like STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. The file must be\nlocated in a directory that is searched by your system''s dynamic\nlinker.\n\nTo create a function, you must have the INSERT and privilege for the\nmysql database. This is necessary because CREATE FUNCTION adds a row to\nthe mysql.func system table that records the function''s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See [mysql-upgrade].\n', '', 'create-function'),
(186, 'GEOMETRYN', 23, 'GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n', 'mysql> SET @gc = ''GeometryCollection(Point(1 1),LineString(2 2, 3 3))'';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n', 'geometrycollection-property-functions'),
(187, 'CREATE INDEX', 36, 'Syntax:\nCREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [USING index_type]\n    ON tbl_name (index_col_name,...)\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [alter-table]. For more information about how MySQL uses indexes,\nsee [mysql-indexes].\n', '', 'create-index'),
(188, 'ALTER DATABASE', 36, 'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification [, alter_specification] ...\n\nalter_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE as of\nMySQL 5.0.2.\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation. [charset],\ndiscusses character set and collation names.\n\nThe database name can be omitted, in which case the statement applies\nto the default database.\n', '', 'alter-database'),
(189, '<<', 18, 'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n', 'mysql> SELECT 1 << 2;\n        -> 4\n', 'bit-functions'),
(190, 'SHOW TABLE STATUS', 25, 'Syntax:\nSHOW TABLE STATUS [FROM db_name] [LIKE ''pattern'']\n\nSHOW TABLE STATUS works likes SHOW TABLE, but provides a lot of\ninformation about each table. You can also get this list using the\nmysqlshow --status db_name command.\n', '', 'show-table-status'),
(191, 'MD5', 10, 'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a binary string of 32 hex digits, or NULL if the argument\nwas NULL. The return value can, for example, be used as a hash key.\n', 'mysql> SELECT MD5(''testing'');\n        -> ''ae2b1fca515949e5d54fb22b8ed95575''\n', 'encryption-functions'),
(192, '<', 17, 'Syntax:\n<\n\nLess than:\n', 'mysql> SELECT 2 < 2;\n        -> 0\n', 'comparison-operators'),
(193, 'UNIX_TIMESTAMP', 28, 'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n''1970-01-01 00:00:00'' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since ''1970-01-01 00:00:00'' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in [time-zone-support].\n', 'mysql> SELECT UNIX_TIMESTAMP();\n        -> 882226357\nmysql> SELECT UNIX_TIMESTAMP(''1997-10-04 22:23:00'');\n        -> 875996580\n', 'date-and-time-functions'),
(194, 'DAYOFMONTH', 28, 'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 0 to 31.\n', 'mysql> SELECT DAYOFMONTH(''1998-02-03'');\n        -> 3\n', 'date-and-time-functions'),
(195, 'ASCII', 33, 'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for characters with numeric values from 0 to 255.\n', 'mysql> SELECT ASCII(''2'');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(''dx'');\n        -> 100\n', 'string-functions'),
(196, 'DIV', 4, 'Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\n', 'mysql> SELECT 5 DIV 2;\n        -> 2\n', 'arithmetic-functions'),
(197, 'RENAME USER', 8, 'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the UPDATE privilege\nfor the mysql database. An error occurs if any old account does not\nexist or any new account exists. Each account is named using the same\nformat as for the GRANT statement; for example, ''jeffrey''@''localhost''.\nThe user and host parts of the account name correspond to the User and\nHost column values of the user table row for the account.\n', '', 'rename-user'),
(198, 'SHOW SLAVE STATUS', 25, 'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. If you issue this statement using the mysql client,\nyou can use a \\G statement terminator rather than a semicolon to obtain\na more readable vertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n       Slave_IO_State: Waiting for master to send event\n          Master_Host: localhost\n          Master_User: root\n          Master_Port: 3306\n        Connect_Retry: 3\n      Master_Log_File: gbichot-bin.005\n  Read_Master_Log_Pos: 79\n       Relay_Log_File: gbichot-relay-bin.005\n        Relay_Log_Pos: 548\nRelay_Master_Log_File: gbichot-bin.005\n     Slave_IO_Running: Yes\n    Slave_SQL_Running: Yes\n      Replicate_Do_DB:\n  Replicate_Ignore_DB:\n           Last_Errno: 0\n           Last_Error:\n         Skip_Counter: 0\n  Exec_Master_Log_Pos: 79\n      Relay_Log_Space: 552\n      Until_Condition: None\n       Until_Log_File:\n        Until_Log_Pos: 0\n   Master_SSL_Allowed: No\n   Master_SSL_CA_File:\n   Master_SSL_CA_Path:\n      Master_SSL_Cert:\n    Master_SSL_Cipher:\n       Master_SSL_Key:\nSeconds_Behind_Master: 8\n', '', 'show-slave-status'),
(199, 'GEOMETRY', 30, 'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, InnoDB, NDB, BDB, and ARCHIVE\ntables. (Support for storage engines other than MyISAM was added in\nMySQL 5.0.16.) See also the annotations about spatial indexes under\n[creating-spatial-indexes].\n', 'CREATE TABLE geom (g GEOMETRY);\n', 'creating-spatial-columns'),
(200, 'NUMPOINTS', 11, 'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n', 'mysql> SET @ls = ''LineString(1 1,2 2,3 3)'';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n', 'linestring-property-functions'),
(201, '&', 18, 'Syntax:\n&\n\nBitwise AND:\n', 'mysql> SELECT 29 & 15;\n        -> 13\n', 'bit-functions'),
(202, 'LOCALTIMESTAMP', 28, 'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n', '', 'date-and-time-functions'),
(203, 'ADDDATE', 28, 'Syntax:\nADDDATE(date,INTERVAL expr type), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL argument, see\nthe discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(''1998-01-02'', INTERVAL 31 DAY);\n        -> ''1998-02-02''\nmysql> SELECT ADDDATE(''1998-01-02'', INTERVAL 31 DAY);\n        -> ''1998-02-02''\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n', 'mysql> SELECT ADDDATE(''1998-01-02'', 31);\n        -> ''1998-02-02''\n', 'date-and-time-functions'),
(204, 'REPEAT LOOP', 35, 'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition is true. Thus, a REPEAT always enters the loop at\nleast once. statement_list consists of one or more statements.\n\nA REPEAT statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n', 'mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT SET @x = @x + 1; UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n', 'repeat-statement'),
(205, 'SMALLINT', 20, 'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n', '', 'numeric-type-overview'),
(206, 'DOUBLE PRECISION', 20, 'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n', '', 'numeric-type-overview'),
(207, 'ORD', 33, 'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code Ã— 256)\n+ (3rd byte code Ã— 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n', 'mysql> SELECT ORD(''2'');\n        -> 50\n', 'string-functions'),
(208, 'ENVELOPE', 32, 'Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n', 'mysql> SELECT AsText(Envelope(GeomFromText(''LineString(1 1,2 2)'')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(''LineString(1 1,2 2)''))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n', 'general-geometry-property-functions'),
(209, 'DEALLOCATE PREPARE', 25, 'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement, use the DEALLOCATE PREPARE\nstatement. Attempting to execute a prepared statement after\ndeallocating it results in an error.\n\nIf you terminate a client session without deallocating a previously\nprepared statement, the server deallocates it automatically.\n', '', 'sqlps'),
(210, 'IS_FREE_LOCK', 13, 'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n', '', 'miscellaneous-functions'),
(211, 'TOUCHES', 26, 'Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(212, 'INET_ATON', 13, 'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of a network address as a string,\nreturns an integer that represents the numeric value of the address.\nAddresses may be 4- or 8-byte addresses.\n', 'mysql> SELECT INET_ATON(''209.207.224.40'');\n        -> 3520061480\n', 'miscellaneous-functions'),
(213, 'UNCOMPRESS', 10, 'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n', 'mysql> SELECT UNCOMPRESS(COMPRESS(''any string''));\n        -> ''any string''\nmysql> SELECT UNCOMPRESS(''any string'');\n        -> NULL\n', 'encryption-functions'),
(214, 'AUTO_INCREMENT', 20, 'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n', 'CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n );\n\nINSERT INTO animals (name) VALUES \n    (''dog''),(''cat''),(''penguin''),\n    (''lax''),(''whale''),(''ostrich'');\n\nSELECT * FROM animals;\n', 'example-auto-increment'),
(215, 'ISSIMPLE', 32, 'IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used. If\nimplemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See\n[gis-geometry-class-hierarchy].)\n', '', 'general-geometry-property-functions'),
(216, '- BINARY', 4, 'Syntax:\n-\n\nSubtraction:\n', 'mysql> SELECT 3-5;\n        -> -2\n', 'arithmetic-functions'),
(217, 'GEOMCOLLFROMTEXT', 3, 'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n', '', 'gis-wkt-functions'),
(218, 'WKT DEFINITION', 3, 'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form.\n', '', 'gis-wkt-format'),
(219, 'CURRENT_TIME', 28, 'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n', '', 'date-and-time-functions'),
(220, 'REVOKE', 8, 'Syntax:\nREVOKE priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON [object_type] {tbl_name | * | *.* | db_name.*}\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. To use REVOKE, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nFor details on the levels at which privileges exist, the allowable\npriv_type values, and the syntax for specifying users and passwords,\nsee [grant]\n', '', 'revoke'),
(221, 'LAST_INSERT_ID', 15, 'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nReturns the first automatically generated value that was set for an\nAUTO_INCREMENT column by the most recent INSERT or UPDATE statement to\naffect such a column.\n', 'mysql> SELECT LAST_INSERT_ID();\n        -> 195\n', 'information-functions'),
(222, 'LAST_DAY', 28, 'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n', 'mysql> SELECT LAST_DAY(''2003-02-05'');\n        -> ''2003-02-28''\nmysql> SELECT LAST_DAY(''2004-02-05'');\n        -> ''2004-02-29''\nmysql> SELECT LAST_DAY(''2004-01-01 01:01:01'');\n        -> ''2004-01-31''\nmysql> SELECT LAST_DAY(''2003-03-32'');\n        -> NULL\n', 'date-and-time-functions'),
(223, 'MEDIUMINT', 20, 'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n', '', 'numeric-type-overview'),
(224, 'FLOOR', 4, 'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n', 'mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2\n', 'mathematical-functions'),
(225, 'RTRIM', 33, 'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n', 'mysql> SELECT RTRIM(''barbar   '');\n        -> ''barbar''\n', 'string-functions'),
(226, 'DEGREES', 4, 'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n', 'mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n', 'mathematical-functions'),
(227, 'EXPLAIN', 25, 'Syntax:\nEXPLAIN tbl_name\n\nOr:\n\nEXPLAIN [EXTENDED] SELECT select_options\n\nThe EXPLAIN statement can be used either as a synonym for DESCRIBE or\nas a way to obtain information about how MySQL executes a SELECT\nstatement:\n\no EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS\n  FROM tbl_name.\n\no When you precede a SELECT statement with the keyword EXPLAIN, MySQL\n  displays information from the optimizer about the query execution\n  plan. That is, MySQL explains how it would process the SELECT,\n  including information about how tables are joined and in which order.\n', '', 'explain'),
(228, 'VARCHAR', 20, '[NATIONAL] VARCHAR(M) [BINARY]\n\nA variable-length string. M represents the maximum column length. In\nMySQL 5.0, the range of M is 0 to 255 before MySQL 5.0.3, and 0 to\n65,535 in MySQL 5.0.3 and later. (The actual maximum length of a\nVARCHAR in MySQL 5.0 is determined by the maximum row size and the\ncharacter set you use. The maximum effective length starting with MySQL\n5.0.3 is 65,532 bytes.)\n\nNote: Before 5.0.3, trailing spaces were removed when VARCHAR values\nwere stored, which differs from the standard SQL specification.\n\nPrior to MySQL 5.0.3, a VARCHAR column with a length specification\ngreater than 255 was converted to the smallest TEXT type that could\nhold values of the given length. For example, VARCHAR(500) was\nconverted to TEXT, and VARCHAR(200000) was converted to MEDIUMTEXT.\nThis was a compatibility feature. However, this conversion affected\ntrailing-space removal.\n\nVARCHAR is shorthand for CHARACTER VARYING.\n\nThe BINARY attribute is shorthand for specifying the binary collation\nof the column character set. In this case, sorting and comparison are\nbased on numeric character values.\n\nStarting from MySQL 5.0.3, VARCHAR is stored with a one-byte or\ntwo-byte length prefix plus data. The length prefix is two bytes if the\nVARCHAR column is declared with a length greater than 255.\n', '', 'string-type-overview'),
(229, 'UNHEX', 33, 'Syntax:\n\nUNHEX(str)\n\nPerforms the inverse operation of HEX(str). That is, it interprets each\npair of hexadecimal digits in the argument as a number and converts it\nto the character represented by the number. The resulting characters\nare returned as a binary string.\n', 'mysql> SELECT UNHEX(''4D7953514C'');\n        -> ''MySQL''\nmysql> SELECT 0x4D7953514C;\n        -> ''MySQL''\nmysql> SELECT UNHEX(HEX(''string''));\n        -> ''string''\nmysql> SELECT HEX(UNHEX(''1267''));\n        -> ''1267''\n', 'string-functions'),
(230, '- UNARY', 4, 'Syntax:\n-\n\nUnary minus. This operator changes the sign of the argument.\n', 'mysql> SELECT - 2;\n        -> -2\n', 'arithmetic-functions'),
(231, 'SELECT INTO', 35, 'Syntax:\nSELECT col_name[,...] INTO var_name[,...] table_expr\n\nThis SELECT syntax stores selected columns directly into variables.\nTherefore, only a single row may be retrieved.\n', 'SELECT id,data INTO x,y FROM test.t1 LIMIT 1;\n', 'select-into-statement'),
(232, 'COS', 4, 'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n', 'mysql> SELECT COS(PI());\n        -> -1\n', 'mathematical-functions'),
(233, 'DATE FUNCTION', 28, 'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n', 'mysql> SELECT DATE(''2003-12-31 01:02:03'');\n        -> ''2003-12-31''\n', 'date-and-time-functions'),
(234, 'DROP TRIGGER', 21, 'Syntax:\nDROP TRIGGER [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER was added in MySQL 5.0.2. Its use requires the\nSUPER privilege.\n', '', 'drop-trigger'),
(235, 'RESET MASTER', 25, 'Syntax:\nRESET MASTER\n\nDeletes all binary logs listed in the index file, resets the binary log\nindex file to be empty, and creates a new binary log file.\n', '', 'reset-master'),
(236, 'TAN', 4, 'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n', 'mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n', 'mathematical-functions'),
(237, 'PI', 4, 'Syntax:\nPI()\n\nReturns the value of Ï€ (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n', 'mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n', 'mathematical-functions'),
(238, 'WEEKOFYEAR', 28, 'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n', 'mysql> SELECT WEEKOFYEAR(''1998-02-20'');\n        -> 8\n', 'date-and-time-functions'),
(239, '/', 4, 'Syntax:\n/\n\nDivision:\n', 'mysql> SELECT 3/5;\n        -> 0.60\n', 'arithmetic-functions'),
(240, 'STDDEV_SAMP', 14, 'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP(). This function was added in MySQL 5.0.3.\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n', '', 'group-by-functions'),
(241, 'SCHEMA', 15, 'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE(). It was added in MySQL 5.0.2.\n', '', 'information-functions'),
(242, 'MLINEFROMWKB', 29, 'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n', '', 'gis-wkb-functions'),
(243, 'LOG2', 4, 'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n', 'mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n', 'mathematical-functions'),
(244, 'SUBTIME', 28, 'Syntax:\nSUBTIME(expr,expr2)\n\nSUBTIME() subtracts expr2 from expr and returns the result. expr is a\ntime or datetime expression, and expr2 is a time expression.\n', 'mysql> SELECT SUBTIME(''1997-12-31 23:59:59.999999'',''1 1:1:1.000002'');\n        -> ''1997-12-30 22:58:58.999997''\nmysql> SELECT SUBTIME(''01:00:00.999999'', ''02:00:00.999998'');\n        -> ''-00:59:59.999999''\n', 'date-and-time-functions'),
(245, 'UNCOMPRESSED_LENGTH', 10, 'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n', 'mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(''a'',30)));\n        -> 30\n', 'encryption-functions'),
(246, 'DROP TABLE', 36, 'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement!\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each non-existent table when using IF\nEXISTS. See [show-warnings].\n\nRESTRICT and CASCADE are allowed to make porting easier. For the\nmoment, they do nothing.\n\nNote: DROP TABLE automatically commits the current active transaction,\nunless you use the TEMPORARY keyword.\n', '', 'drop-table'),
(247, 'SHOW CREATE TABLE', 25, 'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the given table. As of\nMySQL 5.0.1, this statement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the SQL_QUOTE_SHOW_CREATE option. See [set-option].\n', 'mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n', 'show-create-table'),
(248, 'DUAL', 25, 'You are allowed to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for compatibility with some other database servers that\nrequire a FROM clause. MySQL does not require the clause if no tables\nare referenced.\n', '', 'select'),
(249, 'INSTR', 33, 'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n', 'mysql> SELECT INSTR(''foobarbar'', ''bar'');\n        -> 4\nmysql> SELECT INSTR(''xbar'', ''foobar'');\n        -> 0\n', 'string-functions'),
(250, 'NOW', 28, 'Syntax:\nNOW()\n\nReturns the current date and time as a value in ''YYYY-MM-DD HH:MM:SS''\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n', 'mysql> SELECT NOW();\n        -> ''1997-12-15 23:50:26''\nmysql> SELECT NOW() + 0;\n        -> 19971215235026\n', 'date-and-time-functions'),
(251, 'SHOW ENGINES', 25, 'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server''s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is. SHOW TABLE\nTYPES is a deprecated synonym.\n', '', 'show-engines'),
(252, '>=', 17, 'Syntax:\n>=\n\nGreater than or equal:\n', 'mysql> SELECT 2 >= 2;\n        -> 1\n', 'comparison-operators'),
(253, 'EXP', 4, 'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X.\n', 'mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n', 'mathematical-functions'),
(254, 'SHA', 10, 'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a binary\nstring of 40 hex digits, or NULL if the argument was NULL. One of the\npossible uses for this function is as a hash key. You can also use it\nas a cryptographic function for storing passwords. SHA() is synonymous\nwith SHA1().\n', 'mysql> SELECT SHA1(''abc'');\n        -> ''a9993e364706816aba3e25717850c26c9cd0d89d''\n', 'encryption-functions'),
(255, 'LONGBLOB', 20, 'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The maximum effective (permitted) length of LONGBLOB columns\ndepends on the configured maximum packet size in the client/server\nprotocol and available memory.\n', '', 'string-type-overview'),
(256, 'POINTN', 11, 'PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n', 'mysql> SET @ls = ''LineString(1 1,2 2,3 3)'';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n', 'linestring-property-functions'),
(257, 'YEAR DATA TYPE', 20, 'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. In four-digit format, the allowable values are 1901 to 2155,\nand 0000. In two-digit format, the allowable values are 70 to 69,\nrepresenting years from 1970 to 2069. MySQL displays YEAR values in\nYYYY format, but allows you to assign values to YEAR columns using\neither strings or numbers.\n', '', 'date-and-time-type-overview'),
(258, 'SUM', 14, 'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used in MySQL 5.0 to sum only the\ndistinct values of expr.\n\nSUM() returns NULL if there were no matching rows.\n', '', 'group-by-functions'),
(259, 'OCT', 33, 'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n', 'mysql> SELECT OCT(12);\n        -> ''14''\n', 'string-functions'),
(260, 'SYSDATE', 28, 'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in ''YYYY-MM-DD HH:MM:SS''\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n\nWithin a stored routine or trigger, SYSDATE() returns the time at which\nit executes. This differs from the behavior for NOW(), which returns\nthe the time at which the routine or triggering statement began to\nexecute.\n', '', 'date-and-time-functions'),
(261, 'ASBINARY', 29, 'AsBinary(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n', 'SELECT AsBinary(g) FROM geom;\n', 'functions-to-convert-geometries-between-formats'),
(262, 'REPEAT FUNCTION', 33, 'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n', 'mysql> SELECT REPEAT(''MySQL'', 3);\n        -> ''MySQLMySQLMySQL''\n', 'string-functions'),
(263, 'SHOW TABLES', 25, 'Syntax:\nSHOW [FULL] TABLES [FROM db_name] [LIKE ''pattern'']\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command.\n\nBefore MySQL 5.0.1, the output from SHOW TABLES contains a single\ncolumn of table names. Beginning with MySQL 5.0.1, this statement also\nlists any views in the database. As of MySQL 5.0.2, the FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\nNote: If you have no privileges for a table, the table does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n', '', 'show-tables'),
(264, 'MAKEDATE', 28, 'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n', 'mysql> SELECT MAKEDATE(2001,31), MAKEDATE(2001,32);\n        -> ''2001-01-31'', ''2001-02-01''\nmysql> SELECT MAKEDATE(2001,365), MAKEDATE(2004,365);\n        -> ''2001-12-31'', ''2004-12-30''\nmysql> SELECT MAKEDATE(2001,0);\n        -> NULL\n', 'date-and-time-functions'),
(265, 'BINARY OPERATOR', 33, 'Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column isn''t defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n', 'mysql> SELECT ''a'' = ''A'';\n        -> 1\nmysql> SELECT BINARY ''a'' = ''A'';\n        -> 0\nmysql> SELECT ''a'' = ''a '';\n        -> 1\nmysql> SELECT BINARY ''a'' = ''a '';\n        -> 0\n', 'cast-functions'),
(266, 'MBROVERLAPS', 5, 'MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap.\n', '', 'relations-on-geometry-mbr'),
(267, 'SOUNDEX', 33, 'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All non-alphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n', 'mysql> SELECT SOUNDEX(''Hello'');\n        -> ''H400''\nmysql> SELECT SOUNDEX(''Quadratically'');\n        -> ''Q36324''\n', 'string-functions'),
(268, 'SHOW MASTER LOGS', 25, 'Syntax:\nSHOW MASTER LOGS\nSHOW BINARY LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-master-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n', '', 'show-master-logs'),
(269, 'MBRTOUCHES', 5, 'MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch.\n', '', 'relations-on-geometry-mbr'),
(270, 'CREATE PROCEDURE', 35, 'Syntax:\nCREATE PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n    \nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n    \nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT ''string''\n\nroutine_body:\n    Valid SQL procedure statement\n\nThese statements create stored routines. As of MySQL 5.0.3, to use\nthem, it is necessary to have the CREATE ROUTINE privilege. If binary\nlogging is enabled, these statements might may also require the SUPER\nprivilege, as described in [stored-procedure-logging]. MySQL\nautomatically grants the ALTER ROUTINE and EXECUTE privileges to the\nroutine creator.\n\nBy default, the routine is associated with the default database. To\nassociate the routine explicitly with a given database, specify the\nname as db_name.sp_name when you create it.\n\nIf the routine name is the same as the name of a built-in SQL function,\nyou must use a space between the name and the following parenthesis\nwhen defining the routine, or a syntax error occurs. This is also true\nwhen you invoke the routine later. For this reason, we suggest that it\nis better to avoid re-using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. it is always allowable to have spaces after a routine name,\nregardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused. Each parameter is an IN parameter by default. To specify\notherwise for a parameter, use the keyword OUT or INOUT before the\nparameter name.\n\nNote: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. (FUNCTION parameters are always regarded as IN parameters.)\n\nEach parameter can be declared to use any valid data type, except that\nthe COLLATE attribute cannot be used.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement.\n\nThe routine_body consists of a valid SQL procedure statement. This can\nbe a simple statement such as SELECT or INSERT, or it can be a compound\nstatement written using BEGIN and END. Compound statement syntax is\ndescribed in [begin-end]. Compound statements can contain declarations,\nloops, and other control structure statements. The syntax for these\nstatements is described later in this chapter. See, for example,\n[declare], and [flow-control-constructs]. Some statements are not\nallowed in stored routines; see [routine-restrictions].\n', 'mysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n', 'create-procedure'),
(271, 'INSERT SELECT', 25, 'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n', '', 'insert-select'),
(272, 'VARBINARY', 20, 'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than non-binary character strings.\n', '', 'string-type-overview'),
(273, 'LOAD INDEX', 25, 'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise. LOAD INDEX INTO\nCACHE is used only for MyISAM tables.\n\nThe IGNORE LEAVES modifier causes only blocks for the non-leaf nodes of\nthe index to be preloaded.\n', '', 'load-index'),
(274, 'UNION', 25, 'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n', '', 'union'),
(275, 'TO_DAYS', 28, 'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n', 'mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(''1997-10-07'');\n        -> 729669\n', 'date-and-time-functions'),
(276, 'NOT REGEXP', 33, 'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n', '', 'string-comparison-functions'),
(277, 'SHOW INDEX', 25, 'Syntax:\nSHOW INDEX FROM tbl_name [FROM db_name]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nSHOW KEYS is a synonym for SHOW INDEX. You can also list a table''s\nindexes with the mysqlshow -k db_name tbl_name command.\n', '', 'show-index');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(278, 'SHOW CREATE DATABASE', 25, 'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} db_name\n\nShows the CREATE DATABASE statement that creates the given database.\nSHOW CREATE SCHEMA is a synonym for SHOW CREATE DATABASE as of MySQL\n5.0.2.\n', 'mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n', 'show-create-database'),
(279, 'LEAVE', 35, 'Syntax:\nLEAVE label\n\nThis statement is used to exit any labeled flow control construct. It\ncan be used within BEGIN ... END or loop constructs (LOOP, REPEAT,\nWHILE).\n', '', 'leave-statement'),
(280, 'NOT IN', 17, 'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n', '', 'comparison-operators'),
(281, '!', 12, 'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnon-zero, and NOT NULL returns NULL.\n', 'mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n', 'logical-operators'),
(282, 'DECLARE HANDLER', 35, 'Syntax:\nDECLARE handler_type HANDLER FOR condition_value[,...] statement\n\nhandler_type:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n  | mysql_error_code\n\nThe DECLARE ... HANDLER statement specifies handlers that each may deal\nwith one or more conditions. If one of these conditions occurs, the\nspecified statement is executed. statement can be a simple statement\n(for example, SET var_name = value), or it can be a compound statement\nwritten using BEGIN and END (see [begin-end]).\n\nFor a CONTINUE handler, execution of the current routine continues\nafter execution of the handler statement. For an EXIT handler,\nexecution terminates for the BEGIN ... END compound statement in which\nthe handler is declared. (This is true even if the condition occurs in\nan inner block.) The UNDO handler type statement is not yet supported.\n\nIf a condition occurs for which no handler has been declared, the\ndefault action is EXIT.\n\nA condition_value can be any of the following values:\n\no An SQLSTATE value or a MySQL error code.\n\no A condition name previously specified with DECLARE ... CONDITION. See\n  [declare-conditions].\n\no SQLWARNING is shorthand for all SQLSTATE codes that begin with 01.\n\no NOT FOUND is shorthand for all SQLSTATE codes that begin with 02.\n\no SQLEXCEPTION is shorthand for all SQLSTATE codes not caught by\n  SQLWARNING or NOT FOUND.\n', 'mysql> CREATE TABLE test.t (s1 int,primary key (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE ''23000'' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n', 'declare-handlers'),
(283, 'DOUBLE', 20, 'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Allowable\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of decimal digits and D is the number of digits\nfollowing the decimal point. If M and D are omitted, values are stored\nto the limits allowed by the hardware. A double-precision\nfloating-point number is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n', '', 'numeric-type-overview'),
(284, 'TIME', 20, 'TIME\n\nA time. The range is ''-838:59:59'' to ''838:59:59''. MySQL displays TIME\nvalues in ''HH:MM:SS'' format, but allows you to assign values to TIME\ncolumns using either strings or numbers.\n', '', 'date-and-time-type-overview'),
(285, '&&', 12, 'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are non-zero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n', 'mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0\n', 'logical-operators'),
(286, 'X', 9, 'X(p)\n\nReturns the X-coordinate value for the point p as a double-precision\nnumber.\n', 'mysql> SET @pt = ''Point(56.7 53.34)'';\nmysql> SELECT X(GeomFromText(@pt));\n+----------------------+\n| X(GeomFromText(@pt)) |\n+----------------------+\n|                 56.7 |\n+----------------------+\n', 'point-property-functions'),
(287, 'FOUND_ROWS', 15, 'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n', 'mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n', 'information-functions'),
(288, 'SYSTEM_USER', 15, 'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n', '', 'information-functions'),
(289, 'CROSSES', 26, 'Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(290, 'TRUNCATE TABLE', 25, 'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. Logically, this is\nequivalent to a DELETE statement that deletes all rows, but there are\npractical differences under some circumstances.\n\nFor InnoDB before version 5.0.3, TRUNCATE TABLE is mapped to DELETE, so\nthere is no difference. Starting with MySQL 5.0.3, fast TRUNCATE TABLE\nis available. However, the operation is still mapped to DELETE if there\nare foreign key constraints that reference the table. (When fast\ntruncate is used, it resets any AUTO_INCREMENT counter. From MySQL\n5.0.13 on, the AUTO_INCREMENT counter is reset by TRUNCATE TABLE,\nregardless of whether there is a foreign key constraint.)\n\nFor other storage engines, TRUNCATE TABLE differs from DELETE in the\nfollowing ways in MySQL 5.0:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one.\n\no Truncate operations are not transaction-safe; an error occurs when\n  attempting one in the course of an active transaction or active table\n  lock.\n\no The number of deleted rows is not returned.\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no The table handler does not remember the last used AUTO_INCREMENT\n  value, but starts counting from the beginning. This is true even for\n  MyISAM and InnoDB, which normally do not reuse sequence values.\n\nTRUNCATE TABLE is an Oracle SQL extension adopted in MySQL.\n', '', 'truncate'),
(291, 'BIT_XOR', 14, 'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n', '', 'group-by-functions'),
(292, 'CURRENT_DATE', 28, 'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n', '', 'date-and-time-functions'),
(293, 'AREA', 2, 'Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n', 'mysql> SET @poly = ''Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))'';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n', 'polygon-property-functions'),
(294, 'START SLAVE', 25, 'Syntax:\nSTART SLAVE [thread_type [, thread_type] ... ]\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = ''log_name'', MASTER_LOG_POS = log_pos\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = ''log_name'', RELAY_LOG_POS = log_pos\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no options starts both of the slave threads. The I/O\nthread reads queries from the master server and stores them in the\nrelay log. The SQL thread reads the relay log and executes the queries.\nSTART SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary logs, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave''s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n', '', 'start-slave'),
(295, 'BEGIN END', 35, 'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored routines and triggers. A compound statement can\ncontain multiple statements, enclosed by the BEGIN and END keywords.\nstatement_list represents a list of one or more statements. Each\nstatement within statement_list must be terminated by a semicolon (;)\nstatement delimiter. Note that statement_list is optional, which means\nthat the empty compound statement (BEGIN END) is legal.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. This is handled\nin the mysql command-line client with the delimiter command. Changing\nthe ; end-of-statement delimiter (for example, to //) allows ; to be\nused in a routine body. For an example, see [create-procedure].\n\nA compound statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n', '', 'begin-end'),
(296, 'FLUSH', 25, 'Syntax:\nFLUSH [LOCAL | NO_WRITE_TO_BINLOG] flush_option [, flush_option] ...\n\nThe FLUSH statement clears or reloads various internal caches used by\nMySQL. To execute FLUSH, you must have the RELOAD privilege.\n\nThe RESET statement is similar to FLUSH. See [reset].\n', '', 'flush'),
(297, 'SHOW PROCEDURE STATUS', 25, 'Syntax:\nSHOW {PROCEDURE | FUNCTION} STATUS [LIKE ''pattern'']\n\nThis statement is a MySQL extension. It returns characteristics of\nroutines, such as the database, name, type, creator, and creation and\nmodification dates. If no pattern is specified, the information for all\nstored procedures or all stored functions is listed, depending on which\nstatement you use.\n', 'mysql> SHOW FUNCTION STATUS LIKE ''hello''\\G\n*************************** 1. row ***************************\n           Db: test\n         Name: hello\n         Type: FUNCTION\n      Definer: testuser@localhost\n     Modified: 2004-08-03 15:29:37\n      Created: 2004-08-03 15:29:37\nSecurity_type: DEFINER\n      Comment:\n', 'show-procedure-status'),
(298, 'SHOW WARNINGS', 25, 'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS shows the error, warning, and note messages that resulted\nfrom the last statement that generated messages, or nothing if the last\nstatement that used a table generated no messages. A related statement,\nSHOW ERRORS, shows only the errors. See [show-errors].\n\nThe list of messages is reset for each new statement that uses a table.\n\nThe SHOW COUNT(*) WARNINGS statement displays the total number of\nerrors, warnings, and notes. You can also retrieve this number from the\nwarning_count variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nThe value of warning_count might be greater than the number of messages\ndisplayed by SHOW WARNINGS if the max_error_count system variable is\nset so low that not all messages are stored. An example shown later in\nthis section demonstrates how this can happen.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\n[select].\n', '', 'show-warnings'),
(299, 'DESCRIBE', 24, 'Syntax:\n{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table. It is a\nshortcut for SHOW COLUMNS FROM. As of MySQL 5.0.1, these statements\nalso display information for views. (See [show-columns].)\n', '', 'describe'),
(300, 'DROP USER', 8, 'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the DELETE privilege\nfor the mysql database. Each account is named using the same format as\nfor the GRANT statement; for example, ''jeffrey''@''localhost''. The user\nand host parts of the account name correspond to the User and Host\ncolumn values of the user table row for the account.\n\nDROP USER as present in MySQL 5.0.0 removes only accounts that have no\nprivileges. In MySQL 5.0.2, it was modified to remove account\nprivileges as well. This means that the procedure for removing an\naccount depends on your version of MySQL.\n\nAs of MySQL 5.0.2, you can remove an account and its privileges as\nfollows:\n\nDROP USER user;\n\nThe statement removes privilege rows for the account from all grant\ntables.\n', '', 'drop-user'),
(301, 'STDDEV_POP', 14, 'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). This function was added in MySQL 5.0.3. Before 5.0.3, you\ncan use STD() or STDDEV(), which are equivalent but not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n', '', 'group-by-functions'),
(302, 'SHOW CHARACTER SET', 25, 'Syntax:\nSHOW CHARACTER SET [LIKE ''pattern'']\n\nThe SHOW CHARACTER SET statement shows all available character sets. It\ntakes an optional LIKE clause that indicates which character set names\nto match. For example:\n\nmysql> SHOW CHARACTER SET LIKE ''latin%'';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n', '', 'show-character-set'),
(303, 'SUBSTRING', 33, 'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n', 'mysql> SELECT SUBSTRING(''Quadratically'',5);\n        -> ''ratically''\nmysql> SELECT SUBSTRING(''foobarbar'' FROM 4);\n        -> ''barbar''\nmysql> SELECT SUBSTRING(''Quadratically'',5,6);\n        -> ''ratica''        \nmysql> SELECT SUBSTRING(''Sakila'', -3);\n        -> ''ila''        \nmysql> SELECT SUBSTRING(''Sakila'', -5, 3);\n        -> ''aki''\nmysql> SELECT SUBSTRING(''Sakila'' FROM -4 FOR 2);\n        -> ''ki''\n', 'string-functions'),
(304, 'ISEMPTY', 32, 'IsEmpty(g)\n\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL. If the geometry is empty, it\nrepresents the empty point set.\n', '', 'general-geometry-property-functions'),
(305, 'LTRIM', 33, 'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n', 'mysql> SELECT LTRIM(''  barbar'');\n        -> ''barbar''\n', 'string-functions'),
(306, 'INTERSECTS', 26, 'Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(307, 'CALL', 35, 'Syntax:\nCALL sp_name([parameter[,...]])\n\nThe CALL statement invokes a procedure that was defined previously with\nCREATE PROCEDURE.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. It also "returns" the number of\nrows affected, which a client program can obtain at the SQL level by\ncalling the ROW_COUNT() function and from C by calling the\nmysql_affected_rows() C API function.\n', '', 'call'),
(308, 'MBRDISJOINT', 5, 'MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n', '', 'relations-on-geometry-mbr'),
(309, 'VALUES', 13, 'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in INSERT ... ON DUPLICATE KEY UPDATE\nstatements and returns NULL otherwise. [insert-on-duplicate].\n', 'mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n', 'miscellaneous-functions'),
(310, 'SUBSTRING_INDEX', 33, 'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n', 'mysql> SELECT SUBSTRING_INDEX(''www.mysql.com'', ''.'', 2);\n        -> ''www.mysql''\nmysql> SELECT SUBSTRING_INDEX(''www.mysql.com'', ''.'', -2);\n        -> ''mysql.com''\n', 'string-functions'),
(311, 'ENCODE', 10, 'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. To decrypt the result, use\nDECODE().\n\nThe result is a binary string of the same length as str.\n', '', 'encryption-functions'),
(312, 'LOOP', 35, 'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements. The\nstatements within the loop are repeated until the loop is exited;\nusually this is accomplished with a LEAVE statement.\n\nA LOOP statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n', '', 'loop-statement'),
(313, 'TRUNCATE', 4, 'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n', 'mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n', 'mathematical-functions'),
(314, 'TIMESTAMPADD', 28, 'Syntax:\nTIMESTAMPADD(interval,int_expr,datetime_expr)\n\nAdds the integer expression int_expr to the date or datetime expression\ndatetime_expr. The unit for int_expr is given by the interval argument,\nwhich should be one of the following values: FRAC_SECOND, SECOND,\nMINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or YEAR.\n\nThe interval value may be specified using one of keywords as shown, or\nwith a prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are\nlegal.\n', 'mysql> SELECT TIMESTAMPADD(MINUTE,1,''2003-01-02'');\n        -> ''2003-01-02 00:01:00''\nmysql> SELECT TIMESTAMPADD(WEEK,1,''2003-01-02'');\n        -> ''2003-01-09''\n', 'date-and-time-functions'),
(315, 'SHOW', 25, 'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [LIKE ''pattern'']\nSHOW CREATE DATABASE db_name\nSHOW CREATE FUNCTION funcname\nSHOW CREATE PROCEDURE procname\nSHOW CREATE TABLE tbl_name\nSHOW DATABASES [LIKE ''pattern'']\nSHOW ENGINE engine_name {LOGS | STATUS }\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW FUNCTION STATUS [LIKE ''pattern'']\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW INNODB STATUS\nSHOW PROCEDURE STATUS [LIKE ''pattern'']\nSHOW [BDB] LOGS\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW [GLOBAL | SESSION] STATUS [LIKE ''pattern'']\nSHOW TABLE STATUS [FROM db_name] [LIKE ''pattern'']\nSHOW [OPEN] TABLES [FROM db_name] [LIKE ''pattern'']\nSHOW TRIGGERS\nSHOW [GLOBAL | SESSION] VARIABLES [LIKE ''pattern'']\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nThe SHOW statement also has forms that provide information about\nreplication master and slave servers and are described in\n[replication-sql]:\n\nSHOW BINLOG EVENTS\nSHOW MASTER LOGS\nSHOW MASTER STATUS\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\n\nIf the syntax for a given SHOW statement includes a LIKE ''pattern''\npart, ''pattern'' is a string that can contain the SQL `%'' and `_''\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See [extended-show].\n', '', 'show'),
(316, 'GREATEST', 17, 'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n', 'mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(''B'',''A'',''C'');\n        -> ''C''\n', 'comparison-operators'),
(317, 'OCTETLENGTH', 33, 'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n', '', 'string-functions'),
(318, 'SHOW VARIABLES', 25, 'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES [LIKE ''pattern'']\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. With SESSION, it displays the values\nthat are in effect for the current connection. If no modifier is\npresent, the default is SESSION. LOCAL is a synonym for SESSION.\nWith a LIKE clause, the statement displays only those variables that\nmatch the pattern. To obtain a specific variable name, use a LIKE\nclause as shown:\n\nSHOW VARIABLES LIKE ''max_join_size'';\nSHOW SESSION VARIABLES LIKE ''max_join_size'';\n\nTo get a list of variables whose name match a pattern, use the `%''\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE ''%size%'';\nSHOW GLOBAL VARIABLES LIKE ''%size%'';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because `_'' is a wildcard that matches\nany single character, you should escape it as `\\_'' to match it\nliterally. In practice, this is rarely necessary.\n', '', 'show-variables'),
(319, 'BIT_AND', 14, 'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n', '', 'group-by-functions'),
(320, 'SECOND', 28, 'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n', 'mysql> SELECT SECOND(''10:05:03'');\n        -> 3\n', 'date-and-time-functions'),
(321, 'ATAN2', 4, 'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n', 'mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n', 'mathematical-functions'),
(322, 'MBRCONTAINS', 5, 'MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2.\n', 'mysql> SET @g1 = GeomFromText(''Polygon((0 0,0 3,3 3,3 0,0 0))'');\nmysql> SET @g2 = GeomFromText(''Point(1 1)'');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n', 'relations-on-geometry-mbr'),
(323, 'HOUR', 28, 'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n', 'mysql> SELECT HOUR(''10:05:03'');\n        -> 10\nmysql> SELECT HOUR(''272:59:59'');\n        -> 272\n', 'date-and-time-functions'),
(324, 'SELECT', 25, 'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr, ...\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE ''file_name'' export_options\n      | INTO DUMPFILE ''file_name'']\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [union], and\n[subqueries].\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [join].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE clause, you can use any of the functions and operators\n  that MySQL supports, except for aggregate (summary) functions. See\n  [functions].\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n', '', 'select'),
(325, 'COT', 4, 'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n', 'mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> NULL\n', 'mathematical-functions'),
(326, 'BACKUP TABLE', 19, 'Syntax:\nBACKUP TABLE tbl_name [, tbl_name] ... TO ''/path/to/backup/directory''\n\nNote: This statement is deprecated. We are working on a better\nreplacement for it that will provide online backup capabilities. In the\nmeantime, the mysqlhotcopy script can be used instead.\n\nBACKUP TABLE copies to the backup directory the minimum number of table\nfiles needed to restore the table, after flushing any buffered changes\nto disk. The statement works only for MyISAM tables. It copies the .frm\ndefinition and .MYD data files. The .MYI index file can be rebuilt from\nthose two files. The directory should be specified as a full pathname.\nTo restore the table, use RESTORE TABLE.\n', '', 'backup-table'),
(327, 'LOAD_FILE', 33, 'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full pathname to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nAs of MySQL 5.0.19, the character_set_filesystem system variable\ncontrols interpretation of filenames that are given as literal strings.\n', 'mysql> UPDATE t\n            SET blob_col=LOAD_FILE(''/tmp/picture'')\n            WHERE id=1;\n', 'string-functions'),
(328, 'POINTFROMTEXT', 3, 'PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n', '', 'gis-wkt-functions'),
(329, 'LOAD TABLE FROM MASTER', 25, 'Syntax:\nLOAD TABLE tbl_name FROM MASTER\n\nTransfers a copy of the table from the master to the slave. This\nstatement is implemented mainly debugging LOAD DATA FROM MASTER\noperations. To use LOAD TABLE, the account used for connecting to the\nmaster server must have the RELOAD and SUPER privileges on the master\nand the SELECT privilege for the master table to load. On the slave\nside, the user that issues LOAD TABLE FROM MASTER must have privileges\nfor dropping and creating the table.\n\nThe conditions for LOAD DATA FROM MASTER apply here as well. For\nexample, LOAD TABLE FROM MASTER works only for MyISAM tables. The\ntimeout notes for LOAD DATA FROM MASTER apply as well.\n', '', 'load-table-from-master'),
(330, 'GROUP_CONCAT', 14, 'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n', 'mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n', 'group-by-functions'),
(331, 'DATE_FORMAT', 28, 'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n', 'mysql> SELECT DATE_FORMAT(''1997-10-04 22:23:00'', ''%W %M %Y'');\n        -> ''Saturday October 1997''\nmysql> SELECT DATE_FORMAT(''1997-10-04 22:23:00'', ''%H:%i:%s'');\n        -> ''22:23:00''\nmysql> SELECT DATE_FORMAT(''1997-10-04 22:23:00'',\n                          ''%D %y %a %d %m %b %j'');\n        -> ''4th 97 Sat 04 10 Oct 277''\nmysql> SELECT DATE_FORMAT(''1997-10-04 22:23:00'',\n                          ''%H %k %I %r %T %S %w'');\n        -> ''22 22 10 10:23:00 PM 22:23:00 00 6''\nmysql> SELECT DATE_FORMAT(''1999-01-01'', ''%X %V'');\n        -> ''1998 52''\nmysql> SELECT DATE_FORMAT(''2006-06-00'', ''%d'');\n        -> ''00''\n', 'date-and-time-functions'),
(332, 'BENCHMARK', 15, 'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n', 'mysql> SELECT BENCHMARK(1000000,ENCODE(''hello'',''goodbye''));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(''hello'',''goodbye'')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n', 'information-functions'),
(333, 'YEAR', 28, 'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n"zero" date.\n', 'mysql> SELECT YEAR(''98-02-03'');\n        -> 1998\n', 'date-and-time-functions'),
(334, 'SHOW ENGINE', 25, 'Syntax:\nSHOW ENGINE engine_name {LOGS | STATUS }\n\nSHOW ENGINE displays log or status information about storage engines.\nThe following statements currently are supported:\n\nSHOW ENGINE BDB LOGS\nSHOW ENGINE INNODB STATUS\n', '', 'show-engine'),
(335, 'NAME_CONST', 13, 'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name.\n\nmysql> SELECT NAME_CONST(''myname'', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n', '', 'miscellaneous-functions'),
(336, 'RELEASE_LOCK', 13, 'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [do].\n', '', 'miscellaneous-functions'),
(337, 'IS NULL', 17, 'Syntax:\nIS NULL, IS NOT NULL\n\nTests whether a value is or is not NULL.\n', 'mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\nmysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n', 'comparison-operators'),
(338, 'CONVERT_TZ', 28, 'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in [time-zone-support].\nThis function returns NULL if the arguments are invalid.\n', 'mysql> SELECT CONVERT_TZ(''2004-01-01 12:00:00'',''GMT'',''MET'');\n        -> ''2004-01-01 13:00:00''\nmysql> SELECT CONVERT_TZ(''2004-01-01 12:00:00'',''+00:00'',''+10:00'');\n        -> ''2004-01-01 22:00:00''\n', 'date-and-time-functions'),
(339, 'TIME_TO_SEC', 28, 'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n', 'mysql> SELECT TIME_TO_SEC(''22:23:00'');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(''00:39:38'');\n        -> 2378\n', 'date-and-time-functions'),
(340, 'WEEKDAY', 28, 'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n', 'mysql> SELECT WEEKDAY(''1998-02-03 22:23:00'');\n        -> 1\nmysql> SELECT WEEKDAY(''1997-11-05'');\n        -> 2\n', 'date-and-time-functions'),
(341, 'EXPORT_SET', 33, 'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every reset bit, you get an off string. Bits in\nbits are examined from right to left (from low-order to high-order\nbits). Strings are added to the result from left to right, separated by\nthe separator string (the default being the comma character `,''). The\nnumber of bits examined is given by number_of_bits (defaults to 64).\n', 'mysql> SELECT EXPORT_SET(5,''Y'',''N'','','',4);\n        -> ''Y,N,Y,N''\nmysql> SELECT EXPORT_SET(6,''1'',''0'','','',10);\n        -> ''0,1,1,0,0,0,0,0,0,0''\n', 'string-functions'),
(342, 'TIME FUNCTION', 28, 'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n', 'mysql> SELECT TIME(''2003-12-31 01:02:03'');\n        -> ''01:02:03''\nmysql> SELECT TIME(''2003-12-31 01:02:03.000123'');\n        -> ''01:02:03.000123''\n', 'date-and-time-functions'),
(343, 'CAST', 33, 'Syntax:\nCAST(expr AS type), CONVERT(expr,type), CONVERT(expr USING\ntranscoding_name)\n\nThe CAST() and CONVERT() functions take a value of one type and produce\na value of another type.\n\nThe type can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\n[binary-varbinary] for a description of how this affects comparisons.\nIf the optional length N is given, BINARY[N] causes the cast to use no\nmore than N bytes of the argument. As of MySQL 5.0.17, values shorter\nthan N bytes are padded with 0x00 bytes to a length of N.\n\nCHAR[N] causes the cast to use no more than N characters of the\nargument.\n\nThe DECIMAL type is available as of MySQL 5.0.8.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string ''abc'' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(''abc'' USING utf8);\n', 'SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n', 'cast-functions'),
(344, 'SOUNDS LIKE', 33, 'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n', '', 'string-functions'),
(345, 'PERIOD_DIFF', 28, 'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n', 'mysql> SELECT PERIOD_DIFF(9802,199703);\n        -> 11\n', 'date-and-time-functions'),
(346, 'LIKE', 33, 'Syntax:\nexpr LIKE pat [ESCAPE ''escape_char'']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n', 'mysql> SELECT ''David!'' LIKE ''David_'';\n        -> 1\nmysql> SELECT ''David!'' LIKE ''%D%v%'';\n        -> 1\n', 'string-comparison-functions'),
(347, 'MULTIPOINT', 22, 'MultiPoint(pt1,pt2,...)\n\nConstructs a WKB MultiPoint value using WKB Point arguments. If any\nargument is not a WKB Point, the return value is NULL.\n', '', 'gis-mysql-specific-functions'),
(348, '>>', 18, 'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n', 'mysql> SELECT 4 >> 2;\n        -> 1\n', 'bit-functions'),
(349, 'FETCH', 35, 'Syntax:\nFETCH cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row (if a row exists) using the\nspecified open cursor, and advances the cursor pointer.\n', '', 'fetch'),
(350, 'TRUE FALSE', 27, 'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n', '', 'boolean-values'),
(351, 'AVG', 14, 'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used as\nof MySQL 5.0.3 to return the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n', 'mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n', 'group-by-functions'),
(352, 'MBRWITHIN', 5, 'MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2.\n', 'mysql> SET @g1 = GeomFromText(''Polygon((0 0,0 3,3 3,3 0,0 0))'');\nmysql> SET @g2 = GeomFromText(''Polygon((0 0,0 5,5 5,5 0,0 0))'');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n', 'relations-on-geometry-mbr'),
(353, 'IN', 17, 'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in [type-conversion], but applied to\nall the arguments.\n', 'mysql> SELECT 2 IN (0,3,5,''wefwf'');\n        -> 0\nmysql> SELECT ''wefwf'' IN (0,3,5,''wefwf'');\n        -> 1\n', 'comparison-operators'),
(354, 'QUOTE', 33, 'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotes and with each instance of single quote (`''''),\nbackslash (`\\''), ASCII NUL, and Control-Z preceded by a backslash. If\nthe argument is NULL, the return value is the word "NULL" without\nenclosing single quotes.\n', 'mysql> SELECT QUOTE(''Don\\''t!'');\n        -> ''Don\\''t!''\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n', 'string-functions'),
(355, 'SESSION_USER', 15, 'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n', '', 'information-functions'),
(356, 'QUARTER', 28, 'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n', 'mysql> SELECT QUARTER(''98-04-01'');\n        -> 2\n', 'date-and-time-functions'),
(357, 'POSITION', 33, 'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n', '', 'string-functions'),
(358, 'IS_USED_LOCK', 13, 'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n', '', 'miscellaneous-functions'),
(359, 'POLYFROMTEXT', 3, 'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n', '', 'gis-wkt-functions'),
(360, 'DES_ENCRYPT', 10, 'Syntax:\nDES_ENCRYPT(str[,(key_num|key_str)])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n', 'key_num des_key_str\n', 'encryption-functions'),
(361, 'LENGTH', 33, 'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five two-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n', 'mysql> SELECT LENGTH(''text'');\n        -> 4\n', 'string-functions'),
(362, 'STR_TO_DATE', 28, 'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts.\n\nThe date, time, or datetime values contained in str should be given in\nthe format indicated by format. For the specifiers that can be used in\nformat, see the DATE_FORMAT() function description. If str contains an\nillegal date, time, or datetime value, STR_TO_DATE() returns NULL.\nStarting from MySQL 5.0.3, an illegal value also produces a warning.\n', '', 'date-and-time-functions'),
(363, 'Y', 9, 'Y(p)\n\nReturns the Y-coordinate value for the point p as a double-precision\nnumber.\n', 'mysql> SET @pt = ''Point(56.7 53.34)'';\nmysql> SELECT Y(GeomFromText(@pt));\n+----------------------+\n| Y(GeomFromText(@pt)) |\n+----------------------+\n|                53.34 |\n+----------------------+\n', 'point-property-functions'),
(364, 'SHOW INNODB STATUS', 25, 'Syntax:\nSHOW INNODB STATUS\n\nIn MySQL 5.0, this is a deprecated synonym for SHOW ENGINE INNODB\nSTATUS. See [show-engine].\n', '', 'show-innodb-status'),
(365, 'CHECKSUM TABLE', 19, 'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a table checksum.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. See\n[create-table].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nFor a non-existent table, CHECKSUM TABLE returns NULL and, as of MySQL\n5.0.3, generates a warning.\n', '', 'checksum-table'),
(366, 'NUMINTERIORRINGS', 2, 'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n', 'mysql> SET @poly =\n    -> ''Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))'';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n', 'polygon-property-functions'),
(367, 'INTERIORRINGN', 2, 'InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n', 'mysql> SET @poly =\n    -> ''Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))'';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n', 'polygon-property-functions'),
(368, 'UTC_TIME', 28, 'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in ''HH:MM:SS'' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext.\n', 'mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> ''18:07:53'', 180753\n', 'date-and-time-functions'),
(369, 'DROP FUNCTION', 34, 'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function''s name, type, and\nshared library name.\n', '', 'drop-function'),
(370, 'STDDEV', 14, 'Syntax:\nSTD(expr) STDDEV(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. The STDDEV() form of this function is provided for\ncompatibility with Oracle. As of MySQL 5.0.3, the standard SQL function\nSTDDEV_POP() can be used instead.\n\nThese functions return NULL if there were no matching rows.\n', '', 'group-by-functions'),
(371, 'PERIOD_ADD', 28, 'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n', 'mysql> SELECT PERIOD_ADD(9801,2);\n        -> 199803\n', 'date-and-time-functions'),
(372, '|', 18, 'Syntax:\n|\n\nBitwise OR:\n', 'mysql> SELECT 29 | 15;\n        -> 31\n', 'bit-functions'),
(373, 'GEOMFROMTEXT', 3, 'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n', '', 'gis-wkt-functions'),
(374, 'RIGHT', 33, 'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str.\n', 'mysql> SELECT RIGHT(''foobarbar'', 4);\n        -> ''rbar''\n', 'string-functions'),
(375, 'DATEDIFF', 28, 'Syntax:\nDATEDIFF(expr,expr2)\n\nDATEDIFF() returns the number of days between the start date expr and\nthe end date expr2. expr and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n', 'mysql> SELECT DATEDIFF(''1997-12-31 23:59:59'',''1997-12-30'');\n        -> 1\nmysql> SELECT DATEDIFF(''1997-11-30 23:59:59'',''1997-12-31'');\n        -> -31\n', 'date-and-time-functions');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(376, 'DROP PROCEDURE', 35, 'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. As of MySQL 5.0.3,\nyou must have the ALTER ROUTINE privilege for the routine. (That\nprivilege is granted automatically to the routine creator.)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n', '', 'drop-procedure'),
(377, 'CHECK TABLE', 19, 'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nMyISAM, InnoDB, and (as of MySQL 5.0.16) ARCHIVE tables. For MyISAM\ntables, the key statistics are updated as well.\n\nAs of MySQL 5.0.2, CHECK TABLE can also check views for problems, such\nas tables that are referenced in the view definition that no longer\nexist.\n', '', 'check-table'),
(378, 'BIN', 33, 'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n', 'mysql> SELECT BIN(12);\n        -> ''1100''\n', 'string-functions'),
(379, 'CASE FUNCTION', 6, 'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n', 'mysql> SELECT CASE 1 WHEN 1 THEN ''one''\n    ->     WHEN 2 THEN ''two'' ELSE ''more'' END;\n        -> ''one''\nmysql> SELECT CASE WHEN 1>0 THEN ''true'' ELSE ''false'' END;\n        -> ''true''\nmysql> SELECT CASE BINARY ''B''\n    ->     WHEN ''a'' THEN 1 WHEN ''b'' THEN 2 END;\n        -> NULL\n', 'control-flow-functions'),
(380, 'DECLARE CURSOR', 35, 'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor. Multiple cursors may be declared in a\nroutine, but each cursor in a given block must have a unique name.\n\nThe SELECT statement cannot have an INTO clause.\n', '', 'declare-cursors'),
(381, 'MULTILINESTRING', 22, 'MultiLineString(ls1,ls2,...)\n\nConstructs a WKB MultiLineString value using WKB LineString arguments.\nIf any argument is not a WKB LineString, the return value is NULL.\n', '', 'gis-mysql-specific-functions'),
(382, 'LOAD DATA', 25, 'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE ''file_name''\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [FIELDS\n        [TERMINATED BY ''string'']\n        [[OPTIONALLY] ENCLOSED BY ''char'']\n        [ESCAPED BY ''char'']\n    ]\n    [LINES\n        [STARTING BY ''string'']\n        [TERMINATED BY ''string'']\n    ]\n    [IGNORE number LINES]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...)]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. The filename must be given as a literal string.\n\nThe syntax for the FIELDS and LINES clauses also applies to the SELECT\n... INTO OUTFILE statement, as described later in this section. (See\nalso [select].)\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see [insert-speed].\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput.\n\nNote that it is currently not possible to load data files that use the\nucs2 character set.\n\nAs of MySQL 5.0.19, the character_set_filesystem system variable\ncontrols the interpretation of the filename.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See [mysqlimport].\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table.\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. Using this option affects the performance of\nLOAD DATA a bit, even if no other thread is using the table at the same\ntime.\n\nThe LOCAL keyword, if specified, is interpreted with respect to the\nclient end of the connection:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  pathname to specify its exact location. If given as a relative\n  pathname, the name is interpreted relative to the directory in which\n  the client program was started.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the filename is an absolute pathname, the server uses it as\n    given.\n\n  o If the filename is a relative pathname with one or more leading\n    components, the server searches for the file relative to the\n    server''s data directory.\n\n  o If a filename with no leading components is given, the server looks\n    for the file in the database directory of the default database.\n\nNote that, in the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server''s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE ''data.txt'' INTO TABLE db2.my_table;\n\nWindows pathnames are specified using forward slashes rather than\nbackslashes. If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See [privileges-provided].\n', '', 'load-data'),
(383, 'LOCALTIME', 28, 'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n', '', 'date-and-time-functions'),
(384, 'MPOINTFROMTEXT', 3, 'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n', '', 'gis-wkt-functions'),
(385, 'BLOB', 20, 'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n', '', 'string-type-overview'),
(386, 'PASSWORD', 10, 'Syntax:\nPASSWORD(str)\n\nCalculates and returns a password string from the plaintext password\nstr and returns a binary string, or NULL if the argument was NULL. This\nis the function that is used for encrypting MySQL passwords for storage\nin the Password column of the user grant table.\n', 'mysql> SELECT PASSWORD(''badpwd'');\n        -> ''*AAB3E285149C0135D51A520E1940DD3263DC008C''\n', 'encryption-functions'),
(387, 'CHAR', 20, '[NATIONAL] CHAR(M) [BINARY | ASCII | UNICODE]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length. The range\nof M is 0 to 255 characters.\n\nNote: Trailing spaces are removed when CHAR values are retrieved.\n\nBefore MySQL 5.0.3, a CHAR column with a length specification greater\nthan 255 is converted to the smallest TEXT type that can hold values of\nthe given length. For example, CHAR(500) is converted to TEXT, and\nCHAR(200000) is converted to MEDIUMTEXT. This is a compatibility\nfeature. However, this conversion causes the column to become a\nvariable-length column, and also affects trailing-space removal.\n\nIn MySQL 5.0.3 and later, if you attempt to set the length of a CHAR\ngreater than 255, the CREATE TABLE or ALTER TABLE statement in which\nthis is done fails with an error:\n\nmysql> CREATE TABLE c1 (col1 INT, col2 CHAR(500));\nERROR 1074 (42000): Column length too big for column ''col'' (max = 255);\nuse BLOB or TEXT instead\nmysql> SHOW CREATE TABLE c1;\nERROR 1146 (42S02): Table ''test.c1'' doesn''t exist\n', '', 'string-type-overview'),
(388, 'UTC_DATE', 28, 'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in ''YYYY-MM-DD'' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n', 'mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> ''2003-08-14'', 20030814\n', 'date-and-time-functions'),
(389, 'DIMENSION', 32, 'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in\n[gis-class-geometry].\n', 'mysql> SELECT Dimension(GeomFromText(''LineString(1 1,2 2)''));\n+------------------------------------------------+\n| Dimension(GeomFromText(''LineString(1 1,2 2)'')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n', 'general-geometry-property-functions'),
(390, 'COUNT DISTINCT', 14, 'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of different non-NULL values.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n', 'mysql> SELECT COUNT(DISTINCT results) FROM student;\n', 'group-by-functions'),
(391, 'BIT', 20, 'BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nThis data type was added in MySQL 5.0.3 for MyISAM, and extended in\n5.0.5 to MEMORY, InnoDB, and BDB. Before 5.0.3, BIT is a synonym for\nTINYINT(1).\n', '', 'numeric-type-overview'),
(392, 'EQUALS', 26, 'Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n', '', 'functions-that-test-spatial-relationships-between-geometries'),
(393, 'SHOW CREATE VIEW', 25, 'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows a CREATE VIEW statement that creates the given\nview.\n', '', 'show-create-view'),
(394, 'INTERVAL', 17, 'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n', 'mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n', 'comparison-operators'),
(395, 'FROM_DAYS', 28, 'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n', 'mysql> SELECT FROM_DAYS(729669);\n        -> ''1997-10-07''\n', 'date-and-time-functions'),
(396, 'ALTER PROCEDURE', 35, 'Syntax:\nALTER {PROCEDURE | FUNCTION} sp_name [characteristic ...]\n\ncharacteristic:\n    { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT ''string''\n\nThis statement can be used to change the characteristics of a stored\nprocedure or function. As of MySQL 5.0.3, you must have the ALTER\nROUTINE privilege for the routine. (That privilege is granted\nautomatically to the routine creator.) If binary logging is enabled,\nthis statement might also require the SUPER privilege, as described in\n[stored-procedure-logging].\n\nMore than one change may be specified in an ALTER PROCEDURE or ALTER\nFUNCTION statement.\n', '', 'alter-procedure'),
(397, 'BIT_COUNT', 18, 'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n', 'mysql> SELECT BIT_COUNT(29), BIT_COUNT(b''101010'');\n        -> 4, 3\n', 'bit-functions'),
(398, 'UTC_TIMESTAMP', 28, 'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in ''YYYY-MM-DD\nHH:MM:SS'' or YYYYMMDDHHMMSS format, depending on whether the function\nis used in a string or numeric context.\n', 'mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> ''2003-08-14 18:08:04'', 20030814180804\n', 'date-and-time-functions'),
(399, '+', 4, 'Syntax:\n+\n\nAddition:\n', 'mysql> SELECT 3+5;\n        -> 8\n', 'arithmetic-functions'),
(400, 'INET_NTOA', 13, 'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric network address (4 or 8 byte), returns the dotted-quad\nrepresentation of the address as a string.\n', 'mysql> SELECT INET_NTOA(3520061480);\n        -> ''209.207.224.40''\n', 'miscellaneous-functions'),
(401, 'ACOS', 4, 'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n', 'mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n', 'mathematical-functions'),
(402, 'ISOLATION', 7, 'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n{ READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE }\n\nThis statement sets the transaction isolation level for the next\ntransaction, globally, or for the current session.\n\nThe default behavior of SET TRANSACTION is to set the isolation level\nfor the next (not yet started) transaction. If you use the GLOBAL\nkeyword, the statement sets the default transaction level globally for\nall new connections created from that point on. Existing connections\nare unaffected. You need the SUPER privilege to do this. Using the\nSESSION keyword sets the default transaction level for all future\ntransactions performed on the current connection.\n\nFor descriptions of each InnoDB transaction isolation level, see\n[innodb-transaction-isolation]. InnoDB supports each of these levels in\nMySQL 5.0. The default level is REPEATABLE READ.\n\nTo set the initial default global isolation level for mysqld, use the\n--transaction-isolation option. See [server-options].\n', '', 'set-transaction'),
(403, 'CEILING', 4, 'Syntax:\nCEILING(X), CEIL(X)\n\nReturns the smallest integer value not less than X.\n', 'mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEIL(-1.23);\n        -> -1\n', 'mathematical-functions'),
(404, 'SIN', 4, 'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n', 'mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n', 'mathematical-functions'),
(405, 'DAYOFWEEK', 28, 'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n', 'mysql> SELECT DAYOFWEEK(''1998-02-03'');\n        -> 3\n', 'date-and-time-functions'),
(406, 'LINEFROMWKB', 29, 'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n', '', 'gis-wkb-functions'),
(407, 'SHOW PROCESSLIST', 25, 'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information using the mysqladmin processlist command. If you have\nthe SUPER privilege, you can see all threads. Otherwise, you can see\nonly your own threads (that is, threads associated with the MySQL\naccount that you are using). See [kill]. If you do not use the FULL\nkeyword, only the first 100 characters of each statement are shown in\nthe Info field.\n', '', 'show-processlist'),
(408, 'GEOMETRYTYPE', 32, 'GeometryType(g)\n\nReturns as a string the name of the geometry type of which the geometry\ninstance g is a member. The name corresponds to one of the instantiable\nGeometry subclasses.\n', 'mysql> SELECT GeometryType(GeomFromText(''POINT(1 1)''));\n+------------------------------------------+\n| GeometryType(GeomFromText(''POINT(1 1)'')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n', 'general-geometry-property-functions'),
(409, 'CREATE VIEW', 36, 'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement creates a new view, or replaces an existing one if the\nOR REPLACE clause is given. The select_statement is a SELECT statement\nthat provides the definition of the view. The statement can select from\nbase tables or other views.\n\nThis statement requires the CREATE VIEW privilege for the view, and\nsome privilege for each column selected by the SELECT statement. For\ncolumns used elsewhere in the SELECT statement you must have the SELECT\nprivilege. If the OR REPLACE clause is present, you must also have the\nDROP privilege for the view.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it.\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nBase tables and views share the same namespace within a database, so a\ndatabase cannot contain a base table and a view that have the same\nname.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Within a stored routine, the definition cannot refer to routine\n  parameters or local variables.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. To check a view definition for\n  problems of this kind, use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no The tables named in the view definition must already exist.\n\no You cannot associate a trigger with a view.\n\nORDER BY is allowed in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nmysql> CREATE VIEW v AS SELECT CHARSET(CHAR(65)), COLLATION(CHAR(65));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SET NAMES ''latin1'';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT * FROM v;\n+-------------------+---------------------+\n| CHARSET(CHAR(65)) | COLLATION(CHAR(65)) |\n+-------------------+---------------------+\n| latin1            | latin1_swedish_ci   |\n+-------------------+---------------------+\n1 row in set (0.00 sec)\n\nmysql> SET NAMES ''utf8'';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT * FROM v;\n+-------------------+---------------------+\n| CHARSET(CHAR(65)) | COLLATION(CHAR(65)) |\n+-------------------+---------------------+\n| utf8              | utf8_general_ci     |\n+-------------------+---------------------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at view invocation time. They were\naddded in MySQL 5.0.13, but have no effect until MySQL 5.0.16.\n\nCURRENT_USER also can be given as CURRENT_USER().\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine creator. This also\naffects a view defined within such a routine, if the view definition\ncontains a DEFINER value of CURRENT_USER.\n\nThe default DEFINER value is the user who executes the CREATE VIEW\nstatement. (This is the same as DEFINER = CURRENT_USER.) If a user\nvalue is given, it should be a MySQL account in ''user_name''@''host_name''\nformat (the same format used in the GRANT statement). The user_name and\nhost_name values both are required.\n\nIf you specify the DEFINER clause, you cannot set the value to any user\nbut your own unless you have the SUPER privilege. These rules determine\nthe legal DEFINER user values:\n\no If you do not have the SUPER privilege, the only legal user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  legal account name. If the account does not actually exist, a warning\n  is generated.\n\nThe SQL SECURITY characteristic determines which MySQL account to use\nwhen checking access privileges for the view when the view is executed.\nThe legal characteristic values are DEFINER and INVOKER. These indicate\nthat the view must be executable by the user who defined it or invoked\nit, respectively. The default SQL SECURITY value is DEFINER.\n\nAs of MySQL 5.0.16 (when the DEFINER and SQL SECURITY clauses were\nimplemented), view privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to a stored function, only the\n  privileges needed to invoke the function can be checked. The\n  privileges required when the function runs can be checked only as it\n  executes: For different invocations of the function, different\n  execution paths within the function might be taken.\n\no At view execution time, privileges for objects accessed by the view\n  are checked against the privileges held by the view creator or\n  invoker, depending on whether the SQL SECURITY characteristic is\n  DEFINER or INVOKER, respectively.\n\no If view execution causes execution of a stored function, privilege\n  checking for statements executed within the function depend on\n  whether the function is defined with a SQL SECURITY characteristic of\n  DEFINER or INVOKER. If the security characteristic is DEFINER, the\n  function runs with the privileges of its creator. If the\n  characteristic is INVOKER, the function runs with the privileges\n  determined by the view''s SQL SECURITY characteristic.\n\nPrior to MySQL 5.0.16 (before the DEFINER and SQL SECURITY clauses were\nimplemented), privileges required for objects used in a view are\nchecked at view creation time.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges need to be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the function\nf() and the view v.\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY INVOKER.\n\nIf you invoke a view that was created before MySQL 5.0.13, it is\ntreated as though it was created with a SQL SECURITY INVOKER clause and\nwith a DEFINER value that is the same as your account. However, because\nthe actual definer is unknown, MySQL issues a warning. To make the\nwarning go away, it is sufficient to re-create the view so that the\nview definition includes a DEFINER clause.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL.\nALGORITHM takes three values: MERGE, TEMPTABLE, or UNDEFINED. The\ndefault algorithm is UNDEFINED if no ALGORITHM clause is present. The\nalgorithm affects how MySQL processes the view.\n\nFor MERGE, the text of a statement that refers to the view and the view\ndefinition are merged such that parts of the view definition replace\ncorresponding parts of the statement.\n\nFor TEMPTABLE, the results from the view are retrieved into a temporary\ntable, which then is used to execute the statement.\n\nFor UNDEFINED, MySQL chooses which algorithm to use. It prefers MERGE\nover TEMPTABLE if possible, because MERGE is usually more efficient and\nbecause a view cannot be updatable if a temporary table is used.\n\nA reason to choose TEMPTABLE explicitly is that locks can be released\non underlying tables after the temporary table has been created and\nbefore it is used to finish processing the statement. This might result\nin quicker lock release than the MERGE algorithm so that other clients\nthat use the view are not blocked as long.\n\nA view algorithm can be UNDEFINED for three reasons:\n\no No ALGORITHM clause is present in the CREATE VIEW statement.\n\no The CREATE VIEW statement has an explicit ALGORITHM = UNDEFINED\n  clause.\n\no ALGORITHM = MERGE is specified for a view that can be processed only\n  with a temporary table. In this case, MySQL generates a warning and\n  sets the algorithm to UNDEFINED.\n\nAs mentioned earlier, MERGE is handled by merging corresponding parts\nof a view definition into the statement that refers to the view. The\nfollowing examples briefly illustrate how the MERGE algorithm works.\nThe examples assume that there is a view v_merge that has this\ndefinition:\n\nCREATE ALGORITHM = MERGE VIEW v_merge (vc1, vc2) AS\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 1: Suppose that we issue this statement:\n\nSELECT * FROM v_merge;\n\nMySQL handles the statement as follows:\n\no v_merge becomes t\n\no * becomes vc1, vc2, which corresponds to c1, c2\n\no The view WHERE clause is added\n\nThe resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 2: Suppose that we issue this statement:\n\nSELECT * FROM v_merge WHERE vc1 < 100;\n\nThis statement is handled similarly to the previous one, except that\nvc1 < 100 becomes c1 < 100 and the view WHERE clause is added to the\nstatement WHERE clause using an AND connective (and parentheses are\nadded to make sure the parts of the clause are executed with correct\nprecedence). The resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE (c3 > 100) AND (c1 < 100);\n\nEffectively, the statement to be executed has a WHERE clause of this\nform:\n\nWHERE (select WHERE) AND (view WHERE)\n\nThe MERGE algorithm requires a one-to relationship between the rows in\nthe view and the rows in the underlying table. If this relationship\ndoes not hold, a temporary table must be used instead. Lack of a\none-to-one relationship occurs if the view contains any of a number of\nconstructs:\n\no Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)\n\no DISTINCT\n\no GROUP BY\n\no HAVING\n\no UNION or UNION ALL\n\no Refers only to literal values (in this case, there is no underlying\n  table)\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to relationship\nbetween the rows in the view and the rows in the underlying table.\nThere are also certain other constructs that make a view non-updatable.\nTo be more specific, a view is not updatable if it contains any of the\nfollowing:\n\no Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)\n\no DISTINCT\n\no GROUP BY\n\no HAVING\n\no UNION or UNION ALL\n\no Subquery in the select list\n\no Join\n\no Non-updatable view in the FROM clause\n\no A subquery in the WHERE clause that refers to a table in the FROM\n  clause\n\no Refers only to literal values (in this case, there is no underlying\n  table to update)\n\no ALGORITHM = TEMPTABLE (use of a temporary table always makes a view\n  non-updatable)\n\nWith respect to insertability (being updatable with INSERT statements),\nan updatable view is insertable if it also satisfies these additional\nrequirements for the view columns:\n\no There must be no duplicate view column names.\n\no The view must contain all columns in the base table that do not have\n  a default value.\n\no The view columns must be simple column references and not derived\n  columns. A derived column is one that is not a simple column\n  reference but is derived from an expression. These are examples of\n  derived columns:\n\n3.14159\ncol1 + 3\nUPPER(col2)\ncol3 / col4\n(subquery)\n\nA view that has a mix of simple column references and derived columns\nis not insertable, but it can be updatable if you update only those\ncolumns that are not derived. Consider this view:\n\nCREATE VIEW v AS SELECT col1, 1 AS col2 FROM t;\n\nThis view is not insertable because col2 is derived from an expression.\nBut it is updatable if the update does not try to update col2. This\nupdate is allowable:\n\nUPDATE v SET col1 = 0;\n\nThis update is not allowable because it attempts to update a derived\ncolumn:\n\nUPDATE v SET col2 = 0;\n\nIt is sometimes possible for a multiple-table view to be updatable,\nassuming that it can be processed with the MERGE algorithm. For this to\nwork, the view must use an inner join (not an outer join or a UNION).\nAlso, only a single table in the view definition can be updated, so the\nSET clause must name only columns from one of the tables in the view.\nViews that use UNION ALL are disallowed even though they might be\ntheoretically updatable, because the implementation uses temporary\ntables to process them.\n\nFor a multiple-table updatable view, INSERT can work if it inserts into\na single table. DELETE is not supported.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n', '', 'create-view'),
(410, 'TRIM', 33, 'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM(remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n', 'mysql> SELECT TRIM(''  bar   '');\n        -> ''bar''\nmysql> SELECT TRIM(LEADING ''x'' FROM ''xxxbarxxx'');\n        -> ''barxxx''\nmysql> SELECT TRIM(BOTH ''x'' FROM ''xxxbarxxx'');\n        -> ''bar''\nmysql> SELECT TRIM(TRAILING ''xyz'' FROM ''barxxyz'');\n        -> ''barx''\n', 'string-functions'),
(411, 'IS', 17, 'Syntax:\nIS boolean_value, IS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n', 'mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\nmysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n', 'comparison-operators'),
(412, 'GET_FORMAT', 28, 'Syntax:\nGET_FORMAT(DATE|TIME|DATETIME, ''EUR''|''USA''|''JIS''|''ISO''|''INTERNAL'')\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n', 'mysql> SELECT DATE_FORMAT(''2003-10-03'',GET_FORMAT(DATE,''EUR''));\n        -> ''03.10.2003''\nmysql> SELECT STR_TO_DATE(''10.31.2003'',GET_FORMAT(DATE,''USA''));\n        -> ''2003-10-31''\n', 'date-and-time-functions'),
(413, 'TINYBLOB', 20, 'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes.\n', '', 'string-type-overview'),
(414, 'SAVEPOINT', 7, 'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO SAVEPOINT identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT and ROLLBACK TO SAVEPOINT.\nStarting from MySQL 5.0.3, RELEASE SAVEPOINT and the optional WORK\nkeyword for ROLLBACK are supported as well.\n', '', 'savepoints'),
(415, 'USER', 15, 'Syntax:\nUSER()\n\nReturns the current MySQL username and hostname as a string in the utf8\ncharacter set.\n', 'mysql> SELECT USER();\n        -> ''davida@localhost''\n', 'information-functions'),
(416, 'MPOINTFROMWKB', 29, 'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n', '', 'gis-wkb-functions'),
(417, 'ALTER TABLE', 36, 'Syntax:\nALTER [IGNORE] TABLE tbl_name\n    alter_specification [, alter_specification] ...\n\nalter_specification:\n    ADD [COLUMN] column_definition [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (column_definition,...)\n  | ADD INDEX [index_name] [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        PRIMARY KEY [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX] [index_name] [index_type] (index_col_name,...)\n  | ADD [FULLTEXT|SPATIAL] [INDEX] [index_name] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        [reference_definition]\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] column_definition [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP INDEX index_name\n  | DROP FOREIGN KEY fk_symbol\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO] new_tbl_name\n  | ORDER BY col_name\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET charset_name [COLLATE collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | table_options\n\nALTER TABLE enables you to change the structure of an existing table.\nFor example, you can add or delete columns, create or destroy indexes,\nchange the type of existing columns, or rename columns or the table\nitself. You can also change the comment for the table and type of the\ntable.\n', '', 'alter-table'),
(418, 'PURGE MASTER LOGS', 25, 'Syntax:\nPURGE {MASTER | BINARY} LOGS TO ''log_name''\nPURGE {MASTER | BINARY} LOGS BEFORE ''date''\n\nDeletes all the binary logs listed in the log index prior to the\nspecified log or date. The logs also are removed from the list recorded\nin the log index file, so that the given log becomes the first.\n', 'PURGE MASTER LOGS TO ''mysql-bin.010'';\nPURGE MASTER LOGS BEFORE ''2003-04-02 22:46:26'';\n', 'purge-master-logs'),
(419, 'CHAR BYTE', 20, 'The CHAR BYTE data type is an alias for the BINARY type. This is a\ncompatibility feature.\n', '', 'string-type-overview'),
(420, 'REPAIR TABLE', 19, 'Syntax:\nREPAIR [LOCAL | NO_WRITE_TO_BINLOG] TABLE\n    tbl_name [, tbl_name] ... [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table. By default, it has the\nsame effect as myisamchk --recover tbl_name. REPAIR TABLE works for\nMyISAM and for ARCHIVE tables. See [myisam-storage-engine], and\n[archive-storage-engine].\n', '', 'repair-table'),
(421, 'MERGE', 36, 'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n"Identical" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See [myisampack]. Differences\nin table options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n', 'mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (''Testing''),(''table''),(''t1'');\nmysql> INSERT INTO t2 (message) VALUES (''Testing''),(''table''),(''t2'');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n', 'merge-storage-engine'),
(422, 'CREATE TABLE', 36, 'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options] [select_statement]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(] LIKE old_tbl_name [)];\n\ncreate_definition:\n    column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n  | KEY [index_name] [index_type] (index_col_name,...)\n  | INDEX [index_name] [index_type] (index_col_name,...)\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX]\n        [index_name] [index_type] (index_col_name,...)\n  | [FULLTEXT|SPATIAL] [INDEX] [index_name] (index_col_name,...)\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n        [index_name] (index_col_name,...) [reference_definition]\n  | CHECK (expr)\n\ncolumn_definition:\n    col_name type [NOT NULL | NULL] [DEFAULT default_value]\n        [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n        [COMMENT ''string''] [reference_definition]\n\ntype:\n    TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL(length,decimals) [UNSIGNED] [ZEROFILL]\n  | NUMERIC(length,decimals) [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR(length) [BINARY | ASCII | UNICODE]\n  | VARCHAR(length) [BINARY]\n  | BINARY(length)\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n  | TEXT [BINARY]\n  | MEDIUMTEXT [BINARY]\n  | LONGTEXT [BINARY]\n  | ENUM(value1,value2,value3,...)\n  | SET(value1,value2,value3,...)\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nreference_definition:\n    REFERENCES tbl_name [(index_col_name,...)]\n               [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n               [ON DELETE reference_option]\n               [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_options: table_option [table_option] ...\n\ntable_option:\n    {ENGINE|TYPE} [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET charset_name [COLLATE collation_name]\n  | CHECKSUM [=] {0 | 1}\n  | COMMENT [=] ''string''\n  | CONNECTION [=] ''connect_string''\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] ''string''\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | UNION [=] (tbl_name[,tbl_name]...)\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | DATA DIRECTORY [=] ''absolute path to directory''\n  | INDEX DIRECTORY [=] ''absolute path to directory''\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some legal select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for allowable table names are given in [legal-names]. By default,\nthe table is created in the default database. An error occurs if the\ntable exists, if there is no default database, or if the database does\nnot exist.\n', '', 'create-table'),
(423, '>', 17, 'Syntax:\n>\n\nGreater than:\n', 'mysql> SELECT 2 > 2;\n        -> 0\n', 'comparison-operators'),
(424, 'ANALYZE TABLE', 19, 'Syntax:\nANALYZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock. This\nstatement works with MyISAM, BDB, and InnoDB tables. For MyISAM tables,\nthis statement is equivalent to using myisamchk -a.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant.\n', '', 'analyze-table'),
(425, 'MICROSECOND', 28, 'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n', 'mysql> SELECT MICROSECOND(''12:00:00.123456'');\n        -> 123456\nmysql> SELECT MICROSECOND(''1997-12-31 23:59:59.000010'');\n        -> 10\n', 'date-and-time-functions'),
(426, 'CONSTRAINT', 36, 'InnoDB also supports foreign key constraints. The syntax for a foreign\nkey constraint definition in InnoDB looks like this:\n\n[CONSTRAINT symbol] FOREIGN KEY [id] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name, ...)\n    [ON DELETE {RESTRICT | CASCADE | SET NULL | NO ACTION}]\n    [ON UPDATE {RESTRICT | CASCADE | SET NULL | NO ACTION}]\n', 'CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) ENGINE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                      PRIMARY KEY (id)) ENGINE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                      product_category INT NOT NULL,\n                      product_id INT NOT NULL,\n                      customer_id INT NOT NULL,\n                      PRIMARY KEY(no),\n                      INDEX (product_category, product_id),\n                      FOREIGN KEY (product_category, product_id)\n                        REFERENCES product(category, id)\n                        ON UPDATE CASCADE ON DELETE RESTRICT,\n                      INDEX (customer_id),\n                      FOREIGN KEY (customer_id)\n                        REFERENCES customer(id)) ENGINE=INNODB;\n', 'innodb-foreign-key-constraints'),
(427, 'FIELD', 33, 'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n', 'mysql> SELECT FIELD(''ej'', ''Hej'', ''ej'', ''Heja'', ''hej'', ''foo'');\n        -> 2\nmysql> SELECT FIELD(''fo'', ''Hej'', ''ej'', ''Heja'', ''hej'', ''foo'');\n        -> 0\n', 'string-functions'),
(428, 'MAKETIME', 28, 'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n', 'mysql> SELECT MAKETIME(12,15,30);\n        -> ''12:15:30''\n', 'date-and-time-functions'),
(429, 'CURDATE', 28, 'Syntax:\nCURDATE()\n\nReturns the current date as a value in ''YYYY-MM-DD'' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n', 'mysql> SELECT CURDATE();\n        -> ''1997-12-15''\nmysql> SELECT CURDATE() + 0;\n        -> 19971215\n', 'date-and-time-functions'),
(430, 'MIN MAX', 14, 'Syntax:\nMIN([DISTINCT] expr), MAX([DISTINCT] expr)\n\nReturns the minimum or maximum value of expr. MIN() and MAX() may take\na string argument; in such cases they return the minimum or maximum\nstring value. See [mysql-indexes]. The DISTINCT keyword can be used to\nfind the minimum or maximum of the distinct values of expr, however,\nthis produces the same result as omitting DISTINCT.\n\nMIN() and MAX() return NULL if there were no matching rows.\n', 'mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n', 'group-by-functions'),
(431, 'SET PASSWORD', 8, 'Syntax:\nSET PASSWORD = PASSWORD(''some password'')\nSET PASSWORD FOR user = PASSWORD(''some password'')\n\nThe SET PASSWORD statement assigns a password to an existing MySQL user\naccount.\n\nThe first syntax sets the password for the current user. Any client\nthat has connected to the server using a non-anonymous account can\nchange the password for that account.\n\nThe second syntax sets the password for a specific account on the\ncurrent server host. Only clients that have the UPDATE privilege for\nthe mysql database can do this. The user value should be given in\nuser_name@host_name format, where user_name and host_name are exactly\nas they are listed in the User and Host columns of the mysql.user table\nentry. For example, if you had an entry with User and Host column\nvalues of ''bob'' and ''%.loc.gov'', you would write the statement like\nthis:\n\nSET PASSWORD FOR ''bob''@''%.loc.gov'' = PASSWORD(''newpass'');\n', '', 'set-password'),
(432, 'ENUM', 20, 'ENUM(''value1'',''value2'',...)\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values ''value1'', ''value2'', ..., NULL or the special ''''\nerror value. An ENUM column can have a maximum of 65,535 distinct\nvalues. ENUM values are represented internally as integers.\n', '', 'string-type-overview'),
(433, 'IF FUNCTION', 6, 'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n', 'mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,''yes'',''no'');\n        -> ''yes''\nmysql> SELECT IF(STRCMP(''test'',''test1''),''no'',''yes'');\n        -> ''no''\n', 'control-flow-functions'),
(434, 'DATABASE', 15, 'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n', 'mysql> SELECT DATABASE();\n        -> ''test''\n', 'information-functions'),
(435, 'POINTFROMWKB', 29, 'PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n', '', 'gis-wkb-functions'),
(436, 'POWER', 4, 'Syntax:\nPOW(X,Y), POWER(X,Y)\n\nReturns the value of X raised to the power of Y.\n', 'mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n', 'mathematical-functions'),
(437, 'ATAN', 4, 'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n', 'mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n', 'mathematical-functions'),
(438, 'STRCMP', 33, 'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n', 'mysql> SELECT STRCMP(''text'', ''text2'');\n        -> -1\nmysql> SELECT STRCMP(''text2'', ''text'');\n        -> 1\nmysql> SELECT STRCMP(''text'', ''text'');\n        -> 0\n', 'string-comparison-functions');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(439, 'INSERT DELAYED', 25, 'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\nNote that INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, and ARCHIVE tables.\n  See [myisam-storage-engine], [memory-storage-engine], and\n  [archive-storage-engine].\n\n  For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT DELAYED ... SELECT\n  statements.\n\no The server ignores DELAYED for INSERT ... SELECT or INSERT ... ON\n  DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no DELAYED is ignored on slave replication servers because it could\n  cause the slave to have different data than the master.\n', '', 'insert-delayed'),
(440, 'MEDIUMTEXT', 20, 'MEDIUMTEXT\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\n', '', 'string-type-overview'),
(441, 'LN', 4, 'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\n', 'mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n', 'mathematical-functions'),
(442, 'SHOW COLLATION', 25, 'Syntax:\nSHOW COLLATION [LIKE ''pattern'']\n\nThe output from SHOW COLLATION includes all available character sets.\nIt takes an optional LIKE clause whose pattern indicates which\ncollation names to match. For example:\n\nmysql> SHOW COLLATION LIKE ''latin1%'';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n', '', 'show-collation'),
(443, 'LOG', 4, 'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X.\n', 'mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n', 'mathematical-functions'),
(444, 'SET SQL_LOG_BIN', 25, 'Syntax:\nSET SQL_LOG_BIN = {0|1}\n\nDisables or enables binary logging for the current connection\n(SQL_LOG_BIN is a session variable) if the client has the SUPER\nprivilege. The statement is refused with an error if the client does\nnot have that privilege.\n', '', 'set-sql-log-bin'),
(445, '!=', 17, 'Syntax:\n<>, !=\n\nNot equal:\n', 'mysql> SELECT ''.01'' <> ''0.01'';\n        -> 1\nmysql> SELECT .01 <> ''0.01'';\n        -> 0\nmysql> SELECT ''zapp'' <> ''zappp'';\n        -> 1\n', 'comparison-operators'),
(446, 'WHILE', 35, 'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition is true. statement_list consists of one or more\nstatements.\n\nA WHILE statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n', 'CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND\n', 'while-statement'),
(447, 'AES_DECRYPT', 10, 'Syntax:\nAES_ENCRYPT(str,key_str), AES_DECRYPT(crypt_str,key_str)\n\nThese functions allow encryption and decryption of data using the\nofficial AES (Advanced Encryption Standard) algorithm, previously known\nas "Rijndael." Encoding with a 128-bit key length is used, but you can\nextend it up to 256 bits by modifying the source. We chose 128 bits\nbecause it is much faster and it is secure enough for most purposes.\n\nAES_ENCRYPT() encrypts a string and returns a binary string.\nAES_DESCRIPT() descrypts the encrypted string and returns the original\nstring. The input arguments may be any length. If either argument is\nNULL, the result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode\nuneven length strings and so the result string length may be calculated\nusing this formula:\n\n16 Ã— (trunc(string_length / 16) + 1)\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n', 'INSERT INTO t VALUES (1,AES_ENCRYPT(''text'',''password''));\n', 'encryption-functions'),
(448, 'DAYNAME', 28, 'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date.\n', 'mysql> SELECT DAYNAME(''1998-02-05'');\n        -> ''Thursday''\n', 'date-and-time-functions'),
(449, 'COERCIBILITY', 15, 'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n', 'mysql> SELECT COERCIBILITY(''abc'' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(''abc'');\n        -> 4\n', 'information-functions'),
(450, 'INT', 20, 'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n', '', 'numeric-type-overview'),
(451, 'GLENGTH', 11, 'GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n', 'mysql> SET @ls = ''LineString(1 1,2 2,3 3)'';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n', 'linestring-property-functions'),
(452, 'RADIANS', 4, 'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nÏ€ radians equals 180 degrees.)\n', 'mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n', 'mathematical-functions'),
(453, 'COLLATION', 15, 'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n', 'mysql> SELECT COLLATION(''abc'');\n        -> ''latin1_swedish_ci''\nmysql> SELECT COLLATION(_utf8''abc'');\n        -> ''utf8_general_ci''\n', 'information-functions'),
(454, 'COALESCE', 17, 'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n', 'mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n', 'comparison-operators'),
(455, 'VERSION', 15, 'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set.\n', 'mysql> SELECT VERSION();\n        -> ''5.0.19-standard''\n', 'information-functions'),
(456, 'MAKE_SET', 33, 'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by `,''\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n', 'mysql> SELECT MAKE_SET(1,''a'',''b'',''c'');\n        -> ''a''\nmysql> SELECT MAKE_SET(1 | 4,''hello'',''nice'',''world'');\n        -> ''hello,world''\nmysql> SELECT MAKE_SET(1 | 4,''hello'',''nice'',NULL,''world'');\n        -> ''hello''\nmysql> SELECT MAKE_SET(0,''a'',''b'',''c'');\n        -> ''''\n', 'string-functions'),
(457, 'FIND_IN_SET', 33, 'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by `,'' characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (`,'') character.\n', 'mysql> SELECT FIND_IN_SET(''b'',''a,b,c,d'');\n        -> 2\n', 'string-functions');

-- --------------------------------------------------------

--
-- Structure de la table `host`
--

CREATE TABLE `host` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';

-- --------------------------------------------------------

--
-- Structure de la table `ndb_binlog_index`
--

CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `plugin`
--

CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';

-- --------------------------------------------------------

--
-- Structure de la table `proc`
--

CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';

-- --------------------------------------------------------

--
-- Structure de la table `procs_priv`
--

CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';

-- --------------------------------------------------------

--
-- Structure de la table `proxies_priv`
--

CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';

--
-- Contenu de la table `proxies_priv`
--

INSERT INTO `proxies_priv` (`Host`, `User`, `Proxied_host`, `Proxied_user`, `With_grant`, `Grantor`, `Timestamp`) VALUES
('localhost', 'root', '', '', 1, '', '2011-02-14 14:27:20');

-- --------------------------------------------------------

--
-- Structure de la table `servers`
--

CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';

-- --------------------------------------------------------

--
-- Structure de la table `slow_log`
--

CREATE TABLE `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';

-- --------------------------------------------------------

--
-- Structure de la table `tables_priv`
--

CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';

-- --------------------------------------------------------

--
-- Structure de la table `time_zone`
--

CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `time_zone_leap_second`
--

CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';

-- --------------------------------------------------------

--
-- Structure de la table `time_zone_name`
--

CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';

-- --------------------------------------------------------

--
-- Structure de la table `time_zone_transition`
--

CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';

-- --------------------------------------------------------

--
-- Structure de la table `time_zone_transition_type`
--

CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `authentication_string` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`Host`, `User`, `Password`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Create_priv`, `Drop_priv`, `Reload_priv`, `Shutdown_priv`, `Process_priv`, `File_priv`, `Grant_priv`, `References_priv`, `Index_priv`, `Alter_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_routine_priv`, `Alter_routine_priv`, `Create_user_priv`, `Event_priv`, `Trigger_priv`, `Create_tablespace_priv`, `ssl_type`, `ssl_cipher`, `x509_issuer`, `x509_subject`, `max_questions`, `max_updates`, `max_connections`, `max_user_connections`, `plugin`, `authentication_string`) VALUES
('localhost', 'root', '*81F5E21E35407D884A6CD4A731AEBFB6AF209E1B', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', ''),
('localhost', '', '', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 0, 0, 0, 0, '', ''),
('localhost', 'ushahidi', '*483EC567DF968A6AD5E279257828E7CC4A12F0C2', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 0, 0, 0, 0, '', ''),
('localhost', 'admin', '*A52FDCD7F2CC58DE2582E920FEC3F810A91C3813', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '');
--
-- Base de données: `performance_schema`
--
CREATE DATABASE `performance_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `performance_schema`;

-- --------------------------------------------------------

--
-- Structure de la table `cond_instances`
--

CREATE TABLE `cond_instances` (
  `NAME` varchar(128) NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events_waits_current`
--

CREATE TABLE `events_waits_current` (
  `THREAD_ID` int(11) NOT NULL,
  `EVENT_ID` bigint(20) unsigned NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `SOURCE` varchar(64) DEFAULT NULL,
  `TIMER_START` bigint(20) unsigned DEFAULT NULL,
  `TIMER_END` bigint(20) unsigned DEFAULT NULL,
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL,
  `SPINS` int(10) unsigned DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL,
  `OBJECT_NAME` varchar(512) DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL,
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL,
  `OPERATION` varchar(16) NOT NULL,
  `NUMBER_OF_BYTES` bigint(20) unsigned DEFAULT NULL,
  `FLAGS` int(10) unsigned DEFAULT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events_waits_history`
--

CREATE TABLE `events_waits_history` (
  `THREAD_ID` int(11) NOT NULL,
  `EVENT_ID` bigint(20) unsigned NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `SOURCE` varchar(64) DEFAULT NULL,
  `TIMER_START` bigint(20) unsigned DEFAULT NULL,
  `TIMER_END` bigint(20) unsigned DEFAULT NULL,
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL,
  `SPINS` int(10) unsigned DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL,
  `OBJECT_NAME` varchar(512) DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL,
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL,
  `OPERATION` varchar(16) NOT NULL,
  `NUMBER_OF_BYTES` bigint(20) unsigned DEFAULT NULL,
  `FLAGS` int(10) unsigned DEFAULT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events_waits_history_long`
--

CREATE TABLE `events_waits_history_long` (
  `THREAD_ID` int(11) NOT NULL,
  `EVENT_ID` bigint(20) unsigned NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `SOURCE` varchar(64) DEFAULT NULL,
  `TIMER_START` bigint(20) unsigned DEFAULT NULL,
  `TIMER_END` bigint(20) unsigned DEFAULT NULL,
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL,
  `SPINS` int(10) unsigned DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL,
  `OBJECT_NAME` varchar(512) DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL,
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL,
  `OPERATION` varchar(16) NOT NULL,
  `NUMBER_OF_BYTES` bigint(20) unsigned DEFAULT NULL,
  `FLAGS` int(10) unsigned DEFAULT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events_waits_summary_by_instance`
--

CREATE TABLE `events_waits_summary_by_instance` (
  `EVENT_NAME` varchar(128) NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL,
  `COUNT_STAR` bigint(20) unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events_waits_summary_by_thread_by_event_name`
--

CREATE TABLE `events_waits_summary_by_thread_by_event_name` (
  `THREAD_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `COUNT_STAR` bigint(20) unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `events_waits_summary_global_by_event_name`
--

CREATE TABLE `events_waits_summary_global_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL,
  `COUNT_STAR` bigint(20) unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `file_instances`
--

CREATE TABLE `file_instances` (
  `FILE_NAME` varchar(512) NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `OPEN_COUNT` int(10) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `file_summary_by_event_name`
--

CREATE TABLE `file_summary_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL,
  `COUNT_READ` bigint(20) unsigned NOT NULL,
  `COUNT_WRITE` bigint(20) unsigned NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) unsigned NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `file_summary_by_instance`
--

CREATE TABLE `file_summary_by_instance` (
  `FILE_NAME` varchar(512) NOT NULL,
  `EVENT_NAME` varchar(128) NOT NULL,
  `COUNT_READ` bigint(20) unsigned NOT NULL,
  `COUNT_WRITE` bigint(20) unsigned NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) unsigned NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mutex_instances`
--

CREATE TABLE `mutex_instances` (
  `NAME` varchar(128) NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL,
  `LOCKED_BY_THREAD_ID` int(11) DEFAULT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `performance_timers`
--

CREATE TABLE `performance_timers` (
  `TIMER_NAME` enum('CYCLE','NANOSECOND','MICROSECOND','MILLISECOND','TICK') NOT NULL,
  `TIMER_FREQUENCY` bigint(20) DEFAULT NULL,
  `TIMER_RESOLUTION` bigint(20) DEFAULT NULL,
  `TIMER_OVERHEAD` bigint(20) DEFAULT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

--
-- Contenu de la table `performance_timers`
--

INSERT INTO `performance_timers` (`TIMER_NAME`, `TIMER_FREQUENCY`, `TIMER_RESOLUTION`, `TIMER_OVERHEAD`) VALUES
('CYCLE', NULL, NULL, NULL),
('NANOSECOND', NULL, NULL, NULL),
('MICROSECOND', NULL, NULL, NULL),
('MILLISECOND', NULL, NULL, NULL),
('TICK', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rwlock_instances`
--

CREATE TABLE `rwlock_instances` (
  `NAME` varchar(128) NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) NOT NULL,
  `WRITE_LOCKED_BY_THREAD_ID` int(11) DEFAULT NULL,
  `READ_LOCKED_BY_COUNT` int(10) unsigned NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `setup_consumers`
--

CREATE TABLE `setup_consumers` (
  `NAME` varchar(64) NOT NULL,
  `ENABLED` enum('YES','NO') NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

--
-- Contenu de la table `setup_consumers`
--

INSERT INTO `setup_consumers` (`NAME`, `ENABLED`) VALUES
('events_waits_current', 'YES'),
('events_waits_history', 'YES'),
('events_waits_history_long', 'YES'),
('events_waits_summary_by_thread_by_event_name', 'YES'),
('events_waits_summary_by_event_name', 'YES'),
('events_waits_summary_by_instance', 'YES'),
('file_summary_by_event_name', 'YES'),
('file_summary_by_instance', 'YES');

-- --------------------------------------------------------

--
-- Structure de la table `setup_instruments`
--

CREATE TABLE `setup_instruments` (
  `NAME` varchar(128) NOT NULL,
  `ENABLED` enum('YES','NO') NOT NULL,
  `TIMED` enum('YES','NO') NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `setup_timers`
--

CREATE TABLE `setup_timers` (
  `NAME` varchar(64) NOT NULL,
  `TIMER_NAME` enum('CYCLE','NANOSECOND','MICROSECOND','MILLISECOND','TICK') NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

--
-- Contenu de la table `setup_timers`
--

INSERT INTO `setup_timers` (`NAME`, `TIMER_NAME`) VALUES
('wait', 'CYCLE');

-- --------------------------------------------------------

--
-- Structure de la table `threads`
--

CREATE TABLE `threads` (
  `THREAD_ID` int(11) NOT NULL,
  `PROCESSLIST_ID` int(11) DEFAULT NULL,
  `NAME` varchar(128) NOT NULL
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;
--
-- Base de données: `test`
--
CREATE DATABASE `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Structure de la table `jeux_video`
--

CREATE TABLE `jeux_video` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `possesseur` varchar(255) NOT NULL,
  `console` varchar(255) NOT NULL,
  `prix` double NOT NULL DEFAULT '0',
  `nbre_joueurs_max` int(11) NOT NULL DEFAULT '0',
  `commentaires` text NOT NULL,
  KEY `ID` (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Contenu de la table `jeux_video`
--

INSERT INTO `jeux_video` (`ID`, `nom`, `possesseur`, `console`, `prix`, `nbre_joueurs_max`, `commentaires`) VALUES
(1, 'Super Mario Bros', 'Florent', 'NES', 4, 1, 'Un jeu d''anthologie !'),
(2, 'Sonic', 'Patrick', 'Megadrive', 2, 1, 'Pour moi, le meilleur jeu du monde !'),
(3, 'Zelda : ocarina of time', 'Florent', 'Nintendo 64', 15, 1, 'Un jeu grand, beau et complet comme on en voit rarement de nos jours'),
(4, 'Mario Kart 64', 'Florent', 'Nintendo 64', 25, 4, 'Un excellent jeu de kart !'),
(5, 'Super Smash Bros Melee', 'Michel', 'GameCube', 55, 4, 'Un jeu de baston délirant !'),
(6, 'Dead or Alive', 'Patrick', 'Xbox', 60, 4, 'Le plus beau jeu de baston jamais créé'),
(7, 'Dead or Alive Xtreme Beach Volley Ball', 'Patrick', 'Xbox', 60, 4, 'Un jeu de beach volley de toute beauté o_O'),
(8, 'Enter the Matrix', 'Michel', 'PC', 45, 1, 'Plutôt bof comme jeu, mais ça complète bien le film'),
(9, 'Max Payne 2', 'Michel', 'PC', 50, 1, 'Très réaliste, une sorte de film noir sur fond d''histoire d''amour. A essayer !'),
(10, 'Yoshi''s Island', 'Florent', 'SuperNES', 6, 1, 'Le paradis des Yoshis :o)'),
(11, 'Commandos 3', 'Florent', 'PC', 44, 12, 'Un bon jeu d''action où on dirige un commando pendant la 2ème guerre mondiale !'),
(12, 'Final Fantasy X', 'Patrick', 'PS2', 40, 1, 'Encore un Final Fantasy mais celui la est encore plus beau !'),
(13, 'Pokemon Rubis', 'Florent', 'GBA', 44, 4, 'Pika-Pika-chu !!!'),
(14, 'Starcraft', 'Michel', 'PC', 19, 8, 'Le meilleur jeux pc de tout les temps !'),
(15, 'Grand Theft Auto 3', 'Michel', 'PS2', 30, 1, 'Comme dans les autres Gta on ecrase tout le monde :) .'),
(16, 'Homeworld 2', 'Michel', 'PC', 45, 6, 'Superbe ! o_O'),
(17, 'Aladin', 'Patrick', 'SuperNES', 10, 1, 'Comme le dessin Animé !'),
(18, 'Super Mario Bros 3', 'Michel', 'SuperNES', 10, 2, 'Le meilleur Mario selon moi.'),
(19, 'SSX 3', 'Florent', 'Xbox', 56, 2, 'Un très bon jeu de snow !'),
(20, 'Star Wars : Jedi outcast', 'Patrick', 'Xbox', 33, 1, 'Encore un jeu sur star-wars où on se prend pour Luke Skywalker !'),
(21, 'Actua Soccer 3', 'Patrick', 'PS', 30, 2, 'Un jeu de foot assez bof ...'),
(22, 'Time Crisis 3', 'Florent', 'PS2', 40, 1, 'Un troisième volet efficace mais pas vraiment surprenant'),
(23, 'X-FILES', 'Patrick', 'PS', 25, 1, 'Un jeu censé ressembler a la série mais assez raté ...'),
(24, 'Soul Calibur 2', 'Patrick', 'Xbox', 54, 1, 'Un jeu bien axé sur le combat'),
(25, 'Diablo', 'Florent', 'PS', 20, 1, 'Comme sur PC mais la c''est sur un ecran de télé :) !'),
(26, 'Street Fighter 2', 'Patrick', 'Megadrive', 10, 2, 'Le célèbre jeu de combat !'),
(27, 'Gundam Battle Assault 2', 'Florent', 'PS', 29, 1, 'Jeu japonais dont le gameplay est un peu limité. Peu de robots malheureusement'),
(28, 'Spider-Man', 'Florent', 'Megadrive', 15, 1, 'Vivez l''aventure de l''homme araignée'),
(29, 'Midtown Madness 3', 'Michel', 'Xbox', 59, 6, 'Dans la suite des autres versions de Midtown Madness'),
(30, 'Tetris', 'Florent', 'Gameboy', 5, 1, 'Qui ne connait pas ? '),
(31, 'The Rocketeer', 'Michel', 'NES', 2, 1, 'Un super un film et un jeu de m*rde ...'),
(32, 'Pro Evolution Soccer 3', 'Patrick', 'PS2', 59, 2, 'Un petit jeu de foot sur PS2'),
(33, 'Ice Hockey', 'Michel', 'NES', 7, 2, 'Jamais joué mais a mon avis ca parle de hockey sur glace ... =)'),
(34, 'Sydney 2000', 'Florent', 'Dreamcast', 15, 2, 'Les JO de Sydney dans votre salon !'),
(35, 'NBA 2k', 'Patrick', 'Dreamcast', 12, 2, 'A votre avis :p ?'),
(36, 'Aliens Versus Predator : Extinction', 'Michel', 'PS2', 20, 2, 'Un shoot''em up pour pc'),
(37, 'Crazy Taxi', 'Florent', 'Dreamcast', 11, 1, 'Conduite de taxi en folie !'),
(38, 'Le Maillon Faible', 'Mathieu', 'PS2', 10, 1, 'Le jeu de l''émission'),
(39, 'FIFA 64', 'Michel', 'Nintendo 64', 25, 2, 'Le premier jeu de foot sur la N64 =) !'),
(40, 'Qui Veut Gagner Des Millions', 'Florent', 'PS2', 10, 1, 'Le jeu de l''émission'),
(41, 'Monopoly', 'Sebastien', 'Nintendo 64', 21, 4, 'Bheuuu le monopoly sur N64 !'),
(42, 'Taxi 3', 'Corentin', 'PS2', 19, 4, 'Un jeu de voiture sur le film'),
(43, 'Indiana Jones Et Le Tombeau De L''Empereur', 'Florent', 'PS2', 25, 1, 'Notre aventurier préféré est de retour !!!'),
(44, 'F-ZERO', 'Mathieu', 'GBA', 25, 4, 'Un super jeu de course futuriste !'),
(45, 'Harry Potter Et La Chambre Des Secrets', 'Mathieu', 'Xbox', 30, 1, 'Abracadabra !! Le célebre magicien est de retour !'),
(46, 'Half-Life', 'Corentin', 'PC', 15, 32, 'L''autre meilleur jeu de tout les temps (surtout ses mods).'),
(47, 'Myst III Exile', 'Sébastien', 'Xbox', 49, 1, 'Un jeu de réflexion'),
(48, 'Wario World', 'Sebastien', 'Gamecube', 40, 4, 'Wario vs Mario ! Qui gagnera ! ?'),
(49, 'Rollercoaster Tycoon', 'Florent', 'Xbox', 29, 1, 'Jeu de gestion d''un parc d''attraction'),
(50, 'Splinter Cell', 'Patrick', 'Xbox', 53, 1, 'Jeu magnifique !');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Base de données: `ushahidi_db`
--
CREATE DATABASE `ushahidi_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ushahidi_db`;

-- --------------------------------------------------------

--
-- Structure de la table `actions`
--

CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(75) NOT NULL,
  `qualifiers` text NOT NULL,
  `response` varchar(75) NOT NULL,
  `response_vars` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user defined actions triggered by certain events' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `actions_log`
--

CREATE TABLE `actions_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of triggered actions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `alert`
--

CREATE TABLE `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores alerts subscribers information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `alert_category`
--

CREATE TABLE `alert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_id` (`alert_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores subscriber alert categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `alert_sent`
--

CREATE TABLE `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `alert_id` (`alert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of alerts sent out to subscribers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `api_banned`
--

CREATE TABLE `api_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='For logging banned API IP addresses' AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Structure de la table `api_log`
--

CREATE TABLE `api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) NOT NULL,
  `api_parameters` varchar(100) NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='For logging API activities' AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Structure de la table `api_settings`
--

CREATE TABLE `api_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing API logging settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `badge`
--

CREATE TABLE `badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores description of badges to be assigned' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `badge_users`
--

CREATE TABLE `badge_users` (
  `user_id` int(11) unsigned NOT NULL,
  `badge_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores assigned badge information';

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_position` tinyint(4) NOT NULL DEFAULT '0',
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_image_thumb` varchar(255) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Holds information about categories defined for a deployment' AUTO_INCREMENT=6 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `locale`, `category_position`, `category_title`, `category_description`, `category_color`, `category_image`, `category_image_thumb`, `category_visible`, `category_trusted`) VALUES
(1, 0, 'en_US', 0, 'Category 1', 'Category 1', '9900CC', NULL, NULL, 1, 0),
(2, 0, 'en_US', 1, 'Category 2', 'Category 2', '3300FF', NULL, NULL, 1, 0),
(3, 0, 'en_US', 2, 'Category 3', 'Category 3', '663300', NULL, NULL, 1, 0),
(4, 0, 'en_US', 3, 'Trusted Reports', 'Reports from trusted reporters', '339900', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `category_lang`
--

CREATE TABLE `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for category titles and descriptions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `checkin`
--

CREATE TABLE `checkin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL,
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `checkin_description` varchar(255) DEFAULT NULL,
  `checkin_date` datetime NOT NULL,
  `checkin_auto` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores checkin information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores cities of countries retrieved by user.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cluster`
--

CREATE TABLE `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information used for clustering of reports on the map.';

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `checkin_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores comments made on reports/checkins' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores a list of all countries and their capital cities' AUTO_INCREMENT=248 ;

--
-- Contenu de la table `country`
--

INSERT INTO `country` (`id`, `iso`, `country`, `capital`, `cities`) VALUES
(1, 'AD', 'Andorra', 'Andorra la Vella', 0),
(2, 'AE', 'United Arab Emirates', 'Abu Dhabi', 0),
(3, 'AF', 'Afghanistan', 'Kabul', 0),
(4, 'AG', 'Antigua and Barbuda', 'St. John''s', 0),
(5, 'AI', 'Anguilla', 'The Valley', 0),
(6, 'AL', 'Albania', 'Tirana', 0),
(7, 'AM', 'Armenia', 'Yerevan', 0),
(8, 'AN', 'Netherlands Antilles', 'Willemstad', 0),
(9, 'AO', 'Angola', 'Luanda', 0),
(10, 'AQ', 'Antarctica', '', 0),
(11, 'AR', 'Argentina', 'Buenos Aires', 0),
(12, 'AS', 'American Samoa', 'Pago Pago', 0),
(13, 'AT', 'Austria', 'Vienna', 0),
(14, 'AU', 'Australia', 'Canberra', 0),
(15, 'AW', 'Aruba', 'Oranjestad', 0),
(16, 'AX', 'Aland Islands', 'Mariehamn', 0),
(17, 'AZ', 'Azerbaijan', 'Baku', 0),
(18, 'BA', 'Bosnia and Herzegovina', 'Sarajevo', 0),
(19, 'BB', 'Barbados', 'Bridgetown', 0),
(20, 'BD', 'Bangladesh', 'Dhaka', 0),
(21, 'BE', 'Belgium', 'Brussels', 0),
(22, 'BF', 'Burkina Faso', 'Ouagadougou', 0),
(23, 'BG', 'Bulgaria', 'Sofia', 0),
(24, 'BH', 'Bahrain', 'Manama', 0),
(25, 'BI', 'Burundi', 'Bujumbura', 0),
(26, 'BJ', 'Benin', 'Porto-Novo', 0),
(27, 'BL', 'Saint BarthÃ©lemy', 'Gustavia', 0),
(28, 'BM', 'Bermuda', 'Hamilton', 0),
(29, 'BN', 'Brunei', 'Bandar Seri Begawan', 0),
(30, 'BO', 'Bolivia', 'La Paz', 0),
(31, 'BR', 'Brazil', 'BrasÃ­lia', 0),
(32, 'BS', 'Bahamas', 'Nassau', 0),
(33, 'BT', 'Bhutan', 'Thimphu', 0),
(34, 'BV', 'Bouvet Island', '', 0),
(35, 'BW', 'Botswana', 'Gaborone', 0),
(36, 'BY', 'Belarus', 'Minsk', 0),
(37, 'BZ', 'Belize', 'Belmopan', 0),
(38, 'CA', 'Canada', 'Ottawa', 0),
(39, 'CC', 'Cocos Islands', 'West Island', 0),
(40, 'CD', 'Democratic Republic of the Congo', 'Kinshasa', 0),
(41, 'CF', 'Central African Republic', 'Bangui', 0),
(42, 'CG', 'Congo Brazzavile', 'Brazzaville', 0),
(43, 'CH', 'Switzerland', 'Berne', 0),
(44, 'CI', 'Ivory Coast', 'Yamoussoukro', 0),
(45, 'CK', 'Cook Islands', 'Avarua', 0),
(46, 'CL', 'Chile', 'Santiago', 0),
(47, 'CM', 'Cameroon', 'YaoundÃ©', 0),
(48, 'CN', 'China', 'Beijing', 0),
(49, 'CO', 'Colombia', 'BogotÃ¡', 0),
(50, 'CR', 'Costa Rica', 'San JosÃ©', 0),
(51, 'CS', 'Serbia and Montenegro', 'Belgrade', 0),
(52, 'CU', 'Cuba', 'Havana', 0),
(53, 'CV', 'Cape Verde', 'Praia', 0),
(54, 'CX', 'Christmas Island', 'Flying Fish Cove', 0),
(55, 'CY', 'Cyprus', 'Nicosia', 0),
(56, 'CZ', 'Czech Republic', 'Prague', 0),
(57, 'DE', 'Germany', 'Berlin', 0),
(58, 'DJ', 'Djibouti', 'Djibouti', 0),
(59, 'DK', 'Denmark', 'Copenhagen', 0),
(60, 'DM', 'Dominica', 'Roseau', 0),
(61, 'DO', 'Dominican Republic', 'Santo Domingo', 0),
(62, 'DZ', 'Algeria', 'Algiers', 0),
(63, 'EC', 'Ecuador', 'Quito', 0),
(64, 'EE', 'Estonia', 'Tallinn', 0),
(65, 'EG', 'Egypt', 'Cairo', 0),
(66, 'EH', 'Western Sahara', 'El-Aaiun', 0),
(67, 'ER', 'Eritrea', 'Asmara', 0),
(68, 'ES', 'Spain', 'Madrid', 0),
(69, 'ET', 'Ethiopia', 'Addis Ababa', 0),
(70, 'FI', 'Finland', 'Helsinki', 0),
(71, 'FJ', 'Fiji', 'Suva', 0),
(72, 'FK', 'Falkland Islands', 'Stanley', 0),
(73, 'FM', 'Micronesia', 'Palikir', 0),
(74, 'FO', 'Faroe Islands', 'TÃ³rshavn', 0),
(75, 'FR', 'France', 'Paris', 0),
(76, 'GA', 'Gabon', 'Libreville', 0),
(77, 'GB', 'United Kingdom', 'London', 0),
(78, 'GD', 'Grenada', 'St. George''s', 0),
(79, 'GE', 'Georgia', 'Tbilisi', 0),
(80, 'GF', 'French Guiana', 'Cayenne', 0),
(81, 'GG', 'Guernsey', 'St Peter Port', 0),
(82, 'GH', 'Ghana', 'Accra', 0),
(83, 'GI', 'Gibraltar', 'Gibraltar', 0),
(84, 'GL', 'Greenland', 'Nuuk', 0),
(85, 'GM', 'Gambia', 'Banjul', 0),
(86, 'GN', 'Guinea', 'Conakry', 0),
(87, 'GP', 'Guadeloupe', 'Basse-Terre', 0),
(88, 'GQ', 'Equatorial Guinea', 'Malabo', 0),
(89, 'GR', 'Greece', 'Athens', 0),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'Grytviken', 0),
(91, 'GT', 'Guatemala', 'Guatemala City', 0),
(92, 'GU', 'Guam', 'HagÃ¥tÃ±a', 0),
(93, 'GW', 'Guinea-Bissau', 'Bissau', 0),
(94, 'GY', 'Guyana', 'Georgetown', 0),
(95, 'HK', 'Hong Kong', 'Hong Kong', 0),
(96, 'HM', 'Heard Island and McDonald Islands', '', 0),
(97, 'HN', 'Honduras', 'Tegucigalpa', 0),
(98, 'HR', 'Croatia', 'Zagreb', 0),
(99, 'HT', 'Haiti', 'Port-au-Prince', 0),
(100, 'HU', 'Hungary', 'Budapest', 0),
(101, 'ID', 'Indonesia', 'Jakarta', 0),
(102, 'IE', 'Ireland', 'Dublin', 0),
(103, 'IL', 'Israel', 'Jerusalem', 0),
(104, 'IM', 'Isle of Man', 'Douglas, Isle of Man', 0),
(105, 'IN', 'India', 'New Delhi', 0),
(106, 'IO', 'British Indian Ocean Territory', 'Diego Garcia', 0),
(107, 'IQ', 'Iraq', 'Baghdad', 0),
(108, 'IR', 'Iran', 'Tehran', 0),
(109, 'IS', 'Iceland', 'ReykjavÃ­k', 0),
(110, 'IT', 'Italy', 'Rome', 0),
(111, 'JE', 'Jersey', 'Saint Helier', 0),
(112, 'JM', 'Jamaica', 'Kingston', 0),
(113, 'JO', 'Jordan', 'Amman', 0),
(114, 'JP', 'Japan', 'Tokyo', 0),
(115, 'KE', 'Kenya', 'Nairobi', 0),
(116, 'KG', 'Kyrgyzstan', 'Bishkek', 0),
(117, 'KH', 'Cambodia', 'Phnom Penh', 0),
(118, 'KI', 'Kiribati', 'South Tarawa', 0),
(119, 'KM', 'Comoros', 'Moroni', 0),
(120, 'KN', 'Saint Kitts and Nevis', 'Basseterre', 0),
(121, 'KP', 'North Korea', 'Pyongyang', 0),
(122, 'KR', 'South Korea', 'Seoul', 0),
(123, 'KW', 'Kuwait', 'Kuwait City', 0),
(124, 'KY', 'Cayman Islands', 'George Town', 0),
(125, 'KZ', 'Kazakhstan', 'Astana', 0),
(126, 'LA', 'Laos', 'Vientiane', 0),
(127, 'LB', 'Lebanon', 'Beirut', 0),
(128, 'LC', 'Saint Lucia', 'Castries', 0),
(129, 'LI', 'Liechtenstein', 'Vaduz', 0),
(130, 'LK', 'Sri Lanka', 'Colombo', 0),
(131, 'LR', 'Liberia', 'Monrovia', 0),
(132, 'LS', 'Lesotho', 'Maseru', 0),
(133, 'LT', 'Lithuania', 'Vilnius', 0),
(134, 'LU', 'Luxembourg', 'Luxembourg', 0),
(135, 'LV', 'Latvia', 'Riga', 0),
(136, 'LY', 'Libya', 'Tripolis', 0),
(137, 'MA', 'Morocco', 'Rabat', 0),
(138, 'MC', 'Monaco', 'Monaco', 0),
(139, 'MD', 'Moldova', 'Chi_in_u', 0),
(140, 'ME', 'Montenegro', 'Podgorica', 0),
(141, 'MF', 'Saint Martin', 'Marigot', 0),
(142, 'MG', 'Madagascar', 'Antananarivo', 0),
(143, 'MH', 'Marshall Islands', 'Uliga', 0),
(144, 'MK', 'Macedonia', 'Skopje', 0),
(145, 'ML', 'Mali', 'Bamako', 0),
(146, 'MM', 'Myanmar', 'Yangon', 0),
(147, 'MN', 'Mongolia', 'Ulan Bator', 0),
(148, 'MO', 'Macao', 'Macao', 0),
(149, 'MP', 'Northern Mariana Islands', 'Saipan', 0),
(150, 'MQ', 'Martinique', 'Fort-de-France', 0),
(151, 'MR', 'Mauritania', 'Nouakchott', 0),
(152, 'MS', 'Montserrat', 'Plymouth', 0),
(153, 'MT', 'Malta', 'Valletta', 0),
(154, 'MU', 'Mauritius', 'Port Louis', 0),
(155, 'MV', 'Maldives', 'MalÃ©', 0),
(156, 'MW', 'Malawi', 'Lilongwe', 0),
(157, 'MX', 'Mexico', 'Mexico City', 0),
(158, 'MY', 'Malaysia', 'Kuala Lumpur', 0),
(159, 'MZ', 'Mozambique', 'Maputo', 0),
(160, 'NA', 'Namibia', 'Windhoek', 0),
(161, 'NC', 'New Caledonia', 'NoumÃ©a', 0),
(162, 'NE', 'Niger', 'Niamey', 0),
(163, 'NF', 'Norfolk Island', 'Kingston', 0),
(164, 'NG', 'Nigeria', 'Abuja', 0),
(165, 'NI', 'Nicaragua', 'Managua', 0),
(166, 'NL', 'Netherlands', 'Amsterdam', 0),
(167, 'NO', 'Norway', 'Oslo', 0),
(168, 'NP', 'Nepal', 'Kathmandu', 0),
(169, 'NR', 'Nauru', 'Yaren', 0),
(170, 'NU', 'Niue', 'Alofi', 0),
(171, 'NZ', 'New Zealand', 'Wellington', 0),
(172, 'OM', 'Oman', 'Muscat', 0),
(173, 'PA', 'Panama', 'Panama City', 0),
(174, 'PE', 'Peru', 'Lima', 0),
(175, 'PF', 'French Polynesia', 'Papeete', 0),
(176, 'PG', 'Papua New Guinea', 'Port Moresby', 0),
(177, 'PH', 'Philippines', 'Manila', 0),
(178, 'PK', 'Pakistan', 'Islamabad', 0),
(179, 'PL', 'Poland', 'Warsaw', 0),
(180, 'PM', 'Saint Pierre and Miquelon', 'Saint-Pierre', 0),
(181, 'PN', 'Pitcairn', 'Adamstown', 0),
(182, 'PR', 'Puerto Rico', 'San Juan', 0),
(183, 'PS', 'Palestinian Territory', 'East Jerusalem', 0),
(184, 'PT', 'Portugal', 'Lisbon', 0),
(185, 'PW', 'Palau', 'Koror', 0),
(186, 'PY', 'Paraguay', 'AsunciÃ³n', 0),
(187, 'QA', 'Qatar', 'Doha', 0),
(188, 'RE', 'Reunion', 'Saint-Denis', 0),
(189, 'RO', 'Romania', 'Bucharest', 0),
(190, 'RS', 'Serbia', 'Belgrade', 0),
(191, 'RU', 'Russia', 'Moscow', 0),
(192, 'RW', 'Rwanda', 'Kigali', 0),
(193, 'SA', 'Saudi Arabia', 'Riyadh', 0),
(194, 'SB', 'Solomon Islands', 'Honiara', 0),
(195, 'SC', 'Seychelles', 'Victoria', 0),
(196, 'SD', 'Sudan', 'Khartoum', 0),
(197, 'SE', 'Sweden', 'Stockholm', 0),
(198, 'SG', 'Singapore', 'Singapur', 0),
(199, 'SH', 'Saint Helena', 'Jamestown', 0),
(200, 'SI', 'Slovenia', 'Ljubljana', 0),
(201, 'SJ', 'Svalbard and Jan Mayen', 'Longyearbyen', 0),
(202, 'SK', 'Slovakia', 'Bratislava', 0),
(203, 'SL', 'Sierra Leone', 'Freetown', 0),
(204, 'SM', 'San Marino', 'San Marino', 0),
(205, 'SN', 'Senegal', 'Dakar', 0),
(206, 'SO', 'Somalia', 'Mogadishu', 0),
(207, 'SR', 'Suriname', 'Paramaribo', 0),
(208, 'ST', 'Sao Tome and Principe', 'SÃ£o TomÃ©', 0),
(209, 'SV', 'El Salvador', 'San Salvador', 0),
(210, 'SY', 'Syria', 'Damascus', 0),
(211, 'SZ', 'Swaziland', 'Mbabane', 0),
(212, 'TC', 'Turks and Caicos Islands', 'Cockburn Town', 0),
(213, 'TD', 'Chad', 'N''Djamena', 0),
(214, 'TF', 'French Southern Territories', 'Martin-de-ViviÃ¨s', 0),
(215, 'TG', 'Togo', 'LomÃ©', 0),
(216, 'TH', 'Thailand', 'Bangkok', 0),
(217, 'TJ', 'Tajikistan', 'Dushanbe', 0),
(218, 'TK', 'Tokelau', '', 0),
(219, 'TL', 'East Timor', 'Dili', 0),
(220, 'TM', 'Turkmenistan', 'Ashgabat', 0),
(221, 'TN', 'Tunisia', 'Tunis', 0),
(222, 'TO', 'Tonga', 'Nuku''alofa', 0),
(223, 'TR', 'Turkey', 'Ankara', 0),
(224, 'TT', 'Trinidad and Tobago', 'Port of Spain', 0),
(225, 'TV', 'Tuvalu', 'Vaiaku', 0),
(226, 'TW', 'Taiwan', 'Taipei', 0),
(227, 'TZ', 'Tanzania', 'Dar es Salaam', 0),
(228, 'UA', 'Ukraine', 'Kiev', 0),
(229, 'UG', 'Uganda', 'Kampala', 0),
(230, 'UM', 'United States Minor Outlying Islands', '', 0),
(231, 'US', 'United States', 'Washington', 0),
(232, 'UY', 'Uruguay', 'Montevideo', 0),
(233, 'UZ', 'Uzbekistan', 'Tashkent', 0),
(234, 'VA', 'Vatican', 'Vatican City', 0),
(235, 'VC', 'Saint Vincent and the Grenadines', 'Kingstown', 0),
(236, 'VE', 'Venezuela', 'Caracas', 0),
(237, 'VG', 'British Virgin Islands', 'Road Town', 0),
(238, 'VI', 'U.S. Virgin Islands', 'Charlotte Amalie', 0),
(239, 'VN', 'Vietnam', 'Hanoi', 0),
(240, 'VU', 'Vanuatu', 'Port Vila', 0),
(241, 'WF', 'Wallis and Futuna', 'MatÃ¢''Utu', 0),
(242, 'WS', 'Samoa', 'Apia', 0),
(243, 'YE', 'Yemen', 'Sanâ€˜aâ€™', 0),
(244, 'YT', 'Mayotte', 'Mamoudzou', 0),
(245, 'ZA', 'South Africa', 'Pretoria', 0),
(246, 'ZM', 'Zambia', 'Lusaka', 0),
(247, 'ZW', 'Zimbabwe', 'Harare', 0);

-- --------------------------------------------------------

--
-- Structure de la table `externalapp`
--

CREATE TABLE `externalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Info on external apps(mobile) that work with your deployment' AUTO_INCREMENT=3 ;

--
-- Contenu de la table `externalapp`
--

INSERT INTO `externalapp` (`id`, `name`, `url`) VALUES
(1, 'iPhone', 'http://download.ushahidi.com/track_download.php?download=ios'),
(2, 'Android', 'http://download.ushahidi.com/track_download.php?download=android');

-- --------------------------------------------------------

--
-- Structure de la table `feed`
--

CREATE TABLE `feed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about RSS Feeds a deployment subscribes to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `feed_item`
--

CREATE TABLE `feed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) DEFAULT NULL,
  `item_description` text,
  `item_link` varchar(255) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores feed items pulled from each RSS Feed' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `form`
--

CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores all report submission forms created(default+custom)' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `form`
--

INSERT INTO `form` (`id`, `form_title`, `form_description`, `form_active`) VALUES
(1, 'Default Form', 'Default form, for report entry', 1);

-- --------------------------------------------------------

--
-- Structure de la table `form_field`
--

CREATE TABLE `form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` varchar(200) DEFAULT NULL,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_visible` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all custom form fields created by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `form_field_option`
--

CREATE TABLE `form_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(200) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `form_field_id` (`form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options related to custom form fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `form_response`
--

CREATE TABLE `form_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores responses to custom form fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `geometry`
--

CREATE TABLE `geometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `geometry` geometry NOT NULL,
  `geometry_label` varchar(150) DEFAULT NULL,
  `geometry_comment` varchar(255) DEFAULT NULL,
  `geometry_color` varchar(20) DEFAULT NULL,
  `geometry_strokewidth` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `geometry` (`geometry`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores map geometries i.e polygons, lines etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `incident`
--

CREATE TABLE `incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` int(11) unsigned DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  `incident_zoom` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores reports submitted' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `incident`
--

INSERT INTO `incident` (`id`, `location_id`, `form_id`, `locale`, `user_id`, `incident_title`, `incident_description`, `incident_date`, `incident_mode`, `incident_active`, `incident_verified`, `incident_dateadd`, `incident_dateadd_gmt`, `incident_datemodify`, `incident_alert_status`, `incident_zoom`) VALUES
(1, 1, 1, 'en_US', 1, 'Hello Ushahidi!', 'Welcome to Ushahidi. Please replace this report with a valid incident', '2012-04-04 12:54:31', 1, 1, 1, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `incident_category`
--

CREATE TABLE `incident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores submitted reports categories' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `incident_category`
--

INSERT INTO `incident_category` (`id`, `incident_id`, `category_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `incident_lang`
--

CREATE TABLE `incident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for report titles and descriptions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `incident_person`
--

CREATE TABLE `incident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds information provided by people who submit reports' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `layer`
--

CREATE TABLE `layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) DEFAULT NULL,
  `layer_url` varchar(255) DEFAULT NULL,
  `layer_file` varchar(100) DEFAULT NULL,
  `layer_color` varchar(20) DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds static layer information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `level`
--

CREATE TABLE `level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) DEFAULT NULL,
  `level_description` varchar(200) DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores level of trust assigned to reporters of the platform' AUTO_INCREMENT=6 ;

--
-- Contenu de la table `level`
--

INSERT INTO `level` (`id`, `level_title`, `level_description`, `level_weight`) VALUES
(1, 'SPAM + Delete', 'SPAM + Delete', -2),
(2, 'SPAM', 'SPAM', -1),
(3, 'Untrusted', 'Untrusted', 0),
(4, 'Trusted', 'Trusted', 1),
(5, 'Trusted + Verify', 'Trusted + Verify', 2);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores location information' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`id`, `location_name`, `country_id`, `latitude`, `longitude`, `location_visible`, `location_date`) VALUES
(1, 'Nairobi', 115, -1.28730007070501, 36.8214511820082, 1, '2009-06-30 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE `maintenance` (
  `allowed_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`allowed_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Puts a site in maintenance mode if data exists in this table';

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `checkin_id` bigint(20) unsigned DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) DEFAULT NULL,
  `media_description` longtext,
  `media_link` varchar(255) DEFAULT NULL,
  `media_medium` varchar(255) DEFAULT NULL,
  `media_thumb` varchar(255) DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `badge_id` (`badge_id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores any media submitted along with a report/checkin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT '0',
  `reporter_id` bigint(20) unsigned DEFAULT NULL,
  `service_messageid` varchar(100) DEFAULT NULL,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0' COMMENT '0 - UNREAD, 1 - READ, 99 - SPAM',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `reporter_id` (`reporter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores tweets, emails and SMS messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `openid`
--

CREATE TABLE `openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `openid_email` varchar(127) NOT NULL,
  `openid_server` varchar(255) NOT NULL,
  `openid_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores usersâ€™ openid information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_description` longtext,
  `page_tab` varchar(100) NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user created pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Stores permissions used for access control' AUTO_INCREMENT=20 ;

--
-- Contenu de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'reports_view'),
(2, 'reports_edit'),
(4, 'reports_comments'),
(5, 'reports_download'),
(6, 'reports_upload'),
(7, 'messages'),
(8, 'messages_reporters'),
(9, 'stats'),
(10, 'settings'),
(11, 'manage'),
(12, 'users'),
(13, 'manage_roles'),
(14, 'checkin'),
(15, 'checkin_admin'),
(16, 'reports_verify'),
(17, 'reports_approve'),
(18, 'admin_ui'),
(19, 'member_ui');

-- --------------------------------------------------------

--
-- Structure de la table `permissions_roles`
--

CREATE TABLE `permissions_roles` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores permissions assigned to roles';

--
-- Contenu de la table `permissions_roles`
--

INSERT INTO `permissions_roles` (`role_id`, `permission_id`) VALUES
(1, 14),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(4, 19);

-- --------------------------------------------------------

--
-- Structure de la table `plugin`
--

CREATE TABLE `plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(100) NOT NULL,
  `plugin_url` varchar(250) DEFAULT NULL,
  `plugin_description` text,
  `plugin_priority` tinyint(4) DEFAULT '0',
  `plugin_active` tinyint(4) DEFAULT '0',
  `plugin_installed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name` (`plugin_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Holds a list of all plugins installed on a deployment' AUTO_INCREMENT=6 ;

--
-- Contenu de la table `plugin`
--

INSERT INTO `plugin` (`id`, `plugin_name`, `plugin_url`, `plugin_description`, `plugin_priority`, `plugin_active`, `plugin_installed`) VALUES
(1, 'clickatell', NULL, NULL, 0, 0, 0),
(2, 'frontlinesms', NULL, NULL, 0, 0, 0),
(3, 'sharing', NULL, NULL, 0, 0, 0),
(4, 'smssync', NULL, NULL, 0, 0, 0),
(5, 'viddler', NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `private_message`
--

CREATE TABLE `private_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `from_user_id` int(11) DEFAULT '0',
  `private_subject` varchar(255) NOT NULL,
  `private_message` text NOT NULL,
  `private_message_date` datetime NOT NULL,
  `private_message_new` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores private messages sent between Members' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores credibility ratings for reports and comments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `reporter`
--

CREATE TABLE `reporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `service_account` varchar(255) DEFAULT NULL,
  `reporter_first` varchar(200) DEFAULT NULL,
  `reporter_last` varchar(200) DEFAULT NULL,
  `reporter_email` varchar(120) DEFAULT NULL,
  `reporter_phone` varchar(60) DEFAULT NULL,
  `reporter_ip` varchar(50) DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `level_id` (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information on report submitters via email, twitter and sms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `access_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Defines user access levels and privileges on a deployment' AUTO_INCREMENT=5 ;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `access_level`) VALUES
(1, 'login', 'Login privileges, granted after account confirmation', 0),
(2, 'admin', 'Administrative user, has access to almost everything.', 90),
(3, 'superadmin', 'Super administrative user, has access to everything.', 100),
(4, 'member', 'Regular user with access only to the member area', 10);

-- --------------------------------------------------------

--
-- Structure de la table `roles_users`
--

CREATE TABLE `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores roles assigned to users registered on a deployment';

--
-- Contenu de la table `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `scheduler`
--

CREATE TABLE `scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores schedules for cron jobs' AUTO_INCREMENT=6 ;

--
-- Contenu de la table `scheduler`
--

INSERT INTO `scheduler` (`id`, `scheduler_name`, `scheduler_last`, `scheduler_weekday`, `scheduler_day`, `scheduler_hour`, `scheduler_minute`, `scheduler_controller`, `scheduler_active`) VALUES
(1, 'Feeds', 1354476315, -1, -1, -1, 0, 's_feeds', 1),
(2, 'Alerts', 1354476315, -1, -1, -1, -1, 's_alerts', 1),
(3, 'Email', 1354476315, -1, -1, -1, 0, 's_email', 1),
(4, 'Twitter', 1354476315, -1, -1, -1, 0, 's_twitter', 1),
(5, 'Cleanup', 1354476315, -1, -1, -1, 0, 's_cleanup', 1);

-- --------------------------------------------------------

--
-- Structure de la table `scheduler_log`
--

CREATE TABLE `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(10) unsigned NOT NULL,
  `scheduler_status` varchar(20) DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduler_id` (`scheduler_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores a log of scheduler actions' AUTO_INCREMENT=28 ;

--
-- Contenu de la table `scheduler_log`
--

INSERT INTO `scheduler_log` (`id`, `scheduler_id`, `scheduler_status`, `scheduler_date`) VALUES
(1, 1, '200', 1354265575),
(2, 2, '200', 1354265575),
(3, 3, '200', 1354265576),
(4, 4, '200', 1354265576),
(5, 5, '200', 1354265576),
(6, 2, '200', 1354265586),
(7, 2, '200', 1354265782),
(8, 2, '200', 1354265832),
(9, 2, '200', 1354265882),
(10, 2, '200', 1354265951),
(11, 1, '200', 1354266008),
(12, 2, '200', 1354266008),
(13, 3, '200', 1354266008),
(14, 4, '200', 1354266008),
(15, 5, '200', 1354266008),
(16, 2, '200', 1354266083),
(17, 2, '200', 1354266227),
(18, 2, '200', 1354266332),
(19, 2, '200', 1354266387),
(20, 2, '200', 1354266461),
(21, 2, '200', 1354266527),
(22, 2, '200', 1354266548),
(23, 1, '200', 1354476315),
(24, 2, '200', 1354476315),
(25, 3, '200', 1354476315),
(26, 4, '200', 1354476315),
(27, 5, '200', 1354476315);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Info on input sources i.e SMS, Email, Twitter' AUTO_INCREMENT=4 ;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`id`, `service_name`, `service_description`, `service_url`, `service_api`) VALUES
(1, 'SMS', 'Text messages from phones', NULL, NULL),
(2, 'Email', 'Email messages sent to your deployment', NULL, NULL),
(3, 'Twitter', 'Tweets tweets tweets', 'http://twitter.com', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores session information';

--
-- Contenu de la table `sessions`
--

INSERT INTO `sessions` (`session_id`, `last_activity`, `data`) VALUES
('042c8e3d43dc8e3e6ffe0b7271253d8d', 1354266567, '/SX7nKa3zbIDuRwORKs4XYHeXlOZpNmCJeb0SbFoTL+DbL4ENClsdhn8SVMn3sQ+EP3yQZ1JR0t9p1s0/E7cEH76eKHJvuZFQDzvxpGiT1dycOBx+4IZK46PEjl4gwFpHma78Nnnt7jl8Zp2e0Tvltawy6mtyFnNBmFY8CZl7/NXBqub9by2a1xARoxqaoUPhU+9hDC7tN69JIVJcowvOKCU64qrDN+g+66eOvZ749cKYcFy1D6XHxr2GVIMzUkZqirO3gG16AD+lQSyBdx7Z5JUaRDEbZPBHSU6Q/toYm5T4kGajbik7LuADQr5thm5KOV1d6VbYWeGwIRwnyXuPqKYqEdj5ZYq5TRdLXzK5UdBwoRHwrxSSTQRirPVykixKIBaokESkdzMgmgtI5vemP1EltyyU0rpA4AXl44mmGPzN7KsUL91Yux6bVGboUNG+NgLZoMUGTnC1vh7+EeOSExavAgWq/4meVXl58MpwvRZ3hKG36dIM3PJIti7Q5RcJ+jPq+DEkh41hTMZPdzoeKzqUlDkbWCoB2wsKqgORhtXQb9p8CIRe17YL5G8MDN8PYdsA+Hqok7wn73A8r/jXE9/uNwEiJ50tW66KBS/wdEs4DHvq++PdIiVB2jBcEpCIvpSby+MNC0mUdFwBeujo4rOLFpiD45/xzJVNDPTtpjT8ykO6IycRoRSxX1MrQYLJXHgRVtG6Msob9Nc5OvdGeFvAuD7PJFOmBXEU1Jq1LibOEeQGgN5r+AUpD5uADj6c2Hh4TFJx5HExoQ2X7oABdF9PIO3rNd8ijg5wCcyohKzqvImXz5wHBcWhoJZC+iRaz2FvOrZizsIx5fAvy65bKBcZRLam05xLWKRqqhJKxccJtoT199Ii1yvafEyFNDSqW0qgwdNWb0O81BMASh5dQ6LLsSS/U3OhBhiWDgXgYwRcK14gQaSM4Z6q/e/c3V56F1NboZg68ZXmIBOk5P8qnnCa0Ey+PGDlEkLmC8JcDCNGlsDhiHEwooG/8H/lflCkeQO70BxS9soxjwokvnoIrRB7PqC8wTXvHq+jXUC0hDSSIfeRQ3P2ul9QdKZ8jWsETceH8VhSygWS/PmChk/FlvqZk030Tvo3o+AeW5Z1xAhgvHC+dbHOTkthhwMUFxpFKZrmVArqCneCvYj64lqU7X3uysRbeUoQ0xFoJzKUmrUWRcyBD386n8OcGdI2Sa3rXGS92xI1kJ3rQbOOLdwf57kFWr8ApsquDpUhnNl09InuSug87/yei7PIrgEVnlxcGraSyr0BEpRP+4VnIsviqjY7ZiqofpeQmWwjw1yYodvUTwo1yj8tz2b3vWcovCBWcH/K9IrOStT/3T7CgVD'),
('feb9e5bf75d35dc3667229887e30e2dd', 1354476315, 'A5WY6tIryqISLjjNNvkPNKmhu1UtjzUby3FOOdrpcShA2YaCqyk5Ok9U4pPUPNGD+ZClKW8OG4alU3n7dTFQDAtPQAPCLejoygNI8QwH9DCBtIxtS50B6B+zHLf6+FZ7p4QgV1bzUGAQ/OnO/AM4bLTDU7DPlS4VlynGoLb5H1Zth8uJJSM+y/2wHibfcBsCYH7uzS7BwKyySqzZk2XXy2L8BixY/TOfGNQMFxVfLa4tQAIbYIDR/ZZNDKh9YVyxhk/mtdwTvlkMxtiwd6U3iVXhepnfwQeYdarD5t64ymhgEUkgN0ODd/D6AbP3ggAw1ry86/GOJ5il/GsFqs+sOJUdfyOL1e3+11ezgaOeLreomvTEXiebrrFjl6HVCsIKTC0ykle43RFLIjJw8XFAmgqWGZ7Iid0+yARR/962lkoS6muq2blrr/7mzhQmSSr6SFOTCjiqI0Y8qYFIoPXzZBekNXgOQjwSGJ5BDk3Qtyl/QYccptQJb/Er2osZL7WWeRRD2HM5oVao3a836KGbeCaMZM0rxcYgzMab88MMqC49vr14O7qcph8q7vr2XGId+WKTL3zgigMyHhn7iE4sK6O2nMOT4/3vCh7vQX8A4S2eo6ZnK0ZFsEGVrE1IiYUlNCPi64cnXDyrscubcTUwhwnRQHi3gOE4E6ctiXdr2aH9wpnJHTQZy/6iMdIQVoPIi/KO5j+WwJzVgviDGk0GMPTs6mg1RgFVAbXowQgId1k1H5JxhXtZvh4fu1Or9dM7jlYd+lXbpin+c9HPhHcsJnbBdCSnbl9og1332aql6VNn1XJZazAvLV+2v+ZuitKMIsg4IGEnBhSlrI7RGV4r4Uyb0vRQBRP2V8t7Bq7QzBod9P5gQGL6w1ThbIPE661BQJ2aIlh2jqoezW2JSmKDguxUHEIH2a/XyMAPP5iIw1NvLBs8WgVqd0X83IA9KrXBju7UeUE5x4ryeIz/1YC7ymdyUtYnmLp81aQ5TR8icWzRa6cSV9P4NPDikb+mPj7f6GeXyBRF9tkAeX/+Kg17svJp4nVBYXKQsJz9esd17P0N7J2HP1HO8SvHnpkh6iPehiQGFkhw4MH69hLIpQcroic9DuN80HlNufE6u79ReKawp4lN9MTtWz9rOtyevuPQlQ6p/FLqESFr4ZO+Vw==');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT 'Unique identifier for the configuration parameter',
  `value` text COMMENT 'Value for the settings parameter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_settings_key` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Contenu de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_name', 'Set Settal'),
(2, 'site_tagline', 'Mobile-web Solution to connect citizens and local residents with Sanitation agencies'),
(3, 'site_banner_id', NULL),
(4, 'site_email', 'fallmansour19@yahoo.fr'),
(5, 'site_key', NULL),
(6, 'site_language', 'en_US'),
(7, 'site_style', 'default'),
(8, 'site_timezone', NULL),
(9, 'site_contact_page', '1'),
(10, 'site_help_page', '1'),
(11, 'site_message', NULL),
(12, 'site_copyright_statement', NULL),
(13, 'site_submit_report_message', NULL),
(14, 'allow_reports', '1'),
(15, 'allow_comments', '1'),
(16, 'allow_feed', '1'),
(17, 'allow_stat_sharing', '1'),
(18, 'allow_clustering', '1'),
(19, 'cache_pages', '0'),
(20, 'cache_pages_lifetime', '1800'),
(21, 'private_deployment', '0'),
(22, 'default_map', 'google_normal'),
(23, 'default_map_all', 'CC0000'),
(24, 'default_map_all_icon_id', NULL),
(25, 'api_google', ''),
(26, 'api_live', 'Apumcka0uPOF2lKLorq8aeo4nuqfVVeNRqJjqOcLMJ9iMCTsnMsNd9_OvpA8gR0i'),
(27, 'api_akismet', ''),
(28, 'default_country', '205'),
(29, 'multi_country', '0'),
(30, 'default_city', 'nairobi'),
(31, 'default_lat', '14.739574962662983'),
(32, 'default_lon', '-17.442340855956445'),
(33, 'default_zoom', '11'),
(34, 'items_per_page', '5'),
(35, 'items_per_page_admin', '20'),
(36, 'sms_provider', ''),
(37, 'sms_no1', NULL),
(38, 'sms_no2', NULL),
(39, 'sms_no3', NULL),
(40, 'google_analytics', NULL),
(41, 'twitter_hashtags', NULL),
(42, 'blocks', 'news_block|reports_block'),
(43, 'blocks_per_row', '2'),
(44, 'date_modify', '2012-11-30 09:06:26'),
(45, 'stat_id', '47772'),
(46, 'stat_key', 'ee264979604d07340246cf910f068e'),
(47, 'email_username', NULL),
(48, 'email_password', NULL),
(49, 'email_port', NULL),
(50, 'email_host', NULL),
(51, 'email_servertype', NULL),
(52, 'email_ssl', NULL),
(53, 'ftp_server', NULL),
(54, 'ftp_user_name', NULL),
(55, 'alerts_email', NULL),
(56, 'checkins', '0'),
(57, 'facebook_appid', NULL),
(58, 'facebook_appsecret', NULL),
(59, 'db_version', '102'),
(60, 'ushahidi_version', '2.6.1'),
(61, 'allow_alerts', '1'),
(62, 'require_email_confirmation', '0'),
(63, 'manually_approve_users', '0'),
(64, 'enable_timeline', '0'),
(65, 'forgot_password_secret', 'QD`AU&u1Es3;IB^g,beTcW1!+a]asFpa5L+W;{}^:zJ(W[?#&#g6ET:.jXdN65TN');

-- --------------------------------------------------------

--
-- Structure de la table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Works with checkins';

-- --------------------------------------------------------

--
-- Structure de la table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores browser tokens assigned to users' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `user_agent`, `token`, `created`, `expires`) VALUES
(1, 1, 'da4a02532a65995ae67e95de509b947205b6d27e', 'R2SeUWKlzL3F175gbpuTgahBrZgxGdu3', 1354265781, 1355475381);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riverid` varchar(128) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `color` varchar(6) NOT NULL DEFAULT 'FF0000',
  `code` varchar(30) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `public_profile` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `needinfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores registered usersâ€™ information' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `riverid`, `name`, `email`, `username`, `password`, `logins`, `last_login`, `notify`, `updated`, `color`, `code`, `confirmed`, `public_profile`, `approved`, `needinfo`) VALUES
(1, '', 'Administrator', 'fallmansour19@yahoo.fr', 'admin', '22e96afa6b808f63dc8dee89747e0bc7b7c116652f44918cef', 2, 1354476308, 0, '2012-12-02 19:25:08', 'FF0000', NULL, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `verified`
--

CREATE TABLE `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all verified reports' AUTO_INCREMENT=1 ;
--
-- Base de données: `zf_daral`
--
CREATE DATABASE `zf_daral` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zf_daral`;

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id_animal` int(10) NOT NULL AUTO_INCREMENT,
  `id_eleveur` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT '',
  `photo_left` varchar(50) NOT NULL DEFAULT '',
  `photo_right` varchar(50) NOT NULL DEFAULT '',
  `photo_front` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_animal`),
  KEY `id_eleveur` (`id_eleveur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `animal`
--

INSERT INTO `animal` (`id_animal`, `id_eleveur`, `type`, `photo_left`, `photo_right`, `photo_front`) VALUES
(4, '2D5', 'cheval', 'left', 'right', 'front'),
(5, '2D45', 'mouton', 'left', 'right', 'front');

-- --------------------------------------------------------

--
-- Structure de la table `daral`
--

CREATE TABLE `daral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_localite` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_localite` (`id_localite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `daral`
--

INSERT INTO `daral` (`id`, `id_localite`, `name`) VALUES
(1, 2, 'D1'),
(2, 2, 'D2'),
(3, 1, 'D3'),
(4, 3, 'D4'),
(5, 2, 'D5'),
(6, 4, 'D6'),
(7, 5, 'D7'),
(8, 4, 'D8'),
(9, 1, 'D9'),
(10, 6, 'D10');

-- --------------------------------------------------------

--
-- Structure de la table `farmer`
--

CREATE TABLE `farmer` (
  `rank_farmer` int(11) NOT NULL AUTO_INCREMENT,
  `id_farmer` varchar(30) NOT NULL,
  `daral_number` int(11) NOT NULL,
  `firstname_farmer` varchar(30) NOT NULL,
  `lastname_farmer` varchar(30) NOT NULL,
  `phone_farmer` varchar(30) NOT NULL,
  `isactive_farmer` int(2) NOT NULL,
  `birthdate_farmer` date NOT NULL,
  `birthplace_farmer` varchar(30) NOT NULL,
  `id_localite` int(10) NOT NULL,
  PRIMARY KEY (`rank_farmer`),
  KEY `id_localite` (`id_localite`),
  KEY `daral_number` (`daral_number`),
  KEY `id_farmer` (`id_farmer`),
  KEY `id_localite_2` (`id_localite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Contenu de la table `farmer`
--

INSERT INTO `farmer` (`rank_farmer`, `id_farmer`, `daral_number`, `firstname_farmer`, `lastname_farmer`, `phone_farmer`, `isactive_farmer`, `birthdate_farmer`, `birthplace_farmer`, `id_localite`) VALUES
(1, '1D1', 1, 'Doudou', 'Mbaye', '775432101', 1, '2012-10-08', 'Podor', 2),
(2, '1D2', 1, 'Mansour', 'Fall', '7777566', 1, '2012-11-28', 'pog', 2),
(3, '2D3', 2, 'Bob', 'Dylan', '7777566', 1, '2012-11-28', 'london', 1),
(4, '3D4', 3, 'Hercule', 'Dione', '775989808', 1, '2012-11-28', 'pog', 3),
(5, '2D5', 2, 'Bob', 'Marley', '775989808', 1, '2012-11-28', 'yoro', 3),
(6, '2D6', 2, 'George', 'Brown', '775989808', 1, '2012-11-28', 'pout', 3),
(7, '2D7', 2, 'Yao', 'Ming', '7777566', 1, '2012-11-29', 'Beijing', 3),
(8, '2D8', 2, 'Michael', 'Jordan', '7777566', 1, '2012-11-29', 'Chicago', 3),
(9, '2D9', 2, 'Noah', 'George', '7777566', 1, '2012-11-29', 'douala', 3),
(10, '2D10', 2, 'Anzanto', 'Ghana', '775989808', 1, '2012-11-29', 'Accra', 3),
(11, '5D11', 5, 'Baba', 'Sane', '775989808', 1, '2012-11-29', 'Phar', 3),
(12, '3D12', 3, 'Mansour', 'Fall', '775989808', 1, '2012-11-29', 'pgo', 3),
(13, '4D13', 4, 'Bruce', 'Lee', '7777566', 1, '2012-11-29', 'hong kong', 3),
(14, '3D14', 3, 'SHANG', 'KAI', '701230808', 1, '2012-11-29', 'kingon', 3),
(15, '3D15', 3, 'Hyang', 'sho', '775989808', 1, '2012-11-29', 'seoul', 3),
(16, '3D16', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(17, '3D17', 3, 'mansour', 'fall', '701230808', 1, '2012-11-29', 'pout', 3),
(18, '3D18', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(19, '3D19', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(20, '3D20', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(21, '3D21', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(22, '3D22', 3, 'manosur', 'fall', '775989808', 1, '2012-11-29', 'pout', 3),
(23, '3D23', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(24, '3D24', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(25, '3D25', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pout', 3),
(26, '3D26', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(27, '3D27', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(28, '3D28', 3, 'bob', 'Dione', '7777566', 1, '2012-11-29', 'pog', 3),
(29, '3D29', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(30, '3D30', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pgo', 3),
(31, '3D31', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pgo', 3),
(32, '3D32', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(33, '3D33', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(34, '3D34', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(35, '3D35', 3, 'fallou', 'dieng', '775989808', 1, '2012-11-29', 'pgo', 3),
(36, '3D36', 3, 'mansour', 'fal', '775989808', 1, '2012-11-29', 'pout', 3),
(37, '3D37', 3, 'manosur', 'fall', '7777566', 1, '2012-11-29', 'pog', 3),
(38, '3D38', 3, 'mansour', 'fall', '7777566', 1, '2012-11-29', 'pgo', 3),
(39, '3D39', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pout', 3),
(40, '3D40', 3, 'bob', 'marley', '775989808', 1, '2012-11-29', 'pout', 3),
(41, '3D41', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pog', 3),
(42, '3D42', 3, 'mansour', 'fall', '775989808', 1, '2012-11-29', 'pout', 1),
(43, '10D43', 10, 'bob', 'Wyley', '775989808', 1, '2012-11-29', 'pgo', 1),
(44, '7D44', 7, 'Mansour', 'fall', '7', 1, '2012-11-29', 'pog', 5),
(45, '2D45', 2, 'Amadou', 'Sow', '7777566', 1, '1999-11-29', 'Podor', 2),
(46, '3D46', 3, 'Mansour', 'Fall', '775989808', 1, '2012-12-08', 'pog', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `localite`
--

CREATE TABLE `localite` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `localite`
--

INSERT INTO `localite` (`id`, `name`) VALUES
(1, 'Dakar'),
(2, 'St Louis'),
(3, 'Thies'),
(4, 'Mbour'),
(5, 'Fatick'),
(6, 'Matam');

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(1000) NOT NULL,
  `symptomes` varchar(1000) NOT NULL,
  `type` varchar(20) NOT NULL,
  `vaccin` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(250) NOT NULL,
  `langue` int(11) NOT NULL,
  `date_insertion` date NOT NULL,
  `lien` varchar(250) DEFAULT NULL,
  `maladie` int(11) NOT NULL,
  PRIMARY KEY (`id_media`),
  KEY `langue` (`langue`),
  KEY `maladie` (`maladie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_farmer` varchar(30) NOT NULL,
  `id_localite` int(10) NOT NULL,
  `date` date NOT NULL,
  `type` int(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `id_farmer` (`id_farmer`,`id_user`),
  KEY `id_user` (`id_user`),
  KEY `id_localite` (`id_localite`)
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
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `date_created`) VALUES
(1, 'mansour', 'passer', '2012-10-31 18:19:26'),
(2, 'sada', 'passer', '2012-11-03 17:35:04'),
(3, 'amdane', 'passer', '2012-11-03 17:35:04'),
(4, 'sokhna', 'passer', '2012-11-03 17:35:04'),
(5, 'khalil', 'passer', '2012-11-03 17:37:39'),
(6, 'mamadou', 'passer', '2012-11-03 17:37:39'),
(7, 'amadou', 'passer', '2012-11-03 17:37:39'),
(8, 'leger', 'passer', '2012-11-03 17:37:39');

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

CREATE TABLE `veterinaire` (
  `rank_veterinaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_veterinaire` varchar(30) NOT NULL,
  `adresse_veto` varchar(50) NOT NULL,
  `firstname_veterinaire` varchar(30) NOT NULL,
  `lastname_veterinaire` varchar(30) NOT NULL,
  `phone_veterinaire` varchar(30) NOT NULL,
  `IsActive_veterinaire` int(2) NOT NULL,
  `birthdate_veterinaire` date NOT NULL,
  `birthplace_veterinaire` varchar(30) NOT NULL,
  PRIMARY KEY (`rank_veterinaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `veterinaire`
--

INSERT INTO `veterinaire` (`rank_veterinaire`, `id_veterinaire`, `adresse_veto`, `firstname_veterinaire`, `lastname_veterinaire`, `phone_veterinaire`, `IsActive_veterinaire`, `birthdate_veterinaire`, `birthplace_veterinaire`) VALUES
(2, '234565', 'YARAKH', 'DOUDOU', 'FALL', '779856743', 0, '1967-10-25', 'THIES'),
(3, '345653', 'KAYAR', 'YOUSSOU', 'FALL', '769874563', 1, '1905-09-17', 'KAOLACK');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_eleveur`) REFERENCES `farmer` (`id_farmer`);

--
-- Contraintes pour la table `daral`
--
ALTER TABLE `daral`
  ADD CONSTRAINT `daral_ibfk_1` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`id`);

--
-- Contraintes pour la table `farmer`
--
ALTER TABLE `farmer`
  ADD CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`daral_number`) REFERENCES `daral` (`id`),
  ADD CONSTRAINT `farmer_ibfk_2` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`langue`) REFERENCES `lang` (`id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`maladie`) REFERENCES `maladie` (`id`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`id_farmer`) REFERENCES `farmer` (`id_farmer`),
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`id_localite`) REFERENCES `localite` (`id`),
  ADD CONSTRAINT `notification_ibfk_5` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
