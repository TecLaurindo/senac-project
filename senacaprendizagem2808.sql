-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: senacaprendizagem
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_empresa` int NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `curso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_empresa` (`id_empresa`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aprovacaoempresario`
--

DROP TABLE IF EXISTS `aprovacaoempresario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprovacaoempresario` (
  `id_aprovacao` int NOT NULL AUTO_INCREMENT,
  `id_relatorio` int NOT NULL,
  `id_empresario` int NOT NULL,
  `data_aprovacao` date NOT NULL,
  `status` enum('aprovado','reprovado') NOT NULL,
  `comentarios` text,
  PRIMARY KEY (`id_aprovacao`),
  KEY `id_relatorio` (`id_relatorio`),
  KEY `id_empresario` (`id_empresario`),
  CONSTRAINT `aprovacaoempresario_ibfk_1` FOREIGN KEY (`id_relatorio`) REFERENCES `relatorio` (`id_relatorio`),
  CONSTRAINT `aprovacaoempresario_ibfk_2` FOREIGN KEY (`id_empresario`) REFERENCES `empresario` (`id_empresario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avaliacaogestor`
--

DROP TABLE IF EXISTS `avaliacaogestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacaogestor` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `id_relatorio` int NOT NULL,
  `id_gestor` int NOT NULL,
  `data_avaliacao` date NOT NULL,
  `comentarios` text,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_relatorio` (`id_relatorio`),
  KEY `id_gestor` (`id_gestor`),
  CONSTRAINT `avaliacaogestor_ibfk_1` FOREIGN KEY (`id_relatorio`) REFERENCES `relatorio` (`id_relatorio`),
  CONSTRAINT `avaliacaogestor_ibfk_2` FOREIGN KEY (`id_gestor`) REFERENCES `gestor` (`id_gestor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `duracao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresario`
--

DROP TABLE IF EXISTS `empresario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresario` (
  `id_empresario` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_empresa` int NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_empresario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_empresa` (`id_empresa`),
  CONSTRAINT `empresario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `empresario_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gestor`
--

DROP TABLE IF EXISTS `gestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor` (
  `id_gestor` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gestor`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `gestor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relatorio`
--

DROP TABLE IF EXISTS `relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio` (
  `id_relatorio` int NOT NULL AUTO_INCREMENT,
  `id_aluno` int NOT NULL,
  `periodo_referencia` varchar(7) NOT NULL,
  `descricao_atividades` text,
  `data_envio` date NOT NULL,
  `situacao` enum('aguardando','avaliado_gestor','aprovado_empresario','reprovado_empresario') NOT NULL DEFAULT 'aguardando',
  PRIMARY KEY (`id_relatorio`),
  KEY `id_aluno` (`id_aluno`),
  CONSTRAINT `relatorio_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(17) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` enum('gestor','empresario','aluno') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'senacaprendizagem'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-28 10:33:20
