-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemadeacompanhamento
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `TURMA_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TURMA_ID` (`TURMA_ID`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`TURMA_ID`) REFERENCES `turmas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Diego Fernando','diegoreis.dvlopr@gmail.com',1),(2,'Andressa','andressa@gmail.com',1),(3,'Victor','victor@gmail.com',2),(4,'Anatan','anatan@gmail.com',3),(5,'Ana','ana@gmail.com',3);
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `requisitos` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Hard Skills','18 anos'),(2,'Soft Skills','18 anos'),(3,'UX/UI','18 anos'),(4,'INGLÊS','14 anos');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilitadores`
--

DROP TABLE IF EXISTS `facilitadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilitadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `CURSO_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CURSO_ID` (`CURSO_ID`),
  CONSTRAINT `facilitadores_ibfk_1` FOREIGN KEY (`CURSO_ID`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilitadores`
--

LOCK TABLES `facilitadores` WRITE;
/*!40000 ALTER TABLE `facilitadores` DISABLE KEYS */;
INSERT INTO `facilitadores` VALUES (1,'Dutra','dutra@gmail.com',1),(2,'Kelvin','kelvin@gmail.com',2),(3,'Fulano','fulano@gmail.com',3),(4,'Beltrano','beltrano@gmail.com',4);
/*!40000 ALTER TABLE `facilitadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CURSO1_ID` int NOT NULL,
  `CURSO2_ID` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CURSO1_ID` (`CURSO1_ID`),
  KEY `CURSO2_ID` (`CURSO2_ID`),
  CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`CURSO1_ID`) REFERENCES `cursos` (`id`),
  CONSTRAINT `modulos_ibfk_2` FOREIGN KEY (`CURSO2_ID`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,1,2,'Módulo 0'),(2,1,2,'Módulo 1'),(3,1,2,'Introdução ao curso de programação'),(4,1,2,'Introdução ao Front-End'),(5,1,2,'Orientação a objetos'),(6,1,2,'React'),(7,1,2,'Banco de dados'),(8,1,2,'Tecnologias Back-end');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projetos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MODULO_ID` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipodeprojeto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MODULO_ID` (`MODULO_ID`),
  CONSTRAINT `projetos_ibfk_1` FOREIGN KEY (`MODULO_ID`) REFERENCES `modulos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos`
--

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` VALUES (1,3,'Sem projeto','individual'),(2,3,'Sem projeto','Em grupo'),(3,4,'Apresentação pessoal','Individual'),(4,4,'Ajude um microempreendedor','Em grupo'),(5,5,'Mensagem Oculta','Individual'),(6,5,'The FrontEnders','Em grupo'),(7,6,'Json-Server','Individual'),(8,6,'Sendo servido','Em grupo'),(9,7,'Sistema Resilia','Individual'),(10,7,'Visualizando a situação','Em grupo'),(11,8,'Facilitando o dia-a-dia','Individual'),(12,8,'CRUD api','Em grupo');
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas`
--

DROP TABLE IF EXISTS `turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CURSO1_ID` int NOT NULL,
  `CURSO2_ID` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CURSO1_ID` (`CURSO1_ID`),
  KEY `CURSO2_ID` (`CURSO2_ID`),
  CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`CURSO1_ID`) REFERENCES `cursos` (`id`),
  CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`CURSO2_ID`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas`
--

LOCK TABLES `turmas` WRITE;
/*!40000 ALTER TABLE `turmas` DISABLE KEYS */;
INSERT INTO `turmas` VALUES (1,1,2,'Bonsucesso 1'),(2,1,2,'Bonsucesso 2'),(3,1,2,'Bonsucesso 3'),(4,1,3,'Bonsucesso 4'),(5,1,3,'Bonsucesso 5'),(6,3,4,'Bonsucesso 6');
/*!40000 ALTER TABLE `turmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistemadeacompanhamento'
--

--
-- Dumping routines for database 'sistemadeacompanhamento'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 19:14:25
