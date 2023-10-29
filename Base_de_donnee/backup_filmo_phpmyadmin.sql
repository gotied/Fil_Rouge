-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 29 oct. 2023 à 16:21
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `filmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_ad` int NOT NULL AUTO_INCREMENT,
  `livr_ad` varchar(200) DEFAULT NULL,
  `fac_ad` varchar(200) DEFAULT NULL,
  `id_uti` int DEFAULT NULL,
  PRIMARY KEY (`id_ad`),
  KEY `id_uti` (`id_uti`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_ad`, `livr_ad`, `fac_ad`, `id_uti`) VALUES
(1, '123 Rue Livraison 1, Ville X', '456 Rue Facturation 1, Ville X', 1),
(2, '789 Rue Livraison 2, Ville Y', '101 Avenue Facturation 2, Ville Y', 2),
(3, '222 Boulevard Livraison 3, Ville Z', '333 Boulevard Facturation 3, Ville Z', 3);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_co` int NOT NULL AUTO_INCREMENT,
  `dt_co` datetime DEFAULT NULL,
  `tt_co` decimal(8,2) DEFAULT NULL,
  `et_co` int DEFAULT NULL,
  `id_uti` int DEFAULT NULL,
  PRIMARY KEY (`id_co`),
  KEY `id_uti` (`id_uti`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_co`, `dt_co`, `tt_co`, `et_co`, `id_uti`) VALUES
(1, '2023-10-01 08:00:00', '40.97', 1, 1),
(2, '2023-10-02 14:30:00', '44.97', 1, 1),
(3, '2023-10-03 10:15:00', '12.99', 1, 2),
(4, '2023-10-04 16:45:00', '12.99', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

DROP TABLE IF EXISTS `details`;
CREATE TABLE IF NOT EXISTS `details` (
  `id_fil` int NOT NULL,
  `id_co` int NOT NULL,
  `qte` int DEFAULT NULL,
  PRIMARY KEY (`id_fil`,`id_co`),
  KEY `id_co` (`id_co`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `details`
--

INSERT INTO `details` (`id_fil`, `id_co`, `qte`) VALUES
(1, 1, 2),
(2, 1, 1),
(2, 2, 3),
(1, 3, 1),
(1, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id_fac` int NOT NULL AUTO_INCREMENT,
  `fac` varchar(50) DEFAULT NULL,
  `bn_livr` varchar(50) DEFAULT NULL,
  `id_co` int DEFAULT NULL,
  PRIMARY KEY (`id_fac`),
  KEY `id_co` (`id_co`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_fac`, `fac`, `bn_livr`, `id_co`) VALUES
(1, 'Facture 1', 'Livraison 1', 1),
(2, 'Facture 2', 'Livraison 2', 2),
(3, 'Facture 3', 'Livraison 3', 3),
(4, 'Facture 4', 'Livraison 4', 4);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id_fil` int NOT NULL AUTO_INCREMENT,
  `nm_fil` varchar(100) DEFAULT NULL,
  `res_fil` text,
  `sor_fil` date DEFAULT NULL,
  `dur_fil` varchar(10) DEFAULT NULL,
  `img_fil` varchar(50) DEFAULT NULL,
  `pr_fil` decimal(6,2) DEFAULT NULL,
  `sto_fil` int DEFAULT NULL,
  `act_fil` tinyint(1) DEFAULT NULL,
  `id_gen` int DEFAULT NULL,
  PRIMARY KEY (`id_fil`),
  KEY `id_gen` (`id_gen`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_fil`, `nm_fil`, `res_fil`, `sor_fil`, `dur_fil`, `img_fil`, `pr_fil`, `sto_fil`, `act_fil`, `id_gen`) VALUES
(1, 'Mission Impossible', 'Un agent secret tente de sauver le monde.', '2023-04-15', '2h 20min', 'mission_impossible.jpg', '12.99', 100, 1, 1),
(2, 'Le Trésor Perdu', 'Une aventure à la recherche d\'un trésor caché.', '2023-06-28', '2h 10min', 'tresor_perdu.jpg', '14.99', 80, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fourni`
--

DROP TABLE IF EXISTS `fourni`;
CREATE TABLE IF NOT EXISTS `fourni` (
  `id_fil` int NOT NULL,
  `id_four` int NOT NULL,
  `pr_four` decimal(7,2) DEFAULT NULL,
  `qte` int DEFAULT NULL,
  PRIMARY KEY (`id_fil`,`id_four`),
  KEY `id_four` (`id_four`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fourni`
--

INSERT INTO `fourni` (`id_fil`, `id_four`, `pr_four`, `qte`) VALUES
(1, 1, '8.99', 100),
(2, 2, '10.99', 80);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_four` int NOT NULL AUTO_INCREMENT,
  `nm_four` varchar(50) DEFAULT NULL,
  `ad_four` varchar(200) DEFAULT NULL,
  `tl_four` varchar(10) DEFAULT NULL,
  `eml_four` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_four`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_four`, `nm_four`, `ad_four`, `tl_four`, `eml_four`) VALUES
(1, 'Fournisseur A', '123 Rue des Fournisseurs, Ville A', '555-1234', 'fournisseurA@email.com'),
(2, 'Fournisseur B', '456 Avenue des Fournisseurs, Ville B', '555-5678', 'fournisseurB@email.com');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id_gen` int NOT NULL AUTO_INCREMENT,
  `nm_gen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_gen`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id_gen`, `nm_gen`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Science-fiction'),
(4, 'Comédie');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id_per` int NOT NULL AUTO_INCREMENT,
  `nm_per` varchar(50) DEFAULT NULL,
  `pm_per` varchar(50) DEFAULT NULL,
  `id_fil` int DEFAULT NULL,
  PRIMARY KEY (`id_per`),
  KEY `id_fil` (`id_fil`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id_per`, `nm_per`, `pm_per`, `id_fil`) VALUES
(1, 'Smith', 'John', 1),
(2, 'Roberts', 'Emily', 1),
(3, 'Johnson', 'Michael', 1),
(4, 'Anderson', 'Jessica', 2),
(5, 'Davis', 'David', 2),
(6, 'Garcia', 'Sofia', 1),
(7, 'Lee', 'Daniel', 2),
(8, 'White', 'Olivia', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_ro` int NOT NULL AUTO_INCREMENT,
  `nm_ro` varchar(30) DEFAULT NULL,
  `id_per` int DEFAULT NULL,
  PRIMARY KEY (`id_ro`),
  KEY `id_per` (`id_per`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_ro`, `nm_ro`, `id_per`) VALUES
(1, 'Acteur', 1),
(2, 'Acteur', 2),
(3, 'Acteur', 3),
(4, 'Réalisateur', 4),
(5, 'Réalisateur', 5),
(6, 'Acteur', 6),
(7, 'Acteur', 7),
(8, 'Acteur', 8);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_uti` int NOT NULL AUTO_INCREMENT,
  `eml_uti` varchar(50) DEFAULT NULL,
  `pwd_uti` varchar(250) DEFAULT NULL,
  `nm_uti` varchar(50) DEFAULT NULL,
  `pm_uti` varchar(50) DEFAULT NULL,
  `tl_uti` varchar(10) DEFAULT NULL,
  `rl_uti` int DEFAULT NULL,
  PRIMARY KEY (`id_uti`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_uti`, `eml_uti`, `pwd_uti`, `nm_uti`, `pm_uti`, `tl_uti`, `rl_uti`) VALUES
(1, 'client1@email.com', 'motdepasse1', 'Client', 'Un', '555-1111', 1),
(2, 'client2@email.com', 'motdepasse2', 'Client', 'Deux', '555-2222', 1),
(3, 'client3@email.com', 'motdepasse3', 'Client', 'Trois', '555-3333', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
