-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 01 Août 2019 à 15:27
-- Version du serveur :  5.7.27-0ubuntu0.16.04.1
-- Version de PHP :  7.0.33-0ubuntu0.16.04.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `prix` float NOT NULL,
  `date de commande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idlivreur` int(11) DEFAULT NULL,
  `statut` enum('EN_COURS','ARRIVE','EN_PREPARATION','') NOT NULL DEFAULT 'EN_PREPARATION'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commandeElement`
--

CREATE TABLE `commandeElement` (
  `idcommande` int(11) NOT NULL,
  `idelement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `element`
--

CREATE TABLE `element` (
  `id` int(11) NOT NULL,
  `type` enum('composition','boisson','dessert') NOT NULL,
  `name` varchar(64) NOT NULL,
  `prix` float NOT NULL,
  `stock` float NOT NULL,
  `idMedia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `elementIngredient`
--

CREATE TABLE `elementIngredient` (
  `idElement` int(11) NOT NULL,
  `idIngredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formule`
--

CREATE TABLE `formule` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `dessert` int(11) NOT NULL,
  `composition` int(11) NOT NULL,
  `boisson` int(11) NOT NULL,
  `prix` float NOT NULL,
  `publication` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `prix` float NOT NULL,
  `type` enum('BASE','PROTEINE','SUPPLEMENT') NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  `idMedia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `prix`, `type`, `stock`, `idMedia`) VALUES
(1, 'riz', 5, 'BASE', 0, NULL),
(2, 'riz', 5, 'BASE', 0, NULL),
(3, 'riz', 5, 'BASE', 0, NULL),
(4, 'riz', 5, 'BASE', 0, NULL),
(5, 'riz', 5, 'BASE', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `nombreDePlace` int(11) NOT NULL,
  `nombreDeTable` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `dateReservation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tableReservation`
--

CREATE TABLE `tableReservation` (
  `id_reservation` int(11) NOT NULL,
  `id_table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `nombreDePlace` int(11) NOT NULL,
  `statut` enum('RESERVEE','LIBRE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `firstName` varchar(64) DEFAULT NULL,
  `login` varchar(64) NOT NULL,
  `motDePasse` varchar(64) NOT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `mail` varchar(64) NOT NULL,
  `dateInscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastName` varchar(64) DEFAULT NULL,
  `adress` varchar(64) DEFAULT NULL,
  `town` varchar(64) DEFAULT NULL,
  `role` enum('client','admin','livreur','') NOT NULL,
  `statut` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `firstName`, `login`, `motDePasse`, `tel`, `mail`, `dateInscription`, `lastName`, `adress`, `town`, `role`, `statut`) VALUES
(1, 'mathilde', 'mat', '$2y$10$2.X7A8ZdwexjKrdsBLmvau69F3Q/EZfSi9PpJicCg1b2flmCVmzDm', NULL, 'mat', '2019-08-01 10:31:39', 'tram', NULL, NULL, 'admin', NULL),
(2, 'toto', 'toto', '$2y$10$ZLlVyZR2u1rc533TWo1Ro.6JicqilzlKXCpbP4y1Cw3z5MKlBB68q', NULL, 'toto', '2019-08-01 14:25:43', 'toto', NULL, NULL, 'admin', NULL),
(3, 'tata', 'tata', '$2y$10$SiOddQGMsrg5p2VYLzYGjukGFBzWNJZRTWue.qBNa2/YfTp27wDjm', NULL, 'tata', '2019-08-01 14:37:51', 'tata', NULL, NULL, 'client', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `composition` (`idlivreur`),
  ADD KEY `client_id_2` (`client_id`);

--
-- Index pour la table `commandeElement`
--
ALTER TABLE `commandeElement`
  ADD KEY `id commande` (`idcommande`),
  ADD KEY `id element` (`idelement`);

--
-- Index pour la table `element`
--
ALTER TABLE `element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMedia` (`idMedia`);

--
-- Index pour la table `elementIngredient`
--
ALTER TABLE `elementIngredient`
  ADD KEY `idElement` (`idElement`),
  ADD KEY `idIngredient` (`idIngredient`);

--
-- Index pour la table `formule`
--
ALTER TABLE `formule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`name`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMedia` (`idMedia`),
  ADD KEY `base` (`type`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `tableReservation`
--
ALTER TABLE `tableReservation`
  ADD KEY `id reservation` (`id_reservation`),
  ADD KEY `id table` (`id_table`);

--
-- Index pour la table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `element`
--
ALTER TABLE `element`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `formule`
--
ALTER TABLE `formule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `commandeElement`
--
ALTER TABLE `commandeElement`
  ADD CONSTRAINT `commandeElement_ibfk_1` FOREIGN KEY (`idcommande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `commandeElement_ibfk_2` FOREIGN KEY (`idelement`) REFERENCES `element` (`id`);

--
-- Contraintes pour la table `element`
--
ALTER TABLE `element`
  ADD CONSTRAINT `element_ibfk_1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `elementIngredient`
--
ALTER TABLE `elementIngredient`
  ADD CONSTRAINT `elementIngredient_ibfk_1` FOREIGN KEY (`idIngredient`) REFERENCES `ingredient` (`id`),
  ADD CONSTRAINT `elementIngredient_ibfk_2` FOREIGN KEY (`idElement`) REFERENCES `element` (`id`);

--
-- Contraintes pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `tableReservation`
--
ALTER TABLE `tableReservation`
  ADD CONSTRAINT `tableReservation_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id`),
  ADD CONSTRAINT `tableReservation_ibfk_2` FOREIGN KEY (`id_table`) REFERENCES `tables` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
