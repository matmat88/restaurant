-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  ven. 02 août 2019 à 17:08
-- Version du serveur :  5.7.27-0ubuntu0.18.04.1
-- Version de PHP :  7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `type` enum('boisson','dessert') NOT NULL,
  `name` varchar(64) NOT NULL,
  `prix` float NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  `idMedia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
<<<<<<< HEAD
-- Déchargement des données de la table `element`
=======
-- Contenu de la table `element`
>>>>>>> eb4a4a81b47e1907ea96d5e458bc34206a72cdf1
--

INSERT INTO `element` (`id`, `type`, `name`, `prix`, `stock`, `idMedia`) VALUES
(8, 'boisson', 'ddddd', 3.5, 0, 7);

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
  `dessert` int(11) DEFAULT NULL,
  `composition` int(11) DEFAULT NULL,
  `boisson` int(11) DEFAULT NULL,
  `prix` float NOT NULL,
  `publication` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `formule`
--

INSERT INTO `formule` (`id`, `name`, `dessert`, `composition`, `boisson`, `prix`, `publication`) VALUES
(1, 'Pitaya', NULL, 1, NULL, 15, '2019-08-02 16:57:20'),
(2, 'Medium Pitaya', NULL, 1, 1, 20, '2019-08-02 17:00:54'),
(3, 'Big Pitaya', 1, 1, 1, 25, '2019-08-02 17:01:20');

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
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `prix`, `type`, `stock`, `idMedia`) VALUES
(6, 'riz', 5, 'BASE', 0, 2),
(7, 'nouilles', 3, 'BASE', 0, 8),
(8, 'quinoa', 3, 'BASE', 0, 9),
(9, 'boeuf', 3, 'PROTEINE', 0, 10),
(10, 'poulet', 3, 'PROTEINE', 0, 11),
(11, 'crevettes', 3, 'PROTEINE', 0, 12),
(12, 'tofu', 3, 'PROTEINE', 0, 13),
(13, 'ciboulette', 3, 'SUPPLEMENT', 0, 14),
(15, 'menthe', 3, 'SUPPLEMENT', 0, 16),
(16, 'coriandre', 3, 'SUPPLEMENT', 0, 17),
(17, 'basilic', 3, 'SUPPLEMENT', 0, 18),
(18, 'citron vert', 3, 'SUPPLEMENT', 0, 19),
(19, 'oignons frits', 3, 'SUPPLEMENT', 0, 20),
(20, 'pousse de soja', 3, 'SUPPLEMENT', 0, 21),
(21, 'salade', 3, 'SUPPLEMENT', 0, 22),
(22, 'algues', 3, 'SUPPLEMENT', 0, 23);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
<<<<<<< HEAD
-- Déchargement des données de la table `media`
=======
-- Contenu de la table `media`
>>>>>>> eb4a4a81b47e1907ea96d5e458bc34206a72cdf1
--

INSERT INTO `media` (`id`, `name`, `type`) VALUES
(1, 'chocococo.jpg', 'image/jpeg'),
(2, 'rice.jpg', 'image/jpeg'),
(3, 'sorbetlitchi.jpg', 'image/jpeg'),
(4, 'nouilles.jpg', 'image/jpeg'),
(5, 'nouilles.jpg', 'image/jpeg'),
(6, 'moussekala.jpg', 'image/jpeg'),
(7, 'citron.jpeg', 'image/jpeg'),
(8, 'nouilles.jpg', 'image/jpeg'),
(9, 'quinoa.jpg', 'image/jpeg'),
(10, 'boeuf.jpg', 'image/jpeg'),
(11, 'poulet.jpg', 'image/jpeg'),
(12, 'gambas.jpeg', 'image/jpeg'),
(13, 'toffu.webp', 'image/webp'),
(14, 'ciboulette.jpeg', 'image/jpeg'),
(15, 'ciboulette.jpeg', 'image/jpeg'),
(16, 'menthe.jpg', 'image/jpeg'),
(17, 'coriande.jpeg', 'image/jpeg'),
(18, 'basilic.jpeg', 'image/jpeg'),
(19, 'citron.jpeg', 'image/jpeg'),
(20, 'oignon.jpg', 'image/jpeg'),
(21, 'poussesdesoja.jpg', 'image/jpeg'),
(22, 'salade.jpg', 'image/jpeg'),
(23, 'algue.jpg', 'image/jpeg');

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
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `firstName`, `login`, `motDePasse`, `tel`, `mail`, `dateInscription`, `lastName`, `adress`, `town`, `role`, `statut`) VALUES
(1, 'mathilde', 'mat', '$2y$10$2.X7A8ZdwexjKrdsBLmvau69F3Q/EZfSi9PpJicCg1b2flmCVmzDm', NULL, 'mat', '2019-08-01 10:31:39', 'tram', NULL, NULL, 'admin', NULL),
(2, 'toto', 'toto', '$2y$10$ZLlVyZR2u1rc533TWo1Ro.6JicqilzlKXCpbP4y1Cw3z5MKlBB68q', NULL, 'toto', '2019-08-01 14:25:43', 'toto', NULL, NULL, 'admin', NULL),
(3, 'tata', 'tata', '$2y$10$SiOddQGMsrg5p2VYLzYGjukGFBzWNJZRTWue.qBNa2/YfTp27wDjm', NULL, 'tata', '2019-08-01 14:37:51', 'tata', NULL, NULL, 'client', NULL),
(4, 'tata', 'tata', '$2y$10$ElGvJ0GxB6TWlFu2OMIK8eBCbt8iQ3xBroQnkFktE.8W2VnQ4kviq', NULL, 'tata', '2019-08-01 16:06:15', 'tata', NULL, NULL, 'client', NULL);

--
-- Index pour les tables déchargées
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
-- AUTO_INCREMENT pour les tables déchargées
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
<<<<<<< HEAD

=======
>>>>>>> eb4a4a81b47e1907ea96d5e458bc34206a72cdf1
--
-- AUTO_INCREMENT pour la table `formule`
--
ALTER TABLE `formule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
<<<<<<< HEAD

=======
>>>>>>> eb4a4a81b47e1907ea96d5e458bc34206a72cdf1
--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
<<<<<<< HEAD

=======
>>>>>>> eb4a4a81b47e1907ea96d5e458bc34206a72cdf1
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
<<<<<<< HEAD

=======
>>>>>>> eb4a4a81b47e1907ea96d5e458bc34206a72cdf1
--
-- Contraintes pour les tables déchargées
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
