-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: fantasticaDB
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'Motherboard'),(2,'Tarjeta de video'),(3,'Tarjeta de sonido'),(4,'Disco rígido'),(5,'Teclado'),(6,'Mouse'),(7,'Monitor'),(8,'CPU'),(9,'Gabinete'),(10,'Memoria RAM');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cuil` varchar(20) NOT NULL,
  `fecha_alta` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Hernán Valdez','Calle 18 esq 11, 6360, General Pico, La Pampa, Argentina','20-37825523-0','2018-02-25'),(2,'Esteban Lopez','Calle 15 Nº 1030, 6360, General Pico, La Pampa, Argentina','20-35222523-0','2018-02-27'),(3,'Claudia Garcia','Av. Siempreviva Nº 746, 6300, Santa Rosa, La Pampa, Argentina','27-25222523-0','2018-03-10');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DescripcionOrden`
--

DROP TABLE IF EXISTS `DescripcionOrden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DescripcionOrden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionProducto_id` int(11) NOT NULL,
  `ordenCompra_id` int(11) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`,`descripcionProducto_id`,`ordenCompra_id`),
  KEY `fk_DescripcionOrden_DescripcionProducto1_idx` (`descripcionProducto_id`),
  KEY `fk_DescripcionOrden_OrdenCompra1_idx` (`ordenCompra_id`),
  CONSTRAINT `fk_DescripcionOrden_DescripcionProducto1` FOREIGN KEY (`descripcionProducto_id`) REFERENCES `DescripcionProducto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DescripcionOrden_OrdenCompra1` FOREIGN KEY (`ordenCompra_id`) REFERENCES `OrdenCompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DescripcionOrden`
--

LOCK TABLES `DescripcionOrden` WRITE;
/*!40000 ALTER TABLE `DescripcionOrden` DISABLE KEYS */;
INSERT INTO `DescripcionOrden` VALUES (10,2,8,1500.00,5360.00,1),(11,4,8,500.00,2000.00,2),(12,3,8,300.00,1200.00,1),(13,5,8,990.00,4499.00,1);
/*!40000 ALTER TABLE `DescripcionOrden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DescripcionProducto`
--

DROP TABLE IF EXISTS `DescripcionProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DescripcionProducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`producto_id`),
  KEY `fk_DescripcionProducto_Producto1_idx` (`producto_id`),
  CONSTRAINT `fk_DescripcionProducto_Producto1` FOREIGN KEY (`producto_id`) REFERENCES `Producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DescripcionProducto`
--

LOCK TABLES `DescripcionProducto` WRITE;
/*!40000 ALTER TABLE `DescripcionProducto` DISABLE KEYS */;
INSERT INTO `DescripcionProducto` VALUES (1,1,'2017-08-26 11:00:00','GTX100','- Socket Intel',2000.00,9870.00,5,'motherboard.png','1'),(2,2,'2017-08-27 12:30:00','GTX1050','- 2GB DDR5',1500.00,5360.00,4,NULL,'0'),(3,3,'2017-08-27 12:30:00','AORUS M5','- 16000 DPI',300.00,1200.00,10,NULL,'0'),(4,4,'2017-08-27 12:30:00','FORCE K81','- Mecanico',500.00,2000.00,8,NULL,'0'),(5,5,'2018-10-18 09:23:34','AC300W','- RGB Fusion-16.7M Customizable RGB Lighting',990.00,4499.00,9,NULL,'0'),(6,6,'2018-09-07 11:09:02','Core i7-9700K','- 12 MB SmartCache Caché, - 8 Núcleos, - 4.90 GHz Frecuencia turbo máxima',4500.00,13999.00,10,'intel-i7.png','1'),(7,6,'2018-09-07 11:10:22','Core i9-9900K','- 16 MB SmartCache Caché, - 8 Núcleos, - 5 GHz Frecuencia turbo máxima',6500.00,17999.00,5,'intel-i9.png','1'),(8,7,'2018-09-07 11:20:18','Ryzen™ Threadripper™','- 80 MB Caché, - 32 Núcleos, - 4.2 GHz Frecuencia turbo máxima',5500.00,16999.00,5,'amd-ryzen.png','2'),(9,1,'2018-09-10 11:20:18','GA-Z170X-Gaming G1','- Supports 7th / 6th Generation Intel® Core™ Processors, - Dual Channel DDR4, 4 DIMMs',3500.00,12999.00,10,'motherboard_2.png','1'),(10,1,'2018-09-10 11:22:38','GA-X99-SOC Force','- Supports ADM, - 4 Channel DDR4',4900.00,14999.00,10,'motherboard_3.png','2'),(11,8,'2018-09-10 11:23:38','GA 2666MHz','- DDR4-2666 MHz',1900.00,8000.00,7,'ram_2.png','0'),(12,8,'2018-09-10 11:24:48','GAXtreme 4000MHz','- DDR4 4000MHz',2900.00,10999.00,23,'ram_1.png','0'),(13,9,'2018-09-10 11:24:48','XP 3000','- DDR4-3256 MHz',1900.00,9999.00,10,'ram_3.png','0');
/*!40000 ALTER TABLE `DescripcionProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`proveedor_id`),
  KEY `fk_Marca_Proveedor1_idx` (`proveedor_id`),
  CONSTRAINT `fk_Marca_Proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `Proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,1,'GIGABYTE'),(2,2,'Intel'),(3,3,'AMD'),(4,3,'Kingston');
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdenCompra`
--

DROP TABLE IF EXISTS `OrdenCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdenCompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  `estado` enum('Paga','Pendiente','Cancelada','Entregada') DEFAULT NULL,
  PRIMARY KEY (`id`,`cliente_id`),
  KEY `fk_OrdenCompra_Cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_OrdenCompra_Cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdenCompra`
--

LOCK TABLES `OrdenCompra` WRITE;
/*!40000 ALTER TABLE `OrdenCompra` DISABLE KEYS */;
INSERT INTO `OrdenCompra` VALUES (8,2,'2018-10-25 22:15:09',1,'Paga');
/*!40000 ALTER TABLE `OrdenCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `detalle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`,`marca_id`,`categoria_id`),
  KEY `fk_Producto_Marca1_idx` (`marca_id`),
  KEY `fk_Producto_Categoria1_idx` (`categoria_id`),
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Marca1` FOREIGN KEY (`marca_id`) REFERENCES `Marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,1,1,'Sin especificar'),(2,1,2,'Sin especificar'),(3,1,6,'Sin especificar'),(4,1,5,'Sin especificar'),(5,1,9,'Sin especificar'),(6,2,8,'Sin especificar'),(7,3,8,'Sin especificar'),(8,1,10,'Sin especificar'),(9,4,10,'Sin especificar');
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedor`
--

DROP TABLE IF EXISTS `Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) NOT NULL,
  `cuit` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedor`
--

LOCK TABLES `Proveedor` WRITE;
/*!40000 ALTER TABLE `Proveedor` DISABLE KEYS */;
INSERT INTO `Proveedor` VALUES (1,'Mayorista Burns','20-15245625-0','456456','Av. San Martín 200, Capital Federal','burns@gmail.com',1,'2017-05-15'),(2,'Intel Corp.','20-112458725-7','411800','Juan B. Justo 4500, Capital Federal','contacto@intel.com',1,'2018-06-20'),(3,'AMD Inc.','20-80118725-7','431735','Udaondo 547, Capital Federal','contacto@amd.com',1,'2018-06-21');
/*!40000 ALTER TABLE `Proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-29 19:31:40
