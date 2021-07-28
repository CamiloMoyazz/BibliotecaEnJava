CREATE DATABASE  IF NOT EXISTS `BibliotecaV2` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `BibliotecaV2`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: BibliotecaV2
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `Arriendos`
--

DROP TABLE IF EXISTS `Arriendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arriendos` (
  `idArriendo` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idTrabajador` int NOT NULL,
  `FechaArriendo` varchar(10) NOT NULL,
  `FechaDevolucion` varchar(10) NOT NULL,
  `FechaEntrega` varchar(10) NOT NULL,
  `DiasRetraso` int NOT NULL,
  `Multa` int DEFAULT NULL,
  `CostoTotal` int NOT NULL,
  PRIMARY KEY (`idArriendo`),
  KEY `Clientes_idCliente_idx` (`idCliente`),
  KEY `Trabajadores_idTrabajador_idx` (`idTrabajador`),
  CONSTRAINT `Clientes_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`),
  CONSTRAINT `Trabajadores_idTrabajador` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajadores` (`idTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arriendos`
--

LOCK TABLES `Arriendos` WRITE;
/*!40000 ALTER TABLE `Arriendos` DISABLE KEYS */;
INSERT INTO `Arriendos` VALUES (1,1,2,'24-05-2020','24-06-2020','24-07-2020',0,0,16000);
/*!40000 ALTER TABLE `Arriendos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autores`
--

DROP TABLE IF EXISTS `Autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autores` (
  `idAutor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `ApellidoPa` varchar(25) NOT NULL,
  `ApellidoMa` varchar(25) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autores`
--

LOCK TABLES `Autores` WRITE;
/*!40000 ALTER TABLE `Autores` DISABLE KEYS */;
INSERT INTO `Autores` VALUES (1,'Marcela','Paz','-'),(2,'J.K. Rowling','-','-'),(3,'Julio Verne','-','-'),(4,'Jack','London','-');
/*!40000 ALTER TABLE `Autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boletas`
--

DROP TABLE IF EXISTS `Boletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boletas` (
  `Folio` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idTrabajador` int NOT NULL,
  `FechaVenta` varchar(10) NOT NULL,
  `HoraVenta` varchar(13) NOT NULL,
  `MetodoPago` varchar(15) NOT NULL,
  PRIMARY KEY (`Folio`),
  KEY `Clientes_idCliente_idx` (`idCliente`),
  KEY `Trabajadores_idTrabajador_idx` (`idTrabajador`),
  CONSTRAINT `Clientes_CodigoCliente` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`),
  CONSTRAINT `Trabajadores_CodigoTrabajador` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajadores` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boletas`
--

LOCK TABLES `Boletas` WRITE;
/*!40000 ALTER TABLE `Boletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Boletas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(25) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Infantil'),(2,'Sexo'),(3,'Adolecente'),(4,'Violencia'),(5,'Ciencia Ficcion'),(6,'Aventura'),(7,'Magia');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Rut` varchar(12) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoMa` varchar(20) NOT NULL,
  `ApellidoPa` varchar(20) NOT NULL,
  `FechaNacimiento` varchar(10) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `Rut_UNIQUE` (`Rut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'20.780.661-7','Camilo ','Celis','Moya','12-04-2000'),(2,'19.789.662-2','Rocio','Caceres','Peralta','24-07-1999'),(3,'22.641.927-6','Sofia','Tolosa','Berrios','24-06-2006');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compras`
--

DROP TABLE IF EXISTS `Compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compras` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `idDistribuidor` int NOT NULL,
  `Folio` int NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `Distribuidor_idDistribuidor_idx` (`idDistribuidor`),
  KEY `Facturas_Folio_idx` (`Folio`),
  CONSTRAINT `Distribuidor_idDistribuidor` FOREIGN KEY (`idDistribuidor`) REFERENCES `Distribuidores` (`idDistribuidor`),
  CONSTRAINT `Facturas_FolioFact` FOREIGN KEY (`Folio`) REFERENCES `Facturas` (`Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras`
--

LOCK TABLES `Compras` WRITE;
/*!40000 ALTER TABLE `Compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CorreosClientes`
--

DROP TABLE IF EXISTS `CorreosClientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CorreosClientes` (
  `idCorreosClientes` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `Correo` varchar(30) NOT NULL,
  PRIMARY KEY (`idCorreosClientes`),
  KEY `Clientes_idCliente_idx` (`idCliente`),
  CONSTRAINT `Clientes_CodCliente` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CorreosClientes`
--

LOCK TABLES `CorreosClientes` WRITE;
/*!40000 ALTER TABLE `CorreosClientes` DISABLE KEYS */;
INSERT INTO `CorreosClientes` VALUES (1,1,'camilo.correo@gmail.com'),(2,1,'camikawaii@gmail.com'),(3,1,'camilo.moya05@inacapmail.cl'),(4,2,'ame.linda@gmail.com'),(5,3,'froggi.shofi@gmail.com'),(6,2,'amelia.correo@hotmail.com');
/*!40000 ALTER TABLE `CorreosClientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CorreosTrabajadores`
--

DROP TABLE IF EXISTS `CorreosTrabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CorreosTrabajadores` (
  `idCorreosTrabajadores` int NOT NULL AUTO_INCREMENT,
  `idTrabajador` int NOT NULL,
  `Correo` varchar(40) NOT NULL,
  PRIMARY KEY (`idCorreosTrabajadores`),
  KEY `Trabajadores_idTrabajador_idx` (`idTrabajador`),
  CONSTRAINT `Trabajadores_idTrabajadorCodigo` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajadores` (`idTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CorreosTrabajadores`
--

LOCK TABLES `CorreosTrabajadores` WRITE;
/*!40000 ALTER TABLE `CorreosTrabajadores` DISABLE KEYS */;
INSERT INTO `CorreosTrabajadores` VALUES (1,1,'romina.celis@gmail.com'),(2,2,'deppi.123@outlook.com'),(3,3,'josueBT@gmail.com'),(4,2,'carloD@gmail.com');
/*!40000 ALTER TABLE `CorreosTrabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleArriendos`
--

DROP TABLE IF EXISTS `DetalleArriendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetalleArriendos` (
  `idDetalleArriendos` int NOT NULL AUTO_INCREMENT,
  `NumSerie` int NOT NULL,
  `idArriendo` int NOT NULL,
  `CostoLibro` int NOT NULL,
  PRIMARY KEY (`idDetalleArriendos`),
  KEY `Libros_NumSerie_idx` (`NumSerie`),
  KEY `Arriendos_idArriendo_idx` (`idArriendo`),
  CONSTRAINT `Arriendos_idArriendo` FOREIGN KEY (`idArriendo`) REFERENCES `Arriendos` (`idArriendo`),
  CONSTRAINT `Libros_NumSerie` FOREIGN KEY (`NumSerie`) REFERENCES `Ejemplares` (`NumSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleArriendos`
--

LOCK TABLES `DetalleArriendos` WRITE;
/*!40000 ALTER TABLE `DetalleArriendos` DISABLE KEYS */;
INSERT INTO `DetalleArriendos` VALUES (1,1241,1,15000);
/*!40000 ALTER TABLE `DetalleArriendos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleBoletas`
--

DROP TABLE IF EXISTS `DetalleBoletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetalleBoletas` (
  `idDetalleBoleta` int NOT NULL AUTO_INCREMENT,
  `Folio` int NOT NULL,
  `NumSerie` int NOT NULL,
  `PrecioLibroNeto` int NOT NULL,
  `CantidadLibros` int NOT NULL,
  `PrecioLibroIVA` int NOT NULL,
  `IVA` int NOT NULL,
  PRIMARY KEY (`idDetalleBoleta`),
  KEY `Boletas_Folio_idx` (`Folio`),
  KEY `Libro_NumSerie_idx` (`NumSerie`),
  CONSTRAINT `Boletas_Folio` FOREIGN KEY (`Folio`) REFERENCES `Boletas` (`Folio`),
  CONSTRAINT `Libro_NumSerie` FOREIGN KEY (`NumSerie`) REFERENCES `Ejemplares` (`NumSerie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleBoletas`
--

LOCK TABLES `DetalleBoletas` WRITE;
/*!40000 ALTER TABLE `DetalleBoletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetalleBoletas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleCompras`
--

DROP TABLE IF EXISTS `DetalleCompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetalleCompras` (
  `idDetalleCompra` int NOT NULL AUTO_INCREMENT,
  `idCompra` int NOT NULL,
  `Folio` int NOT NULL,
  `NumSerie` int NOT NULL,
  `idDistribuidor` int NOT NULL,
  `LibroComprado` varchar(45) NOT NULL,
  `CantidadLibros` int NOT NULL,
  PRIMARY KEY (`idDetalleCompra`),
  KEY `Compras_idCompra_idx` (`idCompra`),
  KEY `Libros_NumSerie_idx` (`NumSerie`),
  KEY `Facturas_Folio_idx` (`Folio`),
  KEY `Distribuidores_idx` (`idDistribuidor`),
  CONSTRAINT `Compras_idCompra` FOREIGN KEY (`idCompra`) REFERENCES `Compras` (`idCompra`),
  CONSTRAINT `Distribuidores_CodDistribuidor` FOREIGN KEY (`idDistribuidor`) REFERENCES `Distribuidores` (`idDistribuidor`),
  CONSTRAINT `Facturas_FactFolio` FOREIGN KEY (`Folio`) REFERENCES `Facturas` (`Folio`),
  CONSTRAINT `Libros_NumSerieLib` FOREIGN KEY (`NumSerie`) REFERENCES `Ejemplares` (`NumSerie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleCompras`
--

LOCK TABLES `DetalleCompras` WRITE;
/*!40000 ALTER TABLE `DetalleCompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetalleCompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleFacturas`
--

DROP TABLE IF EXISTS `DetalleFacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetalleFacturas` (
  `idDetalleFactura` int NOT NULL AUTO_INCREMENT,
  `Folio` int NOT NULL,
  `NumSerie` int NOT NULL,
  `idDistribuidor` int NOT NULL,
  `PrecioLibroNeto` int NOT NULL,
  `PrecioLibroIVA` int NOT NULL,
  `IVA` int NOT NULL,
  `CantidadLibros` int NOT NULL,
  PRIMARY KEY (`idDetalleFactura`),
  KEY `Facturas_Folio_idx` (`Folio`),
  KEY `Libros_NumSerie_idx` (`NumSerie`),
  KEY `Distribuidores_idDistribuidor_idx` (`idDistribuidor`),
  CONSTRAINT `Distribuidores_idDistribuidor` FOREIGN KEY (`idDistribuidor`) REFERENCES `Distribuidores` (`idDistribuidor`),
  CONSTRAINT `Facturas_FolioFac` FOREIGN KEY (`Folio`) REFERENCES `Facturas` (`Folio`),
  CONSTRAINT `Libros_NumSerieLibro` FOREIGN KEY (`NumSerie`) REFERENCES `Ejemplares` (`NumSerie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleFacturas`
--

LOCK TABLES `DetalleFacturas` WRITE;
/*!40000 ALTER TABLE `DetalleFacturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetalleFacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleVentas`
--

DROP TABLE IF EXISTS `DetalleVentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetalleVentas` (
  `idDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `libroVendido` int NOT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `Libros_LibroVendido_idx` (`libroVendido`),
  KEY `Ventas_idVenta_idx` (`idVenta`),
  CONSTRAINT `Libros_LibroVendido` FOREIGN KEY (`libroVendido`) REFERENCES `Ejemplares` (`NumSerie`),
  CONSTRAINT `Ventas_idVenta` FOREIGN KEY (`idVenta`) REFERENCES `Ventas` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleVentas`
--

LOCK TABLES `DetalleVentas` WRITE;
/*!40000 ALTER TABLE `DetalleVentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetalleVentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DireccionesClientes`
--

DROP TABLE IF EXISTS `DireccionesClientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DireccionesClientes` (
  `idDireccionesClientes` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idDireccionesClientes`),
  KEY `Clientes_idCliente_idx` (`idCliente`),
  CONSTRAINT `Clientes_idClienteCodigo` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DireccionesClientes`
--

LOCK TABLES `DireccionesClientes` WRITE;
/*!40000 ALTER TABLE `DireccionesClientes` DISABLE KEYS */;
INSERT INTO `DireccionesClientes` VALUES (1,1,'Malva #2029 , Los Pinos , Quilpué'),(2,2,'Paraiso #115 , Belloto 2000'),(3,1,'Papagallos 909 , Belloto 2000'),(4,3,'Lino #895 , Belloto 2000');
/*!40000 ALTER TABLE `DireccionesClientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DireccionesTrabajadores`
--

DROP TABLE IF EXISTS `DireccionesTrabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DireccionesTrabajadores` (
  `idDireccionesTrabajadores` int NOT NULL AUTO_INCREMENT,
  `idTrabajador` int NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idDireccionesTrabajadores`),
  KEY `Trabajadores_idTrabajador_idx` (`idTrabajador`),
  CONSTRAINT `Trabajadores_CodTrabajador` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajadores` (`idTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DireccionesTrabajadores`
--

LOCK TABLES `DireccionesTrabajadores` WRITE;
/*!40000 ALTER TABLE `DireccionesTrabajadores` DISABLE KEYS */;
INSERT INTO `DireccionesTrabajadores` VALUES (1,1,'Lilenes #2131 , Villa Alemana'),(2,2,'Calle Larga #141 , Belloto Norte'),(3,3,'Av.Trabajador #551 , Belloto Norte'),(4,1,'Inhen #931 , Viña del Mar');
/*!40000 ALTER TABLE `DireccionesTrabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distribuidores`
--

DROP TABLE IF EXISTS `Distribuidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distribuidores` (
  `idDistribuidor` int NOT NULL AUTO_INCREMENT,
  `Rut` varchar(13) NOT NULL,
  `NombreEmpresa` varchar(45) NOT NULL,
  `AnioVinculo` varchar(25) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(13) NOT NULL,
  PRIMARY KEY (`idDistribuidor`),
  UNIQUE KEY `Rut_UNIQUE` (`Rut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distribuidores`
--

LOCK TABLES `Distribuidores` WRITE;
/*!40000 ALTER TABLE `Distribuidores` DISABLE KEYS */;
INSERT INTO `Distribuidores` VALUES (1,'71.827.638-1','TuLibro','2017','Calle Falsa #123 , Viña del Mar','+56982736522'),(2,'70.299.283-2','FastBook','2019','Av.España #1553 , Valparaiso','+56913286641'),(3,'70.123.867-1','UmMami','2020','Av.Corredor #872','+56923927655');
/*!40000 ALTER TABLE `Distribuidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editoriales`
--

DROP TABLE IF EXISTS `Editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Editoriales` (
  `idEditorial` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(13) NOT NULL,
  `Editorial` varchar(45) NOT NULL,
  PRIMARY KEY (`idEditorial`),
  KEY `Libros_ISBNEditorial_idx` (`ISBN`),
  CONSTRAINT `Libros_ISBNEditorial` FOREIGN KEY (`ISBN`) REFERENCES `Libros` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editoriales`
--

LOCK TABLES `Editoriales` WRITE;
/*!40000 ALTER TABLE `Editoriales` DISABLE KEYS */;
INSERT INTO `Editoriales` VALUES (1,'9780001849129','HarperCollins'),(2,'9780439203524','Scholastic'),(3,'9780758311986','Franklin Watts'),(4,'9782266202886','Pocket'),(5,'9789561111851','Editorial Universitaria');
/*!40000 ALTER TABLE `Editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejemplares`
--

DROP TABLE IF EXISTS `Ejemplares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ejemplares` (
  `NumSerie` int NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`NumSerie`),
  KEY `Libros_ISBNLib_idx` (`ISBN`),
  CONSTRAINT `Ejemplares_enlaceISBN` FOREIGN KEY (`ISBN`) REFERENCES `Libros` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejemplares`
--

LOCK TABLES `Ejemplares` WRITE;
/*!40000 ALTER TABLE `Ejemplares` DISABLE KEYS */;
INSERT INTO `Ejemplares` VALUES (123,'9789561111851','Papelucho'),(1234,'9789561111851','Papelucho'),(1241,'9780001849129','Colmillo Blanco'),(1446,'9780439203524','Harry Potter y la piedra filosofal'),(2347,'9782266202886','Veinte mil leguas de viaje submarino'),(5421,'9782266202886','Veinte mil leguas de viaje submarino'),(8901,'9780758311986','Viaje al centro de la Tierra'),(9087,'9782266202886','Veinte mil leguas de viaje submarino');
/*!40000 ALTER TABLE `Ejemplares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados`
--

DROP TABLE IF EXISTS `Estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estados` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `NumSerie` int NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `Ejemplares_NumSerieS_idx` (`NumSerie`),
  CONSTRAINT `Ejemplares_NumSerieS` FOREIGN KEY (`NumSerie`) REFERENCES `Ejemplares` (`NumSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados`
--

LOCK TABLES `Estados` WRITE;
/*!40000 ALTER TABLE `Estados` DISABLE KEYS */;
INSERT INTO `Estados` VALUES (1,123,'Disponible'),(2,1234,'Disponible'),(3,1241,'Disponible'),(4,1446,'Disponible'),(5,2347,'Disponible'),(6,5421,'Disponible'),(7,8901,'Disponible'),(8,9087,'Disponible');
/*!40000 ALTER TABLE `Estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas`
--

DROP TABLE IF EXISTS `Facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas` (
  `Folio` int NOT NULL,
  `FechaCompra` varchar(10) NOT NULL,
  `HoraCompra` varchar(12) NOT NULL,
  `MetodoPago` varchar(15) NOT NULL,
  PRIMARY KEY (`Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas`
--

LOCK TABLES `Facturas` WRITE;
/*!40000 ALTER TABLE `Facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idiomas`
--

DROP TABLE IF EXISTS `Idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Idiomas` (
  `idIdioma` int NOT NULL AUTO_INCREMENT,
  `Idioma` varchar(15) NOT NULL,
  PRIMARY KEY (`idIdioma`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idiomas`
--

LOCK TABLES `Idiomas` WRITE;
/*!40000 ALTER TABLE `Idiomas` DISABLE KEYS */;
INSERT INTO `Idiomas` VALUES (1,'ESP'),(2,'ING'),(3,'JP'),(4,'ITA'),(5,'ALEM'),(6,'FRA');
/*!40000 ALTER TABLE `Idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libro_Autor`
--

DROP TABLE IF EXISTS `Libro_Autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libro_Autor` (
  `ISBN` varchar(13) NOT NULL,
  `idAutor` int NOT NULL,
  PRIMARY KEY (`ISBN`,`idAutor`),
  KEY `Autores_idAutor_idx` (`idAutor`),
  CONSTRAINT `Autores_idAutor` FOREIGN KEY (`idAutor`) REFERENCES `Autores` (`idAutor`),
  CONSTRAINT `Libros_ISBNAutor` FOREIGN KEY (`ISBN`) REFERENCES `Libros` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libro_Autor`
--

LOCK TABLES `Libro_Autor` WRITE;
/*!40000 ALTER TABLE `Libro_Autor` DISABLE KEYS */;
INSERT INTO `Libro_Autor` VALUES ('9789561111851',1),('9780439203524',2),('9780758311986',3),('9782266202886',3),('9780001849129',4);
/*!40000 ALTER TABLE `Libro_Autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libro_Categoria`
--

DROP TABLE IF EXISTS `Libro_Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libro_Categoria` (
  `ISBN` varchar(13) NOT NULL,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`ISBN`,`idCategoria`),
  KEY `Categorias_idCategoria_idx` (`idCategoria`),
  CONSTRAINT `Categorias_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `Categorias` (`idCategoria`),
  CONSTRAINT `Libros_ISBNCategoria` FOREIGN KEY (`ISBN`) REFERENCES `Libros` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libro_Categoria`
--

LOCK TABLES `Libro_Categoria` WRITE;
/*!40000 ALTER TABLE `Libro_Categoria` DISABLE KEYS */;
INSERT INTO `Libro_Categoria` VALUES ('9789561111851',1),('9780758311986',5),('9782266202886',5),('9780001849129',6),('9780439203524',6),('9780758311986',6),('9782266202886',6),('9789561111851',6),('9780439203524',7);
/*!40000 ALTER TABLE `Libro_Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libro_Idioma`
--

DROP TABLE IF EXISTS `Libro_Idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libro_Idioma` (
  `ISBN` varchar(13) NOT NULL,
  `idIdioma` int NOT NULL,
  PRIMARY KEY (`ISBN`,`idIdioma`),
  KEY `Idiomas_idIdioma_idx` (`idIdioma`),
  CONSTRAINT `Idiomas_idIdioma` FOREIGN KEY (`idIdioma`) REFERENCES `Idiomas` (`idIdioma`),
  CONSTRAINT `Libros_ISBNIdioma` FOREIGN KEY (`ISBN`) REFERENCES `Libros` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libro_Idioma`
--

LOCK TABLES `Libro_Idioma` WRITE;
/*!40000 ALTER TABLE `Libro_Idioma` DISABLE KEYS */;
INSERT INTO `Libro_Idioma` VALUES ('9780001849129',1),('9780439203524',1),('9780758311986',1),('9789561111851',1),('9782266202886',2),('9782266202886',4);
/*!40000 ALTER TABLE `Libro_Idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libros`
--

DROP TABLE IF EXISTS `Libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libros` (
  `ISBN` varchar(13) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `NumPagina` int NOT NULL,
  `Precio` int NOT NULL,
  `AnioPublicacion` varchar(4) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libros`
--

LOCK TABLES `Libros` WRITE;
/*!40000 ALTER TABLE `Libros` DISABLE KEYS */;
INSERT INTO `Libros` VALUES ('9780001849129','Colmillo Blanco',195,15000,'1906'),('9780439203524','Harry Potter y la piedra filosofal',300,14990,'1997'),('9780758311986','Viaje al centro de la Tierra',221,13990,'1864'),('9782266202886','Veinte mil leguas de viaje submarino',368,12990,'1870'),('9789561111851','Papelucho',74,9990,'1947');
/*!40000 ALTER TABLE `Libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelefonosClientes`
--

DROP TABLE IF EXISTS `TelefonosClientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TelefonosClientes` (
  `idTelefonosClientes` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`idTelefonosClientes`),
  KEY `Clientes_idCliente_idx` (`idCliente`),
  CONSTRAINT `Clientes_idClienteCod` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelefonosClientes`
--

LOCK TABLES `TelefonosClientes` WRITE;
/*!40000 ALTER TABLE `TelefonosClientes` DISABLE KEYS */;
INSERT INTO `TelefonosClientes` VALUES (1,1,'+56923476655'),(2,3,'+56918365514'),(3,2,'+56990728891');
/*!40000 ALTER TABLE `TelefonosClientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelefonosTrabajadores`
--

DROP TABLE IF EXISTS `TelefonosTrabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TelefonosTrabajadores` (
  `idTelefonosTrabajadores` int NOT NULL AUTO_INCREMENT,
  `idTrabajador` int NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`idTelefonosTrabajadores`),
  KEY `Trabajadores_idTrabajador_idx` (`idTrabajador`),
  CONSTRAINT `Trabajadores_idTrabajadorCod` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajadores` (`idTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelefonosTrabajadores`
--

LOCK TABLES `TelefonosTrabajadores` WRITE;
/*!40000 ALTER TABLE `TelefonosTrabajadores` DISABLE KEYS */;
INSERT INTO `TelefonosTrabajadores` VALUES (1,1,'+56922853499'),(2,2,'+56920931381'),(3,3,'+56923186181'),(4,2,'+3212349871');
/*!40000 ALTER TABLE `TelefonosTrabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabajadores`
--

DROP TABLE IF EXISTS `Trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trabajadores` (
  `idTrabajador` int NOT NULL AUTO_INCREMENT,
  `Rut` varchar(12) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoMa` varchar(20) NOT NULL,
  `ApellidoPa` varchar(20) NOT NULL,
  `FechaContrato` varchar(10) NOT NULL,
  PRIMARY KEY (`idTrabajador`),
  UNIQUE KEY `Rut_UNIQUE` (`Rut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabajadores`
--

LOCK TABLES `Trabajadores` WRITE;
/*!40000 ALTER TABLE `Trabajadores` DISABLE KEYS */;
INSERT INTO `Trabajadores` VALUES (1,'12.622.028-6','Romina','Celis','Espinoza','12-09-2019'),(2,'17.982.192-3','Carlos','Deppi','Escobar','21-02-2020'),(3,'20.127.772-9','Josue','Berrios','Tolosa','28-04-2020');
/*!40000 ALTER TABLE `Trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ventas` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idTrabajador` int NOT NULL,
  `idCliente` int NOT NULL,
  `Folio` int NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `Trabajadores_idTrabajador_idx` (`idTrabajador`),
  KEY `Clientes_idClientes_idx` (`idCliente`),
  KEY `Boletas_Folio_idx` (`Folio`),
  CONSTRAINT `Boletas_FolioBoleta` FOREIGN KEY (`Folio`) REFERENCES `Boletas` (`Folio`),
  CONSTRAINT `Clientes_Clientes` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`),
  CONSTRAINT `Trabajadores_Trabajador` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajadores` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01 11:50:51
