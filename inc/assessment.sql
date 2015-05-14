-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 14 Mai 2015 à 13:23
-- Version du serveur :  5.6.24-0ubuntu2
-- Version de PHP :  5.6.8-1+deb.sury.org~vivid+4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `assessment`
--

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`customer_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`) VALUES
(1, 'John Doe', 'john@doe.com'),
(2, 'foo bar', 'foo@bar.com'),
(3, 'etienne de la boétie', 'etienne@boetie.fr'),
(4, 'novalis', 'nova@lis');

-- --------------------------------------------------------

--
-- Structure de la table `customer_related_product`
--

CREATE TABLE IF NOT EXISTS `customer_related_product` (
  `customer_id_rp` int(10) unsigned NOT NULL,
  `product_id_rp` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `customer_related_product`
--

INSERT INTO `customer_related_product` (`customer_id_rp`, `product_id_rp`) VALUES
(1, 6),
(1, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(4, 1),
(4, 4),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
`order_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `order`
--

INSERT INTO `order` (`order_id`, `customer_id`, `delivery_address`) VALUES
(1, 1, 'calle 48 # 28-30'),
(2, 3, 'chartres'),
(3, 2, 'test'),
(4, 4, 'germany');

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `product_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `price` varchar(255) COLLATE utf8_bin NOT NULL,
  `order_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `order_detail`
--

INSERT INTO `order_detail` (`product_description`, `price`, `order_id`) VALUES
('1431627267.5631', '400', 1),
('1431627485.4025', '150', 2),
('1431627626.6075', '60000', 3),
('1431627723.1032', '150', 4),
('1431627723.1084', '60000', 4),
('1431627723.115', '200', 4);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `product_price` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`product_id`, `name`, `product_price`) VALUES
(1, 'electric guitar', '150'),
(2, 'macbook air', '1000'),
(3, 'camera', '400'),
(4, 'nissan gtr', '60000'),
(5, 'headphones', '100'),
(6, 'LCD screen', '200');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`customer_id`);

--
-- Index pour la table `customer_related_product`
--
ALTER TABLE `customer_related_product`
 ADD KEY `customer_id_rp` (`customer_id_rp`), ADD KEY `product_id_rp` (`product_id_rp`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
 ADD PRIMARY KEY (`order_id`), ADD KEY `customer_id` (`customer_id`);

--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
 ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
MODIFY `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
MODIFY `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
MODIFY `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `customer_related_product`
--
ALTER TABLE `customer_related_product`
ADD CONSTRAINT `customer_related_product_ibfk_1` FOREIGN KEY (`customer_id_rp`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `customer_related_product_ibfk_2` FOREIGN KEY (`product_id_rp`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
