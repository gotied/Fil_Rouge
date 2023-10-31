-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: filmo
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id_ad` int(11) NOT NULL AUTO_INCREMENT,
  `livr_ad` varchar(200) DEFAULT NULL,
  `fac_ad` varchar(200) DEFAULT NULL,
  `id_uti` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ad`),
  KEY `id_uti` (`id_uti`),
  CONSTRAINT `adresse_ibfk_1` FOREIGN KEY (`id_uti`) REFERENCES `utilisateur` (`id_uti`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'123 Rue Livraison 1, Ville X','456 Rue Facturation 1, Ville X',1),(2,'789 Rue Livraison 2, Ville Y','101 Avenue Facturation 2, Ville Y',2),(3,'222 Boulevard Livraison 3, Ville Z','333 Boulevard Facturation 3, Ville Z',3);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id_co` int(11) NOT NULL AUTO_INCREMENT,
  `dt_co` datetime DEFAULT NULL,
  `tt_co` decimal(8,2) DEFAULT NULL,
  `et_co` int(11) DEFAULT NULL,
  `id_uti` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_co`),
  KEY `id_uti` (`id_uti`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_uti`) REFERENCES `utilisateur` (`id_uti`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2023-10-01 08:00:00',40.97,1,1),(2,'2023-10-02 14:30:00',44.97,1,1),(3,'2023-10-03 10:15:00',12.99,1,2),(4,'2023-10-04 16:45:00',12.99,1,3);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `id_fil` int(11) NOT NULL,
  `id_co` int(11) NOT NULL,
  `qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fil`,`id_co`),
  KEY `id_co` (`id_co`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`id_fil`) REFERENCES `film` (`id_fil`),
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`id_co`) REFERENCES `commande` (`id_co`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,1,2),(1,3,1),(1,4,1),(2,1,1),(2,2,3);
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facture` (
  `id_fac` int(11) NOT NULL AUTO_INCREMENT,
  `fac` varchar(50) DEFAULT NULL,
  `bn_livr` varchar(50) DEFAULT NULL,
  `id_co` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fac`),
  KEY `id_co` (`id_co`),
  CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_co`) REFERENCES `commande` (`id_co`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` VALUES (1,'Facture 1','Livraison 1',1),(2,'Facture 2','Livraison 2',2),(3,'Facture 3','Livraison 3',3),(4,'Facture 4','Livraison 4',4);
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id_fil` int(11) NOT NULL AUTO_INCREMENT,
  `nm_fil` varchar(100) DEFAULT NULL,
  `res_fil` text DEFAULT NULL,
  `sor_fil` date DEFAULT NULL,
  `dur_fil` varchar(10) DEFAULT NULL,
  `img_fil` varchar(50) DEFAULT NULL,
  `pr_fil` decimal(6,2) DEFAULT NULL,
  `sto_fil` int(11) DEFAULT NULL,
  `act_fil` tinyint(1) DEFAULT NULL,
  `id_gen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fil`),
  KEY `id_gen` (`id_gen`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_gen`) REFERENCES `genre` (`id_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Mission Impossible','Un agent secret tente de sauver le monde.','2023-04-15','2h 20min','mission_impossible.jpg',12.99,100,1,1),(2,'Le Trésor Perdu','Une aventure à la recherche d\'un trésor caché.','2023-06-28','2h 10min','tresor_perdu.jpg',14.99,80,1,2);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fourni`
--

DROP TABLE IF EXISTS `fourni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fourni` (
  `id_fil` int(11) NOT NULL,
  `id_four` int(11) NOT NULL,
  `pr_four` decimal(7,2) DEFAULT NULL,
  `qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fil`,`id_four`),
  KEY `id_four` (`id_four`),
  CONSTRAINT `fourni_ibfk_1` FOREIGN KEY (`id_fil`) REFERENCES `film` (`id_fil`),
  CONSTRAINT `fourni_ibfk_2` FOREIGN KEY (`id_four`) REFERENCES `fournisseur` (`id_four`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fourni`
--

LOCK TABLES `fourni` WRITE;
/*!40000 ALTER TABLE `fourni` DISABLE KEYS */;
INSERT INTO `fourni` VALUES (1,1,8.99,100),(2,2,10.99,80);
/*!40000 ALTER TABLE `fourni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `id_four` int(11) NOT NULL AUTO_INCREMENT,
  `nm_four` varchar(50) DEFAULT NULL,
  `ad_four` varchar(200) DEFAULT NULL,
  `tl_four` varchar(10) DEFAULT NULL,
  `eml_four` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_four`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (1,'Fournisseur A','123 Rue des Fournisseurs, Ville A','555-1234','fournisseurA@email.com'),(2,'Fournisseur B','456 Avenue des Fournisseurs, Ville B','555-5678','fournisseurB@email.com');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id_gen` int(11) NOT NULL AUTO_INCREMENT,
  `nm_gen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Aventure'),(3,'Science-fiction'),(4,'Comédie');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personne` (
  `id_per` int(11) NOT NULL AUTO_INCREMENT,
  `nm_per` varchar(50) DEFAULT NULL,
  `pm_per` varchar(50) DEFAULT NULL,
  `id_fil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_per`),
  KEY `id_fil` (`id_fil`),
  CONSTRAINT `personne_ibfk_1` FOREIGN KEY (`id_fil`) REFERENCES `film` (`id_fil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` VALUES (1,'Smith','John',1),(2,'Roberts','Emily',1),(3,'Johnson','Michael',1),(4,'Anderson','Jessica',2),(5,'Davis','David',2),(6,'Garcia','Sofia',1),(7,'Lee','Daniel',2),(8,'White','Olivia',1);
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id_ro` int(11) NOT NULL AUTO_INCREMENT,
  `nm_ro` varchar(30) DEFAULT NULL,
  `id_per` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ro`),
  KEY `id_per` (`id_per`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`id_per`) REFERENCES `personne` (`id_per`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Acteur',1),(2,'Acteur',2),(3,'Acteur',3),(4,'Réalisateur',4),(5,'Réalisateur',5),(6,'Acteur',6),(7,'Acteur',7),(8,'Acteur',8);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id_uti` int(11) NOT NULL AUTO_INCREMENT,
  `eml_uti` varchar(50) DEFAULT NULL,
  `pwd_uti` varchar(250) DEFAULT NULL,
  `nm_uti` varchar(50) DEFAULT NULL,
  `pm_uti` varchar(50) DEFAULT NULL,
  `tl_uti` varchar(10) DEFAULT NULL,
  `rl_uti` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_uti`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'client1@email.com','motdepasse1','Client','Un','555-1111',1),(2,'client2@email.com','motdepasse2','Client','Deux','555-2222',1),(3,'client3@email.com','motdepasse3','Client','Trois','555-3333',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 10:52:37
