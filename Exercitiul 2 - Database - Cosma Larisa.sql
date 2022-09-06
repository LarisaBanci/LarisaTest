-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for 1onlinestore
DROP DATABASE IF EXISTS `1onlinestore`;
CREATE DATABASE IF NOT EXISTS `1onlinestore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `1onlinestore`;

-- Dumping structure for table 1onlinestore.clienti
DROP TABLE IF EXISTS `clienti`;
CREATE TABLE IF NOT EXISTS `clienti` (
  `ClientID` int NOT NULL,
  `Nume` varchar(50) NOT NULL,
  `Prenume` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Oras` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProdusID` int NOT NULL,
  PRIMARY KEY (`ClientID`),
  KEY `ProdusID` (`ProdusID`),
  CONSTRAINT `clienti_ibfk_1` FOREIGN KEY (`ProdusID`) REFERENCES `produse` (`ProdusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 1onlinestore.clienti: ~5 rows (approximately)
REPLACE INTO `clienti` (`ClientID`, `Nume`, `Prenume`, `Email`, `Oras`, `ProdusID`) VALUES
	(2001, 'Grigore', 'Maria', 'Grigore.Maria@gmail.com', 'Bucuresti', 1002),
	(2002, 'Suciu', 'Anita', 'Anita1999@yahoo.com', 'Cluj', 1009),
	(2003, 'Curtu', 'Richard', 'Richard_C_22@yahoo.com', 'Arad', 1005),
	(2004, 'Talea', 'Nicoleta', 'NicoletaT09@gmail.com', 'Brasov', 1007),
	(2005, 'Marta', 'Luminita', 'Luminita2005@yahoo.com', 'Deva', 1001),
	(2006, 'Malta', 'Diana', 'DianaDii@yahoo.com', 'Iasi', 1003),
	(2007, 'Ciocol', 'Andreea', 'AndreeaDiana@gmail.com', 'Galati', 1008),
	(2008, 'Caslitra', 'Andreea', 'Deea2020@yahoo.com', 'Sibiu', 1009),
	(2009, 'Nicole', 'Bianca', 'Beatrice.18@yahoo.com', 'Bucuresti', 1004),
	(2010, 'Nistor', 'Cristina', 'NiCriStina@yahoo.com', 'Craiova', 1006);

-- Dumping structure for table 1onlinestore.comenzi
DROP TABLE IF EXISTS `comenzi`;
CREATE TABLE IF NOT EXISTS `comenzi` (
  `ComandaID` int NOT NULL,
  `ClientID` int NOT NULL,
  `ProdusID` int NOT NULL,
  `DataComanda` date NOT NULL,
  `Suma` double(10,2) NOT NULL,
  `Valuta` varchar(3) NOT NULL,
  PRIMARY KEY (`ComandaID`),
  KEY `ClientID` (`ClientID`),
  KEY `ProdusID` (`ProdusID`),
  CONSTRAINT `comenzi_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clienti` (`ClientID`),
  CONSTRAINT `comenzi_ibfk_2` FOREIGN KEY (`ProdusID`) REFERENCES `produse` (`ProdusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 1onlinestore.comenzi: ~5 rows (approximately)
REPLACE INTO `comenzi` (`ComandaID`, `ClientID`, `ProdusID`, `DataComanda`, `Suma`, `Valuta`) VALUES
	(3001, 2001, 1002, '2022-03-10', 50.00, 'RON'),
	(3002, 2002, 1009, '2022-04-28', 30.00, 'RON'),
	(3003, 2003, 1005, '2022-06-17', 77.00, 'RON'),
	(3004, 2004, 1007, '2022-07-10', 48.00, 'RON'),
	(3005, 2005, 1001, '2022-07-29', 80.00, 'RON'),
	(3006, 2006, 1003, '2022-08-01', 95.00, 'RON'),
	(3007, 2007, 1008, '2022-08-05', 35.00, 'RON'),
	(3008, 2008, 1009, '2022-08-25', 30.00, 'RON'),
	(3009, 2009, 1004, '2022-09-01', 44.00, 'RON'),
	(3010, 2010, 1006, '2022-09-06', 145.00, 'RON');

-- Dumping structure for table 1onlinestore.produse
DROP TABLE IF EXISTS `produse`;
CREATE TABLE IF NOT EXISTS `produse` (
  `ProdusID` int NOT NULL,
  `Denumire` varchar(50) NOT NULL,
  `Pret` double(10,2) NOT NULL,
  `Valuta` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Stoc` varchar(50) NOT NULL,
  `Bucati` int DEFAULT NULL,
  PRIMARY KEY (`ProdusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 1onlinestore.produse: ~9 rows (approximately)
REPLACE INTO `produse` (`ProdusID`, `Denumire`, `Pret`, `Valuta`, `Stoc`, `Bucati`) VALUES
	(1001, 'Bluza', 80.00, 'RON', 'Disponibil', 120),
	(1002, 'Tricou', 50.00, 'RON', 'Disponibil', 85),
	(1003, 'Camasa', 95.00, 'RON', 'Disponibil', 30),
	(1004, 'Palarie', 44.00, 'RON', 'Indisponibil', 0),
	(1005, 'Pantaloni', 77.00, 'RON', 'Disponibil', 84),
	(1006, 'Pantofi', 145.00, 'RON', 'Disponibil', 25),
	(1007, 'Sapca', 48.00, 'RON', 'Disponibil', 36),
	(1008, 'Caciula', 35.00, 'RON', 'Disponibil', 82),
	(1009, 'Esarfa', 30.00, 'RON', 'Disponibil', 85);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
