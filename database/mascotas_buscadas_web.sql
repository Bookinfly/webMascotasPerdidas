-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: busqueda_mascotas
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` enum('Perro','Gato','Huron','Erizo','Tortuga','Otro') NOT NULL,
  `tamaño` enum('Pequeño','Mediano','Grande') NOT NULL,
  `edad` varchar(50) DEFAULT NULL,
  `raza` enum('Sin raza','Gato Común Europeo','Gato Americano de Pelo Corto','Labrador Retriever','Pastor Alemán','Bulldog Francés','Caniche','Golden Retriever','Beagle','Boxer','Yorkshire Terrier','Dachshund','Siamés','Persa','Bengala','Maine Coon','Sphynx','Ragdoll','Rottweiler','Chihuahua','Pug','Border Collie','Husky Siberiano','Shih Tzu','Boston Terrier','Devon Rex','Savannah','Angora','Abisinio','Otro') DEFAULT NULL,
  `color` enum('Negro','Blanco','Marrón Claro','Marrón Oscuro','Gris','Atigrado','Bicolor','Tricolor','Blanco y Negro','Blanco y Marrón','Blanco y Gris','Negro y Marrón','Gris y Blanco','Gris y Negro','Naranja','Naranja y Blanco','Naranja y Negro','Naranja Atigrado') NOT NULL,
  `pelo` enum('Corto','Medio','Largo') DEFAULT NULL,
  `amistoso` enum('Sí','No','Sí, pero tener cuidado','No, pero es manso','Desconocido') DEFAULT 'Desconocido',
  `estado` enum('En casa','Perdido','Alojado mientras buscamos a su familia','En tránsito') DEFAULT 'En casa',
  `chip` tinyint(1) DEFAULT '0',
  `collar` tinyint(1) DEFAULT '0',
  `chapita` tinyint(1) DEFAULT '0',
  `castrado` tinyint(1) DEFAULT '0',
  `vacunado` tinyint(1) DEFAULT '0',
  `fotos` json DEFAULT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `animales_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,1,'Garfield','Gato','Mediano','6 años','Gato Común Europeo','Naranja','Corto','Sí','En casa',0,1,1,1,1,'{\"imagenes\": [\"garfield1.jpg\", \"garfield2.jpg\"]}');
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncios`
--

DROP TABLE IF EXISTS `anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anuncios` (
  `id_anuncio` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `tipo` enum('Buscado','Encontrado','Avistado','En Tránsito','En Adopción') NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ubicacion` varchar(255) NOT NULL,
  `comentarios` text,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_anuncio`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `anuncios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncios`
--

LOCK TABLES `anuncios` WRITE;
/*!40000 ALTER TABLE `anuncios` DISABLE KEYS */;
INSERT INTO `anuncios` VALUES (1,1,'Buscado','2025-02-05 17:49:25','Villa Devoto','Garfield se escapó, responde a su nombre y es amistoso.',1);
/*!40000 ALTER TABLE `anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncios_animales`
--

DROP TABLE IF EXISTS `anuncios_animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anuncios_animales` (
  `id_anuncio` int NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id_anuncio`,`id_animal`),
  KEY `id_animal` (`id_animal`),
  CONSTRAINT `anuncios_animales_ibfk_1` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncios` (`id_anuncio`) ON DELETE CASCADE,
  CONSTRAINT `anuncios_animales_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncios_animales`
--

LOCK TABLES `anuncios_animales` WRITE;
/*!40000 ALTER TABLE `anuncios_animales` DISABLE KEYS */;
INSERT INTO `anuncios_animales` VALUES (1,1);
/*!40000 ALTER TABLE `anuncios_animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Jon Arbuckle','jon.arbuckle@example.com','hashed_password_here','123456789','2025-02-05 16:44:56');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-06 18:23:46
